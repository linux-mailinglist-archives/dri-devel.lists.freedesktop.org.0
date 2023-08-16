Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B23377DC24
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 10:27:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44BB510E2F6;
	Wed, 16 Aug 2023 08:27:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36FDE10E2F6
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 08:26:55 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 37G7djRY002497; Wed, 16 Aug 2023 09:26:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :content-transfer-encoding:content-type:mime-version; s=
 dk201812; bh=dVK8x3qxVejT2MS+ybXjmR9K8pO1TaPX+6OdW32T2+M=; b=Z3i
 hLHNonTAnJExySFf8PcBsJ+Esn7WsqFzRPYZVFTFdIZX8Irm1ph51/9oV9sGx6Pp
 AGuIT3hUki3CuEGEJ6tWeLJmHS/gy+pzBlPO9mgMW5qRYSaIvOQkLC3pQvWhI5gA
 oDSrXQ38ca7UXxGxhlc/OtsEhFz7Tl+C8f/z+QdwfWz3W4LLE7EEmkX3lN/KtCli
 bps9PrwhaotlIt2dh/krNc+XvXNEjmXJp3kQO6hzx5mzQaQj4thly5VI+WiMh0Rw
 0rNtCNzEW3WI25ySvXhigmYtglMYF9/gtzMzBl5SPLxdEc1rcHtNyswyXDXlMhd1
 RH4Gf0acS09pRCpezLA==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 3se25ttutw-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 16 Aug 2023 09:26:37 +0100 (BST)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 16 Aug 2023 09:26:25 +0100
Received: from GBR01-LO2-obe.outbound.protection.outlook.com (104.47.21.54) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27 via Frontend
 Transport; Wed, 16 Aug 2023 09:26:25 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ab/jkoDoQEf/We+qVEhg2reYN3ZmvGoFgV3qaL4TtdopeT0C1oRW8Myk6atkMTk/CaOFEJELp7mWIotbGpF1b33S8WFgRee/ulM5yqNoxNSa/cIX9W8qnPkMOs4mHNgMIasJJ5AN++Pn1mkQTljO9R5vfdFowdYL71jifCf6v/9ualp35M5/zJg5xQA41daSpBkSa0uJtlvke8ExpNVmlDeChSNi3VPXEfkbJPS/7KVUoYxza4hbq/APe9KTQ8wpr4BRqPtFspr1ygzq4aeakFYKlE9Ff1CssOoXZ8R2ibWHZpG59C9eqMUeYjI5YPJPPAow+98YCJ6+2iYMbeUNhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dVK8x3qxVejT2MS+ybXjmR9K8pO1TaPX+6OdW32T2+M=;
 b=cijRWLAxqCupP3mMcMPz7GM8V4mq17obWyYXDPOw+LFGM7H11QbZtjL8dWCqPfnVXLb6MWDl8wPOF1Lrbk46P0VgJs2/yORencqQKADYC6fJpSxAh+vnAaHkRbs3a8QoJ+JaPuz41IolurCiSopr1GRww7kbEuFocJfmR/z8WT21f6CSLRtWoXRuR9osCog+SXzVUQ1uSSNsiLlseMn8nyzq3sLgLzn+zdXrSu56J9vHJ6wmtMZV4X9L4wd6j7QkYncPjM4NBmyFvB99PLrw+HeoqpPNNUN8Xy4VossiEalWWZ6VksKfCvDfbEj8Tx0jcoWzdCL46Nt5APaqexlq6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dVK8x3qxVejT2MS+ybXjmR9K8pO1TaPX+6OdW32T2+M=;
 b=rNHu3ism63QJGS45jAz4YePRyFL6kC7r7IlbCU/dt3WoX7e5ll+9z9gBvMaU2C2cDFI0X8tNS32bke1NDBaPegIj5+m8m/6lhmru2SefVbBwwPNeeKLcJPSMOgOTI76NyfNGEzaICAIJS6Fsk1qvetvs6lj6ae3GndmyX2aMaZ0=
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:170::9)
 by LNXP265MB2491.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:130::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.29; Wed, 16 Aug
 2023 08:26:24 +0000
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ee4f:2d71:fe8a:ffdf]) by CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ee4f:2d71:fe8a:ffdf%7]) with mapi id 15.20.6678.022; Wed, 16 Aug 2023
 08:26:24 +0000
