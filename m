Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F388FA10FB4
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 19:17:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DAFF10E04A;
	Tue, 14 Jan 2025 18:17:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="O4YPce7h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A67F610E04A
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 18:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1736878632;
 bh=orOv4edbjxywNug6opMKqJSNbEcpgshfOwgILgiaAA4=;
 h=From:Subject:Date:To:Cc:From;
 b=O4YPce7hPpf+Dp2MCZrIZ7oIYK0secjPCprtNKewTYeuXtTPHrDs84exdahy8fzTW
 WdGv03+GYr0NSE74CwggdK7DwGqZkLDbqu+lV4FoUuaxMV9rqTNz97WvUo8v+DUh01
 XTYG4z1a6PqnZsjAfrD8XW9kV+ssxwyTzp1pJFMej2Vi2Eh4EbhEWBDqeJzZb7bwsJ
 E5gZ6kA4w2VGqL/c35hSl8RimeyRcX1ATpnuPV+faqVLgl2logII6tMHuBa3ZLKHp3
 7a6x4PnJbwa6iJzUBMuorTy0Bcfs5hGDgPql30fMG04Tx2c1s03Cao9bZYsoSNyUlY
 FFgnFrS4NJypw==
Received: from localhost (unknown [82.76.59.196])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 3401717E08EE;
 Tue, 14 Jan 2025 19:17:12 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH v3 0/2] Fixup drm_atomic_helper_connector_hdmi_check()
Date: Tue, 14 Jan 2025 20:16:55 +0200
Message-Id: <20250114-hdmi-conn-null-mode-v3-0-16bca91e11b0@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABeqhmcC/33NwQ7CIAyA4VdZOFsDyDbnyfcwHhgUR8JgASWaZ
 e8u28kY4/Fv2q8zSRgtJnKqZhIx22SDL3HYVUQN0t8QrC5NOOU1ZbSFQY8WVPAe/MM5GING6JG
 qGkWH+qhIuZwiGvvc1Mu19GDTPcTX9iSzdfrfywwYGGNEj6LRjDZnFZyTfYhyr8JIVjPzT6f77
 XCg0CFKw8pKLdpvZ1mWN1SxnXwCAQAA
X-Change-ID: 20250107-hdmi-conn-null-mode-be0c5e49ed8c
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
X-Mailer: b4 0.14.2
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

Fix a NULL pointer dereference discovered while unloading a DRM module
and provide a test to make sure the helper works as expected in case the
connector's CRTC is shut down.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
Changes in v3:
- Drop the unnecessary test case changing bpc (Maxime)
- Link to v2: https://lore.kernel.org/r/20250109-hdmi-conn-null-mode-v2-0-9eeaf1109547@collabora.com

Changes in v2:
- Collected R-b tags from Dmitry and Angelo
- Add a 2nd patch providing a couple of KUnit tests (Maxime)
- Link to v1: https://lore.kernel.org/r/20250107-hdmi-conn-null-mode-v1-1-fff4be46d106@collabora.com

---
Cristian Ciocaltea (2):
      drm/connector: hdmi: Handle NULL display mode in state check helper
      drm/tests: hdmi: Add connector's CRTC deactivation test

 drivers/gpu/drm/display/drm_hdmi_state_helper.c    |  3 +
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 76 ++++++++++++++++++++++
 2 files changed, 79 insertions(+)
---
base-commit: 938fbb16aba8f7b88e0fdcf56f315a5bbad41aad
change-id: 20250107-hdmi-conn-null-mode-be0c5e49ed8c

