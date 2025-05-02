Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38CF8AA68A2
	for <lists+dri-devel@lfdr.de>; Fri,  2 May 2025 04:12:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C306310E059;
	Fri,  2 May 2025 02:12:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nttB51Cn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B57410E059
 for <dri-devel@lists.freedesktop.org>; Fri,  2 May 2025 02:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746151932; x=1777687932;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=IRPMBMHkp3oOLuxQoGUnp22xmtrAPYr5Z7p8hBw2qpk=;
 b=nttB51CnayaBlFEJtqMHmJ08Sm/ZwtFW0RRqb+b1B+zXJF3RW0vGmro9
 sJFzZx2cQaHDoJKwMYmJC0BObatdgkcNVskXeHP/SdEXaTgRgXWSG7iI/
 0eqdgk5Iv+QhasXYuXXDtpaFXyzMlRY0sjNrdWccLEXpfJ+XvI2Xb2yGc
 RpMIhUqtuvpJKhbdinn6tktZmy14WeEkCdBP6xGShi1VgsHCd4tf5Zfx5
 xfCSVKwUi+HWEtt5ycIWF0K9DkOAcxca4CuEVlM/zfq+obSSQNxC2RpXL
 DtsyqeOZ3SBq/1LNzGdgxZtnWeHNHqw05SGRDI1OoeqmEh/rs8k5ZZX8n w==;
X-CSE-ConnectionGUID: qITlMiTQR46d4xhylNN6Ag==
X-CSE-MsgGUID: /wtKgwwoSAiS8Z2wSXdcvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="47923803"
X-IronPort-AV: E=Sophos;i="6.15,255,1739865600"; d="scan'208";a="47923803"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2025 19:12:11 -0700
X-CSE-ConnectionGUID: AO1Yj6RLSUWnlf1sLOXiDg==
X-CSE-MsgGUID: IeL7DvE3QpOD5F9wWpSrcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,255,1739865600"; d="scan'208";a="157762271"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2025 19:11:53 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 1 May 2025 19:11:52 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 1 May 2025 19:11:52 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 1 May 2025 19:11:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PerJ6FbJLL3GmV0Z1IO+G73ghMgFLSNqbJXiKFjFh2jZxLF9aJEv8kRLLRn4/Ect8jMDHpiwzC5f1zMWpdC6hKvbZxf/XOrVohI6RWVU7+mJr1NmDS7lgTNkVtW76ggoSeL/1MdjOFzCRnNkQafSwo5IHpefJ54s49AcTi+NwrZFfFdIeK/1fH+1sA4ogvKE8wDCS8IvluHuudSTNnVyVIHVPF+sdDtzCBiEo/006tXoHSRfSd99k7eovRdq15Ytp7iiUu4NMBu85JihJlZf48CdRtEJc4cNq306W1hbvdArSwBVabFXeO/NUfcWzvbBnVKI6RGTUI/uQuR0Yv3xAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QOobMhlo6nX93XhMS+XAQZvatfyOPdO9fYgw64RCNh4=;
 b=DebNQ5LILyh2nfocIAVtyf87HemDsYxhrPe5OdKXnNsONtQY2y1dI+/jaMM/2xtsrzdAkbVBd0z9y1DmYl3L8JPhYQ2OyTUORSmkElGsKgYqbR9J9ljA/PXzgljT1ayWirVwiFE3S/ruqsdoEfG8yt7OW2d6FR3/X4Kr5w7Ik/U/Hkt9zykjmwhkt42e4KkTsGt9Dbw/FJpVmBjrIF4nn0fegflqHf0VrYjkPzR2tro4k46M8SLrWEcty6T46tP1kWV/ME7kJfWDJua5AFDftBNHbgG6Lf8qbLdspZk6HZgV6QoJ5UOmgO26JI0HQD6cMJpbWeX2WvAE5CFB7gziTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH3PPFDC3198517.namprd11.prod.outlook.com (2603:10b6:518:1::d55)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Fri, 2 May
 2025 02:11:50 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8699.012; Fri, 2 May 2025
 02:11:50 +0000
Date: Thu, 1 May 2025 19:13:12 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Kees Cook <kees@kernel.org>
CC: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Christian Koenig <christian.koenig@amd.com>, Somalapuram Amaranath
 <Amaranath.Somalapuram@amd.com>, Huang Rui <ray.huang@amd.com>, Matthew Auld
 <matthew.auld@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-hardening@vger.kernel.org>
