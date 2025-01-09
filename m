Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A351A07681
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 14:08:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A1F410E45D;
	Thu,  9 Jan 2025 13:08:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="yh31oKBt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20605.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::605])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A663A10E45D
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 13:08:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lpjz4IDTm9Oikjz02qU9NKLLLjAosQwI9W/HsOiPcxZhWjm4IM3GxpvcbaCER4ncyJf50UjTCsnLxMUuVTFMNWK5rpXOZwUG2rmw+aReyrOLV8aXVcuoTak3GmgbmqIp+K6xkc398vWmYpttntC4ZLTTCqAOt4uGTgOZbihgSTVksqkTDQf3DDHGpiCqxXV4wHXYz77qAYKEaLRO/TawT2Dtp8eGbT/NUgnljeYIryohLp6QHjW3yiSBjoavNmkuB1zcf+KToJ+/fkRRJoJog7W7FCrS02wabPgFAgVC5aFSpkQYWXFMdnHAMN2Lq/dCLCaa9/5aqN5+bT0bXI40iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VGd3JKH49gKTjD/Y74jrOQAOR5vCrFehwDZJFRLYoh8=;
 b=mOsoVDmMZNuVUliDFyvZVmiXAqUBjpJndDmWSqHczGopHh6nwv9/C2bOONFsLEvjs370sPMMBSL7Ieiou+udLZUvVMXsHfsZrAUV9IbIl/zroKfPN5p8UmPVaUz5E1SzOnB3gqehB+Ck5NMN3laSEZtAViIwdy7CcCUwet4rMnDR3FY5jpf+VAHVBYMz0ZQpeHwUYHFVhJ2qQ19nlaFIfgXaG7KmL8y2FeebuQuWn2PLa9pLJ3rYwXeaCuunY6PJaTb+CP5w+wFkiMbKcaXkkE7ANRRHz2q2vqI3qS2d0okzfUlXQ3aaJrbaLjCp2yvPkZhS2gNGG5sWxTIKqsxa0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VGd3JKH49gKTjD/Y74jrOQAOR5vCrFehwDZJFRLYoh8=;
 b=yh31oKBtBL0GTufPM6+MS0EyhLXRiuT/B/J/OKiGWmKykAnKOxL0ka9i9ijZ90PvaSPtYgz7D50MSSnTXX2iBEuRfxJMs4Vy6QTjD0mc3VGrRyT37W4tq1wU439mT/NiPE1CbDLZzEd4Bngbi0DWJeohcAJQfkJebPIEoiFAgh4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA1PR12MB6457.namprd12.prod.outlook.com (2603:10b6:208:3ab::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Thu, 9 Jan
 2025 13:07:57 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8335.010; Thu, 9 Jan 2025
 13:07:57 +0000
Message-ID: <562bc7ae-ba04-4dc9-a524-3bbf3e8afd50@amd.com>
Date: Thu, 9 Jan 2025 14:07:51 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 16/18] drm/sched: Connect with dma-fence deadlines
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Danilo Krummrich <dakr@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>, Rob Clark <robdclark@gmail.com>
References: <20250108183528.41007-1-tvrtko.ursulin@igalia.com>
 <20250108183528.41007-17-tvrtko.ursulin@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250108183528.41007-17-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0055.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cc::12) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA1PR12MB6457:EE_
