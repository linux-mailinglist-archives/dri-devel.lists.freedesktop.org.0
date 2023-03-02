Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA3D6A85B0
	for <lists+dri-devel@lfdr.de>; Thu,  2 Mar 2023 16:56:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBEE310E0E1;
	Thu,  2 Mar 2023 15:56:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2079.outbound.protection.outlook.com [40.107.223.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30AF010E0E1
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Mar 2023 15:56:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DBBG9Wmvlo0Yvj3a4cEi7yps40t1oj6EnBX7+aWI5DI429yUKIULRSVaJqT2gz5y0Fhgb+vGEX5FwEDXYDm/+QZ+A5WcBFY+X1GTr1tL+dp5ovNu6S4VCUmj+kBaST5AHkeYbxmI9v022AjqiNptbg+ibTnG6ZFfb4gGpL6as7fl6nnvKzlzQFlDpRaxCQulAwAUmnYJAyFajdY+Xu5MfBlbTKFseEyhZOLEXxdbLIWqkzCxfsttFPnOZriDQFkBetMrOsd5toxGuCx1fS+SMBYecBWT1jpY1PE06aur1Fk5y3vPmEz6bO3BUf+5RGdXcLy3CmlWcSt4O0EBKsR0nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=REOR/CaTqvocmqOI/k+7ufLB35+lv6R3oO8z8MyMyIg=;
 b=ImFYzHA2I44YYJv+J/WyRvZu7QMHRWX0RxeifXXvab1W/QvTlGZSKyJhisGIILlwE032lGRz7S9SCu3bVIz6WLSLB9h6DJHe87NaKt+aC53kxb6Im1LGgwn/nloP1vgpfhNMDLfou8xeoTHLyZS8kDnauJuJKY2EtDyk/VQjlSmuX6ZjnzRlp13uPcWBPgn2FzR7+t57Q56++XJo9Si4G62u5Qpp04or9ENeH4k6HIlmHqr3HPdVVKmxtH0vSaasDrXDCdAOf+iFFFuqqmzPNrULsQLbN7vZAgGNv+hdmL+Ejzj1ZzUdNnPQP+iN+4s8aB76Nr/U3BUVOK/rc21u8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=REOR/CaTqvocmqOI/k+7ufLB35+lv6R3oO8z8MyMyIg=;
 b=AwbtRzGkUdwpZS3OkGbj1wzNJzXAJyfqlnVzbaEPoxsxtbz4BMnMAetgMqd0ttxjj3V2L5FCeJIe75RNXmempMvjwm56xeEAVnmMTgBzoHRMO8GkYLful1VolXsAKpBhvT/bALfDDe1nSP4g3v5/kHon3ZNlBGGXopYvR2kQS1M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SA1PR12MB7224.namprd12.prod.outlook.com (2603:10b6:806:2bb::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.30; Thu, 2 Mar
 2023 15:56:20 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918%4]) with mapi id 15.20.6134.030; Thu, 2 Mar 2023
 15:56:20 +0000
Message-ID: <3ce3a304-6157-2b7b-a67c-41cdc31cb66d@amd.com>
Date: Thu, 2 Mar 2023 16:56:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 1/2] drm/prime: reject DMA-BUF attach when get_sg_table
 is missing
