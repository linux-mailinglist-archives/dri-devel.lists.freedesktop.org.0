Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB6B3676CC
	for <lists+dri-devel@lfdr.de>; Thu, 22 Apr 2021 03:31:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F2A36E98A;
	Thu, 22 Apr 2021 01:31:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062.outbound.protection.outlook.com [40.107.93.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F30446E0DE;
 Thu, 22 Apr 2021 01:31:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HB940/s1wVS+mshpvZ2iPWQv+nUrHsvjeRelV2uzyp+O4UMEui/OcssSoZwvljJT+ZPfch07vsP6+cSULZYYbQyjTjrMQV8rwB52xwK+Aejdx2gtOMjy34Y8wCp0tGhWnOg3CFMNRkfvZ8aRYHwAauTT1AgN4UP5TM8wMldLrkzF1y60/RqBpdAZE5CyVJFUFWdSD4WLEojt0K/vX6meiDvmjPjaerz+fuqBV6GGL3TZnbqRpfjbd+WOxJTT5FORbfF+eB/aTx9rD10r/jtUu1h7Iqh4Ghfyie7Httgn3tLyUJnGEXmxGsFN4XEdfTtVgl9mqrUD/OiQ6wJoSRygag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uiGDNPyB9sauXjIoK3sHx2ycVrVYGwVdzXautwbXQvo=;
 b=jau+5/PbKig7aEehQHgPhVDYP0eZGzhfa1poFHv47uUYeFoU4KlkF60CKJ2B+8ZQcLv5BU2uCJ0RcWYoK9xrgiqnPuT1U4NkkJrGRWnp63Aw0x3IjFfRTqqfl61m59I4CfgcxSkWELZ+8soFsUzE7YMnVQHjM2YwRiD3PWzwo1G7TLjDK1qsN32sdwqiVs54Ns9rT8hW4IWVtvUuPtS5X1swQDmYhfm4XFt8tM2eHCd620XJkOT9tjQymId8QPNT9sI+Yd+0/arkRL1Sv5usolv4BdZ+QJwlg4Y2+RO3U7ZTcQ7ovm5jtfkeHo6Y+r2TJeQkZ4/sxvgWTikce4hKpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uiGDNPyB9sauXjIoK3sHx2ycVrVYGwVdzXautwbXQvo=;
 b=s4VN6mcy/7guGAByigoGKvoL22rg/fG//e4LG1kTN5S8F1cZ6P35VEyIamgsRgWpUJvPrOh4dpOXex7K3XHcacdAPGKn/T10I6ydi4Nhx3eM2pEW1kfH4VA4sT/8dS1cZxC1K2zDD/Me9aUQ/gP0yGDV3L68efXuOkfgaP60Dqo=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4438.namprd12.prod.outlook.com (2603:10b6:208:267::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Thu, 22 Apr
 2021 01:31:15 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.040; Thu, 22 Apr 2021
 01:31:15 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 01/10] rock-dbg_defconfig: Enable Intel IOMMU
Date: Wed, 21 Apr 2021 21:30:49 -0400
Message-Id: <20210422013058.6305-2-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210422013058.6305-1-Felix.Kuehling@amd.com>
References: <20210422013058.6305-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0027.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::40)
 To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0027.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.21 via Frontend Transport; Thu, 22 Apr 2021 01:31:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 503c7d7b-8c36-40f9-5d38-08d9052e51f0
