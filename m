Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F5D473DDF
	for <lists+dri-devel@lfdr.de>; Tue, 14 Dec 2021 09:00:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12C5010E9AD;
	Tue, 14 Dec 2021 07:59:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2051.outbound.protection.outlook.com [40.107.96.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A0B610E8C6;
 Tue, 14 Dec 2021 07:59:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A683Noe9+J9KDzA7EgfHuTuXMDqSsY6hNQIUWy0RNZLwVWjtS4o/BNGbhEV0a+eMPQ1YFmQ7K5y+0Ka5GjgjQq6yfu2L+zXlDL8r1RhhMwIlLxQuyTkjFbkpKACh4bGUJT69dp3EdK8AchSD9/pyOTF9SQn1hC0EtcVwyZWEWrmFVHUXfL3xwGqDDDaqoOSI3YKWEj+IW+6QqOKf19m+8TM2n5WKjZl7bN4rlne7VABFT48h8kQdALzOt5ARgKg40QgJY8y5NdrUlrYSy7xdyILgdSbsmhvL61B942d7wxKZuy980aN1iTFxAMrGNV9mryk7H2b7QKfM5Mma2GYd1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9k70zo7TuWH+ILkfxEcMaLKe2YdFtWD0T+QiWVWyJq4=;
 b=XiwrfzP+ZNglyCu25jbiB8BikxwOU60wXMZkxhqAwUrez/+a/J1nUjfe8koOIaD303HLSgEKrZv4BurbNAyzZKNOxq3u5aAIZw86OdfftQxioKpxmL4mTm6nSexsDPh8JeDR1jn0yDkMqo/BmAG5PgER+LF2Bt7EdAg9g05PZWgUFVArpQTiXjHivWnCZql3le69CDGYDk8T+SdPXSWZb/MjqnFXP5SaVns+9+YfnQ4wVS1LvlX9xxGXdN5B0cd9A4TCfPbYX4wmsS0Z/NIqMWrkK9hwC6lfviPdtIkPG865ijb85sniAaqJFohoqtM9cf1E41Eq/DivJU08XypwfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9k70zo7TuWH+ILkfxEcMaLKe2YdFtWD0T+QiWVWyJq4=;
 b=Jey9emcFdwgQ0y7mTm18YfsBpGqVru+F3KqV2eevJQY1S3HXB67RGpUYTYWGWD3VtgBYKSupep6zLosS20J2OKo12DyDot0fH2zasrfc9xO8Dxifp8ZUoApZdBdniCu26Ngf30dtN4ed68fJa1P4GZUodtuTopebS0/jbxjmI0I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR12MB1535.namprd12.prod.outlook.com
 (2603:10b6:301:5::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Tue, 14 Dec
 2021 07:59:53 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::d16c:a6d5:5d2e:f9d4]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::d16c:a6d5:5d2e:f9d4%12]) with mapi id 15.20.4778.018; Tue, 14 Dec
 2021 07:59:53 +0000
Subject: Re: [PATCH 1/3] dma-buf: make the flags can be configured during dma
 fence init
To: Huang Rui <ray.huang@amd.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>
References: <20211213063422.2232155-1-ray.huang@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <5adca96a-e2bb-833a-e470-807a22b9b2fc@amd.com>
Date: Tue, 14 Dec 2021 08:59:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211213063422.2232155-1-ray.huang@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: AM0PR04CA0042.eurprd04.prod.outlook.com
 (2603:10a6:208:1::19) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0ffc9173-d835-404e-5287-08d9bed7b5e2
