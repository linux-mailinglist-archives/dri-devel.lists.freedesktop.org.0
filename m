Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB4C3BCDEA
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 13:22:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FEFD6E1EC;
	Tue,  6 Jul 2021 11:22:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8BEE6E1EC;
 Tue,  6 Jul 2021 11:22:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DC6F861DED;
 Tue,  6 Jul 2021 11:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625570525;
 bh=aexcraR/jbiLJzmmi7c4a7TbhA2dKFC0BduVigO9NaY=;
 h=From:To:Cc:Subject:Date:From;
 b=hqD3J6CTlJT7VFwPvCMwF99SAsbyhhoGtdHU2Zref+t6RlTBodNu1GMjUMAWhuOxa
 43U8LErN90PEKaY4ecyegwYQgh44g/LNYUjVYzRfPwg7DktVsQOgcaImICq+gGsjv5
 DSftfsyRbpqWCPhyJrfNvaHj47f+wd6hrXW43682j7itxB2OVSMFZaMM5alsvqPTg5
 0yEZzZ2DehDuyChV29EJ047QQXHD/vWXNEat3ax0mD/beLMBKhp1hxycDf9J7Dcehx
 y3NOZL8Wru9e2g1UIHaksPf8npumggcVWgg04fRF+M47pT+L93hnsgWe/YDyFQqOoQ
 n3WL3bFGfOxXw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 001/137] drm/etnaviv: fix NULL check before some
 freeing functions is not needed
Date: Tue,  6 Jul 2021 07:19:47 -0400
Message-Id: <20210706112203.2062605-1-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Sasha Levin <sashal@kernel.org>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Tian Tao <tiantao6@hisilicon.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tian Tao <tiantao6@hisilicon.com>

[ Upstream commit 7d614ab2f20503ed8766363d41f8607337571adf ]

fixed the below warning:
drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c:84:2-8: WARNING: NULL check
before some freeing functions is not needed.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
Acked-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
index 4aa3426a9ba4..059ec31d532d 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
@@ -77,8 +77,7 @@ static void etnaviv_gem_prime_release(struct etnaviv_gem_object *etnaviv_obj)
 	/* Don't drop the pages for imported dmabuf, as they are not
 	 * ours, just free the array we allocated:
 	 */
-	if (etnaviv_obj->pages)
-		kvfree(etnaviv_obj->pages);
+	kvfree(etnaviv_obj->pages);
 
 	drm_prime_gem_destroy(&etnaviv_obj->base, etnaviv_obj->sgt);
 }
-- 
2.30.2

