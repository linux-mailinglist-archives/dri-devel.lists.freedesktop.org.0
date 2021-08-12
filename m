Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF943E9E92
	for <lists+dri-devel@lfdr.de>; Thu, 12 Aug 2021 08:31:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEEE96E25B;
	Thu, 12 Aug 2021 06:31:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2056.outbound.protection.outlook.com [40.107.223.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AB5B6E28B;
 Thu, 12 Aug 2021 06:31:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ng+Ub96dILi7iPxAkNOInoZx/zlUezSgGcLQQXzJhFR43WoFtFlEYTW6sQKhCelxF8IY+4dYVAxp8x/AMBV3sfA8cyk1r0XoGFIKzzVsWcwO6E9vmVH+niZeW9/6M98IArt32uMmehjpU9FBRi6cZ0pb4t5+6jt3J3mc1PFrcEiXPm8+8tCfXO7JSMt0EQcn5HxKP4gerZCiUCUutHUFpv7E3FV+CO2jDHwZxehrj19QahYGwwql82fwxZEuETEAFwJl7GRCl1/Emrkue59iybLo+xfJodvsFMBvdNhdm4/N7nILItu9ShNsyWm1/VvZtagXIfVgFtHgNlI1XbCXbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4HzlIn9ZrDqltW27OtHNPNd/ATCxAv/hvwq+QIQbS/g=;
 b=UUKtgItwkSOAt5UxaVSfCsWvjGhNKvqzUFSloBU7UcOhRSb69K5MFXJn5i0zr7O9w+03j0snRkuwEcHrPpsVGtLPd+gFeVkDxYegbv8p9xDXgPoyRWyhgCezlD9QpF+5pEXHHXAhr7/8Sxn8IqTBDa+3Xty58ypONy53DVq1gO0Ct06v0lmOLt8MwQQxXLKwp7NPoEOw/FCAQ6K9OSMJszag3XiJzoCCVY0lIFoI5Sr8DJnEBCrjftqriiL6miKrxiSzWmAcDLBCNBDB/ojW1KiBg+kM/EXEIbNZiXslQaZx+41lauQKB3eWJ1/qoivkIIN/7QjFzs44WSrC8a7o5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4HzlIn9ZrDqltW27OtHNPNd/ATCxAv/hvwq+QIQbS/g=;
 b=AmijVqNzuAq4V544/zfCvk6mvb8x0c02WHG8rVtfl/d3JmlT7zR+ydtYdPCmhNkIhZ6nIJyiFAXo7R7Lk0D6ZpJ2dvcuf2vq1YPdt9+fRhvFEJirAjkb9fj90knZfRR3HKGqahOxl/JNOzPR6xxMUpqqAlRDg0Yfy7lV9g+bLUk=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SN1PR12MB2448.namprd12.prod.outlook.com (2603:10b6:802:28::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25; Thu, 12 Aug
 2021 06:31:23 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::e828:5445:a5aa:94cb]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::e828:5445:a5aa:94cb%5]) with mapi id 15.20.4415.016; Thu, 12 Aug 2021
 06:31:22 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 jgg@nvidia.com, jglisse@redhat.com
Subject: [PATCH v5 05/13] drm/amdkfd: generic type as sys mem on migration to
 ram
