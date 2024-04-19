Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F1F8AAADE
	for <lists+dri-devel@lfdr.de>; Fri, 19 Apr 2024 10:48:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4A1610EBBF;
	Fri, 19 Apr 2024 08:48:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ekf+ZWih";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65C1810E3EE;
 Fri, 19 Apr 2024 08:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713516509; x=1745052509;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lkwI3W5aQ+7K2euVy5UGWpCGxGqA8d67aRps624YJC8=;
 b=Ekf+ZWihoSQ236VxvJDpkTLKWLFnjeOFeyPwtNkekKlur12c/zalzTom
 WuLfxVEnm56u+GTyuMw8GGWhZOttA+TRA9o8HuPxAyYTiT60rF+grvNG2
 yb9d8VejRIB2cj8F1NLm1QbUTn8sMAaZN3b1JrWHALa66+qTEboZNdRbd
 ywHZT9YFNuM/K3a7NUbDIugHaFW8EPq4TWPdQrcm9uc5e7poDky6JVrCx
 j04476NoM7/KmFgijDL6U6h7ypErCfXqbi/uIO9iApb5eZ+SFfgz7MtwV
 lpQgOZkSWGcwZPYllgwRxbVFSSMk/1s5yUFqgMYBHIAmGKbZFXhWSiD3y Q==;
X-CSE-ConnectionGUID: TKxXthtATKygjq0x01CNnQ==
X-CSE-MsgGUID: B8/JRzB7TI6ZJ/gpv/AEMw==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="19804482"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="19804482"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 01:48:29 -0700
X-CSE-ConnectionGUID: 7RJ4/OyfT8uTz5lJGcyJyQ==
X-CSE-MsgGUID: 4xoCOaBTS0qPxfCGzDcUrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="23249268"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Apr 2024 01:48:29 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Apr 2024 01:48:28 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 19 Apr 2024 01:48:28 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 19 Apr 2024 01:48:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fRicF6B0Gb2mGR6SlKcl7L+sEXZ+UxM9cEjI0sQZUM+TXlQlwYxQrCQ+GAtL1g+E4HTqLdwywIZ2rChk73yTrCCVOhESjLN81i0Z4eW+PBTIr2afnpEjuQVjW+f5DvrQCVlpzG66x1O08vPkGYjxoJWpoP9bsFcIgdHdZs9IYRBji9y8H3qsiOYC33PPl0IbjMN6vE1QzSV5+hrG5CW2NCuj2wYaW6n+yYhfz9nJSeULd2usAQWjMTiexggKNyLmcfRtAU6ftOY7GhJChwNooE7MX9lNAilxh2U7yiMSVu5qvHl6MRHbSJeWUv34/AYLIiVpeEzhUaEwyanagM7uyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n343YkJ70ljcdI/xckEvQzBKitdM8MpOIT0V9dRkLzc=;
 b=KQKyOa1gYxbMBcBgyqpX/VKwV2fW+rIUdLlTt1c93uBHjh9zokvDTkNFdf15h7Rirmgztat/hqN8yRS6qDg8bDb5yNTVY6ihZ3wonaFOzJVkddqgHkU90X5e4UL19pOe/rE/533LahiBVlU+n96qgg4bP45SUm21aNrgERAveP6x0v3HnjFlj0dip5+s+aC562IdpAngbM2pVVdEw/tyfyz9d6oBV++tVt98sKDgwPM7uNcXn+ZKj3PwCSQTzGVmuq6JLebIz7hyK/GBPPpKW94qPE6hQ5qgZkN2P7gQn5zs7p/hHmdw5cg71xEDimU8frCL8SrlAWebnth5VyFR5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 MW4PR11MB7030.namprd11.prod.outlook.com (2603:10b6:303:22f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.11; Fri, 19 Apr
 2024 08:48:25 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::d616:a889:aeb0:3724]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::d616:a889:aeb0:3724%7]) with mapi id 15.20.7472.037; Fri, 19 Apr 2024
 08:48:25 +0000
Message-ID: <081c3d53-9ef2-4d1f-9a6c-d22c36bdbe8f@intel.com>
Date: Fri, 19 Apr 2024 10:48:21 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/i915 Rename intel_engine_reset to
 intel_gt_engine_recover
