Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2882B8701C1
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 13:45:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84A7B1120F4;
	Mon,  4 Mar 2024 12:45:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4Aq5XAhi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2069.outbound.protection.outlook.com [40.107.101.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D36CF1120F4
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 12:45:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CSoLF1n253X4+0P0ElphI6KrG2GSH869SbJ8gq0Tp25EXmFaT2icj7gyQ+VABVzVqqiIeDutEi2RDGqmxHs0Zh3lnE312nV1SfQTrkqkJ+c1OOkRSseZt2pH1Pcf/6BqJPe286DvaZwCfNZ0zy/h6s8WjDIlBcXO96gWAPHkm9LrwOJmptUaan7TSs2+6Fxs9LXp3orE6czDpHAM+ux6tRytS7S255b5ank8lE8eWYxQy8Q2ELWVF0K+pfAB/LhZxBQnCu+JRH/CYbhDTLIR+1/IqpoA4HkFeLaH53p748bupDiyrVehPOBuueM1Fw+J1XtQFnD1Nm+/6P851CFMaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I8fcO4x9c6O5NLEEnRPca9MJZpG02Jel8ZsXCKefNys=;
 b=nM0utkR7pkDtzsLp/XAW8X+mOZ+ZLNDUzcgLTZNfBWqMP66rz84ZV9HWBHmFmVoTE0zunavba7EBOM14gl0Kaa28DAh90XOVV5WVfJkYFHwK/ndT7BEryy+r+nR1ApqhZcaGeNsFq1Q/JkYw1rt0Zm+ln0ypbOrCTXK/+8BPIli/JwWC42q1hjfXesf6m3HEY78aZI9BwjMFapiNKzjNoQaZZAwlJv2bwmOpYVI1DQg7ljm8ihY/EBKYWK3wXuyJPlNpHPySL44ZOvvvF+QY0j04BW1Z0F1tRL9e7LpGebyf1+L4x8H249Qsn2TLd60ufTYsVh6x3oz436mmFR4upw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I8fcO4x9c6O5NLEEnRPca9MJZpG02Jel8ZsXCKefNys=;
 b=4Aq5XAhi2d4GxDzpgIdOVUdRaixVwn0UlmKL1kWrSovNHDnr6PyXiOTvgo7FTfHbPLeWTI97g02ImsH5F8wdIWVw/H8uQh2M1j112b1vnYhtYDs+6BBfDQzI5yloiEBx2KHXhBNuiOkt7wMWW5xhJwywNKALAFojplQkBVeTv1E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY8PR12MB7682.namprd12.prod.outlook.com (2603:10b6:930:85::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.38; Mon, 4 Mar
 2024 12:44:58 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7339.031; Mon, 4 Mar 2024
 12:44:58 +0000
Message-ID: <85782edb-4876-4cbd-ac14-abcbcfb58770@amd.com>
Date: Mon, 4 Mar 2024 13:44:51 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/6] iio: core: Add new DMABUF interface infrastructure
Content-Language: en-US
To: Nuno Sa <nuno.sa@analog.com>, Vinod Koul <vkoul@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Jonathan Cameron <jic23@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
 Paul Cercueil <paul@crapouillou.net>
Cc: Daniel Vetter <daniel@ffwll.ch>,
 Michael Hennerich <Michael.Hennerich@analog.com>, linux-doc@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <20240223-iio-dmabuf-v7-0-78cfaad117b9@analog.com>
 <20240223-iio-dmabuf-v7-3-78cfaad117b9@analog.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240223-iio-dmabuf-v7-3-78cfaad117b9@analog.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0118.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY8PR12MB7682:EE_
X-MS-Office365-Filtering-Correlation-Id: d1f87532-8992-4200-ce5f-08dc3c48e65d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F2wW7m9XT7mwrxQHxAVb7UoeMF33zqyGnyG5Oq3VaRnNBJnqvKZKDqZqTColJpt79s58p87s0vk6RdQTDrqDS/22E38cLjhEPtg3Q7KyOknCPkDzbbmiu5Vlr5I6lhx11fkZ9QkgqqG1jkBtgBfWl/5xdHjlKyQMdrR0u/9rwSVnWJBWCk6wXDMbAGz5OvMFOX5qJAvIA8LMIzEQxt6KPfTelPvoi7MXWjCxbkItnHoRIfYcn8YFaRGzw0Bq0RLaxnEoHu3Whi3oUSDfBtO5fNAcWZEEsTizFHvGXl2rHHj7g3dgCaVVSn+6Mi3WGzO+/rGRkq+SWwtXOqOcceeQ5GP8K34nm0ym0vJIFri9FxdR1STUDLCb89XogRHXJkSexISgctNrbcQJBm/lK84cC5/lxxay/y2RbmeqK8q1oveoX6pAkOAjmWl6IEcqMsHB6oxxa9y0MHeM+Sd6juz8dwH7Wowq+8jZXyHN1HquAfIEIHaP+1uCKbe0qeeVOgByc69ZNWcHwekQhvMOw07n1112cQtucMG/HGnGs+59TixVY01CjDkcB1CSU0/gvqyeqKPZqNyGWIdvXbqggZFYJpYuefbcHNByv6SZ1ITcKw/qawtUGuxBTvPjAEO+oe4++EUqhMAxGpAAUD0LhCkNVwKkoOlHKnmK58Ahv8TjYgY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZnFwSmVjYzNDbkFFbkRlSjQ0OW81NWZvYnJUaUg3dHJIQ1pTQnVQOU5PakxN?=
 =?utf-8?B?cmlNZDkwR1hLeWdDa1puNkVKY0ZaSkRZY2YxYmxKcnFpNWJBQThMVTBlb0hF?=
 =?utf-8?B?dW04L0hVUDJueXdSdEUzUndtRVlVYlBvNlNFOVJrSFM3cG1JLzZJVld6OGhn?=
 =?utf-8?B?YjhvU3hsY0xZRWVqWElYVkFsUm53bTlndGF4d3Y2M3NpQXpmRkpYc0xhWU9v?=
 =?utf-8?B?T3h5TVBvWE9TalhGWVY0MVdDRld2SmFHdFhTYjV6c3MrdkhsbllGbjhENy9r?=
 =?utf-8?B?Y08wUGl5YjByTXJjckMwTlJLc012bEVNQWxMeWZoZEpPKzNVV0NERGdRVnlv?=
 =?utf-8?B?L3BNTzFUOHM2SjBkb3dNZ21UWHJKM01pblZMdWxWL29ySytMM2FkU1ZHbzhP?=
 =?utf-8?B?TGpteUJNYU5GV3pMRUM3elFyNzdUeVEvTGVoUWNPalJ5ZWpuSG5Ibmk4bjhZ?=
 =?utf-8?B?NUl1UnBrUGdBT1ljQWp5MjRWZkVBTnBXdk40Y2k5K2dWdkt2cmVtRWoxb1RC?=
 =?utf-8?B?Vnl0ZVEwMjd2RlI3bE5tRVduOU4zVG9pdW0waXZUUWRmSlFhK2pPQzcydk16?=
 =?utf-8?B?VTdYakFUNG05VU8wREhyaUZtL3VySCtqK0txcm1vNmhGL3M3VDRqRHZNcDZi?=
 =?utf-8?B?N0pwdWFlYTgxdXJOOUNVSWVWbEtkd0ZrbmNnQUJqaTlLbVJxdDdxQTN2ZDlQ?=
 =?utf-8?B?MGpXdUtPbkNkb1dJaEZJVVl1ZE9td3lBSjdwNFo1SnRUbXAyQW96bUFDWVFv?=
 =?utf-8?B?c0UrMS9iWGYyNWcyN0JpcWRJWTd0Wm5CSmhtSUREakVoV2JBcTN6c05NL2RU?=
 =?utf-8?B?S3pFWE5SUmp5eUpGdWw5eVhYQW84WFMvUzJWT21welZwQW9zYlArcGJTajcr?=
 =?utf-8?B?WlAwVGl6Tis0Ym5EclFFUEJpRUNOYnNJRURGbUFaRE5CdGdGZkpDUHdhcE13?=
 =?utf-8?B?YjZXVjBLakNnbmtNb1RvNGQxUTl0Qy95UVJwNFh1YW5QSVJJMk01TDVsT2xS?=
 =?utf-8?B?dmpBWE94UHhGMS9vYTQwbWE3dzRJeXBoUVU5Nmo5YU1MMXIweDF1SllNOHBX?=
 =?utf-8?B?Rmd4aGh2ZHBVYjhTZVRtQnR5NTZXdDREVll4S1MwOStNZGI4WXRmUWxZQUpq?=
 =?utf-8?B?M3UzWi9UbTl0R2xYUnRuSFl3QitxT0twT29yeHcwRGVnMnFqc0w5a2ZhRGRh?=
 =?utf-8?B?UlNFVnFVMWpUTFlpM1NRSHVJZENqOFV5ZFpWRHBRS0ZiSjFxaWRtNitKTGVY?=
 =?utf-8?B?dnRHaU1SQ0MxMUNRcmdPNWgvUnF0TlBiYlFQcXU0dUNLajFKUnpreHlOSk9k?=
 =?utf-8?B?YUJoemhlSU1pclRmT3Iwc3J3Tkx1SWpXSC9CNkI0WFhHL3FzTWhLSlBKWWpS?=
 =?utf-8?B?OFRZTXUxQnd0NHNJbHlXUE1MVzQrS21wZ0xTOFRpNVJpczZrRkw5Wkx1YkhR?=
 =?utf-8?B?d3RwUGdKVWpBWVNKalpUVzdzS1dCOTM3L3FQR2l4T3RNUFA1RUQ1WS9VS09U?=
 =?utf-8?B?WnA0eUNONTA1OUFzOEQ1MGZYS2M3bFJVeUNpYldxWnBnaHhkY2UxakdZZ1Fq?=
 =?utf-8?B?MmwrVDcvdU9sLzl1R3FHOURSNlN4bndHR0xaQ0xGQlFsUDFINzczV2pSbzZF?=
 =?utf-8?B?Rkx3cTNpUXdSeDZCVngxQnJ1MWsrMmVTeUJOMngzdFhYa0NWY3B4QkNHc05Y?=
 =?utf-8?B?Mm40Y0FIRGVXS0ZWOG5LK0Q3T0hJSEJQUDNGU0I5MFhGV2JMWGdkRVdKbUZB?=
 =?utf-8?B?TjBSbmplNlRPdVpIdHA4L3dZTkEwaHpBVjBKeFlseldHbEdMbTVqeTRSTm44?=
 =?utf-8?B?R0N1NDErL01jQ1ZKS3psMVRPZVJ4ekZqaHB5T2EydmtWZFhtRjZjUUdsQlho?=
 =?utf-8?B?bHBFNkpTRXlzbUVGOGpKSk9hbW5kK05hUUdMNitZRERENFcrNEFQRWVoUXc5?=
 =?utf-8?B?V1lyUzlsTk9hb2FyWGxIZnpiOEovUm5kLy9tK1ZLeTluUFN6a2VZblBmQ1hL?=
 =?utf-8?B?MmN6UW5JdU5yWkxZRWdmSmpZUkFUQW1KRUVYeWpqa0wxN3pYQjJ2Z1BVbUFI?=
 =?utf-8?B?YlN1cVNxLzBPYms2SS9yMFMxbzB1WVgzTFFJUXplamZ3SmI2SGV2WUJ6T0ZH?=
 =?utf-8?Q?b0Tk=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1f87532-8992-4200-ce5f-08dc3c48e65d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2024 12:44:58.2677 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rSLFxyWa9/GieMMYsmJ1dRyzwuZ6sNQNZjHQpNMwZH5XHR3T+m2JDv0fidiEepSO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7682
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

Am 23.02.24 um 13:14 schrieb Nuno Sa:
> From: Paul Cercueil <paul@crapouillou.net>
>
> Add the necessary infrastructure to the IIO core to support a new
> optional DMABUF based interface.
>
> With this new interface, DMABUF objects (externally created) can be
> attached to a IIO buffer, and subsequently used for data transfer.
>
> A userspace application can then use this interface to share DMABUF
> objects between several interfaces, allowing it to transfer data in a
> zero-copy fashion, for instance between IIO and the USB stack.
>
> The userspace application can also memory-map the DMABUF objects, and
> access the sample data directly. The advantage of doing this vs. the
> read() interface is that it avoids an extra copy of the data between the
> kernel and userspace. This is particularly userful for high-speed
> devices which produce several megabytes or even gigabytes of data per
> second.
>
> As part of the interface, 3 new IOCTLs have been added:
>
> IIO_BUFFER_DMABUF_ATTACH_IOCTL(int fd):
>   Attach the DMABUF object identified by the given file descriptor to the
>   buffer.
>
> IIO_BUFFER_DMABUF_DETACH_IOCTL(int fd):
>   Detach the DMABUF object identified by the given file descriptor from
>   the buffer. Note that closing the IIO buffer's file descriptor will
>   automatically detach all previously attached DMABUF objects.
>
> IIO_BUFFER_DMABUF_ENQUEUE_IOCTL(struct iio_dmabuf *):
>   Request a data transfer to/from the given DMABUF object. Its file
>   descriptor, as well as the transfer size and flags are provided in the
>   "iio_dmabuf" structure.
>
> These three IOCTLs have to be performed on the IIO buffer's file
> descriptor, obtained using the IIO_BUFFER_GET_FD_IOCTL() ioctl.

A few nit picks and one bug below, apart from that looks good to me.

>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Signed-off-by: Nuno Sa <nuno.sa@analog.com>
> ---
>   drivers/iio/industrialio-buffer.c | 462 ++++++++++++++++++++++++++++++++++++++
>   include/linux/iio/buffer_impl.h   |  33 +++
>   include/uapi/linux/iio/buffer.h   |  22 ++
>   3 files changed, 517 insertions(+)
>
> diff --git a/drivers/iio/industrialio-buffer.c b/drivers/iio/industrialio-buffer.c
> index b581a7e80566..0e63a09fa90a 100644
> --- a/drivers/iio/industrialio-buffer.c
> +++ b/drivers/iio/industrialio-buffer.c
> @@ -9,14 +9,19 @@
>    * - Better memory allocation techniques?
>    * - Alternative access techniques?
>    */
> +#include <linux/atomic.h>
>   #include <linux/anon_inodes.h>
>   #include <linux/kernel.h>
>   #include <linux/export.h>
>   #include <linux/device.h>
> +#include <linux/dma-buf.h>
> +#include <linux/dma-fence.h>
> +#include <linux/dma-resv.h>
>   #include <linux/file.h>
>   #include <linux/fs.h>
>   #include <linux/cdev.h>
>   #include <linux/slab.h>
> +#include <linux/mm.h>
>   #include <linux/poll.h>
>   #include <linux/sched/signal.h>
>   
> @@ -28,6 +33,32 @@
>   #include <linux/iio/buffer.h>
>   #include <linux/iio/buffer_impl.h>
>   
> +#define DMABUF_ENQUEUE_TIMEOUT_MS 5000
> +
> +struct iio_dma_fence;
> +
> +struct iio_dmabuf_priv {
> +	struct list_head entry;
> +	struct kref ref;
> +
> +	struct iio_buffer *buffer;
> +	struct iio_dma_buffer_block *block;
> +
> +	u64 context;
> +	spinlock_t lock;
> +
> +	struct dma_buf_attachment *attach;
> +	struct sg_table *sgt;
> +	enum dma_data_direction dir;
> +	atomic_t seqno;
> +};
> +
> +struct iio_dma_fence {
> +	struct dma_fence base;
> +	struct iio_dmabuf_priv *priv;
> +	struct work_struct work;
> +};
> +
>   static const char * const iio_endian_prefix[] = {
>   	[IIO_BE] = "be",
>   	[IIO_LE] = "le",
> @@ -332,6 +363,8 @@ void iio_buffer_init(struct iio_buffer *buffer)
>   {
>   	INIT_LIST_HEAD(&buffer->demux_list);
>   	INIT_LIST_HEAD(&buffer->buffer_list);
> +	INIT_LIST_HEAD(&buffer->dmabufs);
> +	mutex_init(&buffer->dmabufs_mutex);
>   	init_waitqueue_head(&buffer->pollq);
>   	kref_init(&buffer->ref);
>   	if (!buffer->watermark)
> @@ -1519,14 +1552,62 @@ static void iio_buffer_unregister_legacy_sysfs_groups(struct iio_dev *indio_dev)
>   	kfree(iio_dev_opaque->legacy_scan_el_group.attrs);
>   }
>   
> +static void iio_buffer_dmabuf_release(struct kref *ref)
> +{
> +	struct iio_dmabuf_priv *priv = container_of(ref, struct iio_dmabuf_priv, ref);
> +	struct dma_buf_attachment *attach = priv->attach;
> +	struct iio_buffer *buffer = priv->buffer;
> +	struct dma_buf *dmabuf = attach->dmabuf;
> +
> +	dma_resv_lock(dmabuf->resv, NULL);
> +	dma_buf_unmap_attachment(attach, priv->sgt, priv->dir);
> +	dma_resv_unlock(dmabuf->resv);
> +
> +	buffer->access->detach_dmabuf(buffer, priv->block);
> +
> +	dma_buf_detach(attach->dmabuf, attach);
> +	dma_buf_put(dmabuf);
> +	kfree(priv);
> +}
> +
> +void iio_buffer_dmabuf_get(struct dma_buf_attachment *attach)
> +{
> +	struct iio_dmabuf_priv *priv = attach->importer_priv;
> +
> +	kref_get(&priv->ref);
> +}
> +EXPORT_SYMBOL_GPL(iio_buffer_dmabuf_get);
> +
> +void iio_buffer_dmabuf_put(struct dma_buf_attachment *attach)
> +{
> +	struct iio_dmabuf_priv *priv = attach->importer_priv;
> +
> +	kref_put(&priv->ref, iio_buffer_dmabuf_release);
> +}
> +EXPORT_SYMBOL_GPL(iio_buffer_dmabuf_put);
> +
>   static int iio_buffer_chrdev_release(struct inode *inode, struct file *filep)
>   {
>   	struct iio_dev_buffer_pair *ib = filep->private_data;
>   	struct iio_dev *indio_dev = ib->indio_dev;
>   	struct iio_buffer *buffer = ib->buffer;
> +	struct iio_dmabuf_priv *priv, *tmp;
>   
>   	wake_up(&buffer->pollq);
>   
> +	mutex_lock(&buffer->dmabufs_mutex);
> +
> +	/* Close all attached DMABUFs */
> +	list_for_each_entry_safe(priv, tmp, &buffer->dmabufs, entry) {
> +		list_del_init(&priv->entry);
> +		iio_buffer_dmabuf_put(priv->attach);
> +	}
> +
> +	if (!list_empty(&buffer->dmabufs))
> +		dev_warn(&indio_dev->dev, "Buffer FD closed with active transfers\n");

That check here smells fishy.

Either the list_for_each_entry_safe() above has removed all entries and 
then it can never happen or the buffer list is not always properly 
protected by the mutex.

Do you really need that? If yes then please justify.

BTW: When the transfers are async it's perfectly possible that there are 
active transfers on close (when the application is just killed for example).

> +
> +	mutex_unlock(&buffer->dmabufs_mutex);
> +
>   	kfree(ib);
>   	clear_bit(IIO_BUSY_BIT_POS, &buffer->flags);
>   	iio_device_put(indio_dev);
> @@ -1534,11 +1615,391 @@ static int iio_buffer_chrdev_release(struct inode *inode, struct file *filep)
>   	return 0;
>   }
>   
> +static int iio_dma_resv_lock(struct dma_buf *dmabuf, bool nonblock)
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
> +iio_buffer_find_attachment(struct iio_dev_buffer_pair *ib,
> +			   struct dma_buf *dmabuf, bool nonblock)
> +{
> +	struct device *dev = ib->indio_dev->dev.parent;
> +	struct iio_buffer *buffer = ib->buffer;
> +	struct dma_buf_attachment *attach = NULL;
> +	struct iio_dmabuf_priv *priv;
> +
> +	mutex_lock(&buffer->dmabufs_mutex);
> +
> +	list_for_each_entry(priv, &buffer->dmabufs, entry) {
> +		if (priv->attach->dev == dev
> +		    && priv->attach->dmabuf == dmabuf) {
> +			attach = priv->attach;
> +			break;
> +		}
> +	}
> +
> +	if (attach)
> +		iio_buffer_dmabuf_get(attach);
> +
> +	mutex_unlock(&buffer->dmabufs_mutex);
> +
> +	return attach ?: ERR_PTR(-EPERM);
> +}
> +
> +static int iio_buffer_attach_dmabuf(struct iio_dev_buffer_pair *ib,
> +				    int __user *user_fd, bool nonblock)
> +{
> +	struct iio_dev *indio_dev = ib->indio_dev;
> +	struct iio_buffer *buffer = ib->buffer;
> +	struct dma_buf_attachment *attach;
> +	struct iio_dmabuf_priv *priv;
> +	struct dma_buf *dmabuf;
> +	int err, fd;
> +
> +	if (!buffer->access->attach_dmabuf
> +	    || !buffer->access->detach_dmabuf
> +	    || !buffer->access->enqueue_dmabuf)
> +		return -EPERM;
> +
> +	if (copy_from_user(&fd, user_fd, sizeof(fd)))
> +		return -EFAULT;
> +
> +	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	spin_lock_init(&priv->lock);
> +	priv->context = dma_fence_context_alloc(1);
> +
> +	dmabuf = dma_buf_get(fd);
> +	if (IS_ERR(dmabuf)) {
> +		err = PTR_ERR(dmabuf);
> +		goto err_free_priv;
> +	}
> +
> +	attach = dma_buf_attach(dmabuf, indio_dev->dev.parent);
> +	if (IS_ERR(attach)) {
> +		err = PTR_ERR(attach);
> +		goto err_dmabuf_put;
> +	}
> +
> +	err = iio_dma_resv_lock(dmabuf, nonblock);
> +	if (err)
> +		goto err_dmabuf_detach;
> +
> +	priv->dir = buffer->direction == IIO_BUFFER_DIRECTION_IN
> +		? DMA_FROM_DEVICE : DMA_TO_DEVICE;
> +
> +	priv->sgt = dma_buf_map_attachment(attach, priv->dir);
> +	if (IS_ERR(priv->sgt)) {
> +		err = PTR_ERR(priv->sgt);
> +		dev_err(&indio_dev->dev, "Unable to map attachment: %d\n", err);
> +		goto err_resv_unlock;
> +	}
> +
> +	kref_init(&priv->ref);
> +	priv->buffer = buffer;
> +	priv->attach = attach;
> +	attach->importer_priv = priv;
> +
> +	priv->block = buffer->access->attach_dmabuf(buffer, attach);
> +	if (IS_ERR(priv->block)) {
> +		err = PTR_ERR(priv->block);
> +		goto err_dmabuf_unmap_attachment;
> +	}
> +
> +	dma_resv_unlock(dmabuf->resv);
> +

> +	mutex_lock(&buffer->dmabufs_mutex);
> +	list_add(&priv->entry, &buffer->dmabufs);
> +	mutex_unlock(&buffer->dmabufs_mutex);

Is it valid to attach the same dma_buf multiple times?

If not that code here should probably check that.

> +
> +	return 0;
> +
> +err_dmabuf_unmap_attachment:
> +	dma_buf_unmap_attachment(attach, priv->sgt, priv->dir);
> +err_resv_unlock:
> +	dma_resv_unlock(dmabuf->resv);
> +err_dmabuf_detach:
> +	dma_buf_detach(dmabuf, attach);
> +err_dmabuf_put:
> +	dma_buf_put(dmabuf);
> +err_free_priv:
> +	kfree(priv);
> +
> +	return err;
> +}
> +
> +static int iio_buffer_detach_dmabuf(struct iio_dev_buffer_pair *ib,
> +				    int *user_req, bool nonblock)
> +{
> +	struct iio_buffer *buffer = ib->buffer;
> +	struct iio_dev *indio_dev = ib->indio_dev;
> +	struct iio_dmabuf_priv *priv;
> +	struct dma_buf *dmabuf;
> +	int dmabuf_fd, ret = -EPERM;

ENOENT is more common to use when something can't be found I think, but 
perfectly up to you what you prefer.

> +
> +	if (copy_from_user(&dmabuf_fd, user_req, sizeof(dmabuf_fd)))
> +		return -EFAULT;
> +
> +	dmabuf = dma_buf_get(dmabuf_fd);
> +	if (IS_ERR(dmabuf))
> +		return PTR_ERR(dmabuf);
> +
> +	mutex_lock(&buffer->dmabufs_mutex);
> +
> +	list_for_each_entry(priv, &buffer->dmabufs, entry) {
> +		if (priv->attach->dev == indio_dev->dev.parent
> +		    && priv->attach->dmabuf == dmabuf) {
> +			list_del(&priv->entry);
> +
> +			/* Unref the reference from iio_buffer_attach_dmabuf() */
> +			iio_buffer_dmabuf_put(priv->attach);
> +			ret = 0;
> +			break;
> +		}
> +	}
> +
> +	mutex_unlock(&buffer->dmabufs_mutex);
> +	dma_buf_put(dmabuf);
> +
> +	return ret;
> +}
> +
> +static const char *
> +iio_buffer_dma_fence_get_driver_name(struct dma_fence *fence)
> +{
> +	return "iio";
> +}
> +
> +static void iio_buffer_dma_fence_release(struct dma_fence *fence)
> +{
> +	struct iio_dma_fence *iio_fence =
> +		container_of(fence, struct iio_dma_fence, base);
> +
> +	kfree(iio_fence);
> +}
> +
> +static const struct dma_fence_ops iio_buffer_dma_fence_ops = {
> +	.get_driver_name	= iio_buffer_dma_fence_get_driver_name,
> +	.get_timeline_name	= iio_buffer_dma_fence_get_driver_name,
> +	.release		= iio_buffer_dma_fence_release,
> +};
> +
> +static int iio_buffer_enqueue_dmabuf(struct iio_dev_buffer_pair *ib,
> +				     struct iio_dmabuf __user *iio_dmabuf_req,
> +				     bool nonblock)
> +{
> +	struct iio_buffer *buffer = ib->buffer;
> +	struct iio_dmabuf iio_dmabuf;
> +	struct dma_buf_attachment *attach;
> +	struct iio_dmabuf_priv *priv;
> +	struct iio_dma_fence *fence;
> +	struct dma_buf *dmabuf;
> +	unsigned long timeout;
> +	bool cookie, cyclic, dma_to_ram;
> +	long retl;
> +	u32 seqno;
> +	int ret;
> +
> +	if (copy_from_user(&iio_dmabuf, iio_dmabuf_req, sizeof(iio_dmabuf)))
> +		return -EFAULT;
> +
> +	if (iio_dmabuf.flags & ~IIO_BUFFER_DMABUF_SUPPORTED_FLAGS)
> +		return -EINVAL;
> +
> +	cyclic = iio_dmabuf.flags & IIO_BUFFER_DMABUF_CYCLIC;
> +
> +	/* Cyclic flag is only supported on output buffers */
> +	if (cyclic && buffer->direction != IIO_BUFFER_DIRECTION_OUT)
> +		return -EINVAL;
> +
> +	dmabuf = dma_buf_get(iio_dmabuf.fd);
> +	if (IS_ERR(dmabuf))
> +		return PTR_ERR(dmabuf);
> +
> +	if (!iio_dmabuf.bytes_used || iio_dmabuf.bytes_used > dmabuf->size) {
> +		ret = -EINVAL;
> +		goto err_dmabuf_put;
> +	}
> +
> +	attach = iio_buffer_find_attachment(ib, dmabuf, nonblock);
> +	if (IS_ERR(attach)) {
> +		ret = PTR_ERR(attach);
> +		goto err_dmabuf_put;
> +	}
> +
> +	priv = attach->importer_priv;
> +
> +	fence = kmalloc(sizeof(*fence), GFP_KERNEL);
> +	if (!fence) {
> +		ret = -ENOMEM;
> +		goto err_attachment_put;
> +	}
> +
> +	fence->priv = priv;
> +
> +	seqno = atomic_add_return(1, &priv->seqno);
> +
> +	/*
> +	 * The transfers are guaranteed to be processed in the order they are
> +	 * enqueued, so we can use a simple incrementing sequence number for
> +	 * the dma_fence.
> +	 */
> +	dma_fence_init(&fence->base, &iio_buffer_dma_fence_ops,
> +		       &priv->lock, priv->context, seqno);
> +
> +	ret = iio_dma_resv_lock(dmabuf, nonblock);
> +	if (ret)
> +		goto err_fence_put;
> +
> +	timeout = nonblock ? 0 : msecs_to_jiffies(DMABUF_ENQUEUE_TIMEOUT_MS);
> +
> +	/* Make sure we don't have writers */
> +	retl = dma_resv_wait_timeout(dmabuf->resv, DMA_RESV_USAGE_WRITE,
> +				     true, timeout);
> +	if (retl == 0)
> +		retl = -EBUSY;
> +	if (retl < 0) {
> +		ret = (int)retl;
> +		goto err_resv_unlock;
> +	}
> +
> +	dma_to_ram = buffer->direction == IIO_BUFFER_DIRECTION_IN;
> +
> +	if (dma_to_ram) {
> +		/*
> +		 * If we're writing to the DMABUF, make sure we don't have
> +		 * readers
> +		 */
> +		retl = dma_resv_wait_timeout(dmabuf->resv,
> +					     DMA_RESV_USAGE_READ, true,
> +					     timeout);
> +		if (retl == 0)
> +			retl = -EBUSY;
> +		if (retl < 0) {
> +			ret = (int)retl;
> +			goto err_resv_unlock;
> +		}
> +	}
> +
> +	if (buffer->access->lock_queue)
> +		buffer->access->lock_queue(buffer);
> +
> +	ret = dma_resv_reserve_fences(dmabuf->resv, 1);
> +	if (ret)
> +		goto err_queue_unlock;
> +
> +	dma_resv_add_fence(dmabuf->resv, &fence->base,
> +			   dma_resv_usage_rw(dma_to_ram));

That is incorrect use of the function dma_resv_usage_rw(). That function 
is for retrieving fences and not adding them.

See the function implementation and comments, when you use it like this 
you get exactly what you don't want.

Regards,
Christian.

> +	dma_resv_unlock(dmabuf->resv);
> +
> +	cookie = dma_fence_begin_signalling();
> +
> +	ret = buffer->access->enqueue_dmabuf(buffer, priv->block, &fence->base,
> +					     priv->sgt, iio_dmabuf.bytes_used,
> +					     cyclic);
> +	if (ret) {
> +		/*
> +		 * DMABUF enqueue failed, but we already added the fence.
> +		 * Signal the error through the fence completion mechanism.
> +		 */
> +		iio_buffer_signal_dmabuf_done(&fence->base, ret);
> +	}
> +
> +	if (buffer->access->unlock_queue)
> +		buffer->access->unlock_queue(buffer);
> +
> +	dma_fence_end_signalling(cookie);
> +	dma_buf_put(dmabuf);
> +
> +	return ret;
> +
> +err_queue_unlock:
> +	if (buffer->access->unlock_queue)
> +		buffer->access->unlock_queue(buffer);
> +err_resv_unlock:
> +	dma_resv_unlock(dmabuf->resv);
> +err_fence_put:
> +	dma_fence_put(&fence->base);
> +err_attachment_put:
> +	iio_buffer_dmabuf_put(attach);
> +err_dmabuf_put:
> +	dma_buf_put(dmabuf);
> +
> +	return ret;
> +}
> +
> +static void iio_buffer_cleanup(struct work_struct *work)
> +{
> +	struct iio_dma_fence *fence =
> +		container_of(work, struct iio_dma_fence, work);
> +	struct iio_dmabuf_priv *priv = fence->priv;
> +	struct dma_buf_attachment *attach = priv->attach;
> +
> +	dma_fence_put(&fence->base);
> +	iio_buffer_dmabuf_put(attach);
> +}
> +
> +void iio_buffer_signal_dmabuf_done(struct dma_fence *fence, int ret)
> +{
> +	struct iio_dma_fence *iio_fence =
> +		container_of(fence, struct iio_dma_fence, base);
> +	bool cookie = dma_fence_begin_signalling();
> +
> +	/*
> +	 * Get a reference to the fence, so that it's not freed as soon as
> +	 * it's signaled.
> +	 */
> +	dma_fence_get(fence);
> +
> +	fence->error = ret;
> +	dma_fence_signal(fence);
> +	dma_fence_end_signalling(cookie);
> +
> +	/*
> +	 * The fence will be unref'd in iio_buffer_cleanup.
> +	 * It can't be done here, as the unref functions might try to lock the
> +	 * resv object, which can deadlock.
> +	 */
> +	INIT_WORK(&iio_fence->work, iio_buffer_cleanup);
> +	schedule_work(&iio_fence->work);
> +}
> +EXPORT_SYMBOL_GPL(iio_buffer_signal_dmabuf_done);
> +
> +static long iio_buffer_chrdev_ioctl(struct file *filp,
> +				    unsigned int cmd, unsigned long arg)
> +{
> +	struct iio_dev_buffer_pair *ib = filp->private_data;
> +	void __user *_arg = (void __user *)arg;
> +	bool nonblock = filp->f_flags & O_NONBLOCK;
> +
> +	switch (cmd) {
> +	case IIO_BUFFER_DMABUF_ATTACH_IOCTL:
> +		return iio_buffer_attach_dmabuf(ib, _arg, nonblock);
> +	case IIO_BUFFER_DMABUF_DETACH_IOCTL:
> +		return iio_buffer_detach_dmabuf(ib, _arg, nonblock);
> +	case IIO_BUFFER_DMABUF_ENQUEUE_IOCTL:
> +		return iio_buffer_enqueue_dmabuf(ib, _arg, nonblock);
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
>   static const struct file_operations iio_buffer_chrdev_fileops = {
>   	.owner = THIS_MODULE,
>   	.llseek = noop_llseek,
>   	.read = iio_buffer_read,
>   	.write = iio_buffer_write,
> +	.unlocked_ioctl = iio_buffer_chrdev_ioctl,
> +	.compat_ioctl = compat_ptr_ioctl,
>   	.poll = iio_buffer_poll,
>   	.release = iio_buffer_chrdev_release,
>   };
> @@ -1953,6 +2414,7 @@ static void iio_buffer_release(struct kref *ref)
>   {
>   	struct iio_buffer *buffer = container_of(ref, struct iio_buffer, ref);
>   
> +	mutex_destroy(&buffer->dmabufs_mutex);
>   	buffer->access->release(buffer);
>   }
>   
> diff --git a/include/linux/iio/buffer_impl.h b/include/linux/iio/buffer_impl.h
> index 89c3fd7c29ca..f4b1147291e5 100644
> --- a/include/linux/iio/buffer_impl.h
> +++ b/include/linux/iio/buffer_impl.h
> @@ -9,8 +9,12 @@
>   #include <uapi/linux/iio/buffer.h>
>   #include <linux/iio/buffer.h>
>   
> +struct dma_buf_attachment;
> +struct dma_fence;
>   struct iio_dev;
> +struct iio_dma_buffer_block;
>   struct iio_buffer;
> +struct sg_table;
>   
>   /**
>    * INDIO_BUFFER_FLAG_FIXED_WATERMARK - Watermark level of the buffer can not be
> @@ -39,6 +43,13 @@ struct iio_buffer;
>    *                      device stops sampling. Calles are balanced with @enable.
>    * @release:		called when the last reference to the buffer is dropped,
>    *			should free all resources allocated by the buffer.
> + * @attach_dmabuf:	called from userspace via ioctl to attach one external
> + *			DMABUF.
> + * @detach_dmabuf:	called from userspace via ioctl to detach one previously
> + *			attached DMABUF.
> + * @enqueue_dmabuf:	called from userspace via ioctl to queue this DMABUF
> + *			object to this buffer. Requires a valid DMABUF fd, that
> + *			was previouly attached to this buffer.
>    * @modes:		Supported operating modes by this buffer type
>    * @flags:		A bitmask combination of INDIO_BUFFER_FLAG_*
>    *
> @@ -68,6 +79,17 @@ struct iio_buffer_access_funcs {
>   
>   	void (*release)(struct iio_buffer *buffer);
>   
> +	struct iio_dma_buffer_block * (*attach_dmabuf)(struct iio_buffer *buffer,
> +						       struct dma_buf_attachment *attach);
> +	void (*detach_dmabuf)(struct iio_buffer *buffer,
> +			      struct iio_dma_buffer_block *block);
> +	int (*enqueue_dmabuf)(struct iio_buffer *buffer,
> +			      struct iio_dma_buffer_block *block,
> +			      struct dma_fence *fence, struct sg_table *sgt,
> +			      size_t size, bool cyclic);
> +	void (*lock_queue)(struct iio_buffer *buffer);
> +	void (*unlock_queue)(struct iio_buffer *buffer);
> +
>   	unsigned int modes;
>   	unsigned int flags;
>   };
> @@ -136,6 +158,12 @@ struct iio_buffer {
>   
>   	/* @ref: Reference count of the buffer. */
>   	struct kref ref;
> +
> +	/* @dmabufs: List of DMABUF attachments */
> +	struct list_head dmabufs; /* P: dmabufs_mutex */
> +
> +	/* @dmabufs_mutex: Protects dmabufs */
> +	struct mutex dmabufs_mutex;
>   };
>   
>   /**
> @@ -156,9 +184,14 @@ int iio_update_buffers(struct iio_dev *indio_dev,
>    **/
>   void iio_buffer_init(struct iio_buffer *buffer);
>   
> +void iio_buffer_dmabuf_get(struct dma_buf_attachment *attach);
> +void iio_buffer_dmabuf_put(struct dma_buf_attachment *attach);
> +
>   struct iio_buffer *iio_buffer_get(struct iio_buffer *buffer);
>   void iio_buffer_put(struct iio_buffer *buffer);
>   
> +void iio_buffer_signal_dmabuf_done(struct dma_fence *fence, int ret);
> +
>   #else /* CONFIG_IIO_BUFFER */
>   
>   static inline void iio_buffer_get(struct iio_buffer *buffer) {}
> diff --git a/include/uapi/linux/iio/buffer.h b/include/uapi/linux/iio/buffer.h
> index 13939032b3f6..c666aa95e532 100644
> --- a/include/uapi/linux/iio/buffer.h
> +++ b/include/uapi/linux/iio/buffer.h
> @@ -5,6 +5,28 @@
>   #ifndef _UAPI_IIO_BUFFER_H_
>   #define _UAPI_IIO_BUFFER_H_
>   
> +#include <linux/types.h>
> +
> +/* Flags for iio_dmabuf.flags */
> +#define IIO_BUFFER_DMABUF_CYCLIC		(1 << 0)
> +#define IIO_BUFFER_DMABUF_SUPPORTED_FLAGS	0x00000001
> +
> +/**
> + * struct iio_dmabuf - Descriptor for a single IIO DMABUF object
> + * @fd:		file descriptor of the DMABUF object
> + * @flags:	one or more IIO_BUFFER_DMABUF_* flags
> + * @bytes_used:	number of bytes used in this DMABUF for the data transfer.
> + *		Should generally be set to the DMABUF's size.
> + */
> +struct iio_dmabuf {
> +	__u32 fd;
> +	__u32 flags;
> +	__u64 bytes_used;
> +};
> +
>   #define IIO_BUFFER_GET_FD_IOCTL			_IOWR('i', 0x91, int)
> +#define IIO_BUFFER_DMABUF_ATTACH_IOCTL		_IOW('i', 0x92, int)
> +#define IIO_BUFFER_DMABUF_DETACH_IOCTL		_IOW('i', 0x93, int)
> +#define IIO_BUFFER_DMABUF_ENQUEUE_IOCTL		_IOW('i', 0x94, struct iio_dmabuf)
>   
>   #endif /* _UAPI_IIO_BUFFER_H_ */
>

