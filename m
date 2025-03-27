Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2092A72BE0
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 09:56:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E32310E2C9;
	Thu, 27 Mar 2025 08:56:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="cq2y4FaN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2059.outbound.protection.outlook.com [40.107.92.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3461B10E2C9;
 Thu, 27 Mar 2025 08:56:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pES5J9ToW2UT8zodK47tD+4ni1Sdsa4COhcta0FnHTjEBBiAGBQiDZ8++gZwkaNO3dnLAkAuOSwseNC6JIFK7vS0/EZQhlX04vL9ctyHqlNSHXQH9p5qPIRvctCoRMWlCTYXLOAiOVCu753Tam9YQmfF+a2uAp2C5VplIJkmXcseqXtZPLRD8Ax4n5F43HtjfyI8NburCUH7dXpVgl7xvg5xu+BoOz+6WR0XOGRa992e0f5FtA0IReOuVnDa0/ujM2l8UcSr83SnrK7IWCCg4adDySbT6WDcFOOBpYudGOajoTebKoJsVfnGUDDaSXFLo1RylUcfF3fzM03uvwqufQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LxAZ6nkntAI9GwHeZD6WujSX8sxIvrzs3rA0jrMVyCU=;
 b=iXXfs8CorGn2J1NGSvtsqYWuwoVJhcUNyKg1R+KjqfsjG5ot+CbUM7SAu9RGm0oMuOP47rQBFmc3BWctAYktWDMQW2XiQqw/mlc6yyWmP8zJeLyFUVZLA/b41QwwL5m3i0md4i9s7wZCO1MTJq6N1FnKLO4nCHrgSRX3DZNP+hkGoZj7zo2D6C+tyK9zC7TKKkeHJM3gqiMHFFHeMTwbWl1P3fc1AArP+jW8gZzKeKo6nbL3RCrsJOtar9p3g9iQnZmC/mUSCppXCAN+Urj3lfRCwe6nqdTihOAv79ealrvdquv++yIp7n2dSFfAUxFTb9rj14L4tTjQHJg0uA9V5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LxAZ6nkntAI9GwHeZD6WujSX8sxIvrzs3rA0jrMVyCU=;
 b=cq2y4FaNUAr5A5ZjyQe47RNxVRfgWjSHA72yxn4Nzfu9jWxyEUnE+irTpXT4ZGT7pIMtyfKdQTd1LSb6EhlN3urKHGonGYPnI4FK1x1J0vf5KD3rdQf1K3wxK3hUVbS1D+uloOFcMyD2tOiUMRAztVNj0UzCCHmh6da813jXWHU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS7PR12MB8251.namprd12.prod.outlook.com (2603:10b6:8:e3::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.44; Thu, 27 Mar 2025 08:56:08 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 08:56:07 +0000
Message-ID: <8882f3d5-6e00-4aae-af3f-7df447158fda@amd.com>
Date: Thu, 27 Mar 2025 09:56:01 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/nouveau: Prevent signalled fences in pending list
To: Philipp Stanner <phasta@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, stable@vger.kernel.org
References: <20250327084256.11201-2-phasta@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250327084256.11201-2-phasta@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0055.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS7PR12MB8251:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e0a659f-266b-4281-2b8b-08dd6d0d3696
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|1800799024|376014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NjBpalZiQytLRTNuQ05NSy9Ub05nbmtnY3JtTk9pOWZBOFA1YzN1ZmFuSGs5?=
 =?utf-8?B?djFPS01tT0wxM2VBWWFFT0FOaG9CakR0N2ozMHVKZTVmNzRXNEdZSnNhMnRm?=
 =?utf-8?B?eTZBN0pzUGVhSmR2OTlYeXJZUE9YakFkTDZqMmlHU1NYZjNhNkFBa1RkaXZI?=
 =?utf-8?B?RCtQcDZ1R2FWQ0FENldaNG5ObjBHUjFydm5iODlJTTFGb0Rhd1B6Uk9pRzBw?=
 =?utf-8?B?QkNNTnR2NE9ySW5abHQ0QUpsU2xBT2Q0c0tFdmhqTHBZMkIvZHRmbUp1ZW1J?=
 =?utf-8?B?QTNsVDgySXA2eFdKS0laTVVKUVZNME13Z3pKVGY3QkdBZ1ZId1RNOTdZSzJi?=
 =?utf-8?B?VXNPMXV1V2tZUm9TbjBOVlp6Y2dZelUrRGtJZzg0QW9IeTJxVzBsVzhuQjJS?=
 =?utf-8?B?VVIwM3NvNXNhc2ZPNlZzZThBTDVXSnNqb2xVTmt3V3FvbzhNK3p0dGxJUU95?=
 =?utf-8?B?OC9pS3BzM25RSEtUeThZWVVFVmFMQWl5M3h0UW00TlB0UnpOalhMTVpBVURK?=
 =?utf-8?B?bis3czFoZSttOEl1d1YySG5nWXNmWTlkVG55V0NReHRzNFV3WDZ2T3RnMks0?=
 =?utf-8?B?OVZZZGJ6bmdDT2YzTTZzaEtWVVl6Zit3V0VkWnd3R1BlS01hanpmaUUvTUlW?=
 =?utf-8?B?cktnbWJETGdzbm05SHNvVTJEbFlvQ1JzSzhleWZNSk0wcDdnR0IzZmQxbkFl?=
 =?utf-8?B?RENsNmN2djVpSlV1MDVTWDlLTnF2amcramV2ZU1ZV2ZMTWpDZ3hobkZZQWx1?=
 =?utf-8?B?Q2YvZ01XZkZMVlBlVlZIYTJiNnE1OEJNN1ZYd3RnZnBBS2RFMGlKbmZrdDFK?=
 =?utf-8?B?ZzZmVk9IVmVVaGNMMkhPUGgxbDdOQzViWXVtTVRMVGt4YllURnRKd1RFUUF3?=
 =?utf-8?B?eVZtazZFVG5ZZzVZZlBKZUVuaFJOZnRtNUNsQklzVmh1blhuVVQ2dFZYVFRv?=
 =?utf-8?B?RHRFOFR1SGlYdEZoNWFqeFhEdkpwcnpXYzNMZHFES0dNU1NXaVJrc09yMlI3?=
 =?utf-8?B?Q0tYc04xUjU3T3ltbnJ3Qjk1N0tqMHFXeE9nYjFFeTBHbG05TjlrSnhkWU5j?=
 =?utf-8?B?SFlIeDNxbGx4dGg4VFRDd0pQL3I3VEVuYW5xMXZrMDFhWDQwWjlhY3Yxb29p?=
 =?utf-8?B?UFdQbTlKNi9ZdGNaZ0kwZnF1aXlYSnpQajRmd3FUMkdjUWpTMDZqcEdFd3Uz?=
 =?utf-8?B?RWFCT1dUL1JVeDgvQUVGK1RsdkdJbGVXem5GQkdxMFdlc2JiV0gxbVhzTHpj?=
 =?utf-8?B?ZXVPN0ZaSTFNam9SUXJ5bWFkZWpKbXUzamtTbHpqdFZtVWVjdFlSOEpXOFhy?=
 =?utf-8?B?M05rV0pGb01IY1Qva0xzV2N2cEptRSsrSFRPM20vNW1ONnEwTk9Tand5Yzha?=
 =?utf-8?B?eU9rS2NaR2xFdk5kNGFvbUZXeDJ0RUF3S0V6dnhSVFZ0Wm82WU02dGFsTmta?=
 =?utf-8?B?MlB0Z3c4ekNmdS82NDc0Q1k3UEV2WVE0QmREZlo4alpMQUxISW90ZndTcFR3?=
 =?utf-8?B?OVlNdFk0amhreW1sQ2xHYjNKYTFuazk0TE1PS1JEVVlkQmZmZVBJc1ZIZ3Zj?=
 =?utf-8?B?amlkNlNnN29veWFZY1V5NGNaMERQeU0vQUpSQ0ZEZFNvYWIwMktBNng2SWxY?=
 =?utf-8?B?RVBWOXdDbHRjR0JjejJSMjJMNVBlbHFNMnVmaWZBMldUb25QMkdTNmdxMUs5?=
 =?utf-8?B?TElxN2ZmaWRac3gvbnR0MldrRWkyMDI2WHhPbUxxN25sNW9yVC9mZ1N0Rkpa?=
 =?utf-8?B?Mk96bm15Rm80UnkvSGlIYlVYSkYxZXlDUkdSWUlVUjk3cno1cUVYeVZUNlcv?=
 =?utf-8?B?cThtUzk2SEU3c1k0QThzT0MvejdVUTNaRmllTTVLZi9kOWZkSzRoMWxoU1NU?=
 =?utf-8?Q?q95deNIqweUxx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3AxTmtPclFBOGpXc3BSVUhLTGwzR3VsR1hjdHVXVTBIdlhNL2xaY25TTmw2?=
 =?utf-8?B?ekdmYXQxaDRjWjk3a3JOL2ljU24xWHhEZE9pNXRyd25MQVB4VXpDMFNBNWM0?=
 =?utf-8?B?a1drMjM3T2Zpc3pCNHFrUXR2SEVxaEExbDVMaHp6L0UxdVlxNUFEU3crbFhC?=
 =?utf-8?B?NEs4OHZDWnBTdndRN3h2ck1OTlhjRzE0eWNxWGhUMEFLVW9RWlhrY0RHU2NE?=
 =?utf-8?B?aDlRZmpaTzdIZEwva0VjbjN6bzc2aVpGMUlNU0o0NkNDNldMOVhkZGg2WXJL?=
 =?utf-8?B?MFVyR0ZQQlhyd1ZkcVNBcFpXSGJvU1pVWHlqUnVEVzBKMnVPbjBNUkdhbVBN?=
 =?utf-8?B?VHdhVXp1TWN4Vy9WWnlwZ0FjYVNZTFRmNW5BcTRxNWpMQnZERExobEtqVGsw?=
 =?utf-8?B?Rkp5akhnSmkySFY5cGNvcXlYN1FpcHdzVmJMeXA0TUozbW9DYjc3djRHQkll?=
 =?utf-8?B?Z1c5ekJNOWNIY25DOHZpckF4NDc0MjJWckNmaFdxVDIwMnB6bXhvdWJGTWFJ?=
 =?utf-8?B?a0V4Qy9EK3JVZ2FtRys3VEdMVHB3a0dlckJUTlFGNWpMS3lNUzNsdmpybVJq?=
 =?utf-8?B?OTF6RzlHWHl0NStFOEVvUHYxRHBpZXRhSFdTVE1XZkpORyszbWFiQmFJUE8z?=
 =?utf-8?B?TWt3VUNwNTNIY1loTVM4UitCaCtTeHlFOERGUmhBYTlFLzVsQktWLzluVmhl?=
 =?utf-8?B?L2FHbWtFWXByWExyQ1dMMUJxQ3dzM1pxeWFMUFc4VGhZaG5DSU44YjkwcHl5?=
 =?utf-8?B?TG1WZFlhTHBMOEw4MFl5c082eUN4eUJOQVNTR0hiV2VPNFVoTXpFZ2pxWkhU?=
 =?utf-8?B?VitVVUVhdHllU0JDQzAvZXBxa1dPVFRpeU8xUURteGpHVDE5c2w0bVgzS1FB?=
 =?utf-8?B?WG1LZDRGd2p6TGk1aVo4S1lhclRwY0o3WFNweVNRdmNBREttVUNHOEd6TGNn?=
 =?utf-8?B?L1VUeDZadlFhMVdnYXBWQm5DSTVEQmlWQ2oyZGhUTTNYcDdJZEVTWnVEZTZF?=
 =?utf-8?B?K014M3gxTzZnc0FaNW9hdE5OMEVOV09PTVp0Zm50eHQxWVVxRnB3WWk4elc0?=
 =?utf-8?B?blgyTm8rZFZDZmh5NkZVd2x3dSthZ056S2hXTVhER2NPS0VDM1VudUtiTGFI?=
 =?utf-8?B?V3FyYkRuUFVuQ2FlQ2ZXSmsrdVdsdmszd1ZPSGs2eW9QQXVnS1dtOWlRcXgz?=
 =?utf-8?B?UThWblJ6YUFQdlRsbnRHRGt2T0tTUEZXalJNZkF4R2FCN2d4enVuV0hOQUs3?=
 =?utf-8?B?ZzM3anVHdVBOWVNJS2tsNEsxZHRhNzhPeVpwZWZ0QlNqZVhWNnQ3d2hsR0lB?=
 =?utf-8?B?d1YyNm43ODVnZ0hqUlp0WHkrdHZYd0V3eEtFak9XZTZKL1BjRjNFd3MzVnJF?=
 =?utf-8?B?emlxMGM5QWZSVjY0NXBrVjV4TFhMbmxRdi9CU1ZQNEZaYmdhMjhmU0R4RndF?=
 =?utf-8?B?dllqK29FV2IwRngrRFhWSjA1S1VkYXM0L240WDR0TUtaS3l6L1FEdVEvSmNE?=
 =?utf-8?B?disrSWRwakhuSVE4ejVlMGZZR1QrYzlTWnJLWTNRLzUrd2krL0syVFJpbUpu?=
 =?utf-8?B?TUpjYm5IcTlGNkFHQ3VxYWxwN0ZWdXh1cXY1STV0WnZpZEVremJBNzR1QVgr?=
 =?utf-8?B?UWtQNHN3R1lpc005bmpEcmVyU1pXWm1iUkdLWmEzbVN5dGJkK2NXTk1yQnph?=
 =?utf-8?B?cUttZnFvbTd1Wm5WbGJhTFl0dzJ1cWo2aFBML012cnFwUHZmUUlEcHdBdnMz?=
 =?utf-8?B?aFRuSXlHOFQ1MHhkWWdqbEZ5S0swb00xOTBlMTE1dm4zVC9kNGozY2ZwQ3Qr?=
 =?utf-8?B?WWNHNHY3bmoxbmhleWNqc2NQZUdNMll2U0l4TlA0NW1OM0p4K0x3L3dnSHpM?=
 =?utf-8?B?MDJzM0N2TkY2bXVERmpLblkvZ2JvTHFDMW1ZRG9VL1orOXJKYlpEWlcwcm1G?=
 =?utf-8?B?bnlRd1hhd0ZITmZCWk8wSkxZcVZMbC9GTzRKRkZBU0s0V0E1MDgwSWRpZzA5?=
 =?utf-8?B?YzBXeWhsYlAzUkd0Mitxbm9GY1UyaU9zeWJ2SWxNeGd2RkVIb0lFYUJUa1h4?=
 =?utf-8?B?NG5qa2VDd0d3UHVsd0VSUjJRajJCeFdDVXgvNjE0RTBSWGQ4dE1MbW5ldmxN?=
 =?utf-8?Q?gDWzwiYwHTh+xjHqquOWZgy3R?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e0a659f-266b-4281-2b8b-08dd6d0d3696
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 08:56:07.7668 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vGWIQv6N8dyNttFYaHW8xiwsIUobDAHHgSbMgUs6tui8w8TL18Tz21Qs0KJQPg+p
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8251
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

Am 27.03.25 um 09:42 schrieb Philipp Stanner:
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
> effects to a callback and register it on the fence.

Good catch.

>
> Move the code from nouveau_fence_signal() into a dma_fence callback.
> Register that callback when creating the fence.

But that's a really ugly approach.

Either nouveau shouldn't implement the signaled callback or make sure that when returning true from the signaled callback the fence is also removed from the pending list.

>
> Cc: <stable@vger.kernel.org> # 4.10+
> Fixes: f54d1867005c ("dma-buf: Rename struct fence to dma_fence")
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
> I'm not entirely sure what Fixes-Tag is appropriate. The last time the
> line causing the signalled fence in the list was touched is the commit
> listed above.

Yeah, that's most likely not correct. My educated guess is that the bug was always there just never discovered.

Regards,
Christian.

> ---
>  drivers/gpu/drm/nouveau/nouveau_fence.c | 41 ++++++++++++++++---------
>  drivers/gpu/drm/nouveau/nouveau_fence.h |  1 +
>  2 files changed, 27 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
> index 7cc84472cece..b2c2241a8803 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
> @@ -50,24 +50,22 @@ nouveau_fctx(struct nouveau_fence *fence)
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
> -	if (test_bit(DMA_FENCE_FLAG_USER_BITS, &fence->base.flags)) {
> -		struct nouveau_fence_chan *fctx = nouveau_fctx(fence);
> -
> -		if (!--fctx->notify_ref)
> -			drop = 1;
> -	}
> +	if (test_bit(DMA_FENCE_FLAG_USER_BITS, &fence->base.flags))
> +		--fctx->notify_ref;
>  
>  	dma_fence_put(&fence->base);
> -	return drop;
>  }
>  
>  static struct nouveau_fence *
> @@ -93,7 +91,8 @@ nouveau_fence_context_kill(struct nouveau_fence_chan *fctx, int error)
>  		if (error)
>  			dma_fence_set_error(&fence->base, error);
>  
> -		if (nouveau_fence_signal(fence))
> +		dma_fence_signal_locked(&fence->base);
> +		if (fctx->notify_ref == 0)
>  			nvif_event_block(&fctx->event);
>  	}
>  	fctx->killed = 1;
> @@ -131,7 +130,6 @@ static int
>  nouveau_fence_update(struct nouveau_channel *chan, struct nouveau_fence_chan *fctx)
>  {
>  	struct nouveau_fence *fence;
> -	int drop = 0;
>  	u32 seq = fctx->read(chan);
>  
>  	while (!list_empty(&fctx->pending)) {
> @@ -140,10 +138,10 @@ nouveau_fence_update(struct nouveau_channel *chan, struct nouveau_fence_chan *fc
>  		if ((int)(seq - fence->base.seqno) < 0)
>  			break;
>  
> -		drop |= nouveau_fence_signal(fence);
> +		dma_fence_signal_locked(&fence->base);
>  	}
>  
> -	return drop;
> +	return fctx->notify_ref == 0 ? 1 : 0;
>  }
>  
>  static void
> @@ -235,6 +233,19 @@ nouveau_fence_emit(struct nouveau_fence *fence)
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
> +	dma_fence_put(&fence->base);
> +	if (ret)
> +		return ret;
> +
>  	ret = fctx->emit(fence);
>  	if (!ret) {
>  		dma_fence_get(&fence->base);
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

