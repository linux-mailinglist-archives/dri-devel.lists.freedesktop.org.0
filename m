Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5094ABFB7
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 14:42:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD63710F011;
	Mon,  7 Feb 2022 13:42:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1321 seconds by postgrey-1.36 at gabe;
 Mon, 07 Feb 2022 13:42:00 UTC
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3873D10F011
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 13:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dHg/vhDPEuP5iogqPGsue7712DGBhW3650gIFC1Qb+E=; b=UqQGnHOU9YM+5BMtZNfiecBhWW
 eRdcJv6NQBSYivUNOVEQrM2aPfgo8s03Lxggz0aX+7IchPggvo5+B6KbZMsHrwSqbU921kMxirC5/
 umhDBnN9oy+b725nLdA2zGQnN+IfBjsaA2456mv5FKEuaiUYiAdR+cLxyJoocuUL0muoNF/i1E4Ak
 AzgmplJO4/xBME1q9OkMmCZE6Z6/MpwzmFFfXTobD56bXbhY4snYSJYa/Fu+mF7pxaHdKtwJSLBed
 iY8AzERFcqqpSF7V37sEJEkekLu3YRX4enkOAFVAA9OtiN/4SdvQO6+h1zeJuGMA4RNVBNbp5gKuV
 jGp5jIIQ==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70]
 helo=toshino.localdomain)
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <mperttunen@nvidia.com>)
 id 1nH3vx-0007xv-Nd; Mon, 07 Feb 2022 15:19:57 +0200
From: Mikko Perttunen <mperttunen@nvidia.com>
To: thierry.reding@gmail.com
Subject: [PATCH 2/2] gpu: host1x: Fix refcount leak in buffer cache
Date: Mon,  7 Feb 2022 15:19:32 +0200
Message-Id: <20220207131932.2164560-2-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220207131932.2164560-1-mperttunen@nvidia.com>
References: <20220207131932.2164560-1-mperttunen@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 91.158.25.70
X-SA-Exim-Mail-From: mperttunen@nvidia.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The recently introduced buffer cache is causing cached BOs to leak, as
cache entries are dropped when a BO's refcount goes to zero but the
cache itself keeps a reference to each cache BO, causing a circular
reference.

Fix this by not taking a reference to the cached BOs within the cache
itself.

Fixes: 1f39b1dfa53c ("drm/tegra: Implement buffer object cache")
Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
NOTE

As is, applying this patch reveals a BO refcounting issue in the
DC driver. A fix for that bug should be applied before applying
this patch. I believe Thierry will be posting a fix for that
shortly.
---
 drivers/gpu/host1x/bus.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/host1x/bus.c b/drivers/gpu/host1x/bus.c
index bdee16a0bb8e..66ba04501c94 100644
--- a/drivers/gpu/host1x/bus.c
+++ b/drivers/gpu/host1x/bus.c
@@ -938,9 +938,6 @@ struct host1x_bo_mapping *host1x_bo_pin(struct device *dev, struct host1x_bo *bo
 		mapping->cache = cache;
 
 		list_add_tail(&mapping->entry, &cache->mappings);
-
-		/* bump reference count to track the copy in the cache */
-		kref_get(&mapping->ref);
 	}
 
 unlock:
-- 
2.35.0

