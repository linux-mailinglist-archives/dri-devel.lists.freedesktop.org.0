Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B69A7A27E
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 14:08:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA72B10E9C1;
	Thu,  3 Apr 2025 12:08:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="T+zAZJSa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2048.outbound.protection.outlook.com [40.107.92.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E477610E9B4;
 Thu,  3 Apr 2025 12:08:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wsyxXgUTjlugly/HgBLRI18Hgy+TQJbVegT3pVwuaBmcX5P9fI6gXvPsZeDMORc9EdK4l7BMfnuCevWoCflPG6JoPJlD/ru8ntEAbJerU0JxBFLMEhPR9k+fHs/DlhCLphgev/ehuomlmQl4cseLD3QtDZ/a97KHk2WZ764xTHpbUX2c2ysbTgIu30yavTA/cm3IaOi1ywmpsCbpZ4kmPIB3TRPCE7MoTaTyhsAR98dPtkEJoUHdZDtk10PFCRhckirthujMskF1IIZJF4/9nqLlL6cnZ7yW+Tk4T+Yw6h54E5WZGTLNKD+cEgZ8bMZ1JQ6NxsKQ1UEgh7tNCEiU2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9KpapeW1Y6QMGMJzoAWNkGBAhVeBhlDh6ogb2K7c/VU=;
 b=ZobEWsqQQ8CQgp8W6GsBXJ1U1nMR8U6YP7MKUg0WlH+PQb14aK3J9OgpuBQIXmVwoMFwAp9YRFfd3RkC7IAW0tKlkaO30P2qL7emShxDxgXjq2rtbERQVxfm8/Ig0KWYjbH5CQ7dZeB8nQLpi+7EynQWdHkZVfYn1p4nG/Zhb/i1SUmkJy0JhsMVIv/NXKy3Kd3HsDCrn21ZqMnyKltdFFw1XctdfKx5IpckmlsxM/ZRKCiH/tH/1wG5XTjGCFmsTdj28CFavGcUty/NBgtLzvoZtBS133UkR6M8zMXHd3GKZHV4XvfUDNaizDWtymK/sUrz/pGoKeKz/kfB7Tahpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9KpapeW1Y6QMGMJzoAWNkGBAhVeBhlDh6ogb2K7c/VU=;
 b=T+zAZJSapKJ76QxjrjDzARQBasetOQoHu2dcXv6L2Zy8Z88sswKbKiQ0BbRNIJhx1WzVgYSlh3ULo00sa3tCc2DypJjI0W+eVPYtrJIifT/VtJjK9v2dZTXT3zdJaO4D0Ua0A/DLrdRT5aizVbS2v4QRJN50NK42Y+Q+SVl7PQs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com (2603:10b6:a03:42b::13)
 by DM6PR12MB4075.namprd12.prod.outlook.com (2603:10b6:5:21d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 3 Apr
 2025 12:08:14 +0000
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::ec7a:dd71:9d6c:3062]) by SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::ec7a:dd71:9d6c:3062%3]) with mapi id 15.20.8534.045; Thu, 3 Apr 2025
 12:08:14 +0000