Date: Thu, 12 Aug 2021 01:30:52 -0500
Message-Id: <20210812063100.31997-6-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210812063100.31997-1-alex.sierra@amd.com>
References: <20210812063100.31997-1-alex.sierra@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7PR18CA0026.namprd18.prod.outlook.com
 (2603:10b6:806:f3::18) To SA0PR12MB4430.namprd12.prod.outlook.com
 (2603:10b6:806:70::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from alex-MS-7B09.amd.com (165.204.78.1) by
 SN7PR18CA0026.namprd18.prod.outlook.com (2603:10b6:806:f3::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.17 via Frontend Transport; Thu, 12 Aug 2021 06:31:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 835d9c59-eaa3-456c-3b82-08d95d5acd95
X-MS-TrafficTypeDiagnostic: SN1PR12MB2448:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN1PR12MB2448584B5E1F2B4451EB992AFDF99@SN1PR12MB2448.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hOKtCWePxla9lAQExklMN51ZmQxH2X3zLLMuJLQmOei1H2xQKqtV8IVu5/s5sZlreEczstPB2ZE+yCYoLt/nym7DPigy0rQg80AHKwjG/JF9ctfujojzlKadUQlgpTzBe652MfUTyZfyLIE4AzNzEBfVXflhQCgZYKvgc7yfVrrAAvJtJxa9P0XpY8+v3eV64C3vpGoPX+UUvK0eE5OYdFUhy0CHIyRP9dMzdvuUCAMUMxav8SJGAcoTnlQHJgFFYVG1yKgOYUqg/H3tb3SlWGibhUZNaMf2Ykjt+gIAn2XgDsBBhAKRfm8MRvWe6pWdKoaNUwEjwrUnJ3XeXdxux7iOuusPifziFdJuV5HPSbRarNQja6msF/X1ysEiXOJrBGTdSnokjdP4jEzCt9b90D7cRaiZUJo/ZaJuFOadiRSTen3ScoANNo8PDnRTR6H+jdZHDgnCL4ppfHvgjMWD5dgXz9sCnXvt9nOFBwUfzvdrwtDWiBjoxFdZ43R2l0prT8cJxrxAIb2lVtEHc/IrVQcIvjToh9uKcO2Hy2tLIe0QEYr61Hxfq93dxocCVjaMZgL0MSpUIxkyaQ6PLhxLI2PgtSe401jsOXwQ9PHdHHtTEYcsq/c20v//vZPy3ar+X3o5h5LGQJcvt88uu5baukFg5XEIBETWi0tTkdMO1tzKH6c1Y76wtEVzzJ/OwTsXHnc11ms8YOLF2oxL8hb4XrTwR/awTGq3VXARXFKmJT8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(396003)(366004)(136003)(346002)(38350700002)(6666004)(186003)(66556008)(66946007)(2616005)(478600001)(83380400001)(38100700002)(8676002)(26005)(44832011)(2906002)(66476007)(956004)(52116002)(7416002)(1076003)(4326008)(86362001)(36756003)(6486002)(8936002)(5660300002)(316002)(7696005)(41533002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?w96IwJWmGatH4P0nwS74kPNyyAiXZpsrrXauSsE3+cBx1fGiRKRQwBHkGZUi?=
 =?us-ascii?Q?FruHu3VXkeWicDUhp+chSl4XeOMV9lEM0xIlq17Voa7+ZMggFFcuCUaCmWE/?=
 =?us-ascii?Q?vmtX6zgs5Gsd7o3RA+v6kcllNeM0iplWXtHSFVXJScMTLxT3WtP1l9dPaER0?=
 =?us-ascii?Q?2yX2UWwbnZ8as48bsj9DcoWi2p86mGKkQpXB5u3t9kh/efoVEZuqktCOo8mE?=
 =?us-ascii?Q?2gtmVX6GASzPOwSAkH+jZXzRcHL4919wQ2WU9tUxbKtHELe0UpirYRT2lk6a?=
 =?us-ascii?Q?Gn+eDPiDhODo0ekVpHM0tL8ssMbGZ3R26/iTGwextDozFM2krgr6K/ixj2GO?=
 =?us-ascii?Q?F0gqgne7bQQrL5q0OvUFFIoPWgw2VpKxLIrglvetDg7N9UeYnupVjMIavYPy?=
 =?us-ascii?Q?zN5NChBsm+dnZkPJXU9lwbfUryB27FCEQxSohdVdopJcPTtP8Gc4eGluEjam?=
 =?us-ascii?Q?wJZhBo6xHRCs6Wp/7QdSBKK18HBmUTE7dvTeIR3YswNZdDlzNlNL22S+wY8L?=
 =?us-ascii?Q?gNIxehDu9wTW7ge9aVneoZoVt2cBj5Ai9Mvskwscj2QPNrqELxUgBOyb2fk2?=
 =?us-ascii?Q?xg1X8wLSuMtAugGuC502nGYz7ePINy/JKyazn6R4QBc+Y6dux9rPodSldoum?=
 =?us-ascii?Q?ntjK21Vre7S+5jcorTSsRE19W5s8AFEi3MaAcF/ZtYhJ6d8SYYyRJuvxUC8L?=
 =?us-ascii?Q?EpdEop3S8Ad4T9vJxuNTRzYvQ4or0eBhNs/Noju/soKrFnQSnFzaRC9wZmRF?=
 =?us-ascii?Q?0zTUIO0sQlgAvzFgQiWRfr0lDrK6OPg/AwVYf4t9hkUeJ1BqdyRFbCZpUbdd?=
 =?us-ascii?Q?YvMzp8UwYLn4vN0XcvETtaSEoCY2EziNbJHUffie+51GbEeXv7UoxSgtyd6r?=
 =?us-ascii?Q?x6C7czkmlMYjF3UMeifKv4j/u4LkEL6+7NDpakNtGZcN2sLcRZTu0sYnS372?=
 =?us-ascii?Q?rxSnWB8IloUouwgaqOKfyOrZWhjoL3KK7yfhq6+psuKuOtR6282Ejhxny93j?=
 =?us-ascii?Q?dZdT9AsvzfL+U3zVMB0EkClm2aUg5p5nyYlEh+FLRgTgdkCUIKtWOpw391Dp?=
 =?us-ascii?Q?HDaWII+NJXGbW0+s0LwJbvaKA7+mnmXvU5yqHpQMGr+YlEFpGQ+MPQ+CYKKa?=
 =?us-ascii?Q?DaMkjrscnbixShoy26jGIlU07aBFbfdgKVQSSYFjvYK52Y0KzXAZo4lpktdo?=
 =?us-ascii?Q?D6wMMxgvoL59xJL4TqkpzHfEifvX/1DD3mjVPbzRGJ9ZEtMYAjcKMUdJrmhv?=
 =?us-ascii?Q?B5xlOb5OddtN/3MoABI0sO6RsJwYuYfFE52T6LVFg0JOJJDvPF+4EHTuomAG?=
 =?us-ascii?Q?gULVGjiWhbvElBO6M6FV6eg2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 835d9c59-eaa3-456c-3b82-08d95d5acd95
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2021 06:31:22.8434 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8TR/LSpBYx6zo05V2Tx0WzdcOMDGW+eLD38U5a3zcIwOjzmNnD022samzl/uYG+r5bkxoCe5e+6pMpaDXCtP4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2448
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Generic device type memory on VRAM to RAM migration,
has similar access as System RAM from the CPU. This flag sets
the source from the sender. Which in Generic type case,
should be set as SYSTEM.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index 3e9315354ce4..c511932e56d7 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -664,9 +664,12 @@ svm_migrate_vma_to_ram(struct amdgpu_device *adev, struct svm_range *prange,
 	migrate.vma = vma;
 	migrate.start = start;
 	migrate.end = end;
-	migrate.flags = MIGRATE_VMA_SELECT_DEVICE_PRIVATE;
 	migrate.pgmap_owner = SVM_ADEV_PGMAP_OWNER(adev);
 
+	if (adev->gmc.xgmi.connected_to_cpu)
+		migrate.flags = MIGRATE_VMA_SELECT_SYSTEM;
+	else
+		migrate.flags = MIGRATE_VMA_SELECT_DEVICE_PRIVATE;
 	size = 2 * sizeof(*migrate.src) + sizeof(uint64_t) + sizeof(dma_addr_t);
 	size *= npages;
 	buf = kvmalloc(size, GFP_KERNEL | __GFP_ZERO);
-- 
2.32.0

