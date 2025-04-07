Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F73A7D757
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 10:14:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15F6D10E3AC;
	Mon,  7 Apr 2025 08:14:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BpqOY6Xs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC30210E3A7
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Apr 2025 08:14:48 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4394a823036so36791305e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Apr 2025 01:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744013687; x=1744618487; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zIdjBnojDe9JlRJkQtXkq6PiLeEhZjPQxZt/O+Cfesg=;
 b=BpqOY6Xs2H4dKeH47+hcywMBOH3eZ8ZwV5XZqZZRpTGebw4o0ly7t8tu8UogWue4Vj
 w+aEsP5Z+jwqklyV9QicLkWDqxdiIjuqTPjKutEmvZJeXPB3YpMMx0SDE0WYXU5xmsWX
 Wjyd7B5bqZEp7dFfYRnvKWl9uasb8L7gfKpu1M9Y/Kt7Mr92qOOy3MrnhU743Rt4FONA
 M8AxsUmu87Vk1X4H5w/0WlMbQ2Bh+70akrktLqDuvL/7ZwFYwBqp7Ljm4RJHe6BI+PNw
 K420ulLDwOxCkfmtjS53TZDF0SlkwZI2F2E8gxMovRDMplIV6xfc8Sy9JUnQrPL5J3NH
 VZfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744013687; x=1744618487;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zIdjBnojDe9JlRJkQtXkq6PiLeEhZjPQxZt/O+Cfesg=;
 b=QsRBUOVKAjmMuWcDkLx6WxIcJjBT8t2lyuev+/fgyUIUXMIGrJsCmexeac9y2ZX43c
 y9KOSObjXNTTqtdgS3734KvGcpYqu0p1qtpu8XjFT1TfH05VbtqKfY36/Yds36XMnZXr
 igmWya5gk5hiOKx2fq3DN8iTTF1ICcfjF0rdwH4xEXUtesjpZor+3ue1UghyFJ3/xx8m
 w3QKo+Qd2SwYu6SoghlcQEVLyxzgGFLdHpb6jB3AVpqhCebn0uD3Vw5K5/uKxJ1GtI+e
 HATX5c1vbsOSs6S+H09aQEM8qgd5gghJHVII5jI78BeZ46dAiuL977IK3sj2LsT1kOtX
 fagA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSLNgMtZKyNP3+meZW3Z/oCO7Fb+MLpH/46HVNN7QUmEs4dAkbxi4WALv4hwZRdIaTrjEpBOzUYvM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywk6Fk84fNL96iI2S7S4H6kksr7WZ+J8zjUy0cc4Xsi1y+whqq6
 YmAVstHX/tOrXIxWDR7JL5btbbacurvMAWfSL9gffWsmILcydlEnLdiBcQ==
X-Gm-Gg: ASbGncu6bH3bqFwWcsDZRBIRfBNyVDEbBIsHFU/1vWcfqFOV5wIlJdIiAUBneZ6ezRW
 OPf9167BspU+EaNfmCPncOglBncuDy6ZG5fBFHuTF/2gzIPxe3aEHGABed7MK7fJgyt2BAGL7gS
 EZwUGAvg12kANsHJTmsfepNfNJG5I8p7NdZKLpscUI+e23Mku2pN1evy0DNl4RlS4Gv9fCSX4yB
 RGFzHLU0RZORvkdYKiTLmHnvoJvrDlWvhGax0ma6S/DNzffIMwViNTmftczXfsu+Nj+FV34ea0v
 D8W0lj5fax+F83Q3qiP6Aygx8mSWBKpU8oRoY/Ukrrx9
X-Google-Smtp-Source: AGHT+IFEC5GG2+hUc2x3gBJXtIb381aGws3rfz4/kdhZc+Tli1KoK5wHEcldern7+kcj8ZfKsinmig==
X-Received: by 2002:a05:600c:3d0c:b0:43b:c284:5bc2 with SMTP id
 5b1f17b1804b1-43ee047ca70mr75672455e9.0.1744013687392; 
 Mon, 07 Apr 2025 01:14:47 -0700 (PDT)
Received: from fedora.. ([94.73.34.87]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec16a3aefsm125473445e9.21.2025.04.07.01.14.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Apr 2025 01:14:46 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v4 12/16] drm/vkms: Allow to configure the default device
 creation
Date: Mon,  7 Apr 2025 10:14:21 +0200
Message-ID: <20250407081425.6420-13-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250407081425.6420-1-jose.exposito89@gmail.com>
References: <20250407081425.6420-1-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a new module param to allow to create or not the default VKMS
instance. Useful when combined with configfs to avoid having additional
VKMS instances.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_drv.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 5bcfbcb6c0c5..b4ed19c97576 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -50,6 +50,10 @@ static bool enable_overlay;
 module_param_named(enable_overlay, enable_overlay, bool, 0444);
 MODULE_PARM_DESC(enable_overlay, "Enable/Disable overlay support");
 
+static bool create_default_dev = true;
+module_param_named(create_default_dev, create_default_dev, bool, 0444);
+MODULE_PARM_DESC(create_default_dev, "Create or not the default VKMS device");
+
 DEFINE_DRM_GEM_FOPS(vkms_driver_fops);
 
 static void vkms_atomic_commit_tail(struct drm_atomic_state *old_state)
@@ -219,6 +223,9 @@ static int __init vkms_init(void)
 	if (ret)
 		return ret;
 
+	if (!create_default_dev)
+		return 0;
+
 	config = vkms_config_default_create(enable_cursor, enable_writeback, enable_overlay);
 	if (IS_ERR(config))
 		return PTR_ERR(config);
-- 
2.48.1

