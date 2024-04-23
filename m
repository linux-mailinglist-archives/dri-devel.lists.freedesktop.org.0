Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D750E8AF5BE
	for <lists+dri-devel@lfdr.de>; Tue, 23 Apr 2024 19:42:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19064113553;
	Tue, 23 Apr 2024 17:42:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h3JGnP2T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BFAA11354B;
 Tue, 23 Apr 2024 17:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713894156; x=1745430156;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=IsbpRYbP6StU5mUhsNYQllpjhhdP5Kcm4lmDyJT368c=;
 b=h3JGnP2TSP83evzNkgqY3D36zBfW2YE0UouZY87my/cYdsX8ZNGIjicS
 hrh0vcftaVqMgG5i7x8o3iSEfS2gZP3iv0NbBQEJfnTRj2rVLXyIdyE9V
 ffv3SerIfVW1K6zZ3sz5gKEh7Xx6l5LTwDSXK/r6NacbO8pBT6wWrMEdU
 WwKq4G3xzsFIetY49fRy3uZZdzH+qClVDEyKXTtVMR/0RpnT6sgAI+3SG
 3xUY1BNxYVUihxBgzQNxSg6cBRIrhqOrOQCrQQb4wRBzYCHCveuzxL0IQ
 Kg1p28NNtZehazcEkAke26gGv2zSWeh6wyvFAJxWOn+dWLFBNfwt6PENm A==;
X-CSE-ConnectionGUID: Fbx6wHpQTkSB0i+MIv98bg==
X-CSE-MsgGUID: t6iIQAbzSoOhNQ+a/t/nfA==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="34896965"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="34896965"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 10:42:35 -0700
X-CSE-ConnectionGUID: XezPVd86TxKNTrHJFr+5WA==
X-CSE-MsgGUID: nicI17WiT7uxkhB7CTEDOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="28927347"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Apr 2024 10:42:34 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 10:42:34 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Apr 2024 10:42:34 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Apr 2024 10:42:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dShLIw1LHrwY+xhqRaMDfSKxYgMrFD/Abd/RCgZYlm5LF8+Ej+HGkapvL6Iw2NwxMzo3ZEvS6+gI9N+/V52i07OE+6ItjW2bBcWJc8eQbMzmhCa6R2lw+vSgrHFwrGXb4JlnOTr9mmi/T90/x77+tu0m4ktBa0LL72fVIW49yB+rNwpkXVQR3MM1y6/+1heNyTDaiznmRA6oXoV11t1Ov24wn2oBFZuLLaxPafEWuiOovJy+cV6vmwmbxh3UguRL1g6gr9yVP+3atAo7TkQmrYJhWzsXVEFpgyse2uQ8hIypMLVcjtXT7CCv/txzc77q4AK4GezBUnBYYs3bs4gmWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MWMuQGVllx5iJx0Y4kO4MQGuZzlWumSplZuLOWBqGM8=;
 b=V0fzJfAjazlJbCHLM61Gas3Xju/L6sNwRW8hFU/AMXJMtSP++TPuioPRxQquQU0s5Ky/brSeFQfyG1sEvNLLRISH/DV+cTQeA2M8/8TUT9aUTtTWxMNeY8iX47mt2JZFzSWlVOuvVcKtixRis6xngN8deFqL0GVe5HVVskiWajrh3lvCGCl1k1oUUlmy4w2x3O2T9hjL+Yx+LfQLFJ0pcjgCxmFisYrTldyY3AU1Wb+Dlb4v5AFtEnPQKwhHUf+6FJJ/Rd3fCHTdl/9wos4MIrhjM5i+B+8Ug06Nb83LK22dWLyRjvCJQ/nrTckD4GEzhgYg4RN51zQt4pIPjmT0Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS0PR11MB7441.namprd11.prod.outlook.com (2603:10b6:8:141::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.19; Tue, 23 Apr
 2024 17:42:27 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7519.018; Tue, 23 Apr 2024
 17:42:27 +0000
Date: Tue, 23 Apr 2024 13:42:22 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
CC: <dri-devel@lists.freedesktop.org>, <daniel@ffwll.ch>,
 <maarten.lankhorst@linux.intel.com>, <airlied@gmail.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>,
 <intel-xe@lists.freedesktop.org>, Thomas Hellstr_m
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v3 1/4] drm: add devm release action
Message-ID: <Zify_rd1yV6ki7oR@intel.com>
References: <20240422065756.294679-1-aravind.iddamsetty@linux.intel.com>
 <20240422065756.294679-2-aravind.iddamsetty@linux.intel.com>
 <ZibOmWPr3pZXdoNM@intel.com>
 <c899f2a5-e4f8-421f-ba87-8e8c15a6f665@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c899f2a5-e4f8-421f-ba87-8e8c15a6f665@linux.intel.com>
