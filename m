Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A7F6A8365
	for <lists+dri-devel@lfdr.de>; Thu,  2 Mar 2023 14:20:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BB9B10E4FA;
	Thu,  2 Mar 2023 13:20:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2051.outbound.protection.outlook.com [40.107.92.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C43C110E4F3;
 Thu,  2 Mar 2023 13:20:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mwqm8tNzwsEuH4vusUnCu52Hq+AtiryhBQJVRrAzJKYVsW0mMY+ffPL2cJq1dztTySRi2rrQv0UVMKKHvh+nkZ/voRmYzd0DK80K3cOqvOGUVbFtgDtxt6FdqkZ8BA9Y8bBPQ4ZAbVG1KeD0X8Q5OCPB4BtJ78eB0jLdLyCYEjcjjlXIH6iyN2//6U7P2SgzAiasaCSUK/m9CuKFjNnB6kJ6SdAKw3WhjDLOteyhZ3aax4OaH3fzElUzuRUG5X4RjYhVn9a+q5ozSEI20zjbTJzMxZJx0luZJEJD9OjbEfYWFu+6Sl+k0BpijXSUGU+OJi2hV2ZbwbI+ybuUvubK8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GE3yFu5lD3doGNHzGRnlyVnn0bTfT6DqGApm59ewV2c=;
 b=lvwca2JL55F53KPwHKUU1HpxX4cMDTrCHXVSVuzuA905LEQgJZWzkTBQm2lBmZrp/v0Dwq0v2znVW+DaiiRAQ4bJGmgaI4E34QV5YnzruFuxgT3d0F21gTBDLZCURq0guPm3ZxZcGJ6A0T/4fAhSSb67k//owrqZrneJO6inLfzG6HV26nj5CAkmUXF4DB0BqMRf09XDU7vUXlmjx1Qe1C2W1CLAoep0arcNlNCZmtCoLP47legwe2OCdbmDMPJYyJqYOAutKB3p/tGVJepqg3FMezO8cJ+PSOFvh/dqRMcstC6D+/7vvlE7HGDYfPmydTpIvAdO6ye5xVW4C1izEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GE3yFu5lD3doGNHzGRnlyVnn0bTfT6DqGApm59ewV2c=;
 b=bCtWei9vFu+aAM38EJeV4OzavVvGmF6TQg6VtviozSlUEAC3cQm6ZtoQ0yEOeIiw/oGFaRRPkvVaMsDvbJkb3Gzg1gJghMH4dZ3LMBau6KSIvIdVpx8AbrPDmr70jZfbkLhby99lP0VqSydKnn1NVEk5Cj7RdpcSoRHp/xuf+kw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SN7PR12MB6790.namprd12.prod.outlook.com (2603:10b6:806:269::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.19; Thu, 2 Mar
 2023 13:19:58 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918%4]) with mapi id 15.20.6134.030; Thu, 2 Mar 2023
 13:19:57 +0000
