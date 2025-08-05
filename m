Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EABCB1B9CC
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 20:05:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AAB110E39A;
	Tue,  5 Aug 2025 18:05:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CCwLK/du";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D744E10E39A
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Aug 2025 18:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754417111; x=1785953111;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=eDvqXv9Z1mUIDWaqYXM0hu1b2PHxU9kBT6xKgZQ6tK8=;
 b=CCwLK/du0E9v/WXU98hQUeo4206OAPqW/7+sXMyeowu2ZPiYSRizvAF9
 VMY8AzHt5cJo0EMIZRt+bGIHooHEdpEtF94zzACZVLZZmfFADiXM18pAT
 Jb70rtcCC92nKypQugz/0AN8+MZcTGgX5Jdy0lnRcVpcxN9YlnBylRuf7
 3dk4nuIMq4CULDZTukUg5VeNiv0mB7ANESYPjuwwx/dDghzpyukcQcWZk
 sZdmf+vva1Pv+0PnQO7cDlLxMKG6yjTYxNAmHXdeCWLBAZ95LJ9MtxAgg
 Vjdj05BZkT614ugsXcn6pfpzKddpCy04cOnKAbkmxF56/vTpSlB2h7lyI A==;
X-CSE-ConnectionGUID: QO71PUUBRZ2r3ftR7dqFtA==
X-CSE-MsgGUID: VuPcyR8SQcKmRsup406GSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="56867936"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="56867936"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 11:04:29 -0700
X-CSE-ConnectionGUID: BmXdWXsSQxG70ebRLlC4Ug==
X-CSE-MsgGUID: +V9Vce5xQZWbjPu37+7tmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="168731425"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 11:04:29 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 5 Aug 2025 11:04:28 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 5 Aug 2025 11:04:28 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.48) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 5 Aug 2025 11:04:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dNrP9Cz/i7g997RxQE6hGLX13KAQK23zkwX0cdqUeTKWnSMSG0fqcGpWRW4/y3AaDiSR7D5pRCu+dBGt7ZXjQswO9u6nJF2zAfAvGIfBXPRdh2sP9A0g6vlybEbjVW2zZRw1LGy24MMisRi1eDS9UVsC777cIZp4lVCcAX/dCgCK3eZieiihLFykSAORy8GSDH8n0on9rhqrfCyNP9T+iT2Y1RxjHYpQNtRUu0CJd/73C2ajpEl2oxxMLkLiUzc4D/rjMzndMZF3JJOlNf3wai2S2Bu9K+r4o05VHYbFDlAprZn5IB3EXMDBo0juWA8ya/rCgYJ26bsowNpJZ9B5pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dzU2Y4CwFueqnroZXXzKJKYGLzvySCQSjk2g49kbvqI=;
 b=U6358xpBarISEJaXwEjUqos7JqqSaV6pi3PhcbEc46RCOoT8XF3htsc57/OYoxSNhiG4pUnYeV4f2w0QW10WnfhICQOOe4ruIRF2OLyjxVjKtB5d8KIJzEMbevfRpaG5SYupkv+Ni43da6YUct6UcbDBtnuHv25uYeCMI/JoGCovT2JcmF9A8S6bK5xSF3Hu6YIZema71s1Xt+R6hK+OD5xUZpbceGD0sy6dNIdaUQ7qgFsnEd12UfisSmQV1ShF7QYj8AcPHr4hWhw4ywMJZgzRI9L4Si9W2wsJApQ4Dj1VwUz3O7WbL4dzVAHCvhdLxRpmPgIpX1oQhuewRlR7ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by SJ0PR11MB5865.namprd11.prod.outlook.com (2603:10b6:a03:428::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.13; Tue, 5 Aug
 2025 18:04:25 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%5]) with mapi id 15.20.9009.013; Tue, 5 Aug 2025
 18:04:25 +0000
Date: Tue, 5 Aug 2025 21:04:16 +0300
From: Imre Deak <imre.deak@intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
CC: <dri-devel@lists.freedesktop.org>, Ville =?iso-8859-1?Q?Syrj=E4l=E4?=
 <ville.syrjala@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/3] drm/omap: Pass along the format info from
 .fb_create() to drm_helper_mode_fill_fb_struct()
