Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 453B11DB81C
	for <lists+dri-devel@lfdr.de>; Wed, 20 May 2020 17:26:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5CE16E868;
	Wed, 20 May 2020 15:26:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86F5E6E868;
 Wed, 20 May 2020 15:26:15 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04KFHG6Q076583;
 Wed, 20 May 2020 15:26:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type : in-reply-to;
 s=corp-2020-01-29; bh=us1UyD3eb7iJfl6Z3bLFPAGiXiDBjSZBmVmqk0QGUNc=;
 b=UmPc6+0inQWEbzaEFKEDNeJN07Gfg3Bdl2wV+TyTbU5NkKVJ6Hx3iAm/EaPnOyR/jOEn
 76Pfbs1ruJ7tsNc0QBUyziXvPqqsmY8SPpgLiDVq16zOvWY2DX1e9A1ryFnAi2RRgNEN
 m45kXwrhzEg6acq1hoWDsR/KGhgAAoNw70G8rilJCCYOscqDUhdQ4BqOyWB1ddhTGs80
 XROz97K0j3kT2CPv6tUEuthNw2V1VirUGDIxOD50SBWJAtPIIawV6B8/owzeIFYO9IJg
 WOTBz34LwPsGNZrptphJoHlCT9IQOi55XukGq+r0bKv2NgSkzKvhXZPWa+xiGXOXocVd dQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 3127krbt8s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 20 May 2020 15:26:08 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04KFD8pI058218;
 Wed, 20 May 2020 15:26:08 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3020.oracle.com with ESMTP id 312t37xnad-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 May 2020 15:26:06 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 04KFQ5bw026329;
 Wed, 20 May 2020 15:26:05 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 20 May 2020 08:26:04 -0700
Date: Wed, 20 May 2020 18:25:56 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Alex Deucher <alexander.deucher@amd.com>, Kevin Wang <kevin1.wang@amd.com>,
 "Ruhl, Michael J" <michael.j.ruhl@intel.com>
Subject: [PATCH v3] drm/amdgpu: off by one in
 amdgpu_device_attr_create_groups() error handling
Message-ID: <20200520152556.GQ3041@kadam>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <14063C7AD467DE4B82DEDB5C278E8663010E2302FA@FMSMSX108.amr.corp.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9626
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 mlxlogscore=999
 phishscore=0 mlxscore=0 malwarescore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005200126
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9626
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0 spamscore=0
 bulkscore=0 clxscore=1011 priorityscore=1501 mlxscore=0 impostorscore=0
 suspectscore=0 mlxlogscore=999 malwarescore=0 cotscore=-2147483648
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2005200126
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Hawking Zhang <Hawking.Zhang@amd.com>, Rui Huang <ray.huang@amd.com>,
 dri-devel@lists.freedesktop.org, Evan Quan <evan.quan@amd.com>,
 Kenneth Feng <kenneth.feng@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Yintian Tao <yttao@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This loop in the error handling code should start a "i - 1" and end at
"i == 0".  Currently it starts a "i" and ends at "i == 1".  The result
is that it removes one attribute that wasn't created yet, and leaks the
zeroeth attribute.

Fixes: 4e01847c38f7 ("drm/amdgpu: optimize amdgpu device attribute code")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: style change
v3: Fix embarrassing typo in the subject

 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c           | 3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
index b75362bf0742..e809534fabd4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
@@ -1942,9 +1942,8 @@ static int amdgpu_device_attr_create_groups(struct amdgpu_device *adev,
 	return 0;
 
 failed:
-	for (; i > 0; i--) {
+	while (i--)
 		amdgpu_device_attr_remove(adev, &attrs[i]);
-	}
 
 	return ret;
 }
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
