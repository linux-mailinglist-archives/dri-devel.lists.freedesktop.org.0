Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80CDD9D62D7
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 18:20:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE08810EC1E;
	Fri, 22 Nov 2024 17:20:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="jVUAxXej";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 952FF10EC1D
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 17:20:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5D1C21C0006;
 Fri, 22 Nov 2024 17:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1732296020;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rBwHBA6dWoUeKSehEikgJW7RDC/rJZpF5R9dFSy1Qes=;
 b=jVUAxXejhtibC4POGltXHV5ptmSkAD+AZKzkwElQkfrOiknr+PEmvj9Wv/fTYRqObgib1g
 XHrhBla0DAT4nuEwh4tErPXMrgBPR+3mOlySu5I/SqkcFSJu5wymMuodyNMXHbRiXLThzj
 1FdBZrDyNgFuCiDwTTXaarDn6nlhjfdpAQjEDbRJeCgH5a2mPvoVy9CWrb5KDHF7eUdRhA
 fp4NyMbyvc5s/TJA3xiJuktsoetTPAQ3EOsywtPoKov0EI3nyEtO4poTNhFmrx5fOAKC+S
 RhHBxET5fOsaqxQZQvqNCFO444Dwcp05hiRvXNLPkgh9+nB7vDmYffrXo6RLNA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH RFC v2 00/18] drm/vkms: Introduce detailed configuration
Date: Fri, 22 Nov 2024 18:20:04 +0100
Message-Id: <20241122-google-remove-crtc-index-from-parameter-v2-0-81540742535a@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAEW9QGcC/42RzW5CIRCFX8WwLi1w/101adIH6LZpDD+DEi9gg
 V41xnfveK0LF01cwcyQ7xzOnEiG5CCT5eJEEkwuuxiwEE8LojcyrIE6gzURTNSsEZyuY1yPQBP
 4OAHVqWjqgoEDtSl6upNJeiiQqB2kVYLrTvYNQdougXWHWemTfLy/ka9rM8H3D6qWv4mSGanRe
 1eWC5M89S7rl9uFBjiUC81DznI2h17RGudC3KxNW5+plwHnhk4NZZRL1bKaVTC07FXFWEYXnlH
 kX5KqrxQ5jlHLcuEI5FjbKWOUZcqqRzkB9vifMWIiMXlZMp0qRInKdl3X8qHTw0OofcKMlNTbF
 b6ElTrO5xXG+sY0PWe2heoOdsl443KJ6ThveOJzyPMye14/vMyJo0oLvBuksoM19b3K+Xz+BYQ
 ChNBJAgAA
X-Change-ID: 20240521-google-remove-crtc-index-from-parameter-f9afb21c7a85
To: =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>
Cc: arthurgrillo@riseup.net, jeremie.dautheribes@bootlin.com, 
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, 
 seanpaul@google.com, nicolejadeyee@google.com, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Louis Chauvet <louis.chauvet@bootlin.com>, 
 =?utf-8?q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5181;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=BSvo1YAbhpgWkDemhSjZsTbg54rbwWtUrf3IRGx/XKo=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnQL1MY+Vb0R/CdSWRpuR9goOwAGdEVHccMeOM0
 up/WMjoZD6JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ0C9TAAKCRAgrS7GWxAs
 4tsgEACxCoITw/hawU7UDF4QN755NOjEMNb48BFyGpX1nvqQ1RPqDhH2Q02j2x0zu6LWx6xUTve
 zyGJU/uY5VDQ24R15dSvuhA23g/BHRETbvL6BIZUgsFydGWQ5ilNE5bUbUrH+z+odtmvgeA+coe
 NI0Tzd85kEhSGf1wtqOdNvcM3UsOAHiocFlvlPu5BQsxKfv8jaGecdWe82eMvFkEVDoGHLsMGk+
 lt4SM8r8BKgTfWEq7Q3QTt/EQX/KS8bbqVbUEmcLz2kSsMrR8n50yVrrCX6iyJoiY9gs73Vv1H7
 Cs31bHqhMTDIAAb2YH7DrSUta2xljPEYRtI9FdS/mlBk647erA87a92WldeKrz4Ta/ZAaowiWR9
 XBjiKWRzA49Pt0kzNn9EMXIGdDxxIO9Q1XWqC96n26abcgkhffdNtM5vUKKLES8oWpCbyq/Ghmi
 ifnEU2wIibmYqbZ2cfiG72+Ubu1Or99aOjRTxfLd0y6t7inlQYzil4rVztj5+jYJNlLSX+5n+RV
 qTQag2UbddYgccvZh1h9N4t5+kQ9iPQFnrNCJKd5lNVTpfkBDe5TVYz4SAKwFIu5zl6pSnotLWo
 iDVAvx7WzQHWLQXaPHvOAmUjnl4h5kytNYEZF5Mbd8fCU0+WOJnGrwTQFbzXLm+4LO19EB8686k
 qDSK8+edpURwrkg==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-Sasl: louis.chauvet@bootlin.com
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

The current code is not flexible to configure the VKMS device. In
preparation for ConfigFS interface introduce few structure that can be
used to configure the device creation: `vkms_config`.

This part is splitted from the ConfigFS implementation itself to avoid
mixing two complex interfaces.

The vkms_config structure will allows the configuration of:
- planes
    - name
    - possible_crtcs
    - supported_color_encodings
    - supported_rotations
    - supported_color_ranges
    - default_rotation
    - default_color_range
    - default_color_encoding
    - type
    - format
