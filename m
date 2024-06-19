Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 762C390F9CE
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 01:34:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAD3610E140;
	Wed, 19 Jun 2024 23:34:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cHkWXZ5h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5477E10E140;
 Wed, 19 Jun 2024 23:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718840054; x=1750376054;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=3NaYUcr+k4svs0Z10kAULoTBT30/qoPszQ+Ot48VcqU=;
 b=cHkWXZ5hXS9GEWDQGdBEqn18r1b0UqKnosUiJbVezZkDBTHhBnhlGxSH
 tM52dSFS+M8zGy0+EajhBuuGbvprs5AIbKagGMG6dYI/zBxnaDMwqQmf5
 An3jrYdSfZO/gm9yyfFecdcnPIkUu0hrqYpFaxaX+gEunVRd5LTWjQZTW
 Iy6CjVlZFtcLbGaonX9dGBLakoWtLi2kRvzv9y0i0kUZSVKVd3PTKV6RH
 n7xQF7ZPssAGeYazKCKFfuXk2jFcM7PwWeXfsWGOMhzeU2FKG+GnmDlcd
 V/eaTdXnaLMskKrxW50O3R6EXRRAiCTOgW8t1u1Iqj114Mki2WBxxdPbX A==;
X-CSE-ConnectionGUID: d+sQgY22SjOsFjNYwgITrw==
X-CSE-MsgGUID: 6jtwfswCQ5+4Bq1fRbd1Aw==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="15926606"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="15926606"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 16:34:14 -0700
X-CSE-ConnectionGUID: YZUaLaeoS++re4jaiEoS4A==
X-CSE-MsgGUID: SvvCmv95T/2QSe+VUN2EGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="41946409"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Jun 2024 16:34:14 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 19 Jun 2024 16:34:13 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 19 Jun 2024 16:34:13 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 19 Jun 2024 16:34:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gWRe0UJAPLUhqCt3iKLXX8zf6ryww1fiGSZa1Hm+wSjRoHuZkrNa9e9GlG+pURPKIDx4gKdE1xpdlJDpZKihlKf2Jeew6+7uoMrJd0EQyEX0ad/wNFLExGp9bRFgULqwpg3tI4gBf/QlOcnd75tiTJin2WvRcOuzGnHfUCAyGP0uuJNLvMruEMrSz9NSEwwBV0hjTyjUdAgR+FfTfXOmPFTLayr4SIOgiGl0uR5cwuXXFwu/zuMRHB1z0YXCudl8A6/Ul1UC4e06xGPllQOfqgjJVZZV9DSeyu99KKhuVgIPjwz9u5Wptw4H9MY6M2lIblIOfqpzYua6aAM0Auyufg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+po5yyVuT+Vs9Rjwqstly02l5hm9+GtM5DGwQ9ZeW00=;
 b=ipKoCGHvGasMnBvaHqYr+hRRudrq+eCs54p0DIHIZbWdWfODkjYA42mm2rewvuzbXzw4XWGJBcP63QKFW1iSQ9OUqgbfNk6SWo9YaSTRUjf3GAFL4wrJcb56z4DjfxNmwIGAii+XkMY+XQdwMn0OpQGqqPdTYkWJO3/m458G6ACWJYwYgTGXy6HJvRa65nchGpOJN5f+MeMfSYP7ySBdmMGoPIs9v/3j5sfT8XVprrjIzFEO/W7PoeXizink+vCnox2O64OVNAer9KU2N9nDAc+h2AY7FXVLxiyW3keKE4hHicRYHc23sr6RPlhNxiQYkpDABgKXBNsqP5JUDMXX6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LV3PR11MB8602.namprd11.prod.outlook.com (2603:10b6:408:1b3::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Wed, 19 Jun
 2024 23:34:05 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.7677.027; Wed, 19 Jun 2024
 23:34:05 +0000
Date: Wed, 19 Jun 2024 23:33:31 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Somalapuram Amaranath
 <Amaranath.Somalapuram@amd.com>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v5 07/12] drm/ttm: Use the LRU walker for eviction
