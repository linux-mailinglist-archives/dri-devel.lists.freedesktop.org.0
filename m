Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 107D28B1C45
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 09:54:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20F2710FC98;
	Thu, 25 Apr 2024 07:54:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="TyLI0k5/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2044.outbound.protection.outlook.com [40.107.220.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BA0F10FC85;
 Thu, 25 Apr 2024 07:54:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IB02qfntY4ordzQwpjzJM50VGV3Qp2dK4DlD8rDmYGCmi0KgwrLJMOoeeoIJmzESCHS2BtDVwzFcz+SBJvVlCpcnZCnjYoGYZ6G44Y3JwlCbmBldOnObjAv9lIsCsIU+48I6ZVmwj0MmRHMVzXjQisj05TKTN9x7+LPb28xT5cuMYimp3HOZbv7BSUa4Z05v9X06q7SyJdpOkgd2/NQKL/8YBgSmp0jciDlLeXfgJcQ2b0B3JDafgYOvRhmGc603e2upk9wnZFAGt1hHSfM2DbXBMGCfWez3XZXODo1TLmNEuHgrC6AZp3dab0n7r7R3IHaYrLeUy1TvU5evC0DdSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MfPvmKxQxubpvrjwlnpXm7V4Li57PTeBqbl6vyz1X0s=;
 b=PmcdKWHpCS7q3/5N+MebFSIGruwcXFtZbBKYZiem1FwnE0RF+PJ81CqTQwxf65W7yptJrzt8CNTUfvxJ8o9jXIyzpVtup76SVnRH91mp5clxfCXS1kgpjD6Likfg5UjDxraWzzHuxBwMrtq0VZooknO0t7LwFuuz/T6vcuD4gaaIWIUT2FI66DJ1CqeX/qz9NhD79pIsCRsvnmRULrFOIBgwIbLMsw8hRGpAtO+l8as3Pxa8aswBs2r2klWolo0FiStJjCeg8X0nqrIq8csHbCnMlAyPADOXRJ1E8InwirbKeOpvEHsrwpVv/6BFVYensQiM6A3TSgCE2dp/rO5XPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MfPvmKxQxubpvrjwlnpXm7V4Li57PTeBqbl6vyz1X0s=;
 b=TyLI0k5/3JjU8mxshxwyT6RqqsI9fyA3WIqTWT9LV9YllSRx9htcL3hKZWVqJP2y8HtV1Ko2vpTKgHXvKJ7SXFPhnenQ8C/uuJRoqdbNLLgZlSZ4PQkmAAdsZcInEm246XbUPLXz8uAPUjdpRx/5ApmxJAgJJQm5N0ddfOe9Gc8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN0PR12MB5955.namprd12.prod.outlook.com (2603:10b6:208:37e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Thu, 25 Apr
 2024 07:54:21 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7519.021; Thu, 25 Apr 2024
 07:54:21 +0000
Message-ID: <a5a3e5c6-b7fe-4f66-ace3-d6f90f8427ef@amd.com>
Date: Thu, 25 Apr 2024 09:54:15 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 10/18] drm/amdgpu: Don't add GTT to initial domains
 after failing to allocate VRAM
To: Friedrich Vock <friedrich.vock@gmx.de>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: Pierre-Loup Griffais <pgriffais@valvesoftware.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>, Joshua Ashton
 <joshua@froggi.es>, Alex Deucher <alexander.deucher@amd.com>
