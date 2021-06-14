Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E035D3A6130
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jun 2021 12:43:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A46F89C46;
	Mon, 14 Jun 2021 10:43:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C08889C3B;
 Mon, 14 Jun 2021 10:43:45 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15EAeVUn086337;
 Mon, 14 Jun 2021 10:43:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=RwF5QWsM6mGzJgPl1c9NHQVTtQMu3XYCLLJJCitoHJs=;
 b=Tyu+7nNlFX/Em+m4aMnTtG+9UUd6QmRRNcBydeuZC73AidOSfswh/LaJOBXJj8sRL9Bm
 sDQXWgwzJjOrVNOqWoWLqk8NbY8117Mo3v5s7AnvXkAbUzNlvNKA9Li3GPB4aralId7h
 W5AhNRChlAdM2pAvJTsUlHaK84A+ndstT1CUX+u/svLGJ4LGNsWKIptq5VidG2qKef9I
 Nd6Uis1Cn2Nl/dt/ilaqervL/L5W7Da5NGtiX21fjZCjQ0ybwpyg7TjHh0QtShBFL2x6
 6GJnooS9gdJr0RtrdV5wO3/ZJN3DZhJ/nNU3lEof797zmNXMoUmtxQKxO4CHcWQiluuq VA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 394mbsb1qr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Jun 2021 10:43:40 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15EAfM3a101693;
 Mon, 14 Jun 2021 10:43:40 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by userp3020.oracle.com with ESMTP id 395hk23vad-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Jun 2021 10:43:40 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 15EAhdr9110851;
 Mon, 14 Jun 2021 10:43:39 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3020.oracle.com with ESMTP id 395hk23va9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Jun 2021 10:43:39 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 15EAhYAr026333;
 Mon, 14 Jun 2021 10:43:34 GMT
Received: from mwanda (/41.212.42.34) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 14 Jun 2021 03:43:33 -0700
Date: Mon, 14 Jun 2021 13:43:27 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Ben Skeggs <bskeggs@redhat.com>
Subject: [PATCH] drm/nouveau/core/object: fix double free on error in
 nvkm_ioctl_new()
Message-ID: <YMcyzyVyI4N6anBo@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-ORIG-GUID: aSMWYRi6et9j-LW7LLEv_Rrd_WQpxffb
X-Proofpoint-GUID: aSMWYRi6et9j-LW7LLEv_Rrd_WQpxffb
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10014
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1011
 impostorscore=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 suspectscore=0 phishscore=0
 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106140075
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If nvkm_object_init() fails then we should not call nvkm_object_fini()
because it results in calling object->func->fini(object, suspend) twice.
Once inside the nvkm_object_init() function and once inside the
nvkm_object_fini() function.

Fixes: fbd58ebda9c8 ("drm/nouveau/object: merge with handle")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This is something that I spotted while looking for reference counting
bugs.  I have tried running it, but it does not fix my crashes.  My
system is basically unusable.  It's something to do with the new version
of Firefox which triggers the refcount_t underflow, but switching to
Epiphany doesn't solve the issue either.

 drivers/gpu/drm/nouveau/nvkm/core/ioctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c b/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
index d777df5a64e6..87c761fb475a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
@@ -134,8 +134,8 @@ nvkm_ioctl_new(struct nvkm_client *client,
 				return 0;
 			}
 			ret = -EEXIST;
+			nvkm_object_fini(object, false);
 		}
-		nvkm_object_fini(object, false);
 	}
 
 	nvkm_object_del(&object);
-- 
2.30.2

