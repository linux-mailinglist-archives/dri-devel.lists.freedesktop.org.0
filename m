Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IGwAFC6cjWlT5QAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 10:23:58 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B420C12BD21
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 10:23:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE67110E706;
	Thu, 12 Feb 2026 09:23:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cWgEYN9f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C64F10E706;
 Thu, 12 Feb 2026 09:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770888235; x=1802424235;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+yK4yRq2GNHW6+DBYnVEwRDEiE6JOdGmAix1PVarKiw=;
 b=cWgEYN9f0W9s0HM2I6QYDtcTEsQjf9jkPUnJzRolYNvKxVcp3XDODBDo
 UW0xJyvCEuOVm8zwfMMNPcfobr1QWRXzY3w7cK4JfAvLBZNjd381OAeC0
 NAL+u7K/yI5hChZD1HYnFwYjnuiK9LYH3h7L5vkKvB66q5+XDrjJ7Js/F
 ATxmxKueCUmEM1mCcV8N0U6N2SfImdNN0ilk+Hof+bXtyDXKC7kcEPAhZ
 vWoNR3mtP4JPXXsXRK2UgasvKCHF+PtxDBplPf97KUe8dZFr3w4wFDEtq
 SwPJd6bnuyrJ3O1+ysStawwFVRVMDxtwYx9sEs/3t5WaUu85CLN5XQ7Nf g==;
