Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93642598441
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 15:38:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88807B9B18;
	Thu, 18 Aug 2022 13:37:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2049.outbound.protection.outlook.com [40.107.100.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68536B995B
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 13:37:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jCAMi5kWF23wPi/YtH7pNRSw3+nh7U6MAy/6E9sMiwohChVOWfRMKIDfJ8kTFjK3I5d68fbP4IXrZP35e6dFdfKdl8QU+fSRpKFnHouO7j/lLXsUXgg+PWuS6PcWaNCleXDbytb/cNaQuRwkHcbkLBU40XJMzs+UQ4aMYpA9UqdYSIA8CcqrV7tyj0ri/kUmIt5vkm+PQhBN/abqvw5RwaRRAUeDrK/SwmnY6QE5lQZTd8f0oPWCssimm4KpGFsY4h92nku6TyI10MIGSJBF6DzE8RX8XflIHKAUoZ/ivFCUYIRHUMn/2WZ65eekxopBR9tDm0ZZKjvNdopGOomRew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bVx+8gWum9/gbqU9l4Z5rJctQuHHWlWUDFQPeHmXY0k=;
 b=nDS/WJZjb/oAvkAypnb2NRSnoNbdKYkVxf3TwXiiEHy5xddROkANjrLxM/DxY+4smOThx9uAJC+7H9tZU0PDCwywRL1oNjGGJLBHYJw4x4ibTRxbv4pIUFCm7Dw+fZ9HH32BdyFizqoblzeSkJ/rkIYcs1hmuFpYWqgPeJ/7W69twMjhIDt/3dGsYxXRBlWeugsbgI0K3fjzfA8D7LS5zGIHDjEHMzzQHq767rFtGQ7EG4fRl9EOFdIMDIrNO56LyeBvJmy++LVD4O49OFua9u77a1qCi9ksyGGmEoFQplOBaXBS61wSOKOQhED7LxcRxXWerkdUhe2BokGOIOBgGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bVx+8gWum9/gbqU9l4Z5rJctQuHHWlWUDFQPeHmXY0k=;
 b=ku0tw9yabZelts1tfTEnzHToV3KKLr6sPj2kI944Ox0UJynGGEB/t+STRTz3qYa1RyNj4PeQe4/iZj+XD/wyCmwKM8aWCcF0AcxmXg1tibmh4S8HsTDHXYPv0baKOkU3Gigj0h2dqSo4rarmpQdCuAADHflSQrbR3sM5gx5tJkc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM6PR12MB4420.namprd12.prod.outlook.com (2603:10b6:5:2a7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Thu, 18 Aug
 2022 13:37:07 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5504.020; Thu, 18 Aug 2022
 13:37:07 +0000
Message-ID: <23cb08e4-6de8-8ff4-b569-c93533bf0e19@amd.com>
Date: Thu, 18 Aug 2022 15:37:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/4] Allow MMIO regions to be exported through dma-buf
Content-Language: en-US
To: Jason Gunthorpe <jgg@nvidia.com>
References: <0-v1-9e6e1739ed95+5fa-vfio_dma_buf_jgg@nvidia.com>
 <921de79a-9cb3-4217-f079-4b23958a16aa@amd.com> <Yv4qlOp9n78B8TFb@nvidia.com>
 <d12fdf94-fbef-b981-2eff-660470ceca22@amd.com> <Yv47lkz7FG8vhqA5@nvidia.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <Yv47lkz7FG8vhqA5@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0142.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::15) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 64824f27-6dd7-4779-ee89-08da811ebe92
