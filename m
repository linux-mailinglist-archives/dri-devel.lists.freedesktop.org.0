Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D52ADB6D6
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 18:28:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF44B10E3F3;
	Mon, 16 Jun 2025 16:28:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AcsRFNCz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2869E10E102;
 Mon, 16 Jun 2025 16:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750091329; x=1781627329;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=nBg4rfOwgW33TTBY34AcjDPMPug/Xw9OhH6s5Drp9DM=;
 b=AcsRFNCzv93s3hiiRVnj4kVfBxY7OwPf2KH8hQduu39WPmSO3JJGK1u7
 T1I/Uh4TAiGCn7urMfa2wJ6N7pvrfrrdVk3QI4Zbjb4egz+2VsggdeZUi
 12Kr08ascJb2sxE8bjDHy6joasESZFpHIi3l4hZ89dgmQ9pxdLaFpY7NW
 xhpBaATrqi2IykxJD/wmEWBRVhASvEv0H2otIkLug0gmufMLfCvuvioY/
 ioKRWf0IbMWX2z1BHRThHFb1purrPf4hKxTi38aE3tGhcPJtjJCefP9lb
 +7kCwsJLehBV+WtH5A7QXEm9vt+PuRWvtr2/IcroKHcbTbAlOfYXK4oa+ w==;
X-CSE-ConnectionGUID: zpMaMK2RTe2m3dLXMiHzcA==
X-CSE-MsgGUID: EiJMUEuWRDCtsmu0XLc6VQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="69821196"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="69821196"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 09:28:49 -0700
X-CSE-ConnectionGUID: M6/f3tnORrCQ3RiBxUR9Vg==
X-CSE-MsgGUID: p8/yOdENRIGlfZO9hr/JXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="149058015"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 09:28:48 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 09:28:48 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 16 Jun 2025 09:28:48 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.74) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 09:28:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YrejaLnuMRSF9H/70pObZTOYbpSK/gmDM/+BvtCOhWhWo+e90RBGUIKz4jrxwYBbGGT0rfrkBlbENGuw4rQ0PtSiNDbhJBXle9rPo3hEC7YLLNfPkqrNIWhoHy3T6Pgzx+zdmA0lxzAPAU0BFKghSDgCbULQABytsCevIEOoutA0N5YLHdu+Fy8tIYL4CV+lHwuhw6jA7F9qvy/Fje0uJoA38YSCZAJ12ViCqVfpiNvJUzX4Bf70JWwOn96+Y3TZZrZgyse3O/k6vtCYcomzsvKvG66RuqL/KtzQCDmNrjW7sz0gLKUzhPKPnqFLl80IxuA7V3eHc9hm5cKncSF/Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zLaOdQqReIbtyjoBa1k9uNfHM4GfHb0yLFiGdAqoID4=;
 b=wKLLFBcHx2gVJ8zdjrj0hqinRp9iAw51EFr/qGvP0vcJQgQlMkHLknoBm+/tQ+ffrsi+NmueMup8QVCfEQEHfynLhIiGmnleiXnaTKJmwuzkAFMf5BT/Mo7EoULGkK0ZBSdccRwh3EGvxOJWzzJJNFJeOQTcra0WdoSIPMG2xxFEXeSFYA0OTmO/dt3AFeit4Yzcc8LH2pUMFx2Xo4U014buF3ye4aUx27It4yG0+0FWWmqDzc6Vo+HtWVV8X72AYauJtKuOO1d3/XLuF5NluJqJSCIcVljxq+8VZwQ3yH9KCbO2bewGbBMP8aX/rNYitUeWyeWTgaajjaX155QQuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by IA3PR11MB8988.namprd11.prod.outlook.com (2603:10b6:208:57d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Mon, 16 Jun
 2025 16:28:44 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%5]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 16:28:42 +0000
Date: Mon, 16 Jun 2025 19:28:37 +0300
From: Imre Deak <imre.deak@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v2 1/9] drm/dp: Add definitions for POST_LT_ADJ training
 sequence
Message-ID: <aFBGNcJoqdswLT8u@ideak-desk>
References: <20250224172645.15763-2-ville.syrjala@linux.intel.com>
 <20250227204232.15624-1-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250227204232.15624-1-ville.syrjala@linux.intel.com>
