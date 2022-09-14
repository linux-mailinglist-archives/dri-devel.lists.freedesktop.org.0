Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9645B82E9
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 10:29:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D64010E8B4;
	Wed, 14 Sep 2022 08:29:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out20-39.mail.aliyun.com (out20-39.mail.aliyun.com
 [115.124.20.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AAA210E8B4
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Sep 2022 08:29:20 +0000 (UTC)
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.04508899|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.0032997-0.000899747-0.995801;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047205; MF=wangyugui@e16-tech.com; NM=1;
 PH=DS; RN=2; RT=2; SR=0; TI=SMTPD_---.PFHBN14_1663144156; 
Received: from 192.168.2.112(mailfrom:wangyugui@e16-tech.com
 fp:SMTPD_---.PFHBN14_1663144156) by smtp.aliyun-inc.com;
 Wed, 14 Sep 2022 16:29:17 +0800
Date: Wed, 14 Sep 2022 16:29:24 +0800
From: Wang Yugui <wangyugui@e16-tech.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: mgag200 broken on kernel-6.0-rc3 on DELL/T620
In-Reply-To: <86e3a684-7a50-ed05-a89d-eeef154b2e67@suse.de>
References: <20220913231522.7CAA.409509F4@e16-tech.com>
 <86e3a684-7a50-ed05-a89d-eeef154b2e67@suse.de>
Message-Id: <20220914162920.7233.409509F4@e16-tech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: 8bit
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
> Am 13.09.22 um 17:15 schrieb Wang Yugui:
> [...]
> >>>
> >>> so I tried to revert patch of mgag200 driver in batch of 2 or 3, the I
> >>> noticed the patch 'Subject: drm/mgag200: Remove special case for G200SE
> >>> with <2 MiB' and then tried this dirty fix.
> >>
> >> Oh, great work! Thank you. From looking at the screenshot that you provided, it seems as if the 24-bit mode setting is broken. I'm not sure why the G200SE workaround applies to a G200ER, but we'll see.
> >
> > I tested 'preferred_depth = 32' too. it works on T630 too.
> >
> > so both 16 and 32 work, but 24 failed on DELL/T630.
> 
> I tried on my test machine with a 5.19 kernel and found that 32-bit and 24-bit pixels work, but 16-bit looks incorrect.
> 
> What are the results if you boot your kernel 5.19.3 with the parameter video=1024x768-24? This should enable 24-bit pixels.
> 
> How does video=1024x768-16 look with the 5.19 kernel?

test result here
kernel 5.19.3 & video=1024x768-24
	dell/T620/centos-8.5	broken
	dell/T630/centos-7.9	broken

kernel 5.19.3 & video=1024x768-32
	dell/T620/centos-8.5	OK
	dell/T630/centos-7.9	OK

Both DELL/T620 and DELL/T630 have the lastest BIOS/iDRAC installed.

Best Regards
Wang Yugui (wangyugui@e16-tech.com)
2022/09/14



> 
> Best regards
> Thomas
> 
> >
> > diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c
> > b/drivers/gpu/drm/mgag200/mgag200_mode.c
> > index 225cca2ed60e..563e3ab05fbc 100644
> > --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
> > +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
> > @@ -1070,7 +1070,7 @@ int mgag200_modeset_init(struct mga_device *mdev, resource_size_t vram_available
> >
> >          dev->mode_config.max_width = MGAG200_MAX_FB_WIDTH;
> >          dev->mode_config.max_height = MGAG200_MAX_FB_HEIGHT;
> > -       dev->mode_config.preferred_depth = 24;
> > +       dev->mode_config.preferred_depth = 32;
> >          dev->mode_config.fb_base = mdev->vram_res->start;
> >          dev->mode_config.funcs = &mgag200_mode_config_funcs;
> >
> > Best Regards
> > Wang Yugui (wangyugui@e16-tech.com)
> > 2022/09/13
> >
> >
> > 
> -- Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N¨¹rnberg, Germany
> (HRB 36809, AG N¨¹rnberg)
> Gesch?ftsf¨¹hrer: Ivo Totev


