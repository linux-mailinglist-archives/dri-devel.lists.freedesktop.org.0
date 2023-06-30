Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 940537435D4
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 09:35:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FA8110E00F;
	Fri, 30 Jun 2023 07:35:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2076.outbound.protection.outlook.com [40.107.243.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D08EA10E00F
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 07:35:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cneF23IVAdXfKmAmAv9PwWatV/3B9/f7DAwd01REfVoVPQK4DViuq6WiPfwl3lzy0w0upukoNW1zBGNgMDmDBElLNruAvTU6DdfQxAHTLqB2Z0Fgd4venTYOd/QkFXjCL+Yvb/Xk3uPhWHtXEku0pq8TdP7QIOtGsC8YHiu5p8iHnkZIZ9TtEeo80oNWECe/3lh58vZiIhNPZRutEiT8jdwycu2gKYLyi7vPQ3AfPwANv5TnRgc2eSJcECHZH0SvAF48emojfVJCd2+ubvwRS6sBJlMOQqvMWneEfwSrxs72WCI84CGqObegvK9B2oNOJGhYrVuXPK7OsqNgWOe+dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XTc0Y1rrXNKRDWpAUmQ3mpunEfzfO3YtM3nY3zDW1Cc=;
 b=n1X2JH7Q/wvFss2csN0Axj4T2KYWBrUNJVYqS2dFvv5EwpD5OGUz9VHJxpdJei8x8lNSLE91PinHKM+efpN9nEOnjlVb35sbb8pn3WW0jBtQaroyBa64hSG/+Hhr4+rOO3LIBUrAjUAz3sRRiYe4IX+Wn9oC/DZXCacYmzn6Slr+LsUBD1pIDI5bg6lgtlsm10NELx3EupuzTfXBFnxOhy6bYp0tCCd1TkApARw3PDHbUSdncwIF/cQhErycRiLEU00+U4pf70AwxCzZAtXmiltBtCBRgWA3q7Z9+2KeLYNOXF8rVwO4BXEbeMB6FkGEZBy6trIiTsIOhTh0mBClWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XTc0Y1rrXNKRDWpAUmQ3mpunEfzfO3YtM3nY3zDW1Cc=;
 b=xuxJbHr9sHweyAEKcBsTC2ZC3jwsfz5SWhn5I836Mgub23P2AOfeI/+GX46ExLmbyFOzFGJHjQ3uBl3qBC7KwxbscASqrVeek+wtzvEVP1GE+dPoAGHJifR5QbWtZM/GHD+kG0/VjRAKFLARsMTiXY6ywOghzS8xuk8WmdkoAyE=
Received: from SJ0PR13CA0091.namprd13.prod.outlook.com (2603:10b6:a03:2c5::6)
 by PH0PR12MB5608.namprd12.prod.outlook.com (2603:10b6:510:143::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Fri, 30 Jun
 2023 07:35:29 +0000
Received: from CO1NAM11FT046.eop-nam11.prod.protection.outlook.com
 (2603:10b6:a03:2c5:cafe::f2) by SJ0PR13CA0091.outlook.office365.com
 (2603:10b6:a03:2c5::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.19 via Frontend
 Transport; Fri, 30 Jun 2023 07:35:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT046.mail.protection.outlook.com (10.13.174.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6500.49 via Frontend Transport; Fri, 30 Jun 2023 07:35:28 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Fri, 30 Jun
 2023 02:35:06 -0500
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>, "Gurchetan
 Singh" <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, "Juergen
 Gross" <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
 <roger.pau@citrix.com>, Robert Beckett <bob.beckett@collabora.com>,
 <virtualization@lists.linux-foundation.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <xen-devel@lists.xenproject.org>
Subject: [LINUX KERNEL PATCH v2 0/1] add S3 support for virtgpu
Date: Fri, 30 Jun 2023 15:34:47 +0800
Message-ID: <20230630073448.842767-1-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT046:EE_|PH0PR12MB5608:EE_
X-MS-Office365-Filtering-Correlation-Id: 76283c84-3296-4f38-acc4-08db793c93f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mwvPJCcQY3+WAvQ7nycHHaVlzPPpRbzUeaeMw2Deo9W3vPdRN5Ieau3j5g96HsdoYhQR14U1gZvfj0GJSUpPtmJPkD0RKxHJICTc2EErHvi2/RZmW4gBtzkiGJeBpwHyvKjL3BpCJHwOrLFigFCwflBOzuJTGgoFN8znnKSW0aH/FaqkvUukMIsQmIKcCzP3PsVqlKYXY6b59mYhnzJYZwT9QINB6E6YYcYfSVcRnX6KkTL/JTFHNsEWXnfGgP7WG5bHXhFpzue0/xsWv2MKJkb5O2VBmQJqKwtQdKuc6bw1SCwMZ9jbo9p1cn0TUVhcjmlKVI7hm2E9VHt5NEj0lTs5NJ9WCNDtM+9hN4bhJEfLVF7RqYhHFpNsjatMvJvXdP33Hy7tMyVgScdaD4Htwlz5KbisOa283SU4/Q9PW/jVZtbL01zhx5rqpMjtHhEREs6yHfpaOkzSYyrkCYxLSlyBBWnbwgtjLlGUjEQO/y91HpTupERI+dIdnPyeheJWz03rwLqJ5vsTu2QnSFerlHCer70stwsBCPdHlcxSr0eELR8ySsxkG/vlgz9WD5bSzX5/qSyWah9LV6KefAcBy9jFG+/e33kRuBX8IcVzrnkWc3x6SJKyRH4C7pvwFsxGl53BkDynOsTGbPO1OQ0dSwC2SjBqv4VBDP37hOV9PaHd14XONXODnSSCI1gJQpwhYku7sjL/v3+J+x0ioPO4hFGVVsh4UkX2ZIkK+JyuzPVxo6W05VS2XL1llYj6QI2h84ZqJlw6WSo8tHY1fCFXtta7xi577ewm0vQzjlPOHBsqKl6SiVv99ht+aQPWXC96
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(39860400002)(346002)(396003)(376002)(451199021)(46966006)(40470700004)(36840700001)(26005)(2906002)(86362001)(356005)(82310400005)(7696005)(6666004)(83380400001)(81166007)(2616005)(921005)(186003)(336012)(16526019)(426003)(47076005)(82740400003)(40460700003)(54906003)(966005)(110136005)(41300700001)(36860700001)(40480700001)(4326008)(478600001)(36756003)(70586007)(316002)(70206006)(7416002)(1076003)(5660300002)(8936002)(8676002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2023 07:35:28.9066 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 76283c84-3296-4f38-acc4-08db793c93f6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT046.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5608
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

v2:

Hi all,

Thanks to Marc-André Lureau, Robert Beckett and Gerd Hoffmann for
their advice and guidance. V2 makes below changes:

* Change VIRTIO_CPU_CMD_STATUS_FREEZING to 0x0400 (<0x1000)
* Add a new feature flag VIRTIO_GPU_F_FREEZING, so that guest and
  host can negotiate whenever freezing is supported or not.

V2 of Qemu patch https://lore.kernel.org/qemu-devel/20230630070016.841459-1-Jiqian.Chen@amd.com/T/#t

Best regards,
Jiqian Chen.

v1:

link: https://lore.kernel.org/lkml/20230608063857.1677973-1-Jiqian.Chen@amd.com/

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

Jiqian Chen (1):
  virtgpu: init vq during resume and notify qemu guest status

 drivers/gpu/drm/virtio/virtgpu_debugfs.c |  1 +
 drivers/gpu/drm/virtio/virtgpu_drv.c     | 37 ++++++++++++++++++++++++
 drivers/gpu/drm/virtio/virtgpu_drv.h     |  4 +++
 drivers/gpu/drm/virtio/virtgpu_kms.c     | 36 +++++++++++++++++------
 drivers/gpu/drm/virtio/virtgpu_vq.c      | 15 ++++++++++
 include/uapi/linux/virtio_gpu.h          | 15 ++++++++++
 6 files changed, 99 insertions(+), 9 deletions(-)

-- 
2.34.1

