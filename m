Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 936A3CC19D8
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 09:43:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D11910E188;
	Tue, 16 Dec 2025 08:43:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="SiwgbnVT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012031.outbound.protection.outlook.com [52.101.53.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7789510E188
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 08:43:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ElAPFYbzxgWyVVccfaMkITwjoTND4WTbre0M/gGgulqLX+9B22TSACSI42FWoRWshJJzIAzV2ipJxvxykYIWCr21038yEjVPYdu7fGslsiRuxSm95LeT9EjiWBoiXHmNHrCL+3e3fL95D5yX+i9hsbU4Hsiq8r3Op1ObJafCKdVHtP9yNUWwRRdGdUPiGPtz6ksfWZsfzvSV99Q7RFZjiKBiG6JZTplpdRE9nAtGeKURlXfekO/onCAjnkVKJADqGDE6nYexKR4TleHp4GbBja48SL5Gttkp6S1MZXJ9D96T5YoHBX9soEq9H159mtFlmnuVgkgEkJTOfvaPxio80w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zuE35zNRwJ18cYJm1zbS6Zt9CKpT2KUFzxKueG/gL3g=;
 b=nr89s5hxMTp4Rg6VxOCKxzz8tNNbMqt25jz0GiEHpokQOv0l04Darz7GQLsBIe+M65bg/k5EP0efDfFtbGjMgcgdRT/MlDeJtuTzBkr2/iihsTwnFFtVKxaKbE/gchg+d9HKARnw4kiN6u/29Pqj4I81AuE6lR7nQAJtGS72SM987JZQUAdwf3APxUWRCuW17/LTDiMfTehicGAVmjUDojsItJIL80hnEFi0Tz1xOP0IZkvAkKjbGNOuwUKglKAcno2dJrZrjyPARq9RXAkRIBBX8t0Im4iAtJOtI4C1oVS4yvs179aQSSUke5FexZD0a/Ytb/ARh4tP5fqJMFUQ6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zuE35zNRwJ18cYJm1zbS6Zt9CKpT2KUFzxKueG/gL3g=;
 b=SiwgbnVTiQcd1DtdctUlZkOvSKeHP8cdxUCQo2mUxYIP47dnbSqQuJRc6MbtrywunC4UNc6Q2PuEWweZSPuuRxKeGEeBHfIgFYu0+cF65Fxegb3XADD3oib03T1ME7P732a5T/ZeOdbiFFUk40+JYeTPyEIOCmKWwedeH7Gsf9Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH3PR12MB7643.namprd12.prod.outlook.com (2603:10b6:610:152::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Tue, 16 Dec
 2025 08:43:32 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 08:43:32 +0000
Message-ID: <7a41abc8-df47-459a-ab3e-ba7943fdd0ff@amd.com>
Date: Tue, 16 Dec 2025 09:43:26 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] dma-buf: add some tracepoints to debug.
To: Xiang Gao <gxxa03070307@gmail.com>, sumit.semwal@linaro.org,
 rostedt@goodmis.org, mhiramat@kernel.org
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, mathieu.desnoyers@efficios.com,
 dhowells@redhat.com, kuba@kernel.org, brauner@kernel.org,
 akpm@linux-foundation.org, linux-trace-kernel@vger.kernel.org,
 gaoxiang17 <gaoxiang17@xiaomi.com>
