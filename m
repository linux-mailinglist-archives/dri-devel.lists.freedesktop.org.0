Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B34EBD0B1A4
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 17:04:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1645C10E903;
	Fri,  9 Jan 2026 16:04:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TVDwuhv7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD39310E8FA;
 Fri,  9 Jan 2026 16:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767974648; x=1799510648;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8ZjZSp9GAB9fVSWpRVhfr1qJ3Uq+wuHFPWtv0LbMD/8=;
 b=TVDwuhv7Z3QsLUw9NewaEq6NliR4ybGtdjsshRnBAytGpxB2c++9fYxk
 JEOHcS9ilaJHfM1HkpP2YRk81wiFg1Uti3/CUepShTOVYc2W5Q6A6I05S
 3XaSp335IDVFObXeXT0dFcgCY+j6evHzzuqxVA5j2vK30KPke4OXW7mSq
 YIKqF8+UXd/OcHb/830gQOKyEt9pC8j992KOTgSMhDkuxpjOvsudelBXD
 jN+KN4tVfslsfpg066I/KJcZfHwOcj/W5yH/9VsVFo23PBqe+xs0UV1Gu
 sHrRRuMRg1d7BYybxik1wB+K6n9MnMPkxDPkvh/LYWgHRyS0JseUT64z3 A==;
