Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5784C5D30E
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 13:58:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8764110EA60;
	Fri, 14 Nov 2025 12:58:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="CSZZVY2q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012039.outbound.protection.outlook.com [52.101.43.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A46A810EA66;
 Fri, 14 Nov 2025 12:58:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yERJ2PXAIgmuo5M/QsHp8Ln97kaqMB5zin+49+GOil+B0sSRASdHrhoSJkqXw+Zukjf2yBAa02zudmSeg6OkG3xYYqqpxGO67ePjgqOrz6SPe2raOsqmCZkakduOfxyAmtBu8kM71yfa4r23SEgtom+h4RRX/I81x8pCsQEl+o9rqKjFU9XkRi5Ix/E9MqRxyiLd4SqJ6GOz8uDR7dPKclJf11HJFtxOFPGZEZuEcZm14w1UKno9mUu/boaO7HWatSRon1r66pLKpQTHiZ1ok/5mFDwoflDDwr6ozcc6hfPUY8MvqxpLW8qKw27KCjerLiTMSsgqtzd42nmaeo8RYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ixi19oG4evZLw72q52HCVr5OnzAnsFx5TPXb9FQARRc=;
 b=CPAUpXFZIl2f8BQPIJXIWJGzzylCqmbT9/7DPZ2NHor4tcdawBxIgJ3aTfZ1rwIR84gBqYr5/AOS2oBuMqjuhVNGVszbKC+H11iMaRbKq3edx9RE2kTLzWA3HpK+QFUbJbVE4seHZAupUeKJPVxW1rSOLafbzOeKUQmdc/WpTrJoCM6rtcj+JedjOSGisFP1GOEJG4MWQbJijwl82lWtO+Fx6lt+9IXlEDTUATQYsbZJYjnp7bQOiZ7JgIX158uaivafyp3ypPkRdCfWVPhWVZvDcu50LLIFjuG5+aEGn+pIb67dmvzPVNeITZlKbaAcgG5qKCr0ygplTSPhSfaIgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ixi19oG4evZLw72q52HCVr5OnzAnsFx5TPXb9FQARRc=;
 b=CSZZVY2q90buWuVIDntn5EMdNdUuF/T1IkBmndF6hE5oLm/qFV7iasNbBFcqB4JiiAcWH2vVEOTw9xsxQaxXnG3tKOI+hlPZx+d6SKakR/jeko/K7WhnDI7/ypmaGsvt9iu6RNsE76OJG04ZFjUVtqK2P+VVbtDGZSZyeQQnpb4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH3PR12MB8996.namprd12.prod.outlook.com (2603:10b6:610:170::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 12:58:00 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 12:57:59 +0000
Message-ID: <c9601cb5-109f-4968-9c3d-452044012532@amd.com>
Date: Fri, 14 Nov 2025 13:57:55 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/20] drm/amdgpu: introduce amdgpu_ttm_buffer_entity
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Felix Kuehling <Felix.Kuehling@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251113160632.5889-1-pierre-eric.pelloux-prayer@amd.com>
 <20251113160632.5889-5-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251113160632.5889-5-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0235.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e9::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH3PR12MB8996:EE_