References: <20251216063952.516364-1-gxxa03070307@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251216063952.516364-1-gxxa03070307@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0084.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ff::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH3PR12MB7643:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fc8805f-3fc8-4fdf-0d05-08de3c7f318f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bGFNd1AvSU0rOTk1Ui9IbUNNTGRWdWJlY2Y1Zm1ETGFUOUhJUm5md0VUVitI?=
 =?utf-8?B?YWZRekNiUC9JSW1MTkkvbndVUUFIL0NLNVI4QmVwNXBlckdhU0ZFQVk3M2hK?=
 =?utf-8?B?NWF4Ry82RUx6RE44blVZSWpqSU0yQVRCbS9oRWFCcEVnS2htZEpjSEVPcjVr?=
 =?utf-8?B?U0dHRCtmWFBEY0w5eWkzWmhWVFNYR0tBVWl3a0Ftb2wxVzlOd3dLWlFHWS9O?=
 =?utf-8?B?T0N6MUFBZk52Q3F4MFRxdmNRNzlFWXNLUmUxTklucktGWXZCRkhORURMYjFy?=
 =?utf-8?B?S200VklsMUxnZzJ0Y2hoVGxIUDBzTUs3V0RqMnB3c1J1VGxIVG11bHFia2hm?=
 =?utf-8?B?VXpjWSs0M2xkb3UwRzBTNW10KzhJUjl3S3BZbmw5eWI4VCtrV0tKUWdQWEZJ?=
 =?utf-8?B?OGpNeW5JMXNIeXJhWHRpelJ4c1FYYWp1V3BYcVc0dUFxNm95YmIxZUIzSFRZ?=
 =?utf-8?B?ODRpeERSWm1hZ0Z2T1IxMTA2SG4wN0pDclRBQ2xOcy85amptVnJXbkQxWlhp?=
 =?utf-8?B?WG1QTmdPbGd3RDNzUzYzYUswb0hYZmFlNjgvaUtVZTRMMXVscEVxNUk1NnY3?=
 =?utf-8?B?TFh2R2M5Y3piemZPeTFxSDl5dHZWM1RIaGZMcnk1NHFjUUdtTXF3QitseExO?=
 =?utf-8?B?ckxWVFpkMGRYU3JTQW5sTUxUOTFxMUd3RjhOMENLUTlCK1hSRW5mSnF3Z1NK?=
 =?utf-8?B?SDFJQlJlWlI0YlIrNDV0MFFqaE04UmkxU2pVN1REb296Z0QxTER0RFVXaCtW?=
 =?utf-8?B?M3RVNTRBMnR4T25OQzFjc25URXRiSnkrT1Z2MHFLNEdrbTIwc1FJYmw4RmZ5?=
 =?utf-8?B?V2IyRXJnSzQzVkNpZ044Q1dreDdVQkVhY24yVWp2WWZUdXYzRlFTQzM5R1pH?=
 =?utf-8?B?eTUzaEhOeG5INkg3UFJYQ04yTnppT05TUEJRQnlKTWJLNzI4dThLZzhubmRt?=
 =?utf-8?B?MDN1L21SZW9VSTdJUi94MWpCYTRibU5UL2JkZFA4TU5LajU4ZkQxU1UxdXJh?=
 =?utf-8?B?d3BsT2ZEbEE4OGxSY3BGM2lYSkpLd1FqTUpvOWk3QWYzUEZkRytuVVdNcFRk?=
 =?utf-8?B?bmVxL2YwVjlNQmFDYVBnUmN2UWdpY1pRT3F1Njl0bmlxRXRzRGFNTVNUNzRq?=
 =?utf-8?B?Y0ZSZmVjS2FJdldIdEdHa1QxTXJ1andJcUE1aFlsdzh0RjVYNEtBTDMzV3Fv?=
 =?utf-8?B?c1FYTytheXNCRFl0NmNSUG12UTFrS3UxcytKa0N4bVo2Mjl2RWREM2F5amF0?=
 =?utf-8?B?YXo5Mk5WVExobHBkNSt3RFNzS0t3NlRpVTA5RTFBTzMrUzZNTmd2YTJ1SXlj?=
 =?utf-8?B?N0djeUVSdEVGL0NSUGI1a0RINkF5bnJuVHJxT09GdTRndGZodVk5Y0lrb280?=
 =?utf-8?B?aHZiZXFiL3BncTNabDQxRzNWV1NxM3ZVQm1kTnBUeExXdVkxeFc2UmdrMnBV?=
 =?utf-8?B?WTREelpiWU1QVCt0Vm5sVDYxSjJwMW1QM28xOEduQWdDUW5EY2J1RnJISVhz?=
 =?utf-8?B?TTEvVW5zL2xJRGpJZjR3MzEwU1EwbStoRUxXYks1KzdIbE5wNldLWUwzOWl6?=
 =?utf-8?B?M1MwTjdobnNYTGhUME4ycGR3dm5ZN2xSendJN1lycURhU3FiUi9kMkpTaGhW?=
 =?utf-8?B?alo4dUVNbFJYTjdrdHNleVZ6MXpYT0o4QTBpUWxwbmtnUVIwWXZZNERiTERk?=
 =?utf-8?B?NnpSOUdVMWNtd1VnS2FrNGJOTjNjS1Z1UUtKU21VSDNBZ0RRYWwvUGxvS1NC?=
 =?utf-8?B?aExpM3ZGbHVTRnM0Q2c2OUNNdzBsU2F4Yml5SmZxTDJZeE0zTDF0VFpyRjdx?=
 =?utf-8?B?TDdHTTRVR29GRjZ0amVWdUFMVmgxYXZ5Y3Y2bHZzWVZIc3Z2N1IrVERzbTZl?=
 =?utf-8?B?d2JxQ3FRemxsV005S3BNbW1TSjJhaFphUVRUMWF4QkJsdW9zalVYemo5bDJF?=
 =?utf-8?Q?KtW2tNiCZx+fShX0aBR1OFdFNaq6ouCD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UnRaNHhsVVN6SmJpVFB1TkVTYWdFVFdrK1kvYlBlZFpLWnkxaEFEdjdiWThs?=
 =?utf-8?B?bm1RaE5OV3pYSGZmN25PMU43MnlCcklMV0NRb3l4aWEwcUNROEZJUkVXMDRC?=
 =?utf-8?B?cG1xdW9LbDBGYlRVbjA0dG5qVE9tNFVKRmVGM2xHQ1dwdW9VSFVBT2N1UjdD?=
 =?utf-8?B?dHFzbFFYYzRjQkxvb0FBLzlLYS9YdlBJNCtCQlM1bm1qb1RvOFpOYlEvRHlN?=
 =?utf-8?B?aFN0emRkNW50Z3Y0Y2VQY2pRZktPNTZCQ25sMVRkOVlBN3dFZDZJaEEwODRU?=
 =?utf-8?B?RWdYeHIyNDMwUkNoTXRNaHBNQnNUODFNbGF2UWh6eW8ybEpmVWhaOFdNbmVQ?=
 =?utf-8?B?K3lRYmdyZnpDT2habktMNmQ1YTFHbUx0eStiV3BBSFVxUVJUanFwbzRBcWZj?=
 =?utf-8?B?bWMyVVNaT2lQRnB1YWJzOS9Uanc1VUFTM2E0Y0RkVTBrZlBOQlorY09CYWNj?=
 =?utf-8?B?bk0wNncwellLem5JNUtVUWFSck52WEtqYVN3R0hYSEdaQUhGNG11WU81N3kw?=
 =?utf-8?B?VjNJYjZwS2xZc2NpRmM1cVg2NVlTMjJRTEE3VFZSQy9jd0JVL2FDR1lqTDNH?=
 =?utf-8?B?aXpjVHp4S0RHbWlZelhLeTBUUE1iZ1dTMWVRNnJ1N3B3Zkkrd2NETU5nSGF0?=
 =?utf-8?B?eVF3YWtOcGxzaThUeEMxV0p3L0hpZmdnSHAyc2RDRFAxY1Z2TStMQnQ4U0ZJ?=
 =?utf-8?B?ZFpiTFMyK2N3TlB2Z3loQjFxa3ROUWZJWCsyZFMwT3BPSTFJc09maFBFa0Zx?=
 =?utf-8?B?Y0YrUWc0N0N5dG5keUwxOFZSNUZqMUNINXUraGI3NFFjcEVUOVNscG1qY3d6?=
 =?utf-8?B?TmloeVpON0JCdkpXZnREWS9wekZRZkZhdVJxMWxBQ1FVWENON3VlcHdkQlFF?=
 =?utf-8?B?RDA4R29vSXEwTnI3eWxCV0NTK2d1aE4vUUJZTTJxOGUzby9reExuWTNGT0cx?=
 =?utf-8?B?dHdmMnhOUjE4WnZYbE10aUZyUjRiRXB5UThOUmZlZTlTRjFZMDhoejBISHJ6?=
 =?utf-8?B?MlpycUFPV2ZGSWRiRytsRmFEcnovWVA5d2F5Ulg0TjZ3L0JYbGNVY2xOL3hK?=
 =?utf-8?B?OEN3b1lsY2NkbW1EaU92bUwxYXppVHFZcjQ4MGNWOEJpd2RJb2FzaXNtRnRS?=
 =?utf-8?B?cE1TUkg3bFRMdVJlZzlyaU5LbzFrbHpKRUw4ZVJQWkJtZTRNU0VzYkFtL0JD?=
 =?utf-8?B?ZmFJV3J0Ny9adFVRRGI5c29QcVhRVmdCeWJaOXpGbnZlbmQ3RHhwaGZ5czla?=
 =?utf-8?B?OGZXbVpDOWM0elRneEtmWFZYNDFKZjVWTTZGM1dUZjJNWTJaMU9IZWUybUpB?=
 =?utf-8?B?MjZBY2psZVE3ZXkrL25sclJHSUhqQ2FsYmhBd1A4K2RjS2l4T3ltWmpEc0VF?=
 =?utf-8?B?ZzBhWkdoT0l1dkQ1cFE3emh2bGpuMWNYaEgxNDVMV2toYW9HYytBODMwUUo3?=
 =?utf-8?B?TzVzS3FJeFhOcnBpeHpIMWZ5eXZlSURxVlhsMERjQ1E5MW5YY0dZMHV2emxY?=
 =?utf-8?B?VlE5dGhPTVBLSDVZODc0eGVPbDJvaTUvVmJDa2l2dEdWMUNlUnQ0bzRUK2oy?=
 =?utf-8?B?YTkzS1V4a0RQSkRBdmpVbXFkZGp1WFVjYzg3d2ZtQXF1UUg1NERpZlNYQWRh?=
 =?utf-8?B?UU01YUdTYnB2NWoydWtOOXMrSEdhZDZteXpVNEYxakkzdHVPdXdvS1lLS2Nt?=
 =?utf-8?B?Tm81d2NYUDNpZWtJK2FMdVNvbmZyMGFIL2JEOGhhcko0OFBkTlBUamg1R002?=
 =?utf-8?B?ejdzWloxT3RnNlZWMjIreXZqTzdkSkFjelNuRjRQYTFRdjZpTVRnU0FkQWxB?=
 =?utf-8?B?VExLU1RxcEthSnNvRnduYmkxNVNRQUlUY2ZUU3dZem1pdFpBdUoyOEVGUVIz?=
 =?utf-8?B?T09rWW9ERUdHRk9QMFFOQVNZaEdZck1ZVGQxOHRmYTREL1FTMnRwb3FuVzNE?=
 =?utf-8?B?ODI1QnRXaWowV0thWkRTMVAxVjJoTk1EMlBjMk9wVUQxRHh1TE1kdjlFVHV6?=
 =?utf-8?B?VVdyVnNNM1NtOW1uYU80WTYwSGpCQm1lekt3eU40ZHo4cFRCcVdUbzQ2OTY2?=
 =?utf-8?B?dmVzVkMyRmQrV0VlVnM1elZSVExzU2taWWFUSDlLZTM2SWZENzhjRGNTNlpJ?=
 =?utf-8?Q?pEfa17xEpzM7SLEGEhQwkbXfF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fc8805f-3fc8-4fdf-0d05-08de3c7f318f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 08:43:32.4947 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cEa8wZztsAublQVQ3JnLf248vubMP2fCRGDgnlk48XQpZwLl/PR0or0dbtOQBmbX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7643
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

