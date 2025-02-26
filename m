Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F19A452DC
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 03:12:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05B4C10E836;
	Wed, 26 Feb 2025 02:11:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cQsZbuFK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7979C10E1E5;
 Wed, 26 Feb 2025 02:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740535918; x=1772071918;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=k9NpMorvp2DD2Kh1/DwCkErOY3sroHJRrfDdhVJUjJc=;
 b=cQsZbuFK5kRtcwbRuzeI1T48GQPc7gH8cMYkZmt7u8FDe6Qdg9j2kbwL
 Gx7D+/PtlT8KY1EcjF7qTVxK3MdF6PDNH/CpebBEtPDq+eeVNJHbHHfXJ
 a+heXYLGbGylR7dP6DblkhTEASuzcppvzrgDyEmWsLsE5GwClOEuaRm+b
 poE6h/f4KCGw6yM0bBzbF17hfM28IL7lO82cxtklZLxQX17haFHbAZlLE
 9c18sSV7zhJ9VqpYsAkVV+et43rq7DQ8xzxgEg9kTTMa42NlEQvijR4B9
 TVHABiAL9D9Mn8eyHD30wn2diuPNrsFcKjTnJJ5W4TmZZqcRBcgcIc+WS Q==;
X-CSE-ConnectionGUID: 4pR/whJwTiOmDHK7OX9wpA==
X-CSE-MsgGUID: E4EpLKztTyKTrsbL/F6pAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="41622534"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; d="scan'208";a="41622534"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 18:11:55 -0800
X-CSE-ConnectionGUID: aPc4aMUzQtmzgTe7LTYmSA==
X-CSE-MsgGUID: OpbWDsRqRoOj8bjZy9nocA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; d="scan'208";a="117184540"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Feb 2025 18:11:54 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 25 Feb 2025 18:11:54 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 25 Feb 2025 18:11:54 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Feb 2025 18:11:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a1hccXUHpxnEdOYyu7L4Pkzr8HnWYlQTz17TuT3ySyC2MkyBEYGqeO0Vy0NZItzucZRKRK9ZsFzN3JW1nCJEPgo/batiV44DRLll0KMc+tjzpsu1hgqBkNHkud/9gg3EHDZ/gUxj0hJ+YBsJaR0SDyo+vSOeo9NTGLD9uBRItBdruIHjKylo24IklO3Ho69cyZuacNI7bQtBkFKp6fBcT+1msA//t2sDKUwKrVhZQYqk4yxCaUmnTqhGNdWKsCRokHnGmnD9Ti07idAehpJC+HnLhMSc3usGqSAbbtJCeDZaJ2jDv1/IBObY5J/Zp65c6MPTcCNn4Q2tEIwqyAqCew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9i61M/aKwGKbDy5Gv/pD+1OrjNalCU1lx3frwZmOA3Y=;
 b=IoXbi+6XCaYEqaL19GPjF+NbPD8EzpwidKNGkudtPcrU7eaaxPD1AtSvsp5mGBlqgTlnysoBLbBlOscvxZ/Lc85AB8UHoA9ZBFOJ+3/k1oEQ0GccsInmYIXhji1N+7c4Wtk6AIz50hCUXBdnHZ/1FRIV9xgLwlgzi8g6xHL0Qz2idoUDJEe+Lda7LizbjFfVRJ7YUjNSwaxmaZxB4XzGyrIrqx2/MDI4HrU/ZBUv5SflK1Gxb8510/fecQ+pDFYIw+FQNo0g0OeWwWDCaGtYinY2u+Y1a9axD4G/I5yvPIVjITbPCUm5P8nW2UKPGZuwBoneCbqr1rvNs0RVEcwygw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB6914.namprd11.prod.outlook.com (2603:10b6:930:5a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Wed, 26 Feb
 2025 02:11:52 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8466.016; Wed, 26 Feb 2025
 02:11:52 +0000
Date: Tue, 25 Feb 2025 18:12:54 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <jeffbai@aosc.io>
CC: Lucas De Marchi <lucas.demarchi@intel.com>, Thomas
 =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, =?iso-8859-1?Q?Jos=E9?= Roberto de Souza
 <jose.souza@intel.com>, Francois Dugast <francois.dugast@intel.com>, "Alan
 Previn" <alan.previn.teres.alexis@intel.com>, Zhanjun Dong
 <zhanjun.dong@intel.com>, Matt Roper <matthew.d.roper@intel.com>, "Mateusz
 Naklicki" <mateusz.naklicki@intel.com>, Mauro Carvalho Chehab
 <mauro.chehab@linux.intel.com>, Zbigniew =?utf-8?Q?Kempczy=C5=84ski?=
 <zbigniew.kempczynski@intel.com>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Kexy
 Biscuit" <kexybiscuit@aosc.io>, Shang Yatsen <429839446@qq.com>,
 <stable@vger.kernel.org>, Haien Liang <27873200@qq.com>, Shirong Liu
 <lsr1024@qq.com>, Haofeng Wu <s2600cw2@126.com>
Subject: Re: [PATCH 4/5] drm/xe: use 4K alignment for cursor jumps
Message-ID: <Z754phgANbgwSptb@lstrano-desk.jf.intel.com>
References: <20250226-xe-non-4k-fix-v1-0-80f23b5ee40e@aosc.io>
 <20250226-xe-non-4k-fix-v1-4-80f23b5ee40e@aosc.io>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250226-xe-non-4k-fix-v1-4-80f23b5ee40e@aosc.io>
X-ClientProxiedBy: MW4PR03CA0210.namprd03.prod.outlook.com
 (2603:10b6:303:b8::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB6914:EE_
X-MS-Office365-Filtering-Correlation-Id: 652d5942-d7d7-43e2-773c-08dd560aef16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XB36jnqnYWkRwu8aAr3rbCmFVWFCh+dk2N21i2CxvNaFd4eT2O6qHIfNvwp7?=
 =?us-ascii?Q?uFRn75EccOwIEYnG4yYQsxkJLB2O6VeMLFoniTf6YEHhWDC8dWxxpbKUQw7D?=
 =?us-ascii?Q?QAfH33biAeGI47b8us7HzIqxqNTwmvgDkuqCAUXtfB8T6WURC1MMXi2Iv/jD?=
 =?us-ascii?Q?E4uZr0hBVgsuDmlFnjnm7rtAGkj6/pNp2EsiydJZPl9BEVTSlO/Psgqm3DwE?=
 =?us-ascii?Q?UgeddcNM3GnAPfvQg/7/3ylHTXK+LmObrnYhya7peQgfgFkiW1Ida56tehmK?=
 =?us-ascii?Q?1i1EkF8X5DAesSP5qG6KWZMV6vTfzngWL7pAigxqVgPoXIPNl7bUsjSPQckz?=
 =?us-ascii?Q?PSy7VEIQh3cv7nHXuwx5x+/L1gPgAm6WCf1b/LQilXRcuuF7uIbtPAkeWMi0?=
 =?us-ascii?Q?9NRnbca69iGqDIvMH5d1Z9bkoqOIeixVNmbEF99K0cZssDMFJ7wLv5kcLb4r?=
 =?us-ascii?Q?RndJRzSokstK3Ny+7SXLLzv7t6PD3PFG+V8ImYFdTIhrsOMnRJEJehBpxsqq?=
 =?us-ascii?Q?MAqAeA9b7f3yz/nqJ2hU11QFYGGK9MrDvyq6QoUiL1jbl6XSmQ3RPni3VLx+?=
 =?us-ascii?Q?6jhfe2SskN6Qc1zeqdypsnRPi2ecl2jLFHlZGWw4yn256PGln+C7KEh6b9Nl?=
 =?us-ascii?Q?Apnm+i+ZXX6k9gETZLYgNx9URySqawnh0Wzi/tkBAL2d5yoDZEURPNBmfIBr?=
 =?us-ascii?Q?HwvrooWNBKYmlzEMj3oia/jo2rz1wjOOBQ5mGuHaXwBqOYK14EL9Twb0UIYV?=
 =?us-ascii?Q?/xi2JZDNB7iravrIMYfTJxDLo9EnUO842OtrAFIve+c1cESVa4JwdYIAqpGz?=
 =?us-ascii?Q?rfAf/Clpkmt/7hUsHJBD08ecJa2sLDo1ZLrN0IAraEuxbfcw3s6wgWO7RsoK?=
 =?us-ascii?Q?rnQxFco3xLXyvLRF5uGZE4BN6yFDvRiWy6eJ5xeLmyWpJuGbKnBCHFmm6dHZ?=
 =?us-ascii?Q?06kqlVLU4n8nygtfd+EWGz81Ean7N2dDwXbsKe64ucZFi6CeW5VQ/Ks2X5kK?=
 =?us-ascii?Q?cwKA/tBNV0WRGoGH3ybEg3VwFxmn4GO4Yd/Y3/w7Bco1LAJuy+ebE8XOlmwz?=
 =?us-ascii?Q?xltUlwWeTUcRA7r/j3UOA43H/SQOetcHaRmHI5Z4G5kvfTRBA4ElmMAwIztr?=
 =?us-ascii?Q?STlDnESPxQ74RxZztrseFhwEG2/xBLrNc35q/KsBkhAwuIbP2aF71GzjGB55?=
 =?us-ascii?Q?8aw56dWtu3z3BeZAhWZ/BqR1AXQjQDzBFzS1o/8V/KlwxbHEU2QzyAlE9Tkm?=
 =?us-ascii?Q?A0HroS1LI/Due7I5ISzhoZD4QqXPVVYQwVAb67Qm5+tD5U48gaP8epin1AqG?=
 =?us-ascii?Q?8FJi3Bd1YbRwmiOBq9/2KzzoyPoAoUpatDbMvADkaXvAqgZafkQdDf9IQpCi?=
 =?us-ascii?Q?ZikOJg1F0dvvyp8IG5GVWbyrHbHs?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aynF2NxK1KQO0zmNfU2+aMEoxN5xm/qFjBmDUKcGLh+6jVHpLH47EnKICIb9?=
 =?us-ascii?Q?LWJn3/IQWfDxfFRXuiUdu4GVT7JAPDk2bEpDy4nJdJnZX1q3DfNIx2kXaBH1?=
 =?us-ascii?Q?KYBtjoLsZXf+hw0WdgxlQAqVsic6ZNLyfqqkpuQNj1Yd1Px51MZQWXaH4V2l?=
 =?us-ascii?Q?V37Y7rgCK8WqIWGviBlvvytDL5q96M6ADo5zZca9aJKQ+ts97LjobpCdfIVW?=
 =?us-ascii?Q?1wWdEHiemGkVV0jxme5kFj3CBd6H+avXrd6UL3g9DpN6+xj4wzWZXx5ub/fx?=
 =?us-ascii?Q?JphmGlMZNUA2NafUZvJi3orVhnp+w6neU45UsolwaZVm1cYszZhbCGY06sC0?=
 =?us-ascii?Q?VUHt+R452AqMgNzvF/iFKRjBKAA6Vx15ridTOUU+mvp0dW+fxZwQsHbtX3E4?=
 =?us-ascii?Q?NlntG9mMRU0xgnHjLu0t7qlD0IlIB2LCHiK0C6xN289oNJsq887QtMsUfCyx?=
 =?us-ascii?Q?eE2lKvxwnPJ241Hx4xckEYIjsxJ0J24LiI+Jd0Z79ucJ/5nFISao7DAfYMKc?=
 =?us-ascii?Q?LJF3KAm26HRSi5u9SzCbQlCwI7Zfye6mdyPt5LO3L79z8sqeAO9Y02ccZ4Zd?=
 =?us-ascii?Q?RbRUH+ErIOZidLOvc2FL0WEon4WbpGdy4iwYD+CnIJibuzpFznyQsZG1l/wu?=
 =?us-ascii?Q?EjWM/5WQHjevgcgeV+KCWGCFAWmhpc1iouMhS1UYUp0bbSzSmZULDXsDJiLy?=
 =?us-ascii?Q?V0ohFliVrUGsOWZkuicel70HmvjcnimlEVeIBwfIhzZ+IcDnnPLXPMzAxY3B?=
 =?us-ascii?Q?ZD7WztCcJ/aoUZ1EVvbKG7lDgtS6P+GbKGVtlLhs2iI4p3xy7GHtDivQoGbL?=
 =?us-ascii?Q?1g/kQGjPfhfal4gch5O712FcKdUjH/fru91IhgSU0MSC7BC92G+JT4Pglm7M?=
 =?us-ascii?Q?SfmI/7zwzKgvHmEmc1+IvkmPciUxcwfQsSA6VEKATUXV1Te7lPDJG/44R3Az?=
 =?us-ascii?Q?HESn/RUEo/zshtkLVHVWiaYmojx6/EY4b2ES1cyNitIt94xJc4ss0OrlYfuq?=
 =?us-ascii?Q?cHf4KZbG3R5y4hUVqLRE2W8To8n1Fu249xvjhkAvgaSox9LipzWvBW8/jxuE?=
 =?us-ascii?Q?ntPHoYMr9visYN/SlqCSsL+L6bZxZNz7EbTNVuU8VcOYs7Oenc9TbrnqhpC6?=
 =?us-ascii?Q?2B/RX+0zP2BttBqKV4JNHuDz4czcrhVpek0WkmFjptqsQxtcr3gwXCvH3hg2?=
 =?us-ascii?Q?9XVJ1eDpVWiyZkz0G6Ip3nNPIEDjSKvRe5dIuzqKYKXGEHqqgPn4tsIYGUDo?=
 =?us-ascii?Q?eGwnPOYDz7HsVX9gP8PoeSGFrAlugmMAfFk3UoHQgHuORUNF3i4LruieQuTD?=
 =?us-ascii?Q?y7SPWiOaUXpewBDliBZyRYXJv/DOnFo/YkMAt1dMt4FbBpUjoiitHlMfquKy?=
 =?us-ascii?Q?j40K+s3vp2WwEh47NoeXF4t/jjOTuDROftqsnSQMzhXYBDoqv5om1Z5nAadW?=
 =?us-ascii?Q?Wp3qrYW/OXw6kv39vCS3PBmofqyHz1iVdJ0++rw2Us80QhxGmoBa5MBn7yBY?=
 =?us-ascii?Q?NAdAPzYiORiBOTH5Oq9Vg/ORwO501ji3UOW6Jxtpj+3KIg55lTX3jnoE0850?=
 =?us-ascii?Q?Pe+Q95+6MDjYjbBWeVjNofrP+MBFawMviQygpFkfZi5MpUgBgbca+Vwapx+L?=
 =?us-ascii?Q?tw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 652d5942-d7d7-43e2-773c-08dd560aef16
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 02:11:51.9041 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D6n0/Ci51LSJjAmFAmrOAKmAias5X96NJSPmVBZJPx4x+zHpmyaV1dF2cFZcyX9qUQVYkJGShRnOy6AmlFd0Bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6914
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

On Wed, Feb 26, 2025 at 10:00:21AM +0800, Mingcong Bai via B4 Relay wrote:
> From: Mingcong Bai <jeffbai@aosc.io>
>=20
> It appears that the xe_res_cursor also assumes 4K alignment.
>=20
> Current code uses `PAGE_SIZE' as an assumed alignment reference but 4K
> kernel page sizes is by no means a guarantee. On 16K-paged kernels, this
> causes driver failures during boot up:
>=20
> [   23.242757] ------------[ cut here ]------------
> [   23.247363] WARNING: CPU: 0 PID: 2036 at drivers/gpu/drm/xe/xe_res_cur=
sor.h:182 emit_pte+0x394/0x3b0 [xe]
> [   23.256962] Modules linked in: nf_conntrack_netbios_ns(E) nf_conntrack=
_broadcast(E) nft_fib_inet(E) nft_fib_ipv4(E) nft_fib_ipv6(E) nft_fib(E) nf=
t_reject_inet(E) nf_reject_ipv4(E) nf_reject_ipv6(E) nft_reject(E) nft_ct(E=
) rfkill(E) nft_chain_nat(E) ip6table_nat(E) ip6table_mangle(E) ip6table_ra=
w(E) ip6table_security(E) iptable_nat(E) nf_nat(E) nf_conntrack(E) nf_defra=
g_ipv6(E) nf_defrag_ipv4(E) iptable_mangle(E) iptable_raw(E) iptable_securi=
ty(E) ip_set(E) nf_tables(E) ip6table_filter(E) ip6_tables(E) iptable_filte=
r(E) snd_hda_codec_conexant(E) snd_hda_codec_generic(E) snd_hda_codec_hdmi(=
E) snd_hda_intel(E) snd_intel_dspcfg(E) snd_hda_codec(E) nls_iso8859_1(E) q=
rtr(E) nls_cp437(E) snd_hda_core(E) loongson3_cpufreq(E) rtc_efi(E) snd_hwd=
ep(E) snd_pcm(E) spi_loongson_pci(E) snd_timer(E) snd(E) spi_loongson_core(=
E) soundcore(E) gpio_loongson_64bit(E) rtc_loongson(E) i2c_ls2x(E) mousedev=
(E) input_leds(E) sch_fq_codel(E) fuse(E) nfnetlink(E) dmi_sysfs(E) ip_tabl=
es(E) x_tables(E) xe(E) d
>  rm_gpuvm(E) drm_buddy(E) gpu_sched(E)
> [   23.257034]  drm_exec(E) drm_suballoc_helper(E) drm_display_helper(E) =
cec(E) rc_core(E) hid_generic(E) tpm_tis_spi(E) r8169(E) loongson(E) i2c_al=
go_bit(E) realtek(E) drm_ttm_helper(E) led_class(E) ttm(E) drm_client_lib(E=
) drm_kms_helper(E) sunrpc(E) i2c_dev(E)
> [   23.369697] CPU: 0 UID: 1000 PID: 2036 Comm: QSGRenderThread Tainted: =
G            E      6.14.0-rc4-aosc-main-g7cc07e6e50b0-dirty #8
> [   23.381640] Tainted: [E]=3DUNSIGNED_MODULE
> [   23.385534] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-=
EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.0575=
6-prestab
> [   23.399319] pc ffff80000251efc0 ra ffff80000251eddc tp 900000011fe3c00=
0 sp 900000011fe3f7e0
> [   23.407632] a0 0000000000000001 a1 0000000000000000 a2 000000000000000=
0 a3 0000000000000000
> [   23.415938] a4 0000000000000000 a5 0000000000000000 a6 000000000006000=
0 a7 900000010c947b00
> [   23.424240] t0 0000000000000000 t1 0000000000000000 t2 000000000000000=
0 t3 900000012e456230
> [   23.432543] t4 0000000000000035 t5 0000000000004000 t6 00000001fbc4040=
3 t7 0000000000004000
> [   23.440845] t8 9000000100e688a8 u0 5cc06cee8ef0edee s9 900000010002442=
0 s0 0000000000000047
> [   23.449147] s1 0000000000004000 s2 0000000000000001 s3 900000012adba00=
0 s4 ffffffffffffc000
> [   23.457450] s5 9000000108939428 s6 0000000000000000 s7 000000000000000=
0 s8 900000011fe3f8e0
> [   23.465851]    ra: ffff80000251eddc emit_pte+0x1b0/0x3b0 [xe]
> [   23.471761]   ERA: ffff80000251efc0 emit_pte+0x394/0x3b0 [xe]
> [   23.477557]  CRMD: 000000b0 (PLV0 -IE -DA +PG DACF=3DCC DACM=3DCC -WE)
> [   23.483732]  PRMD: 00000004 (PPLV0 +PIE -PWE)
> [   23.488068]  EUEN: 00000003 (+FPE +SXE -ASXE -BTE)
> [   23.492832]  ECFG: 00071c1d (LIE=3D0,2-4,10-12 VS=3D7)
> [   23.497594] ESTAT: 000c0000 [BRK] (IS=3D ECode=3D12 EsubCode=3D0)
> [   23.503133]  PRID: 0014d000 (Loongson-64bit, Loongson-3A6000-HV)
> [   23.509164] CPU: 0 UID: 1000 PID: 2036 Comm: QSGRenderThread Tainted: =
G            E      6.14.0-rc4-aosc-main-g7cc07e6e50b0-dirty #8
> [   23.509168] Tainted: [E]=3DUNSIGNED_MODULE
> [   23.509168] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-=
EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.0575=
6-prestab
> [   23.509170] Stack : ffffffffffffffff ffffffffffffffff 900000000023eb34=
 900000011fe3c000
> [   23.509176]         900000011fe3f440 0000000000000000 900000011fe3f448=
 9000000001c31c70
> [   23.509181]         0000000000000000 0000000000000000 0000000000000000=
 0000000000000000
> [   23.509185]         0000000000000000 5cc06cee8ef0edee 0000000000000000=
 0000000000000000
> [   23.509190]         0000000000000000 0000000000000000 0000000000000000=
 0000000000000000
> [   23.509193]         0000000000000000 0000000000000000 00000000066b4000=
 9000000100024420
> [   23.509197]         9000000001eb8000 0000000000000000 9000000001c31c70=
 0000000000000004
> [   23.509202]         0000000000000004 0000000000000000 0000000000000000=
 0000000000000000
> [   23.509206]         900000011fe3f8e0 9000000001c31c70 9000000000244174=
 00007fffac097534
> [   23.509211]         00000000000000b0 0000000000000004 0000000000000003=
 0000000000071c1d
> [   23.509216]         ...
> [   23.509218] Call Trace:
> [   23.509220] [<9000000000244174>] show_stack+0x3c/0x16c
> [   23.509226] [<900000000023eb30>] dump_stack_lvl+0x84/0xe0
> [   23.509230] [<9000000000288208>] __warn+0x8c/0x174
> [   23.509234] [<90000000017c1918>] report_bug+0x1c0/0x22c
> [   23.509238] [<90000000017f66e8>] do_bp+0x280/0x344
> [   23.509243] [<90000000002428a0>] handle_bp+0x120/0x1c0
> [   23.509247] [<ffff80000251efc0>] emit_pte+0x394/0x3b0 [xe]
> [   23.509295] [<ffff800002520d38>] xe_migrate_clear+0x2d8/0xa54 [xe]
> [   23.509341] [<ffff8000024e6c38>] xe_bo_move+0x324/0x930 [xe]
> [   23.509387] [<ffff800002209468>] ttm_bo_handle_move_mem+0xd0/0x194 [tt=
m]
> [   23.509392] [<ffff800002209ebc>] ttm_bo_validate+0xd4/0x1cc [ttm]
> [   23.509396] [<ffff80000220a138>] ttm_bo_init_reserved+0x184/0x1dc [ttm=
]
> [   23.509399] [<ffff8000024e7840>] ___xe_bo_create_locked+0x1e8/0x3d4 [x=
e]
> [   23.509445] [<ffff8000024e7cf8>] __xe_bo_create_locked+0x2cc/0x390 [xe=
]
> [   23.509489] [<ffff8000024e7e98>] xe_bo_create_user+0x34/0xe4 [xe]
> [   23.509533] [<ffff8000024e875c>] xe_gem_create_ioctl+0x154/0x4d8 [xe]
> [   23.509578] [<9000000001062784>] drm_ioctl_kernel+0xe0/0x14c
> [   23.509582] [<9000000001062c10>] drm_ioctl+0x420/0x5f4
> [   23.509585] [<ffff8000024ea778>] xe_drm_ioctl+0x64/0xac [xe]
> [   23.509630] [<9000000000653504>] sys_ioctl+0x2b8/0xf98
> [   23.509634] [<90000000017f684c>] do_syscall+0xa0/0x140
> [   23.509637] [<9000000000241e38>] handle_syscall+0xb8/0x158
> [   23.509640]
> [   23.509644] ---[ end trace 0000000000000000 ]---
>=20
> Revise calls to `xe_res_dma()' and `xe_res_cursor()' to use
> `XE_PTE_MASK' (12) and `SZ_4K' to fix this potentially confused use of
> `PAGE_SIZE' in relevant code.
>=20
> Cc: stable@vger.kernel.org
> Fixes: e89b384cde62 ("drm/xe/migrate: Update emit_pte to cope with a size=
 level than 4k")
> Tested-by: Mingcong Bai <jeffbai@aosc.io>
> Tested-by: Haien Liang <27873200@qq.com>
> Tested-by: Shirong Liu <lsr1024@qq.com>
> Tested-by: Haofeng Wu <s2600cw2@126.com>
> Link: https://github.com/FanFansfan/loongson-linux/commit/22c55ab3931c324=
10a077b3ddb6dca3f28223360
> Co-developed-by: Shang Yatsen <429839446@qq.com>
> Signed-off-by: Shang Yatsen <429839446@qq.com>
> Signed-off-by: Mingcong Bai <jeffbai@aosc.io>
> ---
>  drivers/gpu/drm/xe/xe_migrate.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migr=
ate.c
> index 278bc96cf593d8a0b01003df26297c5a92a71c78..dd5d95a45b976010e718e074d=
d988c84253fb9fb 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -593,7 +593,7 @@ static void emit_pte(struct xe_migrate *m,
>  			u64 addr, flags =3D 0;
>  			bool devmem =3D false;
> =20
> -			addr =3D xe_res_dma(cur) & PAGE_MASK;
> +			addr =3D xe_res_dma(cur) & ~XE_PTE_MASK;
>  			if (is_vram) {
>  				if (vm->flags & XE_VM_FLAG_64K) {
>  					u64 va =3D cur_ofs * XE_PAGE_SIZE / 8;
> @@ -614,7 +614,7 @@ static void emit_pte(struct xe_migrate *m,
>  			bb->cs[bb->len++] =3D lower_32_bits(addr);
>  			bb->cs[bb->len++] =3D upper_32_bits(addr);
> =20
> -			xe_res_next(cur, min_t(u32, size, PAGE_SIZE));
> +			xe_res_next(cur, min_t(u32, size, SZ_4K));

Nit: s/SZ_4K/XE_PAGE_SIZE

Otherwise LGTM.

Also, I believe someone at Intel will need to submit this series for CI,
as I don't think you are on the approved list to trigger our CI (new WIP
polciy). I'll take care of that and see if we can get you added to the
list.

Matt

>  			cur_ofs +=3D 8;
>  		}
>  	}
>=20
> --=20
> 2.48.1
>=20
>=20