Message-ID: <ZnNqy6hxLPEMWqIK@DUT025-TGLU.fm.intel.com>
References: <20240618071820.130917-1-thomas.hellstrom@linux.intel.com>
 <20240618071820.130917-8-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240618071820.130917-8-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BY5PR20CA0018.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LV3PR11MB8602:EE_
X-MS-Office365-Filtering-Correlation-Id: f8fb5ec2-0b25-420c-f84f-08dc90b84ebc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|366013|376011;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?WqEZDm04G+/dbTaeHpszM4tk9ISpydGFspylab9XRFAj0IKdY1KhNYIWrS?=
 =?iso-8859-1?Q?Qdvif/oMg6SMoHZ7/LIRjI/NoVIgHS7NimyUGM+QqbVcvkH9ucvHjsaYHL?=
 =?iso-8859-1?Q?ZrEQRWYskPedOTLoJdxC39Iit2yBRAuPVwXKoOKn9AHdAP9HWG8pFBE/yM?=
 =?iso-8859-1?Q?9lJ9yRWAZ4EGDP9Neu6YKevX1/Ekm98TEnytAEBo/j6heSn8O0FmpJBqJd?=
 =?iso-8859-1?Q?RM66std9nzkwcF+yKhzDXmRT+ytLxgUJqoR4sDzuTMzMgv5eKvdsVyLX5A?=
 =?iso-8859-1?Q?Apc0c1V8+PVmB8/m1utXftZue53zJbXiT05JLnB1F29ZGtVvwUfu+bYFGL?=
 =?iso-8859-1?Q?3Li2flk8qOmm/YREJRaNmdjEtywl1f1/LzSCgmGaNzr6kp6DsfwsYMkhCG?=
 =?iso-8859-1?Q?aKs2vdJfvoHQS1MREk6V+mqLiFZVyNqsKqJiCpOoYBqTahsfyYoImQwqdV?=
 =?iso-8859-1?Q?b6GKAQCcSXn+Sj38hhClLdIWfka53VU6AsBIaIioVYKgEw7OEtZ9MJKQ8M?=
 =?iso-8859-1?Q?jPKUjTru0pRVvp/WGXCV1cJOXOcjGch8N+UyENir+2WMnkllQxsYreGkmk?=
 =?iso-8859-1?Q?clNFhmoQtNof+eCYopx+BNTErtXQ9as+AfWyqLghPwjSPbHK6gKQu5P98H?=
 =?iso-8859-1?Q?robru4bqGsdtO9O72w+dW/i+h8Xj0eD6b1yqefxQ0KGqu8yFh8ibZx8g6n?=
 =?iso-8859-1?Q?21K29Vpl/SI6YOVSQepjNzjtfSDoS8/Ksj8aGwvOJynfqpHgUQC0st6I1c?=
 =?iso-8859-1?Q?IdVssCjPqW327VoHT+/nRb0fas6XzsMofOiRLXAkHVcLs/0iEACopD6lg7?=
 =?iso-8859-1?Q?yfHH4YuuayNoXZHBUfmLnjy2Ldjc3ASP7SOOBSxz4en4Idixlc/y/WdV52?=
 =?iso-8859-1?Q?THlveENKq8eEIZ/SBjr85bbhCkR82+aKGvneyzetbhbw9dR4HhEJCSl8+5?=
 =?iso-8859-1?Q?WEef8sY/Qz2Zon0TweKdCqJMG7gmsLyOL5+vcV3sn674QmzYZXXKfzby/4?=
 =?iso-8859-1?Q?KnUIORYTTqGOkDF0M77LNbbc3NEDvp8w9ox4qplhII/s0rmiwo/UbuDgX6?=
 =?iso-8859-1?Q?fZqfr9wpRU1atFgKHiTRwZSQRUempCt+hkqsViRPww1bydTib4eOECZXlK?=
 =?iso-8859-1?Q?nr6Yju+GZqFtKuG6CrHcEIa0KNi02k7dUnFvH1ALc6rYFkxyfFfk1GyVl3?=
 =?iso-8859-1?Q?grO3Qjts1nUwUB8ii6e881JMt45fCY/s2Iz0Qe+NwERPkfFN11zyrelOwd?=
 =?iso-8859-1?Q?bsLw/S/KzJj3nwAIo3e3V7pPYTHyBGAzM3BFhHWb1r3HpK5RUC/wr4TStJ?=
 =?iso-8859-1?Q?7hEQJeZJ7hi+hO+kbBT0nYvmd2gc52mcRMhoLwKD8B6Q5SAhlEQBftEac/?=
 =?iso-8859-1?Q?9uTK2hdp+R?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(366013)(376011); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?BmpQ6jAbSOe0CXZX/xAPgEaIaKV4ei6QKmaejBg2/BJbQqU78dRxhm35wj?=
 =?iso-8859-1?Q?A0F/7FgioXqBo9NbQ73gxH1t7w4Fad56AkF5Rdxjv5mJ6YuVXMdO/X4GMp?=
 =?iso-8859-1?Q?ebTALkJa6nIv0mXOma9oszvwVW0QX38IHEK7QLccVaUbIEaWyeITnA0jwG?=
 =?iso-8859-1?Q?QfT9cLOUkWDHLAYPnGgvVz3V9brx+yhumL+MrK3cIfrGqNMiyL0W4SJbV8?=
 =?iso-8859-1?Q?lL+dDnDscZJkDVVbPaIGzqV0TzPXx2JaYp+PYcb8gzs8eGBVfpqzwnPlm5?=
 =?iso-8859-1?Q?d4X927Y0rhfe+TCfU8WQ3eqO0VMN3kg5NM2un297QxsdiZ9mt/6d/5OE2a?=
 =?iso-8859-1?Q?ax0/NAh5z/1h9Lf3P330Ww0q/uDoEnIVcw6ubYqJr4rkQej3V8kG/1iEN2?=
 =?iso-8859-1?Q?TQ3XlrJgtXIQoPB/48zQSOm0dUdExZ2kJ6TLhmAn3OBJb5/Gk2L0UeN03E?=
 =?iso-8859-1?Q?Hppyeatru7HQU9QwKQGrBaGE0N8b0AjCM3T6Y6LvJMGEhUUOdUMkZm4Nx/?=
 =?iso-8859-1?Q?mLVmwgcsRHdm9GrGV26Z/882HJOgRsFrrTmFa5r35Is7AnU4rhD1sQCjjX?=
 =?iso-8859-1?Q?lu9rhZCS7Utm/YPYIaPe7hnPabr2NMd1KARixyXj4b0hBagesTGJ185h8g?=
 =?iso-8859-1?Q?MbZRYigeInvU3Lj7/RXvItATHlSJRdxUYB6HjkQepYZCeBJ6h+TfvavYPj?=
 =?iso-8859-1?Q?evwV6xTuEBQA3Hrm+7vZLQMgURCUCQPVgwIn0UMwiUDGI+1gqgxZir/D9v?=
 =?iso-8859-1?Q?KKvhf0VqE01S96h6h3u5dAN7QvO8wKpyrizEqEpM3J52/sls9nHgMw0FpF?=
 =?iso-8859-1?Q?o3fsNHA9n4DrT9ZRgpwnyYASbDYFCr5FaUZDU3SlG10VXjtwg3mUCSQonH?=
 =?iso-8859-1?Q?gvqBysLxf2vuYGZj8CXN8SCL3UbewGlnyf70pJPQXvxB5cBscC+tTeWFrL?=
 =?iso-8859-1?Q?rRFlXl2mqCB2YC/lCgEQDNFmgK8autT+Nx3nmQHckrErBjn92hgAfacnoX?=
 =?iso-8859-1?Q?NbO2ga5cqDQlCDzMaDnO3ueipcXU20dlv1hER7OFhSJEiT6wHmRFFlNmU9?=
 =?iso-8859-1?Q?Ge1E746k8IJw/hnE3r1ijMREoMgr05r2b5A8FYOAqApFIHXE7x8YZE3LCb?=
 =?iso-8859-1?Q?+9mYauO2oSNE1ILwvjBdMA91ZPm6dFs8DX30bd9wydRPBiEKcAeHZo6YES?=
 =?iso-8859-1?Q?R9igWtoP5GqyU76JHxIWQ5WvUEVvRLXD9b5U/9o3NATwzXRIGXLNdi7laQ?=
 =?iso-8859-1?Q?vRUysTgLNRavp6GFhkHjLAHJuohUAA36XeF8ljIMzrYudHEbKwOOvd+rQu?=
 =?iso-8859-1?Q?oIigs9cFX3UTEJ4kLt7/KHdhkj8lkhbpL5r83lftHwkjOjVHALv3sH/ZQH?=
 =?iso-8859-1?Q?1fpfVsBCeyUoYJv+Yz0UPahf5BpaorMRQ58VOwHADt/vZMmEAPeyM4rJFI?=
 =?iso-8859-1?Q?XA3X2vk+dHV0MAnJCWaJrawj4dXUWVZ0g+Lwqt2DGtTz3asCUA4dJx5c1T?=
 =?iso-8859-1?Q?qJDEec5QURmOQBH+t9JpqcsgUicov6JXfpJfyM6JhLIBNK+RiMqkC6seKH?=
 =?iso-8859-1?Q?O1KH65Py/+wzGYjtXKKEwgI0yPHVmCZNIY5824jxv48vif8xcO+rWguIM2?=
 =?iso-8859-1?Q?fZx3RbhxvZJTKbHE27xpuMXWNA+faZzMAi6i3NuGTOpFcnVzu7akWZEg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f8fb5ec2-0b25-420c-f84f-08dc90b84ebc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2024 23:34:05.0128 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XFTwCI5ub8rCS/Qeaoue0tmnWomi2sVAMS1KjHvSY1RVUT2V1AqXHsTM5xvAFRnNqfSEwSNZSfKKXtMvC2HDqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8602
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

