Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1371A541C6
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 05:44:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFD3A10E8E3;
	Thu,  6 Mar 2025 04:44:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="tt3TUkP5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2047.outbound.protection.outlook.com [40.107.243.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DFAB10E8DE;
 Thu,  6 Mar 2025 04:44:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qb295O1SjAgG+LfrePXy2EyTfq6jDnCFLlLvLqmQlPkm72ANh325DMmSbOuNPAQ/kU5nx+NR4DMK106iU16c7+1SZ8zTlLCZhIZtBNhbjEdsilbHq//1WWP1m1iZbGskcf5IUQNA598ZMMhR/qDr8zX6bgTYisBpkoXIdZfb54MRpUZuk2FQwqfW41hVLTxSi8o9fVLzM/CRP1GH/UuaN3WJ9gHfJw3P/ffVKfmScaWBwShxQLU95A7/OlzIyiL7slk9twuqUr1JXYmjIZzu3gXN2ESDRG7tv0i2yVo64zpLj5c5kKpPA5ucdcXu6xHmzH9/KzyCM854EqVJie8z4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YcB2n2oFNjToV92LSkT0qVEn2jBHczwFaDg726rQXQk=;
 b=o1Oyy0AA1/SKqKbgmgisVveSLsY2VhUIoMH5q6MaMYuBpOUGfMXgK6725Pw+ycJ5q2p/fpfMsCC97lSQfHgvABEHofgy4GG07/EJ0RjFATTn28rDf80ytaCh9tARtV5dK+aADECBZrip+XHtCQ9PKQNKWIEiNSdtwH7+GZ6MCYCy3LFP5xBbvZIwr5Pqp5pQxJzJPQdYF+ENQ2hRZGK32SXDmmdqQyeC1mdLiZmlbLmsofHo476nswta2nfhuz2A/ONLBXi+G6WfK7OuKau7zoECt/k8qUZGvVMMzMvjiPmf1PH95Z+D1HaHGlHEuu/hp0CZyZgptcWUJa2iBZCKqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YcB2n2oFNjToV92LSkT0qVEn2jBHczwFaDg726rQXQk=;
 b=tt3TUkP5uib+lj+Tbds9wgUcIpSkoEULyxowAuQedkJNhkejAFwOi8cE00fXr6UUBkkKjGjoltDifhDhS84W14IlEvMEUN4z+YtGl0Po+Zq5RoVpKyDyi7xPQu9oIoxvvTHsifI2xk+jVRGDEu62Mn/fbc0kwjF2lB9gjAjVOG7YEF4GdI40DCK0Y5rViynR11MePTrw/RQGS4E0noiTGX2XiE6vdRF9QzbSnk5EtBbrycZo3GkQRInACKlOQOphkBMtnU3dgDkPXmrfePmnD65ZTBXP268cuRA/Koh4UX7JmVyZR+WOkdBH2tTsBPuiwqlbzAQgPb0r6ZBkCcg1XA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SA1PR12MB7272.namprd12.prod.outlook.com (2603:10b6:806:2b6::7)
 by DS0PR12MB7534.namprd12.prod.outlook.com (2603:10b6:8:139::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.25; Thu, 6 Mar
 2025 04:43:54 +0000
Received: from SA1PR12MB7272.namprd12.prod.outlook.com
 ([fe80::a970:b87e:819a:1868]) by SA1PR12MB7272.namprd12.prod.outlook.com
 ([fe80::a970:b87e:819a:1868%7]) with mapi id 15.20.8489.028; Thu, 6 Mar 2025
 04:43:54 +0000
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
Subject: [RFC 06/11] lib/test_hmm: test cases and support for zone device
 private THP
Date: Thu,  6 Mar 2025 15:42:34 +1100
Message-ID: <20250306044239.3874247-7-balbirs@nvidia.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250306044239.3874247-1-balbirs@nvidia.com>
References: <20250306044239.3874247-1-balbirs@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0277.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::12) To SA1PR12MB7272.namprd12.prod.outlook.com
 (2603:10b6:806:2b6::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR12MB7272:EE_|DS0PR12MB7534:EE_
X-MS-Office365-Filtering-Correlation-Id: fb60681b-89d8-4215-c304-08dd5c697fb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ezVL+AqnxcWtl0FPi5twaPdc6za06TPT1Y1F5Bw5J0UG99f1CChlVRAv33zB?=
 =?us-ascii?Q?rmN4qpDYz6WXxVl0htgqp3zLyrWZfQXjvNqcHiqwx70tmb7dg+iL6ZUkiA/W?=
 =?us-ascii?Q?xSwsTlBeg96D5cgLQznHiWd8j0r+7kaYmR3VFNzu0IE63UgmYWin+shWrLLf?=
 =?us-ascii?Q?zMWAsLQTEaBTWE9Z6OgQse7E2FnK4Wjf/SAKjuty5PBxWT1ji5LJFd0yHrX7?=
 =?us-ascii?Q?hDZ5OKT2LmdAqvjp52RkU0T4fR3SlWUNm/f/jogtgl97nAi3Npl/SIt+FzXU?=
 =?us-ascii?Q?+KmsRB8W+BVL3i08wZsOrm+fiBSCg/RVaFaLK20DksYb2O6rBwoQ1RFM8Kns?=
 =?us-ascii?Q?QlAnok2IaXxB/mceljlrx0zB2qPW/gM3AdV7FteIS8CR8tnX5lFQLaQapJEk?=
 =?us-ascii?Q?Cqhy5pMFyJVDXFNBweOiozJYHhKd55L3N0bd/s0rLdqeqnOY39Uh6oaUMfJP?=
 =?us-ascii?Q?RmoijF/FLj8f2n21ddDzldwhyzf37TyOsudn3PuA2VwYROQ9+kNxwPXRKdBN?=
 =?us-ascii?Q?yF6ECyO1okhaP3zHUDusXRW7NVX4kIZrUfdni9outifOPto8wkgal8U1/ln2?=
 =?us-ascii?Q?a1AWpMM2Ni5xTRuBGQTk4mnDR5jcG1V6Q4yLhgMY4Muozkx38nHSIp5IGIiJ?=
 =?us-ascii?Q?POQaeQFO0rzgkhBDYLSx82M4+mt7Xvr495bmwE2efzlqYwhgBBCJUtVPJEiZ?=
 =?us-ascii?Q?Wp3dBFE+P77TD9pjM2afdhejaWA3BeQbtb1Fe1B8VlKNZHVC9uSctpJcsCwx?=
 =?us-ascii?Q?wlxgR2yNq3BcPYyaUqk+ft3fKYPDMkIwZqKlVg6UhJrjy89+Q5Zsf3Po6fb5?=
 =?us-ascii?Q?VnPIVIlzapu29lJ2n1hBIXNeeV2VOO4D0HbRzg7yMd0rVgVgfQKcM2P9GVZa?=
 =?us-ascii?Q?EGMW2J6b5L84upffhrYGgj8deL0D7tprDAjDPs4t3f1UDgyM0TSnN4z3fw5L?=
 =?us-ascii?Q?TJuhbQmYOZGfOBUSnwEUK4aQzwcCaDPRr3Nxs5SSSBAfCSJjdCtpaxu3/DcM?=
 =?us-ascii?Q?ItombcGGkE+Dwa5KAE0j1unV0xEE3nZP3GSy69OR81whyi/xSjt/cFYk32U2?=
 =?us-ascii?Q?pI2A6MfqGC6/CFQxsIf6eV+ppP9zNQRD8eArBoxyx7bWUb4RGJlUjJfx7mlW?=
 =?us-ascii?Q?TvV/QbpxnLGdX+VZxGgufCKEsw9L/Is4zS78Area6ZreUVB665teeHJc8V3E?=
 =?us-ascii?Q?PPZMenAxhTo+i209D2RpGFcsse0soO23TS7H/R8asL3COfvVYx9BIXO4CPMd?=
 =?us-ascii?Q?O5AVjLf9GT0tZHvhMltB7lJVceHxfKE/h18OrpjZHnRoDA+YoNerR7p+6gdX?=
 =?us-ascii?Q?yf3v1kyIAX+mr+FWKSsJQeVzYiKDhWr1T/kReL/bcqTEHcJGQSzhJzsw5npx?=
 =?us-ascii?Q?LIYMfuHXivP+wBeLQ0KXToxPE7j3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB7272.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RE/v5pP30ShdyxIgMjHHuTHpTtAnRzUccWB2c/x6fRgnfoyNFLB20wfRFhX+?=
 =?us-ascii?Q?2ajPzlzdyhvH1FPMf3Lce8sw0otQ7PBfk1+N2M8GWnkTX+VNX+NI6uzsT9xd?=
 =?us-ascii?Q?tbP1StDWKyP0LpyfW31Q2srwXtaiymKcpI4X8Ya0SmdNcaGS12Avi3/jjWVr?=
 =?us-ascii?Q?hvHxs59cp4M6Pr5LwdFdG4jXDTrjmLWqoPRn7jwR4ORWkbclsmAGAYlf7Zmu?=
 =?us-ascii?Q?/Xf1iPoFGkht8tIoqUCYzgBGyLHqYjqHYfbHVt07lefCQ/wjtUspn3x8DGaD?=
 =?us-ascii?Q?ojUOGbDc36YoP7l8oBy/cnQUGmIeGlk9a+YofDfHg2E09GIbFsR4nG26/4u+?=
 =?us-ascii?Q?UW6uwbBa9xKo9QgfHheu2owYufLVInnJkdyzK4MoW8PowRuYf/05wjOpdbui?=
 =?us-ascii?Q?hueZ0thsRl9OvuKpggNzHnAqYr6Q1kpOwqi9iykPGEsi7rct16AugeyLAoIu?=
 =?us-ascii?Q?ml5SXqSkyaGjW8j5QJDZmcW+XxzbP5FZAsZDPEeaca5FbIlwNHrEI/+vOSmE?=
 =?us-ascii?Q?MQ7WWo4Jt+ioqPI0He0YP8v4raOFxHetmsrwxX1W4QoNZ5MGmBPsZ3mNbpqc?=
 =?us-ascii?Q?8viqjbKQa00OurvaB9OjwkCswqqpuTsOhsZDP+eJ0JRp+Q5tiQUzGIqezFjU?=
 =?us-ascii?Q?wQDVrPVn+x3O/cU37FANx9QAso2qOPoGU4yvcUIYK3FeQB70GtWENtL+hbAS?=
 =?us-ascii?Q?+naTubQyGATOj/q49sZx36C2yEjUleUYsTMrviuLhB25O/HINEMSXl3te7oS?=
 =?us-ascii?Q?0Gzc75KIdJlr87otKdmNLZ2RdP7LrAQI3Jt+PchKgrxRbJ0CBAOCs9b8sbn+?=
 =?us-ascii?Q?aFUBDqLTxGoy7Q3PXK701oiurOmrguHMNAZu0/A+zM2B3Jhn16wjfOygo4bm?=
 =?us-ascii?Q?oeI2mMQAQeTDw1DidgwOYVGlCidZRJMfBCqanLEK3uv214Aobt9w863ojdju?=
 =?us-ascii?Q?SpVmY9LwvHfvOEe0l3I87/ZeCJ2EetHPzHja5eQryUTUtkSS0QQ4CU92rwob?=
 =?us-ascii?Q?Wph5QIVgQn9T6UZ9QqPLPw+NIVIfrjS4uQGvopMcjr5gS68z3ENg02hx565K?=
 =?us-ascii?Q?oSC5unDYRyRyVjy8vKwk5evIYUK+jOR+Bwz1OjT+IcN7scvAuN3i71d/oEZ2?=
 =?us-ascii?Q?boCx/qSiOfiXCOUqEStgKONKHul+T4picloa7DBxHCscqHst0WF5gxKgzT3E?=
 =?us-ascii?Q?nQWjkrFNPf9hr00cXNF5B/Uk0CUrs7Yx9oX2d0+FHSIZryK9qv1QDWzEBCDz?=
 =?us-ascii?Q?ynX0X8tyBwxE6F9KLt4B07asZe6vurqacHHvCF8ssNb+niuMTqokd5oH7vYx?=
 =?us-ascii?Q?f+eot0gKALtaTozSYlCwSiOXXEKAGSTZI69xJB2cu1+HcnCXjCzoh8pNILFB?=
 =?us-ascii?Q?FYTd1o7IXWYWQ/5FQLkfQyqPegiO5gD705RWjZh/o5qLUblBiLRc4i9LQbND?=
 =?us-ascii?Q?akt0ncgWCqEg4RsWCc1E1PrBcwDWixa2jwXjNBsvhQCtxeoworZ7Zj/TtJpW?=
 =?us-ascii?Q?hleMqwtWR93nodZNkri7WABmsctvtijVIMfqyjLsHtbbkvfFygg17dbPiCc1?=
 =?us-ascii?Q?XgKX6oKtf2uGrDQcchgv5b5t1mBcE8zmnvAjG7UL?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb60681b-89d8-4215-c304-08dd5c697fb5
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB7272.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 04:43:54.3074 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m13MT5IvUWgmlyu+sZJgMBoBVtwCgEh+fkPfH2dHM9ua01Vx8EaJtcDBJ/zNWyicxT8rg+fyovjP6xSGSd4Pag==
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

Enhance the hmm test driver (lib/test_hmm) with support for
THP pages.

A new pool of free_folios() has now been added to the dmirror
device, which can be allocated when a request for a THP zone
device private page is made.

Add compound page awareness to the allocation function during
normal migration and fault based migration. These routines also
copy folio_nr_pages() when moving data between system memory
and device memory.

args.src and args.dst used to hold migration entries are now
dynamically allocated (as they need to hold HPAGE_PMD_NR entries
or more).

Split and migrate support will be added in future patches in this
series.

Signed-off-by: Balbir Singh <balbirs@nvidia.com>
---
 lib/test_hmm.c | 342 +++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 273 insertions(+), 69 deletions(-)

diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 5b144bc5c4ec..a81d2f8a0426 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -119,6 +119,7 @@ struct dmirror_device {
 	unsigned long		calloc;
 	unsigned long		cfree;
 	struct page		*free_pages;
+	struct folio		*free_folios;
 	spinlock_t		lock;		/* protects the above */
 };
 
@@ -492,7 +493,7 @@ static int dmirror_write(struct dmirror *dmirror, struct hmm_dmirror_cmd *cmd)
 }
 
 static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
