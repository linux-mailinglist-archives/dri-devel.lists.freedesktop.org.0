Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9703F6E0E
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 06:04:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6265A6E134;
	Wed, 25 Aug 2021 04:04:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (unknown
 [40.107.237.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C004E6E133;
 Wed, 25 Aug 2021 04:04:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DuMnl+7q0QWjMlXM+VcJxQI0uLALW3VB1yJmjahbbJFRr5YyebMAOcs3aIPMbTPYP2RKoSJFP6BCGrucpSA1oGk3YSPPmV1gZuHtjFTZuwJ5M3rtXKJ8k8j+2pgsKfzlbW+PTaiGwq+LQSUnSwxGsFisRz8sDotNH5jZe5D5J0z7Dpadq//MYS2lwSEMwOQJmy6xpRTesxxz2q1/fWpBUBuUpW9GxRNcjWZaj43XVJPOHO3Tv2D4hKPyoSnYjxiWfG/pif7Kuq4JiTjhUsztttKGDx8StPl9VAvdoUjhzVnUgG6cO0uDEJpT8GBbL8x2zYJBe5G9RiugnVx4l4vZxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xNlXrfE4itrA2RhOaWEzoY4lsnA1p9IR6epqHnX2GqA=;
 b=P/n7lYF+N68BRRV6aXoAwlf7xLZrm3PTgS/7DQcptGXh1cGYLZ2bXVzkLNjdCnmcH0YJ4ARFhCAeFGX33wdYWyBAE4OGX/z2ZXgOujnkACD1adB+8YAlzO8AV6gwXBbc321sK59GHf70Xrv5f5M3Yw7mcSy1gaULpjC1uAqMWS2MLp/itaz7kf/hxE7BDD9H0KzSE77fmw2ddu6A6Dbt4HN184VR4l3SqMJX6B7mL/+0xqROrH7YPPS9KKGmQfuUd69t6yFSh8SNzhV6xZ4KuLelmDr+PqrvlBy4jvTyPFzihu8ctTPJhHJLhr2Dy2uD9ZhXVNnyzu4Q5b4Pe8JjMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xNlXrfE4itrA2RhOaWEzoY4lsnA1p9IR6epqHnX2GqA=;
 b=MLhFxpnakxNjRMdUMlsgeB6dSlzaufsW/Vbvv0xgsGc3ucKuNKHNyRKY1RA6Czj2bbqaX66JUVMJd6LvypE7GZrLKBfnUflv8DFNHCnZAfYsKgnis2EbbxTM4k9XsGAEcEiPWN0VBGuUqPwHC/qjn5+zJqmlLFy3DiviFqmUhd0=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SA0PR12MB4511.namprd12.prod.outlook.com (2603:10b6:806:95::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Wed, 25 Aug
 2021 03:48:39 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::855b:1f8c:c5d1:331f]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::855b:1f8c:c5d1:331f%7]) with mapi id 15.20.4457.017; Wed, 25 Aug 2021
 03:48:39 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 jgg@nvidia.com, jglisse@redhat.com
Subject: [PATCH v1 00/14] Add MEMORY_DEVICE_PUBLIC for CPU-accessible coherent
 device memory
