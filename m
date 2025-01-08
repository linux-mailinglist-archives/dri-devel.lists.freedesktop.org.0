Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19636A05F53
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 15:50:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F31B10E8C9;
	Wed,  8 Jan 2025 14:50:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="fgj8aGsY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2054.outbound.protection.outlook.com [40.107.236.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFE6710E8E0
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 14:50:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lKQSFMh4jWsohycBNvYb4mcK8yFoVdXLEveHBFIIzXxx5f7f4p5P2s7qnfySvMxvhi1isTUP72K49/wQraBTFRUjdSZRsT/iZ1UfWxuQS8JqkZ7A5fWo5BDKmAKOu2t9VF21XfRqnSbcUOaug/k0PxGyV+wL/kHItuwiGDCAeSh3gpvBbyy5vgIf5vX9DjTJG74+MBkDNYjYfkWENWDLfYMIdPqk402ZYt8bScmMYd5xKnVkc5pQbYO6/7h4fMnQmTo8zSGPFYuSvW4SxMKFzesU0IL0FmP2e5W2bG9X1T47WwVoFhbV/jbRwqbwGmQrbG7WdfEQExGhpfS12Imd3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r0XwGA+NHb16Q78CH07Ycopp01tHr18DED0cjD2mjM0=;
 b=FLMswCqjJ/V0IKoudUo/5Kjh5Ch+XJHHZLQEkbiiCtw9ClFGizGhvDWFIFKjI6opMS1AGKdNb51vWHm6ixoqhsCoencsS+SZosW39n7y+q9w2tOMkg5tynBTdXITOGaaFvuGRNee5TsL7Knx+K3/PL7skxqVv0cnMSNo2b66vx1dtVlhBKdnG6NA3STuOZZpY6oCg03OGVTPheK0n2rTnxVdguZY6J+NuZL3q/nqwjNTl7bJnBzbu3ujhEDcM6YgUzJQfSUNQoVnyQ8ERMHuDzQsn3XZ6SX+v27t5M6b/aaOpSr3hpXinWqPEdno7M0aTFEiahWuLxuUyoylu1L6Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r0XwGA+NHb16Q78CH07Ycopp01tHr18DED0cjD2mjM0=;
 b=fgj8aGsYAGYKlEbEVim7VuZXnHQIwU7icEqhO4BU0Wub/YaEQ16W9Nq01sG52bT8i3n4f8RoU/EQJzIseKOv5fvDpr2xIY9yNweKtKSmw4uASlxMZj0uhGiEMqT8NIOLiFrQDQ51HFGsfPvnVPV9JkDhGbaIUqCW7+D6c3by5Z0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY8PR12MB7193.namprd12.prod.outlook.com (2603:10b6:930:5b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Wed, 8 Jan
 2025 14:35:31 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8335.010; Wed, 8 Jan 2025
 14:35:31 +0000
Message-ID: <6a17b4f1-5b5b-4226-b3c3-4dfa3f3c3811@amd.com>
Date: Wed, 8 Jan 2025 15:35:25 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Fix amdgpu crash upon suspend/resume
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Philipp Reisner <philipp.reisner@linbit.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Nirmoy Das <nirmoy.das@amd.com>, Simona Vetter <simona@ffwll.ch>
References: <20250107140240.325899-1-philipp.reisner@linbit.com>
 <942c02f2-6496-4406-a73b-941d096aadfb@amd.com>
 <CADnq5_PAG662SODmS8cSg7jcyh8ZQRgcWMtgjx5RZbuUE7j3Og@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CADnq5_PAG662SODmS8cSg7jcyh8ZQRgcWMtgjx5RZbuUE7j3Og@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0033.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::12) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY8PR12MB7193:EE_