-				   struct page **ppage)
+				  struct page **ppage, bool is_large)
 {
 	struct dmirror_chunk *devmem;
 	struct resource *res = NULL;
@@ -572,20 +573,45 @@ static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
 		pfn_first, pfn_last);
 
 	spin_lock(&mdevice->lock);
-	for (pfn = pfn_first; pfn < pfn_last; pfn++) {
+	for (pfn = pfn_first; pfn < pfn_last; ) {
 		struct page *page = pfn_to_page(pfn);
 
+		if (is_large && IS_ALIGNED(pfn, HPAGE_PMD_NR)
+			&& (pfn + HPAGE_PMD_NR <= pfn_last)) {
+			page->zone_device_data = mdevice->free_folios;
+			mdevice->free_folios = page_folio(page);
+			pfn += HPAGE_PMD_NR;
+			continue;
+		}
+
 		page->zone_device_data = mdevice->free_pages;
 		mdevice->free_pages = page;
+		pfn++;
 	}
+
+	ret = 0;
 	if (ppage) {
-		*ppage = mdevice->free_pages;
-		mdevice->free_pages = (*ppage)->zone_device_data;
-		mdevice->calloc++;
+		if (is_large) {
+			if (!mdevice->free_folios) {
+				ret = -ENOMEM;
+				goto err_unlock;
+			}
+			*ppage = folio_page(mdevice->free_folios, 0);
+			mdevice->free_folios = (*ppage)->zone_device_data;
+			mdevice->calloc += HPAGE_PMD_NR;
+		} else if (mdevice->free_pages) {
+			*ppage = mdevice->free_pages;
+			mdevice->free_pages = (*ppage)->zone_device_data;
+			mdevice->calloc++;
+		} else {
+			ret = -ENOMEM;
+			goto err_unlock;
+		}
 	}
+err_unlock:
 	spin_unlock(&mdevice->lock);
 
-	return 0;
+	return ret;
 
 err_release:
 	mutex_unlock(&mdevice->devmem_lock);
@@ -598,10 +624,13 @@ static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
 	return ret;
 }
 
