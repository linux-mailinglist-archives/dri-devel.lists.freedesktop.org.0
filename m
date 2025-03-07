Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B962BA56CA0
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 16:54:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10A0510EBDF;
	Fri,  7 Mar 2025 15:54:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B2sP+qb+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0430110E145;
 Fri,  7 Mar 2025 15:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741362853; x=1772898853;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=5aEx4NK0idYmFxeQODbZyUDUz3Zqn75F0YAQ71sh3AE=;
 b=B2sP+qb++IX2TcuuqazDsUkRwpNBD95DvgqoxViXWvu6XA5s2XbsPd3x
 CLI+UPW0xrWnGj9dNYVdnwk3T3Gl3nqXn+91GWawcOqTVRfFFuDToOC16
 xvpWILeB+jt+ioAhDv4p9NlSX7o7FN+1CQvHBpImyOTeuqEwVVu2En5Pk
 aiNgzW3Gows08obsHQ64zvNBjeKw7Uzwt27SnJJYGG42l715whT3CJbJW
 NjbSlHoqTIuM6s5fJ7or92tJvoJC4w1qSWMKbWcQpZCOlU7PEJfHEQYcz
 e9AAI83a9GK2ojaDsAQw2LvRxtwIC+zc835yKi0QCbjJ/KKginbUHaQz3 A==;
