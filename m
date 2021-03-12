Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 939BF3387A4
	for <lists+dri-devel@lfdr.de>; Fri, 12 Mar 2021 09:39:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF5DD6F4AC;
	Fri, 12 Mar 2021 08:39:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2041.outbound.protection.outlook.com [40.107.100.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CCD86F4B2;
 Fri, 12 Mar 2021 08:39:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oJuLIurd2NQ1j2PtB0Uq5xG+0Sal1CAfpCWQ6IqPJKycT4RfXApDYIYtJ9/09luxORgbeAR43qW+BtAuu28TQUZVHDBuzD0vzi0Kkvfatvz5/caqXrE3dkrBXo4YOjyjxhwvekvy0VN/53UQjYd/fDVhKt9nCRdE7d30ZtKvjtUHMXZUQ9cVmvykIVDLT8v9Vslpe/OkoNMcqo+vWpOy6sDQ+jbEScIqXVtrjLBzKUBRZhZ45wWpP10bPczPYkqTURT36DmJfPDcXx4paHoNO+m5V9Oj5UHCB7QG27gUCLiqa75cpHvUODbPsIvctsyEAH4K6zYR8HT+fzI6vcC0pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4c9870s3/fS3cTF+SLC8wpSfZhem4zErBulvbvUfaA4=;
 b=VM6KuhR/qMJsZgCIoXw1xRYpkMNxTVAQPnvDYeR1PHSG8ak6k4xnINOoyL1KvkoV80no+m+Vrpact2AtuGCQmGTL0iKKfBm0eiEtz9t/aLoDrfRp/KNnPZw0vuaGU7V43TuR7ShUFfjhAFGGYOggXBz3hEWI+c22NbA+00SfzlRyJNHWeaLWNu4Y2vQuEuiEtJoU5oFhudsy7scVBDyS0pKyIZftU2lHu2V4tZ3UmQOb7lX0MSZqrHFvsfAKHcjj705RCZYMlKQpXNrvT+zlreq+6IzK1jO99D//Z2XErj2TUNkaA0z3nEH5fIcoUajJyu5FtHJQIG/p8TF5kKgGSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4c9870s3/fS3cTF+SLC8wpSfZhem4zErBulvbvUfaA4=;
 b=enLYfE56lHj1dXC/Lk4vaPGIkLQq3F7wbFqadbr6519xrVGj+XXuFdHRDhJ+ASBQbvO5U4qSvZzpnNFKbZ05ut4Sy1SpcpB63YSozeJAR/eDxYU+1FQleSZfpzGxLKCKUTZYwi1FXiyhcfLyq1GYuUKaBp7N6Gse/uYHUsacH/xz1gwqLTJGRJ7DPTP/Rr4F777vehR7U07fxVMFHAvJAwh1efV6mmRNYhpePZvaSBPjPnRAwOh/cpu/ZyGc7sd0U+Gfhc5aTYC8l3o4HaNpx+Kvn0Tsp6UOMELv5rwRSlAF7IbfY1Y6292qZ5X39n6cyldAJJRMicB3g4Rq+Q266w==
Received: from DM6PR02CA0096.namprd02.prod.outlook.com (2603:10b6:5:1f4::37)
 by MWHPR12MB1438.namprd12.prod.outlook.com (2603:10b6:300:14::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Fri, 12 Mar
 2021 08:39:39 +0000
Received: from DM6NAM11FT012.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1f4:cafe::59) by DM6PR02CA0096.outlook.office365.com
 (2603:10b6:5:1f4::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend
 Transport; Fri, 12 Mar 2021 08:39:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT012.mail.protection.outlook.com (10.13.173.109) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3933.31 via Frontend Transport; Fri, 12 Mar 2021 08:39:38 +0000
Received: from localhost (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 12 Mar
 2021 08:39:37 +0000
From: Alistair Popple <apopple@nvidia.com>
To: <linux-mm@kvack.org>, <nouveau@lists.freedesktop.org>,
 <bskeggs@redhat.com>, <akpm@linux-foundation.org>
Subject: [PATCH v6 7/8] nouveau/svm: Refactor nouveau_range_fault
Date: Fri, 12 Mar 2021 19:38:50 +1100
Message-ID: <20210312083851.15981-8-apopple@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210312083851.15981-1-apopple@nvidia.com>
References: <20210312083851.15981-1-apopple@nvidia.com>
MIME-Version: 1.0
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5ed76b16-f8b9-41aa-7429-08d8e5325f9e
X-MS-TrafficTypeDiagnostic: MWHPR12MB1438:
X-Microsoft-Antispam-PRVS: <MWHPR12MB14386B6CE6DE6B69E273F8EFDF6F9@MWHPR12MB1438.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j+yKeutSZ4TOi32SsYmdJHDl1e96d4N+T4LpVQo6ZxLDVW58X7Pw2cB2Ywf+I54k+NJ/GoOtG+qQEVESEehiutafuSAU2HKCZF2inKz/GrnE4J4nzFDHQ5/Mz2uqHPEPHtT4wPGoMik0JWmcr5hl/P+Bgb2mC6yOz6DK18D9N9yICt8fL3fvqZUT8PGMAvOr1pc4kZQ1voTA6nE3UQjeAoOl7T62sN6FbCVbeoyP9x1fgSH/RDLPWqKHyixv254vuI5+dpg4ONFR+0NErDIJknk1qRcp39FhP2Ux7X241j/LzIwEJb1hpJ6ndcVi6pNLI1rp/yXn+G9Ctdi7B1C+OARcK998iV7tq1UTE5sKPcAcOK7C0ACUsg8ksLqV3i7xzrp1yQfWsJKWKBRRtWgoUhpcgeYBctnQcn/kUSqWyAhIrNyuPD+WYLoyjXWQUq4aU0+X4DaXC0so30XDKsYLxu51GmxtK5JarJKLsDndONKtkgib0jCaEBfz4wrj/ixc+vzVOAa2I95wK+gvrM2MjnOOvCAM/Uuqol2oIz4p0mdXP5A6zJ8Fm5jzafw7FizHNUeaWtG/GgNXfmuT4C+Gh/6rFrL/jONssl59yhv0xW4lfRMncv6lpuHJz7GJd0v8P13f+7JYZ7B0QaIRrI6BBHw0F0LZFufviifeZgOZJrJfnDVbpZB8/miFQP6AB4uX
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(376002)(346002)(396003)(39860400002)(136003)(46966006)(36840700001)(8936002)(5660300002)(86362001)(110136005)(70206006)(70586007)(316002)(34020700004)(36860700001)(107886003)(36906005)(478600001)(336012)(54906003)(83380400001)(47076005)(8676002)(4326008)(82310400003)(2906002)(16526019)(82740400003)(36756003)(7636003)(356005)(26005)(186003)(6666004)(2616005)(426003)(1076003)(7416002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2021 08:39:38.6781 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ed76b16-f8b9-41aa-7429-08d8e5325f9e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT012.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1438
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
 jhubbard@nvidia.com, Alistair Popple <apopple@nvidia.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hch@infradead.org, jglisse@redhat.com, kvm-ppc@vger.kernel.org, jgg@nvidia.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Call mmu_interval_notifier_insert() as part of nouveau_range_fault().
This doesn't introduce any functional change but makes it easier for a
subsequent patch to alter the behaviour of nouveau_range_fault() to
support GPU atomic operations.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
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

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
