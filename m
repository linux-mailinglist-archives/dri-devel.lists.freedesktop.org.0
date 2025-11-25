Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 374ACC85316
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 14:35:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2AD210E3F3;
	Tue, 25 Nov 2025 13:35:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="bdWAo1RS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013031.outbound.protection.outlook.com
 [40.107.201.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97FBD10E3F3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 13:35:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XPGykSvOYG8CyPuCfG6tjKMGEY+XADfmeuIAKWNVyF6FlpZaM6xeObFVlc87cz1drkrdfwPn4+VDyNkOk6cXWgvvgz334t7i1vQq9Kuz9QN3J5qdhmIDyEYYMzocQEYGxaoLFBatp6Tqj9KzlV4iYzSvMH7vnm+RW1h3kDSgMetpC1JooYhgchUaPdY3YQ+nWrIUGX4CAbRu69AowSvgyI+dJgcgGD6VLUyCjSp5yw9qEwMLs+v0P5+SDk+eoXRnFh5kflecPuTq3MmRdh32wwSqHyIrLhYMmVLwyKqOKl+4KS2IRRLcQHWPm6IDPYQyIfDKmP8FSj6Mqxvf7TdjMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6g7lVGdhX6ltzupXW6bdv6eq0bOIsV9bf7BO7OsXAqQ=;
 b=e6W2Xymw1fDA2gYo/c/HxiqFz5m6J2vmHmE506DiTXSnhrvt2Ol1w1msbIyyhNMtiJ0sI6+IDHEUpdn/3q54byU/iD4f+X+g43MRbH/Kba9unerLEsaz8B0EeCxXqcuh/CgUueQcBLFD4D6AZXM0VBqqyQ3B4a/i3xnFWFnFakOToyeLHY2o+ruf5a4MisopmT8AQVukgzlXr8Vwjg9gsKzjkft7Chqco0pD5oGKOONagkJ+5SS6v3ELrmzdPybMAFVyDCndmEGblMi0iU4zgP3S76N7aYWQp14OkvbgtYJajjbjab/HpRp5VUKyEjTjXzTUW9uoFH9cjbH7+CpccA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6g7lVGdhX6ltzupXW6bdv6eq0bOIsV9bf7BO7OsXAqQ=;
 b=bdWAo1RS3ixR6uPsERq8dJBsOuBZOyI7LWWKNicXZD6pKd6yj0UPxvb4pbB1q+4d9GhEQ7A+17H39Ki3SBS1tsT6LjPRjr0TgXwOKd5uXRaQxCfOXisRHj/szzaCDUyliMheJ0xa36pdrJOdD902Ssbpf9c2UlKQ3LM3/dOPx1s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB7826.namprd12.prod.outlook.com (2603:10b6:8:148::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Tue, 25 Nov
 2025 13:35:27 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9366.009; Tue, 25 Nov 2025
 13:35:27 +0000
Message-ID: <262228c2-123c-4825-89fc-7779268027b3@amd.com>
Date: Tue, 25 Nov 2025 14:35:19 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dma-buf: Add __dma_fence_is_signaled()
To: Philipp Stanner <phasta@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Gustavo Padovan
 <gustavo@padovan.org>, Daniel Almeida <daniel.almeida@collabora.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
References: <20251125104443.82974-2-phasta@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251125104443.82974-2-phasta@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0125.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b9::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB7826:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e206929-77d6-4367-6b5f-08de2c277e97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bVd6eWJHUFQ1RWtYYVAvUGFZd3RZN2MrOEFMT2lxd1lJOXlXNjdra0YxVEM0?=
 =?utf-8?B?ZFhNTWluTHZjZmJBV2gzOWtUNjNsajA5dlNDcDBHOHhYQ2s1MjA5YlY1SmY1?=
 =?utf-8?B?OWJ0TXlXeE5SUGtITWtydVRXQmFDd2RXaE9PcjdLMW8yc0ZIY1hHdXZxQ0FP?=
 =?utf-8?B?TkU0Y2tvZjVFdzMzWTdLNTh6VUxKWU0vMDNaamVEM1RaTEFENGdLY1NXZWZF?=
 =?utf-8?B?UzZ0akoxVGhMazRjQk9TOXdBdFZMYUhIQ1JlMEVmMzhIMzBobzBqbFdWb083?=
 =?utf-8?B?TGJDUkNkOXcyL1NWN0tPVVlJTWdmVnY4bFVyYWhHenhzYXk4SmxFMjA3Q3Iz?=
 =?utf-8?B?dCszSWR4bmVlcCsvcG44V1ZLTGtlNVpUSVBvd1owN0sycnVWUTNMWjZ0UEp2?=
 =?utf-8?B?dktYMnQ5dDJXWm16WnlwdEZ1SllNb3RDOUVSd3AvY1dhUkdYVUFYOW4wL0Rm?=
 =?utf-8?B?ZkJWSWtVUzRjSkVYNUtpMDU5U0RSQ1pHc2F3M242OWM4VkRLWDlTRCsvWmw0?=
 =?utf-8?B?R0VWcElvUmY3ejJSMTk5eHJHNWlTb2EzNWdHTzBYRDh6ODlKTkwyMTYvTzFt?=
 =?utf-8?B?bWlLbmRhcXVkL3ZJNkNhY3FTVnJCd29hUnJ2Qnd2K0tBcDVneTM4Rkp3Z1NN?=
 =?utf-8?B?SlJQUkdjM203eFhINFJIVVlhREZPcWsrdTVRYUlRK3ZuLzM4WlUyYzNwNVRE?=
 =?utf-8?B?dU5aRWRmWDNTS0dzMGcrS1ZsK0ZTeFlQSXp4UlhQL2JydDVLWjJtcnF3V3FE?=
 =?utf-8?B?djRtcXFMVmx5RityZTl3Y3VKeVR4VVlsMmJQaUZ0TDdSZldNUFJvam5LWC9Q?=
 =?utf-8?B?WlE5UDFXN3dFcmUybTJKcmlubS9JVE9KVmtyWFJRYlpKMFB2OHFxUFArWEJt?=
 =?utf-8?B?dG41dW55ZHc3bzAwcWh6YWdGTSs4TFNiMjQzM0lIdjlPaitKVHZ6Vk5ZZTg3?=
 =?utf-8?B?OG0xRnhQaHNuYk9ieTdGSldMdHJibzBiQ3BMLytwYk5DeDFENVc1Z0VhMWFo?=
 =?utf-8?B?OURHKzlwWUxBeHd5YVBQNSsrdzlnYitxMkpOcWlnMGFqamdIYngvc1FjSnF6?=
 =?utf-8?B?VER0U2JBL2dOVlhVZ2t5SmlwNnlhTE5QdmMvLy9YWGhyS29qcTM2Sis0UWZy?=
 =?utf-8?B?UkZNV3dnelByVmVQWi9NamxvVVY0dzBhcnhlMlFocjJUMnk3NStURXQwQlBX?=
 =?utf-8?B?TWdQVVlxb2dhK0FXcmxaeHlwRENZaWk0QVlyN3luT3QzWG1lMXFMQU5Xb0tI?=
 =?utf-8?B?cXM4bmxpZnJQNzM3bHFvQWsrM0FwV2ZlcU5Wb3JTUFhyVWRPcUxVbCtkYjRa?=
 =?utf-8?B?QzVQS1l1T1Izd3hXV2dYQTRZL3kwRC9QQlJPK1FreG1aSUN2eFNmVThHbVJQ?=
 =?utf-8?B?Mk5QYnd0L2lYRm5KKy96S3cyMlZHcklGQVFGREJBMHFpazB6d1pvRm9ya2dH?=
 =?utf-8?B?bFNXR0lCb21oVk5JOHdBMTNSV1phTGcycWo0UHllREF2emE0akhrYzFRK2p4?=
 =?utf-8?B?dGlXUGlsS3V6NHFRZUxYblV2SXNhK2UyQXI2SGlpZmVJM09sRWQzaElzNXdL?=
 =?utf-8?B?aXJlUysrNUZXSkoyMnpsaTdpb244UytXWVFXRi9Kbkk2andsNUFwdzlFT0Ry?=
 =?utf-8?B?dVNhb0duaEF2cVUybnRKSldmRlFQQU0vbnN3NjA2ck53UXBRMlNrNCtvb1ow?=
 =?utf-8?B?WVRjeTFwamVQdUpaRm1WRUZnZ2NLYzdnWXBVQ2tWem5sZDF5cXFaNXVTNms4?=
 =?utf-8?B?MGV4RHVBWEU4ekNzTFhnRExwa2pZYnQxRTRzVVc1TENlUWMxMUxGUWZERHNR?=
 =?utf-8?B?cGpSdFVGeGZKZDY2SmdRenpDbVE4WElYZEoybUpxYjgweTFIQXBPRVRPWGFO?=
 =?utf-8?B?S2ZRMEozNmJaVE9pZnV5L2VrS3J5MUhaajNFcjdVRWNPanB3TmFIdy9nSTVr?=
 =?utf-8?Q?MWsq4/yl/jiUMTleflw0kVYOkuhBt9CJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?alhtRGUyOUVnNmt4QWZrZHdQc3JBN3VxT1Rrb2pRWTdCc1hJSGhXUkxLVFBG?=
 =?utf-8?B?UjhiR09yc2pvelZ5WWN6TVkra2dsU3dVUEYwOWtIWU1ud3dFcjIyaGpUeXcx?=
 =?utf-8?B?cWZ5NXFsWkRIMlhKUHRtUTZnS01kOEJYSzFXODRNNEZLdW5JR1dzdDlTc0tk?=
 =?utf-8?B?ZGlzS1BLZWtiWHVHVWZSNDUxMGNBRzdETlNNSlIvMG45cVJXK1FJMG9WRTVs?=
 =?utf-8?B?bEl5ZW9TWWlWakNSMmtzUzFpUUY4amN4WWxVY1FmcTZZQjBOVUdCdTBBWUV0?=
 =?utf-8?B?eVBKZ3pYa29SM29Tdjg0NWhvRFhPMHFhMFpoZ2FqRHk3NitoN1hBa3FOcjFo?=
 =?utf-8?B?OWtsVkFhUUp2SCtWQ0NBWnh2T1dYY0llcjIwQ1JnaFQ1NFpmTkpiRDdERU1I?=
 =?utf-8?B?ZlczaEtwVmNianlLYmZtd1ZGWFE4K0tsYWdYM3pBY2lOeWh6Nk5iRE9NdWFy?=
 =?utf-8?B?eWZLZnYwOXZCREhMQW9STStuYXN3a21saU5FRmg2bUlvOFgvVmhRRTMwQWU5?=
 =?utf-8?B?dmREOFlqeDhKbUN4MlpEWUtSWG5LZFNJeGQ4eTkxUUllRGdtckFORjA5VXkx?=
 =?utf-8?B?NGhrd3RUQTRxS0FVWWp1b0k4ODZvZHVFbEhTSUM2eXdWdE1HZTIyQXFoYUd6?=
 =?utf-8?B?bG9zOGQweXNsbGR5OGNwaDhycFFKQmNCdjdMc09VZ0FudW5nd1JoaXV1eGQw?=
 =?utf-8?B?bHk5amRKY0ZXS1FQZExHazhMeW5yd2N5MVhRSm53VFo4U1ZiTGE3Ylh4eGxR?=
 =?utf-8?B?Smw5aFN0YU1tOU5nYSsva0ovTVNabVdTVVpKdzNzWjZ4NVhmbk45bHgxY1g5?=
 =?utf-8?B?QzBsTHNGVGpoNnBPOURtWVNMR3pVNnBFdTZHeDFQU3ZaK25rRmNxSHQ0WnU0?=
 =?utf-8?B?V0oyOEQ4WFJaSWpXQmZFKzJnb00yQ3l5TnVwWktvcDVwLzA5MzdEb3FnKzcx?=
 =?utf-8?B?dmtGbEJjSmZJeFYxZHErUUdicmJaNklCajhic09aVXFFNFZ4a1VVelc0MnRs?=
 =?utf-8?B?RHlJMmZobXNwT0NZRytkYWNzTHNQM0l6ckVmRWxhSVVtcVhpaUplY0hSYTNJ?=
 =?utf-8?B?RnMxRk5vaVBMN3QzTFRGWW9QVnI2VXNTejdMbjc2YWVuS3N1bTVydUg4V2F1?=
 =?utf-8?B?UlFWYk1ncDFCS01VdWtjemtSUkN3L1R5bE10bFNYUnR1dm5LVWNvU1h2OFRt?=
 =?utf-8?B?NDlhNmpZb1VxejZ4a3g4dThReFNFVGtteGp5QTYzNzAzM1E2ZEdRTkFHYTBq?=
 =?utf-8?B?TUxSbWZpWmRGTXVSTHlBZE51dFcvWDVXVkNvOThyaDdKb2IrKzFueVhWMnNS?=
 =?utf-8?B?K0ZxamdOcWczS0RVVTNsUmVWQ3R6bGU5ODJlZStQUHV2RlFMN2FVWjg1SXlT?=
 =?utf-8?B?d0pPNmdXNUhKUldFNnZndnkzSlFEaUpYWG1QbWIxS0hMYWxDOG9OTDdJSlkx?=
 =?utf-8?B?QW44R3lZUWZuWWs0Y21UUnRUMXdhK3h6UCtrdlk0VUFDY3VkNjVYUElJdTBJ?=
 =?utf-8?B?dDdZT1Y1cVNtaDI0ZGRxMkl0ckljQnNUV3NOR1hOQTh1Y29SVnhiWk10RERr?=
 =?utf-8?B?ZEdzU3Rhb000bkFLUjQwcDBCbGh6b1JtaXFsSGRuY3VhMitUeGd3eFRjV3Vr?=
 =?utf-8?B?QkFTQjJOcDZkbll6U3FvV1NSN3FpWEs4OWdIQVVsbnJGbnNSb2I5eDVGVE5n?=
 =?utf-8?B?TW5wL1gybnZiS2VxOWh1bjBtU1FUQ0V5dEVmbTM5K2lkL21tU0NINUFrTlk1?=
 =?utf-8?B?S2dXd2psb0JSYjl5NFJQN3A0QzlWNE9vVTFkRXZQWUpYK1UwL21MWjUvdytp?=
 =?utf-8?B?Z3NqSE91L3FrT1UvRXRPRjl5OU1jRkl5c0JhSnhZQjMrbjJCaWNQbHVta3RS?=
 =?utf-8?B?TGJPNkRuSjZHYXUyTFdaU09DTWVLT2RCVHZySG1BMitwdWJ3MElIN0lMOFRW?=
 =?utf-8?B?TEdTNkhucE5FcHc5b0QwMUdIT1lja1NTY2dQM1lkWnIvckZ6a25nMjgrZFIz?=
 =?utf-8?B?eS80RmFEZHQ1QVBaOTU2UXZkdUYrOTJyVjVFQ05pdVpZb0dmMklPYXgxV05T?=
 =?utf-8?B?d3o2VlZ4STBlYWREcHdYUWV1QjRDZXZidXNOOGlhVk0vUXF6VGxaeTBlWit6?=
 =?utf-8?Q?pP/uABIsS/jyKzciEJXRF5I+C?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e206929-77d6-4367-6b5f-08de2c277e97
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 13:35:27.3459 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9t6v4MmO2AXbBx9fvHT4Qa4Ge3r5UpO82EnyqEG/320jaLNpG96idtYwiJErxqd1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7826
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

On 11/25/25 11:44, Philipp Stanner wrote:
> The dma_fence framework checks at many places whether the signaled bit
> of a fence is already set. The code can be simplified and made more
> readable by providing a helper function for that.
> 
> Add __dma_fence_is_signaled(), which _only_ checks whether a fence is
> signaled. Use it internally.
> 
> Suggested-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
>  drivers/dma-buf/dma-fence.c | 19 +++++++++----------
>  include/linux/dma-fence.h   | 24 ++++++++++++++++++++++--
>  2 files changed, 31 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index 39e6f93dc310..3a48896ded62 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -372,8 +372,7 @@ int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
>  
>  	lockdep_assert_held(fence->lock);
>  
> -	if (unlikely(test_and_set_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
> -				      &fence->flags)))
> +	if (unlikely(__dma_fence_is_signaled(fence)))
>  		return -EINVAL;
>  
>  	/* Stash the cb_list before replacing it with the timestamp */
> @@ -545,7 +544,7 @@ void dma_fence_release(struct kref *kref)
>  	trace_dma_fence_destroy(fence);
>  
>  	if (!list_empty(&fence->cb_list) &&
> -	    !test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags)) {
> +	    !__dma_fence_is_signaled(fence)) {
>  		const char __rcu *timeline;
>  		const char __rcu *driver;
>  		unsigned long flags;
> @@ -602,7 +601,7 @@ static bool __dma_fence_enable_signaling(struct dma_fence *fence)
>  	was_set = test_and_set_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
>  				   &fence->flags);
>  
> -	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
> +	if (__dma_fence_is_signaled(fence))
>  		return false;
>  
>  	if (!was_set && fence->ops->enable_signaling) {
> @@ -666,7 +665,7 @@ int dma_fence_add_callback(struct dma_fence *fence, struct dma_fence_cb *cb,
>  	if (WARN_ON(!fence || !func))
>  		return -EINVAL;
>  
> -	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags)) {
> +	if (__dma_fence_is_signaled(fence)) {
>  		INIT_LIST_HEAD(&cb->node);
>  		return -ENOENT;
>  	}
> @@ -783,7 +782,7 @@ dma_fence_default_wait(struct dma_fence *fence, bool intr, signed long timeout)
>  
>  	spin_lock_irqsave(fence->lock, flags);
>  
> -	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
> +	if (__dma_fence_is_signaled(fence))
>  		goto out;
>  
>  	if (intr && signal_pending(current)) {
> @@ -800,7 +799,7 @@ dma_fence_default_wait(struct dma_fence *fence, bool intr, signed long timeout)
>  	cb.task = current;
>  	list_add(&cb.base.node, &fence->cb_list);
>  
> -	while (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags) && ret > 0) {
> +	while (!__dma_fence_is_signaled(fence) && ret > 0) {
>  		if (intr)
>  			__set_current_state(TASK_INTERRUPTIBLE);
>  		else
> @@ -832,7 +831,7 @@ dma_fence_test_signaled_any(struct dma_fence **fences, uint32_t count,
>  
>  	for (i = 0; i < count; ++i) {
>  		struct dma_fence *fence = fences[i];
> -		if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags)) {
> +		if (__dma_fence_is_signaled(fence)) {
>  			if (idx)
>  				*idx = i;
>  			return true;
> @@ -1108,7 +1107,7 @@ const char __rcu *dma_fence_driver_name(struct dma_fence *fence)
>  	RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
>  			 "RCU protection is required for safe access to returned string");
>  
> -	if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
> +	if (!__dma_fence_is_signaled(fence))
>  		return fence->ops->get_driver_name(fence);
>  	else
>  		return "detached-driver";
> @@ -1140,7 +1139,7 @@ const char __rcu *dma_fence_timeline_name(struct dma_fence *fence)
>  	RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
>  			 "RCU protection is required for safe access to returned string");
>  
> -	if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
> +	if (!__dma_fence_is_signaled(fence))
>  		return fence->ops->get_timeline_name(fence);
>  	else
>  		return "signaled-timeline";
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index 64639e104110..d32bf1b5b07d 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -401,6 +401,26 @@ void dma_fence_enable_sw_signaling(struct dma_fence *fence);
>  const char __rcu *dma_fence_driver_name(struct dma_fence *fence);
>  const char __rcu *dma_fence_timeline_name(struct dma_fence *fence);
>  
> +/*
> + * __dma_fence_is_signaled - Only check whether a fence is signaled yet.
> + * @fence: the fence to check
> + *
> + * This function just checks whether @fence is signaled, without interacting
> + * with the fence in any way. The user must, therefore, ensure through other
> + * means that fences get signaled eventually.
> + *
> + * This function uses test_bit(), which is thread-safe. Naturally, this function
> + * should be used opportunistically; a fence could get signaled at any moment
> + * after the check is done.
> + *
> + * Return: true if signaled, false otherwise.
> + */
> +static inline bool
> +__dma_fence_is_signaled(struct dma_fence *fence)

Maybe name that dma_fence_test_signaled_flag() to clearly distinct it from the is_signaled() path.

Apart from that looks ok to me.

Regards,
Christian.

> +{
> +	return test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags);
> +}
> +
>  /**
>   * dma_fence_is_signaled_locked - Return an indication if the fence
>   *                                is signaled yet.
> @@ -418,7 +438,7 @@ const char __rcu *dma_fence_timeline_name(struct dma_fence *fence);
>  static inline bool
>  dma_fence_is_signaled_locked(struct dma_fence *fence)
>  {
> -	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
> +	if (__dma_fence_is_signaled(fence))
>  		return true;
>  
>  	if (fence->ops->signaled && fence->ops->signaled(fence)) {
> @@ -448,7 +468,7 @@ dma_fence_is_signaled_locked(struct dma_fence *fence)
>  static inline bool
>  dma_fence_is_signaled(struct dma_fence *fence)
>  {
> -	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
> +	if (__dma_fence_is_signaled(fence))
>  		return true;
>  
>  	if (fence->ops->signaled && fence->ops->signaled(fence)) {

