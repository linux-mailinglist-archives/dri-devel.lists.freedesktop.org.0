Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QNQaCOADlWlRKAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 01:12:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C47E5152190
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 01:12:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0328910E538;
	Wed, 18 Feb 2026 00:12:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="kjY0jpsb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012060.outbound.protection.outlook.com [52.101.48.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D98C610E160;
 Wed, 18 Feb 2026 00:12:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kKo/gL0QqaA9tfD5ujSH/0sUsZbrYgROU7Nmh/vhob6V+tHFkqK4ODB1gGAjp2ehRl/uhMNV2AnY5mKg5in6C9so2Dk2xbFOTcA6BCxNVs3MAz1eY0vlczKu4M9Mago2Da0paV8U3ASoW0AmJa4FpMKvAVqL5ukN01pDk/zIz/QdIg2hq6EVUYzEPTljbhQvNlwJM1MZTy0KGSB3mZuLh1ozC49Up6PShpFfklHoZFOxO/H0ADAbQcT1CiFYLiJ8TGQKN3EW/tJbZag251d2puP0ME1Zg4eYKOnczDv0XDxEW9DCREnh7YMoaRupG3jBmQ9Quh91nFDSHrfcQP/61A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fFj76gQ0v7juJRXHKHoytu2sGyFSggqBpwTc1CC6Nmg=;
 b=vm7oRLtTW9wCCTXtb3/VAJoETEJN40Y+WCldNawCk+8D9vnA9XSebWyX61s0bWAYIhvJ9fYA7/bVBttLfduDi2fak8ftCSq72bubK6btDKiRfWPMrpNcuotWrJJ4GIx4WSiQIn97WAiGlIow2QQHYYdPTIn9DcqsHENQvec4cr4XUDWdv9PSumhdjIiw83u+LfWggxziYwshudnXXiwrm5r1/2FleMXhuCsUeG64Y9NIIRBk/k/MIAodiQrKjVFog4p66fxlMbWZnZFbjYNAQDG245+b0H/Yes0NCE+K5vmUKQGKlLdfKvn3wlBosDMqwdP+P4C3useir632XBJGkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fFj76gQ0v7juJRXHKHoytu2sGyFSggqBpwTc1CC6Nmg=;
 b=kjY0jpsbPgIV5WJJZu5/u38ztGX+ODjwOftCR2BKDhdo7MUyBCBrL5MOoGlY0MPBNu4UTFFm+3/gzWV+Vl9r193W9VauNbzqJTbVONF6lls/JdLMvgUJNnEbHXrX7kIrIEnkvm+kP9LSp6xvmIK9/pUyeUSBWEl4GJkS5YYUJMnoPIl5XCJkEwPP+I4gLCZVV3LlT1luAyRIvCdCsYEf+qZOYqCp6WrktvmnM9m9FKGaXoy7lheyMmjljqm3VTzYq5U9M5zEgt0AI9N+QwVZ5TZ3pr2DOkOVUP9W7VJHUs4NpiZnFJGgg1pQOtGOqw5ZUO8IpZEgMFbP51TGnJ+aLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by IA0PR12MB8421.namprd12.prod.outlook.com (2603:10b6:208:40f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Wed, 18 Feb
 2026 00:12:00 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9611.013; Wed, 18 Feb 2026
 00:12:00 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: 
Cc: Christian Koenig <christian.koenig@amd.com>,
 Dongwon Kim <dongwon.kim@intel.com>, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, iommu@lists.linux.dev,
 Kevin Tian <kevin.tian@intel.com>, Leon Romanovsky <leonro@nvidia.com>,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
 Matthew Brost <matthew.brost@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: [PATCH RFC 25/26] iommufd/selftest: Check multi-phys DMA-buf scenarios
Date: Tue, 17 Feb 2026 20:11:56 -0400
Message-ID: <25-v1-b5cab63049c0+191af-dmabuf_map_type_jgg@nvidia.com>
In-Reply-To: <0-v1-b5cab63049c0+191af-dmabuf_map_type_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1P223CA0014.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:2c4::19) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|IA0PR12MB8421:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a3054e7-8e83-41be-bc23-08de6e825552
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GD+9r9P9UKw9EKI6E1V0tvT31hKxoIwXfAFvMOB30Ie9QIwmWOHUZZQsfo/D?=
 =?us-ascii?Q?PoQpsYVGIYnWqmAcs1yhsPJ9RjbnyjAn/QmH9vVIzwrjFtKS6mhdNfAHyHMI?=
 =?us-ascii?Q?YMleepda0VEY4X2N6NYBDNMXoIYtzFS5StNa89swW5CJ87C6JLNY0M70M0Vz?=
 =?us-ascii?Q?qFdMh+FTVP3d6TrhkRCSrYGX9t2jX2yOvgUmQSHlwi+cZCeRdo/ao2mtLSlx?=
 =?us-ascii?Q?K2nlRnJUh5DNSWpTB9t9zA1skChaG9Y8eiYDHz0DTOzwA0w6YmXUPse06/Qq?=
 =?us-ascii?Q?zcmvQsLHFtuilJ6YSxmMV0tiYvR5JwWNPiDDOOQhp/fRCxgArf6qaDxHJFWF?=
 =?us-ascii?Q?cLsMhzmUhYkS6TQvjEL/z8s/FLSgGYT1ePTgawILuuohOe1m5y533QGEmNJr?=
 =?us-ascii?Q?g300R+d6CsHub7mzIRxsyLaajgE/8sLIc8YIDBDzyfkGHFEHEKZGfpftjQ+A?=
 =?us-ascii?Q?W1ipXOd5pWfoBUppr4dAtEere30CcOvDoqyM2EltbbsKIGKf4zap+cOM3Jr9?=
 =?us-ascii?Q?gY3hqJLfF8tS7PfjwLL3u//dubs5MWnvWyiAnQs2EJwxcH5ZwzHVRakdyjDA?=
 =?us-ascii?Q?4fC38h6lxIJvjCwaJH4bFI/10eLLCBPWO9e8ycHR4sFH+ULLGIy/DC1RZOiv?=
 =?us-ascii?Q?TTtS/0j9zjTzHZujXTq8nt8eDSydULwU+1dzV4wr78WQPveK9N7GBvUqcLYX?=
 =?us-ascii?Q?48+dewZ6IQzeiQ3hnX6/Ivhu8bRnBB7nhqNPdAYlwG4IBVgBTLHv/yXdY5BX?=
 =?us-ascii?Q?maXywBZOjlJrtcdYtl07WZ9f7P1qA9EYXogef7GBV6xeP/qCC8IuyKTf5Ruo?=
 =?us-ascii?Q?L5S0p2f5g43bXBQK4PrpoQKOdNvxEbwy/ywxfv9UEo2MNiSTHEtL+su5dzlU?=
 =?us-ascii?Q?4Vehf45lNTQIUXBiYN0Xz0NslBgq3DJMCZCazsvVQU+FXSix5fi85hdeg/Vz?=
 =?us-ascii?Q?rZqGHe3C+KUuZgx13y1Vr8XweGRKnLj5WrXBXgi+2UemYR4o4KLBdU9bNFFK?=
 =?us-ascii?Q?ns98S8X3/fQx4OglLt2EL3V6jRvJkOYyDnD3tvl4a76+fUseGjuqPq5mYTvy?=
 =?us-ascii?Q?VxJHVo2l37iEv7CHrfOkz5vIE5YJqnUbi9rxz7wxp1s/2JPAtisvvKcXlSSl?=
 =?us-ascii?Q?BEeHloAFO7b+CWTaZwbJYZvz0CwkmyY2kF8qESsf0jCI1gqMmAfzpaJoc4tP?=
 =?us-ascii?Q?qC/QCILXZ+6Z3lhtVJPKSV9Zcf7a51weqsTSk0ws33eQ7kueGbtd9NAyyiRi?=
 =?us-ascii?Q?oxxUoBxBF2IqJcLJLY6fXcfiiD5dWcbuL5zC44gyrhj2tFKv91XbvcShwkCf?=
 =?us-ascii?Q?8pHHq6gefO7MGeXJ6ZXP5nahod56rr7l+YzVipUUZhnLduBnQ1QFRqH7pdo8?=
 =?us-ascii?Q?Vp2zG97ntSiBNLH8gsHq4nCyCbzTfE1nsZMuQtENxK0rG5EZ413Qz4ybgBy6?=
 =?us-ascii?Q?yUGKbHehQqwniujSft+EHgdpKiWrI2ZC36FzWLypWTfmeXy5pGv3LPDdPeI1?=
 =?us-ascii?Q?FVZjaGdLecD6czeQMCUDspVqORGzQhLzGjKv92v/QHUMe9TR2rwW0et1UspX?=
 =?us-ascii?Q?SR3Zba+BZAjvyZC3h4g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR12MB9620.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+bLYbPeQmSt0BPKmhg2oxEGIc7OgGhqzN0uCc531rLK9BrLZhNMl/cKFrd9N?=
 =?us-ascii?Q?NVWEvcbP4rmLq18mYi3Sci8/4guCPQGzS9fzyMbq3jhqtikKHDwS7bw0hdCu?=
 =?us-ascii?Q?VhOM0KZULtje5wDpMp4i6jYHKb43sYDS/cGPv/m6moQWzrWZ3yLHMvwRzy+k?=
 =?us-ascii?Q?L1pDwnKPskZaCVyaB1mwcihwqFSpL+VLIHb9e3UQQz2iWIWFEw6O+rpNnrC2?=
 =?us-ascii?Q?0ydgLjrT/zc8Ye5h8kWO9rIL7V8Gm6lbI+NICvf1abum+mkDfofcxyk7rJrr?=
 =?us-ascii?Q?1QM9+QjzYcUfHrpIUh14lQ+cgs9pAtrWkjVQThz5nS0wVY4Am+ik7rR9kMkn?=
 =?us-ascii?Q?aZ5QUSy5a5MGRIb5MiL7Kluh9IcbNMmgtAdDP6kApLgXyHkewFqmYFbiK0w4?=
 =?us-ascii?Q?myTCX1xOIwPrsc5CwtLFjKxl5DZFCDTVmkMCX5hM8T1gNfmgdtGtcLxXyXig?=
 =?us-ascii?Q?EwBB4l5aAK3Y/o7IzqMVbbTg5enOpRClOXp57r39fBhvAi0iTtXkQI10osd3?=
 =?us-ascii?Q?zC80ubee+Z+p7ObKc+lmNURV42XMkTBX3siPv2xesWyUa/f/LlSoSf3tDmKC?=
 =?us-ascii?Q?CYoTTG52MZTPMO9hUtrGWAh5LyJAYEMxbpuvP7mVImkdN72y3+rNapD2Jkd6?=
 =?us-ascii?Q?iIJrF07DidsATZQ17+gwJLpgHOfqWSjhYgLw9jOI4iqDvUgSLeDwAdqvx0rc?=
 =?us-ascii?Q?vNjelCWcHBBS7H5B7/Q0bbXforGrEvKyBw/DWI+QxV8vA8PJgfPsQl3w7ZqQ?=
 =?us-ascii?Q?QCLGi612+lcwqZYVwtCLbkHFhBk1Kx2m5K2CKbAAngqXexFRRJOBjv+PWtFf?=
 =?us-ascii?Q?bWX51mk82/FAoby2T+ek1I8Rn/kSNKGqDAOksdwZq+IRt16FCM20cMiTOo41?=
 =?us-ascii?Q?Nl9LqDTxnwSEm0owuILst0m8dp+ijwWQktOov8OwD0OH2S7KiYB8TpIpzbnv?=
 =?us-ascii?Q?5N8kGnANk0a9I7dEH/YwY+hnUS9a9mgn1sDbI/o1QuDLR4q3w805bjBO6iH/?=
 =?us-ascii?Q?rxmFrZq9wslN3E8hnqOX9Owa0BSu0M0rSbeZqkTQPcyAq6sD2suOaBa8sUld?=
 =?us-ascii?Q?9ZvElOpONr654nFX9BF38F167gQ0g5lfW0w2TtkEMx5fRqKkJ6KNN+G22x4/?=
 =?us-ascii?Q?kBXG97Jieti37zQKbOi/J5Ev5k170SXP6OA4Z4ayjEYJK/7gz5c/fDdsdDVh?=
 =?us-ascii?Q?lZc5MIocb1AWx9BFPjJwqaksovCTxuKKY2yG6VPyu/yPmpJyyMPz/0GOJS/5?=
 =?us-ascii?Q?pdaGs2N/s3Kkj5AtEUvkLOOjx4B3BG6asBYN+tj3vIX7VXQHLmkKOldc/pAQ?=
 =?us-ascii?Q?oL3pRsuMTYMXsydHhXkpDxKokqS1nMw2mEeB/zOMQgE+zNjTlUjb/fxhEgtW?=
 =?us-ascii?Q?6OrOghDe9QbBPB5nfYR8jn83DbDu3C/Kifk0ngaujVEQfmRR6hZZwdVi1sF0?=
 =?us-ascii?Q?3q9uCO3AIZXa6NTk57OY9saSOpC5yzzSC7MgtjfROYtzghBdb9ddlxAGTH6r?=
 =?us-ascii?Q?X2Od+hMb9FswbB0GqckMvUNcrMqKETCHu27Ti6ZUy0j2C+lQyUl1KJgqF2Xq?=
 =?us-ascii?Q?zgOEeni52VKl22dV12wpmtWhIhaHBZD6lsCuQ9buNe6KU/PUS54yWF0POal8?=
 =?us-ascii?Q?3e1vUejW3B3o9M+DunHNI36IXYgpIEvTdz0HRR7KnXKOKCNjgKfPzyFoSh78?=
 =?us-ascii?Q?Y9hiBW+6spr6qzCHRa2sbrfCV/aNrE2PMDyXl5ifVvRm2bf08XTGmRvZSmxV?=
 =?us-ascii?Q?pKvrxfRWbA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a3054e7-8e83-41be-bc23-08de6e825552
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 00:11:59.1298 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bQ1OtsOuG7MwQZgCvV+ZFD9fDzcIBJRaXG4bXDUD9BhaoDdz0vvq++nMkNUjrzie
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8421
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,Nvidia.com:dkim]
X-Rspamd-Queue-Id: C47E5152190
X-Rspamd-Action: no action

