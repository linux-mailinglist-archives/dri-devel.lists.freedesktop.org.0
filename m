Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1FD6B9166E
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 15:30:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5F2510E468;
	Mon, 22 Sep 2025 13:30:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Iq6MQzJ2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012003.outbound.protection.outlook.com [52.101.43.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C35910E460;
 Mon, 22 Sep 2025 13:30:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dDwc1t4EklYf5Ffl3ILVCSJ7u47tO5m2/xHTp1YoWOAsc2A+j3+4lv2Px4eauq+fkjEz3KhF9VwQccTDIWEJ1DICxLqs2ZgA1MZNGCfcQMVkgqVoBh0fazWgvS/riEw/adP74Pf5SRdoTV1eG/4oSprKWzxd9pmuf3m+C3U1ASN3Fj/uLHGzQPXTCU+dQlXBYVF+JmCJM3MH8I3qDlqWX019azE4vdsIW/N+Imhdx8CK+RndYZw84Oop7IhAwfyevNl7Jq99KR4HLa0JhEApDEGqwY4A7xwJ+V98oUS709stKPus7wGf35sdOBUp3ZKYZefZskY1RQeSjfxM4ph3mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DOVRQ9TFOKC8QaDRupGizmZn3oXltRVHh3VnWf2Gvso=;
 b=yRjtY+cn2Fn83PkkCNzb11HgEDmGyxH/467OO8QzPazUaHBhTT4Axnw35SOsvj1fk/GRDwv4AJPfN/17k3NpuirUZN7sZJ+hTBDsV5p8jgx7vNHx9o2IDyw5gwM6r1HOOK4Wuj3XnZf+R1ldP0QPNOpLdJrbUI6/ZVoGLfgQUQ+yOw+wpWO1kZCYUsobsFvrbSc5Ev8TBJxEtgQL2hpUsGPhMK1woDgrF+NtZTOLAVHohNKiGhPrdhkcobiYujwzBPOClnnR35Rg9GUdKRXt9WS9mpqdvAeliVHEF8H8Pzm0ydUSNQX60sESJ5JftiCDvoylWFfnVFHwk5ZZwo2i1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DOVRQ9TFOKC8QaDRupGizmZn3oXltRVHh3VnWf2Gvso=;
 b=Iq6MQzJ2PRc6Vno/6YQ/Ou1cZM27AO8EAS6sLTjH932PUvkw5EaCxxkjOy0mfJlQAlg0gVJOF2ug53dBxZkIusoz4GMZTnekTTHd5335tvHZxFNOC5lin+j0NM7WGDy+pmYqhHRBiaAbW+Jcg5tnTDBWRPzQyPl0FkGNGuCA4Ew=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB7353.namprd12.prod.outlook.com (2603:10b6:510:20c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Mon, 22 Sep
 2025 13:30:06 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 13:30:05 +0000
Message-ID: <b2304183-ab37-4fb7-8e65-cffb4fcb4542@amd.com>
Date: Mon, 22 Sep 2025 15:30:00 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 1/2] drm/ttm: Allow drivers to specify maximum beneficial
 TTM pool size
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
References: <20250919131127.90932-1-tvrtko.ursulin@igalia.com>
 <20250919131127.90932-2-tvrtko.ursulin@igalia.com>
 <febddc1a-afed-4c32-912a-38f465d11ce0@amd.com>
 <90e2941b-9efe-4d55-9d94-f4d111ca4679@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <90e2941b-9efe-4d55-9d94-f4d111ca4679@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0421.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d1::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB7353:EE_
X-MS-Office365-Filtering-Correlation-Id: 402aaba5-0749-483b-a2fe-08ddf9dc241b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WXFzNUJVcldLVW1KWDBjaDRnanJRQlp0amRkcExiTWRWY1hrbndZeVhCQjAv?=
 =?utf-8?B?Mi9VN0hNei9wYXdXSk4vZnJjTWw1MGtqRURoRGdVRFR0M0lnamNLUVNlMnhr?=
 =?utf-8?B?Qm84VVJxTkF2TlhBajQrWUxLVUZuSjdVd2t3TFh6SGVPTGI3bFV0emZOem0x?=
 =?utf-8?B?VkNlUGYwNEhIOVBpODc4ZDB2VjlRbWNyK0R5UFBuT2dsMitGMGxuZDI1MGhs?=
 =?utf-8?B?MVpTeEd2cjg0b0t4cGRIY3VNcGx2L3JXNzRvNjVyNTlEeUxrUE5RV2hsM1pa?=
 =?utf-8?B?S0lNQkxIVXhLZGxEUDFPSSs3R3dMZ040bUF3TGdQVkxhclNETFJTTFRaYkhU?=
 =?utf-8?B?UmdqaWt6OVZDVXQyWnZDQ0JZOVkySlRMZmNJUG1HcTA2SU9PMHBzYlZCRldM?=
 =?utf-8?B?Q1puNWl6bWJ4dHRoTWNiRE9oOHR6WmJlRzh6emlqSWo5S01EWW9WUmZXTHVJ?=
 =?utf-8?B?RGZVM1p3TTdPb3pMdkVFaEJKRW51emRuT2pHMUE5NmhxMDV0T3ZBR2UyNUcy?=
 =?utf-8?B?QzRpNnlPS2pEWCtKaU13U1VVQkhTTmVzUjlYN1ZwZGk3MUJKTGFsY0V3Tkd1?=
 =?utf-8?B?Nm9jQ2Zxay9BQ0FFN0IwbU5aampFM3RJSjAyclg0N0FtVHI0Zlp3NSszaFVX?=
 =?utf-8?B?bVYrNkdLU3N6YmRkK1F6cW15MC9ZYS83TFMyYXk2WWVjTzAyNkZCbWxBTm40?=
 =?utf-8?B?RjJldFN6UDlBM01SRjF2M1I5Zm9lQVRiR0t1U0pjSURrOG5XWWhVdU8xeHln?=
 =?utf-8?B?L3cvRWhPbWlGTzNJSlJVZ1FZelhVY3B3UDQ1RVdQU1pJZXZQN0FrcCt3NG9s?=
 =?utf-8?B?ci96U3pzaWd4bmg3QzN6ZDFmOHRmaUVDcEtadXVMdkJBbStPMkJhcW1PZFl3?=
 =?utf-8?B?MXQ2MXB2WDl0R2s2UVhyNytVVTdrQ0ZkNUQ5N3J5b3F3QXBJWlQwRkIxTENN?=
 =?utf-8?B?WG1QL0p0RGR1dmpQK0RNYWpXZ1M1emhFNU9vVzdMSU1YaTI3dldHa3ZWdkNj?=
 =?utf-8?B?OTlDa2VLN1cvQnNmZERMb1BvckRsdGpjYXQ0YUkxUkljNWNrRFRNd2k3ZXhW?=
 =?utf-8?B?N1FzS3I3d0JyOFNqLzNRZXpnVFFiTDBUSFJiUTB1c3ltUTRZNkMrdFkwMkVI?=
 =?utf-8?B?ZmFhVSt6ejYxM3BzcXVoNjhOUTNkSXU5UEt4czFTNE5RS050WGY2Tm5Dc2lU?=
 =?utf-8?B?U2h4S0p2MjdWY0JQbmlmMHZjc2hiRFl6azdpalZHcEZaRHJUdFI1ckpBZ1JY?=
 =?utf-8?B?M2J4b3RkY2hwRjlpRkNwN2JaT3pmb3A0dCtSbTgveWpQKzREdDVOUGxFZmll?=
 =?utf-8?B?OVhZcXd3UTQzUTRMdWcyZkx0bUowU0dWUE8wTHdTRFVCWGNqVzNReWdLNHFW?=
 =?utf-8?B?emYzTWg4SEg1b0lBckpFT0Q4QWVrWlBhUXJaejM2OHpQTEdOd1dNTkIwNEYy?=
 =?utf-8?B?cDVwRitGNStSL3hpb1RKcGFQY0VJU3FWZlBUc1dVeWpLcnNJYWY0TFdmN3FG?=
 =?utf-8?B?QVI3NTRUUlhTQkJXNXlNR0JJOE1hbWM2cGdHRGxLYitXbE03NWRHUEtPemFK?=
 =?utf-8?B?bFFZMXFqMWg0T1ZQSzF6VEtPZ1lxOVI2SjQ5Tm96STJ0dnB1QWJ4cGc0aHR6?=
 =?utf-8?B?Z1p3Z3FVQlZ0b05JUW9YU1E2VzJqZHgxTkxFdVBkNFhlNkNxMjZNSTdFRDBT?=
 =?utf-8?B?U1BkcmdPdEY2ZGZhZzAyYnJhVmxsZE1RUS92eXlWbGJ2K3BPSjJYYkNzbzlG?=
 =?utf-8?B?OFNVWnhBMGxwTnZ4dERLYjlYNkg5R1pJQlNicGQxZXprNElldndiS3NCWTVM?=
 =?utf-8?B?dnlnVEVkTTZ6eFVieE5aR3djUEVVOTZqNW15ZkpzNmZsT1Q1eVZkTy9Gb1Ar?=
 =?utf-8?B?QjF4OU1ZcmI1WEYzZWRKdFJ1RlZXRVpZWHN6SHFsM0RCQUF4aWVNRDdzYzJI?=
 =?utf-8?Q?e5I09g3LF8s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eXBrQ2ppTEo2aVJGcy9HRkJlN2NkbG1lU25XQU9yQ0lSV01YUVU2RHg0VEFx?=
 =?utf-8?B?OXl4VXFYMm5wSUV3eklscGhtUDNJdVo4dXFNNGNIaVYzWno2eDdZMHBDMkNL?=
 =?utf-8?B?TGV5MDhya2doRnpOS1kyOGR0TFg3dUJJd3lIRVh2NVVHLzNQNzVPU1VGYkdC?=
 =?utf-8?B?QmwvcDJkckxGU2NXcEp4VDRPRGJhNXJnYmViS2hLSFo1Zk9Bb0VLSno2M1Fs?=
 =?utf-8?B?STBoSzZtZU5RV0lmQjk5SEVOWHgvMEFPZmR2ZnpBdWRKM0ZHdXlHQmhOdHhT?=
 =?utf-8?B?bitETi9DRVEwQ0ZxY3lRV1N3elZObTY1OFFEV1pNSG05aWltTHMvTVZnSXQ0?=
 =?utf-8?B?czF1VGRKREhnem4xajl5QUJkbFJXaHpDSzluTTRPVXRqRG9vSHlCS3AvOE5I?=
 =?utf-8?B?MXZ2MWZ6VVJmZkRiVjY5M1JPTktsRU9MV0Q1WENtZThDZGFjMzNramRxYUli?=
 =?utf-8?B?S0RVL0pvTitJYjF1RW1DdGR1SGRFL09aT0JEaTZJZkNTcVFlSm9rcHVzYXdz?=
 =?utf-8?B?RWtNWFBqQnQ0V1E0YXBtNWVxQVREdmNyejZKemZHOGNtdjBENXNFZ3dZcXFK?=
 =?utf-8?B?TFZsVVI0OU9ubFRiWHVWYWx2dVBRdXh2SUxMeUVmclUxalIyT2VtQkFDSzEw?=
 =?utf-8?B?ZzF6bGZXYlVNenRMWkJSSjF6VWRPTjRqWHgzNXR5dytDMCtoNkFNQWZ5ejhJ?=
 =?utf-8?B?SVZydHRJVUhwVDMrNXdNYUJsN01oNFYrd28wRlZ2UEk2a042YnI1TkhrOElF?=
 =?utf-8?B?ZXdLNjBWYlBPb1M3ejExQzJrR0pHSmR0cVloVlU5Uktza2lwOForSklvUlNw?=
 =?utf-8?B?aktIL0VhUUFKS1RSL3I2OTREdzV5aWdYSHJmVkRieG9CUElhQkNYUWF2cVlE?=
 =?utf-8?B?Rk1RMUhjZVNNNy9OZythN3NmQ3pIdGhvaFBmNS91VDNEckhwRlZCY2FtV0Nz?=
 =?utf-8?B?UlUxWTB3ME95cDF6TWQ4NVAvVytZekdUYmJvdEJRZFlweHVEcC9OMTUvbHk3?=
 =?utf-8?B?aG81TlV4c3BsMFo4L3BvRkZGdzc5WFY5MXQwUzQrdUNTTWM3Y3FWU29KZnU5?=
 =?utf-8?B?N1oyVDhQTlNITWIyWThwU0srTDFGZE9YL1pWcUlSa3ZRblEvZ2IyVnc2NHhL?=
 =?utf-8?B?UEJMQ21ZWnk1THdaTnBoMmF1Ly91cG1CRENsNVRkckt2NDMyZ0RSTmRpQjBG?=
 =?utf-8?B?aW9IRjM0MTNhZWF0SmJ4K0MzL3lNRU4ydnJZZldoa3VIR1dSZkVRZjdZUUd2?=
 =?utf-8?B?aDZlU1JqRFdSbEgyL2dDcEY2L3dqNkVCSThibW5RbXY0NGUxQXNJdFlzTHNx?=
 =?utf-8?B?empTUkp5VExqMU1vVWNVZzZ0Q095WEZQY00zYUhGNDd2RE44NG1tMWVlbzF1?=
 =?utf-8?B?NDRRNGM5RWdqWFM5N3lvWHh3UnBxS3FLcXd2SEdreEFlQnhKWlV2T2lXcHNq?=
 =?utf-8?B?NDhhYmN0VmwzSytyVGxjeElJSnZ4VUhlVDVtM2diU0pJKzk5WndsaEJmaHpH?=
 =?utf-8?B?SDRtbUVtUnpZRVNIZnE2NnlaYmRUUjRCa1NDNmZSS21lRnROR1pXTTZNOEh6?=
 =?utf-8?B?dTJiMzEvWmdEU1BTbjZzejdHYVFBQlZoR1FodGhhQmtpTFV1aDhvbUh2c0tw?=
 =?utf-8?B?M1BTM2hQbnRuUDhhMnRtNUorZFBXYmdzbTI5VkxMSWFWSnA4a0ZwWG9wUUEx?=
 =?utf-8?B?RWl0VHVXWkFhNXl1a01BaFNMZ3NnVXpsUkMwYy80MHBTQlRVWkg1VXhHU2xy?=
 =?utf-8?B?QkdUaHdHY1VEWmNIQnB6QUlCc2h0eS8wdXZJM1kzNXZHS2VESy9taVl1bkln?=
 =?utf-8?B?YWdWU1JTdjEvVzZXcGFqaHBIM1BpMUtGU1RzMStia1NHUGJ3UFI5TW5XOGRi?=
 =?utf-8?B?YUwyTk5xRUlVTUM4NHlhZ2RURUs3NU5jbm50TllzUHVCSVY5alV1a01UWko0?=
 =?utf-8?B?c3FaUmlzYnFKNEpYbWo2V0tBbHpuT0dnUUNBaXlwaGFIZlRnVGZZZXpxWVpJ?=
 =?utf-8?B?ZlB2YmRjMm1PMk1NbVdyYTFCclVFNDd3UW85VCtiaFZNM1BieUFRblRZR1BP?=
 =?utf-8?B?dWd1MXZaWm9sNUl6NWh5b1F6bVgva3VmaDlDSTNmTXJaN3poMDBqUEtPZWcx?=
 =?utf-8?Q?dEBzsPmhf1221/sDlS3HEMxyz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 402aaba5-0749-483b-a2fe-08ddf9dc241b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 13:30:05.3319 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4xZqzcMFif0luyUu7S6wGLdG8hwwXlwyygmt+7ubSXueePS/XyWMC6re6myanuw6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7353
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

On 22.09.25 14:49, Tvrtko Ursulin wrote:
> 
> On 22/09/2025 10:31, Christian König wrote:
>> On 19.09.25 15:11, Tvrtko Ursulin wrote:
>>> GPUs typically benefit from contiguous memory via reduced TLB pressure and
>>> improved caching performance, where the maximum size of contiguous block
>>> which adds a performance benefit is related to hardware design.
>>>
>>> TTM pool allocator by default tries (hard) to allocate up to the system
>>> MAX_PAGE_ORDER blocks. This varies by the CPU platform and can also be
>>> configured via Kconfig.
>>>
>>> If that limit was set to be higher than the GPU can make an extra use of,
>>> lets allow the individual drivers to let TTM know over which allocation
>>> order can the pool allocator afford to make a little bit less effort with.
>>>
>>> We implement this by disabling direct reclaim for those allocations, which
>>> reduces the allocation latency and lowers the demands on the page
>>> allocator, in cases where expending this effort is not critical for the
>>> GPU in question.
>>>
>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>> Cc: Christian König <christian.koenig@amd.com>
>>> Cc: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
>>> ---
>>>   drivers/gpu/drm/ttm/ttm_pool.c | 15 +++++++++++++--
>>>   include/drm/ttm/ttm_pool.h     | 10 ++++++++++
>>>   2 files changed, 23 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
>>> index c5eb2e28ca9d..3bf7b6bd96a3 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_pool.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
>>> @@ -726,8 +726,16 @@ static int __ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>>>         page_caching = tt->caching;
>>>       allow_pools = true;
>>> -    for (order = ttm_pool_alloc_find_order(MAX_PAGE_ORDER, alloc);
>>> -         alloc->remaining_pages;
>>> +
>>> +    order = ttm_pool_alloc_find_order(MAX_PAGE_ORDER, alloc);
>>> +    /*
>>> +     * Do not add latency to the allocation path for allocations orders
>>> +     * device tolds us do not bring additional performance gains.
>>> +     */
>>> +    if (order > pool->max_beneficial_order)
>>> +        gfp_flags &= ~__GFP_DIRECT_RECLAIM;
>>> +
>>> +    for (; alloc->remaining_pages;
>>
>> Move that into ttm_pool_alloc_page(), the other code to adjust the gfp_flags based on the order is there as well.
> 
> I can do that, no problem.
> 
>>
>>>            order = ttm_pool_alloc_find_order(order, alloc)) {
>>>           struct ttm_pool_type *pt;
>>>   @@ -745,6 +753,8 @@ static int __ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>>>           if (!p) {
>>>               page_caching = ttm_cached;
>>>               allow_pools = false;
>>> +            if (order <= pool->max_beneficial_order)
>>> +                gfp_flags |= __GFP_DIRECT_RECLAIM;
>>
>> That makes this superfluous as well.
>>
>>>               p = ttm_pool_alloc_page(pool, gfp_flags, order);
>>>           }
>>>           /* If that fails, lower the order if possible and retry. */
>>> @@ -1076,6 +1086,7 @@ void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
>>>       pool->nid = nid;
>>>       pool->use_dma_alloc = use_dma_alloc;
>>>       pool->use_dma32 = use_dma32;
>>> +    pool->max_beneficial_order = MAX_PAGE_ORDER;
>>>         for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i) {
>>>           for (j = 0; j < NR_PAGE_ORDERS; ++j) {
>>> diff --git a/include/drm/ttm/ttm_pool.h b/include/drm/ttm/ttm_pool.h
>>> index 54cd34a6e4c0..24d3285c9aad 100644
>>> --- a/include/drm/ttm/ttm_pool.h
>>> +++ b/include/drm/ttm/ttm_pool.h
>>> @@ -66,6 +66,7 @@ struct ttm_pool_type {
>>>    * @nid: which numa node to use
>>>    * @use_dma_alloc: if coherent DMA allocations should be used
>>>    * @use_dma32: if GFP_DMA32 should be used
>>> + * @max_beneficial_order: allocations above this order do not bring performance gains
>>>    * @caching: pools for each caching/order
>>>    */
>>>   struct ttm_pool {
>>> @@ -74,6 +75,7 @@ struct ttm_pool {
>>>         bool use_dma_alloc;
>>>       bool use_dma32;
>>> +    unsigned int max_beneficial_order;
>>>         struct {
>>>           struct ttm_pool_type orders[NR_PAGE_ORDERS];
>>> @@ -88,6 +90,14 @@ void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
>>>              int nid, bool use_dma_alloc, bool use_dma32);
>>>   void ttm_pool_fini(struct ttm_pool *pool);
>>>   +static inline unsigned int
>>> +ttm_pool_set_max_beneficial_order(struct ttm_pool *pool, unsigned int order)
>>> +{
>>> +    pool->max_beneficial_order = min(MAX_PAGE_ORDER, order);
>>> +
>>> +    return pool->max_beneficial_order;
>>> +}
>>> +
>>
>> Just make that a parameter to ttm_pool_init(), it should be static for all devices I know about anyway.
> 
> I wanted to avoid changing signature of ttm_device_init().
> 
> But if will be are churning those, should I replace the two bool arguments in ttm_pool_init() and ttm_device_init() with a pool init parameters structure so two nameless booleans in a row are avoided? I do not feel strongly about it either way though since there is not a huge number of callers.

Well we recently have figured out why we had to use GFP_DMA32 on all the older HW generations and 32bit boxes. The problem is that nobody has time to look into that and setup a test system so that we can finally remove that workaround.

The other parameter should probably be replaced by using dma_addressing_limited() on the device so that we have that consistent for all devices as well. But here again nobody had time and interest to do that.

So when we clean that stuff up then let's to it completely.

Regards,
Christian.

> 
> Regards,
> 
> Tvrtko
> 
>>
>> Apart from that looks good to me,
>> Christian.
>>
>>>   int ttm_pool_debugfs(struct ttm_pool *pool, struct seq_file *m);
>>>     void ttm_pool_drop_backed_up(struct ttm_tt *tt);
>>
> 

