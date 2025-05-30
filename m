Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00881AC865C
	for <lists+dri-devel@lfdr.de>; Fri, 30 May 2025 04:50:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FF1D10E1C1;
	Fri, 30 May 2025 02:50:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="TSq6s5Q6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3986C10E1C1
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 02:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748573400;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Np3+JP9+IZ9e/OLAgG6uGAkpVocBLgLmLnRA5pQUsnQ=;
 b=TSq6s5Q6bPGo3NPYswRCFw3qYvhz/hD3zGvdOM96QOwKq6karDFU3UPEcxx9uSi2JbcF7N
 vpZ8wIKWEjXUpZLEGPVdD9/ilBlPCfktc8hDGfbNTxFtuOL4w2FrY0EF/iMN9xZU+JZg0y
 iZjY94gExjrH1uaAfvdaQG86spxsuIU=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-650-zH4ZdSr-ML2Jd_p4faXBAA-1; Thu,
 29 May 2025 22:49:55 -0400
X-MC-Unique: zH4ZdSr-ML2Jd_p4faXBAA-1
X-Mimecast-MFC-AGG-ID: zH4ZdSr-ML2Jd_p4faXBAA_1748573392
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 3E6901956088; Fri, 30 May 2025 02:49:51 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.17.97])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 53C281955D82; Fri, 30 May 2025 02:49:44 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Subject: [PATCH v2 00/46] drm/panel: Use refcounted allocation in place of
 devm_kzalloc() - Part3
Date: Thu, 29 May 2025 21:46:02 -0500
Message-Id: <20250529-b4-drm_panel_mass_driver_convert_part3-v2-0-5d75a3711e40@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOsbOWgC/42NQQqDMBREryJZNyVGI7Wr3qNISMy3fqiJ/ITQI
 t69qdB9V8ObgXkbi0AIkV2rjRFkjBh8AXmq2Dgb/wCOrjCTQirRCsltyx0tejUennoxMWpHmIH
 0GHyJVBZKDe+t6OzUu8ZKycrZSjDh6xDdh8IzxhTofXhz/W1/iuZfRa654H2nbK2MU/YCNwI3m
 3Qew8KGfd8/vMrVa90AAAA=
X-Change-ID: 20250402-b4-drm_panel_mass_driver_convert_part3-9b06bf9d3b22
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Robert Chiras <robert.chiras@nxp.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Markuss Broks <markuss.broks@gmail.com>, 
 Artur Weber <aweber.kernel@gmail.com>, 
 Dzmitry Sankouski <dsankouski@gmail.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
 Purism Kernel Team <kernel@puri.sm>, Ondrej Jirman <megi@xff.cz>, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>, Janne Grunau <j@jannau.net>, 
 Michael Trimarchi <michael@amarulasolutions.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, Anusha Srivatsa <asrivats@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748573168; l=9402;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=n9YY7Ks+BsQhMLk8ELZDMHBzVjCqSp2b4F0mzbdlpYQ=;
 b=urUoLqE+7N9HZju7OdqSeE+4maKM/2/MCPBTR8dV5Hq4CO88dOCV00rMdMC1AaqNX4TjsyuoO
 kE9jxLDAcIbA8IeNbUMpCN5yqJfa9P28iKkXtjXxlPWjqXprgrTQCIR
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
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

Final set of drivers to use the new API - devm_drm_panel_alloc().
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

Very minor changes in this version - refactors, alignment fixes.

With all drivers converted, next chunk of work is to add get() and put()
to drm_panel_add() and drm_panel_remove().

First 2 parts already merged.
Part 1 of the conversion : https://patchwork.freedesktop.org/series/147082/
Part 2 of the conversion : https://patchwork.freedesktop.org/series/147157/

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
Changes in v2:
- simple refactors, if dev is already dereferenced use it (patch 8, 9,
  21, 32)
- fix alignment in 2 patches (patch 40 and 41)
- Use the right connector in patch 23
- Link to v1: https://lore.kernel.org/r/20250403-b4-drm_panel_mass_driver_convert_part3-v1-0-965b15ad5b8e@redhat.com

