Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C781C8D2D05
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 08:16:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE48610E059;
	Wed, 29 May 2024 06:16:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nif0Ia2T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DAAA10E059;
 Wed, 29 May 2024 06:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716963380; x=1748499380;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=plxuNaltr40BkVWNsJXBeCc+PYcyfmGeDFiS/GzV3c4=;
 b=Nif0Ia2TJtIQZb3NhyClTnmNqDxGGaYO7MpGHe5PNkDtchOhG56zhZD9
 Wy8PvVYNQrpA2Jgpv10nJpCHl4a84Vg9BEPR79AxscmUgXw9is1asPBFG
 ng9TBgFWnYMtKMrrluWxk2LEvp/uF2TSdILJdZGrADAy8AE8s4zSxzW8O
 x6tThxcUZlgvkXWNZy+EyQJEn+IvR+N675nETyFZYFqOgDFUV+n8h/Nrl
 inFEpUkkgH6kjvazxQ12/f5bWNTUFQhC3jdx2Nuvdhsb14xF2wZ61Wqk6
 2d8zo2zjsEc1onDsff5lIwzpa7UX7obtA/pFhVqTR/m7rmXn+qjydJ3Dr w==;
X-CSE-ConnectionGUID: tIPzRPdvTIylQQA/GEQTHQ==
X-CSE-MsgGUID: 9FSW3t8XSOeDvN0xHcGveQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="35868557"
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; d="scan'208";a="35868557"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 23:16:19 -0700
X-CSE-ConnectionGUID: t2sSqBkXSCOyd6hPX6C7Yw==
X-CSE-MsgGUID: Ra+Ybh+GS+2JQzNTFRsYaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; d="scan'208";a="40196919"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 May 2024 23:16:19 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 28 May 2024 23:16:18 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 28 May 2024 23:16:18 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 28 May 2024 23:16:18 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 28 May 2024 23:16:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OkXN2CsKtFMRvnsanfy0ruqSqarDaEHmjiE5azEEisVr2WVpJ+55zPDjt6jfyppX6B7FeDSGeeEQLltmOHf4hkN3oG4Dw0INHgGJmOUxCu/ZyCzn5+lcG9gatg667d5ZbxtZzEFgNRWT5H/PZU14eGCAIRJao3ob3H6TNkTP8va5fFBp9zjNS3pC+bjM63lDENm5PAnGhHYSBQ4otB1QCQNsunwzE7AioYaz0DOrD6tZTyWfJeODtJlrinMmeYRLUdEzSNKYNGXtIfgqTB38G0DXQF3/LCly0IBri3rmsYaWsCiZtzRku+CiclwBdQrHFmyxqlq1zvJx1LteMEwsLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W5mDMuApDWyTnOm4FULD8Of+AXVd6fgT+Sq6WYWD3vs=;
 b=GeSlQd7HeDtXwOHADUoGuW/Xkkz00+IpMg3lbhpQj3H/zyMZ3Qn2dP6t4zas0Y90AwTCX91eW25PAc7C08IY9MiXzno8CWI9MEdBTQU7t4BwYg7Fjbsh15B34WMInAwK63fhQjSzqBR/wA9bDVHlAwU+rhadvL16Cx/OjZMtVTYIpyIZw1c+6ln1BqiE0GoYZbs8D4MAJlwiEg6rtC1EcjmpyJd++Z5CCNqARtQuDqk1Bb2fa6cjVB5wLCrynY85CGqQUWDVdtmvckmwHH7Yafte7hbummCJH61ezgWMvIrZxrQsH6XqDpiljHgmVot4zkYPBeXSM2l/sfztGSnpeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by MW5PR11MB5786.namprd11.prod.outlook.com (2603:10b6:303:191::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Wed, 29 May
 2024 06:16:14 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%6]) with mapi id 15.20.7633.018; Wed, 29 May 2024
 06:16:14 +0000
Message-ID: <827d6136-1370-4c98-9536-b4580bc52411@intel.com>
Date: Wed, 29 May 2024 11:46:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/6] drm/display: Add missing aux less alpm wake
 related bits
To: Animesh Manna <animesh.manna@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <jani.nikula@intel.com>, <jouni.hogander@intel.com>,
 <arun.r.murthy@intel.com>
