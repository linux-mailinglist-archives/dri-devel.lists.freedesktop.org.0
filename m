Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E3D88F8A3
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 08:26:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78E9C112297;
	Thu, 28 Mar 2024 07:26:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ravnborg.org header.i=@ravnborg.org header.b="FO3avDbt";
	dkim=permerror (0-bit key) header.d=ravnborg.org header.i=@ravnborg.org header.b="tWmWJ3ND";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay5-1.pub.mailoutpod3-cph3.one.com
 (mailrelay5-1.pub.mailoutpod3-cph3.one.com [46.30.211.244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0A3B11212C
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 07:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=dyKv5n7Yl7LRdH+1tEzFGNQHD1DRdGd99PJrS6/p+zs=;
 b=FO3avDbtCVJhZmbtPb25Z7M92okwL42Lwzwk0Xt1eFKNFfW85ebYPD1a4Iz7nbfQa1BVxuB2fck3t
 dV01QiC6wivs5sf4FR4Dwcj/7zxIoo8LiqS5TizyDmf/zwISEz8XHoo+q0YBAqS+W/jFG4FUQ44kvh
 t0uaYwTBtz7fuc9aKHnSrFR3GY32xONVYLJIM0g3hDiXwbLR9BD/o3eEuUuj3l3UwYm6F6muVvvj3L
 eaFcKcGJK55ShMf9yqSyFAGh9is77eUJyw3RtIOaPW++JhkBvC7HK4Ge1s3CMNfQOfP48o4EmSO883
 mKHiYwbBSpWF7oBq3uTpz9wEoyMQoiA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=dyKv5n7Yl7LRdH+1tEzFGNQHD1DRdGd99PJrS6/p+zs=;
 b=tWmWJ3NDZTn8BTwQyoXUT6BJQOWPfdg24c2VPAtEdn8oRObE4JrU9XMtFz3jWr/w4xs53mowsZ7/3
 oWNGr4OCg==
X-HalOne-ID: 4ddcab29-ecd4-11ee-9a1b-9fce02cdf4bb
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay5.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
 id 4ddcab29-ecd4-11ee-9a1b-9fce02cdf4bb;
 Thu, 28 Mar 2024 07:25:09 +0000 (UTC)
Date: Thu, 28 Mar 2024 08:25:07 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: arnd@arndb.de, javierm@redhat.com, deller@gmx.de,
 sui.jingfeng@linux.dev, linux-arch@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-sh@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 "David S. Miller" <davem@davemloft.net>,
 Andreas Larsson <andreas@gaisler.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v2 2/3] arch: Remove struct fb_info from video helpers
Message-ID: <20240328072507.GC1573630@ravnborg.org>
References: <20240327204450.14914-1-tzimmermann@suse.de>
 <20240327204450.14914-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240327204450.14914-3-tzimmermann@suse.de>
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

Hi Thomas,
On Wed, Mar 27, 2024 at 09:41:30PM +0100, Thomas Zimmermann wrote:
> The per-architecture video helpers do not depend on struct fb_info
> or anything else from fbdev. Remove it from the interface and replace
> fb_is_primary_device() with video_is_primary_device(). The new helper
> is similar in functionality, but can operate on non-fbdev devices.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
> Cc: Helge Deller <deller@gmx.de>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Andreas Larsson <andreas@gaisler.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: x86@kernel.org
> Cc: "H. Peter Anvin" <hpa@zytor.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