X-CSE-ConnectionGUID: 7ugkwY+IQiGUtkysL7Holg==
X-CSE-MsgGUID: nhX4AAvcQLeWwXYsuqrmHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="94830098"
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; d="scan'208";a="94830098"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 08:04:07 -0800
X-CSE-ConnectionGUID: rPGJJlxuRAKxSmo9xqZ41w==
X-CSE-MsgGUID: 7PUeoUAKR/SuwUhSd/0DtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; d="scan'208";a="203514998"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 08:04:07 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 08:04:06 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 9 Jan 2026 08:04:06 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.37) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 08:04:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t8y+GnmZpcqvFfGLqjDpZT5OFiXUcNbaiy4uhJsHstFEf9W5wvGUM5XLXF7xt6kGfbS3260fgxKh0s6G56Y/0tf6aDcZhMj8Z98CG51RBShOm5eoE/VfMDH4SwW/4fLxUJ9LE4CVeWHHI/3tzn9QPoshLl+myfwkoC3pkHFgAeIfLyUdrRrwXypL5pZBqDTF7F6dxgK8dFqn6wciIeIYrF0dSr6tuefAky10oZ5hKEZlYgBpXaQSDeJdd9IHiduU8Ah9t+R5NpxWWOUOUwjcqp41wA7Axg7I0epomTkJO49PBTYvnIn8MmpTE0mCww6Mq1ElWERjRpZKKl6fWW68Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PVXCye7+iZEZkYb+FXDHeEVyeBCUg0VYrUeHilrG1mM=;
 b=bwmvgWIGNOq3mCTg72RWPUPxvWPGuOD6vdmy3eKNiZgWhJkur7o2Slo89ydMB6FcWYztS3zRpqljWVOFd1U786N2bt+UOLgYBmZIiiwAR4tHjbtsJKtKzTQTrgbHGuAR+RihUQTP7QwPbbGpDtumv1zy3n82Pcoa8fuxsvq7JQ/09MDti7iwEsc3xQECPDobuF0jN6ek59LY4XzpWXYsEaEJSZqt5ZPEtYHhWuiJVlUvjh0VOhQVxkOF5OZTMSQeevbBQkWQonIkxGgJoHAmS52zLK2WKnciKEKVO7Lya13QzkmUXcque0cLqHFY0B2v3JndK5t0W3F9J0nMrUSRBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SJ0PR11MB4798.namprd11.prod.outlook.com (2603:10b6:a03:2d5::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.5; Fri, 9 Jan
 2026 16:03:59 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9499.003; Fri, 9 Jan 2026
 16:03:59 +0000
Date: Fri, 9 Jan 2026 11:03:55 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>, Thomas
 =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Harish Chegondi
 <harish.chegondi@intel.com>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Thomas
 Gleixner" <tglx@linutronix.de>
Subject: Re: [PATCH] drm/xe/eustall: use bitmap_weighted_or() in
 xe_eu_stall_stream_init()
Message-ID: <aWEm69i8r6VJtrsx@intel.com>
References: <20251216000259.331293-1-yury.norov@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251216000259.331293-1-yury.norov@gmail.com>
X-ClientProxiedBy: SJ0PR05CA0159.namprd05.prod.outlook.com
 (2603:10b6:a03:339::14) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SJ0PR11MB4798:EE_
X-MS-Office365-Filtering-Correlation-Id: cce9c9d5-b75c-4047-76ce-08de4f98b2e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xqx7NQI2oo+Mju60qNGZUtD9pJAg9tojVmPfMdikRzxVsu4SqPZFU0n8F43B?=
 =?us-ascii?Q?qTi746tx0PXtf3muo13TFdFoHxb2LkLd7wCwghQURTcHRbpPMSY2Vp4VFDpz?=
 =?us-ascii?Q?/TcVJOd/XQ5QMYMbzn+upJKwQJV42H4NDKYqlRZkNmrkBwhREWfundWyKAY8?=
 =?us-ascii?Q?w9FHVGx5S9LpVQ2XL6GNHVG6KMzBWXLwIKQzdIwDQCGk5rzgq+tIbDq0Necy?=
 =?us-ascii?Q?WMQ53oXg3QdgkMcQoRSuSCN1k8Wl0H0bl+THnrSMKik4KnwxsKdmYdldCQKx?=
 =?us-ascii?Q?f2ZaQwpwxwNl3bDKKJne7coxXalLYnoKF+mJuqjtXpXXtWt8ZOZciy6cSE9o?=
 =?us-ascii?Q?p2jFgX+nS0KQ4VziiRToLeJvFOhIwlHDww2UaJMPhkyWiLtRS43MD5lS9tuq?=
 =?us-ascii?Q?rmkfyzAWESGsOz01k45o98sYsCcYjex/lPFImyIWvmBxh100LKUW8hnFAKo3?=
 =?us-ascii?Q?z2cEYaJw/QZg16rvPIbs2ALKDRuXfABkyBeuMTW0rSQzI/TTs2LaYdTWzErN?=
 =?us-ascii?Q?ZJxMo8lJ3z3MPXgqys2oENeBjI3c6niwqtiMX5JjkkjWzz7aTJ2cn2qDLE0E?=
 =?us-ascii?Q?avY7jICjJ+cM7L+f12kTLdVRHc7IeU/nealFjAYn7pkYNfJ8ajLGJ7dEU4FR?=
 =?us-ascii?Q?v+wNK19Skb0lBuqxh8APNaccTPU5uf9bS1fS5FyQHlbw/FhHO6TPlZNt0CHC?=
 =?us-ascii?Q?yMwgKR1KWwDEhnedF0wtdRUvl9L/GWdiWye+gcbQOh57kBL+xe1HUD0c6slx?=
 =?us-ascii?Q?sA8Gf4SJDtnOLuA3FDtUGypk8xR5Sv0Yw3o82hME+alN5oJ3P/2ypLvGbTFK?=
 =?us-ascii?Q?s/+ZCYcScRK1JiSIMxbs47C+0nBqWbYHbJNd0fQ3asJ92BBzmFSxLZAGakbX?=
 =?us-ascii?Q?X2xbByqmixSwT9Wlbs6ac3MxX0+7V0OKZxRSvZ3iZ8CoQiVqFITDUgvYGfVt?=
 =?us-ascii?Q?bKnUuc+GZiq6P+aNXsq7KB2dEbfqcSwfhD2cl+/W46nLB17A5u/TDKk3LaPq?=
 =?us-ascii?Q?ixvwgBEHE4b69fxrFZWYdBvVNqj0XwsMJUkwyhSgT4evsWmP6/iFIPJmMogd?=
 =?us-ascii?Q?DiP8i9v3rGQbYN3ccerNg8Oml5Mrzjtxyt/U7FJ3w7aW0pn1gaM4i9Z+CSdY?=
 =?us-ascii?Q?GGFu+0sCxy8MSHd7k2qWmJSq0JQuVJHSXKNkVtbETr7BsZSp+gC81mKXUMOK?=
 =?us-ascii?Q?g9lUWUuxuRZ3XDKzNXFBQVettSmTZm5YyKl69NYHoV3npbo3Cb8Ed0uDL9x8?=
 =?us-ascii?Q?JzZUFVWdidnt7gMxW/mV3S6LYlcLAQFiYuv6N9THXO0OaafsgPUQNLzOuvOC?=
 =?us-ascii?Q?TqQtBKbZfeyMYHQL7w4d+S7TlQpnt3GTPJuJyFkUFaklSMvL3zffAF9yF/YW?=
 =?us-ascii?Q?aVLKzqhdfm9b9cHy1Q21vISkk2otkervvl8tRN3P/XHSLX9/rcWgDfNTAp+d?=
 =?us-ascii?Q?oWshvTWx7jgZd/shlJo8TnM8T/9VCNFD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2H7651At34EGCcCkuFP4iGdcgQmhxoRYLiiMkh7u3XFx9H5if9jYCA0oPkxN?=
 =?us-ascii?Q?XmkCyMjAl5FeE+N6qF6rnBvyYix3PPZ1Fhyqw9LxrPD3sXC0w0n5grS+f/DP?=
 =?us-ascii?Q?Wqqmy8+OpJKgju3wgFFmT/DgvdUujKRNuV2r0yRnNOGN9LItr1HiRtw3ePQr?=
 =?us-ascii?Q?MkrGZed2tdOHGXnuO9QYYKgGhX/E8zVccHpi2xocwE7st0KWikBXiolMLXGP?=
 =?us-ascii?Q?uh3MU+RMbamBeV0uO1qn2WEtb2CIkVT3t2yuBfuE3CncS0j0kSIx1nAwXmr2?=
 =?us-ascii?Q?72CerCHoWI0el1MtlllG1shapde8arVoBhR2F3ZSIMPmXZOXRLFr3KmNu8cI?=
 =?us-ascii?Q?oMrXfGK2n20dJ3VKVqgc3wSGQtuNp52U7ttTl76rIAuOuU6IgYq3BoyEzVXm?=
 =?us-ascii?Q?7dkBLIh4KMj4RMbxPxOKgV39NSc/DquYg9ORFBLURUOBnzadqAbjCCs1390S?=
 =?us-ascii?Q?pTIthqgDlI42DJ4wVfa583GJnptSM8BCbKMIiLFI5ozRQur/XQAvQfRwC+Ul?=
 =?us-ascii?Q?UrKmDThMLPMKi42OaXvwwKlV2I3LKJMLv0WRfPjTY6+3kixW4SMDqJwsZkKD?=
 =?us-ascii?Q?Rkfav5PesWWEVGbIQB7fk3inRCIRKbeCRY/Ria9FgPSzUJKQ8DQUoswLkn1S?=
 =?us-ascii?Q?tYpk6a2Zjct4oDFFaJsaGLkZC2lNfSarFZlOX12RZl5OHNWkAIBR5HsZqdXy?=
 =?us-ascii?Q?In8th3rJyZ+zzdEwrMbOZkYXxypXModbYOnoIBoObQWsqTjrod5l9mAFPiLH?=
 =?us-ascii?Q?Jdyvi0TmghqFeu61bhtGvWx4/Sa3Vo5NCoQ1j6CdE8jXFQO84O5Qo5espeSz?=
 =?us-ascii?Q?gf/kGoSO2TcsOJOeFLXROZFUboeUvpzGBMWVSZcHAu9orwDIjHFmRWAt7roR?=
 =?us-ascii?Q?q/6aEOsQ+L35g3pVuJfib8vNU10Mo83P8dS656gNLYr8tpilGdAwqvvvLhAw?=
 =?us-ascii?Q?ARsTTzxa5DCwGttlgIjTAtyNp8R+mFjYWfqOD4GiUf+p9Ho7tctw+9U/s5yU?=
 =?us-ascii?Q?wYqqiaLwGcfcIehuZfZpKkm5GXWrxLdoXkC/39Md4h55IwfCvfijVbxpqQIm?=
 =?us-ascii?Q?/WxMB62684Uh87+iiKvkp7VPj6TKiJS74LZSQ9y3T3AJVTjOAKlUNnIaB+ci?=
 =?us-ascii?Q?OJeqSpdjjgN8nJviTVTp16M9LPPwM/WzdMjEUp3iCGwB149apERgCyUCtHUF?=
 =?us-ascii?Q?ibDg9bnGXYI5wdtDpmupefbe/3NHrvbYNNBpzdM8prl5GmgvTR25z6FA4RRP?=
 =?us-ascii?Q?hSgOHbfioZ/z+MYu8eGMf1DQiG/7uB/cUdkQDVUdhYgGFw+qr36uW1lKNliL?=
 =?us-ascii?Q?EodOpRekRDFD7FSxBbwzmuG6ih2Gy7U0Q9aIVg4TlgJKjyewwuVxFn3AOApV?=
 =?us-ascii?Q?nw5HWtIVzN+SwnP6NmimPjmwKFbjdZ6jNshyNZTg3Xt374Gx8yQcBtI+CHl7?=
 =?us-ascii?Q?ys6wJJgkFJDVIJWVJSCEJqYIQviIff4cfKE+f8akyp3VuZaB6O7sNt283Tdv?=
 =?us-ascii?Q?y5RprqyBsA3AbBZdWWUhN5PQG51OZb0hxdxdTZKV5BL0yz9wtZ+Tv6HCp41h?=
 =?us-ascii?Q?ndnGNV61YKSdCj4+zLv4rUmNIbXufyYeNV0IY5Gey/GAqmEChcuYFHm3w5ww?=
 =?us-ascii?Q?3/x55Unqb8pWJEXQIDbyBAGd/0L/5mHsncSu91obZ3mZLJtjODfftqGs+fao?=
 =?us-ascii?Q?DovIL8mkQj1apzyJ7s1m4a+dGh2N2eylzuTCFhBoi2YyHQb+srvdoc4dvF1h?=
 =?us-ascii?Q?+/uL6k/QZg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cce9c9d5-b75c-4047-76ce-08de4f98b2e1
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 16:03:59.1216 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1E3fBraRYlmMa07MqMqVelsXBaZ7LWNcOWShVTi6BdEcLBiL9jh/bWnXuDeHivpixPxb/c/BBxCHRVXRtT/FxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4798
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

On Mon, Dec 15, 2025 at 07:02:58PM -0500, Yury Norov (NVIDIA) wrote:
> Commit 437cb3ded2503 ("cpumask: Introduce cpumask_weighted_or()") added
> the new helper, which fits well here. Use it.
> 
> Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

(I'm just resending for CI and will merge after the confirmation)

Thanks for the patch and sorry for the delay.

> ---
>  drivers/gpu/drm/xe/xe_eu_stall.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
> index b896b7ff5900..8bd4307afbbd 100644
> --- a/drivers/gpu/drm/xe/xe_eu_stall.c
> +++ b/drivers/gpu/drm/xe/xe_eu_stall.c
> @@ -737,9 +737,9 @@ static int xe_eu_stall_stream_init(struct xe_eu_stall_data_stream *stream,
>  	u32 vaddr_offset;
>  	int ret;
>  
> -	bitmap_or(all_xecores, gt->fuse_topo.g_dss_mask, gt->fuse_topo.c_dss_mask,
> -		  XE_MAX_DSS_FUSE_BITS);
> -	num_xecores = bitmap_weight(all_xecores, XE_MAX_DSS_FUSE_BITS);
> +	num_xecores = bitmap_weighted_or(all_xecores, gt->fuse_topo.g_dss_mask,
> +						      gt->fuse_topo.c_dss_mask,
> +						      XE_MAX_DSS_FUSE_BITS);
>  	last_xecore = xe_gt_topology_mask_last_dss(all_xecores) + 1;
>  
>  	max_wait_num_reports = num_data_rows(per_xecore_buf_size * num_xecores);
> -- 
> 2.43.0
> 
