Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4251CB389A
	for <lists+dri-devel@lfdr.de>; Wed, 10 Dec 2025 17:56:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA05810E725;
	Wed, 10 Dec 2025 16:56:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=exactco.de header.i=@exactco.de header.b="iU9BLPjc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from exactco.de (exactco.de [176.9.10.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0504010E70E
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 16:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=exactco.de; 
 s=x;
 h=Content-Transfer-Encoding:Content-Type:Mime-Version:References:
 In-Reply-To:From:Subject:Cc:To:Message-Id:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZLoHgTF3PCi56Qg8sGIgv9U33F8LXO/N+/x3cxevXAY=; b=iU9BLPjc6aGpWSRqgcpUiPdQ/1
 N1NuOwXcZ0mGqGKuuW1l5petCAq5v+BDLZppHQM3VkLQrtarDIiGST1849jXCeQibM08z+Eof8F4E
 tPb2EkLf50sCPsdWQ53zS5f/nnxT56a2mX4EHDjgXiJ8ydQyDGQqdN69h4Pttwf3fiEREsNHHpYOO
 JlojTZnyKi5axvpZ9aeju7sbFyySH4TKOFdokOWVBCN3VBP9FdPpmEwh4ZH1aTI1rcAY/Dru8TTOh
 9s778NkbGud+XN934JG9r9nK4qGfIYVL1OrRljrUcYVzFM1ENx+u3EvYOyhUmD1SzO4YlpEmgYLjK
 b1BS7MTQ==;
Date: Wed, 10 Dec 2025 17:56:35 +0100 (CET)
Message-Id: <20251210.175635.1285090497167018958.rene@exactco.de>
To: tzimmermann@suse.de
Cc: tpearson@raptorengineering.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, airlied@redhat.com
Subject: Re: [PATCH] drm/ast: Fix big-endian support
From: =?iso-8859-1?Q?Ren=E9?= Rebe <rene@exactco.de>
In-Reply-To: <dda9846d-3893-43ab-9cce-12a7f41fb974@suse.de>
References: <a4243932-5878-4b37-b1f0-fb0c706ed1f2@suse.de>
 <20251210.163344.1485666712792595073.rene@exactco.de>
 <dda9846d-3893-43ab-9cce-12a7f41fb974@suse.de>
X-Mailer: Mew version 6.10 on Emacs 30.2
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: 8bit
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

Hi,

On Wed, 10 Dec 2025 16:41:50 +0100, Thomas Zimmermann <tzimmermann@suse.de> wrote:

> Hi
> 
> Am 10.12.25 um 16:33 schrieb René Rebe:
> > Hallo,
> >
> > On Wed, 10 Dec 2025 09:55:50 +0100, Thomas Zimmermann
> > <tzimmermann@suse.de> wrote:
> > ...
> >>>> Does that fix the color corruption?
> >>> Following your suggestions conversion does not want to just work:
> >>>
> >>> root@XCODE_SPARC_T4_1:~# dmesg  | tail
> >>> [  105.444761] ast 0000:0a:00.0: AST 2200 detected
> >>> [ 105.444947] ast 0000:0a:00.0: [drm] dram MCLK=266 Mhz type=2
> >>> bus_width=32
> >>> [  105.444963] ast 0000:0a:00.0: [drm] Using analog VGA
> >>> [  105.445470] [drm] Initialized ast 0.1.0 for 0000:0a:00.0 on minor 0
> >>> [ 105.673289] ast 0000:0a:00.0: [drm] format BX24 little-endian
> >>> (0x34325842) not supported
> >>> [  105.673302] ast 0000:0a:00.0: [drm] No compatible format found
> >>> [ 105.673348] ast 0000:0a:00.0: [drm] *ERROR* fbdev: Failed to setup
> >>> emulation (ret=-22)
> >>> [ 105.901306] ast 0000:0a:00.0: [drm] format BX24 little-endian
> >>> (0x34325842) not supported
> >>> [  105.901319] ast 0000:0a:00.0: [drm] No compatible format found
> >>> [ 105.901350] ast 0000:0a:00.0: [drm] *ERROR* fbdev: Failed to setup
> >>> emulation (ret=-22)
> >> Oh well...
> >>
> >> There's a very simple patch attach. Does it fix the problem?
> > Yes, only leaving the hardcoded swapping from my patch liek this fixes
> > the byte-swapped output as expected on the sparc64 Sun T4.
> 
> Great.
> 
> >
> > How would you like me to go from here? Just use the chip_id to force
> > swapping and enable hw swapper for pre-AST2400 chips or fix the
> > generic format selection to work as you had suggested?
> >
> > Does the ast_primary_plane_formats need to byte swapped formats for it
> > to work?
> 
> I'll send out a full patch that implements the byte swapping. Once
> reviewed, it can be merged quickly. Can I add your Tested-by tag to
> the patch?

I'd be happy to finish my work. But if you want to put the last touch
on it now you can add Co-developed-by, too ... and I'll test the final
version.

   René

-- 
René Rebe, ExactCODE GmbH, Berlin, Germany
https://exactco.de • https://t2linux.com • https://patreon.com/renerebe