X-MS-Office365-Filtering-Correlation-Id: cc2dd718-9f4b-459d-f295-08dd30aea30f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bS95S0czVkxTcEJTZnBHdWY2MnRpOXRBaG4vcUh4MUo5VVlQWnpmcTB4K0Vn?=
 =?utf-8?B?MnVaRW1JS0tCcEc2SUd3NnJtZGk2VDZWelpWckhDNHVVM2QwR3NSVE9BUk5G?=
 =?utf-8?B?SEgzVlR3RitsR0haeXZwWUJ0bzVtUVdWWnM3K3lBT1NRMm9Zd0sweHNVMDJ6?=
 =?utf-8?B?eXFBRWZqU0tlVnUxdnlETDkwc3c0QmxRWnFmOWJVRTF1MUhiYnB5ZXNKcmJS?=
 =?utf-8?B?SmRMbGlvWWQrdUR0UlYxMlZpanluUW14Y0NDeCtKNHVKZGxxdEhpVWNVSVRs?=
 =?utf-8?B?RENCQWpjWGdITk9maGNmOUdVMzZlN0JLZm1vMHRrRVhlRVNrT0Y1YjBsYThp?=
 =?utf-8?B?WWdJUGI3eXYrVzJRMmxnMWlJTENST2pUdXRJamhSR0lOcERvOVQyYU9WaFpQ?=
 =?utf-8?B?dlhFeFZVSzZTT3BzVjN6MC9Bd3BMUDVUMEJlaG9ZMmlYQ1AxMCtxZE1FMm1Z?=
 =?utf-8?B?WVZQODUvNmFmK2hrR1N4SFJmWDMyUW1FWWlDTnp2dDZpRGVoT2k3WjlnelNx?=
 =?utf-8?B?Zmo5cHpURDFDajU0SEFvNVdadHUzVmI1dFFVRzJOQ2JJaEFNRTJGbElCY2ho?=
 =?utf-8?B?NmxzSnJENkcvekx1c3ZzNGJrVVBibTc3SnNPYWpCVXZmT2NyRW5vMWJnVU1x?=
 =?utf-8?B?ZjZjamxCSjBESFhQeEFJTVhhR0VwS3RWWFo0am0zRmhnTjF1REczL0xrNXh3?=
 =?utf-8?B?QUI2L0M4TW1lb1FNOGNMTGRKSmpvNGF5MUU3eFlvd09HV1VEbG9aRE4xVzhR?=
 =?utf-8?B?UWxDY2pqcy85TkRvaGFwS3BSdEExV0Z5UStLdDJYcFdZQVZsbWx0VE4xRmpH?=
 =?utf-8?B?VEJVbFRXREdDTkFTNngrMWJiV25LVXNiZDkwdWtOTHc3NEpJL1FrQ1RzdUU4?=
 =?utf-8?B?OTZNN1hUdVkwVXNDdlJwa0ZQZkhHTkdWdFphVU5jb1RWK1dvWkw0WTFMSFgz?=
 =?utf-8?B?eEovbGJFR3dkenVXUVlxSThZNTBlZTBoT2VpUDl0bVVvY1piaHZ2TUxoTTZr?=
 =?utf-8?B?STJjZ0Zvc2Vqd3pvVmhzUEVPYU0xNVFQTVhUK3ZHVmw4WlE2UXpjeHdhTlJL?=
 =?utf-8?B?RE41SlJVdFkxMjEwZnZYZlRzNlZJU3RHOU9naUlqdXBjdGlmRFNmRzBsU3NU?=
 =?utf-8?B?WHpibmZHTW1tYitmMEVQZFBndE0ycG9YWWJRMTNEVno4cDhiYytuNXZqaFcx?=
 =?utf-8?B?RFJ0elUvZkZZYlBIZmJOd1pQTGZFUEtET3BJQVJTNVM0bmVHSGpIN3RvMXR3?=
 =?utf-8?B?ejNFcW1YeU8xRUUwMHNuN045L3FXdDBwSDVmVzUzSmJDR1J2ME1lQm5wQzNX?=
 =?utf-8?B?RXIzcFpqWTVlcnVYYm02SVhpZHdjSEZzUDFiTDZ2TXNXWWF0cWxMSHMxM1Uz?=
 =?utf-8?B?OWF4OXJiSUI1aWRBVkhrbG9TeEozWXpxQjhpSGtaRnlWd0NFM3JlY2d2RG1E?=
 =?utf-8?B?dVJ3RDdtODgzWjlwOU9haGdSeitoVXlzdXFSVmNpUzkrOWJweDdxVWdxRmpU?=
 =?utf-8?B?VThWSzE1cHRjcURlSC9QaGhGODBObjVvVitZV2VSV09NOVZ1WTRSQjREdUFt?=
 =?utf-8?B?aGhhMmpORnVmQnF4MENEOTlEOUFObUNVQzFMVmdJc2U1UEdwdkJPOWpsZ1Y2?=
 =?utf-8?B?dWZ1R1pRQWV3QVdSOVArUjN6dWJnbnRDWXRVM0pTeVNNNFRoWWtKWlYzTzdm?=
 =?utf-8?B?d1VHeFZKWmZBUzRWeHBmbUF2cjk0bVNZZFQ4a0xRbW5MdEFDYVVaK2VwYmtN?=
 =?utf-8?B?aEhJQVJucTZkWmJBc1JiREF3b214U1ZwZmlpaHZ5UUdiY1hHSnpyZ3Q1YXhC?=
 =?utf-8?B?N0pSS1VBTy9aNU15MXRrMHg4UjFtbCtQaDdCcnpESmZZY3BraDg4bnF2cG5r?=
 =?utf-8?Q?H9qb7g7Y13tTF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0UzZzhvbTd2Y1Z4ZnIwQ3dDQ21RNEltRUZtRUorajBoRVA2amV1ZDM1ZXQz?=
 =?utf-8?B?TVJXTHVMVWFsaExlMzVZS3I5MURrMFlOSlo4bHg1YVg5bThReHZxRFhYNTlP?=
 =?utf-8?B?QVRYTFEwNDRhQnF2azFrdzFTMmhRNkZsTzVIMmVIOGs1RGh5dWkraHcxVHhN?=
 =?utf-8?B?MEd0cmkrdEx6WW9UbXBLcENvUXdWWXRDSEIwWTFXeUlMRUsvdGl0Sm82Kzg1?=
 =?utf-8?B?VWJwOTVQREFmNTBrMkRHNVlyQW16R0E4K1BRcVVrY3ZwQVUwRW9WS3RNaTRw?=
 =?utf-8?B?M2NpNlpSbC9Id3BYWGtkbVdvZm1hTEY4WW1MdGJSWVdmc0ZJY29CNjBZRjgx?=
 =?utf-8?B?cUtWV1pyV0pkME1MMGd6THVJN3dNTSs5eWpqb1BxRDlhZDZ1ektmYW9wdUpu?=
 =?utf-8?B?SDVwTm5NWWVjZE1UMG5sMEV1c2pkOVNvSC84UzcwSFJ6UjdWaFZ6QkhPdVAx?=
 =?utf-8?B?czZLRGpQbTRKUlBtRmowd2ZRN2dIUWtPeE1lU3FXSFNnZSswbHQ3clZGU3Mz?=
 =?utf-8?B?Vlp1RDQveVhISkJKZEhKNjBOVkY5VFZnQlBtTHB5YjFqcSs5dHNBVDZmSE15?=
 =?utf-8?B?NThJZzcrRjZGL1JOOGdlRERndUJvL2E0WndQbDQ5NmdvMjBOYWsrYjlPY3NP?=
 =?utf-8?B?Z0xEcjl5K3VOKzFwLzdGajFnZk5DWkZsTTRVa2F1QkZObmwvbG56Rmd6Tzkr?=
 =?utf-8?B?cmQ2YXVxalRqL3E0THJRdEFVNnJJUExmd01oKy8yTnFrQnBadXpOeWVHQWpT?=
 =?utf-8?B?UkRReGJ6RFhvOU9oMlZQUnh6OFFCam9Janp1cHVJNHpxaWtwcGJKc21Gc0RT?=
 =?utf-8?B?eU1DVVlPZWNIZS91enVPM05sajBad0luMGFnRVBnZmYwSFhCODJsdXFwVG9n?=
 =?utf-8?B?ek9wSUpJZkJZcUZSTm5TMWliMTYrSm5aMldab2puUU52bWJPaE1YbGRQdytt?=
 =?utf-8?B?VUlzL3k5dWxUYWd5R1hLc2UzOG85SHhSR0Z1eUZWNWlLUllQMEwrT2cyNTMx?=
 =?utf-8?B?bEpYaWNobjg4dkFhdUJ3c3lyY3FoZGVEa0hvYlJlU08wVTA4eDJEWXFrbnd4?=
 =?utf-8?B?aDhpK3hqYnFNOFlhbnh5ZTB4ZkFzcGJEalRETFJ5Tk1KbUNJa1ZCcjE0dytM?=
 =?utf-8?B?VGRQK2NrYURBYm80Q0UxTUdrTFArSWRtNStCcFBmVHFzVDZsL0FMVkNTakZH?=
 =?utf-8?B?UERKS1lTbXd3d09tZzluQUJCRSt4MURueGRxMFVyNkMzVWx1MmlmcUhKYmJO?=
 =?utf-8?B?UzIvSGdSdTVYVHU3d0hOc1Z2L3MwdXFUZHhoWmJVUUdtVFFKL2pGNkFXblY0?=
 =?utf-8?B?ZldPQjhSR2ZFb0R1bDE1bDNEbGpvcVc3eEpZdHVTQlFGN3RvZzBuZXpPTzRp?=
 =?utf-8?B?dk91dDNZOWlLeUFqTndadE0wRjVwbkFTektHZW5tZ1psVG02ZXNDOWtkRU4w?=
 =?utf-8?B?TVFKcWJqR2NubEc5bEVoUTBrVkJCTXpqTERCV3FHemdIYnBZVXAwbm13aDg3?=
 =?utf-8?B?ckROWGJpT1cybzJPbnh6WnBZUFV6aURSeFZ0MUNBL0s1RksvSUxQRSt3aEx6?=
 =?utf-8?B?ZjlxQVhzN1NoSWhwSjQwK2NCZzFQbDN6UEs1eDhsN2FFRW5ReE9nWGkrRjhh?=
 =?utf-8?B?MS92bTh2S3NYRVJDcXlYaHQ3bmY1SitXaVN6TU9lRGkxc2hVNzdCVytVZHVK?=
 =?utf-8?B?STgwRTdZSTdxTjRZTFR2Z1lvY0JkOE0rYnJSMytEL3JSc2t4MlhFZFJjSUhq?=
 =?utf-8?B?V3Zra2Q4VWxPcU10UzF5ekwvdksvaUpYVnZ3N21uZEFtOERTS01vcW1WNGs0?=
 =?utf-8?B?MmZOV05tWk5TYjhOZUc5MlVjLzZONjFIVGVlN2toMVREYUVxWTR5STE0bW1k?=
 =?utf-8?B?RkNCTTRrZThaUlJkaTgxeXVRZjBBYTduVXQ1YjVrWllxcWVtU2VjenpUOU1n?=
 =?utf-8?B?dy8vRzNKT2hURkdrU0hDT3lITTJ1TzIrdVFTMlhFb05IRkpEK3dvUUJ5eGc0?=
 =?utf-8?B?Z0t6WnRmV3ZmL010RmZ3ZHB6Rmw5ZGhwd0JuRG5BaG9WcVhZVjhpbGJobkNm?=
 =?utf-8?B?K0gzeGpIM3o5cTlYS0ROSzhyZW9xY3RVNjVoajk2YlQvNC9RbmJZY0dxMWZq?=
 =?utf-8?Q?g71DsPqOTlueTnRlRfTYCBHZA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc2dd718-9f4b-459d-f295-08dd30aea30f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 13:07:57.6933 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uhuo6WT7aCQTcaAolX6AFNit6AoUx1FxYIHiG87x2ZFkNGbH3SPEZuzeTbkGSeM4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6457
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

