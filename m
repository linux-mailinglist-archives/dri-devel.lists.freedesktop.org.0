Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6002CB462FA
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 21:00:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8FE710EC34;
	Fri,  5 Sep 2025 19:00:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ravnborg.org header.i=@ravnborg.org header.b="I3evI5I1";
	dkim=permerror (0-bit key) header.d=ravnborg.org header.i=@ravnborg.org header.b="eqfvFgdk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay-egress4.pub.mailoutpod2-cph3.one.com
 (mailrelay-egress4.pub.mailoutpod2-cph3.one.com [46.30.211.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FE1C10EC34
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 19:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1757098806;
 x=1757703606; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=3RnS1e54ivd9kB/TFDUWHec2itsLvhcO1ZPy7N/F1sI=;
 b=I3evI5I1eSIAGHE07seSuya5Ufy7lXw4rQvwN4YEAy01A5T6uCJRulLvE4ZIs88MfAbteiZDKa2r7
 PouRyN9RLlbHjEGvCF4CtxmhD0hQS6/ZaqKaWzZGo+Sd5JcaO/NeUVeyRjl6Flk0jTP3uLS4NQal98
 kuCi9patGqEwvweGHjbJtoWLE5XKys2ERzcl9PWtxYGuvtuQ8e6H2xsI9mluc2dqGMYzyJ5/47JJ+I
 2NXoj1Cp10NobVSdqMHJPXZGZc0swZcLdpEsPVipQLuEHPqdflKBYNDC2PWKrytxP55/xVIdPX6LmX
 OGMcrJr+5SESGGEqk7/TsZYYIXPw3qA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1757098806;
 x=1757703606; d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=3RnS1e54ivd9kB/TFDUWHec2itsLvhcO1ZPy7N/F1sI=;
 b=eqfvFgdkcvzKsdYst/gdx2uq3hs6GexJDcHVSjhP0oxUYOzfLgjIw3BktuM0e3WE9RB00rHfQzlkD
 9CYgf7fDw==
X-HalOne-ID: 876781b8-8a8a-11f0-8467-e90f2b8e16ca
Received: from ravnborg.org (2-105-16-150-cable.dk.customer.tdc.net
 [2.105.16.150])
 by mailrelay2.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
 id 876781b8-8a8a-11f0-8467-e90f2b8e16ca;
 Fri, 05 Sep 2025 19:00:05 +0000 (UTC)
Date: Fri, 5 Sep 2025 21:00:04 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: simona@ffwll.ch, deller@gmx.de, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] fbcon: Pass struct fbcon to callbacks in struct
 fbcon_bitops
Message-ID: <20250905190004.GB361827@ravnborg.org>
References: <20250818104655.235001-1-tzimmermann@suse.de>
 <20250818104655.235001-7-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818104655.235001-7-tzimmermann@suse.de>
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

On Mon, Aug 18, 2025 at 12:36:41PM +0200, Thomas Zimmermann wrote:
> The callbacks in struct fbcon_bitops are for struct fbcon. Pass an
> instance to the callbacks; instead of the respective struct fb_info.

This looks looks like a pointless change.
All the operations requires fb_info and needs to pcik it anyway.

	Sam
