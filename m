Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7FAA9B1B5
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 17:08:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B54510E0A5;
	Thu, 24 Apr 2025 15:08:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="hkTO/UrV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EF2710E07F
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 15:08:26 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F002E43B30;
 Thu, 24 Apr 2025 15:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1745507304;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=kwtZUDd9gopu8zcCC7uUuLCyqfUunCI+oJq4E/2cP8w=;
 b=hkTO/UrVpap4HBu2e4bKxBkum05gdM3+9VhWemsvQ+uRDD4HMct7fWS5UgCPPOQQdxr1SC
 QFuCeGhoN05wFQlRS4I3cZZP6qlPMcahbHZxB+cafbzqvvlC6OQiE2QJj+1Hx9hTGRr3BD
 3Iz8XrPhwfi/11uKR9SlKRoiMZPwIYVHNnMmZFUIXis9QAEzBuy8JewQkDq4Yc3IVR65T7
 kuaL/J60EB/TGfDRLbM/YRoGS/gtiDYHsSlST/waKW9Rb/KiwgtoNEVSHwPW+dImFRfA/z
 YOS6ZHRvODDFZyLSxo4WB0hA9NC183cDu29kGoAaE2Zevkb2ADdC8dlXhDVJ/w==
From: Kory Maincent <kory.maincent@bootlin.com>
Subject: [PATCH RFC v2 0/5] Add support for Saef SFTO340XC panel.
Date: Thu, 24 Apr 2025 17:07:38 +0200
Message-Id: <20250424-feature_sfto340xc-v2-0-ff7da6192df2@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIALpTCmgC/22NQQrCMBREryJ/bSRJG21cCYIHcCtFkvbHftBGk
 lgqpXc3ZO3yzTBvFogYCCMcNwsEnCiSHzPI7Qa6wYwPZNRnBsml4kJq5tCkT8B7dMlXNZ871ks
 rlVFWHeoG8u4d0NFcnDe4Xs7Q5nCgmHz4lp9JlKooa978UU6CceYqXvXCaqP1/mS9T08ad51/Q
 buu6w+KmomFuQAAAA==
X-Change-ID: 20250129-feature_sfto340xc-d2b25a5b5748
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Kory Maincent <kory.maincent@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeeljeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhufffkfggtgfgvfevofesthekredtredtjeenucfhrhhomhepmfhorhihucforghinhgtvghnthcuoehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeduhfevudetfffgkedvhfevheeghedtleeghfffudeiffefvdehfeegieeivdekteenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomhepkhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudekpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrn
 hgvlhdrohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehquhhitggpjhgvshhsiihhrghnsehquhhitghinhgtrdgtohhmpdhrtghpthhtohepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdprhgtphhtthhopehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhm
X-GND-Sasl: kory.maincent@bootlin.com
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

Add support for Saef Technology Limited SFTO340XC LCD panel.
Add alongside the number of lanes configuration in the ili9881c driver
as the board on my desc use the panel with only two lanes.

Faced an issue with panel-common binding. Wrote a fix (first patch) but not
sure it is the right one. If someone from dt tree could take a look, it
would be nice.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
Changes in v2:
- Add new patch trying to fix panel-common binding.
- Read the data-lanes parameter from the port endpoint and use
  drm_of_get_data_lanes_count instead of of_property_read_u32.
- Link to v1: https://lore.kernel.org/r/20250408-feature_sfto340xc-v1-0-f303d1b9a996@bootlin.com

---
Kory Maincent (5):
      dt-bindings: display: panel: Fix port binding
      dt-bindings: display: panel: ili9881c: Add data-lanes property
      drm/panel: ilitek-ili9881c: Add support for two-lane configuration
      dt-bindings: ili9881c: Add Saef SFTO340XC support
      drm: panel: Add Saef SFTO340XC LCD panel

 .../bindings/display/panel/ilitek,ili9881c.yaml    |  21 ++
 .../bindings/display/panel/panel-common.yaml       |   2 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c      | 265 ++++++++++++++++++++-
 3 files changed, 285 insertions(+), 3 deletions(-)
---
base-commit: bef4f1156b74721b7d111114538659031119b6f2
change-id: 20250129-feature_sfto340xc-d2b25a5b5748

Best regards,
-- 
Köry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

