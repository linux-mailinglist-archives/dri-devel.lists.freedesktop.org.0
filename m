Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 105BFADB8D2
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 20:28:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3524E10E32A;
	Mon, 16 Jun 2025 18:28:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="uBR6ZIqd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2076.outbound.protection.outlook.com [40.107.95.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99ABA10E32A;
 Mon, 16 Jun 2025 18:28:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jIW9tCyLsYQ06lyqUqGM1D2W2T2dXOx12FB0v7oPVhAWQTy4hJVCxG+bMfmkPBD6QX/KKTqOxSrnVpICOQ+cBbKWqFUEiEpSCPbuTutAziMU0e5JDvy9Etw8JSU+/b5HY+eRRetHrXj/PSJ7IfP5OM2lNl0HNOramabXR7Wd6DfXHMXLQrHnsfV79fsmS506EuuNk83vMeXJq4pCoOLDjmWYKWef3hGfMCFGNYGCxPmfufSfShqQnShgK6QtiwqbMA6OZy3y8ZBiOlYq93EFIoa6fhwKIQ0O/tqhSZYkIlfqupLhS5hrNOyT3uKBbNrxFHI/zc7YmKJQzp0ZB8cmsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fe9/hUpfYj1jpLY+IfPVDqYdakg2NZHWOjTf9BMD8RI=;
 b=W9SXkZS1GgR4JmwJ+1h9S/U5q7RVp6rFSNAwwfdQFfyIGFj0j7FCW3ERP6xB1tF6lZ9Tg+1MJ9SYT8ltrSYNsDCxBXS+l0CtbiI2hv7Ab5GU5I1rYTJvUs3AumDY7r1BPUE7VFnaBIowr4+ArK9ocvNAKG7m9tm6izSzAjHzwTo3ujiC310s+w6A5fJh6KnFuZuasy5DxKvQBV98ucjO55YWzd1at1wcJCTN+5eADIwl6RFXSW2si197gAdZpfzEAaePBvz6DqUxtA2Ma7UeROUp1snE0tPhRxBmfWTBUKkBuK2seRmNRyeVhEjjjZReuonLSQ5wpJM0BnUS6x4uiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fe9/hUpfYj1jpLY+IfPVDqYdakg2NZHWOjTf9BMD8RI=;
 b=uBR6ZIqdvJsfgmkn0hmpc+nEyz2isUB6+bfYmTYMDObzTECN4FEajnG/uPGZOwEUrGQzc2qknzg6tM3AuM/kJ2iINoK67MpWf6BzbRWws/23xkuBmjpyRo+GNeLdL6R1LVKCONy2ZtAShGh7Bfh6fNmjiT/lHr92ay67p6Wt3To=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH0PR12MB7790.namprd12.prod.outlook.com (2603:10b6:510:289::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 18:28:13 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Mon, 16 Jun 2025
 18:28:13 +0000
Message-ID: <cc3f06c2-12f6-44b5-ab51-4f141a4c6e3e@amd.com>
Date: Mon, 16 Jun 2025 20:28:06 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/6] drm: amdgpu: Allow NULL pointers at
 amdgpu_vm_put_task_info()
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>, siqueira@igalia.com,
 airlied@gmail.com, simona@ffwll.ch, Raag Jadav <raag.jadav@intel.com>,
 rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
 Xaver Hugl <xaver.hugl@gmail.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
References: <20250616181438.2124656-1-andrealmeid@igalia.com>
 <20250616181438.2124656-2-andrealmeid@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250616181438.2124656-2-andrealmeid@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0309.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f6::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH0PR12MB7790:EE_