X-MS-TrafficTypeDiagnostic: MN2PR12MB4438:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4438CE05B80D257C20AA5FC492469@MN2PR12MB4438.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w7eGUaxuvg9E3eV6zlDSImjjjE1q/tHATFmyGhrTQulo/jOQX+OdZxaML0z2gC6BEGViYXpSch4XhZppkQI49QgEvXcfIpF9C6jKNg5EViOvqwZ2AwRkcBM4no8p1J8TEkPPj0K+OKcEwAzLUnlpV7apBZ08SrhlAWQfY4ea265l1Flh5B8FCu7y/JdnbqRkYONaavPiSlEiaaS3r7X1sOKZK1HDWX16AShBfwF+67k5XIouqDrS+Z6gwi7bVREKU10Wo2YWISQBwk9gITxdaqwWioWZV9IPrTwrZLoaw5J8+gp9LbAyPlZaojQEnMhc38VfB8vPIX2Uh4ubuqm0KhwGMk2fii2+Mnwahm++35nfb7aBVS/OvEKZdYqKTVFk2+Bet31mCyfK7bK69nxeMkOfL7ww3hEKYpwCVSzNfrHM7xLMzLbLxcUxRH/fn9ba1Nap6pR5yQD4YN8btAkd2pn82YLJ0OzPdhBFu8p9dDrrRWFEnwmYCILdzDbXSx9r+8C0xeL70JXopzV+OqzbP6w+G1iaGXdBoZqxQNkwCP4HHAhhyLk+J1SbdPwcK1W39dJVhBJQPR5mojjCInv76YhXBvdcB0/NjLYdn71aO4YQFGnG9DDiO45eQkTmZrA4Mq8QF+kMW0iRjb+LGZ4PKvFNR2YX0bxUfXXBZltib7Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(396003)(366004)(39860400002)(8676002)(16526019)(450100002)(186003)(66556008)(36756003)(66946007)(8936002)(52116002)(956004)(2906002)(26005)(2616005)(478600001)(6486002)(38350700002)(38100700002)(83380400001)(86362001)(316002)(7696005)(5660300002)(6666004)(1076003)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?LYokfIyxEAjN5zPzrydrywBOaIDYyilHeLvjyZv3ifKFc93w19+8ppFQo7JB?=
 =?us-ascii?Q?lmgiwk6mZYEI6CyLXH6gyDe/ezUq/WHawU/QlcqJzJFn16krwF91f+Q73RtX?=
 =?us-ascii?Q?bggIh4IWhLRbYu3NP+GLYVEIUy/TekN0y+K8Npenumq2W4VIHMUEtxrFiYTX?=
 =?us-ascii?Q?YWWZdSXXeMd8u+m8o8xL9IVcZ7snkxNFS18bg89Zs2ti/C6fTYmeF+tYWYkY?=
 =?us-ascii?Q?zhROB7m5VIYg8iUUAWxKYL+/zdOltvOqO5sOMuOFqtPtPxns3/cwM6I8tXqw?=
 =?us-ascii?Q?NpuVKdxyWFPI66LSH+0aHZc9XYcIHSzH6m8xCqftoSR1VEtsVQAQZOcP9Jmd?=
 =?us-ascii?Q?AafHtKilqxvrSXiMU2oK4dWQcwnYyL9U+JIrXT5L5nh/G+0QsyL5jg+Ua6U4?=
 =?us-ascii?Q?1hdLDIgwRmoCofnu9SiNWnK3SiFxOVnpno74/Il8LXKfsGZNw+nCxJCeRVEx?=
 =?us-ascii?Q?z3+gOEQ/tvOBuzYVqdvalIRMtEKXmtfzSr3JKZSk1ZY0hpp9ZKJdZehSDpY3?=
 =?us-ascii?Q?DzeZ+d46xFsIqhR9iQXhFkEdKnfgInC3uhExCgj79gfgO//GqPILYkhwhET9?=
 =?us-ascii?Q?BxiscdIGNZqXbzyJuNMoPXI72ag/hHR95wnp5bX4PpwKIr2r1Umcf7TDndWY?=
 =?us-ascii?Q?iZ4t/Z8N/6Dbbop8eEzgXYFhD5tbP/G0XUZJ8kYVTU59IAz5N2yWJEeWST1k?=
 =?us-ascii?Q?krBZsW6QJPp6dnh4ciyxrwzP1XGTmy/s+lLZn8Nbdlh6UoDXT58ANuoLiS2p?=
 =?us-ascii?Q?waDJ7LwiFppIAMfAhzVr8/JYaOmlRn+lJwvhlNvfxQ8TjCK181t7HQh0v/ec?=
 =?us-ascii?Q?m4pDwNcejUdzI2gVPK5SJ9tA6nZdvAG9CtpaAPViD8xslw1yB262uFbkdcmt?=
 =?us-ascii?Q?AfBgBg8RuzATdugJvUGoGk/BYFx4mCNnhhMEBOQvLQrDSUlrX/gyXRux80f+?=
 =?us-ascii?Q?aIsJSisKUsQCT0sOyEIfgXmcKQ3gLQGBvyhTKVUJIHcx2fhwRq9XRAEQrxq5?=
 =?us-ascii?Q?cJYCda+kp52jRG/BM6NHQfxY3hujccR5eud6edj5uA6qHHMNMVb9ywrjDWdk?=
 =?us-ascii?Q?Kva9Ns7uZHZmF8+PjcBLY3WEFr9P7VCLJwmsprlCxiSsA0//c2PCkIGdW9GF?=
 =?us-ascii?Q?h695t8/ool9RuyZ/U0Z97MEWNy/7HLwZEKK+UvjdShlK0Xs0cUbA8TkYPrsR?=
 =?us-ascii?Q?UrSO9vCCdTECD9WQq2k/cTq5mHkj0J0SfOYHRwvj2ManoK4fBD1WmVoHZ1vH?=
 =?us-ascii?Q?yXp31ZMJgQqmBhoYiYsq1DjNXb+87c/M5m0SCneLKpYqdXbrvgLBpHEWEAhI?=
 =?us-ascii?Q?qaXfzg785WndPl66zxH+kKiF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 503c7d7b-8c36-40f9-5d38-08d9052e51f0
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2021 01:31:15.3665 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vkt1hAvYVsUyno8D8iDgxTSsOUUjpwSQKBphD19PUFvPwrD6WsKRsqfB8UWNclcVtaM4hkGTL1522UaCI+dw5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4438
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enable the Intel IOMMU driver in the rock-dbg_defconfig. This enables
testing of DMA mappings on systems with an Intel IOMMU.

Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 arch/x86/configs/rock-dbg_defconfig | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/x86/configs/rock-dbg_defconfig b/arch/x86/configs/rock-dbg_defconfig
index 54688993d6e2..9f7d93307754 100644
--- a/arch/x86/configs/rock-dbg_defconfig
+++ b/arch/x86/configs/rock-dbg_defconfig
@@ -296,6 +296,7 @@ CONFIG_ARCH_SUSPEND_POSSIBLE=y
 CONFIG_ARCH_WANT_GENERAL_HUGETLB=y
 CONFIG_ZONE_DMA32=y
 CONFIG_AUDIT_ARCH=y
