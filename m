Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A9EA20C7D
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 16:03:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D20C310E678;
	Tue, 28 Jan 2025 15:03:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Ryhd9Ryu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2051.outbound.protection.outlook.com [40.107.243.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32A73889BE;
 Tue, 28 Jan 2025 15:03:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wM8/m++ZT20xR7LJqLdauzhUvUd/oO0hunFJX/a9MjkE5cj6icc0o8WjBs/WID2PQk8s2o6a9/B7Yw9Lkv7zhQ+ga3D9kaznWSu401ZeUgj+pbC5QBQEm1B+L1G8LlL7d7DJ/D9AcYWF6LVUOC3mkfJwNWsR7mrY1+6Q2PlJAiB1JiKoyVrr+hLZU6UcTk/K5wAgr6vOKCb2R5NBjKdlIFIf/aQlmpdNWrs6JPsx3tIZacWnSABPNGB8K9+74sLLuYtMSDBHF9Z2arenYRc+4++01Lin879qA1BwwyImip6Eboeyu5IiMiUx+Cool4e4IBhuN9W98NHec3o/nc+lEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RtZSTLo80qX4Nj+EOnuMbxlA1PScSF8BkgIHL0M9qIQ=;
 b=yoc+t+kuWfuCMuOB/6Xdt+Ey6CI+8bSl8AboLaSLlj5GB+irJDGhjv/OPCNvz+amrxTbwZuPGNrtJ+apWtYY9qJb+KzRwt23i+xKiVHdnA9QvimkEg/arWm0TM2nijyiLj7dcj0VypjF5GOrpTXcDKl+461sFmg5/fMhm4JcFHYXEAEPRJyq/vNoP2MLCMk4jQ3wk4+kKFN4bieCNUHRSssabfxQaDnbR9iwPyk5LR87Ik8l1Yff7A1z7RRiXkEikGoQthQgbj8LdHTAqN91umTSBubZe298Veyeug+9iAO5SRgpm0VmrkZp2jBQ4YppD5km/Uo2en9nkcqSM0ayGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RtZSTLo80qX4Nj+EOnuMbxlA1PScSF8BkgIHL0M9qIQ=;
 b=Ryhd9Ryu31AnLYzk+cByUGcTSBGpHNAM2dLrsLhjNi9GHAUqJhhhETToPXEVKgigZ7cSl3E4I+e9iHL0/hcb9VvFAbyZuGq7NGcJSsitbSoAgeAEVbI6E76DS+I7D69faf2S7hkQgBxdCnRqbudkM6zbvugFpr1PAQpYAWW3dyM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by DM4PR12MB6160.namprd12.prod.outlook.com (2603:10b6:8:a7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.23; Tue, 28 Jan
 2025 15:03:20 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062%4]) with mapi id 15.20.8377.021; Tue, 28 Jan 2025
 15:03:20 +0000
Message-ID: <2b35e1ea-e7f7-4852-a088-80b71a82b780@amd.com>
Date: Tue, 28 Jan 2025 10:03:16 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: restore invalid MSA timing check for
 freesync
To: Melissa Wen <mwen@igalia.com>, sunpeng.li@amd.com,
 Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 simona@ffwll.ch, alex.hung@amd.com, mario.limonciello@amd.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com
