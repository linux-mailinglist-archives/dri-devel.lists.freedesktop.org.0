Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3BBACE0E3
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 17:03:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04C5410E754;
	Wed,  4 Jun 2025 15:03:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HqIMW89X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B71510E07C;
 Wed,  4 Jun 2025 15:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749049396; x=1780585396;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=/UnRf4beeF8orRpVkr0sfYS1K446MMXbE14lg0/6aBQ=;
 b=HqIMW89XyzLR8PubI3fOJJ366BHZeZQMUspI+RV/ZsDA20xZc/xfedbZ
 xbbnjXL4DHGGLnVbhIDAiLSMmsWAAwRO6F+c2j/Iu+Tgejnt7AzXUL2VN
 cJLMx0eimpHv+7JHXIdLXgRUipbJG4GOTeSCCn97wj/Y0HO9ZvWLuuSh7
 P71VaiWb5ieDHHFE2+lllJhm7xxGcnLmeyY3MH6jhtQ0p68LxIKCEVnk4
 Xuahwv4eqPPrNScvcYIMHVYCqQCjiHsRDeMFwPPTa9Cch5L9aJTLqAl4K
 EbO6WcuIiqI41yRFuqpFztUu51agXJrl8Gh8dzBnsFEdfc6t17urU01Oi g==;
X-CSE-ConnectionGUID: d8tEEa2BSDiUMJBijdGjIg==
X-CSE-MsgGUID: OBciocaCTiO2NKieDaVgWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="62495445"
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="62495445"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 08:03:16 -0700
X-CSE-ConnectionGUID: SHyvPOW0RqSxrh1Lh04M8w==
X-CSE-MsgGUID: 8Dl2hxKKSUeOZQc8oOfdlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="150373975"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 08:03:15 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 4 Jun 2025 08:03:14 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 4 Jun 2025 08:03:14 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.50) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 4 Jun 2025 08:03:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xhpkfciXd/WJu6Ii3erzCFwkfhyRbup54j0ptotm/oPc+9NcU3jNnhm7BmBP62W20xYqXWTcasu562DMh2xa5lyHJWrRMl3WQnb8aETECFPGXSx3fanYq2NQwP/FPsxuGQAEj/r3qtkkA7E3qhTcYc5qLOolk4iooxSXi0P9tgPk9HkOTR5SjJgd0HnXCYcAzt9kkRp48p/RqjrV2YYse3FqXc2/Wd6MhBVUdCJvVWcsRMpXQIFF4CXVLlcSiLylQwuhszXtHV1AGtZIpsLlXg2wujU3XP2pfM9OSI5kd+Zz9ZlSXu9jt1m8kljMwBE6BVLDPNTe5JIKOBUXHNcLIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D1wTAmFcpnq6mSXPjglO2AhiZcNxO236ZA4HPfcpigA=;
 b=XM6Phq4vtPxR/HVu2UmpT244DH6kOQhK6NxeJv4WuvN+qMb+EslANFZRCidnO5QQZrE9bPPIrzrkSH8029DUxtizOGKoSqppgIHsQgvornL4HBBJaJckkAze7n1mt0q3MgzgDSUgSQ5xD6d+FLxMv/a6nxuWRC/0/zMiaA2Hsv8oClO+nad5gP0rs66d628N/t5Pzx7FMGPr2dmSCgsHONNdmbQoGMTBBvNstyDTnfr10+adDxqQxxCG7qFKpFxQtabvp6pSs+mEz0rtsTUWUyxJChM8pzisk9sq840d/EzkSO6LhKUs5T6BAyNvQZJbEZ0zd0CB0JxUaYKIxmrg8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB6610.namprd11.prod.outlook.com (2603:10b6:510:1cd::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Wed, 4 Jun
 2025 15:03:12 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8769.029; Wed, 4 Jun 2025
 15:03:12 +0000
Date: Wed, 4 Jun 2025 08:04:43 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <himal.prasad.ghimiray@intel.com>, <apopple@nvidia.com>, <airlied@gmail.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, Christian
 =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, <dakr@kernel.org>,
 "Mrozek, Michal" <michal.mrozek@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH v2 3/3] drm/xe: Implement and use the drm_pagemap
 populate_mm op
Message-ID: <aEBgizJ52ZjvGluf@lstrano-desk.jf.intel.com>
References: <20250604093536.95982-1-thomas.hellstrom@linux.intel.com>
 <20250604093536.95982-4-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250604093536.95982-4-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR05CA0124.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::9) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB6610:EE_
