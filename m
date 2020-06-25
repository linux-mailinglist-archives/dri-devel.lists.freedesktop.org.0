Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6814C209C4A
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jun 2020 11:51:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ED846EA12;
	Thu, 25 Jun 2020 09:51:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2047.outbound.protection.outlook.com [40.107.220.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CF096EA12
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jun 2020 09:50:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aFjz9FR0gWHdKTC1l2sTGusL9GzW0ZIyDn0T1GwX7C57xc9zHrhwvs5IHA+bkkm+mpHdbUQYRk/YzLBTvViUN5NDrqjsVJgN6ztb5DqJtQTfK4nI8RoK64/Yh2jc5y9mLzH2UpQmcqVTh8wEH88fa+WCDs93yrBwGNpJLbnvDxP34wRspRL+6Xp/D6h9Y67mhzvxboV1n6Jo/hGIK6RNTMKgpkbn57tbtvSnbuKUd7ZnqkBBv5nj4fAOyF0jpMrxinNBgIXfTYw6dghE2Xg1r5UoRXOkfZutXFRYNyYzVAZBJU9Ndam6u837W5YY6vkCbu18hfp2iKrcvtAjw9p0VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fBQgXDW/oNjCAR0UexdfiBmfVbN8+36i8+PSxrsacvM=;
 b=W3COgZ3riJd6jVEwJV1uUNDJ0hYWO4111xciouJZ4H7EhQ0FmHcYp7FoPvCJ1/3OGThveB1odL4fF/q/13WTIuNO3vye96/2RDEhWSfwXQoP+jTABl7WTNRYL30r9DtbwANVaM+m4nUBDgdQBmwccaP16RHvsQ3Pu6C1IedihkFI/DpGN6CoAOe+7is1EatULLVkX8XPF6/uP7H4gLz+7z2a2bvz1UX+oiqQiU1KQGXZkB9nOr9gOCE+Z8Z2aackufPxH9c9CFyGlcJmCPvj3+EQebw9EUwxLf2+OcZFL/X57SXoXH4tlVQyXzNIkyZR3acDMVQh1Kc9DFDGH6T1aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fBQgXDW/oNjCAR0UexdfiBmfVbN8+36i8+PSxrsacvM=;
 b=05sTVYzbt6rvmK6a4evJ4QElBWAiShaIXFsxDiE9uB/xJpuz7aolPPWJtDOq9vR+gzGncRA2CJM0QwBk6i3xDtiZFwe72oO/eMXJ+wSVAvEmFuHFHVwUfAxeQw0c5WLINZCooFSYQTRbT9LYtnvcTj82aXUVBtCOF/OYWSJ94dU=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4401.namprd12.prod.outlook.com (2603:10b6:5:2a9::15)
 by DM6PR12MB3531.namprd12.prod.outlook.com (2603:10b6:5:18b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21; Thu, 25 Jun
 2020 09:50:57 +0000
Received: from DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::a045:f8c0:8edb:1ef1]) by DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::a045:f8c0:8edb:1ef1%9]) with mapi id 15.20.3131.020; Thu, 25 Jun 2020
 09:50:57 +0000
