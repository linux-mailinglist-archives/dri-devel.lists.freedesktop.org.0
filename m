Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A3C98405E
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 10:24:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 689B910E685;
	Tue, 24 Sep 2024 08:24:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="zDGs5lVw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2052.outbound.protection.outlook.com [40.107.94.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A53210E2A2;
 Tue, 24 Sep 2024 08:24:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=agn6u+034g6Zcl2t2fozyIKq9MfHyqUELyc+qqekl9RK5lmqAva9Hu81x/OQ5sgqvVhlcrZgzHBXHS2cEAod73lP9YDoRSdJ+x5OFHOxL58fE9nOQmTMEO8pyT+XbSD7dCLp15+M5xnsiTCNNicDsW4u6kio0usjKLT9B/3juqgCHDyAFpRElb8AWDUobwdy1Ct9ilm7FMmD5eQIkB4A5HL33AAcm9XWbZyDreuddjlJxoJ8i7d+X+3Vb7sO887//DDSbzrkHCGdA9LBFwjKFcqIJVv/v8LQX+tWDijN14e86CiRaxkmq9mGO6YCS2QnvEES2OYScPonb3BW9l9w6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DRUogrv3BFXVKmWnvh3Dk7C5f0eU1uu2ECUwqltXMxA=;
 b=iY1pw7qB0ak5GqjOt9Npbka8Qs/W9M+QIxeXmpFprikXr8cLbR/D17WPwt0lRbwc22KxEervhlDkVCnpSw1GaNgnIB4nfT//jKqJ6vF+PlVm5P4cJwS9vXOPO3sAg/g/h9qWnbH5jE7UXEhyaCZtnmkoB3+5U2ex8pOEO7FELmm4TNDSMXpqfSEE4nyMvUihXCUeHzuK8kqWasIGXcdpWKenmh0onc0+c5bmTsEMP+tZk0xztPrPZCO8P/UTpo5SOWU7jYXlvOBUJ0iANyidqkj6U9PBU6pteT52GH6OPvwraq4nzuKX8NosIsTNmW87Qws23P3Dh9cLAqi6mvgVqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DRUogrv3BFXVKmWnvh3Dk7C5f0eU1uu2ECUwqltXMxA=;
 b=zDGs5lVwgEyEh3kvmFYzrasl1YENnoNZFm70VjYUjIUyZVBZx0yDVo5293V5ad2jMLgoVFYf7GquhF1qJXu1ywbx6cIv6vLzDzhcM62RfOuNVkVa0jWVbkhzjHOL+LNJWl2rOFSOpsFyIkIemfO6dY86Z5WFvUrdiX0AaL0naoQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW4PR12MB7466.namprd12.prod.outlook.com (2603:10b6:303:212::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27; Tue, 24 Sep
 2024 08:24:05 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.7982.012; Tue, 24 Sep 2024
 08:24:04 +0000
Message-ID: <ca494935-cf38-4bad-ab5c-2afdc9ce3d33@amd.com>
Date: Tue, 24 Sep 2024 10:23:59 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] drm/amdgpu: delay the use of
 amdgpu_vm_set_task_info
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 dri-devel@lists.freedesktop.org, tursulin@igalia.com,
 simona.vetter@ffwll.ch, robdclark@gmail.com, alexander.deucher@amd.com,
 amd-gfx@lists.freedesktop.org
References: <20240920090920.1342694-1-pierre-eric.pelloux-prayer@amd.com>
 <20240920090920.1342694-4-pierre-eric.pelloux-prayer@amd.com>
 <121a41fe-6637-41ca-a21e-7bd01dc0f0bf@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <121a41fe-6637-41ca-a21e-7bd01dc0f0bf@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0156.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::10) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW4PR12MB7466:EE_
