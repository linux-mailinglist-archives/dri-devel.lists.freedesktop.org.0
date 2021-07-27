Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 949363D7DEE
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 20:46:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F8156E207;
	Tue, 27 Jul 2021 18:46:55 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F47F6E07B;
 Tue, 27 Jul 2021 18:46:53 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10058"; a="276293114"
X-IronPort-AV: E=Sophos;i="5.84,274,1620716400"; d="scan'208";a="276293114"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2021 11:46:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,274,1620716400"; d="scan'208";a="517061200"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga002.fm.intel.com with ESMTP; 27 Jul 2021 11:46:51 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 27 Jul 2021 11:46:50 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 27 Jul 2021 11:46:50 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Tue, 27 Jul 2021 11:46:50 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.109)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Tue, 27 Jul 2021 11:46:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UonQ2pzyJI2vIGIW7D+RlYoYeSrVFE+wIKQ8cOgpgqmeQQSSflko3Y0lm/yg/nV54BhWuiFHRD+WyGadZ0Xk8ymqjb3BTJ2FW6TeR13XNovzBYu8c2RKczu95hPFlMkXHe1LHKSdbX9SJ4UAw73sESm3ap6Yk/jKwCzR1di46IbRn6cLTE6mIZTBwGlKF9ovans+UsFSUcxAyrSBgzCQ9RrB3H/NDnd2ENWKG7jq6LB0C3tgYdNtCwnJKuit2aghPAT3reO3UcsiOi8TO1qYGqLOWgpYkoO1mVVJt7F1XDCh+uRAcKKpjhR2C3MSbqxi8sMgwmmBUyWRwh+lo4Alfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DUgVfVHWA/FF+z3RZTtUQdDLqV3tt8z+iM6YCfnl8yk=;
 b=W+mdGzT2op9lyvQKjFvyjTzAhW3f2XEWpFyPgn6Cmr+sC6BUXjqSq5HjzkOWdGD7tLAKT0Q0gBtqO0R84UPs2Ew3AeXBareAkauIVTEYHX0gaBBd/2fPJF30/DrUjXEwcxt/Ni2iT/QUBRIVc5Msx/i4DaSMW466QH2OBsJ94ImE4ZzMyaSftJZc4G64MArQNQROKhA9ivCf7GTQJtr9+tng2diInrfKQQGnoQeGUa3vczXq5a+XLMo0mPXSBVprfBO6QbpzQFgXmeneGEoOZhXI14m9A0DYd1oNaCfb+yM4wYyhS51fUjmPb3/4XPhXA6iqtik7r9txxyASecG3/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DUgVfVHWA/FF+z3RZTtUQdDLqV3tt8z+iM6YCfnl8yk=;
 b=Hxt21rxEvm2D2fe193jDQDsxQQ0f3uJKOpbePWZnvOTzp6YLpb4J6Gdgc3eRdqV4GpmcuDNpbhqH08wMDs4ip/G31axWCXftRjT/tfCycB8Ko533JtcrWmRYNwfu7hxRz6cD0Nw+kK/XzaNBlk9B56rCd/n1SHKCJaJSfxuhOWc=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5675.namprd11.prod.outlook.com (2603:10b6:510:d4::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26; Tue, 27 Jul
 2021 18:46:47 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::c5a8:5a64:9118:95c4]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::c5a8:5a64:9118:95c4%9]) with mapi id 15.20.4352.031; Tue, 27 Jul 2021
 18:46:47 +0000
Subject: Re: [PATCH 0/2] Add support for querying hw info that UMDs need
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210727022145.157343-1-John.C.Harrison@Intel.com>
 <YP/WudLoHxIx/h1B@phenom.ffwll.local>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <01479f2d-78be-fdf0-d3ef-c0de92e9a769@intel.com>
