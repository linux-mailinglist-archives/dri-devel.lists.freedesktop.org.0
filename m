Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CFFD349D52
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 01:08:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A4316EE7F;
	Fri, 26 Mar 2021 00:08:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760084.outbound.protection.outlook.com [40.107.76.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAA996EE7B;
 Fri, 26 Mar 2021 00:08:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kaVM2qFTO+ULqi3zRqwyPVvUkVZtAQ3sRQzyAzE2CJ0EHIGDO38txvoV5Q0i4i0LFdm4Y8N6836ozF/pywfrj/jVjzTN/X86FEX+ejNdCISYNRC4Y6jxkzK/yJdqL10J4eeYxjZsVpjTSP9690yANFmZZfJ3wykxSGD+T50dpHQzYqkru4gW/53qAsDaA56LNvPiY4PYnUuoaz/CgAW5TocufOS9pHY4UfQbPnnGVqwJwc831wauvI3iXwc1Czdx41HNIjDu20eOQknYF+BqS4ruUPrw5aIv9l9BW030RzFA2PgZTLI3X60MrrXHZ49EMd5PRFRpQIyZG+KzG/okDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4c9870s3/fS3cTF+SLC8wpSfZhem4zErBulvbvUfaA4=;
 b=mhsg+Mz05ckdEK9aZANLb09YKNFGRIsJVJJ/KVNp1wQ6is6pCZOopRAJ/aARKw1IqEIvV1P8r3afwUKra3QZ9FkNIefJrihnzcBAk4X9KWFVTjj3FnoZU3PqHUaS6oZkYAtPAuovdahgcpglbuE3BUaXeJF/qwklPoaM9rchbLm+ZpYp5Pb9fBSbp7uK4nb3gqoMsYCDWjy2QJXSBwZOodatA/B4K9dGnvHOtAe4Nr3g2jYxZCmS91Rgp2dY5GmqNEMbsjiHBc/u8q8qf+7GtRiNc+rJ1UXAZIk6XCrrcxN8eD0QkTHSkC2Mlh4xUqJqXKzL4Dlsl0vvI0i0Id3jpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4c9870s3/fS3cTF+SLC8wpSfZhem4zErBulvbvUfaA4=;
 b=PMQizhB1xfyE8/Vv+y0NRLMIXm3O9SSRQnHahDXoaplB+IE5Y5315PNppzMYzRRcJFt6FqpsWe7W8iaoxgAD3Ic48OmvzrB8rML1Oa8B5WxivpZg/WzTHPfJ9L8LtIqTffYzJYkiAkPx9e/QGw9PofC7p6oLriGsaqYIBvBN1AHVCxnT5Hp1slGpwdpUnFxfu271hnzc5AyUAQILGwrXRQPxcBviwMD4jN6LljrrbsyYzsCHJuK4d6LwthtyjT5booDQAP94RGFiiyWDuW83/5eAX2je2eyUcsrU3nUtBHIxjKIjeDBZKusDPz2T8sJSSr08I3a2ubKneX7CIsrBHQ==
Received: from MWHPR15CA0041.namprd15.prod.outlook.com (2603:10b6:300:ad::27)
 by DM6PR12MB2699.namprd12.prod.outlook.com (2603:10b6:5:4a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Fri, 26 Mar
 2021 00:08:42 +0000
Received: from CO1NAM11FT047.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:ad:cafe::a0) by MWHPR15CA0041.outlook.office365.com
 (2603:10b6:300:ad::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24 via Frontend
 Transport; Fri, 26 Mar 2021 00:08:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT047.mail.protection.outlook.com (10.13.174.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3955.18 via Frontend Transport; Fri, 26 Mar 2021 00:08:42 +0000
Received: from localhost (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 26 Mar
 2021 00:08:41 +0000
From: Alistair Popple <apopple@nvidia.com>
To: <linux-mm@kvack.org>, <nouveau@lists.freedesktop.org>,
 <bskeggs@redhat.com>, <akpm@linux-foundation.org>
Subject: [PATCH v7 7/8] nouveau/svm: Refactor nouveau_range_fault
Date: Fri, 26 Mar 2021 11:08:04 +1100
Message-ID: <20210326000805.2518-8-apopple@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210326000805.2518-1-apopple@nvidia.com>
References: <20210326000805.2518-1-apopple@nvidia.com>
MIME-Version: 1.0
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 516ebe24-adfd-4481-a155-08d8efeb50d5
X-MS-TrafficTypeDiagnostic: DM6PR12MB2699:
X-Microsoft-Antispam-PRVS: <DM6PR12MB2699BB715891767B8A294BCDDF619@DM6PR12MB2699.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w9iWpNqRptymgHYpmVTXacomaKaB8XPmWIGh1IdDGscPh/iyUZRqBAV2cJix7IC7bG9mNtG+CO836C0NCXK3HrQyRKOeqE98X/vH3svpV38l0xJ+HJoP15OS5VSgyuST34yBu7FetcvzCALUmj+MzuN6L3SKGP0KtaVqXNTaF2N3g0NQdWHo97Ar5j1tPUu91Dzz34XRGsWOkYAW99p8aqmy6g4/1wIOIijyNabcYm3j1gpbko1+krvdSu1NRA0GGUTX179FvhmR96WBbHq7m6HIKkG8RUHL9DiO21zh8TQcJ/HzjxSfWHohh+1BC6FWqKH91Z3T21uN8BrwTW5gEed6xXNs+mt+Re3ox8EHVlKryDnM5A9yMCSNJwJodpMpmiyYjvSKpeHlNpDwc9wCWWISN9uWGvd3oOKvjfCC8Pab4wTa3SoTeQFj4MsChTFdDWTjvuYgi6YkfGg4W65c6f2t6evHlu/2TSvLquy23o/yh23l1JIuQ+2HxLtjAoN+D62fewrktSbnPOYJDjluY0IrSwUgz1sr7kVWIyHTszpk4XdQ5LEZL2133euHyepoNuUFohfzv6vQwoowHWxd/tnimkYzVvcOevPQlBGPpJ0hEFN0Z8t0zKoVJQukYs8Odu6isEskwzxTWd+Z9CqNHqoTznZHGk6KkS0H8iSRJI0=
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(136003)(396003)(376002)(346002)(39860400002)(46966006)(36840700001)(2616005)(5660300002)(54906003)(26005)(426003)(83380400001)(36756003)(8676002)(16526019)(478600001)(316002)(7416002)(4326008)(36906005)(8936002)(86362001)(82740400003)(110136005)(82310400003)(7636003)(186003)(6666004)(70206006)(1076003)(70586007)(47076005)(356005)(2906002)(336012)(107886003)(36860700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2021 00:08:42.1917 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 516ebe24-adfd-4481-a155-08d8efeb50d5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT047.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2699
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
