Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D962350025
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 14:25:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73D586EA8C;
	Wed, 31 Mar 2021 12:25:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2087.outbound.protection.outlook.com [40.107.236.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B8386EA79;
 Wed, 31 Mar 2021 12:25:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gccE6XOYIQVBxqoRNY74+QQiyXs/DZ+fPKpr3knqlcMByAAaCPrXTB28DT9DNZz8o7hwIj6+oChYC7G+4raWLmVzcQC1mV4T5M01v4Kh9O8sIs0KrzHz1NwT8dLevJekCvzLbjkR+Xo83ZIMsLtv4GfwJwGsoxawGzNe/fQOTcZ2ezpFoiiEXsQSJtrYHzSX3txNEFvj7H6A8eF+v+jotrpc0/VYRnh1TpCRgsT3bnGXJomjvwi6auSD7bbPn9xvdasAQnxME9dQeT6tOUzho/1VBZzseWph7TefybHHYYx9yK+qomUSWKhj4/ZqVqeO0orcgfyPvqrRl6Y5HZ18rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K6MK2JyUwkCwzwbnfxVRkW1N35dXr46ZhPt+CG8C1Sg=;
 b=BAzrd9GzUvY1yLxsOnB/MY67Phz9y6vu/nAj7IaHuu4Sl88/JcQOnDi8Kat5/uGExIVxUf81YtV5G/nd4mLFsEEOxoqz13jAuQruHMe+1OAuQDma/PAgde9vBpLq9C4w76UElUPpQwF814zH3rsBD1Dp/WoOApJiQt72t0br1zXQHvN+Y2cwyXEk5F1GKsouvJ5gBKDRnydgawUhIDIE+KkTJ2ldUBYL2jmPd0GcLOLLPeg72tooS/skAPvCrDlN7keVmPIPlXeNK9eEEz/NCNG1M474zu2LSvdapuDVt8nlu7okma5LP18+MLekcdE0OuRHHCTW836dHF7nOxgmdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K6MK2JyUwkCwzwbnfxVRkW1N35dXr46ZhPt+CG8C1Sg=;
 b=AB1UMfO1w3B2ED5w7PHlbnJcL1fCSlrOPwxPUm9yMn+5Ypp3NF43syfPWpSQ6umkdewgUeWE/ZH7hITNjdGSiFlnTnxpE0dx6cgjJ4cjvH25asAmznTW8OY6ltl0WtL4vw0TOSlWlyw1dU4pfqcs+hA4IVoSz78NRPQsGsEAdJg=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB2601.namprd12.prod.outlook.com (2603:10b6:5:45::27) by
 DM6PR12MB2937.namprd12.prod.outlook.com (2603:10b6:5:181::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.27; Wed, 31 Mar 2021 12:25:21 +0000
Received: from DM6PR12MB2601.namprd12.prod.outlook.com
 ([fe80::3d2c:5edf:5d51:4101]) by DM6PR12MB2601.namprd12.prod.outlook.com
 ([fe80::3d2c:5edf:5d51:4101%7]) with mapi id 15.20.3977.033; Wed, 31 Mar 2021
 12:25:21 +0000
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Harry Wentland <harry.wentland@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, Peter Zijlstra <peterz@infradead.org>,
 aric.cyr@amd.com
Subject: [PATCH 0/4] drm/amd/display: Base changes for isolating FPU operation
 in a single place
Date: Wed, 31 Mar 2021 08:24:58 -0400
Message-Id: <20210331122502.1031073-1-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [2607:fea8:56e0:6d60:1683:1bc7:ac8c:6a3]
X-ClientProxiedBy: YTBPR01CA0006.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::19) To DM6PR12MB2601.namprd12.prod.outlook.com
 (2603:10b6:5:45::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from atma2.hitronhub.home (2607:fea8:56e0:6d60:1683:1bc7:ac8c:6a3)
 by YTBPR01CA0006.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.30 via Frontend
 Transport; Wed, 31 Mar 2021 12:25:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a9332084-2af5-4314-44fc-08d8f4400d70
X-MS-TrafficTypeDiagnostic: DM6PR12MB2937:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB2937862060DFC2440FF0142C987C9@DM6PR12MB2937.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7xTWSGXkgbywl1IVaAJnuJNYxh+7zfv/lsuZ81pd3UiLjQJN9hgJf51Ks/4Ij+QgyQ41CsCZPuMhyptLU3FGUeJ23Jj38obbNcW+NRGfG1Fu/joDJAIcBiusdjiuyTYC45iBjUug/s0lBnj1Dv80XjmGfCxDN1W9a0lgfLQWZQeucaAL2zXvkjFfx9poT14Y9nR2+Ol4pof8iLZB6t31SAAhjT5Akt2i9mvs5oNzO01u2krdoEYxST6u0Xzv2/qTQm7vlH7PMPfKROQn7s4nbMvW7H8dJwIju2Hq+0uMvoFYFgx2SvHvJuyh9Inm/MPD3rrJR8+qY4bgGNN21ItigeI74E2/OIGzQKip/LDlyilC3FdvqjzLoDeHQGfUgZ7dS/BagFOqd5m/2mUVQFJYpFnRtonX56A7ME8hhgX2wJyb3hvBIp2fKc6DHUYbeeIQuHezZV4YkmuqNN7qksygbky7QhVwDQJIBb16oEnzajjBQA/kiowh5FE25wEMfTSkUQie28uWZM00fbfiSTV7Vzghx9RwkMgKp0Y+OTE+cQJ5Ubn6QDIRkbJCyAV/NFPAWEZU01emWgnuMq0arLTtaMjqH8kbQZ3jIfcvBwrDFDCgRjvehkasxUogTjXHuTw6WyEY5nu3a8cd32z5LuSYDQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2601.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(376002)(366004)(136003)(39860400002)(316002)(38100700001)(2906002)(6636002)(6666004)(4326008)(5660300002)(66946007)(36756003)(8936002)(83380400001)(478600001)(66556008)(66476007)(6486002)(8676002)(186003)(16526019)(6512007)(52116002)(1076003)(2616005)(110136005)(86362001)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?X/dkPXRcUHxkflADgC7G48Z7Gkd2sLSi4DFu6VNuHr4FPbv1a+ndK6k0llzk?=
 =?us-ascii?Q?HVDaLo14XqMz7FM5badrvFcx0I0gRqb7hgqreKxM43N2QIVhAtdHRSPmx8UT?=
 =?us-ascii?Q?bGCn9q7BVYfciX7hVxqZvqFHEtlrqQoGdpEI3rWOGEXIiKkx88OT1oVvjNOK?=
 =?us-ascii?Q?OKnwdfZy+hK1sT7QkhVMyQ8NJTsG0b22dpp/smUYO9uGtx6BOQ8so3F7kpeC?=
 =?us-ascii?Q?xflb6lZ0sgUHjQBWiJC+MtrToLzoo4O5au/wq89j86P+DUiAcx+qmsLkscbd?=
 =?us-ascii?Q?lBf/qqGtF+VP/nPUvh0s/VdDbrWf2NfC3PeEaWEScdhM1IMudwfZyozkZKfq?=
 =?us-ascii?Q?nccCRD3LSrRTLqJ+s2l7LRsQipPpikYrRB6wEXdIiTIQbNqm1t5mEi6VX6yC?=
 =?us-ascii?Q?UQIuRAZphMGV475kb13eezYWrslWGh/5wL3LW8X/WwaXcoMfDoPgmoDNtVY2?=
 =?us-ascii?Q?BEwFFYyxCcUsOr4md5f4WOSjVIvWnAfVywfEPbcPNFtoPDhQo8yWZfbNjbE4?=
 =?us-ascii?Q?BD+/xnRkEIBgWG4mD1OWSfic/GYrad8DnyK0asIP9krll6dIMUfuzsNhubww?=
 =?us-ascii?Q?ZHI5vacWlIAGJyuyh/wFFQ9LGPISCczcVO1wEoQu2XHbGki7IAEHkuquIGen?=
 =?us-ascii?Q?syTyUhkjfMu8lzYWN/g5fIdNC1c1rMdFxsqFJThQUrGBrfb0DIyIJIUV3LJH?=
 =?us-ascii?Q?LK2pwo2vBtbxVn0KnGHnU8jCHzLF27WIFcBfF1BhVuIMbj897rZb8XuyFYxn?=
 =?us-ascii?Q?vqnzvVKQtflWhLEHHNmJgw9aV7ntUaASneVoDh1mJfxeaAiYVcYoy0jHxPsb?=
 =?us-ascii?Q?JGNBjS1wGRoBDJ3e9/TEZmRzP/jhusBgV/zKIEYkHeMe2ccK8HxQY/B/ahVI?=
 =?us-ascii?Q?6u2D/oSd7qdVV3Lkkpt3Pmks46vl2XFOvtEfFI4q3uR4QC4Y5IkY4B+VqelJ?=
 =?us-ascii?Q?RB01Gc5ucZuc8KowHjBqGNWwnEGlxly+fq7W0hlUldF7qG1Glg4HQPymJ4SG?=
 =?us-ascii?Q?G20dMk+BGc0L57NEEIj4WJ4/g9syUyZoBpn0ErK87yuivo3nER+o6CiZtSza?=
 =?us-ascii?Q?WiSGGcY3zHs984yQYdXI9LwATIfKacQjheA1/Gmdd/eu+XWpMZE8yy2kGxga?=
 =?us-ascii?Q?dlyHjVqajZVFyOn8nZJmIl56Dkiis8HS6sJ/SnK6/fGFGIXlpOItnA0GoAYD?=
 =?us-ascii?Q?zYsTp64g1RbSmmsB8BI7LOurpxGHQoG+4iWshlON2gHMObxhNfKF/EIpCSty?=
 =?us-ascii?Q?jgUmFAkpbUFHN4LXBjMz0MYh1SOEZSznJ14oOq1gj3xL00GO5TUm7keYP6Od?=
 =?us-ascii?Q?4LC3A9mNqV12BgkMp5qYXRGn7viHUYcTlWptpOXMkrE7P2UIIXC5sU8R0udk?=
 =?us-ascii?Q?sfThL0C74SB/TZqJ64BzccGVNh33?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9332084-2af5-4314-44fc-08d8f4400d70
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2601.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2021 12:25:21.5579 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xqnLfLyZRZbFQjuGkODlJTUA9yAlqalz3G2YHwYBlJKi26yV2j6wy9XnfQ+afy/K6k+ri1Yi9iHDQ2C7roVXQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2937
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

In the display core, we utilize floats and doubles units for calculating
modesetting parameters. One side effect of our approach to use double-precision
is the fact that we spread multiple FPU access across our driver, which means
that we can accidentally clobber user space FPU state.

# Challenges

1. Keep in mind that this FPU code is ingrained in our display driver and
performs several crucial tasks. Additionally, we already have multiple
architectures available in the kernel and a large set of users; in other words,
we prefer to avoid a radical approach that might break our user's system.

2. We share our display code with Windows; thus, we need to maintain the
interoperability between these two systems.

3. We need a mechanism for identifying which function uses FPU registers;
fortunately, Peter Zijlstra wrote a series a couple of months ago where he
introduced an FPU check for objtool. I used the following command for
identifying the potential FPU usage:

 ./tools/objtool/objtool check -Ffa "drivers/gpu/drm/amd/display/dc/ANY_FILE.o"

4. Since our code heavily relies on FPU and the fact that we spread
kernel_fpu_begin/end across multiple functions, we can have some complex
scenarios that will require code refactoring. However, we want to avoid
complicated changes since this is a formula to introduce regressions; we want
something that allows us to fix it in small, safe, and reliable steps.

# Our approach

For trying to solve this problem, we came up with the following strategy:

1. Keep in mind that we are using kernel_fpu_begin/end spread in various areas
and sometimes across multiple functions. If we try to move some of the
functions to an isolated place, we can generate a situation where we can call
the FPU protection more than once, causing multiple warnings. We can deal with
this problem by adding a thin management layer around the kernel_fpu_begin/end
used inside the display.

2. We will need a trace mechanism for this FPU management inside our display
code.

3. After we get the thin layer that manages FPU, we can start to move each
function that uses FPU to the centralized place. Our DQE runs multiple tests in
different ASICs every week; we can take advantage of this to ensure that our
FPU patches work does not introduce any regression. The idea is to work on a
specific part of the code every week (e.g.,  week 1: DCN2, week 1: DCN2.1,
etc.).

4. Finally, after we can isolate the FPU operations in a single place, we can
altogether remove the FPU flags from other files and eliminate an unnecessary
code introduced to deal with this problem.

# This series

To maintain the interoperability between multiple OSes, we already have a
define named DC_FP_START/END, which is a straightforward wrapper to
kernel_fpu_begin/end in the Linux side. In this series, I decided to expand the
scope of this DC_FP_* wrapper to trace FPU entrance and exit in the display
code, but I also add a mechanism for managing the entrance and exit of
kernel_fpu_begin/end. You can see the details on how I did that in the last two
patches.

I also isolate a simple function that requires FPU access to demonstrate my
strategy for isolating this FPU access in a single place. If this series gets
accepted, the following steps consist of moving all FPU functions weekly until
we isolate everything in the fpu_operation folder.

Best Regards
Rodrigo Siqueira


Rodrigo Siqueira (4):
  drm/amd/display: Introduce FPU directory inside DC
  drm/amd/display: Add FPU event trace
  drm/amd/display: Add ref count control for FPU utilization
  drm/amd/display: Add DC_FP helper to check FPU state

 .../gpu/drm/amd/display/amdgpu_dm/Makefile    |   3 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_trace.h   |  24 ++++
 .../gpu/drm/amd/display/amdgpu_dm/dc_fpu.c    | 111 ++++++++++++++++++
 .../gpu/drm/amd/display/amdgpu_dm/dc_fpu.h    |  34 ++++++
 drivers/gpu/drm/amd/display/dc/Makefile       |   1 +
 drivers/gpu/drm/amd/display/dc/dc_trace.h     |   3 +
 .../drm/amd/display/dc/dcn20/dcn20_resource.c |  41 +------
 .../drm/amd/display/dc/dcn20/dcn20_resource.h |   2 -
 .../drm/amd/display/dc/dcn21/dcn21_resource.c |   2 +
 .../amd/display/dc/fpu_operations/Makefile    |  58 +++++++++
 .../drm/amd/display/dc/fpu_operations/dcn2x.c | 106 +++++++++++++++++
 .../drm/amd/display/dc/fpu_operations/dcn2x.h |  33 ++++++
 drivers/gpu/drm/amd/display/dc/os_types.h     |   6 +-
 13 files changed, 381 insertions(+), 43 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/fpu_operations/Makefile
 create mode 100644 drivers/gpu/drm/amd/display/dc/fpu_operations/dcn2x.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/fpu_operations/dcn2x.h

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
