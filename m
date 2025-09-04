Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0905FB448C8
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 23:48:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC05510E26C;
	Thu,  4 Sep 2025 21:48:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IfKWyaE6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 454C210E26C;
 Thu,  4 Sep 2025 21:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757022505; x=1788558505;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 in-reply-to:mime-version;
 bh=+CGDbe0dgZESqVyp8MO8EXHjG22CjsEmNaxN9oJO5/g=;
 b=IfKWyaE6zkL1rAXEl5Jcn538QYCcPn1nheYeXpMvzoJw5kQjqFZaSJvZ
 kjyCF+2c3g0mTHMgBZs0l3x3+puspjavQm4G7VGWQP0CMNWOdNKCVi8HM
 hOGIhnidXFyeL/WYyLGDwL1Y9BexgZlcisFYRnsbQbIakB0mED2Dp1WFb
 WNYSYEn75E1/XylRrJJBzyYZT8+aqbyo/Tlc8oYKhr+P6rk+uhd5YoNsF
 FrBgm7qBDkAG7xNMXSKQxKFpGelgbKP1MvIWf9qgQ7m7TMHIYyodKbbOt
 gR58cALGgDxBfTcbDzqxy+h24k+nzWWrjZ6z9ne42erYUrXC9rpMekika Q==;
X-CSE-ConnectionGUID: mTNecYTvR5+oRABmGZl6wA==
X-CSE-MsgGUID: VRXYFINJT/mUbF30N7IkAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59296436"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="59296436"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 14:48:24 -0700
X-CSE-ConnectionGUID: Wc2FnocJRWmGxNcHMYvQGw==
X-CSE-MsgGUID: 6p1mn0cQTg+zpGUEZ3zAYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,239,1751266800"; d="scan'208";a="176341332"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 14:48:22 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 4 Sep 2025 14:48:22 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 4 Sep 2025 14:48:21 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.71)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 4 Sep 2025 14:48:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YbF/0Vi0QIlR2ZFiT/SCTN5NQxn5CZlU4xo/yt0mUECtcnOOYfv+bb26994hazdppF1NcUxDZRBVFEKwOuSmXwYeK5sPm0dgBcjiqMEm1UU2vapJTeIJmwdMSGZd3khB15JY5EYPNb0hWQm4M6wpm+m6od4dR7HEN1UHb33lX7ONPxdgSZzHRji2UPOWkAAFpxQpIouKIP1J9ZdR9cGgOYoBTT39sf5YuMbnJ94pQzz1ESCPGJjRJTFE6Kg1NuoRTgzt7dkiRpPerPGDVdrSmq/d1udRoZNZEkK8bI0uoir++bC+4y0fzGwh33Rn5l7+ktu94EmaeWQpVIUgPhb2RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rBOU5GoPA8HnR5W9hJk+XE4+RTAI6l47skgqsmabmvU=;
 b=aypXk8fiFw/mtFYT9siRspuay+EDzrAJOva4/qKi71eOSRmIkTPCtXeorvoFoamULMMEZHHHOrZ33EKwkT2aJVGvaTnTWj2RoPt9md/YUF9VIlPB1x7WwPw4cPz4RnAfhHW+IWO894PfRP0OmCgFG7FMmIHbbpm+iYsH16rWEPCmJgkeKXOEGnmInJqPIFkF4O/xHCwrD/2k23urJuzASOVRHLmKCvzWUQSwoy3ixLqwmogBsixJagFkHtFMO7EK4KARBmkifI02Md1a5YuixdOCfDGTFDIASluC381O0RZhARsY6j8C9uos4sFZ9ibW4idX0mjY66lL2tNJX7jOQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by IA4PR11MB9153.namprd11.prod.outlook.com (2603:10b6:208:56c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Thu, 4 Sep
 2025 21:48:17 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%3]) with mapi id 15.20.9073.026; Thu, 4 Sep 2025
 21:48:17 +0000
Date: Fri, 5 Sep 2025 00:48:11 +0300
From: Imre Deak <imre.deak@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: <stable@vger.kernel.org>, <patches@lists.linux.dev>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, "Sasha
 Levin" <sashal@kernel.org>
