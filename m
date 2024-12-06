Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4AF9E72F0
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 16:15:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 029DE10F118;
	Fri,  6 Dec 2024 15:15:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="mfgx4bXE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2071.outbound.protection.outlook.com [40.107.93.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E6D010F112
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 15:14:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LwDg6YflPHN/hcvTQLebkFYuaZiZamObc9LhEpaUYkZouxPN5lyxpuIZqllHKL3nRUv/+dpsbM8vDfsU5JWL5bZq4NouksXeQJ/XQm1XwGvn37KwOkdNIHIAHYJPa+Creqcm21uOGperV+GRQtUzmJ8HmESg2TKNOdRTQwjJX6dM2aTo7iDgU8cVs72OGXCTN3mzAUMx157BcqIFDRWxDlRg2mZmNDZIu7zk6RUXVOBsaXADW/NOiRQksyHQvohXjZoIueaDk+8Zt85199Rx2YEDXnwiESIE8yrTFqL6r64GOVcXiN/vhUNOO2C0jBV6kMPp9ooDvK0EBHbc5J1maQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LGDFs3NGeUU49CvaYIfRrUWV6xdU2KmwVQTIIF4ZiNw=;
 b=y7wrXcPhOWBGga5YuPxym+6B3sHNmn3iRw70fTku1uUX5mnUHq1IGfais8TLyUJweAac4HWmwFAWDTEkFBJwY3aMMJU7JCTFAu3MJwiVoWA26nNN7ynF8PLINoBDIDtm3bCefYz3VuT0Ijb3dn+yKUCOIipWkrdCsyKaNVYqew/xfRH9ZTsbvQIecDBPTijJHIP1Sj5npView3Z6jLdjPID/V1rb49lXbpmZw9yRSMWINi0egMWac4FaebRmlM0ubrhVhv1WWI5JCbhUn4k5pQvzOk5Swo7sCTgkedUgcNY/MYP+ZYcN40TagLc2VXJlBZmTE/nXzB+xRui4gKTUng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LGDFs3NGeUU49CvaYIfRrUWV6xdU2KmwVQTIIF4ZiNw=;
 b=mfgx4bXE2wLC6FkWbz7I2mQZxUPa3ibnymXoEXaL+pY9MPnNjImDueeI5plzt0XdQgAeZrx+PG1GXru+aoYwODbNoAQ0EJYi5HdFJA7ZD/uzLrRQMkRNi/nFuJht77YrHUMev+ErmNJU45nd8wiSmukBkpBsjky5vvaxzatoC2Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB5844.namprd12.prod.outlook.com (2603:10b6:8:67::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Fri, 6 Dec
 2024 15:14:54 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8207.017; Fri, 6 Dec 2024
 15:14:53 +0000
Message-ID: <11195b59-cd15-4dce-93ad-20cfb06d32ea@amd.com>
Date: Fri, 6 Dec 2024 16:14:47 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] drm/vc4: Clean-up the BO seqnos
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Melissa Wen <mwen@igalia.com>, Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Tvrtko Ursulin <tursulin@igalia.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20241206131706.203324-1-mcanal@igalia.com>
 <4df589b6-93be-40eb-a918-ec26f93b923f@amd.com>
 <e9d0a1cc-d2e6-476e-993d-1ccc68b9d237@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <e9d0a1cc-d2e6-476e-993d-1ccc68b9d237@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0211.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e4::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB5844:EE_
