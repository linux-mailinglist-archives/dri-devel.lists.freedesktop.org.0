Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AECB94903F4
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 09:34:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D8EF10E1C2;
	Mon, 17 Jan 2022 08:34:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0994510E2F7
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jan 2022 16:46:01 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20FDxg1q018448; 
 Sat, 15 Jan 2022 16:45:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=corp-2021-07-09; bh=xFdErQzZhWw36cmChgQUJSnCaxzupFnzpJu6evk43mo=;
 b=0YN07xkKKmTo6HudaMgLxjh5ZkjoEvQXMgK8kCRH6oHE2JskoRCyHQqHg32sufyroNzr
 pFGE5RSYaEUG/231fDrs87NINPd3gP4juzgM30ajdbrQAGLhvJUfoleJHKDfusOcgGZm
 7Hj7FHyJTHy9WErAmyuzVrxXCoO1cyzzqtPo88AXDUwBSdgj8JgjImuBo+IIPPEli5Bu
 7OVPnKZI4e+Rn+s5NisPMQSV1wRXd8HZ/ZRW9LrGhoUq93kLSLTSIi3rV9O1yny1F24j
 j0bkINFliy36x5sWT78Mg7YG2MPSNetfDu2KkmAPEVsgsslNC3gFaAHgQeNdRIu2RyjF Rw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dkn22rrm6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 15 Jan 2022 16:45:57 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20FGe8qh128341;
 Sat, 15 Jan 2022 16:45:56 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by userp3020.oracle.com with ESMTP id 3dkqqhh8rj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 15 Jan 2022 16:45:56 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 20FGjtqK136628;
 Sat, 15 Jan 2022 16:45:55 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com [10.147.25.63])
 by userp3020.oracle.com with ESMTP id 3dkqqhh8rc-1;
 Sat, 15 Jan 2022 16:45:55 +0000
From: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
To: 
Subject: [PATCH] drm/udl: Return correct error code on kmalloc failure
Date: Sat, 15 Jan 2022 08:45:25 -0800
Message-Id: <20220115164525.50258-1-harshit.m.mogalapalli@oracle.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: EMXgLv04YryngQF4cU4jLsac9EK5n8tg
X-Proofpoint-ORIG-GUID: EMXgLv04YryngQF4cU4jLsac9EK5n8tg
X-Mailman-Approved-At: Mon, 17 Jan 2022 08:34:35 +0000
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
Cc: Robert Tarasov <tutankhamen@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>,
 harshit.m.mogalapalli@oracle.com, Dave Airlie <airlied@redhat.com>,
 Sean Paul <sean@poorly.run>, dan.carpenter@oracle.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

-ENOMEM is correct error code to return on a memory allocation failure
instead of -1.

Smatch Warning:
drivers/gpu/drm/udl/udl_connector.c:27 udl_get_edid_block() warn:
returning -1 instead of -ENOMEM is sloppy

Fixes: a51143001d9e ("drm/udl: Refactor edid retrieving in UDL driver (v2)")
Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
---
 drivers/gpu/drm/udl/udl_connector.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/udl/udl_connector.c b/drivers/gpu/drm/udl/udl_connector.c
index 930574ad2bca..b7a9c6d103ba 100644
--- a/drivers/gpu/drm/udl/udl_connector.c
+++ b/drivers/gpu/drm/udl/udl_connector.c
@@ -24,7 +24,7 @@ static int udl_get_edid_block(void *data, u8 *buf, unsigned int block,
 
 	read_buff = kmalloc(2, GFP_KERNEL);
 	if (!read_buff)
-		return -1;
+		return -ENOMEM;
 
 	for (i = 0; i < len; i++) {
 		int bval = (i + block * EDID_LENGTH) << 8;
-- 
2.27.0