Improve the mock DMA-buf to have multiple physical ranges and add a
method to compare the values loaded into the iommu_domain with the
allocated page array.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/iommufd/iommufd_test.h          |   7 ++
 drivers/iommu/iommufd/selftest.c              | 107 +++++++++++++++---
 tools/testing/selftests/iommu/iommufd.c       |  43 +++++++
 tools/testing/selftests/iommu/iommufd_utils.h |  17 +++
 4 files changed, 160 insertions(+), 14 deletions(-)

diff --git a/drivers/iommu/iommufd/iommufd_test.h b/drivers/iommu/iommufd/iommufd_test.h
index 73e73e1ec15837..dae7d808b7bade 100644
--- a/drivers/iommu/iommufd/iommufd_test.h
+++ b/drivers/iommu/iommufd/iommufd_test.h
@@ -31,6 +31,7 @@ enum {
 	IOMMU_TEST_OP_PASID_CHECK_HWPT,
 	IOMMU_TEST_OP_DMABUF_GET,
 	IOMMU_TEST_OP_DMABUF_REVOKE,
+	IOMMU_TEST_OP_MD_CHECK_DMABUF,
 };
 
 enum {
@@ -194,6 +195,12 @@ struct iommu_test_cmd {
 			__s32 dmabuf_fd;
 			__u32 revoked;
 		} dmabuf_revoke;
+		struct {
+			__s32 dmabuf_fd;
+			__aligned_u64 iova;
+			__aligned_u64 length;
+			__aligned_u64 offset;
+		} check_dmabuf;
 	};
 	__u32 last;
 };
