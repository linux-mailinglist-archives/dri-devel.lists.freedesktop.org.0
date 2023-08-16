Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6672F77DC22
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 10:26:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3627510E2F2;
	Wed, 16 Aug 2023 08:26:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 673CB10E2DF
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 08:26:51 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 37G7djRV002497; Wed, 16 Aug 2023 09:26:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :content-transfer-encoding:content-type:mime-version; s=
 dk201812; bh=XC9Q50597mupFH/Fl9yTVbCff3oCcBXRAyAJJhkV/nM=; b=qXc
 YgRhOB8UmvitJVPkuulc3iOJbRSIC4pwHyK6sMk6ucfQK7a5fB4RoQ+W6/gu0Igk
 OzS8Ux6141cZTTgNyefUfsfjbpJ8mljaBs3VB+GdnCu0f9IGUktn7LPXZ2saTj6q
 yp/X3EqnaGUnzvcK3/XJtNunRlbEKYcyQ6UGvriv/bH+Ld38tE9Gh+aceSa88hz/
 UtYpFRI6YSl069xki5fAVbRyroLUp5qYo5bo4mWjZWA9hY4oEPP9xxqajVHmKyf2
 FJvlZTVLiWJ3Sg4wVt1lfG/OC/cV3xZuX5l8cDybVoGcwMH6lToaxHPllyK84UOI
 IG+/qK9XF3G1Rl67iGQ==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 3se25ttutw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 16 Aug 2023 09:26:35 +0100 (BST)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 16 Aug 2023 09:26:24 +0100
Received: from GBR01-LO2-obe.outbound.protection.outlook.com (104.47.21.50) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27 via Frontend
 Transport; Wed, 16 Aug 2023 09:26:24 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sc11vA3bGM8hOQ24vlh7qoSagk5Vtp29CWLr1Gkiab3v7wTT9u/nc1MrpTu/0kaBUr1lrU9g+Jrb2/8ByvmiMSZLbWlRQbzJOYS/I1KlpdP/DXhqj9TRK7ML/mPgKKM9VPU7ncl8xMLVN8gSM8a0Dxl0y1DZgOh6maNP9CJ7569rIivj7gm0BGCfP53lOaulKfiqktb68OAxLhW7h47qgDNOWV42wqPvJuEKOCnANal8mb5rWc3oNmZB/yf3Uub07jGnAbMQJAd5hLNWzSCofz2cHdBvN4q2QZSKTSUpeoW6lAw2VxAGw3+M3cgC552mhdAmL7la661Eu02tEZkbXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XC9Q50597mupFH/Fl9yTVbCff3oCcBXRAyAJJhkV/nM=;
 b=P3Cpk/GX7dk/5MxGyZ2uGjORorVVVSTby58Qgk5yLJOpmynXr04BJ8Xg3rydidwuvtQ6R6odkDyQ/UN4RujPw4xodmmLmZPx4I0ku0/cqNhFvrH5iVpaPoND1384R1VrKxs+C89XOUwl+AJcSaRYNemFoNWM7K6N4zighbQT1upbN7Ry+kiKv0pd4amPcd5GiZgQSGb91nGnr8/wYRBX0T793qPFF/+JywniM0Dy8aMhkImRKpFXHybuba2Ug3wFKZTsqkOJuXqUUKMI1bnvvzjSBBQpjF1jU1kKkcpJaBZwNlrWU7okXCZklVG+hIrMm5+SMtTDIzBO3MWL4fIAeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XC9Q50597mupFH/Fl9yTVbCff3oCcBXRAyAJJhkV/nM=;
 b=flmOfZpreXt/LXFQPU9uiIzwYyizUtrRWaokKgmnUmfBrR+KgRh7LYbcHAouMvNzUfCaajRv8j1Nzy+KbfOrswuDWq5YtLZzz6X9B3/YsECiz8EPFSuC29N38BloxftA+8fUvYAbCA6p+7Flj68H2OQ6M+0CV7xHFBhc9QG6DP0=
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:170::9)
 by LNXP265MB2491.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:130::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.29; Wed, 16 Aug
 2023 08:26:23 +0000
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ee4f:2d71:fe8a:ffdf]) by CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ee4f:2d71:fe8a:ffdf%7]) with mapi id 15.20.6678.022; Wed, 16 Aug 2023
 08:26:23 +0000
