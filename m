Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 704DA75ADA0
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 13:58:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F6A310E5B9;
	Thu, 20 Jul 2023 11:58:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2053.outbound.protection.outlook.com [40.107.101.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DBBD10E5B9
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 11:58:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CES4kZJ7nV9mTACgv9Ldppo2s2itLtnu/WdK+yzk2m7vYSiYieJP3YBbwTquUr1FHW4ux7uyB/m5yeb46D/oThwOCkcJOxAlF1NVkDbr5SQ9vI4D3kxs8NU4k8ekeks6irungSQuUupNX+BfbQeKOOXT/eeLpXp9KIeHUNjhnoXxYoY0FjQD+Vj+h/ITCdCMXa0CYZiCgb7h02Chi+4e4xxhADQIVvIIV8GQOjfMMRN5dcz4joodYrZppsrq16HnaLU+nEhkh3Ys5G4keDhDqs7cvsShEDkNliWSpUMADm7ktPsWbsM1gERakHAVWW1r2dDK/3M2Lufk1pu/83KDvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v4lckvljWvieP4FEFItdXnGbxb7FZyvrEokOl/O+d4k=;
 b=O42DBLUNxi3GsEXj0igfMMU4Ro7Cii+HoCki9BswAYHKR1QiUK+pKYZKZqBB4qvGiQXbk51fNguM38tF0s+MTcvCrmV0a2UMdJxy9lOXwxhBjYAPxdUWGH33X+bPtSVN3XYafoQLbv9Y3HDATY4Q2OcU9NTo1mYdPtaKLBF25cYU0A0IpmnrFDkAhtTruBVxjSd1lQyWmj8h98FN7Xw27ZZTtF4FjaXyqLFffvoBRLiPAcmbR8+KrSe6t7ZKXE7QQk50gnxwX5JhKy9W+IE+7v1lj7rrE7eOMp7XY3Bi0qS0TCjGm/fqAAkLyBOaevNUuZ7Nee28jno7ekYx0itReg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v4lckvljWvieP4FEFItdXnGbxb7FZyvrEokOl/O+d4k=;
 b=pkiAFqCYyBjqgPrUrp4ci3Q/8DzuzUgJpKB7cvZWvZmt9qNYCOr8fSzTa7egET5C+YVjcaU5BNMrG/2QamRKhR5ki64BVFqXdSojJaUzIXyM5sLqRcGnGtMzUqUd1c4UB45Slo3/HR/uZGDdTS2p7791gn76ZpxmGKKHoctfZF8=
Received: from DS7PR03CA0085.namprd03.prod.outlook.com (2603:10b6:5:3bb::30)
 by MN0PR12MB5785.namprd12.prod.outlook.com (2603:10b6:208:374::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.25; Thu, 20 Jul
 2023 11:58:28 +0000
Received: from DM6NAM11FT094.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3bb:cafe::9f) by DS7PR03CA0085.outlook.office365.com
 (2603:10b6:5:3bb::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28 via Frontend
 Transport; Thu, 20 Jul 2023 11:58:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT094.mail.protection.outlook.com (10.13.172.195) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6588.34 via Frontend Transport; Thu, 20 Jul 2023 11:58:26 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Thu, 20 Jul
 2023 06:58:20 -0500
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>, "Gurchetan
 Singh" <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, "Juergen
 Gross" <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
 <roger.pau@citrix.com>, Robert Beckett <bob.beckett@collabora.com>,
 <virtualization@lists.linux-foundation.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [LINUX KERNEL PATCH v3 0/1] add S3 support for virtgpu
Date: Thu, 20 Jul 2023 19:58:04 +0800
Message-ID: <20230720115805.8206-1-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT094:EE_|MN0PR12MB5785:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b1fe0be-0d2c-43ec-872c-08db8918a062
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jXYUFBQ7AEZGF/YlfNS7kzvNQmN6njXu4ny/bPbU3u9ArINBygFdC573q8yhZSs+S/zk3FnO3WE468I7eusXX5gkF8lQ0vOtgxLkr8nTBIjHj6K5uArHs/YorXaZAv9tCbZHArvUVguhwPbHjHSYUAiPSTDZdUsvYYXRxV6tl5EgayFtOvOORgTDW8PH1uO2nABPaMZavPtJgwF18tlw53V/Vff1+zPP/uTqaor0pR7Wk7fKGe3RMrCnFL5r2JwXdmuMfD0pmpUDDl9c2vQPW8CjJoNPt/uTj+u9+sqM6ou7BPsvoUP2g5FyC2XggT2o3qkFL+1q9+LG48mV6dquZbyPZ0Fn5mI0tNx+mUEiXh1ECGOHCipFiZOEAYNyQHlR5MBbPvZ8K3b5OG5kMSRgE/Dk+5s25MFKrRhRb0aVdBSfVzWWdgJgm2UzzzUHlGxELkO0y0aNzowv3KSjb8L38dd9EeNK6PDD2GsWp+P9s7B7U8M01AA30e39mIPPvc4Vr9V1RETU/LuXO+4ZvRDD6qW5NT6uBDYFxx4kq+3UfGnSDG2N2w7Jp549CY6nv5K1t2pbQrR3yRfhQOQaSPCuzzVY0cEnmAoRj6ff7X8Fltz0MEO3/UPBQHclQuP/M9+h092pdifIsw0BmjL0M9iK17MpktSQ8kkRKKnW6W1G2USaaGoYgWPn9tDvkhSE/Q8fFRWM/2b3/TG5JHjf51kkZTCx5BP24IxNC8xTbyS5LN7k33q6j+6eovy+LAygSZcjdOgk+6n/791lSOwYTEzjzwhorV8x1ZapBxNWquijylsjg68eN59Tj3AcY6JN9VWS
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(376002)(396003)(136003)(346002)(82310400008)(451199021)(40470700004)(36840700001)(46966006)(2906002)(36860700001)(40460700003)(83380400001)(47076005)(2616005)(356005)(921005)(86362001)(36756003)(82740400003)(81166007)(40480700001)(4326008)(426003)(70206006)(70586007)(316002)(336012)(41300700001)(1076003)(26005)(16526019)(186003)(478600001)(7696005)(6666004)(966005)(54906003)(8676002)(8936002)(7416002)(110136005)(5660300002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 11:58:26.5308 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b1fe0be-0d2c-43ec-872c-08db8918a062
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT094.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5785
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
Cc: Honglei Huang <Honglei1.Huang@amd.com>,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>, Huang Rui <Ray.Huang@amd.com>,
 Jiqian Chen <Jiqian.Chen@amd.com>, Xenia Ragiadakou <burzalodowa@gmail.com>,
 Alex Deucher <Alexander.Deucher@amd.com>, xen-devel@lists.xenproject.org,
 Julia Zhang <Julia.Zhang@amd.com>, Christian Koenig <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

v3:
Hi all,
Thanks for Gerd Hoffmann's advice. V3 makes below changes:
* Use enum for freeze mode, so this can be extended with more
  modes in the future.
* Rename functions and paratemers with "_S3" postfix.
And no functional changes.

Best regards,
Jiqian Chen.


v2:

Hi all,
Thanks to Marc-André Lureau, Robert Beckett and Gerd Hoffmann for
their advice and guidance. V2 makes below changes:
* Change VIRTIO_CPU_CMD_STATUS_FREEZING to 0x0400 (<0x1000)
* Add a new feature flag VIRTIO_GPU_F_FREEZING, so that guest and
  host can negotiate whenever freezing is supported or not.

V2 of Qemu patch:
https://lore.kernel.org/qemu-devel/20230630070016.841459-1-Jiqian.Chen@amd.com/T/#t


v1:

link,
https://lore.kernel.org/lkml/20230608063857.1677973-1-Jiqian.Chen@amd.com/

Hi all,
I am working to implement virtgpu S3 function on Xen.

Currently on Xen, if we start a guest who enables virtgpu, and then
run "echo mem > /sys/power/state" to suspend guest. And run
"sudo xl trigger <guest id> s3resume" to resume guest. We can find that
the guest kernel comes back, but the display doesn't. It just shows a
black screen.

In response to the above phenomenon, I have found two problems.

First, if we move mouse on the black screen, guest kernel still sends a
cursor request to Qemu, but Qemu doesn't response. Because when guest
is suspending, it calls device_suspend, and then call into Qemu to call
virtio_reset->__virtio_queue_reset. In __virtio_queue_reset, it clears
all virtqueue information on Qemu end. So, after guest resumes, Qemu
can't get message from virtqueue.

Second, the reason why display can't come back is that when guest is
suspending, it calls into Qemu to call virtio_reset->virtio_gpu_gl_reset.
In virtio_gpu_gl_reset, it destroys all resources and resets renderer,
which are used for display. So after guest resumes, the display can't
come back to the status when guest is suspended.

This patch initializes virtqueue when guest is resuming to solve first
problem. And it notifies Qemu that guest is suspending to prevent Qemu
destroying resources, this is to solve second problem. And then, I can
bring the display back, and everything continues their actions after
guest resumes.

Modifications on Qemu end:
https://lore.kernel.org/qemu-devel/20230608025655.1674357-2-Jiqian.Chen@amd.com/

Jiqian Chen (1):
  virtgpu: init vq during resume and notify qemu guest status

 drivers/gpu/drm/virtio/virtgpu_debugfs.c |  1 +
 drivers/gpu/drm/virtio/virtgpu_drv.c     | 39 ++++++++++++++++++++++++
 drivers/gpu/drm/virtio/virtgpu_drv.h     |  5 +++
 drivers/gpu/drm/virtio/virtgpu_kms.c     | 36 ++++++++++++++++------
 drivers/gpu/drm/virtio/virtgpu_vq.c      | 16 ++++++++++
 include/uapi/linux/virtio_gpu.h          | 19 ++++++++++++
 6 files changed, 107 insertions(+), 9 deletions(-)

-- 
2.34.1