X-MS-TrafficTypeDiagnostic: MWHPR12MB1535:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB1535A2EC75225B7E0C31ADA183759@MWHPR12MB1535.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lMBZBd1hFsXjXirvOxNtiyQTg/I8ggJe5cvGgHesRkEqatGACssgnp5z00RdSpQSFj+ZfIvG6uaxVkeWWEHrHe7XTqATnREOfkMjLRVjWqSkAjIG2xOWOM/LBoJOD6xhCRMWUma3a0eszsHYsFbz/RoeoVV8qQHK/zwFMNOtML2tR6j8XqnkRbcAmiYMj8e4zFmP7dcDcO9q0qPfqU72X/fsY43EhjzCzJuRV4k7R68e9Tf6B00x4Ld/l7oZqc/0O8eqiJoY60Jst6rFf0nzKLnKVnROboFFPPAGprDVkD+qRdK45qoOTD7LW7RFP8AOfqZZP9aaTPM9l/h+yM7oXpHAmGgG+klcO5+R6H5ko6PWyp8lGk8PwPbiFmYjS8b4oBsm8Ee4Z7qV4YEth+BQlwI4JQ3GxOs9atSvdoMJnLJc4i+peKTpx4O6xDUUbQcYCXRzKPY5/n/uT8FkfQdlCNrinWcfRHM1f4prMO+2cvp95roIIRQOUM33gxN15mmRrjRQMxObQXj3pP7cVnAiH5+B01A0iWKVvX+Vg3sIdDvjPenrsUDuL9o0UAp9c21Uedjk0iIL5AkqUdS/qEHD1V4sbDb3WCns8IxPnRC+SXeWuS09HuaorLZPl/sCbejwmdNPmSZveAzoN2TbEbZJVT5Ifpdavoi5phIdh/sYBk8vvOFQauJAwB9KNLaVU1NzOUQX5tCY4E6rOPDR0f8tSX1yS56gDgTucBbmOHIJSr2GZ11loN9CAnE1EWmt/6po
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(31696002)(4326008)(2616005)(26005)(6506007)(6666004)(8936002)(186003)(86362001)(83380400001)(6486002)(8676002)(6512007)(2906002)(110136005)(5660300002)(316002)(31686004)(54906003)(508600001)(38100700002)(66476007)(66946007)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L0U2eVRsZmR0dVJhM0MwMkZPZ0JLblZmQzhZZUNMcC90Wm5LL1liL0N2MjZO?=
 =?utf-8?B?L0N2c2tyRHdDdjBLUytFM1VJSjFoeVdpc3lqbk9oR1AwMzh0d3JmVUhhY2Nq?=
 =?utf-8?B?NzgwVGlyc0NPcWI5ZnQxTU9kR2RibzB4dXB5UnVtRlNPMS9DL0txQjk2NXE3?=
 =?utf-8?B?Yi94QU1GejdxTlZwSUIxSG85RkFxNk5KUzdkaTJROERORjRHRDFFNkxvd2pY?=
 =?utf-8?B?SWYrTHNVeE1rUW16Mld2YlY1TUF5dUtUWjlId3laT3pvN1lIdEd6OW4zaS9J?=
 =?utf-8?B?M05YZXB2ZEUyZS84VEREUWJiUmJXQUMxNEdOZVlENThIZldNZ2ZSUi9OMThw?=
 =?utf-8?B?M3VvRmNYR1cxTFFyRFdxSGRHNlVRaWR3ZXNqQ0JRVmJOemcwYm9NdWkvMDJW?=
 =?utf-8?B?QXMxZDdZVFJGSTJMTitObXNmMzdSZm1GMkFwQmI2QkE3ei9scXg1Rk5iZ2hP?=
 =?utf-8?B?OE1URXVuWUZhZ1p0OUt0L2dZREEyclQ3OEc1cCtoWWVXUjZoallOVjZia1Zz?=
 =?utf-8?B?OUFWNTJWTTFCQkxjd3JIRGVOUlVYUXBjbU5McVFQaERkcEJHQ0J6ZnRBazd0?=
 =?utf-8?B?akJYZEgwVkFsRjJ5YlBuK0JuMExlRnNBWE5LV0RZbzJvUXMvVDVTRy9FaDVz?=
 =?utf-8?B?VjkweWx0c3JSVEFiQWQ1aU1RdnlYVmx2eGY1OGU4U010M2pnQVBmTGx5SjQ3?=
 =?utf-8?B?RDZTeHpaK1piRjU4WllheGlQNCt5eEV5bSt5eEg5RnpLb25HVVIyanBYMkJm?=
 =?utf-8?B?TXVIdmdKcFlhKzZGYlF3cldJV3RQeUkvQ21tbXdQYmdHeUtjVkxQd3VMMjBB?=
 =?utf-8?B?VjkzV0IwVWxFV2daYlFGRGlTdWJDOTQ1TmZHUDhoTTl3bG1qa3ZaSkl0TlNE?=
 =?utf-8?B?Rjk4UnhPcmJHSUZvQWlWWUVLUjVwVFlHcHd3Sm9NSzkxZWh3eXl1cFV5WDVl?=
 =?utf-8?B?d1ZZT2xPd1lIc2M3b21paTFac3pYbGU3MDB6bUhRT0NqRmVKNy9xSkc2U0JH?=
 =?utf-8?B?VG5CUlNjRzZkNzBPQUl6eHdSQll1ZEtYemZIalBxd2N2QVR5Z291NWloYjBR?=
 =?utf-8?B?cWp5d05DaFdFQ1pRTi9QWWszV1FUTW5yQmhyQkZLT3J3enJvdjNyek1WUEQx?=
 =?utf-8?B?NTRHQnU5OUp0dFNHcGVZcTByRjg1ajVSYWdSVXRsTTEzWTRBY0VtZFlUU2I2?=
 =?utf-8?B?M3gwb0RVMXp3WmVvcFBPcXhHUjZ2c0NLRFhTSmRHTkljcXJkRXBjbGJMQ0FK?=
 =?utf-8?B?bEpzM2Z1b1N3eVc5Sjdzd2EzQmYzR0ZwODBxZkFubVUxZzlCS212UmRjVkp3?=
 =?utf-8?B?N0RRanR6UFRNcWlzQlQ0eUNqU0FhWCs1YW9BUStWaHgrdU1WMmFxa2dSRGZR?=
 =?utf-8?B?L2podW4yV1IyQTRhYVdwNUpSaU51SUtpT3dweE1tbXYxN21EQ1AyVGMyMkd1?=
 =?utf-8?B?OVZudmdaRXg1R3Jpa2pJU2RpYzBkb0JlRWNCdk1DY0F6RFJmQWVqWkhoRmI2?=
 =?utf-8?B?bFlTc2xoNGwvK01Lcllza1BtU1o1NS82R1pOVWVQL0JtUW5Kcy9FcG9uSGZG?=
 =?utf-8?B?ZVR1SEFNSDU0MTJMMTh3dFI2Zk1iYlFUWUdaNWNMNWFuNFJyU2w3OGtNaUJV?=
 =?utf-8?B?N1BJaXBpanNQNEgwVVZycFZ5WWxaODkrQnV3SXMvS1lETndCK3pVa2luWDJP?=
 =?utf-8?B?dEVpK2pCZmN6WGxRQ3pKOEd3b0htb3lTUFdqdm81TWNWM3A5dlgvSW52eW92?=
 =?utf-8?B?SThNNTdOV3QyUnA0Z3IrbDJhdk5ZWFQrUFkwelJNbkZwSG9CRDhZN1AyV3BQ?=
 =?utf-8?B?YUNldXl5ZlpYeWV1RWFvdjFmTER2MkQwZ09EWEh2OWt4RXlVNktkcHplR0Ra?=
 =?utf-8?B?ZURrVFJhK1M5dmVaY09TQ1ZBVjJsSlFZdXdyeEQxQS9pR1FzWHZOMVpRajZJ?=
 =?utf-8?B?blozNWQvVTM2SmJrNW5iS2hMT2hOcnl4UndiVWZZME1XZUtzdi9OR0N3NUtq?=
 =?utf-8?B?cnhxWHkrTGZMV3FDTGF0MFBwaHNOeHIxbXdDU2ZZM1dPVnZCODljZU5rUUpK?=
 =?utf-8?B?ejBoNUtjTzUvRlA2NVFOS1lDckpOT1BidjBzRFNIQlVGQ281bE9oWUNFckp0?=
 =?utf-8?Q?rveA=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ffc9173-d835-404e-5287-08d9bed7b5e2
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2021 07:59:53.0179 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DezNYtn1mOmzwGEg6pnVkjvvOYQaZsF2jrPRgFNpP/q34KiTrEBks03JvVyfe2ma
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1535
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Monk Liu <Monk.Liu@amd.com>,
 amd-gfx@lists.freedesktop.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 13.12.21 um 07:34 schrieb Huang Rui:
