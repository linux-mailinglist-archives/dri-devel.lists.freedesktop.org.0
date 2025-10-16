Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45EDCBE12F0
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 03:45:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCEE710E059;
	Thu, 16 Oct 2025 01:45:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Vgy3zqf/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com
 [209.85.166.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8610010E059
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 01:45:35 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id
 ca18e2360f4ac-9298eba27c2so10372539f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 18:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760579134; x=1761183934; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=9rwUSd8nuRKW1ZndheoOnbtiXymXGXCv7wri7PtzlnM=;
 b=Vgy3zqf/sI73qZO0IM5BV/K/Lx9NrrMF1Og2KzvOrMFL9HOPpN9bR1MhsGweW/hPr4
 Gwbup8RFJXe+Ng4wX4bjUMVjDjAvCi/8QiVdu6IyBoHn6gJpKjisJXgPMajuef9gsbfW
 mCfqOKIfZ9uPs1xRBRBQK89wg+3T7IsjUCbYxnfI7C6CVjhm7rK8Uxr0ww5O/K3YRlUM
 UXpImsYKcUAd6IrLkbmQBOvgxMVxIWYKtpjA9DMt568EIy+rtEUrg3xeG+0tK67G6m31
 sJ/4WWVI7rDa3tHf590Aw+k4CuR6djx5Hd8kJPTmkg32/mAqL8HcDgA1IdIyKMCCVhof
 5ETw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760579134; x=1761183934;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9rwUSd8nuRKW1ZndheoOnbtiXymXGXCv7wri7PtzlnM=;
 b=aM8s9R9IY0Udx60kdHTEhzwZ45blWUPeDRrl7HAPc9f3EolyFGI7h6uEyWY9B6QZK/
 plzvRRaWv3Cjs+ym9jpPl8LWdw/ReOGfVlhPuONYdm5C+par5zMDy9Xo+wS2KBV4FtWd
 18t/ujfLSpp21Y25ba+nr31xDexIwNM1Zn5U98Dymb3vX+uLoDOUcGgc59HdyXRSUjRj
 P1TA9Yij9KsZQI1V88v3oldjT1fQ6WdlkxRGK3NKs/crHDJ40S8uZatHMbb1E+R1+iHW
 fyVAjvvas1p6WJ+/Ey6M3USUxKaPriM93aZyEDYos4rsFxdvTH8/WItcBkph+LewcdJo
 uaYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtZYhoSW4y2I2hvrLTQk9PMeOigBiQB8QzQ42Czg2MSuujOs3ERtOZeltQLSPtcXOdRPBhA3+w3AI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx+Qi8a5KRofVupAJxXf8gAKNGJXMJiobLB/IqKLbNqJAi+e+14
 wUT/u75n1rSVpokpY3TWJRCexOyQIHbIxNanaAqT44l0a5YaUdDCRsU4
X-Gm-Gg: ASbGncv7e11aIAPxT2nIGoLdzYcjKs3WjRNxfHngLuywynbzoDC0CYMRyp0/9EmP+zs
 C3Ghk/XuVx74E458zHkFIOXfVG9FI2uHGlSPFQv2O290atmjBbjK8vfQus2q+V7WNWPyrYSNktb
 sH/DbTf9XCT/hNZCKKgdwFQyfrL4wHFozCfCJIhckuoRgDBMWt3e9LRyzntUDuZpkeF4+8dw9zh
 SNnX+F4S7JGm2iCu7wKnX6SuKd0CzmVC7phgZqJ/w5jfL1ui0FoJRzLwiIGi3YYwzhHWt6pbvMy
 HFBVwCUI9VREm/Iyg93Oa7P1VIBXDPLmEMSqUTbwKgdzYzI8DjHK4Htg3Z7EiPGEVdrRWQxbxXC
 k49SkAlsIgczfjPH+weE/GtJQCyvvsvUAX+f9g2ywHACiN9Zl7z6caX8SUiF7BT1xbdzyJg==
X-Google-Smtp-Source: AGHT+IFp34gerWyI/eqrZfZ7861Ql4TRlIasFqKa/zgiw4czVi2L9IWSlxhtzXGcGKWZ9dJtvmyXZw==
X-Received: by 2002:a05:6602:1645:b0:93b:da4b:d0a3 with SMTP id
 ca18e2360f4ac-93bda4bd174mr4031136539f.19.1760579134525; 
 Wed, 15 Oct 2025 18:45:34 -0700 (PDT)
Received: from arch-box ([2607:fea8:54de:2200::ffb])
 by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-59043f842bfsm5965410173.62.2025.10.15.18.45.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Oct 2025 18:45:33 -0700 (PDT)
Date: Wed, 15 Oct 2025 21:45:31 -0400
From: Albin Babu Varghese <albinbabuvarghese20@gmail.com>
To: Helge Deller <deller@gmx.de>
Cc: Simona Vetter <simona@ffwll.ch>,
 syzbot+48b0652a95834717f190@syzkaller.appspotmail.com,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] fbdev: Add bounds checking in bit_putcs to fix
 vmalloc-out-of-bounds
