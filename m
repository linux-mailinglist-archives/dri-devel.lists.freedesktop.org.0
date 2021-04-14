Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D01B735ECA3
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 07:58:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DED2289911;
	Wed, 14 Apr 2021 05:58:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 037A489911;
 Wed, 14 Apr 2021 05:58:28 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13E5vPYK013680;
 Wed, 14 Apr 2021 05:58:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=kUKmOerkc4ti6G8+ArQ1eNVByqqeEEy3cBhe7cYrEW0=;
 b=dQqshySTxyaljXhs7r1c221uNgYwgomy2nna8M1GybdHPTPsbeYIWJ6syem+xBes8W0M
 faNzPUawCUH7Q/wbfTZQzk8Y+emLXwdQsDW+BVqMNRF8GTfeB8vSnT0PMiH6P8OxN1U0
 sQ5qNx3qI8wSB2WFvK1jKrPMvFYU1FDe9nsFOaNTojOZuI2KS7GLOAjKYqAQhC+/8cUR
 +toti+dOS1+1ipQiDVouHomoxs71reFKl/1Z2I7U1CvHtFnMk5o4woaHcQ3npBcza7vf
 0+zmRn2uXLdSB7ZOYn0TaWfEnqXDTfsW4vF2TbHEVX2s2/IEP5VGbjfkVGk3UiHeRejc DA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2120.oracle.com with ESMTP id 37u4nnh4n9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Apr 2021 05:58:23 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13E5uO1J169527;
 Wed, 14 Apr 2021 05:58:22 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3030.oracle.com with ESMTP id 37unxxw360-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Apr 2021 05:58:22 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 13E5wJrM014311;
 Wed, 14 Apr 2021 05:58:20 GMT
Received: from mwanda (/10.175.166.128)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 13 Apr 2021 22:58:18 -0700
Date: Wed, 14 Apr 2021 08:58:12 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Ben Skeggs <bskeggs@redhat.com>, Pierre Moreau <pierre.morrow@free.fr>
Subject: [PATCH] drm/nouveau: fix an error code in nouveau_backlight_init()
Message-ID: <YHaEdBgqCFQRqg1B@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9953
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 bulkscore=0 malwarescore=0
 spamscore=0 adultscore=0 phishscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104140041
X-Proofpoint-ORIG-GUID: Af1ALPuAt7CncMKwoyepc_tRF9h-ox9z
X-Proofpoint-GUID: Af1ALPuAt7CncMKwoyepc_tRF9h-ox9z
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9953
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501
 clxscore=1011 lowpriorityscore=0 spamscore=0 impostorscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104140041
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
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If nouveau_get_backlight_name() fails then this should return -ENOMEM
but currently it returns success.

Fixes: db1a0ae21461 ("drm/nouveau/bl: Assign different names to interfaces")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This is from static analysis.  In the original commit db1a0ae21461
("drm/nouveau/bl: Assign different names to interfaces") then returning
zero seemed to be a very deliberate choice.  I do think it was wrong
though and -ENOMEM is the currect return.

 drivers/gpu/drm/nouveau/nouveau_backlight.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_backlight.c b/drivers/gpu/drm/nouveau/nouveau_backlight.c
index 72f35a2babcb..3786b1c85182 100644
--- a/drivers/gpu/drm/nouveau/nouveau_backlight.c
+++ b/drivers/gpu/drm/nouveau/nouveau_backlight.c
@@ -274,6 +274,7 @@ nouveau_backlight_init(struct drm_connector *connector)
 
 	if (!nouveau_get_backlight_name(backlight_name, bl)) {
 		NV_ERROR(drm, "Failed to retrieve a unique name for the backlight interface\n");
+		ret = -ENOMEM;
 		goto fail_alloc;
 	}
 
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
