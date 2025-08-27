Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBE9B385DB
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 17:12:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5565D10E12D;
	Wed, 27 Aug 2025 15:12:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="krcEL/Gi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AB1010E12D
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 15:12:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5971560266;
 Wed, 27 Aug 2025 15:12:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B105AC4CEEB;
 Wed, 27 Aug 2025 15:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756307564;
 bh=aLiyfjU336whNq3393sg2CHM0Hzlo1BbRuefTjgMLrM=;
 h=From:Subject:Date:To:Cc:From;
 b=krcEL/Giwz/COhvgw7Rm0oBys/NBCudHzl8YBxZCDgB/U3ttRw+AfDQcrdP1WSjen
 n8R1xDwrEKa956dOMGtiPlLM4Na6X4VeI2mGxRvbX6hdUv/Tr0ttKKirBsmWYtqTcZ
 ZyqSPudQ4RLyujf3OLEw6bniTeYSLl7ezOhDK7Haqp+GDXInZMMnAS5rkaGTY+Bqzx
 JWJOCBVtdg+KPx1QOv3zzTL3msYt1f4N5lz4l7Dw+ZonwIzMRyWmZqwDLC0qs5dPHE
 4dXuuNzbDrsrNXddWDIisVxsi8Zkzzw8/bIAgH34p/v47zLge6Ls4lLeloWxK9Kmjt
 0XyV4Y9xBIWKA==
From: Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v3 00/14] drm/tidss: dispc: Convert to FIELD_* API
Date: Wed, 27 Aug 2025 17:12:31 +0200
Message-Id: <20250827-drm-tidss-field-api-v3-0-7689b664cc63@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF8gr2gC/3XPwQrCMAwG4FcZPRtZs2o7T76HeKhr1KDbtK1DG
 Xt3OyeIoMc/kO9PehHIMwWxynrhqePAbZNCMctEdbTNgYBdygJzXOQaS3C+hsguBNgznR3YC0N
 hsFTaluiUEmnz4mnP95e62aZ85BBb/3iVdHKcvr0i/+l1EnKwWloyzqE2uD6Rb+g8b/1BjGCHH
 8TgHwQToorK7pZaVktlvpBhOtPT9ZZ+jtOtYmcDQdXWNcdV1tA9wrtCpo3hCWjZ9J4tAQAA
X-Change-ID: 20250729-drm-tidss-field-api-382947a92d44
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1984; i=mripard@kernel.org;
 h=from:subject:message-id; bh=aLiyfjU336whNq3393sg2CHM0Hzlo1BbRuefTjgMLrM=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnrFZJ+nXicKBgR8je4XvgCd1/04x3v/wnfZ+XyFfT0d
 uJ46h3VMZWFQZiTQVZMkeWJTNjp5e2LqxzsV/6AmcPKBDKEgYtTACayM5Cx4XTcJlmZyG179Pcy
 LlnwzPhZZ2bPims9fczLla79YZ7iJij3W7aLd+Nt6V/eEcJLLsglMDZM+h2Tyf37snDk9jDNzRa
 SCu3tWyJfmnw5KXjgbGH5pVe2G+w+SCn1+WXK9jqIv8pfpAIA
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
Changes in v3:
- Rebase on top of latest linux-next, fix merge conflicts
- Link to v2: https://lore.kernel.org/r/20250820-drm-tidss-field-api-v2-0-43cab671c648@kernel.org

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

 drivers/gpu/drm/tidss/tidss_dispc.c      | 297 ++++++++++++++++---------------
 drivers/gpu/drm/tidss/tidss_dispc_regs.h |  76 ++++++++
 2 files changed, 225 insertions(+), 148 deletions(-)
---
base-commit: a6d3da9a268e3d0a20b76fb40fd3484fe219ff17
change-id: 20250729-drm-tidss-field-api-382947a92d44

Best regards,
-- 
Maxime Ripard <mripard@kernel.org>

