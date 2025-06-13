Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D1FAD8ECD
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 16:10:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3B7610E9E8;
	Fri, 13 Jun 2025 14:10:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OWGpbHHm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C568C10E9F0;
 Fri, 13 Jun 2025 14:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749823833; x=1781359833;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=n51SfRx0GGBuK+tkXa6/6UBi8a2Sm/ZsfMwoHm6NDsM=;
 b=OWGpbHHm62iBYUOMWYHPjS31zadbLRwjbGAhEpC7YGawAP/LrguIvyWN
 z8IxkHfWqUempnMtDmUSJOQL1y4D26VYMlV3Wk1CRYJ03+YcYI1HjpO4c
 PXXaG9tFMswMzDfy62IA/c95AgDsskRzjSHVTC0gcQu3SMwNF423CwUbP
 clGOu+7wT48TKsaabr25AbBhybWzHK15VSZUAyTQr0PWZfVRLfr/SoLEW
 ldbY4c+a7mVjOlRbr63pBnb8kCgOQyBE4ht/IC2stQ9IAXzBfLelqjmFt
 kYgBljsbChQROoDqMp3Exs3io88tbFzHLS9hdQgF1nF676Kj6nZ4fiSC1 Q==;
X-CSE-ConnectionGUID: 2tZYd8dpRsS+5W3xC1oHZg==
X-CSE-MsgGUID: 9Zq0V5CnTPytAHMZyKUzAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="51920390"
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; d="scan'208";a="51920390"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 07:10:32 -0700
X-CSE-ConnectionGUID: lS6NncciQyaxBgiEkhAHQg==
X-CSE-MsgGUID: FKzzQlZUSJaWfz0Aie9I1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; d="scan'208";a="152993930"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 07:10:31 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 13 Jun 2025 07:10:30 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 13 Jun 2025 07:10:30 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.82)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 13 Jun 2025 07:10:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yi4Aw9zqBn1rAooXYSdZ3vXz6O9yU6fPDXJRTsVNXObZzlOF9HGs2d+wmDfyaoBAPmRQLzGrdEFqTzLXuO6FVZbUw7zVGa0UYMji89zIcScOfsFJn7XfN71LqioxxAkDxuCKipW458UopdACNMIwZSvv2BLN6oI1c9QOlbljQSQuZV96cL+aR+7JyemgYloavNNGbLH84bCPSo0bkY8w4gS/B1LpCkz4va1GocdrcnSsh/fWb7IpnuYdbIbjsOht/A5SLX7Ta5e5A9m1cwoAE6yWtG9VVZE7dVdbN6p/cxOC07yjGRSWf+lGtJ5IEjxkJ2rYL5y0w5+PQsn/gAQwcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HwM3fY5r+MaKrsnEDQzrwz9bDpagKmmWIMdhMGF3c9Y=;
 b=Yw0dMbBhcrj02IoLISz65zlmSDQoZSdEU8iFkXY7RQ55wBt/+g/cQfN/hy4WIX0vlgbp2k9nO+n6l8CMrpUEKV8GDq7IYkzXv81TRXFPY3QW9KyCifUUdGRrg8txMyWnVAbn53JftoG8drZQK2mY+yjQVEbMMLiCHIhp8np7hDYT2J2iRbO27Qny5xi5/i0MMtk88ghT+TUA8lh8dneM7F11DMzUrrjuhriEDjlvnAQyMBH5nBS8/200fKkLGqkHXr/XhMI4rLno0mYdPYOhtAkZtthTD05lLZh91CBV6KyjTJM0lZXpmo5rSFwNWQOGMVRPjen7y/ppHLJPOO0Wtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB7286.namprd11.prod.outlook.com (2603:10b6:8:13c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.33; Fri, 13 Jun
 2025 14:10:11 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 14:10:11 +0000
Date: Fri, 13 Jun 2025 09:10:08 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: Yiwei Zhang <zzyiwei@google.com>, Juston Li <justonli@chromium.org>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, "Tvrtko
 Ursulin" <tursulin@ursulin.net>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v4 2/2] drm/xe/bo: add GPU memory trace points
Message-ID: <yudr4466kytpf2l7jfu4oz3txismnupdlxk6fx3bxa5elweqdr@wmgeyur445pj>
References: <20250611225145.1739201-1-justonli@chromium.org>
 <20250611225145.1739201-2-justonli@chromium.org>
 <mrfsys5djmsbotxlaahed5ogmofn4pkmgqfhl47rj3bwxdtlbv@7xbekwpkte57>
 <37a5f250-1c19-4b95-882b-b4ef3e5c6268@igalia.com>
 <p7wq3wrsddp7pk7bk5follhkc4f7ybgmc2o4e652jc2cfuqbhh@tckgwpy3khcn>
 <CAKT=dDkjYQUSwtYwFTvWppn-2sTdwYu_FE2jfhGXd6vWkQHvgg@mail.gmail.com>
 <3663ab48-6ac6-4903-aa08-f93c7b71ebf2@igalia.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3663ab48-6ac6-4903-aa08-f93c7b71ebf2@igalia.com>
X-ClientProxiedBy: SJ0PR03CA0348.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB7286:EE_
X-MS-Office365-Filtering-Correlation-Id: 30bc074e-2700-43c7-c2ab-08ddaa8402a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y1lHdUhUT25YSXQ3bnB6WnlZcERZdG93bGlIQ1krL2l0RjNVR09CRWxHM3VG?=
 =?utf-8?B?aTRpYmVPSEFuQ001dWpKWXc2d0toSjZmeDk2U2VYYTEyb3d5VnhrN21EUGdw?=
 =?utf-8?B?TWFqQlZWSElMRTNCQkhTVGNPTE51OEZTMXVRVWhUc2Jram1aN2hUYzJ6NCs2?=
 =?utf-8?B?a0JCR3o2SEdJUjM0UzJ5VjlPTlB4TW9jWW51Q3lGN01KVGg5NlcweGNwa2hp?=
 =?utf-8?B?dXVEY2tpSXk3MGhkN0IvTVNoR0ZaR2laZ0R5S2pudVFqTXNsNkQrNXUrZmVw?=
 =?utf-8?B?ZUxVbW1QZTZXNUpCYWhNRFJDYUJyV3FWNUZRckx1KysxM0JCc3NRSFNFRGxz?=
 =?utf-8?B?L3BrOXZib0QrQW1CbC95UEN5ZzQ0Sk5sYmxxR1dIQmhlWStxZXJRdUpuUytQ?=
 =?utf-8?B?Yk9mbXh5YythSUhkTmVrbGlRV2VXK1E4NHAvZVJYekJMcXQ1VzhGdTkzQlo1?=
 =?utf-8?B?bVhteWtlaWNrOFlNVjFONDF3N2t2S010YU1pWTEzOWlvaGpjcmhXSDJ1bXBk?=
 =?utf-8?B?RklYWmF0b3pmTWFBc1VrNzhNZ0xwMkY4L0luM1JWZ2dHWDQwKzYyMVZjYUlv?=
 =?utf-8?B?UnUybzF6aTViaWh4OFNmZC9nL0U2M1pscEFGNGF5UWE1cld5WjFaR1NXeHhs?=
 =?utf-8?B?dnJhaGQxaGNBdGNjRkFFc2NXS1B6eU9NZ3J4d2JDSUMrQk9ZY3BFU3Q0QVc5?=
 =?utf-8?B?VkVlTnRWYnkwNStjeGpRZHJIM0FEOTF0Z1RvbnVoVUFMMnpUNTZnUEc2dG1t?=
 =?utf-8?B?OFpZSnFOOXhXb0I4akFDNFYvNXo2Rmsremo5SXlzRjl5Rit3TzV0Z3JKMmRq?=
 =?utf-8?B?c0FmN1VUS0VtdUpYcUltL3F6V0xGUnJNc0pKa1hKay9maUVKek83SzFCdmhO?=
 =?utf-8?B?eXU5SkFLU2d0L0dNNEZEb0FKaFV2ZmVPa3RtcFlXQVFZdDJXQjg0KzNHbzVJ?=
 =?utf-8?B?cGhwanhabUNDcjExeXAwcDN4dEErc01SRkUvQWhLbDc5VTBOSXlCbGtzbjJa?=
 =?utf-8?B?cXZKZE1rTytIUEJIOEdGbFVIT25uMUtIUGIrd2o0TXNSaE1DWTJwRjJxQk0r?=
 =?utf-8?B?Tzd3Ujh1YXFWR29seFF2TEU0ZFlqakJaS2g4Q2Z5N2M3Tnpyb2NWU1ZLdDAy?=
 =?utf-8?B?WlJaeTV2azA2LzZaQU5GVk9mSlh1U2l0WjBpUDJJYmQxbmplaUFodDFOay9B?=
 =?utf-8?B?cnBRT0pQQVRONFZkdTIrNnFGR0xaaWdLdzI1S1Z6YTl6dXRQNDZHR1FWMWl3?=
 =?utf-8?B?NzI3alNIZWpZd3QramcwSnVlM3dxVTE0MGhzblcyY2NXblFmWEIwSVVieFky?=
 =?utf-8?B?SVNHSmJmMWgybHhJVnFKNngyR2R2Z2tUcVhwa3VySWpXQU5jbVo1YjJZS25z?=
 =?utf-8?B?aHBubFNCbzJUTTVmMHJDZWF4UGg3eHpyMkw0V2FHejhKUWZtRWxSWDhzcjhV?=
 =?utf-8?B?TDF6STVWKzVKeVluVnVZODZRVXBQMlBxbHNUSjc3L1BBdnN0NCtiVlJrQlBT?=
 =?utf-8?B?ekNaTmZSYWxHWVZQQW9QbHpCS2h3dTRoMkhqNEYxRkZlSXhzMkdLM3VIZ2lC?=
 =?utf-8?B?YUR6QVlOcHJ0OWJZQVpKU2paVG5sQzlVdDZtQUZNY29wcVRaU011MWp1R2JE?=
 =?utf-8?B?Zk1vZnV3VndNbDNEbjdER3pOL2hOSjRaSHhWNk5SMGtpNEowRUxlTmdZcDBp?=
 =?utf-8?B?blhsTWR0NkpNY1Z5dFVzMFUzdVhlcFBISkFHRE5mNkMxa0JpMS90czhrcjZP?=
 =?utf-8?B?UERFaDMrQTlnRzJra21Ea2wvSStvbE1Cd1dRd2hYTjJGcitVazN1U2MyUi9m?=
 =?utf-8?B?V1FaWkgrTjJvR1NjNVdxMTc1bDZ2MWI0SzZmb0dLV21MTXhDbjhwN25DYXFG?=
 =?utf-8?B?T2lEZEVaMHNoNW9nMGRRU3ZWUUdBdzYvKzhnUVZZODFJWkdXdlNkbkNsTWNX?=
 =?utf-8?Q?gNng3Udm6l0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dE4vbUNOUEdWRkRsUlUrUk9QMlNFVDRnOFBuSlNQdGVTT2RtSmFXU1haWEhT?=
 =?utf-8?B?UThZYkxYTWhoSDFOY3BRcnpCd1hHTUNVSHJ3NzRpdTBaRWs1YmtqSGZ1RHdn?=
 =?utf-8?B?TElxV2lVd0w5MW05S05CaDgrTGxNTWFubWRnS240ZGlzaFVCNjdQbDhPb3Jx?=
 =?utf-8?B?TDllYlM1UlBzVVdHMUx1Kzl6ZlF0RGEydEFNcHJzaThNSFM3c0xTLzRaWlA5?=
 =?utf-8?B?c1FBNGYyaDJRZHRwK21uTVMzajZFNnRWRWttMmF2TE41MldyeUw4SVZBb253?=
 =?utf-8?B?bkYydC9NSWw2NTBCdDFDaGlwdGZpdUQ3aE9hbHB3d3JoVWRmQjdxWXRmUEpJ?=
 =?utf-8?B?Y2NZRXBHTWltQTBqUHRnUnkxVjB0bFRZNVFwMTd2d29GNngwTVRxd0d3ZTBJ?=
 =?utf-8?B?Zm52ZDZyeG9sTGVzZDJ0bWFZWjFuR3g4M3YzbzdmMzkwU2VaNFNVbVpZWVFq?=
 =?utf-8?B?M0VqVDUxV1BSd1dSUzFIT2RZRXFMck9nMkYweFFhSE1XMEhmcFF3eFNLY1JD?=
 =?utf-8?B?aENMOXBMRzVKY1ByY2w0U0xTRHZtSUdCbVdRazdPeEgyc2d4SEFSYVJRU2Ey?=
 =?utf-8?B?TlJvRHZ0TC9SUndJcFRsUXRWNVhlSFg0OUZIeSs5dXZ2SDVxWHV5bUpyaytG?=
 =?utf-8?B?Mkc1ckduTlhsSW4zalYzclVtYWtVdDBQdHJ0ZHpwMU1MY29KYlpUL25NcjNE?=
 =?utf-8?B?QTdLRGQrVTJ5amlncmNwUkZmcGlFaUU1aUFvUGlUS1NmcjVvWXcycXpqa21s?=
 =?utf-8?B?UmxxOCtrdGNydEdsaUsxWUdFVXB0Z2RkdmgwUHRFb3VXSCtyc1JVYm9YQ0lx?=
 =?utf-8?B?dW02SG1VMjJhRGZnTjFtc2g1emtPTDBla3ZEN2hvNHQvekdkT0JmckRuWUFB?=
 =?utf-8?B?cDlsSUR2MSsyK2JyQXNYYXoxN0d4WEQ1dWF0SlJMZVlzWFVaRzVSODhNTjBR?=
 =?utf-8?B?Y2JSbmFKZ0xlMjVjaHI5bmlYaDFJaGlxdElYM1RDbVl1ODU5WFJLOXNqLzVj?=
 =?utf-8?B?Y1VVYkRQNXVlY1p0RWw2RHA2MDdQbU9Kd1VVQlBpaU9BeFJFWFpmbzUwdDBT?=
 =?utf-8?B?SjlnMmdPOVQ5NjR3YzQ3YlErZzFoekRaTU5sMnF1NHlSNVJsYXAzeTl1RHdz?=
 =?utf-8?B?aDFqMXAxOEFMeGJRYWRJcExoRklZSStjUEpEVzRsdlJhMHVSdDhielFoRmxl?=
 =?utf-8?B?TjNLMVV1bm9BTDNaRkR4eU5aS1cwTzFxdE8ydkxCbFZ3c092NkdYRzVyQUlO?=
 =?utf-8?B?ajZCZVZjeDRGZjE5WnFjdkNYYUVHSGJ0MSt1T0hWTnY4YnZVMTg2eUxZVS9j?=
 =?utf-8?B?bDdVSFQ5NnpnY2ZNYWhYckw4RzhiOVF5NnZpQ1dsQzduRlpTaWMxRWpvNDVh?=
 =?utf-8?B?bGdCb2Jqemo2TTQzSk40UzFhcGpsTWRzb1hjK1p3alVpcE0zUWp3OFltTXZ6?=
 =?utf-8?B?YkpmdUhydFBsVXEvbWcwWU56KythU3JkMG5lejc0M2dvL3NmVWttdGt0ejlX?=
 =?utf-8?B?Yk54QkhFT1RlcDJBbzlnekFGTlRoa2dyVW05VE1KaXV5V1BQM2FyMmVsTmlx?=
 =?utf-8?B?SnhxUDJuOWpubDJCR3BLQ25oSDJxa2paaU04VndVd0dyRnRjU2VQdjgyVmc2?=
 =?utf-8?B?emxpc0lrbEZ5QXpPemhWZ2Q5N1VIdGdUNGxOZ3FKRzNTRkorOEFkU0NlcFRh?=
 =?utf-8?B?TWpnd2NhNDF3M2JSUmZYL2FZMVllRHN6c1IyVCs1WUdDekVZNjRmUllPTGF0?=
 =?utf-8?B?UENRQ2dwYlJnMHRtK1FaVVdraHc1UmppTHJBQVdrazVHR21NZi9aZ1FlMU9p?=
 =?utf-8?B?VnJFTFhlYWtRQkU3MGtoWkEybnRObnArTnQyUlZXMTNUNnczT3M0MW8rUzFV?=
 =?utf-8?B?VVVEOSs2VzRDQ1VkbWcreUJtZkZ5a2xVZnNTSEtPOUszWmtKRUtTa3IrZ0Mz?=
 =?utf-8?B?WlV0cUNlOHBCdXd6RkFpckREOFpoN1R4V0czMGJ4QWF5eGw3QTJoN2FWSHh3?=
 =?utf-8?B?U1FiQXIrWGRxM2JFd3lJRUpiOGEvYkRUclBGR3NJNWVwcDN3UFRFQk5zT0NO?=
 =?utf-8?B?VGpZaVdQcHRDdXZvQVVFbkVGT0dvN2h4c09mYStxbGlCYVdZSTkwV01SUHB0?=
 =?utf-8?B?cXpwZFNNZjhiUUpIMmp6Z0JKYTVlbE1ZZDQ1ZlhQUjlLUGZhQUpHdVU0RTZM?=
 =?utf-8?B?bHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 30bc074e-2700-43c7-c2ab-08ddaa8402a5
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 14:10:11.5845 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9TXyEmPR1rRsHVFpXiAATcoi0m4ei3FZOAyVJYQFck1nqEBv0wcpBbfLeOnOKwtWg1b4nBDNpu35bbCBlahIXFMMMI9GG8LnYe2fQEc/kec=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7286
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

On Fri, Jun 13, 2025 at 09:02:27AM +0100, Tvrtko Ursulin wrote:
>
>On 12/06/2025 19:53, Yiwei Zhang wrote:
>>On Thu, Jun 12, 2025 at 11:02 AM Lucas De Marchi
>><lucas.demarchi@intel.com> wrote:
>>>
>>>On Thu, Jun 12, 2025 at 05:46:52PM +0100, Tvrtko Ursulin wrote:
>>>>
>>>>On 12/06/2025 06:40, Lucas De Marchi wrote:
>>>>>On Wed, Jun 11, 2025 at 03:51:24PM -0700, Juston Li wrote:
>>>>>>Add TRACE_GPU_MEM tracepoints for tracking global and per-process GPU
>>>>>>memory usage.
>>>>>>
>>>>>>These are required by VSR on Android 12+ for reporting GPU driver memory
>>>>>>allocations.
>>>>>>
>>>>>>v3:
>>>>>>- Use now configurable CONFIG_TRACE_GPU_MEM instead of adding a
>>>>>>  per-driver Kconfig (Lucas)
>>>>>>
>>>>>>v2:
>>>>>>- Use u64 as preferred by checkpatch (Tvrtko)
>>>>>>- Fix errors in comments/Kconfig description (Tvrtko)
>>>>>>- drop redundant "CONFIG" in Kconfig
>>>>>>
>>>>>>Signed-off-by: Juston Li <justonli@chromium.org>
>>>>>>Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>>>>---
>>>>>>drivers/gpu/drm/xe/xe_bo.c           | 47 ++++++++++++++++++++++++++++
>>>>>>drivers/gpu/drm/xe/xe_device_types.h | 16 ++++++++++
>>>>>>2 files changed, 63 insertions(+)
>>>>>>
>>>>>>diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>>>>>>index 4e39188a021ab..89a3d23e3b800 100644
>>>>>>--- a/drivers/gpu/drm/xe/xe_bo.c
>>>>>>+++ b/drivers/gpu/drm/xe/xe_bo.c
>>>>>>@@ -19,6 +19,8 @@
>>>>>>
>>>>>>#include <kunit/static_stub.h>
>>>>>>
>>>>>>+#include <trace/events/gpu_mem.h>
>>>>>>+
>>>>>>#include "xe_device.h"
>>>>>>#include "xe_dma_buf.h"
>>>>>>#include "xe_drm_client.h"
>>>>>>@@ -418,6 +420,35 @@ static void xe_ttm_tt_account_subtract(struct
>>>>>>xe_device *xe, struct ttm_tt *tt)
>>>>>>        xe_shrinker_mod_pages(xe->mem.shrinker, -(long)tt->num_pages, 0);
>>>>>>}
>>>>>>
>>>>>>+#if IS_ENABLED(CONFIG_TRACE_GPU_MEM)
>>>>>>+static void update_global_total_pages(struct ttm_device *ttm_dev,
>>>>>>long num_pages)
>>>>>>+{
>>>>>>+    struct xe_device *xe = ttm_to_xe_device(ttm_dev);
>>>>>>+    u64 global_total_pages =
>>>>>>+        atomic64_add_return(num_pages, &xe->global_total_pages);
>>>>>>+
>>>>>>+    trace_gpu_mem_total(0, 0, global_total_pages << PAGE_SHIFT);
>>>>>>+}
>>>>>>+
>>>>>>+static void update_process_mem(struct drm_file *file, ssize_t size)
>>>>>>+{
>>>>>>+    struct xe_file *xef = to_xe_file(file);
>>>>>>+    u64 process_mem = atomic64_add_return(size, &xef->process_mem);
>>>>>>+
>>>>>>+    rcu_read_lock(); /* Locks file->pid! */
>>>>>>+    trace_gpu_mem_total(0, pid_nr(rcu_dereference(file->pid)),
>>>>>>process_mem);
>>>>>
>>>>>Isn't the first arg supposed to be the gpu id? Doesn't this become
>>>>>invalid when I have e.g. LNL + BMG and the trace is enabled?
>>>>
>>>>Good point.
>>>>
>>>>u32 gpu_id does not seem possible to map to anything useful.
>>>
>>>maybe minor_id? although I'm not sure if the intention is to share this
>>>outside drm as seems the case.
>>
>>Yes, that was for render minor in the case of drm.
>
>Or to keep the field as integer we can use dev->primary->index, which 
>would then correlate with the /sys/class/drm/card%u, in case it needs 
>to be mapped back.
>
>There is prior art in various drivers to use either dev_name or 
>dev->primary->index, but for this one it is probably easier to stick 
>with the integer so both msm can keep passing the zero and we don't 

both msm?  In xe we'd use dev->primary->index, right?

Lucas De Marchi

>have to think about Android userspace forward/backward compatibility.
>
>Regards,
>
>Tvrtko
>
>>
>>>
>>>>
>>>>Shall we replace it with a string obtained from dev_name(struct device
>>>>*) ? As only Android parses them I think we can get still away with
>>>>changing the tracepoints ABI.
>>>
>>>works for me too. Is Android actually parsing it or just ignoring?
>>>Because afaics it's always 0 in msm.
>>
>>Android has used it as part of the bpf map key:
>>https://cs.android.com/android/platform/superproject/main/+/main:frameworks/native/services/gpuservice/bpfprogs/gpuMem.c
>>
>>>
>>>Lucas De Marchi
>