On 12/16/25 07:39, Xiang Gao wrote:
> From: gaoxiang17 <gaoxiang17@xiaomi.com>
> 
> Since we can only inspect dmabuf by iterating over process FDs or the
> dmabuf_list, we need to add our own tracepoints to track its status in
> real time in production.
> 
> For example:
>    binder:3016_1-3102    [006] ...1.   255.126521: dma_buf_export: exp_name=qcom,system size=12685312 ino=2738
>    binder:3016_1-3102    [006] ...1.   255.126528: dma_buf_fd: exp_name=qcom,system size=12685312 ino=2738 fd=8
>    binder:3016_1-3102    [006] ...1.   255.126642: dma_buf_mmap_internal: exp_name=qcom,system size=28672 ino=2739
>      kworker/6:1-86      [006] ...1.   255.127194: dma_buf_put: exp_name=qcom,system size=12685312 ino=2738
>     RenderThread-9293    [006] ...1.   316.618179: dma_buf_get: exp_name=qcom,system size=12771328 ino=2762 fd=176
>     RenderThread-9293    [006] ...1.   316.618195: dma_buf_dynamic_attach: exp_name=qcom,system size=12771328 ino=2762 attachment:ffffff880a18dd00 is_dynamic=0 dev_name=kgsl-3d0
>     RenderThread-9293    [006] ...1.   318.878220: dma_buf_detach: exp_name=qcom,system size=12771328 ino=2762 attachment:ffffff880a18dd00 is_dynamic=0 dev_name=kgsl-3d0
> 
> Signed-off-by: Xiang Gao <gaoxiang17@xiaomi.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

