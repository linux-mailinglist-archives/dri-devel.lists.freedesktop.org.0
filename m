Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D12ADB6B9
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 18:25:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A63910E3EE;
	Mon, 16 Jun 2025 16:25:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M1sNgywz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B153410E3E9;
 Mon, 16 Jun 2025 16:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750091155; x=1781627155;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=v9uLucgU/hC3gW9qH76nouRBxWmN7IkxHpFjyHfjfPk=;
 b=M1sNgywz/CqSazIbkR3Ihh2c2L5wzfXDhMGthflbXIfoTXQhI/lDy0jt
 U4n4dC6KjpkRqyBsB1+H4lwdPk/H26SXJBEEsWS0DwOXIsFuzOQbWhqJ9
 aFdJblRYzvdQnY/DjUnFKmwkv8GpXDBIIjs7F1XiOKrpqwkpZElDcogEe
 kK7DcWNNNEn2uPKVx4nVMwYC9TkgcGvaEab4OjoC8+AcP+3pEYKO9c1KB
 4I5g9oQRWaowUwMnxoL952N4U1Bk8ho628zwhR4OjhTGo2C6JkvtFGjcu
 GLx8/Px1KQbcZTyboqyabKyi30VdZUE9bqCWBkZ7eiXCkPqLOMIzbwQmE w==;
X-CSE-ConnectionGUID: MCxrtjMORqmIo8Oq6YXbWQ==
X-CSE-MsgGUID: Fim4BujOSkuY8iUNww3RwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="69820722"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="69820722"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 09:25:54 -0700
X-CSE-ConnectionGUID: YjRXMehORKKveBULDHs+2A==
X-CSE-MsgGUID: sxyu80x8RkWaMQRqAHUkiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="153273462"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 09:25:54 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 09:25:53 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 16 Jun 2025 09:25:53 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.42)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 09:25:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eaENRtdFc0jyFO9sdYb6Tsle5th73qO7ohNb5jL1Ggq7jU53L4/RdENUapnMQLgts1wkwiLYsYOhGtbbXrDKKaRJwyAZIEUqW5PI2g1+PZkmKEoYs5b4XrAZfdcP/8rIJq08NX59ECrrmSAt5dvaUKfSuzWF/C9cIdN590Ly7Qv8uCsjjQRUjHgc2X/R036J0GbgGNM7xlaThAQitWECaCJPdJLN5FQrCz/pTZLnY1EFnZoJVC4C1bAmQoLbaOEV875LAvVOz1FcETly7/lrvlc7kgNkXX6eRPM6Jx7Zle6p0NMZpUIyT5P1YBd/bFbEMBgZnmzV8p8in7dyc7c1Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LQLW5LaUggz0uDQx8NdSNJM9CR7jiJgUWxc8FjKgVPQ=;
 b=xUAFtW6YFCz4Psm1cI2oy7G8R9O1wY4xDp3PDAF7kX0MwDwZQGLX4iLeL3G4fA3qixvzPbqTDx3J3vB/LgqJCj+buUvvGkyWEenLgnhpr2b5YpyV/ixL10w59J5DWsTjsMiX8ticq3Ji9wxpy2bVm7UTdmrm0ar8HnsL8Uma9h8TLEYc2AJWLzkkMCLlJgIENGf72q1TECzTeOUoPrzQD0RFQKAK9MzoJulVNm97BfWebkUISRpVuo4TzLw7A8YNrhZ9NfuePWzhTbjWDlstd7PqjJZjPZInWJvyDwPhw5df92OEa/NvMSet8oRjP95BhRl+3I6FjVyPyHF5mNITxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by CH3PR11MB8442.namprd11.prod.outlook.com (2603:10b6:610:1ae::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 16:25:35 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%5]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 16:25:35 +0000
