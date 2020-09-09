Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2CB263954
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 00:54:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8D856F573;
	Wed,  9 Sep 2020 22:54:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750083.outbound.protection.outlook.com [40.107.75.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF3AB6ECE2;
 Wed,  9 Sep 2020 22:54:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MDwC4X/0NnBRELrM3MCEe0qDgwH7YhCdisAE3QC2lmF/xaza5F24W1H9WNiCbzUdq/wPSmlOaaddq3OQ0ZShP/0Ve7+7nGZL3JjdHiXEq6tPUiG0IdZV2/ZTTxzd3L6GV2EKDlUxLsVsMvDrdpUra5Mu3a+orRy3BeptxkLnxBalJtgIQByq+kU9w3jP9xUKEKPufvav+lj5k0qlCODBGcfdDByoyX97p3i1Q+zWvnYFeepiENyfla4TnHb26SChMG3JS2Z0H2QZAo/fc1Xfbnr2lVR6OMCLYv+rFvLLrXRSfxgT7ACTFskJNXZyfyoO8+XLKdAkiTT2TcRRf6T9iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z5BIUjfF0d2v6kMLZRJe4rMltsy6/ZM3fbKtaDBzEA4=;
 b=QT/r0blPJNC/gAc3xAgkJK4QsFrQuBCmWBR0IskqD1IsbCpCb2HFUFe5hEhlpfa6fhPJ6Hg171MZwASasnng6dPhESBlwS6flNZLn3D3P10kVk2vv7oBpGIhMIOMemiDBwXj0OE8NUJlpt+OeavWO68C49C5WH7IEcdhAkGSumsy1EGFGz/I4hddkpIYbxl5PbedbK2ehN0KmnCeeIOG3xt5bwE+djWoBqqV4Ewg9+jAO+aOEyfKGSDyqrMGaB+TNv0hNn54xbE+qh7ir0q2fCVkPt+UsVQSTStz49OjdA2Ds2ra740Lt//7oHvXM5ZzyB4kpwSvoRWdBIQQtdLh6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z5BIUjfF0d2v6kMLZRJe4rMltsy6/ZM3fbKtaDBzEA4=;
 b=QIqHWdNYxYKtGjgPLX0tRH/vwnvJWIT+XqJzYf5G/OM98RCXspDlnGtrx1iDE4TukRJIhTkItX+gAQWnTVrv/5GaH8jcxvETZSzgJDnYOROSPw7driGrWTostbZSWtwzzzz2cTEifFGhvspT2Ff0RsHObXr//lXysDa+1vG6DOo=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4124.namprd12.prod.outlook.com (2603:10b6:5:221::20)
 by DM6PR12MB2986.namprd12.prod.outlook.com (2603:10b6:5:39::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.18; Wed, 9 Sep
 2020 22:54:34 +0000
Received: from DM6PR12MB4124.namprd12.prod.outlook.com
 ([fe80::25a1:ace4:4ca8:167e]) by DM6PR12MB4124.namprd12.prod.outlook.com
 ([fe80::25a1:ace4:4ca8:167e%8]) with mapi id 15.20.3370.016; Wed, 9 Sep 2020
 22:54:34 +0000
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] Enlarge tracepoints in the display component
Date: Wed,  9 Sep 2020 18:53:49 -0400
Message-Id: <20200909225352.4072030-1-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.28.0
X-ClientProxiedBy: YT1PR01CA0143.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::22) To DM6PR12MB4124.namprd12.prod.outlook.com
 (2603:10b6:5:221::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from atma2.hitronhub.home (2607:fea8:56e0:6d60::10ec) by
 YT1PR01CA0143.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3370.16 via Frontend Transport; Wed, 9 Sep 2020 22:54:33 +0000
X-Mailer: git-send-email 2.28.0
X-Originating-IP: [2607:fea8:56e0:6d60::10ec]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e2ac2a58-7a61-47a1-f1a0-08d855135227
X-MS-TrafficTypeDiagnostic: DM6PR12MB2986:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB298689DFFC3A0DBD8F4F603798260@DM6PR12MB2986.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LYiN00V6piOB43+wmUcptqubVEjRaMygPHkInp7ZjIeu8Ncw5EOwl4NLAa/7iTxVsgl58aA1G2JrT0Wle8OhZ2dHhE50VV/DN1cbKymGsQzkY1W3+IYc3yonmUfneC3WXHfae1yWrenf4pZTwLAXdA6bI0JVOv+LVtXSyc/HrKpVMd1cEOPqIZdnJ+pGhWZ6VozqUQYxhABrawPfwvr/edl5aa0CXdWm0MXaab+zSinV4kQzB1bfVQOTOerAuTIBwbx8XzyYFO1S6JyVV9t7Pq28yby68P82bOrFftGYfhME8c5Za6prgKv3MVXSvrXSUhFsPX1i6jTdSsho5D6CLWGyoOXcCL/p38YBhGuQqsa21guyZ7nEJCe6EDK++bAqulLnw2vd8nPyyyicfn0aPg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4124.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(136003)(376002)(346002)(39860400002)(2906002)(8936002)(6486002)(6512007)(5660300002)(16526019)(186003)(478600001)(83380400001)(4326008)(8676002)(52116002)(316002)(1076003)(66476007)(6506007)(6666004)(86362001)(2616005)(66556008)(54906003)(36756003)(66946007)(161623001)(147533002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 943V/dXkzX4WOInCZUFg90ImvFSYQA8MdL1YKx8+g9c7h1nDLib0g9H08QjBNSDHMdZ2yu+pCw8hxz+M/YZPzHCc44GVihCbqZU2IWAoK8zua/MuWT4GTopn7OJLKsobKrMiMEGKGcWrpvsuTKFavwvhrV/6taROFRfLet4zo3hHtpGvymSO01KPIIkcN3ABMKi1eeSiFOK22YZ4FCmusUtTqj1D2vwh+W9y3YxIHpCPFEEej7lX0oRio/ikRD+JjEkMjW2XSSduJAWaJD3tDZ4EOFXMFgnZHOQe1vupASkcRyhpQBIUezwYKQ5M/4H6K1fC3ouKAnE0fI1ULQ+/6DkBk6tXAPy9SdbkVmUbmHT+i90QiWrYvNPIxWWEoLePZIDyChxBm+Mnpahe2wmdgA5DvJx6wiwHmy3ct6yBXBtyxD+ZC0nlkD13LOP6HYqw9TuS6M/XCg+eRBmMoY5EZ7tgOGNpGGDi3xrPwWmmwG92vN7hXYETc6D2yZbscFTnq+KPJjuyDBiCcqSwCzk9J2G7MtJFJeRaHrlnbNXfTygjHAwBplSPvmXSKaHxBB8InVW7bfZ3RlCtU7UNA1EZqT7z/3KSN/Xzn5vOyEJwMkFfSvrSHWhHqVzyExjm+MI2t8kRZM6LHKO6YZs/ksT3WRQtjaLuW/VNG65Oqot7YxYMUyWzxm9iTsMq/4XYsaKs
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2ac2a58-7a61-47a1-f1a0-08d855135227
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4124.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2020 22:54:34.6095 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qad6j0Wp+eVwa/YEDMz6Ky72RVYPk3JYN3/VZuwqJSfZttZdHOmoCTjAFR4dGNINJ0T/IWG42NwAtlFv3tHO0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2986
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
Cc: Leo Li <sunpeng.li@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 David Airlie <airlied@linux.ie>, hersenxs.wu@amd.com,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Debug issues related to display can be a challenge due to the complexity
around this topic and different source of information might help in this
process. We already have support for tracepoints inside the display
component, i.e., we have the basic functionalities available and we just
need to expand it in order to make it more valuable for debugging. For
this reason, this patchset reworks part of the current tracepoint
options and add different sets of tracing inside amdgpu_dm, display
core, and DCN10. The first patch of this series just rework part of the
current tracepoints and the last set of patches introduces new
tracepoints.

This first patchset version is functional. Please, let me know what I
can improve in the current version but also let me know what kind of
tracepoint I can add for the next version. 

Finally, I want to highlight that this work is based on a set of patches
originally made by Nicholas Kazlauskas.

Rodrigo Siqueira (3):
  drm/amd/display: Rework registers tracepoint
  drm/amd/display: Add tracepoint for amdgpu_dm
  drm/amd/display: Add pipe_state tracepoint

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  17 +
 .../amd/display/amdgpu_dm/amdgpu_dm_trace.h   | 514 ++++++++++++++++--
 drivers/gpu/drm/amd/display/dc/core/dc.c      |  11 +
 .../amd/display/dc/dcn10/dcn10_hw_sequencer.c |  17 +-
 4 files changed, 523 insertions(+), 36 deletions(-)

-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