References: <20250128005135.168681-1-mwen@igalia.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20250128005135.168681-1-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0261.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:68::28) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|DM4PR12MB6160:EE_
X-MS-Office365-Filtering-Correlation-Id: dcddc496-14a1-4336-ae21-08dd3face6ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YnNGdFFnOE5nR1Fta2t4U0QwTjJpOUxNc1ZmT0l6Z2FrdFYwYWxQODk3NTBZ?=
 =?utf-8?B?WXdjdFdYbUJlQ3lmeTFUNU93Y3lseVNjRWJkWkpIWXdUQkY2TmtHSmdMQ3dh?=
 =?utf-8?B?MnUvdVpRelRMUHoybkZLNU04cHhvV1pudFVqbHY4L0pWcERqWFFVR3ZzVWZJ?=
 =?utf-8?B?a2ppbXhtcXp6QlErYTlRRjdqVDhva2pSSFo0dUswaGZTWHRqeXo1bnFRTUhv?=
 =?utf-8?B?U2RNMnpJR1VKdHJqYkxSMEdlM1NpQmJieCtnSVpMMDJtQTJHVlZ5ODdLTUZX?=
 =?utf-8?B?ZEtuTWdKbmR0VHA4UDFkYnZRRFdMNnhVNnFBdll6SzhsNk1CRTB5cUdYUFI1?=
 =?utf-8?B?WlZvQzdXRExhT21mdTAvRUNEeGFDVEdhdmlCa0xzTnBTY0k4bVVkOW9IL2ty?=
 =?utf-8?B?N1VoQzZmSE9FZXp2bUZhcHpYcDN3aTRsRG91RmVTMnJBQ1ZqbWRGMWdHekla?=
 =?utf-8?B?ampNUkF6c1FHWjVPSHBMWEdrc01kdWJJdWlER3VZN0RISFhUN2FrRkVoYllC?=
 =?utf-8?B?THpueTZVeDZiR01Ya293RVdWMERsZWFEK3d3MUVQSU1HUGhPMVBiTkU2c3Fy?=
 =?utf-8?B?eTBlZ3dlVmlVRlg0UlJRS2tkb0lUaXVZRGR0dVdCc0hqeGNkOHJUY3ZKRXJr?=
 =?utf-8?B?YU50UXlBM21TT2t1ZGFOdmlWTmVwSlRURVR6bEcvM1hkaHdqM3lqYkt2MnJp?=
 =?utf-8?B?RGJRaFVKdUdCdnRKV2YvdmhOZ0Z5emxiQlZWSWoxakkrZWpuWHF3ZjJmZlZr?=
 =?utf-8?B?QjZqSUhvRUh6eHg0SFlQZDlnTjN3VThXbWEzYUZIL1pZSUFyY1lsTmkwcm52?=
 =?utf-8?B?MDdseTB2MjA1V0kzOUlpYVc0Mm1uWExNTFJlaGh6NG1KbnJNUVBaODB5ZlpK?=
 =?utf-8?B?dXcyYVhsV1Q1Q0dnVlJ5SHc1cHRqdnVyTytyb2MwaUhUQlRvSlVYV2dPcEhu?=
 =?utf-8?B?ZlpFNS9SUjZyWVROVnlWMDMvTWV0alI3MTVyNnJQWHNneG9ldFFXZFVqMFJD?=
 =?utf-8?B?bEhlL2xidUNFMzVPbVdidGdzdTlHUzZuaVVnOWlwYzBYaTZGR3lZaER6bmlQ?=
 =?utf-8?B?RllqVTByU3hYZ0l1YTF0MUFwbEVEMFlURGE2NzhmRU1OWmcxMlBURWNCeTlL?=
 =?utf-8?B?RmR4WWxORDQyUUJ6VnN6UTl4cmVMZGZSWndBUlpaMDNHcmNvdHk0L2JyRkF3?=
 =?utf-8?B?TVJQaTlkRUFDVXFrWnN1ZTBkVmFobDJVeTZGeVlrbnByMTJ2LzZFQ2IzWHF0?=
 =?utf-8?B?bit6YnJEYk5rU3VzL3BlRkpTYW13RG52LzBxNVNVdkNvdUtMNWhySFN0RXNZ?=
 =?utf-8?B?K3RSVWE2VWc2SFhFNTBGNjFweGxvRmV2ZDdLMEJuUm4zbThHdTFmdUd2amp4?=
 =?utf-8?B?NDgyeVlIOHR0SHFWYUZhcTNEeEpjK216MkoxSWE0SUpOUTNBQ0tWQVl6dVZN?=
 =?utf-8?B?SnFIaHJJOHRRVk9pWFY2NW5lUE9Bdkd1VmpDb0RZUFovMzZiZ1ZSbjZSNU41?=
 =?utf-8?B?R0hrakdRVTYzL2h0KzBHeldLbG5LN3d1Nnlsb3dGamRmM1QvSC9nSGJJQkxH?=
 =?utf-8?B?RG9YWWVWZHZYYzRpaEdCdDBIcGpBeVlaSitSMEFFcE9pZnlBdzlBVmtCZDJx?=
 =?utf-8?B?SGp4Vi9wM3hidWVCRzVNaGFzVXdyNzIxT090TzV6Y08vK3lBZnpkUjNLemp2?=
 =?utf-8?B?M2laZzdJczI4YitWMmNZdFFxeW9BRmFsYXVpSWhLV3RMeXFKaFhrVzBUc1I3?=
 =?utf-8?B?dlU2RysvbW9lTHVBV2ZOZmRXSHdjS3pWSmRxUFZsdk1Ud3pRajlwS3JxK1dO?=
 =?utf-8?B?VGhCTm5nVDFJeldYNHBuK0hFREx2N1I2WG1sMTFtNy8reTdrSFFuUXE1Qklx?=
 =?utf-8?Q?p5WgBPt/pp59P?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(921020)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rzk4elZ5bXF5NU5haWlPcDRLbGpuOUJuMC9ZaVF4SjJod2pVU0lMdG5QRWNM?=
 =?utf-8?B?aU9TSWpKUmNUbnRQQlZvVVROdW45eE9pSUVPYTN5NjBNMzQ3WVpCK250TWh2?=
 =?utf-8?B?a29VVS9lTmoxYURUaGYrdy9tbUxZVGd1cUViQTRrQ3g1eGtWMVlqeU9hcTN6?=
 =?utf-8?B?ckZNU2ZoWVRpNmxma01PSVkrYXF2T1BySjFNOEdrRmdBN2g4SjNpc3lJM2hY?=
 =?utf-8?B?WUxRTWFWZG9JVzlwSkZiODVHWDdEdEs4ZU9COXZ2VFlBNXBTS0E2c284aW9J?=
 =?utf-8?B?Y01YSnIvV01xaWcrMHV0RjVCakhEaHB1Ty9ibWRoNEtJU3pSUlV0Z2ZoMGdE?=
 =?utf-8?B?YU9jeFJVbGE0RDJ4Y2hUSXBSU3U2RDZBMHlaVFJBRS9KOVUvRHFNbm43QVRs?=
 =?utf-8?B?K1Q3Sys4RFFHZTRwdnhhaDE2OXMraTNHRS84UXp4TDM0T3c5aXpLQytLNGh3?=
 =?utf-8?B?ODZvTktmQTRoQmFzTWR1eHZDdkVQNzkzekgyVlhuNHZaMXB1eTBaUDNGbzdO?=
 =?utf-8?B?bDRXR1ZYODFCTFc2d2ZKKys5eHl5OWF1V2NSZWNjczU2NEUxNit3YkxGN0VC?=
 =?utf-8?B?WFpFaTZia3ZVS3A0WEpsemt0b1R0VERYaFp5K2ZUYXNuemtSb1NpQ2h3REk0?=
 =?utf-8?B?THpXWHNRdy9vSm9ZVFhkZWt0eVRhWUdxZFVKS3JVUnJVRTR3VzZBTXA1eUIy?=
 =?utf-8?B?eit3T1NWelVibGhvekFNWkwxTHhXNDRGMTNEcTVrYmxESTFLaHh4NytOVFF2?=
 =?utf-8?B?ZnVqU0Nha0dJMWpNMGVhcTFCOGYva2VtOU9kK2Zzbkg4ZDJJc1dPamVTbm9G?=
 =?utf-8?B?TjNvQktQdERMaHVTV3BGTVZCRXc1ZDNqb2VaeWhlVjcvV3RKVkZ6WkViRzdp?=
 =?utf-8?B?L1JZajdaUklTVkRtTnA2LzJmdndhZHhqYlF1bUJCMmRTWmI5enFOREhHcjhR?=
 =?utf-8?B?VnhZMHBTblpOUUozOUVoM3Y5QnZnZHVJaWh6WE5vRUxLQnpabXIrS1ByelpH?=
 =?utf-8?B?VU5qdVo4MmczL1JYUzc2eU1UR1cxemRqd0JFZWVlcXBQdVRRNzNuU2V4UHV3?=
 =?utf-8?B?d0N6VTE1MXdWNWZ4c3pmZ2dDd3JTb2hDcFZqMEg0QmprZW8xVXV3SVNLSG1m?=
 =?utf-8?B?UXZHWUpXenBob3VRTnY5RVpoY2c5OEhCR1NOZWFPalBxclhDUXZZaFVVRzI4?=
 =?utf-8?B?c1FsbjVJeTJGanNUZGN4WkM3UDFoRmFxMDluTGVab3hlekZKazdZTTlLWEZS?=
 =?utf-8?B?bGUrNW5mUVJmbEZ5N2lHc2xQR1Nad3Z5WkVPMHlnODduR0JIY096VGM3NStt?=
 =?utf-8?B?QWFvY0M5ZURrY1BNaFNJNm4vSTZLNTJ0THF6dHI2Zy9NU2Z2SUYxdEN6a1I4?=
 =?utf-8?B?aGxJS1FzN1dvUGNIMGN4TWZkZjBUYk9BWFRNQlMremNaQkdEakwyZ1ZTeTdi?=
 =?utf-8?B?NjN2OVVlVlB3d2YzTVZrVHgrU2FjYkJxVnhlRlhXUDZ3QXZacC9wcGlxV20r?=
 =?utf-8?B?OXJlbGRFODhrZmhjR05KbXhwYmtqWVY3NzFuOG52RFppNUpiMm9QZjFZRWF1?=
 =?utf-8?B?TlpQcjRVSDNFaFB2bFE3UVZZZlFVS3FMeHEvdTdiUGhqN0JBRno5anI2c2Fj?=
 =?utf-8?B?M0o0VEFOZVdhQlNSYVhwdWRETUMzd2NmYk1EUTBBOGhYL0x5UGhXd1FCQ1Nm?=
 =?utf-8?B?TjRFM2ZvVHk3emJYSGpCdGFheTlLZTF5YTRhOU0xMFNBNW5iZFIxTDhoa1o3?=
 =?utf-8?B?am1RRU5VOXl2cjZiNXRESHJhWnk5NEhzMjNzeEYxTEhTQVd6QnRoTUc0bklB?=
 =?utf-8?B?SDEvRG1RYysyK3NNeXRmVmZIOVpXa3VlSDRySDBaV285a3ArTXd5dUdvYWxZ?=
 =?utf-8?B?bVJjeUVsVWY1ZzlFMEpac05EczRnaUhOOFkxNEFjeE9BbEVNYVhNNHRDanRq?=
 =?utf-8?B?eWpZQVlMMkFRV0treElLNi9QbnU1VnNEMVJmNXpkUG11bno1ajZRbHhSeHRY?=
 =?utf-8?B?WUFXUmwvRlZPbk9xRDR3Y1JlREJYRFhiUXkxa3RVLzFXL0ZpUVQ0bUNXejhF?=
 =?utf-8?B?V2UzRjF6K2hGWTZLSkw2aXZnQ2s4QlhmcGpXWlI2RndrTm0zZ3hJYVh4bVh1?=
 =?utf-8?Q?A+GsZbWNjXrBYcSLrp3o9kYe9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcddc496-14a1-4336-ae21-08dd3face6ff
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2025 15:03:20.1526 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fIN8taDyAAUK1rZv9W+nCWHOMYDEOH0SZxMbHs7e8ZO5KFiVz2N0VYqslWI4FP5n/4WVG/D3RE0sPYKlmoLtqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6160
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