X-MS-Office365-Filtering-Correlation-Id: dc625d19-7f8b-459d-620d-08dd1608bcaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OTN5QTlucC9KZUFBV1BkMnRYYnphU1V2TytNckJWMVNraTBqbGlidC9LazFq?=
 =?utf-8?B?OXc0K1BFdDNhNW9XVExQOER6TEF0TDVtcHBxM2tzMnBrNVl5Mk9qYUdDZzVu?=
 =?utf-8?B?dXVWLzdQN3dVRjN4SVFDaGJUSVRVemwxNWovTXBpVnVwajg5b3pCbTdDZUt2?=
 =?utf-8?B?UlFIRE9MQnd4VVRJNkdLakIvc3o3NDRibGpjRTgyREw2ZkduVkdUZHV5bTk2?=
 =?utf-8?B?VE00YVdWRnp4bXZoek10Qnc3YllqSEhaNkF6eE5Keld5VkE3SC9BNFBwUUF0?=
 =?utf-8?B?MnFoQjlQdlRzQ2o3YjF5ek5SamxjYk9hUlZWT3VTUlhPcjBTYjUrUk9tL0w5?=
 =?utf-8?B?T3UxVnc5bW8rUVlPbW53dFI1RzNCMmtQK2wwOXZKUzU1eSt3c3VrZE9mamlK?=
 =?utf-8?B?R252eGpQcmk3MzdhS1RzUHh1SzJ6UWhISTFpamJZZTZvNTQrN2NyS0JjMFhT?=
 =?utf-8?B?YWUxTzFQRGc3Y3dGdThBWk9YMENjUENiTDZudVNXWW5uRDhxY1pyMWxQeTdi?=
 =?utf-8?B?R0R2QkxYQTVFakFyd0xrNXNCTm5Gay9BRlQxdlRLbk41ZUdMQ1o0SkJSOHFT?=
 =?utf-8?B?OXNBa3E5c215c3QvdXpGN0NZMWRYU25acks1QWwxaHQ4YzVEL3ZOQTJxNnVx?=
 =?utf-8?B?RDNTTTI3R0xabDFPQ2VxQzhNMDRRQlE1UVlWQ3RYMmhtclFsc2x0amRZUVZm?=
 =?utf-8?B?UjlNMXlvcm1HRnRZbzZkRForMXVPTVoybDVURXg3ckRPYkpGMzJNMnNlVFAw?=
 =?utf-8?B?SG1WQWwzU0pUMzg0dDhnK21FSVFrOGFkRUFtMHYwQ01UTHZ2cTlUMTRLcUhy?=
 =?utf-8?B?RUJDdzNORGxwS29vSjZFVDUwcDBwM2w0eHc1Z0dBeHkxSWRJMlIvUzVJeWs3?=
 =?utf-8?B?TmFzY0VTY0kyYWMxNnFOczdFYXdvUFpQY2NKRDB1clpibTJDcEtCN1oyYXUw?=
 =?utf-8?B?RERIZzRRbmloUGhTT1lKUEp2aHdIR09FTXhVc2VRRXJSUkE3OS81OHlQc3lC?=
 =?utf-8?B?ckxUblZZckpERTByOVQ0VXE1cjVoYUxaOGlveGRPanNPOUhCZmtxV3JiU1ZC?=
 =?utf-8?B?UHpyT0U4azFyd0djY3pJQlNtSnAvSDIxM2w0dmdqTzVJaytoQ3BJTzF4VFFq?=
 =?utf-8?B?YmxiSWNOcUYyOGY1QWRxWW55Y1M1VStEcFZ0amVYcTNkOWpHNlFldmo4YS9Y?=
 =?utf-8?B?VHRibEJtV0c3b3Zpem8rb09hU1VzNXYyZVZQay93VXNEN2lqM0NJdUozd0Nw?=
 =?utf-8?B?VXVGT2VFYmc5UktpQWF6dThXV2gxSzZwYWM5QVZoc1VjNTVGNnhLbDRVYUsr?=
 =?utf-8?B?S1kwQk94Mm01dGRDMi8yR2ZvOXZSRGpHLyt3azBqeWpTeG45SVdHQlV6VnNZ?=
 =?utf-8?B?R0x1OTBvcjlVZWdwZHlvd1FhUWI2djJiUTFESVdUVHUvNi9JTTFGUGx3TXRJ?=
 =?utf-8?B?QmtGUmw5Ykl1ZW1tQVFkZ242Y0tEaGY1eU41RmI1bmVrc2paZEEwTS9WbHgz?=
 =?utf-8?B?djBla3A1MDRZSm1Oc3VPTkVGZ1JVQStHZjRIb1d0c05ZWG43M3JKem9MMTdH?=
 =?utf-8?B?bDZUU3MvbnVHeVdlK0kyekt6ZldhWVQvWndXOGRJT3NvemVpakNRTDJZbXpP?=
 =?utf-8?B?b25mODBTQzlSczhLcmFJTm1DUVNJdnA5M01RdDc0eUloM2Z6d0ZrSXVQS2Vr?=
 =?utf-8?B?ZndYSkx4UWMxUXhwRGFod09wdS93Sk5paGJnMWFmdFdQb0pueFZNbWJ5S01U?=
 =?utf-8?B?aWhnWFVaYzZNL3drZDF3aERCcDdGanBaZUlQbERJcTMwRFk3NkZISWVlQ2NE?=
 =?utf-8?B?ZWNGOEdwU3BpV04yRHFidz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SjhPc3FQdE85Ykh0RVlzTzJicmV1WnQzSHA2dzMyTXpCdTBDbFltRkxZMlNU?=
 =?utf-8?B?bWdjU21JRlNYT1JiNlR1MmlaNmZXTVlFa3h3LzgyTy9UT0ZVeGpXWUU2SVFz?=
 =?utf-8?B?eUVFNy9YMzViSmRxMG9lbUc1dWQ5dXBHWXg2YzdLb0NrZHNsQ0hVWkVpZnpm?=
 =?utf-8?B?VU5zdC91ZzdoQlBXMk9nY0RJTFc1Qjl5K0Z2YTVnN1AwMXpIVXQ5bnlDRXNF?=
 =?utf-8?B?emRidm45ODgwREQ0VjdGMkZyNHJuMW5VbXVFVWRZblJsUjk5NC9IbHFXMElJ?=
 =?utf-8?B?Q2lrelVYV2dsV216eDFEVlZpZ3BRMTJvRG5mNk84VmthT1d3bjFDTnBLRzYw?=
 =?utf-8?B?Q293bDBVTEdldlhlM0x1NWJWaVpBeFJxZHFwcVJjWm9MTEJ0cE96TmJQMnlh?=
 =?utf-8?B?N21SZXdXWkFSS09KckFQUVpvVk1FUitOT1V2b2R5a21NUWJ2TzNRaTI4N2Vo?=
 =?utf-8?B?THZRQWxKLzJEUENyQkw4K0QxMkxyTXpuTDdEUGM5T0ExUDNINW14UUgwblZq?=
 =?utf-8?B?NGQxQTU3ei9hTE03dHNNRk8wVDRKZk5Ya2czcjVuNTRiL21xeVJDTWVYb25z?=
 =?utf-8?B?eHB2S09lVG5KV1VpSGVQTkF2d2E2Nm9Ld0xvSklUYVBqR2EyZkZUa0lKTnRt?=
 =?utf-8?B?M3RmQW5FeXN6YytNVHlZVDNkMWRVRTJ0ZTlyOHZqQm00WG45MngyajlDRmdz?=
 =?utf-8?B?RFdNNko1YitxMU9hK3M5aFJPWWF6YTVvdE43TkE0L01qUzlCTHprMGY4ZEE5?=
 =?utf-8?B?akRQeGRFdklqcEE2ckZBTWZqMjhCTDhlRlgzZiszTjY0c29CYkFoQW5qWW1j?=
 =?utf-8?B?ejlJMXlKZlV5VjFGUEo1YXh5eGUzTGxQOFAzSUlpaHRGcXNFajZZL3hwNDcw?=
 =?utf-8?B?K2kxNWQxOUVoY1FYR0NVZXRYYUJIeTBBKytuY0U3YUdKV3o1ZlBnY05DSVJN?=
 =?utf-8?B?V2prZElwZW8rUVlRbHdUakZlSlU0d3o2Qlg4NFpSMFNPVVR3NWEyUUV5dE9r?=
 =?utf-8?B?em9uczB2VkVxdUlZVnh3U3dHdDF6MjBETGVKcmd5VUhwa3ZRZjgwWHBVelFu?=
 =?utf-8?B?cE94SVFEcWxIaVlZUTU1UzUvaWZDTDQ3a0RKMEtrV1NFWG9xTXVkTGhTUGJN?=
 =?utf-8?B?QlhmUDJTZGdEOEd5Q1NHMGJiNU9YeDRLV1FEZmhiblQ0VkRUVzQ5LzNLcnZq?=
 =?utf-8?B?akVlekZpMGlPZUxubVB2YUFZSHQwa0pQbnpFVVdIblp6THhIUExHUDhOVFV3?=
 =?utf-8?B?eUxQWURsa09PbG1naXdXMWoyY0h3Z000aGg0ODFTVkQybkVLN3J6Z05pV241?=
 =?utf-8?B?MFoyb0V5SjZOVjYybzB0QldCRUR6WXFOeUcwcTJTa01yUkdmYW5YOHAxb29X?=
 =?utf-8?B?ZFQ1Tlh0M0t0UE1VSEpJa2Zxc0x5alNRYnBjSmFwU2FnaUxhMEFFeDU1cis2?=
 =?utf-8?B?bTdscmJHOXJEdmRRWHIrRzNHMStHRGZPNThVaUJiMmFTNVpGVjlYbm5mREJM?=
 =?utf-8?B?RWJQanhIamhZR3VwOWhvZjNUNWszcnl1RTBzN0dmZTg3VE5KRkM4NmNCbUZH?=
 =?utf-8?B?bHdMbHFJZDdKWXBPQ1dSVVhzdWphMDc1TUQrcXhmUDhvU296OXQ4S0svTWpk?=
 =?utf-8?B?YVErelVWVDMzZkJ0cjJ2TkNPbG1SUG0rWXppVHZwTVZCSWZIUHZxcDZEYnF5?=
 =?utf-8?B?T3RXb0tMdDFjZGNRS0lzaEtTTUQyUFdkUllDL1ArTmtBNGJVUGR5OFoydGVT?=
 =?utf-8?B?NVV1NTgxV05QbllJVE1kYmhTOHJGMTlreXJBWEF2M1FxTm90bkpaS09Ib3o1?=
 =?utf-8?B?MEh4R1V3WERmcTd4cUNCRW1HdnN0VDdIWFRPblhKNHA4NlRjUGk2K3Y0MXdN?=
 =?utf-8?B?WFJ5RHJjaHpxalcyZmduRStwSFlDWFd0WGh3a1Y0anV2dDB3OEpuazdDdGI0?=
 =?utf-8?B?SFNEUEkxaVVPZ0QvQTdOZ1Y1MGMvU2FRZCtpZng0REx6Wk9VMlNrVkdGL1hN?=
 =?utf-8?B?K2hTUlFJV3FneWliNlcvNW9jNC8xNFgxWHlNSTJJV0REemtoUEJaR0t1ZGQz?=
 =?utf-8?B?U0U5dFJuSzIrdnFXeE9xNEFMQW1QcVN6ZmIxakhpK3pDNmtRR2NrUmhSYUZy?=
 =?utf-8?Q?KbWlLbd+10SHh8bEUJ9S/IDu6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc625d19-7f8b-459d-620d-08dd1608bcaa
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2024 15:14:53.8500 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nSufsZe2vCT+PBkzzu+c9dAfKTmlPwtitvrSEwArCx6b5dtmCl0SPMp/bh4+X+yV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5844
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