X-MS-Office365-Filtering-Correlation-Id: f3be1d65-2c70-42d6-203d-08dda378ec8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|1800799024|376014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?riJf8LFRGhSCra/TmlKAKv59Y3yiFe5zeaXP0O0FTtfpHl7d5Nc/EImvej?=
 =?iso-8859-1?Q?sQtrNor1jCNDfKzvpJa/FmQgBjgmnF5YoTbagB+/xShbeTkuNZ25cxyY9A?=
 =?iso-8859-1?Q?Rhwtbh7mdpc8Lej/hugw09nPuy9D7NpFEwNAkMtGCsS+dPHBpFZIGe6Q8X?=
 =?iso-8859-1?Q?QDodKX0KpwwJ4pIw/BVLGRbUAukp7GX2QevbN3hMFnplTZa5sNXK4JxvwF?=
 =?iso-8859-1?Q?Fr85rwobGHff5cpfUZ8PIOdtns5Lfn2Cqox2O2pI/L+951xUrkzBXfVJNS?=
 =?iso-8859-1?Q?KAGQcGqQR1zs5FeStBTJ0cw9yuPGIELduEjaJCrdJNPkFbQimTJQykTdCi?=
 =?iso-8859-1?Q?tawDWKL3qE6+LtSEnU82KuG9T5RF4V9WN5fhz/cKhecrh96mrei/D2cLQ/?=
 =?iso-8859-1?Q?wjw/u7U/CPRqlPhEmRKW6fmgDh26n1P9OVz9xwnVL8pRfkqqdO2TbBOe3P?=
 =?iso-8859-1?Q?UdFBlzurEDXHk43/3witCFOUQTkzkzBng3RxA1VAl1o14rC4IzOHUVJKGw?=
 =?iso-8859-1?Q?OAaLAOngUduX11dZuSpAW8uUnO+pAXdTdyatkyKYoYy2wJ1fSQlojbARWK?=
 =?iso-8859-1?Q?WvyLpy7HNvGrZOcb+ucXYEj5WQRWoPztRM4i0tn9AxzCexuzVnfNEkSTFi?=
 =?iso-8859-1?Q?txImx3O9v//axn8M24eDqtaid/TueTaE0onUlyfFFudLSoLt1IXcWB8Nm8?=
 =?iso-8859-1?Q?a5fdX5M5yB3UVcY3QRG3ItIHfRqVLD85fTYehdTU3kGiVe6ssADoCCFLx5?=
 =?iso-8859-1?Q?Mw+NOLxvoM8HGdZURpbl+UoQg6BETJuteLbMw3sEhQgNUxeB6fLG+w3pfx?=
 =?iso-8859-1?Q?Es1d4OmCtXFzpzkQl/JPTvwA2C8fBxcJwdxkgjDQ5A4C25S8YjRf/D2Xgx?=
 =?iso-8859-1?Q?92k+En5g3P4S+Ktd8wnAaXeuKla1PVKcLd+bo6GGGKen1WybtsE+/nysSI?=
 =?iso-8859-1?Q?tfnpegCQd5BIdYMnPVMpXD7UDGP6GGEzhrkqTGvMVBXt99JD8cghOYy92v?=
 =?iso-8859-1?Q?7u75NPBCzC6oKIrQozjv5xuexHSuCSbvYRBFOrC3M5xFqk4ACuvEwbcFP5?=
 =?iso-8859-1?Q?0gJ3qlbaAQv1da9fLNDGwmqPChGuJMXGW5WsUNWbPi+VR/u+luqSQP/nM0?=
 =?iso-8859-1?Q?M/Vm3yQUVFZ0+FKwzES8b/SAMXjyMktItXSK1aRbmmoMbpSzq3FntHeB/0?=
 =?iso-8859-1?Q?K8LMq2WKrpKj/Cn66XvxspgEjyhuM8utkgvx4A7IuvXToE7VpBNoq5VqPr?=
 =?iso-8859-1?Q?3VbQerI4Bn+s/bbvJtyyOf1ko5jIonWQ6Oi5M9OUyQKmpdX8vZgOOoQ0mA?=
 =?iso-8859-1?Q?hw+19xWhjODqkb5WNqGjsZN+qj90ViHqhkmfac9jSy8gHPf14cRUee+Fa8?=
 =?iso-8859-1?Q?U9UIqZeZFqU8oO6S9I5WHienaA4qzG8WZA0GwYkpH3RcGEnknYlO4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?LnV0gnhIp8P1qOU4vpU5uz0nze2GNEivNPS8vPvlR1p6yXQ4XiuR6TOAdB?=
 =?iso-8859-1?Q?SQTrQTVJ+P+v5tkDSyN29XvsU5Qe/pF9SjGbhtYahfkd2G5q9NHLLGz7aV?=
 =?iso-8859-1?Q?nSszDmX97lywiidisdWzl7eQcyR3Cco1LcJk+vHIPZGdmbaDBKJlwam6/9?=
 =?iso-8859-1?Q?DdxkbrxM5xJ7oqAUpwjC9LY192bytJPHxyjWLDFOj2YXhA6+jxjDoBlEEO?=
 =?iso-8859-1?Q?ghaCROM28te3Lm55V6q+o83o8nVkwCX1uMTAd/vfXMI9lwMQRt09hAEgfl?=
 =?iso-8859-1?Q?bBVtYii4qXdOHgOcgjrILkR+1lP7RDnht6F7PnZNt6w9bif6A4tx/11s9P?=
 =?iso-8859-1?Q?/9rsFo3xXKqFx9ACht31uCjfSj/3+JTNPNPe7XIpeFRJjhRh/hCnq2CnNH?=
 =?iso-8859-1?Q?4dkspD5vQTtn3+TQBO8HmzcgDxzneF6JuYAXhkvNrKV72JT/eNCwwDgvX7?=
 =?iso-8859-1?Q?/mi/mBdW2V6W1T3rcroe9idEiaek4oFiWEdLPaR+5E0GmyNFpj0M9H5uuS?=
 =?iso-8859-1?Q?KcGmJYAcHB0rjLgZLV3nVw2/Wn7HP+fjnQ8F0DITtaKVbHRx2ce8Xz2C8F?=
 =?iso-8859-1?Q?lbu7/BsY+QxdTmMLARovV3Bry7Gx07ndWfr9c2tUQ54pkGPqau8nfSjIc0?=
 =?iso-8859-1?Q?f3MUnUt9T/pbcBZZ+WK7kMpwYD6FA5S9yFb3/OCeJ/MmQ/OXpgH0G3xw+I?=
 =?iso-8859-1?Q?TVZecBymjYbghxnhuzhI1gSUhMEBhJX8R+pFJRv65kM7v+bQjZFiJsLiAp?=
 =?iso-8859-1?Q?Ao1cagXDjXL51yQx2yjLYjgYUrNxVQpXu6norVaa8Ef6GpUBzeFhd7YH9J?=
 =?iso-8859-1?Q?HNus8tGN9WabojWARu689Cdv843TUZudfa62s+gYuD233Kq5ifEur/Nm3n?=
 =?iso-8859-1?Q?e1A+JVeEciBZh0e1qMQbA8X4cAbKwta2ZXgGLAuv3w/HtifUK/mg0oSWyx?=
 =?iso-8859-1?Q?wK0xTsOyi9RLay2L4Pv1E6NoxmVvScR+1Ge34wy9qvzLPvuzcXIPyZ76tT?=
 =?iso-8859-1?Q?gE2xmgAV7/0KG8F4aUoa0rXiAZIRq9PaD8HlOdU5heKBxbW0dbbo7Ut/GH?=
 =?iso-8859-1?Q?Tg3n16zr/ZuuLjyBtepQnYTN8YPH5N2zycdHT6PmOOzZNE41Yi+GVZsCPP?=
 =?iso-8859-1?Q?UoeH171+G+nSWnVyapOzaT9MjzivZLivY2Q2iOdj+XnxsQA0T5toGM12lI?=
 =?iso-8859-1?Q?jGyleFKBVOfph6VFvlgqqaKk5RZ990g91hQvG8e0T9zTr0kLHxpHszGmHY?=
 =?iso-8859-1?Q?ck/ZJMPi7TBvwFt364N1kMPb+XS+UdkF1AfuLP+k2nzR1CSlduxSH0T0Tj?=
 =?iso-8859-1?Q?uao237W8WHfknAsgM+rGINGJ/Bi3rkpCzungMcIJVXn3AHE6d4FoBKcx8b?=
 =?iso-8859-1?Q?8ACaC06hNUOvgDguZkWSG53Nv7l0PjeRJJ98plvBikowYCyjhA3/XyQB9d?=
 =?iso-8859-1?Q?EHlFTpeyKUfziUpY/FO+rxKSrXjAS/ACuOT5u92sH8gfvBihQ1Sg/3Ngpo?=
 =?iso-8859-1?Q?1bE91waFFKwUO6QSqB9VJVaPoyqxmrZKo3n1aBhz8vdhLa07oDzCc5Sk2S?=
 =?iso-8859-1?Q?nRMhYxZEyWeMRxE9JQQnkkPITxGl2wZqEWduTqfetued7wdwl07LpnyjqH?=
 =?iso-8859-1?Q?xPn5ki+Tkb4TsfRWEIsuwhAnJ3wZnXJ9vMCrubGalNbzaGULB77UBmKg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f3be1d65-2c70-42d6-203d-08dda378ec8e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 15:03:11.9567 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sd5muErArzziJ6IhHRnT898GRUjTTHwOzMtzWjAz8C7JNPyhwlchwNVtfixf0/mpSI7G0i6en/bbCZGmZ/Ezyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6610
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

