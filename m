Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DA53A9878
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 13:01:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B42746E59F;
	Wed, 16 Jun 2021 11:01:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2085.outbound.protection.outlook.com [40.107.243.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B20E6E5A0;
 Wed, 16 Jun 2021 11:01:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pul9xxmGeewSwzVGtbQT4ty8W+Gcutr417HMAXOdJ2fU4kmHAJPj4y99hbwYl8XSNe79BtsIUkWQlmPKq7OAQ//eUk7Amc3DVRdrjG9rp+2CFDxYoLnxpXjZ8M08/AHMbKJmMjcYA1GDbsTCQykD/XAoZNtcGdJqVjdn4HYttjUB7mrdsPcj4rL5utBwlFIgpbLtg1evRp9NE3ziZnUel8d5YmYzuHoiQzXeLcQKZBziGXGVzTeg54PanT9Y3Cmt26knMFDtgIq+NmcXaco8arHNBUa+0MEJ34H1g0cSdBqxf/ksQRi3rRBFjBqaUua21iYkbwL6H4Je1u9EdxEpLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=52B3lbBbwau5rfAU/qjaAQ1zvtcSq+eH8Qs77Z2GVMU=;
 b=XbwBDQZ9CnHZZklsYoPY3DWfvyrz9hvVxjbXtmj8C3dGYlCrIMJs4dH1h1Ho4wShiTyyXQAc2lEndjAd1xW6C388FK+t8H8YC2NGlp/U3Ofdbbq9V+I/M8eMGE/hrsyCTiBcKiLcNruOOQuXnUjkk+5f3Gl5zhPm4b2I6Fvl45DmEXkqzIN2DTP41wCa+CniHEKKKrrsu5iVsYwoROcO3AapP7irmUBxwdnaRdIOjXW1jslrUNfiQpNvT49ED924jAG/aoBjnOhxaFCd/4VIGJtiBmt5KWG+1si0Jly9wK24uJUHqYHcILLoxKYdVDjNrdYMulpwRkSKuW+aqM254w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=infradead.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=52B3lbBbwau5rfAU/qjaAQ1zvtcSq+eH8Qs77Z2GVMU=;
 b=mD+P6iw2WxA8ZK3k3q9XOlwda7OVi4NJlxX7SJnjvtR1Z0MPTWkJOllNvqv0/n7NOsmcOEZ4mvqH3Wt3pO7i1zZN2dJTl8+j2pSF4VwUqguMBczSNiMXafgjIM3ODO7Y4zGlEkV1NBxZlkZ40i/6bfmIu41T6IExh4ii/NvkHv+1ymzQwP37gXHO7+Q3LamrtL9J0mnw/5CzZjeQODiud6sYuESioTweIO8iBUKp6fcOim7HM58DwQjXWfchNw6OPyE2GbhEKLkLpLEqa4vbbWWFIT3riP3fyCSHtzVrGXi9hp/NXBm6lNOTdAkwOIk5zOqz0FvXYdh29MJZDUndrw==
Received: from BN6PR19CA0077.namprd19.prod.outlook.com (2603:10b6:404:133::15)
 by MWHPR1201MB0205.namprd12.prod.outlook.com (2603:10b6:301:4e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Wed, 16 Jun
 2021 11:00:59 +0000
Received: from BN8NAM11FT048.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:133:cafe::eb) by BN6PR19CA0077.outlook.office365.com
 (2603:10b6:404:133::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.16 via Frontend
 Transport; Wed, 16 Jun 2021 11:00:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT048.mail.protection.outlook.com (10.13.177.117) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4242.16 via Frontend Transport; Wed, 16 Jun 2021 11:00:59 +0000
Received: from localhost (172.20.187.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 16 Jun
 2021 11:00:57 +0000
From: Alistair Popple <apopple@nvidia.com>
To: <akpm@linux-foundation.org>
Subject: [PATCH v11 06/10] mm/memory.c: Allow different return codes for
 copy_nonpresent_pte()
Date: Wed, 16 Jun 2021 20:59:33 +1000
Message-ID: <20210616105937.23201-7-apopple@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210616105937.23201-1-apopple@nvidia.com>
References: <20210616105937.23201-1-apopple@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 94b01e04-167d-4e4c-7a6d-08d930b60622
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0205:
X-Microsoft-Antispam-PRVS: <MWHPR1201MB0205EB1AF0ACE53F6E3EFD5DDF0F9@MWHPR1201MB0205.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M02lkGw33resWblEhD10QXzG+LiFrQ23a9PR4s/Hxynz6KjHTpnWSbrFC+QPwH5Z4gND5y4YL9oLwKsbXavnLTa10aD9n5At4AWq8W1wS6sApynJ2PWl5TfeCTeHUZ6ArfiyjCsXxz8LF3lXtEAkhkaJjeBkJjREYXgOCYMJoz04/k+RjRxFwsNL5TdlS6purxGAMK9Lt65JS6D5I3DepGceZV+t1E2vtyuzVzFzYcrFdwx1zvIsiVpKLmBWr/j1vHAGmWJ8k+mo2VMBUUv9IvayqWm5z+Yi/++vYQRY46xpWTlYdlN8iXw7CCLKS+RubNV7HCC71BiS+OumgMXD54mx16VvmWrQS9JjN05JzE8GPVViiYcibhpSTP+hwCYPWZxqcgIwbbE9QOcfQ6SyS4ehbY+15GQhBQxeA0B9AD7HHtOLDRmXxGom1YPgEwRiZ1JnsXNoX0GAEYDIpuAPNDc4D/PBOfPtbplHl3K20n2J2IwTyPeez7ZFh9Dftv/ANocrDUEYZ+H6ohntynaRTJEHhyx6sOkzTbZxk1q8xs6AVIi1H0U3VSymo705ekbnSzaKI8VTUVIhOUaQe+Mxay/JIYF4WY3wEs+Ku/uWAqnPoEdEZn0dzJofmW9wnuI1EvfuSckOQNs4HcKAa7JFHAdLvJrqbu3i1NZmwSEQWNk=
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(376002)(136003)(346002)(46966006)(36840700001)(47076005)(356005)(8936002)(86362001)(36756003)(7636003)(36860700001)(82310400003)(336012)(70586007)(83380400001)(70206006)(4326008)(8676002)(426003)(2616005)(107886003)(478600001)(6916009)(7416002)(54906003)(26005)(5660300002)(36906005)(16526019)(316002)(186003)(1076003)(2906002)(6666004)(82740400003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2021 11:00:59.2950 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94b01e04-167d-4e4c-7a6d-08d930b60622
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT048.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0205
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
Cc: rcampbell@nvidia.com, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, Alistair Popple <apopple@nvidia.com>,
 hughd@google.com, linux-kernel@vger.kernel.org, willy@infradead.org,
 hch@infradead.org, linux-mm@kvack.org, peterx@redhat.com, shakeelb@google.com,
 dri-devel@lists.freedesktop.org, jgg@nvidia.com, jhubbard@nvidia.com,
 bskeggs@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently if copy_nonpresent_pte() returns a non-zero value it is
assumed to be a swap entry which requires further processing outside the
loop in copy_pte_range() after dropping locks. This prevents other
values being returned to signal conditions such as failure which a
subsequent change requires.

Instead make copy_nonpresent_pte() return an error code if further
processing is required and read the value for the swap entry in the main
loop under the ptl.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Reviewed-by: Peter Xu <peterx@redhat.com>

---

v11:

Rebase on mmots

v10:

Use a unique error code and only check return codes for handling.

v9:

New for v9 to allow device exclusive handling to occur in
copy_nonpresent_pte().
---
 mm/memory.c | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index b4588402b777..1ac4d0b07c99 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -717,7 +717,7 @@ copy_nonpresent_pte(struct mm_struct *dst_mm, struct mm_struct *src_mm,
 
 	if (likely(!non_swap_entry(entry))) {
 		if (swap_duplicate(entry) < 0)
-			return entry.val;
+			return -EIO;
 
 		/* make sure dst_mm is on swapoff's mmlist. */
 		if (unlikely(list_empty(&dst_mm->mmlist))) {
@@ -973,12 +973,14 @@ copy_pte_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
 			continue;
 		}
 		if (unlikely(!pte_present(*src_pte))) {
-			entry.val = copy_nonpresent_pte(dst_mm, src_mm,
-							dst_pte, src_pte,
-							dst_vma, src_vma,
-							addr, rss);
-			if (entry.val)
+			ret = copy_nonpresent_pte(dst_mm, src_mm,
+						  dst_pte, src_pte,
+						  dst_vma, src_vma,
+						  addr, rss);
+			if (ret == -EIO) {
+				entry = pte_to_swp_entry(*src_pte);
 				break;
+			}
 			progress += 8;
 			continue;
 		}
@@ -1011,20 +1013,24 @@ copy_pte_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
 	pte_unmap_unlock(orig_dst_pte, dst_ptl);
 	cond_resched();
 
-	if (entry.val) {
+	if (ret == -EIO) {
+		VM_WARN_ON_ONCE(!entry.val);
 		if (add_swap_count_continuation(entry, GFP_KERNEL) < 0) {
 			ret = -ENOMEM;
 			goto out;
 		}
 		entry.val = 0;
-	} else if (ret) {
-		WARN_ON_ONCE(ret != -EAGAIN);
+	} else if (ret ==  -EAGAIN) {
 		prealloc = page_copy_prealloc(src_mm, src_vma, addr);
 		if (!prealloc)
 			return -ENOMEM;
-		/* We've captured and resolved the error. Reset, try again. */
-		ret = 0;
+	} else if (ret) {
+		VM_WARN_ON_ONCE(1);
 	}
+
+	/* We've captured and resolved the error. Reset, try again. */
+	ret = 0;
+
 	if (addr != end)
 		goto again;
 out:
-- 
2.20.1

