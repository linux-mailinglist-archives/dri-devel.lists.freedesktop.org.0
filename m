Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 735FF7DDE3D
	for <lists+dri-devel@lfdr.de>; Wed,  1 Nov 2023 10:18:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5C1510E673;
	Wed,  1 Nov 2023 09:18:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D586510E00C
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Nov 2023 09:18:35 +0000 (UTC)
Received: from [127.0.1.1] (91-158-149-209.elisa-laajakaista.fi
 [91.158.149.209])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0FAC610A;
 Wed,  1 Nov 2023 10:18:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1698830297;
 bh=KDBqiyHpUiWqE9LlgSir8cXq7P/eXR0JYCTzpxb+T/E=;
 h=From:Subject:Date:To:Cc:From;
 b=vD7BUhnfYYUX1OjlqHOh5WGD8DBQqMaFNVmzvCBE+vxoheG8DOXTA6Fz5sTsK8diJ
 mrmCtv0xQefTHeT4YTlktKyJ0AF0nn7IDV0i2iQGgkvE88uDhAwQYmOSpSf4vMxXcL
 1W1gY/ZiljAHLCSwKS+C8oapxRyw3RtCEzVFaqpU=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH 00/10] drm/tidss: Probe related fixes and cleanups
Date: Wed, 01 Nov 2023 11:17:37 +0200
Message-Id: <20231101-tidss-probe-v1-0-45149e0f9415@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALIXQmUC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI2NDA2MD3ZLMlOJi3YKi/KRUXQtTkyRDA0uLZOPENCWgjoKi1LTMCrBp0bG
 1tQDbJP+yXQAAAA==
To: Aradhya Bhatia <a-bhatia1@ti.com>, Devarsh Thakkar <devarsht@ti.com>, 
 Jyri Sarha <jyri.sarha@iki.fi>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1199;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=KDBqiyHpUiWqE9LlgSir8cXq7P/eXR0JYCTzpxb+T/E=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBlQhfiusMXS3MadwpIxmqOghMJxK1fq4JHNWr4c
 oB1iVMWeK6JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZUIX4gAKCRD6PaqMvJYe
 9YGlD/9T9veLXbd5iW04wy/7nFUZP4o8JeWjILHcI2RNq8STE+iC0RCd0QsjB/KfbAJXPcmbRsX
 xt/daCLsbxTFsvEpYOXMkEf44vHuVAR6+IDLV+CtSmYVFfxHGm3pEfgjj2d3btZMmwbYn6xkf2k
 qLAM1P2JiMt6JagMrOEHPz61Ctpixe1woUxjui5od6KA3IqzpabASWnlFyKds8QVX4zH95R3j4T
 ZVoMvkofFk18GUB9kRo+nJdPpva6fY+qmJvUQvEamzHJEt0fUi45BdP+8+5uYRBfy+dcSr5zYNX
 Jv6P3YBSswXgHbKDel4cGvHV+MqdLu5FjJir93ii0+68IRScTw70fGfXK3szFSNyjGN5y2f27Bd
 YQ8JKWrPqAuz+f/2r/xZUZc/rdnLTJkGt77RpOOOjPXKU1kOxeqi7eqdqSHiWHn1pJrhidYofB6
 YxMgFJv7hRVBS4i16t5+7JFFA+6YFkOlLtfmoeOwX2RUnrQcRIl/ajI0sMKXU7UI1afTKN+CLqC
 C4LDi7E8HyCBrkEkXNFM7GJ0vCaTVtw2t2572LDeLAWanukpmbOkHKgGPuPAsidgngjP+JRrgGr
 5boPDwsmy+VE7p7SEAnq5liYgpreK6O8pVHB8PsCyPhXOv5NKYQeEepQtkLnC+OwItX0zWtHtFU
 rlmsWsGREqHKZjA==
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While working on the TI BSP kernel, adding bootload splash screen
support, I noticed some issues with the driver and opportunities for
cleanups and improvements.

 Tomi

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
Tomi Valkeinen (10):
      drm/tidss: Use pm_runtime_resume_and_get()
      drm/tidss: Use PM autosuspend
      drm/tidss: Drop useless variable init
      drm/tidss: Move reset to the end of dispc_init()
      drm/tidss: Return error value from from softreset
      drm/tidss: Check for K2G in in dispc_softreset()
      drm/tidss: Fix dss reset
      drm/tidss: Add dispc_is_idle()
      drm/tidss: IRQ code cleanup
      drm/tidss: Fix atomic_flush check

 drivers/gpu/drm/tidss/tidss_crtc.c  |  9 ++---
 drivers/gpu/drm/tidss/tidss_dispc.c | 76 +++++++++++++++++++++++++++++++++----
 drivers/gpu/drm/tidss/tidss_drv.c   | 14 +++++--
 drivers/gpu/drm/tidss/tidss_irq.c   | 54 ++++----------------------
 4 files changed, 92 insertions(+), 61 deletions(-)
---
base-commit: 9d7c8c066916f231ca0ed4e4fce6c4b58ca3e451
change-id: 20231030-tidss-probe-854b1098c3af

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

