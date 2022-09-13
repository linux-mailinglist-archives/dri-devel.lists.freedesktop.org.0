Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C09AF5B73CE
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 17:15:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D897810E760;
	Tue, 13 Sep 2022 15:15:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out20-39.mail.aliyun.com (out20-39.mail.aliyun.com
 [115.124.20.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EBA510E760
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Sep 2022 15:15:30 +0000 (UTC)
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.04441897|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.0326565-0.0243229-0.943021;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047204; MF=wangyugui@e16-tech.com; NM=1;
 PH=DS; RN=2; RT=2; SR=0; TI=SMTPD_---.PEeWrJ2_1663082116; 
Received: from 192.168.2.112(mailfrom:wangyugui@e16-tech.com
 fp:SMTPD_---.PEeWrJ2_1663082116) by smtp.aliyun-inc.com;
 Tue, 13 Sep 2022 23:15:16 +0800
Date: Tue, 13 Sep 2022 23:15:22 +0800
From: Wang Yugui <wangyugui@e16-tech.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: mgag200 broken on kernel-6.0-rc3 on DELL/T620
In-Reply-To: <613ca1d0-8680-9f45-9317-d6b316f307ce@suse.de>
References: <20220913222506.6C72.409509F4@e16-tech.com>
 <613ca1d0-8680-9f45-9317-d6b316f307ce@suse.de>
Message-Id: <20220913231522.7CAA.409509F4@e16-tech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Mailer: Becky! ver. 2.75.04 [en]
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

> Hi
> 
> Am 13.09.22 um 16:25 schrieb Wang Yugui:
> > Hi,
> >
> >> Hi
> >>
> >> Am 07.09.22 um 06:16 schrieb Wang Yugui:
> >>> Hi,
> >>>
> >>>> Am 02.09.22 um 07:52 schrieb Wang Yugui:
> >>>>> Hi,
> >>>>>
> >>>>> mgag200 broken on kernel-6.0-rc3 on DELL/T620.
> >>>>>
> >>>>> See the attachementment file for the graph output.
> >>>>
> >>>> Thanks for reporting the bug. We recently refactored some code of the driver. Can you bisect to the change that introduced the problem?
> >>>
> >>> 5.19.3 works well on this DELL/T620.
> >>>
> >>> so this problem should be a regression of 6.0.
> >>>
> >>> other bisect seem difficult for me.
> >>
> >> I looked for changes between 5.19 and 6.0-rc3 that could affect G200ER specifically, but could not find anything. It would help if I'd know the first broken commit. Is there any chance that you get the git bisecting to work?
> >>
> >> The commands should be
> >>
> >>     git bisect reset
> >>     git bisect start v6.0-rc3 v5.19
> >
> > A dirty patch(below) works well.  but we need a final fix.
> >
> > # git diff
> > diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
> > index 225cca2ed60e..cd976baa2f44 100644
> > --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
> > +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
> > @@ -1070,7 +1070,7 @@ int mgag200_modeset_init(struct mga_device *mdev, resource_size_t vram_available
> >
> >          dev->mode_config.max_width = MGAG200_MAX_FB_WIDTH;
> >          dev->mode_config.max_height = MGAG200_MAX_FB_HEIGHT;
> > -       dev->mode_config.preferred_depth = 24;
> > +       dev->mode_config.preferred_depth = 16;
> >          dev->mode_config.fb_base = mdev->vram_res->start;
> >          dev->mode_config.funcs = &mgag200_mode_config_funcs;
> >
> > I firstly tried to build whole kernel base on
> > c577b2f43e80 drm/mgag200: Enable atomic gamma lut update
> > d45e32c9d98c drm/mgag200: Call mgag200_device_probe_vram() from
> > per-model init
> >
> > both failed to boot, so failed to test mgag200 driver.
> >
> > so I tried to revert patch of mgag200 driver in batch of 2 or 3, the I
> > noticed the patch 'Subject: drm/mgag200: Remove special case for G200SE
> > with <2 MiB' and then tried this dirty fix.
> 
> Oh, great work! Thank you. From looking at the screenshot that you provided, it seems as if the 24-bit mode setting is broken. I'm not sure why the G200SE workaround applies to a G200ER, but we'll see.

I tested 'preferred_depth = 32' too. it works on T630 too.

so both 16 and 32 work, but 24 failed on DELL/T630.

diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c
b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 225cca2ed60e..563e3ab05fbc 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -1070,7 +1070,7 @@ int mgag200_modeset_init(struct mga_device *mdev, resource_size_t vram_available

        dev->mode_config.max_width = MGAG200_MAX_FB_WIDTH;
        dev->mode_config.max_height = MGAG200_MAX_FB_HEIGHT;
-       dev->mode_config.preferred_depth = 24;
+       dev->mode_config.preferred_depth = 32;
        dev->mode_config.fb_base = mdev->vram_res->start;
        dev->mode_config.funcs = &mgag200_mode_config_funcs;

Best Regards
Wang Yugui (wangyugui@e16-tech.com)
2022/09/13



