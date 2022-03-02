Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFE24CAC96
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 18:55:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E19210EF57;
	Wed,  2 Mar 2022 17:55:21 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9705110E84C;
 Wed,  2 Mar 2022 17:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646243720; x=1677779720;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Qp/Njtj09zNkOEBTcvKO3vm+6pnEDOoMrr35EvY2zqI=;
 b=FLzifbpkEwqriaUhVsGHqPO+MAvFiIsgSCh0QII+toPNkYx7zAfmgy6M
 q22kDyRlZHdHGJCWt03KWVypdnt5avBMOWA6IIfF23SauXj9p8W92tSsh
 TfjW6ePvFWP/JyWfymQszGr17CikDKvwFNqMuP0krFfjQeD+ZxCcxGU/i
 wRhLUjSSnqDFR+eVDGhn/+UlpURtkdrvO+1XUPvLR8CG0P0O5EBSIU24R
 AyOIRS2X+xgzu1SXC/XhFu7P3zsp9IyFe5lxJoO9FKT1qyZUG4TEJehXe
 j4T6uid2aJTDAxtaeKBbtUdCRGh2w8B+xfd0mi4aF8T7XQ3Zhsmy1Ojwn g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10274"; a="339896489"
X-IronPort-AV: E=Sophos;i="5.90,149,1643702400"; d="scan'208";a="339896489"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 09:55:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,149,1643702400"; d="scan'208";a="545580139"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by fmsmga007.fm.intel.com with ESMTP; 02 Mar 2022 09:55:16 -0800
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Wed, 2 Mar 2022 09:55:16 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Wed, 2 Mar 2022 09:55:16 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Wed, 2 Mar 2022 09:55:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DgGFhyAk/CMXFmQBiFHbiJdOGCxC0HzAme1IJOJBOVV+fMfr3wsT/39UMWuOh9XGaE3R88hlPgRTlSP5gt2aWybuSvfImRLjhwz6h6inQAysbICCyy+U+c69y2Ej61f5dnb6bSx8OdlG1J2TlpPURfpotZBdmWbWg45W+kInq9NaqBh/filo9OaoAlyWvWM4lXC2/iEglVKZ1UI7zQ69PXX9TEXG2FpWzwU/Q4r5rJ/3mB9Ib4JY5ohNBo5PwdNbudGi8VX2qMJAVwbtaF44GNu9sjRsbhDZB+Lj5ZY503toNc4KW+xCrJ7sDsFI4obVv/7PItqey+lz+0xQxvRT0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xSXVv1hq2yizeUQWfWcbRXay9/CKjANATVFz1LD7NwQ=;
 b=ck0B6NoBs5GxbHDvTvLmRNiHWMIiXDTUbARL0IjANsn+msu9piWmmRglM/2MwAF8WL1jO5Dkq6QW8K4eoMwyua1iav4JRPTSNN7e3nfoPJK0Xnl7bfYJTmg4GatgllCXRbAOrORAo4jIg+FW79XDe07iguEZHBNBE0DFIx93gZxk+R9cdO15IMIPuNPNTG9Km3J972h3DFwChi/sJBDuKs9izAb9lldluhZi1kIERXAQhEBu627tsB96Zd/fZ39q2m1rOrsJJIs1HKUCLPg9F7Iuxloyl3hYH3XbrE9pzOBonU7U6lxG9gKrEwzdtTm2PGocM89myYNRwqVrfXpB1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by CY4PR11MB0037.namprd11.prod.outlook.com (2603:10b6:910:77::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Wed, 2 Mar
 2022 17:55:06 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::dd36:1843:a629:4ad7]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::dd36:1843:a629:4ad7%4]) with mapi id 15.20.5038.014; Wed, 2 Mar 2022
 17:55:06 +0000
Message-ID: <389c16df-f579-81df-8405-376fcf8ce613@intel.com>
Date: Wed, 2 Mar 2022 09:55:03 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.1
Subject: Re: [Intel-gfx] [PATCH 2/3] drm/i915/gt: Make the heartbeat play nice
 with long pre-emption timeouts
