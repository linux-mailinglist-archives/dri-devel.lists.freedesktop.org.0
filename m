Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5EC09DEBA9
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2024 18:21:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 548DB10E2B2;
	Fri, 29 Nov 2024 17:21:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="jFpyL14A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2087.outbound.protection.outlook.com [40.107.237.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 927C510E2AE;
 Fri, 29 Nov 2024 17:21:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=irsJwjdKYJtL3IIieQdvrrZ4GJKd7si0KI5oesPl6bFAHGE6QJaRTdfExPZosQHCMpDFnzhafmqsJOzXg+fggvNH3C+Hknl4aYDWPthrUfKXV1igKnILPWqXTN0k7yocJcYplvlhy5rfb7KSlAt/qe/4ajawxqd/8ly8nuSx+ITVrRV87DtC5q5bfHjc7NkUFUEx8BXOn0RFUTstGwNETP/Cz99eGu1uipjoGqXocUL27crouLbP1ZeHn2gE56RG9DnwWtj3mL1bae3jdTSazqThZ+E4IwTrncV2qPWbanvALgRbQ/w57RdzFvt8TQI/xc5KqKO/xb1rdPuj61bspQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tGTck1D8K1E+gyyqW6TtYWSmmFuamtEQNyUvN74xsVc=;
 b=Wdy207LXGUjj7qT0d2XocMc4D9BHT3pxFnC3oFM0RGbV1n4WT3XsJKVx7ejXleLKxwBJLRfzlmHlqCQIaGZu5HU2hLXHJYeTvLFxuBZ4YMwgyocN7RVmtKNCnoGG0v4q0J4Yamd2415LnFf+mcth5MMghLTyjuDY8uM/1fWjvY1/2jOZ5sBszug7QQ5dw9Fm0lrtT2i9emFeQhkPQ1wjUI5UMmhR2oY2kiJGknMg5xW+JrBkjSUXrGXC8fiwN/4G8AKFzLjjBQW4dHPFZb6T85DXPUKAop+hSbrKCEZuk1H6son3Vcm2w7tPBLztnCZKWAxckx+tVbieMMMDWYV+aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tGTck1D8K1E+gyyqW6TtYWSmmFuamtEQNyUvN74xsVc=;
 b=jFpyL14ACZejst9sneq8FFC0sKhYFgZFvJIyQNv462A+0Rq8vJMJqUFc4cT7LUQVTeCAKakWFvp1De3Skj9hDIUZOyuK07QpOONoxonosbciEgwAhnWNfGZdSQdLHwRSELu+7LRIwkULsRE0u7iyS4aWkbbRrum7Mc8Q4Qj3hF8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Fri, 29 Nov
 2024 17:21:14 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81%6]) with mapi id 15.20.8207.014; Fri, 29 Nov 2024
 17:21:14 +0000
Message-ID: <c12d7952-b05e-4ea7-bedc-7a1d5da3e3cf@amd.com>
Date: Fri, 29 Nov 2024 12:21:12 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] amdgpu fix for gfx1103 queue evict/restore crash
To: Mika Laitio <lamikr@gmail.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui.Pan@amd.com, airlied@gmail.com, simona@ffwll.ch,
 Hawking.Zhang@amd.com, sunil.khatri@amd.com, lijo.lazar@amd.com,
 kevinyang.wang@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20241127114638.11216-1-lamikr@gmail.com>
 <20241127114638.11216-2-lamikr@gmail.com>
 <8266003e-eb98-44cb-a326-1e4f688eeb4c@amd.com>
 <744cb13e-d46c-40b0-8d88-b223db5178da@amd.com>
 <CAJ+8kEYDRozboMpybdqMVZx+S77s_zHNXURJ-pp_Lrx_fESkgA@mail.gmail.com>
