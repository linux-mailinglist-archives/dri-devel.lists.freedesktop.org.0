Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5E093BD3F
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2024 09:42:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5B3A10E235;
	Thu, 25 Jul 2024 07:42:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ozKJ20lA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2041.outbound.protection.outlook.com [40.107.243.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E00210E22A;
 Thu, 25 Jul 2024 07:42:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l0lPWXPSMkFCBhWylyqtNns+UFbeI7/NvUgBT+zJ43dr0QYfZ/46hdk6rmYoO733I/hNCmxHf1ONhpmbCkCmDX8S/Aw/H2Ux9YIHDW2DdJN3UTqcwqjqoXcfJ7sg4krQL1J1pv1/vwYNJmQaf8oc0BW3bbu9qc3QJ6LTkOHiyy2gOaVquiptVLDXmoKoCG22DrEixJ0B8HOrnRiZApWMS5+3044XLXJUvAd17xHGxhamuVPN0DvMA6G3IE39BoFh1rwfav2/3VahuZZ5xTgk/FSOfnnv2radnhaFFZ5wxLRhnWr7D7luQboyrH7m51WpdZbzlnHGNSwJxg9HXY6Stg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Xw0NmlyQEL5J2cxCCAIskJFG1VXQuXJEivd5KoS7R4=;
 b=PGsXvGsKNyuNdVlg1RmiG/Vb1T2biGUyI8FSXCM0ByWqstWlKce1+GWIAtkLGw/afqpj+53VuoQUZ4z0PhNYYXC74iQsnvMrfderisVBybL0AfPH1FR1nTvKmvPABtpESXC0Ex0LET29RlgsyL7LrBvRFztwkJoab9u+vj7I9F7Fhvj4S9qdgaHPTjDSDN5ga2fhDD5RIEYO0vAYJcLX+6YpGYEeqkUkOQpW3eB5FNnPvh4XPO+C0tO7SBWFtwX809cCJsTxRJ2xRN2rBi2rB1NmN2b4NVjJItYXfPknSNawtJ7UAK9OQ4rO7Z0GYgv4ZKJpazE+IBmePqOrxaLN7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Xw0NmlyQEL5J2cxCCAIskJFG1VXQuXJEivd5KoS7R4=;
 b=ozKJ20lARwXgfdSdDW0GTRVa4SfcFy/90NTxrAZEi34YddjvjPDMDw3PHQl7yMcGLXus3kD4h5ZUog8j/szgeyrhAtKX9ArKFaZ9rndF9fyH6Nu883RHcRn69uX0k7zHOyFSAAlQAWio/X5DEoOrpSlT0PwwjubqDVZtAyIBYG4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB7161.namprd12.prod.outlook.com (2603:10b6:510:200::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.18; Thu, 25 Jul
 2024 07:42:13 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7784.017; Thu, 25 Jul 2024
 07:42:13 +0000
Message-ID: <b3efa6b1-1078-4b1c-bdaf-d8774b0d798b@amd.com>
Date: Thu, 25 Jul 2024 09:42:08 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Only start TDR in drm_sched_job_begin on first
 job
To: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, ltuikov89@gmail.com, daniel@ffwll.ch,
 felix.kuehling@amd.com
References: <20240724234417.1912357-1-matthew.brost@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240724234417.1912357-1-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0147.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::11) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB7161:EE_
X-MS-Office365-Filtering-Correlation-Id: dfdf3a48-879f-4db9-015c-08dcac7d4c9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TXVldEhaQlJnZEkyY2xnbWl6bURhalp6alcxSFhNb2p4VmI5MTB2cGNKTzV1?=
 =?utf-8?B?L3p2SkpaTEpVMUEvWFBIRzExSVNLVEw2ajNmRERJdFF6VWRMMDZRNEx3OTR3?=
 =?utf-8?B?aUV2ZEVxeWpVQ3hUbnAwTDNibU5BdzFzQng0U2t6M29jTzFhd2ZmUkJTSzdK?=
 =?utf-8?B?NTc2WEV2RDRPZjlhQm8rM29jcjFSUEJ2VWp5aWVxbEVHVzZVaGRnTGh0SDJZ?=
 =?utf-8?B?eExSZDBKbExhVXpieFNDd1h6MHBvb3VETmQ1OFNQbmtNZlpPSlNwcnZvb2Zk?=
 =?utf-8?B?K2gzYTlJRXFlUFd3ckVHek9pMmR0dWxHaTR4cnhlMVREOXpSZEtuR0Fzd2xp?=
 =?utf-8?B?OTI3TC9VdHR5a2E0cTZXU2dDR3ZrWm9OTHM5ZTFkRlUvTVNwK3R1ZFBoU29v?=
 =?utf-8?B?Mk0rM0VBdHVBN3NQeDR2Z0w4SVl6TkJjYTZ1bnJHcFJyUytndlhEelBRL0JQ?=
 =?utf-8?B?U1o3NlRjZmljU0Z2YXV3YjNtZWV0cUg4TFNjVlJQenB1TmJIdmtpVEZ3OU9I?=
 =?utf-8?B?SUIrK01XREs0M1NoRFNwS3NBMzZOcFoxNEtUWVV3ejlTSWFwMTh4VGFUVHZh?=
 =?utf-8?B?VjQ5R2REUUJtL0tDdXdGRDhUc0lweUpyMXREVzhTNWx5MzR1S3lDOVMwMXJF?=
 =?utf-8?B?Y092WG1lQktROU5QWmtFeXhCQ29rWXpMVmlkMHlqREp6ZWozVkxaS3drcE1R?=
 =?utf-8?B?RWtDcUkvR3ZaeHNQZHlYMnlUQ2pyY0JTVDcvSzZnZlV4UTNQVmlseVB6ck5q?=
 =?utf-8?B?dWt3QjV1dGkrWVN4dkRtc0JqMkZWSHRRdlBrd1d5b251Y0N3dFJvTExqVnhK?=
 =?utf-8?B?Q3NKd3NIYWcwTzRxOHVUd2cwWlVMdjZSU3BnLzRtYUI4VDlXZHI5UDhIYWVH?=
 =?utf-8?B?RGVvQVl1Z1ZsOTcyNmNTYjRGdmRpMEE2Y2ZNQ3JMWjFqZ1UyeUtrQlBNY0VR?=
 =?utf-8?B?UzFqdFp0c21YTThFbFpXcFdDTWR5MVk5bW5xclZwSkNlRjBPTGtZSy9KeHM3?=
 =?utf-8?B?TDJuTXEwcTNvaURYdTBJaG5DVjFnYWRKVUo3UUNUanRCakJYcGNFdnljcm5s?=
 =?utf-8?B?U1FyZkdXNWREUGhjbWdzMUhwamljc0xwNmRxWFQzc3pKZ3NIcTB0NVNTTlN0?=
 =?utf-8?B?RjhwU3Qxc2hIbnV3aHhvc0YrTHF3RCs1dlY1MVlOQ2d5aTJEUlA1L0MzNS9j?=
 =?utf-8?B?d2tsOFJEV1p5dllaMm10VlZTZ1RwUGRpQ09rbHowMHZCMnU5QldkbENYRkQ3?=
 =?utf-8?B?RzY4cERuWHpFSzZBRXR6TVBQRUdMT3UrbnNoQlR2TzFsQ08vbW1kcDBmTEtP?=
 =?utf-8?B?T1hVVGQvZ01reTh4VDdCQXErajVUTzlmWjNUSVFZcEt3QUJxVm1SUTE3eTI1?=
 =?utf-8?B?VnhSOXlFREpockFkbmFuU0NYVkZ1aHZiaWIzRVV2N1JoVEEzL3ExamtHTmov?=
 =?utf-8?B?U09jZ2xoeGI4UWtkWWVuUVJvMWhuODlERjdhaHhnZXpzdURZMmZpUTN6N1c4?=
 =?utf-8?B?NmZ1eEI0bkx0MnJZdjBXWDFBNDdsSWtJeFFkUDQ0b1RQY0F6bzY3Vjk3eDM4?=
 =?utf-8?B?NDlyQ2FCSHYwUkd1YjZzWWkwL245YklGY0p0R1lySURrUjNNcSs3Z3VyRWph?=
 =?utf-8?B?blJyWTIvcm05K05DTWY2aU5ua0Qvbm1oaE9qUVdUK2Q3d25iNXc5YnEzSGZL?=
 =?utf-8?B?c1JHd2tzOWRXUDVub2tYMkY2ZXJ4QkFhN0VSMU9MZ2g4QjEwT2I0WnhyRVc0?=
 =?utf-8?B?UEN0RWk5TkVBTmxkYTJNRTF3NGw0eHd3NFdkekR1VksxeE9aNW05T0tIK3VD?=
 =?utf-8?B?RDdPSEp5a0dkQ0lRdmpaQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cGpOS1FFemFiMlV5NnVuOVBDZ2dBSmw5WWgxVXFlbm5IWG1UemZZUGp4S2hX?=
 =?utf-8?B?RE1Wb0gydUNWdlErd2w1T1MxOWpjQWdQcmtZM09neVNBZzZBb1dtZ3pXQjdj?=
 =?utf-8?B?S25UcUtLNk9ZeDg5K1pVZG5YQ1VJSVBRWjhxaXBmeXVBM0hnempmWFpOVWZS?=
 =?utf-8?B?UzFaZ0ZWbzJTSGZndHlScUV2MTdTeDNrV2NCRi85OXI1SU9SRlJUVjExTDVz?=
 =?utf-8?B?NUNvWHJVdFV5YXJrclNadExPYUZ4Vk5nWXgyTlVOZy9xSnUrdzZkdi9maURa?=
 =?utf-8?B?c1VMZXptcVFrSHp1YmZmOTNqV1pIUGxsa045VEtJNkxETU5DVkZHSEVzNm1B?=
 =?utf-8?B?eEh0OUlIOFJCMjJtbTd3Rzd1NS8yekcwNDY2eitoM2ZjMHduV2JBOGV1K3ZT?=
 =?utf-8?B?aDluVGhWazgrQm5rcy9GMVZKVG9PQ3g1bnJVSFZmVEk3bXFzcHdaRDArYUlH?=
 =?utf-8?B?c2tvaWtJcnE1cTdKbnNJWU9KMWFZWEg5V1c4VFVJUzlyYUczUlFIL2JxeUtX?=
 =?utf-8?B?WUNteXorV1hkei9tQjQzbEZNMDROWWdkZXpoU0NKTkEvWEtRd3ZrTmlMUG9k?=
 =?utf-8?B?Q09LRFdyMzljbnRMTU1wd01zQWhaKzNSczlqVHcxZXNrQWc2S0N4S1pTQWNR?=
 =?utf-8?B?M2VPMnV1eWFKUXVscExZUzFIZkx6Qk9weG55eHpCSFRjeXpyNExsUk02akFt?=
 =?utf-8?B?VE5wanJaS2JJZDErOU1pNGc5a2lpckhWVXRBTlRLRHJlN1hUK3laOTkrWHZE?=
 =?utf-8?B?V3N5TzZGczRNbU5IVXFqb1p1eHdqeWpGc3FSUkZEK0NWVk9wRy9BRktpbjd4?=
 =?utf-8?B?YXRqTzc0VUhjY3RLQXdWcGpkSnFaMXlObFVDSjRRV2R4MS9ZV3d2UEkvQXQz?=
 =?utf-8?B?WFBOVUF2RWhhOVFHbUpnZ0w4UmphbFArZENWTHowOUN6NWZZVStPSnR1ei81?=
 =?utf-8?B?azdiNlVFVFVhYzhSeFp4aWJjRFl0V3lHakRJRk1FTmVLRFFNSk8wK0NLMTdT?=
 =?utf-8?B?THJnbjRZczYrbklrTEtWZVBsL3hBRlRXRHFzc3JEWE93RnNPTXdYRnBXWGhY?=
 =?utf-8?B?ckg2MWFEZE1GMmg3TDRuaVlJbnRQRnRZcVZEWWdSYUU5QWlsNC91MnhsRHV6?=
 =?utf-8?B?MUpWRnVmMytUaUtLRWNDVXJqK1FsUXB3R3ZhUTYwUkZhMTdrODAvY2pVb1h0?=
 =?utf-8?B?YVQ1a3YxUHdBM080cGQ1TDZOblowUEN0Vjg4ditDVXhLd2o3UlZOTUtXNFI4?=
 =?utf-8?B?RXBkVnVqeHo2L2FNdWV0ellQazd2YkcyMmc4RXpVWThLRzlqNTNKanExY05Z?=
 =?utf-8?B?a3MyK29CalZmWVYweGlPVFpXZDROQnUvdnBhQ2NScEJJYmdvUEF1WlZ0UnVo?=
 =?utf-8?B?ZjA3d0tSZTlNT3VKUmxmUUJseDFJdStMMUQ5bUxTb3BFeWUxR1FZeXNVa3Vh?=
 =?utf-8?B?N3pHcGJRRGJpV2IxeEdJNHNQeEpTUkpXWUJoZXdqYVVvNXFYajNDdE4yLzly?=
 =?utf-8?B?T0hudkRXS3ltY3ZWSjZLSk0yeG1KTlhDVUxPeE1GeXpJUXBncnNsY0ZHNXRn?=
 =?utf-8?B?R3NzUzY5QzVER3FWaEgyRmh5bEcyeDhvZTluS05YNlp6NDhzTEZaK1ZlOExY?=
 =?utf-8?B?S2ptOVJnZ2lQQStxVWh5d0JTZHVBZ1dMWnpWbEE4Qnd5NXFTZ1pvcTE0V3ky?=
 =?utf-8?B?WC9iMnYzUE11ZVB6T0taV3FRL2Y2TzYvK1M4RGRLMGJjZnVuL0ZmSXBaT3Ur?=
 =?utf-8?B?M3YvdWtNTDYzUWRDbExyWWZod3R4NG1JNDlybnZ4WnJ1ekl2K0JraUlZUUVs?=
 =?utf-8?B?MzV3UjAyUVZQUVlnSU45OEtpN0Z3SWJaQmRzOEFvem9ab2hMYit5Q29WamtL?=
 =?utf-8?B?dnp5K0VpcURCbE0zSitRb2d1TUxzbzBUVE5uT3dPd29lbzNkbW9LSktWWjNt?=
 =?utf-8?B?d1NHVVdGQUpVR05mT3J3WE55RGNGOGQzN1dNc2tBR2drTVFieG1LNTRsTmtw?=
 =?utf-8?B?enZZRjliUEpHdElseTlXNUhySW9MT2Z5QmJiY084c3haZUdFZ3ZRTXpTbVBQ?=
 =?utf-8?B?NlRiREJ5cGV6eUoxaDhTVUpzeFo5MFRIN0p4SHZETllheUd5OEl1NlRLa1Jr?=
 =?utf-8?Q?0pkg12ag/+zbHerg5DdBS4m3r?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfdf3a48-879f-4db9-015c-08dcac7d4c9d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2024 07:42:13.8765 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K/jerZ5ARYt1XrJ30o9hCA0S4FGoCFDueVqsraqqJwQifANSUb5gIS3xW3P/vZLU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7161
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

Am 25.07.24 um 01:44 schrieb Matthew Brost:
> Only start in drm_sched_job_begin on first job being added to the
> pending list as if pending list non-empty the TDR has already been
> started. It is problematic to restart the TDR as it will extend TDR
> period for an already running job, potentially leading to dma-fence
> signaling for a very long period of with continous stream of jobs.

Mhm, that should be unnecessary. drm_sched_start_timeout() should only 
start the timeout, but never re-start it.

Could be that this isn't working properly.

Regards,
Christian.

>
> Cc: Christian König <christian.koenig@amd.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/scheduler/sched_main.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 7e90c9f95611..feeeb9dbeb86 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -540,7 +540,8 @@ static void drm_sched_job_begin(struct drm_sched_job *s_job)
>   
>   	spin_lock(&sched->job_list_lock);
>   	list_add_tail(&s_job->list, &sched->pending_list);
> -	drm_sched_start_timeout(sched);
> +	if (list_is_singular(&sched->pending_list))
> +		drm_sched_start_timeout(sched);
>   	spin_unlock(&sched->job_list_lock);
>   }
>   

