Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 495D3A541B9
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 05:43:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98F3210E100;
	Thu,  6 Mar 2025 04:43:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="HJToZw+c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060.outbound.protection.outlook.com [40.107.243.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0131110E100;
 Thu,  6 Mar 2025 04:43:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I9VQkTxlHVk988mnhZz5YKGq6hXrIKm+ycesRsglWORnUX+taGO0OheQw5yZNCu8TiGOt1OpWguaNLaonifojLOotVAt5uu6RJrvGcoO1uvii5sjlLMmIkU7eEJ9iveQnyZBxjM4Z75yTph7lfzKxdG/grC9d71Yk+M0w80RTAHcvaA8DnQ+dntLV8OoE4N5kPT8fO1uE/7yA8Sj6omIkZys4AEt85obEyKx5R3KLp2Kt3MRIQsl4yV8ZXjJtgelJeiP3RK0gixE+4szqDK4uzqqYpT9j/0uZhZH/qQ1aE0XzZSNBitMcrOlr+I5ByQa+jam2e2WRgjlgEm9FPMd/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BuN1M/zScZ4O6Juoe8JmBvCNLK6Kiv1DRf4qLY4fJms=;
 b=BuVKspziqvxhuK1k6ceOwilbuiRJu5JmREP8R2WN9eWkhjbrH4n4NrTp2seM4/F+24N0x783XzyNiu5uTruvkpaFq2Z5MePtLoizh8yv+fCdIC4nJFxCDVn2SRHq4h1gMpw2TkMZcD3IpjgcfGGdD0DfjvmEEz5EazIbMPdpv+T2c3U50XSMr2RaJbL0d12XrwK2ZTre1cggBQ2rnsGfIZwdP0UOpvl94m2cUZaZnSLvRoC3mO+vK8Y0aRM19prl1/XwKQIHerLQZ3GME8Yz5I/UNJyR8oWevhA0O7M6H0ZuG93uaF6jpzp9QkdDOMT6x1bTtWQOcoSuYDHU42RmMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BuN1M/zScZ4O6Juoe8JmBvCNLK6Kiv1DRf4qLY4fJms=;
 b=HJToZw+cQdgiB9QbGfWIYbKTzKc6EDluiP+lEsGxFBV12khxAYFY7+T0ZilOW2GFPNc34qg4SN98iCzwp6iwHGCZdHYZBKG/njbXnd1a7kBCvsRci586Xz5qn1VnmL2mNDjgVKqWAiJAahDe+ey1fd0+ujuRakJ9fETtRwXGhgkmoCMBXPeaf5tvunOb3z4ytPwlxKEvBkvkWFprbzG4XhdBTvD13Uz2esnbHTrPvfIZMPLVzig+HUyQY2cMMXwm+zoO6Btaxz1PzvstV6OdgVscKNVAv3RMLo7nNnKWeP7eECmHOilF8ZaBkfWA58CBu1a2anAST6KE9dzWcL7jKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SA1PR12MB7272.namprd12.prod.outlook.com (2603:10b6:806:2b6::7)
 by DS0PR12MB7534.namprd12.prod.outlook.com (2603:10b6:8:139::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.25; Thu, 6 Mar
 2025 04:43:40 +0000
Received: from SA1PR12MB7272.namprd12.prod.outlook.com
 ([fe80::a970:b87e:819a:1868]) by SA1PR12MB7272.namprd12.prod.outlook.com
 ([fe80::a970:b87e:819a:1868%7]) with mapi id 15.20.8489.028; Thu, 6 Mar 2025
 04:43:40 +0000
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
Subject: [RFC 02/11] mm/migrate_device: flags for selecting device private THP
 pages
Date: Thu,  6 Mar 2025 15:42:30 +1100
Message-ID: <20250306044239.3874247-3-balbirs@nvidia.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250306044239.3874247-1-balbirs@nvidia.com>
References: <20250306044239.3874247-1-balbirs@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0025.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::38) To SA1PR12MB7272.namprd12.prod.outlook.com
 (2603:10b6:806:2b6::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR12MB7272:EE_|DS0PR12MB7534:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d02dec9-aa40-487b-838e-08dd5c697727
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Z04OSp4yuFLXozyn0L7v/jaj0MXdRLqK5sJZtkseMQ71/fMLt7vOtO4INJux?=
 =?us-ascii?Q?oB+8ZdkBfmFoZp+vtyQQstIyL4lDFwpWpJ26lM+IyROMZewOt8IDkzgjMH6H?=
 =?us-ascii?Q?K9AF7MDph1J+7uZW/lo4ZjZh76216KYHRD/kdlNAZl+pEoGFjX/JoquD9c4g?=
 =?us-ascii?Q?AkX1JtOSUPTHhPqm2EGFm6gROcILuMvsVUjYrRln5GDKknheA0bh/K5b9DUX?=
 =?us-ascii?Q?gF1C4iS7npY27DiC3ymPOGGR/aAM/BaQClxExbDqYUTAqPsfIg9BmGnX6Rcy?=
 =?us-ascii?Q?TAx5ewCVIDAUlgBTW9Q3ywzB6IaJXDZvzl7EWjSdmRbiQiCnCgt/PeNmFFih?=
 =?us-ascii?Q?0pTRFFNcq5ciGVBYgXIzU8ptfr9dApaMwfM0yDmAiQcM+079lWYzL/qE3WhH?=
 =?us-ascii?Q?XU2HukcO7vyyFm4T9mk5ZAiGnkrFk/HP96FhIwsmr7S7f5A0l8RCkF25wU4O?=
 =?us-ascii?Q?ZH4q165L0PCM9bnOhbRey08dGyagBooAWpitADzHZnwk4S240galFhU83UrC?=
 =?us-ascii?Q?j/Lze8C4slE/pqXt83mlOCu/HYFlUxN9ePRVykM7F8hlFw6H77jdbwCRy4Vr?=
 =?us-ascii?Q?Cmk/wioTYwQMxV6lGW+x++HSgq9QmUCgxZCUTdTV1KKCCaSSbSbv1eMP6NvU?=
 =?us-ascii?Q?8yZEDdMpiU2QpDNE0Eu3MXNHV3voGArFpVr0HRf5L+dYW5dwbJZ0w7GNYiIq?=
 =?us-ascii?Q?cDbfcVxc0W2l2biuBRdgvgwqQqdpSXzg0fTNbzrS6zRdzFvd5QQ2m6HT1AsN?=
 =?us-ascii?Q?1b07HJYLa1QTpnfSfWEi4vZ4GUAN8FQ24Aez0+GYyTGzo8K3pPaf6p5VKQDg?=
 =?us-ascii?Q?M0APN0ejsXl1CZPfw5xGsYNnlrcEt4/Or0eYfSro4/EUyYDEWybF12xhMo34?=
 =?us-ascii?Q?FpUwQvxHFICR7j2ciWaD2XK3MW6dpZ8M1z+RZ5fdloiJf25/vCR3T1yOrmOo?=
 =?us-ascii?Q?RD7Z5BNzJ4VjxxScd8dRtOgq1pxzKeEXv3mGNHTXZBc3ZMLhscpjpvM2otJ1?=
 =?us-ascii?Q?lkOAVI+9LVjIG5K0nxspmZC1vIlirxPqO7aREoDuaGO7C4jUydHH3qXvDril?=
 =?us-ascii?Q?+eJcxh3569FrY/7C1KTDdR6Ec+aNd4yQoEqsR+ScC4+slTKiokprA6Lv+x8R?=
 =?us-ascii?Q?/dnRY4Vj3gPEd7P4rcBiCPKIWo6AhgVlfrhpvjdf8abmRqVsqdSkdaPxVnC6?=
 =?us-ascii?Q?Hpmsw6VyqwYRQTeMYT2xDZCSj2fVAkGKV8MiQOFujIczRZEmdc1hRVy6UtdE?=
 =?us-ascii?Q?IAzygQrB2RDry96uAO5mDMoPy3DOIU3wTqVyyHzxYUrKnlMzDPqSIRBfrBk1?=
 =?us-ascii?Q?8OxNByVKawgGupyOMrVkiu7Wb4KDFKff7ylw/XfOB18pi14iSiSpwW7NAsE7?=
 =?us-ascii?Q?TV7mpNMf22rF4h+FzvWDM2etKbXq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB7272.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?P5pRd8oQP4u1ZQfT8qV8svClO6uEB3v9y+MCQwx3nA0b/ifJulAkXEOi5Q07?=
 =?us-ascii?Q?FkrUV4t/Tizi7uddHl9nRylW2faIC4ZS6LQuOYXRBIRIjd14O+yHzjw7Wy/a?=
 =?us-ascii?Q?WGyvj/7W99pcmOVH6PM5UzlByMfWpuTbpfqrnWhFizm0o78Acq9ie5hWbrHI?=
 =?us-ascii?Q?cp4gQZ0PWX9hpvtPHh0OEgGi09FKBBfwU4zSpW2SyDLZq/V7V/fJR0cO5Au5?=
 =?us-ascii?Q?d4BJvzGRYrvXTe3IJSe6hK4dNYBmxytSb8J/gVeXyRZV13460canXzFYT5Ve?=
 =?us-ascii?Q?ivuBe20cSf5beMO/hCsSYjvjGLfsVogyxAUPo1d4Uh6DpPliPD3lKwoofw0+?=
 =?us-ascii?Q?l3wpSmA2JwnVKUcKPSuXy1536YJEUWGld8N1+Em6INRtN8HfC76jdj1OA9AQ?=
 =?us-ascii?Q?tZcIX6B3y+Ma5rMdXSlvUiYxdEidMuAqmFSy0Qlq4z+cPJY35lcW9Eo/3U7V?=
 =?us-ascii?Q?1qZMpV/dzNplXidZSVLrz1x/63APoYA5jymXfPmUcskukCOJciP4LKaIKjZK?=
 =?us-ascii?Q?lQJ4Xn8zCfLzdKyq1GfhhBuYF42nx2cuSequKF5ggBNwq1dZdJAGZYGDuDbN?=
 =?us-ascii?Q?U5bqVKKUSKqiVVeI9aet7wH/lbTbYTZyPuQskgCR/kez6NBRnEYQUJD26Vpw?=
 =?us-ascii?Q?Lo3d+gwY8PrXmwgc2yAZGaxRNggBYXQ5Xe6untQwlhLJXgM6XkFfvrLqC7O+?=
 =?us-ascii?Q?w+5n8D3rVFqXt4lYAzZ9PgjvcY2KsRZN4H/uhGuX1IcGTtyZDoxrBY71JF+V?=
 =?us-ascii?Q?5S6q9nhO1j7Cp6jBYS/73gxVfAYoaMyo9rW2P/tCM6WcX45GnnYc+sm2GXtL?=
 =?us-ascii?Q?g7wO2TjU5szHhDKi3OI8U4oJGaelpAY7BZHuqoeAo0mbbk5rTo74KIX95nSW?=
 =?us-ascii?Q?xzOLayozJGDc8GW9uLF+tU37qCdlYJcoAb4G6c+f+MPlnkkPxskyeaY+6RQI?=
 =?us-ascii?Q?gMPOeWAwWIsoCuYVzl+9Jhwghrhl8/i6NHQr0Ygp7c6/HhJP51SstaCLjyHt?=
 =?us-ascii?Q?NvOGzFd26906RrRcooV/dYwdqNSjBKq8ORdB8rly2K4QnhzDLdcAyyscBVfp?=
 =?us-ascii?Q?WIRgeLj18NMFd7jQcQob0R+YCZuMHYs1HE0k69c9GLnewsl45rJyB86YKyhz?=
 =?us-ascii?Q?wWToSv5WIbCD7Qw3trRYMNvmIfiYBELEULhNY3RASS2YaBmrQnyVaT7rBZhl?=
 =?us-ascii?Q?LbuMwa7UzMMHsZGoipnZDfWX90Rbuo5DoELUc/TISrOSXLz7bSFtdD4lRtVE?=
 =?us-ascii?Q?BYCYNAkY06wgMq2Etd78Pt4gOJAXbYrsAgmlv3a66QAxC3qeLr1VsYnbOi5x?=
 =?us-ascii?Q?9hEZmvdiP4mSElnFdhXjWRFnLi9v63wWXeIojl0S9TJL9pX+1ag5DYBr5Xlh?=
 =?us-ascii?Q?ft9vKg4Q2zn8P5sNcDHs5g0JS4G2p+/6orKsdwQiSv6q+0ndEm06Nt8vGc/0?=
 =?us-ascii?Q?4Ym96m3gKKggDgXkFTR04tJBaOmbgfmcQDxtOYYWi7lnTTci99cFdC5rdDz6?=
 =?us-ascii?Q?fLdF8x3vXAMIcRbRC9pGB6mkOyBYUr1gZte7bcSsEYhenkTZLRrBkFfyxJMU?=
 =?us-ascii?Q?aO062/EkSsBkQbuUgqVJXpq10oI+dCfldkyhpBMV?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d02dec9-aa40-487b-838e-08dd5c697727
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB7272.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 04:43:39.9361 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C7zewl3b7VHJ2QTTGu1sLlBMv40jue12krFstFqW1PbL+fdYGvNvpHLOXDkTH+vDdjeTHrRRpIzT4EfeSGFK2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7534
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

Add flags to mark zone device migration pages.

MIGRATE_VMA_SELECT_COMPOUND will be used to select THP pages during
migrate_vma_setup() and MIGRATE_PFN_COMPOUND will make migrating
device pages as compound pages during device pfn migration.

Signed-off-by: Balbir Singh <balbirs@nvidia.com>
---
 include/linux/migrate.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index 61899ec7a9a3..b5e4f51e64c7 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -167,6 +167,7 @@ static inline int migrate_misplaced_folio(struct folio *folio, int node)
 #define MIGRATE_PFN_VALID	(1UL << 0)
 #define MIGRATE_PFN_MIGRATE	(1UL << 1)
 #define MIGRATE_PFN_WRITE	(1UL << 3)
+#define MIGRATE_PFN_COMPOUND	(1UL << 4)
 #define MIGRATE_PFN_SHIFT	6
 
 static inline struct page *migrate_pfn_to_page(unsigned long mpfn)
@@ -185,6 +186,7 @@ enum migrate_vma_direction {
 	MIGRATE_VMA_SELECT_SYSTEM = 1 << 0,
 	MIGRATE_VMA_SELECT_DEVICE_PRIVATE = 1 << 1,
 	MIGRATE_VMA_SELECT_DEVICE_COHERENT = 1 << 2,
+	MIGRATE_VMA_SELECT_COMPOUND = 1 << 3,
 };
 
 struct migrate_vma {
-- 
2.48.1

