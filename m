Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4268AABB4
	for <lists+dri-devel@lfdr.de>; Fri, 19 Apr 2024 11:47:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 602F010EA11;
	Fri, 19 Apr 2024 09:47:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uk0E+JRX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C781710EA02;
 Fri, 19 Apr 2024 09:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713520024; x=1745056024;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FFkgpxD2doXpRONEHxaFSlDQfcriO3il0y0d4uAfMlM=;
 b=Uk0E+JRXnmEO/XE+8CvdbKEioAIcgXMkNjZ3IQujMJyl6AK392xVLhXj
 aCGMlV4ayAyyW5Qe37/0BIGyxxf0WM2KvejW2XrYkrrfiMX2QelZ9K1VD
 nJzrV59LtAQDlOX1UNt/mrbrTzFuT4krGY+U0W8uTlMxHJ1wiG/JbFXzy
 sEyDJOX7ZNEEx/OV6cvwfI9W7AAn5YDO567mYyeg+bOuCRhRj4R407oUQ
 ZqJ415fg6UBXG+ahG1KqoDH9vCz36pA+jQalAIHPdU6R9a7PW6XS/Ob/R
 x7MD1HTALQQExV+ftzkQRB0cIePqj9lohZ2h3dFXlAlpQEGXzp/4XEhFl g==;
X-CSE-ConnectionGUID: uBObRj9BQhWGyiwSpDEJ9Q==
X-CSE-MsgGUID: lMuvla3bTY6sFAOHWATPDw==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="26627581"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="26627581"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 02:47:03 -0700
X-CSE-ConnectionGUID: iZIIzQ5STP2UEyqpurvd7g==
X-CSE-MsgGUID: G1i6PS51QVy0IF3KhjiOcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="23311678"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Apr 2024 02:47:03 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Apr 2024 02:47:02 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Apr 2024 02:47:02 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 19 Apr 2024 02:47:02 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 19 Apr 2024 02:47:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S41leiWtpMtvCL6lUX47DHs5nujIl4uJh1uQ+4jbvO5jd6Ohl/iCn+N2GvSXZZUG+dIXyvcYrF/UhncgOJMN1OYZov4V7Ka8WNp8toTeaFaeUs2tTP+tQhF9v9SpASBDt6kE/teEoD0RPGgfY41Slvv6zeHKWAS6qUN6mOp3jZvWr23Uepp+Vl0LYwjzWGCngdHbWN65AnMX4mpWBSO8pUluAjHTmbiYEhFSH4X7H3/2YLFE2YJeclGjWOaS8znQgp/77RSgUg5aK0KK7snyqzkcWd5rgTWJnq3ZRCETtxyVGfdOtFP8WBTHVsQJ7GkPvXn3J5vSpmWG8cQ5mnaLtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hKDXMaKL4/JN+7B4SU1WbEQPrCAwb8Tj1sBSJcdkJg4=;
 b=aqcRrrxYvcDtu0s0vWl/2hKvwN3kgSCgSWLnShU24YDmpWMqgpybZIhz4YUwnd5jClp8u/D81H4QSzfd6X3UP7eeUgiqBODx6F++abdwB59kH9nYfCXj179WKmufGEs5zItcOFonpXU2fcthG5lpW9B+mY02aU8AJ1IFzJ8M6uM0dMvjl/gpNZkVwm2cASGznqCRZkKayJ4z1oRORA+NNomF5DdVF8aiFyLrTetAbpd+o43Eo3llBp539k/ZdrbWYYQgz38HQTHVPNNRx+MVg94CuTFYJsWkNQDk+qrxY0pVqZ5NKh1F/PqaHz3WfE1COQHElDyW0nzu6H3jsap0gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 MW5PR11MB5932.namprd11.prod.outlook.com (2603:10b6:303:1a2::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7430.46; Fri, 19 Apr 2024 09:46:54 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::d616:a889:aeb0:3724]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::d616:a889:aeb0:3724%7]) with mapi id 15.20.7472.037; Fri, 19 Apr 2024
 09:46:54 +0000
