Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8D2AB53DB
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 13:31:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83AEC10E587;
	Tue, 13 May 2025 11:31:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="IhjuymU+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2045.outbound.protection.outlook.com [40.107.244.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C46A810E593
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 11:31:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FltISfa0CYd4Q/u9LAuHNBSq3ZNI7HoI7b5UWDVSRIaeGLANMlqziRNTE2SIYoWYt4FvtxayAaeonVavq7uH9h5k2P5xdkvzjQ/salCSSiOZxZX9otwZUN4C9xWUjj3desOCUkVRucLmUQdvXjHADSKTgipvm2/b+8+qr03cmucKiVVBTN6DEdXy2HmMZXK5U+N/hjfxcVJl2e7v/B+iU4EJNfnKNnRKw7W2zmQ+TWwYyiJg1j9r62gUGPTf7GeWLza+H+bqQKBO+UJqkpmgmnVGoUv6BkOIZOmX2fmFMDq3NW99YeV2RhUjkO33tj/SWp6R8FccbXolTxMimiw8NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HfCEEWJY14sONURDBzookpR9WsPKuxRV8mZhkE3jIvk=;
 b=s1icjI0sy01FL+p9VL3x58v2wke/zRNN8/fWLUCX8e3RjfCLOK6CKoszERM8dXGfatV5GUHA4Nf0Gw6OZ/ea28nJ7sBV3NWKWGJZl+kPorxtM+Ux+Rgx3t1DDy8PJlNfOXELsffvp3TeXE0Q8dI1ZRVMG4LAqNLRJvazy8bE0TaQwI71d6YJu8YPIcvRIOWcIYf7hOD2xPm8Nr4miyWWubBQw0+TnRvRmPr3YEctRT4Kyjj4rt92CnYq3RKErBTbV3lkVvgjEDg5VHz5lrkBr2VtmUHJNZ1MhsqewtfhFRdTNBq5CB0qircIWcVBjHqUpqaj4KAX+gCbP27Sx9bzCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HfCEEWJY14sONURDBzookpR9WsPKuxRV8mZhkE3jIvk=;
 b=IhjuymU+TWlKogcFsReoFqdv9Vixw/3WhxD7BPliYsRz4H9McpscMcbfo028yRQC+CVUay/N1R5mqB6QJ5b9WpbvizVY3pOnktk92eqjzXho0R/c4hEK1/ABlsBoHGd9kIK0QGDvC8pB8eZEMBHTiLpNgxAYyuy0y4zzjMjntB4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM6PR12MB4313.namprd12.prod.outlook.com (2603:10b6:5:21e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Tue, 13 May
 2025 11:31:14 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 11:31:12 +0000
Message-ID: <d77ed1c0-3f66-447a-956f-37e1dd543ca3@amd.com>
Date: Tue, 13 May 2025 13:31:06 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dmabuf: add DMA_BUF_IOCTL_RW_FILE
To: wangtao <tao.wangtao@honor.com>, sumit.semwal@linaro.org,
 benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, jstultz@google.com,
 tjmercier@google.com
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 bintian.wang@honor.com, yipengxiang@honor.com, liulu.liu@honor.com,
 feng.han@honor.com
References: <20250513092735.1931-1-tao.wangtao@honor.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250513092735.1931-1-tao.wangtao@honor.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0336.namprd13.prod.outlook.com
 (2603:10b6:208:2c6::11) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM6PR12MB4313:EE_
X-MS-Office365-Filtering-Correlation-Id: f7fe3c10-b8f0-4155-fb7c-08dd9211aa04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|1800799024|366016|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bitVYkJLVVF5TXRuL1lmYy9ZbFlXOENTZkszeG5mV25jWGN1TzVYdkR1dnNv?=
 =?utf-8?B?L3ZsUGE2OFZTQ29WNTV2RXVrK2xOSUQ4SHFib3FPenNaNFRNcGN6YktqQ1lp?=
 =?utf-8?B?ZHBxbGJMVjJPTUJtZCtMUWwzNjN3ZVdzdnVETXk1cnYycElBY09lOUR1OVU0?=
 =?utf-8?B?N2w3UzlIUjdLcUxiTEtzOHRyNUFVS01EVlNTcE1CbkVIc1lPSVV4MWlmU1FP?=
 =?utf-8?B?dE90b0VUWDVXZjB6MFJNb0lRc011LzZTTXhxdHVsWG9rMUdMblA1aDMrci9S?=
 =?utf-8?B?bkl1YlM5MDZlWWRhYTluUlRXWUtyR2FEYnlFdkV6aUN1SVJ1UENEVjZkNXBJ?=
 =?utf-8?B?cUthRkc3Uk56S0ZUQkUzWnpjTWJBYTN1SXoxa2Z0WXFlS0JnOXhQSFVmNkFw?=
 =?utf-8?B?ZDFhdE55QkVYb1BpRFY3cGMyNDJ3MFAyelhMTDJ3QUQrUjFzRldobDNzSFVz?=
 =?utf-8?B?Wld4dE9YUDdLVHdlYUx3c1hZOTZaUWZkMWh1Mnd4ejdTcGdNaU1ucllRN3cy?=
 =?utf-8?B?dlBVY2F6MThDLzlqa0NIMTlNMm40d21ZMFpsY2RJaTBQR29LYmNLRitXREwx?=
 =?utf-8?B?V3VLQ25wT3U2Z1NkWjd3cThCUlpPWFcwZlE0cHNoVFlGdlJJaE1yZy9hZ3Aw?=
 =?utf-8?B?TlhIMStWdDZ5Vjg4b1JNRFFURkk5WUQzYmszNEErT1lYclFXcUtYeEpJK0sv?=
 =?utf-8?B?TkQ2UTNhaW5Mb1NPa1ZqNkpWY0luSlI3ODVoZ2JQNTFqaWN3M1ZrQ0hjUnEv?=
 =?utf-8?B?SzZ0Z1RrdTR3MjFDanRyYU82SkhySEFqanhsOXJwWFEwd1I3ZjdPT3FiNUJl?=
 =?utf-8?B?VG9vVEV6K2pFS29weUQ1MlVpamw1ajVqN3BLQlprcU9idEVDS0xqSVhoaUNt?=
 =?utf-8?B?c08wRGI0RzMxSHBsSGYzR2thaEZRTThOK2xibnJnZGZjVzdTZVlSTGMvdFJ0?=
 =?utf-8?B?SEU2YkdNREx1Q3Q0NjVpWERQZHlaOVhFcGFKams2SW4rdnBwcnBPRTdvdjl2?=
 =?utf-8?B?ckp4TVlMcHAvWC9nOTBxNU5mbThPZU5CUm5UKzh1VnRwaUJsOEdTMWNNWlc3?=
 =?utf-8?B?RDF4bzJrY1RvZXc4U1hqelZkZVhIRXNPYmtKd24zblczZzZmK09rNHFsRUxO?=
 =?utf-8?B?N0NqOXZuazl5bjBKVEMzZXdwTFNqcXJhSXZFMHhwUzlMNzVYTHVqL25admUz?=
 =?utf-8?B?WXZJUCt0bjYyNmpPeXQyOFhkaFhMWlA0UEVTNVl4TlhyQXpmcGN4eWFqUWdp?=
 =?utf-8?B?MkJmN0kvKzRLN2JOMDhaVkt3Tm9WT1B3dHBXbHFSWFZ6ajNiUFB3Z1JuVzJj?=
 =?utf-8?B?V3NjdWdVZGdTU0cxSEpUZmtRcTZ4S05pZFY0aVRtRkdIdC9CaSt4WW5PaEgz?=
 =?utf-8?B?ZW5KQ0JSWjhJZFB6TlRRQ2IvWFpHMkNjVk1WYTJqbFgyU1NPaThiL0U4aFp6?=
 =?utf-8?B?LzArT2FncXZ1akNQR1g4RDJoYWx3NUVuYTNWWlI1Qm15SzRRL2doYndKQzhk?=
 =?utf-8?B?bno0MlluVlZNV2lzQU5XZG9CcVo0bERmT3RRT2pYZGhBWkNsRnFhTWRERGVJ?=
 =?utf-8?B?MUJzd25zMVVQOURIdmVWQXJEd0JYSElaUGFFSUJmc2dXNENxQ3NMbEpGcFBv?=
 =?utf-8?B?TktoS2dETnU5RkdMVlVJTEhESDI2NkcwTFFJckFSUDNSK1krbG5OT2VTeFR6?=
 =?utf-8?B?NVZqb1BTTUxoU3RoVGdXaE9KeEdkcWVTOEpiSmNsNkk5OXFDUG5vbEt3Y1p1?=
 =?utf-8?B?bWdRWVJhUm1JS2xxWXQxMU5NMEQwUHV0bmsybGtlMmdhNm5IVEF6WitzSmZ6?=
 =?utf-8?B?dk1lQXhLRlJDSStQV21VQ25GeVJnL0NqR0tSN1hNU21KVTdSTy9ZT05SVFRJ?=
 =?utf-8?B?S2ZxOE9qdkJnMnNrd1B1emJDSGhNR0hOZWRXKzNwV1lRN0ZsRGVsU1I5blU4?=
 =?utf-8?Q?/O/MVvHuVcE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(366016)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qk9lNTQwZjBSa2lXVURkbU5sbkNBeEpwR3hHNWtiNGpCL3FlQ2poZjZHSDcw?=
 =?utf-8?B?Z2Z0dGhrMWFHTVlLMUNvL3BqcW1EaXVGSlVGNXRudjhkSWwydGE4QUN5Rmsz?=
 =?utf-8?B?VEUyRDRmb3Q0NXZLNDV0N21wdEZjb3Eyb1hnNUNaaTkrVkMwVUE5ZXF0S0xm?=
 =?utf-8?B?M21GSENnWWFHNFI2VnlBWDAzZDEvTStuSkF0QnFvQ3JGMm0wTUlqajdrR1VS?=
 =?utf-8?B?RFhuWkxOMmFRRUxBOUZJZTJ1NnBNOVpDYTkycFU0Q0dEY0VJVFlYU1ZQbHIw?=
 =?utf-8?B?bUdqVnh0d1hBWFo4bjVvVWJwYkl1QW0zc3RLd1hTeUEvNncxZVlVY2ZjZTJB?=
 =?utf-8?B?VEsveW5pYWg4NlliWE5VT2xwK3pHWEF1MzhsZnFhemtkNDg1eTdSM2srdnA5?=
 =?utf-8?B?SU0yb0x3cysrT1VGaEh1cXVoWDFCM2lFYy9CZjVFMzdhT2hNSWxQd29uemV3?=
 =?utf-8?B?aXFwRlVCMC9xSnUwUStPcmhqeXRiZjFBZjZjeUFaY0J2b2tzWUROS0RjeFBP?=
 =?utf-8?B?TGZpRFAwK0sxWVYwVWIxY0tldnY3Y0czOEZoZVh2YlJ3TFIwV1BhNUNtSjdm?=
 =?utf-8?B?ZDRybmZUSDQ3Mk01ZytZY0VuVXJXbTZNRlhWUGxqUmRTMkVReEhaV3VMb2M2?=
 =?utf-8?B?ekc2czdqblIyTDA3VWRjaUJsVXF1MEhzS1VGUzZNZGNWaGlVNDFyMEhRMUN6?=
 =?utf-8?B?bU1uMlkzZElJOFdzakpHTkQrcm03MzU3RWxYT294ZWpCdUdYK2ozUSt1RzA4?=
 =?utf-8?B?a3FnSzBTeVNIVVg4c0FRaUxNYzBSMGcvM0NCL3IzcjFINXREeE1xdSt1ck1F?=
 =?utf-8?B?U3F6ZzZwSm42VW1abnJ4ZGZCUU1MV0FFbmNQcXMwWlRjRitvWU5MMU1wVVBl?=
 =?utf-8?B?ejVUNTREcks3a21MbG9YQnV2aE5zYmN0RHJhNGszMjZsWGE0aVYzVGtNaklk?=
 =?utf-8?B?aENtWDVWd2Y4Y3lnclpNamwwdjNxUEVlVml2OEdvdk1udkhrK2o2bnNaNW52?=
 =?utf-8?B?eFJTM2g0UzV4Vy85cGtkQTQzKytFdVZDb3E1WnVtMzdhdCs4bmMwSXZIdXNW?=
 =?utf-8?B?RWNFQk9BRi9PVFBvaVdPWG1rS1dZNVJGdnR3UVkzdG9vQ1BYMWdpQ0EwdWZ6?=
 =?utf-8?B?a2c4M1Y2dWJqemQ4elhwTUtMNUlqZndhdFdGY212czdna3V0alpZWXVOLzY4?=
 =?utf-8?B?MWFzaGVXaitnRXpHWVMzR21rUEQ3U3FxRWtxRDVwZHNqSzVId2hVK1UrWkRt?=
 =?utf-8?B?c3JjU0oyVW5EYlBNU0lTSzJZU1Bxc2YwN0RYVGVUNjg2aTVKaGZMc2xtRFZa?=
 =?utf-8?B?ejVPWFV2NnMzM2Q3QVgvOGxkbjZNMS9IM3NnUW9qdU1Jams0dXNsUzh3ck0y?=
 =?utf-8?B?c3VOa1psejExajdiQ3lSc0tXeFEyR29xU3NDbFFVZEQ1em55bWliTkRZYStF?=
 =?utf-8?B?TXR1VUlQUXRhNElHeUxsckpkUTE3VVpPWHRYZ3VKc3JwekRoZmRiTEtUV2tN?=
 =?utf-8?B?a2RBKzAvNVhtSUlhVVN0bEpNa0l5bSs1dlpocGFqTWZLUVJ6cUs4NXVEREI1?=
 =?utf-8?B?Ty9oeWVOREFWQzJMZGN3RDBhYllrM2FGSjJONnF0U3lDdldmQUljS0w3RXRO?=
 =?utf-8?B?bDhieVMrZFdMbkVQT29DSWg2SkRzYi9Jb2ZtaEYvVHZpdmNWR1RCVVpkb0Q4?=
 =?utf-8?B?N0c0Y1FsYU5BR0ZUeHNjeXZCRjhNVFlRYWo3M1ZUNEs5czI4WFZnaktEZ2RB?=
 =?utf-8?B?aC94cStTeFgvenJQelc1QmNDQzVhS1NhSy9tc0xBdkt6WGkwY0Mxa255UmRn?=
 =?utf-8?B?THBIQUViK1N1akM1cGFVWmxuSzd5Y1lkZS9PQWlPa2RZbGpxVzROV0gwU1ZY?=
 =?utf-8?B?NWljWS9LdVpWWUx3MSthN2dlOEFuY0ZHeFhGeUc0NUJ0MFRlUStMaThTMUJM?=
 =?utf-8?B?L0xVMnRUZE41eElHR2pveG9LYUVmK0xoRkcvNjJYYzF4WGZIcGJoOWFpdXBK?=
 =?utf-8?B?dHBHeVRqN3ZzRyt4K1BSWG15ejhzeTRxT2dIbXdjQXFWV3VsV3VoZllRRGtm?=
 =?utf-8?B?WVVnUzJkZVdSMXhTWTZhVE1wbFdYMExKbXNMbHVCNzNrbzBUZ0NhRHNWVVZ4?=
 =?utf-8?Q?U2K8=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7fe3c10-b8f0-4155-fb7c-08dd9211aa04
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 11:31:12.2418 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zs569euPA7NRRAxvrZKM5LyshOI74TZgyx5ghAyMXjQbou44TfPBAFfaoH4RfJ7H
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4313
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

On 5/13/25 11:27, wangtao wrote:
> Add DMA_BUF_IOCTL_RW_FILE to save/restore data from/to a dma-buf.

Similar approach where rejected before in favor of using udmabuf.

Is there any reason you can't use that approach as well?

Regards,
Christian. 

> 
> Signed-off-by: wangtao <tao.wangtao@honor.com>
> ---
>  drivers/dma-buf/dma-buf.c    |  8 ++++++++
>  include/linux/dma-buf.h      |  3 +++
>  include/uapi/linux/dma-buf.h | 29 +++++++++++++++++++++++++++++
>  3 files changed, 40 insertions(+)
> 
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 5baa83b85515..95d8b0158ffd 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -460,6 +460,7 @@ static long dma_buf_ioctl(struct file *file,
>  	struct dma_buf *dmabuf;
>  	struct dma_buf_sync sync;
>  	enum dma_data_direction direction;
> +	struct dma_buf_rw_file kfile;
>  	int ret;
>  
>  	dmabuf = file->private_data;
> @@ -504,6 +505,13 @@ static long dma_buf_ioctl(struct file *file,
>  		return dma_buf_import_sync_file(dmabuf, (const void __user *)arg);
>  #endif
>  
> +	case DMA_BUF_IOCTL_RW_FILE:
> +		if (copy_from_user(&kfile, (void __user *) arg, sizeof(kfile)))
> +			return -EFAULT;
> +		if (!dmabuf->ops->rw_file)
> +			return -EINVAL;
> +		return dmabuf->ops->rw_file(dmabuf, &kfile);
> +
>  	default:
>  		return -ENOTTY;
>  	}
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index 36216d28d8bd..de236ba2094b 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -22,6 +22,7 @@
>  #include <linux/fs.h>
>  #include <linux/dma-fence.h>
>  #include <linux/wait.h>
> +#include <uapi/linux/dma-buf.h>
>  
>  struct device;
>  struct dma_buf;
> @@ -285,6 +286,8 @@ struct dma_buf_ops {
>  
>  	int (*vmap)(struct dma_buf *dmabuf, struct iosys_map *map);
>  	void (*vunmap)(struct dma_buf *dmabuf, struct iosys_map *map);
> +
> +	int (*rw_file)(struct dma_buf *dmabuf, struct dma_buf_rw_file *file);
>  };
>  
>  /**
> diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.h
> index 5a6fda66d9ad..ec9164b7b753 100644
> --- a/include/uapi/linux/dma-buf.h
> +++ b/include/uapi/linux/dma-buf.h
> @@ -167,6 +167,29 @@ struct dma_buf_import_sync_file {
>  	__s32 fd;
>  };
>  
> +/**
> + * struct dma_buf_rw_file - read/write file associated with a dma-buf
> + *
> + * Userspace can performs a DMA_BUF_IOCTL_BACK to save data from a dma-buf or
> + * restore data to a dma-buf.
> + */
> +struct dma_buf_rw_file {
> +
> +	/** @flags: Flags indicating read/write for this dma-buf. */
> +	__u32 flags;
> +	/** @fd: File descriptor of the file associated with this dma-buf. */
> +	__s32 fd;
> +	/** @file_offset: Offset within the file where this dma-buf starts.
> +	 *
> +	 *  Offset and Length must be page-aligned for direct I/O.
> +	 */
> +	__u64 file_offset;
> +	/** @buf_offset: Offset within this dma-buf where the read/write starts. */
> +	__u64 buf_offset;
> +	/** @buf_len: Length of this dma-buf read/write. */
> +	__u64 buf_len;
> +};
> +
>  #define DMA_BUF_BASE		'b'
>  #define DMA_BUF_IOCTL_SYNC	_IOW(DMA_BUF_BASE, 0, struct dma_buf_sync)
>  
> @@ -179,4 +202,10 @@ struct dma_buf_import_sync_file {
>  #define DMA_BUF_IOCTL_EXPORT_SYNC_FILE	_IOWR(DMA_BUF_BASE, 2, struct dma_buf_export_sync_file)
>  #define DMA_BUF_IOCTL_IMPORT_SYNC_FILE	_IOW(DMA_BUF_BASE, 3, struct dma_buf_import_sync_file)
>  
> +#define DMA_BUF_RW_FLAGS_OP_MASK (0xFF << 0)
> +#define DMA_BUF_RW_FLAGS_READ (1 << 0) /* Restore dma-buf data */
> +#define DMA_BUF_RW_FLAGS_WRITE (2 << 0) /* Save dma-buf data */
> +#define DMA_BUF_RW_FLAGS_DIRECT (1u << 31) /* Direct read/write file */
> +#define DMA_BUF_IOCTL_RW_FILE	_IOW(DMA_BUF_BASE, 4, struct dma_buf_rw_file)
> +
>  #endif

