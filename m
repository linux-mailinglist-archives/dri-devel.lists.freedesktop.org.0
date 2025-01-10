Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A22CA0941B
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 15:48:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6AAE10E037;
	Fri, 10 Jan 2025 14:48:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="h8KP0hl9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2054.outbound.protection.outlook.com [40.107.95.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 614BC10E037
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 14:48:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BpmYDXL8Xt+JvXVOShZ75yhF2ExDBfDfmrysSI+1QklX5HC9cendD795g1LxFr5T8cJ19joyXDQHOepKv4FFKmg7nGO7H4tg6BucGEEJ04S+WyM+qZaA128/bLAzMSZvTo2oBa++oKgsYRw0QeWRl6aZNppddr4A4TJNS0Hv0oeUFbNfR3RRqr7fm2xmlLv5TwXNLQgNNP+MbJLAvEkRwiHYxurhjoo5Un1fejbDFw3DgFTbuPkY3oIUZRsXes5h8rrHbUaGPQbS1VfPMdIhLsDboOqri3Um57mt6U0WBdEwa1dBjS1UrCvFUfXRiQEBGwNyTX5mTXsNffZkzeBFdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rqsOJe8JgtfImnheoS6q1EX3/In24CDmGOc7wcrN7H0=;
 b=O+G1Rj4VIT4RftC4jgLr1fv5Ai9AuafWPyKWLCSDAaaJiHr36Gk3gChqV3y9r+vbB5lV1poM8+l7Me0iGWGk/2oQErRsaoL3wq7H5G0gd1iP6uFOWWVSQWkQgqgeDVGYoloqyqw9M9xk8+5NNt0iCJnnbCPsexPFzDh7bmxapHV7OzQOJSgQR40WNj6p8E7nme8LJT9rUGq8DMOoNi/eHlPqkBlry6KmeYVh/aQn8w9Br6ZFWodJq620UZ9ukkdCnPXd8N3G8lLJmIp8o6HstSv8rVNTZzU5TOhYmMzPJ4K297X1E+SK7+ZLDF+jnC/7vBb4se58kJAbVlSU4w234g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rqsOJe8JgtfImnheoS6q1EX3/In24CDmGOc7wcrN7H0=;
 b=h8KP0hl9YLOVNxbBQPPFH3vYmKsE9PSUWAXpiI56HAInjYrYS/OKrshLiUs5MtIsSDYV9itwGxfFWOmACcEqc1RywPAeWkpYnQQmjQO0+XBIFf/COXSqnSHwbWXPqYYPlEvSBCPuGZ6xY3g4PPuP2M79Ew3/fXkZ3i2JLX2iB/s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB6207.namprd12.prod.outlook.com (2603:10b6:8:a6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Fri, 10 Jan
 2025 14:48:01 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8335.010; Fri, 10 Jan 2025
 14:48:00 +0000
Message-ID: <3c6e53ae-6998-47f8-ae37-9e68553ad918@amd.com>
Date: Fri, 10 Jan 2025 15:47:55 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Fix amdgpu crash upon suspend/resume
To: Philipp Reisner <philipp.reisner@linbit.com>
Cc: Alex Deucher <alexdeucher@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Simona Vetter <simona@ffwll.ch>
References: <20250107140240.325899-1-philipp.reisner@linbit.com>
 <942c02f2-6496-4406-a73b-941d096aadfb@amd.com>
 <CADnq5_PAG662SODmS8cSg7jcyh8ZQRgcWMtgjx5RZbuUE7j3Og@mail.gmail.com>
 <6a17b4f1-5b5b-4226-b3c3-4dfa3f3c3811@amd.com>
 <CADGDV=Vfnqmdn9Hdo9e3Av66NeZD1j1iijsEnP8Dqwakey5epA@mail.gmail.com>
 <3c47ea32-eeb3-47f1-a626-5868457469ab@amd.com>
 <CADGDV=UCd3d93NtppetkrgG+pE-0EoxxXQMwjgiZPbvRBStKiw@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CADGDV=UCd3d93NtppetkrgG+pE-0EoxxXQMwjgiZPbvRBStKiw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0099.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cb::17) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB6207:EE_
