Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97ED02A386A
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 02:19:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 540D76E7DA;
	Tue,  3 Nov 2020 01:19:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88C046E7DA;
 Tue,  3 Nov 2020 01:19:14 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 83FCC223EA;
 Tue,  3 Nov 2020 01:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604366354;
 bh=IAyK6rwbXaedPokaEbAQ1fGa2dVLGXqgJwZU377OoBg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VazkdwKeQSpbRuy7wwfADyG3nxIBuSUeDeQ7eo9fI8ti1U3rTG9fCZQT/3qCqiOKn
 yVEysyo8ab6Un3ulZ0RYaXlDzP6u5dxTnDmf9U/a0sYn1At2EZCTp1NyYbdDxCHPq+
 Q9Zt9OTjg6jiX8OpRXWEtk086yvT+OzlGeJ42s6o=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.9 25/35] drm/amd/display: adding
 ddc_gpio_vga_reg_list to ddc reg def'ns
Date: Mon,  2 Nov 2020 20:18:30 -0500
Message-Id: <20201103011840.182814-25-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201103011840.182814-1-sashal@kernel.org>
References: <20201103011840.182814-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, amd-gfx@lists.freedesktop.org,
 Martin Leung <martin.leung@amd.com>, Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Martin Leung <martin.leung@amd.com>

[ Upstream commit a1d2afc5dde29a943d32bf92eb0408c9f19541fc ]

why:
oem-related ddc read/write fails without these regs

how:
copy from hw_factory_dcn20.c

Signed-off-by: Martin Leung <martin.leung@amd.com>
Acked-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../drm/amd/display/dc/gpio/dcn30/hw_factory_dcn30.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/gpio/dcn30/hw_factory_dcn30.c b/drivers/gpu/drm/amd/display/dc/gpio/dcn30/hw_factory_dcn30.c
index 7e7fb65721073..9d3665f88c523 100644
--- a/drivers/gpu/drm/amd/display/dc/gpio/dcn30/hw_factory_dcn30.c
+++ b/drivers/gpu/drm/amd/display/dc/gpio/dcn30/hw_factory_dcn30.c
@@ -117,6 +117,12 @@ static const struct ddc_registers ddc_data_regs_dcn[] = {
 	ddc_data_regs_dcn2(4),
 	ddc_data_regs_dcn2(5),
 	ddc_data_regs_dcn2(6),
+	{
+			DDC_GPIO_VGA_REG_LIST(DATA),
+			.ddc_setup = 0,
+			.phy_aux_cntl = 0,
+			.dc_gpio_aux_ctrl_5 = 0
+	}
 };
 
 static const struct ddc_registers ddc_clk_regs_dcn[] = {
@@ -126,6 +132,12 @@ static const struct ddc_registers ddc_clk_regs_dcn[] = {
 	ddc_clk_regs_dcn2(4),
 	ddc_clk_regs_dcn2(5),
 	ddc_clk_regs_dcn2(6),
+	{
+			DDC_GPIO_VGA_REG_LIST(CLK),
+			.ddc_setup = 0,
+			.phy_aux_cntl = 0,
+			.dc_gpio_aux_ctrl_5 = 0
+	}
 };
 
 static const struct ddc_sh_mask ddc_shift[] = {
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
