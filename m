Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D91747BF4
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 05:57:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A437810E072;
	Wed,  5 Jul 2023 03:57:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2046.outbound.protection.outlook.com [40.107.92.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10BAF10E070;
 Wed,  5 Jul 2023 03:57:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TJ83Qml7k4yG3mMaRo34lm6yDG9KsL4k1ZvnIxyVmYpkghO/5OU9TW0CduJA64mIm+ofBYK6o+xlBQhoXnQvYJmZ9OxdanII90Jteh6BpcliUD6uMXkY+Ma0fnbtVYTsfdbrInoT288NNznL6airtW5ofe73zolgCuQliG7Sqwt4P0hv5h+nBu2byG3b2ZRbboCgIo2xUvuZHxzUqDf7WzAlOCLnj/ywoch/lcBjHdJ2WMl6YrxIB1xpLDOTkf2aZ/mZ3lPGUFx0/WqAVTwOqgt/LbXZjss/io+SbGizTiWLi9nLsNn1Tv+z5qFvDlxg1e5LaeNNaTXUvzb14rClbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kkZli4EBpEyvkQQBLbjTqH9Zsc51bxkpX093P85VFP0=;
 b=PehBW+SjEXLQIgUwF0+B+9VS60HXXJsOzy+7GXOwFSKrl1bBMptWGXHoPAOWEvlqos7oZp9WaM07qWzDz1V/3kCgky9gz7BY4fqNJFtpxRQUQHtD90UQJjMQJnP9+aJGv2z0TAryyF6uWQ2FSOs2lLT/kPEZw31oybp4wY1WC32QQP8NYt/kVKfc/NX8qzCA9Qpa6MtsanokEKUZdIqjuv/IL86g5FuRCu8P2+i//QMNYeQzvRtc9kBiBDcgOI4x4AQCjzxaRFjiIxzyqBs8Iz8JUHSrCUk2TiB5o5PsSt8r2B2D1AHVBOoqzl636rpiqqHYVMSqyi5frplV+Ofz9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kkZli4EBpEyvkQQBLbjTqH9Zsc51bxkpX093P85VFP0=;
 b=ZTAiXXlcochxWlPC7tivsvauPnFEaxE4UpXpobXDo2ZUU8Oe5o3gwXESMRDMSJb+HuiR722oN0Qr/NW9vrdVxlzm5j31qOEAZMPdGJAQYmpaVS/gNlad8fJenWmrwc8rbn/zvJ8vamqo3bqtbutDbrXOJS5kIl1oATN4qgWfkc0=
Received: from BN0PR04CA0045.namprd04.prod.outlook.com (2603:10b6:408:e8::20)
 by DM4PR12MB5327.namprd12.prod.outlook.com (2603:10b6:5:39e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Wed, 5 Jul
 2023 03:57:24 +0000
Received: from BN8NAM11FT113.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e8:cafe::dc) by BN0PR04CA0045.outlook.office365.com
 (2603:10b6:408:e8::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.18 via Frontend
 Transport; Wed, 5 Jul 2023 03:57:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT113.mail.protection.outlook.com (10.13.176.163) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6500.47 via Frontend Transport; Wed, 5 Jul 2023 03:57:24 +0000
Received: from jenkins-vm-juliazhang.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 4 Jul 2023 22:57:16 -0500
From: Julia Zhang <julia.zhang@amd.com>
To: Juergen Gross <jgross@suse.com>, Gurchetan Singh
 <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, David Airlie
 <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, Oleksandr Tyshchenko
 <oleksandr_tyshchenko@epam.com>, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
 <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>, <virtualization@lists.linux-foundation.org>
Subject: [PATCH] virtio-gpu: Remove stride and layer_stride check for dGPU
 prime on VM
Date: Wed, 5 Jul 2023 11:56:22 +0800
Message-ID: <20230705035622.2841499-1-julia.zhang@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT113:EE_|DM4PR12MB5327:EE_
X-MS-Office365-Filtering-Correlation-Id: f3525032-3a19-4afa-812b-08db7d0bf0d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gDGF6hZvnsKtUpdiXzyD4a9V6MnJTdnqDHG9/uYwlfEYrlxyy2CHdgSxRHkMvRcxK8k51YMHHxUar6aYKdPMPopA4GIRAKh84fk/UT6liZ2bra7FCgp7sso78p+cvHimbBs8eFezAVXd2kvf+MwHVyeY2GYYRNYfoB1DCDSWGagQMxFC8NFl0ArSEOfi//RSPAnvBbkop04pBr954yMgGFkOq2olBmV2/+cRrblKNFI56zrf/VpygFEJLhsMfRFmzfcmvVRPHMDZrCnVS2uRyhHRT/ipS2w5NC0fHhyxkPtqRIm8cc6qJkiroQu922/bQzmn/NkXcFyOCIrX3wW4W+fOM20OyWBGldP+AVxkAKKBJAWzsGiS2LAOQQU+1xJc9odxQtG+URDS5H92Mpxoc4/+MWf9hXkIsonzcC/xbtRLesgqautWPOKd4aozU+19X+fc72tNtMAhCcAc2DOtBX7+1XneGVd17vxIJ2ajB+RTWDwrK0EBaH9sfbU7WvH7fbVnSDFqAaP6+xYD6vCe/OhISebeT25Ps/HwhVBO8pYIlvDNj+rveZOcf3vyZ2SrAJVoTSO7e2wVSUqKSVmg145i7d/ISqTwI23Wtbi+V5IIIo+7tnwIg3m7oo1riTrh9ixJouchQoV10VbBuopEEAI7w+oh9oKHWSnu1UoiI4V/QyfqtUmj60quhgxLyxIGNL1EPLcBTbL8nqzHpsk97wAdNI7g0k3Lqb34X9YKGiSA+Y9aVnsV/mtPDug9yrofxK+tTTZ41OKpuZzy8DiQEQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(376002)(346002)(396003)(39860400002)(451199021)(36840700001)(46966006)(40470700004)(26005)(478600001)(82740400003)(1076003)(6666004)(966005)(86362001)(2616005)(16526019)(186003)(54906003)(4326008)(81166007)(70586007)(36860700001)(426003)(921005)(336012)(356005)(83380400001)(110136005)(70206006)(7696005)(316002)(47076005)(8676002)(44832011)(7416002)(8936002)(40460700003)(41300700001)(2906002)(40480700001)(5660300002)(82310400005)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 03:57:24.1577 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3525032-3a19-4afa-812b-08db7d0bf0d8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT113.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5327
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
Cc: Robert Beckett <bob.beckett@collabora.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julia Zhang <julizhan@amd.com>,
 Erik Faye-Lund <kusmabite@gmail.com>,
 =?UTF-8?q?Marek=20Ol=C5=A1=C3=A1k?= <marek.olsak@amd.com>,
 Chen Jiqian <Jiqian.Chen@amd.com>, Huang Rui <ray.huang@amd.com>,
 Qiang Yu <yuq825@gmail.com>, Xenia Ragiadakou <burzalodowa@gmail.com>,
 Honglei Huang <honglei1.huang@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Julia Zhang <julia.zhang@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove stride and layer_stride check in virtio-gpu so that virgl can
send transfer data command with non zero stride to sync up data from
guest to host for dGPU prime on VM.

Link: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/23896

Signed-off-by: Julia Zhang <julizhan@amd.com>
---
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index 5d05093014ac..4d3f8d36e3c7 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -414,11 +414,6 @@ static int virtio_gpu_transfer_from_host_ioctl(struct drm_device *dev,
 		goto err_put_free;
 	}
 
-	if (!bo->host3d_blob && (args->stride || args->layer_stride)) {
-		ret = -EINVAL;
-		goto err_put_free;
-	}
-
 	ret = virtio_gpu_array_lock_resv(objs);
 	if (ret != 0)
 		goto err_put_free;
@@ -473,11 +468,6 @@ static int virtio_gpu_transfer_to_host_ioctl(struct drm_device *dev, void *data,
 	} else {
 		virtio_gpu_create_context(dev, file);
 
-		if (!bo->host3d_blob && (args->stride || args->layer_stride)) {
-			ret = -EINVAL;
-			goto err_put_free;
-		}
-
 		ret = virtio_gpu_array_lock_resv(objs);
 		if (ret != 0)
 			goto err_put_free;
-- 
2.34.1