Message-ID: <c779bc2f-06af-4278-8bb5-08afc074b580@amd.com>
Date: Thu, 3 Apr 2025 14:08:06 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/nouveau: Prevent signalled fences in pending list
To: Philipp Stanner <phasta@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, stable@vger.kernel.org
References: <20250403101353.42880-2-phasta@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250403101353.42880-2-phasta@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0364.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f8::12) To SJ0PR12MB5673.namprd12.prod.outlook.com
 (2603:10b6:a03:42b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5673:EE_|DM6PR12MB4075:EE_
X-MS-Office365-Filtering-Correlation-Id: 12f811ab-2567-4ed7-c97e-08dd72a8362a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eEQzakdYMFFsUmFsQjFoOE1SOVUxQTdEVzkxTXVwYTNpQXoyY09xMU5iWlFz?=
 =?utf-8?B?MG8wL0NIdkhPSDNjNWhqU2l1UmRYLzloY0VQR0NHNDZiTndSUFJtdzRLeG5p?=
 =?utf-8?B?UGI1aSt4Sk1Bb2ZydkxrbEpxQlpFUzFQNVFtK0swbUZXVkxpN2ZiSWQxZ2xa?=
 =?utf-8?B?bWI5TThmZE1RQitXbkpRTHlBNkVJT0hnWC93UWIwU3RTNDF6N3N2NzUxVlpZ?=
 =?utf-8?B?UlBoNG9mV2ZpUy9CdkZ0NlVqU0JlUlNkRDhJelExbC96L1c2MUV1bmJQTjQr?=
 =?utf-8?B?V2JMbkk2UlF3MGhwT203ZWtQVDl0QXpzRDlmeS9VYW9nM0Y5NTJkdm40U01j?=
 =?utf-8?B?bEJjWWhRTERlRElMckZ0QVFIYnhUV3lTRnpjSjZuTlV5K1lzTTlQMXVVVFpx?=
 =?utf-8?B?YlFBbS9RTVRZS1dCazJ6bDQxc2NLNUhPSkJBQkU2a3g2MnRpeVZoeFVyQno3?=
 =?utf-8?B?OXZMb091N1JJeW9xRHpKRDN2dnlTclpNY2ZWWUUrOWREd29QQTZCTmFrazRz?=
 =?utf-8?B?Qm93cjMzTUc3RlZzaFFaR3E2UndXc0RMSkM4N2ljdmtBVXkrMysvcmNYY1JI?=
 =?utf-8?B?TkZaMEtsKzF6WEJEYk9iRThrWkJobE0wRE5NWlltYWNjK3JkcWEvcnVsSkFu?=
 =?utf-8?B?am5RekFNU3JpVEs4ZUEvV3gxY240NFJhRldyQUVkVzBWWmNGdmpBVUkwME9P?=
 =?utf-8?B?TVFwU3BVZXJEWDhWN0UxWGVxS21OWmVXcmhLRHljenB1ZmZuZCtmc1BuMkhE?=
 =?utf-8?B?bnVYOTJRaWx3VnNKN1dvQTFBZE45U2JTaHV2UFFkNnJaeFpxcjM0Q3czai9m?=
 =?utf-8?B?MmZ2dlBOUnZRWGpLaWpNcmc3dlpiYThFNFROR3lDMjFrekk4L1lIMjl2Wk5m?=
 =?utf-8?B?ekZKdGlhODlzZUM3N3hSbm5lKzJLMnV4WmEwRk9ocG1JRXU4czBCRktXK0tZ?=
 =?utf-8?B?OFcrdUdQNTZHc1grRG80RW9tTkl6bG11dkdkK251dDlQdnRNM2VFMkRLajBW?=
 =?utf-8?B?TXVKdVR0dlV2aUkwaFVIVkhWdGdic1c5YmsxSGZTV0RSRnYyVlhoYnBDRVc3?=
 =?utf-8?B?YW5ydCtqcnphQjBPNUJxWTNtNnlMVGM2UGhDbE9HWEx2ZEd0a2swK1BrV2cr?=
 =?utf-8?B?dFhnRUFpVUxWZmRKMFV3VlB1NkFJbEdyWWkzWlNOSGw2VjkwVjVoemN6WWdj?=
 =?utf-8?B?Rjc4VnArMytkdXN1dWtDcEh6VHg0dERkanQvcHhXR2d1d0xPN2tGbktJbnVw?=
 =?utf-8?B?cGVuUzJOYk9xcm9vU3VYVFp1VWU2dVZQOTcyRU5ZTlFkM2d2SmcvWmRKNWZP?=
 =?utf-8?B?ZW1CeUoxMG9NSFZoRlVSMWc4YVI3L1R6STJ6ak1hZCt1ZGhHSjNxY0hHaEpB?=
 =?utf-8?B?eU8vRUErUmhyT0o2VmJTSUFvRlBhWjZEQ0lQNUtITERXZ3dhRlh0bzlkTzZn?=
 =?utf-8?B?cGxmYlNuMXIxWnp1WTRwQjk1clNWZzdmWkMzWHdncnRZeUNEbFBaYUJLQ09j?=
 =?utf-8?B?M2RacnhWYzU5eUxSeVVDSjRVZG9IMGpHc25GdDVCb2JWSTZsRmM3RkVxeW1K?=
 =?utf-8?B?ODU2a2VWRWVFUXlIeE5jSklZQ1hBV2dyTmxLcHYxY1M5dW1xYnVrRy9vUS80?=
 =?utf-8?B?WTlIc01iV2h5dFRtekRDMnl2bXpxTnM2QkVJbFlKTFdvUFYzMENIdDNQVDJX?=
 =?utf-8?B?ZTZ6SUlCcjVkN2EvZWg2Wm9Ga3J4REZRZEd3T1ByYWU5M2Y1bTY3aGZKWnJ5?=
 =?utf-8?B?Z3FlM2t4M2JIWGtvRnRNVkxyZWxpdmJwWkZ0ZnZhZUtTVDM1cmdQaGcxRVFT?=
 =?utf-8?B?d0J5aUZpR2xNVFdodFZwWXhSWlR3UldTeTBoQU1qaFZyOGZsQUNmUEk5MHQw?=
 =?utf-8?Q?8f4qNN1NRoqLV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB5673.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UkZQbFJzdjNmNklhUjFqVXFQS0NqOGFpdEFmeDhhSHFaUFB5NWFpa2RpRDR3?=
 =?utf-8?B?WW92cTRKNGl5RE5VaUZKZDVuNjd0TnA2bVQ5dEFZVGE5em9Bb2xWdG5sUkRm?=
 =?utf-8?B?N0M0U3ZYS0g4MFNJck5xM1FqS2RFRnJDMHV1WnBQVDdyK3AyemlEOGJ6YlBB?=
 =?utf-8?B?L0RXUWRJUUF4YzJGUWlTVld6VUZtUDdpMG9kakVCRzUrQ3AzNXNIUHNQSm5X?=
 =?utf-8?B?S2hyYkE0QnVpUTNabVJSQWlGZi83b3h0b2xlQXFxMWVFbFk5NHVnQ0I3NUxo?=
 =?utf-8?B?c05iYmxEKzkxNVR1ZHMwNkZ2UFFPOEJEUHJITzhzTGErS1U3UFZLOVB6dktG?=
 =?utf-8?B?djE5NncwRytXSCswWlZJNTRZZ1RWU2hPQVV6WU9SWUt1eHpCSUhIVHEzT01C?=
 =?utf-8?B?ZW5XWHlQOWliVmEyY2YzSzJIMVZFOVNoVTF5eE5kTHp1NTNaUE9RczBBVUZE?=
 =?utf-8?B?YjFOa3p3YVZ3YnZmd0QwZkJRUG1NOXAzcDAwMmhabnFaNDFSSi95Zk9reEZ6?=
 =?utf-8?B?VWJjc3V0NUJ2ZkFjeWtNa3pWblRpSXhJbENhb1E1bmlEZU9yT0JFTUdsaGIx?=
 =?utf-8?B?bTJQeTdDNDVJb0VZMEVRM1RNTFFoRUR6cXptWGIyWGVEcitxR3JPVHMyN2FV?=
 =?utf-8?B?aWFjRTN3M2FoWFJERkwzWmVZTmFDL0ZTV2poL0o3QlYyTHAvdGgxd0F3SVZu?=
 =?utf-8?B?a1NCUmRwcFZpd2MwQXJib3ZlYjFvUUc4MGc5Z1VwSitPMFZyaHN5OG9UazlD?=
 =?utf-8?B?cEIrQUxMTkdzSnUrb1ZTdnd6VFkwY012djloMy9kbnhpS3J2UHh4eDNYQUUy?=
 =?utf-8?B?Yit5YldYZ3R4YkRCQ3doeXh5TWxURDVXalUxYk40T1hvM0ExTjYzSEZnNXJu?=
 =?utf-8?B?S1R6OTU4Z1U4VlgrZnpKY2g2dW05Nm1ZbWFTbWhuMVZwTmhrd0tzMXdFdnVh?=
 =?utf-8?B?ckt1ODdVcmpnY2g1end2ZTVZZGZ3RlFDSTZpaFd5VlY1cDdITW9SS1ZYa0Yx?=
 =?utf-8?B?T21BUkUxUElNWE9BTU1sbThxd1ErZGZCZnA1c1BmdTRvUnFuWTkveXV3RGdh?=
 =?utf-8?B?YW9Bb21YcDN2SENpR0UrRmNUdzFSeDYzeHFzbURtcERHQzhSNTFyUC9oVEdO?=
 =?utf-8?B?bmtSMVFZTFJKMkw0MGRWRUJpSVUvRnpEYnRuUFFyQWFqSFF3ZkNqRFRlWlVH?=
 =?utf-8?B?eXpZRDEvNjBYa2tWNHBBTXA1RW5ZZGg5OUFFNktMUmpLTm0ycFdZQXJOU213?=
 =?utf-8?B?NTFHNEdsMlRLU1FTSy9EeFhoT3ZmdENHWDVhSGdzOUxhVy9IUks1V0VYNmdF?=
 =?utf-8?B?dkE5NUR3bkJqangzdnNIS1dCZFJaQmdHSEpob0Zwc2Y4eFhZam9xMGgrZ3pF?=
 =?utf-8?B?M1Y5RHpXclZJKzEzemF5azRUTTNzQnVGRUFPeVJmbHlRdHU2Y2U1SzdSbXhF?=
 =?utf-8?B?RnZKdVN0L3NpbFdCK3RRMU1JeWpPSFhlWFFobDIxVVJBd2dsVGZYT3B1TnB6?=
 =?utf-8?B?VVZKK3lzZnp1QVRYcUhWOUpuQ25heW10eHl6Ykdjd01qTkx0SXVSSm5uc0xB?=
 =?utf-8?B?RXJVMGhEbUwvcmZ3N3M1Y3AzM0hwL1gvZFA0Tzd5NWV2elNQb1k5dEVQSlV5?=
 =?utf-8?B?M200U0Q4VVNCSVc1bFJEakE0cWJjRi95cCtlYUhwRjh2TnFxZlVENXB0S21Q?=
 =?utf-8?B?MEZpSnFXbDNvTXBDeVpmRWYvckdhWnBqaUxhazBTTXl4d1k1ZmJnb2xpNkdq?=
 =?utf-8?B?QXlKVjI0RURScXgyakNGbWNTaGRrVWREam1wcGJ1bEZydU9jYjZ2NGxlQWRX?=
 =?utf-8?B?VTZJbDRNaGxPcEUwSTRiSHZrQUJPczNRSHovSGlkVWdTbnBubWljd3pGYmdh?=
 =?utf-8?B?TGVKWWdjcHNZbGs5ODJFZnJkRWNDY2M1TVhDTTd4VVE4aTExMXR2bWVva0hR?=
 =?utf-8?B?MDJGb28wMDFJN2luNE8rK2NmWGdyUDVQdTY5dk42QS9VTkFCaldDcjV3MzJs?=
 =?utf-8?B?R1FQT1AvNHpJUEFnSHhyU2FDMEM5WWxZSkVaS2ZWTHFmbEpOczl4eEJ1S0py?=
 =?utf-8?B?ZkpOVnFqN3VBZEcvN0owZTVydDlnWDBLOWJIOWJ6SWgwZ1BidyttS3Fsemtr?=
 =?utf-8?Q?ruEZYNooc0G2Vnyw4jqbHZ8li?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12f811ab-2567-4ed7-c97e-08dd72a8362a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5673.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 12:08:14.7958 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yc1yknREuzWjCqx4LCyf8MgMtVn3rUs4KKrrZMcowSicVHCUCemev9FOkP96Zbkz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4075
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

Am 03.04.25 um 12:13 schrieb Philipp Stanner:
> Nouveau currently relies on the assumption that dma_fences will only
> ever get signalled through nouveau_fence_signal(), which takes care of
> removing a signalled fence from the list nouveau_fence_chan.pending.
>
> This self-imposed rule is violated in nouveau_fence_done(), where
> dma_fence_is_signaled() can signal the fence without removing it from
> the list. This enables accesses to already signalled fences through the
> list, which is a bug.
>
> Furthermore, it must always be possible to use standard dma_fence
> methods an a dma_fence and observe valid behavior. The canonical way of
> ensuring that signalling a fence has additional effects is to add those
> effects to a callback and register it on that fence.
>
> Move the code from nouveau_fence_signal() into a dma_fence callback.
> Register that callback when creating the fence.
>
> Cc: <stable@vger.kernel.org> # 4.10+
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
> Changes in v2:
>   - Remove Fixes: tag. (Danilo)
>   - Remove integer "drop" and call nvif_event_block() in the fence
>     callback. (Danilo)
> ---
>  drivers/gpu/drm/nouveau/nouveau_fence.c | 52 +++++++++++++------------
>  drivers/gpu/drm/nouveau/nouveau_fence.h |  1 +
>  2 files changed, 29 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
> index 7cc84472cece..cf510ef9641a 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
> @@ -50,24 +50,24 @@ nouveau_fctx(struct nouveau_fence *fence)
>  	return container_of(fence->base.lock, struct nouveau_fence_chan, lock);
>  }
>  
> -static int
> -nouveau_fence_signal(struct nouveau_fence *fence)
> +static void
> +nouveau_fence_cleanup_cb(struct dma_fence *dfence, struct dma_fence_cb *cb)
>  {
> -	int drop = 0;
> +	struct nouveau_fence_chan *fctx;
> +	struct nouveau_fence *fence;
> +
> +	fence = container_of(dfence, struct nouveau_fence, base);
> +	fctx = nouveau_fctx(fence);
>  
> -	dma_fence_signal_locked(&fence->base);
>  	list_del(&fence->head);
>  	rcu_assign_pointer(fence->channel, NULL);
>  
>  	if (test_bit(DMA_FENCE_FLAG_USER_BITS, &fence->base.flags)) {
> -		struct nouveau_fence_chan *fctx = nouveau_fctx(fence);
> -
>  		if (!--fctx->notify_ref)
> -			drop = 1;
> +			nvif_event_block(&fctx->event);
>  	}
>  
>  	dma_fence_put(&fence->base);
> -	return drop;
>  }
>  
>  static struct nouveau_fence *
> @@ -93,8 +93,7 @@ nouveau_fence_context_kill(struct nouveau_fence_chan *fctx, int error)
>  		if (error)
>  			dma_fence_set_error(&fence->base, error);
>  
> -		if (nouveau_fence_signal(fence))
> -			nvif_event_block(&fctx->event);
> +		dma_fence_signal_locked(&fence->base);
>  	}
>  	fctx->killed = 1;
>  	spin_unlock_irqrestore(&fctx->lock, flags);
> @@ -127,11 +126,10 @@ nouveau_fence_context_free(struct nouveau_fence_chan *fctx)
>  	kref_put(&fctx->fence_ref, nouveau_fence_context_put);
>  }
>  
> -static int
> +static void
>  nouveau_fence_update(struct nouveau_channel *chan, struct nouveau_fence_chan *fctx)
>  {
>  	struct nouveau_fence *fence;
> -	int drop = 0;
>  	u32 seq = fctx->read(chan);
>  
>  	while (!list_empty(&fctx->pending)) {
> @@ -140,10 +138,8 @@ nouveau_fence_update(struct nouveau_channel *chan, struct nouveau_fence_chan *fc
>  		if ((int)(seq - fence->base.seqno) < 0)
>  			break;
>  
> -		drop |= nouveau_fence_signal(fence);
> +		dma_fence_signal_locked(&fence->base);
>  	}
> -
> -	return drop;
>  }
>  
>  static void
> @@ -152,7 +148,6 @@ nouveau_fence_uevent_work(struct work_struct *work)
>  	struct nouveau_fence_chan *fctx = container_of(work, struct nouveau_fence_chan,
>  						       uevent_work);
>  	unsigned long flags;
> -	int drop = 0;
>  
>  	spin_lock_irqsave(&fctx->lock, flags);
>  	if (!list_empty(&fctx->pending)) {
> @@ -161,11 +156,8 @@ nouveau_fence_uevent_work(struct work_struct *work)
>  
>  		fence = list_entry(fctx->pending.next, typeof(*fence), head);
>  		chan = rcu_dereference_protected(fence->channel, lockdep_is_held(&fctx->lock));
> -		if (nouveau_fence_update(chan, fctx))
> -			drop = 1;
> +		nouveau_fence_update(chan, fctx);
>  	}
> -	if (drop)
> -		nvif_event_block(&fctx->event);
>  
>  	spin_unlock_irqrestore(&fctx->lock, flags);
>  }
> @@ -235,6 +227,19 @@ nouveau_fence_emit(struct nouveau_fence *fence)
>  			       &fctx->lock, fctx->context, ++fctx->sequence);
>  	kref_get(&fctx->fence_ref);
>  
> +	fence->cb.func = nouveau_fence_cleanup_cb;
> +	/* Adding a callback runs into __dma_fence_enable_signaling(), which will
> +	 * ultimately run into nouveau_fence_no_signaling(), where a WARN_ON
> +	 * would fire because the refcount can be dropped there.
> +	 *
> +	 * Increment the refcount here temporarily to work around that.
> +	 */
> +	dma_fence_get(&fence->base);
> +	ret = dma_fence_add_callback(&fence->base, &fence->cb, nouveau_fence_cleanup_cb);

