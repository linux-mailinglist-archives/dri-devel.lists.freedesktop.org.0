Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7743742C9AE
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 21:11:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DB746EA98;
	Wed, 13 Oct 2021 19:11:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F37C26EA9D;
 Wed, 13 Oct 2021 19:11:43 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10136"; a="214453060"
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="214453060"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 12:11:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="715682253"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga006.fm.intel.com with ESMTP; 13 Oct 2021 12:11:42 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 13 Oct 2021 12:11:42 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Wed, 13 Oct 2021 12:11:42 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Wed, 13 Oct 2021 12:11:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EQpIlMqRONof0ng3JnyyZwNC5wNPaZmrvsWlO3x6ZScqXI0cK8N+PWeTmJo2RakPVKOiLjHdlhz1vNJUKqkOIyvrTVyTmekD1LgqMH/KIxZZWX+gzWuEv1EEjR7efopGnFOsI5+qGkwTiO5/AEZbbK1KCVsiZPUcY0GZQEA4GZWYXII64VMPyjQToKvohOEGAL2LJqQqBS4L62L/UUZj3zJESW1Vwd2inQuZ/2/oO9eKusuCDgZ/WPR997WEEAS6qFzRjgF/Wvg/LmDckbsxOIkh4ZV4JlMs+FNjOlkur50m0qwfSKcnLezHUDvza1wpVBp609w/GlhMczIRePIE5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UWFmubD03zzzwbefnUhJ5YvBpNHUOlxaiNp73IkHSN8=;
 b=g7ewEfowst9HQn1nwhS/+oko4jnVq/tCNxQY73M+YmP1CXnV86DpavqggyByHRO8D24zJU7SkG56eq0QY7EEM7zVLk6Us+uwLRxlTQrd6uAR694ikSFMEPaqkl/qNGVD044Ew5jK3rYOXxEmCA03JxU9GNiNek7lkVmFKHdKThVr0vxYkfP/MysaLjfnjZu4AVz+hdJfciEJ8VF5DXlHwnfFCmpPNd4/bhKL6K4YMX8unqJhaEzUoSMKMXFJ2o+hcwpHb1kdvRTquN7kZ8QWiglBdOmQs+8nGZAAKE/q/bAcmZPyaiC6CUZKq7QfLwrr1wwjRG/KDQtCDiCaAn8L+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UWFmubD03zzzwbefnUhJ5YvBpNHUOlxaiNp73IkHSN8=;
 b=WBxl5b/RSaEWW++/Zp6g/p3HiHMmVOr6TR/qI9/Uh+cCwppgb0ZDYnpZUxvlFewl7vR/lgjUZc4g8VwlpNU/fFbfAzdNPFqBPAoln9P6QVu2+hdoF2S3tTzXiA1B07uVDMG3Om3qMM5QWShUHoaaGeKtMqLdBIcRLFYEmioH+SQ=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5578.namprd11.prod.outlook.com (2603:10b6:510:e7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Wed, 13 Oct
 2021 19:11:39 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a%8]) with mapi id 15.20.4587.026; Wed, 13 Oct 2021
 19:11:38 +0000
Subject: Re: [PATCH 10/26] drm/i915/guc: Assign contexts in parent-child
 relationship consecutive guc_ids
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <daniele.ceraolospurio@intel.com>
References: <20211004220637.14746-1-matthew.brost@intel.com>
 <20211004220637.14746-11-matthew.brost@intel.com>
 <63c2eb50-b5e9-5aec-1cf8-0e0b94cb991a@intel.com>
 <20211008012151.GA24680@jons-linux-dev-box>
 <e58f0cb8-0261-1e8d-5b56-5dd69bf070e3@intel.com>
 <20211013180331.GA13066@jons-linux-dev-box>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <7629f4e3-1119-3974-b05a-d255d5e16925@intel.com>
Date: Wed, 13 Oct 2021 12:11:35 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
In-Reply-To: <20211013180331.GA13066@jons-linux-dev-box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: MW4PR04CA0292.namprd04.prod.outlook.com
 (2603:10b6:303:89::27) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