X-ClientProxiedBy: SJ0PR05CA0177.namprd05.prod.outlook.com
 (2603:10b6:a03:339::32) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS0PR11MB7441:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fc2676b-7048-4a66-7795-08dc63bcbdae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?MNgEc2ATKJ4OHaUZj4dWMA0Qf3YbR6nK3f1QvY4RQe7Mhjc8y00DW2PkM6?=
 =?iso-8859-1?Q?h/1YoGybdyYLFzw9cZtL35uOfm11dDWfLXjUvQnnknN1prsU5IqXKYOKF/?=
 =?iso-8859-1?Q?c4psdMjxuLasvOtsnRnb4VnYEp0QMUaEZhtYAVqM9/p0u69iXYB77YCw/E?=
 =?iso-8859-1?Q?pmCx2k/5gA7H0KI7I64HJ66sv/Q9VKCnxbWXTc4jLpHt55jhSdZKe1oRIm?=
 =?iso-8859-1?Q?sYtP95tT+cD6LuMsdENYrMu7UcHtlrJaWVXerbrIIum/S2pP3cVqr9wFQ7?=
 =?iso-8859-1?Q?1q7jl5pskMeH+unmITpSuG4/p13r81dyR6fX1N3PuHD71mGAqm7XSl4OnW?=
 =?iso-8859-1?Q?Uj9r0jUYYBQGGXzIbOclxLE7N+6RmLh98M611+W4Ru2UKbzukiBMiW30tK?=
 =?iso-8859-1?Q?0BkyYMMcoryCtOtwWvhl1Br0ltXtrbKrHeLfZEIbX8bRH+J1CThsHFmEWg?=
 =?iso-8859-1?Q?phlwX2HBBcopWeNHixAmpzigAY46AqT17Y3hoTyl0JpuQpDe/JdwEmoK2x?=
 =?iso-8859-1?Q?E4fUGamMMtgqKUWzx/Pu5Ln0M1SM1lzU5+sJb1y2dTP7keaBDYkWkS0wun?=
 =?iso-8859-1?Q?e8sNTQHdlQ0sHkhSPwwW9g52e7nJ7kglt3zZT8+3dhFj2u3pcTIzhv0TBO?=
 =?iso-8859-1?Q?byDh3KnIJEnguxgnLkdn0civm1wYR5X182Me4A6kAKHJ4lPjV8laMIRDFG?=
 =?iso-8859-1?Q?5euBjFRECajN5zJrVB4ACmS+Jl4f1xq0cogNYYluSZ0ni/rZsUloK3GO7I?=
 =?iso-8859-1?Q?jHuSXFsJc0m1eG4p9jqDsUrz/nCQE0rExV02pgB6e59GIf3xxtwiw/k5RW?=
 =?iso-8859-1?Q?xG1EKvV6bHRqyW5psgtgEjJZhOxxaLqgC5u5iPv7fAo3woT9c6aYSkqeD2?=
 =?iso-8859-1?Q?6NU6/JchSqjqfpDMqwF+cs/EN0WyJ37GbEluu80ZbGDXg4vXJ3H3B2l/hL?=
 =?iso-8859-1?Q?FUUVAyGu+453/pWBdwpbjbvltLbCsywb6y8imgygjZUms5VEoAL3lbrViC?=
 =?iso-8859-1?Q?UChhgL84NWUpv/SKF7fmTKjhOa8jdUecrWaC3zuKkmLn2CexOO2H/0DOwo?=
 =?iso-8859-1?Q?vnrTVR2I7YmSpl9eyai3lYIFlgERyAs4sSxD5R7DXV9B5bnFwTUX3KJROp?=
 =?iso-8859-1?Q?isCb2G43kp8sjArDPrRaTjbKJZUoqj3ecs+XgebXt/sqpyarz3uEPAEt44?=
 =?iso-8859-1?Q?POtZbhx7txNPjAhwVY26E7i5LpOVa7YaeNzIsSs/7XG8jmbwcTN3DFzYUK?=
 =?iso-8859-1?Q?/E3pjAlEQBR3Ir0AyhNYGP63wjG5F/1pemZJ9XZt4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?dsOychzWAIgb7gIflFrFlnS/fCzW1rl/ldxzyauF6xv8qs5+czeNPSU0mX?=
 =?iso-8859-1?Q?t2ig+oLXr8B8Kp6Wb0Cw+BpyUCOOWU+GaWOGUvx0fMuR76Wf5bDOPULyDS?=
 =?iso-8859-1?Q?ui3Xd2agCTguE1TCMlRyTF1GfCle8g5K3wSmzq1sHBLmKRoQGlemHUmZ5G?=
 =?iso-8859-1?Q?53Vxe69d+2s8OlhxYcT7UnHnH0tMJmGeHy7BNOetsSrqbmVtQPGkq9Imz9?=
 =?iso-8859-1?Q?uSB3e8PMzAScpX5iwvO8i9zng+5thy7K1Ct2EvjRZgmbE/3bZJgx7vpVu4?=
 =?iso-8859-1?Q?4YrDjbp7LErLcIfH+WEAp1NF0W5a1qdRlTruVah+WeMa7lfzgectBuaziA?=
 =?iso-8859-1?Q?cGlxC7kB/PgMbDGlakAD+7uNSSC3pdZ6dXCLpT5bRDNTkgQHyscellm8Mw?=
 =?iso-8859-1?Q?Gps58qJg3Zg5eDyrABkhcWARuejjLHJAgMPP61VCdkdFIgxhRIFELNCAjN?=
 =?iso-8859-1?Q?1Y9MLk1oQDDUwHKGXy01BuzPlVqD9IgnBCUXGxKUH8jjT/HoOG1MQqofXO?=
 =?iso-8859-1?Q?X5Dq1+WQ1Flkk2xTpV+9k289os0dBCpvrnlh2UWH3eDmV/F9XfTcoAWR3a?=
 =?iso-8859-1?Q?SGFikN9WX9bKcGwmNb7YES3we+iSZwG1Aa/BgB5koCFMG787v1J8H3oa1k?=
 =?iso-8859-1?Q?VW43vkE3lHq2dIdsQ37ID7Pc5r+JEyxIlt3pmICntzobbz+W3gtk1We9M5?=
 =?iso-8859-1?Q?CukOjWDwDLvSlTXW74DHELIS8TXuZvBqQSnp2/Uxrw/uDbKoRAxJWhoABS?=
 =?iso-8859-1?Q?LO2Y1/L56T4v2PpAyxY8Yo6bs830KSgTI9t6LXtgQ4r3xX1r1O8fc7f+Xx?=
 =?iso-8859-1?Q?J1Z0H0akqOzJzx5Qm1iH+US00hOWAROi8FSsf6gWc9O7/PwhY3Holdw4fH?=
 =?iso-8859-1?Q?pAx5GzKcRjH+NU+L0P8CO5lKaOqyboZVqeYSTSiFsXbOAotqsmgEHMl5y8?=
 =?iso-8859-1?Q?I2v4rMq1JuQZnizb4SUDofY+3unWINLW9kNgPT6eMNaUHCGjm89E0Tby34?=
 =?iso-8859-1?Q?8MJbnULPdWnmcTLkZ+XCGAZAzlHVhYrR00m/U0S9MNgtOFGIjwPxU9LaUE?=
 =?iso-8859-1?Q?x3VKX96vEwl8ctkNMyhxaRyChBG5uKof/XIBZF5Z5CcExQzskkF8OH2wZG?=
 =?iso-8859-1?Q?vf81Q95a4fBtO2Le6LIv9MHcVrSNf+8DoYW+yNkB8AHTh6efU+mn+WWa6O?=
 =?iso-8859-1?Q?ZgfvslhrsRKh4G0HvHlzjowHbGmvwZiGyM5XeyRR8rW2o2cPyL/Ns5bcsi?=
 =?iso-8859-1?Q?oh4wOPTp+a+WgVVUE1HbehzQTQ9ohVfUcIRzusKzbIsW1LYO9z9j6DAVSc?=
 =?iso-8859-1?Q?78912SkWncVCaUlBMeHCTaNG3TWaZpGG2H2B1mWoS8qTL2Q7mnfCN1MVXX?=
 =?iso-8859-1?Q?LMVSd5wWKcJe1yw0JP21moSu9I+QoTjtIJ3zx0cauA/4+r/8/PO4NUTJkz?=
 =?iso-8859-1?Q?b7HeQgdCdFlTyb4BgvokFtAO+GumAoYt/T+Ik/Q7q5XkFMpbkiVr6zgPCr?=
 =?iso-8859-1?Q?EYF7qvRZkwObd6w4YVDzBRVaSUiokDVrJi9RwHOdAIeGCjy24c7qfXSxBg?=
 =?iso-8859-1?Q?hEXgJCpye5tAJuo2gextpKwBI74g/8X0RY1mfllIGkROfDjbrhBcfvTh4n?=
 =?iso-8859-1?Q?TacqmBbbFlkFUXuoxLI1dww7X8KWTsrZK0?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fc2676b-7048-4a66-7795-08dc63bcbdae
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2024 17:42:27.0414 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WdBbrYrlJjyr3FwKXYAyVg9n6Kg/LqvyTFRpYEaVbUpklVrnBol+/GVryCpKakluqHM/BZNuBhlAVaQ079XQYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7441
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