On 2025-01-27 19:41, Melissa Wen wrote:
> This restores the original behavior that gets min/max freq from EDID and
> only set DP/eDP connector as freesync capable if "sink device is capable
> of rendering incoming video stream without MSA timing parameters", i.e.,
> `allow_invalid_MSA_timing_params` is true. The condition was mistakenly
> removed by 0159f88a99c9 ("drm/amd/display: remove redundant freesync
> parser for DP").
> 
> CC: Mario Limonciello <mario.limonciello@amd.com>
> CC: Alex Hung <alex.hung@amd.com>
> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/3915
> Fixes: 0159f88a99c9 ("drm/amd/display: remove redundant freesync parser for DP")
> Signed-off-by: Melissa Wen <mwen@igalia.com>

Yeah, we need to check IGNORE_MSA_TIMING_PARAM before
allowing Freesync / adaptive sync.

Thanks for the fix.

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
> 
> 
> Mario, Alex,
> 
> I can't reproduce the reported issue on my side, but reporters mentioned
> this fixes their black screen issue. I examined the code around it and
> overall restoring this condition in this way seems right.
> 
> For the future, we can consider using
> `drm_dp_sink_can_do_video_without_timing_msa` instead.
> 
> Anyway, from my tests, what I can say is that things seem stable and I
> didn't noticed any changes.
> 
> Can you verify how it goes on the CI?
> 
> Thanks,
> 
> Melissa 
> 
> 
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index c9e8982a8804..da550a257f09 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -12381,10 +12381,14 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
>  
>  	if (edid && (sink->sink_signal == SIGNAL_TYPE_DISPLAY_PORT ||
>  		     sink->sink_signal == SIGNAL_TYPE_EDP)) {
> -		amdgpu_dm_connector->min_vfreq = connector->display_info.monitor_range.min_vfreq;
> -		amdgpu_dm_connector->max_vfreq = connector->display_info.monitor_range.max_vfreq;
> -		if (amdgpu_dm_connector->max_vfreq - amdgpu_dm_connector->min_vfreq > 10)
> -			freesync_capable = true;
> +		if (amdgpu_dm_connector->dc_link &&
> +		    amdgpu_dm_connector->dc_link->dpcd_caps.allow_invalid_MSA_timing_param) {
> +			amdgpu_dm_connector->min_vfreq = connector->display_info.monitor_range.min_vfreq;
> +			amdgpu_dm_connector->max_vfreq = connector->display_info.monitor_range.max_vfreq;
> +			if (amdgpu_dm_connector->max_vfreq - amdgpu_dm_connector->min_vfreq > 10)
> +				freesync_capable = true;
> +		}
> +
>  		parse_amd_vsdb(amdgpu_dm_connector, edid, &vsdb_info);
>  
>  		if (vsdb_info.replay_mode) {

