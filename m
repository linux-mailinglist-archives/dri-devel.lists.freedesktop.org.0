Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C751879A6A2
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 11:19:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85E7110E271;
	Mon, 11 Sep 2023 09:19:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D493310E1A0
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 09:19:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nYLEOv0HILn2xhhTXkhNSa4UuugLo7xoYlPmswbzkgT7FdnRVd/VCE6J1ZXtQyqamQCTfMZYi1Qpmrz0Gzh2goMOePKpdyFo2xLwoywGkqbzL6p9zDKGNxeFkwR4dglwp3tGMWdXE683QzueeigLBHxK0h4vG51VDe3CuSyxB/3YVF24FjFOjPioINx61m/KfiDBat4hur8CXF/9P1R52oY08COelUlfinZYHUbmrI6OQmyMUNikp1cKvT/8oo0MmmSkQDlSwynStDTUwp2d6W1rMmmBnbKu13CittRO5yiOQLF7tDUl0JjRwMGNl0PeHzjkcMr3dIOjjMnXHPr97A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o1FONpADl/hn7RG4+3KRZ0biRadqxGK9fmPAL0XLPsQ=;
 b=oOT3jogJLf5JCqW4qSfoJX4IP6EP8koeBQZY0C8vxBQ0yxhXmIj5D2v8NEV7IVwZXefoYjnOGbNTli3xZhNGEFnSET3dpkRj2x94HpcYgFEOSWZubWjKGTfiry9qbW2uUmmSImw9MOq0zPz3wvH0gCkeb1P0SYuZ/GEj6oWuJu04ggqEN6Jr2D2LzePZN6i8p/RNqDqWXwkeVg2DDhWI1PSFCdgRWsPed9n/zPrTsblFXf1JmGofDTbBs2eIKfbwJqvN/S9mKAJcKV0L+rQG3N8QtAjgXmGHIPqEQCUeEa+ckFDguRYAI4wI+rQmz7FPSD/OZ9kiFzso0qlCUeEFKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o1FONpADl/hn7RG4+3KRZ0biRadqxGK9fmPAL0XLPsQ=;
 b=DeGZed9RtLZDcDGd3z31Gj7EY+E/Rl/pGOQxNih1HQ2dPlwlideLVkrRVnk6RHbmYjAPdRR7fK9zy0tik3aALOr0B4ix8Xq5BREC8spQnqk96VBeV0g/KHOnrQ0SsRgjk7HQpeATCIXvDcib6qSP2mrl0HIyJ9TTEf1Puf5GjGE=
