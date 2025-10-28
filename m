Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 682B9C14C64
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 14:09:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1849810E3DB;
	Tue, 28 Oct 2025 13:09:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ph/mM0N/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013065.outbound.protection.outlook.com
 [40.93.196.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9C2710E3D5;
 Tue, 28 Oct 2025 13:09:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NFN07Fjlcb2L9LBJyCKBhd4lQ5ckdsQ7K06FZTPV18q86VbIxTqATUdyUk7crpvYWYJ5+cCQYpiVijBbqFyfBSH2Ul/swivXSk/H1AIMSsqCmF1M8N/6Z6tOZ04LqidJf02v3jgT8kMhHo9Y45hG0TawicPLpJrkQAJhoS7zH+4NYktx5Bd4B54403tNX2IgkhEJCw8nxe7HIlV614tVfypiuUEPmUJAKTQmvoOOlHssukKq1vdekHTViz6BBN/PcifIDij4LvQN3h8qKhRNUOV7oebwQGcZc1EVrsAfg7MHf2Ac/JCPLzu27m/rFUZVAwMa/1bKgk5WLuUVRFoOSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CO09QCGxMyM+4G2aQfT3vWBhJ91P1PqlDXXbuWQ8hDA=;
 b=bbQYK/GoKMHHmYxxwd4f5Ejl+EFBWirVH2PIMRA8sllpVdo3IsQHIzOjGQXpUby1pu736TfK8HMcv7HnLZx/CNUXndYREptPehrKlzPf5zPlf7Pi950C8sNps41yY07iR9Fh5ZPsUVDV3F6txGc3xw4/qZADrLohYT1Dn8OjpJSNq5Xv6Sb+NTU5vxqIIvF2IiIXguAge2aOrvy2/yt1pB67/KhQv3q04xRzf7aDqUhCgh+LZRelNs/0ba3SpiLICRa5sSgl3bCDv2jAkNXnv2hN44N4GyoH9NwDZ6BQpJzietBVzDoBfeqXwpXvjLtNmbbIxi2Dlu6MXwr5GvQxbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CO09QCGxMyM+4G2aQfT3vWBhJ91P1PqlDXXbuWQ8hDA=;
 b=ph/mM0N/gUN0jMeKNNzSBo+0ZGGbKG4MEZNlTCqnH2zkIEqY5H2d1kTLN7azgTashdYru07UAzGF0PxvrK6hmcKVOurqXLssRxRnis9wz/QABBGRkYTXXGKS3PZl4dYQOTVDVAwauD1Pf7xexQPhh5wwSRIvI7uMD/BUThIOIIE=
Received: from SJ0PR03CA0018.namprd03.prod.outlook.com (2603:10b6:a03:33a::23)
 by DM6PR12MB4388.namprd12.prod.outlook.com (2603:10b6:5:2a9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Tue, 28 Oct
 2025 13:09:26 +0000
Received: from SJ5PEPF00000208.namprd05.prod.outlook.com
 (2603:10b6:a03:33a:cafe::2b) by SJ0PR03CA0018.outlook.office365.com
 (2603:10b6:a03:33a::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.15 via Frontend Transport; Tue,
 28 Oct 2025 13:09:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF00000208.mail.protection.outlook.com (10.167.244.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Tue, 28 Oct 2025 13:09:25 +0000
Received: from FRAPPELLOUX01.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 28 Oct
 2025 06:09:23 -0700
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v1] drm/amdgpu: lock bo before calling
 amdgpu_vm_bo_update_shared
Date: Tue, 28 Oct 2025 14:09:05 +0100
Message-ID: <20251028130906.6029-1-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000208:EE_|DM6PR12MB4388:EE_
X-MS-Office365-Filtering-Correlation-Id: 2131296a-9a9a-4183-b460-08de16233864
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Fvhhd/RB7h9s90ql2pWmZaMH6c+JWbNYg+lS4uUchNO3ZfHFBghIS3O+cFeO?=
 =?us-ascii?Q?+zG+sXZNRL1jhvz4lwrNvQqZ9x/2NXSlFdUeFAnwD851+gAahHNCEnxT26yu?=
 =?us-ascii?Q?XIQwjIThSwsdKU2QDK929VRpGkX4tJjTKTFfxabllxcC5sej/xqFockjlMox?=
 =?us-ascii?Q?LGz2G0YFYkTuY53ilIS/50qOMo5S+P2FkQTVzBF5OJ4YeCqobReTKvxLH656?=
 =?us-ascii?Q?OAJtpctNSYDOLMjFUDhGxZuP1su3Vq5JvaGQEVv5jMHaOUlOFXiBaeJ0XR+8?=
 =?us-ascii?Q?aV32HnNWnGGDGjhApIhpvtV2O2UwGKhV5JJ9uKpqjvfziYy9quwfQvLt0eFp?=
 =?us-ascii?Q?UiYW4k1LR8vyD1p0k+/zsg3YcjlH5arrDMTmjCJHJurQTHXqrFQgsC0tagje?=
 =?us-ascii?Q?ev8Ds3aUcNsxQ6IsLB3jJmOOxB0wzouYoXJ3bxRUpaGa9m+6SW+fLqpv7Cng?=
 =?us-ascii?Q?HftpQ6trRbXOFBQ45501wawpFwrELButhAODkbZqO3BI9gmUZawuChdlA6AP?=
 =?us-ascii?Q?2jUP+0inQjbeOGX2OgSdlxtMLl2XnqKLjPW1Sw9fvU5l2TKRwrEez+dVA3I0?=
 =?us-ascii?Q?u9OvXIj/zAXHV1kYtSMsnGqt0sTLdyB5TiupLuyHzEtJ1tR+T/MomL8az96I?=
 =?us-ascii?Q?fBd1R3VEmL2KLDXW7ku3sNBA//QEjmA0PCIRZdeTkGMvy4xN8uZPwcS7pE1N?=
 =?us-ascii?Q?9GajLzPE+Cqj1Eo/1mKQSQOGiRJAmHzVR39ziRQnu57KEWzQRXEbWXw+N0qV?=
 =?us-ascii?Q?RWyJXrvZyQ93eZtf8RzmNlIc4KC97vHoIDQhlWSqtOETOGK43P45wLQZMu0k?=
 =?us-ascii?Q?91yF2n042BgH7EJkRDPnhNUkiORimkmwDlKvGD8RU500/h3ZtVJoWvoUXLr+?=
 =?us-ascii?Q?muKMdxl/4yPM4UdQIa2aqT4EXjVdsGy+hXurLa4HpjbBs2I1pFOuLB+RflOs?=
 =?us-ascii?Q?d2V5Y2qU/p1Mif7tWWWY4Q417UR/mFlsnizLNjD8yABLWMTgFDMcMpkIm2ii?=
 =?us-ascii?Q?INRMo0DrU2W4lMCsVPWedJtuRTdXyhIK5309jTqYZL0evT4a2QIhSwTDPvJp?=
 =?us-ascii?Q?la0BjqAeyYZgJBP4walbpC3f0smj0j1GIyZZD+mscCQANUkDAcBJbmLHEvE4?=
 =?us-ascii?Q?7/ka7DAx9I8gDpOzF9b4GXnl3JaL/YbBjO0jyAPjlnAjW2a/tdtnIcAsUEG0?=
 =?us-ascii?Q?uRTyP1DxTnZPI0XplfbsCkTiqneuRkmhZYfqyGyUNByIe53fBdCECwkzRqhu?=
 =?us-ascii?Q?epV8eTZTtQUT0gxe0E24AgqqAOfEcBp2HwaktP72ogtJ+TpakQzNb1OuiNA4?=
 =?us-ascii?Q?GYZHYIPsO/aovfBR9VUVAS2F4+Co8nnf9e235dhIRbzmC3LWAh6ZN9KHNVrS?=
 =?us-ascii?Q?WHp6NvsYxMg84sqrxqldiogG+yee1Ntx1zAMZPoq8cszrZ8hb4tV6PlB0g6n?=
 =?us-ascii?Q?qKmwSOGYkCsDL7XhqnIp5PwDG0rTYRQ8d32KrbRA/sUVf4VW8Kp7kEsRxctN?=
 =?us-ascii?Q?C4QfLY1QnW9jfAxrR3+uFPd6ERkOevmNDcvtWr8Nedw9npLqP6Wc/8OClkj9?=
 =?us-ascii?Q?yZb/ci1o1xdrbhv8iS0=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 13:09:25.7647 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2131296a-9a9a-4183-b460-08de16233864
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF00000208.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4388
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

BO's reservation object must be locked before using
amdgpu_vm_bo_update_shared otherwise dma_resv_assert_held will
complain in amdgpu_vm_update_shared.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
index ff98c87b2e0b..830412f04b6c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
@@ -81,13 +81,20 @@ static int amdgpu_dma_buf_attach(struct dma_buf *dmabuf,
 	struct drm_gem_object *obj = dmabuf->priv;
 	struct amdgpu_bo *bo = gem_to_amdgpu_bo(obj);
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
+	int r;
 
 	if (!amdgpu_dmabuf_is_xgmi_accessible(attach_adev, bo) &&
 	    pci_p2pdma_distance(adev->pdev, attach->dev, false) < 0)
 		attach->peer2peer = false;
 
+	r = dma_resv_lock(bo->tbo.base.resv, NULL);
+	if (r)
+		return r;
+
 	amdgpu_vm_bo_update_shared(bo);
 
+	dma_resv_unlock(bo->tbo.base.resv);
+
 	return 0;
 }
 
-- 
2.43.0

