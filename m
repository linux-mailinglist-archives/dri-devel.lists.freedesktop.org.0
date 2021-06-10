Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B106E3A29CE
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 13:05:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C9876ECDD;
	Thu, 10 Jun 2021 11:05:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 881D36ECD0
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 11:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Bz7icMlerWU3EIZFQ48oLtiHmZcEHpvPBGumwN5CwyI=; b=om+xPDm2i9cRQJiHeYsyWNw1vG
 Btiy2KmPrS16kCnObbMb7d1C5FsZTS5eQ7whFMvkeLGWiJ3xTmWltwkUAJxKmQpwzFYTWqpXwSaJ3
 km9zCoOfsjkkrm/SzE60l2N3EV4vO8xBXFGp4Zv1qTcQ55pokgXfwl6Uz6tXO0gSLFSKSuurW5LMl
 6i2L3tg3qF+PoZIARSg2WbQzqt+NwVN2+NSLVswQnhyWX6aYcGqItPxfy5YyMa1P6CDySfebwprwT
 yBDG1y2FbQMTHZCy+WMnUG5yDyENWwhGV26OddDKJ2vzUvEUuJK2erKefQHnvqbS2X7JeaBrlFOF4
 lwNLldsw==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=toshino.localdomain)
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <mperttunen@nvidia.com>)
 id 1lrIUt-0001s7-Bf; Thu, 10 Jun 2021 14:05:15 +0300
From: Mikko Perttunen <mperttunen@nvidia.com>
To: thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH v7 09/15] drm/tegra: Allocate per-engine channel in core code
Date: Thu, 10 Jun 2021 14:04:50 +0300
Message-Id: <20210610110456.3692391-10-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210610110456.3692391-1-mperttunen@nvidia.com>
References: <20210610110456.3692391-1-mperttunen@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.249.134.236
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

To avoid code duplication, allocate the per-engine shared channel in
the core code instead. This is the usual channel that all jobs are
submitted to when MLOCKing is not in use. Once MLOCKs are implemented
on Host1x side, we can also update this to avoid allocating a shared
channel when MLOCKs are enabled.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
v6:
- Reorder fields in drm.h to put core-controlled fields first
---
 drivers/gpu/drm/tegra/drm.c | 11 +++++++++++
 drivers/gpu/drm/tegra/drm.h |  2 ++
 2 files changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index f7dc50e5f817..00ac687c81b5 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -870,6 +870,14 @@ static const struct drm_driver tegra_drm_driver = {
 int tegra_drm_register_client(struct tegra_drm *tegra,
 			      struct tegra_drm_client *client)
 {
+	/*
+	 * When MLOCKs are implemented, change to allocate a shared channel
+	 * only when MLOCKs are disabled.
+	 */
+	client->shared_channel = host1x_channel_request(&client->base);
+	if (!client->shared_channel)
+		return -EBUSY;
+
 	mutex_lock(&tegra->clients_lock);
 	list_add_tail(&client->list, &tegra->clients);
 	client->drm = tegra;
@@ -886,6 +894,9 @@ int tegra_drm_unregister_client(struct tegra_drm *tegra,
 	client->drm = NULL;
 	mutex_unlock(&tegra->clients_lock);
 
+	if (client->shared_channel)
+		host1x_channel_put(client->shared_channel);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
index 0cb868065348..536861017d24 100644
--- a/drivers/gpu/drm/tegra/drm.h
+++ b/drivers/gpu/drm/tegra/drm.h
@@ -91,7 +91,9 @@ struct tegra_drm_client {
 	struct host1x_client base;
 	struct list_head list;
 	struct tegra_drm *drm;
+	struct host1x_channel *shared_channel;
 
+	/* Set by driver */
 	unsigned int version;
 	const struct tegra_drm_client_ops *ops;
 };
-- 
2.30.1

