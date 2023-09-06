Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF34793915
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 11:56:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EB2A10E5CF;
	Wed,  6 Sep 2023 09:56:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6D3310E5C8
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 09:56:41 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3866CjBd015358; Wed, 6 Sep 2023 10:56:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :content-transfer-encoding:content-type:mime-version; s=
 dk201812; bh=WbT76yMO8LvNSPHt/uhDqNsMOk6uZxh2yRJSCTpK7XU=; b=qGw
 jbpxZFKGOzdrtRX+B3oTGb7Jds/E9DUUnKXe10AroB2psbcf5CB5Ud0FH+YQvLma
 4hPhg28OElVURHPUL9yoh6voT0gqZC1U7EzjIKvYR2lAXtmmV0AeLJoDtgAXTPyG
 A6O+DCfwaJDUtjbx7Ht+/Rzra+kl7lG1ELOpJCcqv9UvZOwMeH0JP4qOJyRsEaq4
 z9fUTtRiceE5oG00RmjUaUTMlKKLBXLEexnC8m9kGdmTqIGboqjmD0cyZRmbDtwo
 4VgHcbnu7e/IWvNpZU0G7oQ5bCEVfiafuYhtUhqRMnSjopEBt+gmBjURqN18SJg/
 mJzzKGPsQz9bk2Nidag==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3suuanu2s2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 06 Sep 2023 10:56:25 +0100 (BST)
Received: from HHMAIL04.hh.imgtec.org (10.100.10.119) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Wed, 6 Sep 2023 10:56:24 +0100
Received: from GBR01-LO4-obe.outbound.protection.outlook.com (104.47.85.107)
 by email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31 via Frontend Transport; Wed, 6 Sep 2023 10:56:24 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AuMK6qzol8/Q2Qa6OuUV0N8xKV1m+wacJ1OeuXceLtwcib0XpGq3Zf54xiNv86kpCdOV64Q2sDw6C9N5m8IOw4lONUpRT5l8kNbYlTKb9X75POu3t7KV21ZJkGytfRR4FttE7ic1Z0bSQoB7iKnXHzi7D+tJYJ4l5J/Oxcrq0gbAEum4LDfwM/wxU1luDbGQJllB04g9y/sQ5o8qE4QXukZduFOvxQFvlN7lQ2/Z/n0wWMd0NJie1aja0BmfJBXyFm4YUM+6b6W66E9YApkc1BrytyPxNLA0tGXwKTGJWDEI3Mug+6hAtIqMlis+vjHANyqOjMszoG8h2mt+4Ldqnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WbT76yMO8LvNSPHt/uhDqNsMOk6uZxh2yRJSCTpK7XU=;
 b=XvsO/hrMzaouvNsazNLHf9uh1eQSux8Z+Sizw+qFpCtF7QhyqhKP6+ZEnk50VzANUjgqxX4aQntFbvzwRk0VsbK8GVTkCn44Zz066UEtKMewdplbc3WPDs/sg+ehnN4IQNfJmNBbWKTTG7NpSFTzV2Q3x9v4Z6Q8dE6rSe4xEPKyGzizBWjqky57BWehEBO0gEC6jSqimW/vzee3gYsk6DkUDyVA2H+JC1xVfrMaXGG6GHdND7HoZev1UQnnePEwzvZPxFmqE2W0dsMnLaM0RtHiVRndopM4wpZNu/rDkg+Rx3e7wl9Zvj1NO0xRRPlnYLcOyD+ivVgTfNeYQ+OcWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WbT76yMO8LvNSPHt/uhDqNsMOk6uZxh2yRJSCTpK7XU=;
 b=ANTmOOdrkG3V/zBln+wZSw2moNlHclWLMS+EGDA6JJ+kBIcWWYJaBFOm1kJ3DPt6S3PwB7HNx6KPzzBmFQsEpTJJWWJm1XEHfDk8j2F+5nagXS1eQOtP1fSt9cX+jn4GeDD9QLIYI/g9SgZFnud4uG9pUC4WPMUI7Yr5F3gzeeA=
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:170::9)
 by CWLP265MB2436.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:96::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Wed, 6 Sep
 2023 09:56:19 +0000
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::b3c:3f6:e3d0:a81b]) by CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::b3c:3f6:e3d0:a81b%6]) with mapi id 15.20.6745.034; Wed, 6 Sep 2023
 09:56:19 +0000
From: Sarah Walker <sarah.walker@imgtec.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v6 14/20] drm/imagination: Implement MIPS firmware processor
 and MMU support
