Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6EEBC9AF7
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 17:04:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35DC910EA88;
	Thu,  9 Oct 2025 15:04:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="B4OJ+xIf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011020.outbound.protection.outlook.com [52.101.52.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51CF810E162;
 Thu,  9 Oct 2025 15:04:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jo/leYUzH/kje3u78LDaXNnK8XrhdYNcOAvo3lAhd9UE3uDlSXVLqIiTTCyT05HVajjoXn604+JXygjT+UWbLd+Eus72q/CHI1bP5JvYKY3BOc85lpX0MbqackB/w9i6lMAz0yf/lNsVOtPWs7POsY9Mt5GNOM7Ci1fOsFtzx9NtEavXFHg9YNMSnAoUi4kUKQDrtZ0eDOkMinrl/YuUqsT/H26ymiTTNha83TFXl1eHZKjfufZ22Yb2U+t1DvAspLlgED9lYh/fKBoPbRAEx4rc/mOEHjgs+JSAxfBj8XJ8Sw4oHfIIowxRrC/OK1uBPP4cZQlBT6xIYwqAdXT+GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rReh1pir7hbJT00WJDlEE9ZTUqxVgHkB8wTV3nQ3qJM=;
 b=w8ck8kXMzpS1dJ1mtDpb+Vz6YJDBh2M8NuA7JclAQ5To5vSW6+r9Empd4M9q39VkpxJ53yP7FQrdRxCaJXhQpUygjb8rQOg8qdq5vk51/QFGz3ayezpCPByCiPGQTzye9ucB8a+AxTBz4SvmGBkVRTE6o4TF62yCcliMQEv8mF269egg35L0yvcgLAO4X1DksFgs/m3foUgWB8frv8bPDFpDOHrI3voy88EauPoHJNPxLffhWAbVC3ea7lYPJ3htO8ps2rE0IzimbRD4XTNIh0f3AMXpQpbpfDMi2Gc77Nf2tVHZEjL5CBzJs2QuPjBCwUV0Thd/Hit31MRMsKEDXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rReh1pir7hbJT00WJDlEE9ZTUqxVgHkB8wTV3nQ3qJM=;
 b=B4OJ+xIf7NST38m2/btEhyx6r6J1Qcrdc4ThIRuk7ljbBsuE1klT3Z3cqUWlweCSXIGLFfhqj8tjk+F3zPdjOwyi2kAhCQz7ryax2iTPhgd55zWFY1va5GxP5zz5/y1P6b7lyeIpQq2lLe22k8YGSxJ3+Eqaq8BT/qeCPV8EqZY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA1PR12MB6678.namprd12.prod.outlook.com (2603:10b6:806:251::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Thu, 9 Oct
 2025 15:04:44 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9203.009; Thu, 9 Oct 2025
 15:04:44 +0000
Message-ID: <14de5473-534c-4294-bb1d-41d1a43fb46d@amd.com>
Date: Thu, 9 Oct 2025 17:04:38 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Avoid killing entity last used by parent on
 child SIGKILL
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
To: David Rosca <david.rosca@amd.com>, Philipp Stanner <phasta@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Matthew Brost <matthew.brost@intel.com>
Cc: amd-gfx@lists.freedesktop.org,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>
References: <20251002150524.7552-3-david.rosca@amd.com>
 <d67cbd3a-5cd8-43b8-badf-3f264885429d@amd.com>
Content-Language: en-US
In-Reply-To: <d67cbd3a-5cd8-43b8-badf-3f264885429d@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0036.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c7::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA1PR12MB6678:EE_
X-MS-Office365-Filtering-Correlation-Id: 24a99b9f-4fe2-4cf8-3c1f-08de07452e2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RnpUNnB1bXdwYkx6dXVQaGNua3JtZ2lCOTRtT29jTHA3TUxFME9xbThyZXJt?=
 =?utf-8?B?WTBsaERhMy9RNjNKSkpXSkV4TU9MVWZhajM5aTR5VWhzUCtWcVBqMjZYd01x?=
 =?utf-8?B?eGpLQzN4QlE2MmlEZnlqSXdFMHp1aWcxYnJqdW50ZWcyNXlscjJlUWlBNTg4?=
 =?utf-8?B?dTgxVnY0MDNoc20xMjVrRVh0UFZEcnlZaVZsN3pPWldLWDB5UFRPOTU0N1JG?=
 =?utf-8?B?Vmt3b0NpOFFIRzFKbnI0OWUrKzFyeFFkcVVuOXRSWXR0dFl6Rnp2UnpOY01S?=
 =?utf-8?B?UkRyYnVEQytBcFF3V2pNZzRhd0FxRC9CUWNpT3Q4NGd3RG9rQVcwNW9qUlgv?=
 =?utf-8?B?UzloNGJOeFM0U1RMam9aYVlXVmJuTHdQTUdKcmNkUDZlMFFmazhuZFJkTGVi?=
 =?utf-8?B?aU1lMDVpOUpVd2tBSWFud0E5QXZTVERaSDhESExucDF4Y2p2VHM1T3Y0Ky9r?=
 =?utf-8?B?ZzZubUovdytUa3JMTkZtcGJlUmgxZjBReHp3WnlPcWJ5dklRbmhLMUxsTHcv?=
 =?utf-8?B?UjR1dS94dGhDUTlseEVwUktDeFQ5clhDbUFiSDlJUnpoQnZKZUxHQTRUcGZS?=
 =?utf-8?B?WmIrQnpSc0dJajQrckNySlNkdndzZ0E2NWxwcTFBeGloVVNEeHZDQS95TEVI?=
 =?utf-8?B?NzR1TkNtOHdGMFRxR1B1bGFwN2c3MThqbTJGM0c3aGhSakRtNmNWcEgxQVBu?=
 =?utf-8?B?bDIxai8xTG05NFQ1RGlMK1Y5T1RDZXVvdkZOemV0OHJOSW1ybzkrRGpYQUMz?=
 =?utf-8?B?bDZ3OGd3ZGRSK2haQWJLNENJVkVRUkdPNkZnZjI2dXNvY2V3VEZDNWZ5cTRt?=
 =?utf-8?B?L1VMOG9jQ2JNOWFLSFE2emNScS9aUCtsUnV2bW5peVpzVzE2UEtsQk5yQmF1?=
 =?utf-8?B?MVZHUTFSenpYbnJTWEpybU4zUEhPUkJHeXh4TlBKRkxPckp5MXE3MEJxelZB?=
 =?utf-8?B?MXV6dWxmVDU3cjhkRnlmdkZ0aVJxSTk0ZFBYajBjR0VTNHU0emxHVSs1bk9m?=
 =?utf-8?B?MG1CTUMrZ1VSUzZmUXNPaXR3clM5VUNxSUo5VWxXQmtTR3djSU5wM1VUY3hn?=
 =?utf-8?B?ckZ6ZytTUXl6b2JjUldVcHdVaGV5VUdLaWJsMEd2QmdCWi90RlhZZ3hsWGlC?=
 =?utf-8?B?N2RUUUd3a0pzNWppeTlqbzRnTHgvNU13WDJjWkttV1UwYzVlNmZaY000Q3dk?=
 =?utf-8?B?MStmNlU5QnZRRStlVno1MmFmMFVpZHFINnU3Z1YxSFQ5V2J1cnRVc3NWTFNk?=
 =?utf-8?B?cVlLdTQ2Y1daV2NRMmJhYko2NmNIcUJsblBQV1NveE5HcE5JLzlIUmU1L2Ri?=
 =?utf-8?B?ako1bmF0Y2pNN1Q1eW9SODFKZFcvY0FKcGIrYzdBcCsvclE4TFJYMHJuSnNO?=
 =?utf-8?B?VlpYZGw5OFJQZWYrNWhjRktrOWh6WEZrOTJicmVZb0g0T2VPaWlKU0llVFFY?=
 =?utf-8?B?S21Ia0JQdmJSeFd3dTBnTHpmN0pDeEVIR0I3SUhDdHE4UWxUelRZc3pTN3Bl?=
 =?utf-8?B?Q3pDenNDZ2hOcXZmVUNOREVEdFRKY3crNk12ZTBGSm5mQ0JxK3pvWklDSHd5?=
 =?utf-8?B?NjhHaS9RUFg3M090cVJWcXhnNzZtUDh1TUxmdG5NbkNybzRQVnVsdUN6YXkv?=
 =?utf-8?B?OTBnQzVMbElXM0pOb0ExZEJjT3JuYkhUcVdZdjdjbnB0Vlo2TGV3MVlSZFgy?=
 =?utf-8?B?anZhK3l3aSs3Z0dybWluNUFQZVpVRjhtRk50NklGaXlBZkdEKy9yWnpFc2g1?=
 =?utf-8?B?NUwzNDc0Rm9UckRKVjlycGV6aHIrTWJDd0JDWFNydTVaM3pyQzlLTnoxdWc4?=
 =?utf-8?B?MUREMUFCSjhDblpmUm1LejhUOEx4VjFlOGRCYmdLcmo2cHlTR0JIZUoyV09x?=
 =?utf-8?B?QXExcHlaakFGaG5ITmdKSzAySEx3b2oyVG1FSHRVZkhwUkZFMjIrckdwV2l4?=
 =?utf-8?Q?oSLg9dJHlooDEagUt2QvAG8WeWjkD4jy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3BGdkdIKzJoSlNiZTY0R1hXR2o3Rmh5THUyd3hyS2pBdTR6VnI1dTZlSEs5?=
 =?utf-8?B?Q1h1RHdERjZDOTNNS2JNajNuc29pSGdlWVQ3T2FmQ3ovdUUrK2VaTFV5Q3Ry?=
 =?utf-8?B?UWxFL210bzV6Q2luMCtCTzJsT1BOSjh5MGg0WE44dHArNkNCd3kzeXhWSTR6?=
 =?utf-8?B?bXg1Qk5sdUNwVXlpbUNHQ28zSEdxSXVwNWpDTGovb1lQL0pHa0hxY2JqMjl3?=
 =?utf-8?B?VUxKUXJwWjByQjlUbFZEaDN4eUZNQVkwRC9yRkJnWE8wdFlkS3AzUDZVOGdI?=
 =?utf-8?B?emxxdTJ5eDBxd1lnSUZCV2ZQeWJHbWIxZ0J3dlVEYVcxY00zMlM1SVZ5UTVr?=
 =?utf-8?B?dng0ZTY2emNjTUNVbUlmTzdoTUdKTG5FWlltanYyc0tPckxpcUw1d0lZcnZ4?=
 =?utf-8?B?OENuZnQzclZoRnFZcDVBVTlSdzd0NVBvTzdDaUkwYWdkRzNFRGpEN0xPZC9l?=
 =?utf-8?B?a2I1K3pqbU1RN3QzV3RrdHo3NXd3ZmxzZ3c4SWoreVlzTm53VmRlWG5jL1gz?=
 =?utf-8?B?SXJ0enRjRHhqT3IwbWpHditMMENTLy9lYnJOL0lvM3dnL1BjaEI5SllEeVRW?=
 =?utf-8?B?a1RpblFndWs3MzV6THRiNVQvSGZOY0Q2a0ZGZjhIVG5qQktPZU0vTGRRSlhh?=
 =?utf-8?B?MVZabWNya0M3dXh5UnREelUwaVFpTlVXM0gwRWFrNm4zSyt2cmRGeXB0dSt1?=
 =?utf-8?B?N09LQUw5bkk1RkJ2SFFmc0pteGxRZGpGUnZ2bWJENTNSa0VzM2M3RDBYN244?=
 =?utf-8?B?MHBWYjZUNmpkUVY3MXNKektsd3U0SENVU05tcWRSMk41enNnVjVTYkxnVm9j?=
 =?utf-8?B?ZmttY0xuT0NVUzNOM2VLSldmU0owWEhGS3JhR29kUkVUcEpReDU0cmtIYVo3?=
 =?utf-8?B?dktqbkJWYTJiQnhDQkxBUXo2ZjNucEdISWl5dUt4amJiS2YzSmNtcjBzVTVu?=
 =?utf-8?B?d3RWZmF6eDlNdEYwV0F1dktaYXpkRUlFMS8ySnZ5bzVnRTVramh5YkdVWGRQ?=
 =?utf-8?B?VTVUdmhrOVRNUDlGMmlkT1JaQjRrbEtuUWFOQTRHeStPbFBEelE2TEI2L1dR?=
 =?utf-8?B?OWpESmxMRytuUlYwTzV2VXF6dFJCb2RlUnRPL0dpU0dDZnlGTUx5cHNkbHZT?=
 =?utf-8?B?N0RxeE5zR2kvdzJIMXVKeWNzRlV2b2FpdnpVSnJCQ3o4YmJUcTIzUFRBV2Vx?=
 =?utf-8?B?MWlLRnkxdllERzNuMGhNeC9pbFZtNUdxM2lUc01BbUgzUGxuVXdHK3NwRUtw?=
 =?utf-8?B?VTlyVDBvM24yUE1zVkE0SEwwWFR1R3NYVVJ3Y0RNek1Wc2R6ay84cDYvSWV1?=
 =?utf-8?B?SXBRdkYzbi8vT3NlUXNPTlBES0dicUp3UnIrZjlGNCtkSER5QUZta2lXY3hX?=
 =?utf-8?B?RjJVdmhkK0JCbGRWamNocWYzWHlDVGlPbnprcXFwWDQwTHVBRVlnZUQxbEVW?=
 =?utf-8?B?UVdXc2xKbzBJRjA5WVlQTjlxYVVWaHdhSkZ2d0FtMklnb2dNOEw0NmpNVzA4?=
 =?utf-8?B?amxpUm92TUN6eS9GMUpvRGw1eE9HVGJrTGZmVjBwclplTGpWbk5LQnpQOXZU?=
 =?utf-8?B?WkRZeDBGR0tGWGpDUmtkeUtoekZ0cS9qSnQzcUlKTlJRK295akl4VmpUYmJ5?=
 =?utf-8?B?enVCYzZPWTRyaC96VVREU2lPWkd1ZzlCN3BHTHpsNUhMQ1B0cEgxMHErRjFX?=
 =?utf-8?B?ZGtqazY5bTFBcGthSWZoa3ZaUmw1elJlRGMwN3kwREs5WXBMdlRJQnFaaUhH?=
 =?utf-8?B?WjdRTDVQYVZBZmFtc3FXYUxTZ21yL3kyRFlRVVdVb29GUTJFeWZyQW90Z09X?=
 =?utf-8?B?MlU2UFRwdnpLK2R3Z000N1p3Rk9ya210S2ZUWkJmVG5Oa01lcGdTeVBMYUVZ?=
 =?utf-8?B?c3hRM09wWlBnbkh3RXRGZVdZbkxkem9yQ0N4RWQvV2JGbU5kWU9UODhJWExt?=
 =?utf-8?B?RW9iREoxTWI3ckgvditSamgzZktrT3FUazRnU2JwUGE0WEsrTE92TmFIRW1l?=
 =?utf-8?B?UytvcXhndWQxaGZoRm9wTHFVYW1PMUd3YVN0M2JXSGcveXpIV0JSdmpMaUc1?=
 =?utf-8?B?WEVzQm1tR2xNeTNyekFoNXhLZmJkT2kwc2E3TkRyTW9BV085NHVqTTd5Q2lE?=
 =?utf-8?Q?t/CF1To0DBNcMgkW8ZXTKICHr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24a99b9f-4fe2-4cf8-3c1f-08de07452e2d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 15:04:44.7497 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HorBiFk0WZrno5jdOOdOY+rW4vBz4AWyPX8z5c7iDEkGPDVvUrCUJLlZB6aBvJo1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6678
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

FYI

On 09.10.25 09:01, Christian König wrote:
> On 02.10.25 17:05, David Rosca wrote:
>> drm_sched_entity_flush should only kill the entity if the current
>> process is the last user of the entity. The last_user is only set
>> when adding new job, so entities that had no jobs submitted to them
>> have NULL last_user and would always be killed.
>> Another issue is setting last_user to NULL from drm_sched_entity_flush,
>> which causes subsequent calls to kill the entity.
>>
>> Signed-off-by: David Rosca <david.rosca@amd.com>
>> Fixes: 51564e9f06f0 ("drm/amdgpu: Avoid extra evict-restore process.")
> 
> Good catch, but in general please CC the relevant maintainers and mailing lists for scheduler patches.
> 
>> ---
>>  drivers/gpu/drm/scheduler/sched_entity.c | 5 ++---
>>  1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
>> index 8867b95ab089..a325e4a59990 100644
>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>> @@ -70,6 +70,7 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
>>  	entity->guilty = guilty;
>>  	entity->num_sched_list = num_sched_list;
>>  	entity->priority = priority;
>> +	entity->last_user = current->group_leader;
>>  	/*
>>  	 * It's perfectly valid to initialize an entity without having a valid
>>  	 * scheduler attached. It's just not valid to use the scheduler before it
>> @@ -278,7 +279,6 @@ static void drm_sched_entity_kill(struct drm_sched_entity *entity)
>>  long drm_sched_entity_flush(struct drm_sched_entity *entity, long timeout)
>>  {
>>  	struct drm_gpu_scheduler *sched;
>> -	struct task_struct *last_user;
>>  	long ret = timeout;
>>  
>>  	if (!entity->rq)
>> @@ -301,8 +301,7 @@ long drm_sched_entity_flush(struct drm_sched_entity *entity, long timeout)
>>  	}
>>  
>>  	/* For killed process disable any more IBs enqueue right now */
>> -	last_user = cmpxchg(&entity->last_user, current->group_leader, NULL);
>> -	if ((!last_user || last_user == current->group_leader) &&
>> +	if (entity->last_user == current->group_leader &&
> 
> You still need the cmpxchg() here or otherwise drm_sched_entity_kill() would run multiple times.
> 
> Regards,
> Christian.
> 
>>  	    (current->flags & PF_EXITING) && (current->exit_code == SIGKILL))
>>  		drm_sched_entity_kill(entity);
>>  
> 