X-MS-TrafficTypeDiagnostic: DM6PR12MB4420:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ALp61X/c9c/YpADkEsexlgHxu/j8U5PgGhJC5+fON4g3vRMopazdpJ18mDu2/TCNvRIhlyPQLb/cmwlnKs6OZnuRMPiSOEfmnlhESO2G/lYWnX4Zi8bPOcLBX67cBkVeHNiGAAh1I7yNedmcNd++1fM3QEd8arA96ggEwU8KEj8rRKcWbxa021XpPAgXoDrMS+JPx4a0rSMbSWoeO01NqJu9hi73fh+Kiep6xhLMGzcFUjUAxaZ34ZIAv12tnOngHrRAhKoVMgZS1rHDfkknuz/tJUh6zm2+ntLp/gXJaFcHIB2skFado8P7k9JkYivre0VOZmSRIIg2dxXLb/iGV+FLFjlor2jwFno8GhnF7yU6Ta64GP+qR9uciWaWS0qw/T255I/2BIqYsOr+nQlP+A81k3eiJMcNSQB16BbW3QlEJKZZQbws0GvUFwCtoE9SOPBtYatP28K+qEyqWgVsHp/k6xxHaRh9YZYGbkWW49DQwuiz5ss1bHwbx+Vxd18l9XBuOLMiqKOd+8pUXnvq42ujTimhtL3h1S799mf6ipnAmtKFrw4UvUlWAPuJe+UgiI1ZbkPAvLZ6mGl5H/kpb9uJzWHs1rzi6GicRUi7CkrTsWE915ZKkdcoEkjbVuP6cg0CA0DUkWy2JUaU91ztfLLTEULfC+IHUDb96Omiyb4XyEbzpH4nKk64Je6hkNM1r9/q4w5u/4oY1OeBkzTz0KagUXULBcCP6taP6IGqCpFRgaqut3g7/oD5WJ5sl09QtBHyGzEoXRHQpeU5+l5PA035gjOxexrSYCDwnTZYyu8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(136003)(396003)(376002)(39860400002)(366004)(31696002)(478600001)(66476007)(66946007)(66556008)(66574015)(6486002)(8676002)(2906002)(41300700001)(6512007)(86362001)(26005)(4326008)(6666004)(186003)(2616005)(7416002)(5660300002)(8936002)(36756003)(54906003)(6916009)(6506007)(31686004)(38100700002)(316002)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eEp2UDZmdXlNeTFYTFlZKy9vblN0OFRIblZ6WWxZK2RHL1pZdWxCd0p4R1F4?=
 =?utf-8?B?Y1c5RTBMSHprcWpPczFEWGFrQ1Y5WFk3US8yQ3hZVDRwWXRKbXRrQUdTbEx2?=
 =?utf-8?B?aGd2b01zL01wRkMvdFhSajdLSTNMNXluR3ZCaGhpSG0xcFErbHdGYXVnbnVM?=
 =?utf-8?B?QW5KMFFzcWRpQ3NQMTdsL0xTSU5CaXBxU3VwenF0UEFrVjVSNmt0eXJHN2NO?=
 =?utf-8?B?U3ZjdW5GOTcwbWltcTNuYWp3UGl5SXJVNE5ONEt0ZGM4ZytqQ01MOWx1SGhu?=
 =?utf-8?B?aTIyaG1ha0hiMFcvZmNXUUh2dmxUaXluN05FbGRqSERkV3I5NHZhVDZwempH?=
 =?utf-8?B?WkE0WnllN2RkaFVYVzhwS0w4dGI3WGpyU0E4WjNhR1JuWlkzZzAzZkR3R1Qy?=
 =?utf-8?B?MmNKcjBDazhJbnE2bzhuN3NZeU9IR0hCMkExUkxtSTVMbE9DTnlZQXlXQmdW?=
 =?utf-8?B?MENEdHNsUCtYZ1hpM0pSM2s4cXV1Mmd6MG9sVTg0VUxqdG56SW9aOGl5RE9z?=
 =?utf-8?B?aDdodTFiT1BOTFBSWDBNN051QzJIQ25BUmpublRicHdwZlR1MENMZ0wyUFh1?=
 =?utf-8?B?M0Z4TC92cThWYXppRStLeWF1Q1NndXBOa0RYNE1jeHE1S2QvdlVSdyttdzFa?=
 =?utf-8?B?aVc0MTliOTBZY2trRTJqU2ZoTDkyWTlFWHV1TFVnV3luR3h5Yk1hVzg0Uy9I?=
 =?utf-8?B?MGhnYVI0d0pUZXFrMGYvYjJKRHlySUJ2MktFY0RPVUQ0cVJ3M0pIRVQxbnJX?=
 =?utf-8?B?MHhGTzVXekh3elpUTXFXS2l1UmxXR1JsTWoybVRNaGI4ZTdBRFlxaU5zWndL?=
 =?utf-8?B?bGZtYzlqazZYK09WUmNJc2NFVFdMLy95SFo2WXhpY3QrMmZJUWZSbWFySFZo?=
 =?utf-8?B?OE1UaGVPWEZTVktDNnBmQVhxa0FmbytON1JWRit1TEMvTW9JaXVOaTNFTm9D?=
 =?utf-8?B?bnBLeEtORWJlV1N3c1RPQnkvbW5tZCt3Q1p4b1p5REdTNmVaVXJLdk8reUti?=
 =?utf-8?B?bUl5V0F4NHJsZGxjTS9BOS9US1A4VWFGaDkvVHNaeS9rVmNlWXJHOG5mdDRp?=
 =?utf-8?B?SXpTR2swZFJVcGxkNTlTQzh2YzZxY0dMWnNweTA4TlI2T0tsTzdUVnkyWWdq?=
 =?utf-8?B?QzJTUzdjTmVKSTRQeDNMM1NOME9UK0ZvNEd0WDRoV1Y5eVA3Q3hLOUhUNGZi?=
 =?utf-8?B?YmJZOVdScWxzUThYR2JnVm9iMjREMGVETGV2YXY1YVZ2a3NaVFVGYXZVMzBx?=
 =?utf-8?B?ODgxTjgzSHFnbmM0YTFkeGhadjZ1cTRkdEdsSFE0b251aDlIbkVwZDgvZkpj?=
 =?utf-8?B?QkRQbjZjcHBUQ29jWWFJM0plR3NnNk9vZ0FSUyttNTBqZ2VOSk5iTm5iUW1V?=
 =?utf-8?B?NXRaWjhXWVpDWHlKcnZzS0VQTGdDQWMvK2Vocm9PN1hZZy9hdDlhM1ZCQUoz?=
 =?utf-8?B?VnI5S2ZENWZKRHZ5NnhRUmQrODI1VkRvdCtzOEJNekVrWTBqcHVlMUh2MVl6?=
 =?utf-8?B?RDFlZ3ZTOFBLbG0vRWxJQ0R0YkxkVkQyVlRVejZ6ZGxyR3laMnVwVUs2YlFN?=
 =?utf-8?B?WXYrTjRUZ0FjRkw1R0JBUzAzdGlLVWhEdlJLUlF3OE5UZk84aUwveUhyQS84?=
 =?utf-8?B?c2J0T20xcFZ6UHhmdzBZRUgrdHlhdnNZRXlVeTI5dTBpUkdpNm43M1NxbGNY?=
 =?utf-8?B?YUhGOURMRTVYS2llSngvQU5hUmZmRnlJU3lHcW1vV0d3cWlQWDVnTkNOMnBO?=
 =?utf-8?B?SEsxNmhGTEQ1ZUUwOFcxL1JPdUJ1WHJtZnFvZXA0R2VkdjRPdE44QlpIR01u?=
 =?utf-8?B?aHpveGZQYnQ2MUM4WjBkVWxpWjJxUU81NE13LzRhOElGV1ZoVGJSdkpGY3NE?=
 =?utf-8?B?ZVRoQVhpUldqcW5tTjcvMXZOa05xbWlCTnEzVFArUGEvS2FZbVpWNkh1Rk04?=
 =?utf-8?B?QU1Hc296bzZLa2o0cSt4ODkrQ0R5ZFFMbW1TN1d0UWpIdUNJTHBkdVJXQWNR?=
 =?utf-8?B?aW9LQWRvcE11T29QREVBVWkvSDJ1UDlYdTR0Z29zSElXVmMwNWhpY05hSU52?=
 =?utf-8?B?NzVMTUZkZ0R6WHlBak80T0Fhdm8zNmdIc1JCcDlKUGovaDhxbDRLQ002dk9B?=
 =?utf-8?Q?m3+ohE6Hl3Z2S0gmiNbjEgcak?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64824f27-6dd7-4779-ee89-08da811ebe92
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2022 13:37:07.4992 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BmRrSF0Lj/2hxPw8oaAogwBW2Zo4zc6r66ZYPxC2jLFCj2mZ6foMeJCsX/n2MTCr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4420
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
Cc: Leon Romanovsky <leon@kernel.org>, kvm@vger.kernel.org,
 linux-rdma@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Oded Gabbay <ogabbay@kernel.org>, Cornelia Huck <cohuck@redhat.com>,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Alex Williamson <alex.williamson@redhat.com>, Maor Gottlieb <maorg@nvidia.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 18.08.22 um 15:16 schrieb Jason Gunthorpe:
