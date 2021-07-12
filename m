Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CEE43C45AD
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jul 2021 08:43:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C22689911;
	Mon, 12 Jul 2021 06:43:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2054.outbound.protection.outlook.com [40.107.220.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D60D689862
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 06:43:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aYCGWtGUDlcMZp1jfH3aQsVfMHsYv2dVL3PkXPmR0BtE4S8nd7eE6JtyOyxw8PWKz+xz4vEtD5af3EDLgWGOHj+TWGsjiT6SJQQv84s7OeB8hfKR2FqWSM0nfakx1cpr6twJhdjwkhA8yzKYYXuqvUf3f6jDGFUZ8kSreLhW16P9BEr5gBKyVb064hH5BSxP8J1C6Xhq4NwqEyeNlQUs+Mj4/lXEPeLTPrn1CjHVMUZTZZU/zRnIyPE0WfJIFmf74VEU04DREc25MzeSKrPoCNiSUpBU/GRDkdrdFi+TuF6S9qbshdqPnDwuPI/0izkWjpacPsfViZk5lkqYQZeOvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IIu7Tb8pvW7ZQB2pwhfZgGoVLcLxnGctZAYQCLfQcE4=;
 b=eIa11ob6HLdj0Wb16jZnkz9k/ogpxV5zbiNixFnjItbArRUXaBAquelU9i39F8CXBvJRN0OqoBQcJkMuU5CzdX1ILr3beq5trl9xSdLh5FvAUl9yVMDlfGyiH6Tu+cUpgoVTyklhM2zqqU0fo9zbOqy1xWwnt+nDJ99wThfWIY3+R3sIZ3NlnSgzvaJ+kTDIMW1K6DEZLufWL6PQevm1RdgiwLvJsTbP8vc7Oi9NXytMe/fxB5qu6cTRCitjtXe1HIISgRCRglpyupREKsyTHBCEvG1HofJGmS9vYFr+m41iYI35yrgtmSEoBZ0pdqjQbs9CCxaCK1VGZCSMxTVAog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IIu7Tb8pvW7ZQB2pwhfZgGoVLcLxnGctZAYQCLfQcE4=;
 b=CgqELghbg0NEPikAuNh1uQdLGHUfuU9hL2kTAbsphr66L6Lbw6wF4EYfIFxIbFi0E19zE7KR6/n70JhPAwgXBSqzr3a1cKJC4tKNqMlrkQeWnldpPISiZPQA1azZ+BzffvH+VQ33Ld+aY0vZIU5CRJWmUWYWDtoz7AYQ8Ez7vlU=
Authentication-Results: google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3790.namprd12.prod.outlook.com (2603:10b6:208:164::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Mon, 12 Jul
 2021 06:43:51 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4308.026; Mon, 12 Jul 2021
 06:43:51 +0000
Subject: Re: [PATCH] dma-buf: Delete the DMA-BUF attachment sysfs statistics
To: Hridya Valsaraju <hridya@google.com>, daniel@ffwll.ch,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20210710051027.42828-1-hridya@google.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <4638d2fd-d8cd-d38b-b935-8ac8c0a935c8@amd.com>
Date: Mon, 12 Jul 2021 08:43:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210710051027.42828-1-hridya@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM3PR07CA0072.eurprd07.prod.outlook.com
 (2603:10a6:207:4::30) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:2cb8:23af:be13:1539]
 (2a02:908:1252:fb60:2cb8:23af:be13:1539) by
 AM3PR07CA0072.eurprd07.prod.outlook.com (2603:10a6:207:4::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.10 via Frontend Transport; Mon, 12 Jul 2021 06:43:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2f0666b3-390e-4e90-7989-08d9450068f0
X-MS-TrafficTypeDiagnostic: MN2PR12MB3790:
X-Microsoft-Antispam-PRVS: <MN2PR12MB379092283E3F80E8EBCB906683159@MN2PR12MB3790.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DlJ7LtzlMRoh+Mp5oWsR8FZO4fefPQnip6fLcdmNJ4EbdKy5a0tF2KvsudbEdZ+KeFUN9ih7+VhE7nVeZT8KncTMQh7G8UEEl+LUv2Mxs3RbXlFtyNhz5BZEdPx6ueV4cxPE3+FNizKvgUiMGAYU0K2JpuOzb3BwyfhC36bqOlENi0N2uTLRxo+a1P6CRUg7MzIng/hidvzdQ44MsVF0yrRtqjpeLtuXSQ4HLpfb2r0fmCbE/C2Nj9K45PZ9eXxqkThJEUfVvwswK1MAhQCLsnRHHzROnV04p6GJm0MiAMdSEt26uwGtBaxIC4pX94snbwDFX3cxo616M4cdya9Eu8iiZTrgsIzlN3S++/Ux8ROxdlOBjHUMXt7WV/aN+jcPqDNtmBj6Yq4Dm3r4lNaU8fBNA/rwi8wkTinCdzQfab9Q27+P9JrITI2FzqQwgIkkHCNUtFdq+fbYgXiZXzBPeNi6yK1WRLyb0mTg1hs95pxj5gGR4SclfuVoHyxcLX/J2u7knaT1hUaa39ib4sz9DfZwqjcb+7H7oedbtBuwvzMLkdkNGDqUEZ8+8cmVaejUMvR4QE1jcS4Equ2wAr4iRG9QspDsgRDTUV7qBoAbFdluvERlWjPmPUYB0SP52FMLZFPgGmfTq5m0QutcZPrAKrXEEQRehq/zCoQLWQYmdTptDltF7sXNVfrUdgEWMVCXwkxqnD+4jjFjnH3JRFyZcmUuvLlfXiyO2JesHeVPPKI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(39860400002)(376002)(366004)(396003)(6666004)(5660300002)(86362001)(31696002)(186003)(66574015)(66556008)(30864003)(66946007)(478600001)(38100700002)(83380400001)(31686004)(6486002)(66476007)(316002)(36756003)(7416002)(2616005)(8676002)(2906002)(8936002)(4326008)(110136005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N28rM2RXMDNhUHlEamVuMlgzd2JYNXEzU3l6c0gyOGluelFEUCtXZEwyMnVr?=
 =?utf-8?B?TGxMd0pndW4wdzZZb0YrdnNZNzZaUlRobG4zZmJ1TGNta0RtTVdBMk5xa1BJ?=
 =?utf-8?B?ZWl4SDR1Z21aQTJkOEo3V2RWRWx0bGp2RGw1bU80QjhpVDlBN3BXOTB3SzNS?=
 =?utf-8?B?TGN2dzFDSWNNUU15eFF5TlZ0Nkdrd2N3QkVHczlWYTMxMkc5L2xRUWZXd2I2?=
 =?utf-8?B?NXUrWnJqbnVWUllWb0R5d2l0cUsrc0w5aUU5NVpMYU5XTDQ4Y2tucWRocXNs?=
 =?utf-8?B?SVRwYVVBc2w2L3I5RDR0ZGI1ckFmWDZDWjRmSTJ5cy9YYjdJNjRYMGdKeDVO?=
 =?utf-8?B?bVo1VWk3d3FQRUVpVDZreFZNKytCT1hNT0RSWVoxRStnWEcycWZuNFFERlJz?=
 =?utf-8?B?MlFPWGgzaE9YODJ3UDlOcGlVQnJuQ0lKU2VRSE5HT3R0VW9EOWl0L2REWjZC?=
 =?utf-8?B?SU5oNDhjcGIrWHN4SUJFWER1NWxjRm1SYW10eGF0UTBKMGp6cGdGTmg3SmZl?=
 =?utf-8?B?aWNxWVRDd0d2QUt2SHBjNGtFZWlzS3h3T3pHd0swYnFpeGpqVzNGZ2xsTU9B?=
 =?utf-8?B?V2xadVVXZkl0QUV5SXdSRDFLQk1RUzhSM3hOV1hBb1V5eGl1UlJ2K1R6b3dH?=
 =?utf-8?B?WmVrQkFQbGJOR0xWcWhibGx1bW1mRHVrM3dCWWZYWk1SWlk2MFJ5NXhWM25i?=
 =?utf-8?B?VlBOeGxGb3ZuVUFpa3JmOXZXZFZBUWxjR09TQ1dXUWV6ZTRkKzMvVWkvRzEy?=
 =?utf-8?B?bTRSanFzcjVET2tmQkh4R09kMm9PK1JYcmNvYWRMRjl2QkluZnVPNmNxZEZi?=
 =?utf-8?B?cXNNMm5pZlB0OGtMS1ppNjUzK0paQTNCSVB0bFRUakZwVjkwRDdFSWlTTWY5?=
 =?utf-8?B?TStpUDBHTG5GUGhGY3hCZy93OTlCSFdVUVJWUnhmVW9WWkVDVXpNY25DVUpo?=
 =?utf-8?B?RVlZVEZVQ2xFbVIrdlRuSFlNeDJoeHBzWTJiNW9sZ29RYjRRb3JYZmdDb1hk?=
 =?utf-8?B?aGh3QnRnR2o0bEJNYzg4Y1hsQ1pkZStVdm5pTVNXcVh3RDMxZUdRU2hpcHM2?=
 =?utf-8?B?OUJXdTRnOHIwdi8yMUdoWEdib0hqRUhNL3JxQUxKY3dGTVZqc2J0N1hCWkV3?=
 =?utf-8?B?RW5yd29ka1pNcFdla3dSYkljMGJvN3dBRTA0NWI0V1ZNeXBlZDJJWG1YZWNH?=
 =?utf-8?B?YjRLWDdOUkdwUDU4L2F2QjlQS3JIRkgzdG5oSGR4SWp2RkVPZ2dsQUVTK2V6?=
 =?utf-8?B?bmxvZnZyODJHYjl1UEpFazZ1N0RvSUpteEhNSFZIb3ZuS3ByVlZqbjJialBj?=
 =?utf-8?B?bVN5NnIwS0FWVXBYWThHbEFvdW1lVXNVYk5ocjFnR1JNTnZQZW91VU9PQVBP?=
 =?utf-8?B?ZVNYL1N5VUJJV3JPdXVwU0FqeTU3dXJ2Z0ZWTngxR3J5bysxL01DZngvOUlI?=
 =?utf-8?B?bXlVWHZ1ZGI0QlIzNmRwcERzWE82aU9uRkpqYXpkdndVMHN0YlQyeXFiVUxM?=
 =?utf-8?B?Y3V1UXovdUJTM1RlL05QQ2FoZnpNVGZSRXN3Wll5V1ZMZkw4U0NFVEk0T2xR?=
 =?utf-8?B?SU0yZVoyTzJlcVlVb0tuWmZCMnFuQyt5dTlENFRhNThvQ3NTWXpRbHM3OUVi?=
 =?utf-8?B?Wmd4T2FlcXI0MUVSdjdoaUFNdWE2dExkQlR6S0xKZ3grMkZXdDNPN3BhSElZ?=
 =?utf-8?B?akxYMHhhdmUrb0NDSGJqdUl0RUMzNHpaNm1TQk8ySkNSUW9tWWVLRFNjRDJv?=
 =?utf-8?B?SGc0RTJtTm91OHFBTm1jcjFQVTlRQ0F0MmEvdEp1em9XbW5LQ2lWMXNvMjZp?=
 =?utf-8?B?aStpOHVxemZnL2VIY2NPNDU4RC9Vck1WWHEwaWdDc3hQSjVYcmFoQWtOcmRU?=
 =?utf-8?Q?s55GQbRhk0q65?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f0666b3-390e-4e90-7989-08d9450068f0
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2021 06:43:51.4321 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w1o77sef1tk7eixWUr9uohuQ2w2ZQgEkng1OXN+G5LO401Fo+RhKtAZblvgJ87X+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3790
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
Cc: surenb@google.com, kernel-team@android.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 10.07.21 um 07:10 schrieb Hridya Valsaraju:
> The DMA-BUF attachment statistics form a subset of the DMA-BUF
> sysfs statistics that recently merged to the drm-misc tree.
> Since there has been a reported a performance regression due to the
> overhead of sysfs directory creation/teardown during
> dma_buf_attach()/dma_buf_detach(), this patch deletes the DMA-BUF
> attachment statistics from sysfs.
>
> Fixes: bdb8d06dfefd (dmabuf: Add the capability to expose DMA-BUF stats
> in sysfs)
> Signed-off-by: Hridya Valsaraju <hridya@google.com>
> ---
>
> Hello all,
>
> One of our partners recently reported a perf regression in a driver
> which was being caused due to the overhead of setup/teardown of the
> sysfs attachment statistics in the dma_buf_attach()/dma_buf_detach()
> invocations. Since the driver's latency requirements were of the order
> of microseconds(~100us), the overhead was significant.

I find it rather questionable to rely on the performance of attach cause 
that can easily take more than 10ms depending on memory migration needs 
of the exporter.

You should probably consider changing this use case to use cached 
attachments instead.

> Since this indicates that the solution might not work well for
> all DMA-BUF importers, I think the right thing to do might be to delete
> the same before it reaches upstream and becomes ABI :( I apologize for
> the inconvenience.

The information that this is not UABI yet should be part of the commit 
message.

Apart from that feel free to add Reviewed-by: Christian König 
<christian.koenig@amd.com>

>
> This patch is based on the drm-misc-next branch. Please feel free to
> let me know if you would prefer that I send a full revert and new patch that
> adds the rest of the statistics.

Yeah, that's perfectly ok. Please provide a v2 with updated commit 
message and I can push that ASAP.

Regards,
Christian.

>
> Regards,
> Hridya
>
>   .../ABI/testing/sysfs-kernel-dmabuf-buffers   |  28 ----
>   drivers/dma-buf/dma-buf-sysfs-stats.c         | 140 +-----------------
>   drivers/dma-buf/dma-buf-sysfs-stats.h         |  27 ----
>   drivers/dma-buf/dma-buf.c                     |  16 --
>   include/linux/dma-buf.h                       |  17 ---
>   5 files changed, 4 insertions(+), 224 deletions(-)
>
> diff --git a/Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers b/Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers
> index a243984ed420..5d3bc997dc64 100644
> --- a/Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers
> +++ b/Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers
> @@ -22,31 +22,3 @@ KernelVersion:	v5.13
>   Contact:	Hridya Valsaraju <hridya@google.com>
>   Description:	This file is read-only and specifies the size of the DMA-BUF in
>   		bytes.
> -
> -What:		/sys/kernel/dmabuf/buffers/<inode_number>/attachments
> -Date:		May 2021
> -KernelVersion:	v5.13
> -Contact:	Hridya Valsaraju <hridya@google.com>
> -Description:	This directory will contain subdirectories representing every
> -		attachment of the DMA-BUF.
> -
> -What:		/sys/kernel/dmabuf/buffers/<inode_number>/attachments/<attachment_uid>
> -Date:		May 2021
> -KernelVersion:	v5.13
> -Contact:	Hridya Valsaraju <hridya@google.com>
> -Description:	This directory will contain information on the attached device
> -		and the number of current distinct device mappings.
> -
> -What:		/sys/kernel/dmabuf/buffers/<inode_number>/attachments/<attachment_uid>/device
> -Date:		May 2021
> -KernelVersion:	v5.13
> -Contact:	Hridya Valsaraju <hridya@google.com>
> -Description:	This file is read-only and is a symlink to the attached device's
> -		sysfs entry.
> -
> -What:		/sys/kernel/dmabuf/buffers/<inode_number>/attachments/<attachment_uid>/map_counter
> -Date:		May 2021
> -KernelVersion:	v5.13
> -Contact:	Hridya Valsaraju <hridya@google.com>
> -Description:	This file is read-only and contains a map_counter indicating the
> -		number of distinct device mappings of the attachment.
> diff --git a/drivers/dma-buf/dma-buf-sysfs-stats.c b/drivers/dma-buf/dma-buf-sysfs-stats.c
> index a2638e84199c..053baadcada9 100644
> --- a/drivers/dma-buf/dma-buf-sysfs-stats.c
> +++ b/drivers/dma-buf/dma-buf-sysfs-stats.c
> @@ -40,14 +40,11 @@
>    *
>    * * ``/sys/kernel/dmabuf/buffers/<inode_number>/exporter_name``
>    * * ``/sys/kernel/dmabuf/buffers/<inode_number>/size``
> - * * ``/sys/kernel/dmabuf/buffers/<inode_number>/attachments/<attach_uid>/device``
> - * * ``/sys/kernel/dmabuf/buffers/<inode_number>/attachments/<attach_uid>/map_counter``
>    *
> - * The information in the interface can also be used to derive per-exporter and
> - * per-device usage statistics. The data from the interface can be gathered
> - * on error conditions or other important events to provide a snapshot of
> - * DMA-BUF usage. It can also be collected periodically by telemetry to monitor
> - * various metrics.
> + * The information in the interface can also be used to derive per-exporter
> + * statistics. The data from the interface can be gathered on error conditions
> + * or other important events to provide a snapshot of DMA-BUF usage.
> + * It can also be collected periodically by telemetry to monitor various metrics.
>    *
>    * Detailed documentation about the interface is present in
>    * Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers.
> @@ -121,120 +118,6 @@ static struct kobj_type dma_buf_ktype = {
>   	.default_groups = dma_buf_stats_default_groups,
>   };
>   
> -#define to_dma_buf_attach_entry_from_kobj(x) container_of(x, struct dma_buf_attach_sysfs_entry, kobj)
> -
> -struct dma_buf_attach_stats_attribute {
> -	struct attribute attr;
> -	ssize_t (*show)(struct dma_buf_attach_sysfs_entry *sysfs_entry,
> -			struct dma_buf_attach_stats_attribute *attr, char *buf);
> -};
> -#define to_dma_buf_attach_stats_attr(x) container_of(x, struct dma_buf_attach_stats_attribute, attr)
> -
> -static ssize_t dma_buf_attach_stats_attribute_show(struct kobject *kobj,
> -						   struct attribute *attr,
> -						   char *buf)
> -{
> -	struct dma_buf_attach_stats_attribute *attribute;
> -	struct dma_buf_attach_sysfs_entry *sysfs_entry;
> -
> -	attribute = to_dma_buf_attach_stats_attr(attr);
> -	sysfs_entry = to_dma_buf_attach_entry_from_kobj(kobj);
> -
> -	if (!attribute->show)
> -		return -EIO;
> -
> -	return attribute->show(sysfs_entry, attribute, buf);
> -}
> -
> -static const struct sysfs_ops dma_buf_attach_stats_sysfs_ops = {
> -	.show = dma_buf_attach_stats_attribute_show,
> -};
> -
> -static ssize_t map_counter_show(struct dma_buf_attach_sysfs_entry *sysfs_entry,
> -				struct dma_buf_attach_stats_attribute *attr,
> -				char *buf)
> -{
> -	return sysfs_emit(buf, "%u\n", sysfs_entry->map_counter);
> -}
> -
> -static struct dma_buf_attach_stats_attribute map_counter_attribute =
> -	__ATTR_RO(map_counter);
> -
> -static struct attribute *dma_buf_attach_stats_default_attrs[] = {
> -	&map_counter_attribute.attr,
> -	NULL,
> -};
> -ATTRIBUTE_GROUPS(dma_buf_attach_stats_default);
> -
> -static void dma_buf_attach_sysfs_release(struct kobject *kobj)
> -{
> -	struct dma_buf_attach_sysfs_entry *sysfs_entry;
> -
> -	sysfs_entry = to_dma_buf_attach_entry_from_kobj(kobj);
> -	kfree(sysfs_entry);
> -}
> -
> -static struct kobj_type dma_buf_attach_ktype = {
> -	.sysfs_ops = &dma_buf_attach_stats_sysfs_ops,
> -	.release = dma_buf_attach_sysfs_release,
> -	.default_groups = dma_buf_attach_stats_default_groups,
> -};
> -
> -void dma_buf_attach_stats_teardown(struct dma_buf_attachment *attach)
> -{
> -	struct dma_buf_attach_sysfs_entry *sysfs_entry;
> -
> -	sysfs_entry = attach->sysfs_entry;
> -	if (!sysfs_entry)
> -		return;
> -
> -	sysfs_delete_link(&sysfs_entry->kobj, &attach->dev->kobj, "device");
> -
> -	kobject_del(&sysfs_entry->kobj);
> -	kobject_put(&sysfs_entry->kobj);
> -}
> -
> -int dma_buf_attach_stats_setup(struct dma_buf_attachment *attach,
> -			       unsigned int uid)
> -{
> -	struct dma_buf_attach_sysfs_entry *sysfs_entry;
> -	int ret;
> -	struct dma_buf *dmabuf;
> -
> -	if (!attach)
> -		return -EINVAL;
> -
> -	dmabuf = attach->dmabuf;
> -
> -	sysfs_entry = kzalloc(sizeof(struct dma_buf_attach_sysfs_entry),
> -			      GFP_KERNEL);
> -	if (!sysfs_entry)
> -		return -ENOMEM;
> -
> -	sysfs_entry->kobj.kset = dmabuf->sysfs_entry->attach_stats_kset;
> -
> -	attach->sysfs_entry = sysfs_entry;
> -
> -	ret = kobject_init_and_add(&sysfs_entry->kobj, &dma_buf_attach_ktype,
> -				   NULL, "%u", uid);
> -	if (ret)
> -		goto kobj_err;
> -
> -	ret = sysfs_create_link(&sysfs_entry->kobj, &attach->dev->kobj,
> -				"device");
> -	if (ret)
> -		goto link_err;
> -
> -	return 0;
> -
> -link_err:
> -	kobject_del(&sysfs_entry->kobj);
> -kobj_err:
> -	kobject_put(&sysfs_entry->kobj);
> -	attach->sysfs_entry = NULL;
> -
> -	return ret;
> -}
>   void dma_buf_stats_teardown(struct dma_buf *dmabuf)
>   {
>   	struct dma_buf_sysfs_entry *sysfs_entry;
> @@ -243,7 +126,6 @@ void dma_buf_stats_teardown(struct dma_buf *dmabuf)
>   	if (!sysfs_entry)
>   		return;
>   
> -	kset_unregister(sysfs_entry->attach_stats_kset);
>   	kobject_del(&sysfs_entry->kobj);
>   	kobject_put(&sysfs_entry->kobj);
>   }
> @@ -290,7 +172,6 @@ int dma_buf_stats_setup(struct dma_buf *dmabuf)
>   {
>   	struct dma_buf_sysfs_entry *sysfs_entry;
>   	int ret;
> -	struct kset *attach_stats_kset;
>   
>   	if (!dmabuf || !dmabuf->file)
>   		return -EINVAL;
> @@ -315,21 +196,8 @@ int dma_buf_stats_setup(struct dma_buf *dmabuf)
>   	if (ret)
>   		goto err_sysfs_dmabuf;
>   
> -	/* create the directory for attachment stats */
> -	attach_stats_kset = kset_create_and_add("attachments",
> -						&dmabuf_sysfs_no_uevent_ops,
> -						&sysfs_entry->kobj);
> -	if (!attach_stats_kset) {
> -		ret = -ENOMEM;
> -		goto err_sysfs_attach;
> -	}
> -
> -	sysfs_entry->attach_stats_kset = attach_stats_kset;
> -
>   	return 0;
>   
> -err_sysfs_attach:
> -	kobject_del(&sysfs_entry->kobj);
>   err_sysfs_dmabuf:
>   	kobject_put(&sysfs_entry->kobj);
>   	dmabuf->sysfs_entry = NULL;
> diff --git a/drivers/dma-buf/dma-buf-sysfs-stats.h b/drivers/dma-buf/dma-buf-sysfs-stats.h
> index 5f4703249117..a49c6e2650cc 100644
> --- a/drivers/dma-buf/dma-buf-sysfs-stats.h
> +++ b/drivers/dma-buf/dma-buf-sysfs-stats.h
> @@ -14,23 +14,8 @@ int dma_buf_init_sysfs_statistics(void);
>   void dma_buf_uninit_sysfs_statistics(void);
>   
>   int dma_buf_stats_setup(struct dma_buf *dmabuf);
> -int dma_buf_attach_stats_setup(struct dma_buf_attachment *attach,
> -			       unsigned int uid);
> -static inline void dma_buf_update_attachment_map_count(struct dma_buf_attachment *attach,
> -						       int delta)
> -{
> -	struct dma_buf_attach_sysfs_entry *entry = attach->sysfs_entry;
>   
> -	entry->map_counter += delta;
> -}
>   void dma_buf_stats_teardown(struct dma_buf *dmabuf);
> -void dma_buf_attach_stats_teardown(struct dma_buf_attachment *attach);
> -static inline unsigned int dma_buf_update_attach_uid(struct dma_buf *dmabuf)
> -{
> -	struct dma_buf_sysfs_entry *entry = dmabuf->sysfs_entry;
> -
> -	return entry->attachment_uid++;
> -}
>   #else
>   
>   static inline int dma_buf_init_sysfs_statistics(void)
> @@ -44,19 +29,7 @@ static inline int dma_buf_stats_setup(struct dma_buf *dmabuf)
>   {
>   	return 0;
>   }
> -static inline int dma_buf_attach_stats_setup(struct dma_buf_attachment *attach,
> -					     unsigned int uid)
> -{
> -	return 0;
> -}
>   
>   static inline void dma_buf_stats_teardown(struct dma_buf *dmabuf) {}
> -static inline void dma_buf_attach_stats_teardown(struct dma_buf_attachment *attach) {}
> -static inline void dma_buf_update_attachment_map_count(struct dma_buf_attachment *attach,
> -						       int delta) {}
> -static inline unsigned int dma_buf_update_attach_uid(struct dma_buf *dmabuf)
> -{
> -	return 0;
> -}
>   #endif
>   #endif // _DMA_BUF_SYSFS_STATS_H
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 510b42771974..b1a6db71c656 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -738,7 +738,6 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
>   {
>   	struct dma_buf_attachment *attach;
>   	int ret;
> -	unsigned int attach_uid;
>   
>   	if (WARN_ON(!dmabuf || !dev))
>   		return ERR_PTR(-EINVAL);
> @@ -764,13 +763,8 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
>   	}
>   	dma_resv_lock(dmabuf->resv, NULL);
>   	list_add(&attach->node, &dmabuf->attachments);
> -	attach_uid = dma_buf_update_attach_uid(dmabuf);
>   	dma_resv_unlock(dmabuf->resv);
>   
> -	ret = dma_buf_attach_stats_setup(attach, attach_uid);
> -	if (ret)
> -		goto err_sysfs;
> -
>   	/* When either the importer or the exporter can't handle dynamic
>   	 * mappings we cache the mapping here to avoid issues with the
>   	 * reservation object lock.
> @@ -797,7 +791,6 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
>   			dma_resv_unlock(attach->dmabuf->resv);
>   		attach->sgt = sgt;
>   		attach->dir = DMA_BIDIRECTIONAL;
> -		dma_buf_update_attachment_map_count(attach, 1 /* delta */);
>   	}
>   
>   	return attach;
> @@ -814,7 +807,6 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
>   	if (dma_buf_is_dynamic(attach->dmabuf))
>   		dma_resv_unlock(attach->dmabuf->resv);
>   
> -err_sysfs:
>   	dma_buf_detach(dmabuf, attach);
>   	return ERR_PTR(ret);
>   }
> @@ -864,7 +856,6 @@ void dma_buf_detach(struct dma_buf *dmabuf, struct dma_buf_attachment *attach)
>   			dma_resv_lock(attach->dmabuf->resv, NULL);
>   
>   		__unmap_dma_buf(attach, attach->sgt, attach->dir);
> -		dma_buf_update_attachment_map_count(attach, -1 /* delta */);
>   
>   		if (dma_buf_is_dynamic(attach->dmabuf)) {
>   			dmabuf->ops->unpin(attach);
> @@ -878,7 +869,6 @@ void dma_buf_detach(struct dma_buf *dmabuf, struct dma_buf_attachment *attach)
>   	if (dmabuf->ops->detach)
>   		dmabuf->ops->detach(dmabuf, attach);
>   
> -	dma_buf_attach_stats_teardown(attach);
>   	kfree(attach);
>   }
>   EXPORT_SYMBOL_GPL(dma_buf_detach);
> @@ -1020,10 +1010,6 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
>   		}
>   	}
>   #endif /* CONFIG_DMA_API_DEBUG */
> -
> -	if (!IS_ERR(sg_table))
> -		dma_buf_update_attachment_map_count(attach, 1 /* delta */);
> -
>   	return sg_table;
>   }
>   EXPORT_SYMBOL_GPL(dma_buf_map_attachment);
> @@ -1061,8 +1047,6 @@ void dma_buf_unmap_attachment(struct dma_buf_attachment *attach,
>   	if (dma_buf_is_dynamic(attach->dmabuf) &&
>   	    !IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY))
>   		dma_buf_unpin(attach);
> -
> -	dma_buf_update_attachment_map_count(attach, -1 /* delta */);
>   }
>   EXPORT_SYMBOL_GPL(dma_buf_unmap_attachment);
>   
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index 2b814fde0d11..678b2006be78 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -444,15 +444,6 @@ struct dma_buf {
>   	struct dma_buf_sysfs_entry {
>   		struct kobject kobj;
>   		struct dma_buf *dmabuf;
> -
> -		/**
> -		 * @sysfs_entry.attachment_uid:
> -		 *
> -		 * This is protected by the dma_resv_lock() on @resv and is
> -		 * incremented on each attach.
> -		 */
> -		unsigned int attachment_uid;
> -		struct kset *attach_stats_kset;
>   	} *sysfs_entry;
>   #endif
>   };
> @@ -504,7 +495,6 @@ struct dma_buf_attach_ops {
>    * @importer_ops: importer operations for this attachment, if provided
>    * dma_buf_map/unmap_attachment() must be called with the dma_resv lock held.
>    * @importer_priv: importer specific attachment data.
> - * @sysfs_entry: For exposing information about this attachment in sysfs.
>    *
>    * This structure holds the attachment information between the dma_buf buffer
>    * and its user device(s). The list contains one attachment struct per device
> @@ -525,13 +515,6 @@ struct dma_buf_attachment {
>   	const struct dma_buf_attach_ops *importer_ops;
>   	void *importer_priv;
>   	void *priv;
> -#ifdef CONFIG_DMABUF_SYSFS_STATS
> -	/* for sysfs stats */
> -	struct dma_buf_attach_sysfs_entry {
> -		struct kobject kobj;
> -		unsigned int map_counter;
> -	} *sysfs_entry;
> -#endif
>   };
>   
>   /**

