Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 102083676D4
	for <lists+dri-devel@lfdr.de>; Thu, 22 Apr 2021 03:31:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AA7B6E9B9;
	Thu, 22 Apr 2021 01:31:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062.outbound.protection.outlook.com [40.107.93.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A00446E9B2;
 Thu, 22 Apr 2021 01:31:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IAwY6PvqnE8KNdze8JMi80syFNDEBnAPv267YydCL4rYqqdhQtmZnG5RV08pyjQZ5tAEFptErs5pK1jv1735n9nVqF371eNyaBW+prRvPkIG57tyyxDGRrPC9LT1h1otvmKpHGZjM5S36L1RFvVeQxPFxS2iVdJIbxmaSzZlO4W6fmQLYxRkQRsZnYkWI6QVVvaZWb3DnvOlG78tKPNPU3cZSaQUc0aUF+JdQwhdjeb0B4FrTWm1+6zPfjHmhkuVC+t9k1AGTw0guXwZ8/aYNo1/IDun9+vUEgG9JO/XAa5EFbx4yufn4NWbftMy+73L/6WF/p0TITMd9c/zI05Fuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+dNxVPsGVAQwUo8RVWZ314DCEpQBnWjBhuwK0MGwQSk=;
 b=knLrXSX1O1b+2yOzJ2BnaM49jvidETbI2cTD/HQHOkAQJNktAf15gMNc4blpsWSOOHyS0QEwMwMeujxg+M035CttzHVx4UzYTZNb68FRAMut3/4BD08Tv08kiQAres9//LkmfhhGl9rGwjwhciPqIbFdICA3y5oYyYyap5nBc/9PmXyEbOCydgJs7uJNDD9Ks1dp9sISt5ViX5FscLbocFtju3mIezbONSEEZqsSm/9he2TaaRdwTKuYk+/4P9EGtM1O/KFVw1WoA4/omUujEcVTgJ/tM6DpgzzFPvSAIAD+i2DcRGjN59Z8Gq+YvqN6V5JpoL99ruWk67glb+7Q+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+dNxVPsGVAQwUo8RVWZ314DCEpQBnWjBhuwK0MGwQSk=;
 b=zwRwUV3OgbUc5J7ApidOqbx5lx1t7H13A6pXLTAsPnhP7is8ohDffGLCs0zOq5mRrlJdJex5K9e7wVbcOJUgy02hq0iTVyqvt5AlJQxpdzRYAb/ZbwdrgSyJKJXl4yiGufVWApB7jiFTXqDMeBg/TjRf9B0W9CYmihEMeIwigVM=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4438.namprd12.prod.outlook.com (2603:10b6:208:267::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Thu, 22 Apr
 2021 01:31:14 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.040; Thu, 22 Apr 2021
 01:31:14 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 00/10] Implement multi-GPU DMA mappings for KFD
Date: Wed, 21 Apr 2021 21:30:48 -0400
Message-Id: <20210422013058.6305-1-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0027.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::40)
 To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0027.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.21 via Frontend Transport; Thu, 22 Apr 2021 01:31:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 459a5c5e-1f1a-44da-5790-08d9052e51af