Content-Language: en-US
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <CAJ+8kEYDRozboMpybdqMVZx+S77s_zHNXURJ-pp_Lrx_fESkgA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR01CA0062.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:2::34) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|BY5PR12MB4116:EE_
X-MS-Office365-Filtering-Correlation-Id: b9fce5c1-daa0-4a88-ba14-08dd109a3a63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QXZyR0ZZN0lHSmVHU2xvNVpUUys2SjFrRGZtTEpveVMwTmhZN0hFKzlJV1pn?=
 =?utf-8?B?OWFDWTRVUjdGTjY0UXdnTVJtQ3NYVCtxdUFVTmFKdWpvMWhnb0M3MUlRdWJH?=
 =?utf-8?B?VW1abmkrWU9hbXJzWTdMM05jSi9MSGEzditxNEdrSGM5d1A4T0xhakVmMjJD?=
 =?utf-8?B?S3RVM0dUUnNveGFVek9aUFZhNW1GVDBmZlQzSWk3dUJUNFp3WlZRaHdTZlVP?=
 =?utf-8?B?dzhKRERBRFA2cGRwRzFXL0pIV1MyelZLMmtjdm9XMUI1SE95bkhHcG5xaGs4?=
 =?utf-8?B?c3B2akVENTV0ZE1XNHJRZmlRZWltVGxxaUZYaUVDVG1SNy94ODJ2QzdHcE1W?=
 =?utf-8?B?ZytDR0Zhd09ZYkxQdVhwaFREYVI5YzFhRHBYelJPNVZncDlqVDM0QzhweUJ5?=
 =?utf-8?B?Y1FFMmVja3VBWCtBSDMyc2xsbkJqV3lPeHFPZmpXd3FsSnJSZHdSWUlpdGRh?=
 =?utf-8?B?Nngyb0pLM3ErR2RpZ0l0ODBSV215ZDcxY2tUcUY4cW50bDlKbStJV29Xa2ZY?=
 =?utf-8?B?QU5HMUxva1p0N2pOTVRVK2NwWDZlMzBzQjdJVUg4c1ZqbnJzVnBTMnlmOTRi?=
 =?utf-8?B?ZCtTdlBGQkt4RWI1Rzl2a0pWSjA1VHdXb2pOUnAxZzVwc0g3dWt2VU5jbzho?=
 =?utf-8?B?TTNjaFpNdVh6MGltUlphWkczZEVwdU5BeDZ6SnRKNzFuSEtCdHJPcmJnUXAw?=
 =?utf-8?B?b1JvNFhvbUhzSUFFU2IvdWp2Mi9GTE5yUitUa1hsOFdnQTBPUHZyN1RLaDNE?=
 =?utf-8?B?VVVMV3cwdFNEUlRPcHk4TzJuQ29tNGgyakg5UTBFUWd6NDNLR0tTeUlCamkz?=
 =?utf-8?B?dFVxc284MDAyNU5sTVFwT2lXOThGTFZ3WFRIRjJFWlpJM1JVcWVpak9aZDF6?=
 =?utf-8?B?K04xSWp5ZUZpV3lkUDl6SVBHYzNNQmtzSlJIQTV4TC9vSGdsTUoxSHF4a3o2?=
 =?utf-8?B?RVFPS0ZqUUpDZUdDL2VhOTE3ck5oZzRwaENySmFFYmNoTmloSGZOYmJFNU12?=
 =?utf-8?B?amhERklYOTJoSVlLM2NobWh6NkdLNmk3UXBJRHl3aDFqbkJZQ05zcUVrdjZJ?=
 =?utf-8?B?TzBycDA4cHFIZTlELzR2MDIraERyTzBrNkhFeW5YZ0NNeHhkWDJKdVQ1SkNG?=
 =?utf-8?B?MCtGM016TElLR08xOERyZDI5WnVkdG9hMlR3cktaQ3dReWNmMkhVVmhLTU9a?=
 =?utf-8?B?eDN6aUk4amJaSHFDYXdKRVVRTXBmV2kzWXk2c1E3RnpKOVZVYUdrcFZteUhO?=
 =?utf-8?B?Zk84RVBOVlZSYVBKNllFcVJ0QjZHdmtQVUZwdUxtcEV6cTVxNmtoZ2h5WEpW?=
 =?utf-8?B?WlhySlhOUm5sdzB5SUxXeVBzY3pxT2hwMnZKWGdwT3RMUitkSGROOC9JQmNq?=
 =?utf-8?B?V2paaEliYTNCUGhLQ0U1ZDU1aHhTUUVqNDlhUHNhd25XcEUzbWlaY1R2RWhl?=
 =?utf-8?B?TUU4RStTSlZHSENVV1p2YTZZU0VNa04wckplYlJCdjFEb0QzcEt1WjhUT2Z0?=
 =?utf-8?B?OHA0bmxsWUlrcVdDSEpaZHg3NS9uaG1zZTFROXpwNHBPUzlxYWRGdU5TZ0Jv?=
 =?utf-8?B?aEx6YmxQVjVSUWxXYm9PL3RqY2tLNFR0R1dBbEF2L24zZzhBK0psenN1ZmJv?=
 =?utf-8?B?QW0zSVpNZ1d2SVV3Rk9MVmxOajkxTEhFWjMvR3Q2TUNlUzhsVFR5Y2tzaHVG?=
 =?utf-8?B?cnhJVC9Zd0IwUFNqaXhuU1pzZFU0SExJODZZWlJJMjR6MlhRZHpUODZWUitB?=
 =?utf-8?B?QnNpc01zTkRkVjRSWDR3azl5U2ovc21uUGVDOGRsMEtxUjZKV2hQZUNWTHhZ?=
 =?utf-8?B?V2kzYnp5VWlkRGY5UjNRUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YWZUVnFEci96U09FN1N4RWV2Umh3WjFmRHZRSzZPMnpmWG9kbmxwV3ZxUGFI?=
 =?utf-8?B?SnphYzF6LzRzT0RyRDI2MXJmODRmK1hnZW94RUpIbW01R3RBMUhxbWJORG1Z?=
 =?utf-8?B?MUlsK1BCMXdnS0xzSEIzOVQ2aWpzUkI1bEdPa0E1Wk5OR3psR1JvYTduU3Bw?=
 =?utf-8?B?S3VzQkpnMGRQOHJLV01aZ05za0dxKzhTTDJGcGJXdUxKT1kwVURWR2hxa3g5?=
 =?utf-8?B?OTJvOFZyQ2h5WFN4RjViODJmemhueWxlOWpHY3NMNHhWeHorKzI0Q0FEWGxR?=
 =?utf-8?B?VkV5Z2xKU25HQld2N0RldjUxMG1xeDNjQko2dHI2R0dMUVQ4UmdJOUxoVDNE?=
 =?utf-8?B?SDJ2THpKZysyN1Y2UlBYOHdJN294QWc0V1VsSCtCMXZieENDZXp1Ync1S2pX?=
 =?utf-8?B?V3dPSVJDYXA0eVI0Q0pkTzYybFUzR2JFaWtrYWJkWjFodEtLZnkxKzFRUFIw?=
 =?utf-8?B?a2RoT0t5SXBHajZRN2RDRDhsTnZrL0JWMTI2UURqcmJnajFHeDFnUjh4RzRQ?=
 =?utf-8?B?N3U3d09pcEpMNXAzcnlNK1I0dndEdlB6cG1kajlDSUFCYzdDQTJHcXA0dFVq?=
 =?utf-8?B?MzZ4Z1U1Q20vZ1pyNS8raWtEMXlOM3VzUzJmcThFS0dXa2ZTa3hjNEVLd2tD?=
 =?utf-8?B?d05SK0pqM2laLzB1dnArUkwxS2dDVGRhUzc3NnczeUlRd2ZtQktiSXNUMWxs?=
 =?utf-8?B?akJPdmxlTCtHRk4yZDNyaGQvd3BqeEdCS3F2aUxJWFEzTVpPMGd0N3B3bkEz?=
 =?utf-8?B?RHBzYTFVMEdiODJ4bCtUeWlDWHppQmF6YUxQRStJYmdET0wyRTR4U1RLajFQ?=
 =?utf-8?B?MXJrOTdDUXdWTXdYeHJPV2VEbWJKSmpmN3dDTTMzd0U3NlJYZXpMTGprQ2Rl?=
 =?utf-8?B?ejR5UDlKOERuVnRNUzBGK0p2UEJJaHlpVCs3MGpuM2p4MUR6Y2JnUU9rMFl3?=
 =?utf-8?B?MFM2NU1IcEZzZHo0ME5jSm5lNlJVZDBLYmxKdHpLWGZsTzZhWDZNYjQ2R0pI?=
 =?utf-8?B?dXhXQTRrZkVtRTUrOFlsUmJlcVZjR0pVOExkWXFWMlNlVDZyeE56bFlnTXoz?=
 =?utf-8?B?Qko2T0tIRnV5VTZNd2VXa1FPNVNSNHZtclNBZWJjUFJJdThvODRxTm5kV3R3?=
 =?utf-8?B?OVcxY256RjJtdHVzcGlYMzQ1a2JTQjd3Znd1WjkxU3A3aTdHbVhjYzlYRzlF?=
 =?utf-8?B?ZXlYaWE3VXZFdTBWMmttMFRYZU9PalJKb0xQdnBQSyt6a1V4Ym0zMmZIMGpJ?=
 =?utf-8?B?R0ZsS2FOaDRUL2UvRDlGV3crbzFGdGg5YXp0Q2lWc0tBQlQ3WWpsaVdhWGp5?=
 =?utf-8?B?N3YxTWVWWWdTeER4bnNwS2g4eExUenJFNXFSdW12azJuWVBNYXRidnB6cVdJ?=
 =?utf-8?B?SEZMcHZqWXRnUW83b2dqOTJhcGR4Sm9vY1lTRXdxSlZMc09FV2FRU3lRaEM1?=
 =?utf-8?B?YlVRNjBJQ1J6UGNHeVBrQzJOUWVuV2xsN3dhYmZmeEFvOUdpL1YwQ0lxejMv?=
 =?utf-8?B?dGwrMjdyUUc4elNzVFNUZ2dBMHJwTmdyeGpxZTF4K1RVS0VRTTlnUFhHNHMr?=
 =?utf-8?B?dXdndFVvZHNjc1hLUzgxWnlqcVNOR2w2T0dHeVBvZFJ0RGJ4MmZ3dXU5OEdF?=
 =?utf-8?B?c1d4QTFEN3NaeU1yNXUzbElRYUJFSWgvc1BVNDQ5NzE1cG1ZOUNYNHUyRHpW?=
 =?utf-8?B?bW1iSXVxVjNqSnhoUjBxb0RhL05OQURvTWc3bjVlaXJ3ZmVjTUM5VEZYQUU1?=
 =?utf-8?B?TW5wY0JubXdXRTBUSnBMazZScklWajIvMDJtc0xLZFhZeWpJcWVmKzhlZlNy?=
 =?utf-8?B?QVJOUmhocTNGenZRNlJMbTV0a2JjdXhQVWZsY2oyZ25kSkkxdU1Kb0VIZjd3?=
 =?utf-8?B?cklWUXRPbmtFTkk1SDZSdmw2R3RwVDZZZnR3WjBjM0hzTGFlMXdGYVVLVG9Z?=
 =?utf-8?B?NE1Pa1N3TUZwcmdyRTRPc3JoVjR0WGFpeENBaElDVEhRVFN3a0xDSC9yZWZv?=
 =?utf-8?B?WnkvN3F2QklBbU55SGRGV0ltWU1iTnhNWDlETGYyd1MyM2NabWhaRm5VcmFy?=
 =?utf-8?B?eW9jaHZXNUJDREdQREpxaUU4aTk4eW53S1kyNzBreUVNK3ZKL1YyeXQ3emlK?=
 =?utf-8?Q?VrVxIbkWni0NqKY+p5aN4d/VJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9fce5c1-daa0-4a88-ba14-08dd109a3a63
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2024 17:21:14.8367 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C/vFB8/97rvPjP4ahPImFXDQ+Aoc9G3U3wY4Nc/4gyq/0o8hdypQiylIVz6aZB79wBHY5Z+qaptjCSpc0mcTsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4116
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


