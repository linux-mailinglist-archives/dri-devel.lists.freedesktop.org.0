Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF035A980D0
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 09:28:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0118610E651;
	Wed, 23 Apr 2025 07:28:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=protonmail.com header.i=@protonmail.com header.b="P4cgoiyF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 391 seconds by postgrey-1.36 at gabe;
 Wed, 23 Apr 2025 07:18:51 UTC
Received: from mail-4327.protonmail.ch (mail-4327.protonmail.ch [185.70.43.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A42210E646
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 07:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail3; t=1745392330; x=1745651530;
 bh=pKHNu+OJ8VesxkajHV+/DwJVpFI6q/1viDc2UaycMPU=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
 List-Unsubscribe:List-Unsubscribe-Post;
 b=P4cgoiyFb8mGiLIFA3QinUQ+vjiZzv1ED2t8p45Vrt6aQr9KsIaSEJmif6K3zHBqJ
 2+HguaOxd7p35ml1o9l6JeeCVGgKL1klNRPxc5oorOJnWGUe3Q9RBh4DJGmeR7c/hp
 2sYC1W3BTPeQWx/TSj/2R2XDmq/8pv8Jjnr7A6bGN6hfHz8lDsYJVaVqjfQ8Afwwfy
 X+CEMQuiAByLXGj/CbJm4l9gxGEtEMoencGpHZ/RvLrvC+LDh/DIrv87EoWSG8oVda
 uhYT7E28zVagMCcAZY1YVQuplVVNm4L3GCiS2FLnLfo6yif0Z872K+X+9XAITgi4op
 y+gzwknUGTMbg==
Date: Wed, 23 Apr 2025 07:12:05 +0000
To: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>
From: Abanoub Sameh <abanoubsameh@protonmail.com>
Cc: "mripard@kernel.org" <mripard@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Patch to replace strcpy() with strscpy() in drm_fb_helper.c
Message-ID: <m6fDuYqgCI0Sg6QMnrYRG8MnGc1yujAoq2vOkZiGDI4OwsQXSRKwLf_i3Ekb71lKsIKS3IUhzLsQM6gwn9X_bpChsnApJp2TggjbHdXctdw=@protonmail.com>
Feedback-ID: 23391015:user:proton
X-Pm-Message-ID: e96aede9142539d25ce00ea7990f2d54ee1d3fd3
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 23 Apr 2025 07:28:34 +0000
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

From e45e4d9016262ace19db01e69d266d6218789ccd Mon Sep 17 00:00:00 2001
From: Abanoub Sameh <abanoubsameh@protonmail.com>
Date: Thu, 17 Apr 2025 23:37:21 +0200
Subject: [PATCH] Use strscpy() instead of strcpy() in
 drivers/gpu/drm/drm_fb_helper.c

Use strscpy() instead of strcpy() since it is safer, and compliant with che=
ckpatch.pl

It is an easy fix, since the size of fb_helper->fb->comm is a constant defi=
ned at linux/sched.h

strcpy() does not check for destination size and should not be used, see:
https://github.com/KSPP/linux/issues/88

Signed-off-by: Abanoub Sameh <abanoubsameh@protonmail.com>
---
 drivers/gpu/drm/drm_fb_helper.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helpe=
r.c
index 937c3939e..4392aba01 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -33,6 +33,7 @@
 #include <linux/pci.h>
 #include <linux/sysrq.h>
 #include <linux/vga_switcheroo.h>
+#include <linux/sched.h>
=20
 #include <drm/drm_atomic.h>
 #include <drm/drm_drv.h>
@@ -1650,7 +1651,7 @@ static int drm_fb_helper_single_fb_probe(struct drm_f=
b_helper *fb_helper)
 =09if (ret < 0)
 =09=09return ret;
=20
-=09strcpy(fb_helper->fb->comm, "[fbcon]");
+=09strscpy(fb_helper->fb->comm, "[fbcon]", TASK_COMM_LEN);
=20
 =09info =3D fb_helper->info;
=20
--=20
2.49.0


