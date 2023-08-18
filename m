Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A33C780801
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 11:09:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B554610E0C5;
	Fri, 18 Aug 2023 09:09:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20618.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::618])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FAA710E0C5
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 09:09:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LBH6JhwjLwPGmDTJzI7IyfKDOjJQ8qAysHrZRXui3ZvXnFUw/1ZE3Lb4eunM0yRwOiALmsbccK+0nojJ0qPAowphC75TdJWgv97fUr7wQabdAg9GoFp1jShis49uAS5wcQlS8Zd8wTzixUV1B8sKVCoB+xf77U2eNFXdnXZ236JpGFXK3+SwarojBz0cbArNqnnJwjbGX1JZ29MBlVspjNT0cbhIrzqWgwogI+hUf9qs9RkuCZkwk3XHRzGipZbycPBy5JewM+4ybCU5wJpHlDc9Q1ODFWJ+Us11HBEoATrQglIiKO5eTXcB5VFJDHVDIZJ54RFnIUvGHqjzXLLzbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u82SYAi0uDUw2MuJGQ/43lT/dImJBKEedd7j9reyd9Q=;
 b=AgRtw9SKXFjRFKYuNe9/OR5+OdztxmzFFD1d877Jl3HPSqzuQAYddrdf4Iarnt9DOaKMYyZZXneTVRbS17Jv4yB2XcjE2WtIuC8R0lAGclYOPMrlMWld/fI3BBIb4CWPKas5FLX2AU69JfxAYnwV/a/VrjfXQUuBLZ6JThu//iP5H4JHxhHukn24ydXCU2IaJcZMr4l79ti5nQgR4SCAuO+whZqx+Zt9W8UT3+n+6z6x0+66nNRRIBLRCqMaaNfTzkceSwI1Q209o76kh3cUUhSSwnVQvZ2kxd0s2rDTNrMM+8iK7AERWVnjLEHeE7O6Lv7mtbDkA3J+p/LzGWyzug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u82SYAi0uDUw2MuJGQ/43lT/dImJBKEedd7j9reyd9Q=;
 b=om8DTllPxvbkLS6W/9v8vrWInb8z2wwKsGTAO44CTME4le7vl2UcGOLGGY0hFJjiXKa4ixBBcF6METV7RRcdAsHJYUYje4HFCLIaCQ/SpUpX21jy2LCYIB4bde+YPHvoNfCucvFxjlI0av28Z7BiZ0r2abVinWTXwpsoiVzYUxg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SJ2PR12MB8806.namprd12.prod.outlook.com (2603:10b6:a03:4d0::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Fri, 18 Aug
 2023 09:09:23 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81%4]) with mapi id 15.20.6699.020; Fri, 18 Aug 2023
 09:09:23 +0000
