Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A403C7989CF
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 17:23:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1AC310E8FA;
	Fri,  8 Sep 2023 15:23:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9E7410E8FB
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Sep 2023 15:23:14 +0000 (UTC)
Received: from localhost.localdomain (unknown [171.76.82.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id B35D666072AB;
 Fri,  8 Sep 2023 16:23:07 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1694186593;
 bh=70CHDo1InUS+MvNfKVtde3bBDB5t7x+CHUmXN2X4oLI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DmBNzam2pyIDL7f9vOBU6avqqZqVetkJHBgrlTVKu21IR6hPJF0iMloPdwXzchkS1
 K70vGsS4Be60btQm1KIp86Ug3vVOzZuycrL1i4Nty7uUWpafXfRvaRSQhR/U4uP/2/
 PNcjA+22nGCVrFaAVOlW+P0ZVKetD0Fee/0yEpbDz6DY7gdihsmffNez/CED4PL/c7
 NlH+8u+LeyKJe2rcjWqRU9pSFDQaAFJpJwfEF349cHTa8vjrL1QdhLaUjXrR+x6Ab0
 qTBXgLv/Ql8ZaHuwxuebp7gpgfgRYyvnxLMeLjjqnj1tfpwSPnnuG5aBf5ix9by4RZ
 t5FwxrzzfFBwQ==
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 2/9] arm64: dts: qcom: apq8016-sbc: Add overlay for usb
 host mode
Date: Fri,  8 Sep 2023 20:52:18 +0530
Message-Id: <20230908152225.432139-3-vignesh.raman@collabora.com>
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

Due to the presence of the fastboot micro cable in the CI farm,
it causes the hardware to remain in gadget mode instead of host mode.
So it doesn't find the network, which results in failure to mount root
fs via NFS.

Add an overlay dtso file that sets the dr_mode to host, allowing
the USB controllers to work in host mode. This dtso file will be used
in drm-ci, mesa-ci.

Overlay DT file uses the sugar syntax [suggested by Dmitry Baryshkov and Maxime Ripard]

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Suggested-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Helen Koike <helen.koike@collabora.com>
Signed-off-by: David Heidelberg <david.heidelberg@collabora.com>
Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v3:
  - New patch in the series to add device tree overlay in arch/arm64/boot/dts/qcom

---
 arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtso | 8 ++++++++
 1 file changed, 8 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtso

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtso b/arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtso
new file mode 100644
index 000000000000..a82c26b7eae8
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtso
@@ -0,0 +1,8 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+/dts-v1/;
+/plugin/;
+
+&usb {
+         dr_mode = "host";
+};
-- 
2.40.1