From: Sarah Walker <sarah.walker@imgtec.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v5 09/17] drm/imagination: Implement power management
Date: Wed, 16 Aug 2023 09:25:24 +0100
Message-Id: <20230816082531.164695-10-sarah.walker@imgtec.com>
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
X-MS-Office365-Filtering-Correlation-Id: 5de2d5c8-b3c9-4cf3-e8be-08db9e32799e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6K9RZ634l0gbYToitp1e8YM7i6U2MSARarS+huJW5+p4i87hz6o7lqR/2vEtkgJkeCkJ7/Sa8BSTh/qLT+EpniDbqUY72B2q91IveDjqZTKi/oHSYPlxfAOiXUzgROARMA8XKza7c39lEmBk6hkvsaE5fsx0Ye1cIGHbf2TBBRZa+ca4pylEjWkBfKLt+bnkoGFoXHDwZaT+3jz3odKzkdxzgG3aImzDJ4ExdhSrU9JacXhATRaClI3toPjK709+F9CPFVRmz2qOvHrcAGfq+MrI8Z3NlIwuAl3LvneW6/vfPtJxF886Za9woFJ4y4GSiFQt+m4OpxE8jqtErObiPLJa5naMXGMsoN/Zq991+mjhUhaKqkxwHm048Agvnef2ScnSW1MKyMFkxQnx8tVk4maDlZfcgRX2b+T4otbPwESDUEsBm9Kv6OGQcqclRn7OpCGSraI4PeIpK1EtApAgDH1WPSa+m/1zEbU5HDPSi20t4o0ufrsU6bmowZBbqlhCCS0bKNFAR6Rzyw7oanjR99hOpJz25DMBKduahUKIbW1gBpFWNQ21iAzxdpCxrjTIcJ9e3dj26BouZtuvjczJCMweACGyCGtN56+AOPDppNCvEFcOg/Yh9S7/EM0ERKL+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(396003)(39850400004)(346002)(136003)(1800799009)(451199024)(186009)(66476007)(66556008)(66946007)(6512007)(6486002)(6506007)(30864003)(2906002)(478600001)(1076003)(26005)(6916009)(7416002)(5660300002)(2616005)(83380400001)(41300700001)(316002)(44832011)(52116002)(8936002)(4326008)(8676002)(38350700002)(38100700002)(36756003)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RYCAHeg8LEMzf3qU9yAykysfUB6bvgkXqKVs0pY8b6aOQPR6TLGxqz4C/zn5?=
 =?us-ascii?Q?6JIy7nCYvfwGgb+OGtZ2K53FMOB07pZ6VEYloOO7OPTi2Ogsc+2VUkSC6MK7?=
 =?us-ascii?Q?WW2bYna8Ao7RO4q2iZiMjwPtAhuWL/OWh+uhnWfKBCyUwP2b+VqsPRfSe/AE?=
 =?us-ascii?Q?me97ru9OtwrbOks7qSXWcdNnn/hkJx5r9HTehyONfAiCr8r3mRZrbVyB1G3S?=
 =?us-ascii?Q?vV2hk4R7KDrcmB7knPXlwU6EVIGvuwuHo2p8tv61L4wQFe5d/W+Sx02Ijp/o?=
 =?us-ascii?Q?uiGPs/WIOr1HV/FkNXkAdBUtboBDj6vmZdLJ9vy+wCQEk8TgCQARM3oBmOoA?=
 =?us-ascii?Q?1a8jfAIVGgp72JmSwoASEDZDR8zsKJS9He0t/USz+b+3K+hLSM39HvuxnjQP?=
 =?us-ascii?Q?nxtDGa8n39b+zqgzsV2XUqCBxtwSDYa2/pf0tM/fODcUKDxLgBP+NaO9UjQg?=
 =?us-ascii?Q?Zx6oycyC/SdgekGaiA6Tyc65jA8W9ouXH91fDMVAKGTZcXTwYEM0Oz0E9+n8?=
 =?us-ascii?Q?fSft2M4f3plPFneId33efDpaoHazYGwBcV14fI3Nbl3SSmWRHq2wqtXFOVNU?=
 =?us-ascii?Q?BxOkqoWdkB22ruBJdk/bM2ZztNtQqQlTJBFt1WmeG1UYV7Sa/UsM3lKDwcrz?=
 =?us-ascii?Q?gkczyLBZqNRN94JV9uHbjo9WlEnaC+7Hj0He+qxHxlFljBYEP/GLyS8ZBEbn?=
 =?us-ascii?Q?gjzseE1X1ecs+Z+7rjNflLuf9RM0x0VxpaYfTHXbRuohd52ZsUD1Sw4HEdqS?=
 =?us-ascii?Q?iC1hvw5N++0PD6OcjeyBU33vmbcERDUX7KrZjGIWnC2LqY2z9UYG5azgQDce?=
 =?us-ascii?Q?KJRl9t1GFplPYe/yw5xJkq52Kt0vsR3Kz/Eat3Ux1O8bxvAW0EIYUs++Jmqm?=
 =?us-ascii?Q?3sGEJQufV4ig5S27eoYnoLPDTZfxug92Tk9EDCnmMIvY3ZOS9x0AhDO6Z9j6?=
 =?us-ascii?Q?5kj8RRBghBru5QiRGfHIMC+JJYcw2Q78olNDKwYzM0uKobPH5hXBiKi+wBrL?=
 =?us-ascii?Q?FaXHP5IREGITQGyv5s9kDzzY7TRaRFRnmaYbRDHGKMG2NS+dovt9bRIbywB4?=
 =?us-ascii?Q?zUofjxRvsLRAGGwpIs3vkVepo9dG5Gt4556OZG1+z5wc1W45+Pn2FzTqBjlv?=
 =?us-ascii?Q?Ol4hCAVb34RHEsset5VdGR4R8TC0IbwN3kvMUy//Fx3Objx+WrEMEF37Xspd?=
 =?us-ascii?Q?tx6WtgCyAm+JVDe3tJgd8nuAx81RQzx9OZ4YfO7mEyXtTnXaGb1vgsdB0nBJ?=
 =?us-ascii?Q?4ZQxdIfj1H6AQx6rNFiiElL3HRHkploKkVVAB50Wmq/Hb5YONdp/IReNbbPQ?=
 =?us-ascii?Q?Cd+fMzl4xICvQpBcu9jjxqnpHo1QLRFBOT4E2lhXSbjKEh+ElksWXAMURcrS?=
 =?us-ascii?Q?03P2ABRLjwVsZV4JBNUY3FlT5TxZTx3YcJ3GwmUSSx5rhL1z8f/4YerEnSTR?=
 =?us-ascii?Q?sDMDCqJwulFqxOeSn7gTmm57XXCPQhtUatAgQxkqK+QScOm5/1B+OJWNte1t?=
 =?us-ascii?Q?PC0lY68LX9G6NPixnGa0AI1QlQOwVrrOUKIeaeLlyvlTbSuiu+X9L9z2F0P7?=
 =?us-ascii?Q?MovCLBsUW/4jBOhcEjn5L2i4GMtmwijYtLpwDgmB+GfXfNlbPVodZvTfaeb2?=
 =?us-ascii?Q?Gg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5de2d5c8-b3c9-4cf3-e8be-08db9e32799e
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 08:26:23.0382 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yNcg2gDPiq+fE7s8/8ks2fO9vnWc9zWvtzYLyhkO+B53D0LaJV8CgMRNGArSS9GaI2qlxtuUmjNBLa/SNsHiAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LNXP265MB2491
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: P24Ue7R2BKl-htvL_HVHr_hJOZWELkL8
X-Proofpoint-GUID: P24Ue7R2BKl-htvL_HVHr_hJOZWELkL8
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

