Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5834E7989D9
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 17:23:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 884DD10E90D;
	Fri,  8 Sep 2023 15:23:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA7F610E90E
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Sep 2023 15:23:39 +0000 (UTC)
Received: from localhost.localdomain (unknown [171.76.82.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id F3BAA66072E5;
 Fri,  8 Sep 2023 16:23:32 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1694186618;
 bh=1DMUcJv4d1kKtiR6FbxgUJP2I64N2rk3k1pv7kM9Q04=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Z/RfLJbpsdHUSr96KD1hZTeQsHweQi/WNCPnDDTOiV5AG55qLdb71TVSzKrmIAs1W
 sUbSw2t4XTK24BTVBovODkAqviyPTv8DjQuHTHwuEXcDOetV+doKR1+kcHD4mv852E
 hS5bhmyKzQOKn6dKPYfrKb7IYU/jnj6zRekkibCKmIsT2+V/xckSTWgzTLRTjTzP8M
 CNZCTDoboQTdUL6S5GQg06rwErHxDAQtwfrh9flOM6a+dZIZ7Ows/dKUkQiLAghzz+
 SXAVcPPiZq3LMUfxTOFhQ3i0ZZmSxGKKmbYYWyvjVgf1x88qFgf3HJAZwSDknqAXx+
 ONBzBjaIkoB/Q==
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 6/9] arm64: defconfig: Enable DA9211 regulator
Date: Fri,  8 Sep 2023 20:52:22 +0530
Message-Id: <20230908152225.432139-7-vignesh.raman@collabora.com>
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

Mediatek mt8173 board fails to boot with DA9211 regulator disabled.
Enabling CONFIG_REGULATOR_DA9211=y in drm-ci fixes the issue.

So enable it in the defconfig since kernel-ci also requires it.

Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v3:
  - New patch in the series to enable CONFIG_REGULATOR_DA9211 in defconfig

---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index a25d783dfb95..ef22b532b63a 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -711,6 +711,7 @@ CONFIG_REGULATOR_AXP20X=y
 CONFIG_REGULATOR_BD718XX=y
 CONFIG_REGULATOR_BD9571MWV=y
 CONFIG_REGULATOR_CROS_EC=y
+CONFIG_REGULATOR_DA9211=m
 CONFIG_REGULATOR_FAN53555=y
 CONFIG_REGULATOR_GPIO=y
 CONFIG_REGULATOR_HI6421V530=y
-- 
2.40.1

