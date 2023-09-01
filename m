Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5EE478FC21
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 13:15:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F01310E788;
	Fri,  1 Sep 2023 11:15:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD38310E788
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 11:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YwKEeOgpiUZiivfYlYqRThnVlVFrulC8B9sPCohC3rA=; b=yZXL2LgKsFF1jrLj+8qd80dOX3
 4ksdx/vhHMx/oTjPLsloBnVfgoDamh4QHs4CZMGQ23Z/H9E0fcrZYiF3Y4PzFxbMFRxfLt9HQKQBc
 wLaSuYuuqcHUWOeG/kVsP4jSvpg7/u/9OSvuY8gjs0TTshH4mUiLKDYUtUl06QTFZFOhdPmdAHAlb
 5UDMEXTytiTLIWzDjn4YUTORPqEq0swzMph1K9oe5lcvGrjos/BYgDy9WjUByJwgUYRyk6xlWx8nd
 qy0v80tBNrJsLTbwlcZoWRUzTOaUXLGbZmajW0dBQoPyfwKUQANCFhuqcF2lKLV24LHNEQi89irc9
 CJ1usYnQ==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70]
 helo=toshino.localdomain) by mail.kapsi.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <cyndis@kapsi.fi>) id 1qc27l-008kr0-0U;
 Fri, 01 Sep 2023 14:15:37 +0300
From: Mikko Perttunen <cyndis@kapsi.fi>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 1/3] gpu: host1x: Add locking in channel allocation
Date: Fri,  1 Sep 2023 14:15:07 +0300
Message-ID: <20230901111510.663401-1-cyndis@kapsi.fi>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 91.158.25.70
X-SA-Exim-Mail-From: cyndis@kapsi.fi
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mikko Perttunen <mperttunen@nvidia.com>

Add locking around channel allocation to avoid race conditions.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/host1x/channel.c | 7 +++++++
 drivers/gpu/host1x/channel.h | 3 +++
 2 files changed, 10 insertions(+)

diff --git a/drivers/gpu/host1x/channel.c b/drivers/gpu/host1x/channel.c
index 2d0051d6314c..79501c957532 100644
--- a/drivers/gpu/host1x/channel.c
+++ b/drivers/gpu/host1x/channel.c
@@ -27,6 +27,8 @@ int host1x_channel_list_init(struct host1x_channel_list *chlist,
 		return -ENOMEM;
 	}
 
+	mutex_init(&chlist->lock);
+
 	return 0;
 }
 
@@ -104,8 +106,11 @@ static struct host1x_channel *acquire_unused_channel(struct host1x *host)
 	unsigned int max_channels = host->info->nb_channels;
 	unsigned int index;
 
+	mutex_lock(&chlist->lock);
+
 	index = find_first_zero_bit(chlist->allocated_channels, max_channels);
 	if (index >= max_channels) {
+		mutex_unlock(&chlist->lock);
 		dev_err(host->dev, "failed to find free channel\n");
 		return NULL;
 	}
@@ -114,6 +119,8 @@ static struct host1x_channel *acquire_unused_channel(struct host1x *host)
 
 	set_bit(index, chlist->allocated_channels);
 
+	mutex_unlock(&chlist->lock);
+
 	return &chlist->channels[index];
 }
 
diff --git a/drivers/gpu/host1x/channel.h b/drivers/gpu/host1x/channel.h
index 39044ff6c3aa..b23a8071fbd0 100644
--- a/drivers/gpu/host1x/channel.h
+++ b/drivers/gpu/host1x/channel.h
@@ -10,6 +10,7 @@
 
 #include <linux/io.h>
 #include <linux/kref.h>
+#include <linux/mutex.h>
 
 #include "cdma.h"
 
@@ -18,6 +19,8 @@ struct host1x_channel;
 
 struct host1x_channel_list {
 	struct host1x_channel *channels;
+
+	struct mutex lock;
 	unsigned long *allocated_channels;
 };
 
-- 
2.41.0

