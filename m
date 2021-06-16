Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D23C3A9881
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 13:01:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 165446E5AB;
	Wed, 16 Jun 2021 11:01:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2069.outbound.protection.outlook.com [40.107.237.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDAAF6E5A5;
 Wed, 16 Jun 2021 11:01:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=igmfJNe4qdg1SILk9qhI1JNRwH4n74O1WHZ5MOv1DzQyckRDIoObFOtSLxUaVtciw1WmB5xC1KqhK+lEL7xyTuU2amJaAg1C4qlurDhOLrCGFIyAg0IoD6W/GFjMAcIW3OEOuXHnU8slKR3XDxHkmGe+khhb96VP+6zTYoe7+pMg8FRZxDfIlSfXSrHc7iQ14ggiBfdBl/YVBJ72gxOeiekP0om7YTmOlvhUCdoK/3IVe/sGUMgsOTXBk5wK9oYiSJPUT3ObATfvgF+DFn4xQDa3s7XTo0epBXS45R2OiSZyxTMLknLiIY/j5pZ0e4d3QHao9d/AEuRhsqFxL7d8WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rD3uyMV2vClc/Wdfm27HpRUHNcfDummDwIQJycXPjFo=;
 b=XHuWFVEEOp6ulHVaVy2JxzL1oyaekV5N04lYKxuFYAYnbp8nhMuRkVFED28iHZCYALBSoEzzJLALSgB7UlBV2MgEW4rhCRurEXWOLubZIaUGHD4zgokK9jY2DOcw6rbhRuSnmb6N5zGqhsi3aek0KJxiSRxOoV8GbXs8Ae5tnFRb8oSjx1HXIspUzbO76mmyOoWzXBHHJ3mF4OU+y92sCLXlfhdSmQFzsB20gL3HsnwBxdsMKYR6sY1I5/IrD8JeyzFFzvJrgygnQucYy+eh6gpCunh5qrDma76E0qUjK0GHpRStbbQQwt8TLsWoiSdMNvjZu4piPpkR2TBwPvcGYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=infradead.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rD3uyMV2vClc/Wdfm27HpRUHNcfDummDwIQJycXPjFo=;
 b=dTvdBZbKctG8NyfoLn/Z3lxoAgpTYSLOrEKsOqw2CVgha+bsZKBAnDsr5gfsL4WbvKf2K30ze0vziXZ7Fu0QZtr9QTG1U0+e3wUbrXoh4gro7KAmdDvXDnIf3Fyy+mZhdBtmjFAMLWsAsMNryBkxXcgtRHvGibeER1Jt1/BZcmMlcPFZlOS0qESAqStxxo8TV/0WvK7KSPWllhQFHGKVKrLGPXyLzcOGcRGjLai9Z6WA+GZr3TUZqBTh4o20fc3wyNO9IzT7k8RYB/qwItIIrU/lbSkjypW5iRfj754mt+dVsKG3Gc6ayImJG2qCBrn4vktXfVhE5wcCY8gXKt0ETA==
Received: from BN6PR19CA0076.namprd19.prod.outlook.com (2603:10b6:404:133::14)
 by MWHPR1201MB0160.namprd12.prod.outlook.com (2603:10b6:301:50::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.24; Wed, 16 Jun
 2021 11:01:07 +0000
Received: from BN8NAM11FT048.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:133:cafe::e9) by BN6PR19CA0076.outlook.office365.com
 (2603:10b6:404:133::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.15 via Frontend
 Transport; Wed, 16 Jun 2021 11:01:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT048.mail.protection.outlook.com (10.13.177.117) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4242.16 via Frontend Transport; Wed, 16 Jun 2021 11:01:07 +0000
Received: from localhost (172.20.187.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 16 Jun
 2021 11:01:06 +0000
From: Alistair Popple <apopple@nvidia.com>
To: <akpm@linux-foundation.org>
Subject: [PATCH v11 09/10] nouveau/svm: Refactor nouveau_range_fault
Date: Wed, 16 Jun 2021 20:59:36 +1000
Message-ID: <20210616105937.23201-10-apopple@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210616105937.23201-1-apopple@nvidia.com>
References: <20210616105937.23201-1-apopple@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5a246ab4-f5e5-4c91-5958-08d930b60adb
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0160:
X-Microsoft-Antispam-PRVS: <MWHPR1201MB016096310A0003980D1CBCF4DF0F9@MWHPR1201MB0160.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TJteah2hqw9JGYFD2s6kNv6GaMosLyt81clEQu6uNslXi0uhu5j57XnTkjyZmQBxt2llkmFNrS2O51dD+BJ6UG2fq3G0TX4GRjTp+abJuIGE1OIahmkJVrSuIi4N5V/ehElqczWqEwNaYbdC+EHr6IH7q5Bsv/YKW31XAlyyvlbaD5eV4JdCFwo2owr8dJv0FNHEnvgqXaZQ+UZztOyRiKf3uE0qGp5399wFaY/PEy7vIQYiXid/Mii+S+z1T5Qb6c2/+OZ22r61j16HuZPWCNGs+c43nGur07/uYufkGv4DHy/LQOAunx51jmz/o9Bxo6JyEYzMkFjIatELmZQE3c7H5jNObTgJkn9QFSOxWNQo1eX6gvBkJrtKeJBeqBRmz7VnCqeqLpTLt6/41Abs0RAkjlCpYF5HmCb6jJAgaUzrKntSHdb8DI9/H9rzScmOBK0v5L6h2OpyoPDfbwrqgu8qholvq4IebjV1T4p6gyDRliioimBSYLvNAo09qQVOd/9MmCjhF+q9xKfOsXnMmxBI7Cyd/lNHgHSbOLbqiF8YGsJyVlms1CoCEK567/K9u7o7h/BQ/EQ2YbljC//bsLP6bnaTT+iBXOaX+D4BBV+O59G8hSmXxrBpcVJwf+ZTKvAG5NPfaEq0hLtKddrvuzRjxb8uiwRXLWJkI6SnD38=
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(376002)(136003)(396003)(46966006)(36840700001)(86362001)(7636003)(26005)(6666004)(83380400001)(16526019)(107886003)(426003)(356005)(8936002)(2616005)(316002)(36756003)(8676002)(70206006)(6916009)(47076005)(186003)(36860700001)(2906002)(478600001)(70586007)(36906005)(54906003)(82740400003)(7416002)(82310400003)(4326008)(1076003)(336012)(5660300002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2021 11:01:07.2295 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a246ab4-f5e5-4c91-5958-08d930b60adb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT048.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0160
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

Call mmu_interval_notifier_insert() as part of nouveau_range_fault().
This doesn't introduce any functional change but makes it easier for a
subsequent patch to alter the behaviour of nouveau_range_fault() to
support GPU atomic operations.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Reviewed-by: Ben Skeggs <bskeggs@redhat.com>

---

v9:

* Added Ben's Reviewed-By (thanks!)
---
 drivers/gpu/drm/nouveau/nouveau_svm.c | 34 ++++++++++++++++-----------
 1 file changed, 20 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index 94f841026c3b..a195e48c9aee 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -567,18 +567,27 @@ static int nouveau_range_fault(struct nouveau_svmm *svmm,
 	unsigned long hmm_pfns[1];
 	struct hmm_range range = {
 		.notifier = &notifier->notifier,
-		.start = notifier->notifier.interval_tree.start,
-		.end = notifier->notifier.interval_tree.last + 1,
 		.default_flags = hmm_flags,
 		.hmm_pfns = hmm_pfns,
 		.dev_private_owner = drm->dev,
 	};
-	struct mm_struct *mm = notifier->notifier.mm;
+	struct mm_struct *mm = svmm->notifier.mm;
 	int ret;
 
+	ret = mmu_interval_notifier_insert(&notifier->notifier, mm,
+					args->p.addr, args->p.size,
+					&nouveau_svm_mni_ops);
+	if (ret)
+		return ret;
+
+	range.start = notifier->notifier.interval_tree.start;
+	range.end = notifier->notifier.interval_tree.last + 1;
+
 	while (true) {
-		if (time_after(jiffies, timeout))
-			return -EBUSY;
+		if (time_after(jiffies, timeout)) {
+			ret = -EBUSY;
+			goto out;
+		}
 
 		range.notifier_seq = mmu_interval_read_begin(range.notifier);
 		mmap_read_lock(mm);
@@ -587,7 +596,7 @@ static int nouveau_range_fault(struct nouveau_svmm *svmm,
 		if (ret) {
 			if (ret == -EBUSY)
 				continue;
-			return ret;
+			goto out;
 		}
 
 		mutex_lock(&svmm->mutex);
@@ -606,6 +615,9 @@ static int nouveau_range_fault(struct nouveau_svmm *svmm,
 	svmm->vmm->vmm.object.client->super = false;
 	mutex_unlock(&svmm->mutex);
 
+out:
+	mmu_interval_notifier_remove(&notifier->notifier);
+
 	return ret;
 }
 
@@ -727,14 +739,8 @@ nouveau_svm_fault(struct nvif_notify *notify)
 		}
 
 		notifier.svmm = svmm;
-		ret = mmu_interval_notifier_insert(&notifier.notifier, mm,
-						   args.i.p.addr, args.i.p.size,
-						   &nouveau_svm_mni_ops);
-		if (!ret) {
-			ret = nouveau_range_fault(svmm, svm->drm, &args.i,
-				sizeof(args), hmm_flags, &notifier);
-			mmu_interval_notifier_remove(&notifier.notifier);
-		}
+		ret = nouveau_range_fault(svmm, svm->drm, &args.i,
+					sizeof(args), hmm_flags, &notifier);
 		mmput(mm);
 
 		limit = args.i.p.addr + args.i.p.size;
-- 
2.20.1

