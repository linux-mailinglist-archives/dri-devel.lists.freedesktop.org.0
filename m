Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 116DD13E2A7
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2020 17:57:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EABF6EE01;
	Thu, 16 Jan 2020 16:57:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9893E6EE00;
 Thu, 16 Jan 2020 16:57:35 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 90F2621D56;
 Thu, 16 Jan 2020 16:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579193855;
 bh=PLDBIh757ifk7THB4hs9CKcE47ZrZpHVvq1miCA2JYE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eJg5vSlVnxBLvvocwEyeG52Io+ThR/paqUFg71GYTRyVgxiDsqZjlOKJ6VdDUBFnQ
 +igobd8wM6v3tCo7GXleYM6zgSbDn6PhRBJuDSDay8sqBUlNNn9RGtWOTLtFVZOBnw
 C0btU5ME4ff4J8t02bdkd1yXf7g5DsErC5Coeca0=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 105/671] drm/etnaviv: fix some off by one bugs
Date: Thu, 16 Jan 2020 11:45:36 -0500
Message-Id: <20200116165502.8838-105-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116165502.8838-1-sashal@kernel.org>
References: <20200116165502.8838-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dan Carpenter <dan.carpenter@oracle.com>

[ Upstream commit f5fd9fd4000984f19db689282054953981a50534 ]

The ->nr_signal is the supposed to be the number of elements in the
->signal array.  There was one place where it was 5 but it was supposed
to be 4.  That looks like a copy and paste bug.  There were also two
checks that were off by one.

Fixes: 9e2c2e273012 ("drm/etnaviv: add infrastructure to query perf counter")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Reviewed-by: Christian Gmeiner <christian.gmeiner@gmail.com>
Tested-by: Christian Gmeiner <christian.gmeiner@gmail.com>
Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/etnaviv/etnaviv_perfmon.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c b/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
index 9980d81a26e3..4227a4006c34 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
@@ -113,7 +113,7 @@ static const struct etnaviv_pm_domain doms_3d[] = {
 		.name = "PE",
 		.profile_read = VIVS_MC_PROFILE_PE_READ,
 		.profile_config = VIVS_MC_PROFILE_CONFIG0,
-		.nr_signals = 5,
+		.nr_signals = 4,
 		.signal = (const struct etnaviv_pm_signal[]) {
 			{
 				"PIXEL_COUNT_KILLED_BY_COLOR_PIPE",
@@ -435,7 +435,7 @@ int etnaviv_pm_query_sig(struct etnaviv_gpu *gpu,
 
 	dom = meta->domains + signal->domain;
 
-	if (signal->iter > dom->nr_signals)
+	if (signal->iter >= dom->nr_signals)
 		return -EINVAL;
 
 	sig = &dom->signal[signal->iter];
@@ -461,7 +461,7 @@ int etnaviv_pm_req_validate(const struct drm_etnaviv_gem_submit_pmr *r,
 
 	dom = meta->domains + r->domain;
 
-	if (r->signal > dom->nr_signals)
+	if (r->signal >= dom->nr_signals)
 		return -EINVAL;
 
 	return 0;
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