References: <20240527082636.1519057-1-animesh.manna@intel.com>
 <20240527082636.1519057-4-animesh.manna@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20240527082636.1519057-4-animesh.manna@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0171.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::17) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|MW5PR11MB5786:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e47f8da-764e-4fa6-7d0f-08dc7fa6d818
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c2FZaC9BTnF4VXBaaFF0b1NsejhFVDR0ZkRvUENXaklIUnhpbEhDNUcvWE8r?=
 =?utf-8?B?d0h3SURPakFKY3h6R2dvcWhxbjdqelF3bXN2czZaT3VBMzBqek02Qit5Mkw5?=
 =?utf-8?B?RFlTRnQrSzVldUhBUTROb2Z5VythdXJqU0NOSC81dFdnby9yb2JkYWE4N2t1?=
 =?utf-8?B?a244emJpMXBQYkxXVDViNTdYVFdSTi9kRXo4bHlabVNHMHd5R0Z5NVBuUkNo?=
 =?utf-8?B?NmJ0TXRaaDdlTG14L0RJbUZBVzBHOW93OGFEYmMvMXpLbUNObFkyMnJVVjNr?=
 =?utf-8?B?T2tCbHdpMkZYa2dBYXBnK0ZPWVFtK0t2disxRWRZVkRCWFNTUmJhZExOMjhZ?=
 =?utf-8?B?UEdjRGJ6TmdSOHdITWxmQ0gzSlV1bEhlRk1BK1YxYWc2OFVvK0sxNTJKcWl0?=
 =?utf-8?B?cjlGbHBMMktLVGZwT285S0I3MllVWThma3RtSFlqeWFqWG9tSU5Ebm9MR3l3?=
 =?utf-8?B?NHR1Z2pnMnFacEVRQVN6d09IRjhQTllHWmxDajN1K1Fqb2lVSmlpakgvTFN1?=
 =?utf-8?B?R2srL0swdE1ueTBpT3lrbGEyTHVwZEZVV2l5bXRJUVQrYVk3eDlyRXo5U3pB?=
 =?utf-8?B?TUc1TXEvbjk0Rzk0UWlUYVdVOXVuTFdMWmZaT3BmQVoxL1RyYkdtUkhEa3dO?=
 =?utf-8?B?NjloZ2owcWxLWjRKeHk5ajJzVU8wc25lVU9kSUxtOGQveks1anpROUNZaGpE?=
 =?utf-8?B?N0lOVmNqMHdvcW5wMTlvYmJ6NzR4cy9nNkxDRUNoa09GNTh0UkhGdkIzaVdp?=
 =?utf-8?B?YWpmZ1kvemVTQW5oTGZINHJuMkEwVm9MQ1cxZnFsazNwWm90V3U2U3h0T0VD?=
 =?utf-8?B?REp2bkxSVDlUSVhoMFJ2ekhaejNOb0ZUOHNteWQvVWJoWXRocWJCYS9BQnVK?=
 =?utf-8?B?R3hSOWoxcWFnNDVHd2NXa0tNd1grNkN5dGU2b2RUenJyN2tzL2FzZHAwMkt3?=
 =?utf-8?B?TTdsOVpCWDlhTnhheUwwSTlrWXRrVEY2ZXQ4aXB1ZVZQNnFsaFVUNURGaHlt?=
 =?utf-8?B?M1VtYzV6aVZMa1lwaWVIZHlkc1BCOGprdUNPTXlRZTI5ZzVqNFJlL2ttb3dF?=
 =?utf-8?B?emFwVG01WlVoTFlUWTA2SFJSQldqK21WY1RTcnR0TkpPRGRoNnJTQi90b2dL?=
 =?utf-8?B?NnVpdTU4Y284SERzTTFydFR2bnZwdVM3TG5BK2NqN0h4bGZvdi80Tk9GQ0p4?=
 =?utf-8?B?VnBHaFNFbHdnK3hxQ043ZDdldTFZUWdXZEhxZnhIM3Y5WkU0ODVYeTFvQTJT?=
 =?utf-8?B?UEFiWVJEMkVZcWs5WmE3RG5qckprUmpDUFhueHBkOUtyVW43Um5TWGJZK0xw?=
 =?utf-8?B?S3llQjVUYzJQNklDVm9Ld0VGcTRQM1NWNC9iUjJxMklEN2x3Wk9pdkJwTnor?=
 =?utf-8?B?ay9reUVjelNwMXh3UmlucXJaU3JJVlM1QldTUzdRNGdud0EyYkdtNjl4bk14?=
 =?utf-8?B?bFZjd2FJLzVDc2dNenB4dnBkbWJXLzdzT2F1QmlFUHRYL0dqNDEyOU9zTVN4?=
 =?utf-8?B?bjFLenpITFpLQXlSc1VzNDdNNnNYaG5EVEoyTTFtekxtVE80dml1YVVzSGJi?=
 =?utf-8?B?YWxBU1NWcnpnY2JaZlExWURHY2FJN3h4RGV1YW5UZW9hdnBvN0M3OE53VVZu?=
 =?utf-8?B?UlZsaGJVNVV0bXRiTDdTdW50NjZYRWcwTkRBVm4vdHl3RHRqUStLTW1wWXND?=
 =?utf-8?B?WEl3U0R6MGs4NkZFVnJuQUl0T3FubTAxaGJEV1hkallRK0lxMGRYZG9nPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UnM1ZE9oTW9yWlk2ZGFJQm5aSytYSEd5ZjZCcFMrYndrYkhBazUrS1lXUVlp?=
 =?utf-8?B?VkJuamtUbWs3cHR0M2lFVXJWQjI0LzVCd0xCSlJ1YTVoQyszVkRtK1Y4azFw?=
 =?utf-8?B?RTdIWnlSZGovUDNWZnVWN3ZzUHh2QnVJRHRyOGFiZEU0d0VVd1RzQTJpMnlD?=
 =?utf-8?B?cGEzZ3NXQTZXZyszVmNiaWRjR3RLNjhyL0dwdjJOVm5jUExVUHJWaW1hRVFI?=
 =?utf-8?B?TDgzU0xrQVJnM1VBVU1lZVJFTzJkTUFwa2hFMTRMSE13SjgzdHJPS2VpdVFZ?=
 =?utf-8?B?NDI3OElTU29ESjFQWlR3TGt2TFFnTGpjamFkZlRSSVhFcVR2NC8rY2cycVA3?=
 =?utf-8?B?d2V2amJwa21UaUlzVUxlVllkZ1hiQ2ExUlNYemRRclF4SVRBUlQxdm0xUnU5?=
 =?utf-8?B?K2h1cDdBaSsrZlg4VkZlUHdrLzZaQnB5eTRKa09DQXIvZWhoZDVyWTRDRnV2?=
 =?utf-8?B?K25mYnN2amRPZjdkWXZUQ0s2QUZXNTJtbTJSWEE5VWx6WmluYmdCZ0ZDWDdR?=
 =?utf-8?B?VkszZEcyNE41VHVqNVNuQ0NZUVVKVXM1a3NDQnYzOHJSZEhxaEZaelpBSjU3?=
 =?utf-8?B?c2ZHT010eTNTeC9sc3hURHhxSUtLd2NEZ1BuaGdxcjR1d1JiYVowQjJRNWVQ?=
 =?utf-8?B?djRuVkZhVFprNW9HejJUK25oWjNQTkNYM0RxWnY3UHNDbyszaXcwN3psTktO?=
 =?utf-8?B?bFJuUW9DYVpaaFArRHA0WDcrb0lPSTkwQm01QzhoS0h0c2FhSFM2NlVuaCtY?=
 =?utf-8?B?eCs4VmIwdXhZbDR3VFl6MlByMjVNTDB1MGZkV0NSRDVpT2tuQldqUFpOeExE?=
 =?utf-8?B?SEFmRnF0VmJ3WEJOSm1uWmN0QVdtNWVIM2hGWkl6dFlId3Q5VldJa3hsMUh1?=
 =?utf-8?B?UkdMNy9vZGczeGIyMmQ3UnNkOVROblQzdmtZb3FhMUpzRjhkWmw5eEN2V0Mv?=
 =?utf-8?B?MjUyVGpjSG9pZnVVdWNHbGNaaWVWVmFCUlM5OGErWjhsRkplZnBYSDhsU0hn?=
 =?utf-8?B?WmM4VU1EREF3T0RMbEFnMlh5VktqS1dzUHoydEk2Y3dUSC92Z1A0c1NNalhB?=
 =?utf-8?B?Ti95RzQ5WklJcDZVZjdaeU9CaklIMFVQN3loU3BQOHBINnFNVEdHNVd1T09j?=
 =?utf-8?B?UEQ3My9BaVpqdVdIamVialBRcmZheWZEN3kyd05IZVJ0WlhxUlZHL0RQRm5a?=
 =?utf-8?B?dDVGNTR6NldyOVVrL2JMWW8vdDJxZ210eURVVGpETHdXRGphM0ZPbGpaNUc4?=
 =?utf-8?B?dEV5WVRYSTJobXhSNStxS25SMnFkRHJSVzlOL25kVGpDUk5ueXZja3djLzQx?=
 =?utf-8?B?endXQTB1RDczdjMwZ2hKRWVQYlk5U2JtS1VaV2g4MmtYeGN0eGl5SkU4M1Mx?=
 =?utf-8?B?YlJ0cVBOWEtSWGdkWUxzNzZ6eXRESUFPenkwWVprRGQrUWErWEk1L1JjS3hF?=
 =?utf-8?B?dGlRT01Ta093Tis5K1ZTNFpaK0tyZTdRakdaMmg2WHhtZWROeG9xc0pONC9w?=
 =?utf-8?B?dFhIVGNwZm9GdGtHUEVtUXdQMyt1Vk1UYy8xZTQ5QmpmNUNtYlVlYzJwQno0?=
 =?utf-8?B?S2xQc2ZEdC85eWlWU1hRVW44b3JOcjRzUFliRGx4ZXhPYmxROXNtMFVVbkFB?=
 =?utf-8?B?NDRPdmNpcS95K1hnVTZyVkZ0K2VFL2IwdW11YkwzdW9YVnc0bGxxc0Z1NExm?=
 =?utf-8?B?YzlFYU91MUlCTDAxRVJIU1c4b3gwL0R1R0ZJLzBFZSsxZnYyUm5YOEp4Z1My?=
 =?utf-8?B?cnFOMkhvemtCQ0ZHT01Cb2xWZGZhbVArRXRCUVowWGRPUmdGQkJ5MTNpNWFk?=
 =?utf-8?B?STdSZDV5a1RUbDdGM0lJQjE2NklYY3k3ZlZxQ3ZCN1Fsc2JoZEhEaUM1RXpS?=
 =?utf-8?B?Y09WL1NCb2FEbzFpSzR2VGR6aWdtZzFvZVB6a3ZSZ2lBQUFLRFp4UTVEMjhC?=
 =?utf-8?B?YTBGTTcwejRNdk5VOFhBRzVlYXZOTlBrMGticnFWYzdnRC9NU3dDNEdDZGll?=
 =?utf-8?B?VkZSbFh6dkxiRmt4NzVqYWNiNE9ZK21IYXJJazg3QlBlcWlqZEFFVXB2b0lK?=
 =?utf-8?B?UEtCTkFnV0RuM3dnVWgybUgvM0s5bnFQWWROWFJDSVJqV1UrNVpnUUR2UUtO?=
 =?utf-8?B?MTl0WkhPOU1vOHExL2dPdlg0bWk0SE52VC9WeWdwTlJSUjVEenpOUFdHcWxq?=
 =?utf-8?B?K2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e47f8da-764e-4fa6-7d0f-08dc7fa6d818
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2024 06:16:14.7732 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AJYmS9p5yKuoxstLSeucKM+J5wAb2r2g9ucHuIvAmPt+7JBrVl6O+D28NslZViLlrWZ3lPsz3qqHymjyhKS5y+zVjD3I38kXTT4zL2BsNbs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5786
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


