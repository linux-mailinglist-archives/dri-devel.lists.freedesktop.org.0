Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0AA7A91941
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 12:25:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AC2D10EA9C;
	Thu, 17 Apr 2025 10:25:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="NjQqAD+R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2079.outbound.protection.outlook.com [40.107.101.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26F2210EA9C;
 Thu, 17 Apr 2025 10:25:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QQExCa5U/PUxRzxjPis+iVuukQ3Tg/C084wCV/bABPt8P8bJHCuIJ+2ihLXqROIpjRj7p9feuFUfsZ2OZiI8uWAejd8u3lyy5uGP6g0RjLX/fQjklFXbbP7k3tOcYMjBXyGxssI0ySnpx8prtBYwRkNf/isOcS077ohMu5JaDQ02iizt2p/dNVu9GZT+2EMb/sezTV3I+T/bBOndl18qz6uSOMt1QofxYPCQ8uX8kqvsAA8vuVCoUBI+ohTCgOnGQ9M1g3TfM5n87aW0O9miA0fMJ6kL/WdGMO+mRYEfkyWdShpIn1mUxdChhk79jlAcMR44bpUB5npPgyAeq20dTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gwTR0Hx8dsTFo31S7SCp4gF6Fpu6nY4pAY88bfKLO40=;
 b=jPS78MAGGAlHqmXNMh1V9HD1NmHn0DnT1jdDOPLf+stM21RtKLMJuSCCUxaIfYZn/i4O1FTO+U1OsOGUSLnx/TxlagvXWu9OAVFjgaeXEp1FfhjodSRnSFtPbXx08WrQImguQSMNENs18VVd2Z/LQkfUoQYuORyB5Dky8t99XukT1TH9a0QbJX6W+an8vtrKIKttyPwyNnG392FQsZpPH14PDIPFtCZXVtD3cak+Xe1abLPhQSQ/CzejeCotouzBoEGSBL7RZG+fKCRueh9zDPJQtYciZNXaRzwwAhfrmwpWSBCUbUh4Ruk/Z1EatFa4riwFQhktg6DF80bvIr6Axg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gwTR0Hx8dsTFo31S7SCp4gF6Fpu6nY4pAY88bfKLO40=;
 b=NjQqAD+Rrf8WSZcA78c1CtWD+YRUEX29fWVFblICpuiW5hlkKwCx5Hw6PBswv6JvLJQV8TnFQEb62+TjC+psKVBH7zgXfK8YjPFcQrfNFbXXLQyNwdDeAP+ZwxYNd2ps31zIU7LK+BoDTbbWBxuVlVaOSsNXh31+uZd6LF6Cn5k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5753.namprd12.prod.outlook.com (2603:10b6:208:390::15)
 by DM4PR12MB5916.namprd12.prod.outlook.com (2603:10b6:8:69::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Thu, 17 Apr
 2025 10:25:25 +0000
Received: from BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e]) by BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e%3]) with mapi id 15.20.8655.021; Thu, 17 Apr 2025
 10:25:25 +0000
Message-ID: <a6546d7d-4005-458a-86a3-66d6f309a282@amd.com>
Date: Thu, 17 Apr 2025 15:55:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/sched: fix the warning in drm_sched_job_done
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Sunil Khatri <sunil.khatri@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
References: <20250417100139.2814393-1-sunil.khatri@amd.com>
 <deb4892a-0480-4f5c-b063-1bb03e7cb0e6@igalia.com>
