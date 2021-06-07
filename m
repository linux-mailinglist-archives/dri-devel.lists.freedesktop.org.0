Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FCFE39E8A5
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 22:43:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE82C6EA11;
	Mon,  7 Jun 2021 20:42:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2089.outbound.protection.outlook.com [40.107.94.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E76086EA0B;
 Mon,  7 Jun 2021 20:42:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AeDSgs4d8xeR8oC2Pjwo4w3P8sDiR1dddJmpCNVdC+UEth+LkAfCbrOPEDwEJDYV8iFidqJtpfAoDifRlkZaWszpRqSw34cUFSDRdk8LIcx+XAngROZEPWq9ijv7lFhFbhi8fJZAMRByexvIqiF5F5iT/szpIC+/vOtEq0hQVVe7OgvGRfe1neUjN8cZbUkgZ3e48p6GPrIJ+AofXlYj/kGKiwIlySC9Q6fFOxtHMf4Lc7m84t/DDtLifFjjwTLQQ7wbmRIYQJDoN0Nz84zEQMAQdt0L4HpQQXj9lAl+hoLYOxky0HIm/YYTXZxnBVgKLhmFx9TW0nc/5hqLx2JpvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TPKPnrddVPbEN1uQT1iXLcCa/cH/uvZqBGSpkg+C9cA=;
 b=WyqQUR/0z3117Dfdu2vE8hNMHMcE0VKhMUkeq7wZ/wqsazKVu2KpiaNiPDHX6SxlyCP4zXWzR3l+Y9ZjOEVu38BMeCQfurdhPrrI4vOrLtKIppmZbWW9fVLQQg1RA60sKc/FfPr+fG0L4/7g/IxwIyvqGvg/bv571xnseG2XkJcVZWwTibmDV/9djfXRSIOU3lMk1hJ6XW4qdIJ8bT88g3N2MNra9qHp8v7ph7QemD7fYyoYzRmwbQBIJhxU+RGW1p5X61DjEUahul1LVx5IiPSruOSIZqE1rl2+Me83e2VyxSHZipbNkjNSipGdfBLep7gbLOND7Y69jU3H4LaClw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TPKPnrddVPbEN1uQT1iXLcCa/cH/uvZqBGSpkg+C9cA=;
 b=1pt/0hl3q1cMQJ39VrxJjcav3Ss2w/YkYDr2a1j8isNNlpRQrfZKUT0UY8SPEhYVAMCZ5pOCnGW9pG9PtEnY8FWuAm66OglQPIXfhXs77VfsUSlWatUePKlJaE6jwuwUcuqqKg/S9X7kSIKVs5TzXBZxivG4ZCq8G5fm/y+LH2Q=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SA0PR12MB4495.namprd12.prod.outlook.com (2603:10b6:806:70::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Mon, 7 Jun
 2021 20:42:43 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::5ce6:fed4:e00f:27e4]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::5ce6:fed4:e00f:27e4%5]) with mapi id 15.20.4195.030; Mon, 7 Jun 2021
 20:42:43 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com
Subject: [RFC PATCH v2 5/8] drm/amdkfd: generic type as sys mem on migration
 to ram
