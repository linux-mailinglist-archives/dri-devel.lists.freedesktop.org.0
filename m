Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1E442317B
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 22:17:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B6A36EC36;
	Tue,  5 Oct 2021 20:17:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB9866EC36
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Oct 2021 20:17:18 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id l7so307021qkk.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Oct 2021 13:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eQmPLWNW1IY5/Dg8Jm1l2vIuP9swkD1cu5LVox+VT4I=;
 b=PNG/pldsxqYbC9oCx2hEVKGUetySKmV/9Gw5YTbs6ImYpuZV8+B9ivdI7fNC+s7is6
 dkgUaOx4eJ6MENUZXVL1c1AWcx/FnzYqboM8ukXUWAHJ6lwM+Z881ND/uzP6cyD8ndsh
 ZPQUWSvztxr7OLcpPsncd35F5J3pib9WxpQteQt1cfRpuLgeyx0gJLRQlZNU699J51j2
 iCjjM8mZS3vJzwaN3ciThL/MMQ3KpdvM0gjEjMi+86Kh2O20GigaX11Lwbr6guwONYJ2
 HsXAbZbcRJGj8RMFUVyHEpqgnSmNxdZks0TideI1PWkfNGQqukuKVmg23OAvUotkiHV0
 8VlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eQmPLWNW1IY5/Dg8Jm1l2vIuP9swkD1cu5LVox+VT4I=;
 b=CDAcFddaZErXaxR2pSX5pNawJ7zMkV+RS7K5JOYTswUMao0eHRAQYj6ScTr6XAc+OH
 XvVrWjUEjTll+k4xfxzwrRHQOSYgreEB6fMBS4yR61KDZRntcEKiB2+/R1FNs/+l/d8z
 UZecM8KX4HWuzVd+bC/ha7/XMTJF4mYTUf5Chxf4NVs0C/ijmVVeNtAPk38T0HFVj4G0
 2J0fHywzAMZHFR27MnR8q16NM9FBSrNg88ZcTjHcrOP3XMOF/+QBWAt6ahKFKcKSNaCS
 D9te3ZK7aCCU+6V9QoC+ex1XwvvEPIOlpFiQH3XtCuXaMaeKpfMtoUK8FMEqJRqoXaci
 TJcA==
X-Gm-Message-State: AOAM530W7u/S43SLaHZEEji+8SEwjugtQlsQriJfTYZuwmpMCSry0XhI
 lcOZjCyHMzdXOganfTBodQA=
X-Google-Smtp-Source: ABdhPJyS7pMg5Ied1Xw4G/llYOv2jaR5rl91JrAI1AzrWW/achNjVkFSaUGyiz7TZ/j3+ASMPZdgdA==
X-Received: by 2002:a05:620a:49d:: with SMTP id
 29mr16626521qkr.518.1633465037876; 
 Tue, 05 Oct 2021 13:17:17 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:125:9b98::1007])
 by smtp.googlemail.com with ESMTPSA id j2sm13056905qta.84.2021.10.05.13.17.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 13:17:17 -0700 (PDT)
From: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
To: rodrigosiqueiramelo@gmail.com,
	melissa.srw@gmail.com
Cc: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>,
 hamohammed.sa@gmail.com, daniel@ffwll.ch, airlied@linux.ie,
 contact@emersion.fr, leandro.ribeiro@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lkcamp@lists.libreplanetbr.org
Subject: [PATCH 1/6] drm: vkms: Replace the deprecated drm_mode_config_init
Date: Tue,  5 Oct 2021 17:16:32 -0300
Message-Id: <20211005201637.58563-2-igormtorrente@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211005201637.58563-1-igormtorrente@gmail.com>
References: <20211005201637.58563-1-igormtorrente@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The `drm_mode_config_init` was deprecated since c3b790e commit, and it's
being replaced by the `drmm_mode_config_init`.

Signed-off-by: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_drv.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 0ffe5f0e33f7..828868920494 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -140,8 +140,11 @@ static const struct drm_mode_config_helper_funcs vkms_mode_config_helpers = {
 static int vkms_modeset_init(struct vkms_device *vkmsdev)
 {
 	struct drm_device *dev = &vkmsdev->drm;
+	int ret = drmm_mode_config_init(dev);
+
+	if (ret < 0)
+		return ret;
 
-	drm_mode_config_init(dev);
 	dev->mode_config.funcs = &vkms_mode_funcs;
 	dev->mode_config.min_width = XRES_MIN;
 	dev->mode_config.min_height = YRES_MIN;
-- 
2.30.2

