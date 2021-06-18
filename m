Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 757FC3AC64E
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jun 2021 10:37:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C93C6E0A8;
	Fri, 18 Jun 2021 08:37:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5173F6E0A8
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jun 2021 08:37:45 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15I8VRJm021263; Fri, 18 Jun 2021 08:37:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=iXmA2kYJS+r4Xe0FDNKeogg/oAJA0bHydZas7lXjRoA=;
 b=MlFLQRA4Geu15h3+AyqYmvlyB18yyUKEDBKKDmWZSPbKsCZMY4k4m6amZSjuOVHspA75
 mwmmYusKYyxzYA/o88plJzrEyVxAkcXRS0iLH9zfR5xkW3n6rhw6cmklsem1vJWg1tsV
 +pb0HaZA0A6PxHFYHTHwPdAiZI+e8tvIoisFqI8CNkU/xSVrQMraF+OGPCe2+ztuUPRj
 ATfpMwyp94ABM4EWtmsxE3mx2TyWTrSq2UX5fmqxrLt0CSNi1+qK309qy7XgFhFQj63X
 G7/Yh6fiNSJ9JX2Ev18zF/Sgcc96SILzZNn6WqN+I6k8A5Yf1a41Ew3VjdkQAvaogEZ8 VA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 397w1y2r37-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Jun 2021 08:37:41 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15I8ZPmJ038676;
 Fri, 18 Jun 2021 08:37:40 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3030.oracle.com with ESMTP id 396wawhf7d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Jun 2021 08:37:40 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 15I8bJZM042909;
 Fri, 18 Jun 2021 08:37:39 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 396wawhf74-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Jun 2021 08:37:39 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 15I8bV2R015132;
 Fri, 18 Jun 2021 08:37:31 GMT
Received: from mwanda (/102.222.70.252)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 18 Jun 2021 01:37:30 -0700
Date: Fri, 18 Jun 2021 11:37:21 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>
Subject: [PATCH] drm/amdgpu: fix amdgpu_preempt_mgr_new()
Message-ID: <YMxbQXg/Wqm0ACxt@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-ORIG-GUID: O9dxSdX-U6cfZyGxH_AnkP1JpiesTef7
X-Proofpoint-GUID: O9dxSdX-U6cfZyGxH_AnkP1JpiesTef7
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
Cc: David Airlie <airlied@linux.ie>, Felix Kuehling <Felix.Kuehling@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, kernel-janitors@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is a reversed if statement in amdgpu_preempt_mgr_new() so it
always returns -ENOMEM.

Fixes: 09b020bb05a5 ("Merge tag 'drm-misc-next-2021-06-09' of git://anongit.freedesktop.org/drm/drm-misc into drm-next")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c
index f6aff7ce5160..d02c8637f909 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c
@@ -71,7 +71,7 @@ static int amdgpu_preempt_mgr_new(struct ttm_resource_manager *man,
 	struct amdgpu_preempt_mgr *mgr = to_preempt_mgr(man);
 
 	*res = kzalloc(sizeof(**res), GFP_KERNEL);
-	if (*res)
+	if (!*res)
 		return -ENOMEM;
 
 	ttm_resource_init(tbo, place, *res);
-- 
2.30.2

