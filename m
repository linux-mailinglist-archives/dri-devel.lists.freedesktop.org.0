Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D981E39D681
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 09:59:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0F3E6E84D;
	Mon,  7 Jun 2021 07:59:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2053.outbound.protection.outlook.com [40.107.237.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E51A76E848;
 Mon,  7 Jun 2021 07:59:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IgWPqwufmuSj/llt/NjBufFPGJxJmgE2W2oBOyQhTebsFraBkbWWh4COdbjgX9AacmCOOoHV9ZEZrYNKxoYXobIif8or/6orlbyky9An8B89yEidqRnV8/Ju38w4cxAkSN5msMEm4WQ9P3cTCP/NLpNMg42FPj/RCwgsBJYNqMMLSVoIaoT27Y/i8HyaifExHYtnn1sPSQsrU+YCVJiT7tmvovsBeapubI4iUmibkykILr3CEQWqze55vHRZin5kqZNrZyOj2xfAsqeFb4x/hqViyHUqry1mrlgLzT0IA+FpDSJn4LUUb52AKxsi8m9f+l3MibIBviEPFLcrrsmG+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ysaoVkqLC4zTI8DeLCydyIZtY9nTnCO+2gXmOtkNPI=;
 b=TpQBsJ0/5kGnxWd/UbP36Na0i/53x/47UVGZa2SYwuhE7rlJCYmgSu1wE9blry3lHqXfJIPMWjESdEgln/D3p6EAgsluRigGnf9iWKTqq8wmDldSfQETZLWE9QroGG3FleJRnI/gaSHqS6rDFEmIm/QksfM3HT70CqIda+19spH/D8/FvAHO+Q5FsIfO07V9tHEnEiUpbDOf0qsa2UJboaVZWItGubN0uRX7/nZUKnCtqR3rb8kwYn+ubPQY7elNNuCPVKKv79AHrFzLRIpmC6aAPPZ9pvNPdEL4Z9t9CB3jyAphI+Yfs9yUg8G/TpyT/nJxm8Cd4ubNYVMlEjahiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ysaoVkqLC4zTI8DeLCydyIZtY9nTnCO+2gXmOtkNPI=;
 b=dpa4o/l0mbP+Ylqdo1rPKCs0FX/xm11nZAatVasEpe1tlesx92r6trPN+csQ4QvAmgqQ4KyQOhpFNrE2HwiE7B07DfnBdxtMZVL1G1AkFSeXixgM6Z4GuZJrvQvBHYS7DZq9BZaKCZy8XCtTgdjinUWvHHZ3HRSc1uTYWQdMGQ/GcJvkjQbvrcTdKGZGKYgIcZXU+YihTI6kBke67rMuyA9IUMzfAVkjg5ZQ9zFLDoRu2yCzNtx2lpaoV7bxfOkkc+KSuK4z+aDxsvjqkvnhKqVrgkcVbyNZ++yRmM7x6/SsGzehLr1HWepRH6wpHwU66VbmrhNOT7sNk4kNzaTEYA==
Received: from DS7PR03CA0144.namprd03.prod.outlook.com (2603:10b6:5:3b4::29)
 by BYAPR12MB4983.namprd12.prod.outlook.com (2603:10b6:a03:102::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Mon, 7 Jun
 2021 07:59:32 +0000
Received: from DM6NAM11FT059.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b4:cafe::c5) by DS7PR03CA0144.outlook.office365.com
 (2603:10b6:5:3b4::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.21 via Frontend
 Transport; Mon, 7 Jun 2021 07:59:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT059.mail.protection.outlook.com (10.13.172.92) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4195.22 via Frontend Transport; Mon, 7 Jun 2021 07:59:32 +0000
Received: from localhost (172.20.187.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 7 Jun
 2021 07:59:31 +0000
From: Alistair Popple <apopple@nvidia.com>
To: <linux-mm@kvack.org>, <akpm@linux-foundation.org>
Subject: [PATCH v10 06/10] mm/memory.c: Allow different return codes for
 copy_nonpresent_pte()
Date: Mon, 7 Jun 2021 17:58:51 +1000
Message-ID: <20210607075855.5084-7-apopple@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210607075855.5084-1-apopple@nvidia.com>
References: <20210607075855.5084-1-apopple@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5098706e-7dbf-434d-45e7-08d9298a2f3f
X-MS-TrafficTypeDiagnostic: BYAPR12MB4983:
X-Microsoft-Antispam-PRVS: <BYAPR12MB498355F47936D9F29B951A31DF389@BYAPR12MB4983.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tLWDtBA3hKANsfqDso3uahncg6hO/kkvj5oRutm8Uje8v2rm6n8RzqKSOqukqXIP/war70TTQR3l2pge6LfLFIceGYkMN0fRyYngZ0EDpP0bTNkMh+iyu/HFUo448eCrv4nyQcxZOLb9H7TZ8QomZUGq1Fh/WVJFdRLZucoCSVYfwjq0lMENiiXYrT7gubLBQMOI1oXmotNfv8VXcw3gfEqryqRytmZFLL1eUfzWr2yotlTjWJUWo0blpkKu/YXo/LaucZTEed0hUtAO2Rr6HoCLBXcV5JTI7aC+jC5uFZ/0GmEINnOk2TfGILxpFdwVLrVmitIUwb0NEaLvFEUsF4vz1+/CQ8swUZySFpCXlo0bDVQOx5xzmv00+3RkjCrOZ08Td0FWYIDTHtigPFojBpcaT81mlXZqJ6NFPczu4nWpXLCHL0ivWaujRlOsTOKHdNaIiwj2GfmIDLfAbMUtFHc8FR9ULy5GbQ57imdHkdGcIGNhYZwv1CpN/TTDb+qrjzx9l6punLMIqVvlX+bH3uM33+k03Q2LB71l2j1V570mon3y0NFjHCgJiFOlu6GkNL08D87qj04NkYhIJpMXSWU1zeCk/stE88dXJrr0mkRg9v6Uc+nBozm1Nqep4h/yTRA2UoxhoTMQkEzfMUVzjY+G0SLYZVIGJ1sgB1M65Uk=
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(346002)(396003)(376002)(46966006)(36840700001)(4326008)(5660300002)(36906005)(54906003)(110136005)(82310400003)(6666004)(82740400003)(107886003)(316002)(2906002)(356005)(83380400001)(47076005)(7416002)(36756003)(26005)(186003)(36860700001)(1076003)(426003)(8676002)(2616005)(8936002)(478600001)(70586007)(7636003)(70206006)(336012)(86362001)(16526019);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2021 07:59:32.3404 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5098706e-7dbf-434d-45e7-08d9298a2f3f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT059.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB4983
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
Cc: rcampbell@nvidia.com, willy@infradead.org, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, Alistair Popple <apopple@nvidia.com>,
 hughd@google.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hch@infradead.org, peterx@redhat.com,
 shakeelb@google.com, bskeggs@redhat.com, jgg@nvidia.com, jhubbard@nvidia.com
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

---

v10:

Use a unique error code and only check return codes for handling.

v9:

New for v9 to allow device exclusive handling to occur in
copy_nonpresent_pte().
---
 mm/memory.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index 2fb455c365c2..0982cab37ecb 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -718,7 +718,7 @@ copy_nonpresent_pte(struct mm_struct *dst_mm, struct mm_struct *src_mm,
 
 	if (likely(!non_swap_entry(entry))) {
 		if (swap_duplicate(entry) < 0)
-			return entry.val;
+			return -EIO;
 
 		/* make sure dst_mm is on swapoff's mmlist. */
 		if (unlikely(list_empty(&dst_mm->mmlist))) {
@@ -974,11 +974,13 @@ copy_pte_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
 			continue;
 		}
 		if (unlikely(!pte_present(*src_pte))) {
-			entry.val = copy_nonpresent_pte(dst_mm, src_mm,
-							dst_pte, src_pte,
-							src_vma, addr, rss);
-			if (entry.val)
+			ret = copy_nonpresent_pte(dst_mm, src_mm,
+						dst_pte, src_pte,
+						src_vma, addr, rss);
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