Subject: Re: [PATCH v2] drm/ttm: Silence randstruct warning about casting
 struct file
Message-ID: <aBQqOCQZrHBBbPbL@lstrano-desk.jf.intel.com>
References: <20250502002437.it.851-kees@kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250502002437.it.851-kees@kernel.org>
X-ClientProxiedBy: BYAPR02CA0009.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH3PPFDC3198517:EE_
X-MS-Office365-Filtering-Correlation-Id: 33d44f87-5ba6-454c-0b8e-08dd891eb2c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?fgSHd32saPfwZH/xU9Y/R3t+FN4OIr8wAQF7g2V+vF+VTf4+KYO/qnFxo7?=
 =?iso-8859-1?Q?E0vjFKpbZGRmtcrMcJgRJai9UoZ4kbwOKpJKqEaV0w+3HdYoaXaE/6A9tj?=
 =?iso-8859-1?Q?lcrz6eyOq52wBbhIsh0ieY8GOqR77Hh3DNsEBcrX/IJpb31u6lj7XW9ixX?=
 =?iso-8859-1?Q?Z15RK4jwuGlAw/YCH2NCAdlhFe2SkomEIjpDlqxoXWJA0StuMplbJ+f2vM?=
 =?iso-8859-1?Q?++dnCQi/gK2naoUW/zl0CTTbHNGwDlQC++QMwJRpbF+qsl0j5YoHmtuk2i?=
 =?iso-8859-1?Q?nnXOji+iotqBoM95jbvT32Wluvp2PyaTteFLBv4VHYsnsV0nz1YIgISpXa?=
 =?iso-8859-1?Q?gDU9hl3gQJZ33hOH8wcW/RJVVwOfz1r8l+cFCq8zZjEK/JOPLCKO6+L+VN?=
 =?iso-8859-1?Q?c5QN0W/yJrXj5u+uSsEvg0P9jXPAwhOpLw3Uo+W05rDW/Vu2fHy8IZ8KM+?=
 =?iso-8859-1?Q?tWCCmCRBW6DexkfXZWThM2tEKccbj7RUYkXzuRHTPNf+Dit0eAeNoEwn3i?=
 =?iso-8859-1?Q?jGxVroGCvCtiP5GRMARRnLi+UY6UgAxyLlEos74+M8wR/viJeqFJVx9Fok?=
 =?iso-8859-1?Q?CcQLaJbWH9mkyt6EmS9Rpu2wT7hSI24mq3atUsrfkBNhzWxlNZD06jL1o4?=
 =?iso-8859-1?Q?8ojtC9aeruu2TXscf9dZxYbiuuRSLVkd/nlvCjom+QRdbkyfcmlIpYr1o4?=
 =?iso-8859-1?Q?qiBFVl66ezKwpRiNWLkfotsTVtbV3+7ke8YpGaoPXpMnRM2QjTQIgCRRBb?=
 =?iso-8859-1?Q?Mii1Q+Qro0lq7jBC03qomMwphOXRMc0NecnroxlxIuzPowpo7jNh9wg6/t?=
 =?iso-8859-1?Q?fKLtIbBTJW3oec9595lvJ8u0zmQ2D5lKiD5hYYr666FHi9Vq8d8YbUGdiL?=
 =?iso-8859-1?Q?wE9z8zgHt4Y5WznMRTY4tlcafFoaGFtuIxYJNMKJGyDAMsHn5Bplnul+ew?=
 =?iso-8859-1?Q?aQVXmn4BOjwFlQiy621eVZX1iVabpmBGAxHdugeBXnAT2hQI6Lh7MwpQnm?=
 =?iso-8859-1?Q?GgceCi/3+6+axxh6q9aLaH+6Cm/NReW01JAn7eVWOTzpecYrxevtUZ0J6N?=
 =?iso-8859-1?Q?13WuWhYHIjnjf+rp/fGvX/It9FyGOrcrONePu3f/ZBRZAyJILTP6rwa4jV?=
 =?iso-8859-1?Q?VYS24j07JegRREfw1i5UTPCrr0k6KY3mb/HXQGIR8kr0YHWWPeIC3dc38T?=
 =?iso-8859-1?Q?/Eo8Tb+jgMjC7P1XR7dVtfn1LauYetBO1W5/Dz1G1ySuydUFXEm7oU9Qz7?=
 =?iso-8859-1?Q?Lb6C4DDEMV7w4ObgMwUg1jDpd74G31wTRgDHg9kWXMDVif8+TFOXTNzECr?=
 =?iso-8859-1?Q?dM8aUJy8AybQ34dRW7Dn64IjDg+u2+UgDxd+nhGGkf9R0dtS93RW1VKavo?=
 =?iso-8859-1?Q?VZXGuJweHsvuN2y+wmL2QcoLHHFt0BANMEca56ocMTeiiIrGfRebnRCWCc?=
 =?iso-8859-1?Q?TNnpIclDkQSdxwHUxWlyAzdxqCI9JZeBOjDsuJqNa/Gew5rV727qLO1M69?=
 =?iso-8859-1?Q?U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ZhCUYtmvcxvAbIp2nePqjkEqBiwCIg0IAQloYxpDH4PBsf5YJ4pyHP8pUq?=
 =?iso-8859-1?Q?ErVaTh6xjMVK47RYC35QFW+GGLH2Td5Jf7eE3ntHUbBfpcOJB1Z455Nx9q?=
 =?iso-8859-1?Q?Wa1TNXtfvzQhNZpzQIUSvau1IJjKEDW49K9W5ozfFFT/TlKBXliqHM2/eo?=
 =?iso-8859-1?Q?02DBrSE0mhwK2j5AmPeCuahgtxiTv+hNHwnOCGSQnWSJphg4dYYl5O368w?=
 =?iso-8859-1?Q?TwlP9XSpvC/N9RcTo5QTs0zCXLWtVRXscW2TYj97MW+Vl1RXJ/ALp3u102?=
 =?iso-8859-1?Q?MZBqsGW0kivx+WWaB14XohJYGvWmmXtonPcNiTAlZyUivdWlSekeKnJbaN?=
 =?iso-8859-1?Q?S9M+LYWjScFt97B/swVTNh16VLRyrOG+HDcqTcjckX8CkrnD2dnL3waO0H?=
 =?iso-8859-1?Q?S1soZ4mRJVi1m/wGKqXqg8qZy5CwYnlLEVWF+dagGiCj+VPJ9I36Nhr86c?=
 =?iso-8859-1?Q?OupCBnIfryadJT0re4dlIoDd62kgh6ZwhRSSnyqAQoe9tqz36TB2DjUdYD?=
 =?iso-8859-1?Q?9H0hOmN13TpRXNUg9lSet7Hsz1XsV+CrcNGBGyIv9Kyg/Mbd++qxlKPQxj?=
 =?iso-8859-1?Q?H07fN1SiNL4Zr36m169daHCSmc6p4GWjub6PYNrMtOe6b2MYK3xZid+5Qc?=
 =?iso-8859-1?Q?JCsM1lO4gFtok71X69pQ68z0py6Ngb4f+tW2m2/lxwL8Ap3FuVDBRMRl/3?=
 =?iso-8859-1?Q?5uBOiZdHblSeldD4ZhupjGq6GK2B5ARKmaBI5d54tnUtshsWSuZu/zeA4T?=
 =?iso-8859-1?Q?u1qXJAlikGDhNeMhGxeIr7TCpjzaJB8tDUBcPsEV9Q0o+oUs45YJbzHD+J?=
 =?iso-8859-1?Q?Kd8iTvJKuNvHSURYfIewKe3GWLq6xGfW/nKqxD8BNQmVB6MdhxLcutl5i1?=
 =?iso-8859-1?Q?ZwzFG2AoJ9JrxzCyCeJ23yYesdIWuHJdpOpAB9cnRdWUbyamoU4q4Nww2j?=
 =?iso-8859-1?Q?fQsca/SYMmfs6dd5Am5vfiO2npUrqK1h+Q43UiLudpKeoiG7eMVp1+u70i?=
 =?iso-8859-1?Q?8vuIZhWwt2xMx59pN9Z8ueUhW5VPU7xhzI/NsTIH7uyJtYhKy2CCYplqr7?=
 =?iso-8859-1?Q?J1w/V5z2kw2p4A3erlxkRAoiNZjtel/zyqJcDJVVwjaourFDljOmugLX7m?=
 =?iso-8859-1?Q?2K4R688T3qbLP6UoFN953xayzWTbEq4WUySb90PIkcIHJQWsEk+xxAa3EA?=
 =?iso-8859-1?Q?tYWDugjbQ9DovrTyg0Y6dMExKHav8yfdlBKXcs0kFESicIqfLZkxT3hY4V?=
 =?iso-8859-1?Q?Cyj7IqtITnrwyWx+rZxeDMVu1+5UPsAxRl6zKWB/ktNVP/e1z+0uhriR08?=
 =?iso-8859-1?Q?2GMnHIF2WRZY7HwHVn8paMS6dpc7KniEzXhBEFenZCBqtPYfpHnUCQDEpk?=
 =?iso-8859-1?Q?XVyRKInXCym+lYVYfHc9Bo93bWZd0Rc7+IXM0uTdanBacL+21FtGQ5K0vv?=
 =?iso-8859-1?Q?O2GqUiD0SrFMlWGsgpnJz2+H/wgaq4zWLnAtpw/5DzComKKI/IYWe2gFGc?=
 =?iso-8859-1?Q?vRTxak1Go0r4uSTHJVSAgt8jU/oHqurkuabvZzW+gGwaipJsqCXwchg6cZ?=
 =?iso-8859-1?Q?cuGEB5soxhX8LRM7YLn9wbkt3H8SuWBJelHBd9n4RZznnwLAS0gu65ewcc?=
 =?iso-8859-1?Q?VUIyV6rcLithJ1pwDOnpBdgDnnWwTrAiryBNyTKUYLQYFzkuFZnq70Ow?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 33d44f87-5ba6-454c-0b8e-08dd891eb2c3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2025 02:11:49.9853 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8MS4FOwzPGMPKcM3+ez6lISWLDH5VpZ+atwZL/otOz68S+Z+pBUvJvx7ab/I/0dqhIzjBZb3eUqQTT59fzY2hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFDC3198517
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