X-MS-Office365-Filtering-Correlation-Id: f49ad9c6-9622-4010-c9fa-08dcdc724081
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VFpkcGpGcGRTaHpBNWcxRG8zSXhSV24zWk9GS3VnVHU4b2h0bzJqdXh3a1JP?=
 =?utf-8?B?SGs3bTl3emVZUlYxSkdVdng2TG9KNmx5MDBqUDNXL0RNWENsa25hL1VGMGlV?=
 =?utf-8?B?NzRhd291eDN0YTdvdVcxVGxvT1VVSkdPTUFvTEhzemJRaW9KWmhFcis0Ylo5?=
 =?utf-8?B?OTNOcVh1cVlMRzExSlZLdCtwd20yWmlGL3ZOd2VDZGp1anRRVzJLeWNyZnFy?=
 =?utf-8?B?ekJVcW5LWUo2TVNJd2pIaFlJVzNBMUdlMzJmb2EvOE8xSStZSEdnTFRSV3BG?=
 =?utf-8?B?TlhkNWZUNkZzU09qY2NFRmQ3Wkcra3RBc2x1bXdMZVU0WTdHZzRiRklDQUpZ?=
 =?utf-8?B?bUhwTW5IbStibDRRNWZhalNyREc4bnk0NUdaYk1WbjB4ZHQyMUZvNXhnNG56?=
 =?utf-8?B?UEpFWithRlpaZVdFZkRKVDVGVU5mT1ZVQkxDdVFsR3NNWGZPVXdRVzBvamF1?=
 =?utf-8?B?WDdFQSt1MnU3Tlc0TnhSYlJ4MzU3TmEzVXBxWWxZbFZIN0dTRDd2RHJldWxa?=
 =?utf-8?B?cEp5aDFGSnFhb3NHSUtaYUZzdDQwaFEwQjV0SHdUOW03M21oVzN3L05QU0Rt?=
 =?utf-8?B?aVZWTldMSUxXSzVIQ3dkSyt5UHhKbmM0aGthblp6dkRqSUIxZ2NrOXlPWFUx?=
 =?utf-8?B?d0o2eWY4emZsbmNrUFFYaWxzWVByeDRDUVdyd1ZHWlJIK2tFTDU2RDBOUjlp?=
 =?utf-8?B?S3pubzFRa1FNd3V4WXBzdUpMTmZiTjhWRWZLRmh2VUI1ZlVqcS9ubjB3cm5T?=
 =?utf-8?B?bldDVVZFYSt1NkpMMVJVeUxnRU1tcnRSOTYxZ3NZQU1wcmlNTWtIbU5wUW1n?=
 =?utf-8?B?UHY1MmFyam9yeEFYU0t4TlRSZWZyYnBWRDFLWEE3T3FsTUxsZjF2dnJwcDdx?=
 =?utf-8?B?cDRFZHJ2OTBETlJudDZCTlluQmxOUytGM0Y2UXNiMXVqWlNiN1paODdweFI2?=
 =?utf-8?B?K3orSERiV0ZyUnlZdVljMXpRYkszK25rcEZ3cEl2WmpRU3NNUE1YUnYydkNJ?=
 =?utf-8?B?SmxRb0Fkb3QvUUtyZ0FuTmkrSWpnUXExbVEyazBVczF6WFYxdmNBcm9HZG1W?=
 =?utf-8?B?WWUyb0ZSa2lCaFc5RUUrb2tBSXZDRTNyQU9KOWhIeDAzSzR5ZTNyR3Q0UlZR?=
 =?utf-8?B?YUR0dzh2QitHSTFaQjFCOXU1S0M2TGp3R3JmVVJUeGlDUzc0UE1PSDdwQTAz?=
 =?utf-8?B?b3BxeGZycjR5KzZUOEpGN1lhZTdEVmdHVzFCM0loTUNjNFZ1NGJtUFlaUk1i?=
 =?utf-8?B?THkvSHRILzNxcW9NWEdqOHdhRjhqS0VJS1NUVTc4NmRBWWZLSTNlaVR1WDRZ?=
 =?utf-8?B?SkQyM056RlFNbWVveHZMVjU4VVQ5ZlpXNXRBQXhIMnZKUFpVS1dwRUNxT3V2?=
 =?utf-8?B?MEpmdkkxVlozMUNPYVNUMHIrd0tNTDVWSkRYNkwva2xQWkZ0ZjVIQzgrdmNv?=
 =?utf-8?B?Vm1pSkRmVW5uaUVkZVZ4SjlRWFprNStwMGlmNEZ0eEF6cG5WQmlwNVZlR1c0?=
 =?utf-8?B?RnBqbmpYZXBCRzF5ZkpYTWVDejNzVlZ1WkdGa3N5YyttZWhaRCs4amRlNVNB?=
 =?utf-8?B?SmJ2aUlYQTBzQW02bmZxaVgxcmQ5WjRuMldpdCs2Ukw5NFJyL2plVzQ0VTZs?=
 =?utf-8?B?VUdDQXdKNmtJWndOSFQ4emZZM1VHQ2RTc2tYekh4YXlqelpTbGVtVFo0SDI1?=
 =?utf-8?B?QStKQVdpdzEwcGxzWUtRMlBnR1NCdmd1WVFOdTJRc3pzMUFHZ1RnUE96Nzl2?=
 =?utf-8?B?THlGNWRkYnR4ZDdkdWt6d1BKYURXY3UybHNySVpRZEMxaTB1akI2MFVjQ0wr?=
 =?utf-8?B?dVA2WmFaY05idFU0RGZhQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SlRQcW95a25nS1dWNTZreXJ1KzJ3SzlCV3FmRmpQV3dTTENJcUN6TEFKNFRF?=
 =?utf-8?B?MjRiM292UGRodFhzRU1oZWxZRzJpakdYMnNLeGVzQnFITWxlaE5FTld0dklt?=
 =?utf-8?B?cy8yZmF2RVgrRHNQSncyZWpDTzBpZTBoNlZMRHdwQU03bmtPRHVqKzY2N2g0?=
 =?utf-8?B?UmZ0MURKaVppL2hndnFhbFJIZncxQyt4bXdvQmh6dlNGUUxCQ0E2L1pQRmE0?=
 =?utf-8?B?bTE0ODJIUk1OU1Z3dWkxbXB4aTluY2RUbVBlS3NtdEdTSmpiS2FoOGJ1d0l6?=
 =?utf-8?B?M3JYTXoyOXdxbEpJaXZJRDk3STIyY1F4ekxQTXo1eFpNQlltV1VqcFpTUS9D?=
 =?utf-8?B?Z21NSGZKV29nMnZPSVJKUm9TN2JuRDB6V3hKdWtUeGhXbCtZeGxtbEJOcGpF?=
 =?utf-8?B?YjBtbEhaVitVayt1VFFvdUhZVlJteXFPbzc0RkExTlcvVDhMRVFrQVhVdktR?=
 =?utf-8?B?Y1AwY1pVQVhoQlBEbnN6NnI0VGdzRFN2YXYzV1ZGRWRzNmhHM3FtcDVSRlVY?=
 =?utf-8?B?bFAyRXVyMS9qOHpydTk4OG8wbG1FeVgxWEI2bDZPNWhEN0RzenFkZm9Pb3Fo?=
 =?utf-8?B?emY2d3hsRS9xa2hNdGNDNk9seEdtSktOY2tMZWZNN1l4VmkyTExqT1VvZzZq?=
 =?utf-8?B?T3RJbXcxTUJtZ1gyMFRETWVMbTNkanQ4UzZYbjlzVVVxWXVJdUM3aEIwOVQw?=
 =?utf-8?B?enFocDFXcDFpQzI1N3Z4K2NZVmZWOXNRRFEzNzV1UnNsZDBWVzhPTVBpbllM?=
 =?utf-8?B?UFFvcU1DVHByQmJXK0FQNHpsaDlSeXNyUTA5UUlsOTBRL1hOcUJBaGtHNndV?=
 =?utf-8?B?Q3JUVmpDUitKRTExVStmdElYYTVWaituUE9EQVRuLzlsdzFIWHBZVDI2M2tO?=
 =?utf-8?B?cW8vMlBwcUxmVitjWkZBZHlzT3hWL1FyVTJwVnoybGE4andKY0hkRDJsSnBx?=
 =?utf-8?B?TnRCdDhkWVJsME5Jb2Q2NDU1bU1aQjV0QlJMaDdZZElBZGZadXNONDc3d3Ra?=
 =?utf-8?B?L0lKWFVMakxFZXkxK0hqUFZ2cGp3dFdSRHlEYnhhQlQwdWtKMVFBYXBHVCtD?=
 =?utf-8?B?T2pubE1Ea2NrSWlGbUVYMk1DUGJBdHBremZuUTRrdW9KNTNuUWdVTGo5OVhq?=
 =?utf-8?B?aGMyVEdzNW8xVkZ2V1dPTk1tc0YvdzkvRk9GK3hQdXFvMGp5Mk9ERDBranpH?=
 =?utf-8?B?Z1BlMTFTNFluREk5VmRrNllPdVpjSGt5SXFKSVhiSk1OY1FSYXVSN1NSNTht?=
 =?utf-8?B?Nld4WnhjTTVPb0lPeGI0VENkUnRaVVBvVGU1Vng1ZDdSMXF1VldwbE50L1VE?=
 =?utf-8?B?Q3FST3VFVjg4NTM5RWV3QzRvRzFzaDc3STNpSUlhRzhnWW53Y0N6anVxS01k?=
 =?utf-8?B?bWtXSHMxVWtHd0Q1b3RIS1B2WlJlVHdlNVJOU1FUNGRuaDFEcURRK0pZUXpV?=
 =?utf-8?B?NmFZYUZDaDIyVW5za0pLZG01NGYyMG9WTERpcWJ1d011UmVwaDYwb3ptZGZZ?=
 =?utf-8?B?ODF5Y2pBR0ExOTQwRnV1MkZPNXVkL3Bwa3hDeEJzSXQ5WjIyQVZHdDMzWnFX?=
 =?utf-8?B?bURsanExeTEyeEJqb1UzMU9UR2Y5R29DZDJUYlZ2OEpZS3gyQ0pIb25CK1JT?=
 =?utf-8?B?cEJVTUY0SlB1V004L3pMT2dHQS9BeGY3ZkQ5a1lwcExvMHluWm42N2Q1TzAz?=
 =?utf-8?B?akE4YnZ5N3h3ZFkySHZIbmRFYk9QSVg1UC95MWlHRkpzSytxUG9KRzM2ZlVE?=
 =?utf-8?B?QTk3SlBMQkcyZjFnMmN3YzdNVFByRmhvTHMzZnJpSVJYS3RaNnRFTUJIQ1dw?=
 =?utf-8?B?UnBoazVpUDA3Wjk4S1lYWjh2VUtQTmVGbkcxcmdWQm1UYzJPQVNNbko5VTNL?=
 =?utf-8?B?M3RpUTE2L3oreUsrcDBzOWxyV29FY2tqUW9hdkRXcjlpNEtNLzZsbWlreTl6?=
 =?utf-8?B?YjVaRVE5dUpxVVBXMjdvSFBvU0lXQUFqUlFZcW9lNFZtc0pKRDQrZlpEb3FU?=
 =?utf-8?B?Q2hGMllNS1pSaUZwckEyK3BBSVBsSkthaGtyQjkyOExKcFAwOVRPcU5sUThO?=
 =?utf-8?B?SHdKZlpUY3c2aWtwSVh1MTg5RGIwVjFiS3M5TFRleFZrWGM1OUpHQjlCZFox?=
 =?utf-8?Q?sHc4=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f49ad9c6-9622-4010-c9fa-08dcdc724081
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2024 08:24:04.9077 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jKr3UntUqys/qiQgVPrztEhdA99/UWAmFPCt2fj1dWOLCNA17+gbaUmkB0fuAwih
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7466
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