On Tue, Jun 18, 2024 at 09:18:15AM +0200, Thomas Hellström wrote:
> Use the LRU walker for eviction. This helps
> removing a lot of code with weird locking
> semantics.
> 
> The functionality is slightly changed so that
> when trylocked buffer objects are exhausted, we
> continue to interleave walks with ticket-locks while
> there is still progress made. The list walks are
> not restarted in-between evictions.
> 
> Also provide a separate ttm_bo_evict_first()
> function for its single user. The context of that
> user allows sleeping dma_resv locks.
> 
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: <dri-devel@lists.freedesktop.org>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/ttm/ttm_bo.c       | 350 ++++++++++++-----------------
>  drivers/gpu/drm/ttm/ttm_resource.c |  20 +-
>  include/drm/ttm/ttm_bo.h           |   8 +-
>  3 files changed, 145 insertions(+), 233 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 63a91b77f7da..316afe19a325 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -224,80 +224,6 @@ static void ttm_bo_flush_all_fences(struct ttm_buffer_object *bo)
>  	dma_resv_iter_end(&cursor);
>  }
>  
> -/**
> - * ttm_bo_cleanup_refs
> - * If bo idle, remove from lru lists, and unref.
> - * If not idle, block if possible.
> - *
> - * Must be called with lru_lock and reservation held, this function
> - * will drop the lru lock and optionally the reservation lock before returning.
> - *
> - * @bo:                    The buffer object to clean-up
> - * @interruptible:         Any sleeps should occur interruptibly.
> - * @no_wait_gpu:           Never wait for gpu. Return -EBUSY instead.
> - * @unlock_resv:           Unlock the reservation lock as well.
> - */
> -
> -static int ttm_bo_cleanup_refs(struct ttm_buffer_object *bo,
> -			       bool interruptible, bool no_wait_gpu,
> -			       bool unlock_resv)
> -{
> -	struct dma_resv *resv = &bo->base._resv;
> -	int ret;
> -
> -	if (dma_resv_test_signaled(resv, DMA_RESV_USAGE_BOOKKEEP))
> -		ret = 0;
> -	else
> -		ret = -EBUSY;
> -
> -	if (ret && !no_wait_gpu) {
> -		long lret;
> -
> -		if (unlock_resv)
> -			dma_resv_unlock(bo->base.resv);
> -		spin_unlock(&bo->bdev->lru_lock);
> -
> -		lret = dma_resv_wait_timeout(resv, DMA_RESV_USAGE_BOOKKEEP,
> -					     interruptible,
> -					     30 * HZ);
> -
> -		if (lret < 0)
> -			return lret;
> -		else if (lret == 0)
> -			return -EBUSY;
> -
> -		spin_lock(&bo->bdev->lru_lock);
> -		if (unlock_resv && !dma_resv_trylock(bo->base.resv)) {
> -			/*
> -			 * We raced, and lost, someone else holds the reservation now,
> -			 * and is probably busy in ttm_bo_cleanup_memtype_use.
> -			 *
> -			 * Even if it's not the case, because we finished waiting any
> -			 * delayed destruction would succeed, so just return success
> -			 * here.
> -			 */
> -			spin_unlock(&bo->bdev->lru_lock);
> -			return 0;
> -		}
> -		ret = 0;
> -	}
> -
> -	if (ret) {
> -		if (unlock_resv)
> -			dma_resv_unlock(bo->base.resv);
> -		spin_unlock(&bo->bdev->lru_lock);
> -		return ret;
> -	}
> -
> -	spin_unlock(&bo->bdev->lru_lock);
> -	ttm_bo_cleanup_memtype_use(bo);
> -
> -	if (unlock_resv)
> -		dma_resv_unlock(bo->base.resv);
> -
> -	return 0;
> -}
> -
>  /*
>   * Block for the dma_resv object to become idle, lock the buffer and clean up
>   * the resource and tt object.
> @@ -505,151 +431,154 @@ bool ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
>  }
>  EXPORT_SYMBOL(ttm_bo_eviction_valuable);
>  
> -/*
> - * Check the target bo is allowable to be evicted or swapout, including cases:
> - *
> - * a. if share same reservation object with ctx->resv, have assumption
> - * reservation objects should already be locked, so not lock again and
> - * return true directly when either the opreation allow_reserved_eviction
> - * or the target bo already is in delayed free list;
> +/**
> + * ttm_bo_evict_first() - Evict the first bo on the manager's LRU list.
> + * @bdev: The ttm device.
> + * @man: The manager whose bo to evict.
> + * @ctx: The TTM operation ctx governing the eviction.
>   *
> - * b. Otherwise, trylock it.
> + * Return: 0 if successful or the resource disappeared. Negative error code on error.
>   */
> -static bool ttm_bo_evict_swapout_allowable(struct ttm_buffer_object *bo,
> -					   struct ttm_operation_ctx *ctx,
> -					   const struct ttm_place *place,
> -					   bool *locked, bool *busy)
> +int ttm_bo_evict_first(struct ttm_device *bdev, struct ttm_resource_manager *man,
> +		       struct ttm_operation_ctx *ctx)
>  {
> -	bool ret = false;
> +	struct ttm_resource_cursor cursor;
> +	struct ttm_buffer_object *bo;
> +	struct ttm_resource *res;
> +	unsigned int mem_type;
> +	int ret = 0;
>  
> -	if (bo->pin_count) {
> -		*locked = false;
> -		if (busy)
> -			*busy = false;
> -		return false;
> +	spin_lock(&bdev->lru_lock);
> +	res = ttm_resource_manager_first(man, &cursor);
> +	if (!res) {
> +		ret = -ENOENT;
> +		goto out_no_ref;
>  	}
> +	bo = res->bo;
> +	if (!ttm_bo_get_unless_zero(bo))
> +		goto out_no_ref;
> +	mem_type = res->mem_type;
> +	spin_unlock(&bdev->lru_lock);
> +	ret = ttm_bo_reserve(bo, ctx->interruptible, ctx->no_wait_gpu, NULL);
> +	if (ret)
> +		goto out_no_lock;
> +	if (bo->resource != res || res->mem_type != mem_type)
> +		goto out_bad_res;
>  
> -	if (bo->base.resv == ctx->resv) {
> -		dma_resv_assert_held(bo->base.resv);
> -		if (ctx->allow_res_evict)
> -			ret = true;
> -		*locked = false;
> -		if (busy)
> -			*busy = false;
> +	if (bo->deleted) {
> +		ret = ttm_bo_wait_ctx(bo, ctx);
> +		if (ret)
> +			ttm_bo_cleanup_memtype_use(bo);
>  	} else {
> -		ret = dma_resv_trylock(bo->base.resv);
> -		*locked = ret;
> -		if (busy)
> -			*busy = !ret;
> -	}
> -
> -	if (ret && place && (bo->resource->mem_type != place->mem_type ||
> -		!bo->bdev->funcs->eviction_valuable(bo, place))) {
> -		ret = false;
> -		if (*locked) {
> -			dma_resv_unlock(bo->base.resv);
> -			*locked = false;
> -		}
> +		ret = ttm_bo_evict(bo, ctx);
>  	}
> -
> +out_bad_res:
> +	dma_resv_unlock(bo->base.resv);
> +out_no_lock:
> +	ttm_bo_put(bo);
> +	ttm_resource_cursor_fini(&cursor);
>  	return ret;
> +
> +out_no_ref:
> +	ttm_resource_cursor_fini_locked(&cursor);
> +	spin_unlock(&bdev->lru_lock);
> +	return -ENOENT;
>  }
>  
>  /**
> - * ttm_mem_evict_wait_busy - wait for a busy BO to become available
> - *
> - * @busy_bo: BO which couldn't be locked with trylock
> - * @ctx: operation context
> - * @ticket: acquire ticket
> - *
> - * Try to lock a busy buffer object to avoid failing eviction.
> + * struct ttm_bo_evict_walk - Parameters for the evict walk.
>   */
> -static int ttm_mem_evict_wait_busy(struct ttm_buffer_object *busy_bo,
> -				   struct ttm_operation_ctx *ctx,
> -				   struct ww_acquire_ctx *ticket)
> -{
> -	int r;
> -
> -	if (!busy_bo || !ticket)
> -		return -EBUSY;
> -
> -	if (ctx->interruptible)
> -		r = dma_resv_lock_interruptible(busy_bo->base.resv,
> -							  ticket);
> -	else
> -		r = dma_resv_lock(busy_bo->base.resv, ticket);
> -
> -	/*
> -	 * TODO: It would be better to keep the BO locked until allocation is at
> -	 * least tried one more time, but that would mean a much larger rework
> -	 * of TTM.
> -	 */
> -	if (!r)
> -		dma_resv_unlock(busy_bo->base.resv);
> -
> -	return r == -EDEADLK ? -EBUSY : r;
> -}
> +struct ttm_bo_evict_walk {
> +	/** @walk: The walk base parameters. */
> +	struct ttm_lru_walk walk;
> +	/** @place: The place passed to the resource allocation. */
> +	const struct ttm_place *place;
> +	/** @evictor: The buffer object we're trying to make room for. */
> +	struct ttm_buffer_object *evictor;
> +	/** @res: The allocated resource if any. */
> +	struct ttm_resource **res;
> +	/** @evicted: The number of evicted pages. */
> +	unsigned long evicted;
> +};
>  
> -int ttm_mem_evict_first(struct ttm_device *bdev,
> -			struct ttm_resource_manager *man,
> -			const struct ttm_place *place,
> -			struct ttm_operation_ctx *ctx,
> -			struct ww_acquire_ctx *ticket)
> +static long ttm_bo_evict_cb(struct ttm_lru_walk *walk, struct ttm_buffer_object *bo)
>  {
> -	struct ttm_buffer_object *bo = NULL, *busy_bo = NULL;
> -	struct ttm_resource_cursor cursor;
> -	struct ttm_resource *res;
> -	bool locked = false;
> -	int ret;
> +	struct ttm_bo_evict_walk *evict_walk =
> +		container_of(walk, typeof(*evict_walk), walk);
> +	long lret;
>  
> -	spin_lock(&bdev->lru_lock);
> -	ttm_resource_manager_for_each_res(man, &cursor, res) {
> -		bool busy;
> -
> -		if (!ttm_bo_evict_swapout_allowable(res->bo, ctx, place,
> -						    &locked, &busy)) {
> -			if (busy && !busy_bo && ticket !=
> -			    dma_resv_locking_ctx(res->bo->base.resv))
> -				busy_bo = res->bo;
> -			continue;
> -		}
> +	if (!bo->bdev->funcs->eviction_valuable(bo, evict_walk->place))
> +		return 0;
>  
> -		if (ttm_bo_get_unless_zero(res->bo)) {
> -			bo = res->bo;
> -			break;
> -		}
> -		if (locked)
> -			dma_resv_unlock(res->bo->base.resv);
> +	if (bo->deleted) {
> +		lret = ttm_bo_wait_ctx(bo, walk->ctx);
> +		if (!lret)
> +			ttm_bo_cleanup_memtype_use(bo);
> +	} else {
> +		lret = ttm_bo_evict(bo, walk->ctx);
>  	}
> -	ttm_resource_cursor_fini_locked(&cursor);
>  
> -	if (!bo) {
> -		if (busy_bo && !ttm_bo_get_unless_zero(busy_bo))
> -			busy_bo = NULL;
> -		spin_unlock(&bdev->lru_lock);
> -		ret = ttm_mem_evict_wait_busy(busy_bo, ctx, ticket);
> -		if (busy_bo)
> -			ttm_bo_put(busy_bo);
> -		return ret;
> -	}
> +	if (lret)
> +		goto out;
>  
> -	if (bo->deleted) {
> -		ret = ttm_bo_cleanup_refs(bo, ctx->interruptible,
> -					  ctx->no_wait_gpu, locked);
> -		ttm_bo_put(bo);
> -		return ret;
> -	}
> +	evict_walk->evicted++;
> +	if (evict_walk->res)
> +		lret = ttm_resource_alloc(evict_walk->evictor, evict_walk->place,
> +					  evict_walk->res);
> +	if (lret == 0)
> +		return 1;
> +out:
> +	/* Errors that should terminate the walk. */
> +	if (lret == -ENOMEM || lret == -EINTR || lret == -ERESTARTSYS ||
> +	    lret == -EAGAIN)
> +		return lret;
>  
> -	spin_unlock(&bdev->lru_lock);
> +	return 0;
> +}
>  
> -	ret = ttm_bo_evict(bo, ctx);
> -	if (locked)
> -		ttm_bo_unreserve(bo);
> -	else
> -		ttm_bo_move_to_lru_tail_unlocked(bo);
> +static const struct ttm_lru_walk_ops ttm_evict_walk_ops = {
> +	.process_bo = ttm_bo_evict_cb,
> +};
>  
> -	ttm_bo_put(bo);
> -	return ret;
> +static int ttm_bo_evict_alloc(struct ttm_device *bdev,
> +			      struct ttm_resource_manager *man,
> +			      const struct ttm_place *place,
> +			      struct ttm_buffer_object *evictor,
> +			      struct ttm_operation_ctx *ctx,
> +			      struct ww_acquire_ctx *ticket,
> +			      struct ttm_resource **res)
> +{
> +	struct ttm_bo_evict_walk evict_walk = {
> +		.walk = {
> +			.ops = &ttm_evict_walk_ops,
> +			.ctx = ctx,
> +			.ticket = ticket,
> +		},
> +		.place = place,
> +		.evictor = evictor,
> +		.res = res,
> +	};
> +	long lret;
> +
> +	evict_walk.walk.trylock_only = true;
> +	lret = ttm_lru_walk_for_evict(&evict_walk.walk, bdev, man, 1);
> +	if (lret || !ticket)
> +		goto out;
> +
> +	/* If ticket-locking, repeat while making progress. */
> +	evict_walk.walk.trylock_only = false;
> +	do {
> +		/* The walk may clear the evict_walk.walk.ticket field */
> +		evict_walk.walk.ticket = ticket;
> +		evict_walk.evicted = 0;
> +		lret = ttm_lru_walk_for_evict(&evict_walk.walk, bdev, man, 1);
> +	} while (!lret && evict_walk.evicted);
> +out:
> +	if (lret < 0)
> +		return lret;
> +	if (lret == 0)
> +		return -EBUSY;
> +	return 0;
>  }
>  
>  /**
> @@ -760,6 +689,7 @@ static int ttm_bo_alloc_resource(struct ttm_buffer_object *bo,
>  	for (i = 0; i < placement->num_placement; ++i) {
>  		const struct ttm_place *place = &placement->placement[i];
>  		struct ttm_resource_manager *man;
> +		bool may_evict;
>  
>  		man = ttm_manager_type(bdev, place->mem_type);
>  		if (!man || !ttm_resource_manager_used(man))
> @@ -769,22 +699,21 @@ static int ttm_bo_alloc_resource(struct ttm_buffer_object *bo,
>  				    TTM_PL_FLAG_FALLBACK))
>  			continue;
>  
> -		do {
> -			ret = ttm_resource_alloc(bo, place, res);
> -			if (unlikely(ret && ret != -ENOSPC))
> +		may_evict = (force_space && place->mem_type != TTM_PL_SYSTEM);
> +		ret = ttm_resource_alloc(bo, place, res);
> +		if (ret) {
> +			if (ret != -ENOSPC)
>  				return ret;
> -			if (likely(!ret) || !force_space)
> -				break;
> -
> -			ret = ttm_mem_evict_first(bdev, man, place, ctx,
> -						  ticket);
> -			if (unlikely(ret == -EBUSY))
> -				break;
> -			if (unlikely(ret))
> +			if (!may_evict)
> +				continue;
> +
> +			ret = ttm_bo_evict_alloc(bdev, man, place, bo, ctx,
> +						 ticket, res);
> +			if (ret == -EBUSY)
> +				continue;
> +			if (ret)
>  				return ret;
> -		} while (1);
> -		if (ret)
> -			continue;
> +		}
>  
>  		ret = ttm_bo_add_move_fence(bo, man, ctx->no_wait_gpu);
>  		if (unlikely(ret)) {
> @@ -796,7 +725,6 @@ static int ttm_bo_alloc_resource(struct ttm_buffer_object *bo,
>  		}
>  		return 0;
>  	}
> -
>  	return -ENOSPC;
>  }
>  
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
> index a03090683e79..6d0c66fc36e3 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -508,24 +508,10 @@ int ttm_resource_manager_evict_all(struct ttm_device *bdev,
>  	};
>  	struct dma_fence *fence;
>  	int ret;
> -	unsigned i;
> -
> -	/*
> -	 * Can't use standard list traversal since we're unlocking.
> -	 */
>  
> -	spin_lock(&bdev->lru_lock);
> -	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i) {
> -		while (!list_empty(&man->lru[i])) {
> -			spin_unlock(&bdev->lru_lock);
> -			ret = ttm_mem_evict_first(bdev, man, NULL, &ctx,
> -						  NULL);
> -			if (ret)
> -				return ret;
> -			spin_lock(&bdev->lru_lock);
> -		}
> -	}
> -	spin_unlock(&bdev->lru_lock);
> +	do {
> +		ret = ttm_bo_evict_first(bdev, man, &ctx);

Ooo, just noticed this after my initial review.

This function, ttm_bo_evict_first, will return -ENOENT if
ttm_bo_get_unless_zero returns false breaking this loop. I don't think
that is the correct behavior. If ttm_bo_get_unless_zero returns false on
the head of LRU, that means this is getting destroyed. I don't think in
that what we want do to here. Shouldn't continue the LRU walk evicting
all other BOs on the LRU list?

Matt 

> +	} while (!ret);
>  
>  	spin_lock(&man->move_lock);
>  	fence = dma_fence_get(man->move);
> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> index 472a55b69afb..148f49f625e4 100644
> --- a/include/drm/ttm/ttm_bo.h
> +++ b/include/drm/ttm/ttm_bo.h
> @@ -415,11 +415,9 @@ long ttm_bo_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
>  		    pgoff_t target);
>  void ttm_bo_pin(struct ttm_buffer_object *bo);
>  void ttm_bo_unpin(struct ttm_buffer_object *bo);
> -int ttm_mem_evict_first(struct ttm_device *bdev,
> -			struct ttm_resource_manager *man,
> -			const struct ttm_place *place,
> -			struct ttm_operation_ctx *ctx,
> -			struct ww_acquire_ctx *ticket);
> +int ttm_bo_evict_first(struct ttm_device *bdev,
> +		       struct ttm_resource_manager *man,
> +		       struct ttm_operation_ctx *ctx);
>  vm_fault_t ttm_bo_vm_reserve(struct ttm_buffer_object *bo,
>  			     struct vm_fault *vmf);
>  vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
> -- 
> 2.44.0
> 
