Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A5CC38CC5
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 03:07:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C112510E7E4;
	Thu,  6 Nov 2025 02:07:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=airkyi.com header.i=@airkyi.com header.b="eJxD+XEh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C07B010E7E4
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 02:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
 s=altu2504; t=1762394835;
 bh=nbvXFe64yJ17A8CrfC9T8uFMN+kP2alnIHnoP0BKrwI=;
 h=From:To:Subject:Date:Message-Id;
 b=eJxD+XEhdKUc0MC8vbDA350lX31NsrOKZWu58DYbHTN0vH7lV3acYnULpituWvoxe
 Koa/5t7fnQXNa270Bgi8ROyIx6y6vgj16v58blaO3qCFxrWHsG5Wm7qBqvCrS0q1hq
 Y3XlojRQIdQiW67SmzAGauugBuzGXl6QINhe5PlU=
X-QQ-mid: esmtpgz15t1762394833tffcfed6d
X-QQ-Originating-IP: PIqdBRM4ZELa1xjIOsWSEBgvFoUiNi09GWpy8eE8J48=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 06 Nov 2025 10:07:10 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7670270826209614107
From: Chaoyi Chen <kernel@airkyi.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: [PATCH 8/9] drm/rockchip: Drop ROCKCHIP_IOMMU depend for DRM_ROCKCHIP
Date: Thu,  6 Nov 2025 10:06:31 +0800
Message-Id: <20251106020632.92-9-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251106020632.92-1-kernel@airkyi.com>
References: <20251106020632.92-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: M4JyzWMRFsOyMF81ojNUElOehF4KWLNVvLVkLI4W8m4oiekH5yJQTZm2
 p1yfYCAtnogtYsFROrNo0bpzQHb4JMDHO4i3Si4DteNwGOYvd4lPao16N18PZDsBaMsLN4I
 HM/cIwzGAL6vlqOEpZWg996bZMZ+49FO94/OsekoIxh/bVzSw9wkeiJitd7OcJSGyp7anMB
 bnaVq/oQFwOWHkSRBOsj26GDwD9xKxm7KLRIp/mb40SFAOObV/bxND4jLpPfAM4wEFyqo0E
 7cjz8SMfTPfbBRFvvVMQbATOI00hvq+X5IH1bWo7XxEh7fRg/2hub3E4fLRniUmVGT3BQvK
 seejjttiyhOUw4X2bLDM14I0MBFBC8SXt6YiAHWTJcD354QYO89L8NULfJI9aKTMO0TUhoX
 /yE5PdfKo+ZkIfdBfyZFM0f2XeJIJUUsE2yfjISeNaeg+tJICIJ+beNXj62mcFEiR0Du/Qr
 z6m4qFQ1NV+tbw4g+qdw2xa/Yr3gncEYRrMaxovXY4WfVZbm9su9A4CK2NMqvzvJAN6DCgq
 MrjN5MrwEgnYigR5qahu4RjpdReVBZWmEv9wKJ2qBEHQ4b6zHWx0w5rwuL3esecVUU/Bn4x
 ipbk/LJQkHpPvgjreeHrwzAYUFkl1h+wZanh41LyOp2q5b9QPSNMqHSV9LLzC77LmXixDue
 WVYssGoRGf52LiZhd5Le0LFCm0bcLt5hqSV76TN82U5wcQiFNz//FWfFw2hjq4uiNdwR3eL
 xmv9ix34S2jNIlQiqTfrEici+0bwmm7okdDHFXHvowvwTQ6FPNMZPbRRqdx75sn0kZG7TMj
 398qC4rpRnxudi+LuxbYIqsQioTPveqmprF1CQyk0ctqEbGzGJ2NJ0MFbqyky2IHTbNIVu0
 Hy6JXkJYG9X08y2WJ0GYGYhdrDnuY0E2GeAQOQmzfH/BhTzSRhx84cwlTcGUH530yQdGm9E
 IjeSRpz3Qp0rP3WP4dUXguWTRlpjPAM9uoGKaR1tGlyGac0vKqU0AIWnyaYSWhxIuagpawG
 H5sabDvg==
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0
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

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

On the RK3506 platform, there is no iommu hardware. And even on
platform that have iommu hardware, it should be possible to use
VOP without enabling iommu. In this case, a contiguous memory
space like CMA should be used.

So this patch removes the dependency on ROCKCHIP_IOMMU.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---
 drivers/gpu/drm/rockchip/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/Kconfig b/drivers/gpu/drm/rockchip/Kconfig
index b7b025814e72..a056d419190c 100644
--- a/drivers/gpu/drm/rockchip/Kconfig
+++ b/drivers/gpu/drm/rockchip/Kconfig
@@ -1,7 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config DRM_ROCKCHIP
 	tristate "DRM Support for Rockchip"
-	depends on DRM && ROCKCHIP_IOMMU
+	depends on DRM
+	depends on ROCKCHIP_IOMMU || !ROCKCHIP_IOMMU
 	depends on OF
 	select DRM_CLIENT_SELECTION
 	select DRM_GEM_DMA_HELPER
-- 
2.51.1

