Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2419E444BC9
	for <lists+dri-devel@lfdr.de>; Thu,  4 Nov 2021 00:49:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C9F96E508;
	Wed,  3 Nov 2021 23:49:11 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBA9E6E508;
 Wed,  3 Nov 2021 23:49:09 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10157"; a="211673139"
X-IronPort-AV: E=Sophos;i="5.87,207,1631602800"; d="scan'208";a="211673139"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2021 16:49:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,207,1631602800"; d="scan'208";a="729825707"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by fmsmga005.fm.intel.com with ESMTP; 03 Nov 2021 16:49:08 -0700
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 3 Nov 2021 16:49:08 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Wed, 3 Nov 2021 16:49:07 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Wed, 3 Nov 2021 16:49:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DechODkff31Tab5ZtBIbRF40Ya6zvJ9m9LcvlVafRgcNVGRiI2FLIbQodbQV6nMI5LK+iqK9siaxF4N5MDrvoUY9I5oc17v/lfdhGzraU65u2QJVj14e8DHGsqIGrEgQzZqNyS6ao0rSl+J8nDctvXNn4w1wnPxaKNPukIS6C6/QWtmVMjz4lrAR8lmfUI30AeXQ1e2KzvbolDOw0F81dH9Buw150u+TewTv+38MeJ1pRiM5zW7lOBcVAdOC5FtKhCrCBVFj5aLapzG/u+x8gDiasD5uAx/YdMMVsGKbQHUGPIt3eBGHS+oG0M/6THOMph8p+nmRyVaXbI+SJfHlyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J1c6LKrfiSJ9TFgHgNUhR1+7GTLIkjcGvXRsTao7Si4=;
 b=b3FijLLq6RVGmiJSQ++W488w7/ZOEtZkdtxndC7B3UUuvHGTO4VF9Xmlry2m+08i3D8HZ9kQs0XdV/OxOH9VdwvDkAxjQH/t+6GakiSY0yxtn6x0VY10pogegAAnvlImmpd5Ho9wea+amDiGT7EbrO/tsOd40CsuvhE4mUKBRKBsc7b2gWZNPP4kxhSk+NxRVDsbHajg0Plu7HLd0S3IzE3y5VuCiCUROeKFsyaRgRzODVSoJp5cs/mhuGE1EloEI/HPl+tFFP46nmE1QLeDqXpvSRVAQP3woxo5rGotjWa5UMAy+m6zJiphl46kNCYTma9lxQJABxHikfqLdS1Hvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J1c6LKrfiSJ9TFgHgNUhR1+7GTLIkjcGvXRsTao7Si4=;
 b=iM8ijMif80VOEZ4oOaO4zWV3QxE4zmk7Eiao0TbddHlWcPrTdko1ZJbidqFuIGReUUwu1S9icsjQOdvdDzZR0u0+tUHfpH9VKTcaw/t+Fso9r1rZspe4lEmbnp/UgphNqpK3wFcpOYK69hbHt1qxX/TKtSJBasM1D/1Riur+b3U=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5657.namprd11.prod.outlook.com (2603:10b6:510:ee::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.18; Wed, 3 Nov
 2021 23:49:05 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::ad26:6540:dce1:9f81]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::ad26:6540:dce1:9f81%3]) with mapi id 15.20.4649.019; Wed, 3 Nov 2021
 23:49:05 +0000
Message-ID: <0ece155d-3d35-5fd4-f449-87c2a8de0f55@intel.com>
Date: Wed, 3 Nov 2021 16:49:01 -0700
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
 <e2aff696-917c-e57d-f4ef-dafd90b669db@intel.com>
 <871r3w5383.fsf@jljusten-skl>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <871r3w5383.fsf@jljusten-skl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0099.namprd04.prod.outlook.com
 (2603:10b6:303:83::14) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