Add power management to the driver, using runtime pm. The power off
sequence depends on firmware commands which are not implemented in this
patch.

Changes since v4:
- Suspend runtime PM before unplugging device on rmmod

Changes since v3:
- Don't power device when calling pvr_device_gpu_fini()
- Documentation for pvr_dev->lost has been improved
- pvr_power_init() renamed to pvr_watchdog_init()
- Use drm_dev_{enter,exit}

Changes since v2:
- Use runtime PM
- Implement watchdog

Signed-off-by: Sarah Walker <sarah.walker@imgtec.com>
---
 drivers/gpu/drm/imagination/Makefile     |   1 +
 drivers/gpu/drm/imagination/pvr_device.c |  23 +-
 drivers/gpu/drm/imagination/pvr_device.h |  22 ++
 drivers/gpu/drm/imagination/pvr_drv.c    |  20 +-
 drivers/gpu/drm/imagination/pvr_power.c  | 271 +++++++++++++++++++++++
 drivers/gpu/drm/imagination/pvr_power.h  |  39 ++++
 6 files changed, 373 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/imagination/pvr_power.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_power.h

diff --git a/drivers/gpu/drm/imagination/Makefile b/drivers/gpu/drm/imagination/Makefile
index 8fcabc1bea36..235e2d329e29 100644
--- a/drivers/gpu/drm/imagination/Makefile
+++ b/drivers/gpu/drm/imagination/Makefile
@@ -10,6 +10,7 @@ powervr-y := \
 	pvr_fw.o \
 	pvr_gem.o \
 	pvr_mmu.o \
