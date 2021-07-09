Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA773C2121
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 11:01:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CD206E9E8;
	Fri,  9 Jul 2021 09:01:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB70A6E9C7
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jul 2021 07:40:11 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1697WeM3009954; Fri, 9 Jul 2021 07:40:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=corp-2020-01-29; bh=IIlSXpBBHFLisNXYkSZ1ZoY0IbOXlkolaG3xnV/dM9Q=;
 b=Khrs7Ir1htw46arUJ/HLGd5afh4nB+mP0ZkdXaqoxLLsENsy7KVd9afTQEy0l+dKlet9
 SCrxtdjy0QsKLGVEa6Pq+82fdv9vFAR95ZBwciYBkm1M3AIff+Y9VBaao/wP0DvQPL0c
 0RuuRS3Z4vA1Tqe+zTle/3UmQLv4DtgUbRnt38Ozpp0VA6MDGLujhsYIK7tMgOo4tjnd
 ZyNuQbaAmP6koI6/RRwabWZ+5Wai+8c1pWGK8cWf1P9vmRQ4G00l9QhSbTsp+5Uq3Bbz
 245iqVKjNnYV6Kb68A/Bzf5DNQsvEZBbly8RFa9s6A/p0I+NFZ7vy63/uU9Ymj3Zh1xB /Q== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 39nbsxv5g8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 09 Jul 2021 07:40:08 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1697adUL095684;
 Fri, 9 Jul 2021 07:40:07 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3030.oracle.com with ESMTP id 39nbg6ysed-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 09 Jul 2021 07:40:07 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 1697d0l0101987;
 Fri, 9 Jul 2021 07:40:07 GMT
Received: from manjaro.in.oracle.com (dhcp-10-191-197-30.vpn.oracle.com
 [10.191.197.30]) by aserp3030.oracle.com with ESMTP id 39nbg6ys99-1;
 Fri, 09 Jul 2021 07:40:06 +0000
From: Harshvardhan Jha <harshvardhan.jha@oracle.com>
To: patrik.r.jakobsson@gmail.com
Subject: [PATCH] drm/gma500: Fix end of loop tests for list_for_each_entry
Date: Fri,  9 Jul 2021 13:09:59 +0530
Message-Id: <20210709073959.11443-1-harshvardhan.jha@oracle.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 5BRhdSjWvIFVZvbSTTq6buOOSVSwmmwQ
X-Proofpoint-GUID: 5BRhdSjWvIFVZvbSTTq6buOOSVSwmmwQ
X-Mailman-Approved-At: Fri, 09 Jul 2021 09:01:52 +0000
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Harshvardhan Jha <harshvardhan.jha@oracle.com>, dan.carpenter@oracle.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The list_for_each_entry() iterator, "connector" in this code, can never be
NULL.  If we exit the loop without finding the correct  connector then
"connector" points invalid memory that is an offset from the list head.
This will eventually lead to memory corruption and presumably a kernel
crash.

Fixes: 9bd81acdb648 ("gma500: Convert Oaktrail to work with new output handling")
Signed-off-by: Harshvardhan Jha <harshvardhan.jha@oracle.com>
 ---
From static analysis.  Not tested.
---
 drivers/gpu/drm/gma500/oaktrail_lvds.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/gma500/oaktrail_lvds.c b/drivers/gpu/drm/gma500/oaktrail_lvds.c
index 432bdcc57ac9..a1332878857b 100644
--- a/drivers/gpu/drm/gma500/oaktrail_lvds.c
+++ b/drivers/gpu/drm/gma500/oaktrail_lvds.c
@@ -117,7 +117,7 @@ static void oaktrail_lvds_mode_set(struct drm_encoder *encoder,
 			continue;
 	}
 
-	if (!connector) {
+	if (list_entry_is_head(connector, &mode_config->connector_list, head)) {
 		DRM_ERROR("Couldn't find connector when setting mode");
 		gma_power_end(dev);
 		return;
-- 
2.32.0