Message-ID: <aJJHoI0ZTxUhQUgB@ideak-desk>
References: <20250728101603.243788-1-imre.deak@intel.com>
 <20250728101603.243788-2-imre.deak@intel.com>
 <aaa77500-c886-417f-b800-8c9cbbcc3285@ideasonboard.com>
 <aJIaDgAVN8_5TXYu@ideak-desk>
 <5eb7a110-d10d-40a5-963e-185b65e714f1@ideasonboard.com>
 <aJIv0fNF-OFPYwzu@ideak-desk>
 <4a55fd08-4e3c-49f3-b1b9-63d326e6e5f9@ideasonboard.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4a55fd08-4e3c-49f3-b1b9-63d326e6e5f9@ideasonboard.com>
X-ClientProxiedBy: DU7P189CA0025.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:552::32) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|SJ0PR11MB5865:EE_
X-MS-Office365-Filtering-Correlation-Id: a49135c0-dba7-412f-07c2-08ddd44a8314
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|376014|13003099007|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?U/e1HVGFWTHzDdcQr07lwoCVzSYYvEN5ag2qG7He0i/JF0yl5aeio3REnI?=
 =?iso-8859-1?Q?Sp9LwG/GtkHYOi8i7ubApW//RyiPlS7Sjt9wz9x4rJaCE37fkIDtA6t+sN?=
 =?iso-8859-1?Q?AsdW942lz2iKrWSToR9MH4JseAP81WrDDb+zkgldK9JIgeuxx+uy2iM0UM?=
 =?iso-8859-1?Q?Y3xoym8c2tZP8H47bwqdRSlhXGnHXZ/i3rhTXYprwLGe20vMB0Vj5XGSZx?=
 =?iso-8859-1?Q?hpoBMOK5k1MI9/2m4LEihk/1FlCCPkoqRIFGe+rF8wJDwfIgx+l5Y1DTZP?=
 =?iso-8859-1?Q?MtP3Uqvf5Um8UhQa9cQs02Rl+zdrpDqxQOZM/lEgX7sZeOcBqdDdochZ/2?=
 =?iso-8859-1?Q?fWvzC9A74F4TDKmmPp0GaTl80bc2VYLxFnHxFS2a4yijnogIyaBdJa+NP2?=
 =?iso-8859-1?Q?LgSB8Xshj/78uzPhmTjDP6QKpkjW6+3rnjmVpxiUV7IqQJQnqP8SmGJMY7?=
 =?iso-8859-1?Q?5u9qQIqK4be2sPaqCwqpnedejg3aVl6W6YJwhf2DzrOy8UeOk7Cjhev2bE?=
 =?iso-8859-1?Q?yVzNvQ93LLPYP5ueWWST7XAt9jlbddQ2V+mUy0JCyivs8JyLv6yzcrUygh?=
 =?iso-8859-1?Q?fcY6BUBxv/ao+G5CY6jHgXzDF2o/hrUN2URwPgu61BJX185saEK47lGKdZ?=
 =?iso-8859-1?Q?+QtwZXg82uTj6IPy38XbOREbuSrkJ+Sg667VjARLU0ybKPBwh3l72EUzjp?=
 =?iso-8859-1?Q?vk909M3bjfgItdd8T3fNpiu4Mu10FtNtgoAIRJ22B5h9Cl25RHdYMudPuj?=
 =?iso-8859-1?Q?+jJyVfQDzI2mjXq7CYdKcobKZSA+ZzuMMuCIumW/PDo+eDEyYNiCvvyAFH?=
 =?iso-8859-1?Q?ppBgdP8vCbmFzzFRbrfknmaNqgUd32jd0Q/t9kVEq0E4L2Md7UOSfzeUYR?=
 =?iso-8859-1?Q?POnoHlzEgfymhqArFJjsDN262wnMu14uFlwEytivgNipbwonHVCwI41eXR?=
 =?iso-8859-1?Q?CANCMD9fcF8JnR8oanbOeoF3FB8uDhwUbZsNK9A4esIA6DQZKpqC2AHPUE?=
 =?iso-8859-1?Q?jMFq1pROLabIb6E2/tyO3LGDbHKrMymwKHK+/v3EXePImlE8yPqyOw07K6?=
 =?iso-8859-1?Q?4f8SAw8cNfK+8cLhPHHmye2Ws7vcaV84X+S8jSkmnyEwxlKpv1k1OLIBYx?=
 =?iso-8859-1?Q?CPXm67zHzBWLlE4J8TZx8lWlmEafkTktIpgVcA/icTA9gVvVKLpDdW/R+2?=
 =?iso-8859-1?Q?CGiXd/RXQHdnO/QZvc5bRk+hsw3xuL62skroRG6bDE37sBv+BvpWaLJCBI?=
 =?iso-8859-1?Q?LGqp6SzDxZ5leiJL7dMbBWSLt6gdFM/jtUZNQxOBPIpEe/qbHZQui5YC6V?=
 =?iso-8859-1?Q?EHd4myEAx4f+HjVb2LqqQdPpm7DT2CzcPA91RVB3qkxepT4NUp87CZOzXk?=
 =?iso-8859-1?Q?YMDaf4BgS/gBON+sBF+UglqYOalSgomjZhliiPTbZRLYRh2ggV6jF3GyIv?=
 =?iso-8859-1?Q?o9X9XHMgRHzcsLcAO/FmdtbeF52wjyN8hfYC+9/SUfuKnllI+sDHr1VUlE?=
 =?iso-8859-1?Q?I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(13003099007)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Sh1IjiOfC7zyE8Sqp66BvTYv32IAmw+opANTCcs5/SN84lUZkTr/Eucohn?=
 =?iso-8859-1?Q?qvGTjYBKbA8L+9bfX6Cs+4pcCqyT+JevCbMjsllSKfYuAEa70Xcdl9kTKl?=
 =?iso-8859-1?Q?w8H6O67D62NZcv1gXdlfwEannQJwvhT0z1rG2r+wJBLC/VpIZJ3aYOecGN?=
 =?iso-8859-1?Q?uujf0Ap7qnnDD6S+QC0roEvBhMgqveW8cOA5sd1TuMOa+H7cWeEZAb/P9x?=
 =?iso-8859-1?Q?LD0wogrwen2KrPxb7hwxqiGOj52NpA86ARQPK8W3acxJ3LSjL/Jar/Z3tH?=
 =?iso-8859-1?Q?MTMAjQH+QtoKRtp6lb6OmaC2LLakq988ksPVFIImgHAao5hoc3VjulWFjF?=
 =?iso-8859-1?Q?vESVs0K06x+isNvGuKPjZFo3nf5iDoWuIxkH0ikZSC4Vplwkh/dgFEyNRf?=
 =?iso-8859-1?Q?PKiNh2/X5wJs/saaO9YIWmkp7cMzMKmzyigMdpvRLli1504DVLzQ2pG8j/?=
 =?iso-8859-1?Q?UDH8LFs0/RCpKJY1rpQLxPwdegEA7g/EGD0Piw0q625wgwM3VwOsk4V06K?=
 =?iso-8859-1?Q?7ApxWCwmL3ZdtQUyekvt0Ig5jJhkS/9I/oVjaKffLzoX8cvpyEPeAGFToH?=
 =?iso-8859-1?Q?1kF9RVtIQD6ilSU09iT3JaxvxKlfVl4yHw4iZhuysgXw9vmQRPtzMe3AuV?=
 =?iso-8859-1?Q?lc/5vSKphSCeZFvgeV03sEP//sEFJssgeDfdBlvLP7mxowr0zcYto9HCH3?=
 =?iso-8859-1?Q?rkfhI3FdaLVHXPu4svynSybzPQMTOxGLhLeMT+I5fhcZPce5n7bRxCLJmo?=
 =?iso-8859-1?Q?E0K+/TP6Fa12QHpLJIZevN5izJvESK1a9/Cot4/p3dgMN+aqrmYYWOo3PQ?=
 =?iso-8859-1?Q?/c7V4Z4BfjogHzCeElo+IijtYvjwAuALPHdAEHHOGyO/4HR03meTix0nsf?=
 =?iso-8859-1?Q?0IUcQgwzehJNZM4cczdoIor326I7/L/n4ElFZoZL6tyN1QJkJfg20c8vmm?=
 =?iso-8859-1?Q?zUZ8oAhwxqfhNLXn+pY6XCGvot9RGAaIH3dCe/xYSJJ2DjJoG1L1mi9CHN?=
 =?iso-8859-1?Q?QpbufXkGO0vIYnekNkAJ9wq20RJvSyFNFru+eG90ZMapi4CRk63c71o54n?=
 =?iso-8859-1?Q?4q4aqUCGQFjrpSVqAUDquutsXwIKvSI26Nn0UhjLgAd4/Fa/W5fhHLhbaY?=
 =?iso-8859-1?Q?iRerr+BVKdP0lbU4SA9FW68WrtytR3Ez6YVZc5Jd1w0b1AvNYad9UOPC9s?=
 =?iso-8859-1?Q?SlmTw42HXLNU+d11VBRF67TiyaH835NxEu3mvgNxQUt3b1vPIL8l+PQy1p?=
 =?iso-8859-1?Q?mAklNX/+bSG54G0KDAjA23d6qIsRmiOq6icRfBwqA471TyvL+PmtGn8SKu?=
 =?iso-8859-1?Q?d9+7rWTJ0NeTxP2/K6c8EXkqnRJERZk21PP0OjtLWS92embfInXm/mjeTI?=
 =?iso-8859-1?Q?/KyIs0WElTa09ocV0YRpAD5ZobALAUY2lqX8qsUEdfSFW2rxsVt3UPw8XN?=
 =?iso-8859-1?Q?f4FLS47+HczoIVMpoZXbMV8mbzWY/SIM1ChFYZ9jQNRu4FFSjN+fSEDc/W?=
 =?iso-8859-1?Q?ktUa69vVmnEhBjgWwRrYHILDgtbIZlepdGkI9pkCy+AXXLvpdZx6b5An0b?=
 =?iso-8859-1?Q?X96JeN9CudpgvM7ZKp4tD62NZCF/D78YAelV5od0VznFcfZgOphvxYejXO?=
 =?iso-8859-1?Q?kvQ6TVnsmXlb98lqXTBwHr7iv96HVqjxpYWxkLFTXQzSgipwKvc/tLJO2z?=
 =?iso-8859-1?Q?C7qvGTBAL5tvV01M9C35Mv6kF4XiQ4H+2VNZS5E9?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a49135c0-dba7-412f-07c2-08ddd44a8314
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 18:04:24.9597 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V8C6brYyq6AxtdgTPaFyxRYkkmCL5Px1GQawykeb8U/cDg/Zj/p7GUoSFJ3c3CH3ofwi5ew9k5nauPZqwA8o5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5865
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