X-CSE-ConnectionGUID: WpAmUeTDTzq7uYmap6ETAw==
X-CSE-MsgGUID: eP2gK0JkQMeyxqe7RwEtWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="53802872"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="53802872"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 07:54:12 -0800
X-CSE-ConnectionGUID: uYLZmADcTdqOzObcXqwkaQ==
X-CSE-MsgGUID: wZqr6gTTTAa5NtiiFDAwRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="119108243"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 07:54:12 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 7 Mar 2025 07:54:11 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 7 Mar 2025 07:54:11 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 7 Mar 2025 07:54:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dDjSgfCk7CYeQg7OhUrtlJVWVXx41MxKBmqWWK4m8gBHiYNTRcasDZ5TyfKA1yOOw4U1ilwc9ueEEwU9pBKeBaFBqL7udpzBgTCR5cB7hSqMYXafVI/TGw0O+R5DFubdUZoVpJ5Hexa9SrF20+rTtG4MZYjfneorihiOH0xbANjoLDnLzxdNfonEVZqY5rDP2y+9e62CCSlpP59VdqIntUAZJhCBf0vFn4WSEfgpGvXKFO+xujKAAq1PAsNXnBOWEoFux2nBTNfwcxGEbfQa7+fLgfFlIS2FTqHTBHToKy+7Qs16E35MjPzjcLmQHlK4Fq747fybdsWV/o2T9Ia0yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XyLqHXN4SI8sc7T34fxxExMNO4ZbaoKsKW12dNIaqMI=;
 b=vJvbPt4+O7u3jdt4+0F0lkoCRootjHYxFYr8Vs6XDQcvO8vHvtxdKN3I/wUKdevBveo/gcNVl3vIR776lEy7ZrkMTkzmp3bu2RY1e8vK3CMRmUerBDHYMVbKzjZHoPCseLQfWarxfef5xDQlZliZvqqEkyrHZIE74j4CFio/g5bbz4C6m+tSxpFOYPvf+87XC4t26RFUuT/CgtCJnvTnyuSVcQyhW9QK1Ld0D5wpziEO6sY3cjE7JL83yiTjDrhLz3kUxKkJ95YuNg84up7A18vXDobvBr7Zs8q8yCFj/LQlqEK0rvYE6heaajC43bdLPtBspePlhtWAenI1h4OLXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB8593.namprd11.prod.outlook.com (2603:10b6:806:3ab::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.18; Fri, 7 Mar
 2025 15:54:06 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8511.017; Fri, 7 Mar 2025
 15:54:06 +0000
Date: Fri, 7 Mar 2025 07:55:13 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 Simona Vetter <simona.vetter@ffwll.ch>, Dave Airlie <airlied@redhat.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Thomas
 =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, "Stephen
 Rothwell" <sfr@canb.auug.org.au>
Subject: Re: [PATCH] drm/gpusvm: Fix kernel-doc
Message-ID: <Z8sW4cusxoljxuTu@lstrano-desk.jf.intel.com>
References: <20250307-fix-svm-kerneldoc-v1-1-c786f73ae910@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250307-fix-svm-kerneldoc-v1-1-c786f73ae910@intel.com>
X-ClientProxiedBy: MW4PR04CA0127.namprd04.prod.outlook.com
 (2603:10b6:303:84::12) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB8593:EE_
X-MS-Office365-Filtering-Correlation-Id: 38e25c33-6678-46c6-0e07-08dd5d904a4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?u0KAqFEdbW7xEDevfzbiCuogD7hJYNhazc1WNDJu8T/iplMXZl6epwRjv8?=
 =?iso-8859-1?Q?Eih4KjgbRqR7khv9yvreF+jW+y1rozQuGcorggIGx3+sJ41p6kNqjiTV+c?=
 =?iso-8859-1?Q?rzt6bBABbhdp+8meqg73TgHbSXYPEyjB7ioKIFwADGPe7+mX1B/Sm3IJWz?=
 =?iso-8859-1?Q?BlvjueSEhTr0CACnKPD4NQSX4Asru2s1bpXtFDJzym4MqH+2xfwylXCfdB?=
 =?iso-8859-1?Q?ABqY2IwdG9zI0oZg3a/zRmJxi/y/92ddF/he/xkjX9nn6Xetb0IoKiur71?=
 =?iso-8859-1?Q?ktXZ9y/1lqlBvxZDvlWfInNRhTpjc8+hPr6CahHzleqSp1mxfpjD8HyJvu?=
 =?iso-8859-1?Q?QG6ZFnjQZi+wctoSrEqpip6i3bxR8ESwauYkIVdKs6FeR1igHYvmCB1eKQ?=
 =?iso-8859-1?Q?ksgmj2Yvq7fUWQSYXQdlNqU5JN1mVtyiwcT4vFOLB0sSX/pQaZ4eFs3PLp?=
 =?iso-8859-1?Q?UOsj9ovne6kMi43bE/qBsZdMhB/FDSbfDcM4zdQLp+h6kKOfgugGSepHij?=
 =?iso-8859-1?Q?PK+2AyEKsfKSN4hK4NnstcxUUCkt55lSCdo3bwa2rfRrbIFG84ZYU/1zOy?=
 =?iso-8859-1?Q?J3K18kvtpThT7ojGXWd03u09QTPTOA7OxJ/sZbMdyFmjeic/BqLMyyvAf6?=
 =?iso-8859-1?Q?vaCOtvqiBRbO0X5Udf/iN9uQXvS3+IKDn5AwByf/njF6YFRZIlfOeV890V?=
 =?iso-8859-1?Q?Qk+tb7EM08/7PlfVZa+lOMA1YsasdhaqIAUP5a0mrU2QGNzn2nN+yHU12q?=
 =?iso-8859-1?Q?HP8NxDMGgVsZstMHuCbmUKt4ZVinuyaXbPkD+l8ZoulMlvOUhIsl30jg6o?=
 =?iso-8859-1?Q?aPsQIdtjzqWkQzNp+h4wyxFlZSRE01Wz2LWnlM63W//VvatQrh225FZB26?=
 =?iso-8859-1?Q?XHYnXQJL3goJiHAHdiEqd3xrXKsrW+MKuZzpZVtlbbw/CId0y91gkiMdqv?=
 =?iso-8859-1?Q?50JbF+Jedxd9JOKCNRh871KRR8dMH6JCDibumtczzbQQD6xTZwBK2hYGwU?=
 =?iso-8859-1?Q?wFbX1MFfzfTT/QLRiZFJvkSJ5W1MrET7fyr7NPe+M8KIg43iKnp8YHmlfo?=
 =?iso-8859-1?Q?+3wHWQqhvXTupJHNBM2FW9lXufV9IueYZGq814XDuOJ1NQil1xwcFPgg7y?=
 =?iso-8859-1?Q?qW2PQlLW5DzayIjXTGIEeBNfJVYz1gNjI7GQOGBgxB/z8zJ7zHD7M53Ri7?=
 =?iso-8859-1?Q?rh8GVwbqik6TZUMv4K0ErHscHfu8LoMzBiDPP6z85r25YoBVY2vsNVHJZl?=
 =?iso-8859-1?Q?SKC+ntkD4gdx3uNFZOaFqCyPFY/2I6KPf4Vxm0ZQ8Is/qQVTDSDpPCpdxt?=
 =?iso-8859-1?Q?dZxIQ64bsz2TeMfWDp3NiYdQH3U1qc8NWQKZqEls1fW67GhOMBg5uIPi4D?=
 =?iso-8859-1?Q?CwxQQxaidQUgjt7+ZxKkZv+ZyYLJUTS02aGH+Ngk1dFLpl/XjFKy7bxouC?=
 =?iso-8859-1?Q?SmKDM1sVl7/ko65f?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?OGWw7MswKcsl2sS7WFwRyVKflqe3HcPtgpiidpxJdVNOEM/a3ULkpXkg0K?=
 =?iso-8859-1?Q?euy+amTC86Y+hur5aumWyKGSaCjjwH5DAtbDqSLUP7Corc+ene1hCA/UHG?=
 =?iso-8859-1?Q?xvkBZTc0NRpHcSSmMYt972TU7GQ2twXvGobhiUQF/KxPtm6NxNmc1nTktB?=
 =?iso-8859-1?Q?+Ax2ZvDzr5Xf1hMjmYJcy1ifCNxMltLoYhocAf6ol73Qz92Rp4F9D0I6n4?=
 =?iso-8859-1?Q?gWy+suj70CRsEbuB9e7hSxfVf9Kq3tlijitR2/D+iJ+vhDTJszoHGkCDgH?=
 =?iso-8859-1?Q?BXIPjexFUmq+k24wuTCpPldktBr9FJU0KQdcvd7R6XqOoluSjMY/LV7lHa?=
 =?iso-8859-1?Q?lTgEIbZbisSRJp+upWVb/GcvVS4qsH8PVTOUsO5lkfg3IHhaK5HoijvKlT?=
 =?iso-8859-1?Q?zlkXY2DJmsehvVCd3kDBJl458M1Eo5V/A3lMAz7+R9RvPIWdqXYFJzlJUI?=
 =?iso-8859-1?Q?yN9S2HmWdexPRsjGjab1xdIvSKuVoJmSWQwERVZvgG9Inv9C+SdrNpQMC6?=
 =?iso-8859-1?Q?cVvDjjbJIGMRn9WNr8udfKvbYLcrKJpA9hVCTw1Ng+SyARwfOc1Su38wiG?=
 =?iso-8859-1?Q?Bz8xnoGXvs5o6XlVeJZQfBF6rGvODJnz36fXC1ZqhBGaNgqkIDf0IpHSGS?=
 =?iso-8859-1?Q?1a7CgIgiGeQCg77xyif8i0I7kIA3PgP6wtsg9LadFe7ck6c4wGGPVEWyys?=
 =?iso-8859-1?Q?WZlS23XXPfIhek9wbeQrgjnBbtVBprm2OmpKL2sUJyZGzMqMt/fs3PqreD?=
 =?iso-8859-1?Q?KER4GOCTQzpASiGXyC6CpLlZ2h4nc1qjkYZ99am3zU/qw0ay2IHqT4ODR0?=
 =?iso-8859-1?Q?zzL66cPWU8g3GQ6zD61PohSGezKnyyMbWWMkAewKd3qS27V+VqA4P/eXZC?=
 =?iso-8859-1?Q?JS7gaatLzO3HAJYYKBZPrDJs+cNXPO8BkKkrQ2/pf/cp5kQTTPKuPDXFBS?=
 =?iso-8859-1?Q?NNsI9gSzN+OXacyna5ekHCE9twjovFFDXeAgNyQYWXHepJWRhjj6sVvLJr?=
 =?iso-8859-1?Q?Aeqd5JCyY4w35UB2Ub+bnOaFn+5WMlUKF7aZ4UsmOqNrVtkU4RAooV97/d?=
 =?iso-8859-1?Q?jK30IoYwO2zeRLMvJIedODgI+CvoTSGv8Z2fLAnHcxNh1iQ8jV9UvqDVOU?=
 =?iso-8859-1?Q?raYs6oAUpNVq3Fy0KxdStIw6287G2DjcqJgDNVolBzNvBGSGaQrFORbK6x?=
 =?iso-8859-1?Q?dzCyPg2EUK+Esi+yL75FcYeaIEBfO0oS/Wr6Gq7tPmBiEfsvrgHxfWeSQZ?=
 =?iso-8859-1?Q?IqrGFyW4CRbGzRzg4azAADwF7deSNh570qRQfn43J/x9wMVoA9ZW6bW5XJ?=
 =?iso-8859-1?Q?xM7fbDe9yv+c680qyHRQOukHUGmgkivcYwTXukhC+s099Wpo9SoP2+l+A2?=
 =?iso-8859-1?Q?FJHWO0lhkWOX8KAEioGcelLSOfhDO9JHor/wdrwN6EsF8LM9jVZgbS7+Iz?=
 =?iso-8859-1?Q?9HBK5BLr1NYaKZEjtxlKZ/XCiQrLDlD7+H2cE9DunYdSRETToAGGP0ZNdt?=
 =?iso-8859-1?Q?BbQgK1pX/A2m3sD5IR5WadJ3/OwSBo6+voA5Wb0WDt23ksjxxgWKmzLpHg?=
 =?iso-8859-1?Q?NK/MOiFqMIgGGDOy8lDquA+4C7923WQ79P7t0zzNvHsIe2/dV7RRAoEAkN?=
 =?iso-8859-1?Q?X3eIZC4EJpXKF0nR9lG8VqGx575CuDxyqkG6ogm3/fWnXrFD5M4CJ6TQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 38e25c33-6678-46c6-0e07-08dd5d904a4f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 15:54:06.1447 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 43Pa0RogLP1f7A+REMY/sgzSK0r5MUR3wxTjGfQr+qbsClJdto240wru/0AYCQkafqvWio0MLeoF/QV/Ry8dYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8593
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

On Fri, Mar 07, 2025 at 07:40:28AM -0800, Lucas De Marchi wrote:
> Due to wrong `.. kernel-doc` directive in Documentation/gpu/rfc/gpusvm.rst
> the documentation was actually not parsing anything from
> drivers/gpu/drm/drm_gpusvm.c. This fixes the kernel-doc include and all
> warnings/errors created when doing so.
> 

Thanks for fixing this. One nit below.

> Cc: Simona Vetter <simona.vetter@ffwll.ch>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/intel-xe/20250307195239.57abcd2d@canb.auug.org.au/
> Fixes: 99624bdff867 ("drm/gpusvm: Add support for GPU Shared Virtual Memory")
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  Documentation/gpu/rfc/gpusvm.rst |  15 +++--
>  drivers/gpu/drm/drm_gpusvm.c     | 138 +++++++++++++++++++++------------------
>  2 files changed, 86 insertions(+), 67 deletions(-)
> 
> diff --git a/Documentation/gpu/rfc/gpusvm.rst b/Documentation/gpu/rfc/gpusvm.rst
> index 073e46065d9c6ce7de48aadd7d1cc5e57c0a9e21..bcf66a8137a64404cd559d0cf6cd6cb4548e2098 100644
> --- a/Documentation/gpu/rfc/gpusvm.rst
> +++ b/Documentation/gpu/rfc/gpusvm.rst
> @@ -67,14 +67,19 @@ Agreed upon design principles
>  Overview of baseline design
>  ===========================
>  
> -Baseline design is simple as possible to get a working basline in which can be
> -built upon.
> -
> -.. kernel-doc:: drivers/gpu/drm/xe/drm_gpusvm.c
> +.. kernel-doc:: drivers/gpu/drm/drm_gpusvm.c
>     :doc: Overview
> +
> +.. kernel-doc:: drivers/gpu/drm/drm_gpusvm.c
>     :doc: Locking
> -   :doc: Migrataion
> +
> +.. kernel-doc:: drivers/gpu/drm/drm_gpusvm.c
> +   :doc: Migration
> +
> +.. kernel-doc:: drivers/gpu/drm/drm_gpusvm.c
>     :doc: Partial Unmapping of Ranges
> +
> +.. kernel-doc:: drivers/gpu/drm/drm_gpusvm.c
>     :doc: Examples
>  
>  Possible future design features
> diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
> index f314f5c4af0f309e899bedace52c3eb9ad82e0ac..d7ec12483554791b513a1587b87071759cb53943 100644
> --- a/drivers/gpu/drm/drm_gpusvm.c
> +++ b/drivers/gpu/drm/drm_gpusvm.c
> @@ -23,54 +23,63 @@
>   * DOC: Overview
>   *
>   * GPU Shared Virtual Memory (GPU SVM) layer for the Direct Rendering Manager (DRM)
> - *
> - * The GPU SVM layer is a component of the DRM framework designed to manage shared
> - * virtual memory between the CPU and GPU. It enables efficient data exchange and
> - * processing for GPU-accelerated applications by allowing memory sharing and
> + * is a component of the DRM framework designed to manage shared virtual memory
> + * between the CPU and GPU. It enables efficient data exchange and processing
> + * for GPU-accelerated applications by allowing memory sharing and
>   * synchronization between the CPU's and GPU's virtual address spaces.
>   *
>   * Key GPU SVM Components:
> - * - Notifiers: Notifiers: Used for tracking memory intervals and notifying the
> - *		GPU of changes, notifiers are sized based on a GPU SVM
> - *		initialization parameter, with a recommendation of 512M or
> - *		larger. They maintain a Red-BlacK tree and a list of ranges that
> - *		fall within the notifier interval. Notifiers are tracked within
> - *		a GPU SVM Red-BlacK tree and list and are dynamically inserted
> - *		or removed as ranges within the interval are created or
> - *		destroyed.
> - * - Ranges: Represent memory ranges mapped in a DRM device and managed
> - *	     by GPU SVM. They are sized based on an array of chunk sizes, which
> - *	     is a GPU SVM initialization parameter, and the CPU address space.
> - *	     Upon GPU fault, the largest aligned chunk that fits within the
> - *	     faulting CPU address space is chosen for the range size. Ranges are
> - *	     expected to be dynamically allocated on GPU fault and removed on an
> - *	     MMU notifier UNMAP event. As mentioned above, ranges are tracked in
> - *	     a notifier's Red-Black tree.
> - * - Operations: Define the interface for driver-specific GPU SVM operations
> - *               such as range allocation, notifier allocation, and
> - *               invalidations.
> - * - Device Memory Allocations: Embedded structure containing enough information
> - *                              for GPU SVM to migrate to / from device memory.
> - * - Device Memory Operations: Define the interface for driver-specific device
> - *                             memory operations release memory, populate pfns,
> - *                             and copy to / from device memory.
> - *
> - * This layer provides interfaces for allocating, mapping, migrating, and
> - * releasing memory ranges between the CPU and GPU. It handles all core memory
> - * management interactions (DMA mapping, HMM, and migration) and provides
> - * driver-specific virtual functions (vfuncs). This infrastructure is sufficient
> - * to build the expected driver components for an SVM implementation as detailed
> - * below.
> + *
> + * - Notifiers:
> + *	Used for tracking memory intervals and notifying the GPU of changes,
> + *	notifiers are sized based on a GPU SVM initialization parameter, with a
> + *	recommendation of 512M or larger. They maintain a Red-BlacK tree and a
> + *	list of ranges that fall within the notifier interval.  Notifiers are
> + *	tracked within a GPU SVM Red-BlacK tree and list and are dynamically
> + *	inserted or removed as ranges within the interval are created or
> + *	destroyed.
> + * - Ranges:
> + *	Represent memory ranges mapped in a DRM device and managed by GPU SVM.
> + *	They are sized based on an array of chunk sizes, which is a GPU SVM
> + *	initialization parameter, and the CPU address space.  Upon GPU fault,
> + *	the largest aligned chunk that fits within the faulting CPU address
> + *	space is chosen for the range size. Ranges are expected to be
> + *	dynamically allocated on GPU fault and removed on an MMU notifier UNMAP
> + *	event. As mentioned above, ranges are tracked in a notifier's Red-Black
> + *	tree.
> + *
> + * - Operations:
> + *	Define the interface for driver-specific GPU SVM operations such as
> + *	range allocation, notifier allocation, and invalidations.
> + *
> + * - Device Memory Allocations:
> + *	Embedded structure containing enough information for GPU SVM to migrate
> + *	to / from device memory.
> + *
> + * - Device Memory Operations:
> + *	Define the interface for driver-specific device memory operations
> + *	release memory, populate pfns, and copy to / from device memory.
> + *
> + *	This layer provides interfaces for allocating, mapping, migrating, and
> + *	releasing memory ranges between the CPU and GPU. It handles all core
> + *	memory management interactions (DMA mapping, HMM, and migration) and
> + *	provides driver-specific virtual functions (vfuncs). This infrastructure
> + *	is sufficient to build the expected driver components for an SVM
> + *	implementation as detailed below.

I think you have an extra indentation here.

With this fixed:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

>   *
>   * Expected Driver Components:
> - * - GPU page fault handler: Used to create ranges and notifiers based on the
> - *			     fault address, optionally migrate the range to
> - *			     device memory, and create GPU bindings.
> - * - Garbage collector: Used to unmap and destroy GPU bindings for ranges.
> - *			Ranges are expected to be added to the garbage collector
> - *			upon a MMU_NOTIFY_UNMAP event in notifier callback.
> - * - Notifier callback: Used to invalidate and DMA unmap GPU bindings for
> - *			ranges.
> + *
> + * - GPU page fault handler:
> + *	Used to create ranges and notifiers based on the fault address,
> + *	optionally migrate the range to device memory, and create GPU bindings.
> + *
> + * - Garbage collector:
> + *	Used to unmap and destroy GPU bindings for ranges.  Ranges are expected
> + *	to be added to the garbage collector upon a MMU_NOTIFY_UNMAP event in
> + *	notifier callback.
> + *
> + * - Notifier callback:
> + *	Used to invalidate and DMA unmap GPU bindings for ranges.
>   */
>  
>  /**
> @@ -83,9 +92,9 @@
>   * range RB tree and list, as well as the range's DMA mappings and sequence
>   * number. GPU SVM manages all necessary locking and unlocking operations,
>   * except for the recheck range's pages being valid
> - * (drm_gpusvm_range_pages_valid) when the driver is committing GPU bindings. This
> - * lock corresponds to the 'driver->update' lock mentioned in the HMM
> - * documentation (TODO: Link). Future revisions may transition from a GPU SVM
> + * (drm_gpusvm_range_pages_valid) when the driver is committing GPU bindings.
> + * This lock corresponds to the ``driver->update`` lock mentioned in
> + * Documentation/mm/hmm.rst. Future revisions may transition from a GPU SVM
>   * global lock to a per-notifier lock if finer-grained locking is deemed
>   * necessary.
>   *
> @@ -102,11 +111,11 @@
>   * DOC: Migration
>   *
>   * The migration support is quite simple, allowing migration between RAM and
> - * device memory at the range granularity. For example, GPU SVM currently does not
> - * support mixing RAM and device memory pages within a range. This means that upon GPU
> - * fault, the entire range can be migrated to device memory, and upon CPU fault, the
> - * entire range is migrated to RAM. Mixed RAM and device memory storage within a range
> - * could be added in the future if required.
> + * device memory at the range granularity. For example, GPU SVM currently does
> + * not support mixing RAM and device memory pages within a range. This means
> + * that upon GPU fault, the entire range can be migrated to device memory, and
> + * upon CPU fault, the entire range is migrated to RAM. Mixed RAM and device
> + * memory storage within a range could be added in the future if required.
>   *
>   * The reasoning for only supporting range granularity is as follows: it
>   * simplifies the implementation, and range sizes are driver-defined and should
> @@ -119,11 +128,11 @@
>   * Partial unmapping of ranges (e.g., 1M out of 2M is unmapped by CPU resulting
>   * in MMU_NOTIFY_UNMAP event) presents several challenges, with the main one
>   * being that a subset of the range still has CPU and GPU mappings. If the
> - * backing store for the range is in device memory, a subset of the backing store has
> - * references. One option would be to split the range and device memory backing store,
> - * but the implementation for this would be quite complicated. Given that
> - * partial unmappings are rare and driver-defined range sizes are relatively
> - * small, GPU SVM does not support splitting of ranges.
> + * backing store for the range is in device memory, a subset of the backing
> + * store has references. One option would be to split the range and device
> + * memory backing store, but the implementation for this would be quite
> + * complicated. Given that partial unmappings are rare and driver-defined range
> + * sizes are relatively small, GPU SVM does not support splitting of ranges.
>   *
>   * With no support for range splitting, upon partial unmapping of a range, the
>   * driver is expected to invalidate and destroy the entire range. If the range
> @@ -144,6 +153,8 @@
>   *
>   * 1) GPU page fault handler
>   *
> + * .. code-block:: c
> + *
>   *	int driver_bind_range(struct drm_gpusvm *gpusvm, struct drm_gpusvm_range *range)
>   *	{
>   *		int err = 0;
> @@ -208,7 +219,9 @@
>   *		return err;
>   *	}
>   *
> - * 2) Garbage Collector.
> + * 2) Garbage Collector
> + *
> + * .. code-block:: c
>   *
>   *	void __driver_garbage_collector(struct drm_gpusvm *gpusvm,
>   *					struct drm_gpusvm_range *range)
> @@ -231,7 +244,9 @@
>   *			__driver_garbage_collector(gpusvm, range);
>   *	}
>   *
> - * 3) Notifier callback.
> + * 3) Notifier callback
> + *
> + * .. code-block:: c
>   *
>   *	void driver_invalidation(struct drm_gpusvm *gpusvm,
>   *				 struct drm_gpusvm_notifier *notifier,
> @@ -499,7 +514,7 @@ drm_gpusvm_notifier_invalidate(struct mmu_interval_notifier *mni,
>  	return true;
>  }
>  
> -/**
> +/*
>   * drm_gpusvm_notifier_ops - MMU interval notifier operations for GPU SVM
>   */
>  static const struct mmu_interval_notifier_ops drm_gpusvm_notifier_ops = {
> @@ -2055,7 +2070,6 @@ static int __drm_gpusvm_migrate_to_ram(struct vm_area_struct *vas,
>  
>  /**
>   * drm_gpusvm_range_evict - Evict GPU SVM range
> - * @pagemap: Pointer to the GPU SVM structure
>   * @range: Pointer to the GPU SVM range to be removed
>   *
>   * This function evicts the specified GPU SVM range. This function will not
> @@ -2146,8 +2160,8 @@ static vm_fault_t drm_gpusvm_migrate_to_ram(struct vm_fault *vmf)
>  	return err ? VM_FAULT_SIGBUS : 0;
>  }
>  
> -/**
> - * drm_gpusvm_pagemap_ops() - Device page map operations for GPU SVM
> +/*
> + * drm_gpusvm_pagemap_ops - Device page map operations for GPU SVM
>   */
>  static const struct dev_pagemap_ops drm_gpusvm_pagemap_ops = {
>  	.page_free = drm_gpusvm_page_free,
> 
> ---
> base-commit: 2c4fba1d065427efba4aaed5f80f4664c9f4a729
> change-id: 20250307-fix-svm-kerneldoc-8a4051e25d44
> 
> Best regards,
> -- 
> Lucas De Marchi <lucas.demarchi@intel.com>
