Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9984CA842B2
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 14:13:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42BAF10E973;
	Thu, 10 Apr 2025 12:13:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="kabLcBZD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2055.outbound.protection.outlook.com [40.107.243.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E56D10E973;
 Thu, 10 Apr 2025 12:13:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bQxrCepE8u3a19qgMS3X6nUWmp+EW4J/d8Pt2oqtIJOx1OK3Ma7MwKDvlBEvWeD0wFW9Z1pIpO01B8GIYWMsEaryUnc5YSuw3/0qB/ESqeNNDqYW5f5MStVCE8/7yfGcNugBrNHg+OG55OVnUlZIbtrUatMc6VH9g9iUPHYns64D/c+uVg0VZxv9EXpbM3UwNTC9HNGW1XQbxdY1WYzppwt16fUmAvYn33nzYXpnOKjql2heYyxEOueXEGvBdaAxnA7jYQV5YuiXJ1046q4aqC3BxxlNNaM3vcJlf0AeHUHPvO+ckE6UcIh473YbzpKVTkw3q2LrWvm6g5zYnLuetw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2uu/W5YkUof61Q3bEB8sr+DFzHaZJ/qpWyRboZvVy/Y=;
 b=Yhy74zaoZkQ4ISpNDqFzM8GwAqatXGl4uOckhjOqUBkeV31cIIqbZjo6Vrizb5/r8/molDnZxoQgM1gjRjKqzopeg+/GrWaoWeKlo2+sGYqlZXvfPZATPdubRMZJv+PwyInQp7CqLrinASJklq/zwGj8xE6lbBQCyYcsJ1BwYPd3Ko1muJ1ORrUu2A0esacs262PUOK2lNAPRQX4v7RhnmyKSbK02w01gVC4TlCSxlzse5eeAF9ujrtEvKU9ljl7pF25zsAsCwZK+JFY53awDrUkSyf6bCwaL2xTpM3APoruExPuXadeJIKc1FeEWwUereKfa7EWoT1XSX7LfMjVJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2uu/W5YkUof61Q3bEB8sr+DFzHaZJ/qpWyRboZvVy/Y=;
 b=kabLcBZDhLwe2CP/3LKOZvWanW0doM8dtfdYD6hldaoy4VQ1FnUAPeqXz/xNy6o9At2XNQJBvM4nMw9GxXyvxwE4VMUMKIlAXxfxxHcb1KtvbDccLRH4EsoYzNjX3vFGvjt2D/UKqvIH/AtrqAkvGciHWyyAufcThtVNujJciac=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ0PR12MB7473.namprd12.prod.outlook.com (2603:10b6:a03:48d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Thu, 10 Apr
 2025 12:13:40 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8632.021; Thu, 10 Apr 2025
 12:13:40 +0000
Message-ID: <d03c618e-aa4b-423b-9c50-143b8a197cac@amd.com>
Date: Thu, 10 Apr 2025 14:13:34 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/nouveau: Prevent signaled fences in pending list
To: Philipp Stanner <phasta@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sabrina Dubroca <sd@queasysnail.net>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 stable@vger.kernel.org
References: <20250410092418.135258-2-phasta@kernel.org>
 <20250410092418.135258-3-phasta@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250410092418.135258-3-phasta@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0002.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c8::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ0PR12MB7473:EE_
X-MS-Office365-Filtering-Correlation-Id: b3d0b7c1-e1a4-49e7-d459-08dd7829212e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M1Yvb3NtSHFteXIwRXphUWU0SzBTazVneG1mb0U3WlVuWVJKNFR0eGVRalhx?=
 =?utf-8?B?ZnN0RHZyc2NubDg5bkcrbkdxaXl1RTlienBlODNNdFBQZVJNOHZhMXNjZTVR?=
 =?utf-8?B?YW9EcGpTRmFPRUlpMmdUOFhaUmxSYjdlaHcva3dJVDBkRjBjbk5NTlJ0K0Zp?=
 =?utf-8?B?SHlpWCtRTnRIU21WbjllMTVrUldUQVF6NXBPT0ZISy9QZWlqT1RTSEJOZWQv?=
 =?utf-8?B?dnM4ZU0yb0l4MnpMR1lzU21LdTJLdzRiQUFhZUZLZnlRcjdBU21wWnZZNmpu?=
 =?utf-8?B?RG5ibkIwUGkzclF1VTFydzlSUlBNMkNhdy9IN2lxRjlGbndTdnRNZjFvckNV?=
 =?utf-8?B?QzZEcUxUZFU0RzFDbUsrd2lIc1FtQit0SVZUaFpqSzlUcElsaXpPZk9DMmxs?=
 =?utf-8?B?bmVGbjVEb01WOVBoYlpMQlQ5S0dxY25QLytBRGVzbjY4bG5uWEVHUlp1N1pj?=
 =?utf-8?B?WUZKeW1WN2htcHhSWmRhS0RNdHN6V1JCV0VnV043UFd0RklndGtrbmFqQzdt?=
 =?utf-8?B?OGxNTG1EdjN4c3FmdHI4Q3dKMjcrZ2c1WkNBZ3dJSHRIVjBvTzhVb0EyVy83?=
 =?utf-8?B?M295bHBJODZHeEZBVUxXQzllemJDMWI1MytuVHpveFQ3OGtmVmhneCtMN2lj?=
 =?utf-8?B?bldvSitPWjZtQmlSTXk4ZEtHYkZCUko4a2RVbXcwUVBxS2VHUGhZaEt1WE9B?=
 =?utf-8?B?VHRmOHViK2twSk9mbkMrdEF6MHIydnpxYWNWdjJSblkzTkRXYndQYTBFQjVr?=
 =?utf-8?B?Um5TdTRqNVJtdHFTUC9PeUF6cDFEOXVFdkc1RCtTV1NKVXRibDRvVGNXU1Fq?=
 =?utf-8?B?dkRML2lFR0lJU21rTU9QbzNJNzNLYkpRUC9HMUh4NXR1a2RXRXJaSk9FR292?=
 =?utf-8?B?L2U4bER2NEhpUlJaNEtDSGRPYlBocWw1cWZaK1cvd3FMUEM2ZCs5YWlVTFpT?=
 =?utf-8?B?bzZkUkduMDlqTkRjR0FGeElYZE1laDBQazluVUtjV0gwSkhIb05FNnBoQ0VU?=
 =?utf-8?B?c3Juc0ttZjhuNDlBVGlaL21CQkJuSGNsYmNKVWZGK2JRL3I1SjJxMUFXZHdZ?=
 =?utf-8?B?K29OaDVIRG0yQjR1cDdpTXR0c1J3OUNXZlZDa3ladzhDNllOMS9pZG9Hb1pQ?=
 =?utf-8?B?My9OdGhTNUliS2VRQzZrd1FrM210eWtsUTZrSWY5cDFVRTdjWmlsSG1ZcUhl?=
 =?utf-8?B?aGxKc1lCZ2lQUlR0QlQ1SURDcDlQS2c3S2EwZjJnNkluWk02RWd5MkRJYXZs?=
 =?utf-8?B?ODdhU2ErS012NXFKQWppVmdlN2x6cWRUTXZ0SXowVEhrL0xOc0RsR3BlYUhh?=
 =?utf-8?B?NEdJa3lCbjhrRmthb3RvbjkzbkxobTJhYm1ld1dkZ1FYL0o2ZE9KY251N1JX?=
 =?utf-8?B?ZXpOSnpXY2IwYzZEckNhRENKU0pGKzdZRVlhR2MxbUJoSjFiQmxwaHQ1MHhO?=
 =?utf-8?B?QTUwTUxWWU9nMWt6S3p6WTA4VUltaG14VlF2Q2V4WU5kc2lrSkJqNjBqaU5R?=
 =?utf-8?B?VTh2bWcyRDZNT29VL0cvZ0Jra3ZIN2VGbDZnUTMxa1dIZlZGc0VYNUZDUlJq?=
 =?utf-8?B?Y3FtTnRHMUhFQ2cyWnVWK3k5MzU1dnY2b25qY21LbHFzbmVBWnBMc3ZJREw5?=
 =?utf-8?B?MVIxTjhRb2YvV0M4aTV2ZkkxU1BXYXN6cFZmZllLRlhUZ3RlOU9lMEV1a2NJ?=
 =?utf-8?B?Tk43bUFIZ0NPTytSSGw1UFVjT25aSlVqS1NtNUxqd2pOcmVjbjFjMTRGeHZB?=
 =?utf-8?B?czVnSWQ5cnRlaFdPa2t4ZXYrSThnaEwxNmVKS0dIRmxvQVMzS0FsU0x6NzQv?=
 =?utf-8?B?ckt1azFjZjFpZVRDOHBJL0dDUmdQUTJqQWRYQzdseTRuQVhWVUp5R0FMV3Ar?=
 =?utf-8?B?NS9BQ25ER08yZnRLT29HVVRmOXMreHdoMGViUzYzMWV4blRBTWJLbVZ0b0F1?=
 =?utf-8?Q?+QhtyjPEH9Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SDVyelhTTmovb0dVWHBPNDRhMDZpem9SR1p5OGQ3NEdaNFV3WUsya0R1cnFY?=
 =?utf-8?B?czA2MFZNS3dya2JxdjFGY1RGaS9IU1NrNzRYYTBmZDV6UGpkR241VGFvUWtm?=
 =?utf-8?B?d0k3QjVvMEY2djEvSjhCM3hEM3FZckNXbFJuM25lN2JHVDB2eXdkTXppZTNw?=
 =?utf-8?B?bnQ2UmxjOWVzM3N6TzJZOHZ2S1hFcFI1dFZib1EydzJmOEhjMmtnZnF2ZVlR?=
 =?utf-8?B?VHV0SGJ6cEhFZW1LUWJOOWwzbEtEMFUwSjFQUlNwZS9UelNNUWJlcHRVZ09V?=
 =?utf-8?B?L3BkVzJGMmt6eU9Ta0gvdFhMcEdyRnhSMGVTa0M4ajVCdlNvOUFQZnpIcWUy?=
 =?utf-8?B?U1Y1L0JHeUNEdWVvaE1ueHFSVHB1ZFU2NWNjdkVlTlZPZHVzaXB6MFlxN2VL?=
 =?utf-8?B?U21LVXE5WGxxd3RTenZPSVVRSlJjQlZjWEVjRHRzNitKVzhGZWk0RGwxWk80?=
 =?utf-8?B?YkhMYUpydWdMRXlDd3J3c1NwSXRvWndjN29rZGRzZ3dqRGlrdTNGSUNEVTh0?=
 =?utf-8?B?UTlIUWlBQ3B6UzA5S2FCTFp3WkVxR1paWjJpOFBMVHFiVXJjWFNQRHlSVzJo?=
 =?utf-8?B?RC9zdEYyMWRxdHB6Wk8xSHVEVmswM0FFS25Jalg0eExybzZjZ1ZkLzNnSGto?=
 =?utf-8?B?T0JMbzRGRHZ6cHF3bWZSRzNOQ2U4OThhaHVrSHB5U1BWTlFocXI1bjBRWHh3?=
 =?utf-8?B?Y08vZ3dQL1dxTXAweXNTMjZIUHNRNGZTRHk0VHByM3cxWGpTSjBMSFZhaTAv?=
 =?utf-8?B?SXpBSlVZU05TWUk2ZUZTeHIvdGxXODJLRHRmZzM1dGV0VnBGclA0cGVKL1ly?=
 =?utf-8?B?ZDNBZmFzbWJZY0g2RW1GbGtsNVFiMThJZTlBVkJOa1R1RklFY1dWNEplakZH?=
 =?utf-8?B?QzdRR1ZtYlZVcE0vTDdsa0lQUVh3NXhjeTJzYlBqS2lVSTlna1NVN0VsNWlK?=
 =?utf-8?B?d0k1TG5zbTlDNWpvNXl6RWlsZjNEVTBSTFBKTDNVcDNhbmJsd0drdXVKUlRI?=
 =?utf-8?B?THF0ay9iU2JUZldRWVFPdnhsZGxoaEFJSW5DdHpON084akxFa2xiUmhUWXBS?=
 =?utf-8?B?b0N3dnZUejdEQ3ZxN1lWWnBDZ09FQWZ5SzZCS3E5dWJ5TU5BQ1dhZ3BCdTE3?=
 =?utf-8?B?bWJDOE1pdVF4blAzNTd2NDRzVTVHb1A4UXpZTE9hbkR3Qy80WnluYm9PUWJm?=
 =?utf-8?B?YTlzK0x5UlpJdlc5em9Tc0ZlV2tRckcrRXNmenI1ZXJIeXJLRWs4TlRPQUZt?=
 =?utf-8?B?Q0UyRXIvVUZjYmtWaTlEdksyVEprSXd5WFVlaFB1Sng3SjBucFN3WkFGSnda?=
 =?utf-8?B?cE9TOE1VY2VVUFJVbDVYWm9EaFJyYUNaMittL1pHRzAwTkFOdG5TRkwzOFAv?=
 =?utf-8?B?RThwSnhwaUZ2ZTNYQ002bVduME5GaEMrTy9EMXZFYVFuSUlYZ09qZWdyV1px?=
 =?utf-8?B?Y1FRT0hJWkNYdTNtanVsSmVpVnRWVis2MXNraXJmZG40TEx5OFVrMDYzT2U1?=
 =?utf-8?B?QzR1aVFpbVVwOWk4dmlCaTZaVEF2OGhqV2tzc0tWRW9hdzBnOFNiZEpEeUov?=
 =?utf-8?B?MC9LUGNGSkpDcXdjbitJZnF4d1U0MEJXazBOZUlsRzJ1SVAyaFZHUHNGZVVo?=
 =?utf-8?B?cmcwZllZLyt2dHQ5RU5mTHZ3eEpFMVRKbFdrSmQ3WHgyckR4MUJqT1NUZmZV?=
 =?utf-8?B?ZzRXUVZSR2RHUVhBdlFPM2UweHJVSk5NdU5DdjhzM3JGT3JBa3ZWZ0FlQS9u?=
 =?utf-8?B?R21WUnd0NlNrUElyNDJlbFNQRXREZ1E4L2NGMVM0ajFuMDltaFBMQVdmYUJt?=
 =?utf-8?B?M3A5aGJiUi82ZExpL25zS244NFMxeWQ4bW1Ud1BxalZUMTJ0bnFsdW1mZ3hX?=
 =?utf-8?B?S1JyVEVsdVM1bjE1bUNoZVg1dk8yQlpJYU8zeFJkQllVL1V6bVdRSHpET3U4?=
 =?utf-8?B?RjRMQVcveWZnL1lTY1RZbVgxS2YrOEtDdUpLeUtEaDJjUnpBYm44WmtLRGdx?=
 =?utf-8?B?aXM5NTFTaXFNcDlabi9uSitRUmE1Z1ZuVmZjUUJpZGp6NC9WeXFYNHBVS0Js?=
 =?utf-8?B?S0U5YVVLeEZOYko5MWRoRGFlcDBlQWRmbmJhdzhhZklvMHJCS3dGTWljTGs1?=
 =?utf-8?Q?p83Y=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3d0b7c1-e1a4-49e7-d459-08dd7829212e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 12:13:40.3622 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZY7NjnypWS5rrYJtQ5AIVagklv0BBwZBBGNnvYY5NUd26uEeB3bM0ahJP/rQNzz5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7473
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

Am 10.04.25 um 11:24 schrieb Philipp Stanner:
> Nouveau currently relies on the assumption that dma_fences will only
> ever get signaled through nouveau_fence_signal(), which takes care of
> removing a signaled fence from the list nouveau_fence_chan.pending.
>
> This self-imposed rule is violated in nouveau_fence_done(), where
> dma_fence_is_signaled() (somewhat surprisingly, considering its name)
> can signal the fence without removing it from the list. This enables
> accesses to already signaled fences through the list, which is a bug.
>
> In particular, it can race with nouveau_fence_context_kill(), which
> would then attempt to set an error code on an already signaled fence,
> which is illegal.
>
> In nouveau_fence_done(), the call to nouveau_fence_update() already
> ensures to signal all ready fences. Thus, the signaling potentially
> performed by dma_fence_is_signaled() is actually not necessary.
>
> Replace the call to dma_fence_is_signaled() with
> nouveau_fence_base_is_signaled().
>
> Cc: <stable@vger.kernel.org> # 4.10+, precise commit not to be determined
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
>  drivers/gpu/drm/nouveau/nouveau_fence.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
> index 7cc84472cece..33535987d8ed 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
> @@ -274,7 +274,7 @@ nouveau_fence_done(struct nouveau_fence *fence)
>  			nvif_event_block(&fctx->event);
>  		spin_unlock_irqrestore(&fctx->lock, flags);
>  	}
> -	return dma_fence_is_signaled(&fence->base);
> +	return test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->base.flags);

See the code above that:

        if (fence->base.ops == &nouveau_fence_ops_legacy ||
            fence->base.ops == &nouveau_fence_ops_uevent) {
....

Nouveau first tests if it's one of it's own fences, and if yes does some special handling. E.g. checking the fence status bits etc...

So this dma_fence_is_signaled() is for all non-nouveau fences and then not touching the internal flags is perfectly correct as far as I can see.

Regards,
Christian.

>  }
>  
>  static long

