Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7D79DEDB5
	for <lists+dri-devel@lfdr.de>; Sat, 30 Nov 2024 01:00:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF15810E36E;
	Sat, 30 Nov 2024 00:00:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="epTdT6qU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5708110E04D
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2024 00:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1732924829;
 bh=EKQm2CeHWzWU4OiN1m7A1Caw19UNYuKsVB7OYItlHL4=;
 h=From:Subject:Date:To:Cc:From;
 b=epTdT6qU6V8pgXZ7h5HnlIGD2va5HyK355aReGOlH7WvV6sqVZYl/9txAntyyKShx
 xEPqTNC4Y8qdNjijL1HZQq4GA4cFHQQPJmKfM6PnOsZDgRZKWrIR6TxJ49I1O6SKq+
 1ccpYGWXYIh53POhrIpOcGoJCIZdTcxXffHd1LI4eU8E7QenGryztAODSiPUa6lLzY
 mU4RPlmBpL1V/BVcFHR2zD2lBbLSapg1vYn5AhZEVRD1mqrCrLqb3cPhYSX4U7spXA
 PRsYM9MPifoJ6pw/+PbvZrw2wTnbtI4UL+TPz6bLJDEongUk/G6r9VXxn5d7ytsh3C
 4m99h69epeeKQ==
Received: from localhost (unknown [86.120.21.57])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id B9D5C17E0E37;
 Sat, 30 Nov 2024 01:00:29 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH 0/3] drm/connector: hdmi: Allow using the YUV420 output format
Date: Sat, 30 Nov 2024 01:56:31 +0200
Message-Id: <20241130-hdmi-conn-yuv-v1-0-254279a08671@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK9USmcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDQ2MD3YyU3Ezd5Py8PN3K0jLdVMO0RFNLs5Q0czMLJaCegqLUtMwKsHn
 RsbW1AAAnREZfAAAA
X-Change-ID: 20241130-hdmi-conn-yuv-e1fa596df768
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

Provide the basic support to enable using YUV420 as an RGB fallback when
computing the best output format and color depth.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
Cristian Ciocaltea (3):
      drm/connector: hdmi: Evaluate limited range after computing format
      drm/connector: hdmi: Add support for YUV420 format verification
      drm/connector: hdmi: Use YUV420 output format as an RGB fallback

 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 55 ++++++++++++++++++++-----
 1 file changed, 45 insertions(+), 10 deletions(-)
---
base-commit: f486c8aa16b8172f63bddc70116a0c897a7f3f02
change-id: 20241130-hdmi-conn-yuv-e1fa596df768

