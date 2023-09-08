Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 209E37989D6
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 17:23:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67B9B10E90C;
	Fri,  8 Sep 2023 15:23:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6CD510E90D
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Sep 2023 15:23:33 +0000 (UTC)
Received: from localhost.localdomain (unknown [171.76.82.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id B540C66072E6;
 Fri,  8 Sep 2023 16:23:26 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1694186612;
 bh=vSfG90Nzl0+BeuoBl+uK4L5P25mXXoUQscWftJ5tlOc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=awfkDxvgJt8FRlOjDEhbzix5aDnrwP09FpATXRzrOagbeVZP08/0Xcjwd+c7ZQ+mY
 e4Eu1qtpyIItMU9Uw4UN7G+SKzKK7At3NPGAExaHpwZYi8+6WH1WGPW3bZq+RvJtFL
 LQzHvoxXikgQi5TLq+CwC6hbEbCZrUyDIVugUpgmcHlfEWh1hwl/ROWi4x8vKNPy3H
 KIrEbWp2UT7whjbxowEAoTcqW+6n/puw4wNqr1oe9lJd1nehPkekI+6laLYRJPoIWz
 mSSg7JbhCgz8dVntPMuNnCDK1xLXwgbin5fGdd8pBZuZIeLkbeA9N9F23TbpTs3fry
 A+OLIwjSYxXOQ==
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 5/9] drm: ci: Enable regulator
Date: Fri,  8 Sep 2023 20:52:21 +0530
Message-Id: <20230908152225.432139-6-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230908152225.432139-1-vignesh.raman@collabora.com>
References: <20230908152225.432139-1-vignesh.raman@collabora.com>
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
Cc: emma@anholt.net, virtualization@lists.linux-foundation.org,
 krzysztof.kozlowski+dt@linaro.org, robdclark@google.com,
 david.heidelberg@collabora.com, sergi.blanch.torne@collabora.com,
 gustavo.padovan@collabora.com, agross@kernel.org, devicetree@vger.kernel.org,
 conor+dt@kernel.org, daniels@collabora.com, linux-arm-msm@vger.kernel.org,
 mripard@kernel.org, helen.koike@collabora.com, anholt@google.com,
 linux-mediatek@lists.infradead.org, robclark@freedesktop.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 andersson@kernel.org, linux-kernel@vger.kernel.org, konrad.dybcio@linaro.org,
 robh+dt@kernel.org, dmitry.baryshkov@linaro.org, guilherme.gallo@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enable CONFIG_REGULATOR_DA9211=y to fix mt8173 boot issue.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v2:
  - No changes

v3:
  - Remove CONFIG_RTC_DRV_MT6397=y as it is already enabled in defconfig

---
 drivers/gpu/drm/ci/arm64.config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/ci/arm64.config b/drivers/gpu/drm/ci/arm64.config
index 817e18ddfd4f..ca95e141a7ae 100644
--- a/drivers/gpu/drm/ci/arm64.config
+++ b/drivers/gpu/drm/ci/arm64.config
@@ -184,6 +184,7 @@ CONFIG_HW_RANDOM_MTK=y
 CONFIG_MTK_DEVAPC=y
 CONFIG_PWM_MTK_DISP=y
 CONFIG_MTK_CMDQ=y
+CONFIG_REGULATOR_DA9211=y
 
 # For nouveau.  Note that DRM must be a module so that it's loaded after NFS is up to provide the firmware.
 CONFIG_ARCH_TEGRA=y
-- 
2.40.1

