Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB93494B8E
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 11:22:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 095A910E9DC;
	Thu, 20 Jan 2022 10:22:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2083.outbound.protection.outlook.com [40.107.237.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D406110E9DC
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 10:22:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LuUJqUO+SkkiFrJ5UmJbTIwLkFy0qWa93/MbwxjKSwDLRllH74BdGxy426sF7moI7fZAiUCU9NOlhR/aW75vy7z6U9zQvj+O1V9H9fFXsl+098xk3MDVYRh2EO/SA3GRN8U7goOm0azKfmhNN1+VKhJh/hfyS5j3C0MZYUU3e1oRPSNyTn6R9GMMSHNvg8cu2fpn/EbfJWXUXbI1/meaQD4emWSPhru/A56gskewwwCEBHFaFZnnUTZokmELtPiNDf7rGljSX+8JiOPRRjz86OEwNs4WZgk7pNLTEHM0dlowAn+Bkro/4vhhgM73KF7cygQAsyD1UlSmQUwakEGEQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bj8Thr5BLOakDAxlIyQ5Y7HrJw/O7mA+mFWOJl8AowY=;
 b=L7DksRZb/prQqS1Mhp6tK7k/z56wH7sk6cso5WH2f11zVG7msSqXl/ezFdo714Du5ohR0wAv04qKqONQ0cFZlRt1Ktak1tGL1iKlgGpiluGAP5mxRXuLcKdLTpuUPESo/lg+Z4/bQq8mfWvlHRjwEgRjtMnss1obViVd0cwpFBXr9ZCJp0RFlaOsCytYKQbnQKwwvAZaHmzudndyEwsxMjx6m+vlJOSCoM3wworZ9vhfmtK3nmCON33K3nsB1iuPi/ngi5+cSqtp7snQWj5vmNev6YYbHYIAPKfH/3z9ynF/rJo+yNVGxPzgO5pVhNJUAAm2AZIIEK9ERV6hpSXiGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bj8Thr5BLOakDAxlIyQ5Y7HrJw/O7mA+mFWOJl8AowY=;
 b=LkXINhJOtpBdlSsI2NJtVZCXmkTiuo891Pjq0inh1NRoeb1sLkdnRX6jpQuaZU2+gavNESK/YvdtkYqUoS81o7HqocpbBob+9DM2zUxCngZAuHABJCdD04GlB1KZoZmSuw5liMw1T8Fo6LDwUx/BG8uEzhOObJPI1CznLf15Bzs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SN6PR12MB4672.namprd12.prod.outlook.com (2603:10b6:805:12::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.12; Thu, 20 Jan
 2022 10:22:18 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::b03b:7df9:d733:13b2]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::b03b:7df9:d733:13b2%5]) with mapi id 15.20.4888.014; Thu, 20 Jan 2022
 10:22:18 +0000
Subject: Re: [PATCH v6 RESEND] dma-buf: system_heap: Add a size check for
 allocation
To: guangming.cao@mediatek.com
References: <20220120085259.98147-1-guangming.cao@mediatek.com>
 <20220120100036.99867-1-guangming.cao@mediatek.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <90bf495d-dbf6-cb0d-f54f-e0080b810f8d@amd.com>
