Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 266FE4EEFCC
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 16:29:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4753310E9E2;
	Fri,  1 Apr 2022 14:29:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89E4310EB0E
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 14:29:40 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EE75D61C43;
 Fri,  1 Apr 2022 14:29:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9540EC2BBE4;
 Fri,  1 Apr 2022 14:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648823379;
 bh=eTiovVUCen7xNYJkwiLrMjheRNdT5H42VgeNdAbVmjY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iY0HzFuPYi+s0imDltpHRMocEkETTYKm61R7TfU9XFe15ev2tKsadFIjBfhl02lFb
 23Zuo9dtQXdKg2SKm4hEkFbkAkGGY9G0VYyf47ZzNoUnSElMYsUk9RE5Q7HERRH4ZW
 YTxKYiAJMgDnmwbkGH5JxnSajZcke2nAzp/n4lnJ3CUijcxBISuDYSUFKn3LAuhmml
 /J4LHvSbXLRPQZuUHesQDza/22Wo6Zqtl4a0ARA8Zxb0VtfVa9EKWUWIdzRsiUIazw
 vToQivUPl2eEwt3uE159IXhUMAd/kZ3K8dpM5JaEt/A/xJspaRvmH9T4MfgQ+dEUg+
 /yiJY+DNBxAFA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.17 072/149] drm/sprd: check the
 platform_get_resource() return value
Date: Fri,  1 Apr 2022 10:24:19 -0400
Message-Id: <20220401142536.1948161-72-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220401142536.1948161-1-sashal@kernel.org>
References: <20220401142536.1948161-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Kevin Tang <kevin3.tang@gmail.com>,
 airlied@linux.ie, zhang.lyra@gmail.com,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 maxime@cerno.tech, Thomas Zimmermann <tzimmermann@suse.de>,
 baolin.wang7@gmail.com, orsonzhai@gmail.com, Zou Wei <zou_wei@huawei.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Kevin Tang <kevin3.tang@gmail.com>

[ Upstream commit 73792e6e66be1225837cc1a40f1e39b1d077751c ]

platform_get_resource() may fail and return NULL, so check it's value
before using it.

Reported-by: Zou Wei <zou_wei@huawei.com>
Signed-off-by: Kevin Tang <kevin3.tang@gmail.com>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Link: https://lore.kernel.org/all/20220117084156.9338-1-kevin3.tang@gmail.com

v1 -> v2:
- new patch

Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/sprd/sprd_dpu.c | 5 +++++
 drivers/gpu/drm/sprd/sprd_dsi.c | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/sprd/sprd_dpu.c b/drivers/gpu/drm/sprd/sprd_dpu.c
index 06a3414ee43a..1637203ea103 100644
--- a/drivers/gpu/drm/sprd/sprd_dpu.c
+++ b/drivers/gpu/drm/sprd/sprd_dpu.c
@@ -790,6 +790,11 @@ static int sprd_dpu_context_init(struct sprd_dpu *dpu,
 	int ret;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res) {
+		dev_err(dev, "failed to get I/O resource\n");
+		return -EINVAL;
+	}
+
 	ctx->base = devm_ioremap(dev, res->start, resource_size(res));
 	if (!ctx->base) {
 		dev_err(dev, "failed to map dpu registers\n");
diff --git a/drivers/gpu/drm/sprd/sprd_dsi.c b/drivers/gpu/drm/sprd/sprd_dsi.c
index 911b3cddc264..12b67a5d5923 100644
--- a/drivers/gpu/drm/sprd/sprd_dsi.c
+++ b/drivers/gpu/drm/sprd/sprd_dsi.c
@@ -907,6 +907,11 @@ static int sprd_dsi_context_init(struct sprd_dsi *dsi,
 	struct resource *res;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res) {
+		dev_err(dev, "failed to get I/O resource\n");
+		return -EINVAL;
+	}
+
 	ctx->base = devm_ioremap(dev, res->start, resource_size(res));
 	if (!ctx->base) {
 		drm_err(dsi->drm, "failed to map dsi host registers\n");
-- 
2.34.1

