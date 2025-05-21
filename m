Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6382CABEA92
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 06:09:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3060B10E5DA;
	Wed, 21 May 2025 04:09:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="YAkIOa3R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D728D10E5DA
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 04:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747800546;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=cwFXFsBgLWO76M4EzHYB+vdHBmj0O4/k6dIiXIgNwXA=;
 b=YAkIOa3RcsHtlM8HkKD/y2V5YLqJOwTWgucPMbir9Gi87zZSXWb3r4+dsIk5+Ql8798oAF
 bYE/lTz+uaOK9tRIZypFf6PdoKOx6cdiiBydxW+M5vSfe9cruAgNKobSyNmnTbeSMk/WZj
 5Ic/8eNzO/qZzKB2kjGAe7f6In2xYYQ=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-6-wOqS_yLZPpq-x5VQjf1inQ-1; Wed,
 21 May 2025 00:09:00 -0400
X-MC-Unique: wOqS_yLZPpq-x5VQjf1inQ-1
X-Mimecast-MFC-AGG-ID: wOqS_yLZPpq-x5VQjf1inQ_1747800537
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id C32571800446; Wed, 21 May 2025 04:08:55 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.184])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id AFE22195608F; Wed, 21 May 2025 04:08:48 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Subject: [PATCH v3 00/30] drm/panel: Use refcounted allocation in place of
 devm_kzalloc() - Part2
Date: Tue, 20 May 2025 22:03:31 -0500
Message-Id: <20250520-drivers-mass-convert-part2-v3-0-f7ae7b723c68@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIRCLWgC/y3NSw7CIBSF4a0Yxl5DKX3oyH2YhlB6tSQWmgshm
 qZ7l7YO/zP4zsICksXAbqeFESYbrHc5yvOJmVG7F4IdcjPBRcUrwWEgm5ACTDoEMN7liDBrigI
 K3dT82hZNa0qWgZnwaT87/uhyjzZET9/9KxXberCSl9DLLE9q1g7farPV31aHnQRwEDU3rZbSV
 HV/JxxGHS/GT6xb1/UHtDsM7MoAAAA=
X-Change-ID: 20250520-drivers-mass-convert-part2-1a76098178c3
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Icenowy Zheng <icenowy@aosc.io>, Jagan Teki <jagan@amarulasolutions.com>, 
 Ondrej Jirman <megi@xff.cz>, Javier Martinez Canillas <javierm@redhat.com>, 
 Michael Trimarchi <michael@amarulasolutions.com>, 
 Michael Walle <mwalle@kernel.org>, Jagan Teki <jagan@edgeble.ai>, 
 =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
 Purism Kernel Team <kernel@puri.sm>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Jianhua Lu <lujianhua000@gmail.com>, Stefan Mavrodiev <stefan@olimex.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Anusha Srivatsa <asrivats@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747796667; l=7046;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=a2+Bt61n+wOA4hRqO3Q4hLaEsYkSNk9/KNmQwwiPqbY=;
 b=CpFxfcJ81nHgVZvsi2sfwFoGgPa20Vt1zGnLTsbJXuTAK7YIJs4wKF/7sxLCuT/ZHAlO/ZmfB
 9z/fMUi2UqVBCJz6nUswZqsid+t6WCrkaT2i84SFC4k86vh0xS/X7dU
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
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

Convert drivers to use the API - devm_drm_panel_alloc().
There are a lot of occurences of the panel allocation across the
subsystem. Much thanks to Maxime for the semanic patch which actually
gives a list of panels allocated unsafely.

virtual report

@ find_add @
identifier add_f;
identifier c;
identifier b;
expression d;
position p;
identifier r;
type T;
@@
add_f(...)
{
...
- T *c;
+ T *c;
...
(
drm_panel_add(&c->b)@p;
)
...
}
@ find_allocation depends on find_add @
identifier alloc_f;
type find_add.T;
identifier cal;
position p;
@@
alloc_f(...)
{
...
- T *cal;
+ T *cal;
...
(
 cal = kzalloc(...)@p;
|
 cal = devm_kzalloc(...)@p;
)
...
}
@ script:python depends on report && (find_add && find_allocation) @
add_f << find_add.add_f;
alloc_f << find_allocation.alloc_f;
add_p << find_add.p;
alloc_p << find_allocation.p;
@@
coccilib.report.print_report(alloc_p[0], "ERROR: Panel Driver is unsafely allocated in %s and added in %s" % (alloc_f, add_f))

The changes to the list of panels that this script gives is done manually.

Part 1 of the series : https://patchwork.freedesktop.org/series/147082/
is already merged. Sending this next part that covers next 30 drivers.

Sending in batches for easier review.

Minor changes in this version: 2 alignment fixes and 2 refactor and
1 compilation fix.

This took a while to resend mainly due to being away (out of office),
workstation issues because of which lost the work directory that dim
had created and had to start afresh.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
Changes in v3:
- Alignment fixes - patch 13 and 22.
- Refactors: patch 15 and 18.
- Compilation fix: Patch 18.
- Link to v2: https://lore.kernel.org/all/20250403-b4-drm_panel_mass_convert_part2-v2-0-260c8a44c56b@redhat.com/

Changes in v2:
- Remove drm_panel_init() from probe function in ilitek-ili9341 driver. 
- Link to v1: https://lore.kernel.org/r/20250402-b4-drm_panel_mass_convert_part2-v1-0-903b70999ea6@redhat.com

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>