X-MS-Office365-Filtering-Correlation-Id: de0f9435-0748-48ee-cac6-08dd3185c79a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Ynl1cGsyaXdtWTNpZCtId0Irc0w5ZytqZCtiSWhYcFhqYXpadTBBRmVTYjZ6?=
 =?utf-8?B?OGNNM3M5ZmhldkROMXVtUFJvaGZZZ1czb0JIc0J0NG5obDdLM1hZa256ZTQ2?=
 =?utf-8?B?ajVmLzRXdXZuOERlcC9naThHWHJkc3BXc0F2aE8rY0FwL2tabnVCRnFMUnkr?=
 =?utf-8?B?dlpZc2JLenFJNFJ3eHVxaGFmTkJzNDIydXorVEM4TnpBaUt6OWtFTTJ5Mlhn?=
 =?utf-8?B?TVpPSHpzVk9DdGU5T2l6K0VpQVR3WVhQbFl5Vjk4WVI1TmRwQ0M5WTA3SndG?=
 =?utf-8?B?d1hla0txTnlQVHFxNXl6c2x5QjFZakU5Q1FMY1NoemkvdzBzUVYwM2dsOXFK?=
 =?utf-8?B?N2Z5MnYvWFhIYTBXMmgvV1FLTXgrVFFlNnhNZDl4a3dBT1VOWktUZUovL09z?=
 =?utf-8?B?SmdXMkNHa2tmZzI2SnNVOHFSK0hMNFQ5VUN1a3BiZEFBQWtCWksvRDd4dXM0?=
 =?utf-8?B?YTdlUGtRNTNnWmJjejVSNDdWNmRqZFZrSnhrQkd1cE9wNEd4MDE4b24vK0E4?=
 =?utf-8?B?NFhjem1zdi96MkptMXRvSkVYSXF0NkpsMmR0WlphSHVjZk45RjdpUDlpZ0Vi?=
 =?utf-8?B?SUxoNXJmQWYvNFZJRFl3aGRQdG1WbzVSajJnWTdlcGZRMEJJNkcvRFJRZkxm?=
 =?utf-8?B?MEhaL1g0b3dYam9FUTErVk5kSVBqQjR5V2FadFNxaHQ5aUE0QTNjeGVYdzF5?=
 =?utf-8?B?Wk0wRi8wckhvTmxXTTNLWnNVb0dLQWp2U29kR1ZBSGlIall0R2hldENTWkxQ?=
 =?utf-8?B?WE1sOE9SRHVhSWxUb1oxZHozaXh2Q3FKbVhDQzB6R3orU0hZOG4yUGN0cW1o?=
 =?utf-8?B?aml6Q3VGSGYzc0ZOTTdZbUYyWDBkK21RUmdTNlRHZGZvRklGQTNZS2hjbXJI?=
 =?utf-8?B?ajBicVNrb3Q1aHp6eVZCb1UxWWxzQ0R0Tk0vS2gvSjh3MlFJdnJ2M0JUZU5r?=
 =?utf-8?B?OVJNOEJwQ1E1bVoyYnpHZGZWYjVXQ3FjcUE2TGRTVlNhbUY5dlpIYWsvdHdB?=
 =?utf-8?B?R0YwTDRiODRvWTdCNWVQWS9na3pHR3BrRnVjNXEyajFNMENjbm95VGZwSzlC?=
 =?utf-8?B?ZVNDeEFIdDNhaStoU0U3K25TUjNmVkxtQW9yYVFuU2ZHeExjWnhzaWxnbnNv?=
 =?utf-8?B?bHI5WDEyM0FlK3B3WEFFdlRvN01KQmVZNUVyYkhqeDdGcE8xODdHa3F6Vy9B?=
 =?utf-8?B?ZTRZTnhsS2UzZlRzMXo0M2JSSUhwQklGUFIxblU2NnBaMHFYcFBkVlpVQXdn?=
 =?utf-8?B?bWZ0THN3ejVRM2ErMDQrc2NjOUxpbkhENGhNZGNTLzRxdVFrZEl6cjIxYnM1?=
 =?utf-8?B?U2xSWVpGQ1JmMmZvRFo2VkRlOGw2K2p3ZVFZK1dGM3U2VURqS1orSTZWdk9a?=
 =?utf-8?B?ZCtjM0dCbmRra2VrakdBOHBXRTFMZitDeDJCUTk3K1NKSFo5Y3B5OFhTUlJ4?=
 =?utf-8?B?NXVSSXRremhlTlhPQTQ4TURoVnV5L1U0YldUOVduN2F3VDN2dFlDNnNlVm8z?=
 =?utf-8?B?NlFkWlp4VENrWnRWenI5ZGwrSndtU1c0blRKWDB3YmpCTHNrTWhveWRWR3VI?=
 =?utf-8?B?YjlXWURrcDhWZFN6Zk8xdHJCTDlMUGtkcEhVdWZ1TFljU1hFT295c0dHK1Nm?=
 =?utf-8?B?TFZ5UVRyOEFLWGp3Y0drMTVrUmFFNkoveHB2Q29oOEJCdkhqd0tQR0JheW0z?=
 =?utf-8?B?YURMdU14SmdUem9GNjNqeXVEM0V3Sm13UjRBb29vQVBZb1dhZWsrMDUxanNM?=
 =?utf-8?B?enhsa3d0a0pTaWgyVFFrZ3I0Unk5T1RXY2FQTEtibEx3YmhIV25mcHZmWDFE?=
 =?utf-8?B?QUsybzZ6Vi9tRGtsRlpvdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NjhKTkhpbjlGQ1FtNUh1cW5vVzVNbHRESUJmbnFiVTdpOXlsTHVzNEk4OCtx?=
 =?utf-8?B?cFRKektWeFE3b29naXdSOTNNWnpzUDJLUzZjSi9PdFV6SXhXWTIvZkJZQWRQ?=
 =?utf-8?B?VG4rR3hUMHpId0lEVTN0K3piNlc5NjFJTnBROEZNVnl5MUFwR1VJNmNMVjFL?=
 =?utf-8?B?NkNFdjJWOWo2NjVwenhqQjN1KzZPSkFobHdpWUl5NGZrbHUxOFJGKzBDb3hv?=
 =?utf-8?B?YStidmxiZUJmdzM3Q2k1Vk4yMkJKNjZSVzdHdWJiWUJ6d2VndXY3Nzc2NU91?=
 =?utf-8?B?NE5Cclk0dGNSTE8zeXh6YzZVZ1dPeTI1aGZ6T08xMDFNYWc4c1ZINzIrb1hP?=
 =?utf-8?B?cHB4blBkdXI3MHlPdE81UGdXNkdHdFpjVFArK0VsdDFQbmFxeWJzcWpkTDMv?=
 =?utf-8?B?M0xuaW5MTFVBdUJBMnNZMDVHN1NhcHNOdzNSRS9PendxL1pNNHpPYys1dmZx?=
 =?utf-8?B?L1RmU1hDcjNNMDBlZFpBY2F6aXNrV2tDb3RCbXpjd1VMd0trYzlnR3RYK1VC?=
 =?utf-8?B?dXlIOTFBVUFMVkk0RHB3eXZiZDh2dnh5dElYTHR1UksxY3ZzeDlyTnZQN1p4?=
 =?utf-8?B?ZHRlbmdVcXlGLzVHMWozcmdpTUJjV3V0ZlA4Mk1sZGFoY0w4c2RXdlhSNEJ0?=
 =?utf-8?B?WTZ0WDhZSXpUZXVLM1NMdjN6OWk4SGNWTytYZllTdjQvQS83b2pPV055VTMw?=
 =?utf-8?B?YUh0TVgxcGZueUFGbFRMTjZzQkk3OU9aZEpLUE5qYlF5UDFFM2ZoNkQ4dzVI?=
 =?utf-8?B?QVRwUWczTFBHT1FxNWdxSzJOT2R4cG8vK3hSWnZzZ3RnMG1KY0Q1M2dkY2h5?=
 =?utf-8?B?TER2M1ZaR2RyditqZmRFU1pQYnBVUDlNbWVZOGVYWEZYcXhWbWdOUGZpMmNR?=
 =?utf-8?B?UDJ6eG91NUNGR3NLUlY3UTZ3NmlJbGw4OCszV2czWGg0WkY0MzUxbVBIOUVx?=
 =?utf-8?B?N2xpOXJHdE9zK1lZblFEQk9RR3lDRmZ0QzhJSDRhY3dKMnpBbE5xdU9PYUd4?=
 =?utf-8?B?SjZuUnVFS29sR3RMTHJ3TkoxenJ0QWxhUEhWRzhCYlA0RWFzRlpFQnM2WU5H?=
 =?utf-8?B?MVAyMmNzQXpzZSs0aCtORG1sQ0hTZmxyS0FCdWlFV1IvOE8xYWpKUnhuYk43?=
 =?utf-8?B?RFZicGUxMnY5SnZqTWhSakFTSVFielJLVG1WUVBrWG9qaGppR2lTMFJFZ3Rv?=
 =?utf-8?B?QU91eU83cEgyUVdrUUw0V1BVdVRocks1SGtyVnhPSDhFYlFtQlp3ZUFVcjNQ?=
 =?utf-8?B?UnlrRUJkNWxkZVlJdTVHNkpOV2NVM1ZQWnlFZ2ZySDkwZHZxZjVGdGtUclhJ?=
 =?utf-8?B?bXg1RmU3QTk5OGR3K3NpWGNneENVR3dhVGd0WVpzVThUbEF1b0phdVVpYnAx?=
 =?utf-8?B?cVhRY0psUWVqMkpyU2dzTzBsN3dzOEtCQ3ZSY0FxWWUzYzBHcXloVEpNaDJX?=
 =?utf-8?B?ak9mTHp1L0w5UEJjbmxwb1VxOVN4RjZQaU13WFJoVVZ0WUg0V1BXbjBraHEx?=
 =?utf-8?B?UDVscGpxRnVEeE91NmxrZ1UzblFCaUlHYSswaG5uRWtTY2F2Q2U3TmpYaFpX?=
 =?utf-8?B?YjdDVk52MCt5QnU3b1E5MjloQ1lENXl2MmpmOW1qSjRObldzejNZVmMxSnh1?=
 =?utf-8?B?a0t1ZkJlbmxQSlp2ME5ENlFrdlhWSG4wbnluQWNaMk02V0ZYa2tQZ0VVMTRQ?=
 =?utf-8?B?TldJMUhLcGtCV3B4TEFpVXBnSTdoRnpZUW5UNGlMT21IOStQT3JXSDBqY0Vx?=
 =?utf-8?B?cmZ6bTM2ZkNWd0tDV2ZVeWQ2TitwTGp1TFY2dGliS0dkUlhHczBucGt1clRS?=
 =?utf-8?B?b1VTeEUvUGRRUEdvRWtaSVFqTXJZeS9tZjhJZTFURHNTMlBFK0VkVXJSZDU1?=
 =?utf-8?B?QmF0U3lLY1ZPVDF3dy9tN0RxbGphLy9PMWVUaVMyUW1oaU15ZGxnRENRc1Rz?=
 =?utf-8?B?SDVKekE3VlZIaE5QTUk3bGxicmVydFB5UDhpcENXaDhMZ29pTU9ZY0V4dzF1?=
 =?utf-8?B?aE9yVlp5UFlrMm1yYWF6cXdhWG9sM2xnekN0TzR2VmoyckVTaGdSUEkrRWdC?=
 =?utf-8?B?ODEzZVhQYmZqZSs3VTNXWktEZnByUzFtUS9rWFJCOFJPZGpvUjVoaWM0SDVR?=
 =?utf-8?Q?qhcBfCSZxXr2DykXfVs4uB5Oi?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de0f9435-0748-48ee-cac6-08dd3185c79a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 14:48:00.8921 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LDnIqgWybuqfCVGJ613Eodal0AywmTtYEhj31dv0zQ1tVe3q6/PVh72yDK50ezcQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6207
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

