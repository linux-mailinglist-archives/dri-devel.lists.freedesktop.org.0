Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F132AAA1028
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 17:16:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97C3810E4C9;
	Tue, 29 Apr 2025 15:16:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="2cOhmP8q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2059.outbound.protection.outlook.com [40.107.220.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EE8110E4C4;
 Tue, 29 Apr 2025 15:16:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jZxUwhRFMpfQ8qUNmCWIzjZJ6pesQE+/T2KFJP0sxH8cY4l6Pm2lmljsOBrh4Oy5kUx4uFPEDfcCXnUUlE2rSmSMFtL893aT6ocLvrG2QfmqlFGthUyLMOcJw6FkikVAxC/JzK9Vs18AdrQAlpH/AiZx0wlpE0fXRoIrBdb+gQhD9zMNW61gFnr45pvZiUEzjSwFOwb8kJBRryOS2PsIMKO/X44huE0NRObL0HEL9sv3cOx/V7VFWsLBzhIkDfuB0j9AvsevVGLyRWrV4DTMvQsHhDxIj959Km8ho/7zdh1DNG0wwCrcD4YD7BUmX6FVy6lFS52BotkBIG7NZEzYgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cbcz2oeM8q9tARbnF9fSzs7ETqO2jZ9EAdNwzwx4A0A=;
 b=SmM2ZeFm4WWNetG6KJ1vZMm5aRbrDAIAXhXyaElqZZvQ7Cyw76sE6JgXbF2uREkLqZ8BKfj2WSGVrfBNDjIYCbKwGCVS4usVyoxSnjaQcAjlkLnAfLlH45MpV2yEl+b4cFs3eB72QVCzh07iWCJg/o8l/T9D3rjJ/CddapgW2YmVFOMr0iTtKAiet1e2OAO/G4sHYe/7B9ZHVUaCE3uh7AeNh8dWPmSCcNrV8mAtv8XFKLkfCvbT00hWCM4JaL+NujFRQgYAOSTVUlhr+pd8YDO7G7SEFH8OFW6a0CX9XvT7oyhfNb73z07w+A4zyIZwmxomnu3voPx+6dtZyK5dOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cbcz2oeM8q9tARbnF9fSzs7ETqO2jZ9EAdNwzwx4A0A=;
 b=2cOhmP8q3LirO/ljxpPsMEciZjkWTtJxzGNrDu9+qC2bCYOTAj86TMFfJWavFq1+GV+yHiwrQaNcZECRnSu1YR5MfXRoPLSVy/beL6M2ntQHctC0qQ9MiLfqNVka4pdECg+sXr42VKLNXnDvNAzaORPWWtzJqWJJA0bZRxiSaDk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB9203.namprd12.prod.outlook.com (2603:10b6:510:2f2::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.29; Tue, 29 Apr
 2025 15:16:28 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 15:16:28 +0000
Message-ID: <8e460fb9-7dc5-4216-8f2b-248007a1a770@amd.com>
Date: Tue, 29 Apr 2025 17:16:24 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v4 03/16] drm/sched: De-clutter drm_sched_init
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>, Philipp Stanner <phasta@kernel.org>
References: <20250425102034.85133-1-tvrtko.ursulin@igalia.com>
 <20250425102034.85133-4-tvrtko.ursulin@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250425102034.85133-4-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0255.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f5::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB9203:EE_
