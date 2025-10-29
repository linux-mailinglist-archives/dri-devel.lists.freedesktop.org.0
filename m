Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEFE6C17DBF
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 02:22:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAE3B10E6D2;
	Wed, 29 Oct 2025 01:22:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QSilqwcO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61E5910E6CE;
 Wed, 29 Oct 2025 01:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761700950; x=1793236950;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=nfvldGByhmdUYN/TYD9pYFUfc0PJuemCK7kTQWFbqkM=;
 b=QSilqwcOsMC0oAvUSM32+AZhN1r+F80jSeTezIYt7EN+03XgpXPAMtqZ
 RMGC/iH9nErD2uauD5gUoiR8bGWZNzCimzIMKIdh/Cumyx4RxSfRHr8wD
 OecrCWtzEnQazM2Vbc01x3yvo5vFLDD9u4Xzj251wvhD5V+9M0MD72JDN
 iKYVhRXREQ/AIwFFCgfttUKtfJUEgy+EamHIt1w00hKvZL5VTlMN+1GWO
 nUqcI1vfTHnIS3kKNa5dBPAIiSfJ1Rzz8piaSbwZTrPHwp9g+4pnH9lkl
 CjMWkz77pnKd/CwLchEwg2qfeouP25XEYGWdvuc2d1TlYoVLbpu6vkctB g==;
X-CSE-ConnectionGUID: XuoTGrRHRVGN8l8AIk/Ojg==
X-CSE-MsgGUID: AyVFYmuVRYy3iMS2HtAQZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74932012"
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; d="scan'208";a="74932012"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 18:21:34 -0700
X-CSE-ConnectionGUID: yHkr9ZbwQVuU3GZk01zb1Q==
X-CSE-MsgGUID: DxSpHuOTSZOnUR86VjQcbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; d="scan'208";a="190647895"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 18:21:26 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 18:21:25 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 28 Oct 2025 18:21:25 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.46) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 18:21:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t95DWBhID3Ou/SCJ8ZbOOcT6oCwLGZZ+l1AGR6Ql4xRsC17LcZ9/HxNMH3gfyZ3RIJjy8n79bIDZn7S9VPXZHk8Y7sGZW2B07h7rVq+Rv65YBCnVqSXaAO/OnJYnJKj78/bPADdiUuqMkUOZg7k16UE32LcIGLn42K/bDpn5P6u0Rb72Vzdo9+y3JaDV8Ecq1r4jvP+5e27I/77qivAUbiSymPkz3k+lKj+xg73Tj2m4SK8RS6DyXU5hAM+TrTnveDC7ypuKE0PQJCej1e5yGxpDpFJr+5FHO+2ZyGlIDl3xF1WLHwrmQLZ6D8Ox/65oaqpn6LDzIwBve4ruHhO5sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3JO8RpBCfSuupzXGBpMA9PE4XvL60W27MRHJPT0VpTI=;
 b=ME7pPJsTtcznJ62OFRX8FOGoxq/vT2inwTjUbgih5eWXhc4ECrYCazKs3jd+xHiI095i12iYs9Ag+bbCq9T8QaxiPXce7h4qTLBBzoWUgEMibnKMF+sayOee+Iw0bwHrfBbwBAX2XE9dNOBC28ZROXo1220v4u20e1UOBp4tS7eWP/PxUwcxL4MrHY2NIpkeeCrBVVemqpNz9EBPrtWl1pIuTIpRz1/jYuxD5KVWxRtUgp+Ro2PV3M3fTA9TOa72/DIL8W8u1ceSd7N2wziU8G/+XzyXYdpDChBRqt4zXPFR7u9SPa/Bw+JA4loG5V1EoUfPmjRucT82tanyRih9oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS7PR11MB7808.namprd11.prod.outlook.com (2603:10b6:8:ee::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.13; Wed, 29 Oct 2025 01:21:23 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9253.017; Wed, 29 Oct 2025
 01:21:23 +0000
Date: Tue, 28 Oct 2025 18:21:20 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <himal.prasad.ghimiray@intel.com>, <apopple@nvidia.com>, <airlied@gmail.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, Christian
 =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, <dakr@kernel.org>,
 "Mrozek, Michal" <michal.mrozek@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH 07/15] drm/pagemap_util: Add a utility to assign an owner
 to a set of interconnected gpus
