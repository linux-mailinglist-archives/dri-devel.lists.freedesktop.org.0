Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99ED39D87B6
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 15:20:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DC2910E666;
	Mon, 25 Nov 2024 14:20:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=geanix.com header.i=@geanix.com header.b="UiOcUpXX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1460210E661
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 14:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com; 
 s=default2211;
 h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References; bh=QFkmN5/AIJVNMn/fY5/nPE6hxTuKJ8kdCgzvY8ANXv0=; b=Ui
 OcUpXXU5DoRQrTujmQVvo+gXQsDG8zxhh4Jw9cs7bgHLQfSQF29//1GlOfqsnITLAxDWKMmq5lCe4
 XEvHH3OpAfw5YMaPyBbSr6chLFJhOVZlsPepDhZ+T4ahEq2CVJgkQsvXih1aypuLkQEl6SwhVcxNZ
 TAFha6pmabINsQXjBMiisq8w883Gx2CzEDEgdc+3joRrtW+pNnAeY/hX7Tbw5RpXM2TV40lwFRaIH
 01nVIQEAGLq0hzRVVXTBGwfrPRncRNn27pQOdIBtoT1RFt6bo8VeWQE8wHL0p2hE0tPxMmpg6rqlm
 gf7tW8pMxXQzm3GmSBIS5rACM2V3UUzw==;
Received: from sslproxy08.your-server.de ([78.47.166.52])
 by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <sean@geanix.com>)
 id 1tFZTA-000CcV-R3; Mon, 25 Nov 2024 14:49:40 +0100
Received: from [185.17.218.86] (helo=zen.localdomain)
 by sslproxy08.your-server.de with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.96) (envelope-from <sean@geanix.com>) id 1tFZT9-000A3a-2Q;
 Mon, 25 Nov 2024 14:49:39 +0100
From: Sean Nyekjaer <sean@geanix.com>
Subject: [PATCH v2 0/3] drm/stm: dsi: relax mode_valid clock tolerance
Date: Mon, 25 Nov 2024 14:49:25 +0100
Message-Id: <20241125-dsi-relax-v2-0-9113419f4a40@geanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGWARGcC/x2MQQqDMBBFryKzbiQzSRW66j3ERRpHHWi1JEVSJ
 Hdvms2H93m8EyIH4Qi35oTAh0TZtwJ0acCvbltYyVQYSJNFpKuaoqjAT5cUWrQPN3d+6i0U/x1
 4llRbw1h4lfjZw7emD/y/taINEWrbG2rJUK87rVBFdtt9KSOp9fsLxpzzD8aKpzGcAAAA
X-Change-ID: 20241125-dsi-relax-1414baf6cd74
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Yannick Fertre <yannick.fertre@foss.st.com>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
 Philippe Cornu <philippe.cornu@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-stm32@st-md-mailman.stormreply.com, Sean Nyekjaer <sean@geanix.com>
X-Mailer: b4 0.14.2
X-Authenticated-Sender: sean@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27468/Mon Nov 25 10:36:56 2024)
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

Introduce helper function to check if the pixel clock is within
tolerance.

Signed-off-by: Sean Nyekjaer <sean@geanix.com>
---
Changes in v2:
- Introduce helper function drm_mode_validate_mode()
- drm/stm: use helper function for mode validation
- drm/sun4i: use helper function for mode validation
- Link to v1: https://lore.kernel.org/r/20240322104732.2327060-1-sean@geanix.com

---
Sean Nyekjaer (3):
      drm/modes: introduce drm_mode_validate_mode() helper function
      drm/sun4i: use drm_mode_validate_mode() helper function
      drm/stm: dsi: use drm_mode_validate_mode() helper function

 drivers/gpu/drm/drm_modes.c           | 34 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/stm/dw_mipi_dsi-stm.c | 12 +++++-------
 drivers/gpu/drm/sun4i/sun4i_rgb.c     | 22 ++++------------------
 include/drm/drm_modes.h               |  2 ++
 4 files changed, 45 insertions(+), 25 deletions(-)
---
base-commit: 28eb75e178d389d325f1666e422bc13bbbb9804c
change-id: 20241125-dsi-relax-1414baf6cd74

Best regards,
-- 
Sean Nyekjaer <sean@geanix.com>

