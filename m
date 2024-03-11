Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EEE8783A0
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 16:30:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C1F810FD75;
	Mon, 11 Mar 2024 15:30:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gyi3juWP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F63C10FD75;
 Mon, 11 Mar 2024 15:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710171023; x=1741707023;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/S2I6SHmbEuS3pRt6LjbovtQs1uGjPd/jRkFcE0N144=;
 b=Gyi3juWPLbtVbBEtbd3JOVyJ/LECzXgUNSJLAD3sGcDVHMsW3BY2r7ll
 o07EwxwFDSrAeYeUnwcoTggjb5fZLss6sQZIuCwtqF4hINAriIAd4eP00
 ogzCidO1jtTVo3I3RaVNO5zpNB3FKQkkoHtzmT71KJ+splUl08Lr/OXZn
 cU14zYEvlPCx0k3Nrk6uSL8TFm2DeFKY0HUSaU5ae3c/2i00sn1CkHBBV
 Q2ebedLbi5bpxCMnJzKgYKCzeDBLxqdBp8p/MmWY17ZPRfKAVNvWr/EA5
 raZzcwnrkyj0DJfhIl2zw3lkSrvnkKa0iNIOsU8dFy0PWmk6UrFrjdn/f w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="30277938"
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; d="scan'208";a="30277938"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 08:29:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; d="scan'208";a="42182812"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Mar 2024 08:29:50 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Mar 2024 08:29:50 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Mar 2024 08:29:50 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Mar 2024 08:29:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QDVfoYaiC8ogPAdk+k1w1PXZ1il70e0oaAP8bxtTte9Xdcd+9GxFiWNX4PWbbmDsd5yBSNcui+YPqQIFsxdzP712xeRI0xaltK8bZwCvM7kkU0qaQiBklk4xvghOPhst6PEYyjT9kJyw+Wcha18I4nrM4hhbaOLTQiZe6kZvgmE7odTFG4fQITPrs1eAb67R6KYAgAvrmMFy2tZ9MqOoLasrRP23X6WU8nXtn9JRZLApC36GFR80w4yxRLp8RTMXN9WxKdMCkNPes8Y6wB9PwWs0lyI8tvpOll6BdOyfxJqSmHUWsO3mACaJHY2YbOVQFzNymIOJ79rK3NL1F8hQ0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TzYv/tdXKSVr8y183nY37CaRBS+F50WSXTgPiRC66LI=;
 b=QenZH5EG1B318ku+rFTDP/z0pN6XBBPhVDZv+xWphlHN1W4OlRq81Q0Ac961an1pIR0QH+mAiutuMUY9V0KS5xb+CxYpzzQ9nl+bGgru9attqeY7PYmtIp6kgbUSNuycXsmSVdwlF/JFClndLfpiegigoPGOI3rgvnWWqw8dMKbtVyG8vWmSg/QUFGBJ2zNoQG380/mI6wev4jQ9KVdP0X2AGoTM2Qs7xWXHfBWsUUhjS0mWPEs5U3BcRd83+rZOflhSH/MFY/7PhLYWnNMNbnj9JljazkPoz9TEdTSIQUJqD7rCqyJIRmaIw3GLhhf/4zVdvVJUWtN0O3BR6j73iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB7399.namprd11.prod.outlook.com (2603:10b6:8:101::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.17; Mon, 11 Mar
 2024 15:29:48 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7386.016; Mon, 11 Mar 2024
 15:29:47 +0000
Date: Mon, 11 Mar 2024 10:29:45 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 3/5] drm/i915: Update IP_VER(12, 50)
Message-ID: <zlewmyn7wl4rxsuaukyoqwgkvfnhwzv3zy6klelxiqu3pcxwap@tafrxqb3seqo>
References: <20240306193643.1897026-1-lucas.demarchi@intel.com>
 <20240306193643.1897026-4-lucas.demarchi@intel.com>
 <Ze8gq_k3HeVqzo4N@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <Ze8gq_k3HeVqzo4N@intel.com>