Going to push this to drm-misc-next today unless somebody has some last minute objections.

Regards,
Christian.

> ---
>  drivers/dma-buf/dma-buf.c      |  42 ++++++++-
>  include/trace/events/dma_buf.h | 154 +++++++++++++++++++++++++++++++++
>  2 files changed, 195 insertions(+), 1 deletion(-)
>  create mode 100644 include/trace/events/dma_buf.h
> 
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 2bcf9ceca997..831973de76c4 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -35,6 +35,25 @@
>  
>  #include "dma-buf-sysfs-stats.h"
>  
> +#define CREATE_TRACE_POINTS
> +#include <trace/events/dma_buf.h>
> +
> +/*
> + * dmabuf->name must be accessed with holding dmabuf->name_lock.
> + * we need to take the lock around the tracepoint call itself where
> + * it is called in the code.
> + *
> + * Note: FUNC##_enabled() is a static branch that will only
> + *       be set when the trace event is enabled.
> + */
> +#define DMA_BUF_TRACE(FUNC, ...)                  \
> +    do {                                          \
> +        if (FUNC##_enabled()) {                   \
> +            guard(spinlock)(&dmabuf->name_lock); \
> +            FUNC(__VA_ARGS__);                    \
> +        }                                         \
> +    } while (0)
> +
>  static inline int is_dma_buf_file(struct file *);
>  
>  static DEFINE_MUTEX(dmabuf_list_mutex);
> @@ -220,6 +239,8 @@ static int dma_buf_mmap_internal(struct file *file, struct vm_area_struct *vma)
>  	    dmabuf->size >> PAGE_SHIFT)
>  		return -EINVAL;
>  
> +	DMA_BUF_TRACE(trace_dma_buf_mmap_internal, dmabuf);
> +
>  	return dmabuf->ops->mmap(dmabuf, vma);
>  }
>  
> @@ -745,6 +766,8 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
>  
>  	__dma_buf_list_add(dmabuf);
>  
> +	DMA_BUF_TRACE(trace_dma_buf_export, dmabuf);
> +
>  	return dmabuf;
>  
>  err_dmabuf:
> @@ -779,6 +802,8 @@ int dma_buf_fd(struct dma_buf *dmabuf, int flags)
>  
>  	fd_install(fd, dmabuf->file);
>  
> +	DMA_BUF_TRACE(trace_dma_buf_fd, dmabuf, fd);
> +
>  	return fd;
>  }
>  EXPORT_SYMBOL_NS_GPL(dma_buf_fd, "DMA_BUF");
> @@ -794,6 +819,7 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_fd, "DMA_BUF");
>  struct dma_buf *dma_buf_get(int fd)
>  {
>  	struct file *file;
> +	struct dma_buf *dmabuf;
>  
>  	file = fget(fd);
>  
> @@ -805,7 +831,11 @@ struct dma_buf *dma_buf_get(int fd)
>  		return ERR_PTR(-EINVAL);
>  	}
>  
> -	return file->private_data;
> +	dmabuf = file->private_data;
> +
> +	DMA_BUF_TRACE(trace_dma_buf_get, dmabuf, fd);
> +
> +	return dmabuf;
>  }
>  EXPORT_SYMBOL_NS_GPL(dma_buf_get, "DMA_BUF");
>  
> @@ -825,6 +855,8 @@ void dma_buf_put(struct dma_buf *dmabuf)
>  		return;
>  
>  	fput(dmabuf->file);
> +
> +	DMA_BUF_TRACE(trace_dma_buf_put, dmabuf);
>  }
>  EXPORT_SYMBOL_NS_GPL(dma_buf_put, "DMA_BUF");
>  
> @@ -979,6 +1011,9 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
>  	list_add(&attach->node, &dmabuf->attachments);
>  	dma_resv_unlock(dmabuf->resv);
>  
> +	DMA_BUF_TRACE(trace_dma_buf_dynamic_attach, dmabuf, attach,
> +		dma_buf_attachment_is_dynamic(attach), dev);
> +
>  	return attach;
>  
>  err_attach:
> @@ -1023,6 +1058,9 @@ void dma_buf_detach(struct dma_buf *dmabuf, struct dma_buf_attachment *attach)
>  	if (dmabuf->ops->detach)
>  		dmabuf->ops->detach(dmabuf, attach);
>  
> +	DMA_BUF_TRACE(trace_dma_buf_detach, dmabuf, attach,
> +		dma_buf_attachment_is_dynamic(attach), attach->dev);
> +
>  	kfree(attach);
>  }
>  EXPORT_SYMBOL_NS_GPL(dma_buf_detach, "DMA_BUF");
> @@ -1488,6 +1526,8 @@ int dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma,
>  	vma_set_file(vma, dmabuf->file);
>  	vma->vm_pgoff = pgoff;
>  
> +	DMA_BUF_TRACE(trace_dma_buf_mmap, dmabuf);
> +
>  	return dmabuf->ops->mmap(dmabuf, vma);
>  }
>  EXPORT_SYMBOL_NS_GPL(dma_buf_mmap, "DMA_BUF");
> diff --git a/include/trace/events/dma_buf.h b/include/trace/events/dma_buf.h
> new file mode 100644
> index 000000000000..81ee4d05979c
> --- /dev/null
> +++ b/include/trace/events/dma_buf.h
> @@ -0,0 +1,154 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#undef TRACE_SYSTEM
> +#define TRACE_SYSTEM dma_buf
> +
> +#if !defined(_TRACE_DMA_BUF_H) || defined(TRACE_HEADER_MULTI_READ)
> +#define _TRACE_DMA_BUF_H
> +
> +#include <linux/dma-buf.h>
> +#include <linux/tracepoint.h>
> +
> +DECLARE_EVENT_CLASS(dma_buf,
> +
> +	TP_PROTO(struct dma_buf *dmabuf),
> +
> +	TP_ARGS(dmabuf),
> +
> +	TP_STRUCT__entry(
> +		__string(exp_name, dmabuf->exp_name)
> +		__field(size_t, size)
> +		__field(ino_t, ino)
> +	),
> +
> +	TP_fast_assign(
> +		__assign_str(exp_name);
> +		__entry->size = dmabuf->size;
> +		__entry->ino = dmabuf->file->f_inode->i_ino;
> +	),
> +
> +	TP_printk("exp_name=%s size=%zu ino=%lu",
> +		  __get_str(exp_name),
> +		  __entry->size,
> +		  __entry->ino)
> +);
> +
> +DECLARE_EVENT_CLASS(dma_buf_attach_dev,
> +
> +	TP_PROTO(struct dma_buf *dmabuf, struct dma_buf_attachment *attach, bool is_dynamic, struct device *dev),
> +
> +	TP_ARGS(dmabuf, attach, is_dynamic, dev),
> +
> +	TP_STRUCT__entry(
> +		__string(dev_name, dev_name(dev))
> +		__string(exp_name, dmabuf->exp_name)
> +		__field(size_t, size)
> +		__field(ino_t, ino)
> +		__field(struct dma_buf_attachment *, attach)
> +		__field(bool, is_dynamic)
> +	),
> +
> +	TP_fast_assign(
> +		__assign_str(dev_name);
> +		__assign_str(exp_name);
> +		__entry->size = dmabuf->size;
> +		__entry->ino = dmabuf->file->f_inode->i_ino;
> +		__entry->is_dynamic = is_dynamic;
> +		__entry->attach = attach;
> +	),
> +
> +	TP_printk("exp_name=%s size=%zu ino=%lu attachment:%p is_dynamic=%d dev_name=%s",
> +		  __get_str(exp_name),
> +		  __entry->size,
> +		  __entry->ino,
> +		  __entry->attach,
> +		  __entry->is_dynamic,
> +		  __get_str(dev_name))
> +);
> +
> +DECLARE_EVENT_CLASS(dma_buf_fd,
> +
> +	TP_PROTO(struct dma_buf *dmabuf, int fd),
> +
> +	TP_ARGS(dmabuf, fd),
> +
> +	TP_STRUCT__entry(
> +		__string(exp_name, dmabuf->exp_name)
> +		__field(size_t, size)
> +		__field(ino_t, ino)
> +		__field(int, fd)
> +	),
> +
> +	TP_fast_assign(
> +		__assign_str(exp_name);
> +		__entry->size = dmabuf->size;
> +		__entry->ino = dmabuf->file->f_inode->i_ino;
> +		__entry->fd = fd;
> +	),
> +
> +	TP_printk("exp_name=%s size=%zu ino=%lu fd=%d",
> +		  __get_str(exp_name),
> +		  __entry->size,
> +		  __entry->ino,
> +		  __entry->fd)
> +);
> +
> +DEFINE_EVENT(dma_buf, dma_buf_export,
> +
> +	TP_PROTO(struct dma_buf *dmabuf),
> +
> +	TP_ARGS(dmabuf)
> +);
> +
> +DEFINE_EVENT(dma_buf, dma_buf_mmap_internal,
> +
> +	TP_PROTO(struct dma_buf *dmabuf),
> +
> +	TP_ARGS(dmabuf)
> +);
> +
> +DEFINE_EVENT(dma_buf, dma_buf_mmap,
> +
> +	TP_PROTO(struct dma_buf *dmabuf),
> +
> +	TP_ARGS(dmabuf)
> +);
> +
> +DEFINE_EVENT(dma_buf, dma_buf_put,
> +
> +	TP_PROTO(struct dma_buf *dmabuf),
> +
> +	TP_ARGS(dmabuf)
> +);
> +
> +DEFINE_EVENT(dma_buf_attach_dev, dma_buf_dynamic_attach,
> +
> +	TP_PROTO(struct dma_buf *dmabuf, struct dma_buf_attachment *attach, bool is_dynamic, struct device *dev),
> +
> +	TP_ARGS(dmabuf, attach, is_dynamic, dev)
> +);
> +
> +DEFINE_EVENT(dma_buf_attach_dev, dma_buf_detach,
> +
> +	TP_PROTO(struct dma_buf *dmabuf, struct dma_buf_attachment *attach, bool is_dynamic, struct device *dev),
> +
> +	TP_ARGS(dmabuf, attach, is_dynamic, dev)
> +);
> +
> +DEFINE_EVENT(dma_buf_fd, dma_buf_fd,
> +
> +	TP_PROTO(struct dma_buf *dmabuf, int fd),
> +
> +	TP_ARGS(dmabuf, fd)
> +);
> +
> +DEFINE_EVENT(dma_buf_fd, dma_buf_get,
> +
> +	TP_PROTO(struct dma_buf *dmabuf, int fd),
> +
> +	TP_ARGS(dmabuf, fd)
> +);
> +
> +#endif /* _TRACE_DMA_BUF_H */
> +
> +/* This part must be outside protection */
> +#include <trace/define_trace.h>

