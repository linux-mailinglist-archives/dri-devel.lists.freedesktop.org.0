Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C94A467D9E2
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 00:45:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 479A410E11C;
	Thu, 26 Jan 2023 23:45:30 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D92910E0CA;
 Thu, 26 Jan 2023 23:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674776728; x=1706312728;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1GZQtu+B7IPedvCtogJfvYFqCTMwPjxYMoDuS9uL1Yw=;
 b=K4nrxSes26MFpZ44vbM9HCBIO9sPKZpALYFR/n2WBFyAyrmphykhSHyH
 +3JZORA4Ij4jwkr4vLtwgtJxOc2iJBKbEEEFzl34lV3mhxtV1I2Np3y5m
 /vNo+B/BJoRvKw7E/B5VKv3ca1SsITLLn7thRQwWm/EbVDrvKopAVykSC
 CUV9Z3/fELcPaUFCbQ/5qR2b00CiYtNt9PEDNgtoZUli7TxcrIoDRhfq3
 pNQQsi4Wm2a0ej9jqFohiej7ZFGdBmQt8ym2F4aZoorpCzXdsA1cVMTKq
 Umm9eaDNcVw7nbHA1njZ9Xws557CQjEsS76Hmu8l2l43zK509lMaF/MPB A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="325660157"
X-IronPort-AV: E=Sophos;i="5.97,249,1669104000"; d="scan'208";a="325660157"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2023 15:45:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="771357049"
X-IronPort-AV: E=Sophos;i="5.97,249,1669104000"; d="scan'208";a="771357049"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga002.fm.intel.com with ESMTP; 26 Jan 2023 15:45:27 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 26 Jan 2023 15:45:26 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 26 Jan 2023 15:45:26 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 26 Jan 2023 15:45:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VEU038rN1IMDpmd3PPHNq04k4YyXMSpJ/o0T94rcCjJlSGtoPks5ZLrT1pDEF+AwZWuQ8MOSxd5ibDLNQ+QJ/ei85aLeQ1MYNrt62rakD9cIX0MFKRS/2Rq48uq8OzbMdAwo++mWpaEdmqWl05VILB0PGpfCGqlM3nqypPuEC8JexwDQIlanjA6ooQl9QlBN+FeUIhUiA6fvhzN6GGewbMbToPgzhvpZlnwmIdecmtm482iN3Z2gtks+s91JeRZ82/XDNgIMOqFBKMSUJCLyDixuYBth8hiNk60myyz21i2IwdkPeqw5TPNJ82Cm3RQDsMTR60kXAloSn3xoQW/yFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n4yxfmT3hLfdcYZd9sQk05MBF4TjrKTacHjFz9QHuH0=;
 b=XFhtA+XFjqIPAUjbhjTdBFO4bpt7vvSI1ng3wzMncLWO5AaN6yEK99DxA5cyDJpyNqS1eSln/xRosT8F8/Y8pwnubpmgSmH9RRfiPUeYx8hQnFgtu4kF+QRgCgXgLmPInDZGoq7nTlhVEmmvBrBsx3/ZYS05gcoRL53yHjxw10DfljcYmkd9xtrtkc/+zK822A2izivezb9GgqkXwQ/wXh8hzggpk+RSUNGpFD+ETzf/YMwkdyQClMkMypNWxVJ0UhOfwxbshk3WUIDsqzNEbEjL/wyQaB20/DDVObbnuY7VXVzaffj3cMKnCG31eVDMb8Z+NukR7Kjao5XcNLKu/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 IA1PR11MB8152.namprd11.prod.outlook.com (2603:10b6:208:446::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.18; Thu, 26 Jan 2023 23:45:24 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::218f:c449:80c8:7ad9]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::218f:c449:80c8:7ad9%5]) with mapi id 15.20.6043.021; Thu, 26 Jan 2023
 23:45:24 +0000
