Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 008A08783E4
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 16:35:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45224112B1F;
	Mon, 11 Mar 2024 15:35:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AO/zffOD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AF6E112B1F;
 Mon, 11 Mar 2024 15:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710171328; x=1741707328;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=O4goCwEZ2e/3CviX7flVZGqiKwaW0H2J86ULJXSfmdE=;
 b=AO/zffODHXqFZauLYC/YLrVcY9+LtVTGu/7nag9KAmCcyPUqv2kznHmh
 tWtVUVANsnLp+kJWqjIbCsrc8nUcg7EF2Uy7alN7DxT46veYrEwdqjL4X
 7Koq4YYBgko2AVzR4WNRa9NY7SKq6mpsfY+7x+2lR0VxfDJo6hLekZZM7
 kivC82JwTv3DN5jyHG4M3J+lpPymZIQd6RLgNLhb7fA5JMdPZKr79P4UH
 CYfaecK81y1U8hLmX4ecsRvIgz5dKJGH09sTb3Rpw39++q9leA8It1eec
 hh6e1ijrAv7lRALTUEktvtDFT4ahc73oaeFh/MC2dpbaLo9qfiYhFPgVt g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="30279839"
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; d="scan'208";a="30279839"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 08:35:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; d="scan'208";a="11189031"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Mar 2024 08:35:27 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Mar 2024 08:35:25 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Mar 2024 08:35:25 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Mar 2024 08:35:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dvr/4cifVltSPp+EHlHeYJXwyB4G110C85Ma4oPwCN+MyL8DTbgYLJh9cOjrQ4jt7w17SVWLze9Cp1KwJZZQjmfkDMjZWzEi6DdeSWsS/RP73TValROw87sbTiXUciMQknjH45FYz+QvEVyvWYk6Uu7NzWh+kS05xf4dH79mvluGLUel9q5DxwfEKUyXF7x3rSNjhTis3Ztk/7DwBVVnhvLCTvOPSEO++KqHiQ2eWEeVv5wYwFV3FeTO6PErpBtdRTLp8yb1JImLFXdvc/t6R5DuUhhJDeCDbpinkVNYhz2KyCbFZgjRCb88hezya3o9SZ3VgjF8Hya9n1suFllmlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A4wtORdaDZ48hUqMabJdMlL2ue1MVTf6sa1CpBvsKxM=;
 b=W9K3rVeTr/BRNB34Hr79A5K5L1rwoT8O1WtW5cjNvfAy8yxcmlH9R6VHGxA7rwhfg36cwX8/Hn00gHKbZvy6AcPnGnJt6NRJjKlYTBOd8RwvAUVemGqOCctnkQXHaTG8Ug25RpOxnNmVclHSXDe7k/O1Sr5FfAml812GjAyo20KCHnOr6HSgEhOEoNLHNVeBVG4Q4sEpcyInQdDbfYBvzAX8LOivdF9YmZVsx/kChCw7xl2Yy9iSOLcaT2NsI8NY4pEln4Ndwid6C4Vc2z9r6m0wamZ1QD6BmLePvOjVxgqEqSoPPkZ8DwgTRMzNhT6LF+IKh2OAY4Cj2G5RbXoaJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB8763.namprd11.prod.outlook.com (2603:10b6:8:1bb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.16; Mon, 11 Mar
 2024 15:35:22 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7386.016; Mon, 11 Mar 2024
 15:35:22 +0000
Date: Mon, 11 Mar 2024 10:35:20 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 4/5] drm/i915: Drop dead code for pvc
Message-ID: <xzrhpvzuah3cgghbbbhrjwesgtvotlipracgjcvcn3deiae74v@dnyojvaqtsii>
References: <20240306193643.1897026-1-lucas.demarchi@intel.com>
 <20240306193643.1897026-5-lucas.demarchi@intel.com>
 <Ze8jW2Hr12rMXeZO@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <Ze8jW2Hr12rMXeZO@intel.com>