Date: Thu, 20 Jan 2022 11:22:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20220120100036.99867-1-guangming.cao@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM6P192CA0078.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:8d::19) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 32982818-4275-453d-e497-08d9dbfebc61
X-MS-TrafficTypeDiagnostic: SN6PR12MB4672:EE_
X-Microsoft-Antispam-PRVS: <SN6PR12MB46721D4AA0AEA708F45C23CD835A9@SN6PR12MB4672.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lqxzcFZc476bU/RzM/BjtPOlIDIBWCUtU+iJi6+8sZO7usmEOTHcbW3xWD9DDoJ+d3WeOeimtSAQSMEtUw369cspHMsZykpTTdd7WTMK7zJ2rvI5RSSSHdSAuB6LJSVDReQW9Ub9zGWD59B01riA8LUrn+bPvBsRhpjnuR3zo5gEtWqDsXFq44CrFvolQjfo9Go52r8Tu80hasv9xu6kRD6x9oi0+sG0dLDMdPZ/mVOHR8RjFK2x7epJopLDcEQjpELNlI4fOkApB1xG6bHQIfYJyjuBtlvxBCJUkg80/+CWIXzQ9ifEb6NfvNgNJRx7uruB9H7Srw67TbFGLNCz+wKys1tzJRIy7gXl2NnY2NN4H73jyU7gTV2LMkV9r8Zidht6xV3XFgkinkuMUM8Bl2eU6/ZILruujtcRhsQ463RKutLpLsVU0LAht9cvsOdCgNfin6+7ayrFLdqQDlKYTXKCwuM1/NbcS/k1YS2WjBEc6RMmB68KFB5PUbwzIcgbSP8QjILU5nL3Dy7REKYij7w07Nuo2mEW5R1SHTdLlcrHk6huO3aMn868/EGRmmat1cxKRc3UBeiyBRk48U4bv0fuZfZQe3IBbHlFYPDQZK/J0J2VG6DLfSVr3mEnOgj7TUAox/IoUPeUANknMWxtjbfkDmkKFPLDhkaMsHOeW3Or/+wvs0rOzQx8f7LTFpLYdbD77zJqOLyqiIsex/fXl2U7I51XMNktnalY3Qxaf3pbyrk7/1Th5lXwrWxhxBCf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6916009)(36756003)(6506007)(6486002)(6512007)(8936002)(316002)(8676002)(508600001)(4326008)(186003)(7416002)(86362001)(31696002)(26005)(38100700002)(6666004)(66556008)(5660300002)(31686004)(66946007)(2906002)(2616005)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0J2ZGdEZHhOb0dLaVhlTkJ3c0M0NzRMNTNKZ3JkSktUK2ppemV3MktURVVK?=
 =?utf-8?B?cW14VDZYVmt1eXYveW55TGpTR2Qvb0JkWWZySWdtK3lEdHh6ekVqSm5WM2or?=
 =?utf-8?B?Q3FhL2VQampxb1BqRVdkT0N1Z25OVktsZmwzWmpEemZqVGsrNk9MLzlic1dI?=
 =?utf-8?B?L3ZnUUdnR0U2TU1EUzljVUxiNnVWOEdFemNheXFodkZQTCsrRWhLS1dkTnB5?=
 =?utf-8?B?VTFVUGdXeVUrbjhmZk5YaHM1YlZjWWJCYW1pUUs0U2J3ZW1NcFBYRlhjcVZk?=
 =?utf-8?B?R0NLNkFFNHl6a3BrMDNuTjN5bUtEcWduOVp0SGJxRkhkQ1cvcEFwLysxQ01F?=
 =?utf-8?B?cldPdzdJSlRTTUw1Z2hOakVSblI1S2pDMW84Q2QwUjd2WHdWSm9pOXZ0Z3ls?=
 =?utf-8?B?dHNPdTYwR0RWa3BHQ3Q3VHpJeUFIZENueGNWTWhHZEVLTjc3bUJyeUZrNWt3?=
 =?utf-8?B?dzd4Q29KTlhONW0zc211Y1MwNkd1L0hmZEFFVmVXOFhVSEJRVGZvOHNvVHhh?=
 =?utf-8?B?aGkyTVpZMmFmOWpYR2h2MnExU0g2ejRnV1ZiTVRSZjd5TTZKbGFLZDBjdjh3?=
 =?utf-8?B?bDRPTm95VXhyV25lMzVNMEJXd2lCMDR1NnNVYUZYYWRxRXFab0tRL1BhWlN2?=
 =?utf-8?B?b3F2Q3RWZ2dheUp1a1JvdlhFMkI3TXh2ZFdlNmgvaWpmclRvcUpvcmpzVy9Q?=
 =?utf-8?B?R09kZFBzOUhrVjNlNHhFeTZ2NFZUcnhZQS9ySlcxZ1RhZGdWWEpkNTJsbUlM?=
 =?utf-8?B?azJ6Vk0ySUFpNGY3Vjc2MGpWRytKbERNK01kSCtUOEhzcTFiSWV6NjNSOFRp?=
 =?utf-8?B?clVXVXdObWFMY3pCM3I3eEl0Y2hhMU9LZHdjN2w1MFduUmhRZHNwbUEyL2pS?=
 =?utf-8?B?cFo0Z2p4NEgyVEk2cktkZkNDU1NwT2J3eU5PS0piODFPQ0VnVG1lOVF3OEgy?=
 =?utf-8?B?ZjlGTVU3MjduY3d1c08zaG0yZHdsek1ZSmZnWjNEbWg5RkVQSHFYOEU2WDVp?=
 =?utf-8?B?MXFUeHV4MnpwNXQ3UmlwRkd5N0FoQUNwZFc4bmxnaCtnOEVISGZUcDJnRklC?=
 =?utf-8?B?V1ZBQWRkVTk2K2JRYWRtZEdSdzM1RlJvU09SVSszYjljVnNsS0F6ZVp6S1gw?=
 =?utf-8?B?Rnk5Qmp6OHh5QVZxRU9ON1RUeEpobXhrV2ZEdDRydExyTHdKV2p4ZUtVQXow?=
 =?utf-8?B?dmVhWXB3YjRYVFNFZVE4YmVVNkRiSC9TYlljejY4T2dXNTA2M1ovQ2Z3c0pN?=
 =?utf-8?B?QVQrQVdqR3JpeFNTRitYK0JrWWQ5UDMydlpZYTAzYlhHdUtPK2pqZWNzYnNz?=
 =?utf-8?B?dkZwbjI5NjBBN3AwbEFqRDNSaUV6Tm1VN09mcVNyTzNrM1VOWU1qdE9YV3dU?=
 =?utf-8?B?TkdBU2lFSGxEa0k4ZnNHN3V3RGpCS1lXQTB3OUZBMWw3aTlnUXNhZW9iWlEy?=
 =?utf-8?B?N2JmdWoxTHFxZ1c2ZklOUE9pb2FBUy9ZTmZVVmllM1o4QVpNT0J5VHNVcEVL?=
 =?utf-8?B?ZFlzUUNESVF6WEhYUUJoUWxpMHZVbXFGTHNEcWRQRkZ6Z01ZNkx3bTRXRzFN?=
 =?utf-8?B?RjNlNkU1WGVDbjlVcjRyRDQzZVBndjFnZW5RWmxvYU5VNnRBa2xhMnkvaHRH?=
 =?utf-8?B?a2RnSCtLNjFxdGp4T3hqLzV6WFJ1YitnQ2tGZGVuREFtMEk3Yk55Yys3aWY5?=
 =?utf-8?B?TzRUeklWeUhaeGFFeHZrK0FhZjZtcDRIc0ZqblVpQzJhNk1ydEZkU2VlQ0xN?=
 =?utf-8?B?QTFibTAwZzBuNHZ1V1pEb0hsR0pQZWR2MkcyU0JFZllmTGdOc0NOMU1ya240?=
 =?utf-8?B?bTlXT1A0NmhrMUNQYitMWklEVkJmdnNxc0hjeU1DZHc5eUlKUTdaV3VOZzZo?=
 =?utf-8?B?T2pET3VnYzUzaEJCVlFvOEk1S2RjdkpuOHVWVXZSamtkNTFxS0VZeE5WOTdm?=
 =?utf-8?B?TjVSOU5vWG52Zk9IWEhBYmZTZTRCeXcwZ2YwSmgxajdOaWlmTjBRc2lYelN4?=
 =?utf-8?B?YW42bTBRM3gxclFGdmRNa0RKUE5CUGl6ckg0UjZ4d3BhalRSVnNuUjEzUFlV?=
 =?utf-8?B?T2dnV3hhL3FaYXM5T2lLM05MaUJtU3FjcWtYaGlaRHJtaUJVNkpHbzVlb2do?=
 =?utf-8?Q?BSNE=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32982818-4275-453d-e497-08d9dbfebc61
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2022 10:22:18.2093 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ms1hohte1qwfdHRYIOA6Iws6bP6AlOhJ7XcIFzZvCTHivIJlR/u5fxriQARp5LfW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB4672
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
Cc: linux-arm-kernel@lists.infradead.org, linaro-mm-sig@lists.linaro.org,
 lmark@codeaurora.org, wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, caoguangming34@gmail.com,
 michael.j.ruhl@intel.com, yf.wang@mediatek.com, libo.kang@mediatek.com,
 benjamin.gaignard@linaro.org, bo.song@mediatek.com, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, labbott@redhat.com,
 mingyuan.ma@mediatek.com, jianjiao.zeng@mediatek.com,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 20.01.22 um 11:00 schrieb guangming.cao@mediatek.com:
