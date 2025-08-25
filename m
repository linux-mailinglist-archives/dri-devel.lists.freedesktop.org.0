Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADAA5B3499B
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 20:02:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FE6410E52C;
	Mon, 25 Aug 2025 18:02:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xUmlCFkL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2085.outbound.protection.outlook.com [40.107.237.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9384510E52C;
 Mon, 25 Aug 2025 18:02:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yHI1+XgbYw/6HNJxv8XeBn2tiVpxvV3miw7gOTHEg+ENN6Cf5e6UObVVNbglPbT7+utHI27Qa1z/Np7DYxRUu9/tXtdBkz3XdDm+PvPZtUnG+grN2rmQdJeouTlqKMYquPcvp/stMQARVpwBTWw3R5mLs0Nb1IJtXMuLZEmaUZBmYxEWhw/0Jdc7fwlZiGpp1hxEFbTcaaT3fgm6K3HB/dD0ivfvLHkncJzbgclhGv12wtRTkqGzm3H1huGcL7bM0l0k6ImAM/i2UNsdc7gbgGMz8e+Ll2gCNbDfumxjD6f8p63pQ0bu6MVSvsWWoKyxk2JzMi8l6XYjsbUjk8ZdQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QtYBhhIxiuTBcaeikueuMYQDQwt4Uj57J7+uY8KvIac=;
 b=eyfYV9lDIAQGMfRJ6T5tbrcNbu43BC23Ou0Nm+wlRRj0R4/or8nY+Jts2s4Domg2qk3I/4hI4AZxMva7HNhe9SQyiUReBKbB+P4rweHyvzagZgvvZucEO+rfjQGR+iios4bYLkBs8u6CpT4f/S5mxKxx+BPtVywN1LvjQ+KhmOyc6ROVer9qC3yAwVY/um7SWL3DRHAqyirzHURmqG5g52lFkq4jVRINslYViC5O9+QMEKBQpqNOSCx+MWnDecF5DHiRhcPhnS4Y3CxZ4YlZuFRu/kYgqVH9Q/rvsE0kf21lff9+ph/D0ISPhgidE3zzEaKNtXrs/xryU2dNAiiIdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QtYBhhIxiuTBcaeikueuMYQDQwt4Uj57J7+uY8KvIac=;
 b=xUmlCFkLSDviMiQiL8bSO6d9AogVD2y4Xz+2QVDgvT8/7dCn9K/mZQgHGrUAbK169ui4BPVRHS6A3ydYOmwZmwpyKv3pvOcprXmatf8Ndhef2YClTvr2FiY3KARxOrxVTZwcjWMm42Sea4sVzvu3Q6RvLcgp6pzD89NLQA7VOpo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DS7PR12MB5910.namprd12.prod.outlook.com (2603:10b6:8:7b::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.21; Mon, 25 Aug 2025 18:02:18 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.9052.017; Mon, 25 Aug 2025
 18:02:18 +0000
Message-ID: <3b420fb9-9f85-4586-a887-f38804007cb8@amd.com>
Date: Mon, 25 Aug 2025 13:02:15 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/5] drm: panel-backlight-quirks: Add brightness mask
 quirk
To: Antheas Kapenekakis <lkml@antheas.dev>, amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 philm@manjaro.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <20250824200202.1744335-1-lkml@antheas.dev>
 <20250824200202.1744335-5-lkml@antheas.dev>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250824200202.1744335-5-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1PR04CA0003.namprd04.prod.outlook.com
 (2603:10b6:806:2ce::7) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DS7PR12MB5910:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d3e749f-da8d-4f69-aa84-08dde401879b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OXNWL2ZtWU1ROEZURWtxZVpoaVBZNzZZd3d1bkpBVTZCMzg0c0RZRzE2TDdk?=
 =?utf-8?B?TUpHS1pzK1dkSHdrM241bHBUdzRCeDNPakdWM2JiTlk3UzJWZTcvWSs3QkY5?=
 =?utf-8?B?cis1ZlR2T1ozWnRKREI2ZkgzOXNmT05USFM4Z0pHbHlhTTdGOThZMTJhMzJs?=
 =?utf-8?B?UE5lZUlSVVZrcXhHcGcrVmExY3l6WGpDN2hqb2lJNVFRUmNidlpoL3NiMStS?=
 =?utf-8?B?QVVHRWgxNzgwUVdYM0pia3RxNWFYYWhTdExYdGJVRmFOdzdHWXY4QnpIbVF5?=
 =?utf-8?B?LzByVkdnMHFRTDZhcFpTRzByQUhSeWoxeGZkV2V2UFhKZkQyYlZiSTl5ZW54?=
 =?utf-8?B?dnZYVk9OWEh1UlhlTmNycWFZYjYxSjJCQzI0akJkYXErZ3RwNkV4Z0Y1a1h6?=
 =?utf-8?B?SXJXL2V5dHNLN295bTJDZWxONUhGamU2MjRsc3V4MytUWElzVjNxN1JrRmN0?=
 =?utf-8?B?OWx1Z25DRWtCRE54N0hkc3p3d1NDaVpaN0V3MEhEczJnM1BXQ0JQV3ZyU0FP?=
 =?utf-8?B?clk2dHZBWkRhcDRUMjNOdDZkUVJCUGJ2QUlFRG9vVWQ1bFFjWHcyOURrbzVz?=
 =?utf-8?B?UklwcjJsYXdMamtCdTJlM2NXU1NrMWIyZFBpOVdScDdTR2ljdzA2aUtjWmpz?=
 =?utf-8?B?T0dnb1hnNTdJb0RIeGxBb214akJYN3lwenh1S3gyNWR5S25kZTBoZE93VHlj?=
 =?utf-8?B?cG51cTdsem1kZWJIbWZEeW9zNXBDWDZwYVhkUEo3VXljSWtCcnk4dmNSUUhl?=
 =?utf-8?B?MUlvQ3dpWVpkS1pZNVRIaG1sdUkvdSsxZzE2OVJOcUNqMWtpMXllckFBS3Va?=
 =?utf-8?B?T0tUYmt0c1Bjb0J5Zk81Q1REQzhNMk5aR2FaZXByQmI3czcxbmtwa2k1d0RI?=
 =?utf-8?B?Qjd3WWN5THIwUCtBeVBqTDIwREFwUVR3T3p2NjNyTWpZeXRpckJEeXpDbFhm?=
 =?utf-8?B?OGdXMkg4V1J6NFdDbnMyWERTT2JheHA5MURCV1JVWkJUbXJ3WG5vRU96dzNR?=
 =?utf-8?B?OGxmVGNDWSthV1BxVDlzMDNsVlBZeXhyM3ZiN2RaSHVwYnMvYllUeURwT3Rr?=
 =?utf-8?B?WXlBM1g5QnlGQ0l2bmdBQjFoWjBvRk1xc2NPYXFqaEo2dnIreGdHZW9xalJk?=
 =?utf-8?B?ZXdwRWk4ZE1YYjhEdU12VnVxOFJjdVJGc09FU3VHS21WZmExenJTc2xyMFYz?=
 =?utf-8?B?aEh5UU1Xb29xVjdIcm04ZEt1S1ZTRGhyT3JuMC9KZHN5cjgweTRQaWZ4RFhB?=
 =?utf-8?B?b3Z5dXVLOW1IM0N5Y1RtZVhJR2RDTkNQWlpPNWpHb3EwNk5HOVVjaTY0V2tn?=
 =?utf-8?B?b3U5a1pDdzhqRm1QQTJjOHVJR0pGcVQyOUNMUC9yNHZNdUQweDlueVkvckxE?=
 =?utf-8?B?L2ZSem5LR1VCWWZzOURZc1dYWG0zQ0U2MFFQeThZT1NIVzVKQlhicVViYU9H?=
 =?utf-8?B?OHBlYUY5anhCcmZuaWNENjVGeURHYi8yVDlaYXIxdHBCbC81UHc4UU9odklo?=
 =?utf-8?B?RVhWUWxJWExoQjgwU0xQcWVPb2pLbGsya05QT2dHUDNRZW1CSGRQakFsd3Jw?=
 =?utf-8?B?NDJBMm5DRDI5MEpXRGpXWHY4VlFYL09ScVNweXI0WUZVbUFBSGtrVG1Ud0dh?=
 =?utf-8?B?NjZKTXF2TUttOUdQVE9veE9ETFFZa0p2czBVd1NreDlmQVpyZStRN2ZoVWF0?=
 =?utf-8?B?M3FoejE4aFVaZ3BjbGQ3WjM5akJtQ3EwRzhtK0VRWFVqWHpPUWFjeW1wVHJL?=
 =?utf-8?B?aGtrcTQvY21mRVZ1WWwremkxWHh2OExJTHM1SUdhK0d0aGtMclpTb1I4Ykhv?=
 =?utf-8?Q?p0uNnLXTgPdONBy28qQoRLT1PSx8kjAAI8tHA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWVVemV1UHFwbHBSdTFKWjNOYi9UNDU2RDVVZW5Kb20zU1VqaitQdnlGdXJD?=
 =?utf-8?B?dVVpUlFYY3FTSE9pOUhwbkg0Q3BSdnlnampiUnJoa2tIQk9OSjBqQkhFVmg4?=
 =?utf-8?B?VGk3SnQ0emppaUNSZ2N3UVoyVjJqODVkZW5FeE5zcjNMSmRDRDV6UExUU2Jm?=
 =?utf-8?B?WmE4V1B1eWI2S1JmMUlBd045a2ROVUx2cFVaWk9uQ0xtK2dIYlZObFNaYnRT?=
 =?utf-8?B?azlZWW1TQmVMcm5JK0J4UVZSL1lFcEU1cXlWS2pUVXMzZEdZenhZSkJRUlVn?=
 =?utf-8?B?Nkxtc1hTZDFPcmRueVNxc1lTbFlaMzk5K0ZLb3ZwSi9mRC9RN2FoSHJrQUsz?=
 =?utf-8?B?Sk1EZjBmTkRUTGJsYTh0VDArZ3BKZlROZDYrVmVJaDVCRmNDN29hSnVEY3ph?=
 =?utf-8?B?WUIyOHNvNVd1WG44cjVuUEx4R0FBLzg4Tm9DbVcxYU04QmtReFNUM0twTkhQ?=
 =?utf-8?B?V2Q0M0NjN3I4M2JEVURQaC9TN1F4azUra2c5blRsZUsyVHF2T0M0WVV6eFg4?=
 =?utf-8?B?Sy92YUl2SlpSV09RWkg1WDQwdzRmUzVQOWNwRFJrZjRlMVJrMTllTW01UUtq?=
 =?utf-8?B?dVdOT3d4RnhRTk13clRHK1ZMNFNpRzVsQ3l6U2JnMEhkVU5NK1dFYVNsNWJY?=
 =?utf-8?B?dXZYUTkyMkNCd2RibFhWSE1NNDRYYllvT3lWbTdLc1hGbE1SQUkvN1hZUjVu?=
 =?utf-8?B?RnlZOG93WFdpU2loZEZqRk04aGJrcGZkNFRPcVlPUmw1eWNZNEdCQ3FpZS9v?=
 =?utf-8?B?YnMvd1d0NERKRnJ4MGxlOUg3R3ZBK1Vab0ZDWUx5bEEwd1RiSUNqSzYwWTJG?=
 =?utf-8?B?aTNLUElJR1BjRlBpTmNCc3dla3B3dE0wZGxNVm56TktqM3ZhMzFHN0Jqd3lx?=
 =?utf-8?B?bzhqM1lSQkh2UUxrRnFCWG12dEdXSHZIaWsrQVFiTTc3QlVmRFFjOXo0V0l5?=
 =?utf-8?B?VFBlRzlWREpLSWVrUnBxNTZReFZlS09sNk9KRWhZTEprd2gzTm0yOTVzbzZ6?=
 =?utf-8?B?Qm40b0JlRXNYZXQvaUpRVTFJeTF0OXFVTGhJcXZXY1JBMTk2dWZKd1dRcjVx?=
 =?utf-8?B?RGlnUlBhQVN0ZzcxMHk0RkFPSFQvZ1RLL0xuS05Pem9LOERmUGVlVHZvQ3lE?=
 =?utf-8?B?SkxhUjA4a0F1RlAwaU1NNzhJTTV0WVJTYVpmOXk3SnFSMnUydUd1VEUyblRQ?=
 =?utf-8?B?L2JXZWdMMytESHRrNDlSb0VvQzRHOW1QVW05QzJiTWNJb1U2TlZEeS8wdkw0?=
 =?utf-8?B?eEJ3ZWIrY0VJaEhROW10c2FBWEo2Q2RXaW00VFdZL2RtT2N2M0FjaDNDeXRi?=
 =?utf-8?B?WVBYdWJDcnFZRlZOWCtkZUR5QWw2U0p4NS9BaDRrVjZLNTgrYW5weit2cjVV?=
 =?utf-8?B?anpSYkFDT2prL1JIaEtPV0t2NXZSdDRYa2k5WllpeWlLQThUOW41ZkpnZDNj?=
 =?utf-8?B?KzVqOTJYL1YybkNzdHdrMXV4K1NsRXUwTlE5ZVlvSzlRbHNHdHZRWkIwWkx2?=
 =?utf-8?B?Wm9PdzlRY2x4bXVjeDBmRG5FbGwxYlZqZHFmUWRCOW5ISjhtMkVybnl4ZnU4?=
 =?utf-8?B?cWJNbk1BSWR2aXQvNU5LM1VoSGdHUSszZXhhbUx1TTI4cTVLOTdkU3BlN1pC?=
 =?utf-8?B?REFTNUNqcHl2RnBKRUh6cG5HSzdtRElwc2trY1M0Zm1aRnYvUzhDcHMzTHZW?=
 =?utf-8?B?QVdvWmpWSWdzODlGRjBqM3U0bEt0Y3A0TUxlQnRsRThuQ0JKQlZaRFRHeVA5?=
 =?utf-8?B?WlZLK041RmhIQjhEYlcvRVJGZGltSGd0TWJmVkh5U2tkaitBT0Z6MWVJTm5s?=
 =?utf-8?B?L3NvUCtTaDh2RElYamppV2VGWGlPYUg0Tkg2MEhrNGtUaDZXRzM0R24reUJT?=
 =?utf-8?B?QytZN1h6WWYvbEdjcm04ZHVaNFd1Y2xFaXFTK1NqdGcrdGFmSmJJZThWM3Bw?=
 =?utf-8?B?N3pwd3FYM3VqM0tnaFJxdFh3S3ZBNXpzK1JGRWJWR3RZYUhPWHIwOTRCK1No?=
 =?utf-8?B?dWpqNVpJcHZPa0tXa3dGaFF3a0E0S2dqdHZIMEt3akxBVHc0WDVOUEpkeWVM?=
 =?utf-8?B?RFkydEMyaUl2bTZzZWRwTUkzYkNHMURHZ3o3cnhCclBhZkQrYThadU1GV1Q1?=
 =?utf-8?Q?OI2zoFqVTR4h46OjXWsbQUbuQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d3e749f-da8d-4f69-aa84-08dde401879b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2025 18:02:17.9340 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Et1wyZBRjFmsWxoNfWxHGclojqY8Dl2VcL6l+rCLqIVFr5JNCzYN2Qp4/vdNsrzKluuwHwm9jBgKz744QhXIZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5910
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

On 8/24/2025 3:02 PM, Antheas Kapenekakis wrote:
> Certain OLED devices malfunction on specific brightness levels.
> Specifically, when DP_SOURCE_BACKLIGHT_LEVEL is written to with
> the first byte being 0x00 and sometimes 0x01, the panel forcibly
> turns off until the device sleeps again.
> 
> Below are some examples. This was found by iterating over brighness

brightness

> ranges while printing DP_SOURCE_BACKLIGHT_LEVEL. It was found that
> the screen would malfunction on specific values, and some of them
> were collected. Summary examples are found below.
> 
> This quirk was tested by removing the workarounds and iterating
> from 0 to 50_000 value ranges with a cadence of 0.2s/it. The
> range of the panel is 1000...400_000, so the values were slightly
> interpolated during testing. The custom brightness curve added on
> 6.15 was disabled.
> 
>   86016:  10101000000000000
>   86272:  10101000100000000
>   87808:  10101011100000000
> 251648: 111101011100000000
> 251649: 111101011100000001
> 
>   86144:  10101000010000000
>   87809:  10101011100000001
> 251650: 111101011100000010
> 
> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3803
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>

To me this sounds like a panel firmware bug that is best driven with the 
panel vendor.  But I'm guessing you're reporting it on proudution 
hardware already in the field right?  In the field it's basically 
unheard of to update the panel firmware.  The process is generally 
speaking too dangerous/fragile.

So in that case a workaround would make sense.  The actual issue as I'm 
hearing it is that some fractional brightness values aren't working? 
The API takes millinits, and I guess this was exposed by increasing the 
granularity of values that userspace can program recently.

It's possible it was there before too, but there are probably "more" 
values that can hit it.


> ---
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  7 +++++
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  6 ++++
>   drivers/gpu/drm/drm_panel_backlight_quirks.c  | 29 +++++++++++++++++++
>   include/drm/drm_utils.h                       |  1 +
>   4 files changed, 43 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 4ad80ae615a2..156f2aae6828 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -3662,6 +3662,9 @@ static void update_connector_ext_caps(struct amdgpu_dm_connector *aconnector)
>   		if (panel_backlight_quirk->min_brightness)
>   			caps->min_input_signal =
>   				panel_backlight_quirk->min_brightness - 1;
> +		if (panel_backlight_quirk->brightness_mask)
> +			caps->brightness_mask =
> +				panel_backlight_quirk->brightness_mask;
>   	}
>   }
>   
> @@ -4862,6 +4865,10 @@ static void amdgpu_dm_backlight_set_level(struct amdgpu_display_manager *dm,
>   	brightness = convert_brightness_from_user(caps, dm->brightness[bl_idx]);
>   	link = (struct dc_link *)dm->backlight_link[bl_idx];
>   
> +	/* Apply brightness quirk */
> +	if (caps->brightness_mask)
> +		brightness |= caps->brightness_mask;
> +

I guess a problem I could see with using a mask is that there are 
basically a bunch of values that are basically becoming no-op.

An alternative would be to decrease the max value (IE some number 
smaller than 65535 and scale so userspace doesn't request these "broken" 
values).

I'm not sure it's worth the effort though because you will probably 
still find some subset of values with this problem.

The other comment I would say is this is probably very specific to AMD 
and the millinit based brightness API; it might be better to keep the 
quirk localized to amdgpu.  I also talked to Phil offline about this and 
he's got a draft patch that helps a similar system he's seeing this on 
(presumably) with another panel.

I think it's worth getting that patch onto the list and we can weigh out 
the alternatives.

>   	/* Change brightness based on AUX property */
>   	mutex_lock(&dm->dc_lock);
>   	if (dm->dc->caps.ips_support && dm->dc->ctx->dmub_srv->idle_allowed) {
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> index b937da0a4e4a..340f9b5f68eb 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> @@ -200,6 +200,12 @@ struct amdgpu_dm_backlight_caps {
>   	 * @aux_support: Describes if the display supports AUX backlight.
>   	 */
>   	bool aux_support;
> +	/**
> +	 * @brightness_mask: After deriving brightness, or it with this mask.
> +	 * This is used to workaround panels that have issues with certain
> +	 * brightness values.
> +	 */
> +	u32 brightness_mask;
>   	/**
>   	 * @ac_level: the default brightness if booted on AC
>   	 */
> diff --git a/drivers/gpu/drm/drm_panel_backlight_quirks.c b/drivers/gpu/drm/drm_panel_backlight_quirks.c
> index 3d386a96e50e..78c430b07d6a 100644
> --- a/drivers/gpu/drm/drm_panel_backlight_quirks.c
> +++ b/drivers/gpu/drm/drm_panel_backlight_quirks.c
> @@ -45,6 +45,35 @@ static const struct drm_get_panel_backlight_quirk drm_panel_min_backlight_quirks
>   		.ident.name = "NE135A1M-NY1",
>   		.quirk = { .min_brightness = 1, },
>   	},
> +	/* Have OLED Panels with brightness issue when last byte is 0/1 */
> +	{
> +		.dmi_match.field = DMI_SYS_VENDOR,
> +		.dmi_match.value = "AYANEO",
> +		.dmi_match_other.field = DMI_PRODUCT_NAME,
> +		.dmi_match_other.value = "AYANEO 3",
> +		.quirk = { .brightness_mask = 3, },
> +	},
> +	{
> +		.dmi_match.field = DMI_SYS_VENDOR,
> +		.dmi_match.value = "ZOTAC",
> +		.dmi_match_other.field = DMI_BOARD_NAME,
> +		.dmi_match_other.value = "G0A1W",
> +		.quirk = { .brightness_mask = 3, },
> +	},
> +	{
> +		.dmi_match.field = DMI_SYS_VENDOR,
> +		.dmi_match.value = "ONE-NETBOOK",
> +		.dmi_match_other.field = DMI_PRODUCT_NAME,
> +		.dmi_match_other.value = "ONEXPLAYER F1Pro",
> +		.quirk = { .brightness_mask = 3, },
> +	},
> +	{
> +		.dmi_match.field = DMI_SYS_VENDOR,
> +		.dmi_match.value = "ONE-NETBOOK",
> +		.dmi_match_other.field = DMI_PRODUCT_NAME,
> +		.dmi_match_other.value = "ONEXPLAYER F1 EVA-02",
> +		.quirk = { .brightness_mask = 3, },
> +	}
>   };
>   
>   static bool drm_panel_min_backlight_quirk_matches(
> diff --git a/include/drm/drm_utils.h b/include/drm/drm_utils.h
> index 82eeee4a58ab..6a46f755daba 100644
> --- a/include/drm/drm_utils.h
> +++ b/include/drm/drm_utils.h
> @@ -18,6 +18,7 @@ int drm_get_panel_orientation_quirk(int width, int height);
>   
>   struct drm_panel_backlight_quirk {
>   	u16 min_brightness;
> +	u32 brightness_mask;
>   };
>   
>   const struct drm_panel_backlight_quirk *