On Tue, Apr 23, 2024 at 02:25:06PM +0530, Aravind Iddamsetty wrote:
> 
> On 23/04/24 02:24, Rodrigo Vivi wrote:
> > On Mon, Apr 22, 2024 at 12:27:53PM +0530, Aravind Iddamsetty wrote:
> >> In scenarios where drm_dev_put is directly called by driver we want to
> >> release devm_drm_dev_init_release action associated with struct
> >> drm_device.
> >>
> >> v2: Directly expose the original function, instead of introducing a
> >> helper (Rodrigo)
> >>
> >> v3: add kernel-doc (Maxime Ripard)
> >>
> >> Cc: Maxime Ripard <mripard@kernel.org>
> >> Cc: Thomas Hellstr_m <thomas.hellstrom@linux.intel.com>
> >> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> >>
> > please avoid these empty lines here.... cc, rv-b, sign-offs, links,
> > etc are all in the same block.
> ok.
> >
> >> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> >> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
> >> ---
> >>  drivers/gpu/drm/drm_drv.c | 13 +++++++++++++
> >>  include/drm/drm_drv.h     |  2 ++
> >>  2 files changed, 15 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> >> index 243cacb3575c..9d0409165f1e 100644
> >> --- a/drivers/gpu/drm/drm_drv.c
> >> +++ b/drivers/gpu/drm/drm_drv.c
> >> @@ -714,6 +714,19 @@ static int devm_drm_dev_init(struct device *parent,
> >>  					devm_drm_dev_init_release, dev);
> >>  }
> >>  
> >> +/**
> >> + * devm_drm_dev_release_action - Call the final release action of the device
> > Seeing the doc here gave me a second thought....
> >
> > the original release should be renamed to _devm_drm_dev_release
> > and this should be called devm_drm_dev_release without the 'action' word.
> i believe, was suggested earlier to directly expose the main function, is 
> there any reason to have a __ version ?

No no, just ignore me. Just remove the '_action' and don't change the other.

I don't like exposing the a function with '__'. what would '__' that mean?
This is what I meant on the first comment.

Now, I believe that we don't need the '_action'. What does the 'action' mean?

the devm_drm_dev_release should be enough. But then I got confused and
I thought it would conflict with the original released function name.
But I misread it.

This also made me ask myself if we really should use 'devm' prefix there
as well.

> >
> >> + * @dev: DRM device
> >> + *
> >> + * In scenarios where drm_dev_put is directly called by driver we want to release
> >> + * devm_drm_dev_init_release action associated with struct drm_device.
> > But also, this made me more confusing on why this is needed.
> > Why can't we call put and get back?
> IIUC, the ownership of drm_dev_get is with devm_drm_dev_alloc
> and the release is tied to a devm action hence we needed this.

you are right, but it is just a refcount. you are putting that one
back on behalf of the init path, to force the refcount to 0, and
then grabbing it back on init behalf after the flr. So in the
end it is the same.

Then with this flow we also can check if we are really force the
disconnection of eveybody before we are ready to put the last
ref that would call the release fn.

but well, I'm just brainstorming some thoughts on possibilities
of a clear release without forcing that...  it would be good
to run some experiments to see if that is possible. if not,
then let's go with this forced one.

> 
> >
> > The next needs to make it clear on why we need to release in these
> > scenarios regarless of the number of counters. But do we really
> > want this?
> in our case post tFLR we need to reprobe the device, but the previousdrm instance
> is not destroyed with just calling pci_remove as it is tied to PDEV lifetime
> which is not destroyed hence we need to call the last release action ourself
> so that the final release is called.
> >
> > Can we block the flr if we have users? Perhaps this is the reason
> > that on my side the flr was not that clean? beucase I had display
> > so I had clients connected?
> the display side error is due to power wells, post FLR the power wells are already
> disabled while we try to disable them from driver again it is throwing warnings.

so we probably need to tell display that we are going to be disabled.
probably the same patch that we need for d3cold:

https://lore.kernel.org/all/20240227183725.505699-3-rodrigo.vivi@intel.com/

> 
> Thanks,
> 
> Aravind.
> >
> >> + */
> >> +void devm_drm_dev_release_action(struct drm_device *dev)
> >> +{
> >> +	devm_release_action(dev->dev, devm_drm_dev_init_release, dev);
> >> +}
> >> +EXPORT_SYMBOL(devm_drm_dev_release_action);
> >> +
> >>  void *__devm_drm_dev_alloc(struct device *parent,
> >>  			   const struct drm_driver *driver,
> >>  			   size_t size, size_t offset)
> >> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> >> index 8878260d7529..fa9123684874 100644
> >> --- a/include/drm/drm_drv.h
> >> +++ b/include/drm/drm_drv.h
> >> @@ -444,6 +444,8 @@ struct drm_driver {
> >>  	const struct file_operations *fops;
> >>  };
> >>  
> >> +void devm_drm_dev_release_action(struct drm_device *dev);
> >> +
> >>  void *__devm_drm_dev_alloc(struct device *parent,
> >>  			   const struct drm_driver *driver,
> >>  			   size_t size, size_t offset);
> >> -- 
> >> 2.25.1
> >>
