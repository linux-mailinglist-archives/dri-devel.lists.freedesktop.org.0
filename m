Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D265B43BB35
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 21:48:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7A0E89DF9;
	Tue, 26 Oct 2021 19:48:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A143789DF9;
 Tue, 26 Oct 2021 19:48:31 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10149"; a="227454724"
X-IronPort-AV: E=Sophos;i="5.87,184,1631602800"; d="scan'208";a="227454724"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 12:48:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,184,1631602800"; d="scan'208";a="537264501"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga008.fm.intel.com with ESMTP; 26 Oct 2021 12:48:31 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 26 Oct 2021 12:48:30 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Tue, 26 Oct 2021 12:48:30 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Tue, 26 Oct 2021 12:48:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ACRG4NPl3G1CWiD9blzwUkno6UaeVGzlVxiVnymbbjK6VTB7u2ddRYab7/oCveK3WTk2JtkUriYix2V/5vE+df0XN2MKpInOqrsa/O67Z4FuXvECrNnfhZF8Pb2at708CcNFUWiTCS/guO7eIL5EuX/o5jp/IyoFSvF/3ky9++c//hOQ6lcvAPW2ftfBMSet4OnYkXzkN+scBWud7I9p8XB3sufmENg4r/VkvlZIpS9QCGlZ8Jm3WucC+LYtEQuoLdqtQcjhhAUzYNdOzHD1c7fwt7TiSJziQ0MSH+amE8YbCt5mlEN+TJ7ROO4cpKiNP/XCFMmB7VqxC4C6Eq4q8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FmlP0sHSdjpce1xJ1X44mBYDcnNyOHQLTfr7TamLTk0=;
 b=WM9ktPdHnOpKxwA1I+41CeO/8aaN/i7sXzi2nGfSw502JkbDiJJwSerNr67Seqp6SlTrxFRFsneTvjzYke4PP8jm+he7hbuzk0KPdONDFEiwWrE1UNvwQsvtNnMIQPTVrZ1wZ4M8XZF9B6lpuTvXVU/mHWE/2GEQkLAoJ5g4jT2m2dtBT7A+mXMG9tSSZXiat9tc3z7vo5EfwgnauUxRzdjVeKO5zpVSKCiW600NKJ1CMaQkNN5367rvK0RQJIp2qiHkU90fxNqppFisBPLjCvP0KjcLn8WTSSgnazYikxFRjMp5H6sKJoMUrXsIcsxM7DXFwTgpYtBg0WmG+VmBzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FmlP0sHSdjpce1xJ1X44mBYDcnNyOHQLTfr7TamLTk0=;
 b=qBlQ1k2VU6GVmIuSTyQjWgbL64ySgANxRkMDH2anBhjkNovKsUTHmWW3gw+r7Ckbx3kYj6wUuRqdfh7YJRmjGBb+PVCOQsXaTP9TXbQ52v+vuEgl+mzp7ZrvW+G0CrEf9MZHG6rHy9q/be78xbRe/0ZP02AWcmZxuVFpVa0rOQo=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5593.namprd11.prod.outlook.com (2603:10b6:510:e0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Tue, 26 Oct
 2021 19:48:27 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a%9]) with mapi id 15.20.4628.018; Tue, 26 Oct 2021
 19:48:27 +0000
Message-ID: <386571cf-9f33-05ce-e5c0-b2b537e23538@intel.com>
Date: Tue, 26 Oct 2021 12:48:24 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.2.1
Subject: Re: [PATCH] drm/i915/selftests: Allow engine reset failure to do a GT
 reset in hangcheck selftest
Content-Language: en-GB
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <thomas.hellstrom@linux.intel.com>
References: <20211011234705.30853-1-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20211011234705.30853-1-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MWHPR1401CA0002.namprd14.prod.outlook.com
 (2603:10b6:301:4b::12) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