On 2024-11-28 21:51, Mika Laitio wrote:
> Thanks for the feedback, the problem is anyway real breaking userspace 
> apps if my patch is not in use. I have actually spend this day for 
> investigating and testing another gpu hang bug that has been reported 
> originally by others on gfx1010/AMD RX 5700. I thought originally that 
> the bug is different because I was not able to trigger it in the test 
> app that crashes the kernel on gfx1103.
>
> With gfx1010 I need to run the pytorch gpu benchmark which does more 
> heavy calculation. In kernel side the symptom is same, kernel fails to 
> remove the queue on similar type of evict/restore cycle that the 
> kernel seems to do constantly. This bug has one annoying side-effect, 
> regular user level reboot will hang requiring to use power button to 
> shut down the device. (echo b >/proc/sysrq-trigger works sometimes)
>
> Anyway, I have managed to get the gfx1010 to also stay stable and 
> finish the benchmarks if I do a similar type of fix/workaround that 
> prevents the queue remove/restore to happen on evict and restore methods.
>
> It may or may not be in reality a firmware bug, hard to debug as I do 
> not access to firmware code. But I think this should be fixed somehow 
> anyway. (Kernel has tons of workaround anyway for other broken 
> firmware and hw problems)
>
> I can however try to approach this in some other way also, would you 
> have any suggestion? I have played with the recent AMD gpu kernel 
> driver stack for a couple of days, so I probably miss something but 
> here are 2 observations/questions I have in my mind?
>
> 1) Is it really necessary to evict/restore the queues also on firmware 
> until they really need to be deleted more permanently? I mean would it 
> be just enough to mark queues disabled/enabled in kernel-structure 
> when pre-emption happens?

