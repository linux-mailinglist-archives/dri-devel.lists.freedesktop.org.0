Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3EEA91451D
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 10:41:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6622710E3B3;
	Mon, 24 Jun 2024 08:41:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ouA2WPjm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2049.outbound.protection.outlook.com [40.107.93.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7406E10E3B2;
 Mon, 24 Jun 2024 08:41:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LkkNgOIEfhoabUrFuqNUwH5WBdrWnEZxePtE52NAh4QffgS6ti6zRa4fry2UmCl1jHwbv60DPPOryjgy+7ipwWymZBNpS6lNOQJr4YNmkQOfZTqyk62A7+H2pU6y8SaUaRO8PNpSdgXxzvTzT0wogO0eSpknvJGp8dHbnR7bJqArD3ZZ7LkJuSySp0DmuKHd02uqgKomLKn3rNTstS6rdyXHNI4ouW/RPG1OTzPiBFscZPIzTxFIWbzeDdOmlKGkwMF/HapskX/iBp9tSatj+DNtvcybhse/7wkWxjN+Er79yACM/6dX/diPb7hUVl0TyEwtcEtKdvJrP6K4biS9Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m6Lhek+xPWg6VYMZljzxFG2D7bs2blBCdIlWSmX4chA=;
 b=a7r2PqNiLK1moFSwKhGcTfaJYfX4eRJrYUDm4XzReh1VNAVvHRwXE5p9l3VyvXk79qN89SNdl0RhLRY9QbG+tVnG27B7/fI19sOz5RnyAVOFtf9zowip5CmkNmdDmtTIRKqkDXputC2IN3Q2C/5gZ37Bw59YouY+crWITH51lfzk7GWg0dO12d/l6wNPlND55T2+navz9jIowFcZ2DLW+F5U9snxe2gw2OCNFcY4MBaIZxFsMxwfbc5gmSl8vX/slx8bWPugCYv4L3UQT4XkCpRVjHSxor7NJrsXW8DEYOVwYQJvLDOBRcO66+F4UELoLuhYgN83mZenXa1N4ksBPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m6Lhek+xPWg6VYMZljzxFG2D7bs2blBCdIlWSmX4chA=;
 b=ouA2WPjmoGLVwx/vwnjkUTEunsgbDjM/2uaFZXk2saSDr71LuoVEIQTihXPkE0QChzy6ABamui4f/VFPfj/7JYHjK7LEBpbreEnfGyfdARHAB8xYuWwnbXZohrAeecwENkOvUV1AxJj4iI120a5obxNh2rCVnH5klqfnXvDS6LU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA1PR12MB6821.namprd12.prod.outlook.com (2603:10b6:806:25c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.29; Mon, 24 Jun
 2024 08:41:37 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.7698.025; Mon, 24 Jun 2024
 08:41:37 +0000
Message-ID: <4381f5a5-4a9b-49f3-855b-40dbb91b0d95@amd.com>
Date: Mon, 24 Jun 2024 10:41:31 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ttm/pool: Revert to clear-on-alloc to honor
 TTM_TT_FLAG_ZERO_ALLOC
To: Nirmoy Das <nirmoy.das@intel.com>, dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>
References: <20240620160147.29819-1-nirmoy.das@intel.com>
 <98890fd6-43b8-4a08-84e8-1f635abb933d@amd.com>
 <0f3d8391-ba82-434c-8871-85bb17bac6eb@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <0f3d8391-ba82-434c-8871-85bb17bac6eb@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0187.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ca::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA1PR12MB6821:EE_
X-MS-Office365-Filtering-Correlation-Id: 4055bbdf-6651-401d-2d86-08dc942975a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|366013|1800799021;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T00xenUrbDJlK3ZJVEYwSXc2SCtRZWdWQlVRd0IyUEVFL20wWktVVWplSlhW?=
 =?utf-8?B?Q2tjSVArUkFYSnhiSm9ZemdSeC9KV0R6UE4vVFBYUUZ1ZEFEdjVGY2Z2VWxz?=
 =?utf-8?B?MC9jMW1QUHIzWllZbXNZL2Q4YlhFWUI4V1krN1ZGZjQrQkFKVnAvc1g3UzNQ?=
 =?utf-8?B?aGhsQXFReU8wQmpLbkk4MFJrSWJWd3M1dlhiQVZaMWRyOEdnUU9NNkxzRnJw?=
 =?utf-8?B?bXZUQzdicUF3Z1hKTHkydzY5US83ZG9YZjNxdWVkRVRLaGJDU1JSTVNTSHBE?=
 =?utf-8?B?SGZOM2FuNVQwZWd5bGRMblRvVWxaQkIzNytUNVdSRDdDVnVOeFBRTDV3NHR1?=
 =?utf-8?B?MDR6SWFxb1ViZFZVaXlGSnJSanIraW0za3d1V2lIWGhQQm8wcU1Vb2E0N1pJ?=
 =?utf-8?B?dStBcWRhWEhKUGZ3Z09GMUNEU3JQaFd3a1BJb2R3K0FkWXRhQXpFVGJpN05R?=
 =?utf-8?B?R2lweWVtcmNzcVM5RUN0aDZKa3pzWnVLMmhpd3VXY3ExZUlobkJMOWUxeGJt?=
 =?utf-8?B?Qm5GdmgyUTZVK3g5M3FqSEYxS2YyZzBuWmFVcUtUWEx3bjhyS0RqdEoySER1?=
 =?utf-8?B?bWpFUkRRMnpQSkROdGNUZlFDQVN3TkFVR1VldDRvNjhtZnEyT294ZU5rL2tq?=
 =?utf-8?B?RXRvbjEraU9DejA3WGRvWVJLcitrekJtSVp1SVdJNEltYjFTb1plNDhtVHox?=
 =?utf-8?B?Z0hzWkhPNjAzcDRNUktFWm1hTkg0aDMwUkVzM3BoNXI0S0VHTldQSHAyZFp3?=
 =?utf-8?B?S092SzQ2OVA4MGVLQzlkRG8xdmJzdmJhUVQ1cHRObm5HRDhMWWUwQXZRWVZE?=
 =?utf-8?B?NkFJbFB1aUprMkdPZ3BDN2duNGhvTVp5eVgvOFBkbmZTMGVBNWV6Y050ZGtX?=
 =?utf-8?B?SVc2cnNYYmlKYnZKMGtkM3NsVk04bXlSQ3ZJRUh6RW16bklWSFJwTFRhU3Iv?=
 =?utf-8?B?TGVzNnFLcTJQVDFvODFPZGVSeTNqbmdXNjNYcTBMNkNYR1RVVHkwalJsZkVU?=
 =?utf-8?B?eXVyTWFJNjZTTmJwZ1dhRi9XU0dWdGppY3N5RTgweGVxaE9DcDV6enJlL1JR?=
 =?utf-8?B?ZDBvL2FrcmVOVklNNzhNVjBObC9mSVNhVTJPK0FPU1FxS0hOM1dOM1htazdY?=
 =?utf-8?B?RXNSVGVvREJGb0wrMEFUQmhJWjJjU3lRZVdCbWg1UmZmOFFYNWFWcDdvUmJC?=
 =?utf-8?B?TU1DU05hZlZZTWpBeFVmaHlvNlVBQmhHaTBnYUp4TDBIVXlSRG5EK0Z1WU9j?=
 =?utf-8?B?ZnN4RmZHam9kN2h4RGMyMVBGb1JjamxKSzRFUUV6ZjhDcHF1U3RCQlROY2Y2?=
 =?utf-8?B?V2g0L2FjWVV2RmhJdVlSZ0hPN21DVGc0cW5xc25YcEQ4M3hQTEh0aXZCTEI0?=
 =?utf-8?B?Q3QzWDd4OW5hY2htYms3SHJ6RjVUVkhjL0MxbWpyeDZ4ekZjby9PN1BkcC9K?=
 =?utf-8?B?aWpER3lGNDdXRWYzUlRlcE8wTVo4TWlVQzRtR0VTb3pPOEhCZ3cvUEhqNkg3?=
 =?utf-8?B?Umw0USttU1QrT2VhM2dIWWZzcHQwb05DREdaY0tEWGpXYWEvZ2w5Z29iVXRZ?=
 =?utf-8?B?OVNxb1lyQVNGRGF3V3FaM0pmenp2alJiOThpWWxGRFJoU2YvOHVsYWx2S0Yx?=
 =?utf-8?B?aG9zZm1Deis3MGdDTWZZQ0FWZi9WaFdUS2QvaXYyY1p1Sy8zeXpOc09BV0FZ?=
 =?utf-8?B?c01PNkJzdTVQaldSWnV5Q3BJbWxnM1pJV1FjUlZmZVo1WWxja1RYV1duaEVr?=
 =?utf-8?Q?V+F/9LmaK8SL+RO/LDeXe/trXNF1ixLZ40oypNY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(366013)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3NQeEc2VWNlSTR0NDVsUU5Sdi9nSjA0NngyTkxpN0xzN0xhSmVuSnIxd25j?=
 =?utf-8?B?UVVmWnhJbFIxYUVXWlc5d2ZFcGVDYTMzRWlaeFhXd1Qwd1hTR1hLeWpSR3VD?=
 =?utf-8?B?dlBrOUwyWUtWV21xQ2lqWk13K2hINkxtQWxKMGFydy9PR3kvb0tuanlwVzNq?=
 =?utf-8?B?S3MxS01ySjhsR21qZ2U2NlgvekM4ZEJIdFJLdjBYOVdadXB5bHpTengvNDMx?=
 =?utf-8?B?U3lNSDR0ZG8wc2VZcjVIVXVDN3RpdXlOZHJnRFJyZUpWOWxMaEtvb2lkMjl4?=
 =?utf-8?B?NFdBZmQ3YnByYkdFQ3hQUm94eUkzVmd5S1YxMlkyaTcrVEdTR3U1TzB6aU9Q?=
 =?utf-8?B?ejR5ckp5cUxlTXFvby9VWmVqdWloUW1NaU50ZStJQ0lJWFAvZGRRS1JpTFNk?=
 =?utf-8?B?djlqc3RiREZhVGlUZ1l6a1BBcGYwMWRLTkdiczRiNGNGUDVtM1M5QzAzY29u?=
 =?utf-8?B?ZTVrWVI5VE13VzZvTmFQRDQ0cVllbSs4Q2lGSUROYS9odXQ0c29Lc2hkWVo4?=
 =?utf-8?B?STNvNENhVndJUlVlR3VNQnFIdmFWOS90ZlVBT1lxRHh6YmZoUHZUbVczTkdw?=
 =?utf-8?B?NVNibFhPaytEN2ZrRGl5MkxHZnpKUkJYajZ6ZlMvN1dmUXFsbnhCdVh2Vkti?=
 =?utf-8?B?NHNPbU9mYWZURitFb09IVGNwcHpZendwN25JazdHa0NNQlVDL1d3QlhpU1pV?=
 =?utf-8?B?eVk4aXRmb2dpNFhCMWlTeGhFREZ1b2VEZElSTFBueVVocUpsSEp5VHBDMTZx?=
 =?utf-8?B?akZUVGRxSDZWUWkwSUpxVWtRSWJSM05SK0xCUkFEWXZydzIzR3dPVjlLL2p6?=
 =?utf-8?B?VTU5WERBNWNMWjhyeWFnWEM3MlcvR1IvSk5OUjNvcTd2NmQ5djN6REVxaXJE?=
 =?utf-8?B?Nko5ZFpWUHJocEZabmh6US9KUFB4NGs3SmlEd1gwOEcxdkNHVy9tR2dwcFJs?=
 =?utf-8?B?bnpRb2VsT2RrYWJHb3l2OVRNY0pnRTJnUjVIWE5SNk9GN2tPRXRmOEpLRXEx?=
 =?utf-8?B?UGMvTVU5ZFZUK3R6ZllkNnM4dEhHS2FxUlFnR3hyRXQ3UzdqRTBSeDNGcUxo?=
 =?utf-8?B?b2VQQkltWEpNYm1RU1RBZUdiUHlrM1ZiSmhuSHVCQVhJY0V1ZzByNVhWV2JL?=
 =?utf-8?B?RHRmMTVzU3pVUUVZajRVMmFEaTlNRnorMEthNlVyL2dYbllZK005U0Y1Mzlu?=
 =?utf-8?B?bDFxbFlyc3p0clNUSUhpZ0ZGb1pNdGJGNWZPcURLaFVPM2tRbitIV0NEbTJn?=
 =?utf-8?B?ZitYV0Z0WXVPWmV5dUZDb0k5OVpyWjBmK3NhNEhocE5ybXdKaVZhZjFvdlZq?=
 =?utf-8?B?c2c5MnlhaGtlamdjbDdHNzVIeW91bVJsMUhtMlFmK3doaEFReWJZNWd6WlZ4?=
 =?utf-8?B?OXhjUEpSaTZGQ2RKN3ZzY2Y3ZjdENmhweVJEbGxYMkxDTEl6OFVpZmU3UHBE?=
 =?utf-8?B?bWFYYUI4blZudUhjTGVUUnI3RmFIY3J0cm5BeUJOMFFnR2VCTTFZemlTbC8y?=
 =?utf-8?B?ak1HL1pXTThLR0M1dVFXVmZsQmUyUU5WcjdlR0JML05iaHNMUzRhQ0ZycXc5?=
 =?utf-8?B?UFZPSXVBQWFYb2pCOCtSTkJXZ3duVCtVa3RQcnlWN0dJTUFNRGRMK1RlOGlG?=
 =?utf-8?B?M3Vhdk1oZkNBMTRMWmE3MmpRb1hBQjFJL3JMdTh3TjY0U0ZlRHdGNVdNTXY3?=
 =?utf-8?B?ZUlRMk5iOFpFQ0l0L2Q1UzVIajJ5WEl2VnpOZGU1QjdJSzMwRTRPcE5wdTVj?=
 =?utf-8?B?ZEdRMkxSa0V1Y3hCc2dVWUNOeFhRUWdDVXlNSEZaNFZuOWZydS8vdVdBdGc3?=
 =?utf-8?B?dlJSK2JhRmJ4WUtobGdXY28yREQzSlRKdDBqenZEclpqZklNQXhnT3hOaDh5?=
 =?utf-8?B?d2dmV0tYdG5mZmt3MmNSMWhxenNyL1FucUdXQkEwdEhMY0xaU1NFRGgwbUhX?=
 =?utf-8?B?anVUOW1hVFlLY2N2WnJUeldTVjNFWURYYXRGUUpaK1BpRWYzYkJkemVsWjhj?=
 =?utf-8?B?azRFWk5JS1RBWVFnOE8rOGlsNk93OExEc1A5VEM2UTBDbTZzaGJwR2RjYXBs?=
 =?utf-8?B?M0s4eG81Zjk1bDVKbkVsbjJYMDdoNVhJM2tYeVZFYmxLWXNPRzhyWm1VNTJB?=
 =?utf-8?Q?+mDI=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4055bbdf-6651-401d-2d86-08dc942975a1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2024 08:41:36.9231 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9we5kefV+th17Ja6/QRbjLe5FC0rVr+2/RLrxTxezxziIPT69C7L/t7yS0FWjPWW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6821
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

Am 21.06.24 um 17:43 schrieb Nirmoy Das:
> Hi Christian,
>
> On 6/21/2024 4:54 PM, Christian König wrote:
>> Am 20.06.24 um 18:01 schrieb Nirmoy Das:
>>> Currently ttm pool is not honoring TTM_TT_FLAG_ZERO_ALLOC flag and
>>> clearing pages on free. It does help with allocation latency but 
>>> clearing
>>> happens even if drm driver doesn't passes the flag. If clear on free
>>> is needed then a new flag can be added for that purpose.
>>
>> Mhm, thinking more about it that will most likely get push back from 
>> others as well.
>
>
> Agreed, it is diverting a lot from a known behavior.
>
>>
>> How about the attached patch? We just skip clearing pages when the 
>> driver set the ZERO_ALLOC flag again before freeing them.
>>
>> Maybe rename the flag or add a new one for that, but in general that 
>> looks like the option with the least impact.
>
>
> I would prefer a few flag (TTM_TT_FLAG_CLEARED_ALLOC ?) which driver 
> can set before freeing. I can resend the patch if you are
>
> fine with it.


Yeah, please go ahead with that. But probably better name it 
TTM_TT_FLAG_CLEARED_ON_FREE.

Thanks,
Christian.

>
>
> Regards,
>
> Nirmoy
>
>
>>
>> Regards,
>> Christian.
>>
>>>
>>> Cc: Christian Koenig <christian.koenig@amd.com>
>>> Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>>> ---
>>>   drivers/gpu/drm/ttm/ttm_pool.c | 31 +++++++++++++++++--------------
>>>   1 file changed, 17 insertions(+), 14 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c 
>>> b/drivers/gpu/drm/ttm/ttm_pool.c
>>> index 6e1fd6985ffc..cbbd722185ee 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_pool.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
>>> @@ -224,15 +224,6 @@ static void ttm_pool_unmap(struct ttm_pool 
>>> *pool, dma_addr_t dma_addr,
>>>   /* Give pages into a specific pool_type */
>>>   static void ttm_pool_type_give(struct ttm_pool_type *pt, struct 
>>> page *p)
>>>   {
>>> -    unsigned int i, num_pages = 1 << pt->order;
>>> -
>>> -    for (i = 0; i < num_pages; ++i) {
>>> -        if (PageHighMem(p))
>>> -            clear_highpage(p + i);
>>> -        else
>>> -            clear_page(page_address(p + i));
>>> -    }
>>> -
>>>       spin_lock(&pt->lock);
>>>       list_add(&p->lru, &pt->pages);
>>>       spin_unlock(&pt->lock);
>>> @@ -240,15 +231,26 @@ static void ttm_pool_type_give(struct 
>>> ttm_pool_type *pt, struct page *p)
>>>   }
>>>     /* Take pages from a specific pool_type, return NULL when 
>>> nothing available */
>>> -static struct page *ttm_pool_type_take(struct ttm_pool_type *pt)
>>> +static struct page *ttm_pool_type_take(struct ttm_pool_type *pt, 
>>> bool clear)
>>>   {
>>>       struct page *p;
>>>         spin_lock(&pt->lock);
>>>       p = list_first_entry_or_null(&pt->pages, typeof(*p), lru);
>>>       if (p) {
>>> +        unsigned int i, num_pages = 1 << pt->order;
>>> +
>>>           atomic_long_sub(1 << pt->order, &allocated_pages);
>>>           list_del(&p->lru);
>>> +        if (clear) {
>>> +            for (i = 0; i < num_pages; ++i) {
>>> +                if (PageHighMem(p))
>>> +                    clear_highpage(p + i);
>>> +                else
>>> +                    clear_page(page_address(p + i));
>>> +            }
>>> +        }
>>> +
>>>       }
>>>       spin_unlock(&pt->lock);
>>>   @@ -279,7 +281,7 @@ static void ttm_pool_type_fini(struct 
>>> ttm_pool_type *pt)
>>>       list_del(&pt->shrinker_list);
>>>       spin_unlock(&shrinker_lock);
>>>   -    while ((p = ttm_pool_type_take(pt)))
>>> +    while ((p = ttm_pool_type_take(pt, false)))
>>>           ttm_pool_free_page(pt->pool, pt->caching, pt->order, p);
>>>   }
>>>   @@ -330,7 +332,7 @@ static unsigned int ttm_pool_shrink(void)
>>>       list_move_tail(&pt->shrinker_list, &shrinker_list);
>>>       spin_unlock(&shrinker_lock);
>>>   -    p = ttm_pool_type_take(pt);
>>> +    p = ttm_pool_type_take(pt, false);
>>>       if (p) {
>>>           ttm_pool_free_page(pt->pool, pt->caching, pt->order, p);
>>>           num_pages = 1 << pt->order;
>>> @@ -457,10 +459,11 @@ int ttm_pool_alloc(struct ttm_pool *pool, 
>>> struct ttm_tt *tt,
>>>            num_pages;
>>>            order = min_t(unsigned int, order, __fls(num_pages))) {
>>>           struct ttm_pool_type *pt;
>>> +        bool clear = tt->page_flags & TTM_TT_FLAG_ZERO_ALLOC;
>>>             page_caching = tt->caching;
>>>           pt = ttm_pool_select_type(pool, tt->caching, order);
>>> -        p = pt ? ttm_pool_type_take(pt) : NULL;
>>> +        p = pt ? ttm_pool_type_take(pt, clear) : NULL;
>>>           if (p) {
>>>               r = ttm_pool_apply_caching(caching, pages,
>>>                              tt->caching);
>>> @@ -480,7 +483,7 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct 
>>> ttm_tt *tt,
>>>                   if (num_pages < (1 << order))
>>>                       break;
>>>   -                p = ttm_pool_type_take(pt);
>>> +                p = ttm_pool_type_take(pt, clear);
>>>               } while (p);
>>>           }