Received: from [192.168.1.106] (73.157.192.58) by
 MWHPR1401CA0002.namprd14.prod.outlook.com (2603:10b6:301:4b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14 via Frontend
 Transport; Tue, 26 Oct 2021 19:48:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 48fc5e15-2a28-4701-62c8-08d998b993cb
X-MS-TrafficTypeDiagnostic: PH0PR11MB5593:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <PH0PR11MB5593F707CFEC49F1C3E6A522BD849@PH0PR11MB5593.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rNiyOZ3dqat0KnMp/3i0uWRlyQGzbJmf8RIh8MxV9BJtCwxFkodL/d6AZsiXoVpjpCtzztcfh60C6KESq7L09hG/wJHWSU3334pmvdFggWr9zIriS2X9hs1nCVj4518mXZjiiWAEVWFb9521POPVNJte2UX8sPLh+NI1dpE3fX2PNurr4Qvc9VgvWi1SOzJiiLH7qBTKELFpZdXPXYczJAh6qrkNqeuujbd4LWyLbjRE2u5LjWxItkNclI6OKLo0FU3zgzgdihB3hCw0Q2DxC/n/gAhIFCQXUrjOwD4E4YtmyYdLMALIJXla3RsdKJAlprDjvtkc2Nx0h8+qTe87cDvIRVm/7nnCIWDIac+h7fpyeKu/Osb8SFFX+3WfhbWKR0kOwxePDtdTy8V4vrXQWx7RCCzTkMOS8yvU2XfJmcg/cY1J+UXJ+C17UyqOQR9ZCo0bvX+C1wNml2+MoemnAWWpNw6sVwSMSCXQOtsNNz476V3gg6VpSmWtaQ7H8LAt2+TJNzmTIizaYKwWorqfur+7Tke3LYVMRzof2P0ZEI9sUd3AhUUZvJHk86PQBJCirTbAFfxuGfiPTTJ380v9a8Dzppv1PJO9JeG4ohmuRdNcGxOFzFwUt4cvY+rSQudBqUp2UGJD32vCwzJGdwvSgJW8YKITsz8S24M6cLeCwqcLd3fnhQg1zEBnKmfCPECWXutaV/X6Y3q5atxy8kvEoUNJTX5xCkLsgRdAkhAJ8YM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66556008)(316002)(16576012)(2906002)(66476007)(8936002)(31696002)(508600001)(38100700002)(82960400001)(36756003)(186003)(66946007)(6486002)(26005)(8676002)(83380400001)(53546011)(31686004)(86362001)(5660300002)(4326008)(2616005)(956004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmNVMjhjQi9HZENjK2tOK2Y5Ull3cFRPWWhOR250R2VHNWptRlRUajJZM05F?=
 =?utf-8?B?bCtJM1M0QVJENnc4VFh1bWt3M0kzWXNJS0REbVhsMmNqNGFRRlRXOGJFMmNX?=
 =?utf-8?B?WFBON3F3R0JwbWoyNU5TbVdqeXdCTWQ5cjNQRXhJU29zNllNdjdNZ0tFbHNV?=
 =?utf-8?B?OCtYcTVNc2JDaXJ1NFU1b3FWaElvMFNDVFFsMmhjWENpd0xqYUZuSTlJbWND?=
 =?utf-8?B?UkhJNWt0R3pRTHI5M1lsWTVSWWF2UGNiQ1hOaDZoOVF4U2x3bUdCaU94RmhR?=
 =?utf-8?B?TFMyUGVDUmZUSW8rZGJhK01qMS9hWnNBRmQrb05yQW1wSzNWRVo3TFpEMjJP?=
 =?utf-8?B?VGJZaTdYVG1PVFlicUQ3UTk3SGxwZFhxc25IMmROMHEzS3NxYzdIRmlFTDI3?=
 =?utf-8?B?TVM0NElGbEF5c0dxK1grNkFWa0Fva05CMEZvckh0Kzg3dGc2VUpLdjIyZkdX?=
 =?utf-8?B?VFV3L1VsUWpESGlmdWFNWWVWSE5TNklCbjZkeU9SVTFjcUdWWE1IelBZMHl3?=
 =?utf-8?B?N1FsaXhIMXVjak52OEcxd3ZGR1UvMVNublF3c1FCZDN2TFlXemV0Q3hKTWow?=
 =?utf-8?B?a3o3QmhhbVhmUkV0dnQ1VkQzelhOL1orQXNHZWhmdTh6Z1d0d0FxeWdhOXFB?=
 =?utf-8?B?dzd5ZDMxandEcHFveVBTTzJKb0FIcisvQWR1S1d2eDlLc2xKY3pheDYvSGtr?=
 =?utf-8?B?SXFvZzB0OXdSdDhZbS93ZUlzcE14Q0RFUGx0VGZ1VGRnY0dRVUdQREMzTlBR?=
 =?utf-8?B?MWR1TWtuc1FVVFp1WmVYelZCcHJ6dHJ4MnBrbkJsQkF1bzJCZm9JTXhvY1Bn?=
 =?utf-8?B?VXgwTXZUcmIwcWdnbUJYZWRDbWhSWWluZGdjcis0RnIzMnRkV2ZTNUI5cVRJ?=
 =?utf-8?B?M2tRekMvVnFZMCsraUkxZEg4Z3g3Z3l5SW5GcTZ6cWh0YUJuMksvRkxxNC9X?=
 =?utf-8?B?eVlnekNjUU9rUUUyVmI3NjBDTmJpdWd6Y01qb1Q4REFvQ0ZIcnhOSklJK2J5?=
 =?utf-8?B?cVZBM3RkeVpwYXdRQjV4eVN6YnNZL0RiNFVjMUNOMTdrakNNME13NG1PVUg0?=
 =?utf-8?B?NUJ3eFh2YVU3aFVFQnlqS3RML3JGUk5RTkM3bVlEZHlDVG1HeXVLTFhwQ2dy?=
 =?utf-8?B?SXN1QWkzQllvWlc5STRIVzlLT0V0d0JsNlZsUmZCcXpkdHZyL0NrVlBIaHBu?=
 =?utf-8?B?dDYzaFVXTGFweEpHK0RPWTRldUkxWjkra0NLWVNKSWRMV1c1WWJ0V1dCVWFH?=
 =?utf-8?B?cEh4STZETG9ER3BxbHVXKzFvQThXbzR3SGdPdFpBTy9nYXpnekpkSEhGbUt1?=
 =?utf-8?B?UnM2K082UEhzYlh5YzFVZzFJMUNGWjE4a21IcGFyYWd4NHlyTHhHeDg3UDl5?=
 =?utf-8?B?NTBoN2VuT2dOVFZzWEcxYmpxYzRkSTJRVUxDMW0walVRS0hGRVUxeXhlWHRa?=
 =?utf-8?B?bU1sa3loSFVackdiTE9HOUw3SWRMeEVpOUgwNlhvek11VlUvN3FRVVNtVGhU?=
 =?utf-8?B?d2dmQWlkWExGcFdISC9PUFpPdjVwL0JHWXR0ZUJIZjQ5elNob1VZUnBOcTVV?=
 =?utf-8?B?cHYzTDgycWQyblNYKzBCTVc5cVZUTnNpb2R5OFRLUXFCR2EvSDVKQ2U1d2Fv?=
 =?utf-8?B?UGlaZEgybXN3c2hESnJNSVl6QVFhOFZzUWhNc1N5RURXQmZWL3B0U1dIdG9M?=
 =?utf-8?B?OTl2ZTVjVXdQeUNWdFFXTnh5RGYwQzA0YmpqNFhQckhDTTRlaEV4U1pVWHB5?=
 =?utf-8?B?aCt4dVdxT1pCbXIrQVlJbHVGbmtiQ0ZBRUtQTmpMZkUzaWlXajZCQVh4TnpT?=
 =?utf-8?B?QTRISkFFLzNZMDd2RHgwbzZRY0NLT3loS3JxNi96YTA3RCtHK1RSaUthZ2ZV?=
 =?utf-8?B?a0cxTGxvWXVsSGFwYTlOZkNXZ2JhY1l0dnVkUldBSG45Q1hlM0xRN3Vhemxt?=
 =?utf-8?B?MFl0REtPS0lheXpZdUtIcU9oMm5wSTdFbDFxQUg0bkhvam4zRzRKSFE1bVAr?=
 =?utf-8?B?VWdwYzBCNlFXZGk4c3gzTzhMS0xwZnI5T0dwcytWQXI2eWZSbmEwWmJHQWhJ?=
 =?utf-8?B?VUpEVnFxTW5HYzN0YllSaFUycVd2THhGMDJ0bit2Vzg2eDZ2cm5obUxSMmhi?=
 =?utf-8?B?bzZTNGhkL1R5cWduTDVjaW83T3JwQzdkaWFiUnVJUmRKQ3ZZaDVkbHRDT2kx?=
 =?utf-8?B?YncyWHRmOFFrVGNOZWJxVjFnSUYxK1R3bWM0WUhTUG8zUDlDcEtSbnpLZVY3?=
 =?utf-8?B?ZHgyZTh2dUJFVXdrT3Bjc08rakhBPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 48fc5e15-2a28-4701-62c8-08d998b993cb
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 19:48:27.1859 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cjwk72+17+dWnUwFpa7FMzgC30OMVNJrUsx+dnB2+DWZcQetsX0aJFS7Sb6t/Qm+tJz73m5JTuQ/9AtjiA04E/5YvbOXxcv2PUPJ8kNmVqA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5593
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

On 10/11/2021 16:47, Matthew Brost wrote:
> The hangcheck selftest blocks per engine resets by setting magic bits in
> the reset flags. This is incorrect for GuC submission because if the GuC
> fails to reset an engine we would like to do a full GT reset. Do no set
> these magic bits when using GuC submission.
>
> Side note this lockless algorithm with magic bits to block resets really
> should be ripped out.
As a first step, I am seeing a pointless BUILD_BUG but no BUILD_BUG at 
all for what really needs to be verified. Specifically, in 
intel_gt_handle_error, inside the engine reset loop, there is:
                         BUILD_BUG_ON(I915_RESET_MODESET >= 
I915_RESET_ENGINE);

Given that the above two values are explicit #defines of '1' and '2'. 
I'm not seeing any value to this assert. On the other hand, what I am 
not seeing anywhere is an assert that 'I915_RESET_ENGINE + max_engine_id 
< I915_WEDGED_ON_INIT'. That being the thing that would actually go 
horribly wrong if the engine count increased too far. Seems like there 
should be one of those in intel_engines_init_mmio, using 
ARRAY_SIZE(intel_engines) as the max id.


It looks like 'busy-reset' and 'reset-idle' parts of 'igt_ctx_sseu' in 
gem/selftests/i915_gem_context.c also mess around with these flags and 
then try to issue a manual engine reset. Presumably those tests are also 
going to have issues with GuC submission.

The workarounds, mocs and reset selftests also do strange things. Those 
ones did get updated to support GuC submission by not attempting manual 
engine resets but using the GuC based hang detection instead. However, 
it seems like they would also suffer the same deadlock scenario if the 
GuC based reset were to fail.

I'm wondering if the better fix is to remove the use of the 
I915_RESET_ENGINE flags completely when using GuC submission. So far as 
I can tell, they are only used (outside of selftest hackery) in 
intel_gt_handle_error to guard against multiple concurrent resets within 
i915. Guarding against multiple concurrent resets in GuC is the GuC's 
job. That leaves GuC based engine reset concurrent with i915 based full 
GT reset. But that is fine because the full GT reset toasts all engines 
AND the GuC. So it doesn't matter what GuC might or might not have been 
doing at the time. The only other issue is multiple concurrent full GT 
resets, but that is protected against by I915_RESET_BACKOFF.

So my thought is to add an 'if(!guc_submission)' wrapper around the set 
and clear of the reset flags immediately before/after the call to 
intel_gt_reset_global().

Fixing it there means the selftests can do what they like with the flags 
without causing problems for GuC submission. It also means being one 
step closer to removing the dodgy lockless locking completely, at least 
when using GuC submission.

John.


>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/selftest_hangcheck.c | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
> index 7e2d99dd012d..90a03c60c80c 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
> @@ -734,7 +734,8 @@ static int __igt_reset_engine(struct intel_gt *gt, bool active)
>   		reset_engine_count = i915_reset_engine_count(global, engine);
>   
>   		st_engine_heartbeat_disable(engine);
> -		set_bit(I915_RESET_ENGINE + id, &gt->reset.flags);
> +		if (!using_guc)
> +			set_bit(I915_RESET_ENGINE + id, &gt->reset.flags);
>   		count = 0;
>   		do {
>   			struct i915_request *rq = NULL;
> @@ -824,7 +825,8 @@ static int __igt_reset_engine(struct intel_gt *gt, bool active)
>   			if (err)
>   				break;
>   		} while (time_before(jiffies, end_time));
> -		clear_bit(I915_RESET_ENGINE + id, &gt->reset.flags);
> +		if (!using_guc)
> +			clear_bit(I915_RESET_ENGINE + id, &gt->reset.flags);
>   		st_engine_heartbeat_enable(engine);
>   		pr_info("%s: Completed %lu %s resets\n",
>   			engine->name, count, active ? "active" : "idle");
> @@ -1042,7 +1044,8 @@ static int __igt_reset_engines(struct intel_gt *gt,
>   		yield(); /* start all threads before we begin */
>   
>   		st_engine_heartbeat_disable_no_pm(engine);
> -		set_bit(I915_RESET_ENGINE + id, &gt->reset.flags);
> +		if (!using_guc)
> +			set_bit(I915_RESET_ENGINE + id, &gt->reset.flags);
>   		do {
>   			struct i915_request *rq = NULL;
>   			struct intel_selftest_saved_policy saved;
> @@ -1165,7 +1168,8 @@ static int __igt_reset_engines(struct intel_gt *gt,
>   			if (err)
>   				break;
>   		} while (time_before(jiffies, end_time));
> -		clear_bit(I915_RESET_ENGINE + id, &gt->reset.flags);
> +		if (!using_guc)
> +			clear_bit(I915_RESET_ENGINE + id, &gt->reset.flags);
>   		st_engine_heartbeat_enable_no_pm(engine);
>   
>   		pr_info("i915_reset_engine(%s:%s): %lu resets\n",