The purpose of the preemption is to stop GPU access to memory. Just 
marking the queue as preempted does not accomplish this.

If we don't stop GPU access to memory, the GPU can corrupt physical 
memory that no longer belongs to the process. This will very likely lead 
to problems like random crashes, file system corruption, etc. That's not 
a valid solution to your problem.


>
> 2) dqm_lock that is used to protect the queue-lists that are 
> removed/restored uses memalloc_noreclaim_save/restore calls that 
> according to documentation can easily cause problems if there happens 
> some fs calls or recursions. Could the userspace be able to trigger 
> that problem by using some amdgpu specific sysfs interface calls. Or 
> can the MES firmware somehow call back to kernel functions that cause 
> recursive loop while performing the queue remove method calls?

MES firmware does not call back into the kernel. The kernel mode driver 
handles the locking and is careful not to cause recursions with memory 
reclaim. That's what these memalloc_noreclaim_save are there for. The 
kernel has some lock dependency debugging features that can prove 
locking correctness. We usually have those enabled in developer builds 
to ensure that we're handling this correctly.

The error messages you're showing do not point at a locking issue. 
Rather the firmware is reporting that it's unable to preempt the queue. 
The driver responds with a GPU reset.

Regards,
   Felix


>
> Below is the gfx1010 dmesg with added trace calls that reveals kernel 
> problems with queues while using that device.
> I have again added some extra strace to to print out the function name 
> when its started and what is the caller method.
>
> 884.437695] amdgpu: kgd2kfd_quiesce_mm called by 
> amdgpu_amdkfd_evict_userptr
> [  884.437704] amdgpu: evict_process_queues_cpsch started
> [  884.443511] amdgpu: kgd2kfd_resume_mm called by 
> amdgpu_amdkfd_restore_userptr_worker
> [  884.443520] amdgpu: restore_process_queues_cpsch started
> [  907.375917] amdgpu: evict_process_queues_cpsch started
> [  907.375981] amdgpu: evict_process_worker Finished evicting pasid 0x8005
> [  907.483535] amdgpu: restore_process_queues_cpsch started
> [  909.013279] amdgpu: kgd2kfd_quiesce_mm called by svm_range_evict
> [  909.013286] amdgpu: evict_process_queues_cpsch started
> [  909.033675] amdgpu: kgd2kfd_quiesce_mm called by 
> amdgpu_amdkfd_evict_userptr
> [  909.033681] amdgpu: evict_process_queues_cpsch started
> [  909.059674] amdgpu: kgd2kfd_resume_mm called by 
> amdgpu_amdkfd_restore_userptr_worker
> [  909.059680] amdgpu: restore_process_queues_cpsch started
> [  909.082565] amdgpu: kgd2kfd_quiesce_mm called by 
> amdgpu_amdkfd_evict_userptr
> [  909.082572] amdgpu: evict_process_queues_cpsch started
> [  909.295184] amdgpu: kgd2kfd_resume_mm called by 
> amdgpu_amdkfd_restore_userptr_worker
> [  909.295190] amdgpu: restore_process_queues_cpsch started
> [  909.608840] amdgpu: kgd2kfd_resume_mm called by svm_range_restore_work
> [  909.608846] amdgpu: restore_process_queues_cpsch started
> [  966.354867] amdgpu: kgd2kfd_quiesce_mm called by 
> amdgpu_amdkfd_evict_userptr
> [  966.354876] amdgpu: evict_process_queues_cpsch started
> [  966.361293] amdgpu: kgd2kfd_resume_mm called by 
> amdgpu_amdkfd_restore_userptr_worker
> [  966.361303] amdgpu: restore_process_queues_cpsch started
> [  984.457200] amdgpu: evict_process_queues_cpsch started
> [  984.457261] amdgpu: evict_process_worker Finished evicting pasid 0x8005
> [  984.562403] amdgpu: restore_process_queues_cpsch started
> [  984.628620] amdgpu: kgd2kfd_quiesce_mm called by svm_range_evict
> [  984.628627] amdgpu: evict_process_queues_cpsch started
> [  984.650436] amdgpu: kgd2kfd_quiesce_mm called by 
> amdgpu_amdkfd_evict_userptr
> [  984.650443] amdgpu: evict_process_queues_cpsch started
> [  984.718544] amdgpu: kgd2kfd_resume_mm called by 
> amdgpu_amdkfd_restore_userptr_worker
> [  984.718550] amdgpu: restore_process_queues_cpsch started
> [  984.738360] amdgpu: kgd2kfd_quiesce_mm called by 
> amdgpu_amdkfd_evict_userptr
> [  984.738367] amdgpu: evict_process_queues_cpsch started
> [  984.765031] amdgpu: kgd2kfd_resume_mm called by 
> amdgpu_amdkfd_restore_userptr_worker
> [  984.765038] amdgpu: restore_process_queues_cpsch started
> [  984.785180] amdgpu: kgd2kfd_quiesce_mm called by 
> amdgpu_amdkfd_evict_userptr
> [  984.785187] amdgpu: evict_process_queues_cpsch started
> [  984.907430] amdgpu: kgd2kfd_resume_mm called by 
> amdgpu_amdkfd_restore_userptr_worker
> [  984.907435] amdgpu: restore_process_queues_cpsch started
> [  984.930399] amdgpu: kgd2kfd_quiesce_mm called by 
> amdgpu_amdkfd_evict_userptr
> [  984.930405] amdgpu: evict_process_queues_cpsch started
> [  984.956551] amdgpu: kgd2kfd_resume_mm called by 
> amdgpu_amdkfd_restore_userptr_worker
> [  984.956561] amdgpu: restore_process_queues_cpsch started
> [  985.288614] amdgpu: kgd2kfd_resume_mm called by svm_range_restore_work
> [  985.288621] amdgpu: restore_process_queues_cpsch started
> [  998.410978] amdgpu: evict_process_queues_cpsch started
> [  998.411041] amdgpu: evict_process_worker Finished evicting pasid 0x8005
> [  998.513922] amdgpu: restore_process_queues_cpsch started
> [  998.531861] amdgpu: kgd2kfd_quiesce_mm called by svm_range_evict
> [  998.531867] amdgpu: evict_process_queues_cpsch started
> [  998.553650] amdgpu: kgd2kfd_quiesce_mm called by 
> amdgpu_amdkfd_evict_userptr
> [  998.553656] amdgpu: evict_process_queues_cpsch started
> [  998.581235] amdgpu: kgd2kfd_resume_mm called by 
> amdgpu_amdkfd_restore_userptr_worker
> [  998.581241] amdgpu: restore_process_queues_cpsch started
> [  998.607168] amdgpu: kgd2kfd_quiesce_mm called by 
> amdgpu_amdkfd_evict_userptr
> [  998.607174] amdgpu: evict_process_queues_cpsch started
> [  998.700499] amdgpu: kgd2kfd_resume_mm called by 
> amdgpu_amdkfd_restore_userptr_worker
> [  998.700506] amdgpu: restore_process_queues_cpsch started
> [  998.718179] amdgpu: kgd2kfd_quiesce_mm called by 
> amdgpu_amdkfd_evict_userptr
> [  998.718187] amdgpu: evict_process_queues_cpsch started
> [  998.810595] amdgpu: kgd2kfd_resume_mm called by 
> amdgpu_amdkfd_restore_userptr_worker
> [  998.810603] amdgpu: restore_process_queues_cpsch started
> [  998.831776] amdgpu: kgd2kfd_quiesce_mm called by 
> amdgpu_amdkfd_evict_userptr
> [  998.831782] amdgpu: evict_process_queues_cpsch started
> [  998.858199] amdgpu: kgd2kfd_resume_mm called by 
> amdgpu_amdkfd_restore_userptr_worker
> [  998.858205] amdgpu: restore_process_queues_cpsch started
> [  998.880604] amdgpu: kgd2kfd_quiesce_mm called by 
> amdgpu_amdkfd_evict_userptr
> [  998.880611] amdgpu: evict_process_queues_cpsch started
> [  998.912335] amdgpu: kgd2kfd_resume_mm called by 
> amdgpu_amdkfd_restore_userptr_worker
> [  998.912343] amdgpu: restore_process_queues_cpsch started
> [  999.237449] amdgpu: kgd2kfd_resume_mm called by svm_range_restore_work
> [  999.237455] amdgpu: restore_process_queues_cpsch started
> [ 1058.513361] amdgpu: kgd2kfd_quiesce_mm called by 
> amdgpu_amdkfd_evict_userptr
> [ 1058.513373] amdgpu: evict_process_queues_cpsch started
> [ 1062.513487] amdgpu 0000:03:00.0: amdgpu: Queue preemption failed 
> for queue with doorbell_id: 80004008
> [ 1062.513500] amdgpu 0000:03:00.0: amdgpu: Failed to evict process 
> queue 0, caller: kgd2kfd_quiesce_mm
> [ 1062.513503] amdgpu: Failed to quiesce KFD
> [ 1062.513551] amdgpu 0000:03:00.0: amdgpu: GPU reset begin!
> [ 1062.513628] amdgpu: evict_process_queues_cpsch started
> [ 1062.513694] amdgpu 0000:03:00.0: amdgpu: Dumping IP State
> [ 1062.517229] amdgpu 0000:03:00.0: amdgpu: Dumping IP State Completed
> [ 1062.866910] amdgpu 0000:03:00.0: [drm:amdgpu_ring_test_helper 
> [amdgpu]] *ERROR* ring kiq_0.2.1.0 test failed (-110)
> [ 1062.867435] [drm:gfx_v10_0_hw_fini [amdgpu]] *ERROR* KCQ disable failed
> [ 1062.915075] amdgpu 0000:03:00.0: amdgpu: BACO reset
> [ 1062.937902] amdgpu: kgd2kfd_quiesce_mm called by svm_range_evict
> [ 1062.937907] amdgpu: evict_process_queues_cpsch started
>
>
>
>
> On Wed, Nov 27, 2024 at 3:50 PM Felix Kuehling 
> <felix.kuehling@amd.com> wrote:
>
>
>     On 2024-11-27 06:51, Christian König wrote:
>     > Am 27.11.24 um 12:46 schrieb Mika Laitio:
>     >> AMD gfx1103 / M780 iGPU will crash eventually when used for
>     >> pytorch ML/AI operations on rocm sdk stack. After kernel error
>     >> the application exits on error and linux desktop can itself
>     >> sometimes either freeze or reset back to login screen.
>     >>
>     >> Error will happen randomly when kernel calls
>     >> evict_process_queues_cpsch and
>     >> restore_process_queues_cpsch methods to remove and restore the
>     queues
>     >> that has been created earlier.
>     >>
>     >> The fix is to remove the evict and restore calls when device
>     used is
>     >> iGPU. The queues that has been added during the user space
>     >> application execution
>     >> time will still be removed when the application exits
>     >
>     > As far as I can see that is absolutely not a fix but rather a
>     > obviously broken workaround.
>     >
>     > Evicting and restoring queues is usually mandatory for correct
>     operation.
>     >
>     > So just ignore that this doesn't work will just is not something
>     you
>     > can do.
>
>     I agree. Eviction happens for example in MMU notifiers where we
>     need to
>     assure the kernel that memory won't be accessed by the GPU once the
>     notifier returns, until the memory mappings in the GPU page tables
>     can
>     be revalidated.
>
>     This looks like a crude workaround for an MES firmware problem or
>     some
>     other kind of intermittent hang that needs to be root-caused. It's a
>     NACK from me as well.
>
>     Regards,
>        Felix
>
>
>     >
>     > Regards,
>     > Christian.
>     >
>     >>
>     >> On evety test attempts the crash has always happened on the
>     >> same location while removing the 2nd queue of 3 with doorbell
>     id 0x1002.
>     >>
>     >> Below is the trace captured by adding more printouts to problem
>     >> location to print message also when the queue is evicted or
>     resrored
>     >> succesfully.
>     >>
>     >> [  948.324174] amdgpu 0000:c4:00.0: amdgpu: add_queue_mes added
>     >> hardware queue to MES, doorbell=0x1202, queue: 2, caller:
>     >> restore_process_queues_cpsch
>     >> [  948.334344] amdgpu 0000:c4:00.0: amdgpu: add_queue_mes added
>     >> hardware queue to MES, doorbell=0x1002, queue: 1, caller:
>     >> restore_process_queues_cpsch
>     >> [  948.344499] amdgpu 0000:c4:00.0: amdgpu: add_queue_mes added
>     >> hardware queue to MES, doorbell=0x1000, queue: 0, caller:
>     >> restore_process_queues_cpsch
>     >> [  952.380614] amdgpu 0000:c4:00.0: amdgpu: remove_queue_mes
>     removed
>     >> hardware queue from MES, doorbell=0x1202, queue: 2, caller:
>     >> evict_process_queues_cpsch
>     >> [  952.391330] amdgpu 0000:c4:00.0: amdgpu: remove_queue_mes
>     removed
>     >> hardware queue from MES, doorbell=0x1002, queue: 1, caller:
>     >> evict_process_queues_cpsch
>     >> [  952.401634] amdgpu 0000:c4:00.0: amdgpu: remove_queue_mes
>     removed
>     >> hardware queue from MES, doorbell=0x1000, queue: 0, caller:
>     >> evict_process_queues_cpsch
>     >> [  952.414507] amdgpu 0000:c4:00.0: amdgpu: add_queue_mes added
>     >> hardware queue to MES, doorbell=0x1202, queue: 2, caller:
>     >> restore_process_queues_cpsch
>     >> [  952.424618] amdgpu 0000:c4:00.0: amdgpu: add_queue_mes added
>     >> hardware queue to MES, doorbell=0x1002, queue: 1, caller:
>     >> restore_process_queues_cpsch
>     >> [  952.434922] amdgpu 0000:c4:00.0: amdgpu: add_queue_mes added
>     >> hardware queue to MES, doorbell=0x1000, queue: 0, caller:
>     >> restore_process_queues_cpsch
>     >> [  952.446272] amdgpu 0000:c4:00.0: amdgpu: remove_queue_mes
>     removed
>     >> hardware queue from MES, doorbell=0x1202, queue: 2, caller:
>     >> evict_process_queues_cpsch
>     >> [  954.460341] amdgpu 0000:c4:00.0: amdgpu: MES failed to
>     respond to
>     >> msg=REMOVE_QUEUE
>     >> [  954.460356] amdgpu 0000:c4:00.0: amdgpu: remove_queue_mes
>     failed
>     >> to remove hardware queue from MES, doorbell=0x1002, queue: 1,
>     caller:
>     >> evict_process_queues_cpsch
>     >> [  954.460360] amdgpu 0000:c4:00.0: amdgpu: MES might be in
>     >> unrecoverable state, issue a GPU reset
>     >> [  954.460366] amdgpu 0000:c4:00.0: amdgpu: Failed to evict queue 1
>     >> [  954.460368] amdgpu 0000:c4:00.0: amdgpu: Failed to evict
>     process
>     >> queues
>     >> [  954.460439] amdgpu 0000:c4:00.0: amdgpu: GPU reset begin!
>     >> [  954.460464] amdgpu 0000:c4:00.0: amdgpu: remove_all_queues_mes:
>     >> Failed to remove queue 0 for dev 5257
>     >> [  954.460515] amdgpu 0000:c4:00.0: amdgpu: Dumping IP State
>     >> [  954.462637] amdgpu 0000:c4:00.0: amdgpu: Dumping IP State
>     Completed
>     >> [  955.865591] amdgpu: process_termination_cpsch started
>     >> [  955.866432] amdgpu: process_termination_cpsch started
>     >> [  955.866445] amdgpu 0000:c4:00.0: amdgpu: Failed to remove
>     queue 0
>     >> [  956.503043] amdgpu 0000:c4:00.0: amdgpu: MES failed to
>     respond to
>     >> msg=REMOVE_QUEUE
>     >> [  956.503059] [drm:amdgpu_mes_unmap_legacy_queue [amdgpu]]
>     *ERROR*
>     >> failed to unmap legacy queue
>     >> [  958.507491] amdgpu 0000:c4:00.0: amdgpu: MES failed to
>     respond to
>     >> msg=REMOVE_QUEUE
>     >> [  958.507507] [drm:amdgpu_mes_unmap_legacy_queue [amdgpu]]
>     *ERROR*
>     >> failed to unmap legacy queue
>     >> [  960.512077] amdgpu 0000:c4:00.0: amdgpu: MES failed to
>     respond to
>     >> msg=REMOVE_QUEUE
>     >> [  960.512093] [drm:amdgpu_mes_unmap_legacy_queue [amdgpu]]
>     *ERROR*
>     >> failed to unmap legacy queue
>     >> [  960.785816] [drm:gfx_v11_0_hw_fini [amdgpu]] *ERROR* failed to
>     >> halt cp gfx
>     >>
>     >> Signed-off-by: Mika Laitio <lamikr@gmail.com>
>     >> ---
>     >>   .../drm/amd/amdkfd/kfd_device_queue_manager.c | 24
>     ++++++++++++-------
>     >>   1 file changed, 16 insertions(+), 8 deletions(-)
>     >>
>     >> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
>     >> b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
>     >> index c79fe9069e22..96088d480e09 100644
>     >> --- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
>     >> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
>     >> @@ -1187,9 +1187,12 @@ static int
>     evict_process_queues_cpsch(struct
>     >> device_queue_manager *dqm,
>     >>       struct kfd_process_device *pdd;
>     >>       int retval = 0;
>     >>   +    // gfx1103 APU can fail to remove queue on evict/restore
>     cycle
>     >> +    if (dqm->dev->adev->flags & AMD_IS_APU)
>     >> +        goto out;
>     >>       dqm_lock(dqm);
>     >>       if (qpd->evicted++ > 0) /* already evicted, do nothing */
>     >> -        goto out;
>     >> +        goto out_unlock;
>     >>         pdd = qpd_to_pdd(qpd);
>     >>   @@ -1198,7 +1201,7 @@ static int
>     evict_process_queues_cpsch(struct
>     >> device_queue_manager *dqm,
>     >>        * Skip queue eviction on process eviction.
>     >>        */
>     >>       if (!pdd->drm_priv)
>     >> -        goto out;
>     >> +        goto out_unlock;
>     >>         pr_debug_ratelimited("Evicting PASID 0x%x queues\n",
>     >>                   pdd->process->pasid);
>     >> @@ -1219,7 +1222,7 @@ static int evict_process_queues_cpsch(struct
>     >> device_queue_manager *dqm,
>     >>               if (retval) {
>     >>                   dev_err(dev, "Failed to evict queue %d\n",
>     >>                       q->properties.queue_id);
>     >> -                goto out;
>     >> +                goto out_unlock;
>     >>               }
>     >>           }
>     >>       }
>     >> @@ -1231,8 +1234,9 @@ static int evict_process_queues_cpsch(struct
>     >> device_queue_manager *dqm,
>     >> KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0,
>     >> USE_DEFAULT_GRACE_PERIOD);
>     >>   -out:
>     >> +out_unlock:
>     >>       dqm_unlock(dqm);
>     >> +out:
>     >>       return retval;
>     >>   }
>     >>   @@ -1326,14 +1330,17 @@ static int
>     >> restore_process_queues_cpsch(struct device_queue_manager *dqm,
>     >>       uint64_t eviction_duration;
>     >>       int retval = 0;
>     >>   +    // gfx1103 APU can fail to remove queue on evict/restore
>     cycle
>     >> +    if (dqm->dev->adev->flags & AMD_IS_APU)
>     >> +        goto out;
>     >>       pdd = qpd_to_pdd(qpd);
>     >>         dqm_lock(dqm);
>     >>       if (WARN_ON_ONCE(!qpd->evicted)) /* already restored, do
>     >> nothing */
>     >> -        goto out;
>     >> +        goto out_unlock;
>     >>       if (qpd->evicted > 1) { /* ref count still > 0, decrement &
>     >> quit */
>     >>           qpd->evicted--;
>     >> -        goto out;
>     >> +        goto out_unlock;
>     >>       }
>     >>         /* The debugger creates processes that temporarily have
>     not
>     >> acquired
>     >> @@ -1364,7 +1371,7 @@ static int
>     restore_process_queues_cpsch(struct
>     >> device_queue_manager *dqm,
>     >>               if (retval) {
>     >>                   dev_err(dev, "Failed to restore queue %d\n",
>     >>                       q->properties.queue_id);
>     >> -                goto out;
>     >> +                goto out_unlock;
>     >>               }
>     >>           }
>     >>       }
>     >> @@ -1375,8 +1382,9 @@ static int
>     restore_process_queues_cpsch(struct
>     >> device_queue_manager *dqm,
>     >>       atomic64_add(eviction_duration,
>     &pdd->evict_duration_counter);
>     >>   vm_not_acquired:
>     >>       qpd->evicted = 0;
>     >> -out:
>     >> +out_unlock:
>     >>       dqm_unlock(dqm);
>     >> +out:
>     >>       return retval;
>     >>   }
>     >
>
