Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E78CA5892
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 22:45:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AFA110E227;
	Thu,  4 Dec 2025 21:44:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OBc81KGk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05CE910E220;
 Thu,  4 Dec 2025 21:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764884698; x=1796420698;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=HvlD3QsSeLv+AyXTkwA1Foq7LCGfqbKWhrWrHJl6kNE=;
 b=OBc81KGkwTggBkZcOHC+pkXBE3Cyx4nBpctbi6qYo3kHvIyK07VVttez
 gQIWDV7eJ31TvD2N2Il7yUyXwzuuOCZ9SwYxA5Dxyuo45yKqf2nge8P8O
 Hayumcl+IGHQ6VJ8yu7c087zftmhdDIi1pVUUxsWQ73nIqs5YQ1yIvXKq
 9pfZZCf2NKtZpw7eIUm3aMgT91/5q4TkNHz1KQqJiX7ukZ0d0tOYhqVpt
 5rG3L8xwYNf7AfUqyQaav0jNxScKmUzgefCn/AOhXWPb1WjyHSiMBSrFJ
 Sc3OwKj+O50ioZWAGR4dkFX+9wEdlbJPAWyGgj/Rbq5c+zdUhc3h7pOOh g==;
X-CSE-ConnectionGUID: WioghPvwRNmgsX3WskceAw==
X-CSE-MsgGUID: WkPC/tGlTfCKiIFDkg3TFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="70766676"
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; d="scan'208";a="70766676"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 13:44:57 -0800
X-CSE-ConnectionGUID: Pz5b370CSOC5NrQ9wRTedg==
X-CSE-MsgGUID: 1GR5Kt4ZThiCZcVMPZzR2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; d="scan'208";a="194905972"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 13:44:57 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 13:44:56 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 4 Dec 2025 13:44:56 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.50) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 13:44:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=exPnIQSbnLHK0rcGeMdwCX+wGbYeg3XKESzgteO0KAKTB2H+9aHeQSAUQfWJvJmb3YnYnkUyAcbKEA7zMZ4+Hi1OwlPbWSKTysHpp2774dwKoe0zLjNbl1UT3hH5rXShjhitKp5wd0B/WLtFNppLq1PoQ0+rO4i6h3glAJkpqQoepuGH7J61OlYosD6EL01uDWLqLqJFwOIjX0wKzjf5F0pJ1877iTAvHCf7sPrRTzr01sOXTw6L2yqOFK7rAlSon8zRIjU/7DQHEV5ry1Da3FTr5PqfueL9zuVw5QMcCXLxOOVG2QVme5u3cNXgJy4ItGn+SmhdmwgfFZRT+TjvpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4hxIQVGFVKadWZfA5yyoGRAL0ea3OyZaMk8uqR7n4lQ=;
 b=tkuo5Mb9Z8zq5StszYqaJ0/rI2KO8yVG27J4pTy4iPYHVXfnKRyoRrJ4xf5jxoAeyQ6bNSnyY1zXoNcHqhm4Gc7Huakza7XMPEGpYZRJ9uIq+BUoEdxB3zZDBrG3D9Hb9rV5gykAq16hOr8P9KODv1MmOE9jHYAJ9aLI5Jh8QgS2BjScD0qH+GDN98xG1JrKG+xD97/EnOO70ytwfzZFCaL9r3E6zskx+2VgB0vyBreZNNBAaL1CGgrwsFVmf7eUKNOmrpxcxVJYsSJX1eTzVBJauYXbr7xk9/T4gy9uq6MQ1ASfXYU/qdUCVLb8LyAp89F0nbajJN/tWHQ6VNtirw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB7086.namprd11.prod.outlook.com (2603:10b6:806:2b3::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Thu, 4 Dec
 2025 21:44:42 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9388.009; Thu, 4 Dec 2025
 21:44:42 +0000
Date: Thu, 4 Dec 2025 13:44:39 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona.vetter@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MAINTAINERS: Update Xe driver maintainers
Message-ID: <aTIAx4LyWr0f6WWs@lstrano-desk.jf.intel.com>
References: <20251204193403.930328-2-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251204193403.930328-2-rodrigo.vivi@intel.com>
X-ClientProxiedBy: MW4PR04CA0198.namprd04.prod.outlook.com
 (2603:10b6:303:86::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB7086:EE_
X-MS-Office365-Filtering-Correlation-Id: b00d52cb-8b0f-4660-fde7-08de337e551c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?i6xhJPYZ6+o3++j/IDY9TEe2dhJqrVsbFvAboHFv25XwUinHmnla11i3fq?=
 =?iso-8859-1?Q?YfAXOHR2xAZSnLkYEfmQoN9oB5m/Gnvg1w7Mt9Bv4vJzkkKy5c5QMdUnMj?=
 =?iso-8859-1?Q?qH+PCNufxPxKySAm/4GaXP29GswGz3eVVlrjxrMisRgHpAWqiisJYoPXsw?=
 =?iso-8859-1?Q?i87mqXD5tp7fTKxgUGjssxbjKiiVoWLNyxgBRH78OcbOicDLrb8CAwlnmR?=
 =?iso-8859-1?Q?xlpwxYRlrkXhEwIYsDdpV3fb5rAsuMnTBgDO0wkFdFJjwMx9t+bmiWqNfd?=
 =?iso-8859-1?Q?+kyxW3381JAAQjzVxypMaW7/u+1mbNjIm3IychM32o1e4rg+CFxT0heBMZ?=
 =?iso-8859-1?Q?Wq9u0/qn1N/qdkcRW+Enisrnly2s9fTorlmfAvaGpSo0duLfeCp5Mmhwwl?=
 =?iso-8859-1?Q?gAgut1nzU8bdkcIHdGQte88BOuTz1OBw3yyNTUe9rz5dTsjNlDpgTNsHwx?=
 =?iso-8859-1?Q?VaywxmF3xhhMmnjRsAY0F3DnqaUp/JO0V/aIzqAXRFth5rg70xgEh4lvga?=
 =?iso-8859-1?Q?5m5TI14TYrYKUhcZqtWFDlXRGu9XYWvm6lMfzv9Lp+jJdG2nXnvlLAkAN2?=
 =?iso-8859-1?Q?Q9f2clsuHQ9LWfZ/3UAIEsOrv3VD7K5aGWwYKWAYCnqizzXj5WUsT0T//p?=
 =?iso-8859-1?Q?dSxEYizrz7O+10YV7ipjjPpemY0+JJ0ffZEJvLAPP9iWLSUVkK9S9OdNFG?=
 =?iso-8859-1?Q?8Hl/wzdPTJOrfGl/YSV1FUosaC9FPQAzXgTcYOekgSOkuQXOujv9wYaVHG?=
 =?iso-8859-1?Q?ArdAfu6X9O5vU5rnG17IjTON1CWbeoIBHIkGP5Tq1fBX5OhIoNXBRhZ3BN?=
 =?iso-8859-1?Q?asas2OCZTsPAtGfiNWQAH8ihFYVh6gKDkuyHWV6+y+NPhpN/rfCX3Zhm7D?=
 =?iso-8859-1?Q?L0uIIEhxNUbZLy+PL/s7LLuxvS/t4EMz43YumINI8ihsIm4bTQr43qwBBR?=
 =?iso-8859-1?Q?rMksbM2cHHAJu2XFZdzZZic0SUaSR4luIbjT5B62/thzP1bgzSFPtRdR7Z?=
 =?iso-8859-1?Q?Lkov3YlqT2tKAjkYKR89Fj41DfwMFTGV624eA/XLjBp795GEWu08FYzJxA?=
 =?iso-8859-1?Q?eT8PnfbwmFwQgfQj5eRJuZPe7UC+vBS9feIqlwuYehoeOpMW3isWTBl3ju?=
 =?iso-8859-1?Q?LsiYw03H1gVBKoH4+0tUDFziXvekagWWJipdw4/AuSaUv+RQsbRECTTufA?=
 =?iso-8859-1?Q?p2JJ5TEmjVXiwY311O8tosldRHpngEQ2kAtidAy4EvVUhTdJhazWp9fRK7?=
 =?iso-8859-1?Q?werAngttlINVRr3kB9J8mo+51ceW9DyZjARn0YhzRed+m+MTX5+R4jW7n+?=
 =?iso-8859-1?Q?4rMQBNarlN9ESFvXT8aOojTUpBZhKqQhNSGbgKI0OaBFY871RJ4oQOr4Xv?=
 =?iso-8859-1?Q?7kHDsREe/8tUGNQBktca/KczgNMCsUf1JmbtM8AsNBI5N68k8Z3youZlSY?=
 =?iso-8859-1?Q?mYZGpGxQwZqJYQEQgueGUgCc/5z/dFttoXINC6jYbzAs3RNrIzb4Hifdxd?=
 =?iso-8859-1?Q?oqjiNhr5rALex6/caVN+eV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?8f+LSK8Rk4VDJZ74OYMO1SGETZryEPoSgFqL4N8YPttE+pNhXLr5ra7r5W?=
 =?iso-8859-1?Q?mfAT+gmWHj2pgneLvEr4tVYYUspcgcD9dA86+WyI5dOWkwADTmBWXIyc1d?=
 =?iso-8859-1?Q?fTq9hbZ7vn2iBqYHU9qzENww4MIech/kQ0EHOCQcUnMXhrgJ/EWTj2u4cS?=
 =?iso-8859-1?Q?WWyG2Z37Bm6lL0Kt7M6xoNPa+vvYOgFjZMIhObL3B2qz7VJZKq7yRr8IFS?=
 =?iso-8859-1?Q?Xk+GGzkvbTFYClJdNNU9EnmvKla3XOYoXnN5JXhOjHvZiQVspMtnctUcIe?=
 =?iso-8859-1?Q?doTyov+Xdgkhoc7EeR6rLExrfIoGtWvORj4A0IL0Yhf0w3R+oYxmsU8wUt?=
 =?iso-8859-1?Q?qQzL0Zr+sRG7WL8P1bbm2BpDdnQAwijJ2okNRdzVlrSlbzZG5iJaGooY23?=
 =?iso-8859-1?Q?3lmqenEwZPzrG0uiu7c2nfdakYhNLEjVDr4c4S2sIz++pbmZrBUVqKd0p+?=
 =?iso-8859-1?Q?loAcpuCULiY4OhG3rjiGTDi1JhZigKwnD6wrOJcE0YKZjf6YlX4umH+G38?=
 =?iso-8859-1?Q?pE4mb8AbzrGFUb9+aH1IqFsVedg81rGCIDeThgBJ5cNh2U2VQ268gqf0oV?=
 =?iso-8859-1?Q?A0GNUGZ367bhsar6eyNVln4jkER3DAx4hi/VE703M/Ls7Q3QNvlvpDaRmT?=
 =?iso-8859-1?Q?7RxQ0IUKZ0+G5dOudyvQ4/CFXA66wZLD3CzGxR8uG0E89xQ88S0RYDj2Q+?=
 =?iso-8859-1?Q?IGW6xJLZs+TsKcazqBtTDbuOrLbjCqaA5cXFFxnnnjmf6YELJuXCyowCGr?=
 =?iso-8859-1?Q?NdjxE+F/UgsAa7wM6y0+b7NIvrj97NV43Fxkf4URx0JW2hG5zA8mhuNTwb?=
 =?iso-8859-1?Q?VSJoOKZ0bLfJKQWMlgQ7XjCTQUiTxK25fK9IsefzU1kNETF7KubUvSq9gY?=
 =?iso-8859-1?Q?6lJbAoOwhusZ1AbAXIlHkJWF84JViwlm/l4n/Z8kVAMakKC3fUnwZ4PrcV?=
 =?iso-8859-1?Q?uzhfUcF9soqc+4JxAs8+vDO3YDNoof5RE7i3at5UlX5DjtIZy+Br0HEVoc?=
 =?iso-8859-1?Q?Mdm3EOpC/XLRNVO1GzfS396qQeni2srDNrluLARZHok4yeRleQxWnUBCPA?=
 =?iso-8859-1?Q?yrMPn9G+t45mL2sJoi2m3Q3UP+o847XUnnBU9AUv8TenF4RzeSM7MKY3GB?=
 =?iso-8859-1?Q?rZyhMUlLAC9omqgr9i1aOAzGJICTBqGykYLcnstQly4NCYmohY7wSyX/S/?=
 =?iso-8859-1?Q?887iG93U5zrSBsHANQ6NAnQi5Gz0j4bl/N1eO8HpCu0yL+cp8b2IS+uQrp?=
 =?iso-8859-1?Q?swMD8krC5fYM64mwIfnlsUaKkOJoCqHHu2wJraBdr8V3A4cUyh5RrpnczS?=
 =?iso-8859-1?Q?wns7vDfVMFjI5D5gvsVys8M3H0l+0ZeukP2HPDh5S6iiEsweIrkahaHwwx?=
 =?iso-8859-1?Q?7ikDm6uMOqEKVyJctQK03fQqvWoVB1dAKGyAvrA3b2AbVLpOAmPX1iGFaD?=
 =?iso-8859-1?Q?qBM/IdE6KZ9iC+UPFJ64RLZIKl5i8l9BtcsXGaVeBVaVTKrbddFSd1kk5q?=
 =?iso-8859-1?Q?Ps330tLmtQqvs7Skn0caRRrfZl71Wixlem1YKCv5Bb7ZxhcB4u2bJRHju6?=
 =?iso-8859-1?Q?qDfWpnbc4nQJkH/g9dvUt0ztBLOO0up9xLr7hoS+Hf/iV1uDfgp8oIagWj?=
 =?iso-8859-1?Q?EnZ5O8wwLI4nKvr2mzXtPT2zOJfeuWvGNbm/Xl90Ko8FZytSH2UO1nMA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b00d52cb-8b0f-4660-fde7-08de337e551c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 21:44:42.1198 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aAc/Ri/thDrrpaSMW/OFqo6UkWUDUnp0fwPA0YpbRJeeqd66dnnI594hSupdWMkIV2HNhDTWyTxvW8FQlt9AJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7086
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

On Thu, Dec 04, 2025 at 02:34:04PM -0500, Rodrigo Vivi wrote:
> Add Matt Brost, one of the Xe driver creators, as maintainer.
> 
> Cc: Matthew Brost <matthew.brost@intel.com>

Acked-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona.vetter@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7774cacab5f6..254649de9c26 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12517,6 +12517,7 @@ F:	include/drm/intel/
>  F:	include/uapi/drm/i915_drm.h
>  
>  INTEL DRM XE DRIVER (Lunar Lake and newer)
> +M:	Matthew Brost <matthew.brost@intel.com>
>  M:	Thomas Hellström <thomas.hellstrom@linux.intel.com>
>  M:	Rodrigo Vivi <rodrigo.vivi@intel.com>
>  L:	intel-xe@lists.freedesktop.org
> -- 
> 2.51.1
> 
