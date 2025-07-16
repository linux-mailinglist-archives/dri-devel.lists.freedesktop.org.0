Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C312B074E4
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 13:37:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62C9710E7AA;
	Wed, 16 Jul 2025 11:37:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="aUGmNujy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062.outbound.protection.outlook.com [40.107.243.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F312410E79A;
 Wed, 16 Jul 2025 11:37:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uYEPRhQFufpNbn675TONMJyy3x00/aL+f4GYauI6O40XsWmauN9o2ye95HzVeyIU+5jsRqU0xDcF6/XqKJI2/sMn4dzdmJzbXQ+L8y9NbWW0rMLzebX3qh1/tmL/FA7p5RE3ySzF1I1Ft35Fa6vIG4azf4P3Shk72NdcQD3GiMGx4s8JJ45DqH+h0ZwSKMH92bw9T4xEPQrADtC39Dri/FilY8Q4ptOFlDBrHiS+EAXB8/KdyeayjvJlam63NTmEEWETmuX17JR2n8JIEq8FSKOYxDh/P6XmWWxRUhJhGP3vnDXkbFwZ9H9oQ9xQCXG+xNii/vNg8uS1njuID57vTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yfBhqRXv7zIX3Qoi2qEP5O3ojvUOf/rPBD+rcAHxhcM=;
 b=N/xESfvnvjy9tvm+iwHW93uwjexXGFd4qnG1b+uSUS/G+EfIkdiOVkOFSzZLmlwxXwU8kwHX5BQlhlPyUw5m+6mWyUTdyB/T4ROAx0NvzhPCP1AZyFyrGlma80Zy52PyT69piKMJp7N9eACvIyq+jTvPoBK7MklEEPTCFNDoEQfcQl/JGzSXNzOWbupOlohkXsnJ95nFqyzqMwSjh1R3boO4EzSOjUYA8wV3WsmxU1eD2/av14XaRW5BVabpRId6tJv2E9pYUULtfb6F7WQ9/eq2gpAeth7Z+QySqtyu9ntHNB4j9Pm/VsBjekLS3PpriuuloCitbVUk7wfWYcnAQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yfBhqRXv7zIX3Qoi2qEP5O3ojvUOf/rPBD+rcAHxhcM=;
 b=aUGmNujyQkWbLuzFZLYDO+frffn8stHaYiJaNlPT4r9uENKEXsErBi4oEdH/kHkPnqc1XZaslqTpS7ZO0pk0TIeBr5TOyAg5tHJmyZXoAKCHPGPchbL5IEtORqd56ltbHfOxJ4UMSdmK8Ik8yN0Qx8Od7GVQ4c1YJmQSUvMZ2Y8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7301.namprd12.prod.outlook.com (2603:10b6:510:222::12)
 by SJ0PR12MB6989.namprd12.prod.outlook.com (2603:10b6:a03:448::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.24; Wed, 16 Jul
 2025 11:37:40 +0000
Received: from PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::a929:e8eb:ef22:6350]) by PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::a929:e8eb:ef22:6350%4]) with mapi id 15.20.8901.033; Wed, 16 Jul 2025
 11:37:39 +0000