> In some user scenarios, the get_timeline_name callback uses the flags to
> decide which way to return the timeline string name. Once the
> trace_dma_fence_init event is enabled, it will call get_timeline_name
> callback to dump the fence structure. However, at this moment, the flags
> are always 0, and it might trigger some issues in get_timeline_name
> callback implementation of different gpu driver. So make a member to
> initialize the flags in dma_fence_init().

Well that doesn't make much sense to me.

None of the dma_fence callbacks is called from the dma_fence_init 
function (or at least shouldn't). So drivers always have the opportunity 
to to adjust the flags.

So please explain the rational again?

Christian.

>
> Signed-off-by: Huang Rui <ray.huang@amd.com>
> ---
>   drivers/dma-buf/dma-fence.c | 2 +-
>   include/linux/dma-fence.h   | 7 +++++++
>   2 files changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index 066400ed8841..3e0622bf385f 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -952,7 +952,7 @@ dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
>   	fence->lock = lock;
>   	fence->context = context;
>   	fence->seqno = seqno;
> -	fence->flags = 0UL;
> +	fence->flags = ops->init_flags;
>   	fence->error = 0;
>   
>   	trace_dma_fence_init(fence);
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index 1ea691753bd3..f9270c5bc07a 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -131,6 +131,13 @@ struct dma_fence_ops {
>   	 */
>   	bool use_64bit_seqno;
>   
> +	/**
> +	 * @init_flags:
> +	 *
> +	 * The initial value of fence flags (A mask of DMA_FENCE_FLAG_* defined).
> +	 */
> +	unsigned long init_flags;
> +
>   	/**
>   	 * @get_driver_name:
>   	 *