X-MS-Office365-Filtering-Correlation-Id: e95343d9-dd4f-42e9-9604-08de237d702d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VVZWYjVPQytZRmRzVU13OW9lSjdLNmY1UXFZc0d3QXZHY01xK1dsb0E2OHlZ?=
 =?utf-8?B?blI0MlJ4T1dEY3lzcTdQMzZWaTlVdStybTBDZzVpbnM3VUxxUDF2VFFBa3Y4?=
 =?utf-8?B?OWpqSkFtZEw1T3AxWjU3ZzJHTHk0S1JyU2YwS0VBVEd0VWJRMGVyTVpFR05H?=
 =?utf-8?B?bmN0ZUMySWM4T294czNzVU5QdzRKWUhaMmRBV3pBUnhXSUdyT1V4RFNDa1VG?=
 =?utf-8?B?TzJqKzdmMFovdzhwS2tJVmY4cUtCMXpQUEgrWmZwZEtQb0tTTVgzSmFRYUZI?=
 =?utf-8?B?alBXWTVGNy9iRUU3SnBIRzVjZEtwQ2VnMzQ4bHZQWHl3U2JJQlAwUVBHOEhH?=
 =?utf-8?B?dWtYN2JRbGJPWk1TWnhkdXFkaGx3eGJHeENrUHNrdEh6RlQ4ZHVFbndNNFhB?=
 =?utf-8?B?TEN6b0xhSU5FdVZpTnI1UmwyRjBnWEpMNE5QQm00N3N5bzJLZnJmSFNsNk9Y?=
 =?utf-8?B?UHN2THZMdjlyYkFpeHgrQndyWWV6dWk1azVZTk9JamRVMVZOR05NcXN5RkRN?=
 =?utf-8?B?NVJxdmZHSFVlV2RRNmlmbWg0K2JvOWNlVTF5Vk40L2g4TVg3REtTM251bXJK?=
 =?utf-8?B?ajZyRnVIYTRXNWNkMlRxWDRsZU84RSt0YUtRNlF4bTBIeENVT2lESnQwU2Fr?=
 =?utf-8?B?RzR2Ym4xZkVjTGZuSWtlWDhyYjZHNEEzMDIvYVhXaXlWRDd1WFVib2JBUTlK?=
 =?utf-8?B?YVdqZ1JNTUpLdGdHRG5RL2d5MHJJL3FHQ2wwRVhYUkxGeVUyRWRwU29Tb1lv?=
 =?utf-8?B?VWYwblpzR3owaVpMY2lqRTFOZUFwVEFPbDFKbk9ZTUZPMEJIS3hCVlVvS0Ux?=
 =?utf-8?B?NlQraS9ZbnBqVExBQkhRRmhtZUxlUHl4TVZ0V01HRjFrclEvbU9hZkRjM01p?=
 =?utf-8?B?VzIyclhHTnpTZU8wSjAzUy8yclpXeWowWXZldmJGR1FmTXNqOUNNV05VRGJS?=
 =?utf-8?B?VmRCYkJqMkNTTU5HQVJOSHNPMkN2Z0pSQVVrZzRXang0Z3BCaERSajhyalgz?=
 =?utf-8?B?d2hZeitJYTcydFUxWUJBQmxoNG9QV3VBZ2Z1c3BvNVY2SVVDMGUySnljVkow?=
 =?utf-8?B?NnNaZDFubkdTT3NFRmI3OGV3QW82TFNVYWZpMXR2OTZOVzM3WEdwcjgxTFBH?=
 =?utf-8?B?UXJFZ3Rna3BNTjZqWUZkY1RycjhBM2cyRk80SHlxSlg3cGM4bkMrS3MrTFk1?=
 =?utf-8?B?NUx5bDhQNmd2UnJDUGxHRlZpdFlmNTNnWWtEWmdJMkd3b2x4SlliWEhxRGxU?=
 =?utf-8?B?UVB4MDZ1cTRkeW83MlFxdHNSZUFtMDlHZW9DZUZoSlp6ZVpMUFpHV3RCbEgv?=
 =?utf-8?B?RkNSMG5SanN3YURCMml1TG1lVjV0RDA3ZEF2U2hPVzh2RXR0cVBqVmk2TERr?=
 =?utf-8?B?MmRnZDVQeWZyNzFMNkc5bWFVaXZxR3dMZGRoS2Yxc0lnMHZIc1JKYjJHZm1J?=
 =?utf-8?B?YWpQd2RyVVp0YWI3SVU4UG0wR2V3QllRUVZUcTRjYlM2L0FpNFIxelZJMTBE?=
 =?utf-8?B?VUUwU1cxZUlhU0I3QUF6Unhqb284Zjl2dUtuV3YzWExvOVFLc2k0THZwRGxl?=
 =?utf-8?B?ZFBwbnAzQ1pXb3EzU2htcmlxTWhjcGxLRmhoRFNPa2hYdUhVellHNXV0eFNy?=
 =?utf-8?B?K3dOcHlabW5BYWZEdkhUclp3VkV0SjhyOG53QmtFbUxKZlB0NmduQmhhV24z?=
 =?utf-8?B?UDE2dDhGRy82VHdiOG4zNGtFbHNrdFFWYTlMOG1RU3JWSXJGRExqZmhLbkpZ?=
 =?utf-8?B?elFZajQ0TzBRM0M1ZVlrVHF3ZnFvelNEM1Nvekpac3V2TVBnYmJQWWJrN0ky?=
 =?utf-8?B?MTMrWm5Za1F3dTRUOCs4ZGFSWndRbFZZZCtvdVpHbFVBNUZ4VUpkcVFuUlFV?=
 =?utf-8?B?RGVVazQ0TVl3V2NHU0tFVEZIb3RuZ08xbVFkN01sWTlzZjRHRHhWUW1ZaXFn?=
 =?utf-8?Q?jF+Riroxb5ICmGvA+OhxL0jBmc0i/mz4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0NpZWNFc055aE1xd25GSzVUN3h6NDlnSTdqK0laS1ppcFphT2pjdjRwK3Y0?=
 =?utf-8?B?d2I0dkhTVDJ4ZW1NTEdCS1I2bFlVM1lpZHZjT3k4T1Jjc3M5VU10aGo2N044?=
 =?utf-8?B?b28zR3VhYjdZWnNnMTFYY2NXR2ZvNlpVTDdNaFVCRzhYU2szd25OU0Jadmc5?=
 =?utf-8?B?ZjN6YXdTSmNxQVF0d3lMLzZ0NExoa3hCb0xJOHFaTkxQWE5mdDllNzFjeWFh?=
 =?utf-8?B?eWxLS2lWUCt0dmphUnp4cHI3ZEtQYVdJVmRqMDZyUVJuWG9Kb0twaVhFSmxN?=
 =?utf-8?B?bTVvMHBoWldrQnpWQVhnai9SYTZENG1IcHRjUzlzVjVoVU5rVFdKeFFmbkdI?=
 =?utf-8?B?TGhHaXA5VjNtYWZ3L2tsKytjeFpTaVpGSDloa0Z3Z0x3czZYRVlhVkNzeXNz?=
 =?utf-8?B?dTE2Q0RhNTd4dlFuREJkOWd4NjZaenpJS2t3YlF5bG9DSWlFWnRiRnNOQXAz?=
 =?utf-8?B?WWpuVG1hVktiU1d2QkNnUGFSS2RDKzREcHVCRW1xVE1sNWZpaWJYcDIyandY?=
 =?utf-8?B?S1UzVHQ0RHBjalhlZ3JTRS9ERFZhV3hMN2M4Sk1lTk1aT0VpMk1WQ040VDZN?=
 =?utf-8?B?TGlvY1FRYlZXLzRRQ1A4ckRYQnN2NXNuaHIvdTA3QlRoOGVxK2dJUis3aEQ1?=
 =?utf-8?B?WExFWWJuOElmZm84NS9nYjlGQk5sNGZsOHpVLzBWaktnNC9tcUpiNWVpRUwv?=
 =?utf-8?B?UlU0UnRrS1VDQk1ZSm5RNDFxLzlCVm5EdnNsMGpqMUJiR0IvWHowbUFSUWRW?=
 =?utf-8?B?Y1pjcEFmMEttU1A0c2IrM0RvcURGZ291RlB6R0VGVG9vSXgya2ZWT3FBQ2NF?=
 =?utf-8?B?Q0wrMktIK1YyVGlDZEl3a3JDcUViM0FCRWNGMHhkdHVnemZleEIwWmkrY3Q3?=
 =?utf-8?B?bzNJN2cwTlBiYW5YUW5lVmhCU0JiT0o4eHpiUkladVlkV1FtVWFOazBTWmxv?=
 =?utf-8?B?dUpTb2x4aFYzdGNybE9keFBSZ0NDNVhIR20rR0pLVW50UldlQUtIUkszT09i?=
 =?utf-8?B?aVdhRmZ0ZTNhcmpSZnVHOTJsdCtmTXFEWFd6UFd1TzRraS9hL2RxQjNHYXFn?=
 =?utf-8?B?cXljODh3eVJlVTJ5aDQvZThoNFNlM1Q4SFpkVXZCVDRQK0pLd0ZsN0hQZWZZ?=
 =?utf-8?B?M0NEUXh2N1NWTzRFZXVuZm5QOHBud2txSFEyTXRvVldYalJDZjQyTWNpWWc2?=
 =?utf-8?B?dFp3UE5wTGd2TldZbThjZmZ3N1IrRnVpaGdzcDd2TlUzU0ZvT01wR2JyOFV2?=
 =?utf-8?B?YkNWMEx6SWpGUUF5SXVSRWcyVDhGcGZPV0lucTByaVJOS0dxcFN1R2RSd1pt?=
 =?utf-8?B?THRuL29pcWFWZTNBb1dUVUFGbU0yU041MTQ4NGV6c3VPMnI0V1o4ekt2a1VL?=
 =?utf-8?B?UjQ1UzgyWVhLUldySGxOREFXQmhVNktjazJvQU82TmhWUEtHTVR0WS9sRFJm?=
 =?utf-8?B?Zm53ZDIvYXpNczFwdS9ESjFIRWxQTHo2ZDJ6WXJSMk4zNm1WMHMwTTYrS1lm?=
 =?utf-8?B?VlRNbXhqL1NjYlpUOXptZkE1a2JFTE90clZjb3hhVkNJOFJtLzlmM09HeVo2?=
 =?utf-8?B?QVBLYkU0aEM1L0xxVjdUekxCN3Y5ZUc5T2hRbXF1cGhZa1VFekpCa3FyaFVR?=
 =?utf-8?B?R2xEbXNPTnE0N1hYM2ptRGtmN0J1YU5Wakd1cHAzeUJGRFVabjZNRi91N2hZ?=
 =?utf-8?B?em1zZHVPa0tyMk82Tzh2QS84Vyt6WUg0ZWdYZDZmVjNBTXFSRzk4K1Y5MThV?=
 =?utf-8?B?ZWlVSzRrSS9GRG52OFlWajdkbFI1QWpEbHJTVzEvT3hzVkNldkdHeEpiVHMw?=
 =?utf-8?B?WStDcHJ0czBhZTVYOGdsRUQzWFB2ZS9IM2hZeHlJdDRFcTVYVzl0V0Q2clpD?=
 =?utf-8?B?QTgwRndjOHJrME9hREJCTmhzbHdMMHVvQUFKYXk5L3U5N0phUUd0U2RKMGwx?=
 =?utf-8?B?NEs2cmZLL3k0NEZKVlNqUGUvRXJLSXJITG9WSDZWSWY3eWlwM2pzN3cwTkZ6?=
 =?utf-8?B?ejdVeTRuNE9Zdm1iZ0RCellTTXpZblN3WlpUb2hyN3pzUS9GMk5xR1B1aFo3?=
 =?utf-8?B?SFBaSG9GWHhsTCtPdHlYZTFIckJIRVBTdGRiZWh2UUk0a1RGUmZzNTNxcTdE?=
 =?utf-8?Q?ypoZIeASxzRh3UPlzz6wXGuvR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e95343d9-dd4f-42e9-9604-08de237d702d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 12:57:59.6700 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C9EtVbNr0jgiWBJ1Q/fewiv1l1UMTk2XsbAL2C+F3KVeT5V3fYcB/kSMGkgKqzXO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8996
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

