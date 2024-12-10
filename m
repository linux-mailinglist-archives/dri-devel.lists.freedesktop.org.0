Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C1E9EB835
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 18:28:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C975710E0DE;
	Tue, 10 Dec 2024 17:28:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="VcaCLNHg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02B4610E07A
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 17:28:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3C3A01C0003;
 Tue, 10 Dec 2024 17:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1733851701;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=r/lwH/9FFZhCHPOhzFsV+WkNAhCphb56D0IaE/dZeYY=;
 b=VcaCLNHg5ogDTdxM7wRTzF5sqhLZpmb/8OsCRVj55l2ExpzcH/dEYfq7r6vXYHU5NRcEfS
 5p69xwYR/bchT9cmiuBvGYTrXGenQwcXIVkfY6BkfJ8DXO/gIigjHvn+6kSmdcpo7HRrGx
 Qu/5D7rDpOu5Ejfk2cqy++XwAnsgkLeF25bDojNUboNX7ltzVzRDpgmmPel+niLQe8Lbb8
 nwLZUMgxE3E/J5m1BDwXYRv4A9pP9wMuP8y+3xgXYaHKhzDvZoxWw47n6bmImO1BSIbGp7
 b0hCLTo0TOHMFdDgHuvUM2vbye8rTABEuMI5h54HC4pWGjUVEO1fyUvJmWkJMQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH 0/2] drm/panel: simple: Add Tianma TM070JDHG34-00 DT
 bindings and driver support
Date: Tue, 10 Dec 2024 18:28:02 +0100
Message-Id: <20241210-tianma_tm070jdhg34-v1-0-9fb7fe6b6cf0@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACJ6WGcC/x3M0QpAMBSA4VfRubY6mxPyKpKGg6OMtiUl7265/
 C7+/4HAXjhAkz3g+ZIgh0vQeQbjat3CSqZkMGhIG40qinW77eOOFW7TuhSkShyHmggHXRKk8PQ
 8y/1P2+59P+I8cvBkAAAA
X-Change-ID: 20241210-tianma_tm070jdhg34-60cb8440b164
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-Sasl: luca.ceresoli@bootlin.com
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

This small series adds DT bindings and panel-simple implementation for the
Tianma TM070JDHG34-00 7" panel. Due to how the datasheet computes the
blanking time, a quirk is needed in the timing implementation. A comment
documents that in patch 2.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Luca Ceresoli (2):
      dt-bindings: display: simple: Add Tianma TM070JDHG34-00 panel
      drm/panel: simple: Add Tianma TM070JDHG34-00 panel support

 .../bindings/display/panel/panel-simple.yaml       |  2 ++
 drivers/gpu/drm/panel/panel-simple.c               | 42 ++++++++++++++++++++++
 2 files changed, 44 insertions(+)
---
base-commit: 2ade8304e5fce7b972ef46011946186f1466c9bf
change-id: 20241210-tianma_tm070jdhg34-60cb8440b164

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

