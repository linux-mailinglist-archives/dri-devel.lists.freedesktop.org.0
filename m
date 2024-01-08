Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D0A826DDA
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 13:28:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D72F810E261;
	Mon,  8 Jan 2024 12:28:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 485A110E261
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jan 2024 12:28:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jRFh0XNnQ/5JT5D8iVgyYaGBsq2TEzN6WW0e3QEzmZZgNOqbe9n5EGs9fPceElLXdML6e5Q2P0aIhyN+Kbb5ie0ERzhUlqfOwkVRh2DKDRHUHoJUvuQM2W0jfgDeqTxr+ZKk0VfKCt/fRxa2YsFQ+Es9+JorcEwQNZ+6++w2xDPoyo96tXjAgSiVB2w3BjluNorB4ixay6Q3M9eXKugWx4h5bdZPmE6HZbYMGS2KzXK2mLZkSlRUgOW9lW+p6sj9+utJGEUkavrNQkH8h8x14mq+eUYjIJDxJyAN3LKn8AVgRy8RLb9kWaW10/HVWQKYCXk9gUp1IYzXkrrCuhKmdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9mEzF6AgMfHgcEtu61LXxKvp0TDmz1BR5GKI6pd1r3o=;
 b=doBwwnjByjLnFgmynQYfTksmt7C2jKxSOP60pbIYSyNBvKX+RsaQHmvJ5VOR12Ujj1WumpYe9JOpQYFaU+u5w8mbtN2/4JXG+Qb0SARiOlBRiDIES2LJ0JwKws6rAhKdMT8u0eOwLvBgUCs/8xjIUmRADWfYB25a56J0Zgms4HY0DJnKT+/6WR+fD52e8ZoLvxSWlrjgTmZs1u/liS6Sp9b6IU+BzhlGXGWWIHS84+lzfWRmXMZDplOs+Y9w/88UsP2140nyJOuj/wLL6IzIhkCLmzkI00DLAnsibTYo0H1kqNWlKe8rJSohdPJBuAx0Jmx6GSOnMReG0UNLGh3RnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9mEzF6AgMfHgcEtu61LXxKvp0TDmz1BR5GKI6pd1r3o=;
 b=HOevLdKAUIfabpPHFP1jhLaAjQrDEugY94AgtRjxLAjRNmFKjuG9iFgJrulSPadc1jPVtRkzyFZYCFsw8rdpiXGbQosD5kFRkwwUMrhhuRaiE6Ucvh+tIry3HMk/FLRkKWNqfXR5z4nBnzosxT9UqdPwJOjQ5DcLGn6pMunI8/E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA3PR12MB9089.namprd12.prod.outlook.com (2603:10b6:806:39f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Mon, 8 Jan
 2024 12:28:29 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7159.020; Mon, 8 Jan 2024
 12:28:29 +0000
Message-ID: <d169b5d2-5ec9-466e-a813-d326d4863026@amd.com>
Date: Mon, 8 Jan 2024 13:28:21 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] usb: gadget: functionfs: Add DMABUF import
 interface
Content-Language: en-US
To: Paul Cercueil <paul@crapouillou.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Jonathan Corbet <corbet@lwn.net>
References: <20240108120056.22165-1-paul@crapouillou.net>
 <20240108120056.22165-4-paul@crapouillou.net>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240108120056.22165-4-paul@crapouillou.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0385.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f7::10) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA3PR12MB9089:EE_
