Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D95B1443A3D
	for <lists+dri-devel@lfdr.de>; Wed,  3 Nov 2021 01:06:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CAFC72004;
	Wed,  3 Nov 2021 00:06:03 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C562E6E0A5;
 Wed,  3 Nov 2021 00:06:01 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10156"; a="231245890"
X-IronPort-AV: E=Sophos;i="5.87,203,1631602800"; d="scan'208";a="231245890"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2021 17:06:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,203,1631602800"; d="scan'208";a="583900642"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by fmsmga002.fm.intel.com with ESMTP; 02 Nov 2021 17:06:00 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 2 Nov 2021 17:05:59 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 2 Nov 2021 17:05:58 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Tue, 2 Nov 2021 17:05:58 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Tue, 2 Nov 2021 17:05:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XZXn92bA9uBUoxcIx0SAiOKXkKCpKoM05DT+zTBi3jHAlD/u3pdl4c1/scl0u/RaQDKoxUVyyp4GVYmeb3PSIx2NjRx6hWdXmOaiyIPWtiL34OfLcS01ciqyYFJYuozbsQEvNAvToAw9Fn1RcdDp7nhs7kq2ggFzjpr8NH1QFXIsjI96z12GGW/R4wTruIbLiBV3SY8UTgWvihJxzds/1DedrRRpi8/KhLav/JknPMovZKIbPy9nHh2Lm0gfADDmDcwVnC997O/MoJc4bPVk/ZBqzaMv7tFz3FRFJ89L9GKkcvPptrREPxNfIBefrZy7cXx3YEYqNoeeLvsP+9lZJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6eXsaLs3s4BN5ofgYrxMxBsSQtPaIFyOpUTfLYhxDro=;
 b=g/ixS3DEw8hbsbHkgo8lfPMfHHDYnnUW42OLL+MWHyVAQRNt7gN3ClbZ5/Pg/i3M6v7POOxuR7JkHgGfhrHxmtWhsa2d3qG0FRR0klY3r8fPuLpwgwt74J/CG0D9C9krEhTQaKYUBjhCf/waQRlDk+xkoy4H2nUHwr/p7bljyjWL1U9/uiqZ3v1j0O2Vgnm/UeHDzF1IH4MOO0xn1feFLc7XEqCOTv9Y+8FeajquTfXx7cQ0Q6sj0p6J2tgAYm5tHIJrFwy9ro94N/tlKtJ7S7BUcGf14/CDqvNK0bmBvuh+BbcnCmnP2yQqIxhqKvD4oiyWdmYKPtVXWPkim4taqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6eXsaLs3s4BN5ofgYrxMxBsSQtPaIFyOpUTfLYhxDro=;
 b=BIhU0U9JhiJjjenUIx4YjiYk4UrRDg/TK9vol6qBotTOh/57hQ42AoD8EC8ineH71Osg3vD4RIo0tT3k/IWz+XFLypkPorXS3W37XuW2A4lymwpyrEWzCOHu5m4RZRRGO0dZXPwMtk0aR42jaP5JfwzCd0LrYbQGQfna/xr2Ne8=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5673.namprd11.prod.outlook.com (2603:10b6:510:d6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Wed, 3 Nov
 2021 00:05:47 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::ad26:6540:dce1:9f81]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::ad26:6540:dce1:9f81%3]) with mapi id 15.20.4649.019; Wed, 3 Nov 2021
 00:05:47 +0000
Message-ID: <e2aff696-917c-e57d-f4ef-dafd90b669db@intel.com>
Date: Tue, 2 Nov 2021 17:05:43 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.2.1
Subject: Re: [Intel-gfx] [PATCH v2 2/2] drm/i915/uapi: Add query for hwconfig
 table
Content-Language: en-GB
To: Jordan Justen <jordan.l.justen@intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20210916184012.2642295-1-John.C.Harrison@Intel.com>
 <20210916184012.2642295-3-John.C.Harrison@Intel.com>
 <877ddr51i5.fsf@jljusten-skl>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <877ddr51i5.fsf@jljusten-skl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MWHPR1701CA0018.namprd17.prod.outlook.com
 (2603:10b6:301:14::28) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
