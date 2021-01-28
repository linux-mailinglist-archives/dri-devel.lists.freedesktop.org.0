Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A03306E4A
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 08:13:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F5216E056;
	Thu, 28 Jan 2021 07:13:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750085.outbound.protection.outlook.com [40.107.75.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 623006E056;
 Thu, 28 Jan 2021 07:13:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hm7h99mbuwq5Bna9IOlKxgHzLwMSoJy7bYR/hLNCRbjSgQdTrMqXMPV6j5br61KaUHyF8GgFiEcNyMAGaLQMpjuQ9hbilFhxjmdlf34z6DvK/VFFm/owzf73DQkJewi612N0b8H/tJyDO3/0LLl7zwb0ZLicSIkmMMNgS0zQQdGKi4SlAF6PxmLCwq4kRi9EUdOFonSlJIcAVAsLmo1p6KDx+lMA8EvUKZH7oPJ+vsoJyD0sEMl2T7dc4qbvEUVq1GCjU6A0yUDEKRpiOHuHaVGnX0/wH2uxyloGB5tJ8VN1hLVCy39DwAZt9Izg/E+efVGPPGSr5PLIjXkjkekTqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=opEqL04Lz7S2KaPyadY2SRKffhLvRbExcfDJvZchvTM=;
 b=kwgsQhRITdHcMMceNdyMC02mwe93/mdKGSe8B3vkYGJiMifpj4/lqoTZl9FxgNEmMPBiAYjdIMO9sXwjGFpgB+ZLOLJcMJOaXuNCrUacvikAcI5enYg0D8bTRnv5Ro7apSlwj1c5Oec2cRKvxaoXo2Js3RusX1bA714wIsFPmbPlx7LxPPpwwsKjoPLasoy+ynWwEPKzma6mxzo48KFkpFBi8wpjWaWawXV75vX1NQgEQ2kowk9QC6UxfhRjYQFOO4lH6WHlTUfKZe65FW5dZPyMviw6kHcQ4DIsSOk2By+a7Po1bgVKWPIRBq4vjtrx+gPaoO7HJbVmw1nhiEgimA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=opEqL04Lz7S2KaPyadY2SRKffhLvRbExcfDJvZchvTM=;
 b=1kN+x+LZ2fcVr27YRGRhiC6ctNWRagdzzoIEKmOapCqw1cKIOgW/2aHu0X8d93Fu7PZ0YsO7pD+ZcabX+42Usk9PoQ9gCeg/Phx+yx0lqdXYukeVqkiKhR73gpC1ojvyY/tkoRuDgZiKd7th9UdeLl7X3/lqk6P3GLhK9ZAZ5pc=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3022.namprd12.prod.outlook.com (2603:10b6:208:ce::32)
 by MN2PR12MB3280.namprd12.prod.outlook.com (2603:10b6:208:ad::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11; Thu, 28 Jan
 2021 07:13:48 +0000
Received: from MN2PR12MB3022.namprd12.prod.outlook.com
 ([fe80::709e:b0ae:fbde:fcc6]) by MN2PR12MB3022.namprd12.prod.outlook.com
 ([fe80::709e:b0ae:fbde:fcc6%7]) with mapi id 15.20.3784.019; Thu, 28 Jan 2021
 07:13:48 +0000
From: Kevin Wang <kevin1.wang@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [RFC PATCH 0/3] add ttm trace event support
Date: Thu, 28 Jan 2021 15:13:19 +0800
Message-Id: <20210128071322.24313-1-kevin1.wang@amd.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [58.247.170.245]
X-ClientProxiedBy: HKAPR04CA0010.apcprd04.prod.outlook.com
 (2603:1096:203:d0::20) To MN2PR12MB3022.namprd12.prod.outlook.com
 (2603:10b6:208:ce::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from MZ01-CE0.amd.com (58.247.170.245) by
 HKAPR04CA0010.apcprd04.prod.outlook.com (2603:1096:203:d0::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.17 via Frontend Transport; Thu, 28 Jan 2021 07:13:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f2a51fb6-e582-428c-0354-08d8c35c41c0
X-MS-TrafficTypeDiagnostic: MN2PR12MB3280:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB328029C00B40F1CDCEC928C9A2BA9@MN2PR12MB3280.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tBC9kq1ZS39ckliD/mTPKuVTWWenL2ew5mO9PGsFK7o7mvLTChhjvR1LfoB4NkPgQJL6b7yE/doF67hRQ6i45NcZWApNOJvVwIP4EgrMHVwtRhYbnyqsLxmKUuTxV+8IsJnzO6N/3Pm07aks1c3yXhOloVeEgWEk+t7Trpm/jT4v+vjmPDA5pC/eUw0om78MH7FI/1Wf0zMGStu62fqPNRP5T/ORPHcjntuptRmYbLtwUg18ql3vO45J6bja7EIM9Lz2p9Nlj6EHNsicN81RZ3kHxvg/G1stqfwQvcSU4+/Zw69Z8GyBP2VOPh6a5lGY95/NsZ8QuURCeZ9tddtAeRiV9YG20/sLRMF2EY5B5wKHPgQi/QhvIakZHROzpDtdlaUdtJGvEOBfNYHYnUiJJuvFxbh1JGKGA5hp49WipBE1TyAsJeBep3Tx5nwj+ws1VEqh2T/jPG3yjcwIUDUmE8nKsnUaMjiUgn4N8K0/qnfA5v+o+YHebVg7fN3XrgiVCizWnXtcFwDeXGU+9yGQzA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3022.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(39860400002)(396003)(366004)(376002)(186003)(450100002)(66946007)(2616005)(66556008)(66476007)(6486002)(26005)(316002)(8676002)(5660300002)(36756003)(8936002)(83380400001)(4744005)(1076003)(16526019)(2906002)(86362001)(478600001)(7696005)(6666004)(956004)(52116002)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?q9epjhqtjryFMFtfBWVVau13w+Lkzocrb9GoGhoWJNWihpGQYxqXTu8374vG?=
 =?us-ascii?Q?lAQSXc8RXJDnj44I5PuFIVVYSG1oSs0cXx7JiyLYbPmjL5LpL/kme7sPoUw8?=
 =?us-ascii?Q?TqDzfVEshYTbdO9lzLT33KjyYlXXnBZtWT7sMpsCWkgFdaRJS561meBWLYV+?=
 =?us-ascii?Q?yXFIQVuBAqZKHYXTXbE4MtRpU6VeCfgrXEZjGfVgQC1ypGgfEQh7ZHfoDum3?=
 =?us-ascii?Q?suq4aqNs+FH7T9nvP7Ux/26QQIfnAY5IdTOCpe7NTjGiI3TDrC9mOCsvmFcB?=
 =?us-ascii?Q?lDEiUWa4wQO5Nj7EOGXLoXu6fZL9AJIdtUSkijj9ir0s/SHTml4RDvPtNz9r?=
 =?us-ascii?Q?ICnlOjn4Tl/X4ucrwtOEyMq2jlgV74K1FKPspmbPxx3kigkKUPAIesK8oPGM?=
 =?us-ascii?Q?8DSIr72S5YQ7GgV347iBEfFQt2QU9zhOiTB5GD9aUs2orNY2njzB2vzcmXcj?=
 =?us-ascii?Q?A46P0sJyE/DPoj9X0VGCcU9XIacKgY2x9un8rhFsrFjtSgryNr2M98PyUUd8?=
 =?us-ascii?Q?kFLvjZIaqzZuDatgf5i35Yg32tPKvjvnncSDYmdKqcanTFIq2Kl5Xin2kwI1?=
 =?us-ascii?Q?t/eKOb+OaxPhWnIj3aKJGVHnAiI1Gt4fDIauwH+/yXHGzfx7oyZQVivZaYcd?=
 =?us-ascii?Q?3uXys7TlZA2ysM0BwO+LHGZHHPVd+bdOzAN86eL8UCjizDl5GM7wBlZMNEyg?=
 =?us-ascii?Q?7NR35JIH/AKxr1oRQoXjCTCX2lfJhkMQIymeVWfs94/BF9RPuOsKUQdzLzTL?=
 =?us-ascii?Q?jbwMxE6wOX4NMhAF0SDTFVmn+bmbsXLaZlfsN5QgoZMGSn04QkSMf4FTgpbl?=
 =?us-ascii?Q?J1A7eGLx/Jk9jGzfiR9xAOy8BsFKeIBDiAEFEX97TeIemhhP3/075TV9jwkK?=
 =?us-ascii?Q?sx+OnG4e9HevmCSUKodkvpJtHWqW1kgBPlLKQeCKX3IkwPcBQaPgNZ83hzjK?=
 =?us-ascii?Q?BtL/HH0/fOC6ZJFE//BBU5+gpOPjLaxPwhPyvsBK1/iOCarK57C4GIxXGF6K?=
 =?us-ascii?Q?c9IJVg/KIHz5VBos3oJBqYKflJN/CVSCXHwWOkicK2yML5vSc4EChThL/xWa?=
 =?us-ascii?Q?lqJPzuud?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2a51fb6-e582-428c-0354-08d8c35c41c0
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3022.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2021 07:13:48.4283 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sIGPhUokbuPX98DN8mRiiyO0wcFguE/MmQS+WnsREL6b4ORv7eFJYlPkH0bW2/ub
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3280
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
Cc: ray.huang@amd.com, christian.koenig@amd.com,
 Kevin Wang <kevin1.wang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

the kernel ftrace can better help analyze the kernel running status.
add some trace events to support TTM.

add trace events list:

ttm:ttm_bo_add_mem_to_lru
ttm:ttm_bo_del_from_lru
ttm:ttm_bo_move_mem
ttm:ttm_bo_wait
ttm:ttm_bo_evict
ttm:ttm_bo_swapout
ttm:ttm_bo_device_init
ttm:ttm_bo_device_release
ttm:ttm_bo_init_reserved
ttm:ttm_bo_validate
ttm:ttm_bo_release
ttm:ttm_bo_mmap
ttm:ttm_bo_vm_fault
ttm:ttm_bo_vm_access
ttm:ttm_shrink
ttm:ttm_mem_global_reserve
ttm:ttm_mem_global_free

Kevin Wang (3):
  drm/ttm: add ttm bo trace event support
  drm/ttm: add ttm vm bo trace event support
  drm/ttm: add ttm mem trace event support

 drivers/gpu/drm/ttm/ttm_bo.c     |  23 ++
 drivers/gpu/drm/ttm/ttm_bo_vm.c  |  12 +-
 drivers/gpu/drm/ttm/ttm_memory.c |   7 +
 drivers/gpu/drm/ttm/ttm_module.c |   3 +
 drivers/gpu/drm/ttm/ttm_trace.h  | 469 +++++++++++++++++++++++++++++++
 5 files changed, 512 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/ttm/ttm_trace.h

-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