Message-ID: <11526f05-7931-413b-904f-57de2c501f2c@intel.com>
Date: Fri, 19 Apr 2024 11:46:50 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/i915: Fix gt reset with GuC submission disabled
To: John Harrison <john.c.harrison@intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>
References: <20240418171055.31371-1-nirmoy.das@intel.com>
 <20240418171055.31371-3-nirmoy.das@intel.com>
 <13043328-20e9-4e6f-bf52-8e275af4015f@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <13043328-20e9-4e6f-bf52-8e275af4015f@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MI1P293CA0014.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:2::17) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|MW5PR11MB5932:EE_
X-MS-Office365-Filtering-Correlation-Id: caaa5a8f-91ba-4030-95f7-08dc6055a539
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IGi8d6YGKDNdSFviyWyAGQNjxHC3N+cniG8jzncoHlAvGKPsX/5QARtNyMKNMYlrDK9sY495a/JByPMQMS33fMVHDOUyW20hYjQWCybUL4227Xj82KUvJCtISO7n4YhE7g2nYbqevM6AzHi2VhPJFAPy26nvT5mShhPejy8pf+1163Srs8zGvqe/7VCEFXJA/EmnmzxyyqEKWcMMhTyfa3u6awbh83aDfShSQDj79XtrtIKLpWplY6HtHxAHkdx3OvhvtKrw9+3XLjvchIXSSVyXvpVJrRo/iC6cXWrnPA7jCMqMUDqJEEwrDWICTTYbz0ATI9otT+Nlmtk/gzcS6fq0Vt9nEKIBhvJqdv9cB4SDI1CvPm4rB6g8ddjR2/ULWPg3mBNvs8tXIBwfx8yzfJFGYJnx7NW9/paw7t/0n8J1Ptvn+VLl9n6WSi5AZbqJPe3LhXMv0JS0lMAlbUOyg2KVKxe/Y99OhMZj8d4nZp+yJsNN92MgbTDzo2zq1F/RmZjGlZf5BHdoFJxzS5EDy94nYK5XuIJ5ZkanT+zx06EC7kqIgDqb8+OrvFkNF+T5EYm6gdrJff2HY6AB37Z2psXQoa7DyoWP57LG08ygFFSBPpksSBBv95w3nX3O6HZfLZJFWrjVQYG9pnFIaymFQEcWg57F+USPAQ5hLMCMe18=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZjF0dUZtazRPcFlOa1U1UjlLTGo3SXA3R1lGeGVtdmdZbGdnakNIWDc5TEFy?=
 =?utf-8?B?aFQzSUE2dU5EV3J4UGVOSkJxRDBib3R1Ry9TdFhLYTJNU2lVOENOODc5WTdp?=
 =?utf-8?B?RkJHN29lTmFobC9uTm9PTnNwd1FvUVU2NmYxaDd5bStaMFk3alF5TUlya3NN?=
 =?utf-8?B?M3VhUnhXb1hhUndXUkg1VTFqbFJKMWsra0c4NU5nbktscmh0OElua2JxRHZZ?=
 =?utf-8?B?T3RWOEE3cnhpK013cXdyUkx0UmxtNFlmQnh6bmdKWFdjTWlSNlBFeFhmL3NN?=
 =?utf-8?B?d0k1endUSmRtV0dWMUZFNnhxK05YRVBPc1dVVC9IeDJMbUlQYU5MTld6YUtY?=
 =?utf-8?B?d0E1ZEFPRXQycWVGZ01oTXNHczZVYmtWbGRQOTBpYUVsZU1ha1l6L2FScm1U?=
 =?utf-8?B?ZVVOeFpFS2k4MHg0aUM1Z3IvelMxTmtPT1FBOTBvVVliMDA2VkhVK2tTaXVG?=
 =?utf-8?B?L3ZLVzZLUUZwWGNJTExaYUtiMEdmVTdlY3kvR2FobWU3d2wxdFBERGhOQVY4?=
 =?utf-8?B?ZkJzdkgyVzlwSmNCS3FzZlFqeER5b0xTQ05sdXovSGZpQ3dVYXlObmIyNjJJ?=
 =?utf-8?B?ZmUxTGtVZzFicHg1VG94anpreG9sbnYrRXU0TmdyZmdsMW9scnRPcmEzbG5S?=
 =?utf-8?B?ZUprZm9KRGlPdG50NGFXRUVrellzK0p2WUxiZXMxWWhVeGdwbzFWaEdiOUFU?=
 =?utf-8?B?MU90aUNOSmVlMmg2bTFFcGxoTlRmNzdjRDd0QTU4S2FlWlZmVlZvV09sSGZt?=
 =?utf-8?B?MTFHbXBGanFMemZBT1JXTVBTaDlhbEZvTS9Hc29QL1JEcUtCYndNSVFEM0dv?=
 =?utf-8?B?RU5nckpiTzJtZnNzZmduR1ZkQWdNcEhGa2t2aUtZU0RRdUtWNk1HSFg4eURa?=
 =?utf-8?B?c1d1dkM5RjE1d00vY3VzRFRHTkNkZ01yT1VQMFlWMUpJcE9UVVZNOG1oOXMx?=
 =?utf-8?B?MWZIVlBOOUNxRXQ4TGZ4TlcyeEpHSW9DSUtKYkFaZjhmYTNERUpRaGJORldY?=
 =?utf-8?B?ZTN5SkR2SXN6dWVIeW1zekx3UHRyNjNkOUpNamxNSW1yK0dvYldoQUNtUzV4?=
 =?utf-8?B?QkhEQkFCSEFzZ0N2TGpNcU42Nk9UQVFlWkpzb1lTNjlwVmRDNlMvcU5TdFhZ?=
 =?utf-8?B?eHRhT3BISDBQdHIranptZ1MxWU9QaC9KVWhiMG9tSnhPakt0MHdKQzRPT3JZ?=
 =?utf-8?B?MWxrWjlpY2N4L05NdUtMQ0xwZ0hwajluckErYjhkSG1KMlNxZUQ0cWZteWNr?=
 =?utf-8?B?empJd2c0dTFtRFN0eXNoS20xNkhiRUVhbnNvdmJLWjEvS0dIYmZmcWFlU0Jx?=
 =?utf-8?B?SDFpVVVtdHl6U05uVWFFa3U4blhRTW5PYldiUHJSdlo3U3RxNVhLZkJSNngy?=
 =?utf-8?B?THRrUDN5N0JNQXI3QmhLUStuVGUrT3dKMTlZZTJyMEF0NkppZjZkVHVFWXpx?=
 =?utf-8?B?Mm9rMlpLc1g5ZlllVjhiVGtRdjVhZEZOUmVHd04rMXlIbFI1eVJxN0cxenc5?=
 =?utf-8?B?NVV1eXlKMXo2WmpYWUZXNzF3cHVwOC9KRlYvUTJtSlVlVk91Sk00UlA2TWtP?=
 =?utf-8?B?YXYrUC80dTJYaFByZmppVU1NM3NyRmpUUzlFTHhUVjA2S0dUbzI1NVpOTmxK?=
 =?utf-8?B?VlZEbHd3T1Nhenllckl0U201SXFWN1p2LzJMTmp5cE1nTlJ0VXlJbWlvN2Yw?=
 =?utf-8?B?aEF2Y2plUUFkb2RaSHliR3lVQjhFWXFvWGNyb3VxL1NYM3k0a0o0V01PUnpW?=
 =?utf-8?B?OVRHalBZS2tNeS9kZDdlUFlDTi9TakJVUWVDcmVHM1JzZmpGUG0zR1ZOMUFD?=
 =?utf-8?B?VkRhQ1dxb1g1ditLN2ZJTUVETVRkblRVT0tDaDZwSWVOK0FKanh6UWN5Qmpm?=
 =?utf-8?B?NEpPMkwrNXE0OWZlTHZJQll5dUdMRWQ3Njg2c1JGeUFySXg3UWVYRW1Jdjh3?=
 =?utf-8?B?eURqRDhSZTJwRnA5d1lrRkVsSDZrWHJVVnNLUjlOZ2k4L05mZVd5TE5SNVlV?=
 =?utf-8?B?cDE0Qm1INk9SdFE4QlVsc05Ram43alJRSEduTUVRbytCb29aQTJ0Nmp1WTdQ?=
 =?utf-8?B?RVJnZG03MU9tWHdSeFB5dlV3Y09qVlFXOUh5MEprMysvS1B1d0ZwZW1ucHpk?=
 =?utf-8?Q?mhPuiORt3Z9arKZhm7gCGUnOB?=
