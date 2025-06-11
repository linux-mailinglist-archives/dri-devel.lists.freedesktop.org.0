Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E0AAD5964
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 16:58:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FB0E10E394;
	Wed, 11 Jun 2025 14:58:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="g0hIRPQh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2049.outbound.protection.outlook.com [40.107.220.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60B8410E394;
 Wed, 11 Jun 2025 14:57:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WSoEioGGU7Cq/4GBcZn5NzvN5Nh4u35E73Y0/WOwjR+sRiGyt+HbuyE5k7BGii8UmLmzWbhKJLeyM+02bD5nW/pq9aGHpjrGNME6c+fdMjIoRMzWwXbvJtSzwAaE73w2P+oG9h0Q6DtZRaUuWCg/lj9yp3rMf2BKzeku4bT7Y3eyxALM/7WDxgN7CQeSPMxPYMdznQhmghGuH73XEK6owJPqzTwDdQmtmnzY9T1d4ixyxaX1Molr/voKj6zh8PEYAfOSrgkrW4eg1SbSJ7VUCOA2im77JwZ97JC30rasVHOJm2jxSn8+ij7YrtaR+/qwdKdeluWjCrIlXg1MhgziEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NhPsQcogm9ss21Xw34OhfuwVioQNiS0Py8SkvT2bz+c=;
 b=gDergMZjWtOoTO0/1CQL/qTraQsLdpJD/uqi8TIMgkczwOnIOItu3vK2yYHtI7WwC4e9XzwY79065L44mLu+2Ghhxdl72nIgoD6xeo/3lUMISl4qf5mL1RHAMrIOrcJgrsSRALeAA0+v8How4ulDC5y6F0mBzFTkLe1JLYr+Qe+hgJWPLluiPOMCAvpItuUevUo7megywmrBhRC6Zb5/7dxKoogS7qVA0o1faYxCDAs1CjzVwMxR+2fDaoJBcdh1EHqcm0U4U0Z0ZDWSpbfkjnS+DPXEfS30RmPtxqobH8CktrPDYtvoVy6U42izzqLWWetGnuAe6MxoRpzqAQQd+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NhPsQcogm9ss21Xw34OhfuwVioQNiS0Py8SkvT2bz+c=;
 b=g0hIRPQhYldcwyTYYm2FOBw1bPVTV5y8/3acJTIZueZjs0x+oyxPsMgcAasqv3VkSQdcIHMF66dpvEPSRhv2e83zZrsdGrwPOTJrrnz3UPMSolskv41XSMQL+60SNsD9gSMxZ+3YSQSStcstI2aLR3GM2vXzsWCqWbmHttT8IB4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BY5PR12MB4307.namprd12.prod.outlook.com (2603:10b6:a03:20c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Wed, 11 Jun
 2025 14:57:54 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Wed, 11 Jun 2025
 14:57:54 +0000
Message-ID: <dc661205-1e5b-4697-863b-36a299365219@amd.com>
Date: Wed, 11 Jun 2025 16:57:50 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/amdgpu: give each kernel job a unique id
To: Danilo Krummrich <dakr@kernel.org>
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 Philipp Stanner <phasta@kernel.org>, dri-devel@lists.freedesktop.org
References: <aEmR9420vj-ISz-W@cassiopeiae>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <aEmR9420vj-ISz-W@cassiopeiae>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR15CA0064.namprd15.prod.outlook.com
 (2603:10b6:208:237::33) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BY5PR12MB4307:EE_
X-MS-Office365-Filtering-Correlation-Id: 400493cf-59c9-4b4e-02e7-08dda8f85862
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UkIzaUc0WjBxTEl3MG9FQ29KK1BjWHUwWXdxaC93Q2RKUkMzZEh0N3NXSU5x?=
 =?utf-8?B?WkZGZTAxMEIwS2FVWC9mVWpndWVQR3lTQXVoTDQydFBnZFc4ajZtdDAvM2xV?=
 =?utf-8?B?MFlWSXo5R1B2bGFiZVllNlg0U3p5b0lWNGxCNkY4L0pScnFYaHlKb1BzSFc1?=
 =?utf-8?B?enBKRUVLaWN2T2lXYktUZkFJM3RmempGdHBPTHBiVTFRTjBxMmZYWXVvRjVC?=
 =?utf-8?B?ekFVb20ydHJxVDJUdGZBTVdYMHhtZTNwbVVpUmNEWHh3U2lKQkNsbWZXUE5Z?=
 =?utf-8?B?K2dPSVJLdUUxVk5PQlRvWGlEd09RV2djeVVTSjNCMHBoVnVGSUxyWWFLbUpP?=
 =?utf-8?B?WC80SlIxMHpGeTBGc1FndlhVSFhqNWtGcWEweUdQYWtPZkRoM3FLeHRIakRl?=
 =?utf-8?B?NEkwQkVSekpyZ080eVNNajBlZk9FV2F4NkUrVmpOV1gwbmJVK1pCUUxoNXJo?=
 =?utf-8?B?eU9CeFdBMDExT0RWZVdlRGREUTVKaU1oMDRsc2JUWUdjQlhLRTYvL0NMaDh4?=
 =?utf-8?B?MGZkV2ZHaXN6WHBMNzF4MHVqUzg4elR2bHNSUWM5eE5IOW8relg1dHN5MERt?=
 =?utf-8?B?QXJ6M3JQcTg3cW52UVhzbjNuNlZQd2RLeHFiMTlBS1RVMHA1ZlNnQWFsaG9M?=
 =?utf-8?B?bk1sY0VDYWhpWFNJQlZxRk5uQzZOOWF2S3dHNHRNcDV0Z3BNSExLVXpvMmFG?=
 =?utf-8?B?b0krMkI3L1h3ZmZML3B5N0Z4dTNBOWRGQmJSQzRMUDlQY0xZTU1WTm9nUHRS?=
 =?utf-8?B?bytZRXRQV3dwU3RTdHo3Q1Bad1pDcW5FRmg1S2l4Um5td1htTEtja0xpVWlP?=
 =?utf-8?B?RkZFVm1wR0p1elRsZDlhWFdpTXlyQWF2UlpDWm1HY0x5bVRUS2xzQnU1dXBS?=
 =?utf-8?B?cG5vMVRJT1ZzaDQwa2lpU0hRRkYxcmtaWjh4UjRUTUkxeEJBcnYwZmZLSDhq?=
 =?utf-8?B?OVRXRC9rcjNVUEJqdWZ5UjdsYThFZjMyYi90WFF0RFJKd0NieFRPUStaRy9h?=
 =?utf-8?B?Rkt0NEFwYUdtVFVSaUFPb2poZHJOZCtrSWJvK3lPNzlEMzYxcUdjRS9kTytJ?=
 =?utf-8?B?OGhEOXNHbGwxS0dhZ2ljVDNrUVEyUlU0MnE0bHBJc295Mi9Zc3RmWlZMZnk0?=
 =?utf-8?B?MkM1V3V2RDlvRnlKbEFZOE40enIySmNPM21KYW9aRWlpY3BrajhySlJVdUlR?=
 =?utf-8?B?d2ErbUVXWlFTTWVpNDVXZ3MralRLdlJuRHlzcEwyU0lMZzFKNG9sQXl6eE12?=
 =?utf-8?B?MndjV2ZlN2JqR2hVK3lPdFMvVDE1cWRIdkx4NCtiUVp1WTRlMEhxb0x0bVZN?=
 =?utf-8?B?Y0w4QUtza1JpbVpVd2dLVjFhcFdyTWcyNEJwTnNWWHZ5aDJxN2lMeCtkN0VD?=
 =?utf-8?B?NkFtZldSbjIrcXEvTFgvMGVjU0NlVXZxOTVNaUpRMkRTeldjRlkrK21NWlBB?=
 =?utf-8?B?VmpxQzJxQjF1YWdRdHUwNVNERTFDTmhuSU1tdUlwMVl2QlNtVzZHMHdDTFIz?=
 =?utf-8?B?MWhDUjVhVkg2QStWMnNmMGo2cXpZQ011dWNlQlVFZmVEeTF5V3FPUDRRb3Nn?=
 =?utf-8?B?WTJCUzBKWXJ0bGhZMUozVE4xWktacUpFdkt2OGNUU3FlSlEyL0szWlhsSHRR?=
 =?utf-8?B?T091M0s0cGJnbWlPN1p6TWRnVDViUFhVSkFIMWJmTU00VEFvcEVyMlUvSS9m?=
 =?utf-8?B?dzBCeEhTVmZZWlo4VDAzWGtTUVB1aDZTcGt6b1ZFbDExKzluSmQxcTJxYmVN?=
 =?utf-8?B?dy9ncU85MG1VeVJ2UlEzb1Z1UjcwbnVITVhpUmxCNEU1MC9WenQzalhsZFRy?=
 =?utf-8?B?ZVpocGxRY1F6bWJRc2d6eDNxcHQxbVpUNlNwVDByRGI2R3FQeUdqT2ZnOUtL?=
 =?utf-8?B?UXFHMnRJQWxJcXdvRDhGaExXdDVLeHBGSlJUU1F6TnpsbC9zQU05NHArY1Uz?=
 =?utf-8?Q?uQVKSjfhkLM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VDdWNnlZYXJENTRsWU9SS3hsQjB2YmdNTjl3MytMYTVpZDUwazh2NmhVbmto?=
 =?utf-8?B?Y2w5aStLS0pobWo2SVRoaXkzS1RheUxKY1BZeitLd1R5UWpvRllxbWFtUGtz?=
 =?utf-8?B?di81L3BUZ3k0UnJiaE1qNEF2Y3l6Smk3TC9UaGRnVnUyRzNVMmhIYlJXRGhy?=
 =?utf-8?B?dTRqYnpZT0hUeTZ1MjhsRmRSQlQ5cytJNUJkblprb05iTEliMWlmT1V3QVNT?=
 =?utf-8?B?S0VhZzFDU0xkQ1hUbDdwOGZEakNFc0xVV05UOGxEY0puTUZUaUVWbXZNZ0o4?=
 =?utf-8?B?Z0ZiZE1wazJDWjRHdkY0dDBtQ1p5WXNKK0YvZmdtcmQzMG9SRDlJZFlZdE5P?=
 =?utf-8?B?b0NvWFNSd2pZR2s3WFpYVDRGSDM4RjhKMERLeG52QTZPWnpDTVJGNmdWTTM1?=
 =?utf-8?B?ZCt4dXlNQjRzY2l3UEQzSEFDY3cxNWNzMWlZYXcwYmtOQUJqS2pOejBwMHFr?=
 =?utf-8?B?TlpTanFTWGlsNUVlakZMZDZrMmQzQXpSTlN0dGRLN04wRXZHS1lYcHpVSTRZ?=
 =?utf-8?B?VldQMW9pUFd2OTUwS1QxU09CdC9FbHM4NGNvWktiMkpYTUtSNVllN1FwNWZo?=
 =?utf-8?B?Q3l0UEZJVkd2M0lxVFEybm1Fc1pGUTJRLzFUdTdocExHNmdhVTBFN0FheXFR?=
 =?utf-8?B?UFVCTEVlREFkYlJ2aXR1dXFrME9CdnVVQ2pSaFdxUnpKVmVrYXMxMHVUaStq?=
 =?utf-8?B?VFhLa2c5K2VhU0NUaDJxMTJPU2o0NmxYVXdVaVh1aUJoaGt2L2poMDJqS0dQ?=
 =?utf-8?B?VmZYTzJWZWFkMkZIWEEvR0VmVXU0K1V0Q2NZZnFGanBWQjF5MmNGYklCMmZz?=
 =?utf-8?B?VG42Mk0vNWwvOVROK3h5RUZ3aTdWRGxJTlhZeGU4TVM4R09mMHJoZDVad1E5?=
 =?utf-8?B?WncxU3orRmxtdys3Skk1ck1mREl3UVZET3RweVBkRkplUFNMbjRaRHFGNWQz?=
 =?utf-8?B?ZUxYYytYYTQ2V0tNRjdtQmRyd2ovODZkQTgwNHlWRW1xZGk0ZkxQVFhVMFdi?=
 =?utf-8?B?d3k1TW9MQUNQU0NmSUxoamdidEFSemlmczVxVzdyaElzOThmUWU4byt4amxx?=
 =?utf-8?B?VDBKUzZudWZtV1dmWUgrV1JZSEFUbTJFUUVBb0RHZGFrV1Z3WWdxKzFmVHQ4?=
 =?utf-8?B?UmVmb3ZwcFM4QmNmNGsvcVhxZnpESFpKSUhWUDFWM2MrMDJraThBUmJ2NElQ?=
 =?utf-8?B?c0V4bmMrSWQ1VUx3V3ZEOUl1a3ZKTGh5dm5nRCtvcjE2SExmOFZxQ0h3blhM?=
 =?utf-8?B?c284MFlsNmMxdjFGSzVkZ0YwTjZXYzJwSnNZK2orSjZVV2paNXAxYXVGY3Y2?=
 =?utf-8?B?SlR6R2h2VkUzTS95QkVZeEdIOFVsTXVhQlQzRFJhTzRRY1ovWUlKbGZUN1Nv?=
 =?utf-8?B?c0pucG53TGJRUzZJUlphamFQaHpMcGhRY2ZhSjZaLzNFRjU5RkVlbkUxVGlZ?=
 =?utf-8?B?MWo0UlpUYTBvbTBMTFZialc5U0dISTdCRlpiZlhhWDY4eW9HMHdIUjlnRmVr?=
 =?utf-8?B?aTlaUlhSYmJ1WUxlSkxIcUZmWExjemlpenUvWkswS3lFbEFTQkluZmJCZm1k?=
 =?utf-8?B?dGZSZVFmVWhvMjlVWTd4QkR1RVNkVUwrOTVkMkxuWVYvaHN6a2tQUjdzaTJE?=
 =?utf-8?B?aml0anJCb052U0FiaENMQUx2dnVYV29ubkxLT2pJYmpCZ1F5VVZWYUUxNGhq?=
 =?utf-8?B?T2JpR0lxOGxLcmZ3N0gvOGIvKzJqMTMxOUdQUU93QzVlUGwwYkI2a3dONnJi?=
 =?utf-8?B?L3EwMjludnA4R1Y4bFpOUjNteHlENzd6VmErRFFrMHJQWXoySW53T3lGQnRl?=
 =?utf-8?B?bk9JNVlJMHhzV1hSdUVaOUxBYjIwSmVmdjRVV0JiNldvSkdPcjlxNDdBQlVj?=
 =?utf-8?B?bUtSZ1ZCZ2NpWUpSbHZHQTczclg4b3BmS2pUMmplVlh6OHY4d2YveGp3bi9t?=
 =?utf-8?B?ZENsbTlhRTZkOWQ3d0RWUWhLQ0tZL3F1QWVqS3RWTExNbkx4WWhDRXlIbkFn?=
 =?utf-8?B?eWJ1U2ZBUEdEdW9sK0xPWFEzek9kOTYvR1lJZVR4VzJlbUo3Vy90NU1SQ2xC?=
 =?utf-8?B?STdVdXQvL2lBMS81TVhIZzZEZnpIby9Dc0lvdlBWRjZ2R1NRVG5VM3lRcDVx?=
 =?utf-8?Q?Wrpkqa18OhnyUrlql5sem0QfM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 400493cf-59c9-4b4e-02e7-08dda8f85862
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 14:57:54.6259 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i+UROEOAfWAa/uzlnkoe9osG/EPN/rH7knkNLn8Pz8AI1QDsL6IFEfSXYm03Rb7y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4307
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

On 6/11/25 16:25, Danilo Krummrich wrote:
> (Cc: dri-devel)
> 
> On Tue, Jun 10, 2025 at 03:05:34PM +0200, Christian König wrote:
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
>>> index 5a8bc6342222..6108a6f9dba7 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
>>> @@ -44,6 +44,22 @@
>>>  struct amdgpu_fence;
>>>  enum amdgpu_ib_pool_type;
>>>  
>>> +/* Internal kernel job ids. (decreasing values, starting from U64_MAX). */
>>> +#define AMDGPU_KERNEL_JOB_ID_VM_UPDATE              (18446744073709551615ULL)
>>> +#define AMDGPU_KERNEL_JOB_ID_VM_UPDATE_PDES         (18446744073709551614ULL)
>>> +#define AMDGPU_KERNEL_JOB_ID_VM_UPDATE_RANGE        (18446744073709551613ULL)
>>> +#define AMDGPU_KERNEL_JOB_ID_VM_PT_CLEAR            (18446744073709551612ULL)
>>> +#define AMDGPU_KERNEL_JOB_ID_TTM_MAP_BUFFER         (18446744073709551611ULL)
>>> +#define AMDGPU_KERNEL_JOB_ID_TTM_ACCESS_MEMORY_SDMA (18446744073709551610ULL)
>>> +#define AMDGPU_KERNEL_JOB_ID_TTM_COPY_BUFFER        (18446744073709551609ULL)
>>> +#define AMDGPU_KERNEL_JOB_ID_CLEAR_ON_RELEASE       (18446744073709551608ULL)
>>> +#define AMDGPU_KERNEL_JOB_ID_MOVE_BLIT              (18446744073709551607ULL)
>>> +#define AMDGPU_KERNEL_JOB_ID_TTM_CLEAR_BUFFER       (18446744073709551606ULL)
>>> +#define AMDGPU_KERNEL_JOB_ID_CLEANER_SHADER         (18446744073709551605ULL)
>>> +#define AMDGPU_KERNEL_JOB_ID_FLUSH_GPU_TLB          (18446744073709551604ULL)
>>> +#define AMDGPU_KERNEL_JOB_ID_KFD_GART_MAP           (18446744073709551603ULL)
>>> +#define AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST          (18446744073709551602ULL)
> 
> Why not
> 
> 	(U64_MAX - {1, 2, ...})?

That's what Pierre came up with as well, but I thought that this is ugly because it makes it hard to match the numbers from the trace back to something in the code.

>> Mhm, reiterating our internal discussion on the mailing list.
>>
>> I think it would be nicer if we could use negative values for the kernel submissions and positive for userspace. But as discussed internally we would need to adjust the scheduler trace points for that once more.
>>
>> @Philip and @Danilo any opinion on that?
> 
> Both, the U64_MAX and the positive-negative approach, are a bit hacky. I wonder
> why we need client_id to be a u64, wouldn't a u32 not be enough?

That can trivially overflow on long running boxes.

> Anyways, if client_id remains to be a u64, we could add a global DRM constant
> instead, e.g.
> 
> 	#define DRM_CLIENT_ID_MAX	0x0fffffffffffffff
> 	#define DRM_KERNEL_ID_BASE	(DRM_CLIENT_ID_MAX + 1)
> 
> And in drm_file_alloc() fail if we're out of IDs.

Mhm, I wouldn't mind printing the client id as hex and then always setting the highest bit for kernel submissions.

But when we keep printing them as base 10 it kind of becomes unreadable.

Christian.

> 
> I think this would be much cleaner.

