Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E215727770
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 08:39:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7BF910E43F;
	Thu,  8 Jun 2023 06:39:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2060.outbound.protection.outlook.com [40.107.95.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BD2B10E43F
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jun 2023 06:39:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BLA1/oX+x/PyhZi6Vfp5Yeh1jcmyb3uH60pIifiMXRqJ3A2KfPT0yoj7Z7pjybsmj60LXegC+/YzRIkdzMvS37jOUm//u8sxQVpPmxC0PpT5O+6l3hgGIPjrhGhiybNvE5gXDxL4bxzlnFlOgPdoTxEX/JwPVYe4zaHC7UJLH4t9b565glZDyj46SryoIcmO51akGgL9Cnuy5sIfqHlTxV4EK0aQc3FNg3xWl1COI6pSbxpszDkKfA2QRibyNaO/nfoemdsQ5bvc3up7++ROqmv3RKf+xjvgFZHnIYXKTG6sLRZp9VGK2FDXgWJUQ5iPKr4mAWtge8aL02hEo3XXRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1UJZo7DxsPMnt083QgXmO3D2aIxk1wWdHIMn8hZzztg=;
 b=b6VSdNHpkXc3UbARS4Meh9H6aDqhRm28EwSD8RT6TbnrZ3YvEvBHfdo+2GhlixJkyMF7jFWuc5osHRINSqSw1hItIyjth4zHWMECu6zeC+3ZXX6eHaL+ZiiPOSkNrjXVWKAR2ljTI318LvDMW/LLXedz6NToCm6WXv7Oz1vfKnBHtclcz55APQbIG7NbPHHeIQjCGQYVZHkO2X2b7olfd9vnSQ+srPmG25V9GRUmuWQOIjtakfcek3CFY2AD8C5gE28gkg3iOnrN+xqfW1DjEkmDdZKvNjKWoGgl4MCzpiGDOcATq71mVw1+rTYBUumENIyWNWVGAZ1qFJU+bNtD0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1UJZo7DxsPMnt083QgXmO3D2aIxk1wWdHIMn8hZzztg=;
 b=cW7NCLFfQDlmoNcAGkLr9DFDEwva0MZg9d2XugKHZZIdqFMwI/kS4g9w60V2UripT83FJ9edscxEvazJQmshCkI+EJcLazAAwZpYxuIqepsXrxjGw5KIHYU8JAJm5JmCfakVxl9/i1D5oQZGs+AiMVF0ZxyhjgmDI1UbQtmfM9o=
Received: from DM6PR06CA0082.namprd06.prod.outlook.com (2603:10b6:5:336::15)
 by MN2PR12MB4143.namprd12.prod.outlook.com (2603:10b6:208:1d0::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Thu, 8 Jun
 2023 06:39:49 +0000
Received: from DM6NAM11FT058.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:336:cafe::d) by DM6PR06CA0082.outlook.office365.com
 (2603:10b6:5:336::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.34 via Frontend
 Transport; Thu, 8 Jun 2023 06:39:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT058.mail.protection.outlook.com (10.13.172.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6477.25 via Frontend Transport; Thu, 8 Jun 2023 06:39:48 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 8 Jun
 2023 01:39:43 -0500
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, 
 Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
 <roger.pau@citrix.com>, <virtualization@lists.linux-foundation.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <xen-devel@lists.xenproject.org>
Subject: [LINUX KERNEL PATCH 0/1] add S3 support for virtgpu
Date: Thu, 8 Jun 2023 14:38:56 +0800
Message-ID: <20230608063857.1677973-1-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT058:EE_|MN2PR12MB4143:EE_
X-MS-Office365-Filtering-Correlation-Id: f2f4f0b8-55dd-45e7-4138-08db67eb2817
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ln5c5JwgQp4z0mzXRHycb7Vh0WPcAjrNz0CghYRlb2YRx519G+hutEwGJeHMaQft0wVTH062EtFTSOPqFOdKJkOz+m1eWDSvbuHBSy/LAagk65Zx6bqn2SzmAopnkAR+WSXB8HnSU8gMJk3La3Xd6wTCdDzqnMkS3UNMU4q67RbsNEDXEIS9fos10Ke3vH4dd5vEOQ5lPl2lNtlCTN2Y7I2dLSKlt9L9lMPvPErsOlK08EkbCRbEBGJFHISTTXmTBGvgc37sjr0xvtVxM12QZETL5ycIUesYsqw99gI2rPJnwWcdjvZZ/TcLRz1Jx8BO6LP1x5AdwWopgBByQIMs9wTNvsvnFf9qOMpUFt9dl28HmDOWD2mDddcFkBRZmzC47q7PeNVe5BR1IJUpFxI1YiOgaooxxJekTU9x5bs0ANsR/u7xdq5izYyZB4NYrzSqwmXPgX/kXjbziuaC1O/if0q8Bsh8shnN6SNqIlXtFGYxjb+5sJxP3rvHiUiK+6YwQg0JmNaR4+TJYWGZzykBQjiMLr5EPqDscxocGx3Htv+VTbGZV+QUTbnx6vVrRX2ch63iqOu6p2eQNgHDNXjb04UucaR1dQfssjW3Y/NausClkSDZsO5kUZz1LJ2nMiLSPZQANJZHMcg9P0ugi2tLaI3MRSsNBOBfM3tex+tRxlH/lV5FoobSRw6T7k8jgnvJS/JpFFGsiAI7G2DQnWD8bwC1Cov/CcpCBTAaxYsnx/8zU8ffCo69Et5W+QDp0nisFPUb6FQb7NJ5iRhvXD0G5w==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(396003)(39860400002)(376002)(346002)(451199021)(36840700001)(40470700004)(46966006)(41300700001)(6666004)(40480700001)(36756003)(966005)(8676002)(8936002)(5660300002)(110136005)(7416002)(70586007)(70206006)(4326008)(54906003)(316002)(478600001)(40460700003)(2906002)(7696005)(82310400005)(1076003)(26005)(186003)(83380400001)(336012)(47076005)(36860700001)(2616005)(426003)(356005)(81166007)(921005)(16526019)(86362001)(82740400003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2023 06:39:48.9864 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2f4f0b8-55dd-45e7-4138-08db67eb2817
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT058.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4143
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
 Alex Deucher <Alexander.Deucher@amd.com>, Julia Zhang <Julia.Zhang@amd.com>,
 Christian Koenig <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

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

Modifications on Qemu end is:
https://lore.kernel.org/qemu-devel/20230608025655.1674357-2-Jiqian.Chen@amd.com/

Best regards,
Jiqian Chen.

Jiqian Chen (1):
  virtgpu: init vq during resume and notify qemu guest status

 drivers/gpu/drm/virtio/virtgpu_drv.c | 32 ++++++++++++++++++++++++++++
 drivers/gpu/drm/virtio/virtgpu_drv.h |  3 +++
 drivers/gpu/drm/virtio/virtgpu_kms.c | 30 ++++++++++++++++++--------
 drivers/gpu/drm/virtio/virtgpu_vq.c  | 15 +++++++++++++
 include/uapi/linux/virtio_gpu.h      |  9 ++++++++
 5 files changed, 80 insertions(+), 9 deletions(-)

-- 
2.34.1

