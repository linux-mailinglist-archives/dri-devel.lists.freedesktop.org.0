Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A2B635D55
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 13:44:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90D3410E542;
	Wed, 23 Nov 2022 12:44:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE35810E1F8
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 12:44:24 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9EF02B81F71;
 Wed, 23 Nov 2022 12:44:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31C20C433D6;
 Wed, 23 Nov 2022 12:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669207462;
 bh=32JwF+5T8eFUXcCsM12zv8TYnKDw38lIf0unECxX/LA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JcTQY8GRguawQLauYB9pih2v+S72nKrd7BuNdi6QVaNj/F1kpxeGG3XJhRlsxKjdl
 dBeDmVIjKGx+xTWGgT4xdoP+02H5lnPjqYJXZ1/bC6XfOhwQFyTJrOR8+nTCHP19EU
 GYsSV7Ua9BbW57EbyzuwSVoUxQHHtwkJdxY4v86ZBVH1rEjB/XWz6Fk++QMRixdHB4
 WeUS5BYlyWBX5oZM7SAqTgFZRbfY9zfCQY/OL6XUnq2V8079cDOg7C35HESytiJCQF
 qjojaLifFzSOwBenNG4LRUnEkHJ9I7k2utKZSAqC1rCXCUsQN4Nm1CcgUf5Gyh4+C2
 BeixVopdkNKYQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 20/22] gpu: host1x: Avoid trying to use GART on
 Tegra20
Date: Wed, 23 Nov 2022 07:43:35 -0500
Message-Id: <20221123124339.265912-20-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221123124339.265912-1-sashal@kernel.org>
References: <20221123124339.265912-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>, thierry.reding@gmail.com,
 linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
 Thierry Reding <treding@nvidia.com>, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Robin Murphy <robin.murphy@arm.com>

[ Upstream commit c2418f911a31a266af4fbaca998dc73d3676475a ]

Since commit c7e3ca515e78 ("iommu/tegra: gart: Do not register with
bus") quite some time ago, the GART driver has effectively disabled
itself to avoid issues with the GPU driver expecting it to work in ways
that it doesn't. As of commit 57365a04c921 ("iommu: Move bus setup to
IOMMU device registration") that bodge no longer works, but really the
GPU driver should be responsible for its own behaviour anyway. Make the
workaround explicit.

Reported-by: Jon Hunter <jonathanh@nvidia.com>
Suggested-by: Dmitry Osipenko <digetx@gmail.com>
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
Tested-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/tegra/drm.c | 4 ++++
 drivers/gpu/host1x/dev.c    | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 2c6ebc328b24..318692ad9680 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -1042,6 +1042,10 @@ static bool host1x_drm_wants_iommu(struct host1x_device *dev)
 	struct host1x *host1x = dev_get_drvdata(dev->dev.parent);
 	struct iommu_domain *domain;
 
+	/* Our IOMMU usage policy doesn't currently play well with GART */
+	if (of_machine_is_compatible("nvidia,tegra20"))
+		return false;
+
 	/*
 	 * If the Tegra DRM clients are backed by an IOMMU, push buffers are
 	 * likely to be allocated beyond the 32-bit boundary if sufficient
diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index 8659558b518d..9f674a8d5009 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -198,6 +198,10 @@ static void host1x_setup_sid_table(struct host1x *host)
 
 static bool host1x_wants_iommu(struct host1x *host1x)
 {
+	/* Our IOMMU usage policy doesn't currently play well with GART */
+	if (of_machine_is_compatible("nvidia,tegra20"))
+		return false;
+
 	/*
 	 * If we support addressing a maximum of 32 bits of physical memory
 	 * and if the host1x firewall is enabled, there's no need to enable
-- 
2.35.1