X-ClientProxiedBy: BYAPR05CA0009.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::22) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB7399:EE_
X-MS-Office365-Filtering-Correlation-Id: 194ad925-2af6-4c32-ea1f-08dc41e0160d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GRku1+5tQToFCORE09IW7ODID74BhOV0CJcrw+mLVh/cL2fI8g1F00RnHT6fIve4gqAqh00fjREVE2H1vXSkZPCtgmDYwaRRcO7jX0cC4DE4gaWZcPvX9mmsA6pxxvxCP4jWSjAZ5aXMrOxeCQwsCVmlyBmQqSTiTMrrsieq90mleuXJhmCkgYh0rljFI5ywVADBMjMl3S0wYdmO1QxRoWXyGkP4Dqhex3Eh+GMQEdwWB0pT7x9mokbHcsSFazPwPN6Srhu9cDSIUXKMn3o+TbHTgzqMuzWMjU1GkqJ8EFGU0vQtbbtuGlz1+Tvvc8HkE1Ge7yVTQLaNug4WNR1/wHMjP+/va7Hxj3efQtWTFykbSA0cbcqDsB2JxqenVjN8diltYx0D/bB17MUrPxF7OKQ5NOb9QJXGw9a+XwFp1T1TvFX0XUT0xajogvK88ahVY4o5Q+F7GZCm1tFfbPNr0YLJTi4Y/3t2JsC0Y3mP4cPwSq0rsE991FsGHwuBUglzcvYgo9rBQ2SMiZMfvqXFJV5BqbrnBy8W/nNJ9ib4nhzkIUQBh1FMZv8YVTYgLZPfOYOl5qqtAzvkrjYDKYAxyLY450ZCnqaICSLw2lk4H0bOcfz0DWbPQ6vru8urovC+muiFWxFX2vx6CW2AuhN6Q0H035w0UV4fWnI5wDc06ss=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ogsfEIp3cBk+pG7+N9pib60ZCNmhvPFv5HRvTHzVl7fGD9Fbq0atVCkv28AW?=
 =?us-ascii?Q?JUBHYqFXH56ytW8cDaE5fY1OHPzP+J4cx8X7UVR94vwuPWJ3eXGHXqYjgY0D?=
 =?us-ascii?Q?No81ucifw3f7wqyaHXEkbazH3sXhdcUeXEQyl57pISXyDDoofUaqXugmVYwn?=
 =?us-ascii?Q?uiGpajQuxy+Jv/5sSlPAdPfQn/s1sCYkgj54klbhWfcvsAUOde0/fUogFkCa?=
 =?us-ascii?Q?FsAdeOidoXbwJgkea6ZmXBfKSlibj/PO5EeXId6udnnhgcB53HG2UGcmSSmq?=
 =?us-ascii?Q?c9t41DcnsALpbbWy+j8PYV+MfFBU8WzYHUojIzKJfVMgefxBn+ubjtfigoiP?=
 =?us-ascii?Q?BL6g64dCK8QijbdSC3gsJTvYeeFm99wkv8+ZAEUKSWfhDvRGg6457KbB5ngj?=
 =?us-ascii?Q?wo+6VLorxPkjeYUzA1NzZL9ZdoXoQr/437yeNcd7PjcmULRcBXk16atgU51U?=
 =?us-ascii?Q?lBGkMZovV3TmDalxtfiiff23TwyK3HuegtIdPQ7AvheRQMyQhOCGmrO9wT9l?=
 =?us-ascii?Q?jGZZtQ+DTvj189u6YE1le7y2ent+09QyWBtXL4AEzzMHEfW8FdmNAlN9MVes?=
 =?us-ascii?Q?aVdl+D9K1xcUdzYYHeEudihAAvk1nWYh+42ha9W/DgH9UDzINqpv+p6ix6KL?=
 =?us-ascii?Q?oywbE6ak+xAy7bUnPeALaK68soX9a/UUpWm7feISGa7f4S4A6Z5VW0/i8PCg?=
 =?us-ascii?Q?LaLEXpXr6X1Hg/BrQtfBbYBLKewkq/v7UxvMUylfOXpd/DHHN5IE1DsDRX/K?=
 =?us-ascii?Q?rz7ZDjdCSVhpZBzAccPWnVPnDO+xX58h4DzFpR60aaOrWs3BPG0h/zWP30Nu?=
 =?us-ascii?Q?/MKwGP2jUGhqItKJL2R09HHbSZ+tugtKLfk/UHeTWsDwPiMuVhhqsipNaRvH?=
 =?us-ascii?Q?v9SpIECGeb5SlSX/p4kkRT6zAoZSNlSbicQZ0SRdWRqXt85DRD2c2RKS6qq+?=
 =?us-ascii?Q?BVP6d3wWAXhD62ZlHw8WbnaVZXxK0D/73uzTJ2vgBxqG3G1f/dCaLjSNtQKk?=
 =?us-ascii?Q?yzJe7PKqwJ2wBw9+8trMiTNS6qRuCeUur9X9mEnd1F7EktzrakzSEAEuQp7c?=
 =?us-ascii?Q?muP/d9wDBTMa0szSkHlaIQOPHsNGbBtj4bfASrtjm7z7V1acyhNJmWFdQDjm?=
 =?us-ascii?Q?bPYYCD1MgE8a20x0xvDKZG8JKvk8/rEwDJ976uxsDGyRgoX8XKaOg2U0E7OW?=
 =?us-ascii?Q?uV490UF0+J84MkIk9bGaI+LMNVfWWBrCjxnc5E1jp2JQih/a4Fy8imw5Ee16?=
 =?us-ascii?Q?GkbcO/dtwdhvS4kyuFjVhzlo4s9XA3SS5zCKl25KdPtEzuFtI7h3ZGLQ9mYI?=
 =?us-ascii?Q?CbGu0HjoNGP5fawtLDVIrHr5ghglEbPUpooPN154C5+MtRk+pv2Ygb5DFz7E?=
 =?us-ascii?Q?2FccPJrusweVV4XLl2HTnKQC1wJUgt9UcipHiR8q5erzCLrQg0U/fE63dOgR?=
 =?us-ascii?Q?IPdxCVP1Mcvbo92JzGKyrnHDnCu8fFLglIZ1k8WCFvFiW7TszPyxaSVG2hc/?=
 =?us-ascii?Q?b+oeeHP362i53cj8eDaW7lLJcuXW/EXJzOC6syXeRmjEeZQYl9Tm3NgabgaN?=
 =?us-ascii?Q?VN2amdJIVDyV9IgPL0U/VNJWFGsr2FJcL0t/sReM+kl3lH9RhlL4Q8w9Y14I?=
 =?us-ascii?Q?2A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 194ad925-2af6-4c32-ea1f-08dc41e0160d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2024 15:29:47.9403 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y4RuNkOGfLVPh1LSfEJrEiAL8ySmcCUlKgasXIDeHJho6aB8DHThe8lO1jwz8vCY8UHJ1VwGdbOTO2u6tNJ0/GZPYm1eg900nhKV0Vo3LGQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7399
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

