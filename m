Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB854B2C08C
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 13:34:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FF5310E5B6;
	Tue, 19 Aug 2025 11:34:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="kgtDK34S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS8PR02CU002.outbound.protection.outlook.com
 (mail-japanwestazon11012036.outbound.protection.outlook.com [40.107.75.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1259F10E5B6;
 Tue, 19 Aug 2025 11:34:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uPHZ8R6O2eVhuCE8CgbHgcuzotBMtseyh8QNQ6CoQzUWQ3/DvnvUH5Iz+La79g0iedEIgyEUmn51DcDqPzRNfkD3og6XdpUDWIqPVqPq/d6N8fKjp7HAnPzw7/ZnXwxYgbcXvyd/GcwzPqa8n15TbfbpP3VkCdhAvTAVlaX3/WwSAq8aLlyAj9jsIyzeMnvLOSsc3rdtdXbz2I9V1D3sYWC4qWasulKgEZic3Hm1P/9K7dFNwJBo63YdWxkPbnV8Rt2QFg3r1nSbNNZ+XkhZe0NJutYSuh623CBJN5iQLW8DpqJa5klIDsaFN7ZVAnp6FEy6ypa+vL7hgJxykbDoIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=arF6adx1L7z6SEIoBwblCJnfgK/aPpfhMaXNn5vX5d0=;
 b=P5lOWPhCVmUhkKvMrvCR5kU12O7q4GCPlZaUB0aYe6pL2GTjaj6esprkHzfxORKAYrVQSPzOqspfmz0aSnz815DI40BUMRHXW9lx9o/jQ5KK6XTW14povau42ULslY+CKutAkEbf1HeRsRnxdlEGkFfTPlaIKzYwkhXG09PpTWeFEuf6gDe9sMBHXCFifqYmTU5wnXr559DRyH3TBlgQ8QINqFlWHwu0t1mhlRv53bG+nHtpg9VivDHigK2gCjl/vIOIaBfEF6qR8X18e3Bbm10kWB5UvwfrjPenlXy98XOlzkDUd/lTW6ks5Tu98z6vVII+Lk7xU9c6kN0v40lUCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=arF6adx1L7z6SEIoBwblCJnfgK/aPpfhMaXNn5vX5d0=;
 b=kgtDK34SHQ3i6UmzL5fm5JyLiTYpxVtTneUun85zKuSRRsLGNXEjkGGPf+7UAwa84+p1rOnN5XAhlLUVsLZmexwl7U50fhas2Cyn7rck4bGqWwZERATNCU/3DevQBOvj89VFF+/AhyGB8g/tag+m2wW5/xfwsdK+c5tqxZb+yxhyJY0y/IDgDUY56QtubYiEj5bWE3QeYr934yHxFZyKpvV4fUiV3EocwyklvorT9+aCc2eOAXVhqju//v0ORNuhnTX7adWBxfVjeHeXCrqX+KscO1fvk1qFXG5n+r9LHl38ICbmWWecWRhprIX9QUXB5lGNVSzRx4mqzGc8kWrBQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by KL1PR06MB6710.apcprd06.prod.outlook.com (2603:1096:820:fe::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Tue, 19 Aug
 2025 11:34:10 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%5]) with mapi id 15.20.9031.023; Tue, 19 Aug 2025
 11:34:09 +0000
Message-ID: <2c2b72c7-a3e1-4578-bd8e-872b20b7aa80@vivo.com>
Date: Tue, 19 Aug 2025 19:34:04 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu/fence: Remove redundant 0 value initialization
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <20250819082524.526572-1-liaoyuanhong@vivo.com>
 <00e7ce33-cc0a-4249-ac18-081ab9ead243@amd.com>