Am 23.09.24 um 12:25 schrieb Tvrtko Ursulin:
>
> On 20/09/2024 10:06, Pierre-Eric Pelloux-Prayer wrote:
>> At this point the vm is locked so we safely modify it without risk of
>> concurrent access.
>
> To which particular lock this is referring to and does this imply 
> previous placement was unsafe?

We use the root PDs dma_resv object as VM lock to protect most field 
inside the VM structure, only a few are protected by an additional spinlock.

And yes, previously it was possible that you got a mangled process/task 
name because no lock was protecting the task_info structure.

Regards,
Christian.

>
> Regards,
>
> Tvrtko
>
>> Signed-off-by: Pierre-Eric Pelloux-Prayer 
>> <pierre-eric.pelloux-prayer@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>> index 1e475eb01417..891128ecee6d 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>> @@ -309,9 +309,6 @@ static int amdgpu_cs_pass1(struct 
>> amdgpu_cs_parser *p,
>>           p->gang_leader->uf_addr = uf_offset;
>>       kvfree(chunk_array);
>>   -    /* Use this opportunity to fill in task info for the vm */
>> -    amdgpu_vm_set_task_info(vm);
>> -
>>       return 0;
>>     free_all_kdata:
>> @@ -1180,6 +1177,9 @@ static int amdgpu_cs_vm_handling(struct 
>> amdgpu_cs_parser *p)
>>           job->vm_pd_addr = amdgpu_gmc_pd_addr(vm->root.bo);
>>       }
>>   +    /* Use this opportunity to fill in task info for the vm */
>> +    amdgpu_vm_set_task_info(vm);
>> +
>>       if (adev->debug_vm) {
>>           /* Invalidate all BOs to test for userspace bugs */
>>           amdgpu_bo_list_for_each_entry(e, p->bo_list) {

