Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6DE36994B
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 20:22:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77CF36E41D;
	Fri, 23 Apr 2021 18:22:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 416FB6E419
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 18:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619202126;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5hFClZUo+ZUrVv6GNReQdb27crFUBCckSOkdFq2klEc=;
 b=aKaSZ2bs2suhg9pojgZc4r/lwi9KzkZ2RQuxApIwf1qvFsdLAMB5KQ7i01QvQWhxo6Kovt
 8Hcvt1W5qyzZH2MwNbF3sY6JGGdJPtCgA/w/8oaKmOW74rNpJIE4wATqwdiy893YdPGiXm
 4pqRL/e7Zg84U40OVUynRz9FivrSN14=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-0TDybKMoMemyOfKuO8aJdQ-1; Fri, 23 Apr 2021 14:22:04 -0400
X-MC-Unique: 0TDybKMoMemyOfKuO8aJdQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C1F9D81746C;
 Fri, 23 Apr 2021 18:22:02 +0000 (UTC)
Received: from Ruby.lyude.net (ovpn-114-74.rdu2.redhat.com [10.10.114.74])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A371960613;
 Fri, 23 Apr 2021 18:22:01 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/tegra: Get ref for DP AUX channel, not its ddc adapter
Date: Fri, 23 Apr 2021 14:21:45 -0400
Message-Id: <20210423182146.185633-2-lyude@redhat.com>
In-Reply-To: <20210423182146.185633-1-lyude@redhat.com>
References: <20210423182146.185633-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While we're taking a reference of the DDC adapter for a DP AUX channel in
tegra_sor_probe() because we're going to be using that adapter with the
SOR, now that we've moved where AUX registration happens the actual device
structure for the DDC adapter isn't initialized yet. Which means that we
can't really take a reference from it to try to keep it around anymore.

This should be fine though, because we can just take a reference of its
parent instead.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Fixes: 39c17ae60ea9 ("drm/tegra: Don't register DP AUX channels before connectors")
Cc: Lyude Paul <lyude@redhat.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-tegra@vger.kernel.org
---
 drivers/gpu/drm/tegra/sor.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

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
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