diff --git a/drivers/iommu/iommufd/selftest.c b/drivers/iommu/iommufd/selftest.c
index 06820a50d5d24c..e924281840a07e 100644
--- a/drivers/iommu/iommufd/selftest.c
+++ b/drivers/iommu/iommufd/selftest.c
@@ -1957,16 +1957,19 @@ void iommufd_selftest_destroy(struct iommufd_object *obj)
 }
 
 struct iommufd_test_dma_buf {
-	void *memory;
 	size_t length;
+	unsigned int npages;
 	bool revoked;
+	struct page *pages[] __counted_by(npages);
 };
 
 static void iommufd_test_dma_buf_release(struct dma_buf *dmabuf)
 {
 	struct iommufd_test_dma_buf *priv = dmabuf->priv;
+	unsigned int i;
 
-	kfree(priv->memory);
+	for (i = 0; i < priv->npages; i++)
+		__free_page(priv->pages[i]);
 	kfree(priv);
 }
 
@@ -1981,19 +1984,22 @@ iommufd_dma_pal_map_phys(struct dma_buf_attachment *attachment)
 	if (priv->revoked)
 		return ERR_PTR(-ENODEV);
 
-	phys = kvmalloc(struct_size(phys, phys, 1), GFP_KERNEL);
+	phys = kvmalloc(struct_size(phys, phys, priv->npages), GFP_KERNEL);
 	if (!phys)
 		return ERR_PTR(-ENOMEM);
 