Content-Language: en-US
From: "Khatri, Sunil" <sukhatri@amd.com>
In-Reply-To: <deb4892a-0480-4f5c-b063-1bb03e7cb0e6@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0058.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::17) To BL1PR12MB5753.namprd12.prod.outlook.com
 (2603:10b6:208:390::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5753:EE_|DM4PR12MB5916:EE_
X-MS-Office365-Filtering-Correlation-Id: 94b470ed-e534-458a-a890-08dd7d9a2ab5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RnhmK2g0ZlYzWEU4N1IwbDREVnhLVXV4SHFuaDBxSEo1K3g1dFdBaStIOHlL?=
 =?utf-8?B?QVVHdldsRWE4TXJuN3UvcWkrZzI2MWJUNlJjS3FDUjR5V1ZnSWNYYkJIRkFM?=
 =?utf-8?B?a2NGcktQN212a29GVmlrNktJZkV4c3Z6NXVvemM2aCtHcU5HRXh1bUZHQXIv?=
 =?utf-8?B?ZjU2NkNlaEpsTnF5Q1ZzTFB1dlB0UFRERFFDRXVKU1hsRWEzOXRGbm5lRFIy?=
 =?utf-8?B?cFAwTUNUY0FOVFZubDhpRU1MSWdHaERBR3BWY0lmSGdobUs5NitqcVd4WnFF?=
 =?utf-8?B?c0ZBbVZXRkxZQ1dyQmRHRUdwQXdZWTM3dDF0Vlg5SytCNDJ1b2Jua2M0K0I4?=
 =?utf-8?B?SkVqQ3pKQlI5T0NyYlZBY3lvakUvS3haWEx1N3hlcUd2NmIyM085L0pOZ0V0?=
 =?utf-8?B?SjRaM1kxMSt4RnFERzFhWFQvanpYZzU0RHRPSEZ3VUVyM3hLc0Z4VmlwWFV5?=
 =?utf-8?B?a0poNFRSeVZ5SjRMOHVoaEhxTjArYUlibU1Ndk5wY1FwWGZxZjlkbGZvYUVa?=
 =?utf-8?B?ckUyMXNjWXF1Y1ZuZW9kTDNWUFBpcjc0dnZJbkg2MlFZV0Vtanl5akdLNThD?=
 =?utf-8?B?anV4TTBxOW5ENEZuVHV5U0xDZzJCRkUxNXl0N20xL3FWdFVibklETE1CcTJa?=
 =?utf-8?B?bXNrZ1Nsc1FUOHB0M0lrcEpQTm0vRW5mbFBOWjZSTTROVGRXS04wck8wSW1O?=
 =?utf-8?B?REhXZzErOUdjSFZvRHIyN0kzbFEwSHg5YzczckQrVGk1VHlNNk9hTEZxNDdj?=
 =?utf-8?B?aDg4TzRRSHV0U3d6Q2JQeFlSRklsdERtb2s2U0VZK3hvQlFOeitzRSsxeTBX?=
 =?utf-8?B?cTJUL2lXOTd1WWZ0ODdJU0JEd3hSZzZ1N1dWRVg3YlhXd2l0SS91akJsOVQw?=
 =?utf-8?B?S0RuTjJyWTlXeG8yakVMRVR4ZGdyVUNsakFVSFV6UHk5LzZSZ3hyUnZ1eENv?=
 =?utf-8?B?K0FkNGRrK0ttY2lydDdlMTBSL1dVNnQvanJVM2Q3RkVOaGFFMnBQKy9YcTM3?=
 =?utf-8?B?Z0tlekR4V1dSMTZKWUdPVkZHSmkvMTZtZE4rRE0yVFU4a2czQmhSdFFNdVRX?=
 =?utf-8?B?dVJYd2ZMcy9mY2tpVTJtNDBMelplS1BmMjk1ZEFhMTJmazJvOVhHV0I5U0ll?=
 =?utf-8?B?a2JlS08xcjQ3OEJwTG1SOHBLTXFRajdPWXFES3YvR2pDL3M2OXlXc3UvYVFW?=
 =?utf-8?B?QlNzeERIdm9lVjh6Y0VZZ0VpVWlyZUxpc1VxaW5YREJoRGRBMlozMVlzVkow?=
 =?utf-8?B?T1VOUE1ZcDJrVTFER2VYaDZFMGJWalh1Vk42N1hDSUxFbURQS2lHYVF4MVdz?=
 =?utf-8?B?Z0U2ZGRNKzkxcjlTbDVUNmJSejIzRnFvSnhPQ3hZRWwxNW1rVS9reVAwRXlW?=
 =?utf-8?B?WnJpMXRJVFJzSVdISmkyL0kwamJEbGhIaHJsZUhuM3kwaGpIQm0wb3dJUzlI?=
 =?utf-8?B?UTNzUzRZMW4yM2RuREdYNVR4YlBkbnUvRGtza1VmdnUvU2txMGtxaHQ5Ykgx?=
 =?utf-8?B?OW9Xdi9SWWxhakErblg5SFlRMm9mQUVCcjdhZjJWY2FBN2t0V0h6Z0JoKyt6?=
 =?utf-8?B?YzlnY1lHekdiSGtscGh3dFlRZ1o3NUYzVytkaGp4ekVJc3creGNqOTdXbVRh?=
 =?utf-8?B?dzJUSmNESWgxQWJqS3VDRjNQcEY4L1N6N0FyaUNseHZzMjRrUmVoY0UvMi81?=
 =?utf-8?B?dGQ3M3Q4Q0RxSW0rN0JTZmZ6Ymt2blNwOXA2ajIrT3lKVURvcnkyOEE0bmlI?=
 =?utf-8?B?WWlrTkYzZ3lVbjEvRHRwMmNoREJ1dUFFU29WOU1RZTFoK2pNMHJhVlJ3WDRv?=
 =?utf-8?B?SmdpVHFUdFZyT0hqa01EZkpBdVlRTFl3TWdWT1hxYmZUOTd6L1N4clI5YVlP?=
 =?utf-8?B?Q05YWjJiMDFzZVVlZk1pOURxa21Vd1JCZ2YvTmVFOTdtQnJZNHFEdTVuTXNR?=
 =?utf-8?Q?N3C9ZyWvZcQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5753.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UEgrL21yeWJzOXRMeVpCc1dPN20vUU9VZVppVzJHZS9OSlo5TVNJYXdER0Q2?=
 =?utf-8?B?dW5LcHk5QlpaQThyY0pWN013SDRYZzUzSStLWlAwQWVIUm1XeVltZWpGSGtZ?=
 =?utf-8?B?ZXBtK2k2VVNSRnBvR2tNckcwYnZjYldDejdTcmFTUmV4K3dkaEp4KzBkb1V4?=
 =?utf-8?B?OGpQR3ZMY3ZISEllTkNUQmdleTh6Y2lFZ2Z6U2NHUkw5MHZreDRiZmJZTTFG?=
 =?utf-8?B?MlA4SXBjZS91NGVMaFpzVDV3UjFQaStiSWZ2SFV2Zk9TSkFqazBuM3FFcSs5?=
 =?utf-8?B?ejhUOGh4ajVURjhDemZBa2RRZitzVVJObEFYcnlFWkVmUmtBWnVacHZERFdo?=
 =?utf-8?B?TysyR0MvV1RzR3lpNVV6UUQyajZ4a2h1Q2gzTjJUaVdjLzAyT05OM0QyMkZ2?=
 =?utf-8?B?VmJxdDJRSmgyYnJHZndWMWx1UXZXakxiNGFPMkZEMk5Gc0I0Y3cyV3RmeStj?=
 =?utf-8?B?eHlydkZsY1E0NHphVzl4K2UzTWprMlIvL09PSEhxU1Qrd0EwNVZaOHUway91?=
 =?utf-8?B?RVh2VU4xUFpubkhMNCtpRjdsNGJaTjBXVVpKTGM1WGFSR005bTUybHNLR2RK?=
 =?utf-8?B?NDJDZ0ZpckFOaWk5NHZ1N3VpMStOVm5qMXA2QVlXd3hJTUhUTTh3cmRnZ2xs?=
 =?utf-8?B?QXJCUno2VUVDd010S0VEYlB5VDcxZEVRR3N1Y3c2VWZxT0pxbUVVc2pGUEgx?=
 =?utf-8?B?TnI3b0JrVExlV3FNeWxJNjIxL3drRDVyazVsanlrQ3VkMHl5SEpUM01BUENv?=
 =?utf-8?B?Mmp3eHBZSm52ZmpZczFyNHAwZi9WaElzWE1BTFdQbFlxVmRkMTBqUnRobTRF?=
 =?utf-8?B?ZjdRaUZkN0RwMVhRUzN5d0tKQnRSa2NyMXR4QXJOYnVYckFIT2pjciswQmdX?=
 =?utf-8?B?T0Fua2VWMWFmWVFIdHJuYnQ5U2g4d1NMN1ZNajFiN0ZkcWpkWDdoOGl1dWE1?=
 =?utf-8?B?dWJ5Y3laRFA2bWcvUXpJc2I4M0QzMktZOUp4TG43QVNrT0s4M05HcjZpd0lq?=
 =?utf-8?B?My8zdWc0MDg3MnZnNVliVzk4SkRXZXptTUFpeDJ2c1E2NWY5T0JuQ0VnVjB2?=
 =?utf-8?B?QUVOSENvby9iT2V0QUNwODB0WHE2VE9OR09PemJhdWQyNmlpUkU1R2JKUmlY?=
 =?utf-8?B?Ync3Rk01RlBXZ0g4SjhCYUt5STRZMHlBSzlXZGxXM3E1LzlyekdaK29YU0J2?=
 =?utf-8?B?Q2lBdnNmWDhzdFFoejVzbThic2hRcGpWNjZwUVlKZW13SzZMZTl3VjUrRzgw?=
 =?utf-8?B?aGdYQWJ4aEhmNml0WExpa0tzVDJGL05xbGJhMEpvbnJYUzUwZmU0SEw1ZTk0?=
 =?utf-8?B?elUzVUpoZ0hFNzI3ZFltM0xtNEt0Wk0xdWllRDlEWDl3OEpUTXhkUXFOSjMy?=
 =?utf-8?B?Tmx6dUlVeGEvcDVrRk5aMjlDZ3g2cUtMeDFsMDRVbm1rd3FDbGxBdVRnZFZu?=
 =?utf-8?B?SWxFanY0ZkRrSDIybWdhenpaUWI1dGRQdmJveWR6cFdmZjA2dGxhRGZSZ0Q3?=
 =?utf-8?B?d2RyUWVoU1NwOE9NRGI5WWE0NHNadUNLeWJ5VmdIc0xpaldvNURHeWNsTTdJ?=
 =?utf-8?B?dmp1akY2YTU4RTkxMlVKb1p5SURyWEYvbnRoQm8zY1dhUVZGUkpmRmNnVmUy?=
 =?utf-8?B?bHMxWDFhcTBUbUJQSElHRS83Y29xdVUwUmxudWJwOGM3WW5MWG5CeEplWGF5?=
 =?utf-8?B?RncxRjkyRU4vRHJSQU9sVFVZM3pLUFcrVFBIYXY5TkU3U2ZlOFFjZFFlZHl4?=
 =?utf-8?B?aGxXQStHRStXaTJ6L1JYUk1qV2NCWERLSTIyTGwzNW1BKzFpUHU5TnVqZjdx?=
 =?utf-8?B?SlBUajdGQ25rc2VYWkpOcktxejBRc2lqcnYxemFtcEFwMDlpMU1GejVERWNE?=
 =?utf-8?B?ZnZ0bmNGdkR2czBiQWlFQy9DVzU1ekpPNUlvUVZOei9paEc5aHR0K29yU1k5?=
 =?utf-8?B?OGlPY0lRcjd0NlNTOURPbno3YWRCb0d2MjZnYUYwY0pVZmEzSmN2OXd5dnhK?=
 =?utf-8?B?ZHJiN012TUtXMmxzbG9yNWhLMmdzZStYcjZOSndaeGtEa1p3T0JITEJiaVk5?=
 =?utf-8?B?R1Y0K1E5Rm8wOWhSaFJWaEJVUXZINlNmOFBVNUZEait2T0ZjYUloWUZYVE1t?=
 =?utf-8?Q?wIqiU98Z+2wVyVxB8Y+UZRaID?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94b470ed-e534-458a-a890-08dd7d9a2ab5
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5753.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 10:25:25.4614 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /nFk5dcFXrYs6bbJw4J9MgPfM45CIcc7e9FboSdCskSlvFoGwNz2ZiCHlXTvpzvha0bLJxkdBSgzPdU0TG28VQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5916
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


On 4/17/2025 3:51 PM, Tvrtko Ursulin wrote:
>
> On 17/04/2025 11:01, Sunil Khatri wrote:
>> Fix the below warning.
>> scheduler/sched_main.c:397: warning: Function parameter or struct 
>> member 'result' not described in 'drm_sched_job_done'
>>
>> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
>> ---
>>   drivers/gpu/drm/scheduler/sched_main.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c 
>> b/drivers/gpu/drm/scheduler/sched_main.c
>> index bfea608a7106..3c03dfdda966 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -390,6 +390,7 @@ static void drm_sched_run_free_queue(struct 
>> drm_gpu_scheduler *sched)
>>   /**
>>    * drm_sched_job_done - complete a job
>>    * @s_job: pointer to the job which is done
>> + * @result: error code for dma fence for schedular
>
> SchedulEr ;)

Oops, thanks for catching that :)

regards

Sunil Khatri

>
> Regards,
>
> Tvrtko
>
>>    *
>>    * Finish the job's fence and wake up the worker thread.
>>    */
>
