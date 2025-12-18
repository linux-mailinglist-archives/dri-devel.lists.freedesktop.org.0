Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64359CCB561
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 11:19:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF18B10ED4F;
	Thu, 18 Dec 2025 10:19:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="P3k1fuso";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010067.outbound.protection.outlook.com [52.101.61.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B470110E3A4;
 Thu, 18 Dec 2025 10:19:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jOhK1HLYLR/+st9XihQc5Ofat8i98PU7mppHLiTt+sotI/lDoAtoj/e+HzAA8BIiRM5LygIulyqfkNcVpojp/mTME9svCPEdHT09YNYKXCOnrkvf6cXZAKuFrl+t+fUvgJAu+f0Z+eWeuIedzXrpV+JUu5r1Sd5L09FA0An8nw3EhhTqhMxjlh7LiAuIxfItjE3Y1w58nJz9SLI4+tSvDakN90EvPsIgJjl1uVIQs7mTU02qz4xQfOhn1J98IP2NB0QEB8yDBQcxvyq4TNYdAW4kGOiM+ubp0cRZsJroEjJP9GVDHEQM0nDiq4YD+cEG70RmjCuAdUSl1esIQGpj1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z8JtIGsVBRNlYjqF7IM2isepYdirQwuz5ZF5uveNyKo=;
 b=EEEdk/iG0ZwDSaQeVEq4uFhd8bL91lMq/Xx+PfIX3o/TQV0bVDqFO4509b22ETyTCGQFb4NX70o0bfLKuiyDzLkg0BQYVq+z9qKxS5+h7TRcFvnejxux/+0fdRUriLRACCZDK5EcecZtI8jjTjXSgTUs55gqJSSLepIpEQgmawG9pfgwDmkexORG/sVKgNzij7MyF9UEWu/xpR7MRyewrU+2nD2tTtJVAl6T0Ul5qm2TCsV8RYgMjdunKA7VciBvuRoqQNLUulHg5tkoZ9xDQTsHm37/rWRK/TlwGV3WNsAIJz6l5oMcDX1GquNp3Qg+dZ/MTOnWGcdKvd1tIKJBNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z8JtIGsVBRNlYjqF7IM2isepYdirQwuz5ZF5uveNyKo=;
 b=P3k1fusoEYGRZ8s8ZF6CZQ2SRQlpBCBb17qo70CFMlDyzyFzlPnohohgRKdBvduqeVcxN6VfNaLEslseDUIkAGHodR09GvaGeWhWyjfJ7NbEotafNUpIsfnSvWaCwao5DkJM6PTX8JNh7oJtngjhYxhC7Xsfvdwv+vp9JYg/qPg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH8PR12MB8608.namprd12.prod.outlook.com (2603:10b6:510:1bc::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 10:18:58 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 10:18:58 +0000
Message-ID: <2ef1292d-22e8-4ec0-8316-00ae482b54a8@amd.com>
Date: Thu, 18 Dec 2025 11:18:50 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu/dm: Convert IRQ logging to drm_* helpers
To: suryasaimadhu <suryasaimadhu369@gmail.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, alexander.deucher@amd.com, airlied@gmail.com,
 simona@ffwll.ch, amd-gfx@lists.freedesktop.org
Cc: siqueira@igalia.com, mario.limonciello@amd.com, wayne.lin@amd.com,
 roman.li@amd.com, timur.kristof@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251218063512.4572-1-suryasaimadhu369@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251218063512.4572-1-suryasaimadhu369@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN9PR03CA0883.namprd03.prod.outlook.com
 (2603:10b6:408:13c::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH8PR12MB8608:EE_
X-MS-Office365-Filtering-Correlation-Id: 82cf6628-b29d-48ac-251c-08de3e1edb74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M0RXVmNDQlZsZldidEVWWDBiOUh3aDIvZ1pYNUg4RmNTOThWV3dqcHVxTGx0?=
 =?utf-8?B?ZTBvMDVvbHBJUUs4N25ZUy85Z1BTcGdpY1RobW1BSURicTViSWtxbThlYkpa?=
 =?utf-8?B?dkM5VEZ0QzJ1T3pxL25aRmV6dXVSK2grditTbjFIU3Nra3pKMDJ2UDB6NXJw?=
 =?utf-8?B?S3dGaTVoejNjeE9iWG04dzVkL1gweHRqTzJneUJPbUM4YUdKNS83ZVJSZjhX?=
 =?utf-8?B?dFRnYTQ1akx2K3B3bUFPcGJrSld4STYrbVc5eGl4OXRjeUgxMm45Sm51VnZ0?=
 =?utf-8?B?RVRJV2krVnEwQU1NWlYwWkpPV21kdm5vbWg1ZmUyLzRzMGRwNG9jU1M1VDJR?=
 =?utf-8?B?RVBIYk5Hb0lwVHAvTXY1R1JBblp2VW1qTWMrMVA4UCtyUXFjK1JDUUxKWTNL?=
 =?utf-8?B?bEtzNk11b2t2RW1sMkJFZTNGRm9wbkJBaFFnbmlzd2RZN0dINlQrWWNwVkFN?=
 =?utf-8?B?NTRlaDVEOE10S09NWTRnOXQxT2JtczBRM2Qwa293Z25ZZEIzZmhSWW1HYnY2?=
 =?utf-8?B?YUt1TGN6WmR1bEFHR2Q0SVNNZElkeXdxODNiRGs0cFFtZjBQS080enhkcUYx?=
 =?utf-8?B?d005T01OTDVWODdJSTdIRTNZdEdhbk5aVkZKbHY2RWc3VXQ3S3c0Ykl0cXZl?=
 =?utf-8?B?UVJ3UTRLVk9zUWs0a0ZyVGpONGcrOU5CWmVlZ2lVNjdBcldtTXA1QjFvcTEx?=
 =?utf-8?B?QnRkWEh0aG5qQkg5MTVCNzhtZ3BwZDRWNXdHRXdQZVp1dVh5QWlDT2xtaE05?=
 =?utf-8?B?SC9tSnErS3lQTUFESjhFL2U5ZFoxbnVwOEZXaGhtVWFZL25UOWpvbVNmMkFM?=
 =?utf-8?B?NEFRZmpOdC9aeDk2a1NqeXIzTjhacmxVNXN6MGZic2c0YW9nTjlhL1RIWkJ1?=
 =?utf-8?B?SDhObFVXUTB6VUdMMDl6K3pqRzU2cXNDZWhLNkhqSE5vZGJYNDhyeUFQSTZP?=
 =?utf-8?B?dGYyZEtSU1cvdThJQlc0QUtRb0tJMS95aWo2M1ZqeGhBTjZIOXFybTRxRFQ5?=
 =?utf-8?B?Q1BJdC8zYzd2UFkyUTlxVmFYYktFVDc0cSsrR3MxdnI3ajlmbHN4ckhuTHVN?=
 =?utf-8?B?OFdSQ3R4K2JnNWNISng1Y2l2a3RuL3MvZXl0OTRqN3FWZy9SQnduRjVYSURO?=
 =?utf-8?B?b3NWbXg4NGZZY014WHJOYVp0MXE5emgyVkJMWGY3TWczenFORG5yMVg1a3Zl?=
 =?utf-8?B?am91OVpISGUvaGtad3U0ODZ5bDBmczM1N1RJdnVzU2F6cFNELzJDOVA3YUcr?=
 =?utf-8?B?dTBlT2FkUTk2OSswaHY1Y1JNc0dnWCtlRTU4b01RVmc5VVJGYjFCVXFQZjNC?=
 =?utf-8?B?T1g2c1JtU3NSbHRXVWJVbEtZTlJvT0hhc3dBa3J1dVBhcVh0dmRZNlAwSWFG?=
 =?utf-8?B?ZlI0V1dqUU9hbDJ2azZzampzQzRLbzZIT1BoYnBCT0JYNzY1ZE1HUEVjR3pJ?=
 =?utf-8?B?bS9qNWtDT1lFWjE2NytLM0toOTRreFdVS0hnWmc2ZDB2M3g5b1FzNEw5UEJV?=
 =?utf-8?B?WVVjcjFKTmpxVFY2SUhBWU9UUjhaZVpuV29GNmZyN2F5Qm1xQjVKWnhGOXlj?=
 =?utf-8?B?bzNPNXNpdDlNR2Y5WWdydVNtajNaL3N3NnlEYTlCNXNzNXhFaytUSGNNOUlP?=
 =?utf-8?B?ckRpV2s1YlNPUU14ODlseXhTTzZTa0xBL2RnckkwK0RUQTI5eXYyZnZZR3Rn?=
 =?utf-8?B?bkhuUUJDRHZFSm9Dcm1XbDM2VGhYUmtoeGRSRWFNcUwvVmZaNjMzbUdQdzF0?=
 =?utf-8?B?dm5MVFYvOUk3UFR1L0xQcVdCcERNK09iYXl0MjRHdjhXMDBBeEtGTk5oUE96?=
 =?utf-8?B?aGxvaXFlcmdlNlVtbkFGVTAvSE84UDlpdVJkeTFsRVhjZlZRdkhjUVRiOGhm?=
 =?utf-8?B?SDQ0anlLQ1c5RXJwUEp6cjVxQVBVU1pRdVR5R3E4VXJnK0x1a2lnRmJEblJL?=
 =?utf-8?Q?rNXKXG7ZO7kmHJOk9u/p6cPkPmCYFbhP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L05wMTBIQ1plS2pYTDd4UmdXUENuRTZ3WEZSK0FWc1M4eW1TRHhwVElWVWp2?=
 =?utf-8?B?UlYrS0VtcVJSMW1GQ1FJNkI4R1ZFR3N2Rnp2MUgrL3d4dXAzTkMxelVITGZT?=
 =?utf-8?B?MTh1dUdURmhkYXI5UXRMazVoUzNDTk1nbkNhR0U3anFmMWtqaG11Tmt1SkRZ?=
 =?utf-8?B?SUJaeENmWklVa3FJOHk0Zk9lMFlRaWpDY0FXdU9BVmpNNEVJTWhpTzdJbXN2?=
 =?utf-8?B?MFpvd0ErUG5tWUVuZFVGVjhhSDRsMG14TlpodS9aNzBXQlQyVUJHY2Z5ek9E?=
 =?utf-8?B?MXQrR1pTSVpGOEJYRXlwS0VHRjYwZjEzSkFabG9VZzVJSXJYZ0RZeGRsTy9V?=
 =?utf-8?B?YlFlZFFPMlJjckdzWk8vZHdpOTJwbTdvVXVZMmUvOE9kRU9hTUR6WGMwMkZ4?=
 =?utf-8?B?c1Q1Rm9qbXBBZkRPVEVMMlN4bFNNN0RSVmVkeE9EWWhiUnpiQlJIYjlCdnJ4?=
 =?utf-8?B?NFp6QVZkenpkSGpwdW1KU28rZzBwZ2lIUk9sdzREbGtIQklTaTRKNm5vUG83?=
 =?utf-8?B?UzVybTZ6ZnFKNFpsQ3FBZ2MweTkvS2tzQVlPNi9CMTQ5M1lyMGhvSXJZWFY3?=
 =?utf-8?B?MnlNa1d2NVlvdmdIbktHYXkyQjhYWGJEZm0zcTRBc242ZkoyQlJNanRCQ2pF?=
 =?utf-8?B?ZDBKMFp5ZFM3aCtWem1iUHBFK2trRkF2WGlkZHRjRko2Qkh1Z3g4MXFzbUxH?=
 =?utf-8?B?T29KdWRLN2ZRMFBqMXZVWlZyOC9rc0RsSldrcjZWbklOZ0pZOENJRjFMeUpV?=
 =?utf-8?B?L25TeXNRWnNGd0V5SzlwT3dqM0RWUVR6SzV0ZkFSb04wRHJxNVJTRnVhaHZa?=
 =?utf-8?B?MUE1UWplWEp2MnluZnJkSExPdGkxS05VQUo0VVlWQlhrYlZwbWRGemtlU3U0?=
 =?utf-8?B?b2U4TGFYQUZBdllacDB1L2VMZTJlclBxYWJ4WmtIYlN1am5MeG0zMFpHT0VY?=
 =?utf-8?B?d1lmdEJhbHR0aHlkUTNIeVlCU3lsQ2pUT1N6dzY0djhDd3BtK0txbG5hbXNO?=
 =?utf-8?B?dEU0UFpRVHkvSS9DSTNwU1M4b0dwUkYyZkdybGo2Nmg4T1IrMlVSTHdQcTUx?=
 =?utf-8?B?V0JETnZ0TVpOWWpoZnJZMFA5a1NaZDVCZy84Tm5tQ1pWVlhHM2xhMkhQQitz?=
 =?utf-8?B?dWJvTWNMQ2lSZ2IrbUhKNWt2L3NobXBNcnl0cnBYU05KSTl4bkhQNE9EeGJv?=
 =?utf-8?B?Q2N0cTZLYTVEYWZzd3p0WHkxZTh3OC9BdFd0RVZ1RGNKZGZXTi9uZmpVaDIr?=
 =?utf-8?B?UUZPdjQ0QWlaRmhwd1IrNkw5K2pLeHFFRnFtcDdFdDJscjkrdlFEQUtrVFZk?=
 =?utf-8?B?emNOOW5ta3VWOE1vY3FQME9VcE9mTEliK3ZlWGp3RW5EQ2wydnYwZHE1UTF0?=
 =?utf-8?B?aWVCdmFpNHpWeXRUNWw4bUFPR0Y4UUlVdFVLTWd1eGIzS2F5cWlBRmpGVWtZ?=
 =?utf-8?B?VWVFQ1QwZ2ZFM0JnYjN6WTFhMlIzWFZMUDZ0cGg4cHJvcElvUXBhbDl5V01U?=
 =?utf-8?B?YlhTUXBFOVV6eEFJdFY4cW8ydjVZZGhEanZDQnJBS3M4S3hyYXF5Z1U2RTdy?=
 =?utf-8?B?dXZtcW5DOVRkMW9WN3JHaVlCZERxNDNmQy96QUlrRW4zZE5yQk1GNkpYSW9s?=
 =?utf-8?B?akcvcWxIUEdCbzhqbmlHQWtpNkZvd21tVTlUd3ZTY2lDN2V2elpOUFk0dkt5?=
 =?utf-8?B?c2lQeHV2MnNadG4wODhVWWpEcVRKZHg1N01MQkhkbktydUhpYk1adTNpK1F6?=
 =?utf-8?B?TDlGNHRtT1NkczVqT051TnBwWEZaQ3pCWG1GR1pYU3liU1h3SUc4WDZ6a3FD?=
 =?utf-8?B?WTlCeHkzd1BZdEVxbDJyaVV6dk9jRmVuMDNES1BPc2trT1hNRFo1UnlZaXVG?=
 =?utf-8?B?ZTJja21rVVNFVCt6NWtma3lLUEdZd1pvSHc3WDQ2Ty9tb2plcTBabXFpSWtI?=
 =?utf-8?B?REU4WlJnVFl6M1pMTjUzSDltY1d3ZUpQZmEzTklLSGhJUkUra2tHL0hQWjI5?=
 =?utf-8?B?Qkw0RG5iaEZmellmSVVhUjF5REtEbndiTWVJYytaRUpYaDBhTVlQbTB4QXRV?=
 =?utf-8?B?bnBlKzk3NTIwWU1IVFdWU3pSRGhrUVpxb1dSOUpkOE44YjVyaisrVW11M0sr?=
 =?utf-8?Q?mkhkzRqVQTWz9RlVF6gIwHeXg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82cf6628-b29d-48ac-251c-08de3e1edb74
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 10:18:58.6398 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XCzXxSKSfrQW/i/kfTc5cTpNQbzkxbp5J8NwNhVIpPwSpvIQJ4c1vCIen1NBmTbQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB8608
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



On 12/18/25 07:35, suryasaimadhu wrote:
> Replace DRM_ERROR(), DRM_WARN(), and DRM_INFO() usage in
> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c with the
> corresponding drm_err(), drm_warn(), and drm_info() helpers.
> 
> The drm_* logging helpers take a struct drm_device * as their first
> argument, allowing the DRM core to prefix log messages with the
> specific device name and instance. This is required to correctly
> differentiate log messages when multiple AMD GPUs are present.
> 
> This aligns amdgpu_dm with the DRM TODO item to convert legacy DRM
> logging macros to the device-scoped drm_* helpers while keeping
> debug logging unchanged.
> 
> v2:
> - Keep validation helpers DRM-agnostic
> - Move drm_* logging to AMDGPU DM callers
> - Use adev_to_drm() for drm_* logging
> 
> Signed-off-by: suryasaimadhu <suryasaimadhu369@gmail.com>
> 
> diff --git a/Makefile b/Makefile
> index 2f545ec1690f..e404e4767944 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1,8 +1,8 @@
>  # SPDX-License-Identifier: GPL-2.0
>  VERSION = 6
> -PATCHLEVEL = 18
> +PATCHLEVEL = 19
>  SUBLEVEL = 0
> -EXTRAVERSION =
> +EXTRAVERSION = -rc1
>  NAME = Baby Opossum Posse
>  
>  # *DOCUMENTATION*

That here clearly doesn't belong into the patch.

Apart from that looks ok to me.

Regards,
Christian.

> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
> index 0a2a3f233a0e..60bf1b8d886a 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
> @@ -242,35 +242,29 @@ validate_irq_registration_params(struct dc_interrupt_params *int_params,
>  				 void (*ih)(void *))
>  {
>  	if (NULL == int_params || NULL == ih) {
> -		DRM_ERROR("DM_IRQ: invalid input!\n");
>  		return false;
>  	}
>  
>  	if (int_params->int_context >= INTERRUPT_CONTEXT_NUMBER) {
> -		DRM_ERROR("DM_IRQ: invalid context: %d!\n",
> -				int_params->int_context);
>  		return false;
>  	}
>  
>  	if (!DAL_VALID_IRQ_SRC_NUM(int_params->irq_source)) {
> -		DRM_ERROR("DM_IRQ: invalid irq_source: %d!\n",
> -				int_params->irq_source);
>  		return false;
>  	}
>  
>  	return true;
>  }
>  
> -static bool validate_irq_unregistration_params(enum dc_irq_source irq_source,
> -					       irq_handler_idx handler_idx)
> +static bool validate_irq_unregistration_params(
> +	enum dc_irq_source irq_source,
> +	irq_handler_idx handler_idx)
>  {
>  	if (handler_idx == DAL_INVALID_IRQ_HANDLER_IDX) {
> -		DRM_ERROR("DM_IRQ: invalid handler_idx==NULL!\n");
>  		return false;
>  	}
>  
>  	if (!DAL_VALID_IRQ_SRC_NUM(irq_source)) {
> -		DRM_ERROR("DM_IRQ: invalid irq_source:%d!\n", irq_source);
>  		return false;
>  	}
>  
> @@ -305,17 +299,19 @@ void *amdgpu_dm_irq_register_interrupt(struct amdgpu_device *adev,
>  				       void (*ih)(void *),
>  				       void *handler_args)
>  {
> +	struct drm_device *dev = adev_to_drm(adev);
>  	struct list_head *hnd_list;
>  	struct amdgpu_dm_irq_handler_data *handler_data;
>  	unsigned long irq_table_flags;
>  	enum dc_irq_source irq_source;
>  
>  	if (false == validate_irq_registration_params(int_params, ih))
> +		drm_err(dev, "DM_IRQ: invalid registration parameters\n");
>  		return DAL_INVALID_IRQ_HANDLER_IDX;
>  
>  	handler_data = kzalloc(sizeof(*handler_data), GFP_KERNEL);
>  	if (!handler_data) {
> -		DRM_ERROR("DM_IRQ: failed to allocate irq handler!\n");
> +		drm_err(dev, "DM_IRQ: failed to allocate irq handler!\n");
>  		return DAL_INVALID_IRQ_HANDLER_IDX;
>  	}
>  
> @@ -371,11 +367,13 @@ void amdgpu_dm_irq_unregister_interrupt(struct amdgpu_device *adev,
>  					enum dc_irq_source irq_source,
>  					void *ih)
>  {
> +	struct drm_device *dev = adev_to_drm(adev);
>  	struct list_head *handler_list;
>  	struct dc_interrupt_params int_params;
>  	int i;
>  
>  	if (false == validate_irq_unregistration_params(irq_source, ih))
> +		drm_err(dev, "DM_IRQ: invalid unregistration parameters\n");
>  		return;
>  
>  	memset(&int_params, 0, sizeof(int_params));
> @@ -396,7 +394,7 @@ void amdgpu_dm_irq_unregister_interrupt(struct amdgpu_device *adev,
>  		/* If we got here, it means we searched all irq contexts
>  		 * for this irq source, but the handler was not found.
>  		 */
> -		DRM_ERROR(
> +		drm_err(dev,
>  		"DM_IRQ: failed to find irq handler:%p for irq_source:%d!\n",
>  			ih, irq_source);
>  	}
> @@ -596,7 +594,7 @@ static void amdgpu_dm_irq_schedule_work(struct amdgpu_device *adev,
>  		/*allocate a new amdgpu_dm_irq_handler_data*/
>  		handler_data_add = kzalloc(sizeof(*handler_data), GFP_ATOMIC);
>  		if (!handler_data_add) {
> -			DRM_ERROR("DM_IRQ: failed to allocate irq handler!\n");
> +			drm_err(adev_to_drm(adev), "DM_IRQ: failed to allocate irq handler!\n");
>  			return;
>  		}
>  
> @@ -611,11 +609,11 @@ static void amdgpu_dm_irq_schedule_work(struct amdgpu_device *adev,
>  		INIT_WORK(&handler_data_add->work, dm_irq_work_func);
>  
>  		if (queue_work(system_highpri_wq, &handler_data_add->work))
> -			DRM_DEBUG("Queued work for handling interrupt from "
> +			drm_dbg(adev_to_drm(adev), "Queued work for handling interrupt from "
>  				  "display for IRQ source %d\n",
>  				  irq_source);
>  		else
> -			DRM_ERROR("Failed to queue work for handling interrupt "
> +			drm_err(adev_to_drm(adev), "Failed to queue work for handling interrupt "
>  				  "from display for IRQ source %d\n",
>  				  irq_source);
>  	}
> @@ -720,7 +718,7 @@ static inline int dm_irq_state(struct amdgpu_device *adev,
>  	struct amdgpu_crtc *acrtc = adev->mode_info.crtcs[crtc_id];
>  
>  	if (!acrtc) {
> -		DRM_ERROR(
> +		drm_err(adev_to_drm(adev),
>  			"%s: crtc is NULL at id :%d\n",
>  			func,
>  			crtc_id);

