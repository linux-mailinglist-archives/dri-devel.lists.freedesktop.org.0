Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E9A5B9D84
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 16:41:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3520810EB53;
	Thu, 15 Sep 2022 14:41:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out20-14.mail.aliyun.com (out20-14.mail.aliyun.com
 [115.124.20.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F91910EB53
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Sep 2022 14:40:57 +0000 (UTC)
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.04749017|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.0185733-0.00351497-0.977912;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047199; MF=wangyugui@e16-tech.com; NM=1;
 PH=DS; RN=3; RT=3; SR=0; TI=SMTPD_---.PGPXYyg_1663252853; 
Received: from 192.168.2.112(mailfrom:wangyugui@e16-tech.com
 fp:SMTPD_---.PGPXYyg_1663252853) by smtp.aliyun-inc.com;
 Thu, 15 Sep 2022 22:40:54 +0800
Date: Thu, 15 Sep 2022 22:41:00 +0800
From: Wang Yugui <wangyugui@e16-tech.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: mgag200 broken on kernel-6.0-rc3 on DELL/T620
In-Reply-To: <0bb98321-dc3d-8bb3-f7b1-eb09c617a1de@suse.de>
References: <20220914225809.763F.409509F4@e16-tech.com>
 <0bb98321-dc3d-8bb3-f7b1-eb09c617a1de@suse.de>
Message-Id: <20220915224058.B32A.409509F4@e16-tech.com>
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

> Hi
> 
> Am 14.09.22 um 16:58 schrieb Wang Yugui:
> [...]
> >> 24-bit works on my G200HE and G200 test machines. Maybe the G200ER has a bug.
> >>
> >> When I try 16-bit depth, the display works, but is way too dark. No fiddling with the LUT tables fixes this. It's 90s hardware, so it should support 16-bit framebuffers well, but there's no obvious bug to be seen.
> >>
> >> I guess, we could remove 16 and 24 bit support for now if nothing else helps.
> >
> >
> > maybe better if we revert 73f54d5d9682 (drm/mgag200: Remove special case
> > for G200SE with <2 MiB)
> 
> Could you please test the attached patch on the 6.0-rc3 kernel? It should force the driver to a correct color format if no kernel parameters are given.
> 

This patch works well.

test case detail:
  kernel parm video is not given
  server DELL/T620
  kernel is 6.0-rc5

Best Regards
Wang Yugui (wangyugui@e16-tech.com)
2022/09/15


> Best regards
> Thomas
> 
> >
> > because there is no test result on device G200_SE
> >
> > static unsigned int mgag200_preferred_depth(struct mga_device *mdev)
> > {
> >         if (IS_G200_SE(mdev) && mdev->vram_fb_available < (2048*1024))
> >                 return 16;
> >         else
> >                 return 32;
> > }
> >
> > Best Regards
> > Wang Yugui (wangyugui@e16-tech.com)
> > 2022/09/14
> > 
> -- Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N¨¹rnberg, Germany
> (HRB 36809, AG N¨¹rnberg)
> Gesch?ftsf¨¹hrer: Ivo Totev