Date: Mon, 16 Jun 2025 19:25:29 +0300
From: Imre Deak <imre.deak@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 0/9] drm/i915/dp: Implement POST_LT_ADJ_REQ
Message-ID: <aFBFebbYH0STS_LA@ideak-desk>
References: <20250224172645.15763-1-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250224172645.15763-1-ville.syrjala@linux.intel.com>
X-ClientProxiedBy: DB9PR05CA0005.eurprd05.prod.outlook.com
 (2603:10a6:10:1da::10) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|CH3PR11MB8442:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dc1c8d6-de1d-498d-67f7-08ddacf26c02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?OTrMzgPwWptd5N+zO4wVjxoh+tuzAgaS5Wg5spirwSa/0kVGem7Cp/4tRu?=
 =?iso-8859-1?Q?bDudFLL6YakRJxBrwoBb3BHOk/lmbNb1w1tbIX6MWZ6toW6KY6YyGXnFH1?=
 =?iso-8859-1?Q?iWSboyov6LJWypOI9SHuHhmddRavAhjkVlA7uNKvE1oLSx3lrhCovvRkBO?=
 =?iso-8859-1?Q?Jg+H4TZQ8aALgFhwmt6uVoKf2kx4R9WuMGksVYIQetFhTL8e55QzISLJ05?=
 =?iso-8859-1?Q?+SZVDgTGsdhKLlv91YNx28DbK4r6dPVn43vZT+Zc903YZ/M66JyxIf/bgF?=
 =?iso-8859-1?Q?9C3Y32FfSQ+rNQ7uljNUnd4zlGHNUNYPkSIgv1A5NH8PpsArFaUHIaQ3s1?=
 =?iso-8859-1?Q?hzWDvhPUPUUCyJkAvBLLpZaZ1cUjzdaslsSaiHf0Sln+ZA9s+WWICr/Opw?=
 =?iso-8859-1?Q?2iRJpOaS6nfj6kDyhdN4WQLUGmtdDYacQAsvEZbAvLp1PtaUVk4m9rttlY?=
 =?iso-8859-1?Q?WniRI+Lazzm0Cb3Fq9H/C8Hjt0jG4TSc5F2CV26VbQK1XqtsaJ3feu18VR?=
 =?iso-8859-1?Q?GKiwHfxn/8j//S4sLy3RQggErVwk738KCzls1u1h92GUjAYFMCbyqn9Qhq?=
 =?iso-8859-1?Q?PJg5vhThoezr8CL/bnTYUfgb+HAttnKGJvT10rBpi/njcGLW3mAtwQIHnb?=
 =?iso-8859-1?Q?AudwJTVgW8u1pnOY9Gzqe/ATVgaUgHj27oU6SqkbTBBuO0IHLj6ZiGi8Bd?=
 =?iso-8859-1?Q?cQqV7sirio0fcsnNhavNU57yLntISq/JpuQHO9Do28CKppVp8H2n0esYO9?=
 =?iso-8859-1?Q?j9gsGWZiq5Y15IEGprwjJDN6h8dqzODOhMuF8IHK7dkSf/c0QIsTyKXIPU?=
 =?iso-8859-1?Q?g94c+9gq9HbUPDhK8UUc2pXfEbGiv3/FXJH+5qlD62tF2hsyMENaL7usA+?=
 =?iso-8859-1?Q?nvIfnNEx55obZoyB17ATF9Gg/NgMKGioi84JtABnT7gCkMaSFOYHV8Xagd?=
 =?iso-8859-1?Q?uomtJqTsObHOEN96OXVlsQurXZvg8+ubwRtzXJID8OTEuM6LGuZNw0vMdi?=
 =?iso-8859-1?Q?yj6+uximJ4KidzrmRXnzRFRPkFAPEIJJrzh7+rERuT9hV8a7RxPgBVt2rH?=
 =?iso-8859-1?Q?/7Y5YJC51YZTBUAgPJjMSp7zAZbhFdh0aictseDWvWcxPMbg624TbVcsIO?=
 =?iso-8859-1?Q?VcjZgQ1PXRBxvuAldQ9GNsOHi0ufGzhnhSjQvkVlHOz5VwtwxPbJwTzduO?=
 =?iso-8859-1?Q?lXCKaq142ywFZRID1XmgLZBM1DZW+mMkkc8xIuErTC2JR5yrqZGwKpTwu6?=
 =?iso-8859-1?Q?HqJVYcUdmlaKmP0ypnUiIpyjvkQYekCbEFgJb5zBrLFhYeF0WIuEKf7xhb?=
 =?iso-8859-1?Q?RhEBsEVMrfXUDULGrF0uSUDFNCTkuFPLW6614wV8r1yIa4zOcnQeIJmOge?=
 =?iso-8859-1?Q?XKIIc+5G0ccPJ6HlwY2q9cwNACZvrSXA0pFMwmJ9HELCRGn4quxODCbLdG?=
 =?iso-8859-1?Q?T71pQal1HvlFO8RAb8HaiIlgbZlvs011GV4oxw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?UykkFyDR6HYKDnC3GAZzSCKAWq0BFk1EpjoydojY6x/Yqf1uBBkHzCptS7?=
 =?iso-8859-1?Q?mL0N8+wJL84Q/NaqmAef2KnbjS0azpptHDjblbHIOCn872DeVOrWvXDenx?=
 =?iso-8859-1?Q?2Liq/IsVSc54IgUqxgAREYPXNgU+y8hAAFqOkAS7THQUKJwaa0s8U9g4Rd?=
 =?iso-8859-1?Q?mUx5+imp6Eijaw5Y6zSnldSjJwq3YhnRMdThWJ01ZTDRfIa5QgmpbGVs+R?=
 =?iso-8859-1?Q?H+W3jCL00kl83Afq9Ywb9UiVgQ3OF4aV5oN4RNKzfrsgEg0DRuBBWC0gG0?=
 =?iso-8859-1?Q?/I5J3l/MldCa4huC/T96RcMV2qnbyTdmV0y8HbM6efPc4kn7Q1Y+4aQYA5?=
 =?iso-8859-1?Q?/rqsWulYzpCkkEm4qmzncdohmOevFZvdsK74U4O8e024aZ6t5pphiEP/ct?=
 =?iso-8859-1?Q?5xXZEVweWCJqhqFblIHgMu49Plg1OlY8/qW2wtFV76LlDy0mq4ymyRPOZl?=
 =?iso-8859-1?Q?QDCGWqlhhqbRJuy8vE34ylenH9P2J4oIClGHBECK7P/EZW9efl4i3ZAkvj?=
 =?iso-8859-1?Q?PxJnj4yhY1kdaPJmTaT0MZvO3qhtRQ5jzdK76Ei8e5HZTggx+NRzoW8XAq?=
 =?iso-8859-1?Q?ewTESDXIRGIAHLWldVh5LEOUM2j+9XrcoccX8U81WjVwcOz4twjB8u9W5o?=
 =?iso-8859-1?Q?htnrFvOsxGBVDxrZEK3UaQylxhvGXqUFHBNKOZ1Ddmg6UX69eMQi5SjT+M?=
 =?iso-8859-1?Q?ix19wCP1ESs7c+Dq9HVFK4CLr2XBsSDnQkfAr28BnkDbFSlTn+cOhmxkpP?=
 =?iso-8859-1?Q?lRHA5gH5856aS2O5ZGBA3K5Injayk3K7t/n76XScg5rLlXXtEd0I5CYmH4?=
 =?iso-8859-1?Q?eTxPSlfyPajscb+CsO/wCht76NXZPmGRuIQ7y9nAr750fPPs/6PGvbAb04?=
 =?iso-8859-1?Q?qB51HOHHIRFwu7DNJWy9U5DjiJCZG4Durr4sli+X06PhS6xTPDidI3FCFb?=
 =?iso-8859-1?Q?aYnDtR8XgZ1yzb4Wy/WsriXMoJnbHKnDrybI8QL+txsAWDC4z+zoponDv/?=
 =?iso-8859-1?Q?IPGXT/w49pFTFt8gWmuxzOQlWDwXcVC0dQt1Drcz1Tm1mfs+uShsHv3A9E?=
 =?iso-8859-1?Q?bayOQEcX0ZSLppU7VFr3HwIndkj622e7ACgGSmLGpiiFxSiHfisbpGh5SR?=
 =?iso-8859-1?Q?Y1PJ4AwMlTeEWkwyP9nzi0CPtY2FCNxRsS12RwBd2QQyhyCeFG78+5ySbc?=
 =?iso-8859-1?Q?R1FEjGE2Ky4R2VPjcApDlr6y7ya7dVQWoa10TLkL6nIMB04HP10OZGo+z5?=
 =?iso-8859-1?Q?717xnS4G7+joKIJMlSmuauTPfFkjeWmZUL0VC3tK/MvGJkMfhLeo+hIGQZ?=
 =?iso-8859-1?Q?ZvBvw92ldF+3+9oB3ZwN8hnzEWQHdWoNKXOrM2kf6v0TPFj+im3lyTmval?=
 =?iso-8859-1?Q?XVCUoYJyQNhKS9aU2OP8ixNNZvzVzAO8fQae6+Tdaou2jXBTELJ4UgWPuS?=
 =?iso-8859-1?Q?qoxqh6GU9rzksRCFRCvh9hAhV6wnBumajM+WRocggszktdSn5Yh/fOIR5V?=
 =?iso-8859-1?Q?7VHMqKaSpQfkXASlf1Z7W06JDBC0+TC8f1jan5DppBY3CwyR05+nQmY9ui?=
 =?iso-8859-1?Q?6p0xoEKYGH4Fim5b1c1PpgCXMmiS0iKpbE2o2zrQgo/mzTiKDQew2oQCpH?=
 =?iso-8859-1?Q?a33nq7HNgNvu1uxXrlL7GResPb5yiGDbHB?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dc1c8d6-de1d-498d-67f7-08ddacf26c02
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 16:25:35.8023 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5MLa+OEZohgPkdgXcvicgNzAnsQM4Ftq2n+TVka7KQYGt8lztyePSXVkFPaXpRNFzk1JSvEVlT7KKlkdsd7skA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8442
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