To: John Harrison <john.c.harrison@intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>
References: <20240418171055.31371-1-nirmoy.das@intel.com>
 <20240418171055.31371-2-nirmoy.das@intel.com>
 <c76fc94d-7759-4908-bbff-9845931234b8@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <c76fc94d-7759-4908-bbff-9845931234b8@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ZR0P278CA0048.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1d::17) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|MW4PR11MB7030:EE_
X-MS-Office365-Filtering-Correlation-Id: f75907e0-7c4f-4411-d91f-08dc604d79c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: 8W1zEZXigekAvLqhCO5OIAcqC0PXfby9C/8ngSWvhlHjvPKyJH8GKM8x2vLVbvFMbzQN7GLmC8YZ6SpLuhxZdxwEwHkAQpZapZiQfxdDyAFEluuLt9HMkcrKXyZzWWSNpzXfESuuig2DQ4npS9fgZI1tYndU3xpQDezPsKhc/GJUqcyNMVKmqvzAEf1qjhSs6+BWGei1QgHk5gjVRi2moYRXP5QYE1Trk5fHZYz/m7qnQibVCbn2BxH7XLgpeZlqzzFwfkx2ilZeVccxd59yxmwWlc/Rv2uDQdv6jhO/MolMPsy47KbzoYeMhhSRvqKsz9QrjFRoHxu3F7v36CNzo3ayuefQFYM7nK7ynVDlyKE8PepO8VGIXnwNdc0FYkdoat1/AxlMiTS9lOlMO+iDHQ2vwHmrX7KwdPUXBycVEo2D+So2OuiZki/dxnM16X+4SArPGN4RPqSP0fJUZNiePXD147hjQAd5GoEE4l0coB0s4//FrxwPTuJD0BTO5eRUDL981zmme1wKelDtYpejA+Utz30btuqICREt+kNjcNhB5XDoBg0AjZARFNpzpPDvJifcqDS0+Z5CrcSFVwmDr0lyxxq/T8kX7Z28V7qVb7s8aSSC4wkv2s3U/FTUA2L26jkeHcvYBsn1xFeGKEZUN/igR4Jb7Js0UZf2Qgm37XI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WjVOc1IrMFNZemUrb05Md2ZncjJURFh5WU5tclRpN1JwUDQxekw4NU9lSitU?=
 =?utf-8?B?SlVlY1gzVTJhdmRjdnNPa1lHb1FOa0FCa3JCbEtoLzRMakJXWWZ3QWsySWNI?=
 =?utf-8?B?eHBSNThkT0hLRXpqK0JWc1N2eXJrS0dJYVZMYXVlcWJUd0ZYWkg4eXRwdUZy?=
 =?utf-8?B?RGpuUjJwWUM1T3JHRHpBNkRBNTQ5Zk5CREJ0RmtXMUQ5VzJZNGFoenZTMDQw?=
 =?utf-8?B?RUE1L25iaTRLVFUxYUdpYTI5VGdGNWxHWFV6QjBaUkFuR25ITGgxdndhbHZH?=
 =?utf-8?B?T2pSbUNRY2JOV0k4ZkRQSjRVUGFBNFhUUTZBUnJlQ3N3TzNsY1I5NktYZ2lG?=
 =?utf-8?B?a1BCUStBcnlTeFkwVGkvWUlaS08xdHZXdEFxejFOTjFYNTh1RFV3N0RiRkJR?=
 =?utf-8?B?Zkg3cHhvM3RVOXFoUkxMOUF2ZE1rSC84SHAwbEFlNW5zS0tpTEFMQ3g1M1JZ?=
 =?utf-8?B?Y0JWNmtaNGNQT2MzWktlSmNOVjlXa01KSHE4eFhUa1dMWE5PdUhjOUVsNUxw?=
 =?utf-8?B?V2hKdFRhSDNsMXlUdkRBWVo1WWM4SWkvN1hzWThpMjRmQ3VLS3Jzc2FzMG1Y?=
 =?utf-8?B?KzFES3o1M1dlVVdjWmI3eEFnanNTQ0xPam5TMzJXUWhGSWlIRXNvUmVVcFNZ?=
 =?utf-8?B?TTRXME44YklnMVZFUmdQUldFMTNFOXNMMnZ1UnRhZXZ6SGhqNGF0SG1hK3RJ?=
 =?utf-8?B?WC9SRmtzWTRHVDdUcTAwM3hMSml2ZE5WMUFrSEpabDFyWUtXWUI2eXN0WSs3?=
 =?utf-8?B?azI4am5kNFNyTDdiRyszaXI4MTJyeTNROVR6ZjNsdjZzcndkaGw0bXRBTUM5?=
 =?utf-8?B?ZzZnR1ZUM29vZE9qeEZNNW5GNXhGL3VzM1ZTYWtMRzNwaUdnSEk0MlRkV2Ns?=
 =?utf-8?B?by9kL25Dd200ay83MldEak1FeUxQT2FmNU9kY1BZR3Bvc2kvU2g0V1I2VmJI?=
 =?utf-8?B?WXdwQjhMRC9ob1hCc0IrZVlsWVFmUFB1c1pjbllpYVNjYS9QbTlMNG9ON1VL?=
 =?utf-8?B?QkhiWTA5MXp5SkZCWWswRzVMdDhWN3JWWkVnU3pIMXk3ZTVzSUdLdjNsRVpW?=
 =?utf-8?B?OE5DWkZ6V1A3TURDSVl5dTQ0VU5ZRkd6UVJwLy8wMS9JYTlsRC9NM2dzSUJp?=
 =?utf-8?B?YXk2bXNOZGRuaGpxdkxnOXJ2Z3ZsaEdPL3RLZVpsU0ROMW5XbkxFYlZWazQ0?=
 =?utf-8?B?eVVjemZMY0o3SjczZEVsMkI2djNJS2N6VE1yYlRYdERsOEUzTytja211NU5J?=
 =?utf-8?B?TSs4RGpUZmZDV0JtNEVLdFFXMCt3OFZuMTY4eXFRemFyNWhRcE43REhFYXdx?=
 =?utf-8?B?eStLTVkwTmFzOXU1U0pBME51UDNlWHJJRGNFa05QNm9saDMvR0hoNGFvN0VG?=
 =?utf-8?B?d0dKZ2JWZHdzeU5uQTJHNWwvU3lvQ1pGdTRFamlpTEZYNW1oTXBwZXpwQkgr?=
 =?utf-8?B?S0p1RUNYQXFDZ2VhQUNqWWowcE1TZHNZM2FDeXVDTTR6b2JsZzBtRklXVHpG?=
 =?utf-8?B?a21xQkZaR3hxTlpYNHdTalJ3eXZrVVVyeGUyVzYzeGZ5ZGNvdXRYMnBCdHl5?=
 =?utf-8?B?aXJZMXhhRnFsRU1ROEJCSndpVjRERXB5Y2dReVg3MzJQdVBGWmliMFRGOFd6?=
 =?utf-8?B?L0xsRjY2YWRTcEVUSmhaWnFLTHFpYStCOXFycHh1NGRoTzNLbWtac3B2REN0?=
 =?utf-8?B?OWVNeEsxdk1penNIelBzSmpHQUhFY3pYZkk4UEtNN1YvRnNobTh6eEsvQkIw?=
 =?utf-8?B?MXQ0eFEySDY4N2pGbkZ4djVNNWU4cHF1NkhxVTkzcXptUEZuR2FrbWorMHNJ?=
 =?utf-8?B?ZzBRMUVpTnZlZGpPcjFmaTBGeE9IanpRZWQ4WS9DS1FYRFFCMjNOTDVhRndB?=
 =?utf-8?B?VUtPTEFwMXY4ZUxJK0ovbGxrNGdWT1cwQnY3THhNS2Q4VFpXUXdLZlVma1ph?=
 =?utf-8?B?TWkxeFVOTnM1bm5XWGI5dXFzTUxsQjNwWjRiT3BHZzRUS0dWVlRuMnB1aFQy?=
 =?utf-8?B?Ti9oLzRESTIrS2wvUFFYTGRhWjV3SkdmZlk1Y2h4K1hJZVlKektpYmZxUkVu?=
 =?utf-8?B?T3YzQ1FScFBkWW81YjVaNHcwN2grZmVCeEVnNXpSMEZDSVE5cWM2bW9HbkRG?=
 =?utf-8?Q?gxcVZ5P1BkdCsyrDHGytGS1Xz?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f75907e0-7c4f-4411-d91f-08dc604d79c6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2024 08:48:25.3763 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jJOrAJrmiV2SQ825bQ64HBoeqf2UHjdBCL/RS2greZkboLjdJX/oXs6HLOHR+eCI1rqgZmXUsPmbVOKr+Q1MtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7030
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

