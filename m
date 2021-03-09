Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C75333194
	for <lists+dri-devel@lfdr.de>; Tue,  9 Mar 2021 23:38:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D1826E096;
	Tue,  9 Mar 2021 22:38:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760080.outbound.protection.outlook.com [40.107.76.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 435AD6E096;
 Tue,  9 Mar 2021 22:38:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uu5np9HMa+aeEQOhJ4LUVL3v/X7YAYiazWTOSgMzbGNm7L19ywU4wSDqNOzPCTBun2Z13up3QVXfu6Hb08/5qHPGAVGGDvGfnTLsmeDBNEv59XbIPMj2jVIn2Y1YKKIknMv8C44E21ukjUMHSYzBgZYwXDcR47ksytbbzoceaHZc6RImHEYSzyCsL7lq/Zpu/EOJfzg4MIkHAkCV4uRgcSl65nWXmp6iGuVs2yaLDE5amWiWayuiinaHDqaGnXL8VWcbfmSBwLkDRohv5QQ6c6mV6KMB1mDnb6/qXppQoDyM+Ya9CxLqL22hITCss6VoU8XgwU8TJTmPe8pU6r8QIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vjmm3izY2BFjD/mNXDCW0CyvtiJ9fItFsvR23ZEDbHc=;
 b=mjQK8PSwm3EY9TXhVZPyoOvEj/qLaDqyFeRyXloiphuqrxu34X4IQW3OU9eOs4k+QjQpVF95+Gtb2vHwMXjkyWB+Y2LZKKjPlRK3/X1MgREYr0ZxuAprTmi0/QefUiogGiMEIfhcheo4USV8hvDXIYqXcqchbaRncpW8KhSLOi22zAb17E7PiDahYv7r7xzcGeWSP++5rXJP3lYPKakogI2gQM+c0MNRi31tCxx+MxOUBfL6GD2zsdhhamT+TVnbDZ7Am0ovXNVZsa2oIP4uKD8XBFqjqLyj2MeyTjA51nznZU+zP+3Co3qWBUWMOJ1XJlhjv5kzmEwx+dxpgntUAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vjmm3izY2BFjD/mNXDCW0CyvtiJ9fItFsvR23ZEDbHc=;
 b=Q/JZ+bZUBlRSbPJwSACjXqK/zvloxfyAKgCBwaZJtJ6AqVu3GfXBEloo19RkZou5egC6RM8DSXApIVFt46Md1y6p0QRzKW8A44dUB/XvCKdnzzipMYRh6d7XaMqFUKEwNKpLfvviLCPE56ZmJQbKIVLz/4cO7D1l+qu1M9RXZdCpe8gntiqV6NRWUTvvvEJbaI8bbBPAZ5+ZaIUayhyqpziSJ+v88fizisBIUhrGHfBBHchNPoUr0e+bPJjzbUeSH4lDkUOb5DIrfS+4WlJd2pnKl+oxW5gax9Jhz3tGhGE9mRx5WTF2IrPist3drgWBgGkatM+XSzwU4fTPf/gkQg==
Received: from DM5PR19CA0013.namprd19.prod.outlook.com (2603:10b6:3:151::23)
 by DM5PR1201MB0218.namprd12.prod.outlook.com (2603:10b6:4:4d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Tue, 9 Mar
 2021 22:38:39 +0000
Received: from DM6NAM11FT040.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:151:cafe::5f) by DM5PR19CA0013.outlook.office365.com
 (2603:10b6:3:151::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend
 Transport; Tue, 9 Mar 2021 22:38:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none; vger.kernel.org; dmarc=pass action=none header.from=nvidia.com; 
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT040.mail.protection.outlook.com (10.13.173.133) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3912.17 via Frontend Transport; Tue, 9 Mar 2021 22:38:39 +0000
Received: from localhost (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 9 Mar
 2021 22:38:38 +0000
From: Alistair Popple <apopple@nvidia.com>
To: <linux-mm@kvack.org>, <nouveau@lists.freedesktop.org>,
 <bskeggs@redhat.com>, <akpm@linux-foundation.org>
Subject: [PATCH v5 7/8] nouveau/svm: Refactor nouveau_range_fault
Date: Wed, 10 Mar 2021 09:38:27 +1100
Message-ID: <20210309223827.24541-1-apopple@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210309121505.23608-1-apopple@nvidia.com>
References: <20210309121505.23608-1-apopple@nvidia.com>
MIME-Version: 1.0
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 287d2c0d-a50b-41ba-6c6b-08d8e34c15e4
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0218:
X-Microsoft-Antispam-PRVS: <DM5PR1201MB02188E33BEE0A9729A1337C0DF929@DM5PR1201MB0218.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2T/1RBuiaFZGRwn2pe+47qfpbmm1GceaTlvwFE/xNXvq1Yq7Kpo/HpDmXAwnkMKVbYE3Lxi2gFjIceXlyFd07hFV5iedmz3cSPnbpXB/MTD4l2Iivycc2/MXpWF/UnHcb6l477+IR5gYco+FHUKooCsoGxS48CUoE9qvtSuW+C/Qco5got5bd1SdwiM5+0jOR/v3NOEezpKN3QKkvW5G8+DxjLZUuDYQ6PNcoThevvizOUKitDWe1hDAtm+RHhKlwjumy7bcUBiXslHRiZpZCxvsI20Nll1qPmoS8S+9dr5ojjXhpHFJKtS5zp7RlFKeT4tgNcq9cHKLy/dIJCAPdToyYHQSrfu0ZQ1nvDb5mWZJ+3SX0lk7c680QLaJSjvERnYnjACFB6O+hF4zryfEfILQsGbSd0S3P+kYD8OHfMMnwrCPj/bu95crw+6eKO0V9IpeIdPr/gDw85dluhx/6vMFIHuiULHk8nvoLdL225ld9BVfOTHJid1RjqMtdsIIspopytHpsMFi0wRpQ9hOf+sMTRDMk6Hdk2U/N+Hw7I1elMrvDr5q8cK+FBmngYP/lcR2cAjJRd4R5nazjIaQnRSab5kqPXL8pOkagh2EcAufEagqZAuMXrORhV2Qz+Q8CtNzt79WTe8U1CQUHm5jM2Eh86PDuaxm/yqLjU89dXOM0+zGlqRmMrPMEh8Br7uX
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(136003)(396003)(346002)(39860400002)(376002)(36840700001)(46966006)(36756003)(8936002)(2906002)(110136005)(316002)(356005)(7636003)(4326008)(54906003)(426003)(83380400001)(107886003)(82740400003)(8676002)(2616005)(82310400003)(36906005)(70586007)(5660300002)(336012)(478600001)(70206006)(36860700001)(186003)(6666004)(1076003)(47076005)(26005)(86362001)(34020700004)(16526019);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2021 22:38:39.6077 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 287d2c0d-a50b-41ba-6c6b-08d8e34c15e4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT040.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0218
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
Cc: rcampbell@nvidia.com, linux-doc@vger.kernel.org, jhubbard@nvidia.com,
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, jglisse@redhat.com, kvm-ppc@vger.kernel.org
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
index f18bd53da052..cd7b47c946cf 100644
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