Date: Tue, 24 Aug 2021 22:48:14 -0500
Message-Id: <20210825034828.12927-1-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0190.namprd04.prod.outlook.com
 (2603:10b6:806:126::15) To SA0PR12MB4430.namprd12.prod.outlook.com
 (2603:10b6:806:70::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from alex-MS-7B09.amd.com (165.204.78.1) by
 SN7PR04CA0190.namprd04.prod.outlook.com (2603:10b6:806:126::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Wed, 25 Aug 2021 03:48:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4a1dfb6c-8953-4028-8b2b-08d9677b397f
X-MS-TrafficTypeDiagnostic: SA0PR12MB4511:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB45110D96BE777C3C8A81450BFDC69@SA0PR12MB4511.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x1V6yFmY40Qab0gR1lqhcAJ264+sqhDIwDKBg09HyA8uK2ti/HfzBh9WutgMLo7xhPoovL8SuENpZbo21IXvJl1jrHKtaamWmE2DKtUYi7vJjiOIcYdLaWglrEEBmapoQNQb9TanTZM0dBlVLAElokQ+GGg9nENQZReS02wFA01BbsgZ86hF4igBH1faqYhp7Vy1I18wwlBvtIkde2ttfb3EYmxpUfJua5F+m2HrtI0oejO6WIW+qWSOzASkfZE7+Enb/Hyaa6vVTeJC0m4wJELIi8r1cN3NfaTR0pUojjaAGtA9brK1tg/dw0Vogh699lzos5UrUUZNqF7XaOD1Vmi5El8JPhIzIFGJprZB3Og0ekSskNlDu0HvXL0eDTBQeQBhJOX5zhib2Su18rmSWpu8Bo0vruP1KMXhUyJsqGaTtIUxp5M5ew0UQtXXCOqXsRy3r2k4OjRpKclft1zb1RZuFzkAzDsrKIDHE6Pnq01cYRahQh2cuUskj3pKmeQDXsnR/cd+reOUuuqH6FhngK0Ym9CZ+ZjRUDJ64OPFRf9iXjGKyv/MMfcK1wtq2zp9c06VeeoLFqgrHmYVFHYVpqWeXAp/VU2Y/vVBbapQMMEXZW7OaRbvOk3utOy6Lk4k/Ht+/umso/8xYiKdCe1R41orFQXoz+g2czqf7R/TPDV6GZo0Q2MZY3W8VAg4hPM2zwoa+4f/TyTRuXRf+lswFQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(346002)(376002)(396003)(39860400002)(316002)(478600001)(186003)(966005)(1076003)(83380400001)(8936002)(38100700002)(7696005)(66556008)(8676002)(66476007)(66946007)(6666004)(956004)(36756003)(52116002)(2616005)(4326008)(44832011)(7416002)(2906002)(6486002)(5660300002)(38350700002)(86362001)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8XuiKU8rB9qEoZc92EYd9Satt/yhXVYck9/VU8p4bB60u2uQDcI0G3be4Lfl?=
 =?us-ascii?Q?mKs1/yys0p/d3S8tjsupfEJauHuAnr00OR1wF/B0Ry7OZBmaGs3PZGasfJFe?=
 =?us-ascii?Q?uwKy457Cvs625vv4NSxzTUemoJifyOPevGPno6yMJ4D9mzJkIrfnO84Tm6wg?=
 =?us-ascii?Q?MjorXx/1AnOF0rXr3yDZR4ly1RPH8zDYTj+vxg5Ur8cy6JsRi6KHOjWJBY2M?=
 =?us-ascii?Q?OQJWeD/SzXhXqiQZSynNYWeZmmV6yRsi8qenD5MQNXTDgIfh4X2oO3yKGYv7?=
 =?us-ascii?Q?FYcuuAe+RIrZo+xIeN7f0tq71nXtAdzIcy/ih8Elr/foqxgaCb3x/O9szwZH?=
 =?us-ascii?Q?SeRLGF1vV5lc8UzI7EjAxgKLXNym/3tgEnexnAZZAm0pVPw+uN18EgubeBZk?=
 =?us-ascii?Q?sqh8u6C3ABgkdFFvbQKzHF4MCUcXGciNWglrUzlXHfW+J6hwt7GiqLtEaiK9?=
 =?us-ascii?Q?yKPYZiZPkKMPPfuJcqN7FPcW7V8mRE92HHY/Oeq5pLIkuszCyc2QZlXjIFqc?=
 =?us-ascii?Q?UWjHRUq4NbHmg8xigGoW97bVh8L2aG+rhkDaaxhxTdRCLRIdHI1txyIB8YS9?=
 =?us-ascii?Q?vHzhG/TL+UYeW86RT56r4pEn2m6KLlPRyp/NACQYDSPCodNYLQGSIeBB1gcm?=
 =?us-ascii?Q?MhX9UMWYaCwsvSyRp9WjJBRtGoiV6QLqaSapNVgulzjDj6SQkHgvVFq1ZmsA?=
 =?us-ascii?Q?tkZX1FVqJJ+Segcc/9XcjhN7vWgOAtk5nROBmeVJ7r3fTu+jDDracZC5Wr/0?=
 =?us-ascii?Q?T/QmskSpNvWejjlWJ/kbdyx2SRc/a9co+9gRszfvkz7tygJC3xDFCwVeGYyj?=
 =?us-ascii?Q?rIo/kMA/vAsAbbFmuaP26tqaUrUF9TmQikkPfggBZ8OL+K6R/6njK0rCg75u?=
 =?us-ascii?Q?pqG6erRDmY+FmCRRsopqnPA5hqqXA1tIAz5piLUqciYEMra+8Jvl2J4lpRld?=
 =?us-ascii?Q?9+PnT6mSKonK4sBn9LethhWIDxKPjbF295Gdn/WIgTfmqib6z8SWpaXywRyL?=
 =?us-ascii?Q?RPIpXXTEtMn2RlO5R6VlA0r/zIc2WFWg+Ua7yBGGh83IRVhhoA3EM5q9GVx1?=
 =?us-ascii?Q?G318AtYBsBo5ZmnACNPNpu5BDceRg4Q8V30+YZGP8GwZhaY5amlQqPsxU9kD?=
 =?us-ascii?Q?OAHrZUzMYG2Ba0etUnV7pPZlx+yuyhDDlfxN8JeN/oZFvBNI2AHeerTqs0ly?=
 =?us-ascii?Q?TCNmKPGhZ1Zl7J6fSiqgauZvkEg2Sou6FVdv2SRe5PmPZROFB4GfFHxaWFE3?=
 =?us-ascii?Q?unsa0rqCMjdiLBG6itKWddRIVGFaJjdJzuZlx7h9JpQ9hh/HHixWdrYaQ2+Q?=
 =?us-ascii?Q?k3dd96pAuwf3nn03DE5QvOzO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a1dfb6c-8953-4028-8b2b-08d9677b397f
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 03:48:39.4815 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MqzOmEvVKBiLQJYlyBfBjYMKVkXT5Hz8LHYu7v8xaYrUCaAKnUyHmRuKYUrisfqUkFXMHmXWym1BZxtVwnQWVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4511
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

AMD is building a system architecture for the Frontier supercomputer
with a coherent interconnect between CPUs and GPUs. This hardware
architecture allows the CPUs to coherently access GPU device memory.
We have hardware in our labs and we are working with our partner HPE on
the BIOS, firmware and software for delivery to the DOE.

The system BIOS advertises the GPU device memory (aka VRAM) as SPM
(special purpose memory) in the UEFI system address map. The amdgpu
driver registers the memory with devmap as MEMORY_DEVICE_PUBLIC using
devm_memremap_pages.

This patch series adds MEMORY_DEVICE_PUBLIC, which is similar to
MEMORY_DEVICE_GENERIC in that it can be mapped for CPU access, but adds
support for migrating this memory similar to MEMORY_DEVICE_PRIVATE. We
also included and updated two patches from Ralph Campbell (Nvidia),
which change ZONE_DEVICE reference counting as requested in previous
reviews of this patch series (see https://patchwork.freedesktop.org/series/90706/).
Finally, we extended hmm_test to cover migration of MEMORY_DEVICE_PUBLIC.

This work is based on HMM and our SVM memory manager, which has landed
in Linux 5.14 recently.

Alex Sierra (12):
  mm: add iomem vma selection for memory migration
  mm: add zone device public type memory support
  drm/amdkfd: ref count init for device pages
  drm/amdkfd: add SPM support for SVM
  drm/amdkfd: public type as sys mem on migration to ram
  mm: add public type support to migrate_vma helpers
  mm: call pgmap->ops->page_free for DEVICE_PUBLIC pages
  lib: test_hmm add ioctl to get zone device type
  lib: test_hmm add module param for zone device type
  lib: add support for device public type in test_hmm
  tools: update hmm-test to support device public type
  tools: update test_hmm script to support SP config

Ralph Campbell (2):
  ext4/xfs: add page refcount helper
  mm: remove extra ZONE_DEVICE struct page refcount

 arch/powerpc/kvm/book3s_hv_uvmem.c       |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  36 ++--
 drivers/gpu/drm/nouveau/nouveau_dmem.c   |   2 +-
 fs/dax.c                                 |   8 +-
 fs/ext4/inode.c                          |   5 +-
 fs/fuse/dax.c                            |   4 +-
 fs/xfs/xfs_file.c                        |   4 +-
 include/linux/dax.h                      |  10 +
 include/linux/memremap.h                 |  15 +-
 include/linux/migrate.h                  |   1 +
 include/linux/mm.h                       |  19 +-
 lib/test_hmm.c                           | 247 +++++++++++++++--------
 lib/test_hmm_uapi.h                      |  16 ++
 mm/internal.h                            |   8 +
 mm/memcontrol.c                          |   6 +-
 mm/memory-failure.c                      |   6 +-
 mm/memremap.c                            |  70 ++-----
 mm/migrate.c                             |  27 +--
 mm/page_alloc.c                          |   3 +
 mm/swap.c                                |  45 +----
 tools/testing/selftests/vm/hmm-tests.c   | 142 +++++++++++--
 tools/testing/selftests/vm/test_hmm.sh   |  20 +-
 22 files changed, 443 insertions(+), 253 deletions(-)

-- 
2.32.0

