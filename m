Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CA27A9D28
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 21:29:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADE8F10E601;
	Thu, 21 Sep 2023 19:29:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4511C10E5FB
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 19:28:45 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1bf55a81eeaso11223815ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 12:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1695324524; x=1695929324;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SjE9g39gnCCj7j/VSb42AYR6J5acTdAldxrB9mluCQs=;
 b=UG++Og2T9y9WiyVf4dlnIO6nv0Ojv6OBNJiyLj2csAflhRwCEukdZhnrxFn6RYhiYi
 eFlH+RzFyDbLq1ikk1HOXBZCBg6JTtRYg0jEaTSniq3mocvipgkVbNmvG/m71UFPAzPA
 kJ6oFnX4+mTLOamWUvS54xau/1ke6p4ghTPyU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695324524; x=1695929324;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SjE9g39gnCCj7j/VSb42AYR6J5acTdAldxrB9mluCQs=;
 b=KKQ8Gk0ndrxP2/DvJ/oqgC33crFksVhDuEGn8byuppoqTNKc7ABU+6kLeyRD0uTdZr
 jhWgmxE57ytxJo5mr0oz9rE9X/vg8aAARzRuW4JboHeDhQapOkDf23Q729ZmI0ErB24Q
 znelgFQ/ixon+yTXC5HhJ0gbvSf0tqiR2weGa2r2KSpa3vFGGMoZ2da55bvEwAiaWG6g
 EvBkoEtKLiL4favgXJoAHazuQfT7nhyR+Bq4iA/Brf3MVQQ5POjSLcciJs6kSNt98yX6
 NRGQO+Cmyzgvj/J+pRJFThjaw2wqaJl6Ih9LhkZZhMJ7DGttSlecTV1xA++Ie4K8+StQ
 lOTw==
X-Gm-Message-State: AOJu0YwkqO7MKoV5ZTEJ/NPyN1FtmRE+3/WUd4omUqlwgzeJ+QiojqHt
 AGmHJFVLflPIg/7IfYx3x6tLyLRhHw3ArELA/xwVpOlV
X-Google-Smtp-Source: AGHT+IGaL8Xuy7USK74rcVfJD2FYDrURYbnbnv1NxMU2yTzdabxZ6fmTke9TgpsR322JBCoPZAOITQ==
X-Received: by 2002:a17:902:d491:b0:1c3:8230:30d8 with SMTP id
 c17-20020a170902d49100b001c3823030d8mr7671409plg.38.1695324524060; 
 Thu, 21 Sep 2023 12:28:44 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:e6ed:6d49:f262:8041])
 by smtp.gmail.com with ESMTPSA id
 w8-20020a1709029a8800b001b9f032bb3dsm1892875plp.3.2023.09.21.12.28.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Sep 2023 12:28:42 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Subject: [RFT PATCH v2 10/12] drm/gma500: Call drm_helper_force_disable_all()
 at shutdown/remove time
Date: Thu, 21 Sep 2023 12:26:53 -0700
Message-ID: <20230921122641.RFT.v2.10.I1be622999c3b23f28f077fc75bb0319396a216e9@changeid>
X-Mailer: git-send-email 2.42.0.515.g380fc7ccd1-goog
In-Reply-To: <20230921192749.1542462-1-dianders@chromium.org>
References: <20230921192749.1542462-1-dianders@chromium.org>
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
Cc: Douglas Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Based on grepping through the source code, this driver appears to be
missing a call to drm_atomic_helper_shutdown(), or in this case the
non-atomic equivalent drm_helper_force_disable_all(), at system
shutdown time and at driver remove time. This is important because
drm_helper_force_disable_all() will cause panels to get disabled
cleanly which may be important for their power sequencing. Future
changes will remove any custom powering off in individual panel
drivers so the DRM drivers need to start getting this right.

The fact that we should call drm_atomic_helper_shutdown(), or in this
case the non-atomic equivalent drm_helper_force_disable_all(), in the
case of OS shutdown/restart comes straight out of the kernel doc
"driver instance overview" in drm_drv.c.

Suggested-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
This commit is only compile-time tested.

(no changes since v1)

 drivers/gpu/drm/gma500/psb_drv.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
index 8b64f61ffaf9..a5a399bbe8f5 100644
--- a/drivers/gpu/drm/gma500/psb_drv.c
+++ b/drivers/gpu/drm/gma500/psb_drv.c
@@ -20,6 +20,7 @@
 #include <acpi/video.h>
 
 #include <drm/drm.h>
+#include <drm/drm_crtc_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
 #include <drm/drm_ioctl.h>
@@ -485,6 +486,12 @@ static void psb_pci_remove(struct pci_dev *pdev)
 	struct drm_device *dev = pci_get_drvdata(pdev);
 
 	drm_dev_unregister(dev);
+	drm_helper_force_disable_all(dev);
+}
+
+static void psb_pci_shutdown(struct pci_dev *pdev)
+{
+	drm_helper_force_disable_all(pci_get_drvdata(pdev));
 }
 
 static DEFINE_RUNTIME_DEV_PM_OPS(psb_pm_ops, gma_power_suspend, gma_power_resume, NULL);
@@ -521,6 +528,7 @@ static struct pci_driver psb_pci_driver = {
 	.id_table = pciidlist,
 	.probe = psb_pci_probe,
 	.remove = psb_pci_remove,
+	.shutdown = psb_pci_shutdown,
 	.driver.pm = &psb_pm_ops,
 };
 
-- 
2.42.0.515.g380fc7ccd1-goog