Message-ID: <30093f2a-adcd-41eb-b15c-236dcdbcb936@amd.com>
Date: Wed, 16 Jul 2025 17:07:32 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] drm/amdgpu: Reset the clear flag in buddy during
 resume
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, matthew.brost@intel.com, airlied@gmail.com
Cc: alexander.deucher@amd.com, stable@vger.kernel.org
References: <20250716075125.240637-1-Arunpravin.PaneerSelvam@amd.com>
 <20250716075125.240637-2-Arunpravin.PaneerSelvam@amd.com>
 <05a2b3f0-2166-47cd-9964-53254e4df6ba@amd.com>
 <9e9be088-fca0-4f31-bfa9-5201f46e1d12@amd.com>
 <1d5875f8-987a-4524-966f-cbb4ef72fd2a@amd.com>
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <1d5875f8-987a-4524-966f-cbb4ef72fd2a@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PEPF0000017A.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c04::45) To PH8PR12MB7301.namprd12.prod.outlook.com
 (2603:10b6:510:222::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7301:EE_|SJ0PR12MB6989:EE_
X-MS-Office365-Filtering-Correlation-Id: 0204887c-8539-453f-9a23-08ddc45d2b47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SnRVcjhxZ0o1bUZnVHpIN2ZKemRLRDl5QjIvUEoxQ1laVlltWG8veVpaYXl5?=
 =?utf-8?B?bmhDdVBPei9YM1lBanhTNEt2MXJPZStBaStvclhWczRmMDFXR2lvR24vUFdT?=
 =?utf-8?B?MVB4YVRITVVIWTFVaXFva0txY0gxYi95TjZqZTllUi9yazlXaDd3MHk3YkJo?=
 =?utf-8?B?MFBLenFjcGRWUzlHU0RwSzRJWkpKRWVwa1pIZWY2NUlhZHZxWTZMN0FpMUMz?=
 =?utf-8?B?eTQ3OVVEN3RhcHJJN3ZwVlFEaGo4QUZLR29WREUxRDVOKzBuQWdKQnNnTFRW?=
 =?utf-8?B?Z1pnWFd2Mnpmd3ZyZjA5VU1tUHlmcHl4LzNGejZMYUdKSEErODE0WXgyN3F0?=
 =?utf-8?B?dEFwR0pEdlRadlVaTEt0Zm1nZzdOUEhEM1ZVdGNTTzZBdWxIWUZPU21LOHpB?=
 =?utf-8?B?Q2xsaE51VDVRM0crWXhEVWhMdlcycVVReHpGSnBtbFYyQVJBRWpuMEF5Uk9u?=
 =?utf-8?B?NnBUL05SbHo5T1BSYU5QcnpsRDdrcTE5d1Y4cFFrSW9BZDZkWUYrc0JOQXhw?=
 =?utf-8?B?OWMvVDE4R21YeTN3c1VHQkFVMlBmd1paQUVRYTlFMW5TbFFEaW9uSld6ODE3?=
 =?utf-8?B?V2xkdmw0VFJjNmZsdE5SdGwydWx0emNHTUNQZVV4MFZlYkpEclhVcXJPMHB3?=
 =?utf-8?B?bzVqeDFLR2Qwd0RnY005MnByblZOdk5KN2JCUzNpQk1qMDFGZHJXVUhaZmRp?=
 =?utf-8?B?M1ZKK0lHeVIwT3RCMFN2eUxJVm5Cc2lneXVSZmpjZE9Qam1vQSt3S2ttc0xJ?=
 =?utf-8?B?ai8yeWVvenhzSkZsUlRxeDlUWnIrWDBoeThPY2wzMTBHTllSbXU3SU05Zk1a?=
 =?utf-8?B?Vi9nbERlTTJYeWU0WWNUaVgvMWkvNFlOajdoVzdFQi91MEpucGpCcFNDczJ1?=
 =?utf-8?B?R2VPcGxZazdkMVY4QUwyc1hVbEVjOEh6N3BQVWVub1gwWURaR0JCYXc3TFRt?=
 =?utf-8?B?Qm1jd1l0UFdHdEo4U3RGVmpCMnBXWXg5VzNvVGd2di95Snl1bWNJOTZVa0Ez?=
 =?utf-8?B?MWY4bXJDTmVieUhiWitWQVc4bERBZFp1bmhnMVZ5dE9TS3BIUFlSQUQxN0xl?=
 =?utf-8?B?M1JLNk5LUkxOaTVGdEVudEVxN2gxbEFKNDh3czQ0Q08yUTJLQkhObFB2bTh1?=
 =?utf-8?B?SEZLUHE4ODJGWGJSeGtJcTEwVEJzMEpvM21rQXpURjlOdS9CeTVPdkNBaVM3?=
 =?utf-8?B?K1RvMS9uYk02SExZcmFlWFRtajBBT0tVNFcrbDk5b0MrU0pIZjRJSGIwa2JJ?=
 =?utf-8?B?bmhpOUtEMEMreC9aZk5xdWo1UHZjTHh2dFpiVXQ5TStUUEFSY3BlYkR5SVNE?=
 =?utf-8?B?RzRES3dFbGN4bXZhMkJvdHI2Y0RhdXJOdG5Ba2xFNEptYXM3UzQ4SVJ2ZDhW?=
 =?utf-8?B?NUdXemNzTk1oMEo0VzhaeStRaVh6WEgvWUtrcXM4b1NsWGFlekRHUnNKNWM2?=
 =?utf-8?B?cXJBa2FvbnBnWHM4WlExSkVwSm1qcWhFMERISU5EYloxMVlrelh5NmY3WUlO?=
 =?utf-8?B?T2hRMEcwb3RYd3kzRTdJUUNwVkFhRTNTNW8vUVN1Vkp0ekY1b1dkVW9HUDd3?=
 =?utf-8?B?UUdEWVhBb2RXVytnZ3QwNFQxa1BjM21qSWZXRlRTUkxmL093eEtjUytGb1VZ?=
 =?utf-8?B?L3dicGNWREJyaUI5anprbHZNMk5XSm5reTZ3OVo5QUFqSVY0WktuenIwaEF0?=
 =?utf-8?B?cklEbnE2OVkzdlBERXJRL25xVkNrOXlVQmcybHZzdUhBSCt0anpkS0graGJV?=
 =?utf-8?B?WHBaZWNNOXkrSE5KSWdkYUE4QzkvcmgxSG9oLzlrck1NampCWEZBUm5UblJV?=
 =?utf-8?Q?cYHjAJfF3CLJSQhwm7DwkO7C6aHDZZT5jTk+c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7301.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vk12N2tOQTA0ZEVYcWVkcWJVMEhDSG1RNlBlZ2RsNzBEcXVoR0VGK3NsdEp6?=
 =?utf-8?B?SUhhcDJBMEs0UzRDWVplenBhRDZsR1N2ZEZjMWNLOFo4SFg3YVZWZE03MVkr?=
 =?utf-8?B?T2FRdmZJKzdNTStSTDhjNS9YQktRUzdsL2NUV2RnZjdaQlRqemQ2NEhHSkpY?=
 =?utf-8?B?QTg4VFNYb2FvVzdUY3FLUlFjT0hLNzZyR1JGcUY3Qit3c3dtZkcvM3M2RWtM?=
 =?utf-8?B?NkpwanEya0l0djQya0x4QnFoUWtNcjF0aTRsYU1MZ2I4aXRDWXgyd3p5U1pu?=
 =?utf-8?B?am9TdktqdmFvT2twblkyRXJHb08wbkpiWnYwQjNhMXo0L1QycHFRZlhkTmli?=
 =?utf-8?B?bzFoUGhlTUY2YmNVdER3a3lqbjJUZ2VGTzFlaHgxYlAwZFVLcjRMUjlpMEFU?=
 =?utf-8?B?WXE4ejJ5SXVCUUxQRmpEdk5XRXRiNlVKZlNOMzV2Q254V1ZENk5ZdGlEL3p6?=
 =?utf-8?B?SDZkYkpzaDEzNkNoM0RUOGg3citQZnAvbzV4TW9oNE5wN0lKYTNVY1Vlbkdi?=
 =?utf-8?B?ay9DZjNrNlNXanFOaDVuUUorWlNjSkMzQVlRMTZ3eG1WZVpLQmp1V3Q1dFl1?=
 =?utf-8?B?NUlPN2FYUVdkSHkrNUo5aEdQLzd6RlVjQS9EcVBGclIySVd2dE9iU1RxWlZp?=
 =?utf-8?B?SDdUTHN1ZnNCZHZjdzlPbi8xdFBSc0ZSZllFYXpYNFFLenBhMWFrc21mbHdX?=
 =?utf-8?B?dGtPaEJNRUNnRWh3MzlFK1gzZFRjcGVVR0s5TFdBM2YyTDNiaVhiMDEyOUtt?=
 =?utf-8?B?K29JYjhBRWJpVkNpSUw5WS9SUC8waFZidEk3a3QwTVNEd3Q5UEJXSjByMjRG?=
 =?utf-8?B?RHZaeUx0cng0K0l3blBqRHJ2M3dmWVZSYXE5Z2xBM2dLUEkvMWlCbjNDQ3NP?=
 =?utf-8?B?NEN2emdqVGJRaUJxSzdCdW9kWmJJMWhuOGZ2MHZtK2t4cTNOb1FRdGtNQjZM?=
 =?utf-8?B?SHVERXlMK2tkbnphbjZFczBMV1FjNHcrbkJ3Rm1lWWdsWit5QnpSSm9PcGZS?=
 =?utf-8?B?aVl4Y1BYblRrcVpGYWpaUUc5T3QxUE1MU3pNUHlOTzYydGFjbnEyQ2dXU0ps?=
 =?utf-8?B?N1JkMjE1aEtTNkZjQWVNdW11Nk5NY3k1RW01bEZOMUNRTXdkK2VtdDJFU3px?=
 =?utf-8?B?VE5PR2NTNkxJVU5SVG1QN3luUHVybmhqc29kVXRnSXR1clQrVGlFNThmWEkr?=
 =?utf-8?B?UjEvQVEwNDBqSUN4L09EWUptcW1UVkVnQVZBekMrUVlvamJERU9ianJsWHRm?=
 =?utf-8?B?SWNnaVIzV2NYQXBpNnVyNXBUdElKM1pPaWVJa0FuY3NVUkNXZ2dRVGIvNDVq?=
 =?utf-8?B?TE5iUkN2MHJIQ2FKR01DMFBtRmVXTlpmaitYV0NQSEpDL3lvenNSTmppNGZJ?=
 =?utf-8?B?VFRGQzFuR3lqUzE5UUJQeGF0MW56Zi85c1JBdzF3OFZERmI0VklETXZjVFla?=
 =?utf-8?B?UmxwcTN1a1RESnNSRFF6bk1pc3BiSkZvRi9kR3ZmTVUzY2VjRWlsRkhKYmVh?=
 =?utf-8?B?NlVVNGxMN0RKNFg0QmQvL0hMR1VlRTBUS3RQd0RFVWplK2dyc3JxS3BCMlNE?=
 =?utf-8?B?VjFaRlNSK3JrRmk0bjhvbDB0cy9QUVNiUHNQeEdCaEJneUhDS1dXaXcvck5K?=
 =?utf-8?B?SjJ4em5MZVErMnFqTXpNVzdMUHAwQ3NTQXByb3pEbUNPZnlBc21kQ1MwNGFF?=
 =?utf-8?B?V0haaWNveEh3RWlIdng4bjVHbHRLbi81RlNKNXlBMTRWVHNDQ2dYajBPOURX?=
 =?utf-8?B?ZUcyVVh2d0lRQmJXSHVWeWFNY2M1c2svQVhVMFBIdDdxOXhVd1VJYWV4N3FX?=
 =?utf-8?B?VlNiYUNYRThCVWFialBhaHZYdWtGOHR4Y09WbnEydjZHK1FCcnZmc3pEVjAw?=
 =?utf-8?B?MG5RcWdTZXJXNHo4bUgzeldFUkRNYkZaUndaUDBINmdmekJhYXd4dy9CNk1y?=
 =?utf-8?B?emNoVXJsWVp3T25yN1lKQ3dzV3JUZlFuM3JJcno0VFdNcXB4QUs3Vi9Mejk0?=
 =?utf-8?B?akVhdE5EY29TVUtNcnhGSXM5R0dHQWtxZ1NNc0Q5akFhNXlwUGdiQi9CRVll?=
 =?utf-8?B?YUdlS2xBeGFqcHg2R3BjS041Qk9xbkhuSVlPQjlWbU5IU09mN0U2Sk9xbVlO?=
 =?utf-8?Q?4BWb4Y670CXGUP++Ri8ZB36ag?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0204887c-8539-453f-9a23-08ddc45d2b47
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7301.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 11:37:39.7184 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MPfk3QWcenRpwq1q+4IQ+Lw/vCf0741KiPaQ452wOqdnPv7iiw2BnK+7qg1THq1atxWTX7D1HhHjJPUZPudJ9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6989
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


On 7/16/2025 4:31 PM, Christian König wrote:
> On 16.07.25 12:47, Christian König wrote:
>> On 16.07.25 12:28, Arunpravin Paneer Selvam wrote:
>>> Hi Dave,
>>>
>>> I am trying to push this series into drm-misc-fixes, but I get the below error when dim push-branch drm-misc-fixes.
>>>
>>> dim:ERROR:e24c180b4300("drm/amdgpu:Reset the clear flag in buddy during resume"): Mandatory Maintainer Acked-by missing., aborting
>>>
>>> Looks like maintainers Acked-by is required to push the patches into drm-misc-fixes ?
>> Strange, it should work with my Acked-by. Let me give it a try.
> I successfully pushed the patch to drm-misc-fixes.
>
> No idea why that didn't worked for you. Maybe update your dim script Arun.

Thanks Christian, I will check the dim script.

Regards,

Arun.

>
> Regards,
> Christian.
>
>> Regards,
>> Christian.
>>
>>> Regards,
>>>
>>> Arun.
>>>
>>> On 7/16/2025 1:21 PM, Arunpravin Paneer Selvam wrote:
>>>> - Added a handler in DRM buddy manager to reset the cleared
>>>>     flag for the blocks in the freelist.
>>>>
>>>> - This is necessary because, upon resuming, the VRAM becomes
>>>>     cluttered with BIOS data, yet the VRAM backend manager
>>>>     believes that everything has been cleared.
>>>>
>>>> v2:
>>>>     - Add lock before accessing drm_buddy_clear_reset_blocks()(Matthew Auld)
>>>>     - Force merge the two dirty blocks.(Matthew Auld)
>>>>     - Add a new unit test case for this issue.(Matthew Auld)
>>>>     - Having this function being able to flip the state either way would be
>>>>       good. (Matthew Brost)
>>>>
>>>> v3(Matthew Auld):
>>>>     - Do merge step first to avoid the use of extra reset flag.
>>>>
>>>> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
>>>> Suggested-by: Christian König <christian.koenig@amd.com>
>>>> Acked-by: Christian König <christian.koenig@amd.com>
>>>> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>>>> Cc: stable@vger.kernel.org
>>>> Fixes: a68c7eaa7a8f ("drm/amdgpu: Enable clear page functionality")
>>>> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3812
>>>> ---
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_device.c   |  2 +
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h      |  1 +
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 17 ++++++++
>>>>    drivers/gpu/drm/drm_buddy.c                  | 43 ++++++++++++++++++++
>>>>    include/drm/drm_buddy.h                      |  2 +
>>>>    5 files changed, 65 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>> index 723ab95d8c48..ac92220f9fc3 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>> @@ -5327,6 +5327,8 @@ int amdgpu_device_resume(struct drm_device *dev, bool notify_clients)
>>>>            dev->dev->power.disable_depth--;
>>>>    #endif
>>>>        }
>>>> +
>>>> +    amdgpu_vram_mgr_clear_reset_blocks(adev);
>>>>        adev->in_suspend = false;
>>>>          if (amdgpu_acpi_smart_shift_update(dev, AMDGPU_SS_DEV_D0))
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>>>> index 215c198e4aff..2309df3f68a9 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>>>> @@ -155,6 +155,7 @@ int amdgpu_vram_mgr_reserve_range(struct amdgpu_vram_mgr *mgr,
>>>>                      uint64_t start, uint64_t size);
>>>>    int amdgpu_vram_mgr_query_page_status(struct amdgpu_vram_mgr *mgr,
>>>>                          uint64_t start);
>>>> +void amdgpu_vram_mgr_clear_reset_blocks(struct amdgpu_device *adev);
>>>>      bool amdgpu_res_cpu_visible(struct amdgpu_device *adev,
>>>>                    struct ttm_resource *res);
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>>>> index abdc52b0895a..07c936e90d8e 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>>>> @@ -782,6 +782,23 @@ uint64_t amdgpu_vram_mgr_vis_usage(struct amdgpu_vram_mgr *mgr)
>>>>        return atomic64_read(&mgr->vis_usage);
>>>>    }
>>>>    +/**
>>>> + * amdgpu_vram_mgr_clear_reset_blocks - reset clear blocks
>>>> + *
>>>> + * @adev: amdgpu device pointer
>>>> + *
>>>> + * Reset the cleared drm buddy blocks.
>>>> + */
>>>> +void amdgpu_vram_mgr_clear_reset_blocks(struct amdgpu_device *adev)
>>>> +{
>>>> +    struct amdgpu_vram_mgr *mgr = &adev->mman.vram_mgr;
>>>> +    struct drm_buddy *mm = &mgr->mm;
>>>> +
>>>> +    mutex_lock(&mgr->lock);
>>>> +    drm_buddy_reset_clear(mm, false);
>>>> +    mutex_unlock(&mgr->lock);
>>>> +}
>>>> +
>>>>    /**
>>>>     * amdgpu_vram_mgr_intersects - test each drm buddy block for intersection
>>>>     *
>>>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>>>> index a1e652b7631d..a94061f373de 100644
>>>> --- a/drivers/gpu/drm/drm_buddy.c
>>>> +++ b/drivers/gpu/drm/drm_buddy.c
>>>> @@ -405,6 +405,49 @@ drm_get_buddy(struct drm_buddy_block *block)
>>>>    }
>>>>    EXPORT_SYMBOL(drm_get_buddy);
>>>>    +/**
>>>> + * drm_buddy_reset_clear - reset blocks clear state
>>>> + *
>>>> + * @mm: DRM buddy manager
>>>> + * @is_clear: blocks clear state
>>>> + *
>>>> + * Reset the clear state based on @is_clear value for each block
>>>> + * in the freelist.
>>>> + */
>>>> +void drm_buddy_reset_clear(struct drm_buddy *mm, bool is_clear)
>>>> +{
>>>> +    u64 root_size, size, start;
>>>> +    unsigned int order;
>>>> +    int i;
>>>> +
>>>> +    size = mm->size;
>>>> +    for (i = 0; i < mm->n_roots; ++i) {
>>>> +        order = ilog2(size) - ilog2(mm->chunk_size);
>>>> +        start = drm_buddy_block_offset(mm->roots[i]);
>>>> +        __force_merge(mm, start, start + size, order);
>>>> +
>>>> +        root_size = mm->chunk_size << order;
>>>> +        size -= root_size;
>>>> +    }
>>>> +
>>>> +    for (i = 0; i <= mm->max_order; ++i) {
>>>> +        struct drm_buddy_block *block;
>>>> +
>>>> +        list_for_each_entry_reverse(block, &mm->free_list[i], link) {
>>>> +            if (is_clear != drm_buddy_block_is_clear(block)) {
>>>> +                if (is_clear) {
>>>> +                    mark_cleared(block);
>>>> +                    mm->clear_avail += drm_buddy_block_size(mm, block);
>>>> +                } else {
>>>> +                    clear_reset(block);
>>>> +                    mm->clear_avail -= drm_buddy_block_size(mm, block);
>>>> +                }
>>>> +            }
>>>> +        }
>>>> +    }
>>>> +}
>>>> +EXPORT_SYMBOL(drm_buddy_reset_clear);
>>>> +
>>>>    /**
>>>>     * drm_buddy_free_block - free a block
>>>>     *
>>>> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
>>>> index 9689a7c5dd36..513837632b7d 100644
>>>> --- a/include/drm/drm_buddy.h
>>>> +++ b/include/drm/drm_buddy.h
>>>> @@ -160,6 +160,8 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>>>>                 u64 new_size,
>>>>                 struct list_head *blocks);
>>>>    +void drm_buddy_reset_clear(struct drm_buddy *mm, bool is_clear);
>>>> +
>>>>    void drm_buddy_free_block(struct drm_buddy *mm, struct drm_buddy_block *block);
>>>>      void drm_buddy_free_list(struct drm_buddy *mm,