Am 06.12.24 um 16:11 schrieb Maíra Canal:
> On 06/12/24 11:17, Christian König wrote:
>> Am 06.12.24 um 14:12 schrieb Maíra Canal:
>>> This series introduces a series of clean-ups in BO reservations for the
>>> VC4 driver. Currently, VC4 uses shared fences to track BO 
>>> reservations as
>>> several other DRM devices. But apart from the DMA reservation 
>>> objects, VC4
>>> also attaches seqnos to its BOs with the intention to track if the 
>>> job that
>>> uses such BO has finished.
>>>
>>> The seqno tracking system was introduced before the DMA reservation 
>>> objects
>>> and we ended up lefting it in the code after DMA resv was 
>>> introduced. This
>>> is redundant, as we can perfectly track the end of a job with a fence.
>>> Therefore, this series focuses on eliminating the seqnos from the BO.
>>>
>>> This series introduces a series of clean-ups for BO reservations in 
>>> the VC4
>>> driver. Currently, VC4 uses shared fences to track BO reservations, 
>>> similar
>>> to many other DRM devices. However, in addition to DMA reservation 
>>> objects,
>>> VC4 has been maintaining a separate seqno tracking system for BOs to 
>>> track
>>> job completion.
>>>
>>> The seqno tracking system was implemented before DMA reservation 
>>> objects
>>> and was left in the code after DMA reservation's introduction. This
>>> approach is now redundant, as job completion can be effectively tracked
>>> using fences. Consequently, this series focuses on eliminating 
>>> seqnos from
>>> the BO implementation.
>>
>> Just FYI, you duplicated the text somehow :)
>
> Oops, that's a non-native English-speaker trying to write a v2 of a
> paragraph :)
>
>>
>>>
>>> Patch Breakdown
>>> ===============
>>>
>>> * Patch #1: Uses the DRM GEM implementation of 
>>> `drm_gem_lock_reservations()`
>>> and `drm_gem_unlock_reservations()` to replace the open-coded 
>>> implementation
>>> of this functions by VC4. A straightforward change with no functional
>>> changes.
>>
>> I actually pushed to remove drm_gem_lock_reservations() in favor of 
>> using the drm_exec object.
>>
>> It would be nice if you could use that one instead.
>
> Okay, I'll use DRM exec in the next version. I'd appreciate if you could
> take a look at the patches that remove the BOs seqnos.