X-ClientProxiedBy: DB9PR06CA0005.eurprd06.prod.outlook.com
 (2603:10a6:10:1db::10) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|IA3PR11MB8988:EE_
X-MS-Office365-Filtering-Correlation-Id: 4211a452-128e-4cee-ee97-08ddacf2db8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Bm6cG6E97+9eyaHWdlFsdVchn6L0hxhqGup1TxW2FgFLJhcReRGe15lv+S?=
 =?iso-8859-1?Q?OgZe+YPe2lE0EQvH+WErJy0jiUdYg49/ZZW+pVFLS61PCbbV6l7B88Mg7Z?=
 =?iso-8859-1?Q?tMpUVaKZv0nIUAwaDW9XepYiu7NUnqSGQMyRPr5pFt38NQfUhe0aslEMpu?=
 =?iso-8859-1?Q?JXxF6LlSX60cbBwc8mTxgZ4wzMdpk6hk8sE/mmcVov8YhWoXj41aFcfLfr?=
 =?iso-8859-1?Q?sGeaEwKNgdLwsLvmT0LsYwkH6leT714jZ5zXuQTJBepvzH5pumCjU4ZaRh?=
 =?iso-8859-1?Q?vgrQRTCCaR18FIohBfSi/mRaK8gZXVyjIYaltfR6tQM4KfqRF5fP91t77O?=
 =?iso-8859-1?Q?nbJnuP2IstFV/jReYby7PDUaZeTj3E6j5seKiN4GUcOi1J82V6h3zYIUOr?=
 =?iso-8859-1?Q?NbSvUGyNmdrkcQ2huPhh9wR7opQ4tK6bQIBqMhqmEcle5pGJ9uF4uvZvfR?=
 =?iso-8859-1?Q?dt+5j9se0Lmo3vpbMYxvvLSWGtpYk+bsIOfPPk2MvNJNX4bGsJcZksR7pW?=
 =?iso-8859-1?Q?jSS8AOWKOB4gDHQzdukpJ8UErVkW5JLxykICN8yiBT3X8POxsjI9a4DZgM?=
 =?iso-8859-1?Q?zHLAXy6//ukO9JviyuEDF2t8bxK/eBej8LCrc7QQCCg9w2Bn1VOc8tZlRp?=
 =?iso-8859-1?Q?OZ3D/TbhfzXfxtugmssCMyI1ObC4sLYWgTXjS/ewZadQsX0EFFHwINR9YE?=
 =?iso-8859-1?Q?dJaGlwkLG1g4gO/UdbLMv1ROU3RVSgih26qSFwEynrAO24D04ARgMC4IgH?=
 =?iso-8859-1?Q?wrP76BYvtgLuadyccNGW1hbnNmSK3FqgSPkoOEK33bIsobkpqYdzqD3DA2?=
 =?iso-8859-1?Q?sLc90KXipn06p1QmEaoh8WaXP/u36cUmxEFVe11NB6fzjnqFWOzl1XFxPp?=
 =?iso-8859-1?Q?Q21/3KBuqRbwyOMrJiO/S8ryDeJhrHWNEPTnUWS031LqkwpZo/phgVoZ5p?=
 =?iso-8859-1?Q?6SV26UtGO+K1GACv4HP+aU7Rx4Z9ml/DXqCK7ANbEeYUpdB31sFUUy4fh1?=
 =?iso-8859-1?Q?G/QZVp6xmdpwYGZWTl5xY+g8BAbRJ4b3EA0SXa/RoKf1oF0MK2KlVrZtmh?=
 =?iso-8859-1?Q?oNFDWR4WjXmkEV7H+XcNDtsBS9gRkVWXUSq5zyb0CY+iM7X03XOvyppOrw?=
 =?iso-8859-1?Q?/rLmifNQIpl6yf524tphDcxz2XGx1fUqKvHfuV5KfjiQSegBPWG6CgRF5x?=
 =?iso-8859-1?Q?WSRS+ekRJ1S5QMUmnZke7dhy33VFVYDT5qjb6PhPCS7aUNJ21/sTS4UdPD?=
 =?iso-8859-1?Q?mOi62XC33QvIHh5Qi3ohdBEnnTPtaQQp6xDQRzBS2VZljf3zk0RZGb2pVN?=
 =?iso-8859-1?Q?jeedmOw2sna4nxZbdHSlrchJwGLHBjjwMBZRDcNI7pfH5yiGHoeBs4zymK?=
 =?iso-8859-1?Q?gFxg4+1jbBK2deGm7umDSlU431MSnYWr3zrk8AhTIdSmzOpM59KzZG73i+?=
 =?iso-8859-1?Q?c38j4gRgoltqVcRuUCn7+N7tkt4v/JtCkGRAOg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?zErj7pzO23zWLZm7Hu4AAJ72C7RN8p2K8tBaZBO+Rvfov99pTLlWvxuOAe?=
 =?iso-8859-1?Q?/9PUhQApNv/vI22MTE0PaNNOLEehGk+IdG7/ApaWC19oLhFgcm04Xd4DnI?=
 =?iso-8859-1?Q?2XzIGPiNHCQPpA3jecnwnhLctzosv522neNGddSdYhQRNS51oHGRPU/Bht?=
 =?iso-8859-1?Q?q7Jr5ChdS9DRNwSBR6MdwAe5ViF0ZVrvw+tehhr5eqqGaTlkyJUGzANXgM?=
 =?iso-8859-1?Q?IddWLnePvkLIExD6pVHMi7P4U1cwZYBEBQuLgVq0YwMozaBuNzDT1qlNFB?=
 =?iso-8859-1?Q?lGmbBQZ8Z23oAt2CysGeFaa0es/pTBKlL7c2aPyVY7jhiGsedqQcYIYwHi?=
 =?iso-8859-1?Q?Sjj3VMUc48WBiXvnpFYOdnKYJD0PJtqp7uSGX+VDVNOqxmm1ajUvyQfGQI?=
 =?iso-8859-1?Q?gIRmR6beiCVCcfo6DTluQDQWOipl86W9cKvW9TzNj+mB/kDXoPL+e1cggX?=
 =?iso-8859-1?Q?seuYW+06BxVbS+rquwlEV5blcUCAO2LTob2f5MQRvUQdxJo8l4NcLO2FrD?=
 =?iso-8859-1?Q?9mBnu4VRPKXFTegQaYPOTCLeQfY74Dq4pKS8uY6rG0PdtUMLktsFThyvxQ?=
 =?iso-8859-1?Q?UfRjlGeTv9c4rNXVqJuDPur6NY8SLWUksrQE1YZTXUlBVUqeQRkStz+RVz?=
 =?iso-8859-1?Q?ir1FWN1xymeGuxdlBgR9bQoTS70g9bZmTKTbpJ87woEnzKcJ2tKolxL/TA?=
 =?iso-8859-1?Q?pcwtOHj7E56ZRC5SrrpYaP1mCBTCqNGlosDYdNNVhB7u8QjsqdO4129a1v?=
 =?iso-8859-1?Q?Tylxs3hv1rmIksE4C35HcQv7U2IWONzb8YHjOnFErZaAn/mxA+sr+SzhQ/?=
 =?iso-8859-1?Q?FJpCBVl6UnONxbvGzyordaQVOS68EGxs/hwmHfCha3w0f1CCmHljdVwPzq?=
 =?iso-8859-1?Q?zu9OJbXbzmwKhvJ6zsGjnys7UARF+4bf6q4zTy6avV7JpbXh6C238tWLJF?=
 =?iso-8859-1?Q?MzNKKLmEVG5uGqbrfiEZnceKq5I4fKJex+l/QkBvtolfL1zq78BfLBmp9v?=
 =?iso-8859-1?Q?JYzyHHhl8gw7sa90onDyMgfMjTQ20hHbM/LTtBnLddBlArsIgFGuYCxT4e?=
 =?iso-8859-1?Q?B4Wq1B8+PVaxXsBzGM/AERS+kqoBlfN4wBEJWZT8iklCQRbb6coITNe6C/?=
 =?iso-8859-1?Q?gJ/kl32VQCRDVH9S07tdOW7UeFNqL64lob9YsEMuOlIMPx98Qui86O0ryw?=
 =?iso-8859-1?Q?E2HpUz6aNQ6AwSgspYud/fcSMgy6AAVk1AFKbCvt3sPpKvvkPeE0iclfPd?=
 =?iso-8859-1?Q?jOfBh2eV4sf2NMtzzax1C16yl/C9gAv/5AWZooYr5n2s1oHKMFbqAqeOY1?=
 =?iso-8859-1?Q?UKdLoG/Peq2HaCXAYYIRGAIuYQjMEiXIg1b1tRetyLyIL3JBo3RKD4uI9/?=
 =?iso-8859-1?Q?oZoAAdimDeFxTQ1wjoPKZcChw86iSNvtWy/yJI6uEkQwNZOV+wq7VeWWSp?=
 =?iso-8859-1?Q?gvrZz/CrKRWmzzebC9/0B87s4Fgz04XMOLuRI6ZQvaZl1B01EEYE+Lt1wB?=
 =?iso-8859-1?Q?vizYtabq+WOBTNnz/O1fAmaKqGu0bE6EYfDzkLt3iUTQpU5EdbyY7Relv6?=
 =?iso-8859-1?Q?dZJrnc4bgE7a9FKEFS7GJSe/SKBsItH8XAPoE/oVlA7Re9RHkdYzZInJ00?=
 =?iso-8859-1?Q?mbcUghMVgpjFSKaLK+aS9XjCcWwTA7Zsp4?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4211a452-128e-4cee-ee97-08ddacf2db8c
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 16:28:42.3554 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dH+wEh2vOuNploWRd4T5AByMv2H/lyhkRA3nF9+UrDVz7dGLfjDM7rW4XOt91ubr2TWX46MhHlL8uATyDDaH3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB8988
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
Reply-To: imre.deak@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 27, 2025 at 10:42:32PM +0200, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Add the bit definitions needed for POST_LT_ADJ sequence.
> 
> v2: DP_POST_LT_ADJ_REQ_IN_PROGRESS is bit 1 not 5 (Jani)
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>  include/drm/display/drm_dp.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
> index c413ef68f9a3..e2d2ae573d8b 100644
> --- a/include/drm/display/drm_dp.h
> +++ b/include/drm/display/drm_dp.h
> @@ -115,6 +115,7 @@
>  
>  #define DP_MAX_LANE_COUNT                   0x002
>  # define DP_MAX_LANE_COUNT_MASK		    0x1f
> +# define DP_POST_LT_ADJ_REQ_SUPPORTED	    (1 << 5) /* 1.3 */
>  # define DP_TPS3_SUPPORTED		    (1 << 6) /* 1.2 */
>  # define DP_ENHANCED_FRAME_CAP		    (1 << 7)
>  
> @@ -571,6 +572,7 @@
>  
>  #define DP_LANE_COUNT_SET	            0x101
>  # define DP_LANE_COUNT_MASK		    0x0f
> +# define DP_POST_LT_ADJ_REQ_GRANTED         (1 << 5) /* 1.3 */
>  # define DP_LANE_COUNT_ENHANCED_FRAME_EN    (1 << 7)
>  
>  #define DP_TRAINING_PATTERN_SET	            0x102
> @@ -788,6 +790,7 @@
>  
>  #define DP_LANE_ALIGN_STATUS_UPDATED                    0x204
>  #define  DP_INTERLANE_ALIGN_DONE                        (1 << 0)
> +#define  DP_POST_LT_ADJ_REQ_IN_PROGRESS                 (1 << 1) /* 1.3 */

DP2.1a also uses this flag as
"LANE_CNT_CONVERSION_FAILED" on UHBR, I guess that should be added
separately.

>  #define  DP_128B132B_DPRX_EQ_INTERLANE_ALIGN_DONE       (1 << 2) /* 2.0 E11 */
>  #define  DP_128B132B_DPRX_CDS_INTERLANE_ALIGN_DONE      (1 << 3) /* 2.0 E11 */
>  #define  DP_128B132B_LT_FAILED                          (1 << 4) /* 2.0 E11 */
> -- 
> 2.45.3
> 
