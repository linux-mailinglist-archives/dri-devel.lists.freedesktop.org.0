Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9532D9D5FE4
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 14:47:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF32A10EB98;
	Fri, 22 Nov 2024 13:47:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="SytjWTf4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2052.outbound.protection.outlook.com [40.107.236.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E535810EB98;
 Fri, 22 Nov 2024 13:47:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KJwN0ubrZHFYmVoyhYW8R9pG9oC8SOKwJMMN0mt8oMEBP16Wl30/JnHJvLsUckG5v7xP43roEjsErrqeeHfaAfsG2+LKiXymCHz5Ta1ZGaZT7Yc2FggQl1t2UP/ip2o++C9gWwwklR4iKpxLaqASHf5R2t/Lce7kl6bneZCTyE8aTf+cMpxEjDekqvAOAtZTB0yCwNvN8jDXD1wR67CVdHwMajemwu6ufECkFw1hB3poBVbUVyFYiaALahhpFWJ6sRu2EN54UHSkYlD85VEr+f7txAMcE8fUhAqrchPoH6yP7rO1At1rcDQwUl7nZH0RObwjCtkPXJN0upsul6zOsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AEJ0fFeGTr7Kp0POsvdwNGbhrV4ljNryPqy/MAqAtmA=;
 b=q9UqW3fs+KIVupJFXM0QQRVnHm+RD0wJX2QE9rb2EjNGgyWdr6Ue37V6GusmCUDFCmXQ/gJjRthwXUvpYzwwtncvE7a6zMZtG9w13rW8v6OCfQLopNUDtBwJLq0YwPDwG7gfHDx9bt+P8KBTynE28OtUgLRhiEHDHXsaq9owDZ7Gd6QADHmeO/l4heR4jg4mdYNdLEgfyPyY7ULtQcU/buWUjTdVqQrNlevELQi2q189KjukhJPnhfYorPFpkIAxqX8BrO5Mcopx/hh1g239Ry7U2+WrjHjwsRE5d/Ufdu8H3xI11B9b08/foWKuOYgs3b3droGsR7if5+HuyHMjSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AEJ0fFeGTr7Kp0POsvdwNGbhrV4ljNryPqy/MAqAtmA=;
 b=SytjWTf4hnNrmEiNtK5UuloVRcF9xYUTuWsaxCULyuhDP+rCNaKFf5byiHe41BxhRnVjlRReR+UuI/hPjHvWpUFNDNE0eiooAKHKeH0wpoW8iUGELJTGMDrB8zA3omDGaRX8ds5esxEuCkkIFwmnarMTP8Swy7Tupvmyl+JUicg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA0PR12MB8931.namprd12.prod.outlook.com (2603:10b6:208:48a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.15; Fri, 22 Nov
 2024 13:47:02 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8158.019; Fri, 22 Nov 2024
 13:47:02 +0000
Message-ID: <14e6e7a3-4077-4074-aaae-3be4b6fd071d@amd.com>
Date: Fri, 22 Nov 2024 14:46:56 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: Make the submission path memory reclaim safe
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Tvrtko Ursulin <tursulin@igalia.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, stable@vger.kernel.org,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 Philipp Stanner <pstanner@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>
References: <20241113134838.52608-1-tursulin@igalia.com>
 <e30428ce-a4d1-43e0-89d3-1487f7af2fde@amd.com>
 <154641d9-be2a-4018-af5e-a57dbffb45d5@igalia.com>
 <61ad957b-34be-4ee5-944f-261c7a412962@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <61ad957b-34be-4ee5-944f-261c7a412962@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR5P281CA0011.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f2::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA0PR12MB8931:EE_
X-MS-Office365-Filtering-Correlation-Id: c86aee59-2e29-4335-75d3-08dd0afc247d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZTlSV2pHNFMwUlc4ZXBib2oySElxTVUySHJxelNyTUEydXAyYjdxQkJ6ZUFZ?=
 =?utf-8?B?eWpCcjRWRStwOWlMNmkrR0hOaG42Q0t1NVA2bjZTVW5hZTRVMEZTK2FNU0xv?=
 =?utf-8?B?VEhTYjFGQ0xIbmF6bnRrWmNtNXU5UHhPZSt6NERPTUJzR28wcFk3ZENlMXJw?=
 =?utf-8?B?RGwraThLUTlYWWpRVlVhZ0VESEhhYTY2NUVxREN2NE9hcEpBTFI3Sk1IWFRn?=
 =?utf-8?B?ZXVPcTVHYlc4UTFKbmNkRTdEZGIvejBMdEMyNTJnbkhHZjYxaXlneG91dTl0?=
 =?utf-8?B?N3haaUxXZWkxWEVQenQ3cXRLVWFsNUtkQkhBNmhzSUpVSTY2ZXlGLzkybmJr?=
 =?utf-8?B?L29OaFRHMHMwZ3RVenRuZkcvU0k2SHBnZ1RLT1l2YVBPRDNXUGxxNFkyd3VG?=
 =?utf-8?B?clBDTEtodG5ZOUdZendkNDlBS0ZpR0FEclFHaXBjUVpGa2U2UmdtT3N3Z2tM?=
 =?utf-8?B?ay80R2JiRnZwcWZYQjlicEVVazhaMTk1TXRqdFN3K05kMmVLaEFRU0o3OTBx?=
 =?utf-8?B?V2YwYk90VzJ1M0lsWGQrWkFXemtFZDJEdVpSaDNXTWVVa0J4aUxhZnNtenJa?=
 =?utf-8?B?cU1pMTlqdmMwYjRwNXh3TDl4NkYzK2hnaGE1cmNjcDBIQXJ4YWRtRzIrUjh6?=
 =?utf-8?B?WHVYdkZrZU92M1o2Ym5mRElWdHFEQVlpUHllTk5YU254V1RIMmlJNWlqS0NN?=
 =?utf-8?B?Z1VPOVFtcGtxUHNPWXZ3SGwrMThwekFabFYzSkRpbDdjOTdtSHM2RlVDbjdP?=
 =?utf-8?B?ZjhhWTFNbmZISFZzOEppcGdBL1VCd0cwMmlZbklha3ZrVHhwU3V0Y1ByZ01C?=
 =?utf-8?B?OUV3UnM3TmR0N2FkZ1ZUbzZhYkFON1BOcUVTOUx2Z3FQTzBTd3FuYTg0Y1Q4?=
 =?utf-8?B?MGcvTTRocmpMU2dJdUlISDkrOHkyWmtJc0dRUmVDOTJPMk80ZGg1NTBWR3NB?=
 =?utf-8?B?YXZxOUZ1ZlFEN3RLVDR1UWtueVhNZ0t5SnRVbXhtOG9ENnJwU1pvcUFXdDc4?=
 =?utf-8?B?VkY0Y2xwTkd1bi80SFFhVXp6M1VCdVhielpmMWdpU1NBWmtoVGo2dzhCZFhn?=
 =?utf-8?B?bkVpdXdrMUFTUGdFVWR3TW11dTlaTmdyaGRTTS9ncDQwRTR3NWNhTE9kZ3hJ?=
 =?utf-8?B?a1ZaT0IrMEFQRnlHb2RhdHdPcUpmdFBPbzN5Q3RvUnJNdjdEa0R0VU9lWjVr?=
 =?utf-8?B?aXNqdlJtRURyZitFL0hCVmlyckJqK1ZYcmtRMU9yd2ZZZSt6aDUyK1BsWUkr?=
 =?utf-8?B?Qzh0QVkvTW9HOFcrcmowWFhETkU3dlg1TlRRbkpwWlRGcmFBWFJEcVFvb1Jw?=
 =?utf-8?B?UGdKdHY3MG5reTI5NG1DbCs2RUdqUWtrZUFiMU5sdHFaTGlvc2paUm5OR2lU?=
 =?utf-8?B?U1JzL2tKcG9MeTdqdUFMNjhQS2tFN2dTN210cU00RXhZY3NPaVhXYjBabEFT?=
 =?utf-8?B?RExiZ3A5ejViYjFHL3IxdzFyNFN4ZklSSmNXK1ZLTVcrWVlkRCt0T05zOVha?=
 =?utf-8?B?TEluME1Db3ZHYUZ6TmJsNVFLWWx5THdPYys2dnQ5b1BWbDVyTVY0WVJ0SVhF?=
 =?utf-8?B?U2tRM2QzZnk0SjlkNkdrTTg1NjhxMnhXT3liK3hlN0xjbkVwczNrT0dYKzg4?=
 =?utf-8?B?UWt4a3lBQS9RbWR2YVdaa1liQWVaT1pFc0I3ME9Ka2UvNm5sZXYwRVhKZmRU?=
 =?utf-8?B?Q1pROUZQZEgzczZFcytKenNvemM0QnZsYy9PZUZzRHJwUDNhT1JzaEpydWFi?=
 =?utf-8?B?UnFHUWxZelFvMkdMRVBleERBS3FPaFBOYkV1RU53cWJsYUpqdlhiT0p4Q2NN?=
 =?utf-8?B?VUNFbEQyazVCZzZPVUtQUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0NodXFrN0RvYnZRaEUwUWE3ZWxaVFBVUFZrZ3pIeFg4YS9iRlprN2hKMDdL?=
 =?utf-8?B?SnFzMHJycjhyb2Z0dWJpNnQydkdyNzZyVTJLSmNnay8xdUJOZkxLdk9lcEU5?=
 =?utf-8?B?Q25kTEVjbkE3OXhKb2tDTEx4ZEw1SlMxcDdNdWRTMVdlZEdIWENJRHhSWGtm?=
 =?utf-8?B?N1VGcFdOV3dmUmkvR09CZGgrMnpKdzgyUWxrVXlnSlRPVWdjVWdKV3IvQnEv?=
 =?utf-8?B?a3dFeEFtbjlNVDIrRXNQN2dwV1k1VE12b1N0ZUJvbjZqcnYwaGVTUEdXOERt?=
 =?utf-8?B?VjBwUU9paStxajBmQytjbCtYUHZhNGFhVXdKVTVBRE45dEFqRmxLOTc0Y05V?=
 =?utf-8?B?c29LM1dkMGtEZTlneXFRelIvQ0xwMVpNajlUVTRpWXpwWWNhTzFjdWJwRzRK?=
 =?utf-8?B?NXhYVjZKcFgrdnp3L3o0TktoUFk1UDVVU25GYjVFa0FEM0F2VGRYY1B0Qm5H?=
 =?utf-8?B?cElQai9oYmV1SlJyZDkwampqTDc5cnZqV1JJUjdhYnBubjN3U0ZQc2ltbXFt?=
 =?utf-8?B?am8wZFhpdEJqTlA5WXd6Z0ZaNXBjTkpmSDJraGpoQitCMVhkazl6aUszZW55?=
 =?utf-8?B?ZjNFV0MwTWVIYXhiOGt1ZEtCdTNWdUZEcmptYjNndjBLZWtueW5CZW5ZUjBm?=
 =?utf-8?B?Y0V1VE95ekllVkFtalZPYlQxSWZLZGRSOVF0VHVrMG8vQ3lIMXNQTVhnUzdi?=
 =?utf-8?B?dGVqL2JrS1R6TWwxckFhdmt6OCtGWDcxajJoRnhTTmp0T3NVSGE2dlV1VW4z?=
 =?utf-8?B?OEZWMGk5aDV2WFBvcjlqQnoxcCtOa1F0MXgrOGtiZ3dFc0g0d0pqbFpPaDh5?=
 =?utf-8?B?dHBCK2FMbUJGZUVHZC9GSHpRYUZHTHl5QlErYk9HdlgzUlUxSVRuWnpYQjcz?=
 =?utf-8?B?V3g2OWlkM0I5MzhIVFRyV1JyVVBqVDRCT3JVcldPaWhQREJUUmRJcTMrVXdw?=
 =?utf-8?B?czhHeHZuNE50SWRMQUFrUUFWQ0dHUDd4bzU2RFFwM0htdkZUbThuSmwyNUo0?=
 =?utf-8?B?c245ajk3VkdBVXJraFpLb29XS0dRWmQrY09YeXl5TlFxWnZwTzZ3ZGtLM2ZY?=
 =?utf-8?B?bU5wa1J4amMxa1JJQWpwZ3ozRFlURnBDRFZTRGJkdmY0SGIxaXhFcHIxa21j?=
 =?utf-8?B?RHNlWE5BWXF1cTdzN01hUVY3WUx2Nm9UbEpYMmVqUEtCWkpRQktIeFFpNDNW?=
 =?utf-8?B?NXc2ajRrT0xHMk0xeDFsaE9EYmpiMW9XekU5MVhSVk95YWJCaUFOc0JML0FL?=
 =?utf-8?B?RGg0cW1HVWRNK2dSaURTUkcrMlVFbHNBMGpEWU8rdWdGcUxQNzVUb0tKMDgv?=
 =?utf-8?B?OUs0ZDZHRG9uYlZGMy92Qy9ZK202M08reDFxeWdwdytyOHYvWUtNWWVaMWg3?=
 =?utf-8?B?NWtiZTN3K0s2N2dUenNWaWhqVm5Jd20vNEdUaHpFcitSWU5iYlhudDFZT0g4?=
 =?utf-8?B?MGVrb2ZTbXVZR1pXazVOSkNvbkVEb3ErWW41VlZVT3FlZCtlTXdCS1dZN3Jp?=
 =?utf-8?B?NmVmVk1zOEdiQ2VlVGZrKy9XZXpmTjRZUkNiVVFpcG1qdVFvaFA4UlVUbTVr?=
 =?utf-8?B?bW1qdEpBcGZCUElCZHRRMktOM0ZlY05uejRqVFVQQ0RFMERod0NycEdsOFVn?=
 =?utf-8?B?SmVveXNKMU8rR01XNEh4azZSY0R0b21yaE9DWWFOSHdkNGtjcDB0azByelNa?=
 =?utf-8?B?S0c2RlcyK3ZzdlRiSmEwRTk3QWs0SmUwak92cUNlOVZhU1ZBMVdnOWphQkg0?=
 =?utf-8?B?aEZZczVsUWNpbjRXZUZ4UzM3UVkzZlJySkwxQ1FncnRRNFMrSlNqWVEzU0V5?=
 =?utf-8?B?dytxYWNhK1ZOSUtEVXo4Uy9YR3Z3Z09WY3E4QjlpK05QcG1KaWhwT1hBdkxp?=
 =?utf-8?B?QzAvc2JURU5WVTgzR1pkTjR6bk1lYTJ5NGRuRzdPNjM3cTJiNmgvVXJFVm12?=
 =?utf-8?B?c1dJL3M1MzFkYmRGWGhlSlNmV25Fc0w5YXd2d1N0dnRRWXo5VlZRNk5uaFY0?=
 =?utf-8?B?WkJ2cXp6OWZFbWdhMHBnbncwblB4R1lVK2tHaEEydXJXVGlaUEpWbmRhSFEx?=
 =?utf-8?B?cXoyVXBrOFVzOE9iVms0ci8wNTFpakFSQmpkMGhEMWRvQlhSTk8vaGN3WnJX?=
 =?utf-8?Q?6L/Q5KqEcKclvi99dNiljWb7P?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c86aee59-2e29-4335-75d3-08dd0afc247d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2024 13:47:01.9668 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7M07mjWLOsq/beQi5Q93TzOoxhJsWfklVWjRbb3LHt0wSlDW0RYK3umpRMtaRlsz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8931
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

Am 22.11.24 um 12:34 schrieb Tvrtko Ursulin:
> On 13/11/2024 14:42, Tvrtko Ursulin wrote:
>> On 13/11/2024 14:26, Christian König wrote:
>>> Am 13.11.24 um 14:48 schrieb Tvrtko Ursulin:
>>>> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>>
>>>> As commit 746ae46c1113 ("drm/sched: Mark scheduler work queues with 
>>>> WQ_MEM_RECLAIM")
>>>> points out, ever since
>>>> a6149f039369 ("drm/sched: Convert drm scheduler to use a work queue 
>>>> rather than kthread"),
>>>> any workqueue flushing done from the job submission path must only
>>>> involve memory reclaim safe workqueues to be safe against reclaim
>>>> deadlocks.
>>>>
>>>> This is also pointed out by workqueue sanity checks:
>>>>
>>>>   [ ] workqueue: WQ_MEM_RECLAIM sdma0:drm_sched_run_job_work 
>>>> [gpu_sched] is flushing !WQ_MEM_RECLAIM 
>>>> events:amdgpu_device_delay_enable_gfx_off [amdgpu]
>>>> ...
>>>>   [ ] Workqueue: sdma0 drm_sched_run_job_work [gpu_sched]
>>>> ...
>>>>   [ ] Call Trace:
>>>>   [ ]  <TASK>
>>>> ...
>>>>   [ ]  ? check_flush_dependency+0xf5/0x110
>>>> ...
>>>>   [ ]  cancel_delayed_work_sync+0x6e/0x80
>>>>   [ ]  amdgpu_gfx_off_ctrl+0xab/0x140 [amdgpu]
>>>>   [ ]  amdgpu_ring_alloc+0x40/0x50 [amdgpu]
>>>>   [ ]  amdgpu_ib_schedule+0xf4/0x810 [amdgpu]
>>>>   [ ]  ? drm_sched_run_job_work+0x22c/0x430 [gpu_sched]
>>>>   [ ]  amdgpu_job_run+0xaa/0x1f0 [amdgpu]
>>>>   [ ]  drm_sched_run_job_work+0x257/0x430 [gpu_sched]
>>>>   [ ]  process_one_work+0x217/0x720
>>>> ...
>>>>   [ ]  </TASK>
>>>>
>>>> Fix this by creating a memory reclaim safe driver workqueue and 
>>>> make the
>>>> submission path use it.
>>>
>>> Oh well, that is a really good catch! I wasn't aware the workqueues 
>>> could be blocked by memory reclaim as well.
>>
>> Only credit I can take is for the habit that I often run with many 
>> kernel debugging aids enabled.
>
> Although this one actually isn't even under "Kernel hacking".
>
>>> Do we have system wide workqueues for that? It seems a bit overkill 
>>> that amdgpu has to allocate one on his own.
>>
>> I wondered the same but did not find any. Only ones I am aware of are 
>> system_wq&co created in workqueue_init_early().
>
> Gentle ping on this. I don't have any better ideas that creating a new 
> wq.

It took me a moment to realize, but I now think this warning message is 
a false positive.

What happens is that the code calls cancel_delayed_work_sync().

If the work item never run because of lack of memory then it can just be 
canceled.

If the work item is running then we will block for it to finish.

There is no need to use WQ_MEM_RECLAIM for the workqueue or do I miss 
something?

If I'm not completely mistaken you stumbled over a bug in the warning 
code instead :)

Regards,
Christian.

>
> Regards,
>
> Tvrtko
>>> Apart from that looks good to me.
>>>
>>> Regards,
>>> Christian.
>>>
>>>>
>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>> References: 746ae46c1113 ("drm/sched: Mark scheduler work queues 
>>>> with WQ_MEM_RECLAIM")
>>>> Fixes: a6149f039369 ("drm/sched: Convert drm scheduler to use a 
>>>> work queue rather than kthread")
>>>> Cc: stable@vger.kernel.org
>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>> Cc: Danilo Krummrich <dakr@kernel.org>
>>>> Cc: Philipp Stanner <pstanner@redhat.com>
>>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>>> Cc: Christian König <christian.koenig@amd.com>
>>>> ---
>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu.h     |  2 ++
>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 25 
>>>> +++++++++++++++++++++++++
>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c |  5 +++--
>>>>   3 files changed, 30 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h 
>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>>> index 7645e498faa4..a6aad687537e 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>>> @@ -268,6 +268,8 @@ extern int amdgpu_agp;
>>>>   extern int amdgpu_wbrf;
>>>> +extern struct workqueue_struct *amdgpu_reclaim_wq;
>>>> +
>>>>   #define AMDGPU_VM_MAX_NUM_CTX            4096
>>>>   #define AMDGPU_SG_THRESHOLD            (256*1024*1024)
>>>>   #define AMDGPU_WAIT_IDLE_TIMEOUT_IN_MS            3000
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c 
>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>>> index 38686203bea6..f5b7172e8042 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>>> @@ -255,6 +255,8 @@ struct amdgpu_watchdog_timer 
>>>> amdgpu_watchdog_timer = {
>>>>       .period = 0x0, /* default to 0x0 (timeout disable) */
>>>>   };
>>>> +struct workqueue_struct *amdgpu_reclaim_wq;
>>>> +
>>>>   /**
>>>>    * DOC: vramlimit (int)
>>>>    * Restrict the total amount of VRAM in MiB for testing. The 
>>>> default is 0 (Use full VRAM).
>>>> @@ -2971,6 +2973,21 @@ static struct pci_driver 
>>>> amdgpu_kms_pci_driver = {
>>>>       .dev_groups = amdgpu_sysfs_groups,
>>>>   };
>>>> +static int amdgpu_wq_init(void)
>>>> +{
>>>> +    amdgpu_reclaim_wq =
>>>> +        alloc_workqueue("amdgpu-reclaim", WQ_MEM_RECLAIM, 0);
>>>> +    if (!amdgpu_reclaim_wq)
>>>> +        return -ENOMEM;
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +static void amdgpu_wq_fini(void)
>>>> +{
>>>> +    destroy_workqueue(amdgpu_reclaim_wq);
>>>> +}
>>>> +
>>>>   static int __init amdgpu_init(void)
>>>>   {
>>>>       int r;
>>>> @@ -2978,6 +2995,10 @@ static int __init amdgpu_init(void)
>>>>       if (drm_firmware_drivers_only())
>>>>           return -EINVAL;
>>>> +    r = amdgpu_wq_init();
>>>> +    if (r)
>>>> +        goto error_wq;
>>>> +
>>>>       r = amdgpu_sync_init();
>>>>       if (r)
>>>>           goto error_sync;
>>>> @@ -3006,6 +3027,9 @@ static int __init amdgpu_init(void)
>>>>       amdgpu_sync_fini();
>>>>   error_sync:
>>>> +    amdgpu_wq_fini();
>>>> +
>>>> +error_wq:
>>>>       return r;
>>>>   }
>>>> @@ -3017,6 +3041,7 @@ static void __exit amdgpu_exit(void)
>>>>       amdgpu_acpi_release();
>>>>       amdgpu_sync_fini();
>>>>       amdgpu_fence_slab_fini();
>>>> +    amdgpu_wq_fini();
>>>>       mmu_notifier_synchronize();
>>>>       amdgpu_xcp_drv_release();
>>>>   }
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c 
>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
>>>> index 2f3f09dfb1fd..f8fd71d9382f 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
>>>> @@ -790,8 +790,9 @@ void amdgpu_gfx_off_ctrl(struct amdgpu_device 
>>>> *adev, bool enable)
>>>>                           AMD_IP_BLOCK_TYPE_GFX, true))
>>>>                       adev->gfx.gfx_off_state = true;
>>>>               } else {
>>>> - schedule_delayed_work(&adev->gfx.gfx_off_delay_work,
>>>> -                          delay);
>>>> +                queue_delayed_work(amdgpu_reclaim_wq,
>>>> + &adev->gfx.gfx_off_delay_work,
>>>> +                           delay);
>>>>               }
>>>>           }
>>>>       } else {
>>>