> On Thu, Aug 18, 2022 at 02:58:10PM +0200, Christian König wrote:
>
>>>> The only thing I'm not 100% convinced of is dma_buf_try_get(), I've seen
>>>> this incorrectly used so many times that I can't count them any more.
>>>>
>>>> Would that be somehow avoidable? Or could you at least explain the use case
>>>> a bit better.
>>> I didn't see a way, maybe you know of one
>> For GEM objects we usually don't use the reference count of the DMA-buf, but
>> rather that of the GEM object for this. But that's not an ideal solution
>> either.
> You can't really ignore the dmabuf refcount. At some point you have to
> deal with the dmabuf being asynchronously released by userspace.

Yeah, but in this case the dma-buf is just a reference to the 
real/private object which holds the backing store.

When the dma-buf is released you drop the real object reference and from 
your driver internals you only try_get only the real object.

The advantage is that only your driver can use the try_get function and 
not some importing driver which doesn't know about the internals of the 
exporter.

We just had to many cases where developers weren't sure if a pointer is 
still valid and by using try_get it just "magically" got working (well I 
have to admit it made the crashing less likely....).

>>> 	down_write(&vdev->memory_lock);
>>> 	list_for_each_entry_safe(priv, tmp, &vdev->dmabufs, dmabufs_elm) {
>>> 		if (!dma_buf_try_get(priv->dmabuf))
>>> 			continue;
>> What would happen if you don't skip destroyed dma-bufs here? In other words
>> why do you maintain that list in the first place?
> The list is to keep track of the dmabufs that were created, it is not
> optional.
>
> The only question is what do you do about invoking
> dma_buf_move_notify() on a dmabuf that is already undergoing
> destruction.

Ah, yes. Really good point.

>
> For instance undergoing destruction means the dmabuf core has already
> done this:
>
> 	mutex_lock(&db_list.lock);
> 	list_del(&dmabuf->list_node);
> 	mutex_unlock(&db_list.lock);
> 	dma_buf_stats_teardown(dmabuf);
>
> So it seems non-ideal to continue to use it.
>
> However, dma_buf_move_notify() specifically has no issue with that level of
> destruction since it only does
>
> 	list_for_each_entry(attach, &dmabuf->attachments, node)
>
> And attachments must be empty if the file refcount is zero.
>
> So we could delete the try_buf and just rely on move being safe on
> partially destroyed dma_buf's as part of the API design.

I think that might be the more defensive approach. A comment on the 
dma_buf_move_notify() function should probably be a good idea.

Thanks,
Christian.

>
> Jason

