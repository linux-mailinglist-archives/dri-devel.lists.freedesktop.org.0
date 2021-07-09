Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 496B63C29A7
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 21:29:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DC146EA6B;
	Fri,  9 Jul 2021 19:29:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB1F76EA6B
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jul 2021 19:29:34 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id p8so13602525wrr.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jul 2021 12:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nO2VGF0GrX8eq1kIPmNF9NDL8unf6/wwgmYeLn0z60A=;
 b=OTDWKUWGMl6zGndK9eFgIokkIOVkQtjxt4yGNj4M4Od9i5+nNyrhzGyizKj5jeBTB2
 8+V7ngN/unevaFcHVs73EPGa5RSfW+XZWlryVS/Kn6P4pQoUPLE0rMvSJ88d4ywqi12r
 zAcgWkgaK6mDWL36JqHrdoPvoZmqBJTRh19YGkk142Y90VFWB/P6P/ika13nbxNWsX68
 LAviBBmvafT74ur/doA7CjqRCSTZdWJsNhmjJDOoM8uK1PxNts11+W3N7SFwb7NkVlxB
 CI+uFsUhH9ivqUsSmGNd9yYVklIsic3L0w8CzpFNVCJiXZy/t8AIkKoTQD4qILsJ4/Oh
 9iWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nO2VGF0GrX8eq1kIPmNF9NDL8unf6/wwgmYeLn0z60A=;
 b=j4ay/k8KsZFtJYU8Mb8lVtgSudscO40V1ZX3Hk/eJdjJjUzUecEJMFpH1m2KcYT0TB
 fbpoD0nrtRHIImNyFbmTbW672V/La4pbwxOUgYbXPw0MVKORP6XM9BA+eJIik2J1nGD/
 2pkS6GKt8IFw+f7pB6k4FtfNtGdWjaqx+4sYlU7rtBa7od92oFSic9OOThiizWfJv5yy
 6W5Cr5b/P13UMrzYfTm7eVVriXHgt/9UKy9qEiE81rUWyGtDSmET9gxMR48mMxYfmVXb
 eLZhUTX9xWy6c4ksqXuoS2uGuNJcXanwDIbQVbphFncSy7lwNAHNEr0rfJ/LsWsVwdj6
 V7CA==
X-Gm-Message-State: AOAM533g+RMT1Mu9AOAkBQIszQ89AocHDh69fkb5V5wfOEZRtluRuuNp
 Fk9i5HEvDM/7avONWt9DCfk=
X-Google-Smtp-Source: ABdhPJwexKMid8Y7ZFKxgXv6gNWN+bjD3QttXFUzwM+raTEJLtzfVRBbUUVNPsA8qfmKvt/mmduqaQ==
X-Received: by 2002:a05:6000:1867:: with SMTP id
 d7mr36571354wri.263.1625858973547; 
 Fri, 09 Jul 2021 12:29:33 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id t6sm6144348wru.75.2021.07.09.12.29.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 12:29:32 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v8 08/14] drm/tegra: Allocate per-engine channel in core code
Date: Fri,  9 Jul 2021 21:31:40 +0200
Message-Id: <20210709193146.2859516-9-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210709193146.2859516-1-thierry.reding@gmail.com>
References: <20210709193146.2859516-1-thierry.reding@gmail.com>
MIME-Version: 1.0
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
Cc: linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mikko Perttunen <mperttunen@nvidia.com>

To avoid code duplication, allocate the per-engine shared channel in
the core code instead. This is the usual channel that all jobs are
submitted to when MLOCKing is not in use. Once MLOCKs are implemented
on Host1x side, we can also update this to avoid allocating a shared
channel when MLOCKs are enabled.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/drm.c | 11 +++++++++++
 drivers/gpu/drm/tegra/drm.h |  2 ++
 2 files changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 87954e69ab6c..cddee6425461 100644
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
2.32.0

