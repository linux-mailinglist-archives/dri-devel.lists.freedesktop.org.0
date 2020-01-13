Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D481394F0
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2020 16:37:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE1676E0E3;
	Mon, 13 Jan 2020 15:37:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2044.outbound.protection.outlook.com [40.107.92.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32C616E0E3
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2020 15:37:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KWcYNqvGZruKZINchv1H4HJ/DuyQdUo44xVZZ9Xo6Bsy1aPG6AXf5JJJQH9cNt3YJAZ772rspxHXAjmockOiR1j16OAZ4hR3aMjYz4eL22uV1eF2KGWKw8stnyvuV8VR+DKYpThW7FnAPjZ3rJkiO1iVwFI68g4EkRhPW5xJOwGbfo1emvTppg2pHCL2F3gM73THNRgV/cuJ9fOXXAHMOKDQfm/l5NFvgAW+tfw6R/slna+dVfn0Lc6g1X6MGy90VLWoyHHrMFvbJXooh0x1DHmZ+RD1aXvij7ZXnRaYvXObjm4gBmQOYw6mdmK71nnk7e3zvy5qxj9gVp06b/ruuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0IuJUdjJ4NjgBqPCIK/ycAWJdGIDmA7IOHw8Lf6aQKM=;
 b=FgORS+SesZjbdUhQNcfWNExm3hkmgY/1R0dPI+aG3h1yqEG1+spDw4fRyuSZFRwsKrA1zkEeCB4oMKQVg6dahx6zsAU2o++N7xUed/y+0CypJ/ZxXLmHWtKWL1IHJApqebPkqFGQo4PaQKxditw+h5odYZFNtHxTRmOdGQUdJyCOLwSO80COQtpkYBFKdzchjRw8zVjji6LPrsZVSKWTPAAMj5M2G8aazlC3EJfvTDlhqsftO9lGGsR8X9i+qNzFP/ooH91+gqVW4xcv7fj0Ed/N7gBA7OJSZ/Fd0bythYTVLPCO7m6Lx2rJ+K+mUm14CQFtAOXZZF2igdXVRwqH/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0IuJUdjJ4NjgBqPCIK/ycAWJdGIDmA7IOHw8Lf6aQKM=;
 b=t2Gjvvf02iviLhJtrDTj/JboCl4gjuAtcuHLHH316g0nMYriq/JScqBwLmwx5OL66zs+0qQiSdCXqmdbAyda0hboKXTZf/3CXLtEgrolSDaTeJIVj7wPMdL7hmNO40NUnEQTP+x2zeE+T0mckGhU1E1f2D52VjCsxrbHu0zH9m4=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Qiang.Yu@amd.com; 
Received: from SN6PR12MB2702.namprd12.prod.outlook.com (52.135.101.144) by
 SN6PR12MB2685.namprd12.prod.outlook.com (52.135.99.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.9; Mon, 13 Jan 2020 15:37:29 +0000
Received: from SN6PR12MB2702.namprd12.prod.outlook.com
 ([fe80::d46f:d4ae:d96d:ef70]) by SN6PR12MB2702.namprd12.prod.outlook.com
 ([fe80::d46f:d4ae:d96d:ef70%5]) with mapi id 15.20.2623.015; Mon, 13 Jan 2020
 15:37:29 +0000
From: Qiang Yu <qiang.yu@amd.com>
To: linux-mm@kvack.org, cgroups@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH RFC 1/3] mm: memcontrol: add mem_cgroup_(un)charge_drvmem
Date: Mon, 13 Jan 2020 23:35:41 +0800
Message-Id: <20200113153543.24957-2-qiang.yu@amd.com>
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
 15.20.2644.10 via Frontend Transport; Mon, 13 Jan 2020 15:37:24 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [221.239.222.115]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 313786df-25c7-49d5-3357-08d7983e7f6a
X-MS-TrafficTypeDiagnostic: SN6PR12MB2685:|SN6PR12MB2685:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB26856C46926D93AB029C668C8F350@SN6PR12MB2685.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1247;
X-Forefront-PRVS: 028166BF91
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(366004)(39860400002)(346002)(376002)(199004)(189003)(86362001)(4326008)(478600001)(1076003)(81156014)(5660300002)(81166006)(8936002)(8676002)(36756003)(6512007)(6486002)(66946007)(66476007)(66556008)(2906002)(956004)(26005)(6506007)(44832011)(6666004)(54906003)(316002)(186003)(52116002)(16526019)(69590400006)(2616005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR12MB2685;
 H:SN6PR12MB2702.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hb61W9rXIqCx3gxq2ZEtRgaKvJQXtOFt0uOvPg4eLsMx3aZlXsoTiv8vY0RayKUuuFrJuq8eflYRnaerdoQ9P7GwARqJ5XxG6WQyfng1mqCr7/93ZNpFtF+8NvXpAT5PCZk/hcOI07xoeBwcRYHOFPR+fWxKqJKVZLsiwXrmdFPIDjo0WJoVAOpDL8mINq9JJJyux1Ys/AqNErH4tdcDSumitECCJabIFOMzyVMav6X8qQj319iI08beng88gSBNaejDaBoVC+cPuKHgJ9tsZdqbSsH3CsNq2+BXMsUiXJ0f+wv3ERNf1jVsgqoQIPHbRgXgjqHGtN9Ygrp9qpgH66/Birv05Lstc8Vhjz9ZfiAfZn/B8aZDBgCfwWuN0nlHkO0L/g9/V+/SBAOreg89d6R8k7Kjiv9PMZQhgPsOitybRmGkeI7e1Tf7el83wALmeRuQqz8aqjtb/iNz1FiUNlX+XiWFVwDl3VPk0BCwSjwaTZlh0Eyhbm4XAMo+v7eQ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 313786df-25c7-49d5-3357-08d7983e7f6a
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2020 15:37:29.2153 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QWEXHPWyaY5lr8RGO6y/jFQNIKGDS53SMVZ7BNnfr/G42pQQTwGYZ58zC/f9ORru
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2685
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

This is for driver which will allocate memory for both user application
and kernel device driver usage. For example, GPU driver will allocate
some GFP_USER pages and mapped to user to fill commands and data like
texture and vertex, then let GPU command processor "eat" these memory.
These buffers can be huge (offen several MB and may get to hundred
or even thousand MB).

Signed-off-by: Qiang Yu <qiang.yu@amd.com>
---
 include/linux/memcontrol.h | 21 ++++++++++++++++
 mm/memcontrol.c            | 49 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 70 insertions(+)

diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
index ae703ea3ef48..d76977943265 100644
--- a/include/linux/memcontrol.h
+++ b/include/linux/memcontrol.h
@@ -1363,6 +1363,27 @@ static inline void memcg_set_shrinker_bit(struct mem_cgroup *memcg,
 }
 #endif
 
+#ifdef CONFIG_MEMCG
+struct mem_cgroup *mem_cgroup_driver_get_from_current(void);
+int mem_cgroup_charge_drvmem(struct mem_cgroup *memcg, gfp_t gfp,
+			     unsigned long nr_pages);
+void mem_cgroup_uncharge_drvmem(struct mem_cgroup *memcg, unsigned long nr_pages);
+#else
+static inline struct mem_cgroup *mem_cgroup_get_from_current(void)
+{
+	return NULL;
+}
+
+static inline int mem_cgroup_charge_drvmem(struct mem_cgroup *memcg, gfp_t gfp,
+					   unsigned long nr_pages)
+{
+	return 0;
+}
+
+static inline void mem_cgroup_uncharge_drvmem(struct mem_cgroup *memcg,
+					      unsigned long nr_pages) { }
+#endif
+
 struct kmem_cache *memcg_kmem_get_cache(struct kmem_cache *cachep);
 void memcg_kmem_put_cache(struct kmem_cache *cachep);
 
diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 37592dd7ae32..28595c276e6b 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -6913,6 +6913,55 @@ void mem_cgroup_uncharge_skmem(struct mem_cgroup *memcg, unsigned int nr_pages)
 	refill_stock(memcg, nr_pages);
 }
 
+/**
+ * mem_cgroup_driver_get_from_current - get memcg from current task for driver
+ *
+ * Return memcg from current task, NULL otherwise.
+ */
+struct mem_cgroup *mem_cgroup_driver_get_from_current(void)
+{
+	struct mem_cgroup *memcg, *ret = NULL;
+
+	if (mem_cgroup_disabled())
+		return NULL;
+
+	rcu_read_lock();
+	memcg = mem_cgroup_from_task(current);
+	if (memcg && memcg != root_mem_cgroup &&
+	    css_tryget_online(&memcg->css))
+		ret = memcg;
+	rcu_read_unlock();
+
+	return ret;
+}
+EXPORT_SYMBOL(mem_cgroup_driver_get_from_current);
+
+/**
+ * mem_cgroup_charge_drvmem - charge a batch of pages for driver
+ * @memcg: memcg to charge
+ * @gfp: gfp flags for charge
+ * @nr_pages: number of pages to charge
+ *
+ * Return %true if success, %false otherwise.
+ */
+int mem_cgroup_charge_drvmem(struct mem_cgroup *memcg, gfp_t gfp,
+			     unsigned long nr_pages)
+{
+	return try_charge(memcg, gfp, nr_pages);
+}
+EXPORT_SYMBOL(mem_cgroup_charge_drvmem);
+
+/**
+ * mem_cgroup_uncharge_drvmem - uncharge a batch of pages for driver
+ * @memcg: memcg to uncharge
+ * @nr_pages: number of pages to uncharge
+ */
+void mem_cgroup_uncharge_drvmem(struct mem_cgroup *memcg, unsigned long nr_pages)
+{
+	refill_stock(memcg, nr_pages);
+}
+EXPORT_SYMBOL(mem_cgroup_uncharge_drvmem);
+
 static int __init cgroup_memory(char *s)
 {
 	char *token;
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
