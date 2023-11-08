Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4EE7E557A
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 12:27:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14CAE10E54B;
	Wed,  8 Nov 2023 11:27:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40E0F10E54B
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 11:27:46 +0000 (UTC)
Received: from [127.0.1.1] (91-158-149-209.elisa-laajakaista.fi
 [91.158.149.209])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id DFF9F836;
 Wed,  8 Nov 2023 12:27:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1699442842;
 bh=WLlM2Gj86xmd+GbYCmiHz2C8v5cjM4EtVETq+IRWFE4=;
 h=From:Subject:Date:To:Cc:From;
 b=GtbD2JcVPHpKp8Nqv4Q6YWAZDmbsvIKiOEOXQgncVrf8MjzwySxBtHhjTP43+Lzq0
 c0SgYsYQU1l35qf0frUjjUot2angs1u6/tEoylfcBohpBIVRg8uRKQtdyqlV/2J0RG
 R5Njy8kHcg9hrRZ8swU8r3LivKMPMAyVHJeFRVRQ=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v2 0/2] drm/bridge: tc358767: Fix
 DRM_BRIDGE_ATTACH_NO_CONNECTOR case
Date: Wed, 08 Nov 2023 13:27:21 +0200
Message-Id: <20231108-tc358767-v2-0-25c5f70a2159@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJlwS2UC/23MOw7CMBBF0a1EU2PkDyEOFftAKfwZkymIIzuyQ
 JH3jklNeZ+ezg4ZE2GGW7dDwkKZ4tJCnjpws1meyMi3BsmlElwJtjnV6+E6sF6jQuvD2AcO7b4
 mDPQ+qMfUeqa8xfQ55CJ+6x+kCMaZGiXXwvgxXOydPJocFxtN8mcXXzDVWr87KBjSpwAAAA==
To: Aradhya Bhatia <a-bhatia1@ti.com>, Jan Kiszka <jan.kiszka@siemens.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Sam Ravnborg <sam@ravnborg.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1014;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=WLlM2Gj86xmd+GbYCmiHz2C8v5cjM4EtVETq+IRWFE4=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBlS3Cp2Psvm6UdFUslz/VwjM/5Qnlofze9iahHy
 7TC9kVOLU6JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZUtwqQAKCRD6PaqMvJYe
 9Z71D/4toHZpwhIU6URTpk+gga4lT90VInuN3gvBPsILkCv8luuQXZ26db8MlBK4eG8Ri2U49Kf
 ktAOJI3dQbwV7crCUYxeu6IQojal5Uk060zBdKpb3en4455xIDwqzLvo+UON1y39ujtLyyADlxd
 hyxwy2wFfd37gNvSN8WHe8sMKif8Oxhal1ZH0CPRVzStvgjem4MOkj1vLqD3kLAyBdMaylhS9yT
 L5QoYofwghvD3XwRyuytKvmjjGlpiprD+RuWHdr4fugru4X8qR/zNlMRwYugnhCZqUkhRUClXHx
 0y0ALiKIydEixfaqZ40ZZiWc6JDmdtb7Pbow7Q/KOSJGs/wf94s4gdbMqo+Cah3oKffgV4vbmuc
 SpZnAxdFpujmoZn6wHi3frbAkai5JgI3pUdKnl8K0GucYhZj4J5EyU01PsKIfF9JvzItxE1/Wgn
 XJ8cK13UsH6x+Hzl69AAoqpuK1R8c3nque/v0/8tingC5ENfR1tX2Od9pOkTkah6tQ1Blbdunfc
 RRjw7HL7MnGPQSNUS4P/33u6CDwEV6Kp4Jvwf2/cdq91S9lyXGC1pSHmZ1PODiZ2N4LAt09zISM
 GpfEtamA7nt3QfDByszNphKMprYfYJz8N29WYGQMc60AhtxAkz/qGs+lrAbHYES1+X7kEfhmyRG
 cxgU1MJFtgyRc5w==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
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
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These two patches are needed to make tc358767 work in the
DRM_BRIDGE_ATTACH_NO_CONNECTOR case, at least when using a DP connector.

I have tested this with TI AM654 EVM with a tc358767 add-on card
connected to a DP monitor.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
Changes in v2:
- Update the format negotiation patch as discussed in https://lore.kernel.org/all/7ddf0edb-2925-4b7c-ad07-27c030dd0232@ti.com/
- Link to v1: https://lore.kernel.org/r/20231031-tc358767-v1-0-392081ad9f4b@ideasonboard.com

---
Aradhya Bhatia (1):
      drm/bridge: tc358767: Add format negotiation hooks for DPI/DSI to (e)DP

Tomi Valkeinen (1):
      drm/bridge: tc358767: Fix link properties discovery

 drivers/gpu/drm/bridge/tc358767.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)
---
base-commit: 9d7c8c066916f231ca0ed4e4fce6c4b58ca3e451
change-id: 20231031-tc358767-58e3ebdf95f0

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

