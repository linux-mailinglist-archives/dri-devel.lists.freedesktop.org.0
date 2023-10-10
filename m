Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29AB47BFE9B
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 15:57:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2E3510E37F;
	Tue, 10 Oct 2023 13:57:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2087.outbound.protection.outlook.com [40.107.223.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 403F410E37F
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 13:57:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NXS3510Uhzfx56NCUR9A+ux4NwQcA5dzRrq3C9aCcfXjV/tgcUiPqs5wRBepoShh9c2WNnwigAAIRaN3JzO8u2IU8t3HHpzYvlbrJMJNM7tVwUwTZXdPH7nH2lE4jd6SZsuBFFNasZ9bI/lJHNaE2dhgr56250WOn+1KTt8wmSObBU9trxrLtzF5oGfYda6XRsRfbt36c1JEOu8k08HMl0m5wmxIPqVlFb0tq2RsKV1rv5Q+ZbCt2n4+BRGgmKMQVwLS6psJY3W1GYIsTzD+Hz5IAzbssLrI04q/65cojCZucgA0J0LoBEXa8RWNCN1pO/rVdh0ImB5G7ASWq9Mvjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7lisgzQB9tg/ZmITUV/WMaEnNW/Fa8/WgQhY/+n7K94=;
 b=QQM4pz5DCAQLHRShAXmXr3NLD1Z+5LWa2lyO6VuYCJ+DVGHgsU5ZNjJs5WAVc4TpNd/bMW5EtVV4UiNy45tTcRJ1A1uTmvre/+cqOTaBdkwVhMVMkGORQ9ral6lL4krOuJKqBk1RrJDHx2z3J3ztcfwUxcuX4SvMWM9Fm+TV/NtUA0Bo6PVdd5JdH/pG1DDh0+O/IYnY9ctG0gyiPoI/l8GdJz+4KqEYW3f0k3ZtndmjlMeay/px4HQ7PEYpWz+nDwSNzWINnsgH0VFpBkOBqLz2HkLIGlTzoZ2hcMxrH6zWgUPYMgBHxs5uk3cMbPc77fILxnUkICi6O6A9iojw/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7lisgzQB9tg/ZmITUV/WMaEnNW/Fa8/WgQhY/+n7K94=;
 b=056l8uoUQLsdIfGHXASUDY5rnZVZvhcu6oc3LaOrLB7sf+Nm55whilYirDnOBqhXwsCsNGx3Er5vJDmfJknGCCeojMQQeFLQjK+p/Zths7goMlDwWQvS6AzYhkYuHvZrqC1ihgdi6UfukYhOoe8BEWWZU/qJQK/z2r/JZgQwhCM=
Received: from CYXPR02CA0018.namprd02.prod.outlook.com (2603:10b6:930:cf::11)
 by PH7PR12MB5998.namprd12.prod.outlook.com (2603:10b6:510:1da::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.37; Tue, 10 Oct
 2023 13:57:41 +0000
Received: from CY4PEPF0000E9D8.namprd05.prod.outlook.com
 (2603:10b6:930:cf:cafe::29) by CYXPR02CA0018.outlook.office365.com
 (2603:10b6:930:cf::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38 via Frontend
 Transport; Tue, 10 Oct 2023 13:57:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D8.mail.protection.outlook.com (10.167.241.83) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.22 via Frontend Transport; Tue, 10 Oct 2023 13:57:41 +0000
Received: from hr-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 10 Oct
 2023 08:57:37 -0500
From: Huang Rui <ray.huang@amd.com>
To: <dri-devel@lists.freedesktop.org>,
 <virtualization@lists.linux-foundation.org>, <linux-kernel@vger.kernel.org>,
 David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, 
 Daniel Vetter <daniel.vetter@ffwll.ch>, Akihiko Odaki
 <akihiko.odaki@daynix.com>, Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>
Subject: [PATCH v3] drm/virtio: add new virtio gpu capset definitions
Date: Tue, 10 Oct 2023 21:57:22 +0800
Message-ID: <20231010135722.1142265-1-ray.huang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D8:EE_|PH7PR12MB5998:EE_
X-MS-Office365-Filtering-Correlation-Id: 6feea9b1-dd41-4082-de06-08dbc998df0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EF5cjlAMqYM0ix1FOxTfow7HTKNONx3u5xm5c9tXTYXOYRGXtnOclqcqrjwNoJMNGrdkVpqLGN179Sp8/XXQC7F/nEkZxkvRQB4U6uNdGfuI3y7TOF4X4SJ/Ce9wtLo0PEnQmzwo4CHDMm7fgZ0HUSd7iAUIq0q/XTWYLbJ5qLj+mJbL6IL9pTSnCUHm7rdrOiDffBPybMZACb8OgvuQYIEMvcMojB3dnWpZmC4g7tchlVHXsNoX63q0OIvo2HwiRHRrokpdb1/68FCaG8mDhdcydS5T5bofKGfzEAH+ker7UUqfc6hmQJ+Gqt/xLBsIngmYPdbi2mg88chP64SKLByu87CAQtIdZqXukYCGmsBgSgZzKd1zAPfxZ+OeyIWYfNLe6HYG1zRUP7MVQUdXfKhgWENaoxZsoQcKNSga4c3468CehSgzVwd9bPsilpKrvJVSmeWgvWDwxwCmTcxhsv2JCZ+HYKf53nTwtyGFm7/kyDMSKOCO7nim/OX+aKcco0v5Wu7rMK8uI3LtatEPpkZYigOM7inRsUh5P6mjYE8Vmmaius1WRd2Scf5JHIVGpe2Gsus+RKuJzc1yZGolOOVoB3eiZNgDSixG7r0ve0OoPbFJ7QQebyJPKg7gK48uUhpaABdvUVgcN7d9uaYSc6T+d59s617iZb6IJkT1PkexnVAxnOw01MXfyFjqRnP0L1m4u6C12Vjyzhq9xYHErA9IwP2b6b9/Bf/ZD/aNPQ04ettHnOvmKB/d0FRXQW25NGBl/J9NxNGx9dm2CIEBsgY/l2sxn0rgrVmYzanq+myLDKJ4/Q+ojap9TztHwgO9
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(396003)(136003)(346002)(376002)(230922051799003)(451199024)(82310400011)(186009)(1800799009)(64100799003)(40470700004)(36840700001)(46966006)(82740400003)(2616005)(7696005)(1076003)(478600001)(316002)(41300700001)(336012)(47076005)(966005)(426003)(7416002)(2906002)(70586007)(110136005)(5660300002)(54906003)(70206006)(8676002)(8936002)(4326008)(16526019)(26005)(40460700003)(921005)(36860700001)(356005)(36756003)(40480700001)(81166007)(86362001)(6666004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 13:57:41.6362 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6feea9b1-dd41-4082-de06-08dbc998df0a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5998
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
Cc: Honglei Huang <honglei1.huang@amd.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>, Chen Jiqian <Jiqian.Chen@amd.com>,
 Huang Rui <ray.huang@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Julia Zhang <julia.zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These definitions are used fro qemu, and qemu imports this marco in the
headers to enable gfxstream, venus, cross domain, and drm (native
context) for virtio gpu. So it should add them even kernel doesn't use
this.

Signed-off-by: Huang Rui <ray.huang@amd.com>
Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---

Changes V1 -> V2:
- Add all capsets including gfxstream and venus in kernel header (Dmitry Osipenko)

Changes V2 -> V3:
- Add missed capsets including cross domain and drm (native context)
  (Dmitry Osipenko)

v1: https://lore.kernel.org/lkml/20230915105918.3763061-1-ray.huang@amd.com/
v2: https://lore.kernel.org/lkml/20231010032553.1138036-1-ray.huang@amd.com/

 include/uapi/linux/virtio_gpu.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/uapi/linux/virtio_gpu.h b/include/uapi/linux/virtio_gpu.h
index f556fde07b76..240911c8da31 100644
--- a/include/uapi/linux/virtio_gpu.h
+++ b/include/uapi/linux/virtio_gpu.h
@@ -309,6 +309,10 @@ struct virtio_gpu_cmd_submit {
 
 #define VIRTIO_GPU_CAPSET_VIRGL 1
 #define VIRTIO_GPU_CAPSET_VIRGL2 2
+#define VIRTIO_GPU_CAPSET_GFXSTREAM 3
+#define VIRTIO_GPU_CAPSET_VENUS 4
+#define VIRTIO_GPU_CAPSET_CROSS_DOMAIN 5
+#define VIRTIO_GPU_CAPSET_DRM 6
 
 /* VIRTIO_GPU_CMD_GET_CAPSET_INFO */
 struct virtio_gpu_get_capset_info {
-- 
2.25.1