Message-ID: <647d3838-0d9a-d9d0-b057-87cb4b0f9c16@amd.com>
Date: Fri, 18 Aug 2023 11:09:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [Linaro-mm-sig] [PATCH] dma-buf/sw_sync: Avoid recursive lock
 during fence signal
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230817213729.110087-1-robdclark@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230817213729.110087-1-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0067.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::21) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SJ2PR12MB8806:EE_
X-MS-Office365-Filtering-Correlation-Id: 1105147a-0fe2-4f9a-4567-08db9fcad076
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AIRr6qr49JuWl9ILYI1KmvDU6Wb9Naim7lKxTs00DlRe4gke03J6FgAiHO9OKyyOZrkVFK9KZUlJm62lnU/thGN8T5U30nYZStiIT535woOq8Q8XBKU6m3cxows+M5MFHaqaeyceffC7OGjHeRSb/o4jYTloGqbxfuh7SHDOaHx2JiWnet1yRm9PMtOwSwXgYJkC8c84Y1lZoYGIGCxlcCr39Eq8ZdfWZNBJgnc+o589ILVQIm7STme8I1sSCD5Tgz8+Cq0TLay4RamApMiyI1QgUTsYNcrkyA1W0KbZTMBwQsA7k8018mDJzD8MhzKhJVRF4z09r4QOVjTMlYBTaxukVILdHmeTxpVTaalTL4lhUkniuI53FP4WeiEeWzhdjaQRtk5DTOIQvNJ2EP70mA4UZB11d7NKaoEkkewhmcTTzJ1x0yEKo6GDK/0lnkdSdxBzJqMDlkCXP3TWRkhO9GZjb8992UV1tfAHrYXw85+0FtJAygBbBvfo46c5Fe+6Gs+jQSoadDz9qTyvAd3zRwBUksHjmiCLUgGTwB8iw7U1zlssg2DoKIRpSKG9XGknhmz5032pHTZwuhKU5im//b5oUrbuRCfQPzZkbYGgfq1wzC+0m7Xo21iBxtvQwScN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(136003)(346002)(366004)(376002)(451199024)(1800799009)(186009)(83380400001)(966005)(66556008)(66946007)(38100700002)(316002)(54906003)(66476007)(478600001)(7416002)(2906002)(41300700001)(8676002)(4326008)(5660300002)(8936002)(2616005)(6512007)(6666004)(6506007)(6486002)(26005)(31696002)(86362001)(36756003)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGZJYlgxMW9OVGNCcGtTam5aUERzYkZqTVJBMzhsQ04yc0tjZHF6OThsQmt1?=
 =?utf-8?B?NjBiamxxNXpzWUFzelZFdG1UNUkxZ3RraE9FU0lWOWIyT21FN1hZWWpQa0ZL?=
 =?utf-8?B?YTU2S2J1di81Umt5V2dteWdDeW94SWpWM2c1WmJYZ3haLzFzY1V2Vnl0NlZD?=
 =?utf-8?B?dlRXQVgwNU9tOXYyYnR3VmFZYTh2czZjeXl0TFJ6dktDMmg1Q25FNlVHUSs0?=
 =?utf-8?B?c0JYVnZXdVNkcFhMdkJTTGxtRkNnUFZSQm9QWjdiQXBOcGlpNk1JbEFFbVo5?=
 =?utf-8?B?dEdjUjRxcWhpMlZQQUlHVzhiZEVCUDBoeEFNNXd6aGZZMEhDdzl5bmVzZ3NV?=
 =?utf-8?B?UVlqTlJwY1U0L1JuQWJ5T0s2QnFKZ1BDTEdQZ1oyMnpVbnZLdXNrNGJpdnhK?=
 =?utf-8?B?Vm5vWWFJaVREcHEzUWlmU2QyNnZNcjVCcGV1bUJ5ODlrRlFRYSt5SlM0ZUYz?=
 =?utf-8?B?cE1iRWd0ZU5lc2dkL0dpZzc5TE4xZWEvWTF0Q29COUMzTUN0cmV4RkRqYXY1?=
 =?utf-8?B?Uld5dGIxVkdGNDZBT3YrRm9scGNuSGEyNmFGczczTlQ0UkxuNW4yZWZQVWkw?=
 =?utf-8?B?NXl3NDVEamlDaGZhcW45Z3p3eXVLSEZRUkdCMUdWd09qQzB0YzNFVDJOSmdj?=
 =?utf-8?B?RzRvMzl6OEQ3SjVQUHl4RlZzam9ycWJoYUw1VDVHSHFOcEZqKzFVWWpvNFNz?=
 =?utf-8?B?S3hKR0pmVmtmUTFHcHhpSyt5WHA5L1psU0Zmcy8raEJNWTZ0SFBvd2h0WndG?=
 =?utf-8?B?NzF5WmpFN0Y2ZUNpNVN1b2IrcmY5MmRaZlhWYmN3SUtwSGU5WHF6RmZ2Z3JG?=
 =?utf-8?B?cE93WUJDRTExeWpRQy9ZTmxLWTE4MC9hSG03OTh3VFdWWHhsdnVOTEdmK0Ri?=
 =?utf-8?B?ZVUyVm1KckFYUGcrU3gyNFM4ckN1V0lJSCtYalRHMTBIcFRSQnhiWERlM2J2?=
 =?utf-8?B?VldaMTdaYnJzNWR1Z2JWSW5FeFc3amZYaytSY0xkTmFCdTJtVTMrNDZERkpq?=
 =?utf-8?B?eTRFUkxpclFtVmpFaDZsUjBwN1JkcEF4QitqZkNzVm4zQjN3YWZVdGxLQ05v?=
 =?utf-8?B?ZjlsVW5DM1NEYUkrODJOVXNNb01OSTMxL0l3QUtHOXJYZUhOdWFXamh6YUta?=
 =?utf-8?B?bGo1T1BCblA4Ti9pdDd3d1AvVXdQZ0lxakN3ZUdhUjQyZHByWDRSZnVrRmg0?=
 =?utf-8?B?bEplRkVaZ1pCWU1xbHg5ZmxyNHNzaUlmOFdrdEY3ZXQvMUlGTW52ZTFWYk4z?=
 =?utf-8?B?VUFsa3VsTjBGNGEzMU8wWjU5RHdxZCtpTjdZRlYyRXZsSzc4MFN5VHZURWdk?=
 =?utf-8?B?MUd4aUkySk04dFRWVjJmOUFFc093TytiY0N5ZHRRQzMvOXhzeENPTDBoVWNi?=
 =?utf-8?B?NG5VMXJPWkxjdmJkQ2RmQjR1WnpLMGZNUWVNeElPaUdSY3hMTzFWUEtNWGZh?=
 =?utf-8?B?bWdCL3JyVk9QM3VDNkEzSWZHS0diRkhZYWcxVVNJNTN3bFdQYURDR0I2em5S?=
 =?utf-8?B?Z3hPSzNKWnVMTXNUbmRIYkRoNW1DeWlJOS96c2VuVkRXWlhUaGZYdXdUN0ll?=
 =?utf-8?B?ZUlRMXVJaFVscU5CYkdRcGJqbEJUQ0I1ZitHbDBmeXpkTml1RmI2S1ZTTDIv?=
 =?utf-8?B?eXp3Vklkb2lUMUUzWTEzV1krQUNWRmRsdWdtcmhQYjREUSt5dnhBenNFelMx?=
 =?utf-8?B?cVRJRG91UWxNMUdmYU5VYWsvalZzTm1mUjZlUnRobUNFQlJxdHdNZkI4Q3R3?=
 =?utf-8?B?WmdlWjRlMk0xN0ZxRWYxRTZ1ekpObU5yT1dXZlJ1NVRKUGpUMVQrdGdwUTJX?=
 =?utf-8?B?T2x1WmJsUnpNQUxNWFZMOEFDak9ESDhIOWR2bG5TSjlsdVpLYWt4MjVnTW9X?=
 =?utf-8?B?WWNRd3Z3UUhoY3ZIOFdoUHBYWGNjTHY0MGJVcER6Z1o3Y1pCWkJhQityT1FT?=
 =?utf-8?B?Q09ZcWFRa0piQWp5SldSdjVvZGEwMUc4OG50anFWb0pxNlJOb0doZ3kyNXF6?=
 =?utf-8?B?elBkQWJkQWIzWXpFa28vVDF4U0tJaTdSTWZZUVVKcm5MSmhiUjNTSGNVRU1o?=
 =?utf-8?B?SFd3cmlIbTM1MGpNNXN2bTNXZEErTWNJaVd6N1l4K2lvZ0loMjk2bCsxYUhp?=
 =?utf-8?Q?DPCYCU/AlblaYPOeGqFcfiwcY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1105147a-0fe2-4f9a-4567-08db9fcad076
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2023 09:09:23.4764 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PDnHEvih1oLJvpO7pmheAxadG6BYnwvQLBcSA1JvzlAtZ4vX+wZT/aPcbfuCDIdY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8806
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
Cc: Rob Clark <robdclark@chromium.org>, Gustavo Padovan <gustavo@padovan.org>,
 open list <linux-kernel@vger.kernel.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 17.08.23 um 23:37 schrieb Rob Clark:
