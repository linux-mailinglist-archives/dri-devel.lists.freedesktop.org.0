Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DAEC970842
	for <lists+dri-devel@lfdr.de>; Sun,  8 Sep 2024 16:56:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE18210E292;
	Sun,  8 Sep 2024 14:56:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=kwiboo.se header.i=@kwiboo.se header.b="ZWFw9OF1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F066110E290
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Sep 2024 14:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1725807347; bh=Z2Cb05mWFWfLkKZu5GopUYFl3Iafbmet5hEZs8+nUeA=;
 b=ZWFw9OF16J2MAEap+3I5h+/az2xi/wHRm7DllMZjY0aQd7sjFlUhM/H+FinAB7Km48FhKRnqw
 IGE8v5JowRdcX9XWgyYCHMbu//+nXvqEh035H/W5T2z9N//axANOb9VN93Ed53+TKtEUOOGepKe
 Jq8Glb3tWa4tZ95gXSAxiXbnj71SFioMLm1QpXPlOZDkaH9UjMa8sdik2yQYEkPDS9NDi2cx9zn
 wuj0njHuyUpbrrybPmuLJty8WSJK8htzDrI+/xG/jAm9oweo6QjhwyI5s70HEkfRik5epconors
 yF/T92FDl+eRPSSIQs4EoKjzkcDyB9ueUgUvHqcjtwdg==
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Diederik de Haas <didi.debian@cknow.org>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v2 6/7] drm/rockchip: dw_hdmi: Enable 4K@60Hz mode on RK3399
 and RK356x
Date: Sun,  8 Sep 2024 14:55:03 +0000
Message-ID: <20240908145511.3331451-7-jonas@kwiboo.se>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240908145511.3331451-1-jonas@kwiboo.se>
References: <20240908145511.3331451-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Report-Abuse-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-ForwardEmail-Version: 0.4.40
X-ForwardEmail-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-ForwardEmail-ID: 66ddbaf13c9877b459588eff
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

Use a maximum TMDS clock rate limit of 594MHz to enable use of HDMI2.0
modes, e.g. 4K@60Hz, on RK3399 and RK3568.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
Tested-by: Diederik de Haas <didi.debian@cknow.org> # Quartz64 Model B
---
v2: Collect t-b tag
---
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
index 090d8c0f306f..96e1097f993d 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
@@ -481,7 +481,7 @@ static struct rockchip_hdmi_chip_data rk3399_chip_data = {
 	.lcdsel_grf_reg = RK3399_GRF_SOC_CON20,
 	.lcdsel_big = HIWORD_UPDATE(0, RK3399_HDMI_LCDC_SEL),
 	.lcdsel_lit = HIWORD_UPDATE(RK3399_HDMI_LCDC_SEL, RK3399_HDMI_LCDC_SEL),
-	.max_tmds_clock = 340000,
+	.max_tmds_clock = 594000,
 };
 
 static const struct dw_hdmi_plat_data rk3399_hdmi_drv_data = {
@@ -495,7 +495,7 @@ static const struct dw_hdmi_plat_data rk3399_hdmi_drv_data = {
 
 static struct rockchip_hdmi_chip_data rk3568_chip_data = {
 	.lcdsel_grf_reg = -1,
-	.max_tmds_clock = 340000,
+	.max_tmds_clock = 594000,
 };
 
 static const struct dw_hdmi_plat_data rk3568_hdmi_drv_data = {
-- 
2.46.0

