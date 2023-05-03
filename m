Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 725EF6F5EC9
	for <lists+dri-devel@lfdr.de>; Wed,  3 May 2023 21:03:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92D9610E157;
	Wed,  3 May 2023 19:03:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay2-1.pub.mailoutpod2-cph3.one.com
 (mailrelay2-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:401::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8B5F10E157
 for <dri-devel@lists.freedesktop.org>; Wed,  3 May 2023 19:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=VwK1Pxwllknm05RC4IcE4UF09296VmV5/KUmDsmc45k=;
 b=XsHl84HrOPhHgBPqV3PW6yB/AvFhQII0nRtKV/8h8T+dCcMr5Tik6QMi/wSHQOzhOhtbUHSqfhZgd
 WSx/Z0hPEz3w+9sT8inTO8HUZ7mXKy80p1Hkngiwyx5WeGAS6L3ICdE9j4k0MYAt439GYTv80H30JL
 Wa3Kt+e0ozxs6GkaFSJ4Ggac50LASOD5G3YVJoy/Rrtbtu+bkuBlS+VFLgSy90XJkkej9/oXpWU/kv
 CxJ9i3AgBzyz7jKenTHVv5rGIZw0qOt+yq1IzXFIz2dG2+JZP65n87Ub2Ux9raWeeAjrFYUvEdc0tG
 etwNu46L2bAupljCsQC8YEYAHO7kJWQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=VwK1Pxwllknm05RC4IcE4UF09296VmV5/KUmDsmc45k=;
 b=Lew0Bnll2GhHFcWrhU2ydPTnZ0g2qcfs1S5m/vajLVuTjd48PZ0vIjaL11J3Em1kUt7VNpMclPo45
 R57yfj8Ag==
X-HalOne-ID: 2a0894ca-e9e5-11ed-9ffc-13111ccb208d
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay2 (Halon) with ESMTPSA
 id 2a0894ca-e9e5-11ed-9ffc-13111ccb208d;
 Wed, 03 May 2023 19:03:19 +0000 (UTC)
Date: Wed, 3 May 2023 21:03:17 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 5/6] fbdev: Move framebuffer I/O helpers into <asm/fb.h>
Message-ID: <20230503190317.GA422961@ravnborg.org>
References: <20230502130223.14719-1-tzimmermann@suse.de>
 <20230502130223.14719-6-tzimmermann@suse.de>
 <20230502200300.GB319489@ravnborg.org>
 <df767237-2bae-f299-9cbb-1543f76c9c3a@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <df767237-2bae-f299-9cbb-1543f76c9c3a@suse.de>
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
 linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org, arnd@arndb.de,
 deller@gmx.de, chenhuacai@kernel.org, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 James.Bottomley@hansenpartnership.com, linux-m68k@lists.linux-m68k.org,
 geert@linux-m68k.org, loongarch@lists.linux.dev, vgupta@kernel.org,
 sparclinux@vger.kernel.org, kernel@xen0n.name,
 linux-snps-arc@lists.infradead.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

> > But I am missing something somewhere as I cannot see how this builds.
> > asm-generic now provide the fb_read/fb_write helpers.
> > But for example sparc has an architecture specifc fb.h so it will not
> > use the asm-generic variant. So I wonder how sparc get hold of the
> > asm-generic fb.h file?
> 
> All architecture's <asm/fb.h> files include <asm-generic/fb.h>, so that they
> all get the interfaces which they don't define themselves. For Sparc, this
> is at [1].
> 
> Best regards
> Thomas
> 
> 
> [1]
> https://cgit.freedesktop.org/drm/drm-tip/tree/arch/sparc/include/asm/fb.h#n19
> 
> > 
> > Maybe it is obvious, but I miss it.

OK, it was obvious and I missed it.
I looked at the mainline kernel, and not the drm-tip variant.
Sorry for the noise.

	Sam