Date: Mon,  7 Jun 2021 15:42:23 -0500
Message-Id: <20210607204226.7743-6-alex.sierra@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210607204226.7743-1-alex.sierra@amd.com>
References: <20210607204226.7743-1-alex.sierra@amd.com>
Content-Type: text/plain
X-Originating-IP: [165.204.78.1]
X-ClientProxiedBy: SN4PR0601CA0018.namprd06.prod.outlook.com
 (2603:10b6:803:2f::28) To SA0PR12MB4430.namprd12.prod.outlook.com
 (2603:10b6:806:70::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from alex-MS-7B09.amd.com (165.204.78.1) by
 SN4PR0601CA0018.namprd06.prod.outlook.com (2603:10b6:803:2f::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22 via Frontend
 Transport; Mon, 7 Jun 2021 20:42:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f6059f52-52f3-43c1-7eb3-08d929f4cc69
X-MS-TrafficTypeDiagnostic: SA0PR12MB4495:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4495E60F2D234CFA403EA221FD389@SA0PR12MB4495.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 22FQzStFSuFaIEia+6+GDVqWwzPg0Ve6t6NJ6/fLVW2TQ6PtnRTuBkMgU6TCrM9kapimosJZjuiw9VJv6mYAFMEqq3F6Lq2teWAmHtqNGaABjO3NVpNdLRi6BNZMhvC6x3/en1J1Ioz/+meR9UDNIyKhuEi7ffez3TIsUVqYO73xOD8U/pSrMtUQYN/uo3nbn8t2steteV/UT1scQoayRoOqnxG1ic7CSs/GpaPLSjEFZfsHNq2tIpUl669I6HZocyZuA9jFu62TZe/GTILSf36pfqQIs5AuUjnzRADBi6ZILXbPExhMC0v84ss+ctF0V1xGALzfTn7680mAyPndT71MZ6WvsRG4+EyfkLEMUFYJ1FIZfUZDG7DjhmOHtwnr7ev3bskxVhjgZZwxMKx6V8T4SHi2IqP2WKyp2lCnDvvXVPEmjWfn6SW04MA6dDQ8GiqSHtT/Bv5W+wnEsqt6+lgg9zTaplNxsD00bp3p76SA4eQuytWfyhydwH4407FQ2MIlakH7RErps89CaIairCuUB/Z05VrUCHF/WyAybLm0hwRKvVmQhA4PTMJQpxxnde/OmLVDLFRqOZIlaC3Eo+JcncMSw7xB98IQlbmAx75siS1pUYtck7daFTaVAKzIbWTIPYiMAEaOviIdpMPesoSwC9Nc7xrciiIySgpT1OfWdL9GVYFBoSxDW2Ad5gAg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(366004)(39860400002)(396003)(956004)(2616005)(6666004)(38100700002)(316002)(26005)(5660300002)(1076003)(2906002)(6486002)(66556008)(66476007)(186003)(4326008)(16526019)(66946007)(44832011)(52116002)(7696005)(478600001)(83380400001)(36756003)(8676002)(38350700002)(86362001)(8936002)(41533002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?FDXbGk4mZOWcfXLHKwrYBvVBaNoLpGVVhepjYv+6WEAmy0dvwRfS/ijp4xyh?=
 =?us-ascii?Q?505hx4DX/3V72casCVW5AtD8U0nGhqAoWPS2DHHaqqcBYlbva6NSCnnYYLul?=
 =?us-ascii?Q?vyndLqpH7IomDOB6rXaw8FMC2NutJTWn9u2nyJZ/X+kuQ2cH/mLkP/eS/t9C?=
 =?us-ascii?Q?pDbQ9Ad3EszO0TavuoSzDB+pFVV3/d75PQRvDxbetuBVGuUJhyvIRSUDfheD?=
 =?us-ascii?Q?ATdDPgMqQ6n1ymfZ0CylxJNaZOcqdKSYMFlDj0Dv/tay0B7QMJn0I5KV93Jo?=
 =?us-ascii?Q?9CGtTcZq8ROueGkVzuM6pGmiXxk759SrhqzIerH5Pm+MxnN8zVxajnn/Cg1O?=
 =?us-ascii?Q?Vxi/qxFIx+/NrRUTMDVGm2ejtJB7ByrozvSUXbSQQVqaqT0879JB8Rc3Mfam?=
 =?us-ascii?Q?ZSsgC5R7oYUQFT1lEEovWTRoQBjzDi1XOyxz4EyjxYVULVCeuSL+16nAjIm9?=
 =?us-ascii?Q?WOQ3n4FYU2P9xRCRoYruxN0PAxCjfGw1LZgHX93vsgkE0NFuv50mo/iLF4B3?=
 =?us-ascii?Q?O+pjcy396MIlZ9WKEcTENmK0Yrotx29DknDI03n79BlbTeYYqhJaC7Jr249U?=
 =?us-ascii?Q?LkuXJycC3IiurRGSW0ABBdkqbCr/rJESE7Zc555NZ/qea1YAbczEqDqU4/a6?=
 =?us-ascii?Q?Ob6WmRIcnd//jorkvZPEcCXJm6H/HdvHqR7AXQOMCeqCfOuKcWRzIj9b5IMI?=
 =?us-ascii?Q?3FKlXw3+mbCfhYGylsINaPCd2xL6+E/mEMMBlhEIIx1i8lVE8RhEVR9zeBQP?=
 =?us-ascii?Q?GlfrPqJ9C4wk0XfrZo1KuBLWS8cqMMP9LQsGQVkJV/VfPQUFFMvx/N/Tw6Wt?=
 =?us-ascii?Q?OqzRsxzL/dOovpLYPSQ5yiOAG9H+xnK30/OEzE8+QLWgMpR5tDnu2o0w2hk3?=
 =?us-ascii?Q?LpMo/x7IWm2XrnAzYKwmPN/KmpVPRu3Upg8tQh+vPcLPiDNUX/rlgi/TX3q2?=
 =?us-ascii?Q?UCQhDHKJFMghArkos0KCFzmdh59VwyQhFxQPoe+SA5EPn3ICo3u4/uQOaaN8?=
 =?us-ascii?Q?4+9/4TumYsLj/3I3Tf1iRIY7BC7Blj+VZFQHPM1ZlIj85pRKozKd+HB71/AU?=
 =?us-ascii?Q?ieUublUK9dV4xURWOjNcm0DtdO4vZNwgtLnO2ofeq46uWKBKaC1heJOkgbly?=
 =?us-ascii?Q?lGr5rCUKM5Mabd+nBeSl9WDMECyrzU30+BDlx7OI3ZBflKB3QbQc3tim7c5r?=
 =?us-ascii?Q?bVjmqNtvcXWHJvzkrAc+q2h5d8Ha45NXtrFlxVI7ZO7tSl75fNRi5pl4jDLY?=
 =?us-ascii?Q?iP0wNxbWAHyRhPtAgpmhDqsQaI7UprD6uKDaik+JI4mAc2eWHJDLKSjrMBkT?=
 =?us-ascii?Q?EWgjIlrX0Hpmp/CCE736BUMT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6059f52-52f3-43c1-7eb3-08d929f4cc69
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2021 20:42:42.8925 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VceJZ8dd0nhAlTNr9mBR3Q7KIh60XHFZM41cNqcsMlVEJRphVOvdEhmZdHvO68/IQQHxbqMbyvToRCQgJC3wgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4495
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
Cc: jglisse@redhat.com, jgg@nvidia.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Generic device type memory on VRAM to RAM migration,
has similar access as System RAM from the CPU. This flag sets
the source from the sender. Which in Generic type case,
should be set as SYSTEM.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index f5939449a99f..7b41006c1164 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -653,8 +653,9 @@ svm_migrate_vma_to_ram(struct amdgpu_device *adev, struct svm_range *prange,
 	migrate.vma = vma;
 	migrate.start = start;
 	migrate.end = end;
-	migrate.flags = MIGRATE_VMA_SELECT_DEVICE_PRIVATE;
 	migrate.pgmap_owner = SVM_ADEV_PGMAP_OWNER(adev);
+	migrate.flags = adev->gmc.xgmi.connected_to_cpu ?
+			MIGRATE_VMA_SELECT_SYSTEM : MIGRATE_VMA_SELECT_DEVICE_PRIVATE;
 
 	size = 2 * sizeof(*migrate.src) + sizeof(uint64_t) + sizeof(dma_addr_t);
 	size *= npages;
-- 
2.17.1

