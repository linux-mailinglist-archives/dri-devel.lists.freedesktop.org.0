Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE81E9ED6C1
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 20:47:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD58C10EC02;
	Wed, 11 Dec 2024 19:47:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m1RnVUnL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E45F10E60E;
 Wed, 11 Dec 2024 19:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733946430; x=1765482430;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=hd2yCAJcwYWQtcr4NU5ydPYrjCDyK78CEKbFRYQdN4w=;
 b=m1RnVUnLq58u5LpPPNMfMR2jVnrG7qACU4lxiB4oEmXR/e4UXlIAgLoD
 DvpUNY+JxIWpqXegUfDWFCByVx0tzhsJ2p+qP3LLjLN23j9WM3hh/xV9/
 DzkFA/Ch3c2zalEmUuTj1wjLX4Gm9phD3gYKE4ciKZPKkTfq6Fab48ru3
 d/Pe1th4yzJaomOfUPIKPNARztcuzy8Rr0zRmkXouc+YtR1VM7gRulU54
 0MGi7uVsbaORpjRZJthwz4e+r6ryGuy3dP0SqmdHb9hFLENsp4f3FXNPO
 lMI/2xqha+qZ272CSXT6v+ALqyejrJKmoo9LVg/EfblSidR1TTJPdaFHl Q==;