Received: from DM6PR10CA0034.namprd10.prod.outlook.com (2603:10b6:5:60::47) by
 BY5PR12MB4869.namprd12.prod.outlook.com (2603:10b6:a03:1d9::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.32; Mon, 11 Sep
 2023 09:19:03 +0000
Received: from CY4PEPF0000EDD2.namprd03.prod.outlook.com
 (2603:10b6:5:60:cafe::c3) by DM6PR10CA0034.outlook.office365.com
 (2603:10b6:5:60::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35 via Frontend
 Transport; Mon, 11 Sep 2023 09:19:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD2.mail.protection.outlook.com (10.167.241.206) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.16 via Frontend Transport; Mon, 11 Sep 2023 09:19:02 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 11 Sep
 2023 04:18:57 -0500
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>, "Gurchetan
 Singh" <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, "Juergen
 Gross" <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, Robert Beckett <bob.beckett@collabora.com>,
 <virtualization@lists.linux-foundation.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [RESEND LINUX KERNEL PATCH 0/1] add S3 support for virtgpu
Date: Mon, 11 Sep 2023 17:18:30 +0800
Message-ID: <20230911091831.1383180-1-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD2:EE_|BY5PR12MB4869:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d85fde4-26e8-4c84-9a1b-08dbb2a823fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OhI/dH0qsfkJQEVA1q9cmWOJSbTVyDoX37WKlena/BBvHLyGqjowhpBNu5bXZ8TJ920CCqgo79scryf7WQTBgp7DBsRzGGHaFccaHDoKjMWS2ghymE0VQhIjLoihg31K8CLgaGuCG6iyKlbQMsp54HS4OOEiPvfU+oCTrDRBM2XV7jSQvj5glmwT6dRU6b8rMcm4XAavZtopOf3n8MNmvdI8Pa4kMkQRHJR4TiNBUGZTYz/jxjFllvrdXnVGV58IKAxPPyG/JP3Ztt1kX6kTingFUb4FDMMWRW9ucm4Bj5eKpdvNf4ml7ahuR6vwVADis5uowZdYO5mxvKQKIZEv4Fs9k38Xcn3Bas9qtGr5PGN4SWV9/UmbjUitiQdXvhtKbu//ziYLq37mfobsmrHhQEXAt77RnUKvsi03qYxtxXF8Gu6aKoBlR+bwHYues2YuCYcdJVWznGJyPHJgNSf7btMIeVW2khEKz9q+CEoA6gegcq7Z1z3pcLNhZofWqkUEyFx0re46XyWLiI40cTJNl0pgL1VmyG/qlJaVxLSOxX7r8C9bzLOl3gBQe1pTqqlvVUEMEiqKIAbGM1TwLu9t2/oiak5Nf4r6RfIG79BcU3cf1vRELUz3uCLOEqKuDjkiIFF5am/RZVdOmRbl3K3OwB+IrjgNnff303DNRoFW7HohrLlZutT9t6JlU+XZV5Qyv/stR3Lh8+GB5yB2VME1Viy2d95rSGGnnKOiS5hnf7rMYszglI64ZTh5QIMVMr4cuydTMamp5k1cxCfPEwJ4ltJUkEpIYhSPYmDTB5NtnD4znU2rOsqFumArK5FGR/B0
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(136003)(346002)(396003)(39850400004)(1800799009)(186009)(82310400011)(451199024)(40470700004)(36840700001)(46966006)(7696005)(40460700003)(6666004)(83380400001)(921005)(356005)(82740400003)(81166007)(86362001)(36860700001)(47076005)(36756003)(2616005)(336012)(426003)(1076003)(26005)(40480700001)(16526019)(70586007)(70206006)(54906003)(110136005)(7416002)(316002)(41300700001)(2906002)(4326008)(8936002)(8676002)(5660300002)(966005)(478600001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 09:19:02.9839 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d85fde4-26e8-4c84-9a1b-08dbb2a823fa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4869
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
Cc: Honglei Huang <Honglei1.Huang@amd.com>, qemu-devel@nongnu.org,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>, Huang Rui <Ray.Huang@amd.com>,
 Jiqian Chen <Jiqian.Chen@amd.com>, Xenia Ragiadakou <burzalodowa@gmail.com>,
 Alex Deucher <Alexander.Deucher@amd.com>, Julia Zhang <Julia.Zhang@amd.com>,
 Christian Koenig <Christian.Koenig@amd.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,
I hope you’ll forgive me if this disturb you. Since it has been almost two
months since the latest patch was sent out, I didn't receive any reply, so I
rebase the latest master branch and sent it again. I am looking forward to
getting your response.

Best regards,
Jiqian Chen

v3:
Hi all,
Thanks for Gerd Hoffmann's advice. V3 makes below changes:
* Use enum for freeze mode, so this can be extended with more
  modes in the future.
* Rename functions and paratemers with "_S3" postfix.
And no functional changes.

V4(latest version) of Qemu patch:
https://lore.kernel.org/qemu-devel/20230720120816.8751-1-Jiqian.Chen@amd.com/


v2:
Hi all,
Thanks to Marc-André Lureau, Robert Beckett and Gerd Hoffmann for their advice
and guidance. V2 makes below changes:
* Change VIRTIO_CPU_CMD_STATUS_FREEZING to 0x0400 (<0x1000)
* Add a new feature flag VIRTIO_GPU_F_FREEZING, so that guest and
  host can negotiate whenever freezing is supported or not.

Link:
https://lore.kernel.org/lkml/20230630073448.842767-1-Jiqian.Chen@amd.com/T/#t
V2 of Qemu patch:
https://lore.kernel.org/qemu-devel/20230630070016.841459-1-Jiqian.Chen@amd.com/T/#t


v1:
Hi all,
I am working to implement virtgpu S3 function on Xen.

Currently on Xen, if we start a guest who enables virtgpu, and then run "echo mem >
/sys/power/state" to suspend guest. And run "sudo xl trigger <guest id> s3resume"
to resume guest. We can find that the guest kernel comes back, but the display
doesn't. It just shows a black screen.

In response to the above phenomenon, I have found two problems.

First, if we move mouse on the black screen, guest kernel still sends a cursor
request to Qemu, but Qemu doesn't response. Because when guest is suspending, it
calls device_suspend, and then call into Qemu to call
virtio_reset->__virtio_queue_reset. In __virtio_queue_reset, it clears all virtqueue
information on Qemu end. So, after guest resumes, Qemu can't get message from
virtqueue.

Second, the reason why display can't come back is that when guest is suspending, it
calls into Qemu to call virtio_reset->virtio_gpu_gl_reset. In virtio_gpu_gl_reset,
it destroys all resources and resets renderer, which are used for display. So after
guest resumes, the display can't come back to the status when guest is suspended.

This patch initializes virtqueue when guest is resuming to solve first problem. And
it notifies Qemu that guest is suspending to prevent Qemu destroying resources, this
is to solve second problem. And then, I can bring the display back, and everything
continues their actions after guest resumes.

Link:
https://lore.kernel.org/lkml/20230608063857.1677973-1-Jiqian.Chen@amd.com/
V1 of Qemu patch:
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