On 5/27/2024 1:56 PM, Animesh Manna wrote:
> From: Jouni Högander <jouni.hogander@intel.com>
>
> eDP1.5 adds some more bits into DP_RECEIVER_ALPM_CAP and
> DP_RECEIVER_ALPM_CONFIG registers. Add definitions for these.
>
> Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
> ---
>   include/drm/display/drm_dp.h | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
> index 906949ca3cee..3317ff88ed59 100644
> --- a/include/drm/display/drm_dp.h
> +++ b/include/drm/display/drm_dp.h
> @@ -232,6 +232,8 @@
>   
>   #define DP_RECEIVER_ALPM_CAP		    0x02e   /* eDP 1.4 */
>   # define DP_ALPM_CAP			    (1 << 0)
> +# define DP_ALPM_PM_STATE_2A_SUPPORT	    (1 << 1) /* eDP 1.5 */
> +# define DP_ALPM_AUX_LESS_CAP		    (1 << 2) /* eDP 1.5 */

This bit seems to be derived from DP 2.1.

As per eDP1.5: Only bits [1 and 0] are eDP-specific. The register’s 
other bits are defined in DP Standard.

In any case, patch looks good to me.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


Regards,

Ankit

>   
>   #define DP_SINK_DEVICE_AUX_FRAME_SYNC_CAP   0x02f   /* eDP 1.4 */
>   # define DP_AUX_FRAME_SYNC_CAP		    (1 << 0)
> @@ -683,7 +685,8 @@
>   
>   #define DP_RECEIVER_ALPM_CONFIG		    0x116   /* eDP 1.4 */
>   # define DP_ALPM_ENABLE			    (1 << 0)
> -# define DP_ALPM_LOCK_ERROR_IRQ_HPD_ENABLE  (1 << 1)
> +# define DP_ALPM_LOCK_ERROR_IRQ_HPD_ENABLE  (1 << 1) /* eDP 1.5 */
> +# define DP_ALPM_MODE_AUX_LESS		    (1 << 2) /* eDP 1.5 */
>   
>   #define DP_SINK_DEVICE_AUX_FRAME_SYNC_CONF  0x117   /* eDP 1.4 */
>   # define DP_AUX_FRAME_SYNC_ENABLE	    (1 << 0)