References: <20240424165937.54759-1-friedrich.vock@gmx.de>
 <20240424165937.54759-11-friedrich.vock@gmx.de>
 <7a112162-8fae-418d-a58e-bf12713b8e7e@amd.com>
 <716004ab-8893-4ef1-8492-00ea64da3646@gmx.de>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <716004ab-8893-4ef1-8492-00ea64da3646@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0083.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::21) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN0PR12MB5955:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fc37479-c8cf-4539-a913-08dc64fcea90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z1ZGWFROWDVYZTAwNGlwLzFUd21qWm1BNmw2QUNOZjVFeGZKSEJveElpaFFU?=
 =?utf-8?B?d09GbWI5cEFOamRLR3hYRjVCT2JNT3JLVHNwMExaSzNFSEFIb3BxYnlSSnY1?=
 =?utf-8?B?V1hPWmkzWC9GUUI5dDNrajZ0ejQvVUFYcThlRm9VUXE0akdUMjhKWUdNWXda?=
 =?utf-8?B?WGZWcnpJZWtINytWUlh5QWdFVDR5Wml1eDFZdmdBY043YkVhWHZPTWo1TFVx?=
 =?utf-8?B?NTAweGtuQ253bWU1dnRQMjhhL3VRbDJaVytXb3pzeXZTVktXWXhiRXc5Unk0?=
 =?utf-8?B?MFRFZ0NGRHJBcnp6NEFLWW9PMUhiQVJDemVGTk5UUnR1cWlLQnNSTk1iS3h3?=
 =?utf-8?B?dURoOStTa0I5KzBSamtmKzk4dWFicUdWSFcwMXBWWmZxeVlTNS9rWVRJcEgy?=
 =?utf-8?B?YytXS2VVbGRrUW9kRTAyb2xFMlZhOWFPNm9Zb1R2TjR2RjN1UmFhRTNtQXNZ?=
 =?utf-8?B?N3RRZHJsNzVZa1R2bFByanFnL1d1cUpONkcvR2lmT3RSSnN4aXpMcXFKYjZh?=
 =?utf-8?B?QjdJRkNKMnNWTC9RV3hRdkYvZThmNVByR2txOGJrRzVjUGFvZ0ZUNXRqdFUr?=
 =?utf-8?B?VVJZMkhZQnFJS0I1ckxla2NJMDhDU0RPS0dkTTc2VzlLd2Q4UE9WTUdOVWIv?=
 =?utf-8?B?WXhGSk1SdUwyTHd1MTdXRXhzYUYydmZlRlcyeVNEa1FqNGhqT3FqYU04TzVG?=
 =?utf-8?B?aktzOXlLb3g0ZEMyUnhrSUp1S2xQbU4vNGlPV3phY0VFSGtOdGowU3BaT04v?=
 =?utf-8?B?blRhalJoUkVkOHZsK1p0QlBaNHlPVkEyUkw5cXZuQzkvR3Yrck9pT2Y0Q01U?=
 =?utf-8?B?dHYyZklSM0krSnZ4YUF6MC8zT1M2R3I2Z1BqbGdUVjlrOEdhZnZSdnRVL1N4?=
 =?utf-8?B?a2QvQ3EySjRlUjg1NnFMTFUxejlhcmw4NXZwaUp5c3FVT0RqK1RZSCtZUkZ1?=
 =?utf-8?B?TlNvY2xHTzZraHFEeHFHaC9TRlhDVXVTVlFxbmduOUpDZG9wNGh6aitEYWNw?=
 =?utf-8?B?RkxaSHdpdEVzNFJPK2VicWNTakZFc3lpdlB2OGV4UHk2Ukhua3A0QmJRMWZn?=
 =?utf-8?B?Z0lFVHRaaTJGWFdIT1U0ditJYzZmOUU2dHNzL29QakVCS29BLzB2U24yV2xU?=
 =?utf-8?B?UEd6a3VhZVdYaE1POE8rQjZ6dXg4NFU1RkFPQmlDdmZpMzBLcWcyWnpuNzQ4?=
 =?utf-8?B?cnRhZVZucmpUVjNITHU2cDAvNmN3OUhjZnVTM3kzd2hVV3UwdnpEdEozTUtP?=
 =?utf-8?B?YnJvK1liOTczVzVSMmpseUxSb3pldTNUMGZVNlhlaVhZQlB6eWwrNWxJSGZM?=
 =?utf-8?B?TjZwaENOcGRmUE0wRkZTdkw2aHJCVzZmcUt3NXUrZWphemtRU05oVVRpTjht?=
 =?utf-8?B?emRZMjJMSjhOVmgrTjN3eTlrZllweXNxbldvck9qM0tnRzZjSUM4Wm1PWWkz?=
 =?utf-8?B?SGlCTnZTMWhEVGhYZ3hSWGgxMkJ0aGZycDFCOU1PajV3aTVZUk1hd2c2bWdI?=
 =?utf-8?B?SFdYanJsQURCaHJhcjAwQlBBSmx2cWpKdUNmbCtoamYvNml4ZmFsdUFsK0dp?=
 =?utf-8?B?UzFvNHA1WHg3K1ZEcHlkeEVSaUZUaGEyeEJWUDhaM0l6VlhuWEhSeUFvYW1I?=
 =?utf-8?B?YTVyMnAvMTVUSiswRGlLYnJwcXBqSEtTWHRZUG81VVRzclNwazZTZWRNZkdu?=
 =?utf-8?B?TzhVbktuMHJieVY1VklpaW9WaFoxbkoyK01PaVBnM0ttRHNYQ2k1bXJnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dEF4K3ZMeWRpaWpLc2JOREVGcGFBQUs2R09UMFE5UUdqRlZBTy9rRWVERExB?=
 =?utf-8?B?WkhTd0tsMG5zMkY0NUh4Nm5JaEM4d3JkTHA4b2MvZGxvWE9yUklFbVJ5T0dN?=
 =?utf-8?B?TzhmVUVqc2c0eHovcW1laFZaNEp1MEFZRGFMSEdLdUIyZ0IvSHBCSzMwcXd4?=
 =?utf-8?B?VmJsWDVRN1lYUFdZNTRVSUM5OWQ5VDBjYnQzUjc0VFNLUGdub3IzQmV0cTRB?=
 =?utf-8?B?L3NtN0ZmVTFBdXh0cDBPU2hOMUErNXNqYUhMdzlpMGdJQ29WdEtHR2gyZWJD?=
 =?utf-8?B?V1hqSkd5RXF6QkprNWxZL0JnWHlqd0Z1TWpkQTRna0pnVUZmQSt3djVlU3Y1?=
 =?utf-8?B?c3FsSEhGamYyTUloQ29VanJCSzliZW5uRXBaTzIwZGt4TDk3S2QxSkNOVWVL?=
 =?utf-8?B?aXRJQmFFTUpGUkVCYUZuTU5RYzZ1R0lNZDQrMGVXcW16b1pzL1JNdmdoVzRj?=
 =?utf-8?B?VFM3NEVUQldKbEhuNk5CZWFkVFlnRjhoQUNiUTN3TUM5ZWVLNzJBbGh5ZVV4?=
 =?utf-8?B?MjAreHZyTWhQODQ0M013cWFsTzZCeEpVSmJOZkNnQUZaMzRRR3E2SWcxRkk5?=
 =?utf-8?B?R1JUVTZocXlWWUlndXg3bVpYWkg2SHRNZWRLZlY2amxVeGJoR3BMUDY2dHMz?=
 =?utf-8?B?OXhxajBrNjJqaFpkNHNKWEFyV3RLRnEvMURoRVV0YXlWWUpodWo4Z0ZEV21j?=
 =?utf-8?B?MHd1YWZTZG15dUdrdnl6aGh1bVkyb2pHdkVIQzNpOGd6VUhwendTRkpTenU2?=
 =?utf-8?B?NERDQmdudDR5N0M1KytTNUU4ZW1vTXl6YzkwRm5OSUhIdGV5Q2FsdmhDZHQz?=
 =?utf-8?B?OE5PR1BDV21VdTJCd0Q1bDVwd3VIOXlBN29qYWVMemdEY2hwdTNGczFXdGN5?=
 =?utf-8?B?U1hqZTB5cndUUWZUajlwNXhrOUxrQ3VtZGY1YUtnYWR6SncwR3M5ajQ5alI5?=
 =?utf-8?B?aWRRbWJGWnRRZ1IwYUZVaGFPRk5vZ3NQRFRpZnVBclV3ZmlnMTZhVW1RTmZK?=
 =?utf-8?B?cTFKMDFrNktncjRMT3ZRcDIySmQ4cmR5YkgzdjdpbTBkdU5ucDNuQnliZWZS?=
 =?utf-8?B?Sm9zZ1BHZERQV2o2TDN2dDFuLzdpNEtlMkRJbXF2dkhLb2xqOVJMUEdFdHdN?=
 =?utf-8?B?c3R2WmJhanhxdytSdFVqSzFhamZ0MzJYTERhMFVDTlVPK0dRSENLN0lvOE9a?=
 =?utf-8?B?Uk1TM0Rhb3hBNmFsOGJXa2p0UCtqVXJjVUlIYjl2bWM0TDMyNzAxTmozTG5H?=
 =?utf-8?B?b0VtQ2RUR244Sm5JdjZHNzl2WTdlcmcwQ1dwTDY5YWQxTGZ1N3VycGxxeE1v?=
 =?utf-8?B?b0puRkh4RlRXWVFxcU1ySDZHcGp2YmZUZHdHSk5tMFVaamdIMVY0SERwbEpz?=
 =?utf-8?B?OUxkTEZWbmd5RkJpcUFDSW9QL3lMMnZXL2xORWJhOXhUMXF6eEk2M2Ztc3Fa?=
 =?utf-8?B?dDRsVVFsNFYrK3E3WHAyMEF3ZzBvZ2VCOEpKMFR2UjBnWC95UTRwc2hLaDJn?=
 =?utf-8?B?S1NZSXZPTDByamdTbWhrbDZnSFM4OEtBNWFTRlA4WHVBbm1JODIrbFMwOHFv?=
 =?utf-8?B?d0V1Q0Z3NTNzMmpiRitsa0RtL0c3SUVwVjJQeW5LVktzc3Q2ZjdSS1NjRjJv?=
 =?utf-8?B?R1FlZnJEYU9OUnR1cXpLcHlFeWFCdlhJakRZNjhYM0M1UHRqRW1ZdFNqUTRJ?=
 =?utf-8?B?SENwditnVzFXQmJJOERDaWF6OHV4M3Zwc3EvL2F4bUtCZnRiNnVQVnBGY1Az?=
 =?utf-8?B?MWk3Z1JmeWpwenVtemFxRGVPdGliZ2FKNGZTbGQ2dFU4S3RtWmRVbVRUN2li?=
 =?utf-8?B?QXoxOGZYMnd2ZW8zanUrcmlWYWlZeVJZSmE2dzR2RW9vVzVNYzNTNUUrSmJn?=
 =?utf-8?B?eUhhTFBCM1ZIVXNXK0ZqdlYvMkVmSEtYZ0o4ZTR2ZFVGWGg3QlRLTmg5VEpu?=
 =?utf-8?B?anhaV2w4WnJBYnVtbzZOb1ZtRDVJVk9HbTNtVVI5Sk10QTlNWnlxWE5KRHdw?=
 =?utf-8?B?SlFUV2UxaTZBdzNaZEVRV1AyMlljdkUwZlg2SlUyd0tLc3lpanJ0cWJRcGNR?=
 =?utf-8?B?aEZFZzRsUjdvWGsyU0NnbFNxUjc1cXNHd2JnNmdaRnRBL1kvMm9ici9uVHZy?=
 =?utf-8?Q?l0+XI7m66hBN9Vtod8cXBEyaP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fc37479-c8cf-4539-a913-08dc64fcea90
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2024 07:54:21.0931 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vjygDfMmk3f1wpr46WrjC1WXjytq9ffigcjFwHXdHy73y1+C30FPuD3XIikmtrrN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5955
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