X-MS-Office365-Filtering-Correlation-Id: b84df15f-567b-48f9-806c-08dd8730d084
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UVZoYUJNZzFsUTZ2TDFOZU9jRGsvSmtKd2wvalg4ZnhtQ3FGWGZ0dmJjWEtn?=
 =?utf-8?B?V0oyNmtCdTRZV3VEQTRsZm5XTjNVbHNGNGVPdDVKOGJmT20vZzNnODR4MnBQ?=
 =?utf-8?B?aEovQTZJQlJ0cDc2ZytCd2hQQXRDL3FHS1dDVXgvMVdCdDRBTUtXMUk3OFhF?=
 =?utf-8?B?aTZrckJLVkY0dGE2cktZbnd6SXlXV0dHMTZCZVJUWVBKN0tjRzJ6eWRpcUU4?=
 =?utf-8?B?MSt1eUlDMkc0bkFRcTgvZ3BJclJ5UzlKVGhFRFpyTWRSUFlWYVZ6c1YyRlo1?=
 =?utf-8?B?ZmJGMmlhMjFuTUE1Vy9WLzhaZHlsSUFzVzg2S2dkVWFjNm4xMFBpejFiTGl6?=
 =?utf-8?B?eWo2VHoyUlpXa2Z0Q2xESENWTWJxN1JjbnhXMkR6QnlleDY1V1dxNVcwS1RC?=
 =?utf-8?B?c0JoSXFMc1N0U05mVGtyVHpSd3IyQVFEWjloNGlaY3QzKzZSYnpwSGp5OU9C?=
 =?utf-8?B?bTA1Ky84L1ZWTHlBVEIrQXVsZW5hZ3VIc1VWL0V6dDZOZjQxeXJPVTlldjZD?=
 =?utf-8?B?M2V2SzFpQlBDL3Fhbk5KY0k2Q2JweXo3NnZzWjhGbFduVnJYS0VXaEUxRUJo?=
 =?utf-8?B?cUFxcmdiSys5LzdiTjcyTEkvWHZEZUo5S0dHQWlHbHNUZXRnM2ZiaWQ4YzY3?=
 =?utf-8?B?Q3NtcjQrREJIR1VoMDkvamtlM01yanc0WmpRaUVwRy9nb3E3dFpPc1RiNkZO?=
 =?utf-8?B?emxqWEZWTXpDZXlUQjBPYVllMVRLSnhkSHRsYXVYbS9aWk1tS0szWjkyeWEx?=
 =?utf-8?B?eExoYWdWT0N5MVczTXI2c3EydjNXbzQwampzOWJQSWxmZFVuYnB3ZzAxTHF5?=
 =?utf-8?B?WE1oU1ZhMDJ1dlFKOHhVSEFaQWl1RmQ3K1Brdk5OZmcvdlVZYzFEV09ucW1i?=
 =?utf-8?B?UVh5SVU4UDBxRVVHOVUwemlFeW9lSkpMZ1VMcmtUajJSb2h0Wm1NWVB4NWND?=
 =?utf-8?B?ZHJTdWw2d3FmQUx5SnZMbFZBQXFxUkJod3A4MFR0VWNucUxwMkQ5UlViK0sx?=
 =?utf-8?B?VHdHd3I4dEFHNEM4d1pYSE5QVnM0VEFtQmtRalN6V3hkTWlRUk9BMkZkaDlV?=
 =?utf-8?B?aXRwVFNVdmRyS3ZKYTUzTlI5bk5FWEJQdjRZbml4S1VPN1pNdjA1bnpKd1Fm?=
 =?utf-8?B?MmMzcGdvb0toZWJUelVsUGU3RndobCtKOEFBSWRYeEViUGRXVTYvY1JKa2ty?=
 =?utf-8?B?WHB6UUZRQnR6N25ES2R2YkZIaWZHa0NhNTRtT3BmZUg1My96NjRySnlaVjNn?=
 =?utf-8?B?Z3VOZFZqQ1pMeUhNelBLTnowOHVhYkwwd0hBdEIrbXRWNjVoZmgvdUNVbXI1?=
 =?utf-8?B?NVBVKzdCcHpSaDBmU0RFZjUwNFFyMkZkUksyR3JBaG9SNG5CaFh6UlpzUkk3?=
 =?utf-8?B?OW94ZVFhZlNWWHZrQmNyQmMvWm45MGtheFphZnl5VVhMcXdBN2Z1b3dqL2lN?=
 =?utf-8?B?Wk9yVitWeWwyVThHdExhRjlGTWFaYWJpRkhLL2ZqSmVFQ3ppbUxoSHlHeFFG?=
 =?utf-8?B?Q3lydUtQTVQzVjd0WWZkZG9QR1FjQUYwOS94ZHQwaDdPSFBqVndKSElvSFMx?=
 =?utf-8?B?TEFoNnVHVkVGdWlWUUlML0dtRWhxWkRuN09lcGhvbEJ2dWhxZ0hvOGhSVytC?=
 =?utf-8?B?QkZWZlhhVEMxLzJuQXZ4QkxTc0NBR0FKdWU2ZDNUM1FrTyttcGR2US9KU1or?=
 =?utf-8?B?VStWNGMxS3BIaDNJL3dsbXByMVcyc2dUcFpQMjZsaEhKTFY4aElJRGsyWHZp?=
 =?utf-8?B?MUVQTEdqUHo4MFpJbnM4NFpqUmo1SmtYbjJ3MkFvMTh1N0NOWUNXM1BoRzZW?=
 =?utf-8?B?L0dJOGdoTWVhekdjUXVkSVRUWStGZmEvdEcxcnVnYWJYcyt5NHdSaC9Xb1pp?=
 =?utf-8?B?WWEwNktWMFJ2WFRYbkhobkNpUldmVHNGaDJTZE9maHppckQ3a0dKQjBpR1FO?=
 =?utf-8?Q?E5s4fadZZ0I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1RWVngrRzhtd2hLUnBwUU82dHB4MHJZNjM2SXo3VzFHVmdVbCtvY25zVVdT?=
 =?utf-8?B?S0RoNmRkSGZCTEQzaWwyZmZETDJTK1JCcmJtblQvTWhyVGNFUTQrQkU5L3VF?=
 =?utf-8?B?MFBlWG9laitoMENxQW9XQk9QNk8reUhWcHRWK1VGbm15RFpvaG1XRnE4MzJm?=
 =?utf-8?B?Ym5NSkVCcWt0Mk43YjNQbVlKb1l3c2l3eC84NWFkRzJaZzJpbjFrQjlmZi95?=
 =?utf-8?B?QjVZcVpQdXBjUWp0enp6a0dYOWhLMzZPSFA2OTdQejJja2VIZkFYY08zRXdl?=
 =?utf-8?B?WHdaeTM4Y2ZyTlFHbU1mUmw1bjgyakZGUGR2VDdXdFRTTGxvTU01K1Nyb1RU?=
 =?utf-8?B?OFVBRVhqY01WL0IwTkdBcXBFOFN3UytaTDBHSGRhQkV3WGhxU0J5MHNUZDM5?=
 =?utf-8?B?dU14QUJwbzVvcmROWE03bnh5eUE1NmRyRU5kR2FrcnhmTUdTa25lbmgvMWNh?=
 =?utf-8?B?L3JFOXdZNnQ1aWdhd1BQenEybUh6U0QwWGZSYjhWSzU2M0ZQbVdEc1Bhampk?=
 =?utf-8?B?YndKamJBRzM5K2hHRUErVG1Rdkt4TmtiVTF3dXNBVUFLRm5JYTlHeWladkEz?=
 =?utf-8?B?ajVEaHZubGtHcFB0SXRNNjF5SnI1ZWY2WlQrNzVIaTEva3hkcWMrNU9aa2Z1?=
 =?utf-8?B?V29zWUplaDRWTTNiVElZRzhGbWxBNGxNK2g0VWpnT2FZOW9oWWR4dStSc1NP?=
 =?utf-8?B?K1FZZnY3K2dyc3Y0a0tXWHJBblBnN3JzczBubWhkRURPckhtYzZDby9FTFp1?=
 =?utf-8?B?Vld1KzRtYWoyUjd5YWZwaENnUHByMTlBMTlVdlJVSndaNTlPNUpab1ZpdzBK?=
 =?utf-8?B?Q0xFMW9wTUVRZ3lRSUpkQjdwbDBtTHlBT2V3L1RKT3V0WC92Y0RRU0dLWjRP?=
 =?utf-8?B?d2ZoWisvZnVQQlhmRUN5VWxCc25ueHYvME9mWEJRdlgxcUhpR0l6dWc0elQr?=
 =?utf-8?B?UXRCNk0ycFJtcjFDdDltaHFuRjZDWnVVZGpkcGszWHdSdzVPcHM3SWViV0dP?=
 =?utf-8?B?L2d0TjV3eWpTaGVDTGxKeWY3Wno5bGhJVVQrMnNRSWlVbldFR09uVG5wdkhR?=
 =?utf-8?B?NE53V3kzZlJRRGQzRzMxaDhyWDIvRjBHN3puS0hsTmZDczdJRUFTUXFHMjlx?=
 =?utf-8?B?RXdoN2pVeWlSL29iTWpmdXpoQ1cranZ0a0pTMmFhMGhXWlpRSFB0RW9xRWNi?=
 =?utf-8?B?RmE4b3pXeG94bGVEcnpHUHo2ZjZydzA2bFg3akZjdUdTSHVreVhESHVOM1Rz?=
 =?utf-8?B?ZG1Yc09UWmxuaFczRm50RXIzSFpDTHZpYXp5M2thd3YxNmNRZlQ5YzNrOExx?=
 =?utf-8?B?TTB4bWdaZ1B0YXZEbEJwSWluamRpQ3BoN21GUnpsRXZQclhzeVc5R1MvUVhS?=
 =?utf-8?B?WS9Td0pyUWxmSWFzM1hIZmRaSUgxelpRbEQwTlRaNkNmVXAvaENQZWlUTGFw?=
 =?utf-8?B?ZTZiNHJwM1ArckVKREo4ZjVhaDF0STYvTjRjbXp1ZGMwSHZKVHg2b05rM2ZL?=
 =?utf-8?B?ejcxdXdqbDNhTEVTU2tCdUFVWlRMMktMRFdVdnNRUnVSZGQvdFBrTVA1VWNN?=
 =?utf-8?B?V3BqeFhCTDdhdDZTdU9TOE9aU0pGVmM4eGFQYk54cXRTZ3pPV1pPbGNiWnN4?=
 =?utf-8?B?N0YvZEs4R3IvYUY5c1B1SWRHa2lHTWZ0MnZaZDBYcHlkSnJpOUFyc3JOSUgr?=
 =?utf-8?B?MjJFc3dFTEpFY0FBdWZDQXJRYXgvWUlWM01RMGZ4WnpBVXZhZWJYT2pwUlV2?=
 =?utf-8?B?MXlqQXZEY3d0UFV5YXdyak83ZktvUjQ2bmxNOTJtZzBrVzBwc3QzWGJiSlJQ?=
 =?utf-8?B?Y2dNcWZsMXNYTWFGbWZacHY4VU0wR0pwMFplNkRxMTVhZ29lY3pNWGE2cVlM?=
 =?utf-8?B?UXZlSEVDd0FKY0twY2pmbUc4U0U3WVAvZy82VUhrR2NKTFpBUGdkV21KOUdJ?=
 =?utf-8?B?U0pMdi9TN1RUVk5FV3lYVmRRRXovUEVGdnRScGRwc3FMbEh5VXNHZG5wQUZH?=
 =?utf-8?B?U2JXWEp5R3psU1cyZGNSVEJqbUNsR20rTmQxNm8yNXUvZFhBa2xSSTBqUW0w?=
 =?utf-8?B?cGhlM3JDdHVkR0dJaUVvSzdkZm9vVk82T3p1QzQ0SFloQUdHQ1E0RzAxb2Vs?=
 =?utf-8?Q?ljSuw2vZ3/lxqYU2NLUkHHYgq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b84df15f-567b-48f9-806c-08dd8730d084
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 15:16:28.5321 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UNqLJ/rOa7tZfQ5hWf2xHvekQsLO6lZb7zKZV+qocXbQN87zcTJoM9OIU4xulLUw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9203
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

