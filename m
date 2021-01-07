Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0D42EC89A
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 04:03:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0238B6E417;
	Thu,  7 Jan 2021 03:02:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2056.outbound.protection.outlook.com [40.107.94.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BDE66E425;
 Thu,  7 Jan 2021 03:02:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dRaUid0CAyNzkmQmX3vXWv5edzhWN6oieNXRgg29N823bSmbvQyhv8EIkMH2iSJPLjcslcxNys5Xdl67y/E75lMT3Hquzg/JOHdYEoTZ0i2AJX267c03PzC3/r/TEehKBTWl9ISZLi9Y7rwSASaCMcrnSLs6ablO1qGIWuAIrMArtVNZmiBLk0xG8Kp3c26jhimi6CPv2/lT9WEVdY48nq8Slym2khJq88klnOHi+3VVYFZTV7LYozsaHeZZq/0gU+kRiLzst7KUDyDQsLfun6n24lk4ZVNlJQrSsZIoAAc8guLA1DImt0NHHAj0uDXKw4kgYSKyC3WIJzb+uGuIPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1uM8d1EyC3bKrdl/0k/6aM/WfUoIgX4+U8DwjagjBbY=;
 b=S2U0gtZKupnyrvo+MAhmDkgRILS/cT7sgH8y9Pmg9IMcBm3XDwv62dXWZ8OwvpRaNJV/LWldSTHPeTmPi6UW1QkdILaKONC72FNwA4gzTPwipzXll00K0ec7zCa4PcFvX0+Y6IHlBPXaXfARmDFh6dMACB9vk08A4xi9UCKO6yn8LsSdiq2gQhUMa9xkM0xS+QJcGlGA/wKm9+CskidC6s5LR7I8x4Pejce7jvhGwqaLkEHbJYE4ih0wd5+ZwtDzOIoqMUgfPZx1QwxaRFWZr1FT4kCGPJELbyzSMwHsZw2HZ+VjL+evuUxm9LaFllT8yq2Xizs18Sqd/3CloG2jPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1uM8d1EyC3bKrdl/0k/6aM/WfUoIgX4+U8DwjagjBbY=;
 b=CVydvg9fLq9wUs8Ewvq1UTis2saV6xU0XVl3IqnOEihUQ7q8s4jHo/9yCzsefv9Hghm3abkHs75a72rV7lcIhZ4a6WxdT6I8PcRdMisqWVeeqeccGUQ1VAzwC7FXznNY4sfe4gFlU1NM3w6vLDzkBFqX2E+crR8FV7enL5EBQSk=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB3999.namprd12.prod.outlook.com (2603:10b6:208:158::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.24; Thu, 7 Jan
 2021 03:02:57 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::9425:559:83c0:991b]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::9425:559:83c0:991b%9]) with mapi id 15.20.3742.006; Thu, 7 Jan 2021
 03:02:57 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 15/35] drm/amdkfd: add xnack enabled flag to kfd_process
Date: Wed,  6 Jan 2021 22:01:07 -0500
Message-Id: <20210107030127.20393-16-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210107030127.20393-1-Felix.Kuehling@amd.com>
References: <20210107030127.20393-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0048.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::17) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0048.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Thu, 7 Jan 2021 03:02:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: fb3be138-30c7-41bf-5ef6-08d8b2b8bc38
X-MS-TrafficTypeDiagnostic: MN2PR12MB3999:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB399942BA903815B152B634B992AF0@MN2PR12MB3999.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2hyJ0QgnQIlcBJQbcwZtyjYpQSAQIZB1bedKPgLT/ZXnAX4sySzdwz5DLc5JlrrJvXu6CEqGJQ5IsSqszzNbmjQzbGzBh8FPD4KhfDOEaopRgijs1j97v8sJqNJBqpbE2Rpk66frDAIKnQWxfbt7rwg9BEqEwdYUOPdqXgZ6ubKAqeDSiHp9XdihWJUzzIossUGuikaHzlEJrzEt3NH/vEaBHvnYs+brpbwgunLhoyIK4E78znEEM858C4Z5yAI5HWkoaED536Fg8WNvjSYk+jygMs0Op7k5PEgPan5hFG48etPxQSHvidaVE3Q6dEKdyBpzb0XN3Z7tz5R6O+t4wpJDnTGE47b2GjbgaSbqRGUpXtK1B2ed7pbM1/hZuT3Hk4LVMycYZMnS2WRBpICFjQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(376002)(366004)(136003)(39860400002)(316002)(6666004)(7696005)(2616005)(956004)(8936002)(4326008)(66476007)(8676002)(478600001)(5660300002)(26005)(52116002)(1076003)(86362001)(16526019)(66946007)(450100002)(186003)(6486002)(36756003)(83380400001)(2906002)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?H+NSK+xRc8dZvSDcc4EP6L1uJxFFgQX6ie1SjgegpxGPEi9bFwbkRkEomtcZ?=
 =?us-ascii?Q?l39qyf/pawcBFEKckURealTMaKdmO8kTCcDoQ+qRR6YufFmDEp2DHbaz1awZ?=
 =?us-ascii?Q?8Ck31nLMiEcoBwRix4xUKEs6Hg92VldAogCEHecPHd9njuZCCOTxC0xo8zF2?=
 =?us-ascii?Q?rcOGd2LBubDsEGmnZ/zUvhj7qtGSUgxDXu3snTS2dqv1mhNiiBsK1mX8peLK?=
 =?us-ascii?Q?A6aX2MpeUfKlad7ABQ2mryqC4UjOZXxD5gZrpBf4uvlzSdvWNzpwiDEo29To?=
 =?us-ascii?Q?ephutNhXbugWJz4vHq9iDsXs/WZnmFgAHuQo0c+D0d1czmf1jvcZQsFSvVsA?=
 =?us-ascii?Q?l8U+HwYK5i0rEcwzx3InYBIC8ULyi/9x45DmjrbflkB8SpJEd7V6tqhAwECc?=
 =?us-ascii?Q?dxz5LLAYLl26R0DuopCoTXdU2MDTaga4paCTVRGbpV1KJ+mdMY1WezIaniTn?=
 =?us-ascii?Q?J9weAdwCIqBWKmnBTdTjI8YvwR5ZLeRppTKWJAGc194yKkcoOAzkcZ97O0TG?=
 =?us-ascii?Q?eQb5gaOn4+QdemxgrrqyrpReFzj5mruN8gv9mnmt3ulTvJyz3Cpbi5RrAMCz?=
 =?us-ascii?Q?5ePqA+PuoQpVH/C7bK4ZdGoWe+YglqL8dgRei3lYPOPu9SmvFXPzarVoWor6?=
 =?us-ascii?Q?/Ct0ZrG0PO3S5HkEiP6dKCFTcFXSvkp9cwpb68QntcOZlmpQlI4JTvOY/lTy?=
 =?us-ascii?Q?qyNcKqzLj7k3O+cDIwaoHTZp8/EsUFIkFBqX4s8AilMSzSk2rYx/09SpYpaT?=
 =?us-ascii?Q?J6RpAutFyvnnKCBXEKAEx9vT+Yj802ZIT+vNcWqSQCpwnZhOt6j6bXh6y26m?=
 =?us-ascii?Q?XbVZhADEVnHcfku9+/5JXekWtmFKwsw8seiiRLSoLkU0Q5ET3YJnWGLwpQXz?=
 =?us-ascii?Q?3/f7pRtxrmrozjr3E+L7rSv91tk8Iawhi7vpRWeg5IrmyGVeT4UQBA9Q4M15?=
 =?us-ascii?Q?JG81rxS7YKKIiJ3PSk3i4qpxVK7VcvFqxCnq1c8K6VJPDjIqq+E/FUFv1d6b?=
 =?us-ascii?Q?pq6p?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2021 03:02:57.0121 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: fb3be138-30c7-41bf-5ef6-08d8b2b8bc38
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dqmtuSa+crAih6DLQ3Rf4b/m9fT+Gad+Z0Wix+fjAsjQdDw6w/plLmUph2DgBKVmZsoFRhm7gETQvV8matq2zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3999
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
Cc: alex.sierra@amd.com, philip.yang@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alex Sierra <alex.sierra@amd.com>