X-MS-Office365-Filtering-Correlation-Id: a105457f-8af9-4ebb-4bef-08dc104551be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zj8LZEv8HgFu8nWuPL/gbQJDw/4nndVBJ1v7masoWqLikxD6jL8lJz28bgrfJqMKjZve+/AFHd2Gkioiu/AxnGEGXUy/f+7jEy2A7Q2oNaOBucl44bTUR7uaHEdTyElQRy1VwmB85wdLJyOzfVVcOyED3a52oNkfJuAccm54J2CQhTnmxKRElWOiYTXbuQjzOoCO1kBkouYnfIOBiGfCU7abbfLDSBS6doHEXO8O2pbJRm8EKj4cjpnadmke0CD1UdFlZRTFvgY1gsJZnu6jDHnSrdsFIUsbxaRlagjiHIFSKY3GoOBFhRSH/GzswbTE2b3Q+JztPS1YGuZ/yk32xlyK2YHkpS8cYxMVyzNvdSlFb9/uWAEgdqjiJmZe2mpdOGxVe1/uu75T302dkLUJ5/xFXJP7qtsjTtaVzE4IHftvHh4Ccok+ydUZL8J07KpiwqWTIR4OdX2R9wev427ZZPd1pPQzZIMVEleLIM1Rd796Qr+mAmBNkYJ98gL5ViUN9hrno5QKvpnnDUq27sFa8yvqNm0sjNd9gYciRt/dLUTMzueHSCiJD34mS8zDDjg2UtMBL+Fr/PuXpP4upzcuxSQInkEXLykBDFAv1viYiN2ayupJPwuuxc6IrNx6ZvFmufRhySIsuTWw6J/jR6hlQg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(366004)(376002)(346002)(136003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(5660300002)(2906002)(7416002)(30864003)(41300700001)(36756003)(86362001)(31696002)(38100700002)(4326008)(66556008)(2616005)(6486002)(66476007)(6666004)(54906003)(110136005)(316002)(478600001)(66946007)(8676002)(8936002)(31686004)(6512007)(6506007)(83380400001)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cG9qM2tFajFQVkhreTJJOWdVVHVqWWVLbHpSeFBJa1d3bHZPNFI4WFJnOXZ1?=
 =?utf-8?B?bXlLbUdVUU9PUHUvRXlZL2kveXFOZHA0R01Yc3c2SUx0TFM2b01DY2hJL1BI?=
 =?utf-8?B?d1FIZ2grdmhjaXdwYkVRS0ljZWJ1RVhHRmlhVTdDdkNiYWlOdVoremR0MVVa?=
 =?utf-8?B?RUx5bTcwNiswL1pGS2xlQzlRZFhyTWdQRU5sT1VaOXVQdUNyMmRtN2lRRmRz?=
 =?utf-8?B?VGppdjI3MDk1N2EvVUFybFYwYmVkY0V1S0dMa1YwcllwVlVlS3hxVWpzbWFh?=
 =?utf-8?B?TFdmclRXVGlWQjE0c3pnUy92SzFObFl0cEQvSlRJR2YwM1NFNExvUnNCS0k3?=
 =?utf-8?B?TVhJT1lWeGR3YWwrN1VpeVM5SjU4TTdPUFpiQVBQT0V5TnlqdlBadTA4dmNJ?=
 =?utf-8?B?bk1YTTU2d0h4cmx2QitCWVcvM05zS1ZjdFF4SU1VMUs2VlB4VHh6ZWZMTkk3?=
 =?utf-8?B?MjJGZ1p2TDBKNWVDNm11NlZ1RkNyRStEVGhmbGFwY2hzemVzdTBhZmJ3VUVr?=
 =?utf-8?B?WjBUV2M5cTJQQklUYWxjdTN5WXBoR1dYZzBLZTcxS2dlUVQySUhmbkUzTlVm?=
 =?utf-8?B?V2FCSFpOcXRpVlR1Qlp5NW9LWmFHS3hKUmRFbllvdFJGWG9VbEd5aHZiektr?=
 =?utf-8?B?N2pvczlnNHN2cU1UWHpEQUpOanI2NUtJdHVpMmtMSzJrZWRRQ1V6OFJXWjUv?=
 =?utf-8?B?bEtZQkQ4SFNKYkJxTG9YVCs4d1d6SGc4VnNtUGhoWHFrUWEzR0ZaRjhSd2sz?=
 =?utf-8?B?TmhjYVpYWWJ3RElWbExxdUo4ZDFqU3kzR2NrSkVuSjBPQXcvMWZGdmNRRWNM?=
 =?utf-8?B?WDA1MjhrcU0rbGdCR1VvQ2hYRk9RRG44YStORVF4RWRENmpLSHRNeitIRTBr?=
 =?utf-8?B?Y3k2OFAxS3Fia0h4WmU0bDJzOVoxN0ZmaXdWOWVwQUxzTDR6ajZHZ1NWT1Mx?=
 =?utf-8?B?V1VqK2xOWXFzZzZjU0hsNjhvalROWlMyUFdkemdWNHlzbEF2NG1NR3A1TTRq?=
 =?utf-8?B?MzVHZ2VpSU9lVmc1bTZIZEVmQ05BZ2F3ZWd4cmsvSE1wTEhmbzQ1TEF0UHFx?=
 =?utf-8?B?R0NycWFGclgrdVNmNzdXWUtHY1kwbEhHVURCemxmZEhOLzMxcGxqb2N5WVZp?=
 =?utf-8?B?WmRPNW0vNzFZNmR1ak1VM3UrLzMyb0RxR2ZtSTdpc3lwSUg5OXBZanU3Mmx2?=
 =?utf-8?B?MkhLYmZQbVZOWU84TmVha3FOUkR6TUlLd1I1MEtPNnRPMmUxbUlDSTBBcEww?=
 =?utf-8?B?d2trTkYzTU1tUnJrSmhUczdaQzNTR1FydytzM1RMa011OVVhcDV3NUJ1Tlhz?=
 =?utf-8?B?d0NoVTE3MUx2QjlzemNWMHFwMnR6c1U1Z0J1TS9SenYxZWZYZWR5eHlXSmky?=
 =?utf-8?B?bkNNQXdOMUZyNkI1UDc1M1k5MzJkb0FUNFFYZjNCcVRWWDl4dFJiaDBjTU9P?=
 =?utf-8?B?NTBhZEFnRTBaWkVPT09zbFBLTlFhVFZwR01XaDRKTGhtNzR0cXVwc1l5eXNQ?=
 =?utf-8?B?ZzhCS3cyWmVhYnc3LzhhVVpiUDkyRGpIVEpWOW5sRnovL3dYMjFMWkFyU3M3?=
 =?utf-8?B?WVlta3M0TVhVemFpNUNPUUlzSC9oY095dzRvZk53SVJJVzgxQ0s1TCt2clh2?=
 =?utf-8?B?dnc0ZUtTQTQ4VU5uWkZpOVhHck5lcWkzbHBQOXM3ZlJGUDFWenR4ZkFhSjl6?=
 =?utf-8?B?MWl1S3g1dURtNE12aGtpdy8rTU5GNDBBc3RWbkZzNmw3VkZmTno1MmxZYjZq?=
 =?utf-8?B?MWh6YW1FNFZ4WksyWTJINjJtWmZ0b0x3Wkd5WmdkRVVmV3FveFp4WmlzdFlv?=
 =?utf-8?B?dHVLdDlDdy9scFI5R0ptckNwdTE5N2xUdjE1c0dSMU12WVRTN3BDVWh5VUZK?=
 =?utf-8?B?Q3NzZ3dYb0RGVklYalJyT2Nzb1dVR2pUUklUdDdwUkpIK0dJUDRKbmVQT0RL?=
 =?utf-8?B?SWhwUE1lN3djRm5xQ1JOMkNkS2F0WENTUUNxV01kTlh5S0RrSTlOMXpGVzhC?=
 =?utf-8?B?NHNYWWZsRWlLRDZWYmNWaEQ2N0FJOXRoK2JNbVZjMUZOaW1YdHNLMGtMTFQw?=
 =?utf-8?B?bXZHWUdIdUY2by96ckViRmNyZ0tGdkdZYXh2aUp5dWRxZWZORnVEUUhSSXlW?=
 =?utf-8?Q?J/PvewxFF1ffZySIf59NdXLl4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a105457f-8af9-4ebb-4bef-08dc104551be
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2024 12:28:29.1357 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HGIZog0stsHQxXyU8Mko2EdKHByHM5NC81DwUPdh6/5BXUS2vF5Pp3q7wIL9XAhZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9089
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
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 linaro-mm-sig@lists.linaro.org,
 =?UTF-8?Q?Nuno_S=C3=A1?= <noname.nuno@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 08.01.24 um 13:00 schrieb Paul Cercueil:
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
> ---
>   drivers/usb/gadget/function/f_fs.c  | 417 ++++++++++++++++++++++++++++
>   include/uapi/linux/usb/functionfs.h |  41 +++
>   2 files changed, 458 insertions(+)
>
> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> index ed2a6d5fcef7..9df1f5abb0d4 100644
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
> @@ -124,6 +129,21 @@ struct ffs_ep {
>   	u8				num;
>   };
>   
> +struct ffs_dmabuf_priv {
> +	struct list_head entry;
> +	struct kref ref;
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
> +};
> +
>   struct ffs_epfile {
>   	/* Protects ep->ep and ep->req. */
>   	struct mutex			mutex;
> @@ -197,6 +217,8 @@ struct ffs_epfile {
>   	unsigned char			isoc;	/* P: ffs->eps_lock */
>   
>   	unsigned char			_pad;
> +
> +	struct list_head		dmabufs;
>   };
>   
>   struct ffs_buffer {
> @@ -1271,10 +1293,44 @@ static ssize_t ffs_epfile_read_iter(struct kiocb *kiocb, struct iov_iter *to)
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
> +
> +	list_del(&priv->entry);
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
> +	/* Close all attached DMABUFs */
> +	list_for_each_entry_safe(priv, tmp, &epfile->dmabufs, entry) {
> +		ffs_dmabuf_put(priv->attach);
> +	}
>   
>   	__ffs_epfile_read_buffer_free(epfile);
>   	ffs_data_closed(epfile->ffs);
> @@ -1282,6 +1338,328 @@ ffs_epfile_release(struct inode *inode, struct file *file)
>   	return 0;
>   }
>   
> +static void ffs_dmabuf_signal_done(struct ffs_dma_fence *dma_fence, int ret)
> +{
> +	struct ffs_dmabuf_priv *priv = dma_fence->priv;
> +	struct dma_fence *fence = &dma_fence->base;
> +
> +	dma_fence_get(fence);
> +	fence->error = ret;
> +	dma_fence_signal(fence);
> +
> +	dma_buf_unmap_attachment(priv->attach, dma_fence->sgt, dma_fence->dir);
> +	dma_fence_put(fence);
> +	ffs_dmabuf_put(priv->attach);
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
> +	int ret;
> +
> +	ret = dma_resv_lock_interruptible(dmabuf->resv, NULL);
> +	if (ret) {
> +		if (ret != -EDEADLK)
> +			return ret;
> +		if (nonblock)
> +			return -EBUSY;
> +
> +		ret = dma_resv_lock_slow_interruptible(dmabuf->resv, NULL);
> +	}
> +
> +	return ret;
> +}
> +
> +static struct dma_buf_attachment *
> +ffs_dmabuf_find_attachment(struct device *dev, struct dma_buf *dmabuf,
> +			   bool nonblock)
> +{
> +	struct dma_buf_attachment *elm, *attach = NULL;
> +	int ret;
> +
> +	ret = ffs_dma_resv_lock(dmabuf, nonblock);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	list_for_each_entry(elm, &dmabuf->attachments, node) {

Mhm, this is messing with internals of DMA-buf and probably a no-go.

We might be able to have this as dma_buf function with proper 
documentation if you really need it, but see below.

> +		if (elm->dev == dev) {
> +			attach = elm;
> +			break;
> +		}
> +	}
> +
> +	if (attach)
> +		ffs_dmabuf_get(elm);
> +
> +	dma_resv_unlock(dmabuf->resv);
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
> +	priv->attach = attach;
> +	spin_lock_init(&priv->lock);
> +	kref_init(&priv->ref);
> +	priv->context = dma_fence_context_alloc(1);
> +
> +	list_add(&priv->entry, &epfile->dmabufs);
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
> +	struct usb_gadget *gadget = epfile->ffs->gadget;
> +	bool nonblock = file->f_flags & O_NONBLOCK;
> +	struct dma_buf_attachment *attach;
> +	struct dma_buf *dmabuf;
> +	int ret = 0;
> +
> +	dmabuf = dma_buf_get(fd);
> +	if (IS_ERR(dmabuf))
> +		return PTR_ERR(dmabuf);
> +
> +	attach = ffs_dmabuf_find_attachment(gadget->dev.parent,
> +					    dmabuf, nonblock);
> +	if (IS_ERR(attach)) {
> +		ret = PTR_ERR(attach);
> +		goto out_dmabuf_put;
> +	}
> +
> +	/*
> +	 * Unref twice to release the reference obtained with
> +	 * ffs_dmabuf_find_attachment() above, and the one obtained in
> +	 * ffs_dmabuf_attach().
> +	 */
> +	ffs_dmabuf_put(attach);
> +	ffs_dmabuf_put(attach);

What is preventing this function from being called multiple times 
concurrently?

If I'm not completely mistaken that can break trivially.

Regards,
Christian.

> +
> +out_dmabuf_put:
> +	dma_buf_put(dmabuf);
> +	return ret;
> +}
> +
> +static int ffs_dmabuf_transfer(struct file *file,
> +			       const struct usb_ffs_dmabuf_transfer_req *req)
> +{
> +	bool dma_to_ram, nonblock = file->f_flags & O_NONBLOCK;
> +	struct ffs_epfile *epfile = file->private_data;
> +	struct usb_gadget *gadget = epfile->ffs->gadget;
> +	struct dma_buf_attachment *attach;
> +	struct ffs_dmabuf_priv *priv;
> +	enum dma_data_direction dir;
> +	struct ffs_dma_fence *fence;
> +	struct usb_request *usb_req;
> +	struct sg_table *sg_table;
> +	struct dma_buf *dmabuf;
> +	struct ffs_ep *ep;
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
> +	attach = ffs_dmabuf_find_attachment(gadget->dev.parent,
> +					    dmabuf, nonblock);
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
> +	sg_table = dma_buf_map_attachment(attach, dir);
> +	if (IS_ERR(sg_table)) {
> +		ret = PTR_ERR(sg_table);
> +		goto err_attachment_put;
> +	}
> +
> +	ep = ffs_epfile_wait_ep(file);
> +	if (IS_ERR(ep)) {
> +		ret = PTR_ERR(ep);
> +		goto err_unmap_attachment;
> +	}
> +
> +	ret = ffs_dma_resv_lock(dmabuf, nonblock);
> +	if (ret)
> +		goto err_unmap_attachment;
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
> +	ret = dma_resv_reserve_fences(dmabuf->resv, 1);
> +	if (ret)
> +		goto err_resv_unlock;
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
> +	dma_fence_init(&fence->base, &ffs_dmabuf_fence_ops,
> +		       &priv->lock, priv->context, 0);
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
> +	ret = usb_ep_queue(ep->ep, usb_req, GFP_ATOMIC);
> +	if (ret) {
> +		usb_ep_free_request(ep->ep, usb_req);
> +
> +		spin_unlock_irq(&epfile->ffs->eps_lock);
> +
> +		pr_warn("FFS: Failed to queue DMABUF: %d\n", ret);
> +		ffs_dmabuf_signal_done(fence, ret);
> +		goto out_dma_buf_put;
> +	}
> +
> +	spin_unlock_irq(&epfile->ffs->eps_lock);
> +
> +out_dma_buf_put:
> +	dma_buf_put(dmabuf);
> +
> +	return ret;
> +
> +err_fence_put:
> +	spin_unlock_irq(&epfile->ffs->eps_lock);
> +	dma_fence_put(&fence->base);
> +err_resv_unlock:
> +	dma_resv_unlock(dmabuf->resv);
> +err_unmap_attachment:
> +	dma_buf_unmap_attachment(attach, sg_table, dir);
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
> @@ -1292,6 +1670,44 @@ static long ffs_epfile_ioctl(struct file *file, unsigned code,
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
> @@ -1869,6 +2285,7 @@ static int ffs_epfiles_create(struct ffs_data *ffs)
>   	for (i = 1; i <= count; ++i, ++epfile) {
>   		epfile->ffs = ffs;
>   		mutex_init(&epfile->mutex);
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