Hi John,

On 4/19/2024 1:27 AM, John Harrison wrote:
> On 4/18/2024 10:10, Nirmoy Das wrote:
>> intel_engine_reset() not only reset a engine but also
>> tries to recover it so give it a proper name without
>> any functional changes.
> Not seeing what the difference is. If this was a super low level 
> function (with an __ prefix for example) then one might expect it to 
> literally just poke the reset register and leave the engine in a dead 
> state. But as a high level function, I think it is reasonable to 
> expect a reset function to 'recover' the entity being reset.
>
> Also, many of the callers are tests that are explicitly testing reset. 
> So now the tests all talk about attempting resets, resets failing, 
> etc. but around a call to 'recover' instead of 'reset', which seems 
> confusing.


Didn't think about it, I will drop it.


Thanks,

Nirmoy

>
> John.
>
>>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   .../drm/i915/gem/selftests/i915_gem_context.c |  2 +-
>>   .../drm/i915/gt/intel_execlists_submission.c  |  2 +-
>>   drivers/gpu/drm/i915/gt/intel_reset.c         |  4 ++--
>>   drivers/gpu/drm/i915/gt/intel_reset.h         |  4 ++--
>>   drivers/gpu/drm/i915/gt/selftest_hangcheck.c  | 20 +++++++++----------
>>   drivers/gpu/drm/i915/gt/selftest_mocs.c       |  4 ++--
>>   drivers/gpu/drm/i915/gt/selftest_reset.c      |  2 +-
>>   .../gpu/drm/i915/gt/selftest_workarounds.c    |  6 +++---
>>   8 files changed, 22 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c 
>> b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
>> index 89d4dc8b60c6..4f4cde55f621 100644
>> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
>> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
>> @@ -1171,7 +1171,7 @@ __sseu_finish(const char *name,
>>       int ret = 0;
>>         if (flags & TEST_RESET) {
>> -        ret = intel_engine_reset(ce->engine, "sseu");
>> +        ret = intel_gt_engine_recover(ce->engine, "sseu");
>>           if (ret)
>>               goto out;
>>       }
>> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c 
>> b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
>> index 21829439e686..9485a622a704 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
>> @@ -2404,7 +2404,7 @@ static void execlists_reset(struct 
>> intel_engine_cs *engine, const char *msg)
>>         ring_set_paused(engine, 1); /* Freeze the current request in 
>> place */
>>       execlists_capture(engine);
>> -    intel_engine_reset(engine, msg);
>> +    intel_gt_engine_recover(engine, msg);
>> tasklet_enable(&engine->sched_engine->tasklet);
>>       clear_and_wake_up_bit(bit, lock);
>> diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c 
>> b/drivers/gpu/drm/i915/gt/intel_reset.c
>> index b825daace58e..6504e8ba9c58 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_reset.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_reset.c
>> @@ -1348,7 +1348,7 @@ int __intel_engine_reset_bh(struct 
>> intel_engine_cs *engine, const char *msg)
>>   }
>>     /**
>> - * intel_engine_reset - reset GPU engine to recover from a hang
>> + * intel_gt_engine_recover - reset GPU engine to recover from a hang
>>    * @engine: engine to reset
>>    * @msg: reason for GPU reset; or NULL for no drm_notice()
>>    *
>> @@ -1360,7 +1360,7 @@ int __intel_engine_reset_bh(struct 
>> intel_engine_cs *engine, const char *msg)
>>    *  - reset engine (which will force the engine to idle)
>>    *  - re-init/configure engine
>>    */
>> -int intel_engine_reset(struct intel_engine_cs *engine, const char *msg)
>> +int intel_gt_engine_recover(struct intel_engine_cs *engine, const 
>> char *msg)
>>   {
>>       int err;
>>   diff --git a/drivers/gpu/drm/i915/gt/intel_reset.h 
>> b/drivers/gpu/drm/i915/gt/intel_reset.h
>> index c00de353075c..be984357bf27 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_reset.h
>> +++ b/drivers/gpu/drm/i915/gt/intel_reset.h
>> @@ -31,8 +31,8 @@ void intel_gt_handle_error(struct intel_gt *gt,
>>   void intel_gt_reset(struct intel_gt *gt,
>>               intel_engine_mask_t stalled_mask,
>>               const char *reason);
>> -int intel_engine_reset(struct intel_engine_cs *engine,
>> -               const char *reason);
>> +int intel_gt_engine_recover(struct intel_engine_cs *engine,
>> +                const char *reason);
>>   int __intel_engine_reset_bh(struct intel_engine_cs *engine,
>>                   const char *reason);
>>   diff --git a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c 
>> b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
>> index 9ce8ff1c04fe..9bfda3f2bd24 100644
>> --- a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
>> +++ b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
>> @@ -495,9 +495,9 @@ static int igt_reset_nop_engine(void *arg)
>>                     i915_request_add(rq);
>>               }
>> -            err = intel_engine_reset(engine, NULL);
>> +            err = intel_gt_engine_recover(engine, NULL);
>>               if (err) {
>> -                pr_err("intel_engine_reset(%s) failed, err:%d\n",
>> +                pr_err("intel_gt_engine_recover(%s) failed, err:%d\n",
>>                          engine->name, err);
>>                   break;
>>               }
>> @@ -574,7 +574,7 @@ static int igt_reset_fail_engine(void *arg)
>>                           &gt->reset.flags));
>>             force_reset_timeout(engine);
>> -        err = intel_engine_reset(engine, NULL);
>> +        err = intel_gt_engine_recover(engine, NULL);
>>           cancel_reset_timeout(engine);
>>           if (err == 0) /* timeouts only generated on gen8+ */
>>               goto skip;
>> @@ -623,9 +623,9 @@ static int igt_reset_fail_engine(void *arg)
>>               }
>>                 if (count & 1) {
>> -                err = intel_engine_reset(engine, NULL);
>> +                err = intel_gt_engine_recover(engine, NULL);
>>                   if (err) {
>> -                    GEM_TRACE_ERR("intel_engine_reset(%s) failed, 
>> err:%d\n",
>> +                    GEM_TRACE_ERR("intel_gt_engine_recover(%s) 
>> failed, err:%d\n",
>>                                 engine->name, err);
>>                       GEM_TRACE_DUMP();
>>                       i915_request_put(last);
>> @@ -633,10 +633,10 @@ static int igt_reset_fail_engine(void *arg)
>>                   }
>>               } else {
>>                   force_reset_timeout(engine);
>> -                err = intel_engine_reset(engine, NULL);
>> +                err = intel_gt_engine_recover(engine, NULL);
>>                   cancel_reset_timeout(engine);
>>                   if (err != -ETIMEDOUT) {
>> -                    pr_err("intel_engine_reset(%s) did not fail, 
>> err:%d\n",
>> +                    pr_err("intel_gt_engine_recover(%s) did not 
>> fail, err:%d\n",
>>                              engine->name, err);
>>                       i915_request_put(last);
>>                       break;
>> @@ -765,9 +765,9 @@ static int __igt_reset_engine(struct intel_gt 
>> *gt, bool active)
>>               }
>>                 if (!using_guc) {
>> -                err = intel_engine_reset(engine, NULL);
>> +                err = intel_gt_engine_recover(engine, NULL);
>>                   if (err) {
>> -                    pr_err("intel_engine_reset(%s) failed, err:%d\n",
>> +                    pr_err("intel_gt_engine_recover(%s) failed, 
>> err:%d\n",
>>                              engine->name, err);
>>                       goto skip;
>>                   }
>> @@ -1085,7 +1085,7 @@ static int __igt_reset_engines(struct intel_gt 
>> *gt,
>>               }
>>                 if (!using_guc) {
>> -                err = intel_engine_reset(engine, NULL);
>> +                err = intel_gt_engine_recover(engine, NULL);
>>                   if (err) {
>>                       pr_err("i915_reset_engine(%s:%s): failed, 
>> err=%d\n",
>>                              engine->name, test_name, err);
>> diff --git a/drivers/gpu/drm/i915/gt/selftest_mocs.c 
>> b/drivers/gpu/drm/i915/gt/selftest_mocs.c
>> index d73e438fb85f..b7b15dd3163f 100644
>> --- a/drivers/gpu/drm/i915/gt/selftest_mocs.c
>> +++ b/drivers/gpu/drm/i915/gt/selftest_mocs.c
>> @@ -336,7 +336,7 @@ static int active_engine_reset(struct 
>> intel_context *ce,
>>         err = request_add_spin(rq, &spin);
>>       if (err == 0 && !using_guc)
>> -        err = intel_engine_reset(ce->engine, reason);
>> +        err = intel_gt_engine_recover(ce->engine, reason);
>>         /* Ensure the reset happens and kills the engine */
>>       if (err == 0)
>> @@ -356,7 +356,7 @@ static int __live_mocs_reset(struct live_mocs *mocs,
>>         if (intel_has_reset_engine(gt)) {
>>           if (!using_guc) {
>> -            err = intel_engine_reset(ce->engine, "mocs");
>> +            err = intel_gt_engine_recover(ce->engine, "mocs");
>>               if (err)
>>                   return err;
>>   diff --git a/drivers/gpu/drm/i915/gt/selftest_reset.c 
>> b/drivers/gpu/drm/i915/gt/selftest_reset.c
>> index 2cfc23c58e90..9eaa1aed9f58 100644
>> --- a/drivers/gpu/drm/i915/gt/selftest_reset.c
>> +++ b/drivers/gpu/drm/i915/gt/selftest_reset.c
>> @@ -115,7 +115,7 @@ __igt_reset_stolen(struct intel_gt *gt,
>>       } else {
>>           for_each_engine(engine, gt, id) {
>>               if (mask & engine->mask)
>> -                intel_engine_reset(engine, NULL);
>> +                intel_gt_engine_recover(engine, NULL);
>>           }
>>       }
>>   diff --git a/drivers/gpu/drm/i915/gt/selftest_workarounds.c 
>> b/drivers/gpu/drm/i915/gt/selftest_workarounds.c
>> index 14a8b25b6204..eb7516c7cb56 100644
>> --- a/drivers/gpu/drm/i915/gt/selftest_workarounds.c
>> +++ b/drivers/gpu/drm/i915/gt/selftest_workarounds.c
>> @@ -256,7 +256,7 @@ static int do_device_reset(struct intel_engine_cs 
>> *engine)
>>     static int do_engine_reset(struct intel_engine_cs *engine)
>>   {
>> -    return intel_engine_reset(engine, "live_workarounds");
>> +    return intel_gt_engine_recover(engine, "live_workarounds");
>>   }
>>     static int do_guc_reset(struct intel_engine_cs *engine)
>> @@ -1282,7 +1282,7 @@ live_engine_reset_workarounds(void *arg)
>>                   goto err;
>>               }
>>   -            ret = intel_engine_reset(engine, 
>> "live_workarounds:idle");
>> +            ret = intel_gt_engine_recover(engine, 
>> "live_workarounds:idle");
>>               if (ret) {
>>                   pr_err("%s: Reset failed while idle\n", engine->name);
>>                   goto err;
>> @@ -1320,7 +1320,7 @@ live_engine_reset_workarounds(void *arg)
>>           }
>>             if (!using_guc) {
>> -            ret = intel_engine_reset(engine, 
>> "live_workarounds:active");
>> +            ret = intel_gt_engine_recover(engine, 
>> "live_workarounds:active");
>>               if (ret) {
>>                   pr_err("%s: Reset failed on an active spinner\n",
>>                          engine->name);
>