X-MS-TrafficTypeDiagnostic: MN2PR12MB4438:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4438416A75739B7F9B3DEEA092469@MN2PR12MB4438.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w5LKLhJV3pFBKy/szvu8ehG2ppmqoBhOcSxES9P1fhY4W2N6ZSENKWu3E3KMesCMTDgt117Woxu7WXp0ZaFKVPjsoqCLr9eamG1V5gF4I1FXLJv4TxpBXSlan748wbl+F8ZYeW09gk1qWAh5eWYNIhV1dDhh7qtHtP/uWLlihcOnKZrrx6qpKdGwfij00N4tXLbca4WFRbNHr1/wJpLvOsXS9br3Xej8Zs1vKLHw3/55+TxDkd9h9uONmWaOTbOZrWtjckJeG2ki2kT5lxVOYpfgRfBSMTrGBo4LBpnlFqE84E2IAL7Vb2jUw+oHhnglJKf/TCrZ4o2+p6Sid6jFwAhtt2P9ljhcEhdP6jsbSn9Rbgs9DI7RMB7fNOVFA7azt4WQ1fMnOTPXuuMW7AKFxfyhdkH6h1wozlaz/4pnzxkM+DBY+BSjZRA6TnPZdKH0bLL9OOao0ZBszC07jtZEDGt+4tUTh/qrJ2SRoRWeOwhXZerFvM4SlQ+hZZFN7KvUEaOAjuO1zDrYcvAP1sgR8uNqFSvh6xQI46Vmuv3OuHvcxkVQWI4cLItkQJ+T97sooB0XpzvVSaYviC1nOvEpXloR8dvgFTK/bbB2zze6+gjbvLEKmzuWrE30AtNJrW8XZ9/wFj6uBdYUZaK+bzMJVjrZjhG/ED4Ie0IiNTnW/Pk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(396003)(366004)(39860400002)(8676002)(16526019)(450100002)(186003)(66556008)(36756003)(66946007)(8936002)(52116002)(956004)(2906002)(26005)(2616005)(478600001)(6486002)(38350700002)(38100700002)(83380400001)(86362001)(316002)(7696005)(5660300002)(6666004)(1076003)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?3+0qSzIAGVVswnLIkukYjmCbZYT9cDAVTttGWj42g1mRqLCMtxXd8b1oeQiM?=
 =?us-ascii?Q?O8Wx4GgUbQ5GVqP2t1aZ5kMQ+9uB9bRrjLW7LNLl37gG94QqF4QMkpDLscYu?=
 =?us-ascii?Q?NlTLqeD+G+DFFYL1QuBQthS6Igr4ybPxiaYXFqAqFMkP5fcMwTdN6QxzM6pL?=
 =?us-ascii?Q?s4jNGdWlR28ya9eo7sbzIMS+PYxB/UUaNh45JTbFzXSQ9bUdOFimRmataOkE?=
 =?us-ascii?Q?bIhnnXN5aMM9l4qjaLhONrNAhljyF5YU2MOuRO2NDyn7PUAbuUrTVntCvR6a?=
 =?us-ascii?Q?AELWOxc6Li5Hj2z6dAncbvfpLxmZUTNLbmB59IGgoyyeNLY4L0rGU0YFuVvC?=
 =?us-ascii?Q?CerjiURWvAoaaBWWcNIUxLfetCTz8tm9LncwDVMAiqbxzUxnB5++OH5bajPP?=
 =?us-ascii?Q?FqYOZnl2FGO0m36lldcHJhpN1bpS+f2VTk3dQ4OgUp6XPXsZMDTXn7HN44rp?=
 =?us-ascii?Q?DVIFteJKOtAfegudzZlURiZAN1Z9yZjR54GvTMyTDdhTCZv2hypcC823QSjH?=
 =?us-ascii?Q?XkzEMtYttHEShZ7vds+jQRuxIuZ99dUWgflyKqNlvAL7Oix1HKIJtnJzdIXb?=
 =?us-ascii?Q?UvAL6GY9NefWJBZIFqfqHyonlfOGanUyhY5SePfxv4zyyGt/bYFh2GA1s3wm?=
 =?us-ascii?Q?2Vf5MU0LkqVvesdBiatLKiFD36g+kcPaJv8r87rPEMthhPLpQc0PJ8J5VcuF?=
 =?us-ascii?Q?fJYmpgTlQN51P2Eb5fC7+D3aYI9LeBomhDDIpAAUc674buzd0bpLCAQEZOqn?=
 =?us-ascii?Q?Hfn1J8x+JtFTPbPE3dGNO4OSTLH/aHs6R9ytz5i4joNxT6jTrePqKKOiXdBp?=
 =?us-ascii?Q?nPK4psvpREk0eTiywkLpqPE+UmHfTZDuTqoumcuAfF2+gFurgAsQBpclhZLr?=
 =?us-ascii?Q?8oX1MaplIGoF/92BMXKuk1onQmw7NNOndGFHN23b5baGlLU9PmwlddNpVeDw?=
 =?us-ascii?Q?U4iAx34wGhT9rjmnemhuKuLUAOsdgSpi0qzkaZylRpQ29i6aKYzZSjCOCKmi?=
 =?us-ascii?Q?VffCNr77wbQrp6rvu2M8//VojcdyB5TY1AWr9/RQbwc7jgCi5N7nJvhZ2wfZ?=
 =?us-ascii?Q?IbMwkXfqw9r1e1wTVXwjFe/Nwn/apkN9eKjFcDAsYVGj3uo9Yg8IRHv93pgu?=
 =?us-ascii?Q?0QaPH7G7oaykTA64F/1IimQPqJYHt16/aV37skeoiKg/IQ+1zDXpjJlzihpF?=
 =?us-ascii?Q?C8D3AtRfEFZVL9GtsxC+k0GfYtGjjbe06e5lmK56iooVqUZ65ZTE0lsxS30h?=
 =?us-ascii?Q?0Ekl5kKmx+2E5ZJKFnQrLCnENDBTmg5R122C3AVo4yECBqNTAgO1tPYWDhoY?=
 =?us-ascii?Q?07RTiI98cvJAblri1NhDBfF9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 459a5c5e-1f1a-44da-5790-08d9052e51af
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2021 01:31:14.8279 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y2n4+umF2DFmSdibms7enzSI3a7t9dw/lkxxVdyeXKBqo+/eN4V7A9Z+UMaGpy2JMT9982WP/VJyp9z0zLKpRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4438
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series fixes DMA-mappings of system memory (GTT and userptr)
for KFD running on multi-GPU systems with IOMMU enabled. One SG-BO per
GPU is needed to maintain the DMA mappings of each BO.