X-MS-Office365-Filtering-Correlation-Id: e59a6e28-92e7-448d-4d0f-08dd2ff1b42b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V1lmUk85cVBwT0J5QVVRSGVMNzdNRENycEdSWGFVRnBIK2xERXErUm5DWEtV?=
 =?utf-8?B?RWU5VHNuT2d4OU1kQ0FKdTJOcmRQOEFsUlovcGZ4YUE2alN5YXhHSURPbGJh?=
 =?utf-8?B?ZkdRQWhCUkl2T3BHbG04eUVFZzhScE01dUZVeFhKSDBpTHdNbmFMYWtYR0FU?=
 =?utf-8?B?MG1lTVBwNkh4aWVoaGtobzllWXcxQU5oZUdhR2pheHJrQXJxcjlBdVBmSHgx?=
 =?utf-8?B?ODA1dzEzM0Y2d0JYT3U0S3RkUy9WYXp0WlRJMEVKN2hKeHNlamFhVHdJbWRt?=
 =?utf-8?B?VkF5RHR0QzcrREFBQjlzWWluRXZnZmpoUEhxNFovSUpLOEtQSDVBQmZmMHcz?=
 =?utf-8?B?RnJJd3NLNUg0RXVFN0p5azdIWDgxSStJVHBqMnBUQ3B3ZFVwbnhtUTljZVRi?=
 =?utf-8?B?WCtMR0dmTnM4cEhOai9TbXJyWHg4NmIxU2dEUkJtZFV3ZTJuQ2xDZ3VENWFy?=
 =?utf-8?B?TklBaUovYTczN0ZqTzRBT2krWkxzWTNrMTBIS0lsSS8xZWZTTWZJMHFLQnJs?=
 =?utf-8?B?RjBGODB5Qm5MMDVBRFRuL1poRXFYcXpZK0Z4ZHV0dkNza3BwMWpTcS9XRC9m?=
 =?utf-8?B?elJkSXovNStJWTM0YU03VW9ubStqNHNNTVI4WWs2ajB5NzU1UHlSamV4N2s5?=
 =?utf-8?B?ZVlnZUowZWtLTy9MdTRqNDZNOTNEWGpJZ2xZdm0xYkViY3BIWmtJMG9GamRY?=
 =?utf-8?B?dFFIbmdUWWtvTHhOL1daMC9DU0FtRitwYmFSbWw0aThOeU9aSDRpMXFiMC9Z?=
 =?utf-8?B?bU5ONDgrVUlDUUV0ODUzaG50VEFDZlNDVHFZWE1mV042cE9aa3RqYWlJSDQz?=
 =?utf-8?B?ZkVLQW5GcXZHY3RLZVNRVmZPTUV1dUNNOHdTZDh6Y3l3U2lZdm5mTlFjeDVP?=
 =?utf-8?B?OEpjQVBNWWh4eWU4QzZMVjRXQnZkQWZYaWRha0hFQXdXUWxJMHhaMnBjdVh4?=
 =?utf-8?B?WkxRZkVZbDVrQzNIWEN4WGx2ZzhacnZrdE1tN0xsNFVKZXN5cVUwaTZnU3A5?=
 =?utf-8?B?UWtFTGJpeTVaSlVUdkRldGZjSS9EZ0UvMzNhek4xSUNuSnJPWWF5SkxBd2Vt?=
 =?utf-8?B?MFNCaUpXVzZpOE1tUytYQWswZ21rZm4zZ1VSVkNYeHB2dzkraldjM3FJcDBm?=
 =?utf-8?B?NC9XZVNna1VNbUNDK3ZVQ081S1p1TUw0cWxlKzh0ZXozZHVwZkxxdlAxNkJt?=
 =?utf-8?B?ZnFoQlVwckV0Z3dDNVEzRmhuWXpQSmtiVWQ0dTlRNGRXWEhHbWJDQ0FQK3B4?=
 =?utf-8?B?TzZ2c2NvMW5Sd3NmMFh0bTcxUDR3WHBzZFpzcFNBbW5tY3VyeHRnY0QzU2t4?=
 =?utf-8?B?MG9IK2o2U09ON2FKeXBkc0lQYWpXU3dUd1hZeGJxMGtqdWR4SVdDQllHMjg2?=
 =?utf-8?B?QWhTN3Zhb0l2MVY4YW9BeGdoZlNZQ25IYUE1OXVzRm1IM3pLMm5Ia2FaMU9y?=
 =?utf-8?B?VHprY3g1Q2RYMVRoTG1sYTFyMEZSZ1Y2M2o0OEtKUG9HSFRxWTMwNEViaWpW?=
 =?utf-8?B?Ymg3cERoT0pmWHpGM3hTMFFKZlMyMHlDczR0dDJQSXhWeFRQQ1NlSVRJZ2Z5?=
 =?utf-8?B?bUUxemo3K1V4SzV1YUFzT01UQnpIQkxXN3JndE1hV28ySStwOFZUcGN6cHJX?=
 =?utf-8?B?NVpwWlpXS0Yray9sbTlPUkhweWtTMThGd1JjNndrZzBsYzExekNFSHNxUm1Y?=
 =?utf-8?B?YkJSUDlaSUJETEdSMlJjbjB6V2VvY3RWK1lQZmVvaG43M25tU2g4anNPM0sx?=
 =?utf-8?B?c1NVcDRSbjRoanhIUmg2SDJORDNHVUNtR1ByOHhGL0JwMEx4ZGxGSll5bU9D?=
 =?utf-8?B?Z0NvVUFOVFQwcUE0QlV3QT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YjhoNjZKd0pXRWZUMnlvNFptbTQ1WFhZVXBaZGVUOUNTcHpFVXg2Q21VY2w0?=
 =?utf-8?B?aktXRlRTUlB2aW8yUGJLcGdzTUdhSXhXWjJKMHkzRFNMUUVQRnlXdmRtMTJs?=
 =?utf-8?B?bklTcWg5b3hOSnRLNXhBTEdIVzhMUVVEeDJ1c0laQmF5clJwNXY0eWcrV2NG?=
 =?utf-8?B?akZ5cTdHWTQreFJzZUFMTURQd2RGRVJnV1BjYzIyOU9JbWtqR0RWa2R1MlZy?=
 =?utf-8?B?YmJ6UGVHZkY2WnJuVXNuM1E2RUxKSnM0YmR3cFJSU05Cc2Z3WFJVQUFUNkR0?=
 =?utf-8?B?WHoxUHFRSWJ1RHBQNnJWZzY2Vk90ZG1CSCtTUGVXWlB2OEdrQnc3MHc4TmhB?=
 =?utf-8?B?TzkzTFphOXJmTjFIRHkyQk84VTVEaGNsTDhSM0F5OFZlUDZWM3E3eEdmMTRw?=
 =?utf-8?B?UnFMeVJlbWpTRUVhSC9PeG9kM0YzbkIra0d5RHhJamdlV1FCMWRQNGFUVVJ4?=
 =?utf-8?B?V1A1RkNQWnJPRStOd3lpdDRSVEVHQUZkcFAyd2hNZzNMU3cyWDBBOU1scSsw?=
 =?utf-8?B?bVpEL3pEZ2J5YUN6UHFmNi83emRRQThqMEpKcTBuaGpUL0tnQmcxR3pza1Ey?=
 =?utf-8?B?djJvYU1TWlFTVllIT0o2T0ZXa21hd1BEblpHNU5NeE82cTE5bkVsOU5BR0ph?=
 =?utf-8?B?bmpaT21rdHpTS1dBaTMvdGl3Z3V5cEovTHZMU0RESldSc2xGSHZVa2cxdG41?=
 =?utf-8?B?Z3QvRTVkc2laR2JCU0FSZktIZEFCZzNXK1hickx6Z1F1dVorT0t4UzByTW1s?=
 =?utf-8?B?Wkc3cy9xWWYyUlo5ZC82cE9hQk9OMmZ4VXpaZ1RIWmdjMkxUTDdOcUhXblJB?=
 =?utf-8?B?ZmpWN3YvTnBGV05sNGlINUZoRUlWdFpINk5uSFdiMHI5Q09ZMGs1UWVKcmxu?=
 =?utf-8?B?cG5kd0JQRmlnVy83T0J0aWJUZWJocEMyZXFpTGtSOS9sT0p5QTFRRDFFeEUx?=
 =?utf-8?B?dVVmQWlES1R0eDNHNFJSQUtDejNPaUQveEVaM0tBL25EdGcwRVdDV0Z1c0gx?=
 =?utf-8?B?NFIvRlNsZ0tRcGNDd3c4TjI3VzFDQTg5UG1jNHR0RFdoUk5UazZ2VXFZMTE5?=
 =?utf-8?B?TDJVSWN0VEhsd1ptSjhNaXQ2ZGZlSlFrRkd5Z2hLVzlBUklhNkEzdEU4UkJI?=
 =?utf-8?B?TlZPZjFZVHhxcEpsdmplc0NIV0RBWDNoaTlvaGtaWU1OcFNablVIM08wUDlj?=
 =?utf-8?B?ZTBxejNBeEZKcDdlNUk0TUpENnBrZ1lQT2VxVEFodkdiamc1Ly8zendWK3J6?=
 =?utf-8?B?MU14WUNLK0U5a0tvZGJwU3A2aG12MWF3azB5SFJGRGM0enA4VWwwQis2MjBu?=
 =?utf-8?B?MXJmeUpPM3F2MkNLN2toczRaMnhHbnhURnpydGtVb1ZnZ3A3Yjdkc2FLYTBo?=
 =?utf-8?B?akw2ZFMzSWF6NmVYWVkrN2JuRnRid2oxNytQR3BSQ2lqcFVVUkticWVSY2o2?=
 =?utf-8?B?MG1YUHlFOGVqdE1vRVdKRU9lWDFJbWM0dFhjNExpOHRPWGJuanRDd1FTbDNN?=
 =?utf-8?B?TEdJSFc5bDlyNTdXQzEyYWFUYUNiZ0FZb1pRaWJ1MFBXMXJWa3lCcG4wVkxY?=
 =?utf-8?B?SVZSNUpYMFN1VDAwTXNCdlkrTkdPQVZ0ellFenppblV0SXpEMEhBckhhRVFa?=
 =?utf-8?B?UVRpT0MwNTB2aTlTZCtyQnkrd2o0cUhJY08rU3ZNbk9nV1h2Y0JEOTd5Q3ha?=
 =?utf-8?B?ZHVENHZpZ0NXQkhmWSs3UENFVVR2bjViNGppVUwyZzFQUkRtaUwySDV6enY1?=
 =?utf-8?B?UXpxUlpaWTlQZzcrMDlTcHlBT3o3T2hacktjaWVsTC9rYUcrSDZmWldIOE9h?=
 =?utf-8?B?ZTdyZldacEtnUjROMitMZW1KY2xSZmdmN0VxallVLzd0MXltdGJRdXViVWp0?=
 =?utf-8?B?bEpjbzVneGdEL3J0NVFJbEJnMXdhK0RrTEpQNlhtaHJ6ZWU4bEJEODh5SUp2?=
 =?utf-8?B?YVBkLzhrRXVYby93eTBnZ280L1lJaG9iekxLTUs4VUZvbkpiYnRuQVF1MHZv?=
 =?utf-8?B?SVRBd0N0NUo3MG5aRk1SVmMvQkRBY1dJSjZNNHBTQTk0RUNyYW50M2JEK1dK?=
 =?utf-8?B?dnRlNHlRS0o5WU1DR0pzNllOcWduMlUwcUVoVStUZkdkNERoa01IU3lVbm41?=
 =?utf-8?Q?B/blMbkjDpQNFPrFaT76ddbxx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e59a6e28-92e7-448d-4d0f-08dd2ff1b42b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 14:35:31.5356 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oZBapM8/ILqg1lNNVlAysIEb8pWWacwlnC/AoAHuDAoOw/v66ibLoccX/x3yWIkT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7193
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

