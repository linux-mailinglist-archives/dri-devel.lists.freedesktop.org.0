Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE0584D241
	for <lists+dri-devel@lfdr.de>; Wed,  7 Feb 2024 20:35:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7683910E568;
	Wed,  7 Feb 2024 19:34:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mQJPj/L6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CAC610E85D;
 Wed,  7 Feb 2024 19:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707334497; x=1738870497;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6aNqcXy1vaaf7htqFQxqhRqeesXu1dhRQS5Gz6TLfvw=;
 b=mQJPj/L6xsJXkGE0+sJ20i2LdErXYpNZ2R7lpQNZisZVHAL376tPK9rx
 gXqYxRwayoIaCxHCFcw2EqsP8szyMUOFF56DJ3BExS8gRLxOJOdmOcfe+
 wknXHp1rxE70320/QKSb84B8o/iq3NGcihJXnI0EVhpItRm0e3XzxjX7T
 u3OTedMW8DwNE5AbrmqJ/y5j6shNpRuT3Feh+f2VYBU1Ydun08NY5Dhjv
 2+68fXuBAXBBDcSMkWsjOL4Xb22p/8+C1w2BpamXbgeuxn25sMmQS8ZW5
 97Me3Ugmg3VZ5SJQvF/LkzMkhlPUWukKzuKxzYWeUDg3Cpzehb8nMGseN A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="4884938"
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400"; 
   d="scan'208";a="4884938"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 11:34:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400"; 
   d="scan'208";a="1733458"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Feb 2024 11:34:57 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 7 Feb 2024 11:34:56 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 7 Feb 2024 11:34:55 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 7 Feb 2024 11:34:55 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 7 Feb 2024 11:34:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XtRURh6B+1pPHAlDLyFDy3uKpmm6O6a+Vg8Fy3x22Ym5x+BYmJH4c0IlOJDQw7s/hEQOdu++M+ktk0LyhDZOQPazGMPy+U+uyPCHOlXipKbl9/CYcavAWsThlHOgPFtwc3/9wSTYhrNZMY1dxAXEv1g08FsmqENdxHd2Up9AwPlgNtJ29C3UXSH/sOI+wxMjvb93nMZ5fXJI6Ze5Q7smBQm0OYoul+2eDKD9dla7diCtouUfcLwYSADYTqIIsOFmBcoTuwuBVwt07w4v29mrK5nt9Nqin5IeRCMOiIZT/iJKdACiHa7OU/FK0PfZNi8C5cjZiuM5tOB/CpYNRxTfEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IvGYNdDvtWu02bzLqnxiDXMNbx6nHoMPr2ngwcPpWrc=;
 b=c2AVZN457ER5lndRzbWIHaFAQ0iO0P0CP+oGO6ftezEwIXsPnBt6p/2LYRJl+hMfv01bW9uygHMqgbc4HXZmVKZeh3xTTBgXN2HjUAxamra64P4lh1b9Ua8xR0tZkBn0+M1vzpLix2kZy7YlHcRMnXpWwgdDhDa82TZ00AkmOS0LW9qZMAN5o+JDoxiweuSDllIXWGhhbZD5gH6WhT0TWBz7L1Gs9h1nCvNCj0ltGUupiVQNG9Z6Bgyrl7l/wkh9HDw+7uxDq+TUYwOTfTb4f+DQIgOiuAMJiFv7lyo/UAkdiKImSGK5tPUSYdgQt7sMphmcyV8doqKJdtOqvb0GEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by CYYPR11MB8405.namprd11.prod.outlook.com (2603:10b6:930:c6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.38; Wed, 7 Feb
 2024 19:34:53 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::c590:37b4:ad48:cd0f]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::c590:37b4:ad48:cd0f%3]) with mapi id 15.20.7249.038; Wed, 7 Feb 2024
 19:34:53 +0000
