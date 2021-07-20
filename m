Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4653D024B
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 21:49:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 169F16E212;
	Tue, 20 Jul 2021 19:49:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8C926E1A2;
 Tue, 20 Jul 2021 19:49:22 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10051"; a="211376431"
X-IronPort-AV: E=Sophos;i="5.84,255,1620716400"; d="scan'208";a="211376431"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 12:49:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,255,1620716400"; d="scan'208";a="432284653"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by fmsmga007.fm.intel.com with ESMTP; 20 Jul 2021 12:49:21 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Tue, 20 Jul 2021 12:49:21 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Tue, 20 Jul 2021 12:49:21 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.44) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Tue, 20 Jul 2021 12:49:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cxRJ8AbTswQIX1mHRvhGI5NHy58O/D7H+Wd/Tl/Sa0Wuc/3zhMHL/RdtAmzcrSaHjEttnZo9yLGP7EKzg15TTA84HZC94S+Bf838OimM2TRIJpYnsz/Ib2GjemgZh6gPg/3UuX2ekFoUS2ty4cpTRPIoXbamjlT2aexKs5goR6l3hA7qgIXbVDySRJCRRzZOpioUFzvktIEqyFxjEdza5oNTMohSeBVM/hB6ai1nP803UtZO4IlY0WNKTg6U6GBsQRBKKC5j/jlSoaYeG6TBpDFvSZaNeDUa4shF1O1tBxQ/2AXOhssOKyVTPqYbD/NmtHKy9O3+fjJYVWyrxoEYSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8xmDWFl+Ei6HVr9dDvSrcDePLEUXEz50aIy1MugT5GM=;
 b=JHrFdCWuY+oH+A3eZGcLit+icRR7QcoxDDf8hIfOsD+L/lnNIWIpDqYajy9rPKcMVyQVLn0Q8uDl8Ny8jIwNuOIXUEhPsY6hdyfKI766MHUF7WA1CIBrBN+xfsZI7TqsgsFlpD4SnDI0MkeQMETrwmmxOjNPwnzMwiimVCc0daDWpBN82otJmWMBB+81r6TTwdRyeVdUCs5fxChwLvOt51I3U3V8oRVZMuoKSUr58ep1YhvZNq4urBcy69wImEGzE2xJbmbC0c0UuPrphqZKMuUNjtHfeq7g9w951vIPqeg0JgbOHsHZto95ivRw8APQPmo8g320PrfTQiPBEEqXXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8xmDWFl+Ei6HVr9dDvSrcDePLEUXEz50aIy1MugT5GM=;
 b=m9LF6tMzhwE7KE2QKDhVSbAiDRS/MQDTCjZIv06ns9PjWTKJVJgnV6jKev/SOtxInVoSZSOaBdFjzPCVQy5CWEzR9stmKMPX1YrU0708VgXSDB66PHBxJEClNgIYGRj9MIR21m/p0FRx49eEjx/1j+qBNZmC1xGmu5t9DGpYFNI=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5627.namprd11.prod.outlook.com (2603:10b6:510:e4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22; Tue, 20 Jul
 2021 19:49:19 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::c5a8:5a64:9118:95c4]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::c5a8:5a64:9118:95c4%8]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 19:49:18 +0000
Subject: Re: [PATCH 15/51] drm/i915/guc: Update intel_gt_wait_for_idle to work
 with GuC
To: Matthew Brost <matthew.brost@intel.com>
References: <20210716201724.54804-1-matthew.brost@intel.com>
 <20210716201724.54804-16-matthew.brost@intel.com>
 <4bfe5983-eb17-6993-6210-0f7fe38ea1fb@intel.com>
 <20210720015300.GA13203@sdutt-i7>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <b8029cb1-d0c0-531e-f244-6867e35e9357@intel.com>
