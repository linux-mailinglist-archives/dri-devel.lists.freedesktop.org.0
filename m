Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E710D76ADC1
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 11:33:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DBD010E375;
	Tue,  1 Aug 2023 09:33:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FC1A10E375
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 09:33:09 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DA565613E2;
 Tue,  1 Aug 2023 09:33:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5575C433C9;
 Tue,  1 Aug 2023 09:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1690882388;
 bh=4hagUchIK6IgqB/H0UMPIh8EqW5NAsEHAHl5TVb7uko=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TXzDHF+UQFEK6FIcP4OUQU51eE79zF3hJGxRoxRHH6tLBsa9ntzOsMh2DbFp2ZDSq
 /8JqU5ciVs6lmn8zRYSB/Zm3gqCL9HXDo81uGG0oej+2vDfjJ7zgUNex0jaS8xcX/i
 qKH2dK0/pRi8Uaqz4Yc0A98L1AHpneeBx0Aj4dsY=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Subject: [PATCH 6.1 049/228] drm/ttm: Dont leak a resource on eviction error
Date: Tue,  1 Aug 2023 11:18:27 +0200
Message-ID: <20230801091924.676118500@linuxfoundation.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230801091922.799813980@linuxfoundation.org>
References: <20230801091922.799813980@linuxfoundation.org>
User-Agent: quilt/0.67
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Sasha Levin <sashal@kernel.org>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, patches@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Huang Rui <ray.huang@amd.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thomas Hellström <thomas.hellstrom@linux.intel.com>

[ Upstream commit e8188c461ee015ba0b9ab2fc82dbd5ebca5a5532 ]

On eviction errors other than -EMULTIHOP we were leaking a resource.
Fix.

v2:
- Avoid yet another goto (Andi Shyti)

Fixes: 403797925768 ("drm/ttm: Fix multihop assert on eviction.")
Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Huang Rui <ray.huang@amd.com>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v5.15+
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com> #v1
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20230626091450.14757-4-thomas.hellstrom@linux.intel.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 85f7f5cd4589a..1c891b5839316 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -499,18 +499,18 @@ static int ttm_bo_evict(struct ttm_buffer_object *bo,
 		goto out;
 	}
 
-bounce:
-	ret = ttm_bo_handle_move_mem(bo, evict_mem, true, ctx, &hop);
-	if (ret == -EMULTIHOP) {
+	do {
+		ret = ttm_bo_handle_move_mem(bo, evict_mem, true, ctx, &hop);
+		if (ret != -EMULTIHOP)
+			break;
+
 		ret = ttm_bo_bounce_temp_buffer(bo, &evict_mem, ctx, &hop);
-		if (ret) {
-			if (ret != -ERESTARTSYS && ret != -EINTR)
-				pr_err("Buffer eviction failed\n");
-			ttm_resource_free(bo, &evict_mem);
-			goto out;
-		}
-		/* try and move to final place now. */
-		goto bounce;
+	} while (!ret);
+
+	if (ret) {
+		ttm_resource_free(bo, &evict_mem);
+		if (ret != -ERESTARTSYS && ret != -EINTR)
+			pr_err("Buffer eviction failed\n");
 	}
 out:
 	return ret;
-- 
2.39.2