Message-ID: <aQFsEO84w6E1NXG3@lstrano-desk.jf.intel.com>
References: <20251025120412.12262-1-thomas.hellstrom@linux.intel.com>
 <20251025120412.12262-8-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251025120412.12262-8-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ2PR07CA0005.namprd07.prod.outlook.com
 (2603:10b6:a03:505::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS7PR11MB7808:EE_
X-MS-Office365-Filtering-Correlation-Id: 217ff3f7-2dc4-42e7-fe87-08de16897916
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|366016|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?ayy6/KUFDJS35O4/nagRO7A6My7+msVKMOSuHI6C3+p5N62+TUj7XBEZ58?=
 =?iso-8859-1?Q?CALZXtGd3n9R8mMq5CRPXYJgq7Vhb27r2u6gnJmBp+6A7Z3Uu/PKOZiCcq?=
 =?iso-8859-1?Q?7x4fQnoxlF5d6qxWZLgNYNFQqbeQwesK/FHv3xXG/B44K2mRqCOs9syYbk?=
 =?iso-8859-1?Q?FpLXspc+9RKbo62zS2i4t6Nj8DjAqI9BeCBjoUrkUz1B9pKhOZ1pyGjSiU?=
 =?iso-8859-1?Q?7ZOxWFPNuGawwrWf4m0nmjZ0/KCohvNC7hxfl3bTWHmgpbbpL9NBvUMnY1?=
 =?iso-8859-1?Q?xy3BHz9Tnxrw++sW/XbhR5SC5fXpE5oY2wFkzv8D+oWsN8F91VFcpAheDL?=
 =?iso-8859-1?Q?pT21bc+pzfGgp6RdA9cUNtefAlM+kV0IDd7yQRk+xOGMqZkplE1x6wd1t+?=
 =?iso-8859-1?Q?/kO6AI0XTWCtEpeW0bN41NidJb32ufnp1utblGwCqkfI/Bl5rfIDkApu3Z?=
 =?iso-8859-1?Q?gnAbyASGQXPoUCxD7T0rdc8hXHoj+TJHiRb12HqukCFUEAE1CBMu6iG5dk?=
 =?iso-8859-1?Q?GDMVsAqvdJuTnOkMa9e6rnsrgeHDf0BS8HzLO6MB3elRbk7hBIkFsvB/VX?=
 =?iso-8859-1?Q?0rc+EqAQuRb4G3o7HJccxtir4aIbmlAS9fixBM6UaNH5+riVlKsQgW9X+P?=
 =?iso-8859-1?Q?1db4Ql5QZC9ZvOniwg1HKSd6nbA5YuKNfLWhFgVtghxhrM0cnxAT6tgkkK?=
 =?iso-8859-1?Q?cQjp7B56c1l+G3dN6RCDcrgl26kVibmRpaQBwS6ZhksaIhGPlatVzFq1O2?=
 =?iso-8859-1?Q?tolFBRZcH5CeF0gEBUsAvQDV/SjyoJz0gYGnjxiMUF7fVloDPYe9CUBlAH?=
 =?iso-8859-1?Q?9XJSmyI7yWgfNXOG/n5hHagGbTri58oZjxcZ1XXNaFqDyFXhrNE4t1d5zk?=
 =?iso-8859-1?Q?GGrAUAwMCe2diHT1mLL6bdY7/2nMK6kyl+dJHu36sk36mE0Tec757N0/T7?=
 =?iso-8859-1?Q?kb0vxJAzXJ2mVn0l9odp5Bi3gEP5UL1SF4B6/Mnqm2gsNFD5biLwiNu35g?=
 =?iso-8859-1?Q?VWFd9isFVVl3j+6YuoxAPF35RQLjrzz6jtmEz/20N1G8sBXCmeRcfZvBty?=
 =?iso-8859-1?Q?nBLahBmbgeEHAdFT/m8y5twqCRe0eqRHY+8PFyShKxVYphPsuLK53cpLYC?=
 =?iso-8859-1?Q?BWXEJnFUmNdkBtsOAOX0vsJV7B025l0RnSXw3uMLv/kmJHb/U7ZYNTCOam?=
 =?iso-8859-1?Q?ntxQbe/4J3UikpgQV1ltjv9Vif7FHKSC4NruKXceF6wWi0FSfCnulzM8Jj?=
 =?iso-8859-1?Q?i7cseW3/IlpA0iSGgZAgDMFgbvr6yIL4B//iGpl/uURVhWcT5Im9KthZoi?=
 =?iso-8859-1?Q?vCtODjbTZBnT9lzm/NiF44BklPH44dj7RJ6GoHUjFbFM9r4A9YjEqcfkSm?=
 =?iso-8859-1?Q?PFGdI6zS5UkYTTJAmLmgR4DfGcg7RSlLim2cC/U0or9HzwgikmEH7uLkgg?=
 =?iso-8859-1?Q?7i0pP1ILkivpC9L+iBXEVfoOe0nPfLSNtXjt5FgKSR5Apye0dEzuKOI0TQ?=
 =?iso-8859-1?Q?N1j81Q67N4XY8MKj3mYTBP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(366016)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?v6k8/XouduYGtf5UNPKh6yaI0Jgi9l3dw7LT+THcOEcJOCw8njDs4Xvl/A?=
 =?iso-8859-1?Q?DxXnQD9wbogeKuBckrjPO5/nkHeKV8Lro9BQj66YbViBw+u91sQT+zm0Gz?=
 =?iso-8859-1?Q?ve5Rcr7E4gYlD1OkzsWfScnOx4ZjlvAhr+0rrtvCqN4RlJL7GHkxgiv3n6?=
 =?iso-8859-1?Q?8BTZQ4Rx0xY3FqWteQ/cblI/PL5vdkI5/tM1mdL3aVRvZQSex8RTku2s/2?=
 =?iso-8859-1?Q?5M9Rnb+RXyqRgQnN4xGxoI+m+smt5If8cB4QP2RCkTvFirZ2500CBL3nD2?=
 =?iso-8859-1?Q?ww3ucgGHl6gWN7q4ihPHaULBBiFBWVFsF8uNoWIvyQShd4/lJ9Qpv6YsOh?=
 =?iso-8859-1?Q?3bjCUY1E6gc0I4IR1UI7w23o/csQJQwY/WgYNbhdx11nnaO6pu3pwkjDoQ?=
 =?iso-8859-1?Q?AhEbu8hXTW6lG/evlaVQQkBvqrSHul0Cq7PEEKK8kJ8Eb2Y62QR4FPc80S?=
 =?iso-8859-1?Q?MJ1tTJPhWTtuwJf5aTUNz7xWOvZCUt4zNat0PKlrxQshgUSzk/GnHl4XLH?=
 =?iso-8859-1?Q?IDgrxpral4UeyBz9VELh/cfWVrcW9cij3JiD8z4F8c4TvybKnV7Zdpdj8W?=
 =?iso-8859-1?Q?l67TeeBwwRsojyXd43Zvlt8iIITMIQIklaR4r108xs/28ER8lekVaD7+UN?=
 =?iso-8859-1?Q?/wHYAejcTxnns7HOtGejX9xQCNd7x8oEQLUBEVLcBzMOKVWSWxuAcDZWLL?=
 =?iso-8859-1?Q?SdnYBwRN/eRBuQXehMoBYcMGrDhWtfmOWfAEV4cRrWRXkkUDyNo3fWFe58?=
 =?iso-8859-1?Q?W9ba/r1IOTsYNqPvdEt8995X+NVz6rHnVnhc2t91baHJqY6Vhuoa3NtZyX?=
 =?iso-8859-1?Q?8fECVgHKRABlDq39s3KTXx3rGXQNSztzhjt8RJuPcLITxRs4ig49sXSWqU?=
 =?iso-8859-1?Q?LWBNzk6VCuYvlNvTPRLpd93mkBVl2qPbhPRMk2ZaUmLyotIjrG2UVONgts?=
 =?iso-8859-1?Q?VAurr8uOKPZlQcTt3Lmr7AoQHZOCnhNoRniIOfE6W5ylGKw64M+/G8cm1+?=
 =?iso-8859-1?Q?uz6HwFondp1wfQB7lADJYDS+wyMnohVyRwwnMaUNfvXs5udjwdT67iaoMm?=
 =?iso-8859-1?Q?DS+rp95ovC27AAvsBS7rEM/93CEKwhl4YL8zQYRpeN7Lj1DZyy0o2A79XW?=
 =?iso-8859-1?Q?2y8/drCS0NGntDlpiKqD23m5YmsKLXdZXvy0qIUG73zbo19dIaTL6mXhJ/?=
 =?iso-8859-1?Q?1vJqniXQU5/KMx01xyqt8vESX+blJgAqjxGuiJzuEeBuxk1DpVc+dADtRS?=
 =?iso-8859-1?Q?K9b6DV5SKlfUqI2WonHrFhHkfUXOW6RykaRVJX0now4PzZHMU2IVHIb/Eh?=
 =?iso-8859-1?Q?cwQZOUwRtsRK6L1ig+PBBZIHfbn5h+nnF/df2MIJPeRxjioSmlCVGOu9TL?=
 =?iso-8859-1?Q?zJTZKvdY2j07/rTNoZfM5c+v1v6Jrmbfj9iMJHb+CV38PX+bjZ9hqPMSHx?=
 =?iso-8859-1?Q?moex7UZr5RkYIi7+ZtnYYW1QNOjjMbdkkCra6ppskPYIBtT5ucYtbvtE1f?=
 =?iso-8859-1?Q?2RfvqXtuYA3VuttIXfSNjmBVxu2logAd/bd8Rs9i7b0JWAI71gWeCETmGc?=
 =?iso-8859-1?Q?T8jVv6J86daecnVTnBjbrWDv4K3xqmR1Yp+xBFhU0pNvfHnb0+8oH1rI0f?=
 =?iso-8859-1?Q?VJVqADAzyFgFro6rbyKOiLAfyA8KGrG1g5shmPPWd6zpde31PPLXTPdg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 217ff3f7-2dc4-42e7-fe87-08de16897916
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 01:21:23.3998 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZtHE0YcVdBjcP5g/1rVU53MKc3nR2tCyV71MB6rFBV+kxsSV6qsZu2Pyax0TruWm7t29jKtaF8hTOzU5sICayw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7808
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

On Sat, Oct 25, 2025 at 02:04:04PM +0200, Thomas Hellström wrote:
> The hmm_range_fault() and the migration helpers currently need a common
> "owner" to identify pagemaps and clients with fast interconnect.
> Add a drm_pagemap utility to setup such owners by registering
> drm_pagemaps, in a registry, and for each new drm_pagemap,
> query which existing drm_pagemaps have fast interconnects with the new
> drm_pagemap.
> 
> The "owner" scheme is limited in that it is static at drm_pagemap creation.
> Ideally one would want the owner to be adjusted at run-time, but that
> requires changes to hmm. If the proposed scheme becomes too limited,
> we need to revisit.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/drm_pagemap_util.c | 118 +++++++++++++++++++++++++++++
>  include/drm/drm_pagemap_util.h     |  53 +++++++++++++
>  2 files changed, 171 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_pagemap_util.c b/drivers/gpu/drm/drm_pagemap_util.c
> index e1a1d6bf25f4..dd573b620157 100644
> --- a/drivers/gpu/drm/drm_pagemap_util.c
> +++ b/drivers/gpu/drm/drm_pagemap_util.c
> @@ -3,6 +3,8 @@
>   * Copyright © 2025 Intel Corporation
>   */
>  
> +#include <linux/slab.h>
> +
>  #include <drm/drm_drv.h>
>  #include <drm/drm_managed.h>
>  #include <drm/drm_pagemap.h>
> @@ -424,3 +426,119 @@ struct drm_pagemap_shrinker *drm_pagemap_shrinker_create_devm(struct drm_device
>  	return shrinker;
>  }
>  EXPORT_SYMBOL(drm_pagemap_shrinker_create_devm);
> +
> +/**
> + * struct drm_pagemap_owner - Device interconnect group
> + * @kref: Reference count.
> + *
> + * A struct drm_pagemap_owner identifies a device interconnect group.
> + */
> +struct drm_pagemap_owner {
> +	struct kref kref;
> +};
> +
> +static void drm_pagemap_owner_release(struct kref *kref)
> +{
> +	kfree(container_of(kref, struct drm_pagemap_owner, kref));
> +}
> +
> +/**
> + * drm_pagemap_release_owner() - Stop participating in an interconnect group
> + * @peer: Pointer to the struct drm_pagemap_peer used when joining the group
> + *
> + * Stop participating in an interconnect group. This function is typically
> + * called when a pagemap is removed to indicate that it doesn't need to
> + * be taken into account.
> + */
> +void drm_pagemap_release_owner(struct drm_pagemap_peer *peer)
> +{
> +	struct drm_pagemap_owner_list *owner_list = peer->list;
> +
> +	if (!owner_list)
> +		return;
> +
> +	mutex_lock(&owner_list->lock);
> +	list_del(&peer->link);
> +	kref_put(&peer->owner->kref, drm_pagemap_owner_release);
> +	peer->owner = NULL;
> +	mutex_unlock(&owner_list->lock);
> +}
> +EXPORT_SYMBOL(drm_pagemap_release_owner);
> +
> +/**
> + * typedef interconnect_fn - Callback function to identify fast interconnects
> + * @peer1: First endpoint.
> + * @peer2: Second endpont.
> + *
> + * The function returns %true iff @peer1 and @peer2 have a fast interconnect.
> + * Note that this is symmetrical. The function has no notion of client and provider,
> + * which may not be sufficient in some cases. However, since the callback is intended
> + * to guide in providing common pagemap owners, the notion of a common owner to
> + * indicate fast interconnects would then have to change as well.
> + *
> + * Return: %true iff @peer1 and @peer2 have a fast interconnect. Otherwise @false.
> + */
> +typedef bool (*interconnect_fn)(struct drm_pagemap_peer *peer1, struct drm_pagemap_peer *peer2);
> +
> +/**
> + * drm_pagemap_acquire_owner() - Join an interconnect group
> + * @peer: A struct drm_pagemap_peer keeping track of the device interconnect
> + * @owner_list: Pointer to the owner_list, keeping track of all interconnects
> + * @has_interconnect: Callback function to determine whether two peers have a
> + * fast local interconnect.
> + *
> + * Repeatedly calls @has_interconnect for @peer and other peers on @owner_list to
> + * determine a set of peers for which @peer has a fast interconnect. That set will
> + * have common &struct drm_pagemap_owner, and upon successful return, @peer::owner
> + * will point to that struct, holding a reference, and @peer will be registered in
> + * @owner_list. If @peer doesn't have any fast interconnects to other @peers, a
> + * new unique &struct drm_pagemap_owner will be allocated for it, and that
> + * may be shared with other peers that, at a later point, are determined to have
> + * a fast interconnect with @peer.
> + *
> + * When @peer no longer participates in an interconnect group,
> + * drm_pagemap_release_owner() should be called to drop the reference on the
> + * struct drm_pagemap_owner.
> + *
> + * Return: %0 on success, negative error code on failure.
> + */
> +int drm_pagemap_acquire_owner(struct drm_pagemap_peer *peer,
> +			      struct drm_pagemap_owner_list *owner_list,
> +			      interconnect_fn has_interconnect)
> +{
> +	struct drm_pagemap_peer *cur_peer;
> +	struct drm_pagemap_owner *owner = NULL;
> +	bool interconnect = false;
> +
> +	mutex_lock(&owner_list->lock);
> +	might_alloc(GFP_KERNEL);
> +	list_for_each_entry(cur_peer, &owner_list->peers, link) {
> +		if (cur_peer->owner != owner) {
> +			if (owner && interconnect)
> +				break;
> +			owner = cur_peer->owner;
> +			interconnect = true;
> +		}
> +		if (interconnect && !has_interconnect(peer, cur_peer))
> +			interconnect = false;
> +	}
> +
> +	if (!interconnect) {
> +		owner = kmalloc(sizeof(*owner), GFP_KERNEL);
> +		if (!owner) {
> +			mutex_unlock(&owner_list->lock);
> +			return -ENOMEM;
> +		}
> +		kref_init(&owner->kref);
> +		list_add_tail(&peer->link, &owner_list->peers);
> +	} else {
> +		kref_get(&owner->kref);
> +		list_add_tail(&peer->link, &cur_peer->link);
> +	}
> +	peer->owner = owner;
> +	peer->list = owner_list;
> +	mutex_unlock(&owner_list->lock);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_pagemap_acquire_owner);
> diff --git a/include/drm/drm_pagemap_util.h b/include/drm/drm_pagemap_util.h
> index 292244d429ee..1889630b8950 100644
> --- a/include/drm/drm_pagemap_util.h
> +++ b/include/drm/drm_pagemap_util.h
> @@ -1,12 +1,58 @@
>  /* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +

Nit: The above copyright should be moved to an earlier patch.



>  #ifndef _DRM_PAGEMAP_UTIL_H_
>  #define _DRM_PAGEMAP_UTIL_H_
>  
> +#include <linux/list.h>
> +#include <linux/mutex.h>
> +
>  struct drm_device;
>  struct drm_pagemap;
>  struct drm_pagemap_cache;
> +struct drm_pagemap_owner;
>  struct drm_pagemap_shrinker;
>  
> +/**
> + * struct drm_pagemap_peer - Structure representing a fast interconnect peer
> + * @list: Pointer to a &struct drm_pagemap_owner_list used to keep track of peers
> + * @link: List link for @list's list of peers.
> + * @owner: Pointer to a &struct drm_pagemap_owner, common for a set of peers having
> + * fast interconnects.
> + * @private: Pointer private to the struct embedding this struct.
> + */
> +struct drm_pagemap_peer {
> +	struct drm_pagemap_owner_list *list;
> +	struct list_head link;
> +	struct drm_pagemap_owner *owner;
> +	void *private;
> +};
> +
> +/**
> + * struct drm_pagemap_owner_list - Keeping track of peers and owners
> + * @peer: List of peers.
> + *
> + * The owner list defines the scope where we identify peers having fast interconnects
> + * and a common owner. Typically a driver has a single global owner list to
> + * keep track of common owners for the driver's pagemaps.
> + */
> +struct drm_pagemap_owner_list {
> +	/** @lock: Mutex protecting the @peers list. */
> +	struct mutex lock;
> +	/** @peers: List of peers. */
> +	struct list_head peers;
> +};
> +
> +/*
> + * Convenience macro to define an owner list.

I'd perhaps mention this typially a static module instantiation.

Patch itself lgtm, and makes sense. With that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> + */
> +#define DRM_PAGEMAP_OWNER_LIST_DEFINE(_name)	\
> +	struct drm_pagemap_owner_list _name = {	\
> +	.lock = __MUTEX_INITIALIZER(_name.lock), \
> +	.peers = LIST_HEAD_INIT(_name.peers) }
> +
>  void drm_pagemap_shrinker_add(struct drm_pagemap *dpagemap);
>  
>  int drm_pagemap_cache_lock_lookup(struct drm_pagemap_cache *cache);
> @@ -22,4 +68,11 @@ struct drm_pagemap *drm_pagemap_get_from_cache(struct drm_pagemap_cache *cache);
>  void drm_pagemap_cache_set_pagemap(struct drm_pagemap_cache *cache, struct drm_pagemap *dpagemap);
>  
>  struct drm_pagemap *drm_pagemap_get_from_cache_if_active(struct drm_pagemap_cache *cache);
> +
> +void drm_pagemap_release_owner(struct drm_pagemap_peer *peer);
> +
> +int drm_pagemap_acquire_owner(struct drm_pagemap_peer *peer,
> +			      struct drm_pagemap_owner_list *owner_list,
> +			      bool (*has_interconnect)(struct drm_pagemap_peer *peer1,
> +						       struct drm_pagemap_peer *peer2));
>  #endif
> -- 
> 2.51.0
> 