On Thu, May 01, 2025 at 05:24:38PM -0700, Kees Cook wrote:
> Casting through a "void *" isn't sufficient to convince the randstruct
> GCC plugin that the result is intentional. Instead operate through an
> explicit union to silence the warning:
> 
> drivers/gpu/drm/ttm/ttm_backup.c: In function 'ttm_file_to_backup':
> drivers/gpu/drm/ttm/ttm_backup.c:21:16: note: randstruct: casting between randomized structure pointer types (ssa): 'struct ttm_backup' and 'struct file'
>    21 |         return (void *)file;
>       |                ^~~~~~~~~~~~
> 
> Suggested-by: Matthew Brost <matthew.brost@intel.com>

I forgot the policy if suggest-by but will add:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

Thomas was out today I suspect he will look at this tomorrow when he is
back too.

Matt

> Fixes: e7b5d23e5d47 ("drm/ttm: Provide a shmem backup implementation")
> Signed-off-by: Kees Cook <kees@kernel.org>
> ---
>  v2: use struct and container_of (matthew)
>  v1: https://lore.kernel.org/all/20250501195859.work.107-kees@kernel.org/
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Huang Rui <ray.huang@amd.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: <dri-devel@lists.freedesktop.org>
> ---
>  drivers/gpu/drm/ttm/ttm_backup.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_backup.c b/drivers/gpu/drm/ttm/ttm_backup.c
> index 93c007f18855..60cff6c60db4 100644
> --- a/drivers/gpu/drm/ttm/ttm_backup.c
> +++ b/drivers/gpu/drm/ttm/ttm_backup.c
> @@ -9,16 +9,21 @@
>  
>  /*
>   * Casting from randomized struct file * to struct ttm_backup * is fine since
> - * struct ttm_backup is never defined nor dereferenced.
> + * struct ttm_backup is never defined nor dereferenced. Use a single-member
> + * struct to avoid cast warnings.
>   */
> +struct ttm_backup {
> +	struct file file;
> +};
> +
>  static struct file *ttm_backup_to_file(struct ttm_backup *backup)
>  {
> -	return (void *)backup;
> +	return &backup->file;
>  }
>  
>  static struct ttm_backup *ttm_file_to_backup(struct file *file)
>  {
> -	return (void *)file;
> +	return container_of(file, struct ttm_backup, file);
>  }
>  
>  /*
> -- 
> 2.34.1
> 
