Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD2A7DDE41
	for <lists+dri-devel@lfdr.de>; Wed,  1 Nov 2023 10:18:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F1CB10E674;
	Wed,  1 Nov 2023 09:18:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0430F10E051
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Nov 2023 09:18:37 +0000 (UTC)
Received: from [127.0.1.1] (91-158-149-209.elisa-laajakaista.fi
 [91.158.149.209])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A68F68E1;
 Wed,  1 Nov 2023 10:18:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1698830299;
 bh=xQfh4wFKSK2nLKdijYY1UXEQqCMe4QymvcSpQaHogdw=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=jPCXMnQlK5QA+NqQ5hjcsWNTq9cQXbhcyJgOPZIsF3DARySjdLJKLrzvGIgX2DK8F
 dzT80FHD5Wsl45jzxgy8UwRwhwUJXqL078FLSXGQIG8tw7YZ1RT+i0sCRqaAH6L0fN
 43tT3dMXxEHYncXH15dYGEBAld5wukbngtbxCqN0=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 01 Nov 2023 11:17:39 +0200
Subject: [PATCH 02/10] drm/tidss: Use PM autosuspend
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231101-tidss-probe-v1-2-45149e0f9415@ideasonboard.com>
References: <20231101-tidss-probe-v1-0-45149e0f9415@ideasonboard.com>
In-Reply-To: <20231101-tidss-probe-v1-0-45149e0f9415@ideasonboard.com>
To: Aradhya Bhatia <a-bhatia1@ti.com>, Devarsh Thakkar <devarsht@ti.com>, 
 Jyri Sarha <jyri.sarha@iki.fi>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1500;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=xQfh4wFKSK2nLKdijYY1UXEQqCMe4QymvcSpQaHogdw=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBlQhfm0I1aAJ++gXl9qnfA5qLiH+x6aRiH7mAW5
 zUZv9k+nuiJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZUIX5gAKCRD6PaqMvJYe
 9YG1D/40auunKVvVoDGofklPD3crxDwf0t3XWtc9ifEcq1Es7pzT0bGRlJEA/QtVknEd/WoaMId
 VTEE0zkuesRfqrb7FWvPVzfmPypjevvBvfh5bzYBHykZM1weROy5rM50aCM8C8bcNycTnKtNiN4
 35TvD/cCYulFpH0TCDuNFk6CyR4agCnmar6JtbbDNG4BgIW1fq0knzLAuAdK/nRnPMb1Flv+b/C
 KHPFKCC4FfCuauDhpk4ddsjJlGeLSu8XpLMuP6tWWV/LmDG6BfRtmP23yWXz3Pq8g+knewoN9GP
 odpXfOP1ZOA0HTW15vQsQiTypWsFnaHd/Mn2DqD/EvtAisfp102e47UJg6gKsU/6WwNbcIvhV6U
 mh6mfko8ilsMa2IkR4vmOYG/Guwa8DGkOfDiDhe397tHt9HzkBBPreIPVuuYVhbplrMGAcK/7jk
 U0cfZIOrGVE2hSF9Tcq7HUtk0UJQrZ22m5d2i7FWU1SbcuTRJ6iPLejmPWf2/5ZOyneZgWBpX2u
 /d650d6D3am8cYYyoqL0RtWdUt7knVMZ033HahQzpdkBObMxYkHiJYAGFWjfkV80CKXqnjwIIpj
 /AaG24xgseqw8ZH94ivjlxH6Swc6QYlVbMsoa/HID6JhXelZoBfdy6WjRvYPQmJMcYwrkwzfy6v
 tn0raEbb3/qropw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
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
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use runtime PM autosuspend feature, with 1s timeout, to avoid
unnecessary suspend-resume cycles when, e.g. the userspace temporarily
turns off the crtcs when configuring the outputs.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/tidss/tidss_drv.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
index f403db11b846..64914331715a 100644
--- a/drivers/gpu/drm/tidss/tidss_drv.c
+++ b/drivers/gpu/drm/tidss/tidss_drv.c
@@ -43,7 +43,9 @@ void tidss_runtime_put(struct tidss_device *tidss)
 
 	dev_dbg(tidss->dev, "%s\n", __func__);
 
-	r = pm_runtime_put_sync(tidss->dev);
+	pm_runtime_mark_last_busy(tidss->dev);
+
+	r = pm_runtime_put_autosuspend(tidss->dev);
 	WARN_ON(r < 0);
 }
 
@@ -144,6 +146,9 @@ static int tidss_probe(struct platform_device *pdev)
 
 	pm_runtime_enable(dev);
 
+	pm_runtime_set_autosuspend_delay(dev, 1000);
+	pm_runtime_use_autosuspend(dev);
+
 #ifndef CONFIG_PM
 	/* If we don't have PM, we need to call resume manually */
 	dispc_runtime_resume(tidss->dispc);
@@ -215,6 +220,7 @@ static void tidss_remove(struct platform_device *pdev)
 	/* If we don't have PM, we need to call suspend manually */
 	dispc_runtime_suspend(tidss->dispc);
 #endif
+	pm_runtime_dont_use_autosuspend(dev);
 	pm_runtime_disable(dev);
 
 	/* devm allocated dispc goes away with the dev so mark it NULL */

-- 
2.34.1