Am 25.04.24 um 09:39 schrieb Friedrich Vock:
> On 25.04.24 08:25, Christian König wrote:
>> Am 24.04.24 um 18:57 schrieb Friedrich Vock:
>>> This adds GTT to the "preferred domains" of this buffer object, which
>>> will also prevent any attempts at moving the buffer back to VRAM if
>>> there is space. If VRAM is full, GTT will already be chosen as a
>>> fallback.
>>
>> Big NAK to that one, this is mandatory for correct operation.
>>
> Hm, how is correctness affected here? We still fall back to GTT if
> allocating in VRAM doesn't work, I don't see a difference except that
> now we'll actually try moving it back into VRAM again.

Well this is the fallback. Only during CS we try to allocate from GTT if 
allocating in VRAM doesn't work.

When you remove this here then any failed allocation from VRAM would be 
fatal.

What could be is that the handling is buggy and when we update the 
initial domain we also add GTT to the preferred domain, but that should 
then be fixed.

Regards,
Christian.

>
> Regards,
> Friedrich
>
>> Regards,
>> Christian.
>>
>>>
>>> Signed-off-by: Friedrich Vock <friedrich.vock@gmx.de>
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c    | 4 ----
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 2 +-
>>>   2 files changed, 1 insertion(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>> index 6bbab141eaaeb..aea3770d3ea2e 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>> @@ -378,10 +378,6 @@ int amdgpu_gem_create_ioctl(struct drm_device
>>> *dev, void *data,
>>>               goto retry;
>>>           }
>>>
>>> -        if (initial_domain == AMDGPU_GEM_DOMAIN_VRAM) {
>>> -            initial_domain |= AMDGPU_GEM_DOMAIN_GTT;
>>> -            goto retry;
>>> -        }
>>>           DRM_DEBUG("Failed to allocate GEM object (%llu, %d, %llu,
>>> %d)\n",
>>>                   size, initial_domain, args->in.alignment, r);
>>>       }
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>>> index 85c10d8086188..9978b85ed6f40 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>>> @@ -619,7 +619,7 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
>>>                 AMDGPU_GEM_DOMAIN_GDS))
>>>           amdgpu_bo_placement_from_domain(bo, AMDGPU_GEM_DOMAIN_CPU);
>>>       else
>>> -        amdgpu_bo_placement_from_domain(bo, bp->domain);
>>> +        amdgpu_bo_placement_from_domain(bo, bo->allowed_domains);
>>>       if (bp->type == ttm_bo_type_kernel)
>>>           bo->tbo.priority = 2;
>>>       else if (!(bp->flags & AMDGPU_GEM_CREATE_DISCARDABLE))
>>> -- 
>>> 2.44.0
>>>
>>