Received: from [192.168.1.106] (73.157.192.58) by
 MWHPR1701CA0018.namprd17.prod.outlook.com (2603:10b6:301:14::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15 via Frontend
 Transport; Wed, 3 Nov 2021 00:05:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 72bff4c8-36d6-4c03-5006-08d99e5daff5
X-MS-TrafficTypeDiagnostic: PH0PR11MB5673:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <PH0PR11MB5673013F0BD0095794713A88BD8C9@PH0PR11MB5673.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZwI6ldkiPzAXmohIiKH3NohZnUIUcOTK1wBTH3zyoziRwpqJuyTfx/HijIbLM9CMbPnsk9vuE0U29qCI/irNEqt+MfkytOlEr3dTBTXVcCJAjw8YSQgnQ82X7ZKI14mbDzzko3pg+M1cacrBSYKKnThwtf1HMcrTtmJS7yvhZGLCwK8EupV1H2uHq5D6jeDAJDiDW7uRCSU4zDUB/4pmCA5yjca1f5b7I0bONKcu4bCGqDV82qtrp5HpT3yZG8sitKcE9DCtkDusQI3C8gS3vBy86+MSteh1fnAl3WcrWb6gYuIvGeKMbApaFDbdrtTnCoaospHdNk9cDKLjUAorjmSFwmpiCjh5fpxD7t6svOuSMJHkZnLSoalwqw8HhySGIObRtR3nkNJY1wF7ym2KBbmquY7NIC8zEI2vdcwmd16HAgW+ZI7P++S3YhrAFpsZhvpGyfSy3Da8OiXHBcfIkNOZoSJ4VPIYcfirB0H43s1V9A1hzIhD4proVe6kNUHEagPIhHXQNitaJLJdPs4TMz/DvLaxwZIS3bUcGD2YVz2Af3itafS1W88T+4+r1fF/KpMco2joLvP94RhWO+gn8FatCb59az2UdM5jSblxiGQ2rAWJ1EHm5DoVCyG7SRE+4LZnXNDxVI4dgJv5Kzf1bKknkQyYiE6iuBieRf3jEigOpkSe1EF8xEFD0RQDJeo7OC+xT9oTQROGQG0LUbzIxiRJd8gPMfpUSosP7PIwgKo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(83380400001)(31686004)(66476007)(38100700002)(956004)(66556008)(82960400001)(26005)(66946007)(8936002)(36756003)(186003)(5660300002)(2616005)(2906002)(4326008)(53546011)(86362001)(6486002)(316002)(6666004)(8676002)(54906003)(31696002)(508600001)(16576012)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NERmWHhoZHp0cUJSemFNVzBTUm1MVnlaa0tDdXZoc0xjMzZvaWhEMDYyS2ht?=
 =?utf-8?B?ajJ3VzRPUUtpajBwUGJMQStkWHE2VU4zazF3eGdqdWg1bFVPbE1sZWNDdXlT?=
 =?utf-8?B?T08xdHRpQWlkVWVsdzZHTjJJc3Q0SllnbE9BMy9sTlVkMk03V2EvSGxGbS9Y?=
 =?utf-8?B?ZFBhM3BZRWZLY3FzYkhVRm9ra0greDNLK1YwVkk1eHk0cDJTUkdTQjhRUXpI?=
 =?utf-8?B?azlCTFpSNUpoelNIS25xR0FFOVRuWVEzR2FQbS91V2JFUzJUOTYvaVU0NC9q?=
 =?utf-8?B?bS81T3VtZkxDeVNsOWRadzhLN290VytVRm5JQ2FsTFFqNUFzVDBrQ0pBazlo?=
 =?utf-8?B?R25PSXJWNEtoOUsyTGZudzF5MWpsVTdJd0lUUlZ3dmFVZkhadlZoZXhCdVUy?=
 =?utf-8?B?ak9TWjRXbW13Nm5uVUdtUFlIM2hXVFRrbGQ4K2dCN3R2dlR3T1BtVXhkRVdH?=
 =?utf-8?B?bndHZTFWeitrNVI4d0ZHVlBrTHZDKzhNZ2NGc0I1NEhhTzE5cHp0MmNaTU4v?=
 =?utf-8?B?M0xpdXpNQUZCZUxzald5NUVZeFpRSFkzWnM1WTMxbUpTcExOWUd1bEtLbGI3?=
 =?utf-8?B?RjdiQnhMT2N5QWgvQmI5VVlobnlzTm9YY081Mk51Q0xZVWc1cFNnOUVkYTdM?=
 =?utf-8?B?cHhCelk4Tmd2NmZRSDNOZUlNK1F5N29ockptdmJ4U21KT2trL1ZPQnFZaXRq?=
 =?utf-8?B?Ym44ZE9FZGVHTlFkQ0svUFZqNUYwUW8yVXJzY3Y3cmNNT0t4RWczZVNHWXIw?=
 =?utf-8?B?aUFWK3hVeDArSlNMeTg5RzNZMUx5dkgrb3g1dFVGanl2NXJvcDRYQVZFM0VP?=
 =?utf-8?B?NlR3TGZjMkV4LzlMQklaN205aGFNR3hlMmNWM2hFU3NoYXRwR0NRUDRMVGcw?=
 =?utf-8?B?UElzUG5MM05CbnZyd3psbkNGMkZtZW8vZmh3NGptWFNEam9EaUNsbmdVYjQ4?=
 =?utf-8?B?ajB0dHNpT25IT1IvNEdGVTFtOUE5ZkFkcXBhMTQzd1R3TFdFOTFIdUxIRzZG?=
 =?utf-8?B?TmtkM1pJeTl3NE1Mb3VpemlFTVp6d2QrVCtQVEdlb2tJNlNhY1FGcVhLbXNl?=
 =?utf-8?B?bk5GVEI0U1RzQkdhVEdXczJ4TjZkT1E0YmVIWWF0ZU1HOUJ3TlNQcWpkY3ky?=
 =?utf-8?B?WVF0ZjhYamFTTlJGWWtmeU5vNGFQZGYxeGttMjMzU3pUN2k4QTdkdjB3M2Ur?=
 =?utf-8?B?S2s3U3puMTdOOTdFdFZUWjF6MFZueHhIT3pScUlsbmpNZ1JEMXI1enhtZkwv?=
 =?utf-8?B?SmN4Si90bE40TUpNMTVnczFESDRFY2JadnYzNnppRkJKcmJtKzg3cTU3eVNj?=
 =?utf-8?B?NDY1Sytic1BxZDZzT1dFUFVIQ2dPd0xnMUpWbWpMRlgyWUxKV0xOdXltMFow?=
 =?utf-8?B?ZHU4NG1xNjZEdmFVclBjUGxwbjZNeVdpeFZJaE5ydzMyMzhsTURDSXhZL3dr?=
 =?utf-8?B?VjQwUnc4amdaUWpVNHZKSjlMM3BoY0xFdzZDalBwT2tqcnB0NDRHNnN1VEI2?=
 =?utf-8?B?TE4remNHZGZiNWJ6dmovYkMwVWlQU1RGeGhoR21OUHJucGpWa3UrdnJobTU3?=
 =?utf-8?B?UStUT3ZZRTJUL1M2Z1BjcEVUODV4ZmY3TmlWTHhxVmx1T2duUVBFSVBjZkk4?=
 =?utf-8?B?ZG1NeGFRVm1rK2MwQlkvT2pyYlNmT1M2TkJZVk8zU3NGaXR3YTYwRGxjRE1E?=
 =?utf-8?B?WEhoOENrNzM4czY3MVFmT0pKMHdFcmRkOGxPTG1HeWZRcHZlTk52ZXI3QVll?=
 =?utf-8?B?QnY0L29HR2k2bzZJTFVkME1PYTQ2Z3FzK1NWZ3RmRFFiVmhmaWd1U0c4M1pC?=
 =?utf-8?B?aGhkZXIzUmM0MmhKWVlFMDhHQ2dnU2dIWFBrZWdKOHh0YXFJSS9kZ3VQa2JY?=
 =?utf-8?B?THgyYUpneVVud2prenZQK1NOdmFHbjYxRGZzY0NsRjlmRUNXbzJyWFhTZDJq?=
 =?utf-8?B?TllaVUh4WXJOZUFKU2Fzc2VMT0U1czdWSGl1NFhtTWpEWXZvS2E2SGJXOVpG?=
 =?utf-8?B?V0UvNnlGNXlCMytmbEpmRk1OWGw3Tk51UWpQMXV4WFBiQk5oemZOQ3JpSTNZ?=
 =?utf-8?B?UXJnTVRiNzR4SFduSjhMTXhBRVRyVU5Md3k5N2pZZDBEcXUyVTAzUkZCTUtI?=
 =?utf-8?B?b0R4Ri9XcEJQcnRLWkgzU051aHAzTEpCaWZGOENRZlgra05zK3NlMHB6MkV1?=
 =?utf-8?B?T3NXbGVPcU9QdVZ3eXR5WXBWbjk5ZE4yOUtBTTFoNFN2QWxLUmhTdVdFVEZu?=
 =?utf-8?B?QmlVMmNVQ2ZLRVpYOGQvK3ZLc0dBPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 72bff4c8-36d6-4c03-5006-08d99e5daff5
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 00:05:47.3361 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V1gc9uSrtHhYtj5uFvlkfZHVa8QmOKcKclFbXvYk2ejcSAwI827/34rMDiXoy3IEPnVduOTYuXFoRHcNLVqjEmcpVXw8rlpHDDay7Rr64y0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5673
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Kenneth Graunke <kenneth.w.graunke@intel.com>, DRI-Devel@Lists.FreeDesktop.Org,
 Slawomir Milczarek <slawomir.milczarek@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/1/2021 08:39, Jordan Justen wrote:
> <John.C.Harrison@Intel.com> writes:
>
>> From: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>
>> GuC contains a consolidated table with a bunch of information about the
>> current device.
>>
>> Previously, this information was spread and hardcoded to all the components
>> including GuC, i915 and various UMDs. The goal here is to consolidate
>> the data into GuC in a way that all interested components can grab the
>> very latest and synchronized information using a simple query.
>>
>> As per most of the other queries, this one can be called twice.
>> Once with item.length=0 to determine the exact buffer size, then
>> allocate the user memory and call it again for to retrieve the
>> table data. For example:
>>    struct drm_i915_query_item item = {
>>      .query_id = DRM_I915_QUERY_HWCONCFIG_TABLE;
>>    };
>>    query.items_ptr = (int64_t) &item;
>>    query.num_items = 1;
>>
>>    ioctl(fd, DRM_IOCTL_I915_QUERY, query, sizeof(query));
>>
>>    if (item.length <= 0)
>>      return -ENOENT;
>>
>>    data = malloc(item.length);
>>    item.data_ptr = (int64_t) &data;
>>    ioctl(fd, DRM_IOCTL_I915_QUERY, query, sizeof(query));
>>
>>    // Parse the data as appropriate...
>>
>> The returned array is a simple and flexible KLV (Key/Length/Value)
>> formatted table. For example, it could be just:
>>    enum device_attr {
>>       ATTR_SOME_VALUE = 0,
>>       ATTR_SOME_MASK  = 1,
>>    };
>>
>>    static const u32 hwconfig[] = {
>>        ATTR_SOME_VALUE,
>>        1,             // Value Length in DWords
>>        8,             // Value
>>
>>        ATTR_SOME_MASK,
>>        3,
>>        0x00FFFFFFFF, 0xFFFFFFFF, 0xFF000000,
>>    };
> Seems simple enough, so why doesn't i915 define the format of the
> returned hwconfig blob in i915_drm.h?
Because the definition is nothing to do with i915. This table comes from 
the hardware spec. It is not defined by the KMD and it is not currently 
used by the KMD. So there is no reason for the KMD to be creating 
structures for it in the same way that the KMD does not document, 
define, struct, etc. every other feature of the hardware that the UMDs 
might use.

>
> struct drm_i915_hwconfig {
> 	uint32_t key;
> 	uint32_t length;
> 	uint32_t values[];
> };
>
> It sounds like the kernel depends on the closed source guc being loaded
> to return this information. Is that right? Will i915 also become
> dependent on some of this data such that it won't be able to initialize
> without the firmware being loaded?
At the moment, the KMD does not use the table at all. We merely provide 
a mechanism for the UMDs to retrieve it from the hardware.

In terms of future direction, that is something you need to take up with 
the hardware architects.


>> The attribute ids are defined in a hardware spec.
> Which spec?

Unfortunately, it is not one that is currently public. We are pushing 
the relevant people to get it included in the public bspec / HRM. It is 
a slow process :(.

John.


>
> -Jordan

