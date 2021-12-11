Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 163414719D5
	for <lists+dri-devel@lfdr.de>; Sun, 12 Dec 2021 12:40:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18BF010E735;
	Sun, 12 Dec 2021 11:40:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DB5E10E297
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Dec 2021 14:50:07 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 w33-20020a17090a6ba400b001a722a06212so9908500pjj.0
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Dec 2021 06:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=Pn3ZNHAbrFAUG3+9tRrD8FUh+HGvY/p1TctxGzM5QjU=;
 b=ncT1CNwAjuA1Puzp9g5CTKeAWNiwxpjquYkFQYSykIcrwI0BmIrKhc5rv+ltSl37pp
 VORjz+PVSGB0ArJ6bfJDmwdIvQb+yRlJOV6h8kb7cJhK+9YU+ol7zMxESUCWjiWP4Not
 UB9MNBauC4vma3Ml17cPlemZZEwhA/VdSF+b3KQHzVulIBn+11Fb4ydrHcSYUZAYZxd4
 G7j2W+VFRYCSgYAFHaORYfLa95L0/9paUIJbLV0Rvb5NVW8OchohqD2q3PJvrNUzDo3f
 UrpE0vVuodBb/3ozidkiRnMVYCy4jGUk/9QcV0ywdmZd/i2Ywlx4+9ias/I2DLSG/Ujj
 t9Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Pn3ZNHAbrFAUG3+9tRrD8FUh+HGvY/p1TctxGzM5QjU=;
 b=0uQSRQGhqJ11BAclA6PyAejPD+E+XW+j2scsVIZTZPTMVFN31SMkU+amY6bXICQOjn
 EE5qC3BjE3LDT1mFv6wCYmD3LjwZT1HiVwo3f2N1PmqcJL5jhhBZ+sv73bhw4T8Gkn6p
 3yZJ94W03bz6J5YECzpO74HKGztNJjfz/v2K5D3YyksDX7VkZwB2O78RREFMSFYKxPoo
 0Ci4tZlwy6fVreMMy4158zp72+uWF7kGH/n7kchJNTJjMCXJfWHH3QlkXwDRN2OrrdE3
 p2O9TqaNU4cgte+I7ZEcSmG3REBV+7q9WFY0Kj+8OeC/Z2HKXPqTXsEt5EV52rvtoq9d
 9arg==
X-Gm-Message-State: AOAM533Uw2d4RRD29H9+2+08Ls57K1XEqR7NL0facHTjX9jp019MQTUI
 E9WaHqEY7+mBWLHS2XpTyoY=
X-Google-Smtp-Source: ABdhPJwyPQTAjeOvEucKcjd3koaSPvfAUCnqdC0LWh3RvkUVHMCoBJfZAlV0Uka0+7EHgTg2b5QSuQ==
X-Received: by 2002:a17:902:c182:b0:148:699a:5147 with SMTP id
 d2-20020a170902c18200b00148699a5147mr14590148pld.61.1639234202602; 
 Sat, 11 Dec 2021 06:50:02 -0800 (PST)
Received: from localhost.localdomain ([159.226.95.43])
 by smtp.googlemail.com with ESMTPSA id u3sm7557852pfk.32.2021.12.11.06.50.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Dec 2021 06:50:02 -0800 (PST)
From: Miaoqian Lin <linmq006@gmail.com>
To: 
Subject: [PATCH] lib/genalloc: Fix NULL vs IS_ERR() checking
Date: Sat, 11 Dec 2021 14:49:56 +0000
Message-Id: <20211211144957.31381-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Sun, 12 Dec 2021 11:40:36 +0000
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
Cc: linmq006@gmail.com, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The devm_gen_pool_create() function does not return NULL. It
returns error pointers.

Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/gpu/drm/vboxvideo/vbox_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vboxvideo/vbox_main.c b/drivers/gpu/drm/vboxvideo/vbox_main.c
index f28779715ccd..c9e8b3a63c62 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_main.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_main.c
@@ -127,8 +127,8 @@ int vbox_hw_init(struct vbox_private *vbox)
 	/* Create guest-heap mem-pool use 2^4 = 16 byte chunks */
 	vbox->guest_pool = devm_gen_pool_create(vbox->ddev.dev, 4, -1,
 						"vboxvideo-accel");
-	if (!vbox->guest_pool)
-		return -ENOMEM;
+	if (IS_ERR(vbox->guest_pool))
+		return PTR_ERR(vbox->guest_pool);
 
 	ret = gen_pool_add_virt(vbox->guest_pool,
 				(unsigned long)vbox->guest_heap,
-- 
2.17.1

