Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3178978871E
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 14:25:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1CF010E144;
	Fri, 25 Aug 2023 12:25:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD26510E144
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 12:25:13 +0000 (UTC)
Received: from localhost.localdomain (unknown [171.76.83.99])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 1E7736607286;
 Fri, 25 Aug 2023 13:25:05 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1692966312;
 bh=REQjWp2zHtrfiDs99kq+h6FJkxnRTdlAsV7mFgtYf4s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Yd4+NKJOxy5N8Tm6mcZMdl+mvuQ74D5UxsXwSCKscOHz9vuwz3b3bTwaPZ/VgcjXZ
 FJTMdnsF4mV7I0nLA1ldxV1fLEttVn6s8U6izBM+Bppx/D0l5EKx2mbX99n6e9L9PM
 yTY7YAYz2pbkKO4C1butaugpRlvHeuX4KWEq6G1JH7pvXlxG9LmxmfrK7ASb8knF70
 CWmoS+za8k2+l8HIq+TZZyve7Y3auOyZNZAT7Q9gLYNzqnqmb52Ol6+Sov0H2KVpqo
 1VodBSiEz+/VxgynTr87DE3CltOmDByr6/1uu93o1rOwgNxfB9LnKgGkc1IOUQnCCo
 AJSGaLdztKHig==
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/6] drm: ci: Force db410c to host mode
Date: Fri, 25 Aug 2023 17:54:31 +0530
Message-Id: <20230825122435.316272-3-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230825122435.316272-1-vignesh.raman@collabora.com>
References: <20230825122435.316272-1-vignesh.raman@collabora.com>
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
Cc: emma@anholt.net, linux-doc@vger.kernel.org, david.heidelberg@collabora.com,
 linux-amlogic@lists.infradead.org, jbrunet@baylibre.com, robdclark@google.com,
 corbet@lwn.net, khilman@baylibre.com, sergi.blanch.torne@collabora.com,
 gustavo.padovan@collabora.com, linux-rockchip@lists.infradead.org,
 daniels@collabora.com, martin.blumenstingl@googlemail.com,
 robclark@freedesktop.org, helen.koike@collabora.com, anholt@google.com,
 linux-mediatek@lists.infradead.org, mripard@kernel.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com,
 neil.armstrong@linaro.org, guilherme.gallo@collabora.com,
 linux-kernel@vger.kernel.org, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Force db410c to host mode to fix network issue which results in failure
to mount root fs via NFS.
See https://gitlab.freedesktop.org/gfx-ci/linux/-/commit/cb72a629b8c15c80a54dda510743cefd1c4b65b8

Since this fix is not sent upstream, add it to build.sh script
before building the kernel and dts. Better approach would be
to use devicetree overlays.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---
 drivers/gpu/drm/ci/build.sh | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh
index 7b014287a041..c39834bd6bd7 100644
--- a/drivers/gpu/drm/ci/build.sh
+++ b/drivers/gpu/drm/ci/build.sh
@@ -70,6 +70,10 @@ if [ -z "$CI_MERGE_REQUEST_PROJECT_PATH" ]; then
     fi
 fi
 
+# Force db410c to host mode to fix network issue which results in failure to mount root fs via NFS.
+# See https://gitlab.freedesktop.org/gfx-ci/linux/-/commit/cb72a629b8c15c80a54dda510743cefd1c4b65b8
+sed -i '/&usb {/,/status = "okay";/s/status = "okay";/&\n\tdr_mode = "host";/' arch/arm64/boot/dts/qcom/apq8016-sbc.dts
+
 for opt in $ENABLE_KCONFIGS; do
   echo CONFIG_$opt=y >> drivers/gpu/drm/ci/${KERNEL_ARCH}.config
 done
-- 
2.40.1