Am 08.01.25 um 15:26 schrieb Alex Deucher:
> On Tue, Jan 7, 2025 at 9:09 AM Christian König <christian.koenig@amd.com> wrote:
>> Am 07.01.25 um 15:02 schrieb Philipp Reisner:
>>> The following OOPS plagues me on about every 10th suspend and resume:
>>>
>>> [160640.791304] BUG: kernel NULL pointer dereference, address: 0000000000000008
>>> [160640.791309] #PF: supervisor read access in kernel mode
>>> [160640.791311] #PF: error_code(0x0000) - not-present page
>>> [160640.791313] PGD 0 P4D 0
>>> [160640.791316] Oops: Oops: 0000 [#1] PREEMPT SMP NOPTI
>>> [160640.791320] CPU: 12 UID: 1001 PID: 648526 Comm: kscreenloc:cs0 Tainted: G           OE      6.11.7-300.fc41.x86_64 #1
>>> [160640.791324] Tainted: [O]=OOT_MODULE, [E]=UNSIGNED_MODULE
>>> [160640.791325] Hardware name: Micro-Star International Co., Ltd. MS-7A38/B450M PRO-VDH MAX (MS-7A38), BIOS B.B0 02/03/2021
>>> [160640.791327] RIP: 0010:drm_sched_job_arm+0x23/0x60 [gpu_sched]
>>> [160640.791337] Code: 90 90 90 90 90 90 90 f3 0f 1e fa 0f 1f 44 00 00 55 53 48 8b 6f 60 48 85 ed 74 3f 48 89 fb 48 89 ef e8 31 39 00 00 48 8b 45 10 <48> 8b 50 08 48 89 53 18 8b 45 24 89 43 5c b8 01 00 00 00 f0 48 0f
>>> [160640.791340] RSP: 0018:ffffb2ef5e6cb9b8 EFLAGS: 00010206
>>> [160640.791342] RAX: 0000000000000000 RBX: ffff9d804cc62800 RCX: ffff9d784020f0d0
>>> [160640.791344] RDX: 0000000000000000 RSI: ffff9d784d3b9cd0 RDI: ffff9d784020f638
>>> [160640.791345] RBP: ffff9d784020f610 R08: ffff9d78414e4268 R09: 2072656c75646568
>>> [160640.791346] R10: 686373205d6d7264 R11: 632072656c756465 R12: 0000000000000000
>>> [160640.791347] R13: 0000000000000001 R14: ffffb2ef5e6cba38 R15: 0000000000000000
>>> [160640.791349] FS:  00007f8f30aca6c0(0000) GS:ffff9d873ec00000(0000) knlGS:0000000000000000
>>> [160640.791351] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>> [160640.791352] CR2: 0000000000000008 CR3: 000000069de82000 CR4: 0000000000350ef0
>>> [160640.791354] Call Trace:
>>> [160640.791357]  <TASK>
>>> [160640.791360]  ? __die_body.cold+0x19/0x27
>>> [160640.791367]  ? page_fault_oops+0x15a/0x2f0
>>> [160640.791372]  ? exc_page_fault+0x7e/0x180
>>> [160640.791376]  ? asm_exc_page_fault+0x26/0x30
>>> [160640.791380]  ? drm_sched_job_arm+0x23/0x60 [gpu_sched]
>>> [160640.791384]  ? drm_sched_job_arm+0x1f/0x60 [gpu_sched]
>>> [160640.791390]  amdgpu_cs_ioctl+0x170c/0x1e40 [amdgpu]
>>> [160640.792011]  ? __pfx_amdgpu_cs_ioctl+0x10/0x10 [amdgpu]
>>> [160640.792341]  drm_ioctl_kernel+0xb0/0x100
>>> [160640.792346]  drm_ioctl+0x28b/0x540
>>> [160640.792349]  ? __pfx_amdgpu_cs_ioctl+0x10/0x10 [amdgpu]
>>> [160640.792673]  amdgpu_drm_ioctl+0x4e/0x90 [amdgpu]
>>> [160640.792994]  __x64_sys_ioctl+0x94/0xd0
>>> [160640.792999]  do_syscall_64+0x82/0x160
>>> [160640.793006]  ? __count_memcg_events+0x75/0x130
>>> [160640.793009]  ? count_memcg_events.constprop.0+0x1a/0x30
>>> [160640.793014]  ? handle_mm_fault+0x21b/0x330
>>> [160640.793016]  ? do_user_addr_fault+0x55a/0x7b0
>>> [160640.793020]  ? exc_page_fault+0x7e/0x180
>>> [160640.793023]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
>>>
>>> The OOPS happens because the rq member of entity is NULL in
>>> drm_sched_job_arm() after the call to drm_sched_entity_select_rq().
>>>
>>> In drm_sched_entity_select_rq(), the code considers that
>>> drb_sched_pick_best() might return a NULL value. When NULL, it assigns
>>> NULL to entity->rq even if it had a non-NULL value before.
>>>
>>> drm_sched_job_arm() does not deal with entities having a rq of NULL.
>>>
>>> Fix this by leaving the entity on the engine it was instead of
>>> assigning a NULL to its run queue member.
>> Well that is clearly not the correct approach to fixing this. So clearly
>> a NAK from my side.
>>
>> The real question is why is amdgpu_cs_ioctl() called when all of
>> userspace should be frozen?
>>
> Could this be due to amdgpu setting sched->ready when the rings are
> finished initializing from long ago rather than when the scheduler has
> been armed?

Yes and that is absolutely intentional.

Either the driver is not done with it's resume yet, or it has already 
started it's suspend handler. So the scheduler backends are not started 
and so the ready flag is false.

But some userspace application still tries to submit work.

If we would now wait for this work to finish we would deadlock, so 
crashing on the NULL pointer deref is actually the less worse outcome.

Christian.

>
> Alex
>
>
>> Regards,
>> Christian.
>>
>>> Link: https://retrace.fedoraproject.org/faf/reports/1038619/
>>> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/3746
>>> Signed-off-by: Philipp Reisner <philipp.reisner@linbit.com>
>>> ---
>>>    drivers/gpu/drm/scheduler/sched_entity.c | 10 ++++++----
>>>    1 file changed, 6 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
>>> index a75eede8bf8d..495bc087588b 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>> @@ -557,10 +557,12 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
>>>
>>>        spin_lock(&entity->rq_lock);
>>>        sched = drm_sched_pick_best(entity->sched_list, entity->num_sched_list);
>>> -     rq = sched ? sched->sched_rq[entity->priority] : NULL;
>>> -     if (rq != entity->rq) {
>>> -             drm_sched_rq_remove_entity(entity->rq, entity);
>>> -             entity->rq = rq;
>>> +     if (sched) {
>>> +             rq = sched->sched_rq[entity->priority];
>>> +             if (rq != entity->rq) {
>>> +                     drm_sched_rq_remove_entity(entity->rq, entity);
>>> +                     entity->rq = rq;
>>> +             }
>>>        }
>>>        spin_unlock(&entity->rq_lock);
>>>