Message-ID: <1efb4711-80e7-4e22-a2e3-a7190bad69eb@intel.com>
Date: Wed, 7 Feb 2024 11:34:49 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] drm/i915: Add GuC submission interface version query
Content-Language: en-GB
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <Intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Kenneth Graunke
 <kenneth@whitecape.org>, Jose Souza <jose.souza@intel.com>, Sagar Ghuge
 <sagar.ghuge@intel.com>, Paulo Zanoni <paulo.r.zanoni@intel.com>, "Rodrigo
 Vivi" <rodrigo.vivi@intel.com>, Jani Nikula <jani.nikula@intel.com>, "Vivaik
 Balasubrawmanian" <vivaik.balasubrawmanian@intel.com>
References: <20240207115612.1322778-1-tvrtko.ursulin@linux.intel.com>
 <32d9d60b-1cfc-4201-8817-d293abe1b39d@intel.com>
 <82ac1c74-5aa1-484d-9132-9b023c0e7a33@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <82ac1c74-5aa1-484d-9132-9b023c0e7a33@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR10CA0017.namprd10.prod.outlook.com
 (2603:10b6:a03:255::22) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|CYYPR11MB8405:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ac87e13-4743-40c1-9648-08dc2813db5d
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ezq+PcKo0P/AKVNNz5BpDiACHqjE6UMjqyR0UMVsgS+2ykbGAZYpewFXF6QLDWBzjIlzEkLNfZQW1slnwecvmvCkVjAOJth7Gs/FulW8g+MkQHBOqQ612okljU5HuSqVJLiKz7gsHhhDqPpTbd1iYW/+e3lSM6wGl7uDQWiDQjYDgzkp1eRumT52PeqW+2nmObLjKzROULsPJJ1iR+SUQSuQxF7bpE5iUswbTNyOl5YX0TmUG9QCRunUAM7KRygzmduIQM5hG56BLiaDpzYpEfHztok2b5h9jfVQmo0tuww81ju/ijq2Ls89U15UrIghLPQxy6Tn7pLzDyTjSzxCE4VmeO70fdAOeCZAdY2zwDuygTG8PkzjAuV/jXmj6vNziEHv/+sSKfkJEOZpfN74Amhl5dnVZQwWWLpok9KWjwriP2uxY4CUY7XrMw7k6ovx+LBL0NYoP8Sq/86hG5/zWDfsEIjNUFfTigczp3EdlfhSkfCvcH2yem+60H/VkiT6fJw5tbZgZ8zRzhmbC4GadqPr3dO4UYQy3uijS+PRdxe29yLTFiLVf/MY75A+470JC3g77D79q9xVjzVVgC+JyHBJYHZnm8QFO6FgnGGZEQ7Kj8aiqCioPs5kstWtb2YAhcfHf9YDCVquHNMFviliZQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(39860400002)(376002)(136003)(346002)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(41300700001)(82960400001)(36756003)(6486002)(478600001)(53546011)(66946007)(6506007)(66556008)(66476007)(54906003)(6666004)(8676002)(8936002)(316002)(4326008)(6512007)(26005)(86362001)(2616005)(38100700002)(83380400001)(31696002)(5660300002)(2906002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZzBkbG5JaFVqaXpxcmhwTlJ0dm1ESlJjV1AvNTFkNDlmVm80SVlTbTcvV2pv?=
 =?utf-8?B?endNTHZzU05WL0ZTa0EzWldmNW1xaWpMRXI2OWdWamVQTE1nekVzYklZSkV2?=
 =?utf-8?B?N3YyYjlwRWJBZStjNzhXL3dtdTk1aSt2eUM1QUQ4NVYvQTVWRWNubEN4VnVy?=
 =?utf-8?B?OGNyd1FJZm9UanpSNVZQNlcweVBIL2Fadkh2MENaNE41SC8zUkwzNVM2WmQy?=
 =?utf-8?B?MURLak1rTFU0U0hVbDZNQmg3LytpUjdLck1Kak80b2ExdEkwKzZmekxGNUxZ?=
 =?utf-8?B?Y0IrM0I5algxeFByNUVRSmlFbmNNaTN0U0prdjFVUzc4eThkUnBOOGtnS1pW?=
 =?utf-8?B?U3dIcDZhamdyZjdkeDZBMStOUitKS3IwSVBQUXpiL2hGZzdMYjdrYWRzVVFv?=
 =?utf-8?B?Qi9zUWlqQUJlYkQwanovaDVsY1dGN1RYYTR2V0kydjU1b3kwN21wb3phKzJY?=
 =?utf-8?B?RGRBVlBzdktWdzI0cnlXT0Y3czRqTHcweU9zYitKaHBpZnQvb3B3Vk9pN1Bv?=
 =?utf-8?B?MTNnWEZGMFRYNzhVOWtMMzJJb1RqVkxkWVI4eDExQXNVRDZROHp2YTFvSGgr?=
 =?utf-8?B?V2FkSEd6ZHdUVm9udlhLQU9aMG41V0pic2hOYkdUdnV1Zjk5dCtQZy96YXRw?=
 =?utf-8?B?YTB5eU5oQVpTK1RieVFJbnRrbWVaZVRmZkFmamdkemloSkVtalY1cklROW9R?=
 =?utf-8?B?ZEdkZ1lHdFRmSUtOa2p0N2ZWczR4eXpTWEgrR1FOUlQ1dC9RNFZKbXpCdHVN?=
 =?utf-8?B?YVFYMWNUdE53Uk45aXNKVnFoSkREYjl3T1dxbzgxdVE3a0xWOGhGQklCVGEy?=
 =?utf-8?B?NkVXd0lGSTNFeHlhdmY0bGZqOEZUQmF5R1I1eU4yc081SFdNSzMxRWU4MWt0?=
 =?utf-8?B?Ti9sYTdjeExBVTMxZGEzaUEvWGlROC8zRWN1UHo1THdCdzdhaWFwcnhIN2Y1?=
 =?utf-8?B?RVY2R212NGk1VGgrRkhRY25DWFo1aitVOXl3NGtpQmJuSjBCR3plSG1ad1VQ?=
 =?utf-8?B?TjZoRWpZakF1SmdlQmJGRjZRU2pxY1BramhYb3NEeEVRdmlvWmpNT0dybC9W?=
 =?utf-8?B?SDFobloveDVtQVZLZDVDRzZVTjFPOWVYemlVK3UybHBLSDZweHZIMnVic0Vz?=
 =?utf-8?B?ajVvamhkSDhkRE9sbVFWNE9uOWlMY04vSVNxMXBHdXMwWHlZemZRVGRoVDRF?=
 =?utf-8?B?MlNXWEJJNUMvUzlObDg5Yk44N1lYU01ZMyt6bFhqY0dFSHNBUFJYeEJrVXlD?=
 =?utf-8?B?dGxUcE5ZUUlFZWhCSk5Ya2I3YnhCZXBGbWFPY3grNjFFYjVVMG1VenZXQTY3?=
 =?utf-8?B?VmdvYll4VS8zYVJDLzdtMm82VVBQUkU4YThwcWlKblM2bkJWcU9tM1o4VHRl?=
 =?utf-8?B?WGIrS3lEeHovSEF2ZXdnSWc2VVNnTjJvK3R3UGM5ZWVwMDJrTFVzRFV5cFZN?=
 =?utf-8?B?M0N1Q0JyR3RpRVVSR0NOQ3NYTmN0M1dFZ1hnK1lyUkVLbzhKSUhQS2h1Zkk2?=
 =?utf-8?B?azVrRmtiNEJWNEp4Q09uZ1A4clhkeXVjR1lTM1NOMUVEU0d3QzdLWVVmYXE4?=
 =?utf-8?B?VTNrbDFyVGU4QWxGbU9ya1dPUHNVMzBOdkxKeEVpWklEemtSMEphS0IyS2hN?=
 =?utf-8?B?ZFcvd1JSbmZ3b2k2Qm9yVUFLRmpvWTRzOUpSR3NYUkxIS0x2ZFpyN1pUQ3pw?=
 =?utf-8?B?dU9iUlN1SWc3ZXREV2MxRXhwMi9pdFNRb3pzaXhpQXBUN2NYaWMvNWFqYTB4?=
 =?utf-8?B?SFF1ZWhDbktxdDFZY3VrUlB5VnRBSXZuOTBXRzM0eWgvWkVBUmJFNXNPOHho?=
 =?utf-8?B?QU1rWmUzd3h3ZzQxN0pPZGhodVo5ZnZkSzdyRnQ2dFRpd0M1OVZpOEhqaFdM?=
 =?utf-8?B?OUZSY0JpV0V5aDhHZm5tSHJOc1JzVUYvV0NPdmtQckZWVUEyRzZsUkhYYmRF?=
 =?utf-8?B?b1FJZ1VYUExLSUJsZ1FlaDFGSmFuQTBvdXk3cFR4SlhXcVgwaXlxTXpLb21H?=
 =?utf-8?B?QUdnY1hWdE9HOUwwR1JERy9XeEVzbk9FQytDWmNkSk9aMjY1L094eEtWanY4?=
 =?utf-8?B?M0FrK254YWJKSGhvaUtRcW1ENFFaeVVIZlBzNGJpYUdoRmZwbytoS0NPb0hL?=
 =?utf-8?B?TFZFdjRveVZoZStuODdBdmorWGViaHNnMEk1UWxoa2taSmRPVC9TcGdIZ0Ja?=
 =?utf-8?B?WlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ac87e13-4743-40c1-9648-08dc2813db5d
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2024 19:34:53.1343 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mxDq8gYG+vj+WLAuDO/sAECn6A1CVZP3EWABEq39lV71QMxJcHlUhXSlrzZcgWEAItY9d5aEEqmz4xm8UE4RKoekbwqfCAhTKyafXeljOk4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8405
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

On 2/7/2024 10:49, Tvrtko Ursulin wrote:
> On 07/02/2024 18:12, John Harrison wrote:
>> On 2/7/2024 03:56, Tvrtko Ursulin wrote:
>>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>
>>> Add a new query to the GuC submission interface version.
>>>
>>> Mesa intends to use this information to check for old firmware versions
>>> with a known bug where using the render and compute command streamers
>>> simultaneously can cause GPU hangs due issues in firmware scheduling.
>>>
>>> Based on patches from Vivaik and Joonas.
>>>
>>> There is a little bit of an open around the width required for 
>>> versions.
>>> While the GuC FW iface tells they are u8, i915 GuC code uses u32:
>>>
>>>   #define CSS_SW_VERSION_UC_MAJOR               (0xFF << 16)
>>>   #define CSS_SW_VERSION_UC_MINOR               (0xFF << 8)
>>>   #define CSS_SW_VERSION_UC_PATCH               (0xFF << 0)
>>> ...
>>>   struct intel_uc_fw_ver {
>>>           u32 major;
>>>           u32 minor;
>>>           u32 patch;
>>>           u32 build;
>>>   };
>> This is copied from generic code which supports firmwares other than 
>> GuC. Only GuC promises to use 8-bit version components. Other 
>> firmwares very definitely do not. There is no open.
>
> Ack.
>
>>>
>>> So we could make the query u8, and refactor the struct intel_uc_fw_ver
>>> to use u8, or not. To avoid any doubts on why are we assigning u32 to
>>> u8 I simply opted to use u64. Which avoids the need to add any padding
>>> too.
>> I don't follow how potential 8 vs 32 confusion means jump to 64?!
>
> Suggestion was to use u8 in the uapi in order to align with GuC FW ABI 
> (or however it's called), in which case there would be:
>
>    ver.major = guc->submission_version.major;
>
> which would be:
>
>    (u8) = (u32)
>
> And I was anticipating someone not liking that either. Using too wide 
> u64 simply avoids the need to add a padding element to the uapi struct.
>
> If you are positive we need to include a branch number, even though it 
> does not seem to be implemented in the code even(*) then I can make 
> uapi 4x u32 and achieve the same.
It's not implemented in the code because we've never had to, and it is 
yet another train wreck waiting to happen. There are a bunch of issues 
at different levels that need to be resolved. But that is all in the 
kernel and/or firmware and so can be added by a later kernel update when 
necessary. However, if the UMDs are not already taking it into account 
or its not even in the UAPI, then we can't back fill in the kernel 
later, we are just broken.

>
> (*)
> static void uc_unpack_css_version(struct intel_uc_fw_ver *ver, u32 
> css_value)
> {
>     /* Get version numbers from the CSS header */
>     ver->major = FIELD_GET(CSS_SW_VERSION_UC_MAJOR, css_value);
>     ver->minor = FIELD_GET(CSS_SW_VERSION_UC_MINOR, css_value);
>     ver->patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH, css_value);
> }
>
> No branch field in the CSS header?
I think there is, it's just not officially implemented yet.

>
> And Why is UMD supposed to reject a non-zero branch? Like how would 
> 1.1.3.0 be fine and 1.1.3.1 be bad? I don't get it. But anyway, I can 
> respin if you definitely confirm.
Because that is backwards. The branch number goes at the front.

So, for example (using made up numbers, I don't recall offhand what 
versions we have where) say we currently have 0.1.3.0 in tip and 0.1.1.0 
in the last LTS. We then need to ship a critical security fix and back 
port it to the LTS. Tip becomes 0.1.3.1 but the LTS can't become 0.1.1.1 
because that version already exists in the history of tip and does not 
contain the fix. So the LTS gets branched to 1.1.0.0. We then have both 
branches potentially moving forwards with completely independent versioning.

Exactly the same as 5.8.x, 5.9,y, 6.0.z, etc in the Linux kernel 
versioning. You cannot make any assumptions about what might be in 
1.4.5.6 compared to 0.1.2.3. 1.4.5.6 could actually 0.1.0.3 with a stack 
of security fixes but none of the features, workarounds or bug fixes 
that are in 0.1.2.3.

Hence, if the branch number changes then all bets are off. You have to 
start over and reject anything you do not explicitly know about.

This is why we were saying that exposing version numbers to UMDs breaks 
down horribly as soon as we have to start branching. There is no clean 
or simple way to do this.

John.


>
> Regards,
>
> Tvrtko
>
>>>
>>> Compile tested only.
>>>
>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>> Cc: Kenneth Graunke <kenneth@whitecape.org>
>>> Cc: Jose Souza <jose.souza@intel.com>
>>> Cc: Sagar Ghuge <sagar.ghuge@intel.com>
>>> Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
>>> Cc: John Harrison <John.C.Harrison@Intel.com>
>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> Cc: Jani Nikula <jani.nikula@intel.com>
>>> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>> Cc: Vivaik Balasubrawmanian <vivaik.balasubrawmanian@intel.com>
>>> ---
>>>   drivers/gpu/drm/i915/i915_query.c | 32 
>>> +++++++++++++++++++++++++++++++
>>>   include/uapi/drm/i915_drm.h       | 11 +++++++++++
>>>   2 files changed, 43 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/i915/i915_query.c 
>>> b/drivers/gpu/drm/i915/i915_query.c
>>> index 00871ef99792..999687f6a3d4 100644
>>> --- a/drivers/gpu/drm/i915/i915_query.c
>>> +++ b/drivers/gpu/drm/i915/i915_query.c
>>> @@ -551,6 +551,37 @@ static int query_hwconfig_blob(struct 
>>> drm_i915_private *i915,
>>>       return hwconfig->size;
>>>   }
>>> +static int
>>> +query_guc_submission_version(struct drm_i915_private *i915,
>>> +                 struct drm_i915_query_item *query)
>>> +{
>>> +    struct drm_i915_query_guc_submission_version __user *query_ptr =
>>> +                        u64_to_user_ptr(query->data_ptr);
>>> +    struct drm_i915_query_guc_submission_version ver;
>>> +    struct intel_guc *guc = &to_gt(i915)->uc.guc;
>>> +    const size_t size = sizeof(ver);
>>> +    int ret;
>>> +
>>> +    if (!intel_uc_uses_guc_submission(&to_gt(i915)->uc))
>>> +        return -ENODEV;
>>> +
>>> +    ret = copy_query_item(&ver, size, size, query);
>>> +    if (ret != 0)
>>> +        return ret;
>>> +
>>> +    if (ver.major || ver.minor || ver.patch)
>>> +        return -EINVAL;
>>> +
>>> +    ver.major = guc->submission_version.major;
>>> +    ver.minor = guc->submission_version.minor;
>>> +    ver.patch = guc->submission_version.patch;
>> This needs to include the branch version (currently set to zero) in 
>> the definition. And the UMD needs to barf if branch comes back as 
>> non-zero. I.e. there is no guarantee that a branched version will 
>> have the w/a + fix that they are wanting.
>>
>> John.
>>
>>
>>> +
>>> +    if (copy_to_user(query_ptr, &ver, size))
>>> +        return -EFAULT;
>>> +
>>> +    return 0;
>>> +}
>>> +
>>>   static int (* const i915_query_funcs[])(struct drm_i915_private 
>>> *dev_priv,
>>>                       struct drm_i915_query_item *query_item) = {
>>>       query_topology_info,
>>> @@ -559,6 +590,7 @@ static int (* const i915_query_funcs[])(struct 
>>> drm_i915_private *dev_priv,
>>>       query_memregion_info,
>>>       query_hwconfig_blob,
>>>       query_geometry_subslices,
>>> +    query_guc_submission_version,
>>>   };
>>>   int i915_query_ioctl(struct drm_device *dev, void *data, struct 
>>> drm_file *file)
>>> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
>>> index 550c496ce76d..d80d9b5e1eda 100644
>>> --- a/include/uapi/drm/i915_drm.h
>>> +++ b/include/uapi/drm/i915_drm.h
>>> @@ -3038,6 +3038,7 @@ struct drm_i915_query_item {
>>>        *  - %DRM_I915_QUERY_MEMORY_REGIONS (see struct 
>>> drm_i915_query_memory_regions)
>>>        *  - %DRM_I915_QUERY_HWCONFIG_BLOB (see `GuC HWCONFIG blob 
>>> uAPI`)
>>>        *  - %DRM_I915_QUERY_GEOMETRY_SUBSLICES (see struct 
>>> drm_i915_query_topology_info)
>>> +     *  - %DRM_I915_QUERY_GUC_SUBMISSION_VERSION (see struct 
>>> drm_i915_query_guc_submission_version)
>>>        */
>>>       __u64 query_id;
>>>   #define DRM_I915_QUERY_TOPOLOGY_INFO        1
>>> @@ -3046,6 +3047,7 @@ struct drm_i915_query_item {
>>>   #define DRM_I915_QUERY_MEMORY_REGIONS        4
>>>   #define DRM_I915_QUERY_HWCONFIG_BLOB        5
>>>   #define DRM_I915_QUERY_GEOMETRY_SUBSLICES    6
>>> +#define DRM_I915_QUERY_GUC_SUBMISSION_VERSION    7
>>>   /* Must be kept compact -- no holes and well documented */
>>>       /**
>>> @@ -3591,6 +3593,15 @@ struct drm_i915_query_memory_regions {
>>>       struct drm_i915_memory_region_info regions[];
>>>   };
>>> +/**
>>> +* struct drm_i915_query_guc_submission_version - query GuC 
>>> submission interface version
>>> +*/
>>> +struct drm_i915_query_guc_submission_version {
>>> +    __u64 major;
>>> +    __u64 minor;
>>> +    __u64 patch;
>>> +};
>>> +
>>>   /**
>>>    * DOC: GuC HWCONFIG blob uAPI
>>>    *
>>