> From: Rob Clark <robdclark@chromium.org>
>
> If a signal callback releases the sw_sync fence, that will trigger a
> deadlock as the timeline_fence_release recurses onto the fence->lock
> (used both for signaling and the the timeline tree).
>
> To avoid that, temporarily hold an extra reference to the signalled
> fences until after we drop the lock.
>
> (This is an alternative implementation of https://patchwork.kernel.org/patch/11664717/
> which avoids some potential UAF issues with the original patch.)
>
> Reported-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> Fixes: d3c6dd1fb30d ("dma-buf/sw_sync: Synchronize signal vs syncpt free")
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/dma-buf/sw_sync.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
>
> diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
> index 63f0aeb66db6..ceb6a0408624 100644
> --- a/drivers/dma-buf/sw_sync.c
> +++ b/drivers/dma-buf/sw_sync.c
> @@ -191,6 +191,7 @@ static const struct dma_fence_ops timeline_fence_ops = {
>    */
>   static void sync_timeline_signal(struct sync_timeline *obj, unsigned int inc)
>   {
> +	LIST_HEAD(signalled);
>   	struct sync_pt *pt, *next;
>   
>   	trace_sync_timeline(obj);
> @@ -203,9 +204,13 @@ static void sync_timeline_signal(struct sync_timeline *obj, unsigned int inc)
>   		if (!timeline_fence_signaled(&pt->base))
>   			break;
>   
> +		dma_fence_get(&pt->base);

Question is why don't have the fences a reference on the list in the 
first place?

> +
>   		list_del_init(&pt->link);
>   		rb_erase(&pt->node, &obj->pt_tree);
>   
> +		list_add_tail(&pt->link, &signalled);

Instead of list_del()/list_add_tail() you could also use 
list_move_tail() here.

> +
>   		/*
>   		 * A signal callback may release the last reference to this
>   		 * fence, causing it to be freed. That operation has to be
> @@ -218,6 +223,11 @@ static void sync_timeline_signal(struct sync_timeline *obj, unsigned int inc)
>   	}
>   
>   	spin_unlock_irq(&obj->lock);
> +
> +	list_for_each_entry_safe(pt, next, &signalled, link) {
> +		list_del(&pt->link);

You must use list_del_init() here or otherwise the pt->link will keep 
pointing to the prev/next entries and the list_empty() check in 
timeline_fence_release() will fail and potentially corrupt things.

Regards,
Christian.

> +		dma_fence_put(&pt->base);
> +	}
>   }
>   
>   /**