Message-ID: <30df3fa3-b9c0-ce53-4a51-9eb5216fa7a6@amd.com>
Date: Thu, 2 Mar 2023 14:19:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH RESEND] drm/tests: Suballocator test
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org
References: <20230302083422.76608-1-thomas.hellstrom@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230302083422.76608-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0157.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::18) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SN7PR12MB6790:EE_
X-MS-Office365-Filtering-Correlation-Id: 6eea5ddb-99ca-45db-f655-08db1b20d18b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +6sOtTOiHexu9fFla5HBmjOIeVjPQ5GTuZXu7w9iet4pZQCb557awDGHCZxa629KvGuFQxaoThlKXuGPTeMcEHR9EvWnlO6YV4Xz1B+OpzKIl8MeS7MKGZShgN/NtaYlv69XKBJuT3/EtTxVyYruaovRMiOJPMdX0KasIqBP8zGU2NDE6OeCMlozZV0PdCBkp5iPP5Rn5EaIKIoildlc2QVqfEPxa2T617a7TP/fzEO58Xybpxrb6mcjK3Vd2DoFGijlxO682RNbpTGuvVONvMjFFTQKBkIqEK6il/uwtqxWFCVQOg3byDqwLOdW47LCtjEqB9DMfPaAQW1nK8nx5uVLkKhcGu62hucsnunqwqnIOGgDRguMlLKmE536vWA2N+GaXK9pMofIhzuCswUYU4zvQjGHwL5jr/GmE3A6mbvlJcTCSZ2jfAqM09SYkY8gz1CUYlWFPRw23/aRyZdBK9jWEvIo5C5GcqBIl6WtF72pBp20GdFpoT2ViSU/amCfd4nRXanTxJkCfb90IXxlWhbnZc+F0N0vLkwalpwT5AI6xMGCnyDYk2YRly5Vq2YqEIsNyfmj3seKV+PeTl69SI4inE/UBPz0M+Am/tGl6aRvsrQfqkESlcyFEInrKbvKWyOJhdWAndcd2rqDdvSVZc46Lv3LXcJp8iyYM+2HAp0N9FFCLMQG4HxxLMFVRdiJB0Y1kOYMwaQdK/iE4o4pmZ0xv2h53IWCASwKj1zmE8I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(39860400002)(366004)(136003)(346002)(396003)(451199018)(66574015)(31686004)(83380400001)(6666004)(36756003)(38100700002)(5660300002)(478600001)(66946007)(31696002)(86362001)(8936002)(26005)(186003)(2616005)(6512007)(6506007)(6486002)(66476007)(30864003)(66556008)(2906002)(8676002)(41300700001)(4326008)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OE5VRmx6Q0wxZE4rMHdPa3NqSmMxUUhsTGNOMG0xMTBJUWFyZkxBQUhOSHh0?=
 =?utf-8?B?RGNBa2tlM1FWZHNzNWhxbTBtcEV2eDk2UlYzVG1sTEMxbDRCeFF2OWpSOUQr?=
 =?utf-8?B?QytJL1A0bFZBUWZaT202dG1JK0R6TmpscXpvTytXbUg4RUVkZVpaNXg1cTBQ?=
 =?utf-8?B?UERZRnc0bXBsNGtGL3pVam5OV0xkdGtYbGRCeHlGWEtwTVdRd0pRSHJLWlVR?=
 =?utf-8?B?dWNJUDFTSVFsOUJwZGg1N2RvM1Y4MU5VNVFhLzJGVmVTc3hHbFJHYTZabXhK?=
 =?utf-8?B?bU11d2hDWjhJSmZGVjQ0MmQxdEVaaXJhTERBTnd2MHNYTUNPYWtvY1RFaE1a?=
 =?utf-8?B?RHZTTlhNRDdkZXFXTEFzR09YL1ZScnM3ZE9JN1E3N3VkVzFGaUV1NDZWN2pa?=
 =?utf-8?B?eTByNmpGb2wwQ0tOYTdjUHJ4b05LcmF3OEJ3MFYxVGdvakx0cEp6Y0ZDbTVE?=
 =?utf-8?B?aE5qelZ3WjlwZnJoSzFtM3lxd0s3bitrL0poQ0RpWHJFMS9TWk5IcUlCTDlM?=
 =?utf-8?B?UENnaXFsa3lGcjQvRHQxN0VURTFZdTZZeDk4M2JYY2NDN3NGVURUd0hlelNS?=
 =?utf-8?B?TlgreWlYd1p3VjVCV1FPMmw3M1ljV3BTMnc0YkFCNmNTRG9YYVp1Z21nRjR6?=
 =?utf-8?B?bXZkdGJTWkR2VTcrTzNFM3pjZzBjTGxIYmlCZTFkNWpGc1FXaW9zVTdMUFZ1?=
 =?utf-8?B?UW9mRUdZKzRXODZ5VkU5N1VzeDNobnZzZGFtQ3RwR1plays1ZThIbS9FbHpy?=
 =?utf-8?B?dnFVVVdWNnl4VGkwY1d6RWVVSzhMbVhtb3NlREthb2Jwa253QjVjR1hhVk1I?=
 =?utf-8?B?Y3lqKzBUbWRpeGdwUFR2eElZN2R5VXAxdk1xMkE0bUNYdVdxYnhUWXBoSEZY?=
 =?utf-8?B?U1JDeFpWc1ZtL0w0MW14VGlaa2pNcUhrL2IvTDVJblZvWHVld05kc3hkVGJK?=
 =?utf-8?B?MWU3OG42R3IrOWNIa2t3N1pES2lMSjVwc2dUTjZhZzVEYmtKbE5OZG5QR0Zm?=
 =?utf-8?B?cWxJa21JSStIR0RlcXprMHY1YnZWQXJvVkIxeXVwOEJRVVhkc0xVVjFpeDBI?=
 =?utf-8?B?WWNsWnZVZTFNMHJxK29jcWRnajA2aStRQ2puMWorRGxIU0Z5eGRlWUxpTWsv?=
 =?utf-8?B?dXFsK0ZuVDNBRXdVamJ2SUlsZTAybE9JWTYxZit6M3RkVHEzai96QzdFZGpP?=
 =?utf-8?B?b05SVnVRM2puRWgrcEVJZ2VzaFRSeXM0Z3FCcE5TNXBvYzV2bWdKNFhiNCtU?=
 =?utf-8?B?eWdWNFJod1AwL0ZZalltZFMrSUpZV3RpcisvMWlXbWxtUmZYdTlyeURzZHV4?=
 =?utf-8?B?S3M5bHlTRjlWY3pHZjlmZVZJR1U5eVBocktCNDVzMDFVUnlGTVFxTWdpakFM?=
 =?utf-8?B?bVFUcVpxaCtxTmJZaEtjd1BTWVJhOXBhNnczWDlDeTdtbmt0dmVpZ1BsSVRo?=
 =?utf-8?B?Mk1lSVZ4TVFwQTVYYUJ2M0NSNnJickt4T1VScTNrRTIvRFdja0d1WVM5Vjhn?=
 =?utf-8?B?aUtjTDgrY0VPbVZvOHZ6VG5SaGN4RnhrZ1NUWHpTcW1xOXUrS2tla1YzMDlF?=
 =?utf-8?B?N1RvTUNXMDdzNmxDSmkxRE5RdjVONm8yZitVRFREcVo5TE5sWXB1dERJK3Nu?=
 =?utf-8?B?eVZyZ1V2M05OM1NxSDB3SW5WSWpIL0tybTdXTnQ5eW10S09IVTF3NlFmdEpP?=
 =?utf-8?B?WEYrL0ErN3NCZXhnSGhoT0Nlbk9sNWoyQUVBUnBSbjRlcGxkcnJQWDJCdE9x?=
 =?utf-8?B?Qno1bVV4b0pJbm9UNFJ6ZEl4Q2hCdUc4eURTbmp3dHpRaXFWUTBSb0cxOTB5?=
 =?utf-8?B?Z052RlBxNTluSlJURmhGRGQyM3FUS3ZDRnJrVUQvd1VQN25sd0dmRHRtRlV3?=
 =?utf-8?B?QzcxK2w2RERvUVdZSUpuaDR0cDNkQkY3RmhXSjBCNWYvWVJlUmU5RWtSeXI3?=
 =?utf-8?B?cGdka3I2RC94czFwMDZHTU16QmNRamt3VmV1c1g5WWU3YUNkaTdGUEFrU0N1?=
 =?utf-8?B?N2JDdm0zY3h5aXkvRisyb2pBbzVpMmoyUWFJb0lsejhlcmFxY25vYWJ4Sk1O?=
 =?utf-8?B?K1luN2lJWVZyYmJJTDMybklvWEI2TGpXNDVGYmp6RXhWN1orOEJubjBKczVy?=
 =?utf-8?Q?P+LgURSq6ch1LolufnJDDXt75?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6eea5ddb-99ca-45db-f655-08db1b20d18b
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2023 13:19:57.4383 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LAnrC4uHbwNNGwPVj/pFq9JgGfu6eTJtPi2odXWlokGkLKAwkhtLIdhyDnkgWNs7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6790
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
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 02.03.23 um 09:34 schrieb Thomas Hellström:
> Add a suballocator test to get some test coverage for the new drm
> suballocator, and perform some basic timing (elapsed time).
>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Nice, I haven't had time to go over it in all detail but it looks pretty 
sophisticated.