Content-Language: en-GB
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220218213307.1338478-1-John.C.Harrison@Intel.com>
 <20220218213307.1338478-3-John.C.Harrison@Intel.com>
 <2a486991-1bfd-9b23-0b43-9173d17b7e13@linux.intel.com>
 <e95e8710-8410-2869-dec1-7f7a9e9a74fb@intel.com>
 <18205069-1210-745f-3bcc-2eddb0d17da1@linux.intel.com>
 <94e9889d-d71a-1428-516d-2928807cbf43@intel.com>
 <6ee75384-2cf0-6b34-ed54-3c7dc9ca31a3@linux.intel.com>
 <d6624800-87b0-f992-bc83-868744e2839c@intel.com>
 <ed505a8e-2d2b-135b-aaab-7e4a0befd5ba@linux.intel.com>
 <f6c70184-121e-9a2b-6bbc-54a67af293cc@intel.com>
 <96b7ce40-12f1-9ca0-1c5a-323d63dd8153@linux.intel.com>
 <9df22764-db87-a2d2-2b03-52b4d4c6da9c@intel.com>
 <9bd316d8-004c-621a-916c-2ebad5c31b43@linux.intel.com>
 <8fb0a3a7-7968-79cb-9ea1-e31b0593acaa@intel.com>
 <42b114a7-04ea-71eb-7cd6-507fb4fb1655@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <42b114a7-04ea-71eb-7cd6-507fb4fb1655@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P221CA0018.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::23) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cf4a6676-b3f6-4db8-67a9-08d9fc75c924