On Wed, Jun 04, 2025 at 11:35:36AM +0200, Thomas Hellström wrote:
> Add runtime PM since we might call populate_mm on a foreign device.

I think taking a runtime PM will fix hard to hit splat [1] too.

[1] https://patchwork.freedesktop.org/patch/648954/?series=147849&rev=1

> Also create the VRAM bos as ttm_bo_type_kernel. This avoids the
> initial clearing and the creation of an mmap handle.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/drm_pagemap.c |   1 +
>  drivers/gpu/drm/xe/xe_svm.c   | 104 ++++++++++++++++++++--------------
>  drivers/gpu/drm/xe/xe_svm.h   |  10 ++--
>  drivers/gpu/drm/xe/xe_tile.h  |  11 ++++
>  drivers/gpu/drm/xe/xe_vm.c    |   2 +-
>  5 files changed, 78 insertions(+), 50 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> index 25395685a9b8..94619be00d2a 100644
> --- a/drivers/gpu/drm/drm_pagemap.c
> +++ b/drivers/gpu/drm/drm_pagemap.c
> @@ -843,3 +843,4 @@ int drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
>  
>  	return err;
>  }
> +EXPORT_SYMBOL(drm_pagemap_populate_mm);
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index e161ce3e67a1..a10aab3768d8 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -3,13 +3,17 @@
>   * Copyright © 2024 Intel Corporation
>   */
>  
> +#include <drm/drm_drv.h>
> +
>  #include "xe_bo.h"
>  #include "xe_gt_stats.h"
>  #include "xe_gt_tlb_invalidation.h"
>  #include "xe_migrate.h"
>  #include "xe_module.h"
> +#include "xe_pm.h"
>  #include "xe_pt.h"
>  #include "xe_svm.h"
> +#include "xe_tile.h"
>  #include "xe_ttm_vram_mgr.h"
>  #include "xe_vm.h"
>  #include "xe_vm_types.h"
> @@ -525,8 +529,10 @@ static struct xe_bo *to_xe_bo(struct drm_pagemap_devmem *devmem_allocation)
>  static void xe_svm_devmem_release(struct drm_pagemap_devmem *devmem_allocation)
>  {
>  	struct xe_bo *bo = to_xe_bo(devmem_allocation);
> +	struct xe_device *xe = xe_bo_device(bo);
>  
>  	xe_bo_put_async(bo);
> +	xe_pm_runtime_put(xe);
>  }
>  
>  static u64 block_offset_to_pfn(struct xe_vram_region *vr, u64 offset)
> @@ -720,76 +726,63 @@ static struct xe_vram_region *tile_to_vr(struct xe_tile *tile)
>  	return &tile->mem.vram;
>  }
>  
> -/**
> - * xe_svm_alloc_vram()- Allocate device memory pages for range,
> - * migrating existing data.
> - * @vm: The VM.
> - * @tile: tile to allocate vram from
> - * @range: SVM range
> - * @ctx: DRM GPU SVM context
> - *
> - * Return: 0 on success, error code on failure.
> - */
> -int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
> -		      struct xe_svm_range *range,
> -		      const struct drm_gpusvm_ctx *ctx)
> +static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
> +				      unsigned long start, unsigned long end,
> +				      struct mm_struct *mm,
> +				      unsigned long timeslice_ms)
>  {
> -	struct mm_struct *mm = vm->svm.gpusvm.mm;
> +	struct xe_tile *tile = container_of(dpagemap, typeof(*tile), mem.vram.dpagemap);

I think this is going to chnage here [2] making mem.vram a pointer.
Maybe a helper to go from dpagemap -> tile to future proof a little. I
think once [2] lands, we will need to pick the root tile here. 

[2] https://patchwork.freedesktop.org/series/149503/

> +	struct xe_device *xe = tile_to_xe(tile);
> +	struct device *dev = xe->drm.dev;
>  	struct xe_vram_region *vr = tile_to_vr(tile);
>  	struct drm_buddy_block *block;
>  	struct list_head *blocks;
>  	struct xe_bo *bo;
> -	ktime_t end = 0;
> -	int err;
> -
> -	if (!range->base.flags.migrate_devmem)
> -		return -EINVAL;
> +	ktime_t time_end = 0;
> +	int err, idx;
>  
> -	range_debug(range, "ALLOCATE VRAM");
> +	if (!drm_dev_enter(&xe->drm, &idx))
> +		return -ENODEV;
>  
> -	if (!mmget_not_zero(mm))
> -		return -EFAULT;
> -	mmap_read_lock(mm);
> +	xe_pm_runtime_get(xe);

A forgien device might not be awake so is that why you are using
xe_pm_runtime_get rather than xe_pm_runtime_get_noresume? We only have
the MMAP lock here so assuming that is safe with our runtime PM flow.

>  
> -retry:
> -	bo = xe_bo_create_locked(tile_to_xe(tile), NULL, NULL,
> -				 xe_svm_range_size(range),
> -				 ttm_bo_type_device,
> + retry:
> +	bo = xe_bo_create_locked(tile_to_xe(tile), NULL, NULL, end - start,
> +				 ttm_bo_type_kernel,
>  				 XE_BO_FLAG_VRAM_IF_DGFX(tile) |
>  				 XE_BO_FLAG_CPU_ADDR_MIRROR);
>  	if (IS_ERR(bo)) {
>  		err = PTR_ERR(bo);
> -		if (xe_vm_validate_should_retry(NULL, err, &end))
> +		if (xe_vm_validate_should_retry(NULL, err, &time_end))
>  			goto retry;
> -		goto unlock;
> +		goto out_pm_put;
>  	}
>  
> -	drm_pagemap_devmem_init(&bo->devmem_allocation,
> -				vm->xe->drm.dev, mm,
> +	drm_pagemap_devmem_init(&bo->devmem_allocation, dev, mm,
>  				&dpagemap_devmem_ops,
>  				&tile->mem.vram.dpagemap,
> -				xe_svm_range_size(range));
> +				end - start);
>  
>  	blocks = &to_xe_ttm_vram_mgr_resource(bo->ttm.resource)->blocks;
>  	list_for_each_entry(block, blocks, link)
>  		block->private = vr;
>  
>  	xe_bo_get(bo);
> -	err = drm_pagemap_migrate_to_devmem(&bo->devmem_allocation,
> -					    mm,
> -					    xe_svm_range_start(range),
> -					    xe_svm_range_end(range),
> -					    ctx->timeslice_ms,
> -					    xe_svm_devm_owner(vm->xe));
> +
> +	/* Ensure the device has a pm ref while there are device pages active. */
> +	xe_pm_runtime_get_noresume(xe);
> +	err = drm_pagemap_migrate_to_devmem(&bo->devmem_allocation, mm,
> +					    start, end, timeslice_ms,
> +					    xe_svm_devm_owner(xe));
>  	if (err)
>  		xe_svm_devmem_release(&bo->devmem_allocation);
>  
>  	xe_bo_unlock(bo);
>  	xe_bo_put(bo);
>  
> -unlock:
> -	mmap_read_unlock(mm);
> -	mmput(mm);
> +out_pm_put:
> +	xe_pm_runtime_put(xe);
> +	drm_dev_exit(idx);
>  
>  	return err;
>  }
> @@ -898,7 +891,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  
>  	if (--migrate_try_count >= 0 &&
>  	    xe_svm_range_needs_migrate_to_vram(range, vma, IS_DGFX(vm->xe))) {
> -		err = xe_svm_alloc_vram(vm, tile, range, &ctx);
> +		err = xe_svm_alloc_vram(tile, range, &ctx);
>  		ctx.timeslice_ms <<= 1;	/* Double timeslice if we have to retry */
>  		if (err) {
>  			if (migrate_try_count || !ctx.devmem_only) {
> @@ -1054,6 +1047,30 @@ int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
>  
> +/**
> + * xe_svm_alloc_vram()- Allocate device memory pages for range,
> + * migrating existing data.
> + * @vm: The VM.
> + * @tile: tile to allocate vram from
> + * @range: SVM range
> + * @ctx: DRM GPU SVM context
> + *
> + * Return: 0 on success, error code on failure.
> + */
> +int xe_svm_alloc_vram(struct xe_tile *tile, struct xe_svm_range *range,
> +		      const struct drm_gpusvm_ctx *ctx)
> +{
> +	struct drm_pagemap *dpagemap;
> +
> +	range_debug(range, "ALLOCATE VRAM");
> +

	if (!range->base.flags.migrate_devmem)
		return -EINVAL;

Or I guess an assert would work too as caller should have check this
field.

Matt

> +	dpagemap = xe_tile_local_pagemap(tile);
> +	return drm_pagemap_populate_mm(dpagemap, xe_svm_range_start(range),
> +				       xe_svm_range_end(range),
> +				       range->base.gpusvm->mm,
> +				       ctx->timeslice_ms);
> +}
> +
>  static struct drm_pagemap_device_addr
>  xe_drm_pagemap_device_map(struct drm_pagemap *dpagemap,
>  			  struct device *dev,
> @@ -1078,6 +1095,7 @@ xe_drm_pagemap_device_map(struct drm_pagemap *dpagemap,
>  
>  static const struct drm_pagemap_ops xe_drm_pagemap_ops = {
>  	.device_map = xe_drm_pagemap_device_map,
> +	.populate_mm = xe_drm_pagemap_populate_mm,
>  };
>  
>  /**
> @@ -1130,7 +1148,7 @@ int xe_devm_add(struct xe_tile *tile, struct xe_vram_region *vr)
>  	return 0;
>  }
>  #else
> -int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
> +int xe_svm_alloc_vram(struct xe_tile *tile,
>  		      struct xe_svm_range *range,
>  		      const struct drm_gpusvm_ctx *ctx)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> index 19ce4f2754a7..da9a69ea0bb1 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -70,8 +70,7 @@ int xe_svm_bo_evict(struct xe_bo *bo);
>  
>  void xe_svm_range_debug(struct xe_svm_range *range, const char *operation);
>  
> -int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
> -		      struct xe_svm_range *range,
> +int xe_svm_alloc_vram(struct xe_tile *tile, struct xe_svm_range *range,
>  		      const struct drm_gpusvm_ctx *ctx);
>  
>  struct xe_svm_range *xe_svm_range_find_or_insert(struct xe_vm *vm, u64 addr,
> @@ -237,10 +236,9 @@ void xe_svm_range_debug(struct xe_svm_range *range, const char *operation)
>  {
>  }
>  
> -static inline
> -int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
> -		      struct xe_svm_range *range,
> -		      const struct drm_gpusvm_ctx *ctx)
> +static inline int
> +xe_svm_alloc_vram(struct xe_tile *tile, struct xe_svm_range *range,
> +		  const struct drm_gpusvm_ctx *ctx)
>  {
>  	return -EOPNOTSUPP;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_tile.h b/drivers/gpu/drm/xe/xe_tile.h
> index eb939316d55b..066a3d0cea79 100644
> --- a/drivers/gpu/drm/xe/xe_tile.h
> +++ b/drivers/gpu/drm/xe/xe_tile.h
> @@ -16,4 +16,15 @@ int xe_tile_init(struct xe_tile *tile);
>  
>  void xe_tile_migrate_wait(struct xe_tile *tile);
>  
> +#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
> +static inline struct drm_pagemap *xe_tile_local_pagemap(struct xe_tile *tile)
> +{
> +	return &tile->mem.vram.dpagemap;
> +}
> +#else
> +static inline struct drm_pagemap *xe_tile_local_pagemap(struct xe_tile *tile)
> +{
> +	return NULL;
> +}
> +#endif
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 7140d8856bad..def493acb4d7 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2911,7 +2911,7 @@ static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
>  
>  		if (xe_svm_range_needs_migrate_to_vram(svm_range, vma, region)) {
>  			tile = &vm->xe->tiles[region_to_mem_type[region] - XE_PL_VRAM0];
> -			err = xe_svm_alloc_vram(vm, tile, svm_range, &ctx);
> +			err = xe_svm_alloc_vram(tile, svm_range, &ctx);
>  			if (err) {
>  				drm_dbg(&vm->xe->drm, "VRAM allocation failed, retry from userspace, asid=%u, gpusvm=%p, errno=%pe\n",
>  					vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
> -- 
> 2.49.0
> 
