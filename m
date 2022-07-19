Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B00857A85B
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jul 2022 22:39:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9662814BB3A;
	Tue, 19 Jul 2022 20:39:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA19A14BADB
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jul 2022 20:39:06 +0000 (UTC)
Received: from notapiano.myfiosgateway.com
 (pool-98-113-53-228.nycmny.fios.verizon.net [98.113.53.228])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 8FAFB66019F4;
 Tue, 19 Jul 2022 21:39:04 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1658263145;
 bh=Aq5S2gkpJATVIFJkGq8D34wf45tOEaY6CNq3MR0BK0w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gZuUFo9Vy6cZQoonAOzTsCRvxxn2F+ic4Ay7DsNSAm1Q0HLQxF9C/s/43Fa1TRkyJ
 C0mSmFFyYBNtnVYvPQFvZgzF9Hs2RrbtIXE0TKmiX0RHIRK+EI1t8jPUoCvuGE6LcY
 8TrGVP7AwDkOCUNu/bWwEgZBVN8DcqG39jzg2VkKLBdvX1JQbMH+3U+8jdq7atksab
 m6A07wpR1XcEsCxYYb5StPXHEdyR9mKlKCAoUlSzE2jFJ4qwN68sFPjGh1lSMFRWa6
 p58epxBKKype+4S9oBmnK+F8/kO/GsUPzUwIITECtf+yyIGkwoNzTRzvh1flalhJxH
 +4nHrVfukDZbQ==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH 3/3] drm/panel-edp: Fix variable typo when saving hpd absent
 delay from DT
Date: Tue, 19 Jul 2022 16:38:56 -0400
Message-Id: <20220719203857.1488831-4-nfraprado@collabora.com>
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

The value read from the "hpd-absent-delay-ms" property in DT was being
saved to the wrong variable, overriding the hpd_reliable delay. Fix the
typo.

Fixes: 5540cf8f3e8d ("drm/panel-edp: Implement generic "edp-panel"s probed by EDID")
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---

 drivers/gpu/drm/panel/panel-edp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 152e00eb846f..b3536d8600f4 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -738,7 +738,7 @@ static int generic_edp_panel_probe(struct device *dev, struct panel_edp *panel)
 	of_property_read_u32(dev->of_node, "hpd-reliable-delay-ms", &reliable_ms);
 	desc->delay.hpd_reliable = reliable_ms;
 	of_property_read_u32(dev->of_node, "hpd-absent-delay-ms", &absent_ms);
-	desc->delay.hpd_reliable = absent_ms;
+	desc->delay.hpd_absent = absent_ms;
 
 	/* Power the panel on so we can read the EDID */
 	ret = pm_runtime_get_sync(dev);
-- 
2.37.0