Message-ID: <cba47bc3-974a-01e3-70cb-ff5852e4fe39@intel.com>
Date: Thu, 26 Jan 2023 15:45:20 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v5 1/8] drm/i915/guc: Fix locking when searching for a
 hung request
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20230126005420.160070-1-John.C.Harrison@Intel.com>
 <20230126005420.160070-2-John.C.Harrison@Intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20230126005420.160070-2-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR10CA0026.namprd10.prod.outlook.com
 (2603:10b6:a03:255::31) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|IA1PR11MB8152:EE_
X-MS-Office365-Filtering-Correlation-Id: 202adefe-e72f-4fbb-fc3d-08dafff764a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s1Y4MwS0wdXwzhdB2FpJgxHZ/mJlHMm9hXZ9x4zRALQhHwk5TEw90taUEPJqtmCUlpKfsxiHeOr1sbFWwT3W/eeOAcc/P49o38oNFS+qDd+3MCXW9Pb5lzc2X3l5/2ng/meQoZaD0RKrJgmEkxSATRy0xOo+cC5JRxv5cAQPCdL9o0Sp/VUpCfFfd/0z0j70u9TW4wmE4xf7FQRL5Hfjv65sZW0p6YOePheQgnH5VUPV9ry6Ka3zfJUYqzi0BR8lh4eVl4TdcWp4vrRlW5lIuhrLZFY4onFOiAUi3gf0b3+6iQTsa24VyxCcW0qBg4t2v8bDBib1xgzR2EH6hrBkXv79YrqHFIN/SELZzdSPXXBPu44Tix4XuNqv4QVyhzHIT0h/gE94X/WtFW5PlOZDLSrxa8aoiHFQ0nYcz4NKe+8fG4H0xQagLUhH9TymgH09Rtv0m7HcvH9FN0mx/ilIAwM3J07v0+zeLFqznB9kAYGiBvVDQZn60OfmvqBxYS2d2rSkvl3WMNgHoP2H/s7d9iXAY4iZqhf2QrimE3wpe6fcKOe8+Z5IK0S6lesG8jh4wSPrjyWl/RPTpaJtdSZluttCyZ7PHewWGFcHbcfQtZy6875SnilpNDlKnBRx9OpiUWMa4ctYSuZOdwq0GOA1yZSjcdvBTHW6jWwlGHMSrmbvBDnpwdoEuAVlMzG0vqniOgqFDk5QhZmP7sG3Qa66HykMke14EITk6SK+HbtaDzh6czqJuYni7HMze+yuqFhK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(366004)(39860400002)(376002)(396003)(136003)(451199018)(83380400001)(186003)(31686004)(6486002)(31696002)(66476007)(41300700001)(54906003)(66946007)(66556008)(82960400001)(6666004)(38100700002)(36756003)(86362001)(4326008)(26005)(5660300002)(316002)(2906002)(8676002)(6506007)(2616005)(478600001)(8936002)(53546011)(6512007)(51383001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WHUyOWxCdmFnMHVCc3M1ZE8vdkluQlhLb2FNUi9hcnhycFZhZFU0VWh6V1VD?=
 =?utf-8?B?QWRoajVQeTN3Mnc2UkFiWHl6d0hlQjU4NEZwcXVOTkFRMUpaZDNSTEwrSjZR?=
 =?utf-8?B?bWlxQVY4bVh1dDNMclg3bWVIYnBXbkwrNkFiL05uQzVHUExoQ2FDTWFxS1Bi?=
 =?utf-8?B?WmduRnVueUFhbXcxZTJ6b1JqRGw5YkFEZ1Z0RmlQOEpLQkRvQ3NtR0hDeGIv?=
 =?utf-8?B?Ty9NaFJZNy9zU21GRkl3TjMzVEFHQ2N6QnhTV0tYcHlCSWRVeUdXdDVXUDIr?=
 =?utf-8?B?d243MmgzV2lGcnpqK0R1MHV6NFliV3kyczQ2Ky9OL3JWRkVyQWc3Z2c3cmpo?=
 =?utf-8?B?blFPVXRZbXZUcVRabitWN2kxVk5JN0V4R0dRWXk3NzVjaFQxcEVQSzlGRFQ2?=
 =?utf-8?B?eUFkeEFKaW1XbGJOVDg4TkFHOGo0ZnBzYlRsRGJ1ekhpWVlPM3VVNk8vMTlR?=
 =?utf-8?B?eEp3OHN2emRXUVNTTDhPb3NqTVN0ZVhQUy8yVmdmTEwwaVhsTzBuV3ZNTEIr?=
 =?utf-8?B?bEd1emY4S2d5cTJmT2MwZWt3Y3hYQnpIU2tIMGNjOUhTK05DSlFqNTJ3TVpM?=
 =?utf-8?B?T1dyS29EeWNkcStNTXpmU3RVNTBid2k2alZDZ0lGdmhPUlNrQ25hSVVSUnps?=
 =?utf-8?B?UEorUEZYUFhIVlRjckpsNWNUbktucml5MmVoYmwwa3Jydlpjd1lXbHQ4ckZ5?=
 =?utf-8?B?SXpiUXRhL1N1emUwQVpmaWpyL2t0YUd6L2hlUzhTd1RVN0hkWC9PVi9nMU5L?=
 =?utf-8?B?a0pxNFB3dmx1Y0xIUG5BaVJya3VBMFNYc1NQWmRmWml2WCtMVXNaS0hLdURh?=
 =?utf-8?B?NnBYZ2lrR2lxWm5IUkg5OVU4L09TS2dybVZQamMrVGd5WThJS3ZGWXNQaFhO?=
 =?utf-8?B?US93Nm9zc1Y5akMyRDRpZFd2Y2grMCtFM05FVThGV2UwbytkbEY5dmZHZHVm?=
 =?utf-8?B?MytUeTZHNlF4NUlxeWMxSzZPUG1lSVNiVHBzeDQyWitQRHhIMjRuQmFPR2J2?=
 =?utf-8?B?ajlXdUQ4M09mWFZsMlZqcFV5TW5qZnE4MGl5NisreVlaNlNQMjlNYWt0NTlt?=
 =?utf-8?B?aHRMS1B2TTJFQ0J0VkZwd2xFRmR0V3MzQjFpd1RnRkRva1FHbVpadFFpa0hO?=
 =?utf-8?B?Nlp4cnoyRXQyZjFWY3hhbFRGUVlTMnMvUExNdDdDWURBN202VklINlRoK2Jh?=
 =?utf-8?B?MnFOWFArZDBiSUNxcXJ5ZkpaZ3JnSVd6b0VGUzdyUm9aQXNGU2srM2ZrZkhL?=
 =?utf-8?B?UU4wdFFyMEhYT2JBeG5nV0taNm43bXpmb0dSMHY3ZlR2bWpwZjg0K1VFaXpL?=
 =?utf-8?B?ZDUvcjU4SEVFazhKNTJZWU50TWt2SlpOUnErMGd6YXEzd29DZTRJL3NMNmMy?=
 =?utf-8?B?NVhYOVlGVlFzWnNpTS9UU0VUM0lUWVFCYi9jeVh5UGNBWUtzZm5GOUF2TXdk?=
 =?utf-8?B?T3ZBS1RBVU5iSDg2UFhqOGdmVWh0Y0dtcjZacnBkWXZLdVFBM0xseDdnTGVS?=
 =?utf-8?B?QjQvR1NhZUdVOXJJUUhrRDV4QVFHVjdXMnFVYm1xSEo0OVlWZ0JueHBmd2J6?=
 =?utf-8?B?bVV3NkdDZEpZYXRrcWplWC8zYWtoM3JjMDBWWFRQNVB6bEd6dFVnMVcwaGtj?=
 =?utf-8?B?Y1l4L0U2N0RJSXUzbWorRlJVVEp0ZWhEd2dmcC82WEpVK0w2Z0FOSVJWd3I5?=
 =?utf-8?B?QWIxeG9LU3pxOE15UlR6bFlVNXhSOFpzYVJZVi9VdFlPVE9uT0dkZG5BZGxS?=
 =?utf-8?B?Vks4NlhvZHpHYkpQYVBIYUNCc2VpVlVxcGRBRFFlRmpoV0VQN1MxeUFUOTdt?=
 =?utf-8?B?YmJIcCtCTGl2SW9wMUZHZHpLN3Q1bG9WSHFFdW1GV1RxVXF3Uml1UTFLdDdp?=
 =?utf-8?B?M0pyaUdFZlg4MDI3dUJodlNMQi90V0wxeW50ZnZXTnR1Vzc4a0EzRXNaYTdQ?=
 =?utf-8?B?N09jVy9TTEFRME80ZzNLQ3IyTHJ6cEpiQUNLVTdLMy9KM3k3VFdRSlNjNHFW?=
 =?utf-8?B?OTE3L3g4MzZKb0E5c0pQNU5LQnNISCtONnB6NFY1Kzh3Y3FtKzRMMWpleWJz?=
 =?utf-8?B?YmFpMUhTRjh2c1llMmtqa2FiM0RodXBmNlQyaDFqL1A0VUtnaGdIdTBZR2VT?=
 =?utf-8?B?d0cwdEtCTVhuK0NSWnRtQlV1VCtLcHVnR1FYY25yc01iK1RyNTJLWHJlM1NI?=
 =?utf-8?Q?EQkLJbf44vgJM8XgDCzVdjw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 202adefe-e72f-4fbb-fc3d-08dafff764a6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2023 23:45:23.9828 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JEXqKyHwC9Tb2RNw13C0x1l+hVdvkwp9yP4YfXdpx5BqAH0MjVGZmZppXpssNEp745nt5JV+vM1h4VcojvWEBaZL8TgjC3CKmfL2Vf8yOEI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8152
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
 Chris Wilson <chris.p.wilson@intel.com>,
 Michael Cheng <michael.cheng@intel.com>, Alan
 Previn <alan.previn.teres.alexis@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, DRI-Devel@Lists.FreeDesktop.Org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>,
 Bruce Chang <yu.bruce.chang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/25/2023 4:54 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> intel_guc_find_hung_context() was not acquiring the correct spinlock
> before searching the request list. So fix that up. While at it, add
> some extra whitespace padding for readability.
>
> Fixes: dc0dad365c5e ("drm/i915/guc: Fix for error capture after full GPU reset with GuC")
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> Cc: Michael Cheng <michael.cheng@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
> Cc: Chris Wilson <chris.p.wilson@intel.com>
> Cc: Bruce Chang <yu.bruce.chang@intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: intel-gfx@lists.freedesktop.org
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index b436dd7f12e42..3b34a82d692be 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -4820,6 +4820,8 @@ void intel_guc_find_hung_context(struct intel_engine_cs *engine)
>   
>   	xa_lock_irqsave(&guc->context_lookup, flags);
>   	xa_for_each(&guc->context_lookup, index, ce) {
> +		bool found;
> +
>   		if (!kref_get_unless_zero(&ce->ref))
>   			continue;
>   
> @@ -4836,10 +4838,18 @@ void intel_guc_find_hung_context(struct intel_engine_cs *engine)
>   				goto next;
>   		}
>   
> +		found = false;
> +		spin_lock(&ce->guc_state.lock);
>   		list_for_each_entry(rq, &ce->guc_state.requests, sched.link) {
>   			if (i915_test_request_state(rq) != I915_REQUEST_ACTIVE)
>   				continue;
>   
> +			found = true;
> +			break;
> +		}
> +		spin_unlock(&ce->guc_state.lock);
> +
> +		if (found) {
>   			intel_engine_set_hung_context(engine, ce);
>   
>   			/* Can only cope with one hang at a time... */
> @@ -4847,6 +4857,7 @@ void intel_guc_find_hung_context(struct intel_engine_cs *engine)
>   			xa_lock(&guc->context_lookup);
>   			goto done;
>   		}
> +
>   next:
>   		intel_context_put(ce);
>   		xa_lock(&guc->context_lookup);

