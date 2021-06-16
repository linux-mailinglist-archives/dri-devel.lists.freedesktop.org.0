Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 570A73A92A1
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 08:30:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55B8D6E1B5;
	Wed, 16 Jun 2021 06:30:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3720B6E1B5
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jun 2021 06:30:32 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15G6GK6x001082; Wed, 16 Jun 2021 06:30:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type : in-reply-to;
 s=corp-2020-01-29; bh=o/BEHhVMiN5l5PBSjswnmAEwrbJUT7EB9erm/zp0qRA=;
 b=LN7BFO6UYmb+EvNPV7qT0cstbDdrmBFDdsokA8qt6MpZVxU7QFzQA+c+MfJXZr1XzVfr
 kQZX7SUo3StgF032uxoeqOlGYEpjWcsXHqaj/aEpYon6lGGTpgydlqXeSCg4AksW0T8y
 PRRL0kfspQQnLPu+W6/BE+Cj6+6PgKkoNNi/LGTYFSXHCewTPxq2+afaimvO8RUhikdX
 jn7uWVTnsg9seEFApc4OpxczR3M7Iw/YcA2kHlThMhTazFILtRFzE6uMNq0y6G5lG2wf
 +Zz4M+ywbO7Qt1NPQPQZxHMQvNnFdhbBWCS5Gk8zouoMWYCly9CE+sIqhrJEKK6Rrt0A pg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 395x06j00k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Jun 2021 06:30:27 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15G6F1Tv101965;
 Wed, 16 Jun 2021 06:30:26 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3020.oracle.com with ESMTP id 396wasdrd7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Jun 2021 06:30:26 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 15G6RnNn160728;
 Wed, 16 Jun 2021 06:30:25 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 396wasdrc8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Jun 2021 06:30:25 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 15G6UKPX022948;
 Wed, 16 Jun 2021 06:30:20 GMT
Received: from mwanda (/41.212.42.34) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 16 Jun 2021 06:30:19 +0000
Date: Wed, 16 Jun 2021 09:30:12 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Christian Koenig <christian.koenig@amd.com>, Thomas Hellstr <C3@mwanda>,
 B6@mwanda, m <thomas.hellstrom@linux.intel.com>
Subject: [PATCH] drm/ttm: fix error handling in ttm_bo_handle_move_mem()
Message-ID: <YMmadPwv8C+Ut1+o@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210610154113.GJ1955@kadam>
X-Mailer: git-send-email haha only kidding
X-Proofpoint-ORIG-GUID: iEKfwd0av4OdkwdZPfO2LOoQ8kX7B0s6
X-Proofpoint-GUID: iEKfwd0av4OdkwdZPfO2LOoQ8kX7B0s6
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
Cc: David Airlie <airlied@linux.ie>, Huang Rui <ray.huang@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are three bugs here:
1) We need to call unpopulate() if ttm_tt_populate() succeeds.
2) The "new_man = ttm_manager_type(bdev, bo->mem.mem_type);" assignment
   was wrong and it was really assigning "new_mem = old_mem;".  There
   is no need for this assignment anyway as we already have the value
   for "new_mem".
3) The (!new_man->use_tt) condition is reversed.

Fixes: ba4e7d973dd0 ("drm: Add the TTM GPU memory manager subsystem.")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This is from reading the code and I can't swear that I have understood
it correctly.  My nouveau driver is currently unusable and this patch
has not helped.  But hopefully if I fix enough bugs eventually it will
start to work.

 drivers/gpu/drm/ttm/ttm_bo.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index ebcffe794adb..72dde093f754 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -180,12 +180,12 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer_object *bo,
 		 */
 		ret = ttm_tt_create(bo, old_man->use_tt);
 		if (ret)
-			goto out_err;
+			return ret;
 
 		if (mem->mem_type != TTM_PL_SYSTEM) {
 			ret = ttm_tt_populate(bo->bdev, bo->ttm, ctx);
 			if (ret)
-				goto out_err;
+				goto err_destroy;
 		}
 	}
 
@@ -193,15 +193,17 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer_object *bo,
 	if (ret) {
 		if (ret == -EMULTIHOP)
 			return ret;
-		goto out_err;
+		goto err_unpopulate;
 	}
 
 	ctx->bytes_moved += bo->base.size;
 	return 0;
 
-out_err:
-	new_man = ttm_manager_type(bdev, bo->mem.mem_type);
-	if (!new_man->use_tt)
+err_unpopulate:
+	if (new_man->use_tt)
+		ttm_tt_unpopulate(bo->bdev, bo->ttm);
+err_destroy:
+	if (new_man->use_tt)
 		ttm_bo_tt_destroy(bo);
 
 	return ret;
-- 
2.30.2

