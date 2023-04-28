Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C86BD6F1CFB
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 18:54:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0115210E407;
	Fri, 28 Apr 2023 16:54:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay2-1.pub.mailoutpod2-cph3.one.com
 (mailrelay2-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:401::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C176B10E410
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 16:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=4h2Y9ZZQ14tdvAGC5hFpqIKQWvmB0qe68pQRnQlSShc=;
 b=IrdAXdZPKho0zoQxG/scktRALZpl2c237XlKLT5EIx0ja7nZb83hqvUgOuyY55pNvHYqH3FsErtl1
 5jx6Clb6lkPL8TkUqCtTnSvfCnAc1GKTQxpoyL9YYmuFWy6pRl3ovRobT6YFtqeLlVGxUM3+fK10GW
 26P+hLCnm+zpPHV7tOv/ibW1ECpjZ4qETcRhhPvrkIFIONhGHQGcxNm6MxcY5BEqj85CuJqzXS5rce
 1Inl5d47E3sR2kFuS+NTw8OWDudvX6hThvyhlLeRI9ruUhs5QS1y61KsI01ISxy6adAYh2hLAOXbIt
 t6mRhKxKsnm9awtbASezT6BrkUMBpFA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=4h2Y9ZZQ14tdvAGC5hFpqIKQWvmB0qe68pQRnQlSShc=;
 b=2sOyzdZRm0G5akePNgNy9pFImOAXPUTPUHEcB6iUeB7W+50cDIuX1agx3ldJaHWZog9XyDftdQu09
 P8qxcwNCA==
X-HalOne-ID: 4d02a9c5-e5e5-11ed-9bd2-13111ccb208d
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay2 (Halon) with ESMTPSA
 id 4d02a9c5-e5e5-11ed-9bd2-13111ccb208d;
 Fri, 28 Apr 2023 16:54:14 +0000 (UTC)
Date: Fri, 28 Apr 2023 18:54:12 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 5/5] fbdev: Define framebuffer I/O from Linux' I/O
 functions
Message-ID: <20230428165412.GA4010212@ravnborg.org>
References: <20230428092711.406-1-tzimmermann@suse.de>
 <20230428092711.406-6-tzimmermann@suse.de>
 <20230428131221.GE3995435@ravnborg.org>
 <900eaf1c-4d29-2c26-c220-6b4e089d9b94@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <900eaf1c-4d29-2c26-c220-6b4e089d9b94@suse.de>
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
Cc: linux-arch@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-ia64@vger.kernel.org, loongarch@lists.linux.dev, arnd@arndb.de,
 deller@gmx.de, chenhuacai@kernel.org, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 James.Bottomley@hansenpartnership.com, linux-m68k@lists.linux-m68k.org,
 geert@linux-m68k.org, linux-parisc@vger.kernel.org, vgupta@kernel.org,
 sparclinux@vger.kernel.org, kernel@xen0n.name,
 linux-snps-arc@lists.infradead.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Fri, Apr 28, 2023 at 04:18:38PM +0200, Thomas Zimmermann wrote:
> I'd be happy to have fb_() wrappers that are I/O helpers without
> ordering guarantees. I'd just wouldn't want them in <linux/fb.h>

How about throwing them into a new drm_fb.h header file.
This header file could be the home for all the fb stuff that is
shared between drm and the legacy fbdev.

Then we may slowly migrate more fbdev stuff to drm and let the legacy
fbdev stuff use the maintained drm stuff.
Dunno, the pain may not be worth it.

	Sam
