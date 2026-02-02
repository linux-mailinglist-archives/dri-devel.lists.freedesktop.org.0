Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cOpuDmGagGnL/gIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 13:36:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE24CC670
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 13:36:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FB7F10E4A4;
	Mon,  2 Feb 2026 12:36:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hq0VlHMJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3614910E4A4;
 Mon,  2 Feb 2026 12:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770035805; x=1801571805;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=z1rflKvmvBHfjTcMtzONhMS+Acy9TWkYjb0ZbK6K7ak=;
 b=hq0VlHMJt1rTQvJ6rZjYNRZXQ3/nN9rweCI3APKVMUV4PEo4vo03bQfL
 l/LeT15buohmBVKVyaZEGoehqtFr4zNSN+hONSM5rRH+L90FbHY+jlVHx
 7szwKiMY6UxRK8B93nB6Jh+aCtDrf3Ll+rwVa21AXnCq7F8I+ln4w0EMt
 ZUTPUGE8ix7gsGXAbb5hlGQCD0oAJRDLg0PR3xGZ2s2xg+t6QDticJus7
 3uIehV6Hj/bWxMw+Bs34joow98qJdl2qBMX01b7sNKqb6Sj/Wb5DBml3v
 cmwZhNNa0mOzB7SjI3GJasz3PcBYXPQLCrFLsN5Hiw90oc0A2/Slc+eZN w==;
X-CSE-ConnectionGUID: F7g6Rwq2Sn6kbKH/WaQ4mA==
X-CSE-MsgGUID: 2eW6Kop/R7qN92X+ZAbfyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="75041771"
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="75041771"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 04:36:45 -0800
X-CSE-ConnectionGUID: mze89bZfTtyH3NocOyJniQ==
X-CSE-MsgGUID: VCwHL5v5RnmCXqiK2HtiGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="214450631"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 04:36:45 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 2 Feb 2026 04:36:44 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 2 Feb 2026 04:36:44 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.68) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 2 Feb 2026 04:36:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UVfYv77IPraDqIuER2sHV1E9/1Dncgx6/xICxgYqw43Kty9do2rMIgVqkFsFHKUQlh5Wa2twAQfODeGiw6A6I06aEiSQS8BImo38AaPULQytDjIHwgXuEj9Cj8zZT7eof0SlsSg7yN2SzqnycKlpBBu2ydzV4ls4Z4hvn0iXC91+Q/poPhLtcsbKPqorDCpXVMBWq7idVBTtk/n3t5NiIUeZbBL8AfYR6PaBj++JAPkSn/CJMewQrsFGFvpATBqktRamWabFlO5ySvd2xS5zY21RDxXhRRXpRBh5XarSOuaKXgrfBdC2VHJ2BE8BO24SW+2JC3a4dMtt5wzsY/HdmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PfQB9xyzGQRlRJ77gPlDbI0fMV/FcdmtVugbh6a2H+0=;
 b=X+reh3ycru5R5iHnYqUV9wA8YdpnsZF6ZaQ4Ps4Gd00rDkOpCG3aYsFPztpfIS++Wqvh5F5jW+M0qhLaZHr067WY0v47Rs6bAUewdS6R+8r32KscF7+sGz0Efu5GzoxYSDQVjHl4WGTpiP9DFvv2pWrIzU5zfImj5U/DB1cPK/FqzXiXBudzUXpRuRYcU0TOpxRihIpUkIdz9bQMa2SQ4/tqBUQnjDm+46sw+lJn3gp3xIVe0vq9xCektuLeI1kpbco5OdyhqF7GKb4y+Ozs8rzNM+mOuLZQGxjK96NGetWBOxbsEx0yjavlEYIbsZxDokkRDUn62kIIQnBjaH2MuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by PH8PR11MB6729.namprd11.prod.outlook.com (2603:10b6:510:1c5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 12:36:41 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277%3]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 12:36:41 +0000
Date: Mon, 2 Feb 2026 13:36:33 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <thomas.hellstrom@linux.intel.com>, <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH 2/2] drm/gpusvm: Allow device pages to be mapped in mixed
 mappings after system pages