On Mon, Mar 11, 2024 at 11:18:03AM -0400, Rodrigo Vivi wrote:
>On Wed, Mar 06, 2024 at 11:36:41AM -0800, Lucas De Marchi wrote:
>> With no platform declaring graphics/media IP_VER(12, 50),
>
>this is not true.
>We still have
>
>#define XE_HPM_FEATURES \
>	.__runtime.media.ip.ver = 12, \
>        .__runtime.media.ip.rel = 50

<snip>

>> -#define XE_HPM_FEATURES \
>> -	.__runtime.media.ip.ver = 12, \
>> -	.__runtime.media.ip.rel = 50
>> -

^ being removed here since all the users, like below, are overriding it.

>>  #define DG2_FEATURES \
>>  	XE_HP_FEATURES, \
>> -	XE_HPM_FEATURES, \
>>  	DGFX_FEATURES, \
>> +	.__runtime.graphics.ip.ver = 12, \
>>  	.__runtime.graphics.ip.rel = 55, \
>> +	.__runtime.media.ip.ver = 12, \
>>  	.__runtime.media.ip.rel = 55, \

				  ^^

After applying until this patch:

$ git grep -e "rel[[:space:]]*=" -- drivers/gpu/drm/i915/i915_pci.c
drivers/gpu/drm/i915/i915_pci.c:        .__runtime.graphics.ip.rel = 10,
drivers/gpu/drm/i915/i915_pci.c:        .__runtime.graphics.ip.rel = 55, \
drivers/gpu/drm/i915/i915_pci.c:        .__runtime.media.ip.rel = 55, \
drivers/gpu/drm/i915/i915_pci.c:        .__runtime.graphics.ip.rel = 60,
drivers/gpu/drm/i915/i915_pci.c:        .__runtime.media.ip.rel = 60,
drivers/gpu/drm/i915/i915_pci.c:        .__runtime.graphics.ip.rel = 70,

should I reword anything in the commit message to make my intent
clearer?

thanks
Lucas De Marchi