Received: from [192.168.1.106] (73.157.192.58) by
 MW4PR04CA0292.namprd04.prod.outlook.com (2603:10b6:303:89::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.25 via Frontend Transport; Wed, 13 Oct 2021 19:11:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8def487d-3181-4ff5-4fc9-08d98e7d4856
X-MS-TrafficTypeDiagnostic: PH0PR11MB5578:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB5578AF9BD1B7DBDBBFB121DCBDB79@PH0PR11MB5578.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7PEh8DSgRWq9Cxvjb4cIN8K8hdMYfe9hXw3MTzVjsRKx8zEPiZI1+w8DD9dItEOehsF95bLNRqsV9BqHrIrEi3Ae9/Qff7jY5085Yr+k2iaROOKPbNFwwlZGJ1Ky21T6iUW2sQEDUeS0COgfPS6YjrDJNYE6X6uvAzKNH0+70zmmIJgn+V6VAsmavyTKejPbqdjR3lHchCOyC0y0qIoLywoHcViHJUdmNJjQViYL1I2iGMlC5Yrru6Gpi8t0U7svv3caaIM+Dk5RTaxyHZDt4BThyjxpolDLwO4ZijqEfvg2NqF90RFHXunIQ4rH1rsxm16/Qm3iKBVbmAbABt0xQ0aL40ZtcbddZdSkJESL4rTP7j3truontShNOfb+YOgJgn71zrIrps4L3m3YAuNH0Asay/BV5OA+ZfM5HNGInsD67t4LQafskg9pSq/Jv6fPyh0Pnsepwkz8/pxa7KHYmOqvSbGIBGUrIY4Uu1vZebHUEkQEqYwS/NizbUBpwG+1VKZj33nnOdGt4wzBdkYhykiWMDsBzOtf00bIK+RVGqYRYFl6yyPPs4/CbvRVVKnKMvMS6d1YPR7d7jywjFWJrzefk0m4UvsoRb+8EccMTvLy2T9CRlm3aHEMJACIpqaBcO60/d1u+frr9TYX4MvzE73G3JAfym+YAlk1i5DWSdkIOdnOEy3kLO/TjcbCV2WTKBttrDQcDdQr0vTcrvx5zjI4ZRnl6gNu3/jjDgJ5jOsAvNxlJWUTyUoWPh26unEY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(316002)(16576012)(186003)(53546011)(6486002)(2906002)(37006003)(66476007)(8676002)(66556008)(5660300002)(31696002)(66946007)(508600001)(6636002)(38100700002)(36756003)(2616005)(956004)(8936002)(107886003)(83380400001)(86362001)(6862004)(82960400001)(26005)(4326008)(450100002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NFVKSzRVZVl4OVBzMGw0Y1crbjFwVGlMcFppVTFPaGhWTU9PYTlnQjloUVlO?=
 =?utf-8?B?U0F5M1FkZGtRcUY3V0d2STZiS0pPUUFRWlRObUw1YTlwYVo0TVJ3aVhzSFpN?=
 =?utf-8?B?N2RmVXZFeDdPUDFPRmpjSWVybHhGKzNZTUJqR3NVSzJBckJJWmdkNFI4UDc2?=
 =?utf-8?B?S01UcHBGMWNSMnkxTmxOVEljUE5sMm5odlZTdm0wNURZSnUySG5KSjJ4L2Fr?=
 =?utf-8?B?dk9BS0pJR205SCtxYk0zVm9ydDRPN3dWbGZjOEZrelBVRVM4YTZOVGJMVDE1?=
 =?utf-8?B?R2d1c2syand6OS9CMFpMWlkrTEQ4RVR0U0lUUW9KMEl5ODhQdkpHWWNpSkM0?=
 =?utf-8?B?UFh4TEx6Tnk2bU81SjkrdkJrVUhxRi9KUkdkbDREaTZmRVd3eVVWV01PSkMy?=
 =?utf-8?B?ZktJazlmbEFNbUpmbEZZNXYwNlFUc2plNnl4cUQvR2RTczVLcVdZNXZqTE5B?=
 =?utf-8?B?K1lnVjk5cjRJTHg5QTBSd2N5cDNDMmJuMVgyZHhiRnBrd2dMM0FhMFk0bkx6?=
 =?utf-8?B?S3ZLOHoxQnFtVDgvVzd2aE1aR1dTVWYwNEFJUFFwbDZkWjlwOSsxNWNCUlpl?=
 =?utf-8?B?QkozQmRibVp0anZ1eUlIWmM2QkF3Wm5EUVVXS1VNZ0h3RUVIcjM2cWk1VTdk?=
 =?utf-8?B?dThZbDhjaXV3UEU2em5JZzlpQXp5VmhGUjM5VGVRUityUks0aGE3RTNiOE52?=
 =?utf-8?B?TGJGTXVpUzFzK3k0RTNkU2RuMUNtYUFuZjFJeHN0NUpOZG5wSjQzN1k2bWR0?=
 =?utf-8?B?NGdHQW1zK3BjMVZ1RnFzMUlwU0NSTzlsOWVPbHc5a0s3UUs2WUlEeTBzTVhJ?=
 =?utf-8?B?Yk5HQlkvK1d0KzhnclBUbGZlYkEyV2JTNHJJMFA0YjdDRThSK2xGOEpoZ1FM?=
 =?utf-8?B?dzRJaURBL1hSeGxKc3IvZ3BoQlE3cmNKdUlMVlc4c3JsVGw4c3drZHYyTU1m?=
 =?utf-8?B?VnlOTUtzOFhhd3YwZlhMRzNBdFA0QndSUWNBRUNpaGtpWnBUUzNuZzVDT21m?=
 =?utf-8?B?UEZjNmlWRzdRUE5GbVJKVTVUVkk1dXIxZU9qRW9wVHA1aHhweS81a1A2Z3h5?=
 =?utf-8?B?OXN6b1Q0ZUFVNHdmTjVTNHczWWZ3OXU4OGFMK29jdXBrdGUvRlJNUFdkVVcw?=
 =?utf-8?B?UWJBL0s2L3BxUktwK1RsMkxQdjVNZTh4WGttNnozUWZlNXMzcjZHMmExUWJI?=
 =?utf-8?B?bkh1Mm5jbXU4Zms3dnFmaFRwdEVvaEtWUzl5Qm5DYlU5Tk9xNjFIM21WTEQz?=
 =?utf-8?B?blozeDZ0T0FmRzZPOGVieWtnT1NSbjd4ODJIaTFnbWZTWWRSTkF2eENmMDhm?=
 =?utf-8?B?c1pCYVFYaDJrdkVYWmYrdEtQUndSMkt3YTdMNTl4R0pjVzlyRmM4VlF4NDlq?=
 =?utf-8?B?anlERkZOV0pyK3cxMnVsQkZmQytlRy9lWVRNZXhnOHV6YURXSWtKM2hkMnVq?=
 =?utf-8?B?OXlEMm9DdlBwMU9PQ3J2U21rOGlvN05FeEl2RzdlN1NYUGYySnNRYVNQVmEz?=
 =?utf-8?B?NHZmRTlZU3l2T3BDNWdhR1RxS0ppbGx6QmtyU2h1M0tkdk9GK01MT1JXWmVN?=
 =?utf-8?B?WWk4d2VSblNoK08xRWs4TTBVUm1LNE1vWEFmZDJTYTd6d2xEOEZLUVJMdm9m?=
 =?utf-8?B?cHgwcktiNzUwLzZoWlhuRk5ldCtSeFlrZ0xKRitzK3daWmwzRUw4TXk0Sk5K?=
 =?utf-8?B?eGk2R0xmVDVYRi85R3pFbzZZeXdUVnEzamdYRURtWjYyNk1ldisyR2JlTU5k?=
 =?utf-8?Q?nsCzee+MVqsY7jvCeZEsHgQOl2cRdUKT5IQjFb/?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8def487d-3181-4ff5-4fc9-08d98e7d4856
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2021 19:11:38.6602 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d+0dNLdLt8Zi1mIwQunu/mMJn2roMxI0Nu1/eSvIf7R7Qx7lIxpovKd2YcA8EeMVA2OdiWjvKJb3lbn/yHsHhDrWSMrYgsNW1kwz2eJJHEc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5578
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

On 10/13/2021 11:03, Matthew Brost wrote:
> On Fri, Oct 08, 2021 at 09:40:43AM -0700, John Harrison wrote:
>> On 10/7/2021 18:21, Matthew Brost wrote:
>>> On Thu, Oct 07, 2021 at 03:03:04PM -0700, John Harrison wrote:
>>>> On 10/4/2021 15:06, Matthew Brost wrote:
>>>>> Assign contexts in parent-child relationship consecutive guc_ids. This
>>>>> is accomplished by partitioning guc_id space between ones that need to
>>>>> be consecutive (1/16 available guc_ids) and ones that do not (15/16 of
>>>>> available guc_ids). The consecutive search is implemented via the bitmap
>>>>> API.
>>>>>
>>>>> This is a precursor to the full GuC multi-lrc implementation but aligns
>>>>> to how GuC mutli-lrc interface is defined - guc_ids must be consecutive
>>>>> when using the GuC multi-lrc interface.
>>>>>
>>>>> v2:
>>>>>     (Daniel Vetter)
>>>>>      - Explicitly state why we assign consecutive guc_ids
>>>>> v3:
>>>>>     (John Harrison)
>>>>>      - Bring back in spin lock
>>>>>
>>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>>> ---
>>>>>     drivers/gpu/drm/i915/gt/uc/intel_guc.h        |   6 +-
>>>>>     .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 104 ++++++++++++++----
>>>>>     2 files changed, 86 insertions(+), 24 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
>>>>> index 25a598e2b6e8..a9f4ec972bfb 100644
>>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
>>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
>>>>> @@ -76,9 +76,13 @@ struct intel_guc {
>>>>>     		 */
>>>>>     		spinlock_t lock;
>>>>>     		/**
>>>>> -		 * @guc_ids: used to allocate new guc_ids
>>>>> +		 * @guc_ids: used to allocate new guc_ids, single-lrc
>>>>>     		 */
>>>>>     		struct ida guc_ids;
>>>>> +		/**
>>>>> +		 * @guc_ids_bitmap: used to allocate new guc_ids, multi-lrc
>>>>> +		 */
>>>>> +		unsigned long *guc_ids_bitmap;
>>>>>     		/**
>>>>>     		 * @guc_id_list: list of intel_context with valid guc_ids but no
>>>>>     		 * refs
>>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>>>> index 1f2809187513..79e7732e83b2 100644
>>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>>>> @@ -128,6 +128,16 @@ guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count);
>>>>>     #define GUC_REQUEST_SIZE 64 /* bytes */
>>>>> +/*
>>>>> + * We reserve 1/16 of the guc_ids for multi-lrc as these need to be contiguous
>>>>> + * per the GuC submission interface. A different allocation algorithm is used
>>>>> + * (bitmap vs. ida) between multi-lrc and single-lrc hence the reason to
>>>>> + * partition the guc_id space. We believe the number of multi-lrc contexts in
>>>>> + * use should be low and 1/16 should be sufficient. Minimum of 32 guc_ids for
>>>>> + * multi-lrc.
>>>>> + */
>>>>> +#define NUMBER_MULTI_LRC_GUC_ID		(GUC_MAX_LRC_DESCRIPTORS / 16)
>>>>> +
>>>>>     /*
>>>>>      * Below is a set of functions which control the GuC scheduling state which
>>>>>      * require a lock.
>>>>> @@ -1206,6 +1216,11 @@ int intel_guc_submission_init(struct intel_guc *guc)
>>>>>     	INIT_WORK(&guc->submission_state.destroyed_worker,
>>>>>     		  destroyed_worker_func);
>>>>> +	guc->submission_state.guc_ids_bitmap =
>>>>> +		bitmap_zalloc(NUMBER_MULTI_LRC_GUC_ID, GFP_KERNEL);
>>>>> +	if (!guc->submission_state.guc_ids_bitmap)
>>>>> +		return -ENOMEM;
>>>>> +
>>>>>     	return 0;
>>>>>     }
>>>>> @@ -1217,6 +1232,7 @@ void intel_guc_submission_fini(struct intel_guc *guc)
>>>>>     	guc_lrc_desc_pool_destroy(guc);
>>>>>     	guc_flush_destroyed_contexts(guc);
>>>>>     	i915_sched_engine_put(guc->sched_engine);
>>>>> +	bitmap_free(guc->submission_state.guc_ids_bitmap);
>>>>>     }
>>>>>     static inline void queue_request(struct i915_sched_engine *sched_engine,
>>>>> @@ -1268,18 +1284,43 @@ static void guc_submit_request(struct i915_request *rq)
>>>>>     	spin_unlock_irqrestore(&sched_engine->lock, flags);
>>>>>     }
>>>>> -static int new_guc_id(struct intel_guc *guc)
>>>>> +static int new_guc_id(struct intel_guc *guc, struct intel_context *ce)
>>>>>     {
>>>>> -	return ida_simple_get(&guc->submission_state.guc_ids, 0,
>>>>> -			      GUC_MAX_LRC_DESCRIPTORS, GFP_KERNEL |
>>>>> -			      __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
>>>>> +	int ret;
>>>>> +
>>>>> +	GEM_BUG_ON(intel_context_is_child(ce));
>>>>> +
>>>>> +	if (intel_context_is_parent(ce))
>>>>> +		ret = bitmap_find_free_region(guc->submission_state.guc_ids_bitmap,
>>>>> +					      NUMBER_MULTI_LRC_GUC_ID,
>>>>> +					      order_base_2(ce->parallel.number_children
>>>>> +							   + 1));
>>>>> +	else
>>>>> +		ret = ida_simple_get(&guc->submission_state.guc_ids,
>>>>> +				     NUMBER_MULTI_LRC_GUC_ID,
>>>>> +				     GUC_MAX_LRC_DESCRIPTORS,
>>>>> +				     GFP_KERNEL | __GFP_RETRY_MAYFAIL |
>>>>> +				     __GFP_NOWARN);
>>>>> +	if (unlikely(ret < 0))
>>>>> +		return ret;
>>>>> +
>>>>> +	ce->guc_id.id = ret;
>>>>> +	return 0;
>>>>>     }
>>>>>     static void __release_guc_id(struct intel_guc *guc, struct intel_context *ce)
>>>>>     {
>>>>> +	GEM_BUG_ON(intel_context_is_child(ce));
>>>>> +
>>>>>     	if (!context_guc_id_invalid(ce)) {
>>>>> -		ida_simple_remove(&guc->submission_state.guc_ids,
>>>>> -				  ce->guc_id.id);
>>>>> +		if (intel_context_is_parent(ce))
>>>>> +			bitmap_release_region(guc->submission_state.guc_ids_bitmap,
>>>>> +					      ce->guc_id.id,
>>>>> +					      order_base_2(ce->parallel.number_children
>>>>> +							   + 1));
>>>> There was a discussion on the previous revision about adding a BUG_ON to
>>>> ensure that number_children cannot change between the bitmap alloc and the
>>>> bitmap release. I'm not seeing the new BUG_ON mentioned in this patch.
>>>>
>>> I thought you meant to add a BUG_ON to ensure before we release a region
>>> / id it is occupied? I looked in both the bitmap API and ida API and
>>> neither have a function that checks if region / id is occupied so can't
>>> really add a BUG_ON for that.
>>>
>>> How much you add BUG_ON to ensure the number of children canoot change
>>> between alloc and release? I don't follow how that would work.
>>>
>>> Matt
>> I was thinking that where number_children is modified, you have a
>> BUG_ON(guc_id_is_valid). That would ensure that the release has to match the
>> alloc. Hmm, you already have a BUG_ON about the parent/child not being
>> pinned in intel_context_bind_parent_child(), which I guess covers it because
>> you shouldn't have a guc_id if you aren't pinned, right? And that is the
>> only function which can modify number_children, yes? So maybe it's all good?
>>
> I think we are all good.
We are all awesome ;)

Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> Matt
>
>> John.
>>
>>>> John.
>>>>
>>>>
>>>>> +		else
>>>>> +			ida_simple_remove(&guc->submission_state.guc_ids,
>>>>> +					  ce->guc_id.id);
>>>>>     		reset_lrc_desc(guc, ce->guc_id.id);
>>>>>     		set_context_guc_id_invalid(ce);
>>>>>     	}
>>>>> @@ -1296,49 +1337,64 @@ static void release_guc_id(struct intel_guc *guc, struct intel_context *ce)
>>>>>     	spin_unlock_irqrestore(&guc->submission_state.lock, flags);
>>>>>     }
>>>>> -static int steal_guc_id(struct intel_guc *guc)
>>>>> +static int steal_guc_id(struct intel_guc *guc, struct intel_context *ce)
>>>>>     {
>>>>> -	struct intel_context *ce;
>>>>> -	int guc_id;
>>>>> +	struct intel_context *cn;
>>>>>     	lockdep_assert_held(&guc->submission_state.lock);
>>>>> +	GEM_BUG_ON(intel_context_is_child(ce));
>>>>> +	GEM_BUG_ON(intel_context_is_parent(ce));
>>>>>     	if (!list_empty(&guc->submission_state.guc_id_list)) {
>>>>> -		ce = list_first_entry(&guc->submission_state.guc_id_list,
>>>>> +		cn = list_first_entry(&guc->submission_state.guc_id_list,
>>>>>     				      struct intel_context,
>>>>>     				      guc_id.link);
>>>>> -		GEM_BUG_ON(atomic_read(&ce->guc_id.ref));
>>>>> -		GEM_BUG_ON(context_guc_id_invalid(ce));
>>>>> +		GEM_BUG_ON(atomic_read(&cn->guc_id.ref));
>>>>> +		GEM_BUG_ON(context_guc_id_invalid(cn));
>>>>> +		GEM_BUG_ON(intel_context_is_child(cn));
>>>>> +		GEM_BUG_ON(intel_context_is_parent(cn));
>>>>> -		list_del_init(&ce->guc_id.link);
>>>>> -		guc_id = ce->guc_id.id;
>>>>> +		list_del_init(&cn->guc_id.link);
>>>>> +		ce->guc_id = cn->guc_id;
>>>>>     		spin_lock(&ce->guc_state.lock);
>>>>> -		clr_context_registered(ce);
>>>>> +		clr_context_registered(cn);
>>>>>     		spin_unlock(&ce->guc_state.lock);
>>>>> -		set_context_guc_id_invalid(ce);
>>>>> -		return guc_id;
>>>>> +		set_context_guc_id_invalid(cn);
>>>>> +
>>>>> +		return 0;
>>>>>     	} else {
>>>>>     		return -EAGAIN;
>>>>>     	}
>>>>>     }
>>>>> -static int assign_guc_id(struct intel_guc *guc, u16 *out)
>>>>> +static int assign_guc_id(struct intel_guc *guc, struct intel_context *ce)
>>>>>     {
>>>>>     	int ret;
>>>>>     	lockdep_assert_held(&guc->submission_state.lock);
>>>>> +	GEM_BUG_ON(intel_context_is_child(ce));
>>>>> -	ret = new_guc_id(guc);
>>>>> +	ret = new_guc_id(guc, ce);
>>>>>     	if (unlikely(ret < 0)) {
>>>>> -		ret = steal_guc_id(guc);
>>>>> +		if (intel_context_is_parent(ce))
>>>>> +			return -ENOSPC;
>>>>> +
>>>>> +		ret = steal_guc_id(guc, ce);
>>>>>     		if (ret < 0)
>>>>>     			return ret;
>>>>>     	}
>>>>> -	*out = ret;
>>>>> +	if (intel_context_is_parent(ce)) {
>>>>> +		struct intel_context *child;
>>>>> +		int i = 1;
>>>>> +
>>>>> +		for_each_child(ce, child)
>>>>> +			child->guc_id.id = ce->guc_id.id + i++;
>>>>> +	}
>>>>> +
>>>>>     	return 0;
>>>>>     }
>>>>> @@ -1356,7 +1412,7 @@ static int pin_guc_id(struct intel_guc *guc, struct intel_context *ce)
>>>>>     	might_lock(&ce->guc_state.lock);
>>>>>     	if (context_guc_id_invalid(ce)) {
>>>>> -		ret = assign_guc_id(guc, &ce->guc_id.id);
>>>>> +		ret = assign_guc_id(guc, ce);
>>>>>     		if (ret)
>>>>>     			goto out_unlock;
>>>>>     		ret = 1;	/* Indidcates newly assigned guc_id */
>>>>> @@ -1398,8 +1454,10 @@ static void unpin_guc_id(struct intel_guc *guc, struct intel_context *ce)
>>>>>     	unsigned long flags;
>>>>>     	GEM_BUG_ON(atomic_read(&ce->guc_id.ref) < 0);
>>>>> +	GEM_BUG_ON(intel_context_is_child(ce));
>>>>> -	if (unlikely(context_guc_id_invalid(ce)))
>>>>> +	if (unlikely(context_guc_id_invalid(ce) ||
>>>>> +		     intel_context_is_parent(ce)))
>>>>>     		return;
>>>>>     	spin_lock_irqsave(&guc->submission_state.lock, flags);

