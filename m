Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2C138E78C
	for <lists+dri-devel@lfdr.de>; Mon, 24 May 2021 15:29:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76EDD6E5C3;
	Mon, 24 May 2021 13:29:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2054.outbound.protection.outlook.com [40.107.237.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 288EA6E5B0;
 Mon, 24 May 2021 13:28:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KYAxh9DyWCdIEuEKKOhs8RSCfRv2tCLFNgvLXtUOb4VgiFWbnAF5ZKUFVc9rjy3FgF2KwQD4pOjnBI2/oZgmylpEzRdE7rG/H52ikERC3l9/Ef0o19HFiI6hbQfSSM8ZldRrRQNXPIYguY4w2VsEg+43wmQJRShrzdCwL0RlRH7dHkw2uuKRpcuf5G+GFUoc42tZlFc48ukbM8pNbfKX8Yi58YRewr+JAarbQxqO8FXKPvVO01dwdA7+5tt0rtvBloTK1DgN+ewqzhAndcJWYZeC9r/NWrM0SaStticIqRBhkebMr978DenwFBFPY/wk1AuRe+Fj2jpmlGx6o0FeSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NWcsi0k5uDP4af5wpBdXGqN5nfg9C2DtLaH5IoJMYXo=;
 b=LPlDSHqW6qa5Xg7wWPqvMqY9ei2l3ma+I/QfHbgjmKs97ANImJhIvAgJplnyfSsIIFWzt5xC2JJ/TdBhFKMNnsSk7Nw909BgKE/6jDKMdYT3bRcM7qLIFyjQl4iKJoGYWyJsSFy4/M26rZuQRRa+QkULF6NvthqaTOKGSLZcEtoZ2J0ML2G+5XGftkm9/nOXPUfUlxKXDPxhRw4TcEAUtEJ4axp16halfYvl3CLDHttdy/tphcH/NCKqPbLkm+VkMxkTDhUsxkfLz01XwRWXHy5+dNEJ7WNTFkdtBxFHTkfXhJ6McMGtAMG4MCP9Ek/e2sSXcICdrxkNq6cmd/b/Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NWcsi0k5uDP4af5wpBdXGqN5nfg9C2DtLaH5IoJMYXo=;
 b=fXZmlL5RaAjxgJ1J12DY5cu/A9M4O3mQ40xF4rqTwJT+SCgqH3tfIa6cenfVn+HDsZISPOQKXc6PqMQEk0zuQFyUg/E2w9BISxcVgJ0HAmCrskPsJl/VnGP3zgS8qX0Xgl4i/v1JQP3JsfxV8eEy61QIBZaFokgJ7MvoyYCeEAdpk5xQz1ZT7zX6VaCNCWwObAaUw1WH9TaqqQWdS6pPljEUgbkzTXfY+WwUTiDYCO9myL4ZnC/F0RAxU5+QeDC5O+v7ERPRnRj6M9H2F6+crhFjWrQvq0SJp3/lc++jHKDUMf9ErwvTVDxIy5CQLfdpTbTekGuYzf1oSecNGNdu2Q==
Received: from MWHPR12CA0068.namprd12.prod.outlook.com (2603:10b6:300:103::30)
 by DM4PR12MB5277.namprd12.prod.outlook.com (2603:10b6:5:39d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.26; Mon, 24 May
 2021 13:28:55 +0000
Received: from CO1NAM11FT063.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:103:cafe::81) by MWHPR12CA0068.outlook.office365.com
 (2603:10b6:300:103::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23 via Frontend
 Transport; Mon, 24 May 2021 13:28:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT063.mail.protection.outlook.com (10.13.175.37) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4129.25 via Frontend Transport; Mon, 24 May 2021 13:28:54 +0000
Received: from localhost (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 24 May
 2021 13:28:54 +0000
From: Alistair Popple <apopple@nvidia.com>
To: <linux-mm@kvack.org>, <akpm@linux-foundation.org>
Subject: [PATCH v9 06/10] mm/memory.c: Allow different return codes for
 copy_nonpresent_pte()
Date: Mon, 24 May 2021 23:27:21 +1000
Message-ID: <20210524132725.12697-7-apopple@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210524132725.12697-1-apopple@nvidia.com>
References: <20210524132725.12697-1-apopple@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aaff0f84-815a-4914-f80d-08d91eb7e0e5
X-MS-TrafficTypeDiagnostic: DM4PR12MB5277:
X-Microsoft-Antispam-PRVS: <DM4PR12MB52776B56B382CF87200D8A56DF269@DM4PR12MB5277.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y4HSEk+nPWuet9U1iRCfRosswaDnjK97tKkQ1Xfb8GkkqnuT9j/PkFgvDWzH+UkHwB1h7ocMkf9XaHGNdG9sPDGcCpaU0ZRSf5vpfP8oz1zU9TTdxbyhJMfxS1zrQYo/PLafdYwoYcve8hRnX8P6Xcp9SM/O1pFZ3p5ChyWU+P3IJiBz8pEi17gmamk7B4sUp55KO/spapS7S736p5hbSKfzWhcU9kKly1jyMN2Eyy3JWvgnJKSSdeE4If/V0FTdTR3lP2udK6Lu9zDvkLIKKIIKa9KniXeccuIIxbFAFA05hH64612SgxrvjkH8QugB/KIuE4b0V3qRB0gFvmReDjjU+8w4VfPhgVK6ZkivmdSjFgDEalXU32LZTxmQBtElpvXromo6mYvJ2syrcntPcIoensOPjtNfGcxlDStWIYEmiogYF9i9n1Aw5owALs1gqbaTf6VtDE8PBw9fYFVWVBnsOy0vaHdxiv4EGAmmmoVAUdqPf2chsTz3HHfRdjrQyG/4qsyH7GEQLRPpw/Y/FHEeKVFYyPDQdidI1Br9Cp5E71GOXX05Vs+zWKEvh2Tue4WjerIfy/2681Sq8v3LqjSnwb8CoNYTmjzZAO5TFGM/2PgytNpaYeujwcfueg//hBPvGYax3d7KB4AbYpUhoIDzB1Y5CjaX9w1UJ+zsSeY=
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(376002)(396003)(39860400002)(136003)(346002)(46966006)(36840700001)(110136005)(6666004)(8676002)(8936002)(7636003)(54906003)(336012)(426003)(36860700001)(86362001)(70586007)(70206006)(356005)(47076005)(36756003)(83380400001)(478600001)(26005)(4326008)(82310400003)(107886003)(5660300002)(316002)(36906005)(2616005)(1076003)(7416002)(82740400003)(16526019)(2906002)(186003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2021 13:28:54.9542 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aaff0f84-815a-4914-f80d-08d91eb7e0e5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT063.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5277
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
 nouveau@lists.freedesktop.org, bsingharora@gmail.com,
 Alistair Popple <apopple@nvidia.com>, hughd@google.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hch@infradead.org, jglisse@redhat.com, bskeggs@redhat.com, jgg@nvidia.com,
 jhubbard@nvidia.com, peterx@redhat.com
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

v9:

New for v9 to allow device exclusive handling to occur in
copy_nonpresent_pte().
---
 mm/memory.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index 2fb455c365c2..e061cfa18c11 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -718,7 +718,7 @@ copy_nonpresent_pte(struct mm_struct *dst_mm, struct mm_struct *src_mm,
 
 	if (likely(!non_swap_entry(entry))) {
 		if (swap_duplicate(entry) < 0)
-			return entry.val;
+			return -EAGAIN;
 
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
+			if (ret == -EAGAIN) {
+				entry = pte_to_swp_entry(*src_pte);
 				break;
+			}
 			progress += 8;
 			continue;
 		}
-- 
2.20.1