Subject: Re: [RESEND] [PATCH v6 0/8] do not store GPU address in TTM
To: Nirmoy Das <nirmoy.aiemd@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200624182648.6976-1-nirmoy.das@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <b5629fcc-ba5e-4882-bafb-d88ef0ef144e@amd.com>
Date: Thu, 25 Jun 2020 11:50:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20200624182648.6976-1-nirmoy.das@amd.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR02CA0012.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::25) To DM6PR12MB4401.namprd12.prod.outlook.com
 (2603:10b6:5:2a9::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR02CA0012.eurprd02.prod.outlook.com (2603:10a6:208:3e::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3131.20 via Frontend Transport; Thu, 25 Jun 2020 09:50:54 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 86820a7e-6a60-40d0-4159-08d818ed420a
X-MS-TrafficTypeDiagnostic: DM6PR12MB3531:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB3531526A4757E28D33E96D3B83920@DM6PR12MB3531.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0445A82F82
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fN3L12k6K/kdXBcQwAJ+G6+BfzHcDlJep64WyQyFbtxBryZPt/HfGq58ikcsn+A8cQvpFN/+0/WQyFjslCa+HPAnW7hd4CYN4a0vMZr9RT21mNBd+Kz0bZ2T6Asbx2EYJIvwf0fO+jEc7isuuurskbxMNznGwTvY4hYpVyc4+xp0/wssB9DCk2WV88jqb2grl74j2fXJ2o194ceQJctTH0+g65CxbKhnff8boBxGcb20PCmv08U2SdJz8b2BdA+OW1cM1WeOGL0W9sRNbRdV0/neQyyI2A/jEvs0mQajeXCv0g0+UkQbWFNHrALS+r2oxGKSu40hPxdXt3syuhi6OujxWGlb3AnUFn2SvyM0zH+3N4hvNZHvInxf+9shwraS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4401.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(366004)(346002)(136003)(39860400002)(396003)(5660300002)(2616005)(31696002)(66946007)(6486002)(8676002)(8936002)(186003)(83380400001)(4326008)(36756003)(31686004)(7416002)(16526019)(52116002)(478600001)(86362001)(66476007)(2906002)(6666004)(316002)(66556008)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: Hir2v98IkS6r+cqVOwiVQebqnf9LslwHOSLhU6AA6ymb57XosIl14uBF1ZeZu8zNPYq+XyXtabqNVzNN3rMjWrPIRMmyAi58wp18/icgiGTgA/nkqevPMTXAOSY1AZ9/lpPzGjb3yshna/8v/G+bPRHpNYqBrEVwushlfFGetlS+QIYr/0WafCGuGaX6F1i0TDYmsepzS24LVqphvF1AVI+MZWf/weCowT4ZanU2MmDpK6j09+HUn0f5/gQ8mC4URUoBsKozxJzqNakmnEt6N2PXHBCcK4gxZfhmxs6ftE8A0BoptOLi1NItkFDYU5NkfM2aj0s8OHNP8M14ZS3KQ7KiZ0/yleSbzPuJ16ae56yJNX/xWsSam0ip/1XJ7CFl/hD71ODaRkt0KfQVj5htkQ4NQZm/fHJeU1Wgx4ssY507Hqh6jXrZlU1GGqo/WXOKWPIItYKOVTkP7znRsqpcWic0jq8YAMoL/XE1i0kdzgmzbfF3P+FTlqALelzCPjs9wWosTwq/UTnCFOvMpOFlBsbsZjTTJNQdpKr2rPlyozlK2JPfZ1MPfYxDvWHNzgkD
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86820a7e-6a60-40d0-4159-08d818ed420a
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4401.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2020 09:50:56.9519 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RGsCEoE1Ly04pa+8W+A93xl8dFDQueSOb41mNzhha8B9eUt17kOWCPrnFqdTgaxI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3531
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
Cc: sashal@kernel.org, thellstrom@vmware.com, airlied@linux.ie,
 kenny.ho@amd.com, brian.welty@intel.com, nirmoy.das@amd.com,
 linux-graphics-maintainer@vmware.com, kraxel@redhat.com,
 alexander.deucher@amd.com, sean@poorly.run, bskeggs@redhat.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I've pushed patches #1, #2 and #5-#8 of this series to drm-misc-next.

Only VMGFX and Nouveau are missing and I'm pretty close to just push 
them with my Acked-by since they should not contain any functional change.

Any objections?

Thanks,
Christian.

Am 24.06.20 um 20:26 schrieb Nirmoy Das:
> With this patch series I am trying to remove GPU address dependency in
> TTM and moving GPU address calculation to individual drm drivers. This
> cleanup will simplify introduction of drm_mem_region/domain work started
> by Brian Welty[1].
>
>
> It would be nice if someone test this for nouveau. Rest of the drivers
> are already tested.
>
> v2:
> * set bo->offset = 0 for drm/nouveau if bo->mem.mm_node == NULL
>
> v3:
> * catch return value of drm_gem_vram_offset() in drm/bochs
> * introduce drm_gem_vram_pg_offset() in vram helper
> * improve nbo->offset calculation for nouveau
>
> v4:
> * minor coding style fixes in amdgpu and radeon
> * remove unnecessary kerneldoc for internal function
>
> v5:
> * rebase on top of drm-misc-next
> * fix return value of drm_gem_vram_pg_offset()
> * add a comment in drm_gem_vram_pg_offset() to clearify why we return 0.
>
> v6:
> * rebase to drm-misc-next
> * removed acked for vmwgfx as there was a small conflict
>
> Nirmoy Das (8):
>    drm/amdgpu: move ttm bo->offset to amdgpu_bo
>    drm/radeon: don't use ttm bo->offset
>    drm/vmwgfx: don't use ttm bo->offset
>    drm/nouveau: don't use ttm bo->offset v3
>    drm/qxl: don't use ttm bo->offset
>    drm/vram-helper: don't use ttm bo->offset v4
>    drm/bochs: use drm_gem_vram_offset to get bo offset v2
>    drm/ttm: do not keep GPU dependent addresses
>
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c  | 23 ++++++++++++++--
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.h  |  1 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c     | 30 ++++++++++++++++-----
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h     |  1 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c |  4 +--
>   drivers/gpu/drm/bochs/bochs_kms.c           |  7 ++++-
>   drivers/gpu/drm/drm_gem_vram_helper.c       | 11 +++++++-
>   drivers/gpu/drm/nouveau/dispnv04/crtc.c     |  6 ++---
>   drivers/gpu/drm/nouveau/dispnv04/disp.c     |  3 ++-
>   drivers/gpu/drm/nouveau/dispnv04/overlay.c  |  6 ++---
>   drivers/gpu/drm/nouveau/dispnv50/base507c.c |  2 +-
>   drivers/gpu/drm/nouveau/dispnv50/core507d.c |  2 +-
>   drivers/gpu/drm/nouveau/dispnv50/ovly507e.c |  2 +-
>   drivers/gpu/drm/nouveau/dispnv50/wndw.c     |  2 +-
>   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c |  2 +-
>   drivers/gpu/drm/nouveau/nouveau_abi16.c     |  8 +++---
>   drivers/gpu/drm/nouveau/nouveau_bo.c        |  8 ++++++
>   drivers/gpu/drm/nouveau/nouveau_bo.h        |  3 +++
>   drivers/gpu/drm/nouveau/nouveau_chan.c      |  2 +-
>   drivers/gpu/drm/nouveau/nouveau_dmem.c      |  2 +-
>   drivers/gpu/drm/nouveau/nouveau_fbcon.c     |  2 +-
>   drivers/gpu/drm/nouveau/nouveau_gem.c       | 10 +++----
>   drivers/gpu/drm/qxl/qxl_drv.h               |  6 ++---
>   drivers/gpu/drm/qxl/qxl_kms.c               |  5 ++--
>   drivers/gpu/drm/qxl/qxl_object.h            |  5 ----
>   drivers/gpu/drm/qxl/qxl_ttm.c               |  9 -------
>   drivers/gpu/drm/radeon/radeon.h             |  1 +
>   drivers/gpu/drm/radeon/radeon_object.h      | 16 ++++++++++-
>   drivers/gpu/drm/radeon/radeon_ttm.c         |  4 +--
>   drivers/gpu/drm/ttm/ttm_bo.c                |  7 -----
>   drivers/gpu/drm/vmwgfx/vmwgfx_bo.c          |  4 +--
>   drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c     |  2 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c        |  2 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c  |  2 --
>   include/drm/ttm/ttm_bo_api.h                |  2 --
>   include/drm/ttm/ttm_bo_driver.h             |  1 -
>   36 files changed, 125 insertions(+), 78 deletions(-)
>
> --
> 2.27.0
>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