+CONFIG_HAVE_INTEL_TXT=y
 CONFIG_X86_64_SMP=y
 CONFIG_ARCH_SUPPORTS_UPROBES=y
 CONFIG_FIX_EARLYCON_MEM=y
@@ -3112,6 +3113,7 @@ CONFIG_DRM_AMD_DC_DCN=y
 # end of Display Engine Configuration
 
 CONFIG_HSA_AMD=y
+CONFIG_HSA_AMD_SVM=y
 # CONFIG_DRM_NOUVEAU is not set
 # CONFIG_DRM_I915 is not set
 # CONFIG_DRM_VGEM is not set
@@ -3770,6 +3772,7 @@ CONFIG_MAILBOX=y
 CONFIG_PCC=y
 # CONFIG_ALTERA_MBOX is not set
 CONFIG_IOMMU_IOVA=y
+CONFIG_IOASID=y
 CONFIG_IOMMU_API=y
 CONFIG_IOMMU_SUPPORT=y
 
@@ -3783,7 +3786,12 @@ CONFIG_IOMMU_SUPPORT=y
 CONFIG_IOMMU_DMA=y
 CONFIG_AMD_IOMMU=y
 CONFIG_AMD_IOMMU_V2=m
-# CONFIG_INTEL_IOMMU is not set
+CONFIG_DMAR_TABLE=y
+CONFIG_INTEL_IOMMU=y
+# CONFIG_INTEL_IOMMU_SVM is not set
+CONFIG_INTEL_IOMMU_DEFAULT_ON=y
+CONFIG_INTEL_IOMMU_FLOPPY_WA=y
+# CONFIG_INTEL_IOMMU_SCALABLE_MODE_DEFAULT_ON is not set
 # CONFIG_IRQ_REMAP is not set
 
 #
@@ -4184,6 +4192,7 @@ CONFIG_SECURITY_NETWORK=y
 CONFIG_PAGE_TABLE_ISOLATION=y
 # CONFIG_SECURITY_NETWORK_XFRM is not set
 # CONFIG_SECURITY_PATH is not set
+# CONFIG_INTEL_TXT is not set
 CONFIG_LSM_MMAP_MIN_ADDR=65536
 CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=y
 # CONFIG_HARDENED_USERCOPY is not set
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