Feel free to add an Acked-by: Christian König <christian.koenig@amd.com>.

Regards,
Christian.

> ---
>   drivers/gpu/drm/Kconfig                   |   1 +
>   drivers/gpu/drm/tests/Makefile            |   3 +-
>   drivers/gpu/drm/tests/drm_suballoc_test.c | 356 ++++++++++++++++++++++
>   3 files changed, 359 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/gpu/drm/tests/drm_suballoc_test.c
>
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 8fbe57407c60..dced53723721 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -78,6 +78,7 @@ config DRM_KUNIT_TEST
>   	select DRM_LIB_RANDOM
>   	select DRM_KMS_HELPER
>   	select DRM_BUDDY
> +	select DRM_SUBALLOC_HELPER
>   	select DRM_EXPORT_FOR_TESTS if m
>   	select DRM_KUNIT_TEST_HELPERS
>   	default KUNIT_ALL_TESTS
> diff --git a/drivers/gpu/drm/tests/Makefile b/drivers/gpu/drm/tests/Makefile
> index bca726a8f483..c664944a48ab 100644
> --- a/drivers/gpu/drm/tests/Makefile
> +++ b/drivers/gpu/drm/tests/Makefile
> @@ -17,6 +17,7 @@ obj-$(CONFIG_DRM_KUNIT_TEST) += \
>   	drm_modes_test.o \
>   	drm_plane_helper_test.o \
>   	drm_probe_helper_test.o \
> -	drm_rect_test.o
> +	drm_rect_test.o \
> +	drm_suballoc_test.o
>   
>   CFLAGS_drm_mm_test.o := $(DISABLE_STRUCTLEAK_PLUGIN)
> diff --git a/drivers/gpu/drm/tests/drm_suballoc_test.c b/drivers/gpu/drm/tests/drm_suballoc_test.c
> new file mode 100644
> index 000000000000..e7303a5505a0
> --- /dev/null
> +++ b/drivers/gpu/drm/tests/drm_suballoc_test.c
> @@ -0,0 +1,356 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +/*
> + * Test case for the drm_suballoc suballocator manager
> + * Copyright 2023 Intel Corporation.
> + */
> +
> +#include <kunit/test.h>
> +
> +#include <linux/dma-fence.h>
> +#include <linux/ktime.h>
> +#include <linux/hrtimer.h>
> +#include <linux/sizes.h>
> +#include <linux/slab.h>
> +#include <linux/spinlock.h>
> +#include <linux/delay.h>
> +#include <drm/drm_suballoc.h>
> +
> +#define SA_ITERATIONS 10000
> +#define SA_SIZE SZ_1M
> +#define SA_DEFAULT_ALIGN SZ_4K
> +
> +static bool intr = true;
> +static bool from_reclaim;
> +static bool pre_throttle;
> +static unsigned int num_rings = 4;
> +static unsigned int iterations = SA_ITERATIONS;
> +
> +static atomic64_t free_space;
> +
> +static atomic_t other_id;
> +
> +struct suballoc_fence;
> +
> +/**
> + * struct suballoc_ring - fake gpu engine.
> + * @list: List of fences to signal.
> + * @signal_time: Accumulated fence signal execution time.
> + * @lock: Protects the suballoc ring members. hardirq safe.
> + * @hrtimer: Fake execution time timer.
> + * @active: The currently active fence for which we have pending work or a
> + *          timer running.
> + * @seqno: Fence submissin seqno.
> + * @idx: Index for calculation of fake execution time.
> + * @work: Work struct used solely to move the timer start to a different
> + *        processor than that used for submission.
> + */
> +struct suballoc_ring {
> +	ktime_t signal_time;
> +	struct list_head list;
> +	/* Protect the ring processing. */
> +	spinlock_t lock;
> +	struct hrtimer hrtimer;
> +	struct suballoc_fence *active;
> +	atomic64_t seqno;
> +	u32 idx;
> +	struct work_struct work;
> +};
> +
> +/**
> + * struct suballoc_fence - Hrtimer-driven fence.
> + * @fence: The base class fence struct.
> + * @link: Link for the ring's fence list.
> + * @size: The size of the suballocator range associated with this fence.
> + * @id: Cpu id likely used by the submission thread for suballoc allocation.
> + */
> +struct suballoc_fence {
> +	struct dma_fence fence;
> +	struct list_head link;
> +	size_t size;
> +	unsigned int id;
> +};
> +
> +/* A varying but repeatable fake execution time */
> +static ktime_t ring_next_delay(struct suballoc_ring *ring)
> +{
> +	return ns_to_ktime((u64)(++ring->idx % 8) * 200 * NSEC_PER_USEC);
> +}
> +
> +/*
> + * Launch from a work item to decrease the likelyhood of the timer expiry
> + * callback getting called from the allocating cpu.
> + * We want to trigger cache-line bouncing between allocating and signalling
> + * cpus.
> + */
> +static void ring_launch_timer_work(struct work_struct *work)
> +{
> +	struct suballoc_ring *ring =
> +		container_of(work, typeof(*ring), work);
> +
> +	spin_lock_irq(&ring->lock);
> +	if (ring->active)
> +		hrtimer_start_range_ns(&ring->hrtimer, ring_next_delay(ring),
> +				       100ULL * NSEC_PER_USEC,
> +				       HRTIMER_MODE_REL_PINNED);
> +
> +	spin_unlock_irq(&ring->lock);
> +}
> +
> +/*
> + * Signal an active fence and pull the next off the list if any and make it
> + * active.
> + */
> +static enum hrtimer_restart ring_hrtimer_expired(struct hrtimer *hrtimer)
> +{
> +	struct suballoc_ring *ring =
> +		container_of(hrtimer, typeof(*ring), hrtimer);
> +	struct suballoc_fence *sfence;
> +	ktime_t now, then;
> +	unsigned long irqflags;
> +
> +	spin_lock_irqsave(&ring->lock, irqflags);
> +	sfence = ring->active;
> +
> +	if (sfence) {
> +		struct dma_fence *fence = &sfence->fence;
> +
> +		if (sfence->id != get_cpu())
> +			atomic_inc(&other_id);
> +		put_cpu();
> +
> +		then = ktime_get();
> +		dma_fence_signal(fence);
> +		now = ktime_get();
> +		dma_fence_put(fence);
> +		ring->signal_time = ktime_add(ring->signal_time,
> +					      ktime_sub(now, then));
> +		ring->active = NULL;
> +		atomic64_add(sfence->size, &free_space);
> +	}
> +
> +	sfence = list_first_entry_or_null(&ring->list, typeof(*sfence), link);
> +	if (sfence) {
> +		list_del_init(&sfence->link);
> +		ring->active = sfence;
> +		spin_unlock_irqrestore(&ring->lock, irqflags);
> +		hrtimer_forward_now(&ring->hrtimer, ring_next_delay(ring));
> +		return HRTIMER_RESTART;
> +	}
> +	spin_unlock_irqrestore(&ring->lock, irqflags);
> +
> +	return HRTIMER_NORESTART;
> +}
> +
> +/*
> + * Queue a fence on a ring and if it's the first fence, make it active.
> + */
> +static void ring_add_fence(struct suballoc_ring *ring,
> +			   struct suballoc_fence *sfence)
> +{
> +	spin_lock_irq(&ring->lock);
> +	if (!ring->active) {
> +		ring->active = sfence;
> +		queue_work(system_unbound_wq, &ring->work);
> +	} else {
> +		list_add_tail(&sfence->link, &ring->list);
> +	}
> +	spin_unlock_irq(&ring->lock);
> +}
> +
> +static void ring_init(struct suballoc_ring *ring)
> +{
> +	memset(ring, 0, sizeof(*ring));
> +	INIT_LIST_HEAD(&ring->list);
> +	spin_lock_init(&ring->lock);
> +	hrtimer_init(&ring->hrtimer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
> +	ring->hrtimer.function = ring_hrtimer_expired;
> +	INIT_WORK(&ring->work, ring_launch_timer_work);
> +}
> +
> +static bool ring_idle(struct suballoc_ring *ring)
> +{
> +	bool tmp;
> +
> +	spin_lock_irq(&ring->lock);
> +	tmp = !ring->active;
> +	spin_unlock_irq(&ring->lock);
> +
> +	return tmp;
> +}
> +
> +static const char *dma_fence_get_suballoc_name(struct dma_fence *fence)
> +{
> +	return "suballoc";
> +}
> +
> +static const struct dma_fence_ops dma_fence_suballoc_ops = {
> +	.get_driver_name = dma_fence_get_suballoc_name,
> +	.get_timeline_name = dma_fence_get_suballoc_name,
> +};
> +
> +static DEFINE_SPINLOCK(sa_fence_lock);
> +static ktime_t alloctime, freetime;
> +
> +static void drm_test_suballoc(struct kunit *test)
> +{
> +	struct suballoc_ring *rings;
> +	struct drm_suballoc_manager sa_manager;
> +	struct drm_suballoc *sa;
> +	struct suballoc_fence *sfence;
> +	struct dma_fence *fence;
> +	ktime_t then, now, signaltime;
> +	int i, ring, iter_tot = 0;
> +	size_t size;
> +	unsigned int align;
> +	unsigned long long soffset;
> +	gfp_t gfp;
> +
> +	rings = kvmalloc_array(num_rings, sizeof(*rings), GFP_KERNEL);
> +	if (!rings) {
> +		KUNIT_FAIL(test, "Failed allocating %u rings.\n");
> +		return;
> +	}
> +
> +	for (i = 0; i < num_rings; ++i)
> +		ring_init(rings + i);
> +
> +	atomic64_set(&free_space, SA_SIZE);
> +	drm_suballoc_manager_init(&sa_manager, SA_SIZE, SA_DEFAULT_ALIGN);
> +
> +	if (from_reclaim)
> +		gfp = GFP_NOWAIT | __GFP_NOWARN;
> +	else
> +		gfp = GFP_KERNEL;
> +
> +	for (i = 0; i < iterations; ++i) {
> +		ring = i % num_rings;
> +		size = (ring + 1) * SZ_4K;
> +		align = 1 << (ring % const_ilog2(SA_DEFAULT_ALIGN));
> +
> +		if (pre_throttle)
> +			while (atomic64_read(&free_space) < SA_SIZE / 2)
> +				cpu_relax();
> +
> +		if (from_reclaim)
> +			fs_reclaim_acquire(GFP_KERNEL);
> +
> +		then = ktime_get();
> +		sa = drm_suballoc_new(&sa_manager, size, gfp, intr, align);
> +		now = ktime_get();
> +		if (from_reclaim)
> +			fs_reclaim_release(GFP_KERNEL);
> +
> +		alloctime = ktime_add(alloctime, ktime_sub(now, then));
> +
> +		iter_tot++;
> +		if (IS_ERR(sa)) {
> +			if (from_reclaim) {
> +				iter_tot--;
> +				continue;
> +			}
> +
> +			KUNIT_FAIL(test, "drm_suballoc_new() returned %pe\n",
> +				   sa);
> +			break;
> +		}
> +
> +		atomic64_sub(size, &free_space);
> +		soffset = drm_suballoc_soffset(sa);
> +		if (!IS_ALIGNED(soffset, align)) {
> +			drm_suballoc_free(sa, NULL);
> +			KUNIT_FAIL(test, "Incorrect alignment: offset %llu align %u rem %llu\n",
> +				   soffset, align, soffset & (align - 1));
> +			break;
> +		}
> +
> +		if (drm_suballoc_eoffset(sa) > SA_SIZE) {
> +			drm_suballoc_free(sa, NULL);
> +			KUNIT_FAIL(test, "Allocation beyond end.\n");
> +			break;
> +		}
> +
> +		if (drm_suballoc_size(sa) < size ||
> +		    drm_suballoc_size(sa) >= size + align) {
> +			drm_suballoc_free(sa, NULL);
> +			KUNIT_FAIL(test, "Incorrect size.\n");
> +			break;
> +		}
> +
> +		sfence = kmalloc(sizeof(*sfence), GFP_KERNEL);
> +		if (unlikely(!sfence)) {
> +			drm_suballoc_free(sa, NULL);
> +			KUNIT_FAIL(test, "Fence allocation failed.\n");
> +			break;
> +		}
> +		fence = &sfence->fence;
> +		dma_fence_init(fence, &dma_fence_suballoc_ops, &sa_fence_lock,
> +			       ring + 1,
> +			       atomic64_inc_return(&rings[ring].seqno));
> +		sfence->size = size;
> +		sfence->id = get_cpu();
> +		put_cpu();
> +
> +		ring_add_fence(rings + ring, sfence);
> +
> +		then = ktime_get();
> +		drm_suballoc_free(sa, fence);
> +		now = ktime_get();
> +		freetime = ktime_add(freetime, ktime_sub(now, then));
> +	}
> +
> +	signaltime = ktime_set(0, 0);
> +	for (i = 0; i < num_rings; ++i) {
> +		struct suballoc_ring *sring = &rings[i];
> +
> +		flush_work(&sring->work);
> +		while (!ring_idle(sring))
> +			schedule();
> +		signaltime = ktime_add(signaltime, sring->signal_time);
> +	}
> +
> +	kvfree(rings);
> +
> +	kunit_info(test, "signals on different processor: %d of %d\n",
> +		   atomic_read(&other_id), iter_tot);
> +	drm_suballoc_manager_fini(&sa_manager);
> +	kunit_info(test, "Alloc time was %llu ns.\n", (unsigned long long)
> +		   ktime_to_ns(alloctime) / iter_tot);
> +	kunit_info(test, "Free time was %llu ns.\n", (unsigned long long)
> +		   ktime_to_ns(freetime) / iter_tot);
> +	kunit_info(test, "Signal time was %llu ns.\n", (unsigned long long)
> +		   ktime_to_ns(signaltime) / iter_tot);
> +
> +	if (atomic64_read(&free_space) != SA_SIZE) {
> +		kunit_warn(test, "Test sanity check failed.\n");
> +		kunit_warn(test, "Space left at exit is %lld of %d\n",
> +			   (long long)atomic64_read(&free_space), SA_SIZE);
> +	}
> +}
> +
> +module_param(intr, bool, 0400);
> +MODULE_PARM_DESC(intr, "Whether to wait interruptible for space.");
> +module_param(from_reclaim, bool, 0400);
> +MODULE_PARM_DESC(from_reclaim, "Whether to suballocate from reclaim context.");
> +module_param(pre_throttle, bool, 0400);
> +MODULE_PARM_DESC(pre_throttle, "Whether to have the test throttle for space "
> +		 "before allocations.");
> +module_param(num_rings, uint, 0400);
> +MODULE_PARM_DESC(num_rings, "Number of rings signalling fences in order.\n");
> +module_param(iterations, uint, 0400);
> +MODULE_PARM_DESC(iterations, "Number of allocations to perform.\n");
> +
> +static struct kunit_case drm_suballoc_tests[] = {
> +	KUNIT_CASE(drm_test_suballoc),
> +	{}
> +};
> +
> +static struct kunit_suite drm_suballoc_test_suite = {
> +	.name = "drm_suballoc",
> +	.test_cases = drm_suballoc_tests,
> +};
> +
> +kunit_test_suite(drm_suballoc_test_suite);
> +
> +MODULE_AUTHOR("Intel Corporation");
> +MODULE_DESCRIPTION("DRM suballocator Kunit test");
> +MODULE_LICENSE("Dual MIT/GPL");