On 11/13/25 17:05, Pierre-Eric Pelloux-Prayer wrote:
> No functional change for now, but this struct will have more
> fields added in the next commit.
> 
> Technically the change introduces synchronisation issue, because
> dependencies between successive jobs are not taken care of
> properly. For instance, amdgpu_ttm_clear_buffer uses
> amdgpu_ttm_map_buffer then amdgpu_ttm_fill_mem which use
> different entities (default_entity then move/clear entity).
> But it's all working as expected, because all entities use the
> same sdma instance for now and default_entity has a higher prio
> so its job always gets scheduler first.
> 
> The next commits will deal with these dependencies correctly.
> 
> ---
> v2: renamed amdgpu_ttm_buffer_entity
> ---
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c  |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c  | 30 +++++++++++++++++-------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h  | 12 ++++++----
>  drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 13 ++++++----
>  4 files changed, 39 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> index 9dcf51991b5b..8e2d41c9c271 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> @@ -687,7 +687,7 @@ void amdgpu_gmc_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
>  	 * itself at least for GART.
>  	 */
>  	mutex_lock(&adev->mman.gtt_window_lock);
> -	r = amdgpu_job_alloc_with_ib(ring->adev, &adev->mman.high_pr,
> +	r = amdgpu_job_alloc_with_ib(ring->adev, &adev->mman.default_entity.base,
>  				     AMDGPU_FENCE_OWNER_UNDEFINED,
>  				     16 * 4, AMDGPU_IB_POOL_IMMEDIATE,
>  				     &job, AMDGPU_KERNEL_JOB_ID_FLUSH_GPU_TLB);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index c985f57fa227..42d448cd6a6d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -224,7 +224,7 @@ static int amdgpu_ttm_map_buffer(struct ttm_buffer_object *bo,
>  	num_dw = ALIGN(adev->mman.buffer_funcs->copy_num_dw, 8);
>  	num_bytes = num_pages * 8 * AMDGPU_GPU_PAGES_IN_CPU_PAGE;
>  
> -	r = amdgpu_job_alloc_with_ib(adev, &adev->mman.high_pr,
> +	r = amdgpu_job_alloc_with_ib(adev, &adev->mman.default_entity.base,
>  				     AMDGPU_FENCE_OWNER_UNDEFINED,
>  				     num_dw * 4 + num_bytes,
>  				     AMDGPU_IB_POOL_DELAYED, &job,
> @@ -1486,7 +1486,7 @@ static int amdgpu_ttm_access_memory_sdma(struct ttm_buffer_object *bo,
>  		memcpy(adev->mman.sdma_access_ptr, buf, len);
>  
>  	num_dw = ALIGN(adev->mman.buffer_funcs->copy_num_dw, 8);
> -	r = amdgpu_job_alloc_with_ib(adev, &adev->mman.high_pr,
> +	r = amdgpu_job_alloc_with_ib(adev, &adev->mman.default_entity.base,
>  				     AMDGPU_FENCE_OWNER_UNDEFINED,
>  				     num_dw * 4, AMDGPU_IB_POOL_DELAYED,
>  				     &job,
> @@ -2168,7 +2168,7 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
>  
>  		ring = adev->mman.buffer_funcs_ring;
>  		sched = &ring->sched;
> -		r = drm_sched_entity_init(&adev->mman.high_pr,
> +		r = drm_sched_entity_init(&adev->mman.default_entity.base,
>  					  DRM_SCHED_PRIORITY_KERNEL, &sched,
>  					  1, NULL);
>  		if (r) {
> @@ -2178,18 +2178,30 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
>  			return;
>  		}
>  
> -		r = drm_sched_entity_init(&adev->mman.low_pr,
> +		r = drm_sched_entity_init(&adev->mman.clear_entity.base,
> +					  DRM_SCHED_PRIORITY_NORMAL, &sched,
> +					  1, NULL);
> +		if (r) {
> +			dev_err(adev->dev,
> +				"Failed setting up TTM BO clear entity (%d)\n",
> +				r);
> +			goto error_free_entity;
> +		}
> +
> +		r = drm_sched_entity_init(&adev->mman.move_entity.base,
>  					  DRM_SCHED_PRIORITY_NORMAL, &sched,
>  					  1, NULL);
>  		if (r) {
>  			dev_err(adev->dev,
>  				"Failed setting up TTM BO move entity (%d)\n",
>  				r);
> +			drm_sched_entity_destroy(&adev->mman.clear_entity.base);
>  			goto error_free_entity;
>  		}
>  	} else {
> -		drm_sched_entity_destroy(&adev->mman.high_pr);
> -		drm_sched_entity_destroy(&adev->mman.low_pr);
> +		drm_sched_entity_destroy(&adev->mman.default_entity.base);
> +		drm_sched_entity_destroy(&adev->mman.clear_entity.base);
> +		drm_sched_entity_destroy(&adev->mman.move_entity.base);
>  		for (i = 0; i < TTM_NUM_MOVE_FENCES; i++) {
>  			dma_fence_put(man->eviction_fences[i]);
>  			man->eviction_fences[i] = NULL;
> @@ -2207,7 +2219,7 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
>  	return;
>  
>  error_free_entity:
> -	drm_sched_entity_destroy(&adev->mman.high_pr);
> +	drm_sched_entity_destroy(&adev->mman.default_entity.base);
>  }
>  
>  static int amdgpu_ttm_prepare_job(struct amdgpu_device *adev,
> @@ -2219,8 +2231,8 @@ static int amdgpu_ttm_prepare_job(struct amdgpu_device *adev,
>  {
>  	enum amdgpu_ib_pool_type pool = AMDGPU_IB_POOL_DELAYED;
>  	int r;
> -	struct drm_sched_entity *entity = delayed ? &adev->mman.low_pr :
> -						    &adev->mman.high_pr;
> +	struct drm_sched_entity *entity = delayed ? &adev->mman.clear_entity.base :
> +						    &adev->mman.move_entity.base;
>  	r = amdgpu_job_alloc_with_ib(adev, entity,
>  				     AMDGPU_FENCE_OWNER_UNDEFINED,
>  				     num_dw * 4, pool, job, k_job_id);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> index 50e40380fe95..d2295d6c2b67 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> @@ -52,6 +52,10 @@ struct amdgpu_gtt_mgr {
>  	spinlock_t lock;
>  };
>  
> +struct amdgpu_ttm_buffer_entity {
> +	struct drm_sched_entity base;
> +};
> +
>  struct amdgpu_mman {
>  	struct ttm_device		bdev;
>  	struct ttm_pool			*ttm_pools;
> @@ -64,10 +68,10 @@ struct amdgpu_mman {
>  	bool					buffer_funcs_enabled;
>  
>  	struct mutex				gtt_window_lock;
> -	/* High priority scheduler entity for buffer moves */
> -	struct drm_sched_entity			high_pr;
> -	/* Low priority scheduler entity for VRAM clearing */
> -	struct drm_sched_entity			low_pr;
> +
> +	struct amdgpu_ttm_buffer_entity default_entity;
> +	struct amdgpu_ttm_buffer_entity clear_entity;
> +	struct amdgpu_ttm_buffer_entity move_entity;
>  
>  	struct amdgpu_vram_mgr vram_mgr;
>  	struct amdgpu_gtt_mgr gtt_mgr;
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> index 378af0b2aaa9..d74ff6e90590 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> @@ -45,7 +45,9 @@ svm_migrate_direct_mapping_addr(struct amdgpu_device *adev, u64 addr)
>  }
>  
>  static int
> -svm_migrate_gart_map(struct amdgpu_ring *ring, u64 npages,
> +svm_migrate_gart_map(struct amdgpu_ring *ring,
> +		     struct amdgpu_ttm_buffer_entity *entity,
> +		     u64 npages,
>  		     dma_addr_t *addr, u64 *gart_addr, u64 flags)
>  {
>  	struct amdgpu_device *adev = ring->adev;
> @@ -63,7 +65,7 @@ svm_migrate_gart_map(struct amdgpu_ring *ring, u64 npages,
>  	num_dw = ALIGN(adev->mman.buffer_funcs->copy_num_dw, 8);
>  	num_bytes = npages * 8;
>  
> -	r = amdgpu_job_alloc_with_ib(adev, &adev->mman.high_pr,
> +	r = amdgpu_job_alloc_with_ib(adev, &entity->base,
>  				     AMDGPU_FENCE_OWNER_UNDEFINED,
>  				     num_dw * 4 + num_bytes,
>  				     AMDGPU_IB_POOL_DELAYED,
> @@ -128,11 +130,14 @@ svm_migrate_copy_memory_gart(struct amdgpu_device *adev, dma_addr_t *sys,
>  {
>  	const u64 GTT_MAX_PAGES = AMDGPU_GTT_MAX_TRANSFER_SIZE;
>  	struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
> +	struct amdgpu_ttm_buffer_entity *entity;
>  	u64 gart_s, gart_d;
>  	struct dma_fence *next;
>  	u64 size;
>  	int r;
>  
> +	entity = &adev->mman.move_entity;
> +
>  	mutex_lock(&adev->mman.gtt_window_lock);
>  
>  	while (npages) {
> @@ -140,10 +145,10 @@ svm_migrate_copy_memory_gart(struct amdgpu_device *adev, dma_addr_t *sys,
>  
>  		if (direction == FROM_VRAM_TO_RAM) {
>  			gart_s = svm_migrate_direct_mapping_addr(adev, *vram);
> -			r = svm_migrate_gart_map(ring, size, sys, &gart_d, 0);
> +			r = svm_migrate_gart_map(ring, entity, size, sys, &gart_d, 0);
>  
>  		} else if (direction == FROM_RAM_TO_VRAM) {
> -			r = svm_migrate_gart_map(ring, size, sys, &gart_s,
> +			r = svm_migrate_gart_map(ring, entity, size, sys, &gart_s,
>  						 KFD_IOCTL_SVM_FLAG_GPU_RO);
>  			gart_d = svm_migrate_direct_mapping_addr(adev, *vram);
>  		}

