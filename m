Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DAE57A85C
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jul 2022 22:39:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AFE614BB00;
	Tue, 19 Jul 2022 20:39:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFD2B14BB00
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jul 2022 20:39:03 +0000 (UTC)
Received: from notapiano.myfiosgateway.com
 (pool-98-113-53-228.nycmny.fios.verizon.net [98.113.53.228])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 81AFA6601A3D;
 Tue, 19 Jul 2022 21:39:01 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1658263142;
 bh=yOsyoTXecbnpR+05MoxtIppKOEPuY7CytKHIOjJLXrI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=N0XMnIEyAk8gNYUxn57slek8jQfjqHtzk47gpqD22xdCI8YeTXc7n8wXnjoxAjQ6p
 gWgyIbLsWH+KwEkxm9CCAQTlParvg+kT7STLFl9Zzt4pc3NhMJRxr8JScpRRYJHAZ+
 /S99eoMABwvqYp8ZWec+LT7OycnOLUUZ+LIZksv/ro6Uepqyyf3aeUx6LBU0sj5SGb
 d+dmvmMDr826ZZ7P15NZvKPmiE+h3q3wQsPCo34NSGWqfLFD1dwTiHJm+T5SBoZ0uH
 8MuL60jA/9NmRYDkEVLt6ZAlluZM373OaEv+m57jt2jyrjAjLfgNY7P3mZpdFZaKV3
 yXQzwOyaH7VkA==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH 1/3] drm/panel-edp: Add panel entry for R140NWF5 RH
Date: Tue, 19 Jul 2022 16:38:54 -0400
Message-Id: <20220719203857.1488831-2-nfraprado@collabora.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220719203857.1488831-1-nfraprado@collabora.com>
References: <20220719203857.1488831-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add panel identification entry for the IVO R140NWF5 RH (product ID:
0x057d) panel.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

---
The comments on the driver indicate that the T3 timing should be set on
hpd_absent, while hpd_reliable would have a shorter time just while the
HPD line stabilizes on low after power is supplied.

But can we really assume that the HPD line will be reliable at all
before the DDIC is done booting up, at which point the HPD line is
brought up? IOW, shouldn't we always delay T3 (by setting hpd_reliable =
T3), since only then we're really sure that the DDIC is done setting up
and the HPD line is reliable?

I've set the T3 delay to hpd_absent in this series, following what's
instructed in the comments, but I'd like to discuss whether we shouldn't
be setting T3 on hpd_reliable instead, for all panels, to be on the
safer side.

 drivers/gpu/drm/panel/panel-edp.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 3626469c4cc2..675d793d925e 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1854,6 +1854,12 @@ static const struct panel_delay delay_100_500_e200 = {
 	.enable = 200,
 };
 
+static const struct panel_delay delay_200_500_e200 = {
+	.hpd_absent = 200,
+	.unprepare = 500,
+	.enable = 200,
+};
+
 #define EDP_PANEL_ENTRY(vend_chr_0, vend_chr_1, vend_chr_2, product_id, _delay, _name) \
 { \
 	.name = _name, \
@@ -1882,6 +1888,8 @@ static const struct edp_panel_entry edp_panels[] = {
 
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x114c, &innolux_n116bca_ea1.delay, "N116BCA-EA1"),
 
+	EDP_PANEL_ENTRY('I', 'V', 'O', 0x057d, &delay_200_500_e200, "R140NWF5 RH"),
+
 	EDP_PANEL_ENTRY('K', 'D', 'B', 0x0624, &kingdisplay_kd116n21_30nv_a010.delay, "116N21-30NV-A010"),
 	EDP_PANEL_ENTRY('K', 'D', 'B', 0x1120, &delay_200_500_e80_d50, "116N29-30NK-C007"),
 
-- 
2.37.0

