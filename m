Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6852B4625C
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 20:37:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF07B10EC28;
	Fri,  5 Sep 2025 18:37:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ravnborg.org header.i=@ravnborg.org header.b="bdMLygMy";
	dkim=permerror (0-bit key) header.d=ravnborg.org header.i=@ravnborg.org header.b="p4922yrA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 364 seconds by postgrey-1.36 at gabe;
 Fri, 05 Sep 2025 18:37:52 UTC
Received: from mailrelay-egress4.pub.mailoutpod2-cph3.one.com
 (mailrelay-egress4.pub.mailoutpod2-cph3.one.com [46.30.211.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12AAC10EC27
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 18:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1757097470;
 x=1757702270; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=P13HvUfB9+hmK7dH65uYyDJo/LYux5XpE6ItWJpimrM=;
 b=bdMLygMyGMIhkCuvBp42jg3BoSRJQBpxFG3nh1NpU2ZD0+VPm+AWM99dEnv2Gs04DgceNs24HJcM8
 Pb578XTpbnyU0Yb2QeZo0jxW88ZrUd6rTcQZzKgXIuj+I/juagSXQ/X0SK/oAkkQsBlPAk9EumMqGp
 BiDQpz5Z/0ItJGT9kHUae0LZzmC1+rHCJnIEpfBVtOOpsO0wRfYlXcq1YplqqwdbVd6/3Tc/oseiq9
 58MLvlgUuzQNibNXGLhHoBB/tp8953pcbNNBPAGzRKgyifoX6X9gZtgvbxXNgD9wYgEdRe3nzR7fZO
 XeSG8ExuS5ImH5jbB2FI8SeiscUTetQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1757097470;
 x=1757702270; d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=P13HvUfB9+hmK7dH65uYyDJo/LYux5XpE6ItWJpimrM=;
 b=p4922yrA6E3K37M5RVLUEQq0XbmNc/8pNK/JE1XIWurFi5cWJfWi/IGXHCDPAClJVWvY17WJLAfAK
 3OQXywxCg==
X-HalOne-ID: 6bb947bd-8a87-11f0-9d80-494313b7f784
Received: from ravnborg.org (2-105-16-150-cable.dk.customer.tdc.net
 [2.105.16.150])
 by mailrelay6.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
 id 6bb947bd-8a87-11f0-9d80-494313b7f784;
 Fri, 05 Sep 2025 18:37:50 +0000 (UTC)
Date: Fri, 5 Sep 2025 20:37:48 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: simona@ffwll.ch, deller@gmx.de, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] fbcon: Set rotate_font callback with related callbacks
Message-ID: <20250905183748.GB360685@ravnborg.org>
References: <20250818104655.235001-1-tzimmermann@suse.de>
 <20250818104655.235001-4-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818104655.235001-4-tzimmermann@suse.de>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 18, 2025 at 12:36:38PM +0200, Thomas Zimmermann wrote:
> The field struct fbcon.rotate_font points to fbcon_rotate_font() if
> the console is rotated. Set the callback in the same place as the other
> callbacks. Prepares for declaring all fbcon callbacks in a dedicated
> struct type.
> 
> If not rotated, fbcon_set_bitops() still clears the callback to NULL.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
