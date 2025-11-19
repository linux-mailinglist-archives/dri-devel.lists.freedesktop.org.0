Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA037C6F397
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 15:21:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7CB410E638;
	Wed, 19 Nov 2025 14:21:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="C+eBw700";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20D6210E606
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 14:21:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 91EA260163;
 Wed, 19 Nov 2025 14:21:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E9AE5C4AF1B;
 Wed, 19 Nov 2025 14:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763562102;
 bh=+vN9i6hkDYH07rTuHLCdDYvotY6UX7pwnmerlFATOVU=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=C+eBw700b/FQDhMbSSxKN9HY7ZTdYjXlxuDHtgbGxAlIIQTDZ0USj0SkF5DlOop/b
 F0P2CFaLCiLanFiUO1W74etVZG580FF7bUb65UJLSTDS/lCEy+HZjV6FGzEJOmRbg6
 f8ANdaj0h/ayw00eSvslgrH/abNyrEJZ6EpRgWjyInM8grrLZ0U0L+95vxFyFk//SA
 xEmUsU8ofs/0RmaGMjqsvFm5oH+2DavbsXswjyqLRgCTBkocjVd83QW1n3zcZukTGd
 XSQohGkbNXs/UWh8wOinTs1TjTuBgo7FMiYS9Nw1l5gyubfPpiqlDRbr8Ed7MCGK7S
 L9GccgzTFTppA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 02824CF34C3;
 Wed, 19 Nov 2025 14:21:41 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Wed, 19 Nov 2025 15:21:34 +0100
Subject: [PATCH v3 09/12] drm/panel: sofef00: Introduce compatible which
 includes the panel name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-sofef00-rebuild-v3-9-6cd55471e84e@ixit.cz>
References: <20251119-sofef00-rebuild-v3-0-6cd55471e84e@ixit.cz>
In-Reply-To: <20251119-sofef00-rebuild-v3-0-6cd55471e84e@ixit.cz>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1754; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=P0KIvmsjpu/GWMlI4xRr9BftnVEaKH9jmqWZeoZaE+o=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpHdJyDdkZ1dEYA7cSJjMj0hi5SZJtdieQo1zH8
 OUiuQgGWg6JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaR3ScgAKCRBgAj/E00kg
 clXaEADNKwuBmStKGfsh+h+OK2PQP+yZXa0WJEoWH6Qg5AwLC9bwI4Mr7iO3wYgwWEASDGL9p+A
 vm691Nzgl8UpQCIgIJbCNZkeQB3RmL9Bt0NjP6t3OtiBrKTE5wjb9BwOlIcXpGwAA1KVW+rgCvL
 qS422FqiRWXjnJ2U+TxU5h85AGIAYHtFA0JIS5ULcpNHkSyE18O70XWNN2GjgMedH5wZm2BpADy
 mGgTjVt5w7PqMue0iSNBGnsNP/36kKWyqDHOjfhO9+6p37yWx0LKPTnHsFGCpuL+cSH3R8+uaSL
 4RKaHMA+rMZA8jE7YczNs7GB7MkRd4fUI+QREwkcd0IHda/Uh5jlMVR0kQVUrLJb6HtQgZoi1cx
 05CjK7wjOasbwZK6V0buaDxyUneAuLuATF/kbPRdJzxn+jgziTFOtodZpT7jtQFXkwjD0RVu6Dt
 5Cdhpv0/8e52O1mIzqdNqisDq68WimwLFnKbaDC9/Z7njqnhKRMaqss11a0E5uV82axkdwBlvGO
 lGzpWh1+ZruDm/I7weozNtttI6XLBtcEBJYPqVjpvnk7DpY4yOWmOsaaKRF4wFXki5sutCztU/H
 PqIozS8EfHqneoZFH6OBG6dFtPTSs9oICmY+2JG/zBl7Cspheu+LfItnelfEGxTGDxU7dPmcfiD
 Hzx9olMhPW40gAA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
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
Reply-To: david@ixit.cz
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: David Heidelberg <david@ixit.cz>

Compatible should correspond to the panel used and the driver currently
supports only AMS628NW01 panel. Adapt the internal driver structures to
reflect the name.
Original, not very descriptive, compatible is kept to ensure compatibility
with older device-trees.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/gpu/drm/panel/panel-samsung-sofef00.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-sofef00.c b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
index d1e5340d7e337..c2cb85997e4f3 100644
--- a/drivers/gpu/drm/panel/panel-samsung-sofef00.c
+++ b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
@@ -141,7 +141,7 @@ static int sofef00_panel_unprepare(struct drm_panel *panel)
 	return 0;
 }
 
-static const struct drm_display_mode enchilada_panel_mode = {
+static const struct drm_display_mode ams628nw01_panel_mode = {
 	.clock = (1080 + 112 + 16 + 36) * (2280 + 36 + 8 + 12) * 60 / 1000,
 	.hdisplay = 1080,
 	.hsync_start = 1080 + 112,
@@ -159,7 +159,7 @@ static int sofef00_panel_get_modes(struct drm_panel *panel, struct drm_connector
 {
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(connector->dev, &enchilada_panel_mode);
+	mode = drm_mode_duplicate(connector->dev, &ams628nw01_panel_mode);
 	if (!mode)
 		return -ENOMEM;
 
@@ -274,7 +274,8 @@ static void sofef00_panel_remove(struct mipi_dsi_device *dsi)
 }
 
 static const struct of_device_id sofef00_panel_of_match[] = {
-	{ .compatible = "samsung,sofef00" },
+	{ .compatible = "samsung,sofef00" }, /* legacy */
+	{ .compatible = "samsung,sofef00-ams628nw01" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, sofef00_panel_of_match);

-- 
2.51.0