X-MS-Exchange-CrossTenant-Network-Message-Id: caaa5a8f-91ba-4030-95f7-08dc6055a539
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2024 09:46:54.3076 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +zrIhFl7/kjkqSKokkcANaZNXnMiJ8sLAhM72WResR8kv1NvJ/k0Jop3qmrW27U7w6A/mppU70ljrPqanqsb3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5932
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

On 4/19/2024 1:38 AM, John Harrison wrote:
> On 4/18/2024 10:10, Nirmoy Das wrote:
>> Currently intel_gt_reset() happens as follows:
>>
>> reset_prepare() ---> Sends GDRST to GuC, GuC is in GS_MIA_IN_RESET
>> do_reset()
>>    intel_gt_reset_all_engines()
>>      *_engine_reset_prepare() -->RESET_CTL expects running GuC
> Not technically correct. There is no direct connection between 
> RESET_CTL and GuC.
>
>>      *_reset_engines()
>> intel_gt_init_hw() --> GuC comes out of GS_MIA_IN_RESET with FW loaded.
>>
>> Fix the issue by sanitizing the GuC only after resetting requested
>> engines and before intel_gt_init_hw().
> You never actually state what the issue is.
>
> The problem is that there is a dedicated CSB FIFO going to GuC (and 
> nothing else has access to it). If that FIFO fills up, the hardware 
> will block on the next context switch until there is space. If no-one 
> (i.e. GuC) is draining it, that means the system is effectively hung. 
> If an engine is reset whilst actively executing a context, a CSB entry 
> will be sent to say that the context has gone idle. Thus if you reset 
> a very busy system and start with killing GuC before killing the 
> engines and only then re-enabling GuC, you run the risk of generating 
> more CSB entries than will fit in the FIFO and deadlocking. Whereas, 
> if the system is idle then you can reset the engines as much as you 
> like while GuC is dead and it won't be a problem.