From: Sarah Walker <sarah.walker@imgtec.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v5 11/17] drm/imagination: Implement MIPS firmware processor
 and MMU support
Date: Wed, 16 Aug 2023 09:25:26 +0100
Message-Id: <20230816082531.164695-12-sarah.walker@imgtec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230816082531.164695-1-sarah.walker@imgtec.com>
References: <20230816082531.164695-1-sarah.walker@imgtec.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO3P265CA0023.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:387::10) To CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:170::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP265MB4817:EE_|LNXP265MB2491:EE_
X-MS-Office365-Filtering-Correlation-Id: a7a9b15e-227a-4a3f-62f8-08db9e327a62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hvGJWjtHIYff0s7DBH/Vw8FDzyhfzF44Hdn+q2fUY3+MjERBWXNR6vQ8quCAq4MqeBCdfghhyZuUW9NG1hCNtff7Q5kZty7g5spCHo7+2pC5qNJ0eloFOS61GsBB4iA9/gblrb+j6Xnq9ivSa/qhjx6wkrwlms77pIWACM5JuxigeCrR1yvl+9tI2YXnCUs4xiA0XJP2s1ilqViLo+qzl4DG7L3Vqq/8jWUBQuaiJT2uOHQgBx39gqjbiHamPIIkSf2xIYMYUy5ncVLHELf2xzKckUJ8+XNDFnvYuqR4Gdp5A/pb20fCBJrEMqo24SJXBl2JW8XMpINgjen3Xu9qQ8ISFVxF5axPpTYaWmAMsFx2+s/AhimA7ccr3TTlhGjj6GU5ymyLWpVZvCVgNq0WfIlVdmjfRJ+8EDLI3eAlnBeCbw17AS70hiUhJtkYUtdB+541KkiiLw4Kp+1pYZL2yKUuXySZr0p3WOsoKykHnf+8mT67/bhAeVgNAkOPPdR1ei3F8NC6LunFMMfh2ePk1wn+KGHF94c5WjudZf0QArKH9c6oJnnRaqFXs5hyH928HHeDtciumJqZYY8TgBcAByr8lqtdHfHAXo6R/Q/ITvxDLy1PT0r8TUz7PUuz0ywJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(396003)(39850400004)(346002)(136003)(1800799009)(451199024)(186009)(66476007)(66556008)(66946007)(6512007)(6486002)(6506007)(30864003)(2906002)(478600001)(1076003)(26005)(6916009)(7416002)(5660300002)(2616005)(83380400001)(41300700001)(316002)(44832011)(52116002)(8936002)(4326008)(8676002)(38350700002)(38100700002)(36756003)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eoGGBErQux2NJYX3WyJJ63qU2FQ/r0S80gSF1yhU84JIEpAzDAt3wrn6YoMY?=
 =?us-ascii?Q?sRbbWcaYT8G4YZbJdpo/Ml98MUT2aQZq2pyOfgPyJGTgUK3X8QGiO0gfSMDz?=
 =?us-ascii?Q?4Wq6GLxEggf1JYp3QIqSUk5DlyEzphQWzFJoNKjzTGrRz1fXsloTiNsWlR9R?=
 =?us-ascii?Q?dTTreE8frdX7JShlCrJwfM+EPvL/Awkrz1TnsaE74ATeDkKGaKEXj5FCniEx?=
 =?us-ascii?Q?ULlRdI6a+iR/Zxth1qny7HqZOWWt0LPzUdtf0lMCziTj6K8SxmxWHhZawK3Y?=
 =?us-ascii?Q?2EgIBMsgxUSe4FaoGzoTZ28zwYXPOb02MrUEepdz5efJLj7+C3bwB0QdGqWQ?=
 =?us-ascii?Q?CHQczWxjE7Xu0aktXsfXCuy08KbG2UKmSboMEjBlCFnOBT9znVOycAZAr4kI?=
 =?us-ascii?Q?cDt7R9H3g7Vl9/b4PqFADBt8ujwX9/MhJ54doNTFyuvxFLItWQYD4AH/M7kP?=
 =?us-ascii?Q?yEpbObrMMnbq84hgICknddz1KftpelXyme+1IrEoo4b/qOg9ay06raXz28qZ?=
 =?us-ascii?Q?l5lfl3gmkEAid7hmO7hp6UW+h6uKiR3H1Y/rjHOLqvHx57U0ysSTQHmG6fim?=
 =?us-ascii?Q?HIKrsVdqXezjgZzVOHMP2smodqR7P/ijrSr7OhghrFndNmhtL+sqPe2NpCtl?=
 =?us-ascii?Q?8DBowG6u9pdAImk72hxYd2DwjhGP5GQvfR2sEfbrq6kmccX40fIOjg6+r1lY?=
 =?us-ascii?Q?bQML3MAkcEh6UGOTKTpAIWns6j2ZY/V/iA9JgRUqnvoszbuli43LjeKKDeaj?=
 =?us-ascii?Q?aS2pefj9yEBYo5nqciRQEEhRzbsd8ZoEx+EoRfScqoYI6zkgy5LWQMYdfNCm?=
 =?us-ascii?Q?svLgcP+0vmg9COL0qatgVVYqc0aeKzqmPnB5SNf84RYwOwBk2t1phK6CJ7+0?=
 =?us-ascii?Q?4hl7CUqueUMpjkHgI2JAR1yncroEGJypVs1zi3RDOyQZqL1Q7oVeGn7mcTP1?=
 =?us-ascii?Q?A0clDIUvlQ/SEGEnr/c9sjTKWeDx1EXv0wnTYbmL1w7uEfXcUbvf7KDAaRz4?=
 =?us-ascii?Q?WQq/XvMhtjB2y8t72XrqKM86hMgdGMeqLiRZo1GX34NQriC9u+cQOaXODSoR?=
 =?us-ascii?Q?F4Ki0VkBdkazdv+a1pOgxpiI35tJ8PGc07d+h8g3ZjikIQqQjaq5SQioBSkj?=
 =?us-ascii?Q?x5kBX4vn2eYkR8rGn84LkNOktLnLKi9ZLZOBEgyzady/42kHBEcrhaJ6h+wh?=
 =?us-ascii?Q?GipcWlxlIMoPj19BZhVB8mCdjWqRe07DvXHgc96vkGet2nzyu+m1YiJN9r28?=
 =?us-ascii?Q?9q3sDNhSWuYjejXdgDsoQ7gilgocypJvJNLQ3Zv4BGfawYOGJAS+HOQ1/zja?=
 =?us-ascii?Q?pZBy9r0aXmaaVI/eCJGCTmtX2M4OHEzlh5KEmCX0cE6gJLIgUGaoAK8v9Wvz?=
 =?us-ascii?Q?mVi2la5bNocaOn0Nnh3TRYOGr9wRtkuvPU1CngNdPR/n4v8b1h+jRG2beHrh?=
 =?us-ascii?Q?W25xtyQb2McHqvZ9Pskzchdcjb/a0psIg2GSw/F1EpU2jW1x6UQ6C/Y8+pdS?=
 =?us-ascii?Q?VeMTsbq3rePuECkLeNlqUZ049Kwby4bKsS1SkenzI0FlKTqSDeoabHCfB+FO?=
 =?us-ascii?Q?a7Vgi2bVy355D/hAxvrGfGeMhcs20fUGeomYY+NjoaSuzLEFsXwqjdlkB0TF?=
 =?us-ascii?Q?5A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a7a9b15e-227a-4a3f-62f8-08db9e327a62
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 08:26:24.2935 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zv74MsEG/Yj/jEO/kxGHS9YfZ+U3OLYrr00Jwe1fRUV+Estxn6+PLEJeSHIv5Y/Wa60O78omkErhE9wSJ2C6ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LNXP265MB2491
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: W_zZHsPyIggIfglZYWyhXYmCiOxROpgZ
X-Proofpoint-GUID: W_zZHsPyIggIfglZYWyhXYmCiOxROpgZ
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
Cc: matthew.brost@intel.com, luben.tuikov@amd.com, tzimmermann@suse.de,
 linux-kernel@vger.kernel.org, mripard@kernel.org, afd@ti.com,
 boris.brezillon@collabora.com, dakr@redhat.com, donald.robson@imgtec.com,
 hns@goldelico.com, christian.koenig@amd.com, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for the MIPS firmware processor, used in the Series AXE GPU.