X-CSE-ConnectionGUID: dX2ZVfwsR4qKeemqzC9KZw==
X-CSE-MsgGUID: hig3YXxVRDqusm41M0qHwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="51759231"
X-IronPort-AV: E=Sophos;i="6.12,226,1728975600"; d="scan'208";a="51759231"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 11:47:10 -0800
X-CSE-ConnectionGUID: D6bHvl25QguMJ1NYGvSPeA==
X-CSE-MsgGUID: CobJeaTIT1G8IDRF3sWJwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="96741628"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2024 11:47:10 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Dec 2024 11:47:09 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Dec 2024 11:47:09 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Dec 2024 11:47:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i/+1u0imSfhpbpwPTAR+YJPopLic/L8aBrqyY+hjDAq+XPPbooz49pEe0ZOhG5357AJVk3HOupAz25q2KFXTJxeh8zaFjR8xiEZrCcM85X3wl+tKW4VyNnuBaV2838FUmMbLbLPdbKXJuOjualEZsY2eGm+pauSHU4fxvpMVH31cA2N0KHM8yGZ54FNwRVs02DQZkEkVoeFpQfgEfutUMcamYAWDDEkcrUsqjjAP2s4GIGmRfgAcrIgXlDWjbv8HfbLdRcKDfSNpOUt4kU6IFxWGvJMiV5nqLiZ9LoqpPJFmIsZpx10hKN0/UUO1MbpGK3zFAvHw6PA/rLD+fb3Z0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eRXJ9M38t6S8rVvHKUKxJfBUCnE8BabnAb9oNAWhe7M=;
 b=RU6lBcw+BQ2RhdeFkMFFkVIrqWS9u6wHCR+36QU0cLgRW3OzawzWimocbuYr7w24ocyy+uSXlsCOADWULNpnRicplcrNxQOg+v3mIvpo61gZhJe7qi6Dq1cOZDi5tuF4vzwxguRRftKj8Yh37P4J6DyvpwqrNE2lgJ/2rDJhLjU35uKrJZvN1jnUBxl79/zdgYyCrh4HSRblYuF++DT4YaagW40YVVbbNZzkeKtOuGYROK8pImRU2EGbb2api822zWfi7nv1ec+x2XxATTYfDOVhmU7yP6jxmOY+8fb5epX0LkamodqfL7wj4DrxCL2vHWpzRrHg4xIGIc71vWyjMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BL3PR11MB6364.namprd11.prod.outlook.com (2603:10b6:208:3b7::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Wed, 11 Dec
 2024 19:47:06 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8230.016; Wed, 11 Dec 2024
 19:47:06 +0000
Date: Wed, 11 Dec 2024 11:47:48 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <apopple@nvidia.com>, <airlied@gmail.com>, <christian.koenig@amd.com>,
 <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, <dakr@kernel.org>
Subject: Re: [PATCH v2 25/29] drm/xe: Basic SVM BO eviction
Message-ID: <Z1nsZJba21ep62LZ@lstrano-desk.jf.intel.com>
References: <20241016032518.539495-1-matthew.brost@intel.com>
 <20241016032518.539495-26-matthew.brost@intel.com>
 <e35ae7f23c36fc7b1af3016de31f85863165b6c6.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e35ae7f23c36fc7b1af3016de31f85863165b6c6.camel@linux.intel.com>
X-ClientProxiedBy: BYAPR08CA0007.namprd08.prod.outlook.com
 (2603:10b6:a03:100::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BL3PR11MB6364:EE_
X-MS-Office365-Filtering-Correlation-Id: ba8aba56-8c53-4921-3553-08dd1a1c97a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?B4AYbAkH7P+qrtXjEw2baiJUQTwjegmY3I3cxA4ImWgmYTtU/DBh1n4dAX?=
 =?iso-8859-1?Q?n4xmOaTJWy9Cr/yGN6IirfYefYGGKEmoeAX13vUPSvm+VwYxoPIx5ayqVE?=
 =?iso-8859-1?Q?6VplhoJnNp/2a3oJq9DgXjlsoTgo3d5WuLU+wrctBLHlHdf22T71SA1gez?=
 =?iso-8859-1?Q?JQYDXW+eWJkW9JXE53aapIQut2FMGYzlpMMHeeAgk1emo3Gsjj5dAHIdoV?=
 =?iso-8859-1?Q?4QItxvHp/x8769HS4JkokoH/Ty2cUxYu03vI9HIyXaGTsRxCPuegX/Yxva?=
 =?iso-8859-1?Q?1BFiLmpOZZz9L/gYVz1ytwLzy/6MveDe79F3plCiceZN92DDb1YM4aTMuo?=
 =?iso-8859-1?Q?12N49i+MwNkA5yisyGXLp5ZLWUHu4LgXBF2NK+1XDHfNsL4+M+P3ZBivUZ?=
 =?iso-8859-1?Q?hIz7rdOdmGPF1hRcJGB01XorC0e09MQuxRMhny1M4q5vGruc1Ri86Zph3E?=
 =?iso-8859-1?Q?G2NKFZ0eCWzt2JzE97m7gE5deqcBWvB/SXLZ6haPzlc5uJJIeju0ylvl6H?=
 =?iso-8859-1?Q?8a7q2vWN0kOJajcnxi5B+aI6/dZ9Pg7h8xHa0UzrZe475zHfIh1AZPbuFj?=
 =?iso-8859-1?Q?MNJMvfaHY8HDkuRYPnNrELeBxrEP8RMj6MIklhcCcxMUyzDZlKmCQpxaQT?=
 =?iso-8859-1?Q?vAPT1RNCZz/9zlt+fIZBhd/hlULzlWngcT3bHIe+I2rJjLU3pAiJX1YoZW?=
 =?iso-8859-1?Q?9MHhryMTZp2IkavbU59zrSVZMa4T+R2nol4M8E5GI1tD2xf6XgSAE5w7ev?=
 =?iso-8859-1?Q?HoKyWsBVyC6H3PBiR8qwHNsnyD1qSHfczprSJiEeFo3fNh1j/j2Q5U1Jz7?=
 =?iso-8859-1?Q?5ZXUs1JX/eHcwdjcZH9i6yQl46oGoyc87Lfkmxmiw4Aw/SauptWXIihlCq?=
 =?iso-8859-1?Q?PKfIiufeRQTGacZq21WtMpPOzfqSli8wpmyNPuSRv7UedTT4J6CtFmiKa2?=
 =?iso-8859-1?Q?dThPueQ7+Lt8VGq5MdWmt7qm4jh/nJ7gE3Q4PTrVLYk466D/nTmR/W4G3q?=
 =?iso-8859-1?Q?MQL4ryNxume9ubqeKiTrO5bmuuAm805V6qYr8Q4girt/AKhmYCCDAAr6vQ?=
 =?iso-8859-1?Q?4ufFFLgFf61ZmPZemb2MqVrUKN8pfJ4E7ltzQTUwckwyFUSR1lJ2wC1hUK?=
 =?iso-8859-1?Q?mUcvcvv/wO9b1NcAin3Q1zWi6dCQj/kH2R2ZOJzOJUgk7Z1S8AoVNR66Uv?=
 =?iso-8859-1?Q?dX4sopWTPS9t/ySFn8VwmWEwZ0wctZPSoSTI8YL3ZDkuvNsm9r+nYhrSyn?=
 =?iso-8859-1?Q?t6h8Ao6BqZqqBVzyuqY7fygSCXEuSU5J8GfOxDxGcbU88eNMC/f5rMUCya?=
 =?iso-8859-1?Q?mwpVQctKDCy1szwaqOq7BN0DMwtAZ5MAIXavHzcHiMKohMfJKb/Mbya8CQ?=
 =?iso-8859-1?Q?dDRyrKFi1jHaTl8XrovcwWjRaVoxz0zA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?+KQi7Hafj93YuiCOAvhdVBhUPpKWdox/VGOjbVM19lVgpdAaAvfVD8RSl4?=
 =?iso-8859-1?Q?NOtKcopViD9VsJmo/wTE702G1hfQbg2U2j+ppbtTt7U4BHK30pFawA5Oib?=
 =?iso-8859-1?Q?iqm9tQlsyCBIEKbcUUchxZ7p6kZGOVskv9USjpd9QBC3a6/XqSq44ZCFgP?=
 =?iso-8859-1?Q?2NdKNlRrpSFjlcR6UF3URJEQEnEePr16mN7aHIKRYQtvoqtpWU746w9FZr?=
 =?iso-8859-1?Q?0GaWjwt+R1H3s/dqsr0MsthFnZSpnod6PdD/ES8Mf7UYNkUXPkt8BG7sbF?=
 =?iso-8859-1?Q?8gvs94AuGW3vkTujZ94JjpZuxUwSzSzzrPy/Eg7vgp0vNiZE/SkLKc6fRo?=
 =?iso-8859-1?Q?3xFu5LoAP+BB/vUCqMKr7z9yRU41QLNPqGofv5S1HQY8m/Llvoa0xfBW6Q?=
 =?iso-8859-1?Q?DNtIwKIZ375WYS9r/mRFpaCk1IE9BUrno4grvJTSBA3PSMi58N+t/WgUs8?=
 =?iso-8859-1?Q?6gkYpIrXDZ8TKyQGgAZAYcL31NPr8IGG+5gwjo9hWTo3x9g38FtqItOWBx?=
 =?iso-8859-1?Q?LDErtDh42b1/uyTHZPl4q0LnJFEt62QiwM4Kf/Q+ugYnyWuU3Ur1vVeCRi?=
 =?iso-8859-1?Q?xpxNW6stR9adsAjXuwffiS5FlloybKs/r5OSqokFQJikXw/Vol6L5CE8uv?=
 =?iso-8859-1?Q?ZcjLF3mooc1xn27c/dEhdwXy60AO+kNh+qTQ2RU4PjHO7MS3iyRUm5gGhd?=
 =?iso-8859-1?Q?rsBnOzt8Tx//8CKNystti2nao3VVZvw274943w+b6fCcxCU5/eNP0HUUzB?=
 =?iso-8859-1?Q?gNpx/a1aGGUtFuZMV14PfzTmq4uhv2ZuMthLrvklfUs1K8otdAxWLCG8NT?=
 =?iso-8859-1?Q?CVFK7x72cDMwn9GN+3eJBNEaUTNHMGQnWNsUY1/55jAo3AaC4qPwYtYoVb?=
 =?iso-8859-1?Q?Suty5zYVaXN2Xs0O+Ofr3hsYnsSiDZN5vIq3uCggDG7UKY8a4ltnd3iGzA?=
 =?iso-8859-1?Q?82CD+cFABWihtaTE6Kv0V99UrRDg2V3jjBsu0TgZGiagtakle2smSgDABS?=
 =?iso-8859-1?Q?uC7oN3VaJOZJqWePNLdblVPbcyu3PZTmHn0y9DSG9/mpwElqLknJqlZCmF?=
 =?iso-8859-1?Q?OVMRDGa3dw4s7ACvYIYvU9r7Q6tM2eZbZ6zToM7N5KQlqrFsxN83PV9GXy?=
 =?iso-8859-1?Q?eXaWP7QY/4eYbcZM2+3NtD4AtNz49Dv1ibUd6GCztSHImLjYqrmw837ClE?=
 =?iso-8859-1?Q?dlpMm9KUj9xjAfQLKfBl2LgdAhZbSyk+s379I2sMwfnBDAR6qHGttUYTy0?=
 =?iso-8859-1?Q?AZJZ0LuiHSJqFdA0DaAabaj8cZCdJ+O9/whdkVWwk3rjwIFXipGP01JbSs?=
 =?iso-8859-1?Q?YuVBCIwmU9cHp+ZxtVOlRCVGo67qK/5QjIHY1YLRP1R4s6c+M+O25voXAp?=
 =?iso-8859-1?Q?ZObha2VDHfNIwtrPSExGUtzmFS4gevBChybrEWrCHh34n743KEvseO9I7L?=
 =?iso-8859-1?Q?35XeVq/zUTnU8Ea8c/hyPlSJZ7hJXa62gQ0qAg+kAHQZULqDQNc9BhO+kT?=
 =?iso-8859-1?Q?uTl9TXcwhTMG/MktL4owduyjOweI/sqRTpoktgiKw1kWerH7B/JXiCWUN4?=
 =?iso-8859-1?Q?QgzYhVM05nCDH1DndcOWZT/vlHVIzUAZSSKr258kE+Mb6awxn8nEy8huBT?=
 =?iso-8859-1?Q?aKL1Prq7ZEFkv2ml874NgbPTVSNZWWoJJXpkB4RDgoVXTfiNUkWVOrSw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ba8aba56-8c53-4921-3553-08dd1a1c97a0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 19:47:06.3254 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /QN+zRvaEtRChBzjenE9+tzSxp9KG0yW9+y7+wh2fnDC/MRTjJzyw56tI3g+g3/3QNcgaeZuDijE9wrnm/uVqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6364
X-OriginatorOrg: intel.com
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

On Mon, Dec 02, 2024 at 01:27:24PM +0100, Thomas Hellström wrote:
> On Tue, 2024-10-15 at 20:25 -0700, Matthew Brost wrote:
> > Wire xe_bo_move to GPUSVM migration to SRAM with trylocking of mmap
> > lock.
> > 
> > v2:
> >  - Use xe_svm_bo_evict
> >  - Drop bo->range
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_bo.c  | 20 ++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_svm.c |  5 +++++
> >  drivers/gpu/drm/xe/xe_svm.h |  3 +++
> >  3 files changed, 28 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > index dbd03383878e..17d158762e03 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -25,6 +25,7 @@
> >  #include "xe_pm.h"
> >  #include "xe_preempt_fence.h"
> >  #include "xe_res_cursor.h"
> > +#include "xe_svm.h"
> >  #include "xe_trace_bo.h"
> >  #include "xe_ttm_stolen_mgr.h"
> >  #include "xe_vm.h"
> > @@ -250,6 +251,8 @@ int xe_bo_placement_for_flags(struct xe_device
> > *xe, struct xe_bo *bo,
> >  static void xe_evict_flags(struct ttm_buffer_object *tbo,
> >  			   struct ttm_placement *placement)
> >  {
> > +	struct xe_bo *bo;
> > +
> >  	if (!xe_bo_is_xe_bo(tbo)) {
> >  		/* Don't handle scatter gather BOs */
> >  		if (tbo->type == ttm_bo_type_sg) {
> > @@ -261,6 +264,12 @@ static void xe_evict_flags(struct
> > ttm_buffer_object *tbo,
> >  		return;
> >  	}
> >  
> > +	bo = ttm_to_xe_bo(tbo);
> > +	if (bo->flags & XE_BO_FLAG_SYSTEM_ALLOC) {
> > +		*placement = sys_placement;
> > +		return;
> > +	}
> > +
> >  	/*
> >  	 * For xe, sg bos that are evicted to system just triggers a
> >  	 * rebind of the sg list upon subsequent validation to
> > XE_PL_TT.
> > @@ -738,6 +747,17 @@ static int xe_bo_move(struct ttm_buffer_object
> > *ttm_bo, bool evict,
> >  		}
> >  	}
> >  
> > +	if (!move_lacks_source && (bo->flags &
> > XE_BO_FLAG_SYSTEM_ALLOC) &&
> > +	    new_mem->mem_type == XE_PL_SYSTEM) {
> > +		ret = xe_svm_bo_evict(bo);
> > +		if (!ret) {
> > +			drm_dbg(&xe->drm, "Evict system allocator BO
> > success\n");
> > +			ttm_bo_move_null(ttm_bo, new_mem);
> > +		}
> > +
> > +		goto out;
> > +	}
> > +
> >  	if (!move_lacks_source &&
> >  	    ((old_mem_type == XE_PL_SYSTEM &&
> > resource_is_vram(new_mem)) ||
> >  	     (mem_type_is_vram(old_mem_type) &&
> > diff --git a/drivers/gpu/drm/xe/xe_svm.c
> > b/drivers/gpu/drm/xe/xe_svm.c
> > index 31b80cde15c4..555bc71ae523 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.c
> > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > @@ -752,3 +752,8 @@ int xe_devm_add(struct xe_tile *tile, struct
> > xe_mem_region *mr)
> >  		 tile->id, mr->io_start, mr->io_start + mr-
> > >usable_size, res);
> >  	return 0;
> >  }
> > +
> > +int xe_svm_bo_evict(struct xe_bo *bo)
> 
> Kerneldoc. Also important IMO to specify the contract that if this
> function returns success, then no VRAM pages must be in use anymore
> since we will free the vram resource. (Can we guaranteee that?)
> 

Will add kernel doc. Yes, we guaranteee that all VRAM pages are evicted
with a retry loop in the GPUSVM layer.

Matt

> 
> Thanks,
> Thomas
> 
> 
> > +{
> > +	return drm_gpusvm_evict_to_ram(&bo->devmem_allocation);
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_svm.h
> > b/drivers/gpu/drm/xe/xe_svm.h
> > index 6893664dae70..5b9d5ac9ef72 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.h
> > +++ b/drivers/gpu/drm/xe/xe_svm.h
> > @@ -11,6 +11,7 @@
> >  
> >  #define XE_INTERCONNECT_VRAM DRM_INTERCONNECT_DRIVER
> >  
> > +struct xe_bo;
> >  struct xe_mem_region;
> >  struct xe_tile;
> >  struct xe_vm;
> > @@ -35,6 +36,8 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
> > struct xe_vma *vma,
> >  			    bool atomic);
> >  bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end);
> >  
> > +int xe_svm_bo_evict(struct xe_bo *bo);
> > +
> >  static inline bool xe_svm_range_pages_valid(struct xe_svm_range
> > *range)
> >  {
> >  	return drm_gpusvm_range_pages_valid(range->base.gpusvm,
> > &range->base);
> 
