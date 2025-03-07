Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7E7A56DD5
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 17:34:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 315ED10EBF8;
	Fri,  7 Mar 2025 16:34:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KG/8SCSH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F12810EBF4
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 16:34:17 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4394a823036so17585465e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Mar 2025 08:34:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741365255; x=1741970055; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zIdjBnojDe9JlRJkQtXkq6PiLeEhZjPQxZt/O+Cfesg=;
 b=KG/8SCSHe9fPwNPUIGPVkUGU7ajWzwmCws4huvVN5dni7FCO9EEp8TCrRg+0UwWs3l
 KrmbN354AcowCAe4XbK5anG+WQL1hqLoStfj4+U8Glir11Z3WDQ3XdcVW1WYJhMF2m6s
 D+H+Aje7a1bgZq2/tIzZRdj8fFRaBblnVQ2G1Mlb8J3nAZ7lFyI4IeBTpIt+otCzNT+c
 +KrVRyHu0Da+ub+DJenxyUMnvnUnH4L6l9xFBvu9a2k9jrbCDTtbKUFHsc3ocnMU5veV
 Kw9Ua2DGbIvzIjeyM32q9bPpdVSjfheURvrkKeVGMUiVuRdBNZMojMDr9e98qwYnSNsm
 RCsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741365255; x=1741970055;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zIdjBnojDe9JlRJkQtXkq6PiLeEhZjPQxZt/O+Cfesg=;
 b=WzJgTlFI4isdqP3GIEZW6gMitvNndR7trT4dsZ4KcqU7aN0AgIdKjyQUw9SxkKNgvd
 LrkPeOhqCnLp7MJ10ISu8Fh/+g4OQUaDNrATSflzDIPQrmg9mUAPh/ACy0EYFGhCehvJ
 HtzEU+5bltFRJEmRpmZYxGzdlfYy1eKg6mRc1LKj7VEAD5i+ML8xss4r8+pH/w1NSZ+q
 Z9/t/lUha217V6uimYZd2UQSMDQzoK5aZevuWGeS60ZydyWuT2bouwGCrca85XYUQsw7
 EpTMtiRtM1ECzy0Xt1vFdgJUKg9RfWQUO0ggWURF+nejctHoluha8IUEd0joGBYtNUMO
 zXqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXt6X5SUCnk7Scxv+7i1TftMTaXbi4teYv5q3Bz3xadV5BBSbpom0NUn7YbLn1sJvQAakKujD0Jwc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxB0Tis9TmDBYPJvfukT6/AJZ3Asb/1ApgYgCnFzIZw4kKjAoQa
 M4u9pUdBaInKh/klTib2p6JHJXlgBi58P1yZ1I6t7q3eb5ZjZvR7
X-Gm-Gg: ASbGncuhsdBKd/X84t0eIgRT7HqGPdkMqYqaldxjBeUzWcR9sZejdmjIx/Ums7vRsb+
 n9+oM+P2apH2y8juiRevSRK9UKKNf2kJSBOHmAqtehz3KUSww6VxP8uyepflfO8PovtkeztKZKq
 Lhh3jED0Dv0xxzPIHrEAA2CzNS5NetTj8wUtw57LjQPpByn8pNiyblFVD8Ew76h4veDgiFcDjUQ
 ATeR9ck+sMTLxE6bRlo7I3b5/mncDM1sW5S5dOERFB0gmcwlReVQ9nArsC1IyNJKpzr+udJd0+W
 hf1gDsV8Jr9lgtFqZDJ4c6rFLuZp+swkQnqK3Q0hanBOVxU=
X-Google-Smtp-Source: AGHT+IEwPvhouBA6vZMQodw9FQoUs0STHqGK32YOVJMT04SsOqUtTVNTysfRc3/xVYG7647HWWzuxg==
X-Received: by 2002:a05:6000:1846:b0:390:f6be:af1d with SMTP id
 ffacd0b85a97d-39132d98ae2mr2659989f8f.41.1741365255560; 
 Fri, 07 Mar 2025 08:34:15 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912c019557sm6031436f8f.50.2025.03.07.08.34.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Mar 2025 08:34:14 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v3 12/16] drm/vkms: Allow to configure the default device
 creation
Date: Fri,  7 Mar 2025 17:33:49 +0100
Message-ID: <20250307163353.5896-13-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250307163353.5896-1-jose.exposito89@gmail.com>
References: <20250307163353.5896-1-jose.exposito89@gmail.com>
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

