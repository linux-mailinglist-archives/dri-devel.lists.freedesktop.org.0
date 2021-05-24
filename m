Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8820538E790
	for <lists+dri-devel@lfdr.de>; Mon, 24 May 2021 15:29:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 948BD6E5A1;
	Mon, 24 May 2021 13:29:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2055.outbound.protection.outlook.com [40.107.100.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79E986E7E6;
 Mon, 24 May 2021 13:29:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cnsfUqIbmKE5u1YGw6n9R9cZUEf6SRVz5O/UwjDr6oUSMSjH5VpiSeJqyEU/f36dK7ap+uI7+qZLClteo9myh7nX1eCTPK+sxv+AeXRTw3pVs9NabGnywPCwDqETUjyPboxHniwy65xhU17Jvgjf9xy0mMTG/xLfTvV74Cbxf+JQY8rXKtmznn4LoeZTihNSweZW7NZA8/5fXVeX5ATwZh5/wdtCiQ21uHs9Lr2B3X7jijOGM9ujlqfxXcCq7eemXlaXLfgrjE4+XFCc0EAKJOclWNpNUxXQZXa3yHf7ztp3AkLWWgq+bwCctJHdeXxXmsaelHMEnSv8zESeVS3HZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rD3uyMV2vClc/Wdfm27HpRUHNcfDummDwIQJycXPjFo=;
 b=aX53YfrOoHXOQKAXNXee1jrKfgBPyXMFRyWMzuZ8BcYzCAHPTX0X3DQqZS9qiTRLx9+/azgWL/hK7j+CyhT+nrj7615RjTWO0tuZqTTJ2FkEYRFa7c259eMLmLcx+/+kQFagZNEYFzsl80urPDdYom6ruesYKgbkq7uIuDZ3jJjyzcMxzsJ7KwbrzyrBQGZoO9OIjBkbpIgtR+DbxSDyOvYoUQXToxLXe4T3Xm8eM9Rj9/xkVF6BMkLjRmnE+0oD82WkJnR0f/4OELjG+FXDHswxjtP2Gs097iChZUYBJ5K3Nrjphj0PuCPPO6MDGJbEGw1qFAw6UzNJFaFRf5mK6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rD3uyMV2vClc/Wdfm27HpRUHNcfDummDwIQJycXPjFo=;
 b=hNbPITK2kbWDRbZVahFPxbzX/sWjX0USAIo0KBhZwfNuj8pqOPJPdlRiOdyU2UJPqJWeJ6WOFcXikS1ZmYEGK7DeX6M2mKv6ql/JXv6R5OXhLa34UXbvNFw+5TH1+/MS3tq9fa8WDf2YSEgVfxMtzcL4cuBayjbGiBs+RzcWXJdvtLYX3FtyVlrjhSZfht+LoYyVDGomjCOrrGVg6UY3HFYIKP8m/+T+kwzU11vLJt/HUevf2ARyJkgawCI38Jgc6KDgIdFjgUFYIsCBy0w+vprWyco0JtP6VJqJjprRbmJKiyuIN87SxYH1Z5vEdoH90y1fA+6CyfzZArRzzM852A==
Received: from MWHPR18CA0042.namprd18.prod.outlook.com (2603:10b6:320:31::28)
 by DM5PR12MB1706.namprd12.prod.outlook.com (2603:10b6:3:10f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Mon, 24 May
 2021 13:29:04 +0000
Received: from CO1NAM11FT011.eop-nam11.prod.protection.outlook.com
 (2603:10b6:320:31:cafe::63) by MWHPR18CA0042.outlook.office365.com
 (2603:10b6:320:31::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23 via Frontend
 Transport; Mon, 24 May 2021 13:29:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT011.mail.protection.outlook.com (10.13.175.186) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4129.25 via Frontend Transport; Mon, 24 May 2021 13:29:04 +0000
Received: from localhost (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 24 May
 2021 13:29:02 +0000
From: Alistair Popple <apopple@nvidia.com>
To: <linux-mm@kvack.org>, <akpm@linux-foundation.org>
Subject: [PATCH v9 09/10] nouveau/svm: Refactor nouveau_range_fault
Date: Mon, 24 May 2021 23:27:24 +1000
Message-ID: <20210524132725.12697-10-apopple@nvidia.com>
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
X-MS-Office365-Filtering-Correlation-Id: 2205765b-eb8b-4c54-b717-08d91eb7e68c
X-MS-TrafficTypeDiagnostic: DM5PR12MB1706:
X-Microsoft-Antispam-PRVS: <DM5PR12MB1706271CCE1EF13DAE1D489CDF269@DM5PR12MB1706.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rskvLXAdk0g+wIvlAKwtGRkUU29asrXzzcVy32niHUT0XosaXbZyZ/FsYSGIEWBX02sLAcTelxJs0HhdHKLhMMzamXDBJpYX+TAKKudGK61Tk0UJk+Sfnip1DmDkGIqQe8cBGecm+Sd1rpHB6GmBKodViUCsgRPtweI5ef4lJEj9R6lQDlElO0Uz+PHGv22XqYuR9CE06Q5XUA8r1XiUB3fbqZpc+Tt+VOlkQLMlWfrxiyRJRDaIAicYP40AN8LGcB2ou+xNbVXPy9ez9G+MZHp/T+30ipC15YPAamJ8/8JmMxyE9qj2qlYDTCWVPUw9aV35XRyeBCLnijpcKcx8ZMA6H7SrWGE2k74zDcl5vZ1egBKvOzRxcBBgJnfa+gW+3sZgNZgTahkwFSUHRhHhzwe/Yu7jviCfFLZvp2QcRGZtHvS4cnJ/4eameoaLUC5mufPqs+FVKDNbM0hjtEwjfca2GODr1u4OwiVf0U6QKZXxH//BBgnOIe6lG97m9auH+SZ0KiqmP8alIgv1pJXPoKr0V+P6s0ui2l+G0nH92x/RWuINuMlbEbYlg13CWcedNoObciq1VKRFd9z26tcaJqR9C5aX6yy8fe2anvdzTpBvEXT9FAhpmK52L0aLI2Li+DtoOIxB8N+bkacWhYatXXzGJd0aCm02AzMX5DVCooE=
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(136003)(346002)(39860400002)(396003)(376002)(36840700001)(46966006)(8676002)(2616005)(426003)(26005)(7636003)(6666004)(8936002)(356005)(82310400003)(86362001)(336012)(83380400001)(107886003)(47076005)(36860700001)(54906003)(1076003)(36756003)(2906002)(5660300002)(478600001)(70206006)(316002)(36906005)(16526019)(7416002)(110136005)(186003)(70586007)(4326008)(82740400003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2021 13:29:04.4496 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2205765b-eb8b-4c54-b717-08d91eb7e68c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT011.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1706
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