Am 10.01.25 um 15:32 schrieb Philipp Reisner:
> [...]
>> Take a look at those messages right before the crash:
>>
>> Jän 10 07:58:14 ryzen9 kernel: [drm] scheduler comp_1.2.1 is not ready,
>> skipping
>> Jän 10 07:58:14 ryzen9 kernel: [drm] scheduler comp_1.3.1 is not ready,
>> skipping
>>
>> That is basically a 100% certain confirm that an application tries to
>> use the device before before those compute queues are resumed.
>>
>> Can I have a full dmesg? Maybe the resume is canceled or aborted for
>> some reason.
>>
> Yes, of course. I have made the files available here:
> https://drive.google.com/drive/folders/1W3M3bFEl0ZVv2rnqvmbveDFZBhc84BNa

Ah! That suddenly makes much more sense.

Here is the root cause:

[111313.897796] amdgpu 0000:29:00.0: [drm:amdgpu_ring_test_helper 
[amdgpu]] *ERROR* ring comp_1.1.0 test failed (-110)
[111314.135761] amdgpu 0000:29:00.0: [drm:amdgpu_ring_test_helper 
[amdgpu]] *ERROR* ring comp_1.2.0 test failed (-110)
[111314.373786] amdgpu 0000:29:00.0: [drm:amdgpu_ring_test_helper 
[amdgpu]] *ERROR* ring comp_1.0.1 test failed (-110)
[111314.611722] amdgpu 0000:29:00.0: [drm:amdgpu_ring_test_helper 
[amdgpu]] *ERROR* ring comp_1.1.1 test failed (-110)
[111314.849647] amdgpu 0000:29:00.0: [drm:amdgpu_ring_test_helper 
[amdgpu]] *ERROR* ring comp_1.2.1 test failed (-110)
[111315.087658] amdgpu 0000:29:00.0: [drm:amdgpu_ring_test_helper 
[amdgpu]] *ERROR* ring comp_1.3.1 test failed (-110)
[111315.207293] [drm] UVD and UVD ENC initialized successfully.
[111315.308270] [drm] VCE initialized successfully.
[111315.447494] PM: resume devices took 2.306 seconds
[111315.447865] OOM killer enabled.

I'm surprised that this works at all. For some reason the graphics queue 
works, but the compute queues fail to resume.

@Alex what do we do about that? We could return an error when not all 
rings come up again after resume, but that will probably result in a 
number of complains.

Regards,
Christian.


>
> best regards,
>   Philipp

