Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4576A541CC
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 05:44:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C74810E8EF;
	Thu,  6 Mar 2025 04:44:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Q15HZSu+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2087.outbound.protection.outlook.com [40.107.236.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2F5410E8EF;
 Thu,  6 Mar 2025 04:44:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EG3ypliJBiQbLNujWGgTUCxoNJM9qeUcZiOgWEYUT4JMVJfRq9nU/MpoYvQSGt7lZIH8YxQ4TjqTw6FZOh4dXL/t10SHwQU32uc1UHLppVcxzt7f2T9L5FtKA2rFm/C10qp1/oHcKdj3Jci0WBlBUBDGc9BPP1SYtlFNj89i9C3hEPNKYs0z7slXfBUMf3rNRYa7Cu6441kqXxgWALBGz/7GIWlsEpbkaKNNvPR53d9cG48v0XVf56/Hd25eNAtBc5lmjkBbju2IGU/m25uchDbD1vudpm3lwr3M/+1OwhVbc3ApsVnwEgzdXFCcws5z7IIxbDN1+2UbTH/hXR64hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KoyYN3GoNVkNu1Ru3ABRM1//mr6MezEx7gX8XVXgTBA=;
 b=gW5Xv8UnvMVA/oeI6S5UNcUu5ZvzyK1sJl1haYAmNdLw4kJt8HLTa/9HG2fzCrwLpn01VKLYqoo8DayfQPpLKFW0kVapW9ikhl19glMXW/nCLhRzv6GgH8KWEb7nMlq8J/sYTgReASoArNIoAEUHjjDxgQmGLHmXE7wp3QNtNgtrah+9eytUmPuiEH4tggI+AdeYZGov/l2A1Lx0zU07tKXlynkyXjHpVtr7ZXpc2xFZhu1ZBicw4iKz30Kixc3KHIzTr1PrqWR6nqIYFIrdTI/Q5Mxc47HRr1DSQxGuCUYWQTH+htuOLpa3/cITMufcv8u5WBndNJNP9CZUkT/KiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KoyYN3GoNVkNu1Ru3ABRM1//mr6MezEx7gX8XVXgTBA=;
 b=Q15HZSu+urGFPd1un5aV9yIUMhAWe8NDPjPIAWIuFYYBCBySBRgQA0trrVeuONQc9nWTtM03yCsMy/eiy82J/hhkeVqvdzid1v/dB5q7QOhP4P/dWfELfQm9+BCt2xZyVvXG9RwH4Xw5uPvcQBwHk2dZmo537jHmqt7ad1oeMsiTvTQh6+aBZpGFWg9bXvycY9cv6kx6s4l6vlXzxVd+j9myQOuoHM4xs/J0wRaHtF2Hj1J5FypdDnGic0i6RnpQ3o6rbrmf7HpbMCzlAOlh6V04bpdPllJ004Y1tD+peRUCMhV+f+wBH96TjPTCyuTA6a1GSKWJ3m21EZbAUP58pw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SA1PR12MB7272.namprd12.prod.outlook.com (2603:10b6:806:2b6::7)
 by SJ0PR12MB5674.namprd12.prod.outlook.com (2603:10b6:a03:42c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Thu, 6 Mar
 2025 04:44:04 +0000
Received: from SA1PR12MB7272.namprd12.prod.outlook.com
 ([fe80::a970:b87e:819a:1868]) by SA1PR12MB7272.namprd12.prod.outlook.com
 ([fe80::a970:b87e:819a:1868%7]) with mapi id 15.20.8489.028; Thu, 6 Mar 2025
 04:44:04 +0000
From: Balbir Singh <balbirs@nvidia.com>
To: linux-mm@kvack.org,
	akpm@linux-foundation.org
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Balbir Singh <balbirs@nvidia.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Shuah Khan <shuah@kernel.org>, David Hildenbrand <david@redhat.com>,
 Barry Song <baohua@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Matthew Wilcox <willy@infradead.org>,
 Peter Xu <peterx@redhat.com>, Zi Yan <ziy@nvidia.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, Jane Chu <jane.chu@oracle.com>,
 Alistair Popple <apopple@nvidia.com>, Donet Tom <donettom@linux.ibm.com>
Subject: [RFC 09/11] lib/test_hmm: add test case for split pages
Date: Thu,  6 Mar 2025 15:42:37 +1100
Message-ID: <20250306044239.3874247-10-balbirs@nvidia.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250306044239.3874247-1-balbirs@nvidia.com>
References: <20250306044239.3874247-1-balbirs@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0171.namprd05.prod.outlook.com
 (2603:10b6:a03:339::26) To SA1PR12MB7272.namprd12.prod.outlook.com
 (2603:10b6:806:2b6::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR12MB7272:EE_|SJ0PR12MB5674:EE_
X-MS-Office365-Filtering-Correlation-Id: bf05efa0-32af-421d-a3af-08dd5c698608
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4jxZCB1cfhfmZwMdnrDuMRwPGz3CpLyRkfXPI861OqF5j9mMGYaMWmGpcKS+?=
 =?us-ascii?Q?yh/OebPqE6DkJs8qrYMtFEs1TxdIJ7w3rXt9bxHqJk8nISpkFd3f7uKJ1Ps3?=
 =?us-ascii?Q?vNeNUXr8T/kTp3G5XzCCPe0ednUmc30D5GoCK4b93m+S8M/XQFiX5GVdw1F3?=
 =?us-ascii?Q?vhguiXt4YbzYYhP0JqK3qDXTzqBOgHhcbARbHZ0vqvzatQ5tWDh0UzIEf1Oj?=
 =?us-ascii?Q?68jF5PI/c5FOANLHLssWusEZmetEOjSaMirUNG8rQkVin85Z0mr1jkXh5T+E?=
 =?us-ascii?Q?b+sJR6vqgytWEp/p/590lTcpkrRb9AbzxXCaRiORzOQSmLcoZnVgeVuvL6RT?=
 =?us-ascii?Q?rWlHxPRg5wgFLX51cc8hkryoM7NhU+s1zIAeNDLtDE8raUwAQdFJ80KN6+JG?=
 =?us-ascii?Q?JchWGx4JEEe2CMdCl2E1jxSaHVbRmqKHY4eWefeD7tYWX4BtYCJeIc4FvGGP?=
 =?us-ascii?Q?AhIngb8kXYVUBXN8N/PpWCccwH1qws+RYhlUJfxom7buS4r7yeLYM8fwzgWO?=
 =?us-ascii?Q?PL8EEyOarzHAEXP9T82bqlVvBfAWTGOAgm6Qeyex7HtgKMk1AHsB04ik8ZPY?=
 =?us-ascii?Q?8aWqjkT7xN6y6jtsEitEWTTaoyUKNma89uWyFARBA3tcin6yjzeE4nI2OgQg?=
 =?us-ascii?Q?1BKtuYl0Lz9KewWO0e/2RafAiFZhtSTRg1VJNBj82MVRCChHlD3h6BvyKYtP?=
 =?us-ascii?Q?E0u90wIeJdmmeSI6cNfMTrnpg7jTMPlbDZXBhuG/X7emsUVAAbNVnywoGQsP?=
 =?us-ascii?Q?73IoM4sFxIVg+ChuR5kc2YIsnbKdCIzYUOEVR89Bpne1MTzwGt50cW/FzXUC?=
 =?us-ascii?Q?QE//HimDREdvDZVV43dwzMEI5GCPZ0P/8QbJGt+HPEhyqQPuMOtV3KsHcLhx?=
 =?us-ascii?Q?Di4Cmq7jcGk/zOOqPRBQPbnYhPplXWXcu3T5GexNsZODyT+jcJJS9APNEFYw?=
 =?us-ascii?Q?zd2Hkm9loPcjemCUrFookGlRiHnvMXJiJX4JMEUFqUfv7+cEQS7PIvBOOMkz?=
 =?us-ascii?Q?JYYHHc7Y/4Hhy5vAO1LkICt0qlWNMekAXQMRQCQdPlk1NEyDXSPuQSu38+wi?=
 =?us-ascii?Q?2n9C8bqP3LQ4N9gySHY8UminZS5gZHH2tWZmSFTnnl4QXTInqOwx46jOqAWt?=
 =?us-ascii?Q?jyXBbKsJai5kNKS7dg67XFmQ5flmWqZAHR5T4SywYP0KivuUklkdiObCa3qq?=
 =?us-ascii?Q?HGCAoVFmxLcqTdi7qxP8hyrPq7p2WV0nNRu8tkYt9jxv5Ry0piorj5/41wsp?=
 =?us-ascii?Q?csB+OHQI/mzLtsiGgflLn2539V/3PUjTb89bZLWyxKza3roVm75pPrJC/24H?=
 =?us-ascii?Q?NK/2HjM3SzlpnLGH4aRJE5wcNLnbbEGP7RmdNH/h8TU50hqfAp3M73HGZOgy?=
 =?us-ascii?Q?CZ+OdrlFDhNACNBUS+kUb/t8RCCu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB7272.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7R28iSciVvV6na+k+hX7ZsYDBMLS64w5Dqawh5of7yaQiO8KMVRYsJI4RqZd?=
 =?us-ascii?Q?PhCBwVJ+vjkPCUNhj2ReFLFff2yp332mNzzkibPlBfpoUXoaG5VODLnaMBaS?=
 =?us-ascii?Q?h+ZFyQU4AgCwRVsFWtKSUsinrJPUyNGe00PKUizrc2187pWwAWZQ5xudsBCN?=
 =?us-ascii?Q?j+v7omyemNOQBBHwXLgayVM9onBELoIxUvHwr1jvTSkHJsof99ic8OoCLPAW?=
 =?us-ascii?Q?NKOG5WN+JinClojbSVCCpY7LKn1x9OuZEXEng6MzZNe+YCqzsf2+UXUgJM+D?=
 =?us-ascii?Q?XMmwmGvrCOCntUVCKIrzUmS6cI69SzwdweMRdh/7LVx5mkL4MJxXWarq+z+l?=
 =?us-ascii?Q?6rHNxVdTm5E/BXxPHPW/9zBxFS/cUthCDIhIUO4nQb7QrqB/FgAj23j79bZX?=
 =?us-ascii?Q?PkYzYHIArminwZc+hH/2uitw6nSw0w3+L3ayalGDaFnCkiBzboUKCnzaTPpk?=
 =?us-ascii?Q?PATPWov//gMr/G7jdzaZUqRnwJWWpfLl+Rjix1vm8L3o6TBp1g5KUgBsq2j8?=
 =?us-ascii?Q?6eHYzGq/mTTLPr/lHtiPnQb2R5lAmZQQ9wiqZrHPQ+qxn7v2r1hLKbSGgtcT?=
 =?us-ascii?Q?60pkwt7W3xaRbMH4Y9DCdhxbe9ArB/BMPdnKXfjXLhmxk495GEUH98Ew3DDh?=
 =?us-ascii?Q?ovyvqWPvEGdO/zflMeLuUwrAvZFFm1BsTRWNkKr5V+JLOfXnmPwsaBFVDQxG?=
 =?us-ascii?Q?oj7V0eyxUGePCsf8eObu7+NFQY9zc0gNEMXZoLD9PdAF7NMatHlO0wUlGajx?=
 =?us-ascii?Q?W1+lq0F7lEa01/wCnE2XouPDYLzUOj4Om3c+S0KALPVZK5gptNS1Sp/x347s?=
 =?us-ascii?Q?cmoOM7qY1RTVPEvKLig+9ZVKWdngS44n9t9Ja37Vgzqyjg7H4kYZq7OG/nGt?=
 =?us-ascii?Q?9lJbl6PcdRpaeBTJgHRN52cn8kSa2TPOmSxvDPPxJCKgXpkvPkG5I1GEFzsT?=
 =?us-ascii?Q?RMJWfjvdaf42XZ04FkqPU7NBMFk54wfqhSYIpOCk2zDB8x/93tfmQHC3gy4v?=
 =?us-ascii?Q?q/1GD3sEoCnAmQZSaDenxHjK5FZnaspjpbuB7D84LknxXtaFJh2177JpGBvO?=
 =?us-ascii?Q?JUyAf/erd+6wgiPbrk2v3+0j2AG9Sh67egn64c1DeFauMQ85azCkaFBZXb4h?=
 =?us-ascii?Q?S2NvowRa2iZZW8/fAiCnKkKhS7BlpvlWinkc+7vp6h9RPvgoyRIV2xval2yI?=
 =?us-ascii?Q?2Ny5plqf0hO1WaZmRptCQlGNX3M+aJatCF9nI4NbtzgYBvZroOQ6PU4Gb1F/?=
 =?us-ascii?Q?xcjfQQOg1PEb+eur+w+9Yra8twSnr6enUY8IljYpOXRtaKUSmUkkL/JYt2kp?=
 =?us-ascii?Q?iO1DDv9mkJKrcRBON1wbQWDRiSJrUR7XeJ0hBOIzWVLphZOIQYPG0qOdymTU?=
 =?us-ascii?Q?WmN0ZgAY/SfEHlINuoAufHtUPjRzzc4V2B91xooSLdEG8Ffrp2VGo/5VlKuH?=
 =?us-ascii?Q?RmZcHU/H76qio5LX03jJ21R+mC+Xh7+1Vf5kfaP+HmxLK2B0R1y7l0hUe9kL?=
 =?us-ascii?Q?BqauRKb7kdQQipR+US4YgZBuyJOQlia3Gmgv3y/nT9NBmco5FOtVbof9AcGR?=
 =?us-ascii?Q?pElgzFWcfJXKHVYnWHwpOwil1V0r/6ackmgZmz/K?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf05efa0-32af-421d-a3af-08dd5c698608
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB7272.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 04:44:04.8872 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8/YhPl/uuJcgu8SfDYzRURnp93k/LcxpUlpSlJMI6VfDW1dkX6diP3YA8a8ZvJAQSSYhWIFMGXWZueOIPQTOxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5674
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

Add a new flag HMM_DMIRROR_FLAG_FAIL_ALLOC to emulate
failure of allocating a large page. This tests the code paths
involving split migration.

Signed-off-by: Balbir Singh <balbirs@nvidia.com>
---
 lib/test_hmm.c      | 12 +++++++++++-
 lib/test_hmm_uapi.h |  3 +++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 18b6a7b061d7..36209184c430 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -92,6 +92,7 @@ struct dmirror {
 	struct xarray			pt;
 	struct mmu_interval_notifier	notifier;
 	struct mutex			mutex;
+	__u64			flags;
 };
 
 /*
@@ -699,7 +700,12 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
 		     page_to_pfn(spage)))
 			goto next;
 
-		dpage = dmirror_devmem_alloc_page(dmirror, is_large);
+		if (dmirror->flags & HMM_DMIRROR_FLAG_FAIL_ALLOC) {
+			dmirror->flags &= ~HMM_DMIRROR_FLAG_FAIL_ALLOC;
+			dpage = NULL;
+		} else
+			dpage = dmirror_devmem_alloc_page(dmirror, is_large);
+
 		if (!dpage) {
 			struct folio *folio;
 			unsigned long i;
@@ -1504,6 +1510,10 @@ static long dmirror_fops_unlocked_ioctl(struct file *filp,
 		dmirror_device_remove_chunks(dmirror->mdevice);
 		ret = 0;
 		break;
+	case HMM_DMIRROR_FLAGS:
+		dmirror->flags = cmd.npages;
+		ret = 0;
+		break;
 
 	default:
 		return -EINVAL;
diff --git a/lib/test_hmm_uapi.h b/lib/test_hmm_uapi.h
index 8c818a2cf4f6..f94c6d457338 100644
--- a/lib/test_hmm_uapi.h
+++ b/lib/test_hmm_uapi.h
@@ -37,6 +37,9 @@ struct hmm_dmirror_cmd {
 #define HMM_DMIRROR_EXCLUSIVE		_IOWR('H', 0x05, struct hmm_dmirror_cmd)
 #define HMM_DMIRROR_CHECK_EXCLUSIVE	_IOWR('H', 0x06, struct hmm_dmirror_cmd)
 #define HMM_DMIRROR_RELEASE		_IOWR('H', 0x07, struct hmm_dmirror_cmd)
+#define HMM_DMIRROR_FLAGS		_IOWR('H', 0x08, struct hmm_dmirror_cmd)
+
+#define HMM_DMIRROR_FLAG_FAIL_ALLOC	(1ULL << 0)
 
 /*
  * Values returned in hmm_dmirror_cmd.ptr for HMM_DMIRROR_SNAPSHOT.
-- 
2.48.1

