Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA5384E703
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 18:46:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAF5D10E839;
	Thu,  8 Feb 2024 17:46:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fTUGbWfl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBD6410E840;
 Thu,  8 Feb 2024 17:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707414399; x=1738950399;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/kFzYTJi/6KYv9bKz1k12mJJydmk75kjcngZuXDJxB8=;
 b=fTUGbWflfgcgmsvto/b/zesgf4xR0WENYscQzCRPXjNDSoXpLwIXfrRh
 1U+8xPHscrA3VqYi/D9c/qDQCtaeqDcykso8HbAbEyrKXa+S06y60TSSF
 Pa4n/jDu78MrLZ8U5IWkJxFQjWUPi9uJzwx7gxXWdMvF9aI8xWpv0rfXk
 youXniaCvhAq8ZF/Ix65m13Hiqe13IVVLkCK+HgSYK1fLNs0M9WIjelC7
 YmRpfNCPLfm9lGzEzDOuXAfpcRlFmtpBsTCi7hVnVTkw8/8zWxZ4n+WxC
 rJaRioi+RqeVYh5/CIlVf2TEwESVvoCHnFy7GZShMRPKsuSQSH1oAyess w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="18782487"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; d="scan'208";a="18782487"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 09:46:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="1947064"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Feb 2024 09:46:38 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 8 Feb 2024 09:46:38 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 8 Feb 2024 09:46:37 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 8 Feb 2024 09:46:37 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 8 Feb 2024 09:46:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CXLtLblAhxEKiKZF4I923rd/uLeqfim8Vs6cGOylty+Y42uE7mJ8EbqJ5I5BgyKze4T+jU9y+Rqp7QljN7wV1CIiaOCixXYD4i4uB/Cixfnk2/K/ltpfZnfRr1i7sdm5w86O02i8WDrO7qwlhXUP+RJN0ADMBruAUJ5nh8AKjzP0Ha7wH2UM7MiWOah09EHwcD83e4DsIfJDG+3OS8tE1UNXADXaTl3WxdkAkQQOp9LLc5XDCYe55o9WzAO5iO7L5ju3ppwtIQLvtEOJ4ZktH5oLWwpkPeKkeB7sblKDDVV2UbREUjBYQq5QnLXlzQnb32CwDi1l/a6W8P74h1LXPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c/7pfPci7SmFyC8nKqQzjrvI8jlSCZfSlAlOmlA5cPM=;
 b=fTR9CqzW/guM/c50Orj2WzufSYuYlVq8CCCGCxWvuGSR1aqmVet6cwMGGe3lRYylH4Di5+geC/Ay9FCloaJ9o7rKTOUWgbDy4m3sG+jFCYb6THHszThTF18wmFU5pGj5cyj9ud2JaWvi25hUEZt0JbWygc1Fqx1pd1XMSuWXQlp+CxgSt5n/aAXUM0HSgdLRA1KHD34GVbqqYHbP8eP9rUts6NFiiOpdnFtYGIr54zAZlrNnJ1v3cjxRVhpXh1WLmnKrsZNUNJg3qVJuL5oc14uKIxBdiEkZfwpu1NE2bBDpwxVIy7v2Wnab1p3VwVjnkEn01AQJXkQmkxk4L5s2rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by CO1PR11MB4900.namprd11.prod.outlook.com (2603:10b6:303:9e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Thu, 8 Feb
 2024 17:46:29 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::c590:37b4:ad48:cd0f]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::c590:37b4:ad48:cd0f%3]) with mapi id 15.20.7249.038; Thu, 8 Feb 2024
 17:46:29 +0000
Message-ID: <66320d7d-fc98-4456-b454-ce367b0d3dda@intel.com>
Date: Thu, 8 Feb 2024 09:46:25 -0800
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
 <1efb4711-80e7-4e22-a2e3-a7190bad69eb@intel.com>
 <c70e4b09-4e2a-4369-82f4-2eb13771f217@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <c70e4b09-4e2a-4369-82f4-2eb13771f217@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR10CA0030.namprd10.prod.outlook.com
 (2603:10b6:a03:255::35) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|CO1PR11MB4900:EE_