-static struct page *dmirror_devmem_alloc_page(struct dmirror_device *mdevice)
+static struct page *dmirror_devmem_alloc_page(struct dmirror *dmirror,
+					      bool is_large)
 {
 	struct page *dpage = NULL;
 	struct page *rpage = NULL;
+	unsigned int order = is_large ? HPAGE_PMD_ORDER : 0;
+	struct dmirror_device *mdevice = dmirror->mdevice;
 
 	/*
 	 * For ZONE_DEVICE private type, this is a fake device so we allocate
@@ -610,49 +639,55 @@ static struct page *dmirror_devmem_alloc_page(struct dmirror_device *mdevice)
 	 * data and ignore rpage.
 	 */
 	if (dmirror_is_private_zone(mdevice)) {
-		rpage = alloc_page(GFP_HIGHUSER);
+		rpage = folio_page(folio_alloc(GFP_HIGHUSER, order), 0);
 		if (!rpage)
 			return NULL;
 	}
 	spin_lock(&mdevice->lock);
 
-	if (mdevice->free_pages) {
+	if (is_large && mdevice->free_folios) {
+		dpage = folio_page(mdevice->free_folios, 0);
+		mdevice->free_folios = dpage->zone_device_data;
+		mdevice->calloc += 1 << order;
+		spin_unlock(&mdevice->lock);
+	} else if (!is_large && mdevice->free_pages) {
 		dpage = mdevice->free_pages;
 		mdevice->free_pages = dpage->zone_device_data;
 		mdevice->calloc++;
 		spin_unlock(&mdevice->lock);
 	} else {
 		spin_unlock(&mdevice->lock);
-		if (dmirror_allocate_chunk(mdevice, &dpage))
+		if (dmirror_allocate_chunk(mdevice, &dpage, is_large))
 			goto error;
 	}
 
-	zone_device_page_init(dpage);
+	init_zone_device_folio(page_folio(dpage), order);
 	dpage->zone_device_data = rpage;
 	return dpage;
 
 error:
 	if (rpage)
-		__free_page(rpage);
+		__free_pages(rpage, order);
 	return NULL;
 }
 
 static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
 					   struct dmirror *dmirror)
 {
-	struct dmirror_device *mdevice = dmirror->mdevice;
 	const unsigned long *src = args->src;
 	unsigned long *dst = args->dst;
 	unsigned long addr;
 
-	for (addr = args->start; addr < args->end; addr += PAGE_SIZE,
-						   src++, dst++) {
+	for (addr = args->start; addr < args->end; ) {
 		struct page *spage;
 		struct page *dpage;
 		struct page *rpage;
+		bool is_large = *src & MIGRATE_PFN_COMPOUND;
+		int write = (*src & MIGRATE_PFN_WRITE) ? MIGRATE_PFN_WRITE : 0;
+		unsigned long nr = 1;
 
 		if (!(*src & MIGRATE_PFN_MIGRATE))
-			continue;
+			goto next;
 
 		/*
 		 * Note that spage might be NULL which is OK since it is an
@@ -662,17 +697,45 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
 		if (WARN(spage && is_zone_device_page(spage),
 		     "page already in device spage pfn: 0x%lx\n",
 		     page_to_pfn(spage)))
+			goto next;
+
+		dpage = dmirror_devmem_alloc_page(dmirror, is_large);
+		if (!dpage) {
+			struct folio *folio;
+			unsigned long i;
+			unsigned long spfn = *src >> MIGRATE_PFN_SHIFT;
+			struct page *src_page;
+
+			if (!is_large)
+				goto next;
+
+			if (!spage && is_large) {
+				nr = HPAGE_PMD_NR;
+			} else {
+				folio = page_folio(spage);
+				nr = folio_nr_pages(folio);
+			}
+
+			for (i = 0; i < nr && addr < args->end; i++) {
+				dpage = dmirror_devmem_alloc_page(dmirror, false);
+				rpage = BACKING_PAGE(dpage);
+				rpage->zone_device_data = dmirror;
+
+				*dst = migrate_pfn(page_to_pfn(dpage)) | write;
+				src_page = pfn_to_page(spfn + i);
+
+				if (spage)
+					copy_highpage(rpage, src_page);
+				else
+					clear_highpage(rpage);
+				src++;
+				dst++;
+				addr += PAGE_SIZE;
+			}
 			continue;
-
-		dpage = dmirror_devmem_alloc_page(mdevice);
-		if (!dpage)
-			continue;
+		}
 
 		rpage = BACKING_PAGE(dpage);
-		if (spage)
-			copy_highpage(rpage, spage);
-		else
-			clear_highpage(rpage);
 
 		/*
 		 * Normally, a device would use the page->zone_device_data to
@@ -684,10 +747,42 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
 
 		pr_debug("migrating from sys to dev pfn src: 0x%lx pfn dst: 0x%lx\n",
 			 page_to_pfn(spage), page_to_pfn(dpage));
-		*dst = migrate_pfn(page_to_pfn(dpage));
-		if ((*src & MIGRATE_PFN_WRITE) ||
-		    (!spage && args->vma->vm_flags & VM_WRITE))
-			*dst |= MIGRATE_PFN_WRITE;
+
+		*dst = migrate_pfn(page_to_pfn(dpage)) | write;
+
+		if (is_large) {
+			int i;
+			struct folio *folio = page_folio(dpage);
+			*dst |= MIGRATE_PFN_COMPOUND;
+
+			if (folio_test_large(folio)) {
+				for (i = 0; i < folio_nr_pages(folio); i++) {
+					struct page *dst_page =
+						pfn_to_page(page_to_pfn(rpage) + i);
+					struct page *src_page =
+						pfn_to_page(page_to_pfn(spage) + i);
+
+					if (spage)
+						copy_highpage(dst_page, src_page);
+					else
+						clear_highpage(dst_page);
+					src++;
+					dst++;
+					addr += PAGE_SIZE;
+				}
+				continue;
+			}
+		}
+
+		if (spage)
+			copy_highpage(rpage, spage);
+		else
+			clear_highpage(rpage);
+
+next:
+		src++;
+		dst++;
+		addr += PAGE_SIZE;
 	}
 }
 
@@ -734,14 +829,17 @@ static int dmirror_migrate_finalize_and_map(struct migrate_vma *args,
 	const unsigned long *src = args->src;
 	const unsigned long *dst = args->dst;
 	unsigned long pfn;
+	const unsigned long start_pfn = start >> PAGE_SHIFT;
+	const unsigned long end_pfn = end >> PAGE_SHIFT;
 
 	/* Map the migrated pages into the device's page tables. */
 	mutex_lock(&dmirror->mutex);
 
-	for (pfn = start >> PAGE_SHIFT; pfn < (end >> PAGE_SHIFT); pfn++,
-								src++, dst++) {
+	for (pfn = start_pfn; pfn < end_pfn; pfn++, src++, dst++) {
 		struct page *dpage;
 		void *entry;
+		int nr, i;
+		struct page *rpage;
 
 		if (!(*src & MIGRATE_PFN_MIGRATE))
 			continue;
@@ -750,13 +848,25 @@ static int dmirror_migrate_finalize_and_map(struct migrate_vma *args,
 		if (!dpage)
 			continue;
 
-		entry = BACKING_PAGE(dpage);
-		if (*dst & MIGRATE_PFN_WRITE)
-			entry = xa_tag_pointer(entry, DPT_XA_TAG_WRITE);
-		entry = xa_store(&dmirror->pt, pfn, entry, GFP_ATOMIC);
-		if (xa_is_err(entry)) {
-			mutex_unlock(&dmirror->mutex);
-			return xa_err(entry);
+		if (*dst & MIGRATE_PFN_COMPOUND)
+			nr = folio_nr_pages(page_folio(dpage));
+		else
+			nr = 1;
+
+		WARN_ON_ONCE(end_pfn < start_pfn + nr);
+
+		rpage = BACKING_PAGE(dpage);
+		VM_BUG_ON(folio_nr_pages(page_folio(rpage)) != nr);
+
+		for (i = 0; i < nr; i++) {
+			entry = folio_page(page_folio(rpage), i);
+			if (*dst & MIGRATE_PFN_WRITE)
+				entry = xa_tag_pointer(entry, DPT_XA_TAG_WRITE);
+			entry = xa_store(&dmirror->pt, pfn + i, entry, GFP_ATOMIC);
+			if (xa_is_err(entry)) {
+				mutex_unlock(&dmirror->mutex);
+				return xa_err(entry);
+			}
 		}
 	}
 
@@ -829,31 +939,61 @@ static vm_fault_t dmirror_devmem_fault_alloc_and_copy(struct migrate_vma *args,
 	unsigned long start = args->start;
 	unsigned long end = args->end;
 	unsigned long addr;
+	unsigned int order = 0;
+	int i;
 
-	for (addr = start; addr < end; addr += PAGE_SIZE,
-				       src++, dst++) {
+	for (addr = start; addr < end; ) {
 		struct page *dpage, *spage;
 
 		spage = migrate_pfn_to_page(*src);
 		if (!spage || !(*src & MIGRATE_PFN_MIGRATE))
-			continue;
+			goto next;
 
 		if (WARN_ON(!is_device_private_page(spage) &&
 			    !is_device_coherent_page(spage)))
-			continue;
+			goto next;
 		spage = BACKING_PAGE(spage);
-		dpage = alloc_page_vma(GFP_HIGHUSER_MOVABLE, args->vma, addr);
-		if (!dpage)
-			continue;
-		pr_debug("migrating from dev to sys pfn src: 0x%lx pfn dst: 0x%lx\n",
-			 page_to_pfn(spage), page_to_pfn(dpage));
+		order = folio_order(page_folio(spage));
 
+		if (order)
+			dpage = folio_page(vma_alloc_folio(GFP_HIGHUSER_MOVABLE,
+						order, args->vma, addr), 0);
+		else
+			dpage = alloc_page_vma(GFP_HIGHUSER_MOVABLE, args->vma, addr);
+
+		/* Try with smaller pages if large allocation fails */
+		if (!dpage && order) {
+			dpage = alloc_page_vma(GFP_HIGHUSER_MOVABLE, args->vma, addr);
+			if (!dpage)
+				return VM_FAULT_OOM;
+			order = 0;
+		}
+
+		pr_debug("migrating from sys to dev pfn src: 0x%lx pfn dst: 0x%lx\n",
+				page_to_pfn(spage), page_to_pfn(dpage));
 		lock_page(dpage);
 		xa_erase(&dmirror->pt, addr >> PAGE_SHIFT);
 		copy_highpage(dpage, spage);
 		*dst = migrate_pfn(page_to_pfn(dpage));
 		if (*src & MIGRATE_PFN_WRITE)
 			*dst |= MIGRATE_PFN_WRITE;
+		if (order)
+			*dst |= MIGRATE_PFN_COMPOUND;
+
+		for (i = 0; i < (1 << order); i++) {
+			struct page *src_page;
+			struct page *dst_page;
+
+			src_page = pfn_to_page(page_to_pfn(spage) + i);
+			dst_page = pfn_to_page(page_to_pfn(dpage) + i);
+
+			xa_erase(&dmirror->pt, addr >> PAGE_SHIFT);
+			copy_highpage(dst_page, src_page);
+		}
+next:
+		addr += PAGE_SIZE << order;
+		src += 1 << order;
+		dst += 1 << order;
 	}
 	return 0;
 }
@@ -939,8 +1079,8 @@ static int dmirror_migrate_to_device(struct dmirror *dmirror,
 	unsigned long size = cmd->npages << PAGE_SHIFT;
 	struct mm_struct *mm = dmirror->notifier.mm;
 	struct vm_area_struct *vma;
-	unsigned long src_pfns[64] = { 0 };
-	unsigned long dst_pfns[64] = { 0 };
+	unsigned long *src_pfns;
+	unsigned long *dst_pfns;
 	struct dmirror_bounce bounce;
 	struct migrate_vma args = { 0 };
 	unsigned long next;
@@ -955,6 +1095,18 @@ static int dmirror_migrate_to_device(struct dmirror *dmirror,
 	if (!mmget_not_zero(mm))
 		return -EINVAL;
 
+	ret = -ENOMEM;
+	src_pfns = kmalloc_array(PTRS_PER_PTE, sizeof(*src_pfns),
+			  GFP_KERNEL | __GFP_RETRY_MAYFAIL);
+	if (!src_pfns)
+		goto free_mem;
+
+	dst_pfns = kmalloc_array(PTRS_PER_PTE, sizeof(*dst_pfns),
+			  GFP_KERNEL | __GFP_RETRY_MAYFAIL);
+	if (!dst_pfns)
+		goto free_mem;
+
+	ret = 0;
 	mmap_read_lock(mm);
 	for (addr = start; addr < end; addr = next) {
 		vma = vma_lookup(mm, addr);
@@ -962,7 +1114,7 @@ static int dmirror_migrate_to_device(struct dmirror *dmirror,
 			ret = -EINVAL;
 			goto out;
 		}
-		next = min(end, addr + (ARRAY_SIZE(src_pfns) << PAGE_SHIFT));
+		next = min(end, addr + (PTRS_PER_PTE << PAGE_SHIFT));
 		if (next > vma->vm_end)
 			next = vma->vm_end;
 
@@ -972,7 +1124,8 @@ static int dmirror_migrate_to_device(struct dmirror *dmirror,
 		args.start = addr;
 		args.end = next;
 		args.pgmap_owner = dmirror->mdevice;
-		args.flags = MIGRATE_VMA_SELECT_SYSTEM;
+		args.flags = MIGRATE_VMA_SELECT_SYSTEM |
+				MIGRATE_VMA_SELECT_COMPOUND;
 		ret = migrate_vma_setup(&args);
 		if (ret)
 			goto out;
@@ -992,7 +1145,7 @@ static int dmirror_migrate_to_device(struct dmirror *dmirror,
 	 */
 	ret = dmirror_bounce_init(&bounce, start, size);
 	if (ret)
-		return ret;
+		goto free_mem;
 	mutex_lock(&dmirror->mutex);
 	ret = dmirror_do_read(dmirror, start, end, &bounce);
 	mutex_unlock(&dmirror->mutex);
@@ -1003,11 +1156,14 @@ static int dmirror_migrate_to_device(struct dmirror *dmirror,
 	}
 	cmd->cpages = bounce.cpages;
 	dmirror_bounce_fini(&bounce);
-	return ret;
+	goto free_mem;
 
 out:
 	mmap_read_unlock(mm);
 	mmput(mm);
+free_mem:
+	kfree(src_pfns);
+	kfree(dst_pfns);
 	return ret;
 }
 
@@ -1200,6 +1356,7 @@ static void dmirror_device_evict_chunk(struct dmirror_chunk *chunk)
 	unsigned long i;
 	unsigned long *src_pfns;
 	unsigned long *dst_pfns;
+	unsigned int order = 0;
 
 	src_pfns = kvcalloc(npages, sizeof(*src_pfns), GFP_KERNEL | __GFP_NOFAIL);
 	dst_pfns = kvcalloc(npages, sizeof(*dst_pfns), GFP_KERNEL | __GFP_NOFAIL);
@@ -1215,13 +1372,25 @@ static void dmirror_device_evict_chunk(struct dmirror_chunk *chunk)
 		if (WARN_ON(!is_device_private_page(spage) &&
 			    !is_device_coherent_page(spage)))
 			continue;
+
+		order = folio_order(page_folio(spage));
 		spage = BACKING_PAGE(spage);
-		dpage = alloc_page(GFP_HIGHUSER_MOVABLE | __GFP_NOFAIL);
+		if (src_pfns[i] & MIGRATE_PFN_COMPOUND) {
+			dpage = folio_page(folio_alloc(GFP_HIGHUSER_MOVABLE,
+					      order), 0);
+		} else {
+			dpage = alloc_page(GFP_HIGHUSER_MOVABLE | __GFP_NOFAIL);
+			order = 0;
+		}
+
+		/* TODO Support splitting here */
 		lock_page(dpage);
-		copy_highpage(dpage, spage);
 		dst_pfns[i] = migrate_pfn(page_to_pfn(dpage));
 		if (src_pfns[i] & MIGRATE_PFN_WRITE)
 			dst_pfns[i] |= MIGRATE_PFN_WRITE;
+		if (order)
+			dst_pfns[i] |= MIGRATE_PFN_COMPOUND;
+		folio_copy(page_folio(dpage), page_folio(spage));
 	}
 	migrate_device_pages(src_pfns, dst_pfns, npages);
 	migrate_device_finalize(src_pfns, dst_pfns, npages);
@@ -1234,7 +1403,12 @@ static void dmirror_remove_free_pages(struct dmirror_chunk *devmem)
 {
 	struct dmirror_device *mdevice = devmem->mdevice;
 	struct page *page;
+	struct folio *folio;
+
 
+	for (folio = mdevice->free_folios; folio; folio = folio_zone_device_data(folio))
+		if (dmirror_page_to_chunk(folio_page(folio, 0)) == devmem)
+			mdevice->free_folios = folio_zone_device_data(folio);
 	for (page = mdevice->free_pages; page; page = page->zone_device_data)
 		if (dmirror_page_to_chunk(page) == devmem)
 			mdevice->free_pages = page->zone_device_data;
@@ -1265,6 +1439,7 @@ static void dmirror_device_remove_chunks(struct dmirror_device *mdevice)
 		mdevice->devmem_count = 0;
 		mdevice->devmem_capacity = 0;
 		mdevice->free_pages = NULL;
+		mdevice->free_folios = NULL;
 		kfree(mdevice->devmem_chunks);
 		mdevice->devmem_chunks = NULL;
 	}
@@ -1378,18 +1553,29 @@ static void dmirror_devmem_free(struct page *page)
 {
 	struct page *rpage = BACKING_PAGE(page);
 	struct dmirror_device *mdevice;
+	struct folio *folio = page_folio(page);
+	unsigned int order = folio_order(folio);
 
-	if (rpage != page)
-		__free_page(rpage);
+	if (rpage != page) {
+		if (order)
+			__free_pages(rpage, order);
+		else
+			__free_page(rpage);
+	}
 
 	mdevice = dmirror_page_to_device(page);
 	spin_lock(&mdevice->lock);
 
 	/* Return page to our allocator if not freeing the chunk */
 	if (!dmirror_page_to_chunk(page)->remove) {
-		mdevice->cfree++;
-		page->zone_device_data = mdevice->free_pages;
-		mdevice->free_pages = page;
+		mdevice->cfree += 1 << order;
+		if (order) {
+			page->zone_device_data = mdevice->free_folios;
+			mdevice->free_folios = folio;
+		} else {
+			page->zone_device_data = mdevice->free_pages;
+			mdevice->free_pages = page;
+		}
 	}
 	spin_unlock(&mdevice->lock);
 }
@@ -1397,11 +1583,10 @@ static void dmirror_devmem_free(struct page *page)
 static vm_fault_t dmirror_devmem_fault(struct vm_fault *vmf)
 {
 	struct migrate_vma args = { 0 };
-	unsigned long src_pfns = 0;
-	unsigned long dst_pfns = 0;
 	struct page *rpage;
 	struct dmirror *dmirror;
-	vm_fault_t ret;
+	vm_fault_t ret = 0;
+	unsigned int order, nr;
 
 	/*
 	 * Normally, a device would use the page->zone_device_data to point to
@@ -1412,21 +1597,36 @@ static vm_fault_t dmirror_devmem_fault(struct vm_fault *vmf)
 	dmirror = rpage->zone_device_data;
 
 	/* FIXME demonstrate how we can adjust migrate range */
+	order = folio_order(page_folio(vmf->page));
+	nr = 1 << order;
+
+	/*
+	 * Consider a per-cpu cache of src and dst pfns, but with
+	 * large number of cpus that might not scale well.
+	 */
+	args.start = ALIGN_DOWN(vmf->address, (1 << (PAGE_SHIFT + order)));
 	args.vma = vmf->vma;
-	args.start = vmf->address;
-	args.end = args.start + PAGE_SIZE;
-	args.src = &src_pfns;
-	args.dst = &dst_pfns;
+	args.end = args.start + (PAGE_SIZE << order);
+	args.src = kcalloc(nr, sizeof(*args.src), GFP_KERNEL);
+	args.dst = kcalloc(nr, sizeof(*args.dst), GFP_KERNEL);
 	args.pgmap_owner = dmirror->mdevice;
 	args.flags = dmirror_select_device(dmirror);
 	args.fault_page = vmf->page;
 
+	if (!args.src || !args.dst) {
+		ret = VM_FAULT_OOM;
+		goto err;
+	}
+
+	if (order)
+		args.flags |= MIGRATE_VMA_SELECT_COMPOUND;
+
 	if (migrate_vma_setup(&args))
 		return VM_FAULT_SIGBUS;
 
 	ret = dmirror_devmem_fault_alloc_and_copy(&args, dmirror);
 	if (ret)
-		return ret;
+		goto err;
 	migrate_vma_pages(&args);
 	/*
 	 * No device finalize step is needed since
@@ -1434,12 +1634,16 @@ static vm_fault_t dmirror_devmem_fault(struct vm_fault *vmf)
 	 * invalidated the device page table.
 	 */
 	migrate_vma_finalize(&args);
-	return 0;
+err:
+	kfree(args.src);
+	kfree(args.dst);
+	return ret;
 }
 
 static const struct dev_pagemap_ops dmirror_devmem_ops = {
 	.page_free	= dmirror_devmem_free,
 	.migrate_to_ram	= dmirror_devmem_fault,
+	.page_free	= dmirror_devmem_free,
 };
 
 static int dmirror_device_init(struct dmirror_device *mdevice, int id)
@@ -1465,7 +1669,7 @@ static int dmirror_device_init(struct dmirror_device *mdevice, int id)
 		return ret;
 
 	/* Build a list of free ZONE_DEVICE struct pages */
-	return dmirror_allocate_chunk(mdevice, NULL);
+	return dmirror_allocate_chunk(mdevice, NULL, false);
 }
 
 static void dmirror_device_remove(struct dmirror_device *mdevice)
-- 
2.48.1