> From: Guangming <Guangming.Cao@mediatek.com>
>
> Add a size check for allocation since the allocation size should be
> always less than the total DRAM size on system heap.
> Adding this check can prevent comsuming too much time for invalid allocations.
>
> Signed-off-by: Guangming <Guangming.Cao@mediatek.com>
> Acked-by: John Stultz <john.stultz@linaro.org>

Acked-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/dma-buf/heaps/system_heap.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
>
> diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
> index 23a7e74ef966..b65e597a742f 100644
> --- a/drivers/dma-buf/heaps/system_heap.c
> +++ b/drivers/dma-buf/heaps/system_heap.c
> @@ -347,6 +347,14 @@ static struct dma_buf *system_heap_allocate(struct dma_heap *heap,
>   	struct page *page, *tmp_page;
>   	int i, ret = -ENOMEM;
>   
> +	/*
> +	 * Size check. The "len" should be less than totalram since system_heap
> +	 * memory is comes from system. Adding check here can prevent comsuming
> +	 * too much time for invalid allocations.
> +	 */
> +	if (PFN_DOWN(len) > totalram_pages())
> +		return ERR_PTR(-EINVAL);
> +
>   	buffer = kzalloc(sizeof(*buffer), GFP_KERNEL);
>   	if (!buffer)
>   		return ERR_PTR(-ENOMEM);