Date: Tue, 27 Jul 2021 11:46:45 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
In-Reply-To: <YP/WudLoHxIx/h1B@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: MW4PR03CA0212.namprd03.prod.outlook.com
 (2603:10b6:303:b9::7) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.221] (73.157.192.58) by
 MW4PR03CA0212.namprd03.prod.outlook.com (2603:10b6:303:b9::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.29 via Frontend Transport; Tue, 27 Jul 2021 18:46:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e4e145f-ba37-49b7-0f1c-08d9512ee35b
X-MS-TrafficTypeDiagnostic: PH0PR11MB5675:
X-Microsoft-Antispam-PRVS: <PH0PR11MB567530F6756E00B51B42179EBDE99@PH0PR11MB5675.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BYX+/w9+9Eb2TgOL0q7DLndz8HQCZwIGKBnGZwSSHBNA0nVKODmUnfc7Ma7reRAZCBGONpD3GwnwS9GBqW7hO2Jsq4ayIc8nkzda5ZRM/i6rZkn6QwM7HoOa4EezWYZjh8fcYQO7Y8a35U90JlrQO/lpopvnAx4ZNFwPqna/k/e4sJVsp8Tt7jxi29E+iLzldlVWnkVsrh97jd1xJMRg8RkgcpcoztIqOlnD/Y1trLfUHRyoAkfUwk+iyjEsgacFDQ10zwMK7cAxmAf7r+hRd9FBSuJMh27UBmMr57e2meCHyHG3+2daSxVDe0z0rssDSe5Qi1borJcCzhfU2hUMQH2oCLlEKOurOQMUEC2uX4pQ+HezEwopH96/egIXpySMIM0tZ16gAhmWcHYAXdKUjMEHVvz1ttKYN31E8nF1nCVeyiOOCYx9dNgg5GQkVRrltiLzGatjqea+qcFtvDSDYqfCtWKkeUgUVbzFhSnghSISZwlp4rpR4lMjsiTG5JQiu76RiwiXR97nqYREmIPE4TJzgoXGTpMprsq6bLlnQtzRows0OYk6lCpLjqc51UqXBlSLEVdncSq8qmBUc4oCZUV5X1Yv+htMwR3TToaBFH/UCp2/+S3kRz9yNkzkmq2rQGaAiopbDz5S+I2cT+fNf1HPbnwGS2uwqMDhPd+TosCtDiOYHhGdcLrbMnXo5oI3kPTy2h4iv7qU+uuMaKfG6LAI1rELOsfuGvkjljr/wp74AEoGrxq6Pl3caVL36B8g59wgZQupsHBiNQ6IZIOXGbDeGl+LKSROrQ87jEkifHIFH6rheNeX/jQpTNEpoxh5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(136003)(346002)(39860400002)(376002)(5660300002)(4326008)(186003)(86362001)(6486002)(83380400001)(31696002)(8676002)(6916009)(16576012)(26005)(316002)(36756003)(31686004)(66476007)(66556008)(53546011)(478600001)(2616005)(2906002)(8936002)(956004)(966005)(66946007)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NS95Q1NxTTkrSVdTMUR1TDBHYitzRDdLNUJrTHNFanZGQzNJdmNCTmxsVXVy?=
 =?utf-8?B?cjVkdVdqRmM4ZExpeTNGMXNWVmp4QTlYUW5FVWVxRk9TdWZJZS9wZlNvMlJn?=
 =?utf-8?B?SS9UQkYzVjN6ZDk1SG1ra2pMNlBDdng2UVQzQlEvUzd0TmZhcTdyQmV3dmNz?=
 =?utf-8?B?QzdYUFc0ajlhVWxPS0tGaGVEYU9GQ1RLdUY1bGpZN0xITGMwaU00ekRFcWxX?=
 =?utf-8?B?TDdJNk1DeGd3WUZUL1JtSnlMc2ZNUTRmbi9JREdMZkp4NURpWFJFSmVnRkVB?=
 =?utf-8?B?Nks1bnNWam9WSlUvbnZSMUtpbDFDREpiZXRuVkRXY3JUZVArQVN4dHFyZVdT?=
 =?utf-8?B?UDBvWGpDcnlHZVZZVk9TNWZLa3duVmFkb3AreTM1SFVrU0txd1l5RXpiNHJW?=
 =?utf-8?B?WlZYWm9YeDZRRWtpV2M4YlpoRG5qbkVFUmFFYndBcGpKdDIwM0R4ajVsUm40?=
 =?utf-8?B?SEV1bkhOMHF4OVBidVFibFE0eFB4TTd3TGdlL25QMzdRSmtIb1NnQ0V3VjNK?=
 =?utf-8?B?ZGRTSzlScVlVMkhreDAwdmNYTEdoQWY3bzUzaWl6VjYreXU4Nkp3WWRCK0Uv?=
 =?utf-8?B?cFRhV2RGVFFCNmpmUDZTTWlwOHpHK000alNMRlA5MVVUdUhOdGVMVzJTcUho?=
 =?utf-8?B?SHdhYlU5TFVlVkcrVGhCQ3FqMFFqWGovOTBMVXA0ZXZFem9Ja3QzZmp5WGhM?=
 =?utf-8?B?Z3NrSFJFUmxOSmFMdnJ4V2UrSXBReC9NK3NWVm9QbUxLbUhrUTUxcUVDT0RU?=
 =?utf-8?B?UHdkSSt1RXNUeW9HQnhWMjNTVncxK1V5cWJPbGFyMHBLNDdEOFFEUWdRNWJB?=
 =?utf-8?B?UXBXWi95NENWSExZdlRyZld1SGE4VHdDQWVhUG5QV0ZvWlZUemRTTXRZcWda?=
 =?utf-8?B?ZUR5ZDFFR3VqT2xRV2U4S2xncUluMk5CVzcrb1N1VXBxZXcvRjIxYmtpZ1kr?=
 =?utf-8?B?eHhwZ2ZSelZiU2RXWHdLRytIUGNNeU1qRnA1UVZwWUlwbXQyRDF3YVNrUytR?=
 =?utf-8?B?eXhSOG45Tmw3WUZNd2lrcS91T2ZWWURwY29LU09DY1AreWFDWXFoWG5aZWhl?=
 =?utf-8?B?OVJzOThkdTlUcUx5aUk2Zy9qUU1DczdTWDdPSVl1aHliKzI3Rk4wUVlvbEp4?=
 =?utf-8?B?T2ZTdVJCTmZKZGUvL2llb09xUnhna2hkZlF3R1B3U3c5MStqYVk2YUwwdDBW?=
 =?utf-8?B?TkNtTEhhdHpmZXdxZUIzWmVPdjIzTmpHZmMxOGJoSUFQeFpwT3BWZGR6amNR?=
 =?utf-8?B?SzdXZnNNdHR3MVBubFpvZlJhVWNaOVJpWXpOeGRDZ3VUN2VrQ2kyaXY1bjNT?=
 =?utf-8?B?cklxUzZpTWI3TDcvTGh5SFdObVdET0l2SVRUcDh0YXpNL1RVdmpDakp5VW5Z?=
 =?utf-8?B?c2N5SXo2cFZ4LzJDbHJvb0ZHMEQ1YXF2ZzhxN1I3UUVPRHhidXRwdzdueXNT?=
 =?utf-8?B?ZHFXNEhNczB1ZFpYOWlGQnNjRmN5aHI4a1FRb0NOYWoyYWpwTTZUSkRsZUZH?=
 =?utf-8?B?bjNvUGUzN2FheHk1aEVXbjhGbmgrZmk5UXE3S21ZTjZGckxiNDlLajY4eDdQ?=
 =?utf-8?B?ZVR2R3pqYlBqMmRIdEhHUmxuRDBORmt5SUtLakFJUnVFcjRQcWlZMzdicGxh?=
 =?utf-8?B?UXRGTTFNMWIrVHFmTTNrWE5wTk4zTTJEQWNrQnMzMTRvbytYOHgxNzBISHBj?=
 =?utf-8?B?WGd4RUVZS2J3aEJNaHJBRnBKYzJhVUlrb1JJdmVxZ1VyalNFbnN0VVJsYWFF?=
 =?utf-8?Q?lTV9rcuPJls20lfIfCseSVriueqinfm0fWp0EV5?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e4e145f-ba37-49b7-0f1c-08d9512ee35b
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2021 18:46:47.5452 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gg2T+rF7/ywawCutuXpSJm1XnOuX+gvh8DB2CFKwFFIb/0Z2KYoU1ThDxu2/e219SbzSTwC8uILegfInw0h9weR35MSbaHqQZSQDZ8AXgLo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5675
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
Cc: Intel-GFX@lists.freedesktop.org, DRI-Devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/27/2021 02:49, Daniel Vetter wrote:
> On Mon, Jul 26, 2021 at 07:21:43PM -0700, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> Various UMDs require hardware configuration information about the
>> current platform. A bunch of static information is available in a
>> fixed table that can be retrieved from the GuC.
>>
>> Test-with: 20210727002812.43469-2-John.C.Harrison@Intel.com
>> UMD: https://github.com/intel/compute-runtime/pull/432/files
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> Can you pls submit this with all the usual suspect from the umd side (so
> also media-driver and mesa) cced?
Do you have a list of names that you would like included?

>
> Also do the mesa/media-driver patches exist somewhere? Afaiui this isn't
> very useful without those bits in place too.
I don't know about mesa but the media team have the support in place in 
their internal tree and (as per compute) are waiting for us to push the 
kernel side. This also comes under the headings of both new platforms 
and platforms which are POR for GuC submission. So I believe a lot of 
the UMD side changes for the config table are wrapped up in their 
support for the new platforms/GuC as a whole and thus not yet ready for 
upstream.

John.


> -Daniel
>
>>
>> John Harrison (1):
>>    drm/i915/guc: Add fetch of hwconfig table
>>
>> Rodrigo Vivi (1):
>>    drm/i915/uapi: Add query for hwconfig table
>>
>>   drivers/gpu/drm/i915/Makefile                 |   1 +
>>   .../gpu/drm/i915/gt/uc/abi/guc_actions_abi.h  |   1 +
>>   .../gpu/drm/i915/gt/uc/abi/guc_errors_abi.h   |   4 +
>>   drivers/gpu/drm/i915/gt/uc/intel_guc.c        |   3 +-
>>   drivers/gpu/drm/i915/gt/uc/intel_guc.h        |   2 +
>>   .../gpu/drm/i915/gt/uc/intel_guc_hwconfig.c   | 156 ++++++++++++++++++
>>   .../gpu/drm/i915/gt/uc/intel_guc_hwconfig.h   |  19 +++
>>   drivers/gpu/drm/i915/gt/uc/intel_uc.c         |   6 +
>>   drivers/gpu/drm/i915/i915_query.c             |  23 +++
>>   include/uapi/drm/i915_drm.h                   |   1 +
>>   10 files changed, 215 insertions(+), 1 deletion(-)
>>   create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
>>   create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.h
>>
>> -- 
>> 2.25.1
>>