+	pvr_power.o \
 	pvr_vm.o
 
 obj-$(CONFIG_DRM_POWERVR) += powervr.o
diff --git a/drivers/gpu/drm/imagination/pvr_device.c b/drivers/gpu/drm/imagination/pvr_device.c
index ef8f7a2ff1a9..5dbd05f21238 100644
--- a/drivers/gpu/drm/imagination/pvr_device.c
+++ b/drivers/gpu/drm/imagination/pvr_device.c
@@ -5,6 +5,7 @@
 #include "pvr_device_info.h"
 
 #include "pvr_fw.h"
+#include "pvr_power.h"
 #include "pvr_rogue_cr_defs.h"
 #include "pvr_vm.h"
 
@@ -357,6 +358,8 @@ pvr_device_gpu_fini(struct pvr_device *pvr_dev)
 int
 pvr_device_init(struct pvr_device *pvr_dev)
 {
+	struct drm_device *drm_dev = from_pvr_device(pvr_dev);
+	struct device *dev = drm_dev->dev;
 	int err;
 
 	/* Enable and initialize clocks required for the device to operate. */
@@ -364,13 +367,29 @@ pvr_device_init(struct pvr_device *pvr_dev)
 	if (err)
 		return err;
 
+	/* Explicitly power the GPU so we can access control registers before the FW is booted. */
+	err = pm_runtime_resume_and_get(dev);
+	if (err)
+		return err;
+
 	/* Map the control registers into memory. */
 	err = pvr_device_reg_init(pvr_dev);
 	if (err)
-		return err;
+		goto err_pm_runtime_put;
 
 	/* Perform GPU-specific initialization steps. */
-	return pvr_device_gpu_init(pvr_dev);
+	err = pvr_device_gpu_init(pvr_dev);
+	if (err)
+		goto err_pm_runtime_put;
+
+	pm_runtime_put(dev);
+
+	return 0;
+
+err_pm_runtime_put:
+	pm_runtime_put_sync_suspend(dev);
+
+	return err;
 }
 
 /**
diff --git a/drivers/gpu/drm/imagination/pvr_device.h b/drivers/gpu/drm/imagination/pvr_device.h
index 990363e433d7..6d58ecfbc838 100644
--- a/drivers/gpu/drm/imagination/pvr_device.h
+++ b/drivers/gpu/drm/imagination/pvr_device.h
@@ -135,6 +135,28 @@ struct pvr_device {
 
 	/** @fw_dev: Firmware related data. */
 	struct pvr_fw_device fw_dev;