Of hand it looks good to me, e.g. no problematic usages for the objects 
defined by DMA-buf, e.g. dma_resv and dma_fence.

But I have absolutely zero experience with the VC4 code base, so I can't 
say anything about that.

Regards,
Christian.

>
> Thanks for comments!
>
> Best Regards,
> - Maíra
>
>>
>> Regards,
>> Christian.
>>
>>>
>>> * Patch #2: Implements the VC4 wait BO IOCTL using DMA reservations. 
>>> The
>>> new implementation closely mirrors the V3D approach and removes the 
>>> IOCTL's
>>> dependency on BO sequence numbers.
>>>
>>> * Patch #3: The central piece of this patchset. It removes `bo->seqno`,
>>> `bo->write_seqno`, and `exec->bin_dep_seqno` from the driver. As the 
>>> seqno
>>> tracking system is redundant, its deletion is relatively 
>>> straightforward.
>>> The only notable change is `vc4_async_set_fence_cb()`, which now uses
>>> `dma_fence_add_callback()` to add the VC4 callback.
>>>
>>> * Patch #4: Deletes the now-unused function `vc4_queue_seqno_cb()`.
>>>
>>> Best Regards,
>>> - Maíra
>>>
>>> Maíra Canal (4):
>>>    drm/vc4: Use `drm_gem_lock_reservations()` instead of hard-coding
>>>    drm/vc4: Use DMA Resv to implement VC4 wait BO IOCTL
>>>    drm/vc4: Remove BOs seqnos
>>>    drm/vc4: Remove `vc4_queue_seqno_cb()`
>>>
>>>   drivers/gpu/drm/vc4/vc4_crtc.c     |  22 ++---
>>>   drivers/gpu/drm/vc4/vc4_drv.h      |  26 ++---
>>>   drivers/gpu/drm/vc4/vc4_gem.c      | 147 
>>> ++++++-----------------------
>>>   drivers/gpu/drm/vc4/vc4_validate.c |  11 ---
>>>   4 files changed, 48 insertions(+), 158 deletions(-)
>>>
>>
>

