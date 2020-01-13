Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E42501394F2
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2020 16:37:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E05FE6E0CC;
	Mon, 13 Jan 2020 15:37:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2055.outbound.protection.outlook.com [40.107.93.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FDE16E0CC
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2020 15:37:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mPfJuw+6t86Bzi1DvvmRS53MY7UWKZD2Fl1TtqJ9LKDLjWR4oS1aj1Gr5j7Ws3PFWuHPb0orFLnLghgiSPEHg5muSLPkj8jclx27MB4gBzwDlh7dj2+g2d5IsrebuzdoO43XzmgUSxbUZSbtCf1zyA5e7kwl7Wzobd+OPXI72quur2rC4USsl4VBluLJmRl8DAu1yHbQTMf2jUOvxYLhkNGcH0rQPTBN9fzhpfhiRAHBptTTUZfYfcK3Zoh2vRgMd6NTbQr3gpFsqOYnDItWW2RVUgrnVXl5WNXlZ2JnKfkgNelCK1027G3jWkfNsc9pPpm/4yTUez6TFVy0J4IE3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3DlwxaZntIBVeSDvPKOD4vQ85k2mF4dXbT5Z/W5r0bA=;
 b=XxzR2AJUyYmekCPq+UeP8964aHwwkrXtUK717bJagr5PcQn7KrDjZBDn0qH5mZ3ZMO84nDV+uOtkdlEMNwTJi3v4fKOuoiqIw3qfeZKzP8hnHaIqnZuxmkOJ7MeCR+82JDiozksmPfFZcuPV4ecxfu4JItg9QVpC0/19hZn+LO1+DbA55Yba4rt7ITEAEKXswyxatcAlq/Q+Vo49a50si0yMSoohiLmaZdpCT48ELRPvQsnqyuwERuKkOslmHufRhxMsFEVn7Bn0juBXv04IqNgC7U8IZuNqf2LU+76Eo4+2iqF9tycFH7qt+AqzHZZC2i7PEY7QENF3mrIrF4qoSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3DlwxaZntIBVeSDvPKOD4vQ85k2mF4dXbT5Z/W5r0bA=;
 b=ns5+RP/uMpMArt9jZ20SH0ISwxA9/Hgtpl3dnrJxiZ+2McgZ6W7lioaMyNrCi32UvMTX3VQc1GAypcglJtHvZujGMXzxkjgMQJ1bcAq8CMJxToz/4qpego9/ZfK6x+3Px5UWQ3Ssg47OQiBPrRgVYA9B5LBrNulyxGeqACwkLTY=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Qiang.Yu@amd.com; 
Received: from SN6PR12MB2702.namprd12.prod.outlook.com (52.135.101.144) by
 SN6PR12MB2847.namprd12.prod.outlook.com (52.135.106.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.9; Mon, 13 Jan 2020 15:37:39 +0000
Received: from SN6PR12MB2702.namprd12.prod.outlook.com
 ([fe80::d46f:d4ae:d96d:ef70]) by SN6PR12MB2702.namprd12.prod.outlook.com
 ([fe80::d46f:d4ae:d96d:ef70%5]) with mapi id 15.20.2623.015; Mon, 13 Jan 2020
 15:37:39 +0000
From: Qiang Yu <qiang.yu@amd.com>
To: linux-mm@kvack.org, cgroups@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH RFC 2/3] mm: memcontrol: record driver memory statistics
Date: Mon, 13 Jan 2020 23:35:42 +0800
Message-Id: <20200113153543.24957-3-qiang.yu@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200113153543.24957-1-qiang.yu@amd.com>
References: <20200113153543.24957-1-qiang.yu@amd.com>
X-ClientProxiedBy: SG2PR0302CA0024.apcprd03.prod.outlook.com
 (2603:1096:3:2::34) To SN6PR12MB2702.namprd12.prod.outlook.com
 (2603:10b6:805:6c::16)
MIME-Version: 1.0
Received: from localhost.localdomain (221.239.222.115) by
 SG2PR0302CA0024.apcprd03.prod.outlook.com (2603:1096:3:2::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.10 via Frontend Transport; Mon, 13 Jan 2020 15:37:34 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [221.239.222.115]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d35fa7ee-415d-4b2c-5505-08d7983e855b
X-MS-TrafficTypeDiagnostic: SN6PR12MB2847:|SN6PR12MB2847:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB284778A3C60EECF053E817BC8F350@SN6PR12MB2847.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:110;
X-Forefront-PRVS: 028166BF91
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(346002)(136003)(366004)(396003)(199004)(189003)(26005)(6506007)(956004)(44832011)(2906002)(316002)(2616005)(16526019)(69590400006)(186003)(52116002)(6666004)(54906003)(8936002)(8676002)(81166006)(5660300002)(81156014)(478600001)(4326008)(86362001)(1076003)(6486002)(66946007)(66556008)(66476007)(6512007)(36756003)(21314003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR12MB2847;
 H:SN6PR12MB2702.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZtO30H7pxzqoU3477dOsXPxcsNy98wP42F5oUBhXn37lyhVDMmf/LRaoiHj0/KbJteMkwFIhzSdv+L8Ff+N4cliG4dIq4wMfuv5UO7+IBzJ6acfmwusoIMumN9zBPZnMaOJJ8UQYPYNIahV0ajSqGGzHUGF+SHDScJMf2Ueh7v05g8o+rOl8j0u8t1MPHC+s7SJddEnHP4pwWDnWidA+uOonIGCu3vc/RrYPaMY574tTHsCfVMw2XNGGo3aumQ5KNGEwtqoL4lXJCk3Zi2+Q3iYRhnb72CZW4nN47tp5lhAO9Azq4EN9F3Gvv4FGzTgj3krtB2W//4x4hycOtvbblwsc+UjjfneKo8IDK4j1zAiAWWnkc9VLORQ30izrMTSQg9fzxKIJQ2sTzuEXJUYStm4/xJgf4aWIMuhBV3a2ToeL5jjlBsQ4CYBCJJZ/D4foYhvwnWHCjSypQnf2DJJZBmfx6f8z7pAqH5MO3qrIZcZs/AH6VomjlgRzZoAaYIIDCRcZcQNhPrchgfReGNiLEQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d35fa7ee-415d-4b2c-5505-08d7983e855b
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2020 15:37:39.4011 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ai6k1zpHvT6K8PLg4mKhPv2IpPCcmWoQB4X4CxtMDjD446Qpf8/5baaxa3H5b+31
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2847
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
Cc: David Airlie <airlied@linux.ie>, Kenny Ho <kenny.ho@amd.com>,
 Michal Hocko <mhocko@kernel.org>, Qiang Yu <qiang.yu@amd.com>,
 Huang Rui <ray.huang@amd.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Tejun Heo <tj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Qiang Yu <qiang.yu@amd.com>
---
 include/linux/memcontrol.h | 1 +
 mm/memcontrol.c            | 9 +++++++++
 2 files changed, 10 insertions(+)

diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
index d76977943265..6518b4b5ee07 100644
--- a/include/linux/memcontrol.h
+++ b/include/linux/memcontrol.h
@@ -36,6 +36,7 @@ enum memcg_stat_item {
 	MEMCG_SOCK,
 	/* XXX: why are these zone and not node counters? */
 	MEMCG_KERNEL_STACK_KB,
+	MEMCG_DRV,
 	MEMCG_NR_STAT,
 };
 
diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 28595c276e6b..cdd3f3401598 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -1413,6 +1413,9 @@ static char *memory_stat_format(struct mem_cgroup *memcg)
 	seq_buf_printf(&s, "sock %llu\n",
 		       (u64)memcg_page_state(memcg, MEMCG_SOCK) *
 		       PAGE_SIZE);
+	seq_buf_printf(&s, "driver %llu\n",
+		       (u64)memcg_page_state(memcg, MEMCG_DRV) *
+		       PAGE_SIZE);
 
 	seq_buf_printf(&s, "shmem %llu\n",
 		       (u64)memcg_page_state(memcg, NR_SHMEM) *
@@ -6947,6 +6950,9 @@ EXPORT_SYMBOL(mem_cgroup_driver_get_from_current);
 int mem_cgroup_charge_drvmem(struct mem_cgroup *memcg, gfp_t gfp,
 			     unsigned long nr_pages)
 {
+	if (cgroup_subsys_on_dfl(memory_cgrp_subsys))
+		mod_memcg_state(memcg, MEMCG_DRV, nr_pages);
+
 	return try_charge(memcg, gfp, nr_pages);
 }
 EXPORT_SYMBOL(mem_cgroup_charge_drvmem);
@@ -6958,6 +6964,9 @@ EXPORT_SYMBOL(mem_cgroup_charge_drvmem);
  */
 void mem_cgroup_uncharge_drvmem(struct mem_cgroup *memcg, unsigned long nr_pages)
 {
+	if (cgroup_subsys_on_dfl(memory_cgrp_subsys))
+		mod_memcg_state(memcg, MEMCG_DRV, -nr_pages);
+
 	refill_stock(memcg, nr_pages);
 }
 EXPORT_SYMBOL(mem_cgroup_uncharge_drvmem);
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
