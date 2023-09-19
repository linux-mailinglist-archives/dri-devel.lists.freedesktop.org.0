Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FE57A5FF3
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 12:46:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3626310E38C;
	Tue, 19 Sep 2023 10:46:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2060.outbound.protection.outlook.com [40.107.212.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E72110E38C
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 10:46:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fhTfM9lMrJqWHCY1HGfwKqxRGRngufCU79iuQ1LRaowDszgwbOWDaLsDlSVQVoRClStYEUirBsIOsgTi7U7fQS7+C5k3G8pTsdWAo67myK1qJLqM5/Jd01nGUVrTBVbioJhl1mRrmI/z6BfONzQjrhK9hVRwZqz9o/TXNNdVcY63C1sAZJQaNEDIyeYP7M5I4bmEzIdRBoKfYO65F7KHs+EiPFQUwfrpMQBeHcGFf0lcglWVbAtDVYmoqrQ8y9xR2e2MIBNKGY/LVaMV82RaAfTy6yTySnTN0TAkyrQoYbP10OUhVhsK4BDeUUg2LQGKTmD5qWYHksBK15C/f36wkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dbrq31DOxa0dqnY7G1Ado317jeyJgJ9DXovYoz1/V4g=;
 b=LbTfKd7PT46HaLe2k0/G20qD7yWxoN9McM3rynytgKezhZCMfesw1L8GLcuS92RPU63tpBOdI0oUaEdepbt3WwMxXxM8d3hqD0sQVwOckACt1PwNfzIioHk7Vxz4u92yQZPOBoN/bTfuWHnuh2l8+yBFjMnvwxtMVjPJrhczZuQoT/D6kIKib6bKR1R9B5IrV2s4tfGm6QhpRcmwb5XxWeBv2aCZU7uLXpDAvEsuEpm0OswSgzEAqe9F5yQmIuP0/tFBlOxiHN7zX1VT+B+fAz0ODTu6J9UwZCmeztAxab9S/uIuGGYCd/yjd/Eltg4LMAYdonwaFvTXIZrMhhb8Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dbrq31DOxa0dqnY7G1Ado317jeyJgJ9DXovYoz1/V4g=;
 b=e/PIAJ9zdkNZRSoJiaG8G5aup0MgnBaR4Y69QSi1CEYZ0YDUKydeyrD6VBwAXFNz8s2bR83OigC2TWW6uyQ76mOnXOK5+YuWxtI/s37BNCpDB0nGOFc7IQqfk6aLJoXDS1TPsFSyDjL4KZa3oBgqFJkSNQwAmyxT5FX0EZ2y9k0=
Received: from MN2PR06CA0012.namprd06.prod.outlook.com (2603:10b6:208:23d::17)
 by DM4PR12MB7576.namprd12.prod.outlook.com (2603:10b6:8:10c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.24; Tue, 19 Sep
 2023 10:46:31 +0000
Received: from BL02EPF0001A0FD.namprd03.prod.outlook.com
 (2603:10b6:208:23d:cafe::bb) by MN2PR06CA0012.outlook.office365.com
 (2603:10b6:208:23d::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28 via Frontend
 Transport; Tue, 19 Sep 2023 10:46:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A0FD.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.20 via Frontend Transport; Tue, 19 Sep 2023 10:46:31 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 19 Sep
 2023 05:46:25 -0500
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: Gerd Hoffmann <kraxel@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Xuan Zhuo
 <xuanzhuo@linux.alibaba.com>, David Airlie <airlied@redhat.com>, "Gurchetan
 Singh" <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>, "Robert
 Beckett" <bob.beckett@collabora.com>,
 <virtualization@lists.linux-foundation.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [LINUX KERNEL PATCH v5 0/1] add freeze_mode for virtio_pci and add S3
 support for virtgpu
Date: Tue, 19 Sep 2023 18:46:05 +0800
Message-ID: <20230919104607.2282248-1-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FD:EE_|DM4PR12MB7576:EE_
X-MS-Office365-Filtering-Correlation-Id: 720366ff-8609-44a6-4722-08dbb8fdaf51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Vswx3yn+Ldwp72t01LvMSnSNf7ScXBloCPj0OydQNrDt7AK1XK6HNFCuMuFniWML8tcJN4zvul2zQRRfpXiligXzBQ9NW193hAbEOZLbTv6e9ht6PQ+qtpwy+0a0v1yIFG2YKUTCwYP/Y263QHLrqwsBNfyKbCQSSf5DpYvqr3T23l2I2VG6raCxzrW8G7T5WDoslhkpX8WtfvworPaij2MrPol1Vr1PVqtw90gbSHimtIfPdUtLm+S8YNhlIU/WacuJXq+Iyt8gdkIIuyLe2dri++7ZUhggwHLQkOidfKq7i7S/ZSdBmScdkQ+PYkJP4yb8GFfEKiYsmfowQPBBUKqR0h418AkxN7tNwsKpW04Q5uI4uXkpMVJ7yV37xcE0FdjaxJnQ8+ugAEoLqiGpvCcx/5DlxeSmRcP/QPLnmmxT58aMxmK4vOIS0KcPaW5+OTR3/mTSWsl519xhx2gr5nFzSOe/1j+HKJAeEYNH9lbnUGtt4QyvtGEHqk62zmUXIXRudFwpU8JupGusaj1pBbOXWaiOkrOXtvkYFGj2HXXZUhywCUjPGMgi0PsoxVNgmaaCtHSf2He8RhzZyF+X+/9h4obqHn83mJZceW+tk+QHp5STItuU1OHQM61NWhko0oRgjW41TaeipwTGzURK+Hb2SL85+vIpCOfKTpEuf9STVnDIhw2XVElMpqLnODw/90RuM8Jf+d8VHUwPg+LqNlmyjJ9JiwgRELB6+KFCYMULA8hYnirymdJJ04ye/93OYwlQp1pec56LkV9NL/fstpgJGStXNE4wCHXVlVVxkspg0q7wdrsdHmnqZu76ReVI
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(396003)(346002)(376002)(39860400002)(186009)(451199024)(82310400011)(1800799009)(40470700004)(36840700001)(46966006)(82740400003)(40460700003)(426003)(36860700001)(70586007)(921005)(316002)(47076005)(81166007)(356005)(4326008)(70206006)(41300700001)(110136005)(478600001)(7696005)(6666004)(966005)(7416002)(83380400001)(16526019)(336012)(26005)(1076003)(8936002)(2906002)(8676002)(86362001)(2616005)(5660300002)(36756003)(40480700001)(54906003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 10:46:31.0164 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 720366ff-8609-44a6-4722-08dbb8fdaf51
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0FD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7576
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
Cc: Juergen Gross <jgross@suse.com>, Honglei Huang <Honglei1.Huang@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-devel@nongnu.org,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Huang Rui <Ray.Huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>,
 Xenia Ragiadakou <burzalodowa@gmail.com>,
 Alex Deucher <Alexander.Deucher@amd.com>, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>, Julia Zhang <Julia.Zhang@amd.com>,
 Christian Koenig <Christian.Koenig@amd.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,
This is the v5 of kernel patches and v5 makes below changes:
* Since this series patches add a new mechanism that let virtgpu and Qemu can negotiate
  their reset behavior, and other guys hope me can improve this mechanism to virtio pci
  level, so that other virtio devices can also benefit from it. So instead of adding
  new feature flag VIRTIO_GPU_F_FREEZE_S3 only serves for virtgpu, v5 add a new parameter
  named freeze_mode to virtio_pci_common_cfg, when guest begin suspending, set freeze_mode
  to FREEZE_S3, and then all virtio devices can get this status, and change their reset
  behavior according freeze_mode. See the new commit "virtio_pci: Add freeze_mode for
  virtio_pci_common_cfg"
* The second commit "virtgpu: Add freeze and restore func to reinit vqs" is the same as
  before, it delete virtqueus in freeze() and re-initialize virtqueus in restore().

The link to trace this issue:
https://gitlab.com/qemu-project/qemu/-/issues/1860

Best regards,
Jiqian Chen

v4:
Link:
no v4 of kernel patch.
V4 of Qemu patch:
https://lore.kernel.org/qemu-devel/20230720120816.8751-1-Jiqian.Chen@amd.com/


v3:
makes below changes:
* Use enum for freeze mode, so this can be extended with more
  modes in the future.
* Rename functions and paratemers with "_S3" postfix.
And no functional changes.
Link:
https://lore.kernel.org/lkml/20230720115805.8206-1-Jiqian.Chen@amd.com/T/#t
V3 of Qemu patch:
https://lore.kernel.org/qemu-devel/20230719074726.1613088-1-Jiqian.Chen@amd.com/T/#t


v2:
makes below changes:
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
to resume guest. We can find that the guest kernel comes back, but the display doesn't.
It just shows a black screen.

In response to the above phenomenon, I have found two problems.

First, if we move mouse on the black screen, guest kernel still sends a cursor request
to Qemu, but Qemu doesn't response. Because when guest is suspending, it calls
device_suspend, and then call into Qemu to call virtio_reset->__virtio_queue_reset. In
__virtio_queue_reset, it clears all virtqueue information on Qemu end. So, after guest
resumes, Qemu can't get message from virtqueue.

Second, the reason why display can't come back is that when guest is suspending, it calls
into Qemu to call virtio_reset->virtio_gpu_gl_reset. In virtio_gpu_gl_reset, it destroys
all resources and resets renderer, which are used for display. So after guest resumes,
the display can't come back to the status when guest is suspended.

This patch initializes virtqueue when guest is resuming to solve first problem. And it
notifies Qemu that guest is suspending to prevent Qemu destroying resources, this is to
solve second problem. And then, I can bring the display back, and everything continues
their actions after guest resumes.
Link:
https://lore.kernel.org/lkml/20230608063857.1677973-1-Jiqian.Chen@amd.com/
V1 of Qemu patch:
https://lore.kernel.org/qemu-devel/20230608025655.1674357-2-Jiqian.Chen@amd.com/


Jiqian Chen (2):
  virtio_pci: Add freeze_mode for virtio_pci_common_cfg
  virtgpu: Add freeze and restore func to reinit vqs

 drivers/gpu/drm/virtio/virtgpu_drv.c   | 23 ++++++++++++++++++++
 drivers/gpu/drm/virtio/virtgpu_drv.h   |  1 +
 drivers/gpu/drm/virtio/virtgpu_kms.c   | 30 ++++++++++++++++++--------
 drivers/virtio/virtio.c                | 13 +++++++++++
 drivers/virtio/virtio_pci_modern.c     |  9 ++++++++
 drivers/virtio/virtio_pci_modern_dev.c | 16 ++++++++++++++
 include/linux/virtio_config.h          |  1 +
 include/linux/virtio_pci_modern.h      |  2 ++
 include/uapi/linux/virtio_pci.h        | 16 ++++++++++++--
 9 files changed, 100 insertions(+), 11 deletions(-)

-- 
2.34.1

