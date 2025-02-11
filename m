Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F665A30A92
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 12:44:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0480510E39C;
	Tue, 11 Feb 2025 11:44:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="pEQMvPpM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA5E810E369
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 11:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1739274272;
 bh=RgLO6P1goXDawul5y+R84q5+vVPWK6PuO7ujWU+944Y=;
 h=From:To:Cc:Subject:Date:From;
 b=pEQMvPpM1YD15H2fDyHoX8THcZog4GAeo5LXRWXHDXejcZGzOtOCyw/xQ2SfkmkBL
 mRoL1ODbIFoWHwd0Ixf2aNBR53P72os0HEgR3aB9YCHAMsSNgSNm41borfGfT0vL2P
 59XJx13Y2s067YNB4knmVaJFGoZEHSNmdmjZ5f+V854Jrk2DP0UYv54hXONLOgnR+s
 sY+P0jHSjuq8BWs4P30DD6g96GlDZKxziWtuhWKz0yu9VpyhdhwPZ9uD5/K+uu+SGO
 b7Zq8hndC9X7eB8qV2UCz2Iuf05KGIZjKlyTycP1Q2qPM9q5HLXuQ14GVftrpPIt/f
 vQcDvE7W5wN8Q==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 7F7BA17E14D5;
 Tue, 11 Feb 2025 12:44:31 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: neil.armstrong@linaro.org
Cc: quic_jesszhan@quicinc.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 angelogioacchino.delregno@collabora.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com, pablo.sun@mediatek.com
Subject: [PATCH v1 0/2] Add driver for Himax HX8279 DriverIC panels
Date: Tue, 11 Feb 2025 12:44:27 +0100
Message-ID: <20250211114429.1519148-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.48.1
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

This series adds a driver for DSI panels using the Himax HX8279 and
HX8279-D DriverICs, and introduces one panel using such a configuration,
the Startek KX070FHFID078.

This panel is found on the latest hardware revisions of some MediaTek
Genio Evaluation Kits, and specifically, at least:
 - Genio 510 EVK
 - Genio 700 EVK
 - Genio 1200 EVK

This driver was tested on all of the aforementioned boards.

AngeloGioacchino Del Regno (2):
  dt-bindings: display: panel: Add Himax HX8279/HX8279-D
  drm: panel: Add driver for Himax HX8279 and Startek KD070FHFID078

 .../bindings/display/panel/himax,hx8279.yaml  |  74 ++
 drivers/gpu/drm/panel/Kconfig                 |  11 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-himax-hx8279.c    | 910 ++++++++++++++++++
 4 files changed, 996 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/himax,hx8279.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-himax-hx8279.c

-- 
2.48.1