That looks like a really really awkward approach. The driver basically uses a the DMA fence infrastructure as middle layer and callbacks into itself to cleanup it's own structures.

Additional to that we don't guarantee any callback order for the DMA fence and so it can be that mix cleaning up the callback with other work which is certainly not good when you want to guarantee that the cleanup happens under the same lock.

Instead the call to dma_fence_signal_locked() should probably be removed from nouveau_fence_signal() and into nouveau_fence_context_kill() and nouveau_fence_update().

This way nouveau_fence_is_signaled() can call this function as well.

BTW: nouveau_fence_no_signaling() looks completely broken as well. It calls nouveau_fence_is_signaled() and then list_del() on the fence head.

As far as I can see that is completely superfluous and should probably be dropped. IIRC I once had a patch to clean that up but it was dropped for some reason.

Regards,
Christian.


> +	dma_fence_put(&fence->base);
> +	if (ret)
> +		return ret;
> +
>  	ret = fctx->emit(fence);
>  	if (!ret) {
>  		dma_fence_get(&fence->base);
> @@ -246,8 +251,7 @@ nouveau_fence_emit(struct nouveau_fence *fence)
>  			return -ENODEV;
>  		}
>  
> -		if (nouveau_fence_update(chan, fctx))
> -			nvif_event_block(&fctx->event);
> +		nouveau_fence_update(chan, fctx);
>  
>  		list_add_tail(&fence->head, &fctx->pending);
>  		spin_unlock_irq(&fctx->lock);
> @@ -270,8 +274,8 @@ nouveau_fence_done(struct nouveau_fence *fence)
>  
>  		spin_lock_irqsave(&fctx->lock, flags);
>  		chan = rcu_dereference_protected(fence->channel, lockdep_is_held(&fctx->lock));
> -		if (chan && nouveau_fence_update(chan, fctx))
> -			nvif_event_block(&fctx->event);
> +		if (chan)
> +			nouveau_fence_update(chan, fctx);
>  		spin_unlock_irqrestore(&fctx->lock, flags);
>  	}
>  	return dma_fence_is_signaled(&fence->base);
> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.h b/drivers/gpu/drm/nouveau/nouveau_fence.h
> index 8bc065acfe35..e6b2df7fdc42 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_fence.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.h
> @@ -10,6 +10,7 @@ struct nouveau_bo;
>  
>  struct nouveau_fence {
>  	struct dma_fence base;
> +	struct dma_fence_cb cb;
>  
>  	struct list_head head;
>  

