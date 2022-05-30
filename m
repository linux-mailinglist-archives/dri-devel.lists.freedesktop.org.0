Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F580537B77
	for <lists+dri-devel@lfdr.de>; Mon, 30 May 2022 15:25:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AECDC10E83F;
	Mon, 30 May 2022 13:25:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5A4410E83F
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 13:25:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A8CB4B80DA7;
 Mon, 30 May 2022 13:25:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7578C36AE7;
 Mon, 30 May 2022 13:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653917116;
 bh=Aoq/ZnXVcKk+p7VdfH7dk2D2Y56VczJQo9MgI9eHjA8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PSDx1dpO0ytd9PdZR6lrDeLETu2aEjqNEZplrbWEkouDB7hHDkr9L2hSF/WLA0z3k
 MZDY2CkUr2YeN6eU5pR+RedOBFx5UJDIphuFG6EHLfBHjDEhUglaVbhcsKTjq16Ryt
 kd2Q4co45UOJDNItSrwRcODZRnOppeh8C2pzFPkSBoUMlWVZONDoU1En2G0Oh86APA
 3GwC5tx2CkuEdrE86WfGb+foh4CSOupBCXBqQg0OUP7mFiss2WO70QYOVWmkrmBVYc
 0QJ4XH1Natv9AnWUt6Qx3RG2edbiRzoJanVJyE7WXc7u3HTghsYwt4o/JobTYzqyBR
 LZX/66obdHeZQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.18 022/159] drm/komeda: return early if
 drm_universal_plane_init() fails.
Date: Mon, 30 May 2022 09:22:07 -0400
Message-Id: <20220530132425.1929512-22-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220530132425.1929512-1-sashal@kernel.org>
References: <20220530132425.1929512-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, airlied@linux.ie,
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>, james.qian.wang@arm.com,
 mihail.atanassov@arm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Liviu Dudau <liviu.dudau@arm.com>

[ Upstream commit c8f76c37cc3668ee45e081e76a15f24a352ebbdd ]

If drm_universal_plane_init() fails early we jump to the common cleanup code
that calls komeda_plane_destroy() which in turn could access the uninitalised
drm_plane and crash. Return early if an error is detected without going through
the common code.

Reported-by: Steven Price <steven.price@arm.com>
Reviewed-by: Steven Price <steven.price@arm.com>
Signed-off-by: Liviu Dudau <liviu.dudau@arm.com>
Link: https://lore.kernel.org/dri-devel/20211203100946.2706922-1-liviu.dudau@arm.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/arm/display/komeda/komeda_plane.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_plane.c b/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
index d63d83800a8a..d646e3ae1a23 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
@@ -275,8 +275,10 @@ static int komeda_plane_add(struct komeda_kms_dev *kms,
 
 	komeda_put_fourcc_list(formats);
 
-	if (err)
-		goto cleanup;
+	if (err) {
+		kfree(kplane);
+		return err;
+	}
 
 	drm_plane_helper_add(plane, &komeda_plane_helper_funcs);
 
-- 
2.35.1