On 4/25/25 12:20, Tvrtko Ursulin wrote:
> Move work queue allocation into a helper for a more streamlined function
> body.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <phasta@kernel.org>
> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 27 +++++++++++++-------------
>  1 file changed, 14 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index ca5028f7a4e9..86e40157b09b 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -83,12 +83,6 @@
>  #define CREATE_TRACE_POINTS
>  #include "gpu_scheduler_trace.h"
>  
> -#ifdef CONFIG_LOCKDEP
> -static struct lockdep_map drm_sched_lockdep_map = {
> -	.name = "drm_sched_lockdep_map"
> -};
> -#endif
> -
>  int drm_sched_policy = DRM_SCHED_POLICY_FIFO;
>  
>  /**
> @@ -1258,6 +1252,19 @@ static void drm_sched_run_job_work(struct work_struct *w)
>  	drm_sched_run_job_queue(sched);
>  }
>  
> +static struct workqueue_struct *drm_sched_alloc_wq(const char *name)
> +{
> +#if (IS_ENABLED(CONFIG_LOCKDEP))
> +	static struct lockdep_map map = {
> +		.name = "drm_sched_lockdep_map"
> +	};
> +
> +	return alloc_ordered_workqueue_lockdep_map(name, WQ_MEM_RECLAIM, &map);

Some comment why we have a separate lockdep map would be really nice to have here.

Apart from that looks good to me,
Christian.

> +#else
> +	return alloc_ordered_workqueue(name, WQ_MEM_RECLAIM);
> +#endif
> +}
> +
>  /**
>   * drm_sched_init - Init a gpu scheduler instance
>   *
> @@ -1298,13 +1305,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched, const struct drm_sched_init_
>  		sched->submit_wq = args->submit_wq;
>  		sched->own_submit_wq = false;
>  	} else {
> -#ifdef CONFIG_LOCKDEP
> -		sched->submit_wq = alloc_ordered_workqueue_lockdep_map(args->name,
> -								       WQ_MEM_RECLAIM,
> -								       &drm_sched_lockdep_map);
> -#else
> -		sched->submit_wq = alloc_ordered_workqueue(args->name, WQ_MEM_RECLAIM);
> -#endif
> +		sched->submit_wq = drm_sched_alloc_wq(args->name);
>  		if (!sched->submit_wq)
>  			return -ENOMEM;
>  

