Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9899B0A71B
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 17:26:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85AD810E9E7;
	Fri, 18 Jul 2025 15:26:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="O4fRasD/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D0B910E9E7
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 15:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752852361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=npCFIvZD4nMWjQXunqvyJqz1L5WC/Eqwb8hbhzpP2gU=;
 b=O4fRasD/1Xz2lt8C2A8If7i52i4W+IRrH/1DO64+A9KjIg1yM0/YfcQYdA5yPnXAxSq4Q1
 WTUzO72uwLaH/waCPMlZELkAK4rv6pKjE+fnjVt/NH7Eilw8+N3Ja8HSCoPq8aluTXZRPn
 oqWMnlIXF2fhuigABTbKUA59/62Ur+0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-544-Rh9MyElKMFeNnn1xvKTYzw-1; Fri, 18 Jul 2025 11:25:59 -0400
X-MC-Unique: Rh9MyElKMFeNnn1xvKTYzw-1
X-Mimecast-MFC-AGG-ID: Rh9MyElKMFeNnn1xvKTYzw_1752852358
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-455ea9cb0beso17160825e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 08:25:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752852357; x=1753457157;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=npCFIvZD4nMWjQXunqvyJqz1L5WC/Eqwb8hbhzpP2gU=;
 b=l1s7SXJgUbvQjOggl7Q1sgUD3gb8BcFw3gO3Or/LRSyFr/h1y9EuVb66ozNYc3qyW0
 glaYePfLkRyE/2KliRiGGvoKsHveDjFu+ey+SLt2lJYA4FGzzqcfJv0xQVgxlMywmOat
 D0jSr49LPo7xdh5secvEZHPj8fbnJ7/P4HF98A+4ZX1KUc3EwZlmwYacHz2RhfvbhCaH
 KPG1OF48h+NEOyrnSuHZNQ1BKALf2k3SrX7x4KWMbx4tu1QKaTYfde12V7LKlYqCyoPh
 wgvKkGaUv50qyNkc0ZIKMB4ISNIVlSkwNWILD+wwxAA/opylDmBF1yJzQGVqdgMku/tp
 y2iQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWl48S+7K9CDjlCGEmvRIe2UEWHTYR/8kTFf+wjsyJ3S/nuAUrGNmLSmHSmuQBALeb6vQ9tSeps6X0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxku0j8l8aVwI3EmB598ZIjh7g7PBuEQg7DqwraJzIvzSCivo5X
 k2BHsh7H2fdh91JHAYj5ysY7B29fUhoDjVsI2qpj085JQixLH/kLDsbxY/tR124fdGuhvOX5Dcy
 Zc2hzWPwtHkpvDrQhP+SXf7n6cOgYdQlu/nRb2LTq7gIaT4Wf9f8HTLV3DEz13EGmrvZndg==
X-Gm-Gg: ASbGncvsrVHk+D/A1Fo9ygKHPDz19x/60Ak2waZ2T5oBVvHz1lJEWYQbmNPWwsWqrOo
 UQCa+rNgtIZRsNyCMWfkVJC9H2enGeGjOcy+bg+BbFZIIUBj13vF7bbhX/0/EbZaV3p8bYcTzrR
 z6+VVeJvuKK4IT8mvtWZT2/hxdVCi9zfU3AZhaS84feTzysZ71MTE9gu9j8p9E4DknvH2we/wMm
 +qN/P3kYz7DtyxpoY0DulpFJ4sx+NgXi7lDWd+pxR3ysI5SyHeLmXnvdTwHBQtOZm1UnW7CCBrq
 8fryFeDJkYnltn/o5IKxDIbFbzBhAlLN
X-Received: by 2002:a05:600c:c10e:b0:441:b3eb:574e with SMTP id
 5b1f17b1804b1-4562e4f7a2emr88271595e9.5.1752852357362; 
 Fri, 18 Jul 2025 08:25:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDkDLlJBAwSABB8zF2zjkkMCkRRimlqeCwb5StQrZV+3hZCcSeEWzuXZzFurWyDVRxxz5NOg==
X-Received: by 2002:a05:600c:c10e:b0:441:b3eb:574e with SMTP id
 5b1f17b1804b1-4562e4f7a2emr88271295e9.5.1752852356884; 
 Fri, 18 Jul 2025 08:25:56 -0700 (PDT)
Received: from localhost ([89.128.88.54]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4562e819e04sm82639785e9.18.2025.07.18.08.25.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jul 2025 08:25:56 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 kernel test robot <lkp@intel.com>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/sitronix/st7571-i2c: Make st7571_panel_data variables
 static const
Date: Fri, 18 Jul 2025 17:25:25 +0200
Message-ID: <20250718152534.729770-1-javierm@redhat.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Ifw1utnEWrdLRL-q5A6Ev2Lx_01SEBV4QCrdYJrW6fI_1752852358
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
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

The kernel test robot reported that sparse gives the following warnings:

make C=2 M=drivers/gpu/drm/sitronix/
  CC [M]  st7571-i2c.o
  CHECK   st7571-i2c.c
st7571-i2c.c:1027:26: warning: symbol 'st7567_config' was not declared. Should it be static?
st7571-i2c.c:1039:26: warning: symbol 'st7571_config' was not declared. Should it be static?
  MODPOST Module.symvers
  LD [M]  st7571-i2c.ko

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202507180503.nfyD9uRv-lkp@intel.com
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

Changes in v2:
- Also make the st7571_panel_data variables to be const (Thomas Zimmermann).

 drivers/gpu/drm/sitronix/st7571-i2c.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/sitronix/st7571-i2c.c b/drivers/gpu/drm/sitronix/st7571-i2c.c
index 453eb7e045e5..dda99cbe5372 100644
--- a/drivers/gpu/drm/sitronix/st7571-i2c.c
+++ b/drivers/gpu/drm/sitronix/st7571-i2c.c
@@ -1024,7 +1024,7 @@ static void st7571_remove(struct i2c_client *client)
 	drm_dev_unplug(&st7571->dev);
 }
 
-struct st7571_panel_data st7567_config = {
+static const struct st7571_panel_data st7567_config = {
 	.init = st7567_lcd_init,
 	.parse_dt = st7567_parse_dt,
 	.constraints = {
@@ -1036,7 +1036,7 @@ struct st7571_panel_data st7567_config = {
 	},
 };
 
-struct st7571_panel_data st7571_config = {
+static const struct st7571_panel_data st7571_config = {
 	.init = st7571_lcd_init,
 	.parse_dt = st7571_parse_dt,
 	.constraints = {
-- 
2.49.0

base-commit: a55863ba4c9ea9febe81ecf7dba36e7989a37b7e
branch: drm-misc-next