X-ClientProxiedBy: SJ0PR03CA0047.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::22) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB8763:EE_
X-MS-Office365-Filtering-Correlation-Id: 450d5fd7-d966-4e66-345c-08dc41e0dd3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AMnxKunSsnINBlRCQ2zY0d+Y5RM8bhWuiPhkKupgVev1wWdVGN2FOP8MKZRFNof89A+Mueva09Vy0NXSnvFllh5KCKV3TrCR5E543OgCRXcmPe2renvdNfpoTix4moAVFYU5WA94W31SELz7zy42ksiDf05VWBYt4zG4zTo//UVWbAULC7cW3l23VdG8IZYLKlbUNeK2+aRwpII1S2VIFvTURJBjvvU6vNLK7OtLC/Stqf18FHo/IyVCfD9nH2+OeZP7Hb/4yrrCV2aF/zr5f0knLfbdb7AB3YckMHL+6T0FSXYBzBABnJrFWMxM/vCrLnkbaER2vweyWdGZKKgSAiyj/qGt4lw5DZ+QRbhALpK4GclP6UDRpAymWKDPyyb0heCudTnEpWI3Xft+Sad1sT0YfxdRZ8km7mux0m0E47Iumue/twcJIaADZEp9DfsawnyRASiLQEU4URaVGqK0a5hw85llMeTeQNQuYtjB7RJXEsmoaOTP2t+yj/faMEOnL3ImrskaO+BYPtiJdi5+qLpWMrL0p4pPoaK+/UfSrA5992EY6Qy1UCTl1fqGcrVz/dZGis1b3xdX1B8sQXsEz5wGJdxhdEnkXvxda0XlIr8IcrzcpwSV1+m0wlYIAoIitc+qTq21efhB4DMK+DYI4D84dlRztyaoC/1xu2eE7iU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZonzsBRrf1HO0PiI0IKGcGC9811fSreIuCOC3EeFI6o7bztRIL2MAzN5b1Mu?=
 =?us-ascii?Q?hBZNL8TEckLJ7jzbkKnV6Pr8s6xJj8ZgkS7BwPtmdKAmY55eUFvPcFfBErHH?=
 =?us-ascii?Q?EdDaiN6sMzxkp7nZZyNLzgQoGIaPwBRivn9giXU72uhEN7pZ15O++89z1lA3?=
 =?us-ascii?Q?3EM+yRtBhP5HLiG7A+BfLjmTFvRrgOeO7qx22vlI0XNmk8qIRntCodMArF0B?=
 =?us-ascii?Q?JyHUDxRvXxdsZGbXoBQ0/71JUDMFozY6hTP9bnRAIRhOeCM0XHghSHEhMjmJ?=
 =?us-ascii?Q?m8Zlhn2NCdYfTsqjHb4lFdCeruJp+305KnVPhWmj2yBeIQK7ppg/PE5aIujK?=
 =?us-ascii?Q?FeWA+IwF6fqGt8quW7wd0os446Wutv+tWDLpEXa7eV3wZJDGwD5DO3fAlxqr?=
 =?us-ascii?Q?wkxkRPPuGWDelYgGQhQnRe8eKpOuIU2KH57hCIo/v7pCgJcAQYNjqKYMH+VX?=
 =?us-ascii?Q?bhMOehTHD+OJjFb4MEb4pQ3vp4DT8f+t6LxX4/IxgnXnJ9Au6TsejMWvqBm/?=
 =?us-ascii?Q?SxzlhBMrgwG7Iakg9Tru7mcDI2iHb4wjyHxaNRkgqzP8CfN9D91D3quy4gfL?=
 =?us-ascii?Q?4yJ31tCDPKNJdSVGSUmHsVDJXEjo0I720HZyenuvLiTfrlEbS5XbLRB57W+n?=
 =?us-ascii?Q?Vt8XUf5bTFqTbFwF4mqxIWyK4DkDWzr6Jyv8fRKJsr5M6bMPj272mhnJaMXI?=
 =?us-ascii?Q?l4zQ/pg2uri/E2quTSIa6rrRFX8L2EDq7niPIV+8t5yjrxIi6GvSgrdSHs4T?=
 =?us-ascii?Q?0GLVMp28E62SSjTajsypV+xin7hoYUm156zRMbkSEwjZBSrhavY2s+U7THHT?=
 =?us-ascii?Q?6uH3Q7eQ/zyghG573jPYJrOWLTGhwylIHxN4dOJ2+c114DmonNNqzmJNVraX?=
 =?us-ascii?Q?88fLk+eiymXe+a23BbX18okgvBmZk5CxJkvMtH1sqDEtbrFqUa6rQwo+BNIY?=
 =?us-ascii?Q?h7zTM+uh9i06faUIww5BYjSXhVil0Yy4h0pLFnHwTXM2uqlGm3VUxkIEvwNG?=
 =?us-ascii?Q?c8viNbsXqToDoDllmPOB6UWHuPPN/Bb6cGpDW/9Tsd2lNm6HFcEU9J+YWOR3?=
 =?us-ascii?Q?2obgCxJgRcBSd/38Ii0tsYSDkXyncub2MsW8Z9jpVtLmXYy0D5qvh9TJz6rY?=
 =?us-ascii?Q?pqmH16lFLd0UB//fTX1VqwfYMrZxvWowCo/1tBHyHgYq/wT4ky2gOpihrxYN?=
 =?us-ascii?Q?/LmYpn84CVKZf48bZhA3Aje8xy1ag3v1Sn5nn1U3z8qhPyaAB2V0f4kEdP7r?=
 =?us-ascii?Q?WWkQeBv1Ju04bpCM99tY4reXqovVIwCZAR5c8HB2Dou1nK7sUzzap4TFwNus?=
 =?us-ascii?Q?qtHaqZAarMFVeTr3w3q1vi1PL8NUY7gK0B4KGjiUE/UsBPuuqxAQfD46DFCc?=
 =?us-ascii?Q?tsihZ2YNzJfDijJPaYNO3f4lvHGqRq83ZWWn7m/oJvyhjW1ONr1kHXARmaj3?=
 =?us-ascii?Q?rdn63UJx5SmER8PE2ghL5tiSdgYy7uELut0vBN/OpO5UhUyIJYsoEXy8QISQ?=
 =?us-ascii?Q?nc+8YWnJolqGuxA66A+j/F45TQL+5n6rrm4HESBtjp7uVrEchEGHbTBkQGWP?=
 =?us-ascii?Q?12DtPEFjucAM6xYRGPXS/bCSKHwuv+CqsR/TNZBLWg+5F/D5u1fDalwFDnO3?=
 =?us-ascii?Q?TA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 450d5fd7-d966-4e66-345c-08dc41e0dd3c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2024 15:35:22.1154 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LWEwHhELYCz5zGTWTu6FJusUXDVdYe46QvA5elyxtbigkuiuwEB+YaVMwCeGiLwiOezw1HVo7izgKmnZ7ByluYbC0SjChWN64wxVne3W9yk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8763
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

On Mon, Mar 11, 2024 at 11:29:31AM -0400, Rodrigo Vivi wrote:
>> @@ -2907,9 +2829,7 @@ engine_init_workarounds(struct intel_engine_cs *engine, struct i915_wa_list *wal
>>  	if (engine->flags & I915_ENGINE_FIRST_RENDER_COMPUTE)
>>  		general_render_compute_wa_init(engine, wal);
>>
>> -	if (engine->class == COMPUTE_CLASS)
>> -		ccs_engine_wa_init(engine, wal);
>> -	else if (engine->class == RENDER_CLASS)
>
>I don't believe we need to remove this chunk since we are not deleting the ccs_engine_wa_init.
>If we want to keep that as a placeholder we should also keep the caller as well.

right... I had removed it but brought it back since I noticed the
kernel-doc mentions and forgot to bring back the caller too. I will fix
this in next rev.


thanks
Lucas De Marchi
