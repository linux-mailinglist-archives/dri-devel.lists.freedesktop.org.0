Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A07A05EDC22
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 14:01:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94FDB10E46D;
	Wed, 28 Sep 2022 12:01:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2059.outbound.protection.outlook.com [40.107.223.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6742710E46D;
 Wed, 28 Sep 2022 12:01:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VLxFvSKSD0id8acJ54cUN5MJn4nxq4pitzLhztWnxIdhO7qyKnBOcEQtJWfOh9ceHqnfp59SyAArcEJ/JHurcGRgViKgM6kZukhC3knpYaHFZK/j8wVwvRr818I75DmE7M0+1Em/ZvZxSoP87U56ZS7ZL92ytH+IKSXAFAdqWpia/T1PpywNLhYTBdQEvbaxGqJQjftFiNjN4Qqhx0O4Cu0YFZYYEWhWKN8e8CLsoe4oKibOGspYeiHcgxVB0yAmXTa54t/fHFwSsOLBzYU6lM7+8e6tQ97n/raDxytSrG+qVh3SXaT2t5jEanAynavMWXm1W0tMo0RX8mUZ1fOMgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tGnMifly1thb8m52sgwmDkmosPQv+vSp0P3aT9+aLdI=;
 b=LWcQa0RKTarqnhajd5k+Q25yqreYZlMInEBAkHM50L5g1ac0u14+eioJyqePsJ9N4D7OJqNr5GLicVDYT7g4xwz/svYdAZHNT9ruXPyRbhDKO0Y8au9nN1W5w3b6J510vhefUKE0aaEmKChF94eccRnU91V5JzE5+gB3r8+/xfxYDOP889/JYY3EZ9OS/Qj0e/+zeEJyFketc3JsOLeSN+QFbL1jbcc/E0jldXoqvOt5FoNG+7NJ11VBBWv4+1XgiRjvmwfqGlYQA9gkbviOADdR2au/za2ssl2xjjtXpPqS2+toSpT246JDbzIkwZ5x48cyzpF2VOgmtegISWGnhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tGnMifly1thb8m52sgwmDkmosPQv+vSp0P3aT9+aLdI=;
 b=t1ecQQ0KEbHmrArb9KyPf/k7VLSHm2vq3LQYpaq44HkKWVvK9bLQyMuDQQt7wRaLZlgyPAAGtE3z510zIzCZ31KAmlYdTAV8YEf8T6/AH8z64X2iugVzcu80vaBFLnZzPgc2qLhUPsGh5DqaU5LGWS166ZDPQM/gYW4j9SAjzvOGj5CEJLntHUwz+trWKwhg1/GOwKqxwiEuSzp7SQ1Mh9LoYgs2rnjPb/eJNsTFN7+zNYQwcWJ7s5wGtcPSTdys+qd8GO6z7d4JOPLPKz8zTzRhoCINe/fVqQUVPvEkcIZhCCJVeQt/SZcSEZAG1UfGXamu+WgfCPTkrHpseKw3YA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by DM6PR12MB4337.namprd12.prod.outlook.com (2603:10b6:5:2a9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Wed, 28 Sep
 2022 12:01:37 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::4064:6c13:72e5:a936]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::4064:6c13:72e5:a936%5]) with mapi id 15.20.5654.026; Wed, 28 Sep 2022
 12:01:37 +0000
From: Alistair Popple <apopple@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org
Subject: [PATCH v2 0/8] Fix several device private page reference counting
 issues
