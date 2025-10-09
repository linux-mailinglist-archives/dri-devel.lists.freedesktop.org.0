Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 155C0BC8D97
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 13:39:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AB9C10E9CE;
	Thu,  9 Oct 2025 11:39:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Zke8aiqn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F63C10E9C8
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 11:39:17 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 36D2B4E40FB2;
 Thu,  9 Oct 2025 11:39:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E2B6A6062C;
 Thu,  9 Oct 2025 11:39:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 26ECA102F21B6; 
 Thu,  9 Oct 2025 13:39:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1760009953; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=hfVcbnLGjx4Znw2zLlmguUyQgxO9dRHalaOneqN03RI=;
 b=Zke8aiqnuai6wA9G+lfSgOgUhtL7HhJC/mN5Ym0BcEr8debI/EmSFsnfinioYWxc6J5CWA
 b4slEyLb0t62OejVa0o8rO2dSplAyH87lKXl2RLkD//nHF2DmtwQgvk5oEqtJBct7ukvTu
 KgVs1ejZ0ZpdnGBdq0CfoZPQRIyIIVUXB8JYjfed8XzjpaltVB4FNII6IoKC4seWafgHq0
 qsIqpvfFoJTIsPZH5HqYrJPu3NwgvjZJhEdOoqXbw7pcPzPlldxQxCEJ9XEXL5wyYhYXrK
 0DEHOmNxIW4O5yZOXjPdGfyMIFhN32hLjmZC3JQgZRSeQ853WM5nVQF60nLXkA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH v3 0/7] drm/bridge: protect encoder bridge chain with a mutex
Date: Thu, 09 Oct 2025 13:38:55 +0200
Message-Id: <20251009-drm-bridge-alloc-encoder-chain-mutex-v3-0-c90ed744efec@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAM+e52gC/42NQQ6CMBBFr0K6dkwptqAr72Fc0HaQSaA1LRIM4
 e4WEk3csXwzP+/NLGIgjOySzSzgSJG8S1AcMmba2j0QyCZmggvJz0KCDT3oQDZ96q7zBtAZbzF
 AmpOD/jXgBLqsrBK8koiSJdUzYEPTlrndE7cUBx/eW3XM1+s3oPYFxhw4iEIrYU5lIVV91d4PH
 bmj8T1bE6P4aXPOi51akbRlpRuVy4rXXP1rl2X5AB+5NRQxAQAA
X-Change-ID: 20250925-drm-bridge-alloc-encoder-chain-mutex-b78d62085ee5
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
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

This series ensures that the bridge chain of the encoder will not be
modified while some other concurrent code flows are iterating over it.

This is part of the work towards removal of bridges from a still existing
DRM pipeline without use-after-free. The grand plan was discussed in [1].
Here's the work breakdown (➜ marks the current series):

 1. ➜ add refcounting to DRM bridges (struct drm_bridge)
    (based on devm_drm_bridge_alloc() [0])
    A. ✔ add new alloc API and refcounting (v6.16)
    B. ✔ convert all bridge drivers to new API (v6.17)
    C. ✔ kunit tests (v6.17)
    D. ✔ add get/put to drm_bridge_add/remove() + attach/detach()
         and warn on old allocation pattern (v6.17)
    E. ➜ add get/put on drm_bridge accessors
       1. ✔ drm_bridge_chain_get_first_bridge() + add a cleanup action
            (drm-misc-next)
       2. ✔ drm_bridge_get_prev_bridge() (drm-misc-next)
       3. ✔ drm_bridge_get_next_bridge() (drm-misc-next)
       4. ✔ drm_for_each_bridge_in_chain() (drm-misc-next)
       5. ✔ drm_bridge_connector_init (drm-misc-next)
       6. ➜ protect encoder bridge chain with a mutex
       7. of_drm_find_bridge
       8. drm_of_find_panel_or_bridge, *_of_get_bridge
       9. … enforce drm_bridge_add before drm_bridge_attach
    F. ✔ debugfs improvements
       1. ✔ add top-level 'bridges' file (v6.16)
       2. ✔ show refcount and list removed bridges (drm-misc-next)
 2. … handle gracefully atomic updates during bridge removal
 3. … DSI host-device driver interaction
 4. ✔ removing the need for the "always-disconnected" connector
 5. finish the hotplug bridge work, moving code to the core and potentially
    removing the hotplug-bridge itself (this needs to be clarified as
    points 1-3 are developed)

The per-encoder bridge chain is currently assumed to be static once it is
fully initialized. Work is in progress to add hot-pluggable bridges,
breaking that assumption.

With hotplug and especially hot-unplug, bridges will be added and removed
without notice, and thus be added/removed to/from the encoder chain in
drm_bridge_attach/detach(), concurrently to the code iterating on the
chain. This can result in disruption of the code iterating over the
chain. The rationale is explained by a detailed example in patch 2.

Avoid bugs by introducing a mutex to make list insertion, removal and
iterations mutually exclusive.

[1] https://lore.kernel.org/lkml/20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com/#t

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Changes in v3:
- Re-added the drm_bridge_put() in the for_each macros, leading to largely
  rewrite them
- Removed the drm_encoder_chain_[un]lock() wrappers
- Fixed a potential ABBA deadlock in patch
- Improved some commit messages
- Link to v2: https://lore.kernel.org/r/20251003-drm-bridge-alloc-encoder-chain-mutex-v2-0-78bf61580a06@bootlin.com

Changes in v2:
- Improve commit messages and add documentation as per v1 review
- Patch 4: fixed infinite loop when encoder->bridge_chain is empty
- Link to v1: https://lore.kernel.org/r/20250926-drm-bridge-alloc-encoder-chain-mutex-v1-0-23b62c47356a@bootlin.com

---
Luca Ceresoli (7):
      drm/encoder: add mutex to protect the bridge chain
      drm/encoder: drm_encoder_cleanup: lock the encoder chain mutex during removal
      drm/bridge: drm_bridge_attach: lock the encoder chain mutex during insertion
      drm/bridge: lock the encoder chain in scoped for_each loops
      drm/bridge: prevent encoder chain changes while iterating with list_for_each_entry_from()
      drm/bridge: prevent encoder chain changes while iterating with list_for_each_entry_reverse()
      drm/bridge: prevent encoder chain changes in pre_enable/post_disable

 drivers/gpu/drm/drm_bridge.c  | 83 ++++++++++++++++++++++---------------------
 drivers/gpu/drm/drm_encoder.c | 18 ++++++++--
 include/drm/drm_bridge.h      | 73 +++++++++++++++++++++++--------------
 include/drm/drm_encoder.h     |  4 +++
 4 files changed, 109 insertions(+), 69 deletions(-)
---
base-commit: a036f5fceedb9fbd715565fef7b824a121503de7
change-id: 20250925-drm-bridge-alloc-encoder-chain-mutex-b78d62085ee5

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

