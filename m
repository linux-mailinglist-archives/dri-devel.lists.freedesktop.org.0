Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCAA2F00A4
	for <lists+dri-devel@lfdr.de>; Sat,  9 Jan 2021 16:13:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A042F6E89F;
	Sat,  9 Jan 2021 15:13:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [5.144.164.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16F786E844
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Jan 2021 13:51:17 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 0F3A51F4EA;
 Sat,  9 Jan 2021 14:51:14 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH 0/5] Clock fixes for DSI 10nm PLL
Date: Sat,  9 Jan 2021 14:51:07 +0100
Message-Id: <20210109135112.147759-1-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 09 Jan 2021 15:13:22 +0000
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
Cc: airlied@linux.ie, freedreno@lists.freedesktop.org,
 konrad.dybcio@somainline.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, martin.botka@somainline.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 marijn.suijten@somainline.org, phone-devel@vger.kernel.org, sean@poorly.run
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DSI 10nm PLL driver was apparently ported from downstream, but some
of its "features" were not ported over, for a good reason.
Pity is that the removal of the downstream dependencies broke the clock
calculation logic for this driver and that made it impossible to use any
DSI display on at least MSM8998.

This patch series fixes the calculation issues and also solves some TODOs
that I've found in this driver.

Tested on:
- Sony Xperia XZ Premium (MSM8998) dual-dsi command-mode LCD display
- F(x)Tec Pro1 (MSM8998) single dsi, video-mode OLED display

AngeloGioacchino Del Regno (5):
  drm/msm/dsi_pll_10nm: Fix dividing the same numbers twice
  drm/msm/dsi_pll_10nm: Solve TODO for multiplier frac_bits assignment
  drm/msm/dsi_pll_10nm: Fix bad VCO rate calculation and prescaler
  drm/msm/dsi_pll_10nm: Fix variable usage for pll_lockdet_rate
  drm/msm/dsi_pll_10nm: Convert pr_err prints to DRM_DEV_ERROR

 drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c | 43 ++++++++++------------
 1 file changed, 20 insertions(+), 23 deletions(-)

-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