Date: Tue, 20 Jul 2021 12:49:16 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
In-Reply-To: <20210720015300.GA13203@sdutt-i7>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: SJ0PR03CA0277.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::12) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.221] (73.157.192.58) by
 SJ0PR03CA0277.namprd03.prod.outlook.com (2603:10b6:a03:39e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Tue, 20 Jul 2021 19:49:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f9115396-2556-40f2-71e3-08d94bb7766a
X-MS-TrafficTypeDiagnostic: PH0PR11MB5627:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB5627B76E9DCFD2AAD351C012BDE29@PH0PR11MB5627.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bsV9CeDoa+1uEvW9/OtX+/vU2o69Pdovv1sTUaAbTRvypxLJw/GdELbjAsk9sJluxqaQoUy/2jqc32jI4t3XRe06HZZ5AKEzzXXV3g9H9ffFuHAHEQLUaE3rtJTNxM/GUo7P1gvpzCbenEujB1MdpheKfe/jouA3MB5rrBUFX7zm2DlpO8bE95IvYUZAgXiBHiXV18rZTsC0NHrNfBge7aLtfNqa5VAAgdPtFiJyxtKBTwa0yvcNQl9T46Rao+33SmmT7AHRvnE+bVBjAt9G6xuvaEF3F6CK4w/GRpFh7ZemjCA/ncfGpd61o27QgLEZMlO8lLVc4QZ/w9egHDkynAyawQkKxmX2pdcqS9c3xRpqTsyCdbPP1GT+OAwg1If0MEAFDQBDBWicL+jzyKhpqccZg2u+1ck67eNwKhh7JRR9uSeKISF4PXRnBneyIMDdrq2taQh9w5rBJis1K6BWWUSlVzCYTdvX8wIVZmEjD4ysAcnmmjIOwhtpT1x/RqY0Ui8qgS31fogioCQ3tLkge1FuYSlo0lQjmEQjBFzWCbLUU2lfaRsACs/2r/x9ksDrbONyFQXGrZjIE5Jn30JIxsWJXKrg7x9tsIIa1M469WrLDUEQnpmSiR18YVESVr/UQxUQwxJGzW1ZjjWgL9z11zAxtno84pPhIbg7BRhogQaNsyAhs/nrquqI/7yxGPZYRtWQCJOHojj5GcndUqIUgdfML7eahbvQ5Nw31ILKL8T2hfQXkZqwkaNaTm8RVVD1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(136003)(396003)(39860400002)(376002)(16576012)(38100700002)(36756003)(6862004)(30864003)(478600001)(450100002)(186003)(316002)(31686004)(8676002)(6486002)(37006003)(53546011)(83380400001)(966005)(107886003)(2616005)(8936002)(5660300002)(86362001)(2906002)(31696002)(4326008)(66556008)(6636002)(66476007)(956004)(26005)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rk9ISFQyWFZ1K210WGZlT3gyYUkyQVljSkJSOGl4OEhySUFPdk1aTGUvejky?=
 =?utf-8?B?NCtLenlGL2RONXN4R0Z4cEJBaFVZU0xGd2laZk5IZC9WSW5uN0NmZkpCQ0tv?=
 =?utf-8?B?N3RBN2tqYisyVmdUdmZrQmdsemNEZjZYVnJIb21SSlBnTm1YbU9WMnVkb2la?=
 =?utf-8?B?SHNlSmNSZHM3aE53UzJqT1RkTW4yQzdoV3NzV0NMTnZYak9samQ4czE3QmJI?=
 =?utf-8?B?ZGU0T056U084MEZ4UmFPc0NsTzR1T3c1MVcvZmNlYVVVZ29yNmd3K1VqWTlL?=
 =?utf-8?B?NVJKMDVONGo2VTJkT2RwMlJIMWJST3ovcGdkWVUyc1ZBNW55aXZQZVE5YUJO?=
 =?utf-8?B?aENnUDFMSWkydm1zanVoN2czdEt4aUVRSklBZmJ4U1VQR1J6Z1BmTXJSakpM?=
 =?utf-8?B?RFRmeWdrU0VDZjJsZDllRXM5MXZCNTVuaFVCQjYwT0tWM01Oek1zNlJ2clla?=
 =?utf-8?B?MkFkMUQ3SmJyZVZEZzAxaC9ZemxXM0JTUVFKQy9MelVXWklJRlFpZ2Q3Vlcw?=
 =?utf-8?B?am1qTTF2VVg5Y1NGeVBYRnd2bVVpYmEyYTBkTEJiR21MdXB6U1lMZ20zUFJV?=
 =?utf-8?B?U1NXN0NwR2hRVDdzenVsU2U1U3U3SlhIOWJuU084SklpcXdpc25iZ2VITitB?=
 =?utf-8?B?MGtadkVyWVExQVVBMTV5RzRMMmJoV1lnZ1MxWDdLc0ExdjVwZkRoS2xvclFM?=
 =?utf-8?B?NDFzTElZY3ZLQ3VVTnNQSEJjZmU3Ty84TVlnY0w3Vlg4S2Q5MlN1SXFtYndI?=
 =?utf-8?B?elB4RXR0MnhVaVorNElHUllNaWhQU2hDMUYxa1VYQWdFcEQrc0Fua3BUSUpi?=
 =?utf-8?B?eWp6eDhwS3Vkc2lrem5lSlZSN3A4dGw0OGVJN1gxV1pRdjh0aXZ3TGd1c2cw?=
 =?utf-8?B?L2wzRmU0b2l1cDczRko4bXNFMTVUUFpUNllYZTlQajVuY1prSkdOOG9mOU5V?=
 =?utf-8?B?T1gvZjZJRUJiQ1ZCTThndk44c2toYmI4WVBXRDFhWUV6LzhOOGcvSEhVOWth?=
 =?utf-8?B?aWxYS2xZdHIyOFpWOEFMUUtOckk2MlpnK3kzUzhSQmpvb05Dc3VlekorTkJY?=
 =?utf-8?B?cFlhelRzZWJaT0Fid2hzWldSRlhpTGNKYXo2OFpIa1BhUkxyelIxRjVsNEta?=
 =?utf-8?B?R3REOHV4WjV0Nm12TlQzTldQcVZ2SEt1SHA0dlg4TFVrc3AzSUxLQ3lwU2I0?=
 =?utf-8?B?WmZGZm05d2p4T3RTYkZtL1BnWXpreHdEYUtnQnlRV3JjVzNxdURzaXFoTmRr?=
 =?utf-8?B?VS9wdHgweGsxVWh0b2VrbnpmaW1UcHM0RmlERlowOFRheFA4d1VHcXluanpj?=
 =?utf-8?B?Q3hQbnZOMGNkTGxDSmpZbVJDU1dPU0ZZblZQY3Q0a2RHZW0vWFdaS3JmTG5n?=
 =?utf-8?B?V1QrZURRQVhlS2VZMTlwVWtRUEpYTlgxK0N4cUk4S1BjbjRGKzZCM05id0E2?=
 =?utf-8?B?TitaRGcvRDIvVVlOd29oM3NRSENNamJNeFVWdmZ3dE80MTl1bXBHK1h0K01v?=
 =?utf-8?B?ZGZFeFVPYndWQ3Ywc3VIczREZ1loa0M2R3ZXbW5rd3pGNDNKOGVVVHVQbmVy?=
 =?utf-8?B?cDV5di9DeklYend0Z09mTHczdFZJZGJWNnowNkZveHhCMVFoMzFUVXJna3VL?=
 =?utf-8?B?cWw5aGZnWnVWYVlwUHRJcXdxdTlNTzdKa0ZTMkVtR0JiSHl0RzY2NUVaWjBH?=
 =?utf-8?B?WWtmekxkWXFDR1M3d3g0VEJzUm1LZkZBQTQwWE8vbm51cGVWWHdGUW85N2JO?=
 =?utf-8?Q?Gsaa/FTwr21X609xSv/B2Hz1MeTj2W5mnmgtdHU?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f9115396-2556-40f2-71e3-08d94bb7766a
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 19:49:18.9383 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qCzCuqq6PU7/BtDyilRucf02AdUrsM0X3baIrAK0gStIOi7g38EkmPlJzXUw0zxD6uIlTd2+0kIyZH93m30ILnZljZsihdV6zywTAClPfHU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5627
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
Cc: intel-gfx@lists.freedesktop.org, daniele.ceraolospurio@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/19/2021 18:53, Matthew Brost wrote:
> On Mon, Jul 19, 2021 at 06:03:05PM -0700, John Harrison wrote:
>> On 7/16/2021 13:16, Matthew Brost wrote:
>>> When running the GuC the GPU can't be considered idle if the GuC still
>>> has contexts pinned. As such, a call has been added in
>>> intel_gt_wait_for_idle to idle the UC and in turn the GuC by waiting for
>>> the number of unpinned contexts to go to zero.
>>>
>>> v2: rtimeout -> remaining_timeout
>>> v3: Drop unnecessary includes, guc_submission_busy_loop ->
>>> guc_submission_send_busy_loop, drop negatie timeout trick, move a
>>> refactor of guc_context_unpin to earlier path (John H)
>>>
>>> Cc: John Harrison <john.c.harrison@intel.com>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>    drivers/gpu/drm/i915/gem/i915_gem_mman.c      |  3 +-
>>>    drivers/gpu/drm/i915/gt/intel_gt.c            | 19 +++++
>>>    drivers/gpu/drm/i915/gt/intel_gt.h            |  2 +
>>>    drivers/gpu/drm/i915/gt/intel_gt_requests.c   | 21 ++---
>>>    drivers/gpu/drm/i915/gt/intel_gt_requests.h   |  7 +-
>>>    drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  4 +
>>>    drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     |  1 +
>>>    drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h     |  4 +
>>>    .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 85 +++++++++++++++++--
>>>    drivers/gpu/drm/i915/gt/uc/intel_uc.h         |  5 ++
>>>    drivers/gpu/drm/i915/i915_gem_evict.c         |  1 +
>>>    .../gpu/drm/i915/selftests/igt_live_test.c    |  2 +-
>>>    .../gpu/drm/i915/selftests/mock_gem_device.c  |  3 +-
>>>    13 files changed, 129 insertions(+), 28 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>>> index a90f796e85c0..6fffd4d377c2 100644
>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>>> @@ -645,7 +645,8 @@ mmap_offset_attach(struct drm_i915_gem_object *obj,
>>>    		goto insert;
>>>    	/* Attempt to reap some mmap space from dead objects */
>>> -	err = intel_gt_retire_requests_timeout(&i915->gt, MAX_SCHEDULE_TIMEOUT);
>>> +	err = intel_gt_retire_requests_timeout(&i915->gt, MAX_SCHEDULE_TIMEOUT,
>>> +					       NULL);
>>>    	if (err)
>>>    		goto err;
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
>>> index e714e21c0a4d..acfdd53b2678 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
>>> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
>>> @@ -585,6 +585,25 @@ static void __intel_gt_disable(struct intel_gt *gt)
>>>    	GEM_BUG_ON(intel_gt_pm_is_awake(gt));
>>>    }
>>> +int intel_gt_wait_for_idle(struct intel_gt *gt, long timeout)
>>> +{
>>> +	long remaining_timeout;
>>> +
>>> +	/* If the device is asleep, we have no requests outstanding */
>>> +	if (!intel_gt_pm_is_awake(gt))
>>> +		return 0;
>>> +
>>> +	while ((timeout = intel_gt_retire_requests_timeout(gt, timeout,
>>> +							   &remaining_timeout)) > 0) {
>>> +		cond_resched();
>>> +		if (signal_pending(current))
>>> +			return -EINTR;
>>> +	}
>>> +
>>> +	return timeout ? timeout : intel_uc_wait_for_idle(&gt->uc,
>>> +							  remaining_timeout);
>>> +}
>>> +
>>>    int intel_gt_init(struct intel_gt *gt)
>>>    {
>>>    	int err;
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.h b/drivers/gpu/drm/i915/gt/intel_gt.h
>>> index e7aabe0cc5bf..74e771871a9b 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_gt.h
>>> +++ b/drivers/gpu/drm/i915/gt/intel_gt.h
>>> @@ -48,6 +48,8 @@ void intel_gt_driver_release(struct intel_gt *gt);
>>>    void intel_gt_driver_late_release(struct intel_gt *gt);
>>> +int intel_gt_wait_for_idle(struct intel_gt *gt, long timeout);
>>> +
>>>    void intel_gt_check_and_clear_faults(struct intel_gt *gt);
>>>    void intel_gt_clear_error_registers(struct intel_gt *gt,
>>>    				    intel_engine_mask_t engine_mask);
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_requests.c b/drivers/gpu/drm/i915/gt/intel_gt_requests.c
>>> index 647eca9d867a..edb881d75630 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_gt_requests.c
>>> +++ b/drivers/gpu/drm/i915/gt/intel_gt_requests.c
>>> @@ -130,7 +130,8 @@ void intel_engine_fini_retire(struct intel_engine_cs *engine)
>>>    	GEM_BUG_ON(engine->retire);
>>>    }
>>> -long intel_gt_retire_requests_timeout(struct intel_gt *gt, long timeout)
>>> +long intel_gt_retire_requests_timeout(struct intel_gt *gt, long timeout,
>>> +				      long *remaining_timeout)
>>>    {
>>>    	struct intel_gt_timelines *timelines = &gt->timelines;
>>>    	struct intel_timeline *tl, *tn;
>>> @@ -195,22 +196,10 @@ out_active:	spin_lock(&timelines->lock);
>>>    	if (flush_submission(gt, timeout)) /* Wait, there's more! */
>>>    		active_count++;
>>> -	return active_count ? timeout : 0;
>>> -}
>>> -
>>> -int intel_gt_wait_for_idle(struct intel_gt *gt, long timeout)
>>> -{
>>> -	/* If the device is asleep, we have no requests outstanding */
>>> -	if (!intel_gt_pm_is_awake(gt))
>>> -		return 0;
>>> -
>>> -	while ((timeout = intel_gt_retire_requests_timeout(gt, timeout)) > 0) {
>>> -		cond_resched();
>>> -		if (signal_pending(current))
>>> -			return -EINTR;
>>> -	}
>>> +	if (remaining_timeout)
>>> +		*remaining_timeout = timeout;
>>> -	return timeout;
>>> +	return active_count ? timeout : 0;
>>>    }
>>>    static void retire_work_handler(struct work_struct *work)
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_requests.h b/drivers/gpu/drm/i915/gt/intel_gt_requests.h
>>> index fcc30a6e4fe9..83ff5280c06e 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_gt_requests.h
>>> +++ b/drivers/gpu/drm/i915/gt/intel_gt_requests.h
>> You were saying the the include of stddef is needed here?
>>
> Yes, HDRTEST [1] complains otherwise.
>
> [1] https://patchwork.freedesktop.org/series/91840/#rev3
>
>>> @@ -10,10 +10,11 @@ struct intel_engine_cs;
>>>    struct intel_gt;
>>>    struct intel_timeline;
>>> -long intel_gt_retire_requests_timeout(struct intel_gt *gt, long timeout);
>>> +long intel_gt_retire_requests_timeout(struct intel_gt *gt, long timeout,
>>> +				      long *remaining_timeout);
>>>    static inline void intel_gt_retire_requests(struct intel_gt *gt)
>>>    {
>>> -	intel_gt_retire_requests_timeout(gt, 0);
>>> +	intel_gt_retire_requests_timeout(gt, 0, NULL);
>>>    }
>>>    void intel_engine_init_retire(struct intel_engine_cs *engine);
>>> @@ -21,8 +22,6 @@ void intel_engine_add_retire(struct intel_engine_cs *engine,
>>>    			     struct intel_timeline *tl);
>>>    void intel_engine_fini_retire(struct intel_engine_cs *engine);
>>> -int intel_gt_wait_for_idle(struct intel_gt *gt, long timeout);
>>> -
>>>    void intel_gt_init_requests(struct intel_gt *gt);
>>>    void intel_gt_park_requests(struct intel_gt *gt);
>>>    void intel_gt_unpark_requests(struct intel_gt *gt);
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
>>> index 80b88bae5f24..3cc566565224 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
>>> @@ -39,6 +39,8 @@ struct intel_guc {
>>>    	spinlock_t irq_lock;
>>>    	unsigned int msg_enabled_mask;
>>> +	atomic_t outstanding_submission_g2h;
>>> +
>>>    	struct {
>>>    		void (*reset)(struct intel_guc *guc);
>>>    		void (*enable)(struct intel_guc *guc);
>>> @@ -238,6 +240,8 @@ static inline void intel_guc_disable_msg(struct intel_guc *guc, u32 mask)
>>>    	spin_unlock_irq(&guc->irq_lock);
>>>    }
>>> +int intel_guc_wait_for_idle(struct intel_guc *guc, long timeout);
>>> +
>>>    int intel_guc_reset_engine(struct intel_guc *guc,
>>>    			   struct intel_engine_cs *engine);
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
>>> index c33906ec478d..f1cbed6b9f0a 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
>>> @@ -109,6 +109,7 @@ void intel_guc_ct_init_early(struct intel_guc_ct *ct)
>>>    	INIT_LIST_HEAD(&ct->requests.incoming);
>>>    	INIT_WORK(&ct->requests.worker, ct_incoming_request_worker_func);
>>>    	tasklet_setup(&ct->receive_tasklet, ct_receive_tasklet_func);
>>> +	init_waitqueue_head(&ct->wq);
>>>    }
>>>    static inline const char *guc_ct_buffer_type_to_str(u32 type)
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
>>> index 785dfc5c6efb..4b30a562ae63 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
>>> @@ -10,6 +10,7 @@
>>>    #include <linux/spinlock.h>
>>>    #include <linux/workqueue.h>
>>>    #include <linux/ktime.h>
>>> +#include <linux/wait.h>
>>>    #include "intel_guc_fwif.h"
>>> @@ -68,6 +69,9 @@ struct intel_guc_ct {
>>>    	struct tasklet_struct receive_tasklet;
>>> +	/** @wq: wait queue for g2h chanenl */
>>> +	wait_queue_head_t wq;
>>> +
>>>    	struct {
>>>    		u16 last_fence; /* last fence used to send request */
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> index f7e34baa9506..088d11e2e497 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> @@ -254,6 +254,69 @@ static inline void set_lrc_desc_registered(struct intel_guc *guc, u32 id,
>>>    	xa_store_irq(&guc->context_lookup, id, ce, GFP_ATOMIC);
>>>    }
>>> +static int guc_submission_send_busy_loop(struct intel_guc* guc,
>>> +					 const u32 *action,
>>> +					 u32 len,
>>> +					 u32 g2h_len_dw,
>>> +					 bool loop)
>>> +{
>>> +	int err;
>>> +
>>> +	err = intel_guc_send_busy_loop(guc, action, len, g2h_len_dw, loop);
>>> +
>>> +	if (!err && g2h_len_dw)
>>> +		atomic_inc(&guc->outstanding_submission_g2h);
>>> +
>>> +	return err;
>>> +}
>>> +
>>> +static int guc_wait_for_pending_msg(struct intel_guc *guc,
>>> +				    atomic_t *wait_var,
>>> +				    bool interruptible,
>>> +				    long timeout)
>>> +{
>>> +	const int state = interruptible ?
>>> +		TASK_INTERRUPTIBLE : TASK_UNINTERRUPTIBLE;
>>> +	DEFINE_WAIT(wait);
>>> +
>>> +	might_sleep();
>>> +	GEM_BUG_ON(timeout < 0);
>>> +
>>> +	if (!atomic_read(wait_var))
>>> +		return 0;
>>> +
>>> +	if (!timeout)
>>> +		return -ETIME;
>>> +
>>> +	for (;;) {
>>> +		prepare_to_wait(&guc->ct.wq, &wait, state);
>>> +
>>> +		if (!atomic_read(wait_var))
>>> +			break;
>>> +
>>> +		if (signal_pending_state(state, current)) {
>>> +			timeout = -EINTR;
>>> +			break;
>>> +		}
>>> +
>>> +		if (!timeout) {
>>> +			timeout = -ETIME;
>>> +			break;
>>> +		}
>>> +
>>> +		timeout = io_schedule_timeout(timeout);
>>> +	}
>>> +	finish_wait(&guc->ct.wq, &wait);
>>> +
>>> +	return (timeout < 0) ? timeout : 0;
>>> +}
>>> +
>>> +int intel_guc_wait_for_idle(struct intel_guc *guc, long timeout)
>>> +{
>>> +	return guc_wait_for_pending_msg(guc, &guc->outstanding_submission_g2h,
>>> +					true, timeout);
>>> +}
>>> +
>>>    static int guc_add_request(struct intel_guc *guc, struct i915_request *rq)
>>>    {
>>>    	int err;
>>> @@ -280,6 +343,7 @@ static int guc_add_request(struct intel_guc *guc, struct i915_request *rq)
>>>    	err = intel_guc_send_nb(guc, action, len, g2h_len_dw);
>>>    	if (!enabled && !err) {
>>> +		atomic_inc(&guc->outstanding_submission_g2h);
>>>    		set_context_enabled(ce);
>>>    	} else if (!enabled) {
>>>    		clr_context_pending_enable(ce);
>>> @@ -731,7 +795,8 @@ static int __guc_action_register_context(struct intel_guc *guc,
>>>    		offset,
>>>    	};
>>> -	return intel_guc_send_busy_loop(guc, action, ARRAY_SIZE(action), 0, true);
>>> +	return guc_submission_send_busy_loop(guc, action, ARRAY_SIZE(action),
>>> +					     0, true);
>>>    }
>>>    static int register_context(struct intel_context *ce)
>>> @@ -751,8 +816,9 @@ static int __guc_action_deregister_context(struct intel_guc *guc,
>>>    		guc_id,
>>>    	};
>>> -	return intel_guc_send_busy_loop(guc, action, ARRAY_SIZE(action),
>>> -					G2H_LEN_DW_DEREGISTER_CONTEXT, true);
>>> +	return guc_submission_send_busy_loop(guc, action, ARRAY_SIZE(action),
>>> +					     G2H_LEN_DW_DEREGISTER_CONTEXT,
>>> +					     true);
>>>    }
>>>    static int deregister_context(struct intel_context *ce, u32 guc_id)
>>> @@ -893,8 +959,8 @@ static void __guc_context_sched_disable(struct intel_guc *guc,
>>>    	intel_context_get(ce);
>>> -	intel_guc_send_busy_loop(guc, action, ARRAY_SIZE(action),
>>> -				 G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, true);
>>> +	guc_submission_send_busy_loop(guc, action, ARRAY_SIZE(action),
>>> +				      G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, true);
>>>    }
>>>    static u16 prep_context_pending_disable(struct intel_context *ce)
>>> @@ -1440,6 +1506,12 @@ g2h_context_lookup(struct intel_guc *guc, u32 desc_idx)
>>>    	return ce;
>>>    }
>>> +static void decr_outstanding_submission_g2h(struct intel_guc *guc)
>>> +{
>>> +	if (atomic_dec_and_test(&guc->outstanding_submission_g2h))
>>> +		wake_up_all(&guc->ct.wq);
>>> +}
>>> +
>>>    int intel_guc_deregister_done_process_msg(struct intel_guc *guc,
>>>    					  const u32 *msg,
>>>    					  u32 len)
>>> @@ -1475,6 +1547,8 @@ int intel_guc_deregister_done_process_msg(struct intel_guc *guc,
>>>    		lrc_destroy(&ce->ref);
>>>    	}
>>> +	decr_outstanding_submission_g2h(guc);
>>> +
>>>    	return 0;
>>>    }
>>> @@ -1523,6 +1597,7 @@ int intel_guc_sched_done_process_msg(struct intel_guc *guc,
>>>    		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
>>>    	}
>>> +	decr_outstanding_submission_g2h(guc);
>>>    	intel_context_put(ce);
>>>    	return 0;
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.h b/drivers/gpu/drm/i915/gt/uc/intel_uc.h
>>> index 9c954c589edf..c4cef885e984 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.h
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.h
>>> @@ -81,6 +81,11 @@ uc_state_checkers(guc, guc_submission);
>>>    #undef uc_state_checkers
>>>    #undef __uc_state_checker
>>> +static inline int intel_uc_wait_for_idle(struct intel_uc *uc, long timeout)
>>> +{
>>> +	return intel_guc_wait_for_idle(&uc->guc, timeout);
>>> +}
>>> +
>>>    #define intel_uc_ops_function(_NAME, _OPS, _TYPE, _RET) \
>>>    static inline _TYPE intel_uc_##_NAME(struct intel_uc *uc) \
>>>    { \
>>> diff --git a/drivers/gpu/drm/i915/i915_gem_evict.c b/drivers/gpu/drm/i915/i915_gem_evict.c
>>> index 4d2d59a9942b..2b73ddb11c66 100644
>>> --- a/drivers/gpu/drm/i915/i915_gem_evict.c
>>> +++ b/drivers/gpu/drm/i915/i915_gem_evict.c
>>> @@ -27,6 +27,7 @@
>>>     */
>>>    #include "gem/i915_gem_context.h"
>>> +#include "gt/intel_gt.h"
>> Still not seeing a need for this.
>>
>>>    #include "gt/intel_gt_requests.h"
>>>    #include "i915_drv.h"
>>> diff --git a/drivers/gpu/drm/i915/selftests/igt_live_test.c b/drivers/gpu/drm/i915/selftests/igt_live_test.c
>>> index c130010a7033..1c721542e277 100644
>>> --- a/drivers/gpu/drm/i915/selftests/igt_live_test.c
>>> +++ b/drivers/gpu/drm/i915/selftests/igt_live_test.c
>>> @@ -5,7 +5,7 @@
>>>     */
>>>    #include "i915_drv.h"
>>> -#include "gt/intel_gt_requests.h"
>>> +#include "gt/intel_gt.h"
>> Nor this.
>>
> We need these because intel_gt_wait_for_idle which moved from
> "gt/intel_gt_requests.h" to "gt/intel_gt.h".
>
> Matt
Ah, okay. That makes sense.

With the return of stddef.h above...
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

>
>> John.
>>
>>>    #include "../i915_selftest.h"
>>>    #include "igt_flush_test.h"
>>> diff --git a/drivers/gpu/drm/i915/selftests/mock_gem_device.c b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
>>> index d189c4bd4bef..4f8180146888 100644
>>> --- a/drivers/gpu/drm/i915/selftests/mock_gem_device.c
>>> +++ b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
>>> @@ -52,7 +52,8 @@ void mock_device_flush(struct drm_i915_private *i915)
>>>    	do {
>>>    		for_each_engine(engine, gt, id)
>>>    			mock_engine_flush(engine);
>>> -	} while (intel_gt_retire_requests_timeout(gt, MAX_SCHEDULE_TIMEOUT));
>>> +	} while (intel_gt_retire_requests_timeout(gt, MAX_SCHEDULE_TIMEOUT,
>>> +						  NULL));
>>>    }
>>>    static void mock_device_release(struct drm_device *dev)