Date: Wed, 28 Sep 2022 22:01:14 +1000
Message-Id: <cover.60659b549d8509ddecafad4f498ee7f03bb23c69.1664366292.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SYBPR01CA0093.ausprd01.prod.outlook.com
 (2603:10c6:10:3::33) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3176:EE_|DM6PR12MB4337:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c562cd0-c8b3-4a15-818d-08daa149323a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mcrrfz8bWphLYhzkb9o3HttdN2RaQIrRR/NkalLmlzHirUCi9yknwUFudRwvdWBRiXGOk70W1euO7JsMSbMrdKonSLUXLZ3CiPZpCL6bivvd3p9LqIDT+C4FzhwM/cOxViDGMfOUzf7NfDIzUvTWDuLZ4ePzQQ2S0K9sLXTS5uSMHOzSmEpWus1GATiOlqYo7BE3oncde/6bUKW0Qs386npylddWAxDoNu4P1jZpLnjEUfgLIdFY3/GV+Ga1ENcIyixkUz2/TcuMzXZzyUNh/MNVC730baxSvXn+jq0BGCqTtDBmvb4thWOuslFg70jp1gipyLOK4sWHMcO9SxDbwK7pVrqdgck6ZR0zkDvH0oX35CMnbyMR5rIT2WS88lS247Mn9RT3BHCM4WMBmH/0UokLAPtHEtu937Zvy1Dc7VM+oC5h+Md2vqoNj5YRZ40inUKr1A3jjjEhuoE2sUkXyvqagLnREgFzYtE69Mi0BkrViVQDJN/4gwt/aWZdTAsVypxo52uNJ1FVxIH2VlKoxyzjF//DYIKS1rQ88+kcEkLyWlLBpcjBBVEAEoAGUQh309wjYmGa1FlikyyLAPAXyKKdoCmjkAL88Wz0JPMSEApZv57+fvHNS+52aUnnJcyEmvz6apXvzuMn+luSxcUKMdfZU7+LY8zTOlhUh1ni31b1IyutHb9fePWr1nlkUVHMbcqr8h80kfbSO3Nbkw5WJg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3176.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(366004)(376002)(346002)(396003)(39860400002)(451199015)(86362001)(36756003)(2906002)(2616005)(6506007)(6666004)(6512007)(26005)(38100700002)(66899015)(83380400001)(316002)(186003)(8936002)(5660300002)(4326008)(66556008)(8676002)(66946007)(66476007)(6486002)(478600001)(41300700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PLWKoTvxOP1BJW9TQDgpUM5D6+LwxFnCdu39roXgbd+xShyg04r0+CP9rYfo?=
 =?us-ascii?Q?fFLMvH7jJ+w4U+WEugMNirGEUQACZ422/xwsSs+/ptYE0kl8N9C6liYQ+mrM?=
 =?us-ascii?Q?kS2IdXHVwKu68p4NcN3PcGAqYWhQVm6CaK0S7lcWKNDkdqHyTn66YF5g5Eg3?=
 =?us-ascii?Q?cq+1bjdCRhXBUl7pSzAKID3HY8IOgROfkflHLuoHZ5vaIVBqVLzRiUxY78d0?=
 =?us-ascii?Q?cj0EWSg/cKeNvrdVVREZrP89BxmjWGsHPIocdRZjt/XvJLdwMUisztumEg0h?=
 =?us-ascii?Q?h6KLfswD/oj3D6Eooj2qo80MKAbmu3A13HYkiQsSpBI6LWGqJX1fbav2PfFF?=
 =?us-ascii?Q?vcnhXCxLogt6RuALLTgt44sc9EpWz0OH6ChOggDqZuY/O06HB6o6mtToeDVd?=
 =?us-ascii?Q?j17vH+kYBrxuNfTwvaSY/DMsH1PX3ZUb0puEnJJc932K+CAV5p4GhrqpAJbE?=
 =?us-ascii?Q?hYoo6aMdwO3DC57qFInfkHZSBOMF7mYn6a06H/wPsD7vqkNQgUUILHjk5o4x?=
 =?us-ascii?Q?KyQ9yGbocwYPH+LO10vmEChXIJYes+fZE1y9jhhnRmFt9O9PdqhG/eB1WIS6?=
 =?us-ascii?Q?oiLFV11d2NHVdQsRxWr1m6qPRVtO1Lc1RKkF4EFehrbSv4sOrI2SkQ3t4b/2?=
 =?us-ascii?Q?0WwCQ8YPB9c7p0PRwFvsCOvUsTvblmDVGDUGNjNzZljBX/xoqIRF+P2WwW0e?=
 =?us-ascii?Q?4sT1bvJLQeYcuAYQW3O/5klnKJlUlwq2WoUX6pYy5hmQNoeyvU5GEyBC0rkN?=
 =?us-ascii?Q?h9CS+UA8vmotYgrZVJILJlYycVtzOuXySmvMsurvkklmZqQlXUwLvS4JYtzp?=
 =?us-ascii?Q?PqthrLMZoWO9LHICxs3G4tVVPdRgMAH4ACfG33HIoZ54go/5yBgQrIlszIDf?=
 =?us-ascii?Q?RJjkOlPurPiA36We8Sv1Cf2Qg9arh+664YRkUozEEk766zk7hPbUy731x3ws?=
 =?us-ascii?Q?7AWbfrCWjYYEQ/r9iabKWaSoerNw95zF7Ar25FFjplLdkF+KcLyf4HOO4+Qi?=
 =?us-ascii?Q?bmagk/8r/mdB2+SveWEaLYUyyNO6sRVYT4fzOqkEWozs3qQqIL79PHdd3RPd?=
 =?us-ascii?Q?MbZYW9g66axumQPocuSzoxb12oioTePg20Gd467mmHQnodmA5PUY80bXutIT?=
 =?us-ascii?Q?6phRh8g1dPHTll7xDT62eLejFaXZKdWx3XDd/UkACDYhebikgq4Y1zA9yJG0?=
 =?us-ascii?Q?+iY9bmrTFVKbbvTZj3XK8AWSZWXUk55iJx4k5biWZ1Kkf/jUD9fjw8x91egf?=
 =?us-ascii?Q?Zw2QjkVLWIt9IsmvlQr1AbXeODtGA+JLjpTtc3qxKzLY1yqTvFVPFvn+rdPZ?=
 =?us-ascii?Q?Vf3MJroFz0pVCQsEVIz1tVmUdo/rnF93E+sSIyIedavi6oTiMY1Nj72EnhvN?=
 =?us-ascii?Q?VCuMn0LOqRXwUWB9Y7ZvbBEWzhsMfxEqw1+/ajX5gj+D9xUN0QS8KuOtsAGJ?=
 =?us-ascii?Q?HpOp1plITH/m/+Qipjod/EQAtxQ+PHPcWFvKt22kAQ7dkYgFWB21AbhaprYj?=
 =?us-ascii?Q?wCNfUk648lQDiwb6mOsoY1o9wE6JhRGS37EGRec/iBunAclZLRfh9wuevK6u?=
 =?us-ascii?Q?cw+L6dE8iEJqjTLo//FHVpsMus/3Hn6xB/0m++ub?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c562cd0-c8b3-4a15-818d-08daa149323a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2022 12:01:37.5132 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uZi/s1HjdWnW3zEUj7PsH8K8vgHTWSTlo/G+JAaJpNcYka6G/TBx0MIkos+rSdn3ycyVBY92ReeG97esEEOpbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4337
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series aims to fix a number of page reference counting issues in
drivers dealing with device private ZONE_DEVICE pages. These result in
use-after-free type bugs, either from accessing a struct page which no
longer exists because it has been removed or accessing fields within the
struct page which are no longer valid because the page has been freed.