Received: from [192.168.1.106] (73.157.192.58) by
 MW4PR04CA0099.namprd04.prod.outlook.com (2603:10b6:303:83::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.15 via Frontend Transport; Wed, 3 Nov 2021 23:49:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 555f5fea-16f3-428c-e506-08d99f24854b
X-MS-TrafficTypeDiagnostic: PH0PR11MB5657:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <PH0PR11MB565751CA94482B67ACCAF3CCBD8C9@PH0PR11MB5657.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DanvmSDR1xM36esDWn6lnxpVCF67p25AOUp/MbaDD9hPK4E+IGHOXWMvyvqkQC4rGRT7RfOYN0g/n4aRiifHHu4e+9CbA5J6tE+ajxK8nHZHTo/GYfgc0xf/W3io0mTKY8W44vRtmDtSo/VlzhoJEQ2xOTC2KqbkfMbDfPZiv95URLsNrHhGty5yRuWrYUNADgivmDAUORv58sraVGQZnJ4JYXW2lHeDOiHVTn5Fo3SEa6jEyNF9cmJ3O5msyc+qgQXbWBeJc2FGrECjnEJov3gC4z53D7O+aVAbsh122iCHnHnP2sapO58fOrQPAZoORjXdbIsejGwKPBEpRJYe1fSrMhsydNWhAHspp34oN8O+faDYN2aBa1zKpCLlmUqQazAlDpph8jknzCgiULJjMufKHP15tpVSOivbsnmM9alnMfNAfUgWAOEBu6+s64Xmwcn3BLfjq8SNEVmvVUCScq+xAuBEugWR/Vzh334KYK4S1P3OKpu/FixRcIThfqDi7ipc5VJ04GYJgXSWlY9WmFmCjY0C/deUrBPJpjR47Po4xl8XkgbDjp7VCkG5c5eTW46cbOydy2nzv5/XBMbsgRBNF14cd6AFLy8Ds/qrbB1+MrGo+f2/yYE5TkelS7tpNAXqdGxzXkyGSm6ELgDDDbkTeJlGcBN7G9zD+ypkHzFkZMyt56BdIyKphY20HO4EMXr/YJKnH7vH9ujQIEF5Gc0HDtcXh9JMTMiDvLaoryM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(5660300002)(82960400001)(6486002)(2616005)(956004)(2906002)(66946007)(31686004)(66476007)(66556008)(36756003)(16576012)(8936002)(316002)(54906003)(186003)(6666004)(86362001)(31696002)(38100700002)(4326008)(26005)(8676002)(508600001)(83380400001)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TDBFaE9qQlpoZFZWWlk2SWNaNzdpRjFkbmVORkl6cWJ0T1VKeHpoUEh6YVUy?=
 =?utf-8?B?cjRjOGpTUXJBMFc1c3ZPaUVBWlU2T0Nuakdya2d5ZVFuVWtLdU1ndVJIWFJo?=
 =?utf-8?B?TlU5bERISUtzTWtxTGU3M2IweXZwd0JUdWpyL2JEcXRxMVhVMjFiaVlUZlpZ?=
 =?utf-8?B?REJXVlA0cUNEWkZxUFBwQmkwWVh3MTNib0NnN2VySzZWOEtwTHgzWWpUTDIv?=
 =?utf-8?B?T3ExSS9WVHpqa3NoODZhWXF1VUlsdTZTYXkwa0NxY0JhT2x6ZGVWRm5YNjd6?=
 =?utf-8?B?RUI2ZGV0REs2ZmFBVElxZS9CM3VJK3kvMnJ5dVFQL3FrTW1jMVE2ZzhkdVdt?=
 =?utf-8?B?cWkxMDdXZzQ5NytWTG9VRmxSWFVTcEx1a3FWL2pndmpNUVNtdndlUTZjNDBP?=
 =?utf-8?B?Z243UkFOOVFTZGlBSXVyZ21hQ3JOK0RFRno3dGJRRUZqQUNVUC8vK0xJRW0r?=
 =?utf-8?B?YTZqeGN4SEhrRnlMQktXYVZjU2dxN0pKbkRyYmk2SERwaGxNQ3V2UG9pU3lu?=
 =?utf-8?B?WCtnbGVoWmN4ekYyMTNBVGxZQlpkUnlnYmczazF3YzdJSkttMG8ra3BHVi9t?=
 =?utf-8?B?S0JCVFAza1FiclZ2R29GKzl3YjJXNFR5SXJ1SHE1Z3RNZFJpSlpIMk0rRzI2?=
 =?utf-8?B?emFoaGtmeHpzMnZWNGh2c094ZThNRVB4YlJHMythSCt4Q1hib3BCdldnNGhz?=
 =?utf-8?B?TGRkVlNvbzZVK3BvbEYrSzBQaERxSmU1TmRSYlNIdFN3YlpwUEVTYVZpUURV?=
 =?utf-8?B?K3hkWFduaXZrQUpjRmRSa0VORlFyenJyVUtzUVA1WVpCdlkwMUV0bG5ycTRa?=
 =?utf-8?B?N21sUVplTnlRKzBxbWJsWGxuR2hYUmRnWlhXSWVzdktVbUxWR0lrMlUreFlE?=
 =?utf-8?B?RkdJbVV5aEYySHF3WjJ2eUZpN0pyN0dmaExUNU9zYnBrV244NkQ0RWR2U0tS?=
 =?utf-8?B?cTRpY0tMNXo0NU9RZ255VXd5bDYraTJReUNRb1IrU3ZONThGcDhMajNsaFZZ?=
 =?utf-8?B?MHBDYk5Od25vTEZJejI4TVBjcE44dmhzMDlQK0RYL1djOU0vVUlFNkFYU3Bv?=
 =?utf-8?B?MDlrR1V1Vld2MHpPQ0l4UjFFcVZsRlpSNys5dFNLRkxXdlRwNUVJQlduek1Z?=
 =?utf-8?B?UzVIU1k1NTVqUDJ2WjBBZWdUK1lQejBQZlp5QUxHT1BTTVZDYlZ2R1pxQ1BB?=
 =?utf-8?B?RVVpMU0zeUozZ2lMbEVtWHM5bXdvVTBVYlJKdzl1bWNUKy9vaFJGM0FlZHFC?=
 =?utf-8?B?YlV1SlVUTDdjSjhvbExZRzJEblUxdEp4V1FEZEZSYWgwdVhZRlpaNTNQa2gz?=
 =?utf-8?B?dlYzb2thV2dzQWJoTWN6QjBicXZ4bitBTEtRMlU3TktMc0JxaTBGbCtSR1Zj?=
 =?utf-8?B?Qi9VWkZUYTh2Skd4M3BxTnBDNC9sT0g1NG9Lem9kZG9SZnZIdld1bUN3SGgv?=
 =?utf-8?B?K3ViRGtDQ0Vsai9uNElBKzlJYWhOaFVBc1NrMlpVVmhsOEV6RGZ1eDdGNUZz?=
 =?utf-8?B?NEJNVmlXaDVBZVhCSG9lTUwwQVIwTWkxTXdzOUkwTVB4S2E5UW1keER3ZEd1?=
 =?utf-8?B?emJzd1hERVJ0R3B2RVl1QlNQaW5LNEo4am1CZ2FiYzVNYmFqVW1nWmMzK3BP?=
 =?utf-8?B?NkoxVHJUOTN1QSsvWlgyNi9ZTzRxM2tFRFM3RVgzcWdGUzF2LzNYZko1dnRH?=
 =?utf-8?B?M1F5a3NBWGV0N09JbjdVb1BERlVCNEdtN0I0bjhISzlEbU1XYi9GQ1RZdmFk?=
 =?utf-8?B?SzdtV1VDaTRaZWowSHJOUEpKNWZHRlZjK1JXR1NhbVFVb2hxZ00xTERPZndW?=
 =?utf-8?B?Y1lGN2FLN2s2emhZK0FHKzNuaUUwck9MN3dPbGdYMC9pRWlOR3c1MVF4NkJs?=
 =?utf-8?B?c1VlNEtieWp5amRpQWU1SDFWcUx5KzhybWl4RFBpbDA3S3h5RG5lc0QzL1VP?=
 =?utf-8?B?TkVaalNrRytCYWFUakJqOWtmTmNSZUlqS2hkZGFDZGZNVmdCaHFtR0w1SEhj?=
 =?utf-8?B?QVUyVWMyTldnTDZsTUVEWHk4NjVLUkJpQ21DWElsRmlHSWJsOTd4czFUYVpk?=
 =?utf-8?B?cUxKcVNVVTd2dGFHQ3Uxa2ZPOXZuVmh5LzlSRFVrOVc1RGFTVE5KNlFUenQx?=
 =?utf-8?B?ai9zdUFua0JhZ2c0U2dxWkRXb2tFY3dUeFYrd1hvVkUyNU1wK3h4dDR3ZGI0?=
 =?utf-8?B?dUVVYWlsbmlNU1JJNlZYOHRLc0orenFVcVdnN1YyeW5XL1AwbXl6Z0txdjZG?=
 =?utf-8?B?aFBpU251SGZYRlZrUCthNTBYT1BRPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 555f5fea-16f3-428c-e506-08d99f24854b
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 23:49:05.5390 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jQfAWbU/MfJB2JWXEJbBKSeNH8pnrayaNZHmKqC4uWoYG0KgpPaYdhJtv5Afzac3YjhJHvuMVCEMje/Ct2HsTK1DrzMJXIAqu0zJJl0WnYc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5657
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

On 11/3/2021 14:38, Jordan Justen wrote:
> John Harrison <john.c.harrison@intel.com> writes:
>
>> On 11/1/2021 08:39, Jordan Justen wrote:
>>> <John.C.Harrison@Intel.com> writes:
>>>
>>>> From: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>>
>>>> GuC contains a consolidated table with a bunch of information about the
>>>> current device.
>>>>
>>>> Previously, this information was spread and hardcoded to all the components
>>>> including GuC, i915 and various UMDs. The goal here is to consolidate
>>>> the data into GuC in a way that all interested components can grab the
>>>> very latest and synchronized information using a simple query.
>>>>
>>>> As per most of the other queries, this one can be called twice.
>>>> Once with item.length=0 to determine the exact buffer size, then
>>>> allocate the user memory and call it again for to retrieve the
>>>> table data. For example:
>>>>     struct drm_i915_query_item item = {
>>>>       .query_id = DRM_I915_QUERY_HWCONCFIG_TABLE;
>>>>     };
>>>>     query.items_ptr = (int64_t) &item;
>>>>     query.num_items = 1;
>>>>
>>>>     ioctl(fd, DRM_IOCTL_I915_QUERY, query, sizeof(query));
>>>>
>>>>     if (item.length <= 0)
>>>>       return -ENOENT;
>>>>
>>>>     data = malloc(item.length);
>>>>     item.data_ptr = (int64_t) &data;
>>>>     ioctl(fd, DRM_IOCTL_I915_QUERY, query, sizeof(query));
>>>>
>>>>     // Parse the data as appropriate...
>>>>
>>>> The returned array is a simple and flexible KLV (Key/Length/Value)
>>>> formatted table. For example, it could be just:
>>>>     enum device_attr {
>>>>        ATTR_SOME_VALUE = 0,
>>>>        ATTR_SOME_MASK  = 1,
>>>>     };
>>>>
>>>>     static const u32 hwconfig[] = {
>>>>         ATTR_SOME_VALUE,
>>>>         1,             // Value Length in DWords
>>>>         8,             // Value
>>>>
>>>>         ATTR_SOME_MASK,
>>>>         3,
>>>>         0x00FFFFFFFF, 0xFFFFFFFF, 0xFF000000,
>>>>     };
>>> Seems simple enough, so why doesn't i915 define the format of the
>>> returned hwconfig blob in i915_drm.h?
>> Because the definition is nothing to do with i915. This table comes from
>> the hardware spec. It is not defined by the KMD and it is not currently
>> used by the KMD. So there is no reason for the KMD to be creating
>> structures for it in the same way that the KMD does not document,
>> define, struct, etc. every other feature of the hardware that the UMDs
>> might use.
> So, i915 wants to wash it's hands completely of the format? There is
> obviously a difference between hardware features and a blob coming from
> closed source software. (Which i915 just happens to be passing along.)
> The hardware is a lot more difficult to change...
Actually, no. The table is not "coming from closed source software". The 
table is defined by hardware specs. It is a table of hardware specific 
values. It is not being invented by the GuC just for fun or as a way to 
subvert the universe into the realms of closed source software. As per 
KMD, GuC is merely passing the table through. The table is only 
supported on newer hardware platforms and all GuC does is provide a 
mechanism for the KMD to retrieve it because the KMD cannot access it 
directly. The table contents are defined by hardware architects same as 
all the other aspects of the hardware.

>
> It seems like these details should be dropped from the i915 patch commit
> message since i915 wants nothing to do with it.
Sure. Can remove comments.

>
> I would think it'd be preferable for i915 to stand behind the basic blob
> format as is (even if the keys/values can't be defined), and make a new
> query item if the closed source software changes the format.
Close source software is not allowed to change the format because closed 
source software has no say in defining the format. The format is 
officially defined as being fixed in the spec. New key values can be 
added to the key enumeration but existing values cannot be deprecated 
and re-purposed. The table must be stable across all OSs and all 
platforms. No software can arbitrarily decide to change it.

>
> Of course, it'd be even better if i915 could define some keys/values as
> well. (Or if a spec could be released to help document / tie down the
> format.)
See the corresponding IGT test that details all the currently defined keys.


>
>>> struct drm_i915_hwconfig {
>>> 	uint32_t key;
>>> 	uint32_t length;
>>> 	uint32_t values[];
>>> };
>>>
>>> It sounds like the kernel depends on the closed source guc being loaded
>>> to return this information. Is that right? Will i915 also become
>>> dependent on some of this data such that it won't be able to initialize
>>> without the firmware being loaded?
>> At the moment, the KMD does not use the table at all. We merely provide
>> a mechanism for the UMDs to retrieve it from the hardware.
>>
>> In terms of future direction, that is something you need to take up with
>> the hardware architects.
>>
> Why do you keep saying hardware, when only software is involved?
See above - because the table is defined by hardware. No software, 
closed or open, has any say in the specification of the table.

John.


>
>>>> The attribute ids are defined in a hardware spec.
>>> Which spec?
>> Unfortunately, it is not one that is currently public. We are pushing
>> the relevant people to get it included in the public bspec / HRM. It is
>> a slow process :(.
>>
> Right. I take it no progress has been made in the 1.5 months since you
> posted this, so it'll probably finally be documented 6~12 months after
> hardware is available? :)
>
> -Jordan