This flag is useful at cpu invalidation page table
decision. Between select queue eviction or page fault.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h    |  4 +++
 drivers/gpu/drm/amd/amdkfd/kfd_process.c | 36 ++++++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index f1e95773e19b..7a4b4b6dcf32 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -821,6 +821,8 @@ struct kfd_process {
 
 	/* shared virtual memory registered by this process */
 	struct svm_range_list svms;
+
+	bool xnack_enabled;
 };
 
 #define KFD_PROCESS_TABLE_SIZE 5 /* bits: 32 entries */
@@ -874,6 +876,8 @@ struct kfd_process_device *kfd_get_process_device_data(struct kfd_dev *dev,
 struct kfd_process_device *kfd_create_process_device_data(struct kfd_dev *dev,
 							struct kfd_process *p);
 
+bool kfd_process_xnack_supported(struct kfd_process *p);
+
 int kfd_reserved_mem_mmap(struct kfd_dev *dev, struct kfd_process *process,
 			  struct vm_area_struct *vma);
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index 0f31538b2a91..f7a50a364d78 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -1157,6 +1157,39 @@ static int kfd_process_device_init_cwsr_dgpu(struct kfd_process_device *pdd)
 	return 0;
 }
 
+bool kfd_process_xnack_supported(struct kfd_process *p)
+{
+	int i;
+
+	/* On most GFXv9 GPUs, the retry mode in the SQ must match the
+	 * boot time retry setting. Mixing processes with different
+	 * XNACK/retry settings can hang the GPU.
+	 *
+	 * Different GPUs can have different noretry settings depending
+	 * on HW bugs or limitations. We need to find at least one
+	 * XNACK mode for this process that's compatible with all GPUs.
+	 * Fortunately GPUs with retry enabled (noretry=0) can run code
+	 * built for XNACK-off. On GFXv9 it may perform slower.
+	 *
+	 * Therefore applications built for XNACK-off can always be
+	 * supported and will be our fallback if any GPU does not
+	 * support retry.
+	 */
+	for (i = 0; i < p->n_pdds; i++) {
+		struct kfd_dev *dev = p->pdds[i]->dev;
+
+		/* Only consider GFXv9 and higher GPUs. Older GPUs don't
+		 * support the SVM APIs and don't need to be considered
+		 * for the XNACK mode selection.
+		 */
+		if (dev->device_info->asic_family >= CHIP_VEGA10 &&
+		    dev->noretry)
+			return false;
+	}
+
+	return true;
+}
+
 /*
  * On return the kfd_process is fully operational and will be freed when the
  * mm is released
@@ -1194,6 +1227,9 @@ static struct kfd_process *create_process(const struct task_struct *thread)
 	if (err != 0)
 		goto err_init_apertures;
 
+	/* Check XNACK support after PDDs are created in kfd_init_apertures */
+	process->xnack_enabled = kfd_process_xnack_supported(process);
+
 	err = svm_range_list_init(process);
 	if (err)
 		goto err_init_svm_range_list;
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
