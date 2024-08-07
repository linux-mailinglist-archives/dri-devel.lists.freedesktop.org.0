Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 418EB94ADB7
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 18:10:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56CEC10E182;
	Wed,  7 Aug 2024 16:10:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=mary.guillemard@collabora.com header.b="I34VHeWI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B89E10E181
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2024 16:10:00 +0000 (UTC)
Delivered-To: kernel@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1723046991; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=SrUZFIBqOlA9PjeP7JGaw6mBytuA1/g1tCQ9K0peS9/dlEEHXdqRkQ/ii/bTf2r4LyaWuK1OEd8gfwxmZBd1q8IureevQ9a3j6QBvng/vIt9xuQMPsB4ww+yHjbe/tm7/KgArXoAbHXJI2vxeuLFjoB0UzclmMf5kQgA1JYFeUM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1723046991;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=2tbs4O9jIOylAwaDXXbJssc8OYMauxjaFyRX4otVCrY=; 
 b=IASfVySzRLPwcobFwcI74x1POBZJoAggtH1RcuAMPGdmlIxvBwCh8OnCjyjKNCnLwIg4FTwARrCzCSTu4K7/1aQKDbc9RgmZyVpKgPF63rC8x0IPZBMUCMPcRDqr/gZ1X7sWT9a87+2pHhRCcryRLjBuy8Ld8qi4rDygJYtgioo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=mary.guillemard@collabora.com;
 dmarc=pass header.from=<mary.guillemard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1723046991; 
 s=zohomail; d=collabora.com; i=mary.guillemard@collabora.com; 
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=2tbs4O9jIOylAwaDXXbJssc8OYMauxjaFyRX4otVCrY=;
 b=I34VHeWIv6mLg5s/P1vAemtJUOsVUP2Hlp1kE9RTukKYzM0hAPDCBoBZtYVJWN1H
 H5c1O/4XkGQM0SphHm5FQKGAHOAezCK1uKxa1JsZqHzGepDYW4hgzfnKYYNo99KmKVA
 ybSODF0377SEXB/HmnMwEzBd9gSR3Qsq/MbnqI/Y=
Received: by mx.zohomail.com with SMTPS id 1723046989747697.3393722421491;
 Wed, 7 Aug 2024 09:09:49 -0700 (PDT)
From: Mary Guillemard <mary.guillemard@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com,
 Mary Guillemard <mary.guillemard@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 1/3] drm/panfrost: Add SYSTEM_TIMESTAMP and
 SYSTEM_TIMESTAMP_FREQUENCY parameters
Date: Wed,  7 Aug 2024 18:08:57 +0200
Message-ID: <20240807160900.149154-2-mary.guillemard@collabora.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240807160900.149154-1-mary.guillemard@collabora.com>
References: <20240807160900.149154-1-mary.guillemard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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

Expose system timestamp and frequency supported by the GPU.

Mali uses the generic arch timer as GPU system time so we currently
wire cntvct_el0 and cntfrq_el0 respectively to those parameters.
We could have directly read those values from userland but handling
this here allows us to be future proof in case of errata related to
timers for example.

This new uAPI will be used in Mesa to implement timestamp queries and
VK_KHR_calibrated_timestamps.

Signed-off-by: Mary Guillemard <mary.guillemard@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 17 +++++++++++++++++
 include/uapi/drm/panfrost_drm.h         |  2 ++
 2 files changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 671eed4ad890..d94c9bf5a7f9 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -69,6 +69,23 @@ static int panfrost_ioctl_get_param(struct drm_device *ddev, void *data, struct
 		PANFROST_FEATURE_ARRAY(JS_FEATURES, js_features, 15);
 		PANFROST_FEATURE(NR_CORE_GROUPS, nr_core_groups);
 		PANFROST_FEATURE(THREAD_TLS_ALLOC, thread_tls_alloc);
+
+	case DRM_PANFROST_PARAM_SYSTEM_TIMESTAMP:
+#ifdef CONFIG_ARM_ARCH_TIMER
+		param->value = __arch_counter_get_cntvct();
+#else
+		param->value = 0;
+#endif
+		break;
+
+	case DRM_PANFROST_PARAM_SYSTEM_TIMESTAMP_FREQUENCY:
+#ifdef CONFIG_ARM_ARCH_TIMER
+		param->value = arch_timer_get_cntfrq();
+#else
+		param->value = 0;
+#endif
+		break;
+
 	default:
 		return -EINVAL;
 	}
diff --git a/include/uapi/drm/panfrost_drm.h b/include/uapi/drm/panfrost_drm.h
index 9f231d40a146..52b050e2b660 100644
--- a/include/uapi/drm/panfrost_drm.h
+++ b/include/uapi/drm/panfrost_drm.h
@@ -172,6 +172,8 @@ enum drm_panfrost_param {
 	DRM_PANFROST_PARAM_NR_CORE_GROUPS,
 	DRM_PANFROST_PARAM_THREAD_TLS_ALLOC,
 	DRM_PANFROST_PARAM_AFBC_FEATURES,
+	DRM_PANFROST_PARAM_SYSTEM_TIMESTAMP,
+	DRM_PANFROST_PARAM_SYSTEM_TIMESTAMP_FREQUENCY,
 };
 
 struct drm_panfrost_get_param {
-- 
2.45.2

