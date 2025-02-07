Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4DEA2C894
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 17:23:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BACF10EB6F;
	Fri,  7 Feb 2025 16:22:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="PWSav6FT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1978510EB6B
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 16:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1738945365;
 bh=aTqZWWRrr3L5wDUzhWRhEVYuAUqrYHPZoSJEJm+Zs8A=;
 h=From:Subject:Date:To:Cc:From;
 b=PWSav6FT6CbpgynIS7njuhjV4RhHXRb9T9kQ/guIcR01M0+L0ebKvr25FcxatPcOB
 TTofFuV+nK6uP3OIMx9ziuDS/kPv4izJ0kRVXNEP8jgDBLkdDLDo59ecbvCxst8WUZ
 So/508Se3kG2NFlCv0Sc1yE8M4997GD/JJ28J1tK9pY1fSDW92JhuG6Zt150JAWFZz
 BQpNPWOHa161KVUIs86nUtody+l8fhGCMheZG0sJGNns2CEJvItrKDWQVBU3z3+3o3
 YEv64vGsVX8l2ovQJOL3hdVPjakhHATVmQBckr4+MjzQl8kG4yb1cSFRDcgy9GR9o1
 Z2ufjldq7gg+Q==
Received: from jupiter.universe (dyndsl-091-248-211-114.ewe-ip-backbone.de
 [91.248.211.114])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: sre)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id A7A7817E0E2C;
 Fri,  7 Feb 2025 17:22:45 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
 id 696DB480035; Fri, 07 Feb 2025 17:22:45 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH v2 0/2] Rockchip W552793DBA-V10 panel support
Date: Fri, 07 Feb 2025 17:21:46 +0100
Message-Id: <20250207-raydium-rm67200-v2-0-1fdc927aae82@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIABozpmcC/x3MPQqAMAxA4atIZgsh4u9VxEHbqBmqkqIoxbtbH
 L/hvQiBVThAl0VQviTIviVQnoFdx21hIy4ZCKlEwtro+Dg5vVFf1YRoeGqpLchSwxZSdSjPcv/
 HfnjfD5bZiXhhAAAA
X-Change-ID: 20250207-raydium-rm67200-eb92932c28ec
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Andy Yan <andyshrk@163.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1267; i=sre@kernel.org;
 h=from:subject:message-id; bh=aTqZWWRrr3L5wDUzhWRhEVYuAUqrYHPZoSJEJm+Zs8A=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGemM1W0h0QldRB5+nEiCo7GdJR0R7StQM6B+
 ZEilT+Yn9kmrIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJnpjNVAAoJENju1/PI
 O/qaL6cQAIzzeTgxqG2UuEnIi6OW/zjPrINp6otQ9jGqqpQyufuCcrDEzAi2TTgsMO/jbrugy3l
 t3C85zDmBuzMy312yTC5EA2wf34Y6onnzXlnOkMHfmqWmmSrLUMp6+Qcv18Q5YZwcoa1A/opaNZ
 TytjhE5TtfEGSwMpORI+Dc+tete18lhwjnn6KpFZnSrGvMuVjdiccTswXlZkYAPInKb3zF3l3kW
 amI03HIhhaue61W8w9uTVXEiPAQiGq151TxFqV30HD6XSyqiVLCo33dJiBX8qmou94F4OPtS92G
 jtUEuwQ673+a5YspxL7x+dzlPkF0R6BvcAxWwhdFMhIEzQPN2b5HElbmCwecC+xQriXUVAT0tga
 GEv+HbgS21HwNbtu9ZuQMrMDIrhC61bCqT0/BjtLxcqm6qbai+w2EQqJ/bYnHzlNzLy/1C9WsIG
 F/ajZ6wwPORE+Nzgk8cjuXUvKoPTAvB1wr3lb0YzhZ1udtsPdJqlmZG/9+usohAo669dQz8nX9w
 8YaYNOahYfc7b6IO7oyVS28zfOmfT333MFRRS1lJhhs6YDlERvEJaFNAEbxXzr/9c0jwMqbIDoX
 Ikkk9J618shL2KTXDUH3B3qmklEhwQcu09BozbR2OrARj2S/7I5MLUzUaN6UykbWJpbSGO+mKha
 6TPHLgqe9S8mYNuZ3KPc4mg==
X-Developer-Key: i=sre@kernel.org; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
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

Hi,

This has been tested in combination with the series from Heiko Stübner
enabling DSI support for the RK3588 [0] (DSI controller support has been
merged already, only the PHY support is missing) on the RK3588 EVB1.

[0] https://lore.kernel.org/linux-rockchip/20241203164934.1500616-1-heiko@sntech.de/

Changes since PATCHv1:
 * https://lore.kernel.org/all/20241210164333.121253-1-sebastian.reichel@collabora.com/
 * move additionalProperties below required in the DT binding
 * collect Reviewed-by from Krzysztof Kozlowski, Andy Yan and Jessica Zhang
 * improve Kconfig help text

Thanks for having a look.

Greetings,

-- Sebastian

---
Sebastian Reichel (2):
      dt-bindings: display: panel: Add Raydium RM67200
      drm/panel: add Raydium RM67200 panel driver

 .../bindings/display/panel/raydium,rm67200.yaml    |  72 +++
 drivers/gpu/drm/panel/Kconfig                      |  10 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-raydium-rm67200.c      | 503 +++++++++++++++++++++
 4 files changed, 586 insertions(+)
---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250207-raydium-rm67200-eb92932c28ec

Best regards,
-- 
Sebastian Reichel <sre@kernel.org>