- crtcs
    - name
    - possible_planes [automatically filled by helpers]
    - possible_encoders [automatically filled by helpers]
- encoders
    - name
    - type
    - possible_crtcs
- connectors:
    - type
    - status
    - EDID

This series depends on:
https://lore.kernel.org/all/20241122-google-vkms-managed-v5-0-1ab60403e960@bootlin.com
https://lore.kernel.org/all/20241122-b4-vkms-allocated-v2-0-ff7bddbf0bfb@bootlin.com
https://lore.kernel.org/all/20241122-b4-new-color-formats-v3-0-23f7776197c9@bootlin.com
https://lore.kernel.org/all/20241122-writeback_line_by_line-v3-0-085d5810f6e3@bootlin.com

As there are some conflicts, you can find a working branch here:
https://gitlab.freedesktop.org/louischauvet/kernel/-/tree/b4/vkms-config

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
Changes in v2:
- Rebased on drm-misc-next
- Added support for many new configuration
- Link to v1: https://lore.kernel.org/r/20240814-google-remove-crtc-index-from-parameter-v1-0-6e179abf9fd4@bootlin.com

---
Louis Chauvet (18):
      drm/vkms: Extract vkms_config header
      drm/vkms: Add a validation function for vkms configuration
      drm/vkms: Move default_config creation to its own function
      drm/vkms: Introduce config for plane
      drm/vkms: Introduce config for plane name
      drm/vkms: Introduce config for plane rotation
      drm/vkms: Introduce config for plane color encoding
      drm/vkms: Introduce config for plane color range
      drm/vkms: Introduce config for CRTCs and encoders
      drm/vkms: Introduce config for encoder name
      drm/vkms: Introduce config for CRTC name
      drm/vkms: Add test for config structure
      drm/vkms: Introduce config for connector
      drm/vkms: Introduce config for connector type
      drm/vkms: Introduce config for plane format
      drm/vkms: Introduce config for connector status
      drm/vkms: Introduce config for connector EDID
      drm/vkms: Introduce config for encoder type

 drivers/gpu/drm/vkms/Makefile                 |   3 +-
 drivers/gpu/drm/vkms/tests/Makefile           |   1 +
 drivers/gpu/drm/vkms/tests/vkms_config_test.c | 137 ++++++
 drivers/gpu/drm/vkms/vkms_config.c            | 613 ++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_config.h            | 245 ++++++++++
 drivers/gpu/drm/vkms/vkms_crtc.c              |  16 +-
 drivers/gpu/drm/vkms/vkms_drv.c               |  42 +-
 drivers/gpu/drm/vkms/vkms_drv.h               |  25 +-
 drivers/gpu/drm/vkms/vkms_output.c            | 183 +++++---
 drivers/gpu/drm/vkms/vkms_plane.c             |  62 +--
 10 files changed, 1152 insertions(+), 175 deletions(-)
---
base-commit: 98efdd02e220fea84c1491012d7292749a71faeb
change-id: 20240521-google-remove-crtc-index-from-parameter-f9afb21c7a85
prerequisite-message-id: 20241122-google-vkms-managed-v5-0-1ab60403e960@bootlin.com
prerequisite-patch-id: b608594ad493a41000ee703792eac4b23f9e35dc
prerequisite-patch-id: 5697aa87c44bbf3eda8a1ba424465dc792545d4c
prerequisite-patch-id: 223d59c407ce28dacf3f563b5c0148d2398303f1
prerequisite-patch-id: 720b75b21d06ce3d3f060fb9238f7903834da0e1
prerequisite-patch-id: 30a1e033fa43241ca6a43006fd4f29f8e9217224
prerequisite-message-id: 20241122-b4-vkms-allocated-v2-0-ff7bddbf0bfb@bootlin.com
prerequisite-patch-id: 9741873a5f0a7a3cf117dec7837354c3ad38ac3a
prerequisite-patch-id: 1a383d1494e4f2142b62822f2ba482a3b813563a
prerequisite-patch-id: 7d3f49fee4d3553d52fc075b7868da9dea9209cd
prerequisite-patch-id: 57f5aeff2a9e8f2b6f47569e44dcd8fa587ed4bf
prerequisite-message-id: 20241122-b4-new-color-formats-v3-0-23f7776197c9@bootlin.com
prerequisite-patch-id: e6717b75d79ae5cfb0815bab88d722082107dc0e
prerequisite-patch-id: 4b3b1ea5ad2e3ba1922cd4b3d3d46214b27c8c2d
prerequisite-patch-id: 060874d5a7433cc8cc654bc63e0b411036727ebb
prerequisite-patch-id: 43115d21842e508d9d8b0468e15f67d442bffe3c
prerequisite-patch-id: 627d0970e76d4154c982d0d4172e7a0c4dfb9a4c
prerequisite-patch-id: 582445144ac0ab11175ef96262060b08a5e1467e
prerequisite-patch-id: a98fac5a2c60fe23fbc6a455e9a4ab8b0f187ee8
prerequisite-patch-id: 62c8d109a22b9978f755255b67f13fe74fb7008d
prerequisite-message-id: 20241122-writeback_line_by_line-v3-0-085d5810f6e3@bootlin.com
prerequisite-patch-id: 07868dd9c7bbb1ed96d675c689de86f0cf293248
prerequisite-patch-id: 736638b76050ef7a99cfad2c1560f7af114d5fbd
prerequisite-patch-id: 20d8823f9c1d372ab2b88f969f5110f77e49c7f9

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

