Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 715086DADA6
	for <lists+dri-devel@lfdr.de>; Fri,  7 Apr 2023 15:35:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04D4510E2B5;
	Fri,  7 Apr 2023 13:35:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 966 seconds by postgrey-1.36 at gabe;
 Thu, 06 Apr 2023 16:01:14 UTC
Received: from l2mail1.panix.com (l2mail1.panix.com [166.84.1.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87E8910EC53
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 16:01:14 +0000 (UTC)
Received: from mailbackend.panix.com (mailbackend.panix.com [166.84.1.89])
 by l2mail1.panix.com (Postfix) with ESMTPS id 4Psm6D72CzzDb2
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 11:45:08 -0400 (EDT)
Received: from panix3.panix.com (panix3.panix.com [166.84.1.3])
 by mailbackend.panix.com (Postfix) with ESMTP id 4Psm6B65hdz2tsB;
 Thu,  6 Apr 2023 11:45:06 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=panix.com; s=panix;
 t=1680795906; bh=XfZ1+GwhbEbWzsgUVPIg6FsJIKtFz7bIyHlh+01DR/s=;
 h=Date:To:Cc:Subject:References:In-Reply-To:From;
 b=CVAGkx6ujcqKL1XXj6hhH0YlxdgjFxJWdHeeQ3jI6IkLovaSGDiJCSO4vjx74XLq9
 zh+6qq02OevgT2O5GQxvZ27tZdaqAB2rIBObaWRUovuseFitrlTMwQLCtk6rNq89/c
 55jkrm3czXdYY7jUz7NYR5tNjql2Y89Jcv4qT5Bs=
Received: by panix3.panix.com (Postfix, from userid 19171)
 id 4Psm6B6Lqkz1QXM; Thu,  6 Apr 2023 11:45:06 -0400 (EDT)
Date: Thu, 06 Apr 2023 15:45:06 +0000
To: tzimmermann@suse.de, mripard@kernel.org, mairacanal@riseup.net,
 maarten.lankhorst@linux.intel.com, jose.exposito89@gmail.com,
 javierm@redhat.com, daniel@ffwll.ch, airlied@gmail.com
Subject: Re: [PATCH v3 01/13] firmware/sysfb: Fix EFI/VESA format selection
References: <20230102112927.26565-1-tzimmermann@suse.de>
 <20230102112927.26565-2-tzimmermann@suse.de>
In-Reply-To: <20230102112927.26565-2-tzimmermann@suse.de>
User-Agent: nail 11.25 7/29/05
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-Id: <4Psm6B6Lqkz1QXM@panix3.panix.com>
From: pa@panix.com (Pierre Asselin)
X-Mailman-Approved-At: Fri, 07 Apr 2023 13:35:17 +0000
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
Cc: dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 Pierre Asselin <pa@panix.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> wrote:

> Select color format for EFI/VESA firmware scanout buffer from the
> number of bits per pixel and the position of the individual color
> components. Fixes the selected format for the buffer in several odd
> cases. For example, XRGB1555 has been reported as ARGB1555 because
> of the different use of depth and transparency in VESA and Linux.
>
> Bits-per-pixel is always the pixel's raw number of bits; including
> alpha and filler bits. It is preferred over color depth, which has a
> different meaning among various components and standards.
>
> Also do not compare reserved bits and transparency bits to each other.
> These values have different meanings, as reserved bits include filler
> bits while transparency does not.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
>  drivers/firmware/sysfb_simplefb.c | 43 ++++++++++++++++++++++++++-----
>  1 file changed, 37 insertions(+), 6 deletions(-)
>
[patch elided]

Starting at linux-6.3-rc1 my simplefb picks the wrong mode and garbles
the display This is on a 16-year old i686 laptop.  I can post lshw or
dmidecode output if it helps.

The issue is still present in 6.3-rc5.

Screenshot: https://www.panix.com/~pa/linux-6.3-simplefb/bug-simplefb-bad.jpg
Compare: https://www.panix.com/~pa/linux-6.3-simplefb/bug-simplefb-good.jpg

This happens during early boot.  Grub picks a 1024x786 mode and leaves
it for the kernel.  The screenshots are from a rescueshell in early
userspace.  The dmesg excerpts at the bottom might give some clues.

I bisected it to f35cd3fa77293c2cd03e94b6a6151e1a7d9309cf
    firmware/sysfb: Fix EFI/VESA format selection
which is this patch.

It's not the end of the world:
1) I have a workaround, booting with vga=0x318;
2) the screen is usable even without the workaround;
3) the final fbcon driver takes over after the switch_root.
Nevertheless, it would be nice to get this fixed this before 6.3.

I may be the only one with this problem.  Who else runs -rc kernels on
such old hardware ?  I'll answer questions as best I can and test any
patches thrown at me.

--pa