Date: Wed,  6 Sep 2023 10:55:36 +0100
Message-Id: <20230906095542.3280699-15-sarah.walker@imgtec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230906095542.3280699-1-sarah.walker@imgtec.com>
References: <20230906095542.3280699-1-sarah.walker@imgtec.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0279.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::18) To CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:170::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP265MB4817:EE_|CWLP265MB2436:EE_
X-MS-Office365-Filtering-Correlation-Id: fb6b77fa-cae7-40cb-994c-08dbaebf8341
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e5Zv+m6aMD8cbccfOwOnloEs7vBkwORzoM7FULIAqqQgPPWmfNyqoBAhlFD1Uj0b86UK0/sP7eE6S+ZJjflQDqGF1oHAqKR42Yj7QODDR3oeW1Z7RfhZ7xHqXK9vj//Lsj67v+WUc/r7ithlOjo41SHn8BLuX9h0MVp5q0FS6Uhd2dpsm3tR1Xb0S9EeTuLW/umMFzy3LcFW/LdBETpwonIBl0Ck5Kdxi5KaY7oXBks1yNGTNW+nAKNysEOew2r0s6XhosMQl0fGrv1dJAl+loCXMKijek7ziK2b1pT3P5PZ38cGScs/ploUo8YvILJTSC+yuRYLLzyL64XL9isNL0qF/0K41AVkGtwKvf8HQSf5QVIfW4bKobjwxm/kpLPV/2TJOsAIfbx1NBcqWGzn0k+BXMtc52QfWNDMxDRbORTDD6UC3D37sfSmHZ8sVUppSgS0tJNipuG+T/vvQ5l+1KmCBf1fNjbOiFP2Fp3/cn04M+F8oejF5p0WjINUpVWnaJMdsKeSuPdrnO70A4aqEGIj6Hx+sGzuPlSgCj4nQqg27Mzwq3Lt1zuKpBeA7hRJcTHknM8CMaYeE7XdgXe0NM8m2+1M1wM+QxZVx8Yn9uYlolcBwo036dZRSbqY+SQliFEefpiL5xwP+vquGAaSzwCt9JFV5u1SNYKZUM9tzXs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(136003)(346002)(39850400004)(376002)(451199024)(186009)(1800799009)(52116002)(6506007)(6512007)(6666004)(6486002)(36756003)(38350700002)(38100700002)(86362001)(30864003)(1076003)(2616005)(2906002)(26005)(478600001)(83380400001)(66946007)(8936002)(8676002)(5660300002)(44832011)(4326008)(41300700001)(66476007)(7416002)(6916009)(66556008)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nDxJTxjx0S1maHHuCBgC9GV8iM08niWwcIK5hOHxq6OQGY8Wk031ii3jzQsM?=
 =?us-ascii?Q?OcRwNzhjV5kZkP5p/hytpgDy/gFfhPEvTgTsr+APE+zSpMc2FT/1P8glY8+w?=
 =?us-ascii?Q?vV8YNpwI7jR55AAlwvYZFxGQMHhJ1LzREVCfjy0EQv5U7rkLkGw/NVy3Fbc+?=
 =?us-ascii?Q?lgXTq7luXCIa/nPrSfE1r98H1LAPzJoJ9yjxs3TRW5S2l4XxeWRU0qD1XGnm?=
 =?us-ascii?Q?2JC2Wl8OC6LiijK3CyJeAFwykFiy0eYFJRTKCOE855ykti3rz8vQR6HLONXE?=
 =?us-ascii?Q?r2yqWZB0PewKWWTSs082g6SrPqUkUg7lZ6LP4wYqMDg8rLhOTZTUDtlP+E6n?=
 =?us-ascii?Q?xBR09YnVISZ5FzF+ue0zj0yBHrVa+BpkAMZmCka1cecOktvl3wpj1V6wn/Ik?=
 =?us-ascii?Q?SFqNiJNDvH2pnAAsXmbjyWBCHeZms82ANIpsxStpgTUAeDS+9nBz0Y5A5I+6?=
 =?us-ascii?Q?MOfMxbHIt/S8UpgLHUXlz0aUDVZZbU1GrU8WoCHUr7EWMLYCXwvHjAatS9Ga?=
 =?us-ascii?Q?3+eJJLqRnF7sp5JlgmMA/4kLLIi6rCihNZtzb/r5CBeryxbWss7hiTtsG+G1?=
 =?us-ascii?Q?AjRhWAjftTQsAyqzyAnKvGyzCMyd3n58ueP0PPvLzCwj9Q4YIR+9Ep1zA4Fn?=
 =?us-ascii?Q?jQmajLDB+AphuM6kXjFdBe/DYBW8JJT7Soh77I5TdQrbAZF1zt4oeX1uOtE1?=
 =?us-ascii?Q?vFxcdqBCmQL0zaFY8CuYVBfYmVEWRmzAyhYQPRwydgCJfbSToRgoIk3RauRr?=
 =?us-ascii?Q?aky9Q1iu+Iy32kUe2/eGVbN6LXKyMhRfVP7nq9nDPcxCL7NGBUO1X0p8RvZA?=
 =?us-ascii?Q?UrV6dqDAGop6LtPxvWHAxEOL1nOkcKBCTi3Oz/M+VGg1QKmQ5bG9XO2X3srP?=
 =?us-ascii?Q?9AwusoYGBlnb/9Cs6fD6+Ig/lpeVt9E8AqtCCvyTY3xDDZiT5DC4ISXnc7yL?=
 =?us-ascii?Q?/c3Uk2bqxL7ityKeJ3y/vwZZXKBvfiWNjEKn0fY62iRoADq2oSWOV8CM7WE8?=
 =?us-ascii?Q?JYYwuEb90NyhtlAVW4CvLq5VU65xBF8sUaJFcKOfl3//dRDANYu2/ZoIEK9F?=
 =?us-ascii?Q?ROBtVxDJjYzm/jWmtqTw3sVpkmuAbsnHDsfkecgLHOiNezmn7m4x9ZqrbKnM?=
 =?us-ascii?Q?iwEq3dQfQQJztA4lwr12FJ8KU9Ay/I/Tl9lVZTYxUfJnlfe+kgLsaZ6gGqPG?=
 =?us-ascii?Q?USriWHmx6tSb4SkAPs0wKuHnENiAwGmuLN2YNMEw8FgF885vtqTtgG9yNj5b?=
 =?us-ascii?Q?U6QB9YNSRATY4qHs67LzVr999BhUte9rwJmjSg7WWDTwxPjKVWOR3GCvsO3Y?=
 =?us-ascii?Q?S2cstt5/OKGeQOV0MujmUaH+CbmFp65d9zTGguY+AQ8MmSdUuloTFyKMSmsN?=
 =?us-ascii?Q?AlCzLQr591pFbayxSshx5V+0YswmioBcKytxi2/qv1oqqaeWXR1xfW3a7Wfx?=
 =?us-ascii?Q?jyGwxMkS/OkLsnYETfaMyknyZqiH+Wkdy1hSY+hJLdOk8dAfMm5a1riUDkKt?=
 =?us-ascii?Q?dLWS46r9xdyNzowVmbhWZ59Odfyw4wy1e7RKJRIkTVW/9xqP1JGU1XqRQx6m?=
 =?us-ascii?Q?wmxbp4DN+TBSpr4y15y5bre+N+hwuzlqBzALS5PUPOF6jTySuJRHqCU29CGb?=
 =?us-ascii?Q?lg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fb6b77fa-cae7-40cb-994c-08dbaebf8341
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 09:56:16.9821 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FORmfacmixwxn/0gQbArcaomYB8OmV9qpN3ZwrIVd5eTmetnaS8ymcKBhk/BT90LOfRnJTSvMurr/PzWOOdJdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB2436
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: DDjcFUdr5s7cMoDlLBqWoulfczhx3yMb
X-Proofpoint-ORIG-GUID: DDjcFUdr5s7cMoDlLBqWoulfczhx3yMb
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
Cc: linux-doc@vger.kernel.org, hns@goldelico.com,
 krzysztof.kozlowski+dt@linaro.org, matthew.brost@intel.com, corbet@lwn.net,
 luben.tuikov@amd.com, dakr@redhat.com, donald.robson@imgtec.com,
 devicetree@vger.kernel.org, conor+dt@kernel.org, mripard@kernel.org,
 matt.coster@imgtec.com, robh+dt@kernel.org, faith.ekstrand@collabora.com,
 linux-kernel@vger.kernel.org, afd@ti.com, boris.brezillon@collabora.com,
 tzimmermann@suse.de, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for the MIPS firmware processor, used in the Series AXE GPU.
