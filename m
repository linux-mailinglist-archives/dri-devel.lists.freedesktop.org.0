Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0A8537C3A
	for <lists+dri-devel@lfdr.de>; Mon, 30 May 2022 15:32:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B8BF10E8EB;
	Mon, 30 May 2022 13:32:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (unknown [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 674C010E8B3
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 13:32:24 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0A875B80DBB;
 Mon, 30 May 2022 13:32:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AEFCC3411E;
 Mon, 30 May 2022 13:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653917541;
 bh=Aoq/ZnXVcKk+p7VdfH7dk2D2Y56VczJQo9MgI9eHjA8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NJpCDAqWALErbC+IEm3tQSNuWIX9xJ3b+DDvAcHPcakxf9mIdXN0BjZRHncm4Nvc6
 nxoa/YyNBTYFJ0v7JmGa17KcTYPJMyCDoHbJDTOKprWEqFRyOwsnhOHYs/wdYBdFsW
 rMNsACl+bU6Ebcg6JKYlOMuDTBMkdGu1vBb+7KYy5unJKCBmke/lE1xyguYvV/kakI
 z39aVLRYAkDPXMP4oMV0opBCRWngSdBJK4YZrJW7giqGC44Jav6SNKpEln98brXQBc
 EEbCE8ISSH+YJzfHaGVFIlw/jHJEIJh4uAxwAkFUEZ7hSQ4XxPu91kvgQ4P0+P4XHW
 OE+AZgy3xXBBA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.17 018/135] drm/komeda: return early if
 drm_universal_plane_init() fails.
Date: Mon, 30 May 2022 09:29:36 -0400
Message-Id: <20220530133133.1931716-18-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220530133133.1931716-1-sashal@kernel.org>
References: <20220530133133.1931716-1-sashal@kernel.org>
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

