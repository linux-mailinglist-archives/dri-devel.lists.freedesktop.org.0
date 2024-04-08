Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD53C89B981
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 09:58:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E85D311221B;
	Mon,  8 Apr 2024 07:58:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xomvOSOf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2092.outbound.protection.outlook.com [40.107.220.92])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B44AA11221B
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Apr 2024 07:58:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KT1opqsX2r8zAPEHjsbxUOlOsxsKGMz5+KHx3E0u+fXc/vANDRh8kd4z7smqMby8HireuD/l8Q5YcK8QOnFrDpEODjirw6wGB1h9rOCGHMcH31DuP2/NqlYMrDf8Tnd5hiAvSyNRcepcUY/07bMYjxUW8fx8TopLBuSrugwtbGz9bYtFQ9jInuesvesnoSCmO/DqCz6evw5APYbIghHvXbQOLm9HWM3rA0wGnvn5kNrkP3IQMdColPJbuxA0j2n6syHzsrDVzrp+9DUVMD2IGfvwqptD/8xneLXRZk/NG8g29ReBbC+Zr1+Lgfv432H/b5kf/MZyMFu7UUwYC1+pNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fkcDmAPfup8CpG1p+PrBQyJXTMqX896i1J+H3Qzq5PE=;
 b=erSh4tZ6JzNMQKM7FxWsH2P+75xaiRfbMVBZjioucGYGc03bi3i/q8Y76HAsTFEidP7ONECkhlQtfKSSHCgrK8ETW8OQiwDcv/RmpX2J/G346ZEm7sJ9tNLhB1SWMsyC3oGAbEgH6XossT2QzNFPxdkvlQAjucl+eCR90OYQfVX+y879zjzZwXSbiLYEw+Tki+YqT5gvLikXVQN2xbj3x3XyY+gf5ZFD1iVyo8B2NUjStLQNCsClTEY2Wq0EvNK/TIh5SGNveUJST84Rmom8iI1rxp43jWCqNLZV9RdbUc7/wQRzHOIN8JnZQ0DrU+s8B8jqXUp0K5P5aJilnLaXaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fkcDmAPfup8CpG1p+PrBQyJXTMqX896i1J+H3Qzq5PE=;
 b=xomvOSOfcXKgZ/8foWt+4W6VB6yCzY4vk4jbbmLVLDViL3Oc8cbtcw0gMx4+DPkCtOTf6P66TyuSMmUMq1ip4HvWz+HmgukiBwaW6O765tn08S7KFrj52sXLHJ7tHiT8MQhNVwgvR/2/7Q+rfdj6vlaxjBvSpAnDhed/GrihSuw=
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA1PR12MB6824.namprd12.prod.outlook.com (2603:10b6:806:25f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Mon, 8 Apr
 2024 07:58:39 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7409.042; Mon, 8 Apr 2024
 07:58:39 +0000
Message-ID: <9e6f1f52-db49-43bb-a0c2-b0ad12c28aa1@amd.com>
Date: Mon, 8 Apr 2024 09:58:34 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf: add DMA_BUF_IOCTL_SYNC_PARTIAL support
To: Rong Qianfeng <rongqianfeng@vivo.com>, Jianqun Xu
 <jay.xu@rock-chips.com>, sumit.semwal@linaro.org
Cc: pekka.paalanen@collabora.com, daniel.vetter@ffwll.ch,
 jason@jlekstrand.net, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20211113062222.3743909-1-jay.xu@rock-chips.com>
 <1da5cdf0-ccb8-3740-cf96-794c4d5b2eb4@amd.com>
 <3175d41a-fc44-4741-91ac-005c8f21abb8@vivo.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <3175d41a-fc44-4741-91ac-005c8f21abb8@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P195CA0055.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:5a::44) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA1PR12MB6824:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lHS5s2dK5PiKysCxd8VIeA9i15oxR+Lzzc7QJrxG4hifCMOjgEx3LVGpyG55olbmVkAoZcqdmKQi/YmiGYl4P0A/z07W6kjn60N4XTZl6+B83OcspJ5Q946A3T8uw5lgscFjULOB7oHdWuHsJxsiE6BhV1XZKOosNhbLD7nneLuPbLxlmeAXWb2BlctdaadAE9NRLs75Vq2wCZitEpCyOsKR2wszmEm8qdfX/4E2rmptygE3hqA0BvLeqCdPTl1o5TwmUPGsqG6ABonvOriEvm+8f8+Fg5qjeDdHB713lFPSIpCrS2Z58c9kSTqPK1i8bwzXhklJn9jS3HfPpR3WHB573oFCKIv7ddnc/+kVGA4BGR3N7+kY5a/5HajQmJdptwfph8q1M52fYk/E4qJocNSTOsXWpTqo1+3D3Ov0otNwiEZY/semVqv53GvYHSb3ImQSsXWgoX5yj8HYR6kwHuVSWvSO3zhKX4E5XIDrsAYM9dfsbxKDjhDdO7OA+VV/LRURrQ5t26PV0xaZPNv91rLM7Qq+8h1bjqktnIWheqkrk/CmKbyuWpB0AfbZkcak15R5ze54tWhTk+JHJhbPYiLAY3gPYUQkTt1nsJThA2aJ4fIuseYUB/tOUCjJJM54UgwoOztW3U7HNTV3Rm7ByqM1ZwgDCXUR6qjZ4lC4y+s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(7416005)(1800799015)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WlVIZWZ4V2JEZlVGTE9uY29aVGxIMjl5YUFyRXBNT3V2YUQrQWRMWDRUT3or?=
 =?utf-8?B?NXBLYmx6V1V5Y2dwNFc3RE9Xa2ZBWGMrcW8wOWMwcU9lOWV6TE9uaDRkUmt2?=
 =?utf-8?B?ZzluczNRNmZtYysvcy9MOEkxcGJLaGpiTEZmWFQ5RWRVVlJMLzdubzNuRlBi?=
 =?utf-8?B?YVB5ald4WjFjTlZKaHBxRjgreUhxSUx4TXBlVXVhU1NjRUJJK3lCVTBLSFdr?=
 =?utf-8?B?ZTlScFhpQWtPaDVlZlNYeVhXVGZBUjU5Yk9MVGVISFkrK3BLSUFTenF0ZExy?=
 =?utf-8?B?NE16YnN6NEFPWUV3K1FCTVVZd3VIVnNpMUpoWVhTejc3MWlqbHNHS0s0dEY3?=
 =?utf-8?B?Rnhzb2dpMTNDVHFWOEhJd1Y0OG95VmE3QVg5cmVkdU9MMlhZVkpNM0tVbG1x?=
 =?utf-8?B?MDBpcXM1aW1JREZOSzRJZEhxV3BDSVNmdnJ4TEZVQ0MwVzFkWXA1SndEbS9E?=
 =?utf-8?B?ZzEvRkVPaEdZQ1BISnBadWVPU2xxcTFyMlhxUEhNZVRTai9wQkY1MWxsRUpT?=
 =?utf-8?B?MWxOR0pZaFNEbnJsdFhYMmsybDlxazdGK2luc04vaDlKQ1ZYWjhWdldiL1hB?=
 =?utf-8?B?Z2xJRlI0OUI4czV6UFMxSUdwTFhUbnVsaDR3dno3MU8rS1VBOEp4QUVsY1Nz?=
 =?utf-8?B?REJ6c1Fzd0Z6ZzJxdTNzcXlMWUNYTWpoZmVhWTJmcHk2cUp6b1hDdDFhR0Mv?=
 =?utf-8?B?WDFmdlkyc3JwQTZjODZxVmEySUxzLzNDYmdHWHN4Y3BXdVlmeTc2NGlyQWRs?=
 =?utf-8?B?aDVBaEhjUlFMUmRxa0U2QXB2NVZCdlNjbVZ5VlhGU3RrS0h6TjhzaHB3bWNk?=
 =?utf-8?B?TVErbVZQUGZROEV6Mk40MHk3Zi8xenJLSFJOSVBOaW9ONkZaS2d2cnROKzBj?=
 =?utf-8?B?MVBES1dpOUlJc082ck5qakIwRWtaTkN6K1pSSnFXN1B4SFdzS2J6SkdPZmxw?=
 =?utf-8?B?eTlxbW5GS1hsTyt5WWk1dGRVOGwzL0tTb0F5TnB0SU5CK01vaktLUHNta2hn?=
 =?utf-8?B?WFZTODFDZFE1cVMwMGtaKzBJYjVsUHJ5YU1laDlhbU5qRDhDbEtrVFNhcW9H?=
 =?utf-8?B?RFhrM3lOd0RMZkpkZ2FYNVR5bUZNU1N2d3NFVU84Nmhqb013Wjc0TVRlY2pv?=
 =?utf-8?B?VXJNaTM4M1BhcFhYV3lzVFo2WXdSdldQcjZ6Z1g2WGcwRU1YMGhkL0RJZUZn?=
 =?utf-8?B?dG1JT0lWMzEydkNDUjNzczFVU0RZTkJhRVBsRmkreU9sSTY4VndJSThFcjJ5?=
 =?utf-8?B?UEpCSFdtRnJObFVHdVFzekp3dXZaZEJvOXpOSEdvTkQ3RFR4VjI5YUc3QU12?=
 =?utf-8?B?cG9jTEF3eWdoYUQ2dnpxTis1RnNZQXRrK3IvVHZsbm4yWW9xVU5hWjYvK3dh?=
 =?utf-8?B?YmxZWVF3M3Q0ZnFXUU5RN0F2N3A3Um14ekl5SkI5MjZZUzg3UllsbnpFeE4z?=
 =?utf-8?B?bFpCc21WYzBJL3dGZXRNSFFhRHFiL3U5ODliVGt1TmhmL1ppU0VYc1RySEEy?=
 =?utf-8?B?NWhPS2tQeGJKWHdDNnVhbW9TM3RKazJUbFY4UzlzSXFzdXczelF3TFZKdWFQ?=
 =?utf-8?B?c0M4Ymk1L3NFNjkxZmRtR202U0lGMWZvNmUxQ0FjbUJrMjVSbDJFbmRDaEc2?=
 =?utf-8?B?bjZVektUMkJ4aFozUHJIMThycnBFQ29NdktES3oyejBYYTY1cDFuTlpsa2M3?=
 =?utf-8?B?dGhDNVg2T3g0ckhKYjBDSTRxKzcvL1BiM0ZRKzBvQXJpaU5NZ2FVaVJ4YWY4?=
 =?utf-8?B?aWtWb1haMkF3ZGFlTFFiSU1iekZQOENDUHVVN0k4NDF3NVE4Q0huRTZuUjVZ?=
 =?utf-8?B?REhMQjJHenFmYzFCY0VWeEl3L1RjdVhXcFBpbmJsL0toOUtzUFFDM1huVXdM?=
 =?utf-8?B?RGRaaW9tY3JKdFpTREhtSlJZc0hpQjFzSmx1bW9vU2VKbkxSQjB6cmJpSFZu?=
 =?utf-8?B?RkJPaE10M3ZjaFVTVnY3NTZ5OS9Qd2RJcWhyZDFLRWhTMUFyTld2ZFdKR2h1?=
 =?utf-8?B?U0k0WFlZZFQzajVVRGg2QzN5WHk5NEtOQis3ZkVNamtVT1pFM0g5MUVFUlpQ?=
 =?utf-8?B?TnJyUWZVNjBjdFRGU0J0d1Vncy8xV2xyUkVaM1FDQlVOU2FQdkYvcDJGWmdF?=
 =?utf-8?Q?3Yao3I+CBwlkIS22PSK64Qj7o?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1d45e26-6daa-46b5-d02a-08dc57a1b346
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2024 07:58:39.3462 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LY9Pr9mjmc0UQFiFA6NAKx8aMRZTs5iZsbVtWTAWA2MwO0OGzMOor4A4l72wkGrO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6824
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

Am 07.04.24 um 09:50 schrieb Rong Qianfeng:
> [SNIP]
>> Am 13.11.21 um 07:22 schrieb Jianqun Xu:
>>> Add DMA_BUF_IOCTL_SYNC_PARTIAL support for user to sync dma-buf with
>>> offset and len.
>>
>> You have not given an use case for this so it is a bit hard to 
>> review. And from the existing use cases I don't see why this should 
>> be necessary.
>>
>> Even worse from the existing backend implementation I don't even see 
>> how drivers should be able to fulfill this semantics.
>>
>> Please explain further,
>> Christian.
> Here is a practical case:
> The user space can allocate a large chunk of dma-buf for 
> self-management, used as a shared memory pool.
> Small dma-buf can be allocated from this shared memory pool and 
> released back to it after use, thus improving the speed of dma-buf 
> allocation and release.
> Additionally, custom functionalities such as memory statistics and 
> boundary checking can be implemented in the user space.
> Of course, the above-mentioned functionalities require the 
> implementation of a partial cache sync interface.

Well that is obvious, but where is the code doing that?

You can't send out code without an actual user of it. That will 
obviously be rejected.

Regards,
Christian.

>
> Thanks
> Rong Qianfeng.

