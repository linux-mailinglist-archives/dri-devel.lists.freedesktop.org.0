Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3419502DA
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 12:51:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1404610E2E9;
	Tue, 13 Aug 2024 10:51:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AQnzdDZn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 688D910E2E9
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 10:51:42 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-530c2e5f4feso5419500e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 03:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723546300; x=1724151100; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lragSOY+WyXV5ZZ+AC/3nB1kh+DnIY/4SWizX87fSmc=;
 b=AQnzdDZnJ1XqSyA8j6/eGyK8KsLnRP57slNDbToz/XSMeOhEyBD2eO+lvFtVFUd7VJ
 /GHdVeRvDqSjNPvFgEpofZU1VdsotXfYegUq9WwMfrTyHh9kXChQp9kVLK+HC26ZrwKj
 brnX7B9TflLyhOZWQ6vzH5JpwoYkIyoi3g1qAZjiCE/Ac/qSxc1nO45/j/9ZiQkpj9y1
 kMHF761KkR4OPqrIYy0kqhUnCiU7qyC6qFdluoH7WXdGQJVmp3gjmz+YT5IiyhwNmhHH
 XUsnVCw0S6QPjc1gftz6bgY+KSUZlaQxWAWkV8Ka4ym5aH4oMV7rwKzNVdauUMNLnkwD
 zvIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723546300; x=1724151100;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lragSOY+WyXV5ZZ+AC/3nB1kh+DnIY/4SWizX87fSmc=;
 b=oMZTjNF47pMA8ZDsto1s88RudTAL3HnVvzsmL33dH07whCE8PFGyZwGqZwnt4WoRIr
 4Mihj2NZDtW/0ItN78tx/P5GHrttyRpsk2n1PxMYOIUNVzU75EAQ0TfTbVqmYT2mLcvl
 58S8KdIsZgsC+jYQ7LyVaU2I8TBShGLZTajH/Pkg9g0IOlxF5LoHFMMvXrFlBuIb8M+2
 9I3XYK8geBICvayVTvtr8wrG68dn1qRsTRtZxS975IyTK+G6uHin01ECezu43JxRiOkX
 W5RBX/wqkfTUU8codf9QvFxIdLM6p4oL4w6pCjGnCWQzhufk2EmwwyiUZzTjkyW+xKSA
 uOpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGATQkXAuHNrQl/iHiuQijvxEQ6Skfd7Hzo4heHjsNm+OXnoVkh9lfSlabD00qEhqmZvhQ/gojwT7LWTTsJVTkH6wR21F4L1hzvREMld6Z
X-Gm-Message-State: AOJu0Yw9B/qvbLm2mvTQqz81FiaMpYd8efbGRFLd3vrXABs3llj/LAR4
 gqokEnTmaYDJZ2iSAeX+g2S9HootdwJFmQ9IpAIgVxNZsAjPZEEL
X-Google-Smtp-Source: AGHT+IFBmBPHwR0QDHZKoVinyy3tTqQhhWg3jOVvvlJ/Sxvq5wNS2shu8jAtd2HItIOh+bOK6z5ezA==
X-Received: by 2002:a05:6512:10c6:b0:52e:95dd:a8ed with SMTP id
 2adb3069b0e04-532136613e6mr2058293e87.35.1723546300375; 
 Tue, 13 Aug 2024 03:51:40 -0700 (PDT)
Received: from fedora.. ([213.94.26.172]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429d877e066sm17290785e9.1.2024.08.13.03.51.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Aug 2024 03:51:40 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: rodrigosiqueiramelo@gmail.com
Cc: melissa.srw@gmail.com, mairacanal@riseup.net, hamohammed.sa@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [RFC PATCH 02/17] drm/vkms: Move default_config creation to its own
 function
Date: Tue, 13 Aug 2024 12:44:13 +0200
Message-ID: <20240813105134.17439-3-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240813105134.17439-1-jose.exposito89@gmail.com>
References: <20240813105134.17439-1-jose.exposito89@gmail.com>
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

Extract the initialization of the default configuration to a function.
Refactor, no functional changes.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_config.c | 17 +++++++++++++++++
 drivers/gpu/drm/vkms/vkms_config.h |  3 +++
 drivers/gpu/drm/vkms/vkms_drv.c    |  6 +-----
 3 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index c58eda76c238..4c7cda16dfd8 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -19,6 +19,23 @@ struct vkms_config *vkms_config_create(void)
 	return config;
 }
 
+struct vkms_config *vkms_config_default_create(bool enable_cursor,
+					       bool enable_writeback,
+					       bool enable_overlay)
+{
+	struct vkms_config *config;
+
+	config = vkms_config_create();
+	if (IS_ERR(config))
+		return config;
+
+	config->cursor = enable_cursor;
+	config->writeback = enable_writeback;
+	config->overlay = enable_overlay;
+
+	return config;
+}
+
 void vkms_config_destroy(struct vkms_config *config)
 {
 	kfree(config);
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index 65da8cd6ff96..83181760b02b 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -17,6 +17,9 @@ struct vkms_config {
 
 /* VKMS Config */
 struct vkms_config *vkms_config_create(void);
+struct vkms_config *vkms_config_default_create(bool enable_cursor,
+					       bool enable_writeback,
+					       bool enable_overlay);
 void vkms_config_destroy(struct vkms_config *config);
 
 /* DebugFS */
diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 6bf462985731..4e36989589f9 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -219,16 +219,12 @@ static int __init vkms_init(void)
 	int ret;
 	struct vkms_config *config;
 
-	config = vkms_config_create();
+	config = vkms_config_default_create(enable_cursor, enable_writeback, enable_overlay);
 	if (IS_ERR(config))
 		return PTR_ERR(config);
 
 	default_config = config;
 
-	config->cursor = enable_cursor;
-	config->writeback = enable_writeback;
-	config->overlay = enable_overlay;
-
 	ret = vkms_create(config);
 	if (ret)
 		vkms_config_destroy(config);
-- 
2.46.0

