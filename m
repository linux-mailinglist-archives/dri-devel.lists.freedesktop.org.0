Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 362FA46FCC6
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 09:32:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88A5110E301;
	Fri, 10 Dec 2021 08:31:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AFAD10E21D;
 Fri, 10 Dec 2021 04:41:47 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BA0h8Dn028726; 
 Fri, 10 Dec 2021 04:41:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=corp-2021-07-09; bh=BTr88Oid/rA8ygfBnVmWVKCbgb7Rzgjd880g4VQw8xc=;
 b=0Cb93HSotRlqs/3pKAMy64/XRqAB+P2X/Wox3E2lVyAccrJ+Pij4PGXxOy1ckrlAbPTY
 BYg6k6VmsOTHUThtzVvvsJ3tscBBW70lVkTI7BSPwWRHD4AHSI6377StoLvUfa8330MI
 u9oxWp0XPJnRNWSOeggcuFFtelGEooCdXZL/s074JT7xCAZxj90e6RpjRsXr66BYrNCH
 zn6yXgFHX2GZJ2txm96RBwT2oR4Ksj1o0pkc17Q2G0MgoqgeLGqOfcZcoMEcT2iGdelM
 Tur8se8lDpPEsIbi+Z6TO+38PY4/mldfC2pSxPLqZjZkrtj+YV3h9UUHacqiCAn5AH5/ pw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ctu96vxgt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Dec 2021 04:41:38 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BA4ZIFj158678;
 Fri, 10 Dec 2021 04:41:37 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by userp3030.oracle.com with ESMTP id 3cqwf3cfjh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Dec 2021 04:41:37 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 1BA4fax2171495;
 Fri, 10 Dec 2021 04:41:36 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com [10.147.25.63])
 by userp3030.oracle.com with ESMTP id 3cqwf3cfj8-1;
 Fri, 10 Dec 2021 04:41:36 +0000
From: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
To: 
Subject: [PATCH] drm: i915: display: intel_dmc: Fixes an unsigned subtraction
 which can never be negative.
Date: Thu,  9 Dec 2021 20:41:24 -0800
Message-Id: <20211210044129.12422-1-harshit.m.mogalapalli@oracle.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Kf_45Qv52Q32v4ly4mCVeyIdjbQTtb1O
X-Proofpoint-ORIG-GUID: Kf_45Qv52Q32v4ly4mCVeyIdjbQTtb1O
X-Mailman-Approved-At: Fri, 10 Dec 2021 08:31:56 +0000
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
Cc: dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Anusha Srivatsa <anusha.srivatsa@intel.com>, David Airlie <airlied@linux.ie>,
 Lucas De Marchi <lucas.demarchi@intel.com>, intel-gfx@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Chris Wilson <chris@chris-wilson.co.uk>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 harshit.m.mogalapalli@oracle.com, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 dan.carpenter@oracle.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

smatch warning:
drivers/gpu/drm/i915/display/intel_dmc.c:601 parse_dmc_fw() warn:
unsigned 'fw->size - offset' is never less than zero

Firmware size is size_t and offset is u32. So the subtraction is
unsigned which can never be less than zero.

Fixes: 3d5928a168a9 ("drm/i915/xelpd: Pipe A DMC plugging")
Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
---
 drivers/gpu/drm/i915/display/intel_dmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i915/display/intel_dmc.c
index 0cab18f972d1..2f477c298b00 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc.c
@@ -598,7 +598,7 @@ static void parse_dmc_fw(struct drm_i915_private *dev_priv,
 			continue;
 
 		offset = readcount + dmc->dmc_info[id].dmc_offset * 4;
-		if (fw->size - offset < 0) {
+		if (offset > fw->size) {
 			drm_err(&dev_priv->drm, "Reading beyond the fw_size\n");
 			continue;
 		}
-- 
2.27.0

