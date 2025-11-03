Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51687C2E195
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 22:09:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62A5C10E491;
	Mon,  3 Nov 2025 21:09:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xnkeqBgK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013062.outbound.protection.outlook.com
 [40.93.201.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3940310E490;
 Mon,  3 Nov 2025 21:09:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DJBR9/CNb+t+t6wObY3DXJS0iMldWMW2fcRfupvMwhrvM7SggNGmEnGKqAPvzjFvpn23/OL3tOIMfFymWN1yfIdSs4Wp/Yp7Z9LF/eImY74yxELe8KZU6S2TrS3RE/61zSVE80p+sDkTsV90FbeSPSjXqBMADjO+rfzH4xCuOMelJiKAfl10NAXV41zVVFwusDBZuVI10ua+NcBZ2wN4FLX5BFthU/nOKH1Ub+E3I7nKeSpPRzuqbipmT4R2GT5469UcHWLZJEaGMpx4MXDTkB7wfM3ekr1n3admT7nFMCd2Baa61u+n71rlr/NdMzfXWiQ5NML4ecrpc2i8wBRM+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cuz5r96Tbd0sAmxjXVs7p4V+E5qnYi2sY6k1KVQrEjk=;
 b=KrfSqgVagKp8m6kUnbcAl32gs4FmWhhKE8PHFd/gMJF+VKdEdapmwqzLBaNj9ijx451rD9x+8Hu5QnH2nDugwiUGsK86lIya4dHouhan/bi9tMVUsk3GE+llDBQn+frHUD/u3zm2K60e6U22pIbSDjzwmiDCIjBnT8QcbKpsb1hVZYfewv4/MCXdzlEoUesxKw7PM7E6GSRyQeUXM6ROgy+w5OGBVOLkLldnv/ajwh9QspaIWPzbYncRuUIvaOtB3j5jEj7RP27byhOjUqkEEwsYMJW4uHPZnshJRj4uq3D51M1fCNgEx8fC5qt6dPnR0uPUwGsFx5nQVmriL9Lovg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cuz5r96Tbd0sAmxjXVs7p4V+E5qnYi2sY6k1KVQrEjk=;
 b=xnkeqBgKO4xvdDgVZdY0jlQVLFPwmO9PUctsmdHDyUZkQcCIMEWSsovg2TDNTy5zj1hb6rDqiBz2+pdJrOm1p/FLrbNrKF4nrxpO28xuwGxa520sJ4pWO7CeIG3ZhIgwxOJw3R0Ss2Dn/1QIAL73DYqAfuguSPIaYuIHzIaPWj4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CY5PR12MB6348.namprd12.prod.outlook.com (2603:10b6:930:f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 21:09:48 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.9275.013; Mon, 3 Nov 2025
 21:09:48 +0000
Message-ID: <bea70e02-2d1b-4fc5-bcb0-b1bf33c09139@amd.com>
Date: Mon, 3 Nov 2025 15:09:44 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: Fix NULL deref in debugfs
 odm_combine_segments
To: Rong Zhang <i@rong.moe>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Roman Li <roman.li@amd.com>,
 "ChiaHsuan (Tom) Chung" <chiahsuan.chung@amd.com>, Ray Wu <ray.wu@amd.com>,
 Wenjing Liu <wenjing.liu@amd.com>,
 Hamza Mahfooz <hamzamahfooz@linux.microsoft.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20251013164742.24660-1-i@rong.moe>
 <7ef252405946f6ab3feff38cc4bd9ddcc49bad56.camel@rong.moe>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <7ef252405946f6ab3feff38cc4bd9ddcc49bad56.camel@rong.moe>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1P222CA0167.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c3::15) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CY5PR12MB6348:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cc3173d-3fa3-42f4-d9d6-08de1b1d524e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dzBMM2RVU2VLK2lXeXpnOHl5S05aMWxHMzJIMVRkK0ZpTHBmbTVxQXJ0SDJu?=
 =?utf-8?B?eDlWR0JydlV3ZTBzaCsrVWMzNXJ5MldIY25PdXdQaC9BTk5MZFFNbDRma2xB?=
 =?utf-8?B?bTlSSUdKYWxJK3FYcEhtVjdtU2IxZUlEdHJqVWRNWWRtcHJRUlo3TzZMU2Zs?=
 =?utf-8?B?MkxERVNzZm5SdlVlM08yK3ZvVm96eW51akcwaWU4ZTN6a0RCV08rMmIvbkxj?=
 =?utf-8?B?R2NGblJIdVZqYkVZRXJZa2VkT3pOQWFKUXdNMFBxMGlia1BZenZTc0ozNSs3?=
 =?utf-8?B?M3UzK2lMM3NaaVlEQkY0NGtXeHBScDdINnZiRnBldXhhNEdtNFJOSkZMRkh2?=
 =?utf-8?B?cTh2MEExdDFobXlqVldKZTRhMHg4OHRVVnNzMHdOV0dMaml4U0dPcngvOGZ5?=
 =?utf-8?B?MFZtSi9DbmR6ZURFSVY5Q3BacHMvK2R3T3ZPUEVEdXBvMElDZU52NEI3ZGwx?=
 =?utf-8?B?TEpJZzNuZDBYVDAzdE5ET21nQVovb1NRWENnTHAyd2pZM2JFS28rY29pTzRv?=
 =?utf-8?B?TWNMZnFLYk16ZjRHdFg3M0g0U0poMHMzZWcwWVRzOURySzNlbGdjTjZzZTRX?=
 =?utf-8?B?Y0VBemZOdEkwd2JuSzVqelNEbGJmNHZBRDIrMEtJbURub2VYbzhCQ2d2b01O?=
 =?utf-8?B?T2hSZExtdG1GTThwR290WitlNG9DRGZQWUFlT2NBbllVbEgzTmJPTWc5dlJL?=
 =?utf-8?B?NW9UN2JtalZ2cDNNdHNob3dJa1prRVdJMmhFeVc4aE83bDA0UmNlcWN3N3hG?=
 =?utf-8?B?Z05qQ0YvRWhHV09vSjlEa3VwcTNNV2hoNzRuMXhTY0dqY085TnZKR3U1Vktu?=
 =?utf-8?B?SmJUWFc5TTB1cVhNcGZIc2dwR3J3OG1uVXdIeCtYZWJIQWV1K2dubE5GUFpV?=
 =?utf-8?B?UlA2TVh6Zmh4Sm1JM0pLUXAyTE9WN1lZZGtJNG9MRUdEc3pCeEJMM2lId3Fk?=
 =?utf-8?B?NU0rWWE3d1F4alhMVDMxWkpMWXQyTDNKUTRMMjlEY0ptMUpyb3hoYVZ3UFp5?=
 =?utf-8?B?Z3BrNG50bmpwN0FISEhOVzBvSlpoT1doUnR0WWtMeC9BeTc3UkFuU1BjQ0ln?=
 =?utf-8?B?YWVSTElnL3phbWFzRVkzS29RY1ZoRnU2NWgvdjRvMVkyYTRxSE9PYmx5NnQy?=
 =?utf-8?B?dnRzbTVRcWxIcjBpK29qU3NUdXo2cUZYamY2bnFHanFBTWR4bmdMOGpCRDdJ?=
 =?utf-8?B?QWQyTUdmcjN6QUpkQU1yMkxXaXZ0TmJFam9SSUIvLzJWMksvQ0xVNCs5Ykl1?=
 =?utf-8?B?dDJnN1N5dEprSzV6N1NBOGxnMzN5OEljY094QVpTQlVHMW1ya0VaWXNwdjNa?=
 =?utf-8?B?aTRRUngvcEt2dzdUbFM4VmdUTGJlYWM1NVE5OTZvbnl4a1hubklXRFIzeHdO?=
 =?utf-8?B?YTJGcnc1UVMwTG5mMkxaV3F0YWJ6amZLUWVzbUNiV2ZWcmdJZHcvSFZGc3JG?=
 =?utf-8?B?VUpRUjBNc1I0RGZLN2tYTUZ6MkJLZVJjNnRtN3V5RjdLVm92NGlqU3BGY25j?=
 =?utf-8?B?Yk1uQUZJVVdjNDFYcGlZRWtCUXVpTFRicllvTmFXd3hDVlZFVGhhY05TQTR4?=
 =?utf-8?B?cWhXc2F3cVhEN2RqMXdadks0TkJ0SXJTZEZRM1VPcEtnYWd4Zko4QWM2VzlT?=
 =?utf-8?B?QjZLdEErVHZ4alFQMSt6YW5OcDdVTHptQWtxRTN5TmI3NFB5RnRUdlZSeE1t?=
 =?utf-8?B?WG9acjlGQi9tTmxVREJMUjgxV0Z1eWtuY1pCNklPUVhrV1ZWbFB0UjJsZHhy?=
 =?utf-8?B?V0hYeGRIWnpwcHAwM2NGS3JZSDg1Ty80eFlaSmFQNDcvL3h2clFaSW9pMG9L?=
 =?utf-8?B?NmpkcUZqQm5zek44c09jSC9meUFPcmJidjZvYm5OR0VFaE5BU08vS2VXaTBS?=
 =?utf-8?B?cXBLZ3ZiYjFJdTdId20vZmgzNkxudWpEemNjK2FWQll1K2tETUQ3ajdqcFNU?=
 =?utf-8?Q?jN6dZ9pI18i38ph+GZ6fxK4Pp0WzF5hW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3ZPc0hVbGREbm5uUkFnd1R1QklOdTJmaGtUTGFjTnNXM3FNWHFHeW4xVVZM?=
 =?utf-8?B?V1psTytjeGpuQTRQWldUaG5qQlg3R3VaOFQ2RnNWVkM1NXNiWHUyU0RHUFdi?=
 =?utf-8?B?NlJrUklXeklKL1RLcENDM2NxdzIyWFFnZkJ5NnFmcFRaa2t0ZDNDdTkvQ0pl?=
 =?utf-8?B?T0hrNndXUWdCdk9nRzdMdGV1bVFodXFiMHhPa2xOZXpVa1d5Y1VXM3VqTXc5?=
 =?utf-8?B?eVRoRndWR3BqZ2c0MWZkK05XbmVLVmp4YVZ3c3hqYk5YK1RxUHlPeGdXeVc5?=
 =?utf-8?B?NnlTNThvb1ZrcHRvVzJ0ZXZhSlJMUGFXYm1VWEN3dlZ5M2VqKzlKZXUyUmVn?=
 =?utf-8?B?SmxBVWpCbEIrbzc5SEViL0dGb0hlREFLSUk5WGFZRzV4Y1RKSWs0MXNCYi8y?=
 =?utf-8?B?RVd5VFVCZ3NlS2ZqRDQ1UVF2ejJkMldjR3pyWXpwYStVTmY0eHhqRnd3MGR4?=
 =?utf-8?B?TVlZb3Q1NkNEWERnb3ljYk8vSGZKd2VDQUxtVnd0b3ByRnNqMytzT2lNRFgx?=
 =?utf-8?B?UFpFOExzWDlzSzROU2ovQ29rZ1JJQStBNG9VR1BUZUtnVDd0RmhibldPdnZu?=
 =?utf-8?B?eXdOQVYzTm5zZGhTVEFobWptZ1JKOW5DM01wYkRSZXZCdGpWL3QyNDgyeEtK?=
 =?utf-8?B?WjRiOFp6c2V2WS80VnkxSVVGQWVUd2N5NFI3cTJ4dWlwRDVZYnhKK0FxYUxp?=
 =?utf-8?B?VEFoOURVdVVERS9BRjA4Q2JQSWUrVC9odnMwM1hXMEg0YnlxRFBrTmNLTnF5?=
 =?utf-8?B?eFJkQ1l1SFhHdEUwWGkvSExkdkZjZmlKRCtaNElrWGsvRERSNXp6L1JmckhU?=
 =?utf-8?B?eGJZMHc0SytpOGZBcXpQMzFxQjdIL0FUd1E0bnZteFBObEJqais5U1d6QkFt?=
 =?utf-8?B?VUNsWjF4bkJrR1pzUzR0aTZoTkR1VEhWaElJb2gvNGdORHFUaHdqcFNkWnhS?=
 =?utf-8?B?di9PY0E5alFvME1UTXBqMkd1NllDMVE3bnFaK0ZFbmFaaGxiT3dNUFNrbUJh?=
 =?utf-8?B?QzZlL0NjVnRxZC9XelVWaFBDZVRvKzdITVFjcHZCZUJSbWpNSEhpTklzcGQ3?=
 =?utf-8?B?d2diTmU1SnJDcFRjblo2bWZtQnU5akVPVStleGhqb2pBMEZ6MjBDaXdiNFhP?=
 =?utf-8?B?SjVOQm16U2pTYnlUOG9pZlVzUTBBUmMyS0RwcjBMZTU0VVJHQm52eUhyVk5W?=
 =?utf-8?B?M2tYeXJjTFU1alBtQnduMUtVdU5kK0gyeTBoT3ZkU05aSVdNUEFrTXNMWllQ?=
 =?utf-8?B?OStZR0FiRXRqWTU1dlNaRVpnVmJkZGgxNnNSNFl0RkZ2L0h5NjlXQm5Jd25y?=
 =?utf-8?B?dXRPWEdMTEFBOE5zemVzTFJEV0hKMkV5aldsczFMb0o3R04xUFdoaEE3cE54?=
 =?utf-8?B?V2VYTHNTZ0xFbDdYbkJHRVZhblE2RE1aREVlVTZ6bXVIb0hXZTJ2dEFoclRP?=
 =?utf-8?B?UGsyaWVteUJCTnA3UnRrKy83ZUE1Y1cxS1FIQSthdzdVc2w1YkxDWmswcVE5?=
 =?utf-8?B?elV2V1BoU2tvODh3Nzk4eHBmR3gxTkN5RkNaQjFQOG80MFdqOVBlanRVTmJ2?=
 =?utf-8?B?MkZZdUZNKy9DYm00bCtIRmVYRUY1b0FRM05PVW1ua002ZFVqdTR6MFN5bVl4?=
 =?utf-8?B?SVJLV2VoUVNuem0vM05zbzFxeWpKVWtOaitSVGhtdzRmdVpETVovSUNPYkhG?=
 =?utf-8?B?RkNOMW56bWRTUTRRNVcwZ0lTU0RGbDJQNXA0SkRCYkZ2M0JHSHdYN3VXeU1J?=
 =?utf-8?B?enE1U1o3THg1bUlLQUYrN2FBdzJsdGd3SDNTRitwOXpUaEpWWjNMb0pFR01R?=
 =?utf-8?B?UCt6b1dkNm5lS1J0RUFaTlg2WUx6SGFLNU1Pd1l3bXhZNm5UZGVxS1E1NDJa?=
 =?utf-8?B?MjJYR2JJUW1Sa3RFTy9QWlVQNWs2eEtycDdrYWhHUElaQk9IV2hPd3ZyNTB6?=
 =?utf-8?B?TjBlSnV1ZlFKdGxiRzRqNFdweDZETmRaT2NYMGFHbWMzdUozV3lPdVpmWlFq?=
 =?utf-8?B?V2x5OGFIV0VPVFVvNldjS003SmJ4VFB1Y3BoeFBOYitRSjNTQlQxclZ4TVBp?=
 =?utf-8?B?ekFPYmg2aWdGeFZzSjJBTCtEL3UrM01zVzBoYTFaNCt2ZEFUeklkY0RrQmxs?=
 =?utf-8?Q?a6j4E8YrM7j2Z7XNY/l0z0umf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cc3173d-3fa3-42f4-d9d6-08de1b1d524e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 21:09:48.4440 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hiDx0SLXxJWcJ1u4UPdMxo8U7GZ1pOzIsoG/6/AhSLfom9bVGEIghGw40BitorByK8v5I5YNnjPaPL8HIbAznQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6348
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



On 11/3/2025 12:15 PM, Rong Zhang wrote:
> Hi all,
> 
> On Tue, 2025-10-14 at 00:47 +0800, Rong Zhang wrote:
>> When a connector is connected but inactive (e.g., disabled by desktop
>> environments), pipe_ctx->stream_res.tg will be destroyed. Then, reading
>> odm_combine_segments causes kernel NULL pointer dereference.
>>
>>   BUG: kernel NULL pointer dereference, address: 0000000000000000
>>   #PF: supervisor read access in kernel mode
>>   #PF: error_code(0x0000) - not-present page
>>   PGD 0 P4D 0
>>   Oops: Oops: 0000 [#1] SMP NOPTI
>>   CPU: 16 UID: 0 PID: 26474 Comm: cat Not tainted 6.17.0+ #2 PREEMPT(lazy)  e6a17af9ee6db7c63e9d90dbe5b28ccab67520c6
>>   Hardware name: LENOVO 21Q4/LNVNB161216, BIOS PXCN25WW 03/27/2025
>>   RIP: 0010:odm_combine_segments_show+0x93/0xf0 [amdgpu]
>>   Code: 41 83 b8 b0 00 00 00 01 75 6e 48 98 ba a1 ff ff ff 48 c1 e0 0c 48 8d 8c 07 d8 02 00 00 48 85 c9 74 2d 48 8b bc 07 f0 08 00 00 <48> 8b 07 48 8b 80 08 02 00>
>>   RSP: 0018:ffffd1bf4b953c58 EFLAGS: 00010286
>>   RAX: 0000000000005000 RBX: ffff8e35976b02d0 RCX: ffff8e3aeed052d8
>>   RDX: 00000000ffffffa1 RSI: ffff8e35a3120800 RDI: 0000000000000000
>>   RBP: 0000000000000000 R08: ffff8e3580eb0000 R09: ffff8e35976b02d0
>>   R10: ffffd1bf4b953c78 R11: 0000000000000000 R12: ffffd1bf4b953d08
>>   R13: 0000000000040000 R14: 0000000000000001 R15: 0000000000000001
>>   FS:  00007f44d3f9f740(0000) GS:ffff8e3caa47f000(0000) knlGS:0000000000000000
>>   CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>   CR2: 0000000000000000 CR3: 00000006485c2000 CR4: 0000000000f50ef0
>>   PKRU: 55555554
>>   Call Trace:
>>    <TASK>
>>    seq_read_iter+0x125/0x490
>>    ? __alloc_frozen_pages_noprof+0x18f/0x350
>>    seq_read+0x12c/0x170
>>    full_proxy_read+0x51/0x80
>>    vfs_read+0xbc/0x390
>>    ? __handle_mm_fault+0xa46/0xef0
>>    ? do_syscall_64+0x71/0x900
>>    ksys_read+0x73/0xf0
>>    do_syscall_64+0x71/0x900
>>    ? count_memcg_events+0xc2/0x190
>>    ? handle_mm_fault+0x1d7/0x2d0
>>    ? do_user_addr_fault+0x21a/0x690
>>    ? exc_page_fault+0x7e/0x1a0
>>    entry_SYSCALL_64_after_hwframe+0x6c/0x74
>>   RIP: 0033:0x7f44d4031687
>>   Code: 48 89 fa 4c 89 df e8 58 b3 00 00 8b 93 08 03 00 00 59 5e 48 83 f8 fc 74 1a 5b c3 0f 1f 84 00 00 00 00 00 48 8b 44 24 10 0f 05 <5b> c3 0f 1f 80 00 00 00 00>
>>   RSP: 002b:00007ffdb4b5f0b0 EFLAGS: 00000202 ORIG_RAX: 0000000000000000
>>   RAX: ffffffffffffffda RBX: 00007f44d3f9f740 RCX: 00007f44d4031687
>>   RDX: 0000000000040000 RSI: 00007f44d3f5e000 RDI: 0000000000000003
>>   RBP: 0000000000040000 R08: 0000000000000000 R09: 0000000000000000
>>   R10: 0000000000000000 R11: 0000000000000202 R12: 00007f44d3f5e000
>>   R13: 0000000000000003 R14: 0000000000000000 R15: 0000000000040000
>>    </TASK>
>>   Modules linked in: tls tcp_diag inet_diag xt_mark ccm snd_hrtimer snd_seq_dummy snd_seq_midi snd_seq_oss snd_seq_midi_event snd_rawmidi snd_seq snd_seq_device x>
>>    snd_hda_codec_atihdmi snd_hda_codec_realtek_lib lenovo_wmi_helpers think_lmi snd_hda_codec_generic snd_hda_codec_hdmi snd_soc_core kvm snd_compress uvcvideo sn>
>>    platform_profile joydev amd_pmc mousedev mac_hid sch_fq_codel uinput i2c_dev parport_pc ppdev lp parport nvme_fabrics loop nfnetlink ip_tables x_tables dm_cryp>
>>   CR2: 0000000000000000
>>   ---[ end trace 0000000000000000 ]---
>>   RIP: 0010:odm_combine_segments_show+0x93/0xf0 [amdgpu]
>>   Code: 41 83 b8 b0 00 00 00 01 75 6e 48 98 ba a1 ff ff ff 48 c1 e0 0c 48 8d 8c 07 d8 02 00 00 48 85 c9 74 2d 48 8b bc 07 f0 08 00 00 <48> 8b 07 48 8b 80 08 02 00>
>>   RSP: 0018:ffffd1bf4b953c58 EFLAGS: 00010286
>>   RAX: 0000000000005000 RBX: ffff8e35976b02d0 RCX: ffff8e3aeed052d8
>>   RDX: 00000000ffffffa1 RSI: ffff8e35a3120800 RDI: 0000000000000000
>>   RBP: 0000000000000000 R08: ffff8e3580eb0000 R09: ffff8e35976b02d0
>>   R10: ffffd1bf4b953c78 R11: 0000000000000000 R12: ffffd1bf4b953d08
>>   R13: 0000000000040000 R14: 0000000000000001 R15: 0000000000000001
>>   FS:  00007f44d3f9f740(0000) GS:ffff8e3caa47f000(0000) knlGS:0000000000000000
>>   CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>   CR2: 0000000000000000 CR3: 00000006485c2000 CR4: 0000000000f50ef0
>>   PKRU: 55555554
>>
>> Fix this by checking pipe_ctx->stream_res.tg before dereferencing.
>>
>> Fixes: 07926ba8a44f ("drm/amd/display: Add debugfs interface for ODM combine info")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Rong Zhang <i@rong.moe>
>> ---
>>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
>> index f263e1a4537e1..00dac862b665a 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
>> @@ -1302,7 +1302,8 @@ static int odm_combine_segments_show(struct seq_file *m, void *unused)
>>   	if (connector->status != connector_status_connected)
>>   		return -ENODEV;
>>   
>> -	if (pipe_ctx != NULL && pipe_ctx->stream_res.tg->funcs->get_odm_combine_segments)
>> +	if (pipe_ctx && pipe_ctx->stream_res.tg &&
>> +	    pipe_ctx->stream_res.tg->funcs->get_odm_combine_segments)
>>   		pipe_ctx->stream_res.tg->funcs->get_odm_combine_segments(pipe_ctx->stream_res.tg, &segments);
>>   
>>   	seq_printf(m, "%d\n", segments);
>>
>> base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
> 
> Gentle ping.
> 
> Thanks,
> Rong

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

And applied, thanks.