I wasn't sure if I could talk about internal details so kept it to 
minimal. I will borrow above explanation and resend :)

>
>>
>> Note intel_uc_reset_finish() and intel_uc_reset() are nop when
>> guc submission is disabled.
>>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/intel_reset.c | 16 ++++++++++++++--
>>   1 file changed, 14 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c 
>> b/drivers/gpu/drm/i915/gt/intel_reset.c
>> index 6504e8ba9c58..bd166f5aca4b 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_reset.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_reset.c
>> @@ -907,8 +907,17 @@ static intel_engine_mask_t reset_prepare(struct 
>> intel_gt *gt)
>>       intel_engine_mask_t awake = 0;
>>       enum intel_engine_id id;
>>   -    /* For GuC mode, ensure submission is disabled before stopping 
>> ring */
>> -    intel_uc_reset_prepare(&gt->uc);
>> +    /**
>> +     * For GuC mode with submission enabled, ensure submission
>> +     * is disabled before stopping ring.
>> +     *
>> +     * For GuC mode with submission disabled, ensure that GuC is not
>> +     * sanitized, do that at the end in reset_finish(). reset_prepare()
>> +     * is followed by engine reset which in this mode requires GuC to
>> +     * be functional to process engine reset events.
> -> to process any CSB FIFO entries generated by the resets.

I will add this.


Thanks,

Nirmoy

>
> John.
>
>> +     */
>> +    if (intel_uc_uses_guc_submission(&gt->uc))
>> +        intel_uc_reset_prepare(&gt->uc);
>>         for_each_engine(engine, gt, id) {
>>           if (intel_engine_pm_get_if_awake(engine))
>> @@ -1255,6 +1264,9 @@ void intel_gt_reset(struct intel_gt *gt,
>>         intel_overlay_reset(gt->i915);
>>   +    /* sanitize uC after engine reset */
>> +    if (!intel_uc_uses_guc_submission(&gt->uc))
>> +        intel_uc_reset_prepare(&gt->uc);
>>       /*
>>        * Next we need to restore the context, but we don't use those
>>        * yet either...
>