X-CSE-ConnectionGUID: eeHmAHQDRGim1tSLN0TSrw==
X-CSE-MsgGUID: W1X14yHSTJe8PV9U+U/aQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="59627201"
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; d="scan'208";a="59627201"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 01:23:54 -0800
X-CSE-ConnectionGUID: dRpSHeCZTDuNAVbn63S0wA==
X-CSE-MsgGUID: T5VUpgJ8Q9uBb/BmZ2Swig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; d="scan'208";a="242157984"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 01:23:55 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 12 Feb 2026 01:23:54 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 12 Feb 2026 01:23:54 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.32) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 12 Feb 2026 01:23:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YZZ7rAJW0Ew6bTd18BGWVo/2W4AVVo/DfmGPDkr6YcfjDr8kpwtmc0OrKGDkaB+rh8fpy/yN9krIpRpgPrekruHyN8TDaSTOpkM5gZpq6jz1NSVkcolOSH30VFTSWX8pw2UOzLnLJ4r44vfh23iJqPZ6ExnkUvZigI4Gm4EE3PgkAK3X8hyRPHcgzGlURjtKUOzVSS0V2qL6kCUVFW8AYyLxoq17/O7x/eT5nM7sWmK0VZXncc6sbQ1/rhvRxZ7iICR24QPjTyBJjPAsBIznBVeeQ7TPzNfxmqdlplFKBiNzGskLCRZQqfmf88iC+9r1nvFMdmkHjguk2YX+llWl7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YNi2Av+OzuvvFL0m/hWEe2m7gIqua1JQHK5/T0Tlpa4=;
 b=tZZ8vC6798BPQKRxXaG1YTrYmkHRWp+mpWqkRtyrJSrEx+L270oonSZ49PwdE1iXsgZeW0Woic9hz51DCnDoleukILaE61hgPBhHiiC4FbnOmcsRq+fQacry73WUQ1gfEPcaKAtuNPS2nOFrMd9hG3Pj2DIe+x4cTFGDjXHxLn3DYp1RSOUVtac9gJh3R6ywfdQ4RvN/KAdA+W0/KJxWhoS/5EMvEhSTJLOgegxQSWJPPoHxGss4RfLcSg+QdI/rYiUSkmRHw60DoWOpYwWWQ9CCMjOe34vVUV3+zyrXWVBu3SMN6ZzlrpHtnQF7zeTrqtLISWQX37s36d7o6fiaLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8208.namprd11.prod.outlook.com (2603:10b6:8:165::18)
 by BL1PR11MB5255.namprd11.prod.outlook.com (2603:10b6:208:31a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 09:23:51 +0000
Received: from DS0PR11MB8208.namprd11.prod.outlook.com
 ([fe80::ecb0:7475:84de:ca9c]) by DS0PR11MB8208.namprd11.prod.outlook.com
 ([fe80::ecb0:7475:84de:ca9c%5]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 09:23:51 +0000
Message-ID: <23ec6981-3602-49b4-a077-107daba9caa4@intel.com>
Date: Thu, 12 Feb 2026 14:53:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/buddy: Add kernel-doc for allocator structures
 and flags
To: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>,
 <dri-devel@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Matthew Auld <matthew.auld@intel.com>
References: <20260211053123.260037-4-sanjay.kumar.yadav@intel.com>
 <20260211053123.260037-5-sanjay.kumar.yadav@intel.com>
 <f1660888-9682-4c74-9241-063750bd63ef@amd.com>
 <3a205ac1-5917-4e24-b6e6-f8989678a54d@amd.com>
Content-Language: en-US
From: "Yadav, Sanjay Kumar" <sanjay.kumar.yadav@intel.com>
In-Reply-To: <3a205ac1-5917-4e24-b6e6-f8989678a54d@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0167.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1cf::8) To DS0PR11MB8208.namprd11.prod.outlook.com
 (2603:10b6:8:165::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8208:EE_|BL1PR11MB5255:EE_
X-MS-Office365-Filtering-Correlation-Id: 20b0da2c-6025-4acf-1d8e-08de6a186ef1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NGRNbllYTGt2YmE0M29vZ0pnV1M1QVhkZUF2YUdvVXFYZmVCSVFzcmlZaVhy?=
 =?utf-8?B?alQwM1BZTVQyWkh0N1VsQW0wRkJBTUFDUUllWmlJbk0renBwdlhlY0Z2T3c2?=
 =?utf-8?B?ajFmZTJSTE1DR3FaSHdjcUw2WXFXcHRQKzY5K2ZkQzdST01NczJBZ09mY3FL?=
 =?utf-8?B?TUhuZkc2citSK1ZmaDRSbllqNkRodTdaQml2ck9ZM3BFUE5ZM1huOWZnZkpn?=
 =?utf-8?B?UmlCZGtRVytrcThIa0F2OS96cU5XRmliY01PeEJ5dmViS1RocUY1RndiZ1ND?=
 =?utf-8?B?cW5HWExFVDFDVzBjMW1zS25VdVZmN0RucE8rem9iUTRMSElsR05kZmJmMkUv?=
 =?utf-8?B?bmZKcG81TXExNHQ3YWdoVXZ6RndCZEU5NFpLZjQvZVo5cnh6UzlHRGg0RzdP?=
 =?utf-8?B?a2F1N2lKMVROMXUyOTR2ZzJndko5bjJnNmg0aFJFYllLalBLeTlZYnNVcUlT?=
 =?utf-8?B?RWhPUnpoT21mUld4QzY5Unl0bnVsSWVES09Kd2xBUXhkcFRrS3ZnOEZRdTBq?=
 =?utf-8?B?Wm95NW9OdkFtazhiNkFlQWRLN3hLR2RUOGFQbU93Mm9yRU01SEhDUnpTd0Zn?=
 =?utf-8?B?UE1UYnNYL0Y5WXo5NWZDcFJXeU9Gam1hcGVtUnpjbDJwMkdHblBYa2NueGxK?=
 =?utf-8?B?ekorRzNFV3F5c21tQ084dFdGYTI4czhSUDQ1c1hYamhOeWVnbGpodXBiU0Y3?=
 =?utf-8?B?VUljZE5XaGl4V044STRFZGYzWUZoWktjblY1K243bVlrMnZMdGtOUTArSFlJ?=
 =?utf-8?B?b3k4Q052MEVZYmd2b3Jid1hmb1ZMbC9pUFJseCtSYjVzYU10c1VrOU5McStl?=
 =?utf-8?B?WENrRjRrbEpXdCt4dm56Qml6bVQ2d2RqRmx3Q1F5ZmFudkpLdXdsTm1sODVB?=
 =?utf-8?B?SCttdlh1d2hJaTlHbzZxSHBNVGdKTUJwM1B3V0ViSWNDVkJMWmx1NnRFbTBv?=
 =?utf-8?B?TlVTYk1ZQi9GeUNQTUxvVnphQ0lHaFBOTVBsei9SVDYwcStLMURHY1pMelE1?=
 =?utf-8?B?Zmt2U0NqNjcxQThRUGx4OHpZVVFjK3hhS0lYK1I0ZUpUaUdmRFdzK1ZDVTQ2?=
 =?utf-8?B?b2lIS1dZMm4yd0FiUnRvT2YzdzQwSitYRVBrWHNvZHZ0Zkl2NjN6VVZtOEVn?=
 =?utf-8?B?R1JFNDJDcmNEcmZ4RzZOdzAzN2I5ZVNuTy9xVTIyekpVcFlweTJVMHNkSWJM?=
 =?utf-8?B?TU5vNDF5ZDI0ODlVQzRka1ZTTmdFTnBDS1dWaHRjaGM0SjFQOWZLaEJ3ZWd4?=
 =?utf-8?B?UGdRbDVzRGUwbU50QytyK3c1dDFhUG80bEU3V01vSWlOY3doTDM2V3dsM0xi?=
 =?utf-8?B?N2s3SmRObzhxemJnQkt1WGljQ1lKNVJYRGtKb2NoV0Q2eVdxb3lWeGI3dDMw?=
 =?utf-8?B?MENucCtZWW5vbTlGVCs5N1k1aS92Q2pBOHpTNVlDZVZNVm94TDg0NDZIZXZQ?=
 =?utf-8?B?bkRxSDk0TWxnbVMxdEtSZGdMOEtYdUk0Y0lCcGNrUVBhRmtjcHB1N1AxR0Rv?=
 =?utf-8?B?Sk1XWnFreUlNMzl6b29vMHB3bFNKS3dYTU1QZWZralFXK1A2WjVYKzVSWk9Y?=
 =?utf-8?B?aENYOTFOay80SmRlTGxNaU91SnZyOWE3RXVmT1h6UmhnSGJwSUY3UHN0UjRs?=
 =?utf-8?B?WGY5ZGJ1Vk4zUGlxaFdlUXpxUzB3ZlU0N1Fnb0kxWXdBNXY4V0JUelZQeUVs?=
 =?utf-8?B?Y3l5SUwrSEVUd3RKQkRQWEtRQmhnRG9pQnRVWi9DM2tWNTNOSkV2NHZXSHRH?=
 =?utf-8?B?cmhXSWcrNTZJUEVsQkFSRlBSVjBmU0NTVW8rQ3BaYVNiZ3ErL0F5L0ZKWit6?=
 =?utf-8?B?Wmx1SzFaMDdiT2pQVUpzUmJBMUlhblFSa2tUWXdhbWY1dW1SbGYyTWpjMUFB?=
 =?utf-8?B?alVtSHh0c1lZcW5GbXd2NkZFbGRjYnNvN05RK294b2hiUFNrWWFrS2VTQkRw?=
 =?utf-8?B?Q0hlS1VYSmZ4eTZuNGdHNWgvK0x0VTFUNHZNazE4TUM4K0hYZzZxdjZlLy9Z?=
 =?utf-8?B?dVlPOG5HSmVURnUvOXFweGZ1bDJVelBtNW13TjZNeGk2dXpESlNvb0JYNkhJ?=
 =?utf-8?B?d2V2endqamxLdnBmdllZSFhwMzllTXFyeVlYaGNhRnd5emhwTUJGS25qUGR6?=
 =?utf-8?Q?GU1Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8208.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2N2MnBXNFNOdmRLc1dXTFVvenV4b0ppeFpEc2o3amkzRVhDTW1qYlZPZlpj?=
 =?utf-8?B?Ykw0cFhITFBpU3NrWG8ydk1KdXVOaHdxb1V5czJ0YnJ0bHUrcVN5RlhvUm9w?=
 =?utf-8?B?U0t3em01aGNDS0xMbVlWTjBuNllCTHd3THg2L3g5V2x4WlpDcllMQjhpQXVj?=
 =?utf-8?B?Vkk3QXNySHU0SUNXZTdGaGlDbXg1L1EzQUwwWUdWSjB6bG5yQWxkdnBqbzNk?=
 =?utf-8?B?d1FHZmthQ1ZNZTFNY0NEekI1ZWZRYm4vUVZsSWczODBSRjBXZDdTSWtucmFF?=
 =?utf-8?B?eHdvanQwTjd1SzB4bTEyRU93OWlvTUc3WWNtbDkvTWN2dzNQeURnRnNEclBG?=
 =?utf-8?B?SG0rdE92Ky9BKzU5YTVCVnJ4QUUyS3c1RWNTZlByekdVTVhOT0MyREw3Q1RD?=
 =?utf-8?B?SnVIN1lhSTc4ZVJINGdKaTJ6OHAyNW9PRytyc3lkSWh4dlVDb0dOd2J1UWhC?=
 =?utf-8?B?UE9qbGQrWXdLZFVBZ2gwdUNTQnJMaEN6QXNzZWRGb3hONmtmdVU0THNGYTQz?=
 =?utf-8?B?ZmZkZ2luWEIwVE1pYnBWTVpCVWdhb2NwakU1OWpvaVhZMnJaWTU1c2hCMEdX?=
 =?utf-8?B?QVF0bXppY2pWbVVjSFYyWU9WblZ2UXQyWXZPdUovZjU5K0NFUUtMbkhzb1Qx?=
 =?utf-8?B?WkdsMHo3Mzd4N2RNNmthWTA1TG9ySVFrcFB2a3pFbi83QVZsWHk0Y0xuY1p1?=
 =?utf-8?B?cExnUkpNbE05a1d1cTQvZDFFUSt1S1BlOTU4NUVPdkdLT2g4MXZlWEhCVlJD?=
 =?utf-8?B?UTZ2Y0NGUkhuWWVPRkt6RGYzME9PeXJCYU8wUUx4RFZVRCs4eWZIRERZMk8r?=
 =?utf-8?B?NGd3cGN1bVA1VGNFcFBYY1NNa1pObS9RanZpRzUvU1V3bVA5alFpOUY5aFFD?=
 =?utf-8?B?YjVSbkJlM2FHYnlkZ2VSWGZmSGNCUlZNamtGVXNSQkY0V2pYWm90Slh0Nmp4?=
 =?utf-8?B?anJ5Q09XOHN2OWk0M2U1U0JSMG13RytERmcvSFdkQjVWWlpxcXUzbE1ZZEtW?=
 =?utf-8?B?eEl6TWJHWThzdzA3bXBQczd1ekhzNzQ4YkVTMTZoc0ttQmNLR3VvMVpwL0dU?=
 =?utf-8?B?UHQ0REd4RFJPU1I0Z0k4MFJiUUVOQU9VTkF6M0FJd1BVMUZRbUN5MDNPSkxN?=
 =?utf-8?B?VHlDdGE0TTlra3FZQjZDYUtrcE5RM1RLQURVZkI2dy9wRjJxL2N2K3l6bkRW?=
 =?utf-8?B?OUZ0L2VUcm1pMDJva2pwdTFoV1ArTDFydnN1OVUxSm5UUDdhTmNjbjBrLzFN?=
 =?utf-8?B?dFRqdGVDTnFiUjArZldyb01LczhZZDhVT3JTOWhxOXVScktSaE80VUpWTGJY?=
 =?utf-8?B?STdDUGVXQlVrNmhqQTNVTHo5TWhLeWN4aWVUbEtzTmx2OVFoZmkyN3Vmd2p6?=
 =?utf-8?B?em95OHhVT2c1TmFSZEl1dUlDZVFFL2hHdEVQYlhvcnhqcms2R2lLTmZ6UnZV?=
 =?utf-8?B?cUp5YUZqYzNPQ29SZWdtV2NFSU4zUWRPeXM4NG8va3hpRU1zc0VYZU5veGZs?=
 =?utf-8?B?NEROT1RkRWltMjhxdXhMeWRKbzFnYXdES3ZHMGZYa2w1SWsrWm01aWZ1U0J1?=
 =?utf-8?B?Y0xlUkZFK2ZGU3VpUFdqNVRrakdubURKdnBDLzdjUWZJMmJiNGJkbFFTZ24v?=
 =?utf-8?B?S0JEWlZhUkpoTytCbmc0QTNEdVo0S0JrVHV1VStmMThNQ2pkeXgxSEYvNmVm?=
 =?utf-8?B?UnF5dDZhZGlPR3FJL29MbCtWaEZjS1NCbUUzTXFYUkJNLzk0QmVQSFFNTGZO?=
 =?utf-8?B?c1NCNkFHNUdFeE5GU3RMT0ZjQ3NMTGdDa0FlWVp5djk2ZXNzRHltQytleTdN?=
 =?utf-8?B?aS9LR001TmVDcHM5bjRWNGwxQTVBenNSU0ZObWpmQU5CbFJXRi90VU44eVNV?=
 =?utf-8?B?Q0MwUlczNWNMMjMrSFpwNEkyZzZtL3drZzZRK1lKblBOeXFONDZjYTF5OEVq?=
 =?utf-8?B?OGNYWktQUEFxK1RpOE16MVA2SEFiUUZGUUNtdkRIREZvVW5seG1EUENiNGp0?=
 =?utf-8?B?Z0NqY2FSVFJaeGpqWFEydUEwd3VORjBSdXpuWjhNcHRpS0p5eVJzQXRybnZt?=
 =?utf-8?B?UWdMaExKM0Q4K0RBZkdsVFBoeWpnTGY3Z28wZURHTTRRUDhtQzRJdlBYWE9V?=
 =?utf-8?B?L1B6MC8wQU9VWjhWWFQ2VnM0eFBFeE9BZ1l6cDBxdG11NXl1WjhxY2xHbjJv?=
 =?utf-8?B?SVV5TkVvODVESG91OGRXZ0ZqSFc4WDVTQ25FaVd1QUkzWklCUzRQWHNIVTAz?=
 =?utf-8?B?Y3VpOTdtbjJBTXNuRStUajhyaGdnd2dNS0ZuemFHR0s1NTJ5ZlR6QVJvTk9q?=
 =?utf-8?B?NFJka0NWRFVrdythYUp3QlplQzU2amdtVEJXUERqa2Vja3dDbWFLUFVrQUZF?=
 =?utf-8?Q?GI0rC96lWcL0FAD4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 20b0da2c-6025-4acf-1d8e-08de6a186ef1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8208.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 09:23:50.9684 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wMUteBP9XbOlMuaRWCmB7Zx/OQyBIYrhvNQ5FYVONWLp8DOacTPtjRUT1wtiFIgFTTjSvUyFcX5nZbDHD0mdnjYiEcEPoQd/u7lkapU9nBM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5255
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:mid,intel.com:dkim,intel.com:email];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_SEVEN(0.00)[9];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sanjay.kumar.yadav@intel.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: B420C12BD21
X-Rspamd-Action: no action


On 12-02-2026 13:10, Arunpravin Paneer Selvam wrote:
>
>
> On 2/12/2026 1:08 PM, Arunpravin Paneer Selvam wrote:
>>
>>
>> On 2/11/2026 11:01 AM, Sanjay Yadav wrote:
>>> Add missing kernel-doc for GPU buddy allocator flags,
>>> gpu_buddy_block, and gpu_buddy. The documentation covers block
>>> header fields, allocator roots, free trees, and allocation flags
>>> such as RANGE, TOPDOWN, CONTIGUOUS, CLEAR, and TRIM_DISABLE.
>>> Private members are marked with kernel-doc private markers
>>> and documented with regular comments.
>>>
>>> No functional changes.
>>>
>>> v2:
>>> - Corrected GPU_BUDDY_CLEAR_TREE and GPU_BUDDY_DIRTY_TREE index 
>>> values (Arun)
>>> - Rebased after DRM buddy allocator moved to drivers/gpu/
>>> - Updated commit message
>>>
>>> Cc: Christian König<christian.koenig@amd.com>
>>> Cc: Arunpravin Paneer Selvam<Arunpravin.PaneerSelvam@amd.com>
>>> Suggested-by: Matthew Auld<matthew.auld@intel.com>
>>> Signed-off-by: Sanjay Yadav<sanjay.kumar.yadav@intel.com>
>>> ---
>>>   include/linux/gpu_buddy.h | 122 
>>> +++++++++++++++++++++++++++++++-------
>>>   1 file changed, 102 insertions(+), 20 deletions(-)
>>>
>>> diff --git a/include/linux/gpu_buddy.h b/include/linux/gpu_buddy.h
>>> index 07ac65db6d2e..b06241c78437 100644
>>> --- a/include/linux/gpu_buddy.h
>>> +++ b/include/linux/gpu_buddy.h
>>> @@ -12,11 +12,58 @@
>>>   #include <linux/sched.h>
>>>   #include <linux/rbtree.h>
>>>   +/**
>>> + * GPU_BUDDY_RANGE_ALLOCATION - Allocate within a specific address 
>>> range
>>> + *
>>> + * When set, allocation is restricted to the range [start, end) 
>>> specified
>>> + * in gpu_buddy_alloc_blocks(). Without this flag, start/end are 
>>> ignored
>>> + * and allocation can use any free space.
>>> + */
>>>   #define GPU_BUDDY_RANGE_ALLOCATION        BIT(0)
>>> +
>>> +/**
>>> + * GPU_BUDDY_TOPDOWN_ALLOCATION - Allocate from top of address space
>>> + *
>>> + * Allocate starting from high addresses and working down. Useful for
>>> + * separating different allocation types (e.g., kernel vs userspace)
>>> + * to reduce fragmentation.
>>> + */
>>>   #define GPU_BUDDY_TOPDOWN_ALLOCATION        BIT(1)
>>> +
>>> +/**
>>> + * GPU_BUDDY_CONTIGUOUS_ALLOCATION - Require physically contiguous 
>>> blocks
>>> + *
>>> + * The allocation must be satisfied with a single contiguous block.
>>> + * If the requested size cannot be allocated contiguously, the
>>> + * allocation fails with -ENOSPC.
>>> + */
>>>   #define GPU_BUDDY_CONTIGUOUS_ALLOCATION        BIT(2)
>>> +
>>> +/**
>>> + * GPU_BUDDY_CLEAR_ALLOCATION - Prefer pre-cleared (zeroed) memory
>>> + *
>>> + * Attempt to allocate from the clear tree first. If insufficient 
>>> clear
>>> + * memory is available, falls back to dirty memory. Useful when the
>>> + * caller needs zeroed memory and wants to avoid GPU clear operations.
>>> + */
>>>   #define GPU_BUDDY_CLEAR_ALLOCATION        BIT(3)
>>> +
>>> +/**
>>> + * GPU_BUDDY_CLEARED - Mark returned blocks as cleared
>>> + *
>>> + * Used with gpu_buddy_free_list() to indicate that the memory being
>>> + * freed has been cleared (zeroed). The blocks will be placed in the
>>> + * clear tree for future GPU_BUDDY_CLEAR_ALLOCATION requests.
>>> + */
>>>   #define GPU_BUDDY_CLEARED            BIT(4)
>>> +
>>> +/**
>>> + * GPU_BUDDY_TRIM_DISABLE - Disable automatic block trimming
>>> + *
>>> + * By default, if an allocation is smaller than the allocated block,
>>> + * excess memory is trimmed and returned to the free pool. This flag
>>> + * disables trimming, keeping the full power-of-two block size.
>>> + */
>>>   #define GPU_BUDDY_TRIM_DISABLE            BIT(5)
>>>     enum gpu_buddy_free_tree {
>>> @@ -28,7 +75,27 @@ enum gpu_buddy_free_tree {
>>>   #define for_each_free_tree(tree) \
>>>       for ((tree) = 0; (tree) < GPU_BUDDY_MAX_FREE_TREES; (tree)++)
>>>   +/**
>>> + * struct gpu_buddy_block - Block within a buddy allocator
>>> + *
>>> + * Each block in the buddy allocator is represented by this structure.
>>> + * Blocks are organized in a binary tree where each parent block 
>>> can be
>>> + * split into two children (left and right buddies). The allocator 
>>> manages
>>> + * blocks at various orders (power-of-2 sizes) from chunk_size up 
>>> to the
>>> + * largest contiguous region.
>>> + *
>>> + * @private: Private data owned by the allocator user (e.g., 
>>> driver-specific data)
>>> + * @link: List node for user ownership while block is allocated
>>> + */
>>>   struct gpu_buddy_block {
>>> +/* private: */
>>> +    /*
>>> +     * Header bit layout:
>>> +     * - Bits 63:12: block offset within the address space
>>> +     * - Bits 11:10: state (ALLOCATED, FREE, or SPLIT)
>>> +     * - Bit 9: clear bit (1 if memory is zeroed)
>> I think we should add
>> - Bits 8:9: reserved
> it should be -Bits 8:6: reserved
>>
>> Apart from that, looks good to me.
>> Reviewed-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Thanks Arun for your prompt review, helpful comments, and your time.
>>> +     * - Bits 5:0: order (log2 of size relative to chunk_size)
>>> +     */
>>>   #define GPU_BUDDY_HEADER_OFFSET GENMASK_ULL(63, 12)
>>>   #define GPU_BUDDY_HEADER_STATE  GENMASK_ULL(11, 10)
>>>   #define   GPU_BUDDY_ALLOCATED       (1 << 10)
>>> @@ -43,7 +110,7 @@ struct gpu_buddy_block {
>>>       struct gpu_buddy_block *left;
>>>       struct gpu_buddy_block *right;
>>>       struct gpu_buddy_block *parent;
>>> -
>>> +/* public: */
>>>       void *private; /* owned by creator */
>>>         /*
>>> @@ -53,43 +120,58 @@ struct gpu_buddy_block {
>>>        * gpu_buddy_free* ownership is given back to the mm.
>>>        */
>>>       union {
>>> +/* private: */
>>>           struct rb_node rb;
>>> +/* public: */
>>>           struct list_head link;
>>>       };
>>> -
>>> +/* private: */
>>>       struct list_head tmp_link;
>>>   };
>>>     /* Order-zero must be at least SZ_4K */
>>>   #define GPU_BUDDY_MAX_ORDER (63 - 12)
>>>   -/*
>>> - * Binary Buddy System.
>>> +/**
>>> + * struct gpu_buddy - GPU binary buddy allocator
>>> + *
>>> + * The buddy allocator provides efficient power-of-two memory 
>>> allocation
>>> + * with fast allocation and free operations. It is commonly used 
>>> for GPU
>>> + * memory management where allocations can be split into power-of-two
>>> + * block sizes.
>>>    *
>>> - * Locking should be handled by the user, a simple mutex around
>>> - * gpu_buddy_alloc* and gpu_buddy_free* should suffice.
>>> + * Locking should be handled by the user; a simple mutex around
>>> + * gpu_buddy_alloc_blocks() and 
>>> gpu_buddy_free_block()/gpu_buddy_free_list()
>>> + * should suffice.
>>> + *
>>> + * @n_roots: Number of root blocks in the roots array.
>>> + * @max_order: Maximum block order (log2 of largest block size / 
>>> chunk_size).
>>> + * @chunk_size: Minimum allocation granularity in bytes. Must be at 
>>> least SZ_4K.
>>> + * @size: Total size of the address space managed by this allocator 
>>> in bytes.
>>> + * @avail: Total free space currently available for allocation in 
>>> bytes.
>>> + * @clear_avail: Free space available in the clear tree (zeroed 
>>> memory) in bytes.
>>> + *               This is a subset of @avail.
>>>    */
>>>   struct gpu_buddy {
>>> -    /* Maintain a free list for each order. */
>>> -    struct rb_root **free_trees;
>>> -
>>> +/* private: */
>>>       /*
>>> -     * Maintain explicit binary tree(s) to track the allocation of the
>>> -     * address space. This gives us a simple way of finding a buddy 
>>> block
>>> -     * and performing the potentially recursive merge step when 
>>> freeing a
>>> -     * block.  Nodes are either allocated or free, in which case 
>>> they will
>>> -     * also exist on the respective free list.
>>> +     * Array of red-black trees for free block management.
>>> +     * Indexed as free_trees[clear/dirty][order] where:
>>> +     * - Index 0 (GPU_BUDDY_CLEAR_TREE): blocks with zeroed content
>>> +     * - Index 1 (GPU_BUDDY_DIRTY_TREE): blocks with unknown content
>>> +     * Each tree holds free blocks of the corresponding order.
>>>        */
>>> -    struct gpu_buddy_block **roots;
>>> -
>>> +    struct rb_root **free_trees;
>>>       /*
>>> -     * Anything from here is public, and remains static for the 
>>> lifetime of
>>> -     * the mm. Everything above is considered do-not-touch.
>>> +     * Array of root blocks representing the top-level blocks of the
>>> +     * binary tree(s). Multiple roots exist when the total size is not
>>> +     * a power of two, with each root being the largest power-of-two
>>> +     * that fits in the remaining space.
>>>        */
>>> +    struct gpu_buddy_block **roots;
>>> +/* public: */
>>>       unsigned int n_roots;
>>>       unsigned int max_order;
>>> -
>>> -    /* Must be at least SZ_4K */
>>>       u64 chunk_size;
>>>       u64 size;
>>>       u64 avail;
>>
>