The MIPS firmware processor uses a separate MMU to the rest of the GPU, so
this patch adds support for that as well.

Changes since v5:
- Use alloc_page() when allocating MIPS pagetable

Changes since v3:
- Get regs resource (removed from GPU resources commit)

Signed-off-by: Sarah Walker <sarah.walker@imgtec.com>
---
 drivers/gpu/drm/imagination/Makefile      |   4 +-
 drivers/gpu/drm/imagination/pvr_device.c  |   5 +-
 drivers/gpu/drm/imagination/pvr_device.h  |   3 +
 drivers/gpu/drm/imagination/pvr_fw.c      |   2 +
 drivers/gpu/drm/imagination/pvr_fw_mips.c | 252 ++++++++++++++++++++++
 drivers/gpu/drm/imagination/pvr_fw_mips.h |  48 +++++
 drivers/gpu/drm/imagination/pvr_vm_mips.c | 236 ++++++++++++++++++++
 drivers/gpu/drm/imagination/pvr_vm_mips.h |  22 ++
 8 files changed, 570 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/imagination/pvr_fw_mips.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_fw_mips.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_vm_mips.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_vm_mips.h

diff --git a/drivers/gpu/drm/imagination/Makefile b/drivers/gpu/drm/imagination/Makefile
index 5b02440841be..0a6532d30c00 100644
--- a/drivers/gpu/drm/imagination/Makefile
+++ b/drivers/gpu/drm/imagination/Makefile
@@ -10,11 +10,13 @@ powervr-y := \
 	pvr_drv.o \
 	pvr_fw.o \
 	pvr_fw_meta.o \
+	pvr_fw_mips.o \
 	pvr_fw_startstop.o \
 	pvr_fw_trace.o \
 	pvr_gem.o \
 	pvr_mmu.o \
 	pvr_power.o \
-	pvr_vm.o
+	pvr_vm.o \
+	pvr_vm_mips.o
 
 obj-$(CONFIG_DRM_POWERVR) += powervr.o