During normal usage it is unlikely these will cause any problems. However
without these fixes it is possible to crash the kernel from userspace.
These crashes can be triggered either by unloading the kernel module or
unbinding the device from the driver prior to a userspace task exiting. In
modules such as Nouveau it is also possible to trigger some of these issues
by explicitly closing the device file-descriptor prior to the task exiting
and then accessing device private memory.

This involves some minor changes to both PowerPC and AMD GPU code.
Unfortunately I lack hardware to test either of those so any help there
would be appreciated. The changes mimic what is done in for both Nouveau
and hmm-tests though so I doubt they will cause problems.

To: Andrew Morton <akpm@linux-foundation.org>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org

Alistair Popple (8):
  mm/memory.c: Fix race when faulting a device private page
  mm: Free device private pages have zero refcount
  mm/memremap.c: Take a pgmap reference on page allocation
  mm/migrate_device.c: Refactor migrate_vma and migrate_deivce_coherent_page()
  mm/migrate_device.c: Add migrate_device_range()
  nouveau/dmem: Refactor nouveau_dmem_fault_copy_one()
  nouveau/dmem: Evict device private memory during release
  hmm-tests: Add test for migrate_device_range()

 arch/powerpc/kvm/book3s_hv_uvmem.c       |  17 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  19 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.h |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c     |  11 +-
 drivers/gpu/drm/nouveau/nouveau_dmem.c   | 108 +++++++----
 include/linux/memremap.h                 |   1 +-
 include/linux/migrate.h                  |  15 ++-
 lib/test_hmm.c                           | 129 ++++++++++---
 lib/test_hmm_uapi.h                      |   1 +-
 mm/memory.c                              |  16 +-
 mm/memremap.c                            |  30 ++-
 mm/migrate.c                             |  34 +--
 mm/migrate_device.c                      | 239 +++++++++++++++++-------
 mm/page_alloc.c                          |   8 +-
 tools/testing/selftests/vm/hmm-tests.c   |  49 +++++-
 15 files changed, 516 insertions(+), 163 deletions(-)

base-commit: 088b8aa537c2c767765f1c19b555f21ffe555786
-- 
git-series 0.9.1
