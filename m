Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BE0738B19
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 18:27:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A381F10E171;
	Wed, 21 Jun 2023 16:27:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2053.outbound.protection.outlook.com [40.107.243.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B92E110E089
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 16:27:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cWRiuaWxM/EICHpKkf/wPb3X3tY5jtsLIymMZmB9Z7cVBbufS9mu+vhFkIq6o/PAbKqto7Jm0vE9CD2+qVEjCAzxjGvZoIzTYTAIsS0yQOR9FtlQSMCS5oTO+bZ9bY3p/5sXqd1lgFErVrOtXGcvQYaMAuFsWmrMAic4LBOuzWeglC7UTQm6fgbAcigEqS48NgyE8nAZGMSwJJkosQV+fBDU+TSnqRVFfxBgaO7KWKzzjreWX1mZ4DAqUolKVRRBIYgFDlh5Pd7hxWx5Fy6kivxUJCcOyE6/u1id18W+vJNQmwNDaS5LOVXV8r2dhxqs8RJg9WQdanB5AazMtHdC2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5jQDhW8GQ29g2L+bXQbW5CBLjLkTIEG0ZiU0yQJAibA=;
 b=ABaes1T+qxV9udCa9UYgKONBde1ve3L7ZbB37UtNCcI/PZ/XPR8kuOuTKoITpRXA6kc41h+TZ+sGmLS0R/9Rl/tr1Vhl6fxe6sJAC8igQFInKD7ENKPoxjrD+F7COHOEi/NfOs0gcOmTcYRcUTeZ1EPpXRVg+Taf8nMvjnkdh1vnL2yufUs0tCPZxIvBx++WIA3z9zpj1/uugYYP3zsuUu2DO8iCHvDU/YrvxNuVKT2KiLK69NFIVvxQAvh+6040MIqNJMSwt8MrsYguvG2/cRjxMNZ6ZBfFe8jE3rgDuCbDNvygjsFWXRNbujUmNfou1D3rN7rwlGMVRK0POe4DeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5jQDhW8GQ29g2L+bXQbW5CBLjLkTIEG0ZiU0yQJAibA=;
 b=B0TNcOT8M0aY6KddtVT15m8toCPxn5zmV+IJt/YC5G19HH8FnwAjKWMLAMhhCXTP/OUz4P7leydPU4wmeDmGtOBG2+MHh988Ev8xlxQoc4/1w6lLaP9N5bSi65ijWwx7Thz7UTjXWZELDhL563c4PNhRnlCfVigHfs+CXx6j7Rs=
Received: from DS7PR06CA0010.namprd06.prod.outlook.com (2603:10b6:8:2a::17) by
 SJ0PR12MB5635.namprd12.prod.outlook.com (2603:10b6:a03:42a::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6500.37; Wed, 21 Jun 2023 16:27:14 +0000
Received: from DM6NAM11FT070.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:2a:cafe::39) by DS7PR06CA0010.outlook.office365.com
 (2603:10b6:8:2a::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23 via Frontend
 Transport; Wed, 21 Jun 2023 16:27:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT070.mail.protection.outlook.com (10.13.173.51) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6500.40 via Frontend Transport; Wed, 21 Jun 2023 16:27:14 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Wed, 21 Jun
 2023 11:27:13 -0500
From: Yunxiang Li <Yunxiang.Li@amd.com>
To: <dri-devel@lists.freedesktop.org>, <Christian.Koenig@amd.com>,
 <Alexander.Deucher@amd.com>
Subject: [PATCH 1/2] drm/amdgpu: fix missing fence reserve in
 amdgpu_vm_sdma_commit
Date: Wed, 21 Jun 2023 12:23:43 -0400
Message-ID: <20230621162652.10875-2-Yunxiang.Li@amd.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230621162652.10875-1-Yunxiang.Li@amd.com>
References: <20230621162652.10875-1-Yunxiang.Li@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT070:EE_|SJ0PR12MB5635:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a6eef96-7f6d-431f-1679-08db72745f83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TkY2sVeS3Nh+veYL3a2+FOXlC5xtdh2QIzq5MY8jZwgEKjk6hHYGmDfqeVUEGy/dfKiVnL12hE1QnHxcIropmdcpuSGDkw28admKPeEWwxlMSZU6ZsuFW9z52/sT0qpdUPPVg3NsFs7njXbEMomv02XQjQNeGumGkB46/pilGZ9BdvMk3FkFDd8fER2ZSNU8hig1G3Rt/5KtpgP9Z/P5tJFM75AaAVwQfmzUJ52Sg/LeKbO4DYxtvGYKM2XzhMHJrFXoNbR6/ACc/9xTkCA0hiXB5eECD+q3y7CKkQT4/xTObgeTBVEIgmGDWb6QGjjO1KZh7Yoxi7x8qu54G9SXMl9vV6ToemmGuZJJIrHWoAsl8G3bXLXl+m7BMaLP9QOvISMTYK1xnpYmoRrK2e5TeunNv7x6tAuzG4qo2T39/KRp8vBeM2V9BwAbzU2lEJq4u2CkknV+tjIzkVSVQ4UpnkiaABVStZ60/JTNI/qJ2vu1M528QbEpXIRTW9i9j7wqs+cdm/rIrm82EfbYBMG+LedIOCbV8FIi3oOpaGIPuliv2SNX2sn/o3xFLrYpCZn4+RHB2SrLDh4wL0mZ9rOe1SdCgi2f7uypL2e8XjcbLN13bqTXrqqcqxCL4SUPs/MqpWslOAVlaI4qfTA0By4eFM/gu/MdnxtafoqRz78x+eo3jEb5KWgl097pvKXxEm641RXMOVJQAq3eGTnl1YLl4g5qAtXL6MM1gzU5+Hq+3BA2RrWfXbBkSdvLtvAQuvzF98IbvXYvi32uISE+tdJ3b8p162wBfZAJ+xGnVZwC42iyQDpHtgFrNDobXZLAImtp
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(136003)(396003)(376002)(39860400002)(451199021)(40470700004)(36840700001)(46966006)(426003)(336012)(5660300002)(8676002)(8936002)(316002)(86362001)(41300700001)(47076005)(36860700001)(40480700001)(83380400001)(2906002)(40460700003)(110136005)(2616005)(6636002)(36756003)(6666004)(186003)(82310400005)(16526019)(4326008)(26005)(1076003)(82740400003)(81166007)(70586007)(70206006)(356005)(478600001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 16:27:14.6475 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a6eef96-7f6d-431f-1679-08db72745f83
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT070.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5635
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
Cc: Yunxiang Li <Yunxiang.Li@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When amdgpu_bo_fence is converted to dma_resv_add_fence, the reserve was
removed in that process, so putting it back.

Fixes: 4247084057cf ("drm/amdgpu: use DMA_RESV_USAGE_BOOKKEEP v2")
Signed-off-by: Yunxiang Li <Yunxiang.Li@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
index 349416e176a1..f590b97853d9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
@@ -120,6 +120,7 @@ static int amdgpu_vm_sdma_commit(struct amdgpu_vm_update_params *p,
 	struct amdgpu_ib *ib = p->job->ibs;
 	struct amdgpu_ring *ring;
 	struct dma_fence *f;
+	int r;
 
 	ring = container_of(p->vm->delayed.rq->sched, struct amdgpu_ring,
 			    sched);
@@ -135,6 +136,9 @@ static int amdgpu_vm_sdma_commit(struct amdgpu_vm_update_params *p,
 		swap(p->vm->last_unlocked, tmp);
 		dma_fence_put(tmp);
 	} else {
+		r = dma_resv_reserve_fences(p->vm->root.bo->tbo.base.resv, 1);
+		if (r)
+			return r;
 		dma_resv_add_fence(p->vm->root.bo->tbo.base.resv, f,
 				   DMA_RESV_USAGE_BOOKKEEP);
 	}
-- 
2.41.0

