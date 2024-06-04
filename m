Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D92E8FB36C
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 15:20:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 049C510E484;
	Tue,  4 Jun 2024 13:20:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JeWIPB0P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1FA410E47F
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2024 13:20:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 15E25CE113C;
 Tue,  4 Jun 2024 13:20:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 573C2C3277B;
 Tue,  4 Jun 2024 13:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717507239;
 bh=hGVtjDM96GPiibc2AFKhkSfhGrvU98AnTo1RVvLWr2c=;
 h=From:Subject:Date:To:Cc:Reply-To:From;
 b=JeWIPB0P3qWQHXcZKy8R50Iss/fsuFPOfYteEyM/6bcxX4S+I2XjHKYnWUIbGgO5L
 eIBAiMvO1K4KSNZz9yFzrNBpf1oSJIRWAUEijBLorecO23vsmWF58alJqpNO3gr3a7
 zJn5qHqv/cIlQg9efJj+DMvhneKqnWCFYdK6lfP4oBx/JmAyPwJW3qim+ny1DNjdwJ
 NLoQoLC5VYDSXMSKzhcoyGOWdvVjkUCkDop6qYbbXGBqQRjFixpGl+TC91GCRznUSJ
 NbB6JINNm52suU3DsGhCJVahJQ5hSXVKBPYCOyjIs3x7Vy7XV1H7Y1PDQwqmPcZWAS
 JJz4supYSbK2w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 357BEC27C50;
 Tue,  4 Jun 2024 13:20:39 +0000 (UTC)
From: =?utf-8?q?Noralf_Tr=C3=B8nnes_via_B4_Relay?=
 <devnull+noralf.tronnes.org@kernel.org>
Subject: [PATCH v4 0/5] drm/tiny: panel-mipi-dbi: Support 18 bits per color
 RGB666
Date: Tue, 04 Jun 2024 15:20:27 +0200
Message-Id: <20240604-panel-mipi-dbi-rgb666-v4-0-d7c2bcb9b78d@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJsUX2YC/3XNQQ6CMBCF4auQrq0pndJSV97DuCh0xEm0kJYQD
 eHuVl2oMSz/l8w3M0sYCRPbFTOLOFGiPuRQm4K1Zxc65ORzMymkEkpUfHABL/xKA3HfEI9do7X
 mCgWAqY3XrWX5doh4otvLPRxznymNfby/3kzlc32LlTAr4lRywbWxVoJyJwe4H2MfAqZtHzv2N
 Cf55ZRyzZHZUdZ7qTXI2ol/Bz6OFrDmQHYqi76C1hnw7tdZluUBcdzMf0wBAAA=
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Lechner <david@lechnology.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>, 
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>, 
 =?utf-8?q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717507238; l=1651;
 i=noralf@tronnes.org; s=20221122; h=from:subject:message-id;
 bh=hGVtjDM96GPiibc2AFKhkSfhGrvU98AnTo1RVvLWr2c=;
 b=vnBGh6Lt3xK3rg/hBAkv2zBvn/jF1Hke6fLG5mA8v6xGqS56OsmjWlfSyNUxWnwnjD3OUE+60
 Ib93heNhhopCbVgVg6OfKbXatAbPsQzGDXcdWsQXJp/hs1YrlIbw8MX
X-Developer-Key: i=noralf@tronnes.org; a=ed25519;
 pk=0o9is4iddvvlrY3yON5SVtAbgPnVs0LfQsjfqR2Hvz8=
X-Endpoint-Received: by B4 Relay for noralf@tronnes.org/20221122 with auth_id=8
X-Original-From: =?utf-8?q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
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
Reply-To: noralf@tronnes.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

In this version I've fixed up a commit message that I had forgotten to 
write before sending and improved a struct member name.

See version 1 of the patchset for the full cover letter.

Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
---
Changes in v4:
- Expand the commit message (Dmitry)
- s/emulation_format/pixel_format/ (Dmitry)
- Link to v3: https://lore.kernel.org/r/20240603-panel-mipi-dbi-rgb666-v3-0-59ed53ca73da@tronnes.org

Changes in v3:
- Added r-b's to patch 1 and 5
- Link to v2: https://lore.kernel.org/r/20240512-panel-mipi-dbi-rgb666-v2-0-49dd266328a0@tronnes.org

Changes in v2:
- binding: Use 'default: r5g6b5' (Rob)
- Link to v1: https://lore.kernel.org/r/20240507-panel-mipi-dbi-rgb666-v1-0-6799234afa3e@tronnes.org

---
Noralf Trønnes (5):
      dt-bindings: display: panel: mipi-dbi-spi: Add a pixel format property
      drm/mipi-dbi: Remove mipi_dbi_machine_little_endian()
      drm/mipi-dbi: Make bits per word configurable for pixel transfers
      drm/mipi-dbi: Add support for DRM_FORMAT_RGB888
      drm/tiny: panel-mipi-dbi: Support the pixel format property

 .../bindings/display/panel/panel-mipi-dbi-spi.yaml | 30 +++++++++
 drivers/gpu/drm/drm_mipi_dbi.c                     | 76 +++++++++++++++-------
 drivers/gpu/drm/tiny/panel-mipi-dbi.c              | 55 +++++++++++++++-
 include/drm/drm_mipi_dbi.h                         | 10 +++
 4 files changed, 147 insertions(+), 24 deletions(-)
---
base-commit: 0209df3b4731516fe77638bfc52ba2e9629c67cd
change-id: 20240405-panel-mipi-dbi-rgb666-4e033787d6c9

Best regards,
-- 
Noralf Trønnes <noralf@tronnes.org>