Am 08.01.25 um 19:35 schrieb Tvrtko Ursulin:
> Now that the scheduling policy is deadline based it feels completely
> natural to allow propagating externaly set deadlines to the scheduler.
>
> Scheduler deadlines are not a guarantee but as the dma-fence facility is
> already in use by userspace lets wire it up.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@redhat.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <pstanner@redhat.com>
> Cc: Rob Clark <robdclark@gmail.com>
> ---
>   drivers/gpu/drm/scheduler/sched_entity.c | 24 ++++++++++++++++++++++--
>   1 file changed, 22 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index 98c78d1373d8..db5d34310b18 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -410,7 +410,16 @@ ktime_t
>   drm_sched_entity_get_job_deadline(struct drm_sched_entity *entity,
>   				  struct drm_sched_job *job)
>   {
> -	return __drm_sched_entity_get_job_deadline(entity, job->submit_ts);
> +	struct drm_sched_fence *s_fence = job->s_fence;
> +	struct dma_fence *fence = &s_fence->finished;
> +	ktime_t deadline;
> +
> +	deadline = __drm_sched_entity_get_job_deadline(entity, job->submit_ts);
> +	if (test_bit(DRM_SCHED_FENCE_FLAG_HAS_DEADLINE_BIT, &fence->flags) &&
> +	    ktime_before(s_fence->deadline, deadline))
> +		deadline = s_fence->deadline;
> +
> +	return deadline;
>   }
>   
>   /*
> @@ -579,9 +588,12 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
>    */
>   void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>   {
> +	struct drm_sched_fence *s_fence = sched_job->s_fence;
>   	struct drm_sched_entity *entity = sched_job->entity;
> -	bool first;
> +	struct dma_fence *fence = &s_fence->finished;
> +	ktime_t fence_deadline;
>   	ktime_t submit_ts;
> +	bool first;
>   
>   	trace_drm_sched_job(sched_job, entity);
>   	atomic_inc(entity->rq->sched->score);
> @@ -593,6 +605,11 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>   	 * Make sure to set the submit_ts first, to avoid a race.
>   	 */
>   	sched_job->submit_ts = submit_ts = ktime_get();
> +	if (test_bit(DRM_SCHED_FENCE_FLAG_HAS_DEADLINE_BIT, &fence->flags))
> +		fence_deadline = s_fence->deadline;
> +	else
> +		fence_deadline = KTIME_MAX;
> +

That makes no sense. When the job is pushed the fence is not made public 
yet.

So no deadline can be set on the fence.

>   	first = spsc_queue_push(&entity->job_queue, &sched_job->queue_node);
>   
>   	/* first job wakes up scheduler */
> @@ -601,6 +618,9 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>   
>   		submit_ts = __drm_sched_entity_get_job_deadline(entity,
>   								submit_ts);
> +		if (ktime_before(fence_deadline, submit_ts))
> +			submit_ts = fence_deadline;
> +

Yeah, that won't work at all as far as I can see.

Regards,
Christian.

>   		sched = drm_sched_rq_add_entity(entity->rq, entity, submit_ts);
>   		if (sched)
>   			drm_sched_wakeup(sched);