On Tue, Aug 05, 2025 at 07:56:50PM +0300, Tomi Valkeinen wrote:
> Hi,
> 
> On 05/08/2025 19:22, Imre Deak wrote:
> > On Tue, Aug 05, 2025 at 06:43:04PM +0300, Tomi Valkeinen wrote:
> >> Hi,
> >>
> >> On 05/08/2025 17:49, Imre Deak wrote:
> >>> Hi Tomi,
> >>>
> >>> On Tue, Aug 05, 2025 at 02:53:36PM +0300, Tomi Valkeinen wrote:
> >>>> Hi Imre,
> >>>>
> >>>> On 28/07/2025 13:16, Imre Deak wrote:
> >>>>> Plumb the format info from .fb_create() all the way to
> >>>>> drm_helper_mode_fill_fb_struct() to avoid the redundant
> >>>>> lookup.
> >>>>>
> >>>>> For the fbdev case a manual drm_get_format_info() lookup
> >>>>> is needed.
> >>>>>
> >>>>> The patch is based on the driver parts of the patchset at Link:
> >>>>> below, which missed converting the omap driver.
> >>>>>
> >>>>> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >>>>> Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> >>>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> >>>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> >>>>> Cc: Maxime Ripard <mripard@kernel.org>
> >>>>> Fixes: 41ab92d35ccd ("drm: Make passing of format info to drm_helper_mode_fill_fb_struct() mandatory")
> >>>>> Reported-by: Mark Brown <broonie@kernel.org>
> >>>>> Closes: https://lore.kernel.org/all/98b3a62c-91ff-4f91-a58b-e1265f84180b@sirena.org.uk
> >>>>> Link: https://lore.kernel.org/all/20250701090722.13645-1-ville.syrjala@linux.intel.com
> >>>>> Signed-off-by: Imre Deak <imre.deak@intel.com>
> >>>>> ---
> >>>>>  drivers/gpu/drm/omapdrm/omap_fb.c    | 23 ++++++++++-------------
> >>>>>  drivers/gpu/drm/omapdrm/omap_fb.h    |  2 ++
> >>>>>  drivers/gpu/drm/omapdrm/omap_fbdev.c |  5 ++++-
> >>>>>  3 files changed, 16 insertions(+), 14 deletions(-)
> >>>>>
> >>>>> diff --git a/drivers/gpu/drm/omapdrm/omap_fb.c b/drivers/gpu/drm/omapdrm/omap_fb.c
> >>>>> index 30c81e2e5d6b3..bb3105556f193 100644
> >>>>> --- a/drivers/gpu/drm/omapdrm/omap_fb.c
> >>>>> +++ b/drivers/gpu/drm/omapdrm/omap_fb.c
> >>>>> @@ -351,7 +351,7 @@ struct drm_framebuffer *omap_framebuffer_create(struct drm_device *dev,
> >>>>>  		}
> >>>>>  	}
> >>>>>  
> >>>>> -	fb = omap_framebuffer_init(dev, mode_cmd, bos);
> >>>>> +	fb = omap_framebuffer_init(dev, info, mode_cmd, bos);
> >>>>>  	if (IS_ERR(fb))
> >>>>>  		goto error;
> >>>>>  
> >>>>> @@ -365,9 +365,9 @@ struct drm_framebuffer *omap_framebuffer_create(struct drm_device *dev,
> >>>>>  }
> >>>>>  
> >>>>>  struct drm_framebuffer *omap_framebuffer_init(struct drm_device *dev,
> >>>>> +		const struct drm_format_info *info,
> >>>>>  		const struct drm_mode_fb_cmd2 *mode_cmd, struct drm_gem_object **bos)
> >>>>>  {
> >>>>> -	const struct drm_format_info *format = NULL;
> >>>>>  	struct omap_framebuffer *omap_fb = NULL;
> >>>>>  	struct drm_framebuffer *fb = NULL;
> >>>>>  	unsigned int pitch = mode_cmd->pitches[0];
> >>>>> @@ -377,15 +377,12 @@ struct drm_framebuffer *omap_framebuffer_init(struct drm_device *dev,
> >>>>>  			dev, mode_cmd, mode_cmd->width, mode_cmd->height,
> >>>>>  			(char *)&mode_cmd->pixel_format);
> >>>>>  
> >>>>> -	format = drm_get_format_info(dev, mode_cmd->pixel_format,
> >>>>> -				     mode_cmd->modifier[0]);
> >>>>> -
> >>>>>  	for (i = 0; i < ARRAY_SIZE(formats); i++) {
> >>>>>  		if (formats[i] == mode_cmd->pixel_format)
> >>>>>  			break;
> >>>>>  	}
> >>>>>  
> >>>>> -	if (!format || i == ARRAY_SIZE(formats)) {
> >>>>> +	if (i == ARRAY_SIZE(formats)) {
> >>>>>  		dev_dbg(dev->dev, "unsupported pixel format: %4.4s\n",
> >>>>>  			(char *)&mode_cmd->pixel_format);
> >>>>>  		ret = -EINVAL;
> >>>>> @@ -399,7 +396,7 @@ struct drm_framebuffer *omap_framebuffer_init(struct drm_device *dev,
> >>>>>  	}
> >>>>>  
> >>>>>  	fb = &omap_fb->base;
> >>>>> -	omap_fb->format = format;
> >>>>> +	omap_fb->format = info;
> >>>>>  	mutex_init(&omap_fb->lock);
> >>>>>  
> >>>>>  	/*
> >>>>> @@ -407,23 +404,23 @@ struct drm_framebuffer *omap_framebuffer_init(struct drm_device *dev,
> >>>>>  	 * that the two planes of multiplane formats need the same number of
> >>>>>  	 * bytes per pixel.
> >>>>>  	 */
> >>>>> -	if (format->num_planes == 2 && pitch != mode_cmd->pitches[1]) {
> >>>>> +	if (info->num_planes == 2 && pitch != mode_cmd->pitches[1]) {
> >>>>>  		dev_dbg(dev->dev, "pitches differ between planes 0 and 1\n");
> >>>>>  		ret = -EINVAL;
> >>>>>  		goto fail;
> >>>>>  	}
> >>>>>  
> >>>>> -	if (pitch % format->cpp[0]) {
> >>>>> +	if (pitch % info->cpp[0]) {
> >>>>>  		dev_dbg(dev->dev,
> >>>>>  			"buffer pitch (%u bytes) is not a multiple of pixel size (%u bytes)\n",
> >>>>> -			pitch, format->cpp[0]);
> >>>>> +			pitch, info->cpp[0]);
> >>>>>  		ret = -EINVAL;
> >>>>>  		goto fail;
> >>>>>  	}
> >>>>>  
> >>>>> -	for (i = 0; i < format->num_planes; i++) {
> >>>>> +	for (i = 0; i < info->num_planes; i++) {
> >>>>>  		struct plane *plane = &omap_fb->planes[i];
> >>>>> -		unsigned int vsub = i == 0 ? 1 : format->vsub;
> >>>>> +		unsigned int vsub = i == 0 ? 1 : info->vsub;
> >>>>>  		unsigned int size;
> >>>>>  
> >>>>>  		size = pitch * mode_cmd->height / vsub;
> >>>>> @@ -440,7 +437,7 @@ struct drm_framebuffer *omap_framebuffer_init(struct drm_device *dev,
> >>>>>  		plane->dma_addr  = 0;
> >>>>>  	}
> >>>>>  
> >>>>> -	drm_helper_mode_fill_fb_struct(dev, fb, NULL, mode_cmd);
> >>>>> +	drm_helper_mode_fill_fb_struct(dev, fb, info, mode_cmd);
> >>>>
> >>>> Isn't the fix really a one-liner, just passing "format" here instead of
> >>>> NULL?
> >>>
> >>> That would fix the issue of fb->format being initialized to NULL yes.
> >>>
> >>> However, I think the change should be in sync with the conversion of the
> >>> rest of the drivers in patchset [1]. IOW, what this patch is meant to
> >>> fix is that [1] missed converting the OMAP driver similarly to the other
> >>> drivers.
> >>>
> >>> I think the change is equivalent to the above one-liner you suggest with
> >>> the following differences:
> >>>
> >>> - omap_framebuffer_init() uses the drm_format_info passed down from either
> >>>   drm_internal_framebuffer_create(), or omap_fbdev_driver_fbdev_probe().
> >>>   In both cases the passed down format info matches what
> >>>   omap_framebuffer_init() would look up again.
> >>>
> >>> - Skip the format == NULL check. format can't be NULL in any case, since
> >>>   that would have emitted a WARN already in drm_get_format_info() ->
> >>>   drm_format_info().
> >>>
> >>> [1] https://lore.kernel.org/all/20250701090722.13645-1-ville.syrjala@linux.intel.com
> >>
> >> Yep, I have no issue with the patch as such. But if it's a fix, going
> >> into an rc, I think it's better if it's as small as possible, and do the
> >> cleanups/refactorings as a non-fix later.
> >>
> >> The patch description here sounds more like it's just refactoring the
> >> code a bit, but if I understand correctly, it's fixing an issue that
> >> cause a WARN?
> > 
> > Yes, the patch description should've mentioned that it fixes the
> > !fb->format WARN in drm_framebuffer_init() and the resulting failure to
> > create the framebuffer for fbdev and other FB users. I will add this.
> > 
> >> So... Either we could 1) split the patch, have the WARN fix as a fix
> >> patch to the current rc, and the rest later in the next merge window, or
> >> 2) if you want to keep this as a single patch, I think it makes sense to
> >> change the subject and description to highlight the fix aspect.
> > 
> > Yes, the patch should go to 6.17-rc1, but I would prefer 2) above, since
> > patchset [1] requiring it was also added in the same -rc1 and this patch
> > has been also tested at least by the bug reporter.
> > 
> >> I think my comments apply to all patches in this series, as they're
> >> essentially doing the same thing...
> > 
> > I can also amend the commit log for the other patches according to the
> > above.
> 
> Alright. In any case, I don't think any of my concerns are big, but I
> wouldn't mind a clarification in the description. If you'll be pushing
> all these together:
> 
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Thanks.

> If you want me to merge the omap one separately, just say so.

I sent now the updated [1], which can be merged to drm-misc-next-fixes,
but I'm not sure if there's still a pull request to v6.17-rc1 from that.
So waiting now a suggestion on that.

[1] https://lore.kernel.org/all/20250805175752.690504-1-imre.deak@intel.com

> 
>  Tomi
> 
