Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5C93813A1
	for <lists+dri-devel@lfdr.de>; Sat, 15 May 2021 00:13:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22ECD6E30C;
	Fri, 14 May 2021 22:13:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24E0E6E30C
 for <dri-devel@lists.freedesktop.org>; Fri, 14 May 2021 22:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621030398;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2mg2n4gV17bGOVE68OZPsALQKP2f9toztfRI91bC8mM=;
 b=SJSmS+USCzJOYlC9+mAE5L8T1qzPlZEan88d/Y5+D+ZWh3KpLMcjCKksR33/T+yOCBvZQa
 KQfW0dLFIRRuOeTIvVf7pF8oOD+c/ubowsg8GRmf6+21DSxszND2u4T6N7oIgRiy+zLb/6
 gJ9Tm5e/O+2w3JuK6Q69SGfNrdGca84=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16-Ml9oYVQjOmqIWf6tu5Dykg-1; Fri, 14 May 2021 18:13:14 -0400
X-MC-Unique: Ml9oYVQjOmqIWf6tu5Dykg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 53E53FC9C;
 Fri, 14 May 2021 22:13:13 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-118-140.rdu2.redhat.com
 [10.10.118.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 652D019D7D;
 Fri, 14 May 2021 22:13:12 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v2] drm/tegra: Get ref for DP AUX channel, not its ddc adapter
Date: Fri, 14 May 2021 18:13:05 -0400
Message-Id: <20210514221305.1783892-1-lyude@redhat.com>
In-Reply-To: <20210423182146.185633-2-lyude@redhat.com>
References: <20210423182146.185633-2-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: linux-tegra@vger.kernel.org, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While we're taking a reference of the DDC adapter for a DP AUX channel in
tegra_sor_probe() because we're going to be using that adapter with the
SOR, now that we've moved where AUX registration happens the actual device
structure for the DDC adapter isn't initialized yet. Which means that we
can't really take a reference from it to try to keep it around anymore.

This should be fine though, because we can just take a reference of its
parent instead.

v2:
* Avoid calling i2c_put_adapter() in tegra_output_remove() for eDP/DP cases

Signed-off-by: Lyude Paul <lyude@redhat.com>
Fixes: 39c17ae60ea9 ("drm/tegra: Don't register DP AUX channels before connectors")
Cc: Lyude Paul <lyude@redhat.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-tegra@vger.kernel.org
---
 drivers/gpu/drm/tegra/output.c | 5 ++++-
 drivers/gpu/drm/tegra/sor.c    | 6 +++---
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/output.c
index 47d26b5d9945..2dacce1ab6ee 100644
--- a/drivers/gpu/drm/tegra/output.c
+++ b/drivers/gpu/drm/tegra/output.c
@@ -180,10 +180,13 @@ int tegra_output_probe(struct tegra_output *output)
 
 void tegra_output_remove(struct tegra_output *output)
 {
+	int connector_type = output->connector.connector_type;
+
 	if (output->hpd_gpio)
 		free_irq(output->hpd_irq, output);
 
-	if (output->ddc)
+	if (connector_type != DRM_MODE_CONNECTOR_eDP &&
+	    connector_type != DRM_MODE_CONNECTOR_DisplayPort && output->ddc)
 		i2c_put_adapter(output->ddc);
 }
 
diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index 7b88261f57bb..4e0e3a63e586 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -3739,11 +3739,11 @@ static int tegra_sor_probe(struct platform_device *pdev)
 		if (!sor->aux)
 			return -EPROBE_DEFER;
 
-		if (get_device(&sor->aux->ddc.dev)) {
-			if (try_module_get(sor->aux->ddc.owner))
+		if (get_device(sor->aux->dev)) {
+			if (try_module_get(sor->aux->dev->driver->owner))
 				sor->output.ddc = &sor->aux->ddc;
 			else
-				put_device(&sor->aux->ddc.dev);
+				put_device(sor->aux->dev);
 		}
 	}
 
-- 
2.31.1