Subject: Re: [PATCH 6.16 139/142] Revert "drm/dp: Change AUX DPCD probe
 address from DPCD_REV to LANE0_1_STATUS"
Message-ID: <aLoJG4Tq4nNwFLu6@ideak-desk>
References: <20250902131948.154194162@linuxfoundation.org>
 <20250902131953.603872091@linuxfoundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250902131953.603872091@linuxfoundation.org>
X-ClientProxiedBy: DB9PR06CA0001.eurprd06.prod.outlook.com
 (2603:10a6:10:1db::6) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|IA4PR11MB9153:EE_
X-MS-Office365-Filtering-Correlation-Id: 2168bd48-8eaa-4f8d-429a-08ddebfcc193
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|376014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6clFN1RimHSsq74LyR9NMWK5y6wMtDK0YV+nayJ+jh3hSKJV3xNgd04RS/6B?=
 =?us-ascii?Q?ML/V34AD6Kq7jG3X1iC5KUSytqOcQRWnHRzUrzXP8w3KM5oqsOTrqOSCZxyf?=
 =?us-ascii?Q?IY/reNhj1apd4p8A0B0fu6/dz19htOWkdfWFgU1IV6ZzDmnGqZ9/HdNeeX+a?=
 =?us-ascii?Q?lINbVcnCWODUTaN9K02xZeOzt1/ZsFHNtRWwgC1kTt1nnTtoR/9aUJdB8zOq?=
 =?us-ascii?Q?Bz8IM+8s44FmVc7uYT4JpqrVye6pt0I49EtK/Via2bba3b8x4gMs5Y+FypUp?=
 =?us-ascii?Q?OphwozOYSRQSda6NDfTHt7DEsFS1nqZgZnUvfxV2CziY23wfJDuS/p6Rtnkh?=
 =?us-ascii?Q?7qevZeGtT9XomIIfARxVmWmpye7FloPkaxDek4H5tbMvC4zpHPyqsyLsVw3Q?=
 =?us-ascii?Q?KVPyUVlfSRuPkMHY8t6eB5Fb5/lwR+xiz9hzag1RU+v4Mu6a/7W3o8EDozha?=
 =?us-ascii?Q?sH7Gi5vAU47S/fwwumM9oYzzdq+lE0ygCTgCFxwEC81Q8qOLiUbAwlknazuN?=
 =?us-ascii?Q?NnJ6eEdsQ3URUuCfAhucIDnwJo7MQDlDQnhVYbgL0aploHaoZ3c5B8x0AyQ+?=
 =?us-ascii?Q?oVq7UfP3tP0zqGYzxVfF5/9MnUBQPd4E3gBbX+0osfU/LFy/MdoBTja7N8eH?=
 =?us-ascii?Q?j3UYJdB/vIw1RMrWCdJUI9VLVI0I8Nk1QT43qXtqopaAAgCP7rlL2x9TBrmY?=
 =?us-ascii?Q?Ot5rZiRTkTD3HLu9TTmmzUeVzBfJjwax96zZWr6LMgjhu0ZNXoXnf5jCFa6k?=
 =?us-ascii?Q?SZs3sro+DdWEvby4n4oRE2RcQFj7D2HYgqgBS+enEbfGnKQs8OSWFOZQm+W1?=
 =?us-ascii?Q?bLhl4ZsIpxEHe+1A2FsgtkP0CoP2W8wFiuayoRIuNLTX+I02DfjYay/z3kaa?=
 =?us-ascii?Q?CKhfEs25J9m2Y81B8I1IYzt9AeqNTGH2/xYMy+B1gX2oPV3X1en7Xr0LYL+T?=
 =?us-ascii?Q?1Pz9/lgk3cWJQe+pKMUpAjRullOiKCDqq+1UpNC0yO2y4XZaBj6Ha7WLgTBQ?=
 =?us-ascii?Q?bi0Obq2A8DgwWC1cV5Xy8KO8jeRByBaCc1vC10XO50O1eS4JEajd1dIaVwRO?=
 =?us-ascii?Q?peo4WyuvK7FbdWcKNkslrLDJKcgSioYsZB3Za2t/+2QhFYeD9kCJyb7jL2/U?=
 =?us-ascii?Q?VEeuCh2EqmBjeZ9ApN0/aHX83puLpt3AQf+OHiF4LiDZQLfd0Z6eTYI+VCwL?=
 =?us-ascii?Q?1znoRgjWK4RlqPB/YfvuhvxKHkhtwrjAVJW5sUSvhshw9oi/OV9Hq3zCqZOr?=
 =?us-ascii?Q?nHyEC8keP6jXwTVnvt9Ph0QdiVb25e+Y0EEm9xmOQbnxy01HDMDFQKz+732Z?=
 =?us-ascii?Q?blE+VhiAj1uyfh6dmiEB3Jp48rvEjCg7xQzyoJbiB6kxDtzWCFVbkmRR+PpH?=
 =?us-ascii?Q?jxxFgfg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(376014)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Q3PVI/JmPs4dNXHj2rDuDQ98vmj7KFFo3B0AgZvWP38Nll9rKwABdvzMkzP6?=
 =?us-ascii?Q?Qj0jQvjKznbMerD+W+di2BEyQuRbFF3HkmzrSbQ/7Zc9Xg7fKK3CM0v6Kwa5?=
 =?us-ascii?Q?7wiQbrFUZq2E046Zswvc2x/ue6R9bQsg5OmUahdylDVw+6TokCUcLBoTo/xN?=
 =?us-ascii?Q?BWPD8b4M0HdF88mityEosyijT0i62WsgHRxPQ6edrAN2K6J5DsvzVa1NTXWY?=
 =?us-ascii?Q?LEJXLJxmwy33uEgUVpV6Z8QU/Jz2fyZl0PdpRg105LDAshIZnneRVqUF2STr?=
 =?us-ascii?Q?o3MsNfWEFDkq4uHqby2ezg1whvwk7qVBr9nV10ZiLQHe+ozTLo3Sxql//K6e?=
 =?us-ascii?Q?+rbRK7oDjqhzta4Q7AyPHeqH6L05pK0/DXMOZxNh6sgevPzUEiFs2zoawEvd?=
 =?us-ascii?Q?TjynbOkFUP3rDUhmFItNIdx5RkpiqQSxGOM6WtyAF2Ec0OjOmWitheudYqNF?=
 =?us-ascii?Q?w/CL0Yml+JOvsfbbHCLlBkZRaHUb1PYdfC05Hz9GeCJGT864cyd2hs3r3GKC?=
 =?us-ascii?Q?vGz8AJLL3Usn6RH9jt0B1twc97Zgysbd6dBdQBuL0EmDvJW0qlbHZxxtdlw1?=
 =?us-ascii?Q?9kzw3787UDP+na1vPNiWLlM1qxcTrFVaZckQIZldTEqkjG88Tbclyjj/hRgy?=
 =?us-ascii?Q?hEgV4BWWWgQAXSqHEb3xfLxysrCRuVEiqr5sj2mUU3V/TCJTyERv5PeTeUyP?=
 =?us-ascii?Q?MRpzaXs3Mfts9xpmwivdQrW5F2i1miXnZPzJFI6FTIs3hL/NDTYwogmLM5Ka?=
 =?us-ascii?Q?iEFDffQKKVuTiME0qcr503WHzFXCKby3dZfgPdpEEei9xCBigaitz6PSAyjP?=
 =?us-ascii?Q?+Q0hveTa8y8CulKHD1317p+0BsjlkfwXZT+CKKKaRv4/kYmomUJeXTv1+q+V?=
 =?us-ascii?Q?TNi86EKNsfRdtQzDrMCrFLVfnVMcUexwmFNOfuqD9NopKGxmRgkeSM4djNI4?=
 =?us-ascii?Q?IHuNBtY+KVr3mdlASjoqTJzVtpMkuQ2gActQmtO4OWFyvaZcbgvMSn/qdqN5?=
 =?us-ascii?Q?zE+Ve9sW2onlZdEBBXMZbpJinho0Xy2P+BHKgT0VY67woo2s/bnbuy9+XEKT?=
 =?us-ascii?Q?4FOqoBU86Tcoxtx/55P6X+ggUxAGpDurfM95Tc68HfoHjX6bWtQsX6etWxDZ?=
 =?us-ascii?Q?dWkU50QVyN6VhXbF/bDhyUiWag1eHrydmmke4qxgvzjj02Fj0gskh927+yNw?=
 =?us-ascii?Q?iWvs3ND4B1ecq49aZm0Zv5Ihniovu1bqlkoMWhenPBGukM3BU3Big9P8HpOU?=
 =?us-ascii?Q?WqEUaMombWz2BjKQgbB63Tl8A8wpVHd1sF+Mvb04Fbr2IQNviLgnCt38UfN+?=
 =?us-ascii?Q?M6tyP9MKqMAtGVpxoZwRccENULCWD8gHEyKMwjZLmfHUAUjt2lYLkqbNOiS4?=
 =?us-ascii?Q?GoqIE9XhPuiKNDGYPKHO+q6xdqmYJLS8TgHIeL8Lw2E4ynvf3b/tMjNrZPDV?=
 =?us-ascii?Q?M4jG/Mbz7iEvwFLnr2Azt4aScUSXh5X0xLyP8Bqkga7ThpM4BtAXyfPIa9U0?=
 =?us-ascii?Q?uBZTPUqvX9/07Yj8NGo004WxY46vVyf6twGQcyjEHRMDzIrGG05qQfd1Ehgn?=
 =?us-ascii?Q?EOgi5o06gQMXR+MPgp4ySHXjO9bVadT/APzFXp5WnXL3KXbFmT3eZmHM5PBk?=
 =?us-ascii?Q?X7g7VjgNEwThAAfHV65jvfdS7HfAmGnKFIhGkopVm+Om?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2168bd48-8eaa-4f8d-429a-08ddebfcc193
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 21:48:17.2010 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GszleeVQcOm/o6ZeAzoG7TWA1rX3+J6HrVOMxo9dJF7Cv+kmxCEirdrokWnH9DFORDFAmxq7VG3h6rW6yuQCMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9153
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