Changes in v2:
- Made the original BO parent of the SG BO to fix bo destruction order
- Removed individualiation hack that is, not needed with parent BO
- Removed resv locking hace in amdgpu_ttm_unpopulate, not needed without
  the individualization hack
- Added a patch to enable the Intel IOMMU driver in rock-dbg_defconfig
- Added a patch to move dmabuf attach/detach into backend_(un)bind

I'm still seeing some IOMMU access faults in the eviction test. They seem
to be related to userptr handling. They happen even without this patch
series on a single-GPU system, where this patch series is not needed. I
believe this is an old problem in KFD or amdgpu that is being exposed by
device isolation from the IOMMU. I'm debugging it, but it should not hold
up this patch series.

"drm/ttm: Don't count pages in SG BOs against pages_limit" was already
applied to drm-misc (I think). I'm still including it here because my
patches depend on it. Without that, the SG BOs created for DMA mappings
cause many tests fail because TTM incorrectly thinks it's out of memory.

Felix Kuehling (10):
  rock-dbg_defconfig: Enable Intel IOMMU
  drm/amdgpu: Rename kfd_bo_va_list to kfd_mem_attachment
  drm/amdgpu: Keep a bo-reference per-attachment
  drm/amdgpu: Simplify AQL queue mapping
  drm/amdgpu: Add multi-GPU DMA mapping helpers
  drm/amdgpu: DMA map/unmap when updating GPU mappings
  drm/amdgpu: Move kfd_mem_attach outside reservation
  drm/amdgpu: Add DMA mapping of GTT BOs
  drm/ttm: Don't count pages in SG BOs against pages_limit
  drm/amdgpu: Move dmabuf attach/detach to backend_(un)bind

 arch/x86/configs/rock-dbg_defconfig           |  11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |  18 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 530 ++++++++++++------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       |  51 +-
 drivers/gpu/drm/ttm/ttm_tt.c                  |  27 +-
 5 files changed, 437 insertions(+), 200 deletions(-)

-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