-	phys->length = 1;
-	phys->phys[0].paddr = virt_to_phys(priv->memory);
-	phys->phys[0].len = priv->length;
+	phys->length = priv->npages;
+	for (unsigned int i = 0; i < priv->npages; i++) {
+		phys->phys[i].paddr = page_to_phys(priv->pages[i]);
+		phys->phys[i].len = PAGE_SIZE;
+	}
 	return phys;
 }
 
 static void iommufd_dma_pal_unmap_phys(struct dma_buf_attachment *attach,
 				       struct dma_buf_phys_list *phys)
 {
+	kfree(phys);
 }
 
 static const struct dma_buf_mapping_pal_exp_ops iommufd_test_dma_buf_pal_ops = {
@@ -2022,21 +2028,27 @@ static int iommufd_test_dmabuf_get(struct iommufd_ucmd *ucmd,
 	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
 	struct iommufd_test_dma_buf *priv;
 	struct dma_buf *dmabuf;
+	size_t i;
 	int rc;
 
-	len = ALIGN(len, PAGE_SIZE);
-	if (len == 0 || len > PAGE_SIZE * 512)
+	unsigned int npages;
+
+	if (len == 0 || len % PAGE_SIZE || len > PAGE_SIZE * 512)
 		return -EINVAL;
 
-	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
+	npages = len >> PAGE_SHIFT;
+	priv = kzalloc(struct_size(priv, pages, npages), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
 	priv->length = len;
-	priv->memory = kzalloc(len, GFP_KERNEL);
-	if (!priv->memory) {
-		rc = -ENOMEM;
-		goto err_free;
+	priv->npages = npages;
+	for (i = 0; i < npages; i++) {
+		priv->pages[i] = alloc_page(GFP_KERNEL | __GFP_ZERO);
+		if (!priv->pages[i]) {
+			rc = -ENOMEM;
+			goto err_free;
+		}
 	}
 
 	exp_info.ops = &iommufd_test_dmabuf_ops;
@@ -2053,7 +2065,11 @@ static int iommufd_test_dmabuf_get(struct iommufd_ucmd *ucmd,
 	return dma_buf_fd(dmabuf, open_flags);
 
 err_free:
-	kfree(priv->memory);
+	for (unsigned int i = 0; i < npages; i++) {
+		if (!priv->pages[i])
+			break;
+		__free_page(priv->pages[i]);
+	}
 	kfree(priv);
 	return rc;
 }
@@ -2085,6 +2101,64 @@ static int iommufd_test_dmabuf_revoke(struct iommufd_ucmd *ucmd, int fd,
 	return rc;
 }
 
+static int iommufd_test_md_check_dmabuf(struct iommufd_ucmd *ucmd,
+					unsigned int mockpt_id, int dmabuf_fd,
+					unsigned long iova, size_t length,
+					unsigned long offset)
+{
+	struct iommufd_hw_pagetable *hwpt;
+	struct iommufd_test_dma_buf *priv;
+	struct mock_iommu_domain *mock;
+	struct dma_buf *dmabuf;
+	unsigned int page_size;
+	unsigned long end;
+	size_t i;
+	int rc;
+
+	hwpt = get_md_pagetable(ucmd, mockpt_id, &mock);
+	if (IS_ERR(hwpt))
+		return PTR_ERR(hwpt);
+
+	dmabuf = dma_buf_get(dmabuf_fd);
+	if (IS_ERR(dmabuf)) {
+		rc = PTR_ERR(dmabuf);
+		goto out_put_hwpt;
+	}
+
+	if (dmabuf->ops != &iommufd_test_dmabuf_ops) {
+		rc = -EINVAL;
+		goto out_put_dmabuf;
+	}
+
+	priv = dmabuf->priv;
+	page_size = 1 << __ffs(mock->domain.pgsize_bitmap);
+	if (iova % page_size || length % page_size || offset % page_size ||
+	    check_add_overflow(offset, length, &end) || end > priv->length) {
+		rc = -EINVAL;
+		goto out_put_dmabuf;
+	}
+
+	for (i = 0; i < length; i += page_size) {
+		phys_addr_t expected =
+			page_to_phys(priv->pages[(offset + i) / PAGE_SIZE]) +
+			((offset + i) % PAGE_SIZE);
+		phys_addr_t io_phys =
+			mock->domain.ops->iova_to_phys(&mock->domain, iova + i);
+
+		if (io_phys != expected) {
+			rc = -EINVAL;
+			goto out_put_dmabuf;
+		}
+	}
+	rc = 0;
+
+out_put_dmabuf:
+	dma_buf_put(dmabuf);
+out_put_hwpt:
+	iommufd_put_object(ucmd->ictx, &hwpt->obj);
+	return rc;
+}
+
 int iommufd_test(struct iommufd_ucmd *ucmd)
 {
 	struct iommu_test_cmd *cmd = ucmd->cmd;
@@ -2170,6 +2244,11 @@ int iommufd_test(struct iommufd_ucmd *ucmd)
 		return iommufd_test_dmabuf_revoke(ucmd,
 						  cmd->dmabuf_revoke.dmabuf_fd,
 						  cmd->dmabuf_revoke.revoked);
+	case IOMMU_TEST_OP_MD_CHECK_DMABUF:
+		return iommufd_test_md_check_dmabuf(
+			ucmd, cmd->id, cmd->check_dmabuf.dmabuf_fd,
+			cmd->check_dmabuf.iova, cmd->check_dmabuf.length,
+			cmd->check_dmabuf.offset);
 	default:
 		return -EOPNOTSUPP;
 	}
diff --git a/tools/testing/selftests/iommu/iommufd.c b/tools/testing/selftests/iommu/iommufd.c
index dadad277f4eb2e..2673f9f153392f 100644
--- a/tools/testing/selftests/iommu/iommufd.c
+++ b/tools/testing/selftests/iommu/iommufd.c
@@ -1580,10 +1580,53 @@ TEST_F(iommufd_ioas, dmabuf_simple)
 	test_err_ioctl_ioas_map_file(EINVAL, dfd, buf_size, buf_size, &iova);
 	test_err_ioctl_ioas_map_file(EINVAL, dfd, 0, buf_size + 1, &iova);
 	test_ioctl_ioas_map_file(dfd, 0, buf_size, &iova);
+	if (variant->mock_domains)
+		test_cmd_check_dmabuf(self->hwpt_id, dfd, iova, buf_size, 0);
 
 	close(dfd);
 }
 
+TEST_F(iommufd_ioas, dmabuf_multi_page)
+{
+	__u64 iova;
+	int dfd;
+
+	/* Single page */
+	test_cmd_get_dmabuf(PAGE_SIZE, &dfd);
+	test_ioctl_ioas_map_file(dfd, 0, PAGE_SIZE, &iova);
+	if (variant->mock_domains)
+		test_cmd_check_dmabuf(self->hwpt_id, dfd, iova, PAGE_SIZE, 0);
+	close(dfd);
+
+	/* Many pages - exercises batch filling across multiple phys entries */
+	test_cmd_get_dmabuf(PAGE_SIZE * 64, &dfd);
+	test_ioctl_ioas_map_file(dfd, 0, PAGE_SIZE * 64, &iova);
+	if (variant->mock_domains)
+		test_cmd_check_dmabuf(self->hwpt_id, dfd, iova, PAGE_SIZE * 64,
+				      0);
+	close(dfd);
+
+	/* Sub-range from the middle - exercises seeking into the phys array */
+	test_cmd_get_dmabuf(PAGE_SIZE * 16, &dfd);
+	test_ioctl_ioas_map_file(dfd, PAGE_SIZE * 4, PAGE_SIZE * 8, &iova);
+	if (variant->mock_domains)
+		test_cmd_check_dmabuf(self->hwpt_id, dfd, iova, PAGE_SIZE * 8,
+				      PAGE_SIZE * 4);
+	close(dfd);
+
+	/* Multiple sub-ranges from the same dmabuf */
+	test_cmd_get_dmabuf(PAGE_SIZE * 16, &dfd);
+	test_ioctl_ioas_map_file(dfd, 0, PAGE_SIZE * 4, &iova);
+	if (variant->mock_domains)
+		test_cmd_check_dmabuf(self->hwpt_id, dfd, iova, PAGE_SIZE * 4,
+				      0);
+	test_ioctl_ioas_map_file(dfd, PAGE_SIZE * 8, PAGE_SIZE * 4, &iova);
+	if (variant->mock_domains)
+		test_cmd_check_dmabuf(self->hwpt_id, dfd, iova, PAGE_SIZE * 4,
+				      PAGE_SIZE * 8);
+	close(dfd);
+}
+
 TEST_F(iommufd_ioas, dmabuf_revoke)
 {
 	size_t buf_size = PAGE_SIZE*4;
diff --git a/tools/testing/selftests/iommu/iommufd_utils.h b/tools/testing/selftests/iommu/iommufd_utils.h
index 5502751d500c89..35fd91d354f998 100644
--- a/tools/testing/selftests/iommu/iommufd_utils.h
+++ b/tools/testing/selftests/iommu/iommufd_utils.h
@@ -593,6 +593,23 @@ static int _test_cmd_revoke_dmabuf(int fd, int dmabuf_fd, bool revoked)
 #define test_cmd_revoke_dmabuf(dmabuf_fd, revoke) \
 	ASSERT_EQ(0, _test_cmd_revoke_dmabuf(self->fd, dmabuf_fd, revoke))
 
+#define test_cmd_check_dmabuf(_hwpt_id, _dmabuf_fd, _iova, _length, _offset) \
+	({                                                                   \
+		struct iommu_test_cmd check_cmd = {                          \
+			.size = sizeof(check_cmd),                           \
+			.op = IOMMU_TEST_OP_MD_CHECK_DMABUF,                 \
+			.id = _hwpt_id,                                      \
+			.check_dmabuf = { .dmabuf_fd = _dmabuf_fd,           \
+					  .iova = _iova,                     \
+					  .length = _length,                 \
+					  .offset = _offset },               \
+		};                                                           \
+		ASSERT_EQ(0, ioctl(self->fd,                                 \
+				   _IOMMU_TEST_CMD(                          \
+					   IOMMU_TEST_OP_MD_CHECK_DMABUF),   \
+				   &check_cmd));                             \
+	})
+
 static int _test_ioctl_destroy(int fd, unsigned int id)
 {
 	struct iommu_destroy cmd = {
-- 
2.43.0