Content-Language: en-US
From: Liao Yuanhong <liaoyuanhong@vivo.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
In-Reply-To: <00e7ce33-cc0a-4249-ac18-081ab9ead243@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYCPR01CA0005.jpnprd01.prod.outlook.com (2603:1096:405::17)
 To SEZPR06MB5576.apcprd06.prod.outlook.com
 (2603:1096:101:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|KL1PR06MB6710:EE_
X-MS-Office365-Filtering-Correlation-Id: 15007fdb-6a93-4dd0-4034-08dddf145027
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UVlyc1JCalEwUGRzZXg1L2NnYnBuNnJpZzRVanFQNjFsSUltTWZjcUsxUzYv?=
 =?utf-8?B?eGczemFVbDdwS3YzSlBTS1NJMVdFN0hJR3drTHEvemFKVTFWUzhBbytDVFVO?=
 =?utf-8?B?V0RyWmVKZ0x2bDNGanNjckZ6Ti9HYW1vNGRJMncxeHkxcUVrOHRRRkIyVlBM?=
 =?utf-8?B?d1ZMODI4R0RoN2NLNXhjU1Zid0t3L3lpSjdXdHY4ODFpZkovZENXWW0zeFhB?=
 =?utf-8?B?bUpoMCt2RlZZVEZmSVljRGFNYk9GSjdZVy9DYzc1NWlublNOdnBFN3djZUpz?=
 =?utf-8?B?RWMzRThobzVxc21kOUZSUDFZc3NZdWZLUm43SS9lc3dTL09lQ0gzU0J0bEJJ?=
 =?utf-8?B?NlQzdzdYTTJaemx6eUJaT0FUOFZ5YmxmcFRYQytTTEZBT1Z1MHFRNjFBU01V?=
 =?utf-8?B?RmNUa0xoU1QrSlg0eGlCb1p1S0cwdWMxZDZHdWQ4U1B6UXJ0blVxMTB0aGZH?=
 =?utf-8?B?Tkx5UDRmSjVmNC8xVUVoVDVXUndOQXUvUmZhZm10Ync4TGI1QkplRnc0dlMz?=
 =?utf-8?B?amxKVmtSZEl6L1JxZGF6bXRGNllaU3UvMjN0d044cElHYnUyNHJjM3M3Q2hw?=
 =?utf-8?B?S1lYclpEam9PR2J6SVpRelFieW83Z0FrTFhScWc3QzQwV3NKUlVTY29LckxE?=
 =?utf-8?B?VUZVeGtlVTViNWdxQWdZeWJjSzBzOTZzaFJqK05FZ2tvZFdxd3NOYmhHVVFJ?=
 =?utf-8?B?anQ3L1NJTWZCSWxBa2VCOXBEVEtBMGN4cXVmbjNRdjdSVHpmdUNLT0hlSDlh?=
 =?utf-8?B?clR2cDFLZHhEMWxMalRIN3VWdWhxL0JmcC9sdUdTQ3p5ZjBWSURvaDFyVVRF?=
 =?utf-8?B?VjQ4ZjFqWHk5NjhRbFRidVkvcnh2RUVlZDdDeWJ2bmVtTkZCTUc0TFBNc29u?=
 =?utf-8?B?UDBLZEpZZTEzdFhXTWdic0l1QlcreEdFcU03bmZscTVBWXRlSzBIQWtNRXpQ?=
 =?utf-8?B?aFVQZWZUZlF6NkV5a0daeVFXKzR3bmNMR25aaU1wTDRidnhVd0NvVFhVUHpL?=
 =?utf-8?B?Q0N5QnBPeitZN0Jwd2krWm1kYUkyOVhJcEFxeWJKSElvenJWMkM3M1JxcElt?=
 =?utf-8?B?NnY5dGdsNFVselNTU0IwYk92UEp4VmU4S3NqTFRTU2dIdXRxeXo5V3NUR1FF?=
 =?utf-8?B?SWYyamV5eitjanNCT3FBcHJ1U3BLeXUzMGlmcDl6c01kTVJ5UEc5WElyVDds?=
 =?utf-8?B?NkhKc1hBL2RYTHdGbVFUTjZySWNoUUwxbjFzNmZNZmlJalNSZHN0SkF4SWxD?=
 =?utf-8?B?aUM1K2VraWkxY0V0UTVWQWhVUjkvQTNUTkFBc2xPWXRZanE5ZWFLbzI5eERE?=
 =?utf-8?B?L0FnM2QrZEtqWlB0cng5ZDZFeHFJcXBkOEg0aG54YXNTdjVHWWtqdDVLYnJH?=
 =?utf-8?B?VjA3OEZWQUUvL0xDeERaK2tVYiswNWh3VFQ1c1grNkFXV25JbGYxT3JHd1JE?=
 =?utf-8?B?NE8vc1pxeFNSWVc2V1dSa0wvci9pd28vTmQrMDFjb3RPZDMydXVQQkx5a0Q1?=
 =?utf-8?B?L0hIWk9YYTVvb2w2LzVqaWpRSnZWVDdTWGRkNW1QMHVvNXp1RzZTZGtrQXVX?=
 =?utf-8?B?WU9VZWlsSWRGa2s2Y1JkdzJ6K2lOZkNPY3B3ZDNqNEVPMEx5dEY5ajUzVklh?=
 =?utf-8?B?NC93OGM2cXBUZjgvTCtNMlYvcXNKRFpWSjBuRllUVVFEUzJIZmtjd3RydUJp?=
 =?utf-8?B?ekJ3SDMzL2JXYmtKTE9LYVlJZHo5NjhZVmlQeTVqMDZMaHNuLzNrRVpuSGVY?=
 =?utf-8?B?NVdjcDhxaGFzcyt3eE55aVhhZkhnelJTRFdzMVpnQ0hFMWlUNTNhdk5Famx1?=
 =?utf-8?B?T2xEM1FsQnRMOTkyZ1c2T3pyTExrRElpNkVtWVVoc3BwMWNhYTZBV1VmelJw?=
 =?utf-8?B?VmRqbEVLdzVUUDM3VTBaMlEzd1NHVThDVEdhc1JYSTAzRThxQThRa1J5bGZa?=
 =?utf-8?Q?lP8uPLGggOc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5576.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eXlEbjBYVHc1T01tMUZySENuR3pYVm93OGhNNWxQTEh1U2JuU3NWTFdSNjlt?=
 =?utf-8?B?OEM0VU1oNEs0Zll2YzFnSGlDSXhCbHU4N2hOazR4anpsaUxEdEcycnlCaGZQ?=
 =?utf-8?B?L05EZGNnaGY1c3JvTXVFV2xtZ0JYU2ltdGZzUUVMNzRON3hNbVkrOWhzdU1a?=
 =?utf-8?B?WXl4MkFNRld1UjNLUHFEOFBaZGp0cUxKWDlCSVdQbUtxRG9tRlRDWFl6Ymdh?=
 =?utf-8?B?ZW1zL1l1Mit3UHFkaThYSG83YmRtRFY1TFVnSUdpQjZDd3JsaHVBeWp6c0ln?=
 =?utf-8?B?VGp3dkFZRldSSUZNNHpMck1DeWNEOGtZU2Q2Q1pjZEI5Tm1nN3VRUGNFL2lw?=
 =?utf-8?B?aUpyaTZTcWNPcUc0WTc5TGxaSTE0L0xKT3hqYk8wTGhhSno0dFhNOTRpbkg4?=
 =?utf-8?B?c3VQdzV0QzZNam9OQW9vNkdjYjNWY2NxUkVLMkVTZkZPcjBPTmZpeDR4NUh0?=
 =?utf-8?B?aGRzNFpibHFRY1BKM2h0RnZXYlhEaGcxRGFRcDFydS82NU1yU2pnclcrMWZa?=
 =?utf-8?B?TmZMajZHMm0zUEY2MDhVRDFmaEdVdnVwdUNINXdCbzZCY2Fnd1RTcU4rbTdK?=
 =?utf-8?B?bFBQT2YrWjlYdDQrZEZwM0tVZ1ZPVDZyeEE0NytoTFlKZWRYWkVzeE1hL0pN?=
 =?utf-8?B?ZEdVckdsd1lTYnI3ZkhWdHpldFJrTGx5UVVoaEMrWE9Ba08wREo1Z3VRTVpu?=
 =?utf-8?B?SGZ0dTRacW94VEdoSXMvNE5ONFlxTHd4aHdXK0RWK1FDOTZ2d1YvODBRVkxO?=
 =?utf-8?B?WHExM2tVVzgrZHpIcEdzS2FMUVFobWpra05NczN5NDExUEVUMmFadngvN2F5?=
 =?utf-8?B?MHJrQ20vRWxRTzQwWmc0bVE1b2g0L0I3RHhOa1IxQzUyL1dUOVl3SWJqUkFh?=
 =?utf-8?B?ejhRYVlrLzVxWVY4ZnNkMWJkeG9kOWl3NFFwWFV2Q1dKVGNoV0YxcFdCTHh3?=
 =?utf-8?B?cmE3SHZDbmtTRm9iUEVzSGRqYmhXNDYrOGtUUGY2QUhZUisrMlE2dWJuaUVS?=
 =?utf-8?B?bkFQcThzc2NndS8vVTdnaXhxMHFSdVlObXZRSkxTTzNBOWh2RzZCN1lXVVVk?=
 =?utf-8?B?UTNZMzQ3SlRQakZjaG5LdDA0ekRlWW9McnpGdjNScHI5M3FRNm4rRjY5NGpL?=
 =?utf-8?B?c2J3Y3JodWxVNWJmZ2ZtajAzdHFSTDNoSFZxN0FiY0xEV2pleGJXQ1lUSXlS?=
 =?utf-8?B?aGVSeHA1NXFMRGdLSU1DcWVuNEFMNnVodGtPQ0RZOFEwT2NmYVpucGpvemd2?=
 =?utf-8?B?UjRtVnZBYkdEYWt3VlZESGhvdDZCa3BVUUk1N1JvV1czazNnaHRVTE1Td0kz?=
 =?utf-8?B?elQvaWFyOVNabThKWkppV0N0bEQvbUEwUzV2UWw2RE43RkVPNzlYdXU5TEpu?=
 =?utf-8?B?YmtpT1ZYRVhrWk05bVNkc0RBYitqSGFldGZQNVBDYnBtNTBqQnBUdEtiQ1ZN?=
 =?utf-8?B?R29zdzQvNEdGTGpJRVpnOVl1WnVsVE9JTWMrL0R0NGVzOGhYTDNaTytwWnNT?=
 =?utf-8?B?aVBMTXZDNWkvVW42Z3M2UExLQzNTcVRBZjNMbW9vZGhPS0VrVlZKV1VBYjEy?=
 =?utf-8?B?ZHBpeXVoaWxobUdMNnAyOWl0eVpJeXdKVDFuWDd1czhCYThnZ2FiUW5abDZv?=
 =?utf-8?B?VWF2dkk2bnl6alpHcHdjbWoyakNLUEJ2QkNVcEs0bmJWbjdadllaZmdNT0Nm?=
 =?utf-8?B?eEV1OE1RL0NEY0hrVGhDb2ZuWDdYU09hVWNrL095K0xQczdCM2F1WFppWlpi?=
 =?utf-8?B?aVNOT2JEWlptcFE2dUUyaW1jaEc5ZzJKZlVzQTVoWENOaFhDN1prS0V1OUx4?=
 =?utf-8?B?c1BrMnMxVzR6SXZYZG9xbTFJM1FZalZpR3dVenFMUll4ZEJCSUI4YnRIbEpD?=
 =?utf-8?B?Y00vK1hXRmY3czhJdlpuQVNDWDZ4cWdkeUl0c3NPWkgxMkNlTXo2cHQxS0Fn?=
 =?utf-8?B?QWlRcjh2MUFSVmFIbkhKcW1rK0crQ3BINDZrV0RhZWNCZDYyUCtUaUpnUTJl?=
 =?utf-8?B?YUM0aUh3Wk13V3F2UjdzRlBGb3o4ZkxVRHB5SXBoMkNxeVJZQXNQSWZhR3Ba?=
 =?utf-8?B?aCt1N3V4Sk0xNHJ3allhem9tR3Jhc0h4QnpTTmpWTC9HQ3AxV3E5NThUYTVt?=
 =?utf-8?Q?KK1+KcK3QtP2h4aPRbKc/rdOE?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15007fdb-6a93-4dd0-4034-08dddf145027
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 11:34:09.5770 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z9jOKhHeF569DNz5SRYk0unef1X6Q82ztO3nkvS/ZZBXXc6JePX1Ba65yeWItspdACjLKbSSOPamz23M7Q3rQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6710
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


On 8/19/2025 4:41 PM, Christian König wrote:
> On 19.08.25 10:25, Liao Yuanhong wrote:
>> The amdgpu_fence struct is already zeroed by kzalloc(). It's redundant to
>> initialize am_fence->context to 0.
>>
>> Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
> Reviewed-by: Christian König <christian.koenig@amd.com>
>
> If you want a challenge what we would really use is a scan of all the structures defined in drivers/gpu/drm/amd/amdgpu/*.[ch] for unused fields.
>
> The UAPI and BIOS/HW header files are full of padding fields, but there shouldn't be any in the driver core defines and we sometimes forget to remove fields from structures when they are not used any more.
>
> Regards,
> Christian.


Thank you for your suggestion! I will try to find it.


Regards,

Liao

>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>> index bcb74286a78a..fd8cca241da6 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>> @@ -120,7 +120,6 @@ int amdgpu_fence_emit(struct amdgpu_ring *ring, struct dma_fence **f,
>>   		am_fence = kzalloc(sizeof(*am_fence), GFP_KERNEL);
>>   		if (!am_fence)
>>   			return -ENOMEM;
>> -		am_fence->context = 0;
>>   	} else {
>>   		am_fence = af;
>>   	}