---
Anusha Srivatsa (30):
      panel/panel-elida-kd35t133: Use refcounted allocation in place of devm_kzalloc()
      panel/feixin-k101-im2ba02: Use refcounted allocation in place of devm_kzalloc()
      panel/fy07024di26a30d: Use refcounted allocation in place of devm_kzalloc()
      panel/himax-hx83112a: Use refcounted allocation in place of devm_kzalloc()
      panel/himax-hx8394: Use refcounted allocation in place of devm_kzalloc()
      panel/ilitek-ili9322: Use refcounted allocation in place of devm_kzalloc()
      panel/ilitek-ili9341: Use refcounted allocation in place of devm_kzalloc()
      panel/panel-ili9805: Use refcounted allocation in place of devm_kzalloc()
      panel/ilitek-ili9806e: Use refcounted allocation in place of devm_kzalloc()
      panel/ilitek-ili9881c: Use refcounted allocation in place of devm_kzalloc()
      panel/innolux-ej030na: Use refcounted allocation in place of devm_kzalloc()
      panel/innolux-p079zca: Use refcounted allocation in place of devm_kzalloc()
      panel/jadard-jd9365da-h3: Use refcounted allocation in place of devm_kzalloc()
      panel/jdi-fhd-r63452: Use refcounted allocation in place of devm_kzalloc()
      panel/ltk050h3146w: Use refcounted allocation in place of devm_kzalloc()
      panel/ltk500hd1829: Use refcounted allocation in place of devm_kzalloc()
      panel/lg-lg4573: Use refcounted allocation in place of devm_kzalloc()
      panel/lincolntech-lcd197: Use refcounted allocation in place of devm_kzalloc()
      panel/magnachip-d53e6ea8966: Use refcounted allocation in place of devm_kzalloc()
      panel/mantix-mlaf057we51: Use refcounted allocation in place of devm_kzalloc()
      panel/newvision-nv3051d: Use refcounted allocation in place of devm_kzalloc()
      panel/newvision-nv3052c: Use refcounted allocation in place of devm_kzalloc()
      panel/novatek-nt35510: Use refcounted allocation in place of devm_kzalloc()
      panel/novatek-nt35560: Use refcounted allocation in place of devm_kzalloc()
      panel/novatek-nt35950: Use refcounted allocation in place of devm_kzalloc()
      panel/novatek-nt36523: Use refcounted allocation in place of devm_kzalloc()
      panel/novatek-nt36672e: Use refcounted allocation in place of devm_kzalloc()
      panel/novatek-nt39016: Use refcounted allocation in place of devm_kzalloc()
      panel/lcd-olinuxino: Use refcounted allocation in place of devm_kzalloc()
      panel/orisetech-ota5601a: Use refcounted allocation in place of devm_kzalloc()

 drivers/gpu/drm/panel/panel-elida-kd35t133.c          | 10 ++++------
 drivers/gpu/drm/panel/panel-feixin-k101-im2ba02.c     | 11 +++++------
 drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c | 10 ++++------
 drivers/gpu/drm/panel/panel-himax-hx83112a.c          | 10 +++++-----
 drivers/gpu/drm/panel/panel-himax-hx8394.c            | 11 +++++------
 drivers/gpu/drm/panel/panel-ilitek-ili9322.c          | 10 ++++------
 drivers/gpu/drm/panel/panel-ilitek-ili9341.c          | 10 +++++-----
 drivers/gpu/drm/panel/panel-ilitek-ili9805.c          | 12 ++++++------
 drivers/gpu/drm/panel/panel-ilitek-ili9806e.c         | 10 ++++------
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c         | 11 +++++------
 drivers/gpu/drm/panel/panel-innolux-ej030na.c         | 11 +++++------
 drivers/gpu/drm/panel/panel-innolux-p079zca.c         | 11 +++++------
 drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c      | 10 ++++------
 drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c          | 10 +++++-----
 drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c    | 11 +++++------
 drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c    | 11 +++++------
 drivers/gpu/drm/panel/panel-lg-lg4573.c               | 11 +++++------
 drivers/gpu/drm/panel/panel-lincolntech-lcd197.c      | 11 +++++------
 drivers/gpu/drm/panel/panel-magnachip-d53e6ea8966.c   | 11 +++++------
 drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c      | 11 +++++------
 drivers/gpu/drm/panel/panel-newvision-nv3051d.c       | 11 +++++------
 drivers/gpu/drm/panel/panel-newvision-nv3052c.c       | 10 ++++------
 drivers/gpu/drm/panel/panel-novatek-nt35510.c         | 12 ++++++------
 drivers/gpu/drm/panel/panel-novatek-nt35560.c         | 12 ++++++------
 drivers/gpu/drm/panel/panel-novatek-nt35950.c         | 10 ++++------
 drivers/gpu/drm/panel/panel-novatek-nt36523.c         |  9 +++++----
 drivers/gpu/drm/panel/panel-novatek-nt36672e.c        | 10 +++++-----
 drivers/gpu/drm/panel/panel-novatek-nt39016.c         | 10 ++++------
 drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c    | 11 +++++------
 drivers/gpu/drm/panel/panel-orisetech-ota5601a.c      | 11 +++++------
 30 files changed, 145 insertions(+), 174 deletions(-)
---
base-commit: a4b4e3fd536763b3405c70ef97a6e7f9af8a00dc
change-id: 20250520-drivers-mass-convert-part2-1a76098178c3

Best regards,
-- 
Anusha Srivatsa <asrivats@redhat.com>