+
+	struct {
+		/** @work: Work item for watchdog callback. */
+		struct delayed_work work;
+
+		/** @old_kccb_cmds_executed: KCCB command execution count at last watchdog poll. */
+		u32 old_kccb_cmds_executed;
+
+		/** @kccb_stall_count: Number of watchdog polls KCCB has been stalled for. */
+		u32 kccb_stall_count;
+	} watchdog;
+
+	/**
+	 * @lost: %true if the device has been lost.
+	 *
+	 * This variable is set if the device has become irretrievably unavailable, e.g. if the
+	 * firmware processor has stopped responding and can not be revived via a hard reset.
+	 */
+	bool lost;
+
+	/** @sched_wq: Workqueue for schedulers. */
+	struct workqueue_struct *sched_wq;
 };
 
 /**
diff --git a/drivers/gpu/drm/imagination/pvr_drv.c b/drivers/gpu/drm/imagination/pvr_drv.c
index 0d51177b506c..0331dc549116 100644
--- a/drivers/gpu/drm/imagination/pvr_drv.c
+++ b/drivers/gpu/drm/imagination/pvr_drv.c
@@ -4,6 +4,7 @@
 #include "pvr_device.h"
 #include "pvr_drv.h"
 #include "pvr_gem.h"
+#include "pvr_power.h"
 #include "pvr_rogue_defs.h"
 #include "pvr_rogue_fwif_client.h"
 #include "pvr_rogue_fwif_shared.h"
@@ -1279,9 +1280,16 @@ pvr_probe(struct platform_device *plat_dev)
 
 	platform_set_drvdata(plat_dev, drm_dev);
 
+	devm_pm_runtime_enable(&plat_dev->dev);
+	pm_runtime_mark_last_busy(&plat_dev->dev);
+
+	pm_runtime_set_autosuspend_delay(&plat_dev->dev, 50);
+	pm_runtime_use_autosuspend(&plat_dev->dev);
+	pvr_watchdog_init(pvr_dev);
+
 	err = pvr_device_init(pvr_dev);
 	if (err)
-		return err;
+		goto err_watchdog_fini;
 
 	err = drm_dev_register(drm_dev, 0);
 	if (err)
@@ -1292,6 +1300,9 @@ pvr_probe(struct platform_device *plat_dev)
 err_device_fini:
 	pvr_device_fini(pvr_dev);
 
+err_watchdog_fini:
+	pvr_watchdog_fini(pvr_dev);
+
 	return err;
 }
 
@@ -1301,8 +1312,10 @@ pvr_remove(struct platform_device *plat_dev)
 	struct drm_device *drm_dev = platform_get_drvdata(plat_dev);
 	struct pvr_device *pvr_dev = to_pvr_device(drm_dev);
 
+	pm_runtime_suspend(drm_dev->dev);
 	drm_dev_unplug(drm_dev);
 	pvr_device_fini(pvr_dev);
+	pvr_watchdog_fini(pvr_dev);
 
 	return 0;
 }
@@ -1313,11 +1326,16 @@ static const struct of_device_id dt_match[] = {
 };
 MODULE_DEVICE_TABLE(of, dt_match);
 
+static const struct dev_pm_ops pvr_pm_ops = {
+	SET_RUNTIME_PM_OPS(pvr_power_device_suspend, pvr_power_device_resume, pvr_power_device_idle)
+};
+
 static struct platform_driver pvr_driver = {
 	.probe = pvr_probe,
 	.remove = pvr_remove,
 	.driver = {
 		.name = PVR_DRIVER_NAME,
+		.pm = &pvr_pm_ops,
 		.of_match_table = dt_match,
 	},
 };
diff --git a/drivers/gpu/drm/imagination/pvr_power.c b/drivers/gpu/drm/imagination/pvr_power.c
new file mode 100644
index 000000000000..a494fed92e81
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_power.c
@@ -0,0 +1,271 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/* Copyright (c) 2023 Imagination Technologies Ltd. */
+
+#include "pvr_device.h"
+#include "pvr_fw.h"
+#include "pvr_power.h"
+#include "pvr_rogue_fwif.h"
+
+#include <drm/drm_drv.h>
+#include <drm/drm_managed.h>
+#include <linux/clk.h>
+#include <linux/interrupt.h>
+#include <linux/mutex.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/timer.h>
+#include <linux/types.h>
+#include <linux/workqueue.h>
+
+#define POWER_SYNC_TIMEOUT_US (1000000) /* 1s */
+
+#define WATCHDOG_TIME_MS (500)
+
+static int
+pvr_power_send_command(struct pvr_device *pvr_dev, struct rogue_fwif_kccb_cmd *pow_cmd)
+{
+	/* TODO: implement */
+	return -ENODEV;
+}
+
+static int
+pvr_power_request_idle(struct pvr_device *pvr_dev)
+{
+	struct rogue_fwif_kccb_cmd pow_cmd;
+
+	/* Send FORCED_IDLE request to FW. */
+	pow_cmd.cmd_type = ROGUE_FWIF_KCCB_CMD_POW;
+	pow_cmd.cmd_data.pow_data.pow_type = ROGUE_FWIF_POW_FORCED_IDLE_REQ;
+	pow_cmd.cmd_data.pow_data.power_req_data.pow_request_type = ROGUE_FWIF_POWER_FORCE_IDLE;
+
+	return pvr_power_send_command(pvr_dev, &pow_cmd);
+}
+
+static int
+pvr_power_request_pwr_off(struct pvr_device *pvr_dev)
+{
+	struct rogue_fwif_kccb_cmd pow_cmd;
+
+	/* Send POW_OFF request to firmware. */
+	pow_cmd.cmd_type = ROGUE_FWIF_KCCB_CMD_POW;
+	pow_cmd.cmd_data.pow_data.pow_type = ROGUE_FWIF_POW_OFF_REQ;
+	pow_cmd.cmd_data.pow_data.power_req_data.forced = true;
+
+	return pvr_power_send_command(pvr_dev, &pow_cmd);
+}
+
+static int
+pvr_power_fw_disable(struct pvr_device *pvr_dev, bool hard_reset)
+{
+	if (!hard_reset) {
+		int err;
+
+		cancel_delayed_work_sync(&pvr_dev->watchdog.work);
+
+		err = pvr_power_request_idle(pvr_dev);
+		if (err)
+			return err;
+
+		err = pvr_power_request_pwr_off(pvr_dev);
+		if (err)
+			return err;
+	}
+
+	/* TODO: stop firmware */
+	return -ENODEV;
+}
+
+static int
+pvr_power_fw_enable(struct pvr_device *pvr_dev)
+{
+	int err;
+
+	/* TODO: start firmware */
+	err = -ENODEV;
+	if (err)
+		return err;
+
+	queue_delayed_work(pvr_dev->sched_wq, &pvr_dev->watchdog.work,
+			   msecs_to_jiffies(WATCHDOG_TIME_MS));
+
+	return 0;
+}
+
+bool
+pvr_power_is_idle(struct pvr_device *pvr_dev)
+{
+	/* TODO: implement */
+	return true;
+}
+
+static bool
+pvr_watchdog_kccb_stalled(struct pvr_device *pvr_dev)
+{
+	/* TODO: implement */
+	return false;
+}
+
+static void
+pvr_watchdog_worker(struct work_struct *work)
+{
+	struct pvr_device *pvr_dev = container_of(work, struct pvr_device,
+						  watchdog.work.work);
+	bool stalled;
+
+	if (pvr_dev->lost)
+		return;
+
+	if (pm_runtime_get_if_in_use(from_pvr_device(pvr_dev)->dev) <= 0)
+		goto out_requeue;
+
+	stalled = pvr_watchdog_kccb_stalled(pvr_dev);
+
+	if (stalled) {
+		drm_err(from_pvr_device(pvr_dev), "FW stalled, trying hard reset");
+
+		pvr_power_reset(pvr_dev, true);
+		/* Device may be lost at this point. */
+	}
+
+	pm_runtime_put(from_pvr_device(pvr_dev)->dev);
+
+out_requeue:
+	if (!pvr_dev->lost) {
+		queue_delayed_work(pvr_dev->sched_wq, &pvr_dev->watchdog.work,
+				   msecs_to_jiffies(WATCHDOG_TIME_MS));
+	}
+}
+
+/**
+ * pvr_watchdog_init() - Initialise watchdog for device
+ * @pvr_dev: Target PowerVR device.
+ *
+ * Returns:
+ *  * 0 on success, or
+ *  * -%ENOMEM on out of memory.
+ */
+int
+pvr_watchdog_init(struct pvr_device *pvr_dev)
+{
+	INIT_DELAYED_WORK(&pvr_dev->watchdog.work, pvr_watchdog_worker);
+
+	return 0;
+}
+
+int
+pvr_power_device_suspend(struct device *dev)
+{
+	struct platform_device *plat_dev = to_platform_device(dev);
+	struct drm_device *drm_dev = platform_get_drvdata(plat_dev);
+	struct pvr_device *pvr_dev = to_pvr_device(drm_dev);
+	int idx;
+
+	if (!drm_dev_enter(drm_dev, &idx))
+		return -EIO;
+
+	clk_disable_unprepare(pvr_dev->mem_clk);
+	clk_disable_unprepare(pvr_dev->sys_clk);
+	clk_disable_unprepare(pvr_dev->core_clk);
+
+	drm_dev_exit(idx);
+
+	return 0;
+}
+
+int
+pvr_power_device_resume(struct device *dev)
+{
+	struct platform_device *plat_dev = to_platform_device(dev);
+	struct drm_device *drm_dev = platform_get_drvdata(plat_dev);
+	struct pvr_device *pvr_dev = to_pvr_device(drm_dev);
+	int idx;
+	int err;
+
+	if (!drm_dev_enter(drm_dev, &idx))
+		return -EIO;
+
+	err = clk_prepare_enable(pvr_dev->core_clk);
+	if (err)
+		goto err_drm_dev_exit;
+
+	err = clk_prepare_enable(pvr_dev->sys_clk);
+	if (err)
+		goto err_core_clk_disable;
+
+	err = clk_prepare_enable(pvr_dev->mem_clk);
+	if (err)
+		goto err_sys_clk_disable;
+
+	drm_dev_exit(idx);
+
+	return 0;
+
+err_sys_clk_disable:
+	clk_disable_unprepare(pvr_dev->sys_clk);
+
+err_core_clk_disable:
+	clk_disable_unprepare(pvr_dev->core_clk);
+
+err_drm_dev_exit:
+	drm_dev_exit(idx);
+
+	return err;
+}
+
+int
+pvr_power_device_idle(struct device *dev)
+{
+	struct platform_device *plat_dev = to_platform_device(dev);
+	struct drm_device *drm_dev = platform_get_drvdata(plat_dev);
+	struct pvr_device *pvr_dev = to_pvr_device(drm_dev);
+
+	return pvr_power_is_idle(pvr_dev) ? 0 : -EBUSY;
+}
+
+/**
+ * pvr_power_reset() - Reset the GPU
+ * @pvr_dev: Device pointer
+ * @hard_reset: %true for hard reset, %false for soft reset
+ *
+ * If @hard_reset is %false and the FW processor fails to respond during the reset process, this
+ * function will attempt a hard reset.
+ *
+ * If a hard reset fails then the GPU device is reported as lost.
+ *
+ * Returns:
+ *  * 0 on success, or
+ *  * Any error code returned by pvr_power_get, pvr_power_fw_disable or pvr_power_fw_enable().
+ */
+int
+pvr_power_reset(struct pvr_device *pvr_dev, bool hard_reset)
+{
+	/* TODO: Implement hard reset. */
+	int err;
+
+	/*
+	 * Take a power reference during the reset. This should prevent any interference with the
+	 * power state during reset.
+	 */
+	WARN_ON(pvr_power_get(pvr_dev));
+
+	err = pvr_power_fw_disable(pvr_dev, false);
+	if (err)
+		goto err_power_put;
+
+	err = pvr_power_fw_enable(pvr_dev);
+
+err_power_put:
+	pvr_power_put(pvr_dev);
+
+	return err;
+}
+
+/**
+ * pvr_watchdog_fini() - Shutdown watchdog for device
+ * @pvr_dev: Target PowerVR device.
+ */
+void
+pvr_watchdog_fini(struct pvr_device *pvr_dev)
+{
+	cancel_delayed_work_sync(&pvr_dev->watchdog.work);
+}
diff --git a/drivers/gpu/drm/imagination/pvr_power.h b/drivers/gpu/drm/imagination/pvr_power.h
new file mode 100644
index 000000000000..439f08d13655
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_power.h
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/* Copyright (c) 2023 Imagination Technologies Ltd. */
+
+#ifndef PVR_POWER_H
+#define PVR_POWER_H
+
+#include "pvr_device.h"
+
+#include <linux/mutex.h>
+#include <linux/pm_runtime.h>
+
+int pvr_watchdog_init(struct pvr_device *pvr_dev);
+void pvr_watchdog_fini(struct pvr_device *pvr_dev);
+
+bool pvr_power_is_idle(struct pvr_device *pvr_dev);
+
+int pvr_power_device_suspend(struct device *dev);
+int pvr_power_device_resume(struct device *dev);
+int pvr_power_device_idle(struct device *dev);
+
+int pvr_power_reset(struct pvr_device *pvr_dev, bool hard_reset);
+
+static __always_inline int
+pvr_power_get(struct pvr_device *pvr_dev)
+{
+	struct drm_device *drm_dev = from_pvr_device(pvr_dev);
+
+	return pm_runtime_resume_and_get(drm_dev->dev);
+}
+
+static __always_inline int
+pvr_power_put(struct pvr_device *pvr_dev)
+{
+	struct drm_device *drm_dev = from_pvr_device(pvr_dev);
+
+	return pm_runtime_put(drm_dev->dev);
+}
+
+#endif /* PVR_POWER_H */
-- 
2.41.0