X-MS-Office365-Filtering-Correlation-Id: cc36126d-cdeb-466e-b0bc-08ddad038daa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ajlWczdPMUVtTEMyczJvUkNPNS9NdjNsZ2piNFRjVGFMc0tDN28vVlVZZ2g0?=
 =?utf-8?B?bklXell6azBSbTZqUVF0d2FBb05nUFJkMktlQTFGdlNhN0xyRWpCK3JhYXZO?=
 =?utf-8?B?VGYyRi9pVDNmK3VuWW9MZlV6OXl3UlU0M09hNjNGdWdZcm9pN1dUdTJEUHFu?=
 =?utf-8?B?UjBUWFduRFN6M2FMMWtpQ0ZBMXNTNUs4aEZPaXM2N3lWdENqK0p4WVRuSE9K?=
 =?utf-8?B?TnFnSE96YVdTZ09qd3YrZVl6eXBhSkxJZ0t4S0RlQ2Nub3V5TU42ODVIcG9E?=
 =?utf-8?B?dVRwUTZZdVRlcHZ2KzVQelNMY2VKNEtmVUdqUk5NV1EwZmcycGpvc3JQSjZO?=
 =?utf-8?B?RWxlZTd0d2hFYjJiSWtacjNvOXd4czB1T2krNHBzaU5VQWt6cHVjVExzN0NM?=
 =?utf-8?B?MUU3Zjc3Ynk2M2xkUTNYb0JlL2o1R2ZsK2xpNVZXVXFxSlVsUjZvTVJ3UVhu?=
 =?utf-8?B?WStFNXFBT0RCR2VlTlhpYjdXZGRmYTYyVHNQUUhyRzkzN0x1WG96cTZrRzF4?=
 =?utf-8?B?V2FXc3NMME9iL1lOWlBLV0ExajFodTJVOSsyei9NODMrNC9UVjk0NG9tTG5H?=
 =?utf-8?B?ZlNUbzVxak4wTDhGNXFZMGt2WWh4N0Jkb2l2QjhiclhadWZmKysvNlpEN2pm?=
 =?utf-8?B?Tk5XaTFPOFFURDFGUFJrWVZyT0RuRy9UZmxoRXNSV2Z2eFBpVnV2dkpQK0lJ?=
 =?utf-8?B?bzZxUStOVGZnem1WbGZmRkdKRi9pUGI0ZlFZZHFzU3l1YnlDemc0VXAwZzVy?=
 =?utf-8?B?ZlU0d3RqZTBNcndhclN6aXcweG9iRXBQTkRXTDQzZ2VrdCtacit3cWVmR0VP?=
 =?utf-8?B?djY4bW12N1dqWXdLM1Y2ZGpQUHhrWXdlSmNxeGFMMk5FKzg3YVRoMmllTDJ4?=
 =?utf-8?B?bFJrU21oV2pNQnRqMm0yRlZCRXBZKzdIbXBCNExFY2wxZ2tZakRsQUFoWnps?=
 =?utf-8?B?OTJRMm44T3ZZOWkrVExpejhSRTJmQml4SW8zU0t2ZXc3REpFSXpkelZPcEQ2?=
 =?utf-8?B?SG5WazJ6OXdKT3dIcnUyYXFWcExQbWJPbnNaTU5iL01GNlZ1VjFxTkh6QVY2?=
 =?utf-8?B?Y2hRNGQ0Zm9MRlhKSmZnVjY3UHJpaTFyenFSZ0J0WWFibVFrNE11cVllTjh5?=
 =?utf-8?B?cFVMemNkZlkxOEMyQk1ZNHFzL0xjQk5KemRWUnlMOTFYMndjVnpsWVVuSmJl?=
 =?utf-8?B?VlRqSysrMTlZVHpTSUNDWG9jN2gwUlJLMFZTcEpTZHpNMWIzOG82YnhXekxx?=
 =?utf-8?B?ZVNjRXZwb0syMVRxN1JTTm1UYm1wQ09RcklyMnkxZ0JNUnhMN1JGc3lmWWtt?=
 =?utf-8?B?a2IrenNZbTg2KzZJZUhFZTFzeHdRRGxwRzVCemVXdTRwZmlMaE45NFR4RkVK?=
 =?utf-8?B?M1N3MVloQXlDNkV3UFNUWHlpb1RjZXRkbi9aYjFmZEV1ZFBQM3dkYzhENnRM?=
 =?utf-8?B?TDZyZUViNFpiRjVGVklqVm05UzdyeGRCVTNaOVNGbW1RNllQbWZENUVIeEkv?=
 =?utf-8?B?aGxpRndtRVBmZVBBOW1QaDhHZnBBUEpGN3kvUlk1a3QyYldzL3hoL2xCclov?=
 =?utf-8?B?bndqTTdhSUdWT0duMUNadlUydXM3V2lsTVgvYmg4TjhIMnNvcWhlMlJmcUhP?=
 =?utf-8?B?K1RFdTVESUljcmo2TnNVTlh1VHVhZTFZQ1VVSnFPb21FM0xqcGZiNURHK0Va?=
 =?utf-8?B?Tk55T2NLU1NJdi9IaE5nay9sMkVCQ0oyL3ZhNUNnanZHYXpTamJtSi9LaXFj?=
 =?utf-8?B?eEhXSUZmWEJpbmZjQTZIZ3M5Uk5PSlBNanlJU2xkZ2k4QmVNc2lQUTY2YkRC?=
 =?utf-8?B?aUpuR0tvVGRjL3hpK2pHdnJtK1VXbGt4RnpFYVVDUjJNOHNqeC9qdEV5aXRY?=
 =?utf-8?B?bTVzTzdzRFBHaHNxWmlyVXlnYXdOOVRVQlBWM2lhUndWRFAvQzZ6bHNjSXMr?=
 =?utf-8?B?ajBObU1YS2ZYV1laalB1VUltbjhyUkZGUTFGWkNDeXlSb1RkdktwRmFBR1Z0?=
 =?utf-8?B?TzlYczhNOFpRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SDh2VTZnT2I1N2FMcjFSQ0RyaG04K3lPaVlLYXRkMTZPOXdIVWkyQzhZMXBa?=
 =?utf-8?B?YTZYSXlYeG5sanAyZHlTK1QwMEFJMFI3WXcrVzRyb2Z3c21wMnJvQmVGVFRm?=
 =?utf-8?B?KzdoRnNCbWpUbS9vVGhzVFZKUXhYK3hNdVZJSjZlaUhVTUxzdGJLcTJPWTNY?=
 =?utf-8?B?T01ISnBNMDJ5RnZIaEJlRFEvTEtZT3Z3a2VhU0ovMENteXVEbzF5dm5valZo?=
 =?utf-8?B?TEpHdU14SDR3L2txeG9MTFZDV0RETHVMbjhhMlZQeXFkdEUzSTRlUEtVWFZj?=
 =?utf-8?B?ZWVuQ1U3QlVVOUJKdGxuQ2ZOYVpZMzFTOFpYVml4SkdVYWtEa2xPTWUwd1B6?=
 =?utf-8?B?R2hNc0xBbXIxZWZlUGc3bUhOeExGenBuTldRaklZRWVQUW95UE0zZitjWG9l?=
 =?utf-8?B?dnZBbUxhNEpwcWRHQ0J6RzRnTGFVSjRiQlcyL2swbDRPdzdVZHBDcFFLamk1?=
 =?utf-8?B?WlE1UmppdFN4d1lJNmRuUVkxWmtSUitJTXhOa2M4SUU0SmJGVXdaYVZrMFdp?=
 =?utf-8?B?SGVUOUR3UUxyMG91Y053eXpmQnZtVzZzSjlsbFdEQjZEYmVWek1Jbk0vM1R6?=
 =?utf-8?B?KzdsUEw3ejFFNzVxczNTQU5nTHhHT3ZEaEYvZGNXMC9yQ2RaL1JiTFB2NE9X?=
 =?utf-8?B?Z0E3U1ZKb21obWVGU0hROFRObXlPQWx3Tnp6TFI4WW1icnhoeHU3Q3BqcGUv?=
 =?utf-8?B?UlBiYTY2VXV1dGZ0cWdtaWxQdHJDWmhMcitGbmZDQzU3d1F1bXBhMmdkUTBy?=
 =?utf-8?B?SWQyRmVKVS91ZVdnRHhYbVNPQXVnTHVFWVNIY09uU3R3RDZ3QW0zcmZTS0pi?=
 =?utf-8?B?UzV3ekRPRjVueXEreHpZSlRkdkVZSmROZVpXZDFLRTdmYlFXby9OUmtUcDZK?=
 =?utf-8?B?Q2VTOEUwVWNnN3hKWGVpVDd6NmRMd3FNMnA5L2xEWTdyekRMTmhSNS9ienRo?=
 =?utf-8?B?Nk5Pb2NZbThmb2lESCtLbngrZFJIRk5DbXJhbnM1RXhoTjJQWHE0MDMzbWNl?=
 =?utf-8?B?TDBhc1ArWDllQWt4N2ZDT2tIV3ZGTXlZVWcydlVDYkdUSTM4QTFrelFYZ21a?=
 =?utf-8?B?R0ZFTFZvaUhBWitCTk0xOU13eHgrU1E0STkwcmQzRFdja2FJNitLaWx4ZVFo?=
 =?utf-8?B?N2M4YWo2eHVDb2d4VDJOWnR2WU0rd0lSaGdxclN3Yjd1bHZtZmxKQUpsUXJk?=
 =?utf-8?B?bTlHMTY2dUZhRE9JWjFJM0lQZ3JHUDdyT0t6ZUozVi9uaTNHU0c5MmJQQlRX?=
 =?utf-8?B?cTZQTUtiVS9nWk9qTmtXdnJGczJ1RHJvZXVRUXhzZlpBcmhoZ25wNDNEMlM2?=
 =?utf-8?B?RnE3dGQ4eFk3MDBXOFkweUwvMW9oODhNWjY4Z0tTOE5wNG54b29vWUV0VXZI?=
 =?utf-8?B?VUNrakVvdTlCUFV0ZWJNZkg1bCtpRU9Pd1VOMHlxallqeHZ5Z2RrakhYYlFB?=
 =?utf-8?B?cG12Q3ZYcFNmb0FSYjdRWCtFT3lDZTdCU3E2MURkdDhsdHBtWitqeDBmTHhs?=
 =?utf-8?B?TjJjSnROd0d1WWtRYWJDbU0vekJmRFkyY2hydTFwc0ZnendmZUlJUTJyUDgw?=
 =?utf-8?B?TDJBMEtEdlpoNGtsT2wvQm02MUorM3lIOGI1UER3M1Jxb2V5Ylpjblh5K0FE?=
 =?utf-8?B?b2VISW1BNW8zekhRYjFvd3I2aitLVFVtQzNXMU5XOWJLSHZXbGoxbEdwOGZ3?=
 =?utf-8?B?eVd3NFVpYUFsWFZKL2ZEVGtWRHRaM3RGUFBpcXc2d3RaSi9UMm85TmcxVXA3?=
 =?utf-8?B?Q3pPL3I3azVkNi9FZTBOSGFHWWlJdElQQlhRanBvaW5Sd1puRzlpajU2cS93?=
 =?utf-8?B?WHpmRkRXT0NjTm1NYTBabzNIaTFTb1VCQjhuRXVFd3Q4elIxOW15b04rTGoy?=
 =?utf-8?B?MG9WTVBLZy9FN3N1Ymc5dUE2TFFJWm5BR1FLSm1WdFRvRGxkUUVVa0tJZVJZ?=
 =?utf-8?B?VGNudXBRMFZXZS96bFZZSDc2Qy9IcjR4Y05sNGxjcmk5QnVYZkh0Q3E1Vk9U?=
 =?utf-8?B?R0dGUXdqdjBPNE9waklHMk9iUjhnK3pReWpIbVVmUFFQNEFSZExmOEdIN0RP?=
 =?utf-8?B?RHAzcStmbVowUVQvbE5EQkR0anlTV2pMem9sR3h0RVB0eTRmMTh4QWxFOUFT?=
 =?utf-8?Q?G3ZurMvge8gPriApHxbvVOPXZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc36126d-cdeb-466e-b0bc-08ddad038daa
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 18:28:13.2695 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UJsg73WiFmKdTNTfZc2ouoHgqz0ThI8pj0d3foN3CBnapoOn1YtuJIa8vB/thP3E
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7790
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



On 6/16/25 20:14, André Almeida wrote:
> Allow NULL pointers at amdgpu_vm_put_task_info() as it common practice
> for "put" or "free" functions. This avoid an extra check for NULL for
> callers.
> 
> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> ---
> v8: New patch
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index 3911c78f8282..dadf5633476c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -2447,6 +2447,9 @@ amdgpu_vm_get_vm_from_pasid(struct amdgpu_device *adev, u32 pasid)
>   */
>  void amdgpu_vm_put_task_info(struct amdgpu_task_info *task_info)
>  {
> +	if (unlikely(ZERO_OR_NULL_PTR(task_info)))

Don't use ZERO_OR_NULL_PTR here, that is slab internal and not valid in this use case.

The usual code fragment used looks something like this

if (ptr)
	kref_put(&ptr->refcount, func);

See dma_fence_put() for an example.

Regards,
Christian.

> +		return;
> +
>  	kref_put(&task_info->refcount, amdgpu_vm_destroy_task_info);
>  }
>  

