Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 770C48306CB
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 14:16:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1886610E698;
	Wed, 17 Jan 2024 13:15:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2066.outbound.protection.outlook.com [40.107.220.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7027910E698
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jan 2024 13:15:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g3llIOncI+Ajaqw1xKPXXJYWEWj5Fep3gZnvkWsCUAeANlCzH57jurLFYcJFunWgw6Njs7Bh1lbIaJLCYKGUmdP31zuUrAmsUehRhClmGEHV4SAW6L0ATKRmLzJ0tdbX1cgQfLY9NbIFbC/x8R+ccGhChPhZvE3PbH5h2FqSYKbtUaIKYvth2VtWA7aEqGE5zDL/6RA1SyA9PrmiU0SN5SMoe4PPXPbsBqEyctcp6zBIzAXHNU51K1phEPV3eN1culBPKPmMRTJjDAzSutNR2M3YRRsKFzWvWMh8b8tpMWHun63xJWJd4P9vShrEw4CPrTlJVQFOeRtpzY/dGlMGzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s/n5V+lPRLv8xF78nTWPhxoWSqP5nyta1EQMeOPms9I=;
 b=QMa1AtIRAnp2aPX9p93O4QwVnzeW1tcR9PsGm03rotXrXQA+xVlygnYb2a4ArF5+BIWTQVAKDlOEfu5jG1A6yU4T42pWpxUrqJsDPPZY7yMu3NGfJTCpn9LazwnSC8o+gCFRN0xp0FKCRI74fJFR9pPXMhpIrfdcyEkMpg861c9ufX2X5MzBPXrtY51YNTBUlooph9FmBznK0Av2AHrMI/yPpVS73md3VfAvt0SBat3lnw0fQnhCzwFROfj0OQdmYsJ/2Q+1miIGS4/UNLbOdhN7/TMYsY6YdwpklBCZK9uakp+C732HaGnwvAnfwludi/A+ikB4DycmuY8Dnfjl7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s/n5V+lPRLv8xF78nTWPhxoWSqP5nyta1EQMeOPms9I=;
 b=bwCetDLGei2Lolb7gau47W60gZI3/Lg58NR+och8m6/y08KfZojkC/ycj1a8j/wvH8THXGwdg8N88Er/0ujWo0ZxLvMz2LDsf5AR8adMIVXNYPIVz/MRlE2zyrvVVtbzELZjGmQJF2iKfmRPld8+mLl0hcTNx11l/Uq3MvCs8dk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW4PR12MB6731.namprd12.prod.outlook.com (2603:10b6:303:1eb::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.26; Wed, 17 Jan
 2024 13:15:29 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7159.020; Wed, 17 Jan 2024
 13:15:28 +0000
Message-ID: <67d5d281-41af-4330-9808-3db56932e183@amd.com>
Date: Wed, 17 Jan 2024 14:15:22 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] usb: gadget: functionfs: Add DMABUF import
 interface
Content-Language: en-US
To: Paul Cercueil <paul@crapouillou.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>
References: <20240117122646.41616-1-paul@crapouillou.net>
 <20240117122646.41616-4-paul@crapouillou.net>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240117122646.41616-4-paul@crapouillou.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0266.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::11) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW4PR12MB6731:EE_
