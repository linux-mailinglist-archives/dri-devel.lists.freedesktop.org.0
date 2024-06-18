Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B29D990C4C5
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 10:15:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA7CD10E5C6;
	Tue, 18 Jun 2024 08:15:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="Fp+dgBEQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37DF110E5C4
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 08:15:09 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45I8EJgW025729;
 Tue, 18 Jun 2024 03:14:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1718698459;
 bh=PSyC1cSgLHJUy5WdcIFWpbRsw57FqFOYek3lPPDMuRA=;
 h=From:To:CC:Subject:Date;
 b=Fp+dgBEQHt68q3YP9JNiqiWBdMX5J7jNrwnK02toesuVapUDKNU44pt6AiySFFvYz
 mSMMaif3bicHlJi+pHro2OmFDxP01IZrDF2NkRCP66e6QNuePB+UtXHJL0yski0uNV
 cTHUcsOT5fxibM3VqEvA3dm0nwEBMLrGKwAZeRvk=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45I8EJwD128587
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 18 Jun 2024 03:14:19 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 18
 Jun 2024 03:14:19 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 18 Jun 2024 03:14:19 -0500
Received: from localhost (jayesh-hp-probook-440-g8-notebook-pc.dhcp.ti.com
 [172.24.227.55])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45I8EI1N116957;
 Tue, 18 Jun 2024 03:14:19 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <dianders@chromium.org>, <andrzej.hajda@intel.com>,
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <mripard@kernel.org>,
 <j-choudhary@ti.com>
CC: <linux-kernel@vger.kernel.org>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <spanda@codeaurora.org>, <a-bhatia1@ti.com>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 0/2] SN65DSI86 minor fixes
Date: Tue, 18 Jun 2024 13:44:16 +0530
Message-ID: <20240618081418.250953-1-j-choudhary@ti.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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

Hello All,

These 2 patches add the atomic check hook for sn65dsi86 bridge and
does a minor math fix for dsi rate calculation.

According to the datasheet[0], for the max resolution, it says:
  Suitable for 60 fps 4K 4096 x 2304 resolution at 18
  bpp color, and WUXGA 1920 x 1200 resolution
  with 3D graphics at 60 fps (120 fps equivalent)

A very usual clock frequency for 4K@60fps resolution is 594MHz.
So keeping the max value supported by the bridge as 600MHz for
safe check.

DSI clock frequency range check are as per datasheet[0].

Changelog v1->v2:
- Check the value in atomic_check hook
- Fix the "Fixes" tag
- Fix MAX_DSI_CLK_RANGE to reflect actual supported value
- Add mode_clock check to ensure that the bit_rate_khz variable
  does not overflow instead of justifying by reverse calculation
  in comments.
- Fix commit message to show that the math uissue was found during
  code inspection.

v1 patch:
<https://lore.kernel.org/all/20240408073623.186489-1-j-choudhary@ti.com/>

[0]: <https://www.ti.com/lit/gpn/sn65dsi86>

Jayesh Choudhary (2):
  drm/bridge: ti-sn65dsi86: Add atomic_check hook for the bridge
  drm/bridge: ti-sn65dsi86: Fix ti_sn_bridge_set_dsi_rate function

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 67 +++++++++++++++++++--------
 1 file changed, 47 insertions(+), 20 deletions(-)

-- 
2.25.1

