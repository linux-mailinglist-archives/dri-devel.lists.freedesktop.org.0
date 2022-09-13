Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 061BA5B7056
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 16:25:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95B7189C86;
	Tue, 13 Sep 2022 14:25:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out20-49.mail.aliyun.com (out20-49.mail.aliyun.com
 [115.124.20.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84F3789C86
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Sep 2022 14:25:06 +0000 (UTC)
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.0443638|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.00978077-0.00188305-0.988336;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047199; MF=wangyugui@e16-tech.com; NM=1;
 PH=DS; RN=2; RT=2; SR=0; TI=SMTPD_---.PEdtH0b_1663079100; 
Received: from 192.168.2.112(mailfrom:wangyugui@e16-tech.com
 fp:SMTPD_---.PEdtH0b_1663079100) by smtp.aliyun-inc.com;
 Tue, 13 Sep 2022 22:25:01 +0800
Date: Tue, 13 Sep 2022 22:25:07 +0800
From: Wang Yugui <wangyugui@e16-tech.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: mgag200 broken on kernel-6.0-rc3 on DELL/T620
In-Reply-To: <5dbb416f-04dd-d2d7-a542-3d83b45a99a0@suse.de>
References: <20220907121612.FBFC.409509F4@e16-tech.com>
 <5dbb416f-04dd-d2d7-a542-3d83b45a99a0@suse.de>
Message-Id: <20220913222506.6C72.409509F4@e16-tech.com>
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
> Am 07.09.22 um 06:16 schrieb Wang Yugui:
> > Hi,
> >
> >> Am 02.09.22 um 07:52 schrieb Wang Yugui:
> >>> Hi,
> >>>
> >>> mgag200 broken on kernel-6.0-rc3 on DELL/T620.
> >>>
> >>> See the attachementment file for the graph output.
> >>
> >> Thanks for reporting the bug. We recently refactored some code of the driver. Can you bisect to the change that introduced the problem?
> >
> > 5.19.3 works well on this DELL/T620.
> >
> > so this problem should be a regression of 6.0.
> >
> > other bisect seem difficult for me.
> 
> I looked for changes between 5.19 and 6.0-rc3 that could affect G200ER specifically, but could not find anything. It would help if I'd know the first broken commit. Is there any chance that you get the git bisecting to work?
> 
> The commands should be
> 
>    git bisect reset
>    git bisect start v6.0-rc3 v5.19

A dirty patch(below) works well.  but we need a final fix.

# git diff
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 225cca2ed60e..cd976baa2f44 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -1070,7 +1070,7 @@ int mgag200_modeset_init(struct mga_device *mdev, resource_size_t vram_available

        dev->mode_config.max_width = MGAG200_MAX_FB_WIDTH;
        dev->mode_config.max_height = MGAG200_MAX_FB_HEIGHT;
-       dev->mode_config.preferred_depth = 24;
+       dev->mode_config.preferred_depth = 16;
        dev->mode_config.fb_base = mdev->vram_res->start;
        dev->mode_config.funcs = &mgag200_mode_config_funcs;

I firstly tried to build whole kernel base on
c577b2f43e80 drm/mgag200: Enable atomic gamma lut update
d45e32c9d98c drm/mgag200: Call mgag200_device_probe_vram() from
per-model init

both failed to boot, so failed to test mgag200 driver.

so I tried to revert patch of mgag200 driver in batch of 2 or 3, the I
noticed the patch 'Subject: drm/mgag200: Remove special case for G200SE
with <2 MiB' and then tried this dirty fix.

Best Regards
Wang Yugui (wangyugui@e16-tech.com)
2022/09/13


> 
> Best regards
> Thomas
> 
> >
> > Best Regards
> > Wang Yugui (wangyugui@e16-tech.com)
> > 2022/09/07
> >
> >
> >>
> >> Best regards
> >> Thomas
> >>
> >>>
> >>> [root@T620 ~]# dmesg  |grep -i 'vga\|mga'
> >>> [    0.588940] Console: colour VGA+ 80x25
> >>> [    4.918214] pci 0000:0a:00.0: vgaarb: setting as boot VGA device
> >>> [    4.919028] pci 0000:0a:00.0: vgaarb: bridge control possible
> >>> [    4.919028] pci 0000:0a:00.0: vgaarb: VGA device added: decodes=io+mem,owns=io+mem,locks=none
> >>> [    4.941058] vgaarb: loaded
> >>> [    9.385485] mgag200 0000:0a:00.0: vgaarb: deactivate vga console
> >>> [    9.510688] [drm] Initialized mgag200 1.0.0 20110418 for 0000:0a:00.0 on minor 0
> >>> [    9.523145] fbcon: mgag200drmfb (fb0) is primary device
> >>> [    9.641543] mgag200 0000:0a:00.0: [drm] fb0: mgag200drmfb frame buffer device
> >>>
> >>>
> >>> more info:
> >>> 1, This DELL/T620 works well with kernel 5.15.63,
> >>>       so this is not a  hardware error.
> >>>
> >>> 2, DELL/T640 works well with kernel 6.0-rc and 5.15.63.
> >>>       both DELL/T620 and DELL/T640 use the driver 'mgag200'.
> >>>
> >>> [root@T640 ~]#  dmesg  |grep -i 'vga\|mga'
> >>> [   10.161500] pci 0000:03:00.0: vgaarb: setting as boot VGA device
> >>> [   10.162463] pci 0000:03:00.0: vgaarb: VGA device added: decodes=io+mem,owns=io+mem,locks=none
> >>> [   10.176527] pci 0000:03:00.0: vgaarb: bridge control possible
> >>> [   10.182465] vgaarb: loaded
> >>> [   11.832839] fb0: EFI VGA frame buffer device
> >>> [   21.303826] mgag200 0000:03:00.0: vgaarb: deactivate vga console
> >>> [   21.319498] [drm] Initialized mgag200 1.0.0 20110418 for 0000:03:00.0 on minor 0
> >>> [   21.330223] fbcon: mgag200drmfb (fb0) is primary device
> >>> [   21.332140] mgag200 0000:03:00.0: [drm] drm_plane_enable_fb_damage_clips() not called
> >>> [   21.741629] mgag200 0000:03:00.0: [drm] fb0: mgag200drmfb frame buffer device
> >>>
> >>> Best Regards
> >>> Wang Yugui (wangyugui@e16-tech.com)
> >>> 2022/09/02
> >>>
> >> -- Thomas Zimmermann
> >> Graphics Driver Developer
> >> SUSE Software Solutions Germany GmbH
> >> Maxfeldstr. 5, 90409 N¨¹rnberg, Germany
> >> (HRB 36809, AG N¨¹rnberg)
> >> Gesch?ftsf¨¹hrer: Ivo Totev
> >
> > 
> -- Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N¨¹rnberg, Germany
> (HRB 36809, AG N¨¹rnberg)
> Gesch?ftsf¨¹hrer: Ivo Totev