X-MS-Office365-Filtering-Correlation-Id: dbff3f58-cc57-423b-6f5d-08dc175e6032
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hac2Smfby50/q3uR3BjdSGG3XSn2mnmfMb5zdQUV60uJf3DfkMI+HtVfI8NvzfJb6sEOT1ewxRmyt2FWzqW/SRr+SR4TD525mQMQGFJ88gVhq782+oIVwWhgsJX9hauNlcEX2x9dvt2NpyUeUGUX6CeY3LSj5wD39jx+F+tqNr7GTTyAVnkeY0XjNOZK2qXXe+tW2bUZYAS5sq/ADw2OXGDeuZuTh5NZFbEtwVgiDlVF3OES9aoM/lj69GG7b7e/GKjgPFL0l2Mdk+Z8e20xqWSKU3zlle4J9eBVu3CRwFTD8Wn60G95hgcXOyqLTZ4PySck/nsT5hWpQ+pgYmSdejUpQNgylGc+lOddqkIKUAGa8ylin5rlAEe1bkrb3LvH2sEFHxySBT9+bsHdfh5h+Pc7GznQMj991SamxIkVc1vX/4+MpWhQwLX7TeL182TU4w8kt+qQAe2gdv7i1sOffQOtTBDeTWae5vLcrCRA84XB92+DOU5hzZy5RMU33dK8DJpA04EwLRJwInNUx+QYm7O3TW/kWcHzOqzvT5SEbb62tk/VmoQZMB6nj7IpE8Jndowl1vfGX90Iu7lDyt+9IA79xNXINKqpNX1lowxQ1TtUAO45U5mnnHG2m5lAYdrnhbHKFydLjcIMU+eU1UUZ0A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(396003)(346002)(39860400002)(136003)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(6506007)(26005)(2616005)(6666004)(6512007)(30864003)(5660300002)(7416002)(83380400001)(66476007)(41300700001)(110136005)(6486002)(8936002)(66556008)(4326008)(66946007)(316002)(478600001)(54906003)(8676002)(86362001)(36756003)(31696002)(2906002)(38100700002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VmJnTVZteW1rdkZmTzZlSThuWlovY0xueU4wY0pBdXBkZjA4M2ZmMjZQVzBD?=
 =?utf-8?B?VkxKbEFhSzUwc1I4Q05JSmVtdXUxRnNlMTNoVGZNN0lhZ091d1NOaVE5UXRQ?=
 =?utf-8?B?dGJIa1MvSlFlSEVhOHRvdVE3NFVtWkM0eDBvN3k5eEsycG1ZZWJmUzhQckMx?=
 =?utf-8?B?N2I5dGVFQ1JxdktJRy9QcS9DN2h3Mm4zMENIRkNNNyttSTZVUDhlcEZuSS9F?=
 =?utf-8?B?cHptcS9KeW83T1hHOU15OWIzRlFJOEZETktTZkZEN25sMHcxT0p1bTFwcXFN?=
 =?utf-8?B?cHVzSElRV3Q5Um9qVk9DelNPai9jQ3VIYnRJeXhUek1WQ0ZDa2EycTVhcThE?=
 =?utf-8?B?WGU5UUlPQUVOS0tJZXBEZ1lKRGp2UjFhQVFqcVZXd2VUYUdBUzkyekpqWXFq?=
 =?utf-8?B?VE9IQzloRUdYclRzcUwwLzlJQVpFN09haEJvSktteEtEZ2JDTGR3YWh4c01L?=
 =?utf-8?B?Q2taeExYRUVmVHpJa1c1QzlhbDJuU1F1aDYrYnlhbko3SUFCb28ycUt6REhD?=
 =?utf-8?B?cjQ3d0ZRb2VJdnd6VTFlTXVDOFcvYjRPYUh4REFCNFU0YUcyZEZQTytHRm9t?=
 =?utf-8?B?NjZ5Qy84dDN0S0NkSnpmbnZCa3p0dkhtZEtlSEh5cnV0UGpVellSY010Wko4?=
 =?utf-8?B?OHJzblVEbmtCUmtQTkJ2UGwxMThOUzlGVmZqYTUwUFRJaFBwNmlQOWtrSTVr?=
 =?utf-8?B?ZWpTUFhqa3hOWk5tbWdMRHV3RGhnanF4ZkFTTVI3T3UyK2ZhcVlqaXNITExt?=
 =?utf-8?B?S2crdmpQb0JYeElyTlVNMjRnMzI1RmtVUzArZWhFWElLcXA4ZUFMQXF2dnB2?=
 =?utf-8?B?cHFKK2M2ZHlMY1ZPeGlSRXdlRGRwR092RFl5TG1YNHB6bzUyeUltMGhqazAz?=
 =?utf-8?B?RWl1ZlFCS2tscW9LclJaRHNxbzIxQVRPMG5hd29oTThBdk1HNnZHRmdTU1hF?=
 =?utf-8?B?RUw5a0VKR3pWTGtNcHVrWlZxWDFQbExnMjl6M0hKZzh4STMvSUdsWG1Fcm5S?=
 =?utf-8?B?enliSjdVa0tQUHBIMjhkT3lqMUcwOXFvbWMvM3ZMbG93QmFKb1llbUdFSUJz?=
 =?utf-8?B?eHZZdU12RTlqdVlqQW53ZDBEOE5rVTFROTlmcDdDWVd4b1U0VEN0R1BCMlJJ?=
 =?utf-8?B?Q2t0N0ltNlpMa1dHTnJoY0Mrd1hrK2MvbEkzL3R2d3laalFwMy9lazkvaTNW?=
 =?utf-8?B?UmJJVUxsV1l3SDJncURKV3FUa3BhWWNsZThFU2xyZHRUNzZndy90Tjl3QmEr?=
 =?utf-8?B?T3BKWlNDd1VtQVFxY1ZidzlzRysyVVlWeElQMWN4aGR2UlZlL0Q5TGZpQjV0?=
 =?utf-8?B?UndYZDlvNmZOdDJ1Tk9IM2twT0hzQnhZMktpWHZIdHJKanNxL1FOcGFOdHJF?=
 =?utf-8?B?bVk2aE1lbVlGQmQ3NGg3Y2M5VytwSXNWNGJDZ0VWQW1MQXkwMmI3a0pvUGF5?=
 =?utf-8?B?RkhHK21FczluYXVwNGo5Wk9rVzd1akRVZ1pTVnZhVG5pRnhNVWZXNmZ1SlM2?=
 =?utf-8?B?UEZ0VjZYUVFTbHN4dDdxVlZzd3loRFFSV09nRFM0OWJLaWp4RDRJOUo0N2M2?=
 =?utf-8?B?a3pDVVZQajNjaFFnMllNRUhRUmwzQVZsVi9xT0R4cVFtSnI2bTJaR0tSb2dS?=
 =?utf-8?B?aEdmblozZHlNN1pndnlzMHpwbnZmcHVIeCtzL09DaUhwWkVKMmk2ZksyYTVi?=
 =?utf-8?B?OXBwTzdVajFLRmxOMStBMTQwZVVGMjBFMHFlL1F4N2lTZkF2RnNqQnZMcHIv?=
 =?utf-8?B?ZFQzR3lUS2d2UFQxbmdJR3lTb2FCaXQ2cUpxa1BsZVBPaElSUzliOFYxaEdZ?=
 =?utf-8?B?SXpXTzdLbjB4a0lobnV1anUrMkZDTjZPL21qYXl0MVVKRHU4T1puNlN0NXIy?=
 =?utf-8?B?Njk5OHA1WVVyQjRnL1J0M0U2bUhMRmxJZVI0bEFydFFUK2VvckpZa0VjcVNm?=
 =?utf-8?B?NEJUMDY1YlcrMTJDK21CZERaZFJiNjBpTlVHSkFDWVEvdXppdUw4VmxJYkdu?=
 =?utf-8?B?K2dmVlo2ZlFaOCszWWdKSzVDeFVPeVBHU1c5ZW1FUjV4QXhSemhvWmlyTFhv?=
 =?utf-8?B?THlnKzJFc1FWTG9wbDdRWkR1NzhRRCtEdXF5YUxxUFdiOHR4ZVdXK3dubUFJ?=
 =?utf-8?Q?TqaS92KEK/pn8fZz/Qr5Nt9ue?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbff3f58-cc57-423b-6f5d-08dc175e6032
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2024 13:15:28.9506 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pVuM4OdxaYNpilwir5FP8umcjnECUOsHL113n067lnfsQw1z/HxsXYqMRFgoYMD5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6731
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
Cc: Michael Hennerich <Michael.Hennerich@analog.com>, linux-doc@vger.kernel.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org,
 =?UTF-8?Q?Nuno_S=C3=A1?= <noname.nuno@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 17.01.24 um 13:26 schrieb Paul Cercueil:
> This patch introduces three new ioctls. They all should be called on a
> data endpoint (ie. not ep0). They are:
>
> - FUNCTIONFS_DMABUF_ATTACH, which takes the file descriptor of a DMABUF
>    object to attach to the endpoint.
>
> - FUNCTIONFS_DMABUF_DETACH, which takes the file descriptor of the
>    DMABUF to detach from the endpoint. Note that closing the endpoint's
>    file descriptor will automatically detach all attached DMABUFs.
>
> - FUNCTIONFS_DMABUF_TRANSFER, which requests a data transfer from / to
>    the given DMABUF. Its argument is a structure that packs the DMABUF's
>    file descriptor, the size in bytes to transfer (which should generally
>    be set to the size of the DMABUF), and a 'flags' field which is unused
>    for now.
>    Before this ioctl can be used, the related DMABUF must be attached
>    with FUNCTIONFS_DMABUF_ATTACH.
>
> These three ioctls enable the FunctionFS code to transfer data between
> the USB stack and a DMABUF object, which can be provided by a driver
> from a completely different subsystem, in a zero-copy fashion.
>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

I only looked at it from the DMA-buf maintainer point of view and 
especially the fence signaling (which people often get wrong) looks 
correct to me.

Can't judge if the USB side will work or not, so I can only give my 
Acked-by for this as well.

Regards,
Christian.

>
> ---
> v2:
> - Make ffs_dma_resv_lock() static
> - Add MODULE_IMPORT_NS(DMA_BUF);
> - The attach/detach functions are now performed without locking the
>    eps_lock spinlock. The transfer function starts with the spinlock
>    unlocked, then locks it before allocating and queueing the USB
>    transfer.
>
> v3:
> - Inline to_ffs_dma_fence() which was called only once.
> - Simplify ffs_dma_resv_lock()
> - Add comment explaining why we unref twice in ffs_dmabuf_detach()
> - Document uapi struct usb_ffs_dmabuf_transfer_req and IOCTLs
>
> v4:
> - Protect the dmabufs list with a mutex
> - Use incremental sequence number for the dma_fences
> - Unref attachments and DMABUFs in workers
> - Remove dead code in ffs_dma_resv_lock()
> - Fix non-block actually blocking
> - Use dma_fence_begin/end_signalling()
> - Add comment about cache-management and dma_buf_unmap_attachment()
> - Make sure dma_buf_map_attachment() is called with the dma-resv locked
> ---
>   drivers/usb/gadget/function/f_fs.c  | 454 ++++++++++++++++++++++++++++
>   include/uapi/linux/usb/functionfs.h |  41 +++
>   2 files changed, 495 insertions(+)
>
> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> index ed2a6d5fcef7..64dfd084c857 100644
> --- a/drivers/usb/gadget/function/f_fs.c
> +++ b/drivers/usb/gadget/function/f_fs.c
> @@ -15,6 +15,9 @@
>   /* #define VERBOSE_DEBUG */
>   
>   #include <linux/blkdev.h>
> +#include <linux/dma-buf.h>
> +#include <linux/dma-fence.h>
> +#include <linux/dma-resv.h>
>   #include <linux/pagemap.h>
>   #include <linux/export.h>
>   #include <linux/fs_parser.h>
> @@ -43,6 +46,8 @@
>   
>   #define FUNCTIONFS_MAGIC	0xa647361 /* Chosen by a honest dice roll ;) */
>   
> +MODULE_IMPORT_NS(DMA_BUF);
> +
>   /* Reference counter handling */
>   static void ffs_data_get(struct ffs_data *ffs);
>   static void ffs_data_put(struct ffs_data *ffs);
> @@ -124,6 +129,23 @@ struct ffs_ep {
>   	u8				num;
>   };
>   
> +struct ffs_dmabuf_priv {
> +	struct list_head entry;
> +	struct kref ref;
> +	struct ffs_data *ffs;
> +	struct dma_buf_attachment *attach;
> +	spinlock_t lock;
> +	u64 context;
> +};
> +
> +struct ffs_dma_fence {
> +	struct dma_fence base;
> +	struct ffs_dmabuf_priv *priv;
> +	struct sg_table *sgt;
> +	enum dma_data_direction dir;
> +	struct work_struct work;
> +};
> +
>   struct ffs_epfile {
>   	/* Protects ep->ep and ep->req. */
>   	struct mutex			mutex;
> @@ -197,6 +219,11 @@ struct ffs_epfile {
>   	unsigned char			isoc;	/* P: ffs->eps_lock */
>   
>   	unsigned char			_pad;
> +
> +	/* Protects dmabufs */
> +	struct mutex			dmabufs_mutex;
> +	struct list_head		dmabufs; /* P: dmabufs_mutex */
> +	atomic_t			seqno;
>   };
>   
>   struct ffs_buffer {
> @@ -1271,10 +1298,47 @@ static ssize_t ffs_epfile_read_iter(struct kiocb *kiocb, struct iov_iter *to)
>   	return res;
>   }
>   
> +static void ffs_dmabuf_release(struct kref *ref)
> +{
> +	struct ffs_dmabuf_priv *priv = container_of(ref, struct ffs_dmabuf_priv, ref);
> +	struct dma_buf_attachment *attach = priv->attach;
> +	struct dma_buf *dmabuf = attach->dmabuf;
> +
> +	pr_debug("FFS DMABUF release\n");
> +	dma_buf_detach(attach->dmabuf, attach);
> +	dma_buf_put(dmabuf);
> +	kfree(priv);
> +}
> +
> +static void ffs_dmabuf_get(struct dma_buf_attachment *attach)
> +{
> +	struct ffs_dmabuf_priv *priv = attach->importer_priv;
> +
> +	kref_get(&priv->ref);
> +}
> +
> +static void ffs_dmabuf_put(struct dma_buf_attachment *attach)
> +{
> +	struct ffs_dmabuf_priv *priv = attach->importer_priv;
> +
> +	kref_put(&priv->ref, ffs_dmabuf_release);
> +}
> +
>   static int
>   ffs_epfile_release(struct inode *inode, struct file *file)
>   {
>   	struct ffs_epfile *epfile = inode->i_private;
> +	struct ffs_dmabuf_priv *priv, *tmp;
> +
> +	mutex_lock(&epfile->dmabufs_mutex);
> +
> +	/* Close all attached DMABUFs */
> +	list_for_each_entry_safe(priv, tmp, &epfile->dmabufs, entry) {
> +		list_del(&priv->entry);
> +		ffs_dmabuf_put(priv->attach);
> +	}
> +
> +	mutex_unlock(&epfile->dmabufs_mutex);
>   
>   	__ffs_epfile_read_buffer_free(epfile);
>   	ffs_data_closed(epfile->ffs);
> @@ -1282,6 +1346,356 @@ ffs_epfile_release(struct inode *inode, struct file *file)
>   	return 0;
>   }
>   
> +static void ffs_dmabuf_unmap_work(struct work_struct *work)
> +{
> +	struct ffs_dma_fence *dma_fence =
> +		container_of(work, struct ffs_dma_fence, work);
> +	struct ffs_dmabuf_priv *priv = dma_fence->priv;
> +	struct dma_buf_attachment *attach = priv->attach;
> +	struct dma_fence *fence = &dma_fence->base;
> +
> +	dma_resv_lock(attach->dmabuf->resv, NULL);
> +	dma_buf_unmap_attachment(attach, dma_fence->sgt, dma_fence->dir);
> +	dma_resv_unlock(attach->dmabuf->resv);
> +
> +	ffs_dmabuf_put(attach);
> +	dma_fence_put(fence);
> +}
> +
> +static void ffs_dmabuf_signal_done(struct ffs_dma_fence *dma_fence, int ret)
> +{
> +	struct ffs_dmabuf_priv *priv = dma_fence->priv;
> +	struct dma_fence *fence = &dma_fence->base;
> +	bool cookie = dma_fence_begin_signalling();
> +
> +	/*
> +	 * The dma_buf_unmap_attachment() also perform cache-management.
> +	 * In a perfect world this would be done before the DMA fence is
> +	 * signaled; however this is not yet possible as
> +	 * dma_buf_unmap_attachment() is not safe to use in the DMA fence's
> +	 * critical section.
> +	 */
> +
> +	dma_fence_get(fence);
> +	fence->error = ret;
> +	dma_fence_signal(fence);
> +	dma_fence_end_signalling(cookie);
> +
> +	/*
> +	 * The fence will be unref'd in ffs_dmabuf_unmap_work.
> +	 * It can't be done here, as the unref functions might try to lock
> +	 * the resv object, which would deadlock.
> +	 */
> +	INIT_WORK(&dma_fence->work, ffs_dmabuf_unmap_work);
> +	queue_work(priv->ffs->io_completion_wq, &dma_fence->work);
> +}
> +
> +static void ffs_epfile_dmabuf_io_complete(struct usb_ep *ep,
> +					  struct usb_request *req)
> +{
> +	pr_debug("FFS: DMABUF transfer complete, status=%d\n", req->status);
> +	ffs_dmabuf_signal_done(req->context, req->status);
> +	usb_ep_free_request(ep, req);
> +}
> +
> +static const char *ffs_dmabuf_get_driver_name(struct dma_fence *fence)
> +{
> +	return "functionfs";
> +}
> +
> +static const char *ffs_dmabuf_get_timeline_name(struct dma_fence *fence)
> +{
> +	return "";
> +}
> +
> +static void ffs_dmabuf_fence_release(struct dma_fence *fence)
> +{
> +	struct ffs_dma_fence *dma_fence =
> +		container_of(fence, struct ffs_dma_fence, base);
> +
> +	kfree(dma_fence);
> +}
> +
> +static const struct dma_fence_ops ffs_dmabuf_fence_ops = {
> +	.get_driver_name	= ffs_dmabuf_get_driver_name,
> +	.get_timeline_name	= ffs_dmabuf_get_timeline_name,
> +	.release		= ffs_dmabuf_fence_release,
> +};
> +
> +static int ffs_dma_resv_lock(struct dma_buf *dmabuf, bool nonblock)
> +{
> +	if (!nonblock)
> +		return dma_resv_lock_interruptible(dmabuf->resv, NULL);
> +
> +	if (!dma_resv_trylock(dmabuf->resv))
> +		return -EBUSY;
> +
> +	return 0;
> +}
> +
> +static struct dma_buf_attachment *
> +ffs_dmabuf_find_attachment(struct ffs_epfile *epfile, struct dma_buf *dmabuf)
> +{
> +	struct device *dev = epfile->ffs->gadget->dev.parent;
> +	struct dma_buf_attachment *attach = NULL;
> +	struct ffs_dmabuf_priv *priv;
> +
> +	mutex_lock(&epfile->dmabufs_mutex);
> +
> +	list_for_each_entry(priv, &epfile->dmabufs, entry) {
> +		if (priv->attach->dev == dev
> +		    && priv->attach->dmabuf == dmabuf) {
> +			attach = priv->attach;
> +			break;
> +		}
> +	}
> +
> +	if (attach)
> +		ffs_dmabuf_get(attach);
> +
> +	mutex_unlock(&epfile->dmabufs_mutex);
> +
> +	return attach ?: ERR_PTR(-EPERM);
> +}
> +
> +static int ffs_dmabuf_attach(struct file *file, int fd)
> +{
> +	struct ffs_epfile *epfile = file->private_data;
> +	struct usb_gadget *gadget = epfile->ffs->gadget;
> +	struct dma_buf_attachment *attach;
> +	struct ffs_dmabuf_priv *priv;
> +	struct dma_buf *dmabuf;
> +	int err;
> +
> +	if (!gadget || !gadget->sg_supported)
> +		return -EPERM;
> +
> +	dmabuf = dma_buf_get(fd);
> +	if (IS_ERR(dmabuf))
> +		return PTR_ERR(dmabuf);
> +
> +	attach = dma_buf_attach(dmabuf, gadget->dev.parent);
> +	if (IS_ERR(attach)) {
> +		err = PTR_ERR(attach);
> +		goto err_dmabuf_put;
> +	}
> +
> +	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
> +	if (!priv) {
> +		err = -ENOMEM;
> +		goto err_dmabuf_detach;
> +	}
> +
> +	attach->importer_priv = priv;
> +
> +	priv->ffs = epfile->ffs;
> +	priv->attach = attach;
> +	spin_lock_init(&priv->lock);
> +	kref_init(&priv->ref);
> +	priv->context = dma_fence_context_alloc(1);
> +
> +	mutex_lock(&epfile->dmabufs_mutex);
> +	list_add(&priv->entry, &epfile->dmabufs);
> +	mutex_unlock(&epfile->dmabufs_mutex);
> +
> +	return 0;
> +
> +err_dmabuf_detach:
> +	dma_buf_detach(dmabuf, attach);
> +err_dmabuf_put:
> +	dma_buf_put(dmabuf);
> +
> +	return err;
> +}
> +
> +static int ffs_dmabuf_detach(struct file *file, int fd)
> +{
> +	struct ffs_epfile *epfile = file->private_data;
> +	struct device *dev = epfile->ffs->gadget->dev.parent;
> +	struct ffs_dmabuf_priv *priv;
> +	struct dma_buf *dmabuf;
> +	int ret = -EPERM;
> +
> +	dmabuf = dma_buf_get(fd);
> +	if (IS_ERR(dmabuf))
> +		return PTR_ERR(dmabuf);
> +
> +	mutex_lock(&epfile->dmabufs_mutex);
> +
> +	list_for_each_entry(priv, &epfile->dmabufs, entry) {
> +		if (priv->attach->dev == dev
> +		    && priv->attach->dmabuf == dmabuf) {
> +			list_del(&priv->entry);
> +
> +			/* Unref the reference from ffs_dmabuf_attach() */
> +			ffs_dmabuf_put(priv->attach);
> +			ret = 0;
> +			break;
> +		}
> +	}
> +
> +	mutex_unlock(&epfile->dmabufs_mutex);
> +	dma_buf_put(dmabuf);
> +
> +	return ret;
> +}
> +
> +static int ffs_dmabuf_transfer(struct file *file,
> +			       const struct usb_ffs_dmabuf_transfer_req *req)
> +{
> +	bool dma_to_ram, nonblock = file->f_flags & O_NONBLOCK;
> +	struct ffs_epfile *epfile = file->private_data;
> +	struct dma_buf_attachment *attach;
> +	struct ffs_dmabuf_priv *priv;
> +	enum dma_data_direction dir;
> +	struct ffs_dma_fence *fence;
> +	struct usb_request *usb_req;
> +	struct sg_table *sg_table;
> +	struct dma_buf *dmabuf;
> +	struct ffs_ep *ep;
> +	bool cookie;
> +	u32 seqno;
> +	int ret;
> +
> +	if (req->flags & ~USB_FFS_DMABUF_TRANSFER_MASK)
> +		return -EINVAL;
> +
> +	dmabuf = dma_buf_get(req->fd);
> +	if (IS_ERR(dmabuf))
> +		return PTR_ERR(dmabuf);
> +
> +	if (req->length > dmabuf->size || req->length == 0) {
> +		ret = -EINVAL;
> +		goto err_dmabuf_put;
> +	}
> +
> +	attach = ffs_dmabuf_find_attachment(epfile, dmabuf);
> +	if (IS_ERR(attach)) {
> +		ret = PTR_ERR(attach);
> +		goto err_dmabuf_put;
> +	}
> +
> +	priv = attach->importer_priv;
> +
> +	if (epfile->in)
> +		dir = DMA_FROM_DEVICE;
> +	else
> +		dir = DMA_TO_DEVICE;
> +
> +	ep = ffs_epfile_wait_ep(file);
> +	if (IS_ERR(ep)) {
> +		ret = PTR_ERR(ep);
> +		goto err_attachment_put;
> +	}
> +
> +	ret = ffs_dma_resv_lock(dmabuf, nonblock);
> +	if (ret)
> +		goto err_attachment_put;
> +
> +	/* Make sure we don't have writers */
> +	if (!dma_resv_test_signaled(dmabuf->resv, DMA_RESV_USAGE_WRITE)) {
> +		pr_debug("FFS WRITE fence is not signaled\n");
> +		ret = -EBUSY;
> +		goto err_resv_unlock;
> +	}
> +
> +	dma_to_ram = dir == DMA_FROM_DEVICE;
> +
> +	/* If we're writing to the DMABUF, make sure we don't have readers */
> +	if (dma_to_ram &&
> +	    !dma_resv_test_signaled(dmabuf->resv, DMA_RESV_USAGE_READ)) {
> +		pr_debug("FFS READ fence is not signaled\n");
> +		ret = -EBUSY;
> +		goto err_resv_unlock;
> +	}
> +
> +	sg_table = dma_buf_map_attachment(attach, dir);
> +	if (IS_ERR(sg_table)) {
> +		ret = PTR_ERR(sg_table);
> +		goto err_resv_unlock;
> +	}
> +
> +	ret = dma_resv_reserve_fences(dmabuf->resv, 1);
> +	if (ret)
> +		goto err_unmap_attachment;
> +
> +	fence = kmalloc(sizeof(*fence), GFP_KERNEL);
> +	if (!fence) {
> +		ret = -ENOMEM;
> +		goto err_resv_unlock;
> +	}
> +
> +	fence->sgt = sg_table;
> +	fence->dir = dir;
> +	fence->priv = priv;
> +
> +	spin_lock_irq(&epfile->ffs->eps_lock);
> +
> +	/* In the meantime, endpoint got disabled or changed. */
> +	if (epfile->ep != ep) {
> +		ret = -ESHUTDOWN;
> +		goto err_fence_put;
> +	}
> +
> +	usb_req = usb_ep_alloc_request(ep->ep, GFP_ATOMIC);
> +	if (!usb_req) {
> +		ret = -ENOMEM;
> +		goto err_fence_put;
> +	}
> +
> +	/*
> +	 * usb_ep_queue() guarantees that all transfers are processed in the
> +	 * order they are enqueued, so we can use a simple incrementing
> +	 * sequence number for the dma_fence.
> +	 */
> +	seqno = atomic_add_return(1, &epfile->seqno);
> +
> +	dma_fence_init(&fence->base, &ffs_dmabuf_fence_ops,
> +		       &priv->lock, priv->context, seqno);
> +
> +	dma_resv_add_fence(dmabuf->resv, &fence->base,
> +			   dma_resv_usage_rw(dma_to_ram));
> +	dma_resv_unlock(dmabuf->resv);
> +
> +	/* Now that the dma_fence is in place, queue the transfer. */
> +
> +	usb_req->length = req->length;
> +	usb_req->buf = NULL;
> +	usb_req->sg = sg_table->sgl;
> +	usb_req->num_sgs = sg_nents_for_len(sg_table->sgl, req->length);
> +	usb_req->sg_was_mapped = true;
> +	usb_req->context  = fence;
> +	usb_req->complete = ffs_epfile_dmabuf_io_complete;
> +
> +	cookie = dma_fence_begin_signalling();
> +	ret = usb_ep_queue(ep->ep, usb_req, GFP_ATOMIC);
> +	dma_fence_end_signalling(cookie);
> +	if (ret) {
> +		pr_warn("FFS: Failed to queue DMABUF: %d\n", ret);
> +		ffs_dmabuf_signal_done(fence, ret);
> +		usb_ep_free_request(ep->ep, usb_req);
> +	}
> +
> +	spin_unlock_irq(&epfile->ffs->eps_lock);
> +	dma_buf_put(dmabuf);
> +
> +	return ret;
> +
> +err_fence_put:
> +	spin_unlock_irq(&epfile->ffs->eps_lock);
> +	dma_fence_put(&fence->base);
> +err_unmap_attachment:
> +	dma_buf_unmap_attachment(attach, sg_table, dir);
> +err_resv_unlock:
> +	dma_resv_unlock(dmabuf->resv);
> +err_attachment_put:
> +	ffs_dmabuf_put(attach);
> +err_dmabuf_put:
> +	dma_buf_put(dmabuf);
> +
> +	return ret;
> +}
> +
>   static long ffs_epfile_ioctl(struct file *file, unsigned code,
>   			     unsigned long value)
>   {
> @@ -1292,6 +1706,44 @@ static long ffs_epfile_ioctl(struct file *file, unsigned code,
>   	if (WARN_ON(epfile->ffs->state != FFS_ACTIVE))
>   		return -ENODEV;
>   
> +	switch (code) {
> +	case FUNCTIONFS_DMABUF_ATTACH:
> +	{
> +		int fd;
> +
> +		if (copy_from_user(&fd, (void __user *)value, sizeof(fd))) {
> +			ret = -EFAULT;
> +			break;
> +		}
> +
> +		return ffs_dmabuf_attach(file, fd);
> +	}
> +	case FUNCTIONFS_DMABUF_DETACH:
> +	{
> +		int fd;
> +
> +		if (copy_from_user(&fd, (void __user *)value, sizeof(fd))) {
> +			ret = -EFAULT;
> +			break;
> +		}
> +
> +		return ffs_dmabuf_detach(file, fd);
> +	}
> +	case FUNCTIONFS_DMABUF_TRANSFER:
> +	{
> +		struct usb_ffs_dmabuf_transfer_req req;
> +
> +		if (copy_from_user(&req, (void __user *)value, sizeof(req))) {
> +			ret = -EFAULT;
> +			break;
> +		}
> +
> +		return ffs_dmabuf_transfer(file, &req);
> +	}
> +	default:
> +		break;
> +	}
> +
>   	/* Wait for endpoint to be enabled */
>   	ep = ffs_epfile_wait_ep(file);
>   	if (IS_ERR(ep))
> @@ -1869,6 +2321,8 @@ static int ffs_epfiles_create(struct ffs_data *ffs)
>   	for (i = 1; i <= count; ++i, ++epfile) {
>   		epfile->ffs = ffs;
>   		mutex_init(&epfile->mutex);
> +		mutex_init(&epfile->dmabufs_mutex);
> +		INIT_LIST_HEAD(&epfile->dmabufs);
>   		if (ffs->user_flags & FUNCTIONFS_VIRTUAL_ADDR)
>   			sprintf(epfile->name, "ep%02x", ffs->eps_addrmap[i]);
>   		else
> diff --git a/include/uapi/linux/usb/functionfs.h b/include/uapi/linux/usb/functionfs.h
> index 078098e73fd3..9f88de9c3d66 100644
> --- a/include/uapi/linux/usb/functionfs.h
> +++ b/include/uapi/linux/usb/functionfs.h
> @@ -86,6 +86,22 @@ struct usb_ext_prop_desc {
>   	__le16	wPropertyNameLength;
>   } __attribute__((packed));
>   
> +/* Flags for usb_ffs_dmabuf_transfer_req->flags (none for now) */
> +#define USB_FFS_DMABUF_TRANSFER_MASK	0x0
> +
> +/**
> + * struct usb_ffs_dmabuf_transfer_req - Transfer request for a DMABUF object
> + * @fd:		file descriptor of the DMABUF object
> + * @flags:	one or more USB_FFS_DMABUF_TRANSFER_* flags
> + * @length:	number of bytes used in this DMABUF for the data transfer.
> + *		Should generally be set to the DMABUF's size.
> + */
> +struct usb_ffs_dmabuf_transfer_req {
> +	int fd;
> +	__u32 flags;
> +	__u64 length;
> +} __attribute__((packed));
> +
>   #ifndef __KERNEL__
>   
>   /*
> @@ -290,6 +306,31 @@ struct usb_functionfs_event {
>   #define	FUNCTIONFS_ENDPOINT_DESC	_IOR('g', 130, \
>   					     struct usb_endpoint_descriptor)
>   
> +/*
> + * Attach the DMABUF object, identified by its file descriptor, to the
> + * data endpoint. Returns zero on success, and a negative errno value
> + * on error.
> + */
> +#define FUNCTIONFS_DMABUF_ATTACH	_IOW('g', 131, int)
> +
>   
> +/*
> + * Detach the given DMABUF object, identified by its file descriptor,
> + * from the data endpoint. Returns zero on success, and a negative
> + * errno value on error. Note that closing the endpoint's file
> + * descriptor will automatically detach all attached DMABUFs.
> + */
> +#define FUNCTIONFS_DMABUF_DETACH	_IOW('g', 132, int)
> +
> +/*
> + * Enqueue the previously attached DMABUF to the transfer queue.
> + * The argument is a structure that packs the DMABUF's file descriptor,
> + * the size in bytes to transfer (which should generally correspond to
> + * the size of the DMABUF), and a 'flags' field which is unused
> + * for now. Returns zero on success, and a negative errno value on
> + * error.
> + */
> +#define FUNCTIONFS_DMABUF_TRANSFER	_IOW('g', 133, \
> +					     struct usb_ffs_dmabuf_transfer_req)
>   
>   #endif /* _UAPI__LINUX_FUNCTIONFS_H__ */

