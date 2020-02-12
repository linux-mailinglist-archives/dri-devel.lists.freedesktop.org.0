Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BCC15A8CB
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2020 13:08:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 224E96EAA7;
	Wed, 12 Feb 2020 12:08:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2894C6EAA7;
 Wed, 12 Feb 2020 12:08:40 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 01CC8Xer092653;
 Wed, 12 Feb 2020 12:08:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=W+DOho/MABWVqGK9BDP4xPQcabcLOJ4yUEcH/wfOcmA=;
 b=w2Sz0DWS40Ei4OeZfWbmV5EGsKSiqyiRDugBV6eAMydVjok7xahDZRvJtvMfkK35eqsF
 PeiKqG6XUiGFXCQBuR3+fGE+LThBcgeAhmCWcffO+pvzGndgOh5AfegAn555jaom07RW
 cEsqgcGgR9zZtoaB2Mycj8hpS57ypLV5sZS61cJL0osxZKEWwSnUh0E99B/YvnDgWcR2
 mCsu7lzAsFb6ZYvqBMiNwBVlrIypbVO+d36lz08tN60Y6aSJcDcNFTkaTE+5UnoLiM05
 VO0YFPvMgfM1rcthY7Hjb1LcNiIu40/jA2PytlL2KeMHTd00qqoZqYV8/p34c9KIAUZr Tg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 2y2k889vv3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 12 Feb 2020 12:08:33 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 01CC6WCM146291;
 Wed, 12 Feb 2020 12:08:33 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 2y26swkqbm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Feb 2020 12:08:32 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 01CC8TIY026352;
 Wed, 12 Feb 2020 12:08:29 GMT
Received: from kili.mountain (/129.205.23.165)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 12 Feb 2020 04:08:28 -0800
Date: Wed, 12 Feb 2020 15:07:59 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: [PATCH] drm/amdgpu: return -EFAULT if copy_to_user() fails
Message-ID: <20200212120759.dokjxbk4cqln55sc@kili.mountain>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9528
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0 mlxscore=0
 malwarescore=0 bulkscore=0 spamscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2002120099
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9528
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 lowpriorityscore=0
 suspectscore=0 bulkscore=0 phishscore=0 mlxlogscore=999 mlxscore=0
 malwarescore=0 impostorscore=0 clxscore=1011 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002120099
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
Cc: Jonathan Kim <Jonathan.Kim@amd.com>, Philip Yang <Philip.Yang@amd.com>,
 David Airlie <airlied@linux.ie>, Felix Kuehling <Felix.Kuehling@amd.com>,
 "Tianci.Yin" <tianci.yin@amd.com>, kernel-janitors@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The copy_to_user() function returns the number of bytes remaining to be
copied, but we want to return a negative error code to the user.

Fixes: 030d5b97a54b ("drm/amdgpu: use amdgpu_device_vram_access in amdgpu_ttm_vram_read")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 15f5451d312d..660867cf2597 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -2280,7 +2280,6 @@ static ssize_t amdgpu_ttm_vram_read(struct file *f, char __user *buf,
 {
 	struct amdgpu_device *adev = file_inode(f)->i_private;
 	ssize_t result = 0;
-	int r;
 
 	if (size & 0x3 || *pos & 0x3)
 		return -EINVAL;
@@ -2294,9 +2293,8 @@ static ssize_t amdgpu_ttm_vram_read(struct file *f, char __user *buf,
 		uint32_t value[AMDGPU_TTM_VRAM_MAX_DW_READ];
 
 		amdgpu_device_vram_access(adev, *pos, value, bytes, false);
-		r = copy_to_user(buf, value, bytes);
-		if (r)
-			return r;
+		if (copy_to_user(buf, value, bytes))
+			return -EFAULT;
 
 		result += bytes;
 		buf += bytes;
-- 
2.11.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