On Mon, Feb 24, 2025 at 07:26:36PM +0200, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Implement the POST_LT_ADJ_REQ sequence, which is supposed
> to be used to further tune the link vswing/pre-emphasis
> when TPS4 is not supported.
> 
> Unfortunately I don't have any displays/dongles that support
> this so I wasn't able to test anything. Hopefully CI has
> something...

On patches 1-8:
Tested-by: Imre Deak <imre.deak@intel.com>
Reviewed-by: Imre Deak <imre.deak@intel.com>

Few nits later on the patches.

> Ville Syrjälä (9):
>   drm/dp: Add definitions for POST_LT_ADJ training sequence
>   drm/dp: Add POST_LT_ADJ_REQ helpers
>   drm/i915/dp: Clear DPCD training pattern before transmitting the idle
>     pattern
>   drm/i915/dp: Have intel_dp_get_adjust_train() tell us if anything
>     changed
>   drm/i915/dp: Implement the POST_LT_ADJ_REQ sequence
>   drm/i915/dp: Move intel_dp_training_pattern()
>   drm/i915/dp: Implement .set_idle_link_train() for everyone
>   drm/i915/dp: Make .set_idle_link_train() mandatory
>   hax: drm/i915: Disable TPS4 support to force POST_LT_ADJ_REQ usage
> 
>  drivers/gpu/drm/display/drm_dp_helper.c       |   8 +
>  drivers/gpu/drm/i915/display/g4x_dp.c         |  33 ++-
>  .../drm/i915/display/intel_dp_link_training.c | 267 +++++++++++++-----
>  .../drm/i915/display/intel_dp_link_training.h |   4 +-
>  drivers/gpu/drm/i915/display/intel_dp_mst.c   |   2 +-
>  include/drm/display/drm_dp.h                  |   3 +
>  include/drm/display/drm_dp_helper.h           |   8 +
>  7 files changed, 253 insertions(+), 72 deletions(-)
> 
> -- 
> 2.45.3
> 