---
Anusha Srivatsa (46):
      panel/orisetech-otm8009a: Use refcounted allocation in place of devm_kzalloc()
      panel/raydium-rm67191: Use refcounted allocation in place of devm_kzalloc()
      panel/raydium-rm67200: Use refcounted allocation in place of devm_kzalloc()
      panel/raydium-rm68200: Use refcounted allocation in place of devm_kzalloc()
      panel/raydium-rm692e5: Use refcounted allocation in place of devm_kzalloc()
      panel/raydium-rm69380: Use refcounted allocation in place of devm_kzalloc()
      panel/ronbo-rb070d30: Use refcounted allocation in place of devm_kzalloc()
      panel/samsung-ams581vf01: Use refcounted allocation in place of devm_kzalloc()
      panel/samsung-ams639rq08: Use refcounted allocation in place of devm_kzalloc()
      panel/samsung-atna33xc20: Use refcounted allocation in place of devm_kzalloc()
      panel/samsung-db7430: Use refcounted allocation in place of devm_kzalloc()
      panel/samsung-ld9040: Use refcounted allocation in place of devm_kzalloc()
      panel/samsung-s6d16d0: Use refcounted allocation in place of devm_kzalloc()
      panel/samsung-s6d27a1: Use refcounted allocation in place of devm_kzalloc()
      panel/samsung-s6d7aa0: Use refcounted allocation in place of devm_kzalloc()
      panel/samsung-s6e3fa7: Use refcounted allocation in place of devm_kzalloc()
      panel/samsung-s6e3ha2: Use refcounted allocation in place of devm_kzalloc()
      panel/samsung-s6e3ha8: Use refcounted allocation in place of devm_kzalloc()
      panel/samsung-s6e63j0x03: Use refcounted allocation in place of devm_kzalloc()
      panel/s6e88a0-ams427ap24: Use refcounted allocation in place of devm_kzalloc()
      panel/samsung-s6e8aa0: Use refcounted allocation in place of devm_kzalloc()
      panel/samsung-sofef00: Use refcounted allocation in place of devm_kzalloc()
      panel/seiko-43wvf1g: Use refcounted allocation in place of devm_kzalloc()
      panel/sharp-ls037v7dw01: Use refcounted allocation in place of devm_kzalloc()
      panel/sharp-ls060t1sx01: Use refcounted allocation in place of devm_kzalloc()
      panel/sitronix-st7701: Use refcounted allocation in place of devm_kzalloc()
      panel/sitronix-st7703: Use refcounted allocation in place of devm_kzalloc()
      panel/sitronix-st7789v: Use refcounted allocation in place of devm_kzalloc()
      panel/sony-acx565akm: Use refcounted allocation in place of devm_kzalloc()
      panel/sony-td4353-jdi: Use refcounted allocation in place of devm_kzalloc()
      panel/truly-nt35521: Use refcounted allocation in place of devm_kzalloc()
      panel/panel-summit: Use refcounted allocation in place of devm_kzalloc()
      panel/synaptics-r63353: allocation in place of devm_kzalloc()
      panel/tpo-td028ttec1: Use refcounted allocation in place of devm_kzalloc()
      panel/tpo-td043mtea1: Use refcounted allocation in place of devm_kzalloc()
      panel/tpo-tpg110: Use refcounted allocation in place of devm_kzalloc()
      panel/visionox-r66451: Use refcounted allocation in place of devm_kzalloc()
      panel/visionox-rm69299: Use refcounted allocation in place of devm_kzalloc()
      panel/visionox-rm692e5.c: Use refcounted allocation in place of devm_kzalloc()
      panel/visionox-vtdr6130: Use refcounted allocation in place of devm_kzalloc()
      panel/widechips-ws2401: Use refcounted allocation in place of devm_kzalloc()
      panel/xinpeng-xpp055c272: Use refcounted allocation in place of devm_kzalloc()
      panel/s6e88a0-ams452ef01: Use refcounted allocation in place of devm_kzalloc()
      panel/nec-nl8048hl11: Use refcounted allocation in place of devm_kzalloc()
      panel/panel-lvds: Use refcounted allocation in place of devm_kzalloc()
      panel/lg-lb035q02: Use refcounted allocation in place of devm_kzalloc()

 drivers/gpu/drm/panel/panel-lg-lb035q02.c                | 10 ++++------
 drivers/gpu/drm/panel/panel-lvds.c                       | 12 +++++-------
 drivers/gpu/drm/panel/panel-nec-nl8048hl11.c             | 10 ++++------
 drivers/gpu/drm/panel/panel-orisetech-otm8009a.c         | 11 +++++------
 drivers/gpu/drm/panel/panel-raydium-rm67191.c            | 10 +++++-----
 drivers/gpu/drm/panel/panel-raydium-rm67200.c            | 11 +++++------
 drivers/gpu/drm/panel/panel-raydium-rm68200.c            | 11 +++++------
 drivers/gpu/drm/panel/panel-raydium-rm692e5.c            | 10 +++++-----
 drivers/gpu/drm/panel/panel-raydium-rm69380.c            | 10 +++++-----
 drivers/gpu/drm/panel/panel-ronbo-rb070d30.c             | 11 +++++------
 drivers/gpu/drm/panel/panel-samsung-ams581vf01.c         | 10 +++++-----
 drivers/gpu/drm/panel/panel-samsung-ams639rq08.c         | 10 +++++-----
 drivers/gpu/drm/panel/panel-samsung-atna33xc20.c         | 11 ++++++-----
 drivers/gpu/drm/panel/panel-samsung-db7430.c             | 11 +++++------
 drivers/gpu/drm/panel/panel-samsung-ld9040.c             | 11 +++++------
 drivers/gpu/drm/panel/panel-samsung-s6d16d0.c            | 11 +++++------
 drivers/gpu/drm/panel/panel-samsung-s6d27a1.c            | 11 +++++------
 drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c            | 10 +++++-----
 drivers/gpu/drm/panel/panel-samsung-s6e3fa7.c            | 10 +++++-----
 drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c            | 10 +++++-----
 drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c            | 10 +++++-----
 drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c         | 10 +++++-----
 drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c | 10 +++++-----
 drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams452ef01.c | 11 +++++------
 drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c            | 10 +++++-----
 drivers/gpu/drm/panel/panel-samsung-sofef00.c            | 11 +++++------
 drivers/gpu/drm/panel/panel-seiko-43wvf1g.c              | 11 +++++------
 drivers/gpu/drm/panel/panel-sharp-ls037v7dw01.c          | 10 ++++------
 drivers/gpu/drm/panel/panel-sharp-ls060t1sx01.c          | 11 +++++------
 drivers/gpu/drm/panel/panel-sitronix-st7701.c            |  8 ++++----
 drivers/gpu/drm/panel/panel-sitronix-st7703.c            | 11 +++++------
 drivers/gpu/drm/panel/panel-sitronix-st7789v.c           | 10 ++++------
 drivers/gpu/drm/panel/panel-sony-acx565akm.c             | 10 ++++------
 drivers/gpu/drm/panel/panel-sony-td4353-jdi.c            | 11 +++++------
 drivers/gpu/drm/panel/panel-sony-tulip-truly-nt35521.c   | 11 +++++------
 drivers/gpu/drm/panel/panel-summit.c                     | 10 +++++-----
 drivers/gpu/drm/panel/panel-synaptics-r63353.c           | 11 +++++------
 drivers/gpu/drm/panel/panel-tpo-td028ttec1.c             | 11 +++++------
 drivers/gpu/drm/panel/panel-tpo-td043mtea1.c             | 10 ++++------
 drivers/gpu/drm/panel/panel-tpo-tpg110.c                 | 11 +++++------
 drivers/gpu/drm/panel/panel-visionox-r66451.c            |  9 +++++----
 drivers/gpu/drm/panel/panel-visionox-rm69299.c           | 10 +++++-----
 drivers/gpu/drm/panel/panel-visionox-rm692e5.c           | 10 +++++-----
 drivers/gpu/drm/panel/panel-visionox-vtdr6130.c          | 11 +++++------
 drivers/gpu/drm/panel/panel-widechips-ws2401.c           | 11 +++++------
 drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c         | 10 ++++------
 46 files changed, 223 insertions(+), 257 deletions(-)
---
base-commit: ef818481d9fbaf3483dde0d1faa565a016810de3
change-id: 20250402-b4-drm_panel_mass_driver_convert_part3-9b06bf9d3b22

Best regards,
-- 
Anusha Srivatsa <asrivats@redhat.com>