Hi Greg,

On Tue, Sep 02, 2025 at 03:20:41PM +0200, Greg Kroah-Hartman wrote:
> 6.16-stable review patch.  If anyone has any objections, please let me know.

Thanks for queuing this and the corresponding reverts for the other
stable trees. This one patch doesn't match what I sent, the address
should be changed to DP_TRAINING_PATTERN_SET not to DP_DPCD_REV, see
[1]. I still think that's the correct thing to do here conforming to the
DP Standard and matching what the upstream kernel does, also solving a
link training issue for a DP2.0 docking station.

The reverts queued for the other stable trees are correct, since for
now I do not want to change the behavior in those (i.e. those trees
should continue to use the DP_DPCD_REV register matching what's been the
case since the DPCD probing was introduced).

Thanks,
Imre

[1] https://lore.kernel.org/all/20250828174932.414566-7-imre.deak@intel.com

> ------------------
> 
> From: Imre Deak <imre.deak@intel.com>
> 
> This reverts commit 944e732be9c3a33e64e9fb0f5451a37fc252ddfc which is
> commit a40c5d727b8111b5db424a1e43e14a1dcce1e77f upstream.
> 
> The upstream commit a40c5d727b8111b5db424a1e43e14a1dcce1e77f ("drm/dp:
> Change AUX DPCD probe address from DPCD_REV to LANE0_1_STATUS") the
> reverted commit backported causes a regression, on one eDP panel at
> least resulting in display flickering, described in detail at the Link:
> below. The issue fixed by the upstream commit will need a different
> solution, revert the backport for now.
> 
> Cc: intel-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: Sasha Levin <sashal@kernel.org>
> Link: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14558
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  drivers/gpu/drm/display/drm_dp_helper.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -725,7 +725,7 @@ ssize_t drm_dp_dpcd_read(struct drm_dp_a
>  	 * monitor doesn't power down exactly after the throw away read.
>  	 */
>  	if (!aux->is_remote) {
> -		ret = drm_dp_dpcd_probe(aux, DP_LANE0_1_STATUS);
> +		ret = drm_dp_dpcd_probe(aux, DP_DPCD_REV);
>  		if (ret < 0)
>  			return ret;
>  	}
> 
> 
