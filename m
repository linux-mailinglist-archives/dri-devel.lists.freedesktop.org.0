Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4BAE46A527
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 19:53:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44DDD72FBF;
	Mon,  6 Dec 2021 18:53:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2058.outbound.protection.outlook.com [40.107.236.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD7A76F8C1;
 Mon,  6 Dec 2021 18:53:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GZIP7BVnGYEHAt91tegPBWyDCoX399JMM9mK6Un9ueU/UlGg6NjcqBl0yOSr7ARtSZilQ7nO9opmLBlOODlUwbevb3RfKyZORdBKjprpU5E4K8JnCGSSEtl0ZgtroN/5kwAKyNjpuEjEpopxl1kr7f/pYiRLzA9oENP5/kUak04+VtNgPdsK6y3sxq8/Y48koHHNazrUEdfkX8mhtmHEjB0v1fBl31AzuMc5Rqeqno3IQFX2ngJYEVDTU2m7VaTu4D9EeaeplMtEyJA5pKNh1ZIlDbhRATkXnoEoP5w2/vsFxTvQOEtXBdSrganxTI0qfOX5xhclpg8KCZBCuOBXeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5XOWr7fnVYEba5NhGZxd4trx6OZFuB1g3xD2zb3WjmU=;
 b=VENmHqOkv2qDlBXK5moXRkWwOz8f2d2CP5kuqv6OrlYZipP4XkUeLF3bCkU33QutCwNycLP+b1NB4ywuePh61+pvTPtJ+Uh90JYgMHxIwMzbFI2WcSNaQE8qC77wc+x1UVWI6oP1QkGWmwVGQfDa33GQG7PzfO6bDm+ntzilngs/lxhav4pPInJBPEEoNKw7SkLLRB+88MoVNsIyJCxaMk711dw5KwjYz+ewFl442V4KeMLc1FlwSQF+7jCMTbyM/qdKRZUipQNmg5I+ZJHp6x6HFhPaTGT2PfQXcGwijjbtxn6MMJHm8raYiKnVimDsLg7sZMR+uS4n7aYR12ZgWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5XOWr7fnVYEba5NhGZxd4trx6OZFuB1g3xD2zb3WjmU=;
 b=yZs7t7bb3STzmmyCs3/ss8kOm2jcOI2gMhGjk5GJmnG0eX0VgLkH1S6QaUWuMgvwHQUtlswzl7Nv4C24tZm79R/tn353cQzKwO0aUzw66fPRVUfYQseLN+SkQ685VWO8YdgqkYNNmY276AVAH4MV/cM5ATeg5mkQF6gxJle0KSU=
Received: from DM5PR15CA0052.namprd15.prod.outlook.com (2603:10b6:3:ae::14) by
 BYAPR12MB2710.namprd12.prod.outlook.com (2603:10b6:a03:68::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.11; Mon, 6 Dec 2021 18:53:05 +0000
Received: from DM6NAM11FT050.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:ae:cafe::40) by DM5PR15CA0052.outlook.office365.com
 (2603:10b6:3:ae::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.20 via Frontend
 Transport; Mon, 6 Dec 2021 18:53:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT050.mail.protection.outlook.com (10.13.173.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4755.13 via Frontend Transport; Mon, 6 Dec 2021 18:53:05 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 6 Dec
 2021 12:53:03 -0600
From: Alex Sierra <alex.sierra@amd.com>
To: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>
Subject: [PATCH v2 05/11] drm/amdkfd: coherent type as sys mem on migration to
 ram
Date: Mon, 6 Dec 2021 12:52:45 -0600
Message-ID: <20211206185251.20646-6-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211206185251.20646-1-alex.sierra@amd.com>
References: <20211206185251.20646-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 12d1a91b-78b2-4dec-e419-08d9b8e9a341
X-MS-TrafficTypeDiagnostic: BYAPR12MB2710:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB27100062F5A77A2787AC33B7FD6D9@BYAPR12MB2710.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8z/lr8kVp1v1JKkwQHJ4udR5kH6s2aqZm8SB+TYpaDiJBwtLUst0197nlEr5cOCFtIlAnu5exc1GrB+0GgNSsgvDM9yg/F/X6Z3SxliDXqqyvJ92DXNP9zdPh1s3T+LSbHa8HDI+Wxfb107tW6oyfOkeC1120jQ6+aVfwzd0SsQ+2jeuMU6IN04vOngE8sa/PV2fnfAKNF9EvCEoMi89sPxrk2NlhwhnEcTYWU79JVWbX+nZX1rUxUX1T7V1/gW2RXmAX1RvyBKZt2uHOHVwYRWPI2Ybi7+nnFZaKj7d49SIPVJuu4Hu4wUGsq7xGv0eUX3x4usN4aKh6GJX8SEuc6MATAfmsK81dv+NUnSAzeu/JExNC+SF0gNqCJO0FaWTQEpb3YmnpBEyePMP8w/TG60nzD88tG5ZIEve5ihMti8+rhCepKOpQ21SJiTsikJDX1dVhPI1ACa0cr8mmNODrqqYDSdyt6g0EeCKgeSrHdi57KMgTe4vV5hNUtkrdxNVeCox4rFHHgoc2CKZdoXdTeo/r4GStRR4N1LdGjbGMK2lV5m2TnQ/Dmu3QsrDJ0dBFP3h/Ykn9dYwJFtm52bVrzgj4zoiHCGkz8Ph6QYJpsMIf4fwUMLaT0xM3fiQriqBMzKDac630DXPz0VF7/d9qpfBXhNpTAAk3IQfW2KWoyKjEJ7O/Y7Ixtlmst08GiZ7wAs6qI4l4IQwT0p1Ow9Ir2eARPRIDVh0imNv0/ibVrtl7QoepqKrr/zku1cyxHDp7bxgCIGmgMoRD69SdNSRr+Wc9C6U84RBKntyC05YKHI=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(40470700001)(86362001)(70206006)(82310400004)(2616005)(336012)(81166007)(4326008)(70586007)(356005)(8936002)(110136005)(5660300002)(40460700001)(26005)(54906003)(2906002)(186003)(508600001)(83380400001)(47076005)(16526019)(44832011)(6666004)(426003)(1076003)(7416002)(36756003)(316002)(8676002)(36860700001)(7696005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 18:53:05.4749 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12d1a91b-78b2-4dec-e419-08d9b8e9a341
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT050.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2710
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
Cc: willy@infradead.org, apopple@nvidia.com, dri-devel@lists.freedesktop.org,
 jglisse@redhat.com, amd-gfx@lists.freedesktop.org, jgg@nvidia.com, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Coherent device type memory on VRAM to RAM migration, has similar access
as System RAM from the CPU. This flag sets the source from the sender.
Which in Coherent type case, should be set as
MIGRATE_VMA_SELECT_DEVICE_COHERENT.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index 9e36fe8aea0f..3e405f078ade 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -661,9 +661,12 @@ svm_migrate_vma_to_ram(struct amdgpu_device *adev, struct svm_range *prange,
 	migrate.vma = vma;
 	migrate.start = start;
 	migrate.end = end;
-	migrate.flags = MIGRATE_VMA_SELECT_DEVICE_PRIVATE;
 	migrate.pgmap_owner = SVM_ADEV_PGMAP_OWNER(adev);
 
+	if (adev->gmc.xgmi.connected_to_cpu)
+		migrate.flags = MIGRATE_VMA_SELECT_DEVICE_COHERENT;
+	else
+		migrate.flags = MIGRATE_VMA_SELECT_DEVICE_PRIVATE;
 	size = 2 * sizeof(*migrate.src) + sizeof(uint64_t) + sizeof(dma_addr_t);
 	size *= npages;
 	buf = kvmalloc(size, GFP_KERNEL | __GFP_ZERO);
-- 
2.32.0

