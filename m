Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D313B2DE87
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 16:02:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21BBD10E73D;
	Wed, 20 Aug 2025 14:02:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JQcdrCxi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D40D310E742
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 14:02:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0DFCB601D7;
 Wed, 20 Aug 2025 14:02:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 008FDC4CEEB;
 Wed, 20 Aug 2025 14:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755698520;
 bh=mwCmxnOMZLyjttEuHM2BZfc5kOf2MXquAOxaMhYfY1s=;
 h=From:Subject:Date:To:Cc:From;
 b=JQcdrCxiW0Ojm4NJRf0qtMQcotY8t9YVO0oivu8i04+lGaH9WJs2ExI0cUOKoy5Ta
 3QHlZGqjai23FdiQChFCYjODSgXUzf8bquSKGIgOwmSSFxvEM3gxPHLnF+3k1sxAqL
 vMF4jMlMBR+/EpHifpO/IVloLqUf5Pg6l8/1htzHQewlW91NfoGWVoLVUgjSBmUDsJ
 LwjSPU5QuyfLjgqgjOMdkOtFN7thC+av/8fRvlRP2frzXX+ZfuQPtZaEiPhgUVYIlS
 M+cpf8+N8H4TIze/N2ix+vEUEY409ih/N1xqJ7+o2hPN7lyVCnKzryjd/Pf+4Vnrbx
 bdX3APWNipmww==
From: Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v2 00/14] drm/tidss: dispc: Convert to FIELD_* API
Date: Wed, 20 Aug 2025 16:01:40 +0200
Message-Id: <20250820-drm-tidss-field-api-v2-0-43cab671c648@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAETVpWgC/22NQQ6CQAxFr2K6tmYomAFX3sOwmNgCjQikQ4iGc
 HdH4tLle8l/f4UophLhcljBZNGo45CAjge4d2FoBZUTAzk6O08Vsj1xVo4RG5WeMUyKeUlV4UN
 FXBSQlpNJo6+9eqsTdxrn0d77yZJ97a+Xu7+9JUOHwWdBSmbyJV0fYoP0p9FaqLdt+wDqw7JJt
 wAAAA==
X-Change-ID: 20250729-drm-tidss-field-api-382947a92d44
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1808; i=mripard@kernel.org;
 h=from:subject:message-id; bh=mwCmxnOMZLyjttEuHM2BZfc5kOf2MXquAOxaMhYfY1s=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBlLr/pxJe0UMpe7r6li1rG1otgo9Gol5+IH7AJt7/i01
 7/6dPF1x1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZhIrjpjvReD6LrdhjLybTtm
 ajA9C24qtSngPmF7/f6Th9vfxCj4X9v+7v5WM/45sTnex/JfXYhYy1hfrVA1i7OcRX7NkxfH5+3
 O2bZeWk0qTfG/vZZx4Y75P5dMeewifdl65aHDt2tkJ/86VHgZAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

The tidss driver rolls its own API equivalent to the FIELD_* API already
provided the kernel.

Since it's an ad-hoc implementation, it also is less convenient and
doesn't provide some useful features like being able to share the field
definitions that will come handy in the future.

Thus, this series converts the driver to that API and drops its own
version.

Let me know what you think,
Maxime

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Changes in v2:
- Switch to macros to prevent a gcc error
- Link to v1: https://lore.kernel.org/r/20250730-drm-tidss-field-api-v1-0-a71ae8dd2782@kernel.org

---
Maxime Ripard (14):
      drm/tidss: dispc: Remove unused OVR_REG_GET
      drm/tidss: dispc: Convert accessors to macros
      drm/tidss: dispc: Switch to GENMASK instead of FLD_MASK
      drm/tidss: dispc: Get rid of FLD_VAL
      drm/tidss: dispc: Get rid of FLD_GET
      drm/tidss: dispc: Get rid of FLD_MOD
      drm/tidss: dispc: Switch REG_GET to using a mask
      drm/tidss: dispc: Switch REG_FLD_MOD to using a mask
      drm/tidss: dispc: Switch VID_REG_GET to using a mask
      drm/tidss: dispc: Switch VID_REG_FLD_MOD to using a mask
      drm/tidss: dispc: Switch VP_REG_GET to using a mask
      drm/tidss: dispc: Switch VP_REG_FLD_MOD to using a mask
      drm/tidss: dispc: Switch OVR_REG_FLD_MOD to using a mask
      drm/tidss: dispc: Define field masks being used

 drivers/gpu/drm/tidss/tidss_dispc.c      | 295 +++++++++++++++----------------
 drivers/gpu/drm/tidss/tidss_dispc_regs.h |  76 ++++++++
 2 files changed, 223 insertions(+), 148 deletions(-)
---
base-commit: fbb0210d25fde20027f86a6ca9eee75630b5ac2b
change-id: 20250729-drm-tidss-field-api-382947a92d44

Best regards,
-- 
Maxime Ripard <mripard@kernel.org>