Content-Language: en-US
To: Simon Ser <contact@emersion.fr>, dri-devel@lists.freedesktop.org
References: <20230302143502.500661-1-contact@emersion.fr>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230302143502.500661-1-contact@emersion.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0199.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::16) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SA1PR12MB7224:EE_
X-MS-Office365-Filtering-Correlation-Id: 72587af0-e285-48bd-b15a-08db1b36aa2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2xNVJrrPtZfZNi5YSYzN0EwmCnCQuFfzzwuY6lvr8ZW0eosqREXODx3UyoLRTmoJJSGkuzaq8HP1lPqrSE+tpQv9qHPCG9OawGII3pvwR1bDfP0scWWYTRRIius6LUnJWB18lvpdlahu0RKd7JUbu8Ow63pd9FuRpTFnq8rHmY+hl/2Dh3l93I8CJJmr2TsePhk+XPVQrfqmd5nx2MaqIVOEJulf+THYGJ2KLqFyeBRq6Xm7PAQ2Qc9h3yWuobDpkukjKGk6YeqDEJF2CoI1mQRUeZ1ykS9P3NC6JW8xdqtUAvipVY2sd8IL2KtfYIlO0tVjDVmb/pvIPGfP+4nV6npCziuPWCrd4qjp7trpfskZ3wFzHgYyFeAYkjcoxnR7xafS7G2fJ6X27ZXigcV1HANiDxrD3Dw/4NJ68TwXs/qyVX8lOsKN3tS8yiVXGaERFbVvKtNX3Urg9PyDpa0nx1h7ibFH5DWTr/4AsNsZAt2fEbl0lE937KaiZ8wVjTh1QL1PvRI9ol+LUEGgicxrNKaodsoKYLbUgA/qM2jz+Y1AscUq2Y+ozDepPKcjcBGlniefOGohdUI9GUJXpTq7RKDSFzqqKifcpgYUgdplGjMhg6jDXztj7hQbEjH4ll9BOm24Kvtun0aQkQw53WBGplpfzmqwku4Q1csntuJbxRm+OnYoyI+qucPn8pdZ9bcs9cFHRdhMFl+4g/4yQy5vE9p/xNBFAQ3Cjc6Y14H+1qw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(366004)(39860400002)(376002)(346002)(136003)(451199018)(8676002)(38100700002)(4326008)(66476007)(86362001)(8936002)(36756003)(31696002)(5660300002)(41300700001)(66946007)(66556008)(2906002)(478600001)(6512007)(2616005)(6506007)(83380400001)(66574015)(6666004)(186003)(54906003)(316002)(6486002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eU5TSlVKN1ZOSGN5ZzhVNjZ4OGY2Q1hKVmdtNnVJVlZyWjV5bUg4VEhCVzV1?=
 =?utf-8?B?OGhhaWcwdG5nRXd0RmhsTlE0cnc2Q2k0WlFNYzY5eThiSkwxc2hndXU4TWZ5?=
 =?utf-8?B?SlJyTlp4YysrNWc5SFZtZG0zTzZTRlJLYWF5NHBZZlRNRHAyMWVJN2h0WXpa?=
 =?utf-8?B?RFFZeTVYRE9FRDJVbGtVWnhMTkRUY29MY1hmaFVWU09ualNmOUFweEpyRTAy?=
 =?utf-8?B?cmh1Q3NCbW5Yb3NUTm9acDlBVlVxajdNV0x5UFhIdnJ0aWkzMm1LWG5nK2FG?=
 =?utf-8?B?cWVDSkxNdXNZZnRlVEtwUC9nTHB0ZU9kTEZMMVdNclNwYWtRcGE4LzN0RVVP?=
 =?utf-8?B?TDdvQXZJZmVYOWFhNXBwS3ZSTFRwa0Eva0NHcmpXcFZuK0NPSm9tT2pCdExG?=
 =?utf-8?B?bTlqOHNrT1p0dWNTUWxZblBZaVh3d2FXWFJ2OFhUTnZpVHI5YjQ3ZnNFcElM?=
 =?utf-8?B?eEZ1OFBweFJJRGtaVkpuKzRGcWp4aTNZU2dqSXZudXpGZC9HN202WFNuTXhV?=
 =?utf-8?B?a0Zpc2FRbUlGZmNmSGVPV2M4NnFXT2tnMDdJVkNZRGFOSjZkalJEem4rR0VL?=
 =?utf-8?B?MXI1WGszemFWUCtWQkUrRWUvcStYTEF6WDgzUDBGR2lic1ZpekpVdFhvWlZo?=
 =?utf-8?B?dDJmL0cySFVJblFZWHFaeWE0cWhIUENnbENzL2ZpN3dBbFRwVjZTSjluQngw?=
 =?utf-8?B?dWxhNEtlcFFMQzEwMjk2WlFUak5pV0RWZVZUOUN1dUhVb0tTc3k2VkFpRlZx?=
 =?utf-8?B?UGE5N0VoalI5WStwcXY4aHl0QXFsT3NHdWxBRUpIUDRjeXJhandBSXlGT2pQ?=
 =?utf-8?B?UGxVOElQMjlDeExOUTk4dW1LbTI3VGN1V1g5ZitHVGRNOW1WU1pjTmdBSUNz?=
 =?utf-8?B?L0l6TUN6TW0zbXB0QUd0R2ZtRlRyeCt3VVY2aExtU1k2ekJ2Mk9YT00ydEoy?=
 =?utf-8?B?Z0xQVGNYanpTdEhpQ2VKWXp3MXc1eDBOcGpVUUI1aENtZE8zU28vcVRXUkh6?=
 =?utf-8?B?b0pyZUJteEpETkRGa05GQUpnL2pHTW5NYmNNVFI5bWRCNS94dTd4bC9VUGRT?=
 =?utf-8?B?NG9BYXphVHdGS09NM0pGM1YreWk0RktQQVY0c1l1YmtPN2lkQWF2RzRUN0JK?=
 =?utf-8?B?MGlBZzZaQ0laK1ZwbG5wa0RDcXh4d2ovYTNOblYxM3Q0TVg2N1VtUzNna2JX?=
 =?utf-8?B?eXFvMVk2dkk5WjZSaDFyUkVvbEtFdXVoVDZoNHZSWmNpbVF0MXBVOG9OSzQv?=
 =?utf-8?B?TUF0TnUrejN6ekdQWWpVekdsZWZFTU40MmpMbk01VVpKQ092LzBybVhDT04r?=
 =?utf-8?B?dFpMNG1kenVYRXZUN2daQ1JYd0xjanRuWWRTNGVYSjJJbXAybmVEbWZkVTVK?=
 =?utf-8?B?Rmo1dUNwcWQ3Vmt2NExNWDJ4MVBCQWlKOVNEWDVESFlSWVVkZ3M0Z0lnVFNm?=
 =?utf-8?B?VXNuNmUrZVlrOUJsZk1LVkJvdmNobVAxRXQxRC9IaXJpNWlOMTZ4Y0VuZzlR?=
 =?utf-8?B?c0hEVm9BbFVWK2dtb3F2MEI2YXZ1bnJHa2I1Ti94Q2RzeVhKSXlFLzBvNXk5?=
 =?utf-8?B?UlVyZmtqOUpQK284Qm1SVjdqUDY3Q3QyTkd0dlVab29OWUllRHRTOWpiMzdi?=
 =?utf-8?B?T2JRSjI4amhxWDJreThOVTREZFFSM1VrMzRqcFQ3YWczZ29qMFEzalJWVGxJ?=
 =?utf-8?B?TlJFVXhnMUU4NHZtK0JQeEx6Y2hMRGd1WmR5VDYzYVVHOUF4TDR4MVFpQXFj?=
 =?utf-8?B?b2R4eXNYdllZTEo3RjgxUlJ3d2FOeWJsVzh1NGlUZll0UVRHSXFPNzl3RWdE?=
 =?utf-8?B?MzFFS2lCelovMnhhakFlaU1IMjlPZTloNmdoLzJSUXVLTXh6V05pSUkwQjl6?=
 =?utf-8?B?ZGpnaWdQeGRpWmpsdnV4cHlFdSszNUt5L0U5RDdTTEc3ZEpKYU5VQnFPTXRW?=
 =?utf-8?B?elF5d3hZS0RnTlBDRkdaaTRZMXBLRGRkMzd1SFExVmt0aXdWQXVtVDRCMjNh?=
 =?utf-8?B?SUFjNU9FOGlNWWhwMndSSlZ5WTRHYWhLNzc5TjhKMUI0aFN1eEoyZUZQTitk?=
 =?utf-8?B?SlRZZlpzdVlTOGFtOTFOWkVNeWp6ZlQ4ait3UFl0bElsTm1ERFVPQUxtOCsz?=
 =?utf-8?B?MmJlQU04VkswQi9iTTljQlIyTEJwUnVqM0pRMFdZVnJoalRPcldXQlVDWTZX?=
 =?utf-8?Q?aIvKSzDqqDs0t9P1o5ZMqpqbTr9iika7TnCXIr7XHe94?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72587af0-e285-48bd-b15a-08db1b36aa2b
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2023 15:56:20.3043 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mcFnA28vjm9l58hAaWak4uNiwIjXqPJZTuvI0Hlt6+utMyU9ZhMw6rx1mVxvXkH2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7224
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Hans de Goede <hdegoede@redhat.com>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tian Tao <tiantao6@hisilicon.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 02.03.23 um 15:35 schrieb Simon Ser:
> drm_gem_map_dma_buf() requires drm_gem_object_funcs.get_sg_table
> to be implemented, or else WARNs.
>
> Allow drivers to leave this hook unimplemented to implement purely
> local DMA-BUFs (ie, DMA-BUFs which cannot be imported anywhere
> else but the device which allocated them). In that case, reject
> imports to other devices in drm_gem_map_attach().
>
> v2: new patch
>
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Tian Tao <tiantao6@hisilicon.com>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Hans de Goede <hdegoede@redhat.com>

With Thomas comment addressed: Reviewed-by: Christian König 
<christian.koenig@amd.com> for the series.

> ---
>   drivers/gpu/drm/drm_prime.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index f924b8b4ab6b..ab1d21d63a03 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -544,7 +544,8 @@ int drm_prime_handle_to_fd_ioctl(struct drm_device *dev, void *data,
>    * Optional pinning of buffers is handled at dma-buf attach and detach time in
>    * drm_gem_map_attach() and drm_gem_map_detach(). Backing storage itself is
>    * handled by drm_gem_map_dma_buf() and drm_gem_unmap_dma_buf(), which relies on
> - * &drm_gem_object_funcs.get_sg_table.
> + * &drm_gem_object_funcs.get_sg_table. If &drm_gem_object_funcs.get_sg_table is
> + * unimplemented, exports into another device are rejected.
>    *
>    * For kernel-internal access there's drm_gem_dmabuf_vmap() and
>    * drm_gem_dmabuf_vunmap(). Userspace mmap support is provided by
> @@ -583,6 +584,9 @@ int drm_gem_map_attach(struct dma_buf *dma_buf,
>   {
>   	struct drm_gem_object *obj = dma_buf->priv;
>   
> +	if (!obj->funcs->get_sg_table)
> +		return -EOPNOTSUPP;
> +
>   	return drm_gem_pin(obj);
>   }
>   EXPORT_SYMBOL(drm_gem_map_attach);