Message-ID: <aYCaUawn5i4Vpk3v@fdugast-desk>
References: <20260130194928.3255613-1-matthew.brost@intel.com>
 <20260130194928.3255613-3-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260130194928.3255613-3-matthew.brost@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DU2PR04CA0200.eurprd04.prod.outlook.com
 (2603:10a6:10:28d::25) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|PH8PR11MB6729:EE_
X-MS-Office365-Filtering-Correlation-Id: 891c1c7f-2200-4b8e-a5db-08de6257b764
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3yu69CsrbOdqwZcFMcEFj+m+3Z5m+s8Xu/qZAFQpKvqBqUz/Z7xl++12sEuH?=
 =?us-ascii?Q?f5tG/VBSJsKUhBSu+MuNKewuUV3Mf7m5i7fXdevkuu/S+eesluZpFXw0Xjo9?=
 =?us-ascii?Q?m0oxzpLOIKXAGUaiF9pF63Jhy9EIcGGdG1BBI95TU7YEuy40H8oiRXMDZhR6?=
 =?us-ascii?Q?p8vuw41pdmZGVgNTvvLHyOWsw7rk+s6/7SX9ij+hhraV2FfTvv/9PtEsIpRy?=
 =?us-ascii?Q?c5cCOB8Xh/8xz2kcK7FvRMZpvcDB0MXeO2UQ7+Uia/ZS2Bm/9KPzj8Ag+QzC?=
 =?us-ascii?Q?GmkclHUL13V6SviJKI2msBXh5cYFa4KFpqMyRWKBf3w+aCz6O0SGkd3GLbVC?=
 =?us-ascii?Q?+hwpSukThvulvInzwd5Ump3JjASrYsixvNka98nXKQmz0EEGAdr71R3Tjpry?=
 =?us-ascii?Q?y2i/gwA+7Q47o7A6rmdgTZspSd8IrZ4C4E7PHq5wi68mEyykmhvedWRmArnW?=
 =?us-ascii?Q?Fxaaw7Bp+A9DeRE3IHSQGDrPqRiQ8msjnWsNZ7T9xWB25KmH0zd/XhGihfHp?=
 =?us-ascii?Q?lzg9UrmtEPCI6qlihAugYH+Rp91ebx0yG/4k7LCVhLfkQwOSfRXnMVETyWzW?=
 =?us-ascii?Q?wI5RH1PGQV1uRa9LpCbTWpM29FNbruarI+CzS4tyEliwqFRNMQ00w5pob6DZ?=
 =?us-ascii?Q?R42BhPh2H2RQ2l1uMi8EDqVkgMqzQoZNmcFndQrbvN/PHXPuAdNCY6TJkm1j?=
 =?us-ascii?Q?/55bPwRSOD/kQUkAlyPIdpFE8zKdDSSH01//o4C6ScLy5Ac+PuK0e5U17FWD?=
 =?us-ascii?Q?4sQK2rfwnqPhs4dPnPdBc7At8dB7KEP3ZvW5+EBE5BJAlvnrSN1RCwV8pZyp?=
 =?us-ascii?Q?EBaZu37i+PJ8WOCizbwiVM4B+Il5FyplOblZtOOXKNUQxq2hfM44xIjUnDGd?=
 =?us-ascii?Q?78so/Ewvzsl4rLHjoejbfVsUauNrV1eoLaR+94SaESMbOw9yoHz3hDlSqT+r?=
 =?us-ascii?Q?RH4EA7zjz6ex+x6ywWmTjqEbRBDCE6W94as88wYESxzyaJtsQbBtZkbY2Mlj?=
 =?us-ascii?Q?EC0MP5a7/LRvY+PUeFSefi+uMQgEi9Lwsy/MPc7tIBuRoapcZ/MlG09+TP4O?=
 =?us-ascii?Q?YerGXF79VnV2Tbp45HR5EfWWvIQwxbtYchrsfDIZiLW0PVuU5IBcU3mmGHaD?=
 =?us-ascii?Q?eLK+wKvWXhGMYN5+Ek96/ySugfCefWZAiwwAPakmk8sM+mr3Yw0WO/Fmgj3d?=
 =?us-ascii?Q?Wa1JokDnoAzpZmeXSj4tpviVjdv+6QF9yVW+ycpJcElAgv/3oGcqXfVTZGxy?=
 =?us-ascii?Q?Gy7FvEjoNkJFIPxviKxVp0MoDGUcJsKji41ZXr8rRieGqm181mjrnX9Is/QF?=
 =?us-ascii?Q?venK9LoktYy045fizsoAM2rkjhYmBVwmRXs3yrU0PNqDC2YDDZL8Svtbq/8L?=
 =?us-ascii?Q?8O16izyZRrnFuDgfAnzp1GW/h5UodwM3oQy1Bd0eVlYcJVhz3vDv9aKhFq7v?=
 =?us-ascii?Q?C0juQR9NtDI+krNDM6CayQFYv2vgKNAhyPlp7E7BbxEmNnEIv0Xv0GNs81y9?=
 =?us-ascii?Q?el00owDFl7HTwdDOwVE9/bsperj7cKfBZvUuW7LiNJasEE5rlCE/ztg6X5Za?=
 =?us-ascii?Q?59RN2zsK8jEDQJIkAUU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sQKjoIPVnAUa/3LtrsCPib6y+93EgPUK1YTYvdKlQAA5THytnEG7XQnVcHxw?=
 =?us-ascii?Q?A4vs9K0EEc7fijTPfi5hxf0MpYNi9iH5W5d3Q4bQNK7Ihxkv7oOlo3B5aeck?=
 =?us-ascii?Q?jHFP3lDuqv8lkx9fcZE8ioxN5tAO6p/PK3WOVO/RMZ/Munm+f2zz6/wRa5AC?=
 =?us-ascii?Q?V14UU/PTDVPxMAaO3PmwA28nylgUvYl2R0YkNfM3ojFQMXRfoRnYzOfuepPG?=
 =?us-ascii?Q?3kmp/nAwNPo9DpQoXB07Ts25yqLCi74F7xpz7HQwsvnmNrqkM32GX2+0EKIM?=
 =?us-ascii?Q?b/hpBampZN8nfsJl1Ep7jHVlC2FcOI/lVdMCBK9B4sna35j4RZBzWL73wIn4?=
 =?us-ascii?Q?aNrQWT7ZEtD4Fa5QsoCpMTgoxoLrKTc+smJMF66jJDEaSKgpPxZqpv3Rm+VL?=
 =?us-ascii?Q?5EZb6s8gYmXyA6uzyrNGT9tvETYIZKNfBPpeyY1/PID7UcLoxFwmdZQlx1Vw?=
 =?us-ascii?Q?MycrtF0vDWse5tJpGcyb2OkGG63GdNGPRT35dkRkOyQx8D3pW04uYyXTAFfo?=
 =?us-ascii?Q?6xz5n11MkFUWxOmYCjP14CZuOl0AKaqNuW4TX9EmCGo+YxS64Bm1pMRyCnYP?=
 =?us-ascii?Q?yCuKjsbQMx5JmshuVf21WfyVpVgUoBKCw/XPBypsDqZByxnJgZeLkwOrJqgV?=
 =?us-ascii?Q?JH1fH1XDbab/ZINtA2uqmT9LG89GFGrBeTsc1r41fyLrqh0sLfaWlacOzBuw?=
 =?us-ascii?Q?9T++7OCPwpRw+21y+Otr/ZNH7fNXef0Xe6OslB91Ah8DF046soYUMjyRm/D/?=
 =?us-ascii?Q?wHaNpoBXSLOG5f7eQh/HN62X7b7jRNtiuuMAGw8JlzInSViNxIEb+s2NhcF0?=
 =?us-ascii?Q?YUTGqUfVCJSgABDCZsbZt3zO6D/zGL8H1jkZt4iOZWYGU8nCf8stdxf7zMat?=
 =?us-ascii?Q?ks1mczK/usNMI2SW/vsCZkELyxytpXu4LyIlQ5qlCnLkqcxatKYcd2g9LT5N?=
 =?us-ascii?Q?JGkzGpg+kVS7CWAkHkpSIPk3rI96UUEKR58vJIxx0gM5ftll0jhpsy8qU9wI?=
 =?us-ascii?Q?J2dimrlZqKHgSFB6JLefAb9n/hkOuYqrGpp9vcXfNxD/uyoplJTROOsYwdwT?=
 =?us-ascii?Q?w/SpH+abslCnjR/5zk55OVI2A8RlhEZyEMdHPFOkIn0Ya4ybt+AvFHEA9pTB?=
 =?us-ascii?Q?1F/9dkQXg8OA1oRpgwGQgRZ0IjZvIlLCxHl4/51figtRwoKNrR9QvtF/zc+p?=
 =?us-ascii?Q?+Z48EaVHxSdOsB8EjpUw/z2FV3klwR+pLR6ZWIHVuyvSQoXXLjlWzG9ddVm2?=
 =?us-ascii?Q?8EzIlxWF+oXDudYAK3iBtMOin2XsGRqymYhHw2ZAKXrnRgt1M7H7BAbCV7FV?=
 =?us-ascii?Q?nIivjlVEQOYUKSw8JljC05RzNucPyFWTQIULJqdcyco4Pe623QK6dEwAYm6g?=
 =?us-ascii?Q?uWt5R/RJBbT75EY3qJy9yh9GhZagXWth+tmK1DwUYmsb1Rg+Rb1FnsbU6qq6?=
 =?us-ascii?Q?ubRA3Qq1XUugkeBzK2xAl7vads5WgYUdafIaTESkrLPWSdhUkkD94rUhULkj?=
 =?us-ascii?Q?xUgr4sHcNIKPq+/dVlnY5u+QYqYJv8oBmB4eyE99fUDw0adffSVZTqloGwSN?=
 =?us-ascii?Q?3N/yZ5Y9nULT8H1ICWltyBE4N8/RckuRKxnXH0Rr7iQji+bRCCaEuiLDGi6g?=
 =?us-ascii?Q?y8bK5biEWdbv+6cRAyoFtzq3HQC+4gRaNXxGWJQ2cKLuzMYQOxK11oWaaEQe?=
 =?us-ascii?Q?B5GXBcp1JqGkjgp6S51HOT3frasso4YOJP45tHLvSAZPzsHfuYsAJTdNrXso?=
 =?us-ascii?Q?3J+K3s5mgPORZB8sIEdzRFgvWAciRsM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 891c1c7f-2200-4b8e-a5db-08de6257b764
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 12:36:41.3281 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yUiY+78CjUL4SR5zTFYTzDy1vLAw5/Y0nM9yQRK+oA4veMmLs8UwyCGuFs8FP8ENc7Qn2/v37vUOVKE9/7ZEb7dpFjY89D5BN2UG8g/64qM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6729
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:email,intel.com:dkim];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[francois.dugast@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 7FE24CC670
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 11:49:28AM -0800, Matthew Brost wrote:
> The current code rejects device mappings whenever system pages have
> already been encountered. This is not the intended behavior when
> allow_mixed is set.
> 
> Relax the restriction by permitting a single pagemap to be selected when
> allow_mixed is enabled, even if system pages were found earlier.
> 
> Fixed: bce13d6ecd6c ("drm/gpusvm, drm/xe: Allow mixed mappings for userptr")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  drivers/gpu/drm/drm_gpusvm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
> index d733599ceb9a..871fcccd128a 100644
> --- a/drivers/gpu/drm/drm_gpusvm.c
> +++ b/drivers/gpu/drm/drm_gpusvm.c
> @@ -1495,7 +1495,7 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
>  			}
>  			zdd = page->zone_device_data;
>  			if (pagemap != page_pgmap(page)) {
> -				if (i > 0) {
> +				if (pagemap) {
>  					err = -EOPNOTSUPP;
>  					goto err_unmap;
>  				}
> -- 
> 2.34.1
> 