The MIPS firmware processor uses a separate MMU to the rest of the GPU, so
this patch adds support for that as well.

Changes since v3:
- Get regs resource (removed from GPU resources commit)

Signed-off-by: Sarah Walker <sarah.walker@imgtec.com>
---
 drivers/gpu/drm/imagination/Makefile      |   4 +-
 drivers/gpu/drm/imagination/pvr_device.c  |   5 +-
 drivers/gpu/drm/imagination/pvr_device.h  |   3 +
 drivers/gpu/drm/imagination/pvr_fw.c      |   2 +
 drivers/gpu/drm/imagination/pvr_fw_mips.c | 250 ++++++++++++++++++++++
 drivers/gpu/drm/imagination/pvr_fw_mips.h |  38 ++++
 drivers/gpu/drm/imagination/pvr_vm_mips.c | 208 ++++++++++++++++++
 drivers/gpu/drm/imagination/pvr_vm_mips.h |  22 ++
 8 files changed, 530 insertions(+), 2 deletions(-)
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
index d6feac60834b..7e353cfe4fd2 100644
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
index 000000000000..b842d37a7e7f
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_fw_mips.c
@@ -0,0 +1,250 @@
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
+		WARN_ON(pvr_gem_get_dma_addr(mips_data->pt_obj,
+					     page_nr << ROGUE_MIPSFW_LOG2_PAGE_SIZE_4K, &dma_addr));
+
+		boot_data->pt_phys_addr[page_nr] = dma_addr;
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
index 000000000000..efb31a69af29
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_fw_mips.h
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/* Copyright (c) 2023 Imagination Technologies Ltd. */
+
+#ifndef PVR_FW_MIPS_H
+#define PVR_FW_MIPS_H
+
+#include <linux/types.h>
+
+/* Forward declaration from pvr_gem.h. */
+struct pvr_gem_object;
+
+/**
+ * struct pvr_fw_mips_data - MIPS-specific data
+ */
+struct pvr_fw_mips_data {
+	/** @pt_obj: Object representing MIPS pagetable. */
+	struct pvr_gem_object *pt_obj;
+
+	/** @pt: Pointer to CPU mapping of MIPS pagetable. */
+	u32 *pt;
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
index 000000000000..940c7da17fec
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_vm_mips.c
@@ -0,0 +1,208 @@
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
+	struct pvr_fw_mips_data *mips_data;
+	u32 phys_bus_width;
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
+	mips_data->pt_obj = pvr_gem_object_create(pvr_dev, pt_size,
+						  DRM_PVR_BO_DEVICE_PM_FW_PROTECT);
+	if (IS_ERR(mips_data->pt_obj))
+		return PTR_ERR(mips_data->pt_obj);
+
+	mips_data->pt = pvr_gem_object_vmap(mips_data->pt_obj);
+	if (IS_ERR(mips_data->pt)) {
+		err = PTR_ERR(mips_data->pt);
+		goto err_put_obj;
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
+err_put_obj:
+	pvr_gem_object_put(mips_data->pt_obj);
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
+
+	pvr_gem_object_vunmap(mips_data->pt_obj);
+	pvr_gem_object_put(mips_data->pt_obj);
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
2.41.0

