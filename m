Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4458296B2
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 10:57:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B03E110E593;
	Wed, 10 Jan 2024 09:56:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::60b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABF2E10E593;
 Wed, 10 Jan 2024 09:56:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=StNIPGDYUoZtB3dBQ9rKrxT14/pyd2QruX6d6NO+hmDsCUoiAXhMqxYcRHLVLy+K9DbPStW/WmlAZQU1QsbodloLdylerttmxNWOVnR6kTFpEN5bWRIq19KiI0exgUYcVP77TQwYJy0csgMh7GOUgvcfNpceH83tXdBVzweEZWay56WDB2CSuN8TRUdbNAuFzegy9Qj3BmsWU3wwPtZ5dcf5H0S2E5ii3GV4Qm9s+OP0A6jqvXagrrkXKVP7zKrj1bW8il8GZBvhFaVto6D5C3icBNUl7f4Hvje3qszwTGaXyWp2+ko6ZYN8LbnfCvgYHh8YsDoKWj2nurHPUjshcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b/cfS3KQMQVpEL831Ezu1yw2BuuTIvLrxvn2VFTtMTU=;
 b=kz+1p77eI5PYX7H+UWf6khkf9aesEh4avb7izYQiCkYVo1z7boSaz2j66FunBkD8Q0PuhqIBRaRdPTSga47MybPIq73mr6Lo+mmQ18kAtnBZ+V49W3SmKOrUptPwL3AIMcEF1n9POLlQ0KS2FeiflfAyluEQp+SdN24VagEGZeaoGHZnukdAHK2fIVTFsGomC1W7sHDYYYzCVw0mzjt14pIVKGbq7R6WvsC8p58oCiOlW7KXoXIoEKbbwRU4R2CGRICTFugMXT5b4FP5CAvraN998MxfifY5g8rsyWNHEXfMYoxeWTWPtxScs2739HWN6Z9AZ8oBVIJruhk129Shfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=chromium.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b/cfS3KQMQVpEL831Ezu1yw2BuuTIvLrxvn2VFTtMTU=;
 b=5Ec0NjNiU5hzcISj7ZGCRWS3qGZKKOpJmZkZIEL6z6nVcRyWXemlUjhhyxW8jBIUE3ouNYB91yKcaMkT6ZDRHTJYf64fjgc0UJQxGacQTBr5/kLxkjVgHxLrlY3jBmsD4gGfaxhMRSioOfu2trtw+IEuWBYS3mG0FN4aQvPqA2k=
Received: from MW4PR04CA0295.namprd04.prod.outlook.com (2603:10b6:303:89::30)
 by BL3PR12MB6403.namprd12.prod.outlook.com (2603:10b6:208:3b3::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.16; Wed, 10 Jan
 2024 09:56:55 +0000
Received: from MWH0EPF000971E9.namprd02.prod.outlook.com
 (2603:10b6:303:89:cafe::3b) by MW4PR04CA0295.outlook.office365.com
 (2603:10b6:303:89::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23 via Frontend
 Transport; Wed, 10 Jan 2024 09:56:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E9.mail.protection.outlook.com (10.167.243.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7181.14 via Frontend Transport; Wed, 10 Jan 2024 09:56:54 +0000
Received: from jenkins-julia.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 10 Jan
 2024 03:56:49 -0600
From: Julia Zhang <julia.zhang@amd.com>
To: Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, David Airlie <airlied@redhat.com>, Gerd Hoffmann
 <kraxel@redhat.com>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <virtualization@lists.linux-foundation.org>
Subject: [PATCH 0/1] Implement device_attach for virtio gpu
Date: Wed, 10 Jan 2024 17:56:26 +0800
Message-ID: <20240110095627.227454-1-julia.zhang@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E9:EE_|BL3PR12MB6403:EE_
X-MS-Office365-Filtering-Correlation-Id: 744cff6d-0c5b-47ef-16f0-08dc11c279ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OK0+8rkRbCvYMmM77eV+mdBBsvw4NpIUNV/V2yeyd7uBQWOIEym7CduLsbEWZ0HN45Ggn3o0uXIcs5fBziZHQDXf185rXhhJaSpUd/GLBHTAj8eB1ICXUlWKwYLj2YRx/RhA/wJ2o6pmHHq41rzuA5uiPSXHkaVI87L5WsNmKVcqMn4PuL7drr7r0oe0tc5n5BfKbS5oSlP4kiR/t8VxSFZbLpgxWh8lDMQc5kjVhDPclUdDh8uTn7ZbJrLdGImBOYzbjWacBPFoC2QpPpJ8G/Qt4B2W3K94spGRBLydTs3mNE19+tWGae0x43cdgefaCYYAFuQqmEvlSQgBtSjU5g2xzdB0z86MOLwZl722S0QETY4Wsqx5HxSXohrZ3XbCF18e0N/8e/ydn8hUuSeCEWAC/pICaxqkrm6KqOD2HOU7b2kP7R8ekfMqwtaa0h9d5SiCzJfzMS99gsxuELvEOCsKFcOZZF8jA2nFadolsPXYlj66P2MQOniVwhX0uC/jXvelsCi88je9+tpaLLhXPoPIiaJJ6Dom3hPyfj31IH2vWXSFmh4LSpg7VM1hsIvJ4H2Jft2vdfodEoHOXMwk9tkDZhYoMsFWl0ALnTDEeZ5YTSrfic+LFrQI5npf/JrVC6eDdejgoglyYo0m0HuSsF2ci1NYKakEui9eui1m2dUsi4BtZoV33fRkSurztAlVfyruGMp8HuUNcflvrgRvlL+ZYXg7bfaU8AYp07CRjSrEz2p62b0OgglNm0TCHR5AZ2voupF++ztEfZfSrfBD1A==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(346002)(39860400002)(396003)(136003)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(82310400011)(36840700001)(46966006)(40470700004)(16526019)(36756003)(83380400001)(2616005)(5660300002)(426003)(336012)(26005)(1076003)(47076005)(2906002)(8676002)(478600001)(4744005)(4326008)(7416002)(54906003)(6666004)(7696005)(8936002)(316002)(36860700001)(44832011)(110136005)(70206006)(70586007)(356005)(41300700001)(82740400003)(81166007)(86362001)(40480700001)(40460700003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2024 09:56:54.6293 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 744cff6d-0c5b-47ef-16f0-08dc11c279ff
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000971E9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6403
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
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Erik Faye-Lund <kusmabite@gmail.com>,
 =?UTF-8?q?Marek=20Ol=C5=A1=C3=A1k?= <marek.olsak@amd.com>,
 Chen Jiqian <Jiqian.Chen@amd.com>, Huang Rui <ray.huang@amd.com>,
 Honglei Huang <honglei1.huang@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Julia Zhang <julia.zhang@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To realize dGPU prime feature for virtio gpu, we are trying let dGPU import
vram object of virtio gpu. But this feature would finally call function
virtio_dma_buf_ops.device_attach(), which was set as drm_gem_map_attach().
drm_gem_map_attach() requires drm_gem_object_funcs.get_sg_table to be
implemented, or else return ENOSYS. But virtio gpu driver has not
implemented it for vram object and actually vram object does not require
it. So this add a new implementation of device_attach() to call
drm_gem_map_attach() for shmem object and return 0 for vram object as it
actually did before the requirement was added.

Julia Zhang (1):
  drm/virtio: Implement device_attach

 drivers/gpu/drm/virtio/virtgpu_prime.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

-- 
2.34.1