X-MS-Office365-Filtering-Correlation-Id: 57b8d7ba-8cc2-4c7d-c3ef-08dc28cde13e
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 45CBwEmpEvzkXUIxCpJIsz+5QZUOj4suKNIBps861eVq0dNWHdITM42LJnaBSNDr5lU1CzrHrQV0/J3OVbugfG71XVke00zoRQj9ClYO4djmWr1/KXr73+KEEVRqqZ1MH5m/eE7n6RWO6NOSfxUxrW2LxZ0jerAAjeM17K21uNu/9VU6hkSCkczJVPx0GtWz1gczG0O42EJ035aOQtxF7WaHZsRU4raQP9Nf152ClcDWWf54Gdx1DXTUoWyxRXa1zUekYjZZHjbRT8j7IGVgLNAWiVg9uetFzdhAAd7YgM0JA+mispcsL0Q8DjMUyv8arlHS5sOzFHli/Ck0tLTimhBEpwtHCGIyQqzFZNg9e2osz+ufZh7NKLgeyJkAOCrDy8GUI9txgMz0WjRaqRtLUn2sjxo2TEx99T89p5ZGedPqrMxMjbcvF9CO2cQRBCc6QLf9+MD8L2cPLHhTrsrY5+9myJv1imzfvwQw/hmRL2JBzB0jyd+gsv8aW5iJWq0nv75LLXGhBAqZbg9uzTmLxZ6m4Pdly8V1W1KkLLzDLfIje1WAMMJ7CRa3jOmkwfBY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(39860400002)(136003)(396003)(346002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(82960400001)(66899024)(31696002)(41300700001)(6486002)(66946007)(66556008)(66476007)(54906003)(8676002)(53546011)(36756003)(6506007)(6666004)(8936002)(478600001)(316002)(4326008)(2616005)(26005)(86362001)(38100700002)(6512007)(83380400001)(5660300002)(30864003)(2906002)(31686004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGpmazE5QTlrNVhDUVhaRE5rcmVMQ0xzNHErcEVoeTNDQ3BDQVhoa3ZCUXQv?=
 =?utf-8?B?WHhkSnFYRmg2RGs1R1l3RG9EaWZwa2NpOEV6Rm00cG94SEtvd2ZqUDQyc0g5?=
 =?utf-8?B?bk9BL0hPbm9pZHdzR245WXFFN2UvcTN1UFJISXZxYUxvYXNuQ2ZmaVM2L0dj?=
 =?utf-8?B?eG5UNXg0aitRL3R4ZDNjbDJjbG9GS2lISEhWRVNScExsVHhIS1ZwT3pWeW81?=
 =?utf-8?B?d2xRT3I1bVF2Uy9qOGM2QVFWNnVZTHA2eFVOU3c1Q0ZGVWxCRk52SWhvbnZs?=
 =?utf-8?B?R0FDdEVEVlZ3VEdyalFHZkgxTzYrdFJjUFhDTDQxUTZsVGZodkl5b0pMN1pU?=
 =?utf-8?B?aHQ4eWh3MzdzVlRZcVd2QzF4Q0dySllYZzJRb2hRMld0VGVIbG5iL00xd09X?=
 =?utf-8?B?czltWmFQaUtsRWpCRjI2UzVZeXlaeEFENm43R2Q0WlRXV3QyU0xaVzMzS1BK?=
 =?utf-8?B?cFQ0WnRIWGhHZDg5eTdHRWFUQ1VRUzRjVkdEaVlIL3B4VWpxODl6V2pMYlJC?=
 =?utf-8?B?a2NsaGFad0RtNUlRYjM3RHVYbkxZNXIyUnlhdmw0ZDNJSHV3UlhsalE5ckxu?=
 =?utf-8?B?WS9BeGczWG8wMmZSU3cxWCtsNjFJUW5ZU2czdFBJNGlYNEJIRVhySklscmRV?=
 =?utf-8?B?STNTZ2l5cFg3YjVaVVBnZmVIZWtYSUhjQzRFTjhPM2oyWitDVVRZMFUzQzFD?=
 =?utf-8?B?OXhMQ3VwOUhJc1VNZzhMUUNTcWNrN3kwOFdSWjBtSllWeDFuWGFudXNSbmtG?=
 =?utf-8?B?OW5YSEJqTnVSOVhzWnRKTGN5R3ppaWdWVTI3eUZPcXZGdHVQSm9mVitCQnpV?=
 =?utf-8?B?UDhKbGgvWkd4NjhoVzNMS2NoVUxyeVhFK1dMaGQ0WTBFcWVCMHpORUZMeDZ1?=
 =?utf-8?B?YWd6K3h6Y3BoNHVjUGxBcWRoVDQ4dDhpdFd5RG9mNm90NCtNWWExczliV2dl?=
 =?utf-8?B?VGxEQVBZeUFxd0xKU1EwdnU3TkVScUdHRVE0L0lZSlM2SmgxRlJZaTYxVS93?=
 =?utf-8?B?aVJYNXNES1BaeFhyZHQveVlXWG9NdVVTdEN4czhUR1N3Wk1qNlhPNFBGOUNn?=
 =?utf-8?B?dXdLRlRiQjB6R2hjZ3JCNk5TdC9Cci9lTWFabjhIMXI4RkFwWXRMQ2lLNWtt?=
 =?utf-8?B?SnhYL1A1Y05rQXF1OFlldFZsRDl4b1M4blY4RzVpa1VJcm1FVE10aHlDVStq?=
 =?utf-8?B?UXNBc3J6S0h2aGd3U2oxRXpnWFhqbHM5aTRrTHdvNFkrNVVpZE9zWmZzdWpU?=
 =?utf-8?B?aC94bmlrckQzTzQ1RXkyUElzYmdwWkxtTXYvWEVXR0pBemRDWk9KUEdrVm10?=
 =?utf-8?B?c0pyVDE5UnU2WjlSaXVEVmw4M0RFaFloU1JuaGZ2MmtNOVI4ZlgraFhNR1Jm?=
 =?utf-8?B?RHVRME9PZnE1b0hQZ3NmQnRwMmRJSHByMWZEVmcwZkVMUVhFYkRxZHRydU5P?=
 =?utf-8?B?QnJPOXR2Y0JVNWZsRmRUdW1weVVyNVE3WUJEN0ZxMDd0aUVQaVVIY1FyVmF4?=
 =?utf-8?B?QkxWNGVxRUhrdWJMRmJGaGRXNmVVNWNJbmZnaDc0b2NQc2p5WER5RkVzaUNU?=
 =?utf-8?B?ampzNDZtZyt4SnYrTHRWL1pJbDFjbmJvQWlDeEdadCtDdGFnSGNsTDZkbkk4?=
 =?utf-8?B?YVRVTlZ0bEZUQVQ3TWhDa0tVWGQrSzh5SzZkdmxIeWluMHY1SXNwMEtjRzVx?=
 =?utf-8?B?bXVmZlFJbEl2c0IxcG8wMitteWJKT25OQnhiUS9UL2hsb3hhRkl2U2w4ZkVS?=
 =?utf-8?B?Q21pR2F3cTVyMm5pZVRPK3k1aCswQ1RQeDRMUENwTDBTMDRHWVhDUjVCSUFk?=
 =?utf-8?B?bGNhRmlCU2ZhT1BjTG83ODdMaXVpSy9CdzVaUFA2Q3MzRENBZ0xoNkIrajNk?=
 =?utf-8?B?ak4vTDN1WEVabnN4aEdZTFppM3o0aC9lSkEyL0F5NmRheVhvMk11VkhiaFFR?=
 =?utf-8?B?YStGbERmUENuVGk0L0ZaeFZpbWpFQ3BzR3hEb1RnV1ZLYVNBNVI5dHAvZG5M?=
 =?utf-8?B?MXN5aklJWE1RKzNiVXZDckltWklFdkZYQ294QXBIWGU5dEpKTEJmNlV5WWVo?=
 =?utf-8?B?Z21kQmdOL0hOVjBPZWg5NUo4WXFXRzZ2UEovK3VzOW1vK1A0MmdDQ2QyVGZy?=
 =?utf-8?B?cHl6dzFxYUxBR1YyWXcxaGdSNlFWNi8wSjRYakI3V0pCQytQTVFGbmhiQ2lt?=
 =?utf-8?B?ZXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 57b8d7ba-8cc2-4c7d-c3ef-08dc28cde13e
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2024 17:46:29.3949 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EJq6bJO7oHXJ/exYGa1hua6iJF1JvQ1lnIiewAqihSOIa95C4ORwIVKXF01Aso6tWvigVLxVA8BnnnN6KQmFsDWA8GWSoz67b2RDHGd1UqI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4900
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

On 2/8/2024 00:41, Tvrtko Ursulin wrote:
> On 07/02/2024 19:34, John Harrison wrote:
>> On 2/7/2024 10:49, Tvrtko Ursulin wrote:
>>> On 07/02/2024 18:12, John Harrison wrote:
>>>> On 2/7/2024 03:56, Tvrtko Ursulin wrote:
>>>>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>>>
>>>>> Add a new query to the GuC submission interface version.
>>>>>
>>>>> Mesa intends to use this information to check for old firmware 
>>>>> versions
>>>>> with a known bug where using the render and compute command streamers
>>>>> simultaneously can cause GPU hangs due issues in firmware scheduling.
>>>>>
>>>>> Based on patches from Vivaik and Joonas.
>>>>>
>>>>> There is a little bit of an open around the width required for 
>>>>> versions.
>>>>> While the GuC FW iface tells they are u8, i915 GuC code uses u32:
>>>>>
>>>>>   #define CSS_SW_VERSION_UC_MAJOR               (0xFF << 16)
>>>>>   #define CSS_SW_VERSION_UC_MINOR               (0xFF << 8)
>>>>>   #define CSS_SW_VERSION_UC_PATCH               (0xFF << 0)
>>>>> ...
>>>>>   struct intel_uc_fw_ver {
>>>>>           u32 major;
>>>>>           u32 minor;
>>>>>           u32 patch;
>>>>>           u32 build;
>>>>>   };
>>>> This is copied from generic code which supports firmwares other 
>>>> than GuC. Only GuC promises to use 8-bit version components. Other 
>>>> firmwares very definitely do not. There is no open.
>>>
>>> Ack.
>>>
>>>>>
>>>>> So we could make the query u8, and refactor the struct 
>>>>> intel_uc_fw_ver
>>>>> to use u8, or not. To avoid any doubts on why are we assigning u32 to
>>>>> u8 I simply opted to use u64. Which avoids the need to add any 
>>>>> padding
>>>>> too.
>>>> I don't follow how potential 8 vs 32 confusion means jump to 64?!
>>>
>>> Suggestion was to use u8 in the uapi in order to align with GuC FW 
>>> ABI (or however it's called), in which case there would be:
>>>
>>>    ver.major = guc->submission_version.major;
>>>
>>> which would be:
>>>
>>>    (u8) = (u32)
>>>
>>> And I was anticipating someone not liking that either. Using too 
>>> wide u64 simply avoids the need to add a padding element to the uapi 
>>> struct.
>>>
>>> If you are positive we need to include a branch number, even though 
>>> it does not seem to be implemented in the code even(*) then I can 
>>> make uapi 4x u32 and achieve the same.
>> It's not implemented in the code because we've never had to, and it 
>> is yet another train wreck waiting to happen. There are a bunch of 
>> issues at different levels that need to be resolved. But that is all 
>> in the kernel and/or firmware and so can be added by a later kernel 
>> update when necessary. However, if the UMDs are not already taking it 
>> into account or its not even in the UAPI, then we can't back fill in 
>> the kernel later, we are just broken.
>>
>>>
>>> (*)
>>> static void uc_unpack_css_version(struct intel_uc_fw_ver *ver, u32 
>>> css_value)
>>> {
>>>     /* Get version numbers from the CSS header */
>>>     ver->major = FIELD_GET(CSS_SW_VERSION_UC_MAJOR, css_value);
>>>     ver->minor = FIELD_GET(CSS_SW_VERSION_UC_MINOR, css_value);
>>>     ver->patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH, css_value);
>>> }
>>>
>>> No branch field in the CSS header?
>> I think there is, it's just not officially implemented yet.
>>
>>>
>>> And Why is UMD supposed to reject a non-zero branch? Like how would 
>>> 1.1.3.0 be fine and 1.1.3.1 be bad? I don't get it. But anyway, I 
>>> can respin if you definitely confirm.
>> Because that is backwards. The branch number goes at the front.
>>
>> So, for example (using made up numbers, I don't recall offhand what 
>> versions we have where) say we currently have 0.1.3.0 in tip and 
>> 0.1.1.0 in the last LTS. We then need to ship a critical security fix 
>> and back port it to the LTS. Tip becomes 0.1.3.1 but the LTS can't 
>> become 0.1.1.1 because that version already exists in the history of 
>> tip and does not contain the fix. So the LTS gets branched to 
>> 1.1.0.0. We then have both branches potentially moving forwards with 
>> completely independent versioning.
>>
>> Exactly the same as 5.8.x, 5.9,y, 6.0.z, etc in the Linux kernel 
>> versioning. You cannot make any assumptions about what might be in 
>> 1.4.5.6 compared to 0.1.2.3. 1.4.5.6 could actually 0.1.0.3 with a 
>> stack of security fixes but none of the features, workarounds or bug 
>> fixes that are in 0.1.2.3.
>>
>> Hence, if the branch number changes then all bets are off. You have 
>> to start over and reject anything you do not explicitly know about.
>>
>> This is why we were saying that exposing version numbers to UMDs 
>> breaks down horribly as soon as we have to start branching. There is 
>> no clean or simple way to do this.
>
> Right, thank you, I know we talked about the challenges with version 
> numbers in the past and fully agreed. I just did not think to idea is 
> to conceptually put the branch number first.
>
> (It is called build btw in the i915 struct if that needs cleanup at 
> some point. Or maybe name depends on the firmware type.)
That's different. Some of the firmware files we have do have a build 
number. As I said before, branching isn't really implemented yet because 
we've never had to use for real. And generally, we don't spend time 
implementing stuff in the KMD that isn't being used. But we definitely 
need to make sure it is present in any relevant UAPIs so that if/when we 
do need to start using it, we can.

>
> But as the plan to piggy back on the existing semaphore capability 
> flag has failed and i915 definitely does not want to keep a database 
> of version branches to bugs fixes, and Mesa is immovable that they 
> cannot ship without something, agreement was to let them have it that 
> something. At least from the pretend level one can say it makes sense 
> to expose the version and don't care what people are doing with it. 
> Even if in practice it potentially never manages to see any old firmware.
>
> Hmmm although now I can imagine that if the policy needs to be reject 
> unknown branch numbers, it will make a "nice" maintenance burden to 
> Mesa to ship updates synchronized with the firmware releases, in order 
> to keep the feature active i.e. not inadvertently revert to disabled 
> when say 0.1.1.3 goes to 1.1.1.3 (or 1.1.1.4) to unrelated fix getting 
> added.
>
> Jose could you double check that angle please? Will it just work or 
> will it need constant Mesa updates in this situation otherwise we are 
> back at square one - silently not exposing maximum performance.
>
I believe that any UMD using this API will have to manually update 
whenever a new branch is released. There isn't really any way around 
that because we can't know in advance what random point in history will 
need to be the baseline for some new branch. All we can do is hope that 
we never actually need to do a branch! Or we have some other baseline 
mechanism that the UMDs can use to say 'if this other version is greater 
than X then it guarantees the GuC must be new enough'. E.g. check the 
LTS version and say that LTS X was release after GuC version Y therefore 
any branch baseline must be at least Y. But that is still a future 
update to be made when the next LTS is settled.

And of course, the hope is that we never have to create a GuC branch. 
Creating a branch means we've had some horrific issue with an LTS and a 
whole bunch of teams are having to jump through burning hoops to get 
everything in place to support the fix!

John.

> Anyways, I've sent v2 with the branch included and fields shrunk to 
> u32 since as mentioned before four fields now align to quad-word nicely.
>
> Regards,
>
> Tvrtko
>
>
>>
>> John.
>>
>>
>>>
>>> Regards,
>>>
>>> Tvrtko
>>>
>>>>>
>>>>> Compile tested only.
>>>>>
>>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>>> Cc: Kenneth Graunke <kenneth@whitecape.org>
>>>>> Cc: Jose Souza <jose.souza@intel.com>
>>>>> Cc: Sagar Ghuge <sagar.ghuge@intel.com>
>>>>> Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
>>>>> Cc: John Harrison <John.C.Harrison@Intel.com>
>>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>>> Cc: Jani Nikula <jani.nikula@intel.com>
>>>>> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>>> Cc: Vivaik Balasubrawmanian <vivaik.balasubrawmanian@intel.com>
>>>>> ---
>>>>>   drivers/gpu/drm/i915/i915_query.c | 32 
>>>>> +++++++++++++++++++++++++++++++
>>>>>   include/uapi/drm/i915_drm.h       | 11 +++++++++++
>>>>>   2 files changed, 43 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/i915/i915_query.c 
>>>>> b/drivers/gpu/drm/i915/i915_query.c
>>>>> index 00871ef99792..999687f6a3d4 100644
>>>>> --- a/drivers/gpu/drm/i915/i915_query.c
>>>>> +++ b/drivers/gpu/drm/i915/i915_query.c
>>>>> @@ -551,6 +551,37 @@ static int query_hwconfig_blob(struct 
>>>>> drm_i915_private *i915,
>>>>>       return hwconfig->size;
>>>>>   }
>>>>> +static int
>>>>> +query_guc_submission_version(struct drm_i915_private *i915,
>>>>> +                 struct drm_i915_query_item *query)
>>>>> +{
>>>>> +    struct drm_i915_query_guc_submission_version __user *query_ptr =
>>>>> + u64_to_user_ptr(query->data_ptr);
>>>>> +    struct drm_i915_query_guc_submission_version ver;
>>>>> +    struct intel_guc *guc = &to_gt(i915)->uc.guc;
>>>>> +    const size_t size = sizeof(ver);
>>>>> +    int ret;
>>>>> +
>>>>> +    if (!intel_uc_uses_guc_submission(&to_gt(i915)->uc))
>>>>> +        return -ENODEV;
>>>>> +
>>>>> +    ret = copy_query_item(&ver, size, size, query);
>>>>> +    if (ret != 0)
>>>>> +        return ret;
>>>>> +
>>>>> +    if (ver.major || ver.minor || ver.patch)
>>>>> +        return -EINVAL;
>>>>> +
>>>>> +    ver.major = guc->submission_version.major;
>>>>> +    ver.minor = guc->submission_version.minor;
>>>>> +    ver.patch = guc->submission_version.patch;
>>>> This needs to include the branch version (currently set to zero) in 
>>>> the definition. And the UMD needs to barf if branch comes back as 
>>>> non-zero. I.e. there is no guarantee that a branched version will 
>>>> have the w/a + fix that they are wanting.
>>>>
>>>> John.
>>>>
>>>>
>>>>> +
>>>>> +    if (copy_to_user(query_ptr, &ver, size))
>>>>> +        return -EFAULT;
>>>>> +
>>>>> +    return 0;
>>>>> +}
>>>>> +
>>>>>   static int (* const i915_query_funcs[])(struct drm_i915_private 
>>>>> *dev_priv,
>>>>>                       struct drm_i915_query_item *query_item) = {
>>>>>       query_topology_info,
>>>>> @@ -559,6 +590,7 @@ static int (* const i915_query_funcs[])(struct 
>>>>> drm_i915_private *dev_priv,
>>>>>       query_memregion_info,
>>>>>       query_hwconfig_blob,
>>>>>       query_geometry_subslices,
>>>>> +    query_guc_submission_version,
>>>>>   };
>>>>>   int i915_query_ioctl(struct drm_device *dev, void *data, struct 
>>>>> drm_file *file)
>>>>> diff --git a/include/uapi/drm/i915_drm.h 
>>>>> b/include/uapi/drm/i915_drm.h
>>>>> index 550c496ce76d..d80d9b5e1eda 100644
>>>>> --- a/include/uapi/drm/i915_drm.h
>>>>> +++ b/include/uapi/drm/i915_drm.h
>>>>> @@ -3038,6 +3038,7 @@ struct drm_i915_query_item {
>>>>>        *  - %DRM_I915_QUERY_MEMORY_REGIONS (see struct 
>>>>> drm_i915_query_memory_regions)
>>>>>        *  - %DRM_I915_QUERY_HWCONFIG_BLOB (see `GuC HWCONFIG blob 
>>>>> uAPI`)
>>>>>        *  - %DRM_I915_QUERY_GEOMETRY_SUBSLICES (see struct 
>>>>> drm_i915_query_topology_info)
>>>>> +     *  - %DRM_I915_QUERY_GUC_SUBMISSION_VERSION (see struct 
>>>>> drm_i915_query_guc_submission_version)
>>>>>        */
>>>>>       __u64 query_id;
>>>>>   #define DRM_I915_QUERY_TOPOLOGY_INFO        1
>>>>> @@ -3046,6 +3047,7 @@ struct drm_i915_query_item {
>>>>>   #define DRM_I915_QUERY_MEMORY_REGIONS        4
>>>>>   #define DRM_I915_QUERY_HWCONFIG_BLOB        5
>>>>>   #define DRM_I915_QUERY_GEOMETRY_SUBSLICES    6
>>>>> +#define DRM_I915_QUERY_GUC_SUBMISSION_VERSION    7
>>>>>   /* Must be kept compact -- no holes and well documented */
>>>>>       /**
>>>>> @@ -3591,6 +3593,15 @@ struct drm_i915_query_memory_regions {
>>>>>       struct drm_i915_memory_region_info regions[];
>>>>>   };
>>>>> +/**
>>>>> +* struct drm_i915_query_guc_submission_version - query GuC 
>>>>> submission interface version
>>>>> +*/
>>>>> +struct drm_i915_query_guc_submission_version {
>>>>> +    __u64 major;
>>>>> +    __u64 minor;
>>>>> +    __u64 patch;
>>>>> +};
>>>>> +
>>>>>   /**
>>>>>    * DOC: GuC HWCONFIG blob uAPI
>>>>>    *
>>>>
>>