X-MS-TrafficTypeDiagnostic: CY4PR11MB0037:EE_
X-Microsoft-Antispam-PRVS: <CY4PR11MB003710D4343B8C6B5372329ABD039@CY4PR11MB0037.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sgafITRjv39iWEI6WaKMFRcye1ATcUeZ2Yrb3cmc/9aY/lrFmjAShOfVeS523mMqhWY4AQh90lArUNSOfu974T+FXul25lIVQYd4yAuPOjUBGy9lzfq8iEWyJG6I0pxNDblzXrvmFnn/dR2OB8CkLUrgvawXBmTAq1kE2iftRoowPLufBAVT1LH+SB4eJOq993vv+/QPJ0KM6WHV0+j4rkcqoNIg/LYOTIBLtJK5NXLp7A5FYgcxf4q/dtBIUYX2nBiKcaTJYJ13taQXngML6eWWV4Nj2JI2slgArzXWYzFIHl9lE6bdKuoaiRZ+tbJPgB7gkICs/70wfaxV0r/+sMbp/GMsv88Z3s7C2npdOon836cYYRYaqL/aPPuTg9Phy0TzZRfRwTLbnq3YUVbzpU7PYTybvlIw5MdrNvPC48e+zrjs5/RZ91dAhGuXNJ/ExFe2TkdOndWt5Uyn5pttOJJQRma6yGMiou8MxFYxD6PJSQ4TUBUjoQfdfq+UYUI/Nxplve6Mf28TSjuBA4W9+snk4jmYrCRrIJxWm4Sflttr0H6tI6nIpigjmucWBv9pu6YwdPJeIhm621LLU01zbN4JjOwcpEkf83m5+tZ8x+sPVSOaZqYmn2O0+UWIwPxWOtsi1A1YWbYoPTJT9qFo6OdXkyEvobnvNl8zcvODTc5MoFoG82xgjGUezPdPp1k6+75OjS+7ZuKB4SBT5wAxuS+6rYMACTu2sXjq31t12u4V4s9+NzzGdnJWurtmMu6f
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(38100700002)(66556008)(66946007)(2616005)(66476007)(53546011)(8936002)(5660300002)(31686004)(83380400001)(4326008)(6506007)(6666004)(36756003)(6512007)(186003)(26005)(8676002)(6486002)(508600001)(82960400001)(86362001)(31696002)(2906002)(30864003)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MEUzY2JOclpROGtXK3dpbXlQR1BKZGkrT0dYcTIvY0IraHNWTzhHbEp1cE1E?=
 =?utf-8?B?dUp5ZjBraXVPcVNlRzdHbkpKS3pNWW9MamwrTm95RlpudVQ1NXhvMkN4V3dQ?=
 =?utf-8?B?K2RiL3RpMU1HWmZybUIxeXhkWDBtdVFGNnlFRzBzb1dQam9JTDc3T0hEemlF?=
 =?utf-8?B?Rnl4S21TZ1BZcmYyZlFpSWdIZTQvci8xMjliWS9haVorNmJlMU1kVVdsK054?=
 =?utf-8?B?M1JVRE9vbTdGZ05mczhCNmZxaUtIVUtIUzA2WFdBT2JVTTlpaERzQlBXSnk4?=
 =?utf-8?B?VEQ1cWJyNzZRVUs2bkhFaFBGaExyNmw3dk91MFg5UGxiclg3MjB4cmlXejRa?=
 =?utf-8?B?OVorUkhtN3VuaXF0MTYxclM0NUtPaWhucTNlcVZhNDZXeEJ6YnZOOGcxSE43?=
 =?utf-8?B?cUVMckI5UHdOSSt0M1FnUkpoUWZpLzkyZ3VLUkovZnpUVll2VGwxamxxUzB0?=
 =?utf-8?B?b29lMDNCeEdzbkVBM3FHVElQWEZmM2NGdnF3VkJueU5Xc2xOK3pCZ0lQRGRm?=
 =?utf-8?B?cjdTV2NCYmJ2NkNSY29HenR5UExDbWhrajhyNkt2Z09FZDlBOWhlc2xsTkhr?=
 =?utf-8?B?Wm1HSExQaVhrLzlxSEV3S0x4bmxpT05qcExVL2pEdkRiUXI5MzFpZmRFMVFV?=
 =?utf-8?B?T2t3b3pQV0c4VmFNZXhZMVhHSHVBRFo5ZnpESHhIemR3c2NFdmJCUElnK1o2?=
 =?utf-8?B?YlZwTlpYYWUyaE9pWHpFUFE3QW1XUFA2YVVUWEE2VXowdUh3UTJ5b0p3Nitq?=
 =?utf-8?B?UnFPcVRMdGo2c0o0alg5cU1Kc1ROelJHMmwramVtK01RdExiTGNITzkweGdk?=
 =?utf-8?B?Q0w4a21ENWo0eHNmNm5hekZ2QkUvZzZ0aDAxZ0pKV1JvUjNTUEM5bTRHQUhD?=
 =?utf-8?B?dkJuaTRLVWRJN0tDMkZLWDlualpYV2R3b1lJOEo0SU5JVnpacVdFdGxzLzY5?=
 =?utf-8?B?dlVVYnBJbWVMR29SN2RiQ29ldTNYTE1ZQU1MWDFnRlN2b3BlOWdBbUo3SG93?=
 =?utf-8?B?Skpwd0ZLdng1YUJadEIxelE0b2YwT0Q3WW43S3VabjNnd0toOUE5aCtoVDhO?=
 =?utf-8?B?VjQvN1JuVWpuSWRtNk9iNnVUTE5wMTQzSkxrbTVadVVaY3U0MHdIa3drczVm?=
 =?utf-8?B?cnZPQVA0d3hYVVlydWVJZkIxRFVkMGprd1RXVmswWGJRUDM4ejU4UDBNWlNq?=
 =?utf-8?B?b21pWktIUUMyVXNkNWRET29HK2NIZS9HSFlYNjk4WkREWVpDdm5vanJuNVhV?=
 =?utf-8?B?dWZ1ekJzRk05WGN3RmxOSTZBamg3eTVXTlF4Ni9CVDdzYWNuVEVVbC8ybnF2?=
 =?utf-8?B?OURDS3UxWUNOQzRNcnJmUTQxMnNLY1NOUGxrMGhTWWhtUitxU1ZpOERFaTFO?=
 =?utf-8?B?eDIyVFpYdjBqL2d6aTQrOFJpTGJOU1I5ZTNRdU84VHpFZk9IaWs4cDNUSHZw?=
 =?utf-8?B?bmxpMDlTWjlVQjRJM2dlU1p1dTlDNURTQ2N2WWFNRXNWUzZ5eDVGU3JwOTFO?=
 =?utf-8?B?ZXFLTUxId2hycElORm5uVDZLYysveGVuL3ZkQlVvM09KYmhDejBUZGRJRnlx?=
 =?utf-8?B?akhLUEZGUi8zOXRSOVNPdEMyVElucXpya1o2WnY5bG1yclZoMGs3aEdpaXc3?=
 =?utf-8?B?NmdRY0R4YXdwOS8zODg5aE5Od2YyWkFOZlhyVFJIQjFJTlh4VkdieVpGb3pI?=
 =?utf-8?B?QVIyVTF5VU1NV0FxVktyUTVaZGZhRVRSenZsN2xEVFY5dFlmMy9McTF6YXNE?=
 =?utf-8?B?NjN4aGF6OHNwNmo2NzJHeUtqcE9uc2N1SURwcytwU21rWFRDK1NTdnB5OXRL?=
 =?utf-8?B?WWZHWnoxRjJ0Q1c2Z2MxOFFWaURINnAzaG8zTXpXUHh0d1ljUU41QkVFRE9Z?=
 =?utf-8?B?aTNzZGtvN3RRclZiMnIzbTVrY003MzNwdlRLRnNXOHltV2Q3cmtMaWpVSmZH?=
 =?utf-8?B?d243UXVVN21VcVZJeklicjhiN2t6b2xhVDRyV09kOE51QjFVdEZMZmx4Vmlh?=
 =?utf-8?B?aEFia1RNNzZ1UXZpYldMWTJGNy82M1JtRmhrSUZLS2xVSzNNNmN4NmJpNHVM?=
 =?utf-8?B?U3dMdER4Tzc2bVZFNzVFeDdXK2JBNEsvMXN4WkY5cWI5Mk5kZFNYaXFHWUZZ?=
 =?utf-8?B?UjZzVm1Tcko3VER0VytPck03TWFhWVcrbUV3RlpONi90S0w4eHltU1N0Z0JE?=
 =?utf-8?B?VWNzNDhGZFA4MmJSUkZnTUQ5RlUxZHR6bElYMVIySStWQVlKTTZPNXdpY05y?=
 =?utf-8?Q?X/tIX0k/i8DgnAnVB8kTXcWnuy1j6J5f/21CHDS3cg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cf4a6676-b3f6-4db8-67a9-08d9fc75c924
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2022 17:55:06.7177 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4pWb5DyTWbqWLY2r8jGZB/2/4kh8L4PtuItS+MHjgoqy5+9H6DQVgPMsqsmCn45rG5KFZ6/lgKzO2+ySCMsZSTCSEjGsc6bTh+OEZhy4VcU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB0037
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/2/2022 03:07, Tvrtko Ursulin wrote:
> On 01/03/2022 20:59, John Harrison wrote:
>> On 3/1/2022 04:09, Tvrtko Ursulin wrote:
>>>
>>> I'll trim it a bit again..
>>>
>>> On 28/02/2022 18:55, John Harrison wrote:
>>>> On 2/28/2022 09:12, Tvrtko Ursulin wrote:
>>>>> On 25/02/2022 18:48, John Harrison wrote:
>>>>>> On 2/25/2022 10:14, Tvrtko Ursulin wrote:
>>>
>>> [snip]
>>>
>>>>>>> Your only objection is that ends up with too long total time 
>>>>>>> before reset? Or something else as well?
>>>>>> An unnecessarily long total heartbeat timeout is the main 
>>>>>> objection. (2.5 + 12) * 5 = 72.5 seconds. That is a massive 
>>>>>> change from the current 12.5s.
>>>>>>
>>>>>> If we are happy with that huge increase then fine. But I'm pretty 
>>>>>> sure you are going to get a lot more bug reports about hung 
>>>>>> systems not recovering. 10-20s is just about long enough for 
>>>>>> someone to wait before leaning on the power button of their 
>>>>>> machine. Over a minute is not. That kind of delay is going to 
>>>>>> cause support issues.
>>>>>
>>>>> Sorry I wrote 12s, while you actually said tP * 12, so 7.68s, 
>>>>> chosen just so it is longer than tH * 3?
>>>>>
>>>>> And how do you keep coming up with factor of five? Isn't it four 
>>>>> periods before "heartbeat stopped"? (Prio normal, hearbeat, 
>>>>> barrier and then reset.)
>>>> Prio starts at low not normal.
>>>
>>> Right, slipped my mind since I only keep seeing that one priority 
>>> ladder block in intel_engine_heartbeat.c/heartbeat()..
>>>
>>>>> From the point of view of user experience I agree reasonable 
>>>>> responsiveness is needed before user "reaches for the power button".
>>>>>
>>>>> In your proposal we are talking about 3 * 2.5s + 2 * 7.5s, so 22.5s.
>>>>>
>>>>> Question of workloads.. what is the actual preempt timeout compute 
>>>>> is happy with? And I don't mean compute setups with disabled 
>>>>> hangcheck, which you say they want anyway, but if we target 
>>>>> defaults for end users. Do we have some numbers on what they are 
>>>>> likely to run?
>>>> Not that I have ever seen. This is all just finger in the air 
>>>> stuff. I don't recall if we invented the number and the compute 
>>>> people agreed with it or if they proposed the number to us.
>>>
>>> Yeah me neither. And found nothing in my email archives. :(
>>>
>>> Thinking about it today I don't see that disabled timeout is a 
>>> practical default.
>>>
>>> With it, if users have something un-preemptable to run (assuming 
>>> prio normal), it would get killed after ~13s (5 * 2.5).
>>>
>>> If we go for my scheme it gets killed in ~17.5s (3 * (2.5 + 2.5) + 
>>> 2.5 (third pulse triggers preempt timeout)).
>>>
>>> And if we go for your scheme it gets killed in ~22.5s (4 * 2.5 + 2 * 
>>> 3 * 2.5).
>> Erm, that is not an apples to apples comparison. Your 17.5 is for an 
>> engine reset tripped by the pre-emption timeout, but your 22.5s is 
>> for a GT reset tripped by the heartbeat reaching the end and nuking 
>> the universe.
>
> Right, in your scheme I did get it wrong. It would wait for GuC to 
> reset the engine at the end, rather than hit the fake "hearbeat 
> stopped" in that case, full reset path.
>
> 4 * 2.5 to trigger a max prio pulse, then 3 * 2.5 preempt timeout for 
> GuC to reset (last hearbeat delay extended so it does not trigger). So 
> 17.5 as well.

Again, apples or oranges? I was using your tP(RCS) == 2.5s assumption in 
all the above calculations given that the discussion was about the 
heartbeat algorithm, not the choice of pre-emption timeout. In which 
case the last heartbeat is max(tP * 2, tH) == 2 * 2.5s.

>
>> If you are saying that the first pulse at sufficient priority (third 
>> being normal prio) is what causes the reset because the system is 
>> working as expected and the pre-emption timeout trips the reset. In 
>> that case, you have two periods to get to normal prio plus one 
>> pre-emption timeout to trip the reset. I.e. (tH * 2) + tP.
>>
>> Your scheme is then tH(actual) = tH(user) + tP, yes?
>> So pre-emption based reset is after ((tH(user) + tP) * 2) + tP => (3 
>> * tP) + (2 * tH)
>> And GT based reset is after (tH(user) + tP) * 5 => (5 * tP) + (5 * tH)
>>
>> My scheme is tH(actual) = tH(user) for first four, then max(tH(user), 
>> tP) for fifth.
>> So pre-emption based reset is after tH(user) * 2 + tP = > tP + (2 * tH);
>> And GT based reset is after (tH(user) * 4) + (max(tH(user), tP) * 1) 
>> => greater of ((4 * tH) + tP) or (5 * tH)
>>
>> Either way your scheme is longer. With tH(user) = 2.5s, tP(RCS) = 
>> 7.5s, we get 27.5s for engine and 50s for GT versus my 12.5s for 
>> engine and 17.5s for GT. With tP(RCS) = 2.5s, yours is 12.5s for 
>> engine and 25s for GT versus my 7.5s for engine and 12.5s for GT.
>>
>> Plus, not sure why your calculations above are using 2.5 for tP? Are 
>> you still arguing that 7.5s is too long? That is a separate issue and 
>> not related to the heartbeat algorithms. tP must be long enough to 
>> allow 'out of box OpenCL workloads to complete'. That doesn't just 
>> mean not being killed by the heartbeat, it also means not being 
>> killed by running two of them concurrently (or one plus desktop 
>> OpenGL rendering) and not having it killed by basic time slicing 
>> between the two contexts. The heartbeat is not involved in that 
>> process. That is purely the pre-emption timeout. And that is the 
>> fundamental reason why tP needs to be much larger on RCS/CCS.
>
> I was assuming 2.5s tP is enough and basing all calculation on that. 
> Heartbeat or timeslicing regardless. I thought we established neither 
> of us knows how long is enough.
>
> Are you now saying 2.5s is definitely not enough? How is that usable 
> for a default out of the box desktop?
Show me your proof that 2.5s is enough.

7.5s is what we have been using internally for a very long time. It has 
approval from all relevant parties. If you wish to pick a new random 
number then please provide data to back it up along with buy in from all 
UMD teams and project management.

>
>>> If I did not confuse any calculation this time round, then the 
>>> differences for default case for normal priority sound pretty 
>>> immaterial to me.
>>>
>>>>> What if we gave them a default of 2.5s? That would be 4 * (2.5s + 
>>>>> 2.5s) = 20s worst case until reset, comparable to your proposal. 
>>>>> Are there realistic workloads which are non-preemptable for 2.5s? 
>>>>> I am having hard time imagining someone would run them on a 
>>>>> general purpose desktop since it would mean frozen and unusable UI 
>>>>> anyway.
>>>>>
>>>>> Advantage still being in my mind that there would be no fudging of 
>>>>> timeouts during driver load and heartbeat periods depending on 
>>>>> priority. To me it feels more plausible to account for preempt 
>>>>> timeout in heartbeat pulses that to calculate preempt timeout to 
>>>>> be longer than hearbeat pulses, just to avoid races between the two.
>>>> Except that when the user asks for a heartbeat period of 2.5s you 
>>>> are actually setting it to 5s. How is that not a major fudge that 
>>>> is totally disregarding the user's request?
>>>
>>> This is indeed the core question. My thinking:
>>>
>>> It is not defined in the heartbeat ABI that N pulses should do 
>>> anything, just that they are periodic pulses which check the health 
>>> of an engine.
>>>
>>> If we view user priority as not under our control then we can say 
>>> that any heartbeat pulse can trigger preempt timeout and we should 
>>> let it do that.
>>>
>>> From that it follows that it is justified to account for preempt 
>>> timeout in the decision when to schedule heartbeat pulses and that 
>>> it is legitimate to do it for all of them.
>> But it can be optimised to say that it doesn't matter if you bump the 
>> priority of a pulse before waiting for the pre-emption period to 
>> expire. If the pulse was already high enough prio then the 
>> pre-emption has already been triggered and bumping the prio has no 
>> effect. If was too low then waiting for longer has no benefit at all.
>>
>> All that matters is that you don't hit the end stop and trigger the 
>> GT reset too early.
>
> Yes I agree that it can also be argued what you are saying.
>
> I was trying to weigh pros&cons of both approaches by bringing into 
> the discussing the question of what are heartbeats. Given they are 
> loosely/vaguely defined I think we have freedom to tweak things.
>
> And I don't have a problem with extending the last pulse. It is 
> fundamentally correct to do regardless of the backend. I just raised 
> the question of whether to extend all heartbeats to account for 
> preemption (and scheduling delays). (What is the point of bumping 
> their priority and re-scheduling if we didn't give enough time to the 
> engine to react? So opposite of the question you raise.)
The point is that it we are giving enough time to react. Raising the 
priority of a pre-emption that has already been triggered will have no 
effect. So as long as the total time from when the pre-emption is 
triggered (prio becomes sufficiently high) to the point when the reset 
is decided is longer than the pre-emption timeout then it works. Given 
that, it is unnecessary to increase the intermediate periods. It has no 
advantage and has the disadvantage of making the total time unreasonably 
long.

So again, what is the point of making every period longer? What benefit 
does it *actually* give?

>
> What I do have a problem with is deriving the preempt timeout from the 
> hearbeat period. Hence I am looking if we can instead find a fixed 
> number which works, and so avoid having bi-directional coupling.
Fine. "tP(RCS) = 7500;" can I merge the patch now?

>
>>> It also avoids the double reset problem, regardless of the backend 
>>> and regardless of how the user configured the timeouts. Without the 
>>> need to fudge them neither during driver load or during sysfs store.
>>>
>>> User has configured that heartbeat pulses should be sent every N 
>>> seconds, yes, but I think we are free to account for inherent 
>>> hardware and software latencies in our calculations. Especially 
>>> since other than flawed Gen12 RCS, other engines will be much closer 
>>> to the configured period.
>>>
>>> It is just the same as user asking for preempt timeout N and we say 
>>> on driver load "oh no you won't get it". Same for heartbeats, they 
>>> said 2.5s, we said 2.5s + broken engine factor...
>> Why would you not get the pre-emption timeout? Because it is too 
>> large? That is a physical limitation (of the GuC firmware) not an 
>> override because we think we know better. If we can obey the user 
>> then we should do so.
>
> I was simply referring to the override in intel_engine_setup.
Meaning the boost rather than the clamp? The other option would be to 
add a CONFIG_DRM_I915_PREEMPT_TIMEOUT_COMPUTE option for specifying 
tP(RCS). I can do that as a follow up patch if other maintainers agree 
to adding yet more CONFIG options. My understanding was that they are 
frowned upon and only to be added when there is no other way.

John.

>
> Regards,
>
> Tvrtko