Message-ID: <aPBOOyrV3ihF_Bpq@arch-box>
References: <20251003073210.48501-1-albinbabuvarghese20@gmail.com>
 <b4af6e84-6555-4629-8291-fc4c2c99390b@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b4af6e84-6555-4629-8291-fc4c2c99390b@gmx.de>
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

On Sat, Oct 04, 2025 at 02:43:33AM +0200, Helge Deller wrote:
> On 10/3/25 09:32, Albin Babu Varghese wrote:
> > Add bounds checking to prevent writes past framebuffer boundaries when
> > rendering text near screen edges. Return early if the Y position is off-screen
> > and clip image height to screen boundary. Break from the rendering loop if the
> > X position is off-screen. When clipping image width to fit the screen, update
> > the character count to match the clipped width to prevent buffer size
> > mismatches.
> > 
> > Without the character count update, bit_putcs_aligned and bit_putcs_unaligned
> > receive mismatched parameters where the buffer is allocated for the clipped
> > width but cnt reflects the original larger count, causing out-of-bounds writes.
> > 
> > Reported-by: syzbot+48b0652a95834717f190@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=48b0652a95834717f190
> > Suggested-by: Helge Deller <deller@gmx.de>
> > Tested-by: syzbot+48b0652a95834717f190@syzkaller.appspotmail.com
> > Signed-off-by: Albin Babu Varghese <albinbabuvarghese20@gmail.com>
> > ---
> > Changes in v2:
> > - Partially render when height exceeding screen boundaries instead of skipping
> > - Update character count when width is clipped to prevent buffer mismatch
> > 
> > Link to v1:
> > https://lore.kernel.org/all/20250927075010.119671-1-albinbabuvarghese20@gmail.com/
> > ---
> >   drivers/video/fbdev/core/bitblit.c | 20 ++++++++++++++++++++
> >   1 file changed, 20 insertions(+)
> 
> applied.
> 
> Thanks!
> Helge
Thank you for merging the patch.

After the patch appeared in mainline, I observed that syzbot continues
to find the same bug through different execution paths. My fix addressed
bit_putcs, but the crashes now occur through bit_cursor and cw_putcs,
which bypass bit_putcs entirely and go directly to sys_imageblit():

Crash 1 (cursor path):
https://syzkaller.appspot.com/text?tag=CrashReport&x=11fe95e2580000
Call trace: hide_cursor → bit_cursor → soft_cursor → sys_imageblit

Crash 2 (rotation path):
https://syzkaller.appspot.com/text?tag=CrashReport&x=164f0b04580000
Call trace: fbcon_modechanged → cw_putcs → sys_imageblit

The original syzbot reproducer depended on character height going out of
bounds, so I focused on bit_putcs where character images are drawn. I
naively overlooked cursor drawing - apologies for that. That's why I
looked at the other crash reports after the merge, because it seemed odd
that it was still hitting the bug after the fix.

I believe adding the same clipping logic in sys_imageblit() would provide
comprehensive protection. Something like this:

void sys_imageblit(struct fb_info *p, const struct fb_image *image)
  {
 +       struct fb_image clipped;
 +       u32 width, height;
 +
         if (!(p->flags & FBINFO_VIRTFB))
                 fb_warn_once(p, "%s: framebuffer is not in virtual address space.\n", __func__);
 
 -       fb_imageblit(p, image);
 +       if (!image || image->dx >= p->var.xres || image->dy >= p->var.yres)
 +               return;
 +
 +       if (image->dx + image->width > p->var.xres || image->dy + image->height > p->var.yres) {
 +               clipped = *image;
 +
 +               height = clipped.height;
 +               if (clipped.dy + height > p->var.yres)
 +                       height = p->var.yres - clipped.dy;
 +
 +               clipped.height = height;
 +
 +               width = clipped.width;
 +               if (clipped.dx + width > p->var.xres)
 +                       width = p->var.xres - clipped.dx;
 +
 +               clipped.width = width;
 +
 +               if (clipped.width == 0 || clipped.height == 0)
 +                       return;
 +
 +               fb_imageblit(p, &clipped);
 +       } else {
 +               fb_imageblit(p, image);
 +       }
  }
 
I don't have any way to test this other than testing it with the existing
reproducers. I can prepare a patch if this approach sounds reasonable.

Thanks,
Albin
