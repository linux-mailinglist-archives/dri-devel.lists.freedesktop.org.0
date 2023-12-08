Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F085D80AA1C
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 18:09:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 346CC10E285;
	Fri,  8 Dec 2023 17:09:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 746DB10E285
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 17:09:00 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40c19467a63so25976655e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Dec 2023 09:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702055339; x=1702660139; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XVyGqXIqWznKFmI6wLzi11NM/yRQinuNhq1yEIojuaw=;
 b=hpDHxyjMJ+oJWJk2PeEnSPr49zalC77IAbzgjc3zrIx/+ryeQRX74rsH5ya9MSfGRT
 XKu8LKUQZWF0wu3vst8yGIkZtBi2TSdmWD8/rfPnum+DhAqXCqa8Vaug4Lup7RzIuXQB
 lTg3+HIUSh/SuO/cK/lI5a89epSvP3PObyuZ+ZXxCIAxTsP0cdVekBQOrA1/szNsM972
 Rsbe8fk8riIprh0r/88j8B4P1IzKZa3Y6CfUEXcRcZIvpvKSdFITmOZwINrqKrUD0b1q
 B3ZigiXnSBz34dMGVs0jNVEnj6shS9DrDbXsXeKhd4sCLUCnzUBHJsfYf1IeK6PtjKoO
 fXvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702055339; x=1702660139;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XVyGqXIqWznKFmI6wLzi11NM/yRQinuNhq1yEIojuaw=;
 b=YrZzya1MjNK0nEm2RF79fawKZNsTLX3OaO+Oh95hykdelRnZEoF+5ZxyTriqgIdHGy
 9nJrB4LhzDjs8lW2MHgeoWLw0Qx8RIk9aYzUo0NeRPJcbeNS6TQRMmc5QhZCJXzEMkyA
 FQaw2cWHfWKDnj2EtqpstSv4szTAujZ2Btyr69im1PQXR5+GumYwoyc93fO94xCG9AF6
 fJm9HHqeXPwEN9yFR4Pl6+d/dV0921eqOSO/Ufh4IRDf63HyaFcQtysIzAoseLh7XETB
 JjKa2qOuRS8Q5LVC1PRWxo5nH77MrOtxc5kJIWJwihY713cgFnS0Ylto80S0pQqSsT0b
 o6uA==
X-Gm-Message-State: AOJu0Yx+HVHjiKNoGnnhKKYyE1a/v8Q1EaI7dl1tFhD7ukuWoWg5p1h3
 pYQM9B0STSqYiyLSYYBouQ==
X-Google-Smtp-Source: AGHT+IE5AVT05vxNckWOXAcQGAYW3iMc2rtK7qiOsXmsYrjU0zrcLWNRWjDXMEMGI2qhHoAf0Friiw==
X-Received: by 2002:a05:600c:1d15:b0:40b:5e21:ec49 with SMTP id
 l21-20020a05600c1d1500b0040b5e21ec49mr151241wms.123.1702055338662; 
 Fri, 08 Dec 2023 09:08:58 -0800 (PST)
Received: from U4.lan ([2a02:810b:f40:4300:79e9:c218:2514:2131])
 by smtp.gmail.com with ESMTPSA id
 z17-20020a5d44d1000000b003334a0513dbsm2421835wrr.67.2023.12.08.09.08.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Dec 2023 09:08:58 -0800 (PST)
From: Alex Bee <knaerzche@gmail.com>
To: Frank Binns <frank.binns@imgtec.com>,
 Donald Robson <donald.robson@imgtec.com>,
 Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] drm/imagination: vm: Fix heap lookup condition
Date: Fri,  8 Dec 2023 18:08:56 +0100
Message-ID: <20231208170856.1748413-1-knaerzche@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Sarah Walker <sarah.walker@imgtec.com>, Alex Bee <knaerzche@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When conditionally checking for heap existence of a certian address in
pvr_vm_bind_op_map_init the condition whether the map request comes from a
user is incorrect: The context must not be the kernel-context to be a
user(space) context and should be looked up in pvr_heaps.

That makes addresses coming from userspace not being verfied against the
defined ranges and prevents firmware loading for meta cores.

Fixes: ff5f643de0bf ("drm/imagination: Add GEM and VM related code")
Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 drivers/gpu/drm/imagination/pvr_vm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imagination/pvr_vm.c b/drivers/gpu/drm/imagination/pvr_vm.c
index f42345fbe4bf..82690cee978c 100644
--- a/drivers/gpu/drm/imagination/pvr_vm.c
+++ b/drivers/gpu/drm/imagination/pvr_vm.c
@@ -225,7 +225,7 @@ pvr_vm_bind_op_map_init(struct pvr_vm_bind_op *bind_op,
 			u64 device_addr, u64 size)
 {
 	struct drm_gem_object *obj = gem_from_pvr_gem(pvr_obj);
-	const bool is_user = vm_ctx == vm_ctx->pvr_dev->kernel_vm_ctx;
+	const bool is_user = vm_ctx != vm_ctx->pvr_dev->kernel_vm_ctx;
 	const u64 pvr_obj_size = pvr_gem_object_size(pvr_obj);
 	struct sg_table *sgt;
 	u64 offset_plus_size;
-- 
2.43.0

