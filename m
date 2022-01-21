Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8B4496760
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jan 2022 22:39:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98B1D10E43F;
	Fri, 21 Jan 2022 21:39:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com
 [IPv6:2607:f8b0:4864:20::92a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 084DE10E43F
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jan 2022 21:39:06 +0000 (UTC)
Received: by mail-ua1-x92a.google.com with SMTP id p1so19203882uap.9
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jan 2022 13:39:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fxiHRCnllaybcwK9h+/yyyprDNL6BwxhTWyTaAvat5Q=;
 b=SYF5Cg0YexwpDZb+NuA9S6HouQNPbWnYUhYICHtiLCJdOSyOF4tUczdfExHe94Odf6
 hiQv0aH8kb9kp8sClaQMm0iWNkRfRWyS0RGnTbDezsXPfxib9OSSEJdN+OQnVcWG6vP5
 K+8QW/R0poQXaio94i1rQalCI8wMP+40gYy2csQ+TU3B8qFo4r6L4tFjbiv3WYwhZwT5
 tzns7d6O3UfMkK+MWDB7DTgmSZkbYYXsKS6rwtUW340cC9yIpOyYdG7x4+MVR8bqwoAB
 xBbXQ5R7B6PdNN/E3x7AHTwyAvAlY372yY1jDS0wseUseHHfcWzSUIJBxisjUvejJrfS
 TjRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fxiHRCnllaybcwK9h+/yyyprDNL6BwxhTWyTaAvat5Q=;
 b=0Qx+Swy2vCHeESz0nPTuE3Y2Limbdw4x43bZc0gMko+5nkePTM5yRvGsqD66Vz8JB2
 CJVx4WSCT07Pd1oiKwDIO66c2eFgI9u6YcBJA/lvVVGWRYaOVdjInVT/0yXfoDZCC98F
 Si2DvHErZVD/DzPN64o0OPfCJ9ZNj8twHh9CNVOZdZ06QPa72c0stwAhaAFUPdDw5hhh
 sAP4rv0FeeqNoA2PLKNZHQD/cGNTEUI/iuXcaTRACNDr805QXeoJupwISCAeae8ZlMrg
 B8TcQcy2cJUVy0tfi6DZa5P4C3YaW6TnUG0NKfrMgs8HqRehzlX1KUvvXZhr9sAYq3D+
 ZnSw==
X-Gm-Message-State: AOAM533dOHuD5PGRQhfrn/RjmocDwhoayr2gcxQfXC2vrVeB1KMS5BiR
 K/3vH8UTxOZ+hSau/XSkT7I=
X-Google-Smtp-Source: ABdhPJz0+tXPoage9b7IjCnwYJloTTA8uW3mnWqf2JNkYGGQpByAyI2WkLr4/rNSA2SRAE6ZEtKuuA==
X-Received: by 2002:a67:dd15:: with SMTP id y21mr2572474vsj.84.1642801145160; 
 Fri, 21 Jan 2022 13:39:05 -0800 (PST)
Received: from localhost.localdomain ([2804:431:c7f4:2d80:9427:7267:dbaf:8ccf])
 by smtp.googlemail.com with ESMTPSA id 29sm1633844vki.25.2022.01.21.13.39.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 13:39:04 -0800 (PST)
From: Igor Torrente <igormtorrente@gmail.com>
To: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com, ppaalanen@gmail.com,
 tzimmermann@suse.de
Subject: [PATCH v4 1/9] drm: vkms: Replace the deprecated drm_mode_config_init
Date: Fri, 21 Jan 2022 18:38:23 -0300
Message-Id: <20220121213831.47229-2-igormtorrente@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220121213831.47229-1-igormtorrente@gmail.com>
References: <20220121213831.47229-1-igormtorrente@gmail.com>
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
Cc: hamohammed.sa@gmail.com, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 ~lkcamp/patches@lists.sr.ht, Igor Torrente <igormtorrente@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

`drm_mode_config_init` is deprecated since commit c3b790ea07a1 ("drm: Manage
drm_mode_config_init with drmm_") in favor of `drmm_mode_config_init`. Update
the former to the latter.

Signed-off-by: Igor Torrente <igormtorrente@gmail.com>
---
V2: Change the code style(Thomas Zimmermann).

V4: Update the commit message(Nícolas F. R. A. Prado)
---
 drivers/gpu/drm/vkms/vkms_drv.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 0ffe5f0e33f7..ee4d96dabe19 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -140,8 +140,12 @@ static const struct drm_mode_config_helper_funcs vkms_mode_config_helpers = {
 static int vkms_modeset_init(struct vkms_device *vkmsdev)
 {
 	struct drm_device *dev = &vkmsdev->drm;
+	int ret;
+
+	ret = drmm_mode_config_init(dev);
+	if (ret < 0)
+		return ret;
 
-	drm_mode_config_init(dev);
 	dev->mode_config.funcs = &vkms_mode_funcs;
 	dev->mode_config.min_width = XRES_MIN;
 	dev->mode_config.min_height = YRES_MIN;
-- 
2.30.2