diff --git a/drivers/gpu/drm/imagination/pvr_device.c b/drivers/gpu/drm/imagination/pvr_device.c
index ad198ed432fe..bc7333444388 100644
--- a/drivers/gpu/drm/imagination/pvr_device.c
+++ b/drivers/gpu/drm/imagination/pvr_device.c
@@ -50,16 +50,19 @@ pvr_device_reg_init(struct pvr_device *pvr_dev)
 {
 	struct drm_device *drm_dev = from_pvr_device(pvr_dev);
 	struct platform_device *plat_dev = to_platform_device(drm_dev->dev);
+	struct resource *regs_resource;
 	void __iomem *regs;
 
+	pvr_dev->regs_resource = NULL;
 	pvr_dev->regs = NULL;
 
-	regs = devm_platform_ioremap_resource(plat_dev, 0);
+	regs = devm_platform_get_and_ioremap_resource(plat_dev, 0, &regs_resource);
 	if (IS_ERR(regs))
 		return dev_err_probe(drm_dev->dev, PTR_ERR(regs),
 				     "failed to ioremap gpu registers\n");
 
 	pvr_dev->regs = regs;
+	pvr_dev->regs_resource = regs_resource;
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/imagination/pvr_device.h b/drivers/gpu/drm/imagination/pvr_device.h
index b5de9574a116..cbcfc5d4b845 100644
--- a/drivers/gpu/drm/imagination/pvr_device.h
+++ b/drivers/gpu/drm/imagination/pvr_device.h
@@ -93,6 +93,9 @@ struct pvr_device {
 	/** @fw_version: Firmware version detected at runtime. */
 	struct pvr_fw_version fw_version;
 
+	/** @regs_resource: Resource representing device control registers. */
+	struct resource *regs_resource;
+
 	/**
 	 * @regs: Device control registers.
 	 *
diff --git a/drivers/gpu/drm/imagination/pvr_fw.c b/drivers/gpu/drm/imagination/pvr_fw.c
index 449984c0f233..0799c70f1a0c 100644
--- a/drivers/gpu/drm/imagination/pvr_fw.c
+++ b/drivers/gpu/drm/imagination/pvr_fw.c
@@ -914,6 +914,8 @@ pvr_fw_init(struct pvr_device *pvr_dev)
 
 	if (fw_dev->processor_type == PVR_FW_PROCESSOR_TYPE_META)
 		fw_dev->defs = &pvr_fw_defs_meta;
+	else if (fw_dev->processor_type == PVR_FW_PROCESSOR_TYPE_MIPS)
+		fw_dev->defs = &pvr_fw_defs_mips;
 	else
 		return -EINVAL;
 
diff --git a/drivers/gpu/drm/imagination/pvr_fw_mips.c b/drivers/gpu/drm/imagination/pvr_fw_mips.c
new file mode 100644
index 000000000000..bf13b05d1248
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_fw_mips.c
@@ -0,0 +1,252 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/* Copyright (c) 2023 Imagination Technologies Ltd. */
+
+#include "pvr_device.h"
+#include "pvr_fw.h"
+#include "pvr_fw_mips.h"
+#include "pvr_gem.h"
+#include "pvr_rogue_mips.h"
+#include "pvr_vm_mips.h"
+
+#include <linux/elf.h>
+#include <linux/err.h>
+#include <linux/types.h>
+
+#define ROGUE_FW_HEAP_MIPS_BASE 0xC0000000
+#define ROGUE_FW_HEAP_MIPS_SHIFT 24 /* 16 MB */
+#define ROGUE_FW_HEAP_MIPS_RESERVED_SIZE SZ_1M
+
+/**
+ * process_elf_command_stream() - Process ELF firmware image and populate
+ *                                firmware sections
+ * @pvr_dev: Device pointer.
+ * @fw: Pointer to firmware image.
+ * @fw_code_ptr: Pointer to FW code section.
+ * @fw_data_ptr: Pointer to FW data section.
+ * @fw_core_code_ptr: Pointer to FW coremem code section.
+ * @fw_core_data_ptr: Pointer to FW coremem data section.
+ *
+ * Returns :
+ *  * 0 on success, or
+ *  * -EINVAL on any error in ELF command stream.
+ */
+static int
+process_elf_command_stream(struct pvr_device *pvr_dev, const u8 *fw, u8 *fw_code_ptr,
+			   u8 *fw_data_ptr, u8 *fw_core_code_ptr, u8 *fw_core_data_ptr)
+{
+	struct elf32_hdr *header = (struct elf32_hdr *)fw;
+	struct elf32_phdr *program_header = (struct elf32_phdr *)(fw + header->e_phoff);
+	struct drm_device *drm_dev = from_pvr_device(pvr_dev);
+	u32 entry;
+	int err;
+
+	for (entry = 0; entry < header->e_phnum; entry++, program_header++) {
+		void *write_addr;
+
+		/* Only consider loadable entries in the ELF segment table */
+		if (program_header->p_type != PT_LOAD)
+			continue;
+
+		err = pvr_fw_find_mmu_segment(pvr_dev, program_header->p_vaddr,
+					      program_header->p_memsz, fw_code_ptr, fw_data_ptr,
+					      fw_core_code_ptr, fw_core_data_ptr, &write_addr);
+		if (err) {
+			drm_err(drm_dev,
+				"Addr 0x%x (size: %d) not found in any firmware segment",
+				program_header->p_vaddr, program_header->p_memsz);
+			return err;
+		}
+
+		/* Write to FW allocation only if available */
+		if (write_addr) {
+			memcpy(write_addr, fw + program_header->p_offset,
+			       program_header->p_filesz);
+
+			memset((u8 *)write_addr + program_header->p_filesz, 0,
+			       program_header->p_memsz - program_header->p_filesz);
+		}
+	}
+
+	return 0;
+}
+
+static int
+pvr_mips_init(struct pvr_device *pvr_dev)
+{
+	pvr_fw_heap_info_init(pvr_dev, ROGUE_FW_HEAP_MIPS_SHIFT, ROGUE_FW_HEAP_MIPS_RESERVED_SIZE);
+
+	return pvr_vm_mips_init(pvr_dev);
+}
+
+static void
+pvr_mips_fini(struct pvr_device *pvr_dev)
+{
+	pvr_vm_mips_fini(pvr_dev);
+}
+
+static int
+pvr_mips_fw_process(struct pvr_device *pvr_dev, const u8 *fw,
+		    u8 *fw_code_ptr, u8 *fw_data_ptr, u8 *fw_core_code_ptr, u8 *fw_core_data_ptr,
+		    u32 core_code_alloc_size)
+{
+	struct pvr_fw_device *fw_dev = &pvr_dev->fw_dev;
+	struct pvr_fw_mips_data *mips_data = fw_dev->processor_data.mips_data;
+	const struct pvr_fw_layout_entry *boot_code_entry;
+	const struct pvr_fw_layout_entry *boot_data_entry;
+	const struct pvr_fw_layout_entry *exception_code_entry;
+	const struct pvr_fw_layout_entry *stack_entry;
+	struct rogue_mipsfw_boot_data *boot_data;
+	dma_addr_t dma_addr;
+	u32 page_nr;
+	int err;
+
+	err = process_elf_command_stream(pvr_dev, fw, fw_code_ptr, fw_data_ptr, fw_core_code_ptr,
+					 fw_core_data_ptr);
+	if (err)
+		return err;
+
+	boot_code_entry = pvr_fw_find_layout_entry(pvr_dev, MIPS_BOOT_CODE);
+	boot_data_entry = pvr_fw_find_layout_entry(pvr_dev, MIPS_BOOT_DATA);
+	exception_code_entry = pvr_fw_find_layout_entry(pvr_dev, MIPS_EXCEPTIONS_CODE);
+	if (!boot_code_entry || !boot_data_entry || !exception_code_entry)
+		return -EINVAL;
+
+	WARN_ON(pvr_gem_get_dma_addr(fw_dev->mem.code_obj->gem, boot_code_entry->alloc_offset,
+				     &mips_data->boot_code_dma_addr));
+	WARN_ON(pvr_gem_get_dma_addr(fw_dev->mem.data_obj->gem, boot_data_entry->alloc_offset,
+				     &mips_data->boot_data_dma_addr));
+	WARN_ON(pvr_gem_get_dma_addr(fw_dev->mem.code_obj->gem,
+				     exception_code_entry->alloc_offset,
+				     &mips_data->exception_code_dma_addr));
+
+	stack_entry = pvr_fw_find_layout_entry(pvr_dev, MIPS_STACK);
+	if (!stack_entry)
+		return -EINVAL;
+
+	boot_data = (struct rogue_mipsfw_boot_data *)(fw_data_ptr + boot_data_entry->alloc_offset +
+						      ROGUE_MIPSFW_BOOTLDR_CONF_OFFSET);
+
+	WARN_ON(pvr_fw_object_get_dma_addr(fw_dev->mem.data_obj, stack_entry->alloc_offset,
+					   &dma_addr));
+	boot_data->stack_phys_addr = dma_addr;
+
+	boot_data->reg_base = pvr_dev->regs_resource->start;
+
+	for (page_nr = 0; page_nr < ARRAY_SIZE(boot_data->pt_phys_addr); page_nr++) {
+		/* Firmware expects 4k pages, but host page size might be different. */
+		u32 src_page_nr = (page_nr * ROGUE_MIPSFW_PAGE_SIZE_4K) >> PAGE_SHIFT;
+		u32 page_offset = (page_nr * ROGUE_MIPSFW_PAGE_SIZE_4K) & ~PAGE_MASK;
+
+		boot_data->pt_phys_addr[page_nr] = mips_data->pt_dma_addr[src_page_nr] +
+						   page_offset;
+	}
+
+	boot_data->pt_log2_page_size = ROGUE_MIPSFW_LOG2_PAGE_SIZE_4K;
+	boot_data->pt_num_pages = ROGUE_MIPSFW_MAX_NUM_PAGETABLE_PAGES;
+	boot_data->reserved1 = 0;
+	boot_data->reserved2 = 0;
+
+	return 0;
+}
+
+static int
+pvr_mips_wrapper_init(struct pvr_device *pvr_dev)
+{
+	struct pvr_fw_mips_data *mips_data = pvr_dev->fw_dev.processor_data.mips_data;
+	const u64 remap_settings = ROGUE_MIPSFW_BOOT_REMAP_LOG2_SEGMENT_SIZE;
+	u32 phys_bus_width;
+
+	int err = PVR_FEATURE_VALUE(pvr_dev, phys_bus_width, &phys_bus_width);
+
+	if (WARN_ON(err))
+		return err;
+
+	/* Currently MIPS FW only supported with physical bus width > 32 bits. */
+	if (WARN_ON(phys_bus_width <= 32))
+		return -EINVAL;
+
+	pvr_cr_write32(pvr_dev, ROGUE_CR_MIPS_WRAPPER_CONFIG,
+		       (ROGUE_MIPSFW_REGISTERS_VIRTUAL_BASE >>
+			ROGUE_MIPSFW_WRAPPER_CONFIG_REGBANK_ADDR_ALIGN) |
+		       ROGUE_CR_MIPS_WRAPPER_CONFIG_BOOT_ISA_MODE_MICROMIPS);
+
+	/* Configure remap for boot code, boot data and exceptions code areas. */
+	pvr_cr_write64(pvr_dev, ROGUE_CR_MIPS_ADDR_REMAP1_CONFIG1,
+		       ROGUE_MIPSFW_BOOT_REMAP_PHYS_ADDR_IN |
+		       ROGUE_CR_MIPS_ADDR_REMAP1_CONFIG1_MODE_ENABLE_EN);
+	pvr_cr_write64(pvr_dev, ROGUE_CR_MIPS_ADDR_REMAP1_CONFIG2,
+		       (mips_data->boot_code_dma_addr &
+			~ROGUE_CR_MIPS_ADDR_REMAP1_CONFIG2_ADDR_OUT_CLRMSK) | remap_settings);
+
+	if (PVR_HAS_QUIRK(pvr_dev, 63553)) {
+		/*
+		 * WA always required on 36 bit cores, to avoid continuous unmapped memory accesses
+		 * to address 0x0.
+		 */
+		WARN_ON(phys_bus_width != 36);
+
+		pvr_cr_write64(pvr_dev, ROGUE_CR_MIPS_ADDR_REMAP5_CONFIG1,
+			       ROGUE_CR_MIPS_ADDR_REMAP5_CONFIG1_MODE_ENABLE_EN);
+		pvr_cr_write64(pvr_dev, ROGUE_CR_MIPS_ADDR_REMAP5_CONFIG2,
+			       (mips_data->boot_code_dma_addr &
+				~ROGUE_CR_MIPS_ADDR_REMAP5_CONFIG2_ADDR_OUT_CLRMSK) |
+			       remap_settings);
+	}
+
+	pvr_cr_write64(pvr_dev, ROGUE_CR_MIPS_ADDR_REMAP2_CONFIG1,
+		       ROGUE_MIPSFW_DATA_REMAP_PHYS_ADDR_IN |
+		       ROGUE_CR_MIPS_ADDR_REMAP2_CONFIG1_MODE_ENABLE_EN);
+	pvr_cr_write64(pvr_dev, ROGUE_CR_MIPS_ADDR_REMAP2_CONFIG2,
+		       (mips_data->boot_data_dma_addr &
+			~ROGUE_CR_MIPS_ADDR_REMAP2_CONFIG2_ADDR_OUT_CLRMSK) | remap_settings);
+
+	pvr_cr_write64(pvr_dev, ROGUE_CR_MIPS_ADDR_REMAP3_CONFIG1,
+		       ROGUE_MIPSFW_CODE_REMAP_PHYS_ADDR_IN |
+		       ROGUE_CR_MIPS_ADDR_REMAP3_CONFIG1_MODE_ENABLE_EN);
+	pvr_cr_write64(pvr_dev, ROGUE_CR_MIPS_ADDR_REMAP3_CONFIG2,
+		       (mips_data->exception_code_dma_addr &
+			~ROGUE_CR_MIPS_ADDR_REMAP3_CONFIG2_ADDR_OUT_CLRMSK) | remap_settings);
+
+	/* Garten IDLE bit controlled by MIPS. */
+	pvr_cr_write64(pvr_dev, ROGUE_CR_MTS_GARTEN_WRAPPER_CONFIG,
+		       ROGUE_CR_MTS_GARTEN_WRAPPER_CONFIG_IDLE_CTRL_META);
+
+	/* Turn on the EJTAG probe. */
+	pvr_cr_write32(pvr_dev, ROGUE_CR_MIPS_DEBUG_CONFIG, 0);
+
+	return 0;
+}
+
+static u32
+pvr_mips_get_fw_addr_with_offset(struct pvr_fw_object *fw_obj, u32 offset)
+{
+	struct pvr_device *pvr_dev = to_pvr_device(gem_from_pvr_gem(fw_obj->gem)->dev);
+
+	/* MIPS cacheability is determined by page table. */
+	return ((fw_obj->fw_addr_offset + offset) & pvr_dev->fw_dev.fw_heap_info.offset_mask) |
+	       ROGUE_FW_HEAP_MIPS_BASE;
+}
+
+static bool
+pvr_mips_has_fixed_data_addr(void)
+{
+	return true;
+}
+
+const struct pvr_fw_defs pvr_fw_defs_mips = {
+	.init = pvr_mips_init,
+	.fini = pvr_mips_fini,
+	.fw_process = pvr_mips_fw_process,
+	.vm_map = pvr_vm_mips_map,
+	.vm_unmap = pvr_vm_mips_unmap,
+	.get_fw_addr_with_offset = pvr_mips_get_fw_addr_with_offset,
+	.wrapper_init = pvr_mips_wrapper_init,
+	.has_fixed_data_addr = pvr_mips_has_fixed_data_addr,
+	.irq = {
+		.enable_reg = ROGUE_CR_MIPS_WRAPPER_IRQ_ENABLE,
+		.status_reg = ROGUE_CR_MIPS_WRAPPER_IRQ_STATUS,
+		.clear_reg = ROGUE_CR_MIPS_WRAPPER_IRQ_CLEAR,
+		.event_mask = ROGUE_CR_MIPS_WRAPPER_IRQ_STATUS_EVENT_EN,
+		.clear_mask = ROGUE_CR_MIPS_WRAPPER_IRQ_CLEAR_EVENT_EN,
+	},
+};
diff --git a/drivers/gpu/drm/imagination/pvr_fw_mips.h b/drivers/gpu/drm/imagination/pvr_fw_mips.h
new file mode 100644
index 000000000000..676b2d279796
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_fw_mips.h
@@ -0,0 +1,48 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/* Copyright (c) 2023 Imagination Technologies Ltd. */
+
+#ifndef PVR_FW_MIPS_H
+#define PVR_FW_MIPS_H
+
+#include "pvr_rogue_mips.h"
+
+#include <asm/page.h>
+#include <linux/types.h>
+
+/* Forward declaration from pvr_gem.h. */
+struct pvr_gem_object;
+
+#define PVR_MIPS_PT_PAGE_COUNT ((ROGUE_MIPSFW_MAX_NUM_PAGETABLE_PAGES * ROGUE_MIPSFW_PAGE_SIZE_4K) \
+				>> PAGE_SHIFT)
+/**
+ * struct pvr_fw_mips_data - MIPS-specific data
+ */
+struct pvr_fw_mips_data {
+	/**
+	 * @pt_pages: Pages containing MIPS pagetable.
+	 */
+	struct page *pt_pages[PVR_MIPS_PT_PAGE_COUNT];
+
+	/** @pt: Pointer to CPU mapping of MIPS pagetable. */
+	u32 *pt;
+
+	/** @pt_dma_addr: DMA mappings of MIPS pagetable. */
+	dma_addr_t pt_dma_addr[PVR_MIPS_PT_PAGE_COUNT];
+
+	/** @boot_code_dma_addr: DMA address of MIPS boot code. */
+	dma_addr_t boot_code_dma_addr;
+
+	/** @boot_data_dma_addr: DMA address of MIPS boot data. */
+	dma_addr_t boot_data_dma_addr;
+
+	/** @exception_code_dma_addr: DMA address of MIPS exception code. */
+	dma_addr_t exception_code_dma_addr;
+
+	/** @cache_policy: Cache policy for this processor. */
+	u32 cache_policy;
+
+	/** @pfn_mask: PFN mask for MIPS pagetable. */
+	u32 pfn_mask;
+};
+
+#endif /* PVR_FW_MIPS_H */
diff --git a/drivers/gpu/drm/imagination/pvr_vm_mips.c b/drivers/gpu/drm/imagination/pvr_vm_mips.c
new file mode 100644
index 000000000000..157197a5ee2c
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_vm_mips.c
@@ -0,0 +1,236 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/* Copyright (c) 2023 Imagination Technologies Ltd. */
+
+#include "pvr_device.h"
+#include "pvr_fw_mips.h"
+#include "pvr_gem.h"
+#include "pvr_mmu.h"
+#include "pvr_rogue_mips.h"
+#include "pvr_vm.h"
+#include "pvr_vm_mips.h"
+
+#include <drm/drm_managed.h>
+#include <linux/dma-mapping.h>
+#include <linux/err.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+
+/**
+ * pvr_vm_mips_init() - Initialise MIPS FW pagetable
+ * @pvr_dev: Target PowerVR device.
+ *
+ * Returns:
+ *  * 0 on success,
+ *  * -%EINVAL,
+ *  * Any error returned by pvr_gem_object_create(), or
+ *  * And error returned by pvr_gem_object_vmap().
+ */
+int
+pvr_vm_mips_init(struct pvr_device *pvr_dev)
+{
+	u32 pt_size = 1 << ROGUE_MIPSFW_LOG2_PAGETABLE_SIZE_4K(pvr_dev);
+	struct device *dev = from_pvr_device(pvr_dev)->dev;
+	struct pvr_fw_mips_data *mips_data;
+	u32 phys_bus_width;
+	int page_nr;
+	int err;
+
+	/* Page table size must be at most ROGUE_MIPSFW_MAX_NUM_PAGETABLE_PAGES * 4k pages. */
+	if (pt_size > ROGUE_MIPSFW_MAX_NUM_PAGETABLE_PAGES * SZ_4K)
+		return -EINVAL;
+
+	if (PVR_FEATURE_VALUE(pvr_dev, phys_bus_width, &phys_bus_width))
+		return -EINVAL;
+
+	mips_data = drmm_kzalloc(from_pvr_device(pvr_dev), sizeof(*mips_data), GFP_KERNEL);
+	if (!mips_data)
+		return -ENOMEM;
+
+	for (page_nr = 0; page_nr < ARRAY_SIZE(mips_data->pt_pages); page_nr++) {
+		mips_data->pt_pages[page_nr] = alloc_page(GFP_KERNEL | __GFP_ZERO);
+		if (!mips_data->pt_pages[page_nr]) {
+			err = -ENOMEM;
+			goto err_free_pages;
+		}
+
+		mips_data->pt_dma_addr[page_nr] = dma_map_page(dev, mips_data->pt_pages[page_nr], 0,
+							       PAGE_SIZE, DMA_TO_DEVICE);
+		if (dma_mapping_error(dev, mips_data->pt_dma_addr[page_nr])) {
+			err = -ENOMEM;
+			goto err_free_pages;
+		}
+	}
+
+	mips_data->pt = vmap(mips_data->pt_pages, pt_size >> PAGE_SHIFT, VM_MAP,
+			     pgprot_writecombine(PAGE_KERNEL));
+	if (!mips_data->pt) {
+		err = -ENOMEM;
+		goto err_free_pages;
+	}
+
+	mips_data->pfn_mask = (phys_bus_width > 32) ? ROGUE_MIPSFW_ENTRYLO_PFN_MASK_ABOVE_32BIT :
+						      ROGUE_MIPSFW_ENTRYLO_PFN_MASK;
+
+	mips_data->cache_policy = (phys_bus_width > 32) ? ROGUE_MIPSFW_CACHED_POLICY_ABOVE_32BIT :
+							  ROGUE_MIPSFW_CACHED_POLICY;
+
+	pvr_dev->fw_dev.processor_data.mips_data = mips_data;
+
+	return 0;
+
+err_free_pages:
+	for (; page_nr >= 0; page_nr--) {
+		if (mips_data->pt_dma_addr[page_nr])
+			dma_unmap_page(from_pvr_device(pvr_dev)->dev,
+				       mips_data->pt_dma_addr[page_nr], PAGE_SIZE, DMA_TO_DEVICE);
+
+		if (mips_data->pt_pages[page_nr])
+			__free_page(mips_data->pt_pages[page_nr]);
+	}
+
+	return err;
+}
+
+/**
+ * pvr_vm_mips_fini() - Release MIPS FW pagetable
+ * @pvr_dev: Target PowerVR device.
+ */
+void
+pvr_vm_mips_fini(struct pvr_device *pvr_dev)
+{
+	struct pvr_fw_device *fw_dev = &pvr_dev->fw_dev;
+	struct pvr_fw_mips_data *mips_data = fw_dev->processor_data.mips_data;
+	int page_nr;
+
+	vunmap(mips_data->pt);
+	for (page_nr = ARRAY_SIZE(mips_data->pt_pages) - 1; page_nr >= 0; page_nr--) {
+		dma_unmap_page(from_pvr_device(pvr_dev)->dev,
+			       mips_data->pt_dma_addr[page_nr], PAGE_SIZE, DMA_TO_DEVICE);
+
+		__free_page(mips_data->pt_pages[page_nr]);
+	}
+
+	fw_dev->processor_data.mips_data = NULL;
+}
+
+static u32
+get_mips_pte_flags(bool read, bool write, u32 cache_policy)
+{
+	u32 flags = 0;
+
+	if (read && write) /* Read/write. */
+		flags |= ROGUE_MIPSFW_ENTRYLO_DIRTY_EN;
+	else if (write)    /* Write only. */
+		flags |= ROGUE_MIPSFW_ENTRYLO_READ_INHIBIT_EN;
+	else
+		WARN_ON(!read);
+
+	flags |= cache_policy << ROGUE_MIPSFW_ENTRYLO_CACHE_POLICY_SHIFT;
+
+	flags |= ROGUE_MIPSFW_ENTRYLO_VALID_EN | ROGUE_MIPSFW_ENTRYLO_GLOBAL_EN;
+
+	return flags;
+}
+
+/**
+ * pvr_vm_mips_map() - Map a FW object into MIPS address space
+ * @pvr_dev: Target PowerVR device.
+ * @fw_obj: FW object to map.
+ *
+ * Returns:
+ *  * 0 on success,
+ *  * -%EINVAL if object does not reside within FW address space, or
+ *  * Any error returned by pvr_fw_object_get_dma_addr().
+ */
+int
+pvr_vm_mips_map(struct pvr_device *pvr_dev, struct pvr_fw_object *fw_obj)
+{
+	struct pvr_fw_device *fw_dev = &pvr_dev->fw_dev;
+	struct pvr_fw_mips_data *mips_data = fw_dev->processor_data.mips_data;
+	struct pvr_gem_object *pvr_obj = fw_obj->gem;
+	u64 start = fw_obj->fw_mm_node.start;
+	u64 size = fw_obj->fw_mm_node.size;
+	u64 end;
+	u32 cache_policy;
+	u32 pte_flags;
+	u32 start_pfn;
+	u32 end_pfn;
+	u32 pfn;
+	int err;
+
+	if (check_add_overflow(start, size - 1, &end))
+		return -EINVAL;
+
+	if (start < ROGUE_FW_HEAP_BASE ||
+	    start >= ROGUE_FW_HEAP_BASE + fw_dev->fw_heap_info.raw_size ||
+	    end < ROGUE_FW_HEAP_BASE ||
+	    end >= ROGUE_FW_HEAP_BASE + fw_dev->fw_heap_info.raw_size ||
+	    (start & ROGUE_MIPSFW_PAGE_MASK_4K) ||
+	    ((end + 1) & ROGUE_MIPSFW_PAGE_MASK_4K))
+		return -EINVAL;
+
+	start_pfn = (start & fw_dev->fw_heap_info.offset_mask) >> ROGUE_MIPSFW_LOG2_PAGE_SIZE_4K;
+	end_pfn = (end & fw_dev->fw_heap_info.offset_mask) >> ROGUE_MIPSFW_LOG2_PAGE_SIZE_4K;
+
+	if (pvr_obj->flags & PVR_BO_FW_FLAGS_DEVICE_UNCACHED)
+		cache_policy = ROGUE_MIPSFW_UNCACHED_CACHE_POLICY;
+	else
+		cache_policy = mips_data->cache_policy;
+
+	pte_flags = get_mips_pte_flags(true, true, cache_policy);
+
+	for (pfn = start_pfn; pfn <= end_pfn; pfn++) {
+		dma_addr_t dma_addr;
+		u32 pte;
+
+		err = pvr_fw_object_get_dma_addr(fw_obj,
+						 (pfn - start_pfn) <<
+						 ROGUE_MIPSFW_LOG2_PAGE_SIZE_4K,
+						 &dma_addr);
+		if (err)
+			goto err_unmap_pages;
+
+		pte = ((dma_addr >> ROGUE_MIPSFW_LOG2_PAGE_SIZE_4K)
+		       << ROGUE_MIPSFW_ENTRYLO_PFN_SHIFT) & mips_data->pfn_mask;
+		pte |= pte_flags;
+
+		WRITE_ONCE(mips_data->pt[pfn], pte);
+	}
+
+	pvr_mmu_flush(pvr_dev);
+
+	return 0;
+
+err_unmap_pages:
+	for (; pfn >= start_pfn; pfn--)
+		WRITE_ONCE(mips_data->pt[pfn], 0);
+
+	pvr_mmu_flush(pvr_dev);
+
+	return err;
+}
+
+/**
+ * pvr_vm_mips_unmap() - Unmap a FW object into MIPS address space
+ * @pvr_dev: Target PowerVR device.
+ * @fw_obj: FW object to unmap.
+ */
+void
+pvr_vm_mips_unmap(struct pvr_device *pvr_dev, struct pvr_fw_object *fw_obj)
+{
+	struct pvr_fw_device *fw_dev = &pvr_dev->fw_dev;
+	struct pvr_fw_mips_data *mips_data = fw_dev->processor_data.mips_data;
+	u64 start = fw_obj->fw_mm_node.start;
+	u64 size = fw_obj->fw_mm_node.size;
+	u64 end = start + size;
+
+	u32 start_pfn = (start & fw_dev->fw_heap_info.offset_mask) >>
+			ROGUE_MIPSFW_LOG2_PAGE_SIZE_4K;
+	u32 end_pfn = (end & fw_dev->fw_heap_info.offset_mask) >> ROGUE_MIPSFW_LOG2_PAGE_SIZE_4K;
+	u32 pfn;
+
+	for (pfn = start_pfn; pfn < end_pfn; pfn++)
+		WRITE_ONCE(mips_data->pt[pfn], 0);
+
+	pvr_mmu_flush(pvr_dev);
+}
diff --git a/drivers/gpu/drm/imagination/pvr_vm_mips.h b/drivers/gpu/drm/imagination/pvr_vm_mips.h
new file mode 100644
index 000000000000..71d238d5327a
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_vm_mips.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/* Copyright (c) 2023 Imagination Technologies Ltd. */
+
+#ifndef PVR_VM_MIPS_H
+#define PVR_VM_MIPS_H
+
+/* Forward declaration from pvr_device.h. */
+struct pvr_device;
+
+/* Forward declaration from pvr_gem.h. */
+struct pvr_fw_object;
+
+int
+pvr_vm_mips_init(struct pvr_device *pvr_dev);
+void
+pvr_vm_mips_fini(struct pvr_device *pvr_dev);
+int
+pvr_vm_mips_map(struct pvr_device *pvr_dev, struct pvr_fw_object *fw_obj);
+void
+pvr_vm_mips_unmap(struct pvr_device *pvr_dev, struct pvr_fw_object *fw_obj);
+
+#endif /* PVR_VM_MIPS_H */
-- 
2.42.0

