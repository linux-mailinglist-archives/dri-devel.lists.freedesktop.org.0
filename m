Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E8E6B926E
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 12:59:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8883610E78C;
	Tue, 14 Mar 2023 11:59:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20627.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::627])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 326E510E797
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 11:59:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kM1Dk4YORMS4+boq5fx5c3U5sPGumrfyPJpsG0jtcL0YTTjBRSkSLVRExp4OgR2xbus3nazJi8mwHd7hCi12tknxkbh7qrCp3+eVrBOb3QzE9LjOsiOE/iBro+uqRI+4fhUEDYs/Ii57n59nPAjb9aMJy21bj20ZKqsKh8iQw0oWpQJF+eXNiGFTbXfVKDbeZlx6v3sEdUXCP2Ljg/92nPhz9bzaJhzslUcJhL4aX2I6i0BfttbKUA7/pc/D5sMya+XkYRusXY5VFuGF90MOTRN6zoSzAfxrdGSVaCpYNrHzD3sdsZ0e4ukJzC6GVJ63IH/ukF2BlGj0nckYVqr5Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qhVJSI/qi4/kLOB2+GwdSkwIkMbpb2sAbXVqTtoU3+w=;
 b=RZHLb2OJsQItkMYPsJ8RM6EgFYfkdb25JBeuXs0OGc4jUhG0pFUVox+UC1OBTw4XBTUb7CnEENIpvE+uhcS5pM+Vi/vJoz9cC4HANAyvl19ZN1AFeDuuXMJh56ShOPnPXaGRLlecDMp40Gs/OzKaSbxctNsNBG/jKenZdWcQUy8R/hkLZ1stUUiC6QpRT3vEkdEMKYAtqd7JUcS2Sb6hklAjZOsmIHgR4lCxb+HHAIM0tsMgbWIWZREs4zHIiF9YotvRbDGV97URyuu1lyOpzhdESYyVcsgdeF4sNSCbsP/7BsKo4k/w4t8Yesd2pyrFyHxnCmPmChOOAGNskISTTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qhVJSI/qi4/kLOB2+GwdSkwIkMbpb2sAbXVqTtoU3+w=;
 b=tHk9DSAI/QVsDSN6nVugw9sscPYolF5n9K5OcPszkSA893roKL3hPltkdAz2Pkav8wISjq4vVD6vflgpiGufMpHQ7jzFjqURVYZuohtIlglXwtDy2rbe62DvYK0e/qPm1QyWjG2MHIZMqPrCT6bVXeee7y8pwEqCxQgNM7zfLyQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DS0PR12MB8217.namprd12.prod.outlook.com (2603:10b6:8:f1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Tue, 14 Mar
 2023 11:59:46 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918%4]) with mapi id 15.20.6178.024; Tue, 14 Mar 2023
 11:59:46 +0000
Message-ID: <0f81dac5-a0bb-9881-d418-85b2cb59b615@amd.com>
Date: Tue, 14 Mar 2023 12:59:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/2] usb: gadget: functionfs: Add DMABUF import interface
Content-Language: en-US
To: Paul Cercueil <paul@crapouillou.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sumit Semwal <sumit.semwal@linaro.org>
References: <20230314105257.17345-1-paul@crapouillou.net>
 <20230314105257.17345-3-paul@crapouillou.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230314105257.17345-3-paul@crapouillou.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0093.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::13) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DS0PR12MB8217:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fc2defa-853a-48fb-94f4-08db24839abc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 97kl/IrUyWSHpmNcvV/+TBxXdb4i+bmIRwbGS6RVQfwPxe6Qc5EMEgwNCLzY+s+YKkhhmpadm4BSGxSXzZM2HAlS8mSDI6ARLUCHkM9LvnA+AAZaJEoMjQGtyW2diE3sLWq2gzi2aTaog0cWayLI9X6jn1N6MHgrlFPorrMAFgq8o0Z96sGpcqAlU+0jh09KN4HAwzv9EsOmqOgbZGySwiC4jAAmMFcHEtcmn3w8H5bTmYPnrHBqprIDwure/B3CzXSP7ItsuzK5WR+fW9fr9QUi/OEvCIO8eVMfTNuwngnHMohpPzZoUJOAaiS5B6tSEYqYL2DP3vrPT2saIs9rQ/J2gOEaG198im27xp+YBtEI/P2gAMtbyxi7JyM/DK7sFw2HcR9SA7l4L8qxD9pkw+XiDU+L5a7kkywp9RTmCeX/ldjLxhWpacCgiBV5J/yCiAGzO05sqWcvUQeBttv9jZjK9J5pbTYDmRSH7Ia1YCgITCX6P5jnIRQ0Ye6tAQDpQln2y/uq4GuoSvP3riuS4u+c9O7FOZFYYfy6KAu9JiUh+ML6nKDThqkMx1edSe2Ns/DPFW/5Yr+YbVa26R1WGq0/LESn9k6gVBBOU7yxPM7KEwXbB+ohlDdBU+EB/4JVn9T/LOdoHTZOlD8wYlNO170hrXZT9mhUsF6QsqFfJ9zexKphbE4GOFa0EsXwyk0i2Y9fiiHubZe6WqxSh86gve6cwW+/SSFwVQdy7it70KY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(396003)(136003)(366004)(346002)(376002)(451199018)(86362001)(36756003)(38100700002)(31696002)(2906002)(7416002)(30864003)(41300700001)(8936002)(5660300002)(4326008)(6512007)(2616005)(186003)(26005)(6506007)(83380400001)(316002)(110136005)(8676002)(66556008)(66476007)(66946007)(6666004)(6486002)(478600001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0NxNXd3N0hIWWNUeUZUVllYd3ZUWFppbm00VmZLbEdzQWZoOW1yVnAwbTdh?=
 =?utf-8?B?S3ZyVFFnNDdscGdKMHdKREowR3ROK2pkV01VMkpUSVlicnc5RWY3R1Mra2RE?=
 =?utf-8?B?eCs2b0NRM05HdDhWSi9GYnRTNUp3M3AyZkdzb1NKa2pWTlJtWDlxaHV2Vzdi?=
 =?utf-8?B?VmVXS1I2WS83MjRJQ2RrSnpsVnR5ZXozaWJZbndVSC9vNitJU0pPUStGYW1m?=
 =?utf-8?B?UHVtUU14ZDJtU1R5MXBiVXZBL2ZDcGhUeTBjY3hFUmMyS2tPbFNxQW9mVDJN?=
 =?utf-8?B?VXBqcFpZT0N5UDd6aWhMMnFQbldrRHFtaTV1V3dIVnJ4S2k1SERjTXNLanBz?=
 =?utf-8?B?Y01jZzJBeE4wSHJhWmRaL2hIRmJkdXNZSXUvUUhhcE4zZC9MUk45b0Y4MFB2?=
 =?utf-8?B?Qmw4TzN3QnJyZTl3RXd5c0R0TWRTT3pZbTcxeGViWGpsRHFLWVllMGw4cUxK?=
 =?utf-8?B?RmVkM04vMHZ3YmYyK0hEcGVlQjBOcFp1cTkrYk44Tk5PeVYzOG5VcjhpYU1X?=
 =?utf-8?B?NjJ4bzA2b3plK21RWVR2KzVNcGx6Vnl6MC9sVys0V0VSOEE4bUpHcS9JZWhh?=
 =?utf-8?B?U3hBV2NXNUdLclM0aU5KZlBiaTdrWFphZ2VQcG10ZnlYRG9NQktzSTYveHJy?=
 =?utf-8?B?S3lnTzRRd1loY3RPTHRzeFdkWEQxdXJybTJyUnFwWDhCRkJpMXJoRzgyMHlL?=
 =?utf-8?B?Y0dFRDB2RE9KekpzWURJWkNRVXZlNitseFJzMlVMSTVpaXo5NXl2K0JyRkxG?=
 =?utf-8?B?VkVjRnduV3FRWW9lUGJPdTFwS054V1I0ZlRjTnAyVWpSZGVpWktSc1BYVmRT?=
 =?utf-8?B?Zng2S0g3OFgzVzUxcnlNOXdxeW1DNkVtTWlKNVpXdGdtYkRxanBoZmFlZFMy?=
 =?utf-8?B?SHMyWHdyQmxiYUFzYmQ0TDBUeDBjR1E1clFoNDNOcFpZNCtLdzV3SjBMVjFp?=
 =?utf-8?B?LzR5MDRpMEtnQmlicUxUeFNQcTY2QTNnVHFKbFRhY1VSeTQ2TmsyOWx3bGVT?=
 =?utf-8?B?aWY4KzBjbExsK3BoZHR0TFQ4dTJwM1BrejhIbHlVZ3NWeHhIVXBRMDlid3BP?=
 =?utf-8?B?UWRRZ3E4YjYzUS9DLzM4RzczUjFxRXRqRDFWY3g5RUJubzgrQVpQWFJ1aFQx?=
 =?utf-8?B?enhkd0JyTDdBeDlmaHQzcWFTT2dTcVJLVWpWQlgvVkMybVRiYXRPU1JZRTMw?=
 =?utf-8?B?TnFyRDQ2bjZHK2dITHl2aGVwZ3BXQ0MyMnVSc1JkWHFXUmtreEh5NklqdUJ0?=
 =?utf-8?B?ZDBPUG5GZ1ZzWDhuM2tYMUVXWGNNc1A0K25xdVJRTHJwOG9iY3FmREFiRllt?=
 =?utf-8?B?M0VTenlIcmF2MjN1a3ByZ2thSzdDdkFrR3dWaWx1Y2NWUnRwUC9SSDN6Q1ZV?=
 =?utf-8?B?NERrc1JrTVJVb1JKeFJTR0trOUV0NzN1MFgrdVNROEJCZ0xLWlppNmQzSGla?=
 =?utf-8?B?YWRyR21Damdpem9RUFFTUTc0QlNPendac3BMNFlWeG1CREcrUDNaa3VCY0Ey?=
 =?utf-8?B?R05XVHNacUh4Ujh2b1ZwRE52RlVlV0U3aXlFWDlOamRWd0NZaWZzeWd4WEpG?=
 =?utf-8?B?d0MrVEQ5OGc0dWxaOGw2YXM5TVpnaS9CTUUxdmJNTXB2ZGhQeFE2bU1lVzdN?=
 =?utf-8?B?KzhhZ1F3RUdBOWY5cWE0M1Y4OFVtb1NjTkovTVk4TXRDMC9MeFBQMFNWL2lG?=
 =?utf-8?B?NktJei9KcG1tQW51ZkhNQWxnN1FLZlN2WmdtU2dGRG81cEZFdjQ4YkFqaGdn?=
 =?utf-8?B?a0R2eVNZVzJ5SXdjYmlsU09PMCtZbmw2ZVRUcTBOaXA0TWlaOVgxRCtBcUFZ?=
 =?utf-8?B?QnN4SkYzVFZ3MUdkRHFuTk5nR3NsSGh2QVo5RExvVkM2YTdiRCtvczBLNkFY?=
 =?utf-8?B?WWZWYkN3WkRnSSs5WlBtVVhQWnE1ODZIMlhNVFBxV0QvblQ1REFjeWh3cXY1?=
 =?utf-8?B?NWN3dGE1TXE0MUJ2cnNxVzhlZ3lVNlQ5U0NwSFhzRVpYYXBJRVdCNDdWaWNt?=
 =?utf-8?B?VlcyeHQxZ2hQMnlDMVpITFBGVTF3bDMrb1pvR29STjdaemtYenR5c0JNVENi?=
 =?utf-8?B?MVkzcmxwb3JjZ1VudDJNemxwcWJZRHdUcFB0U1RJVGx3QXpOYnhOSTV0VlQ4?=
 =?utf-8?Q?L6TO713AtJH7QqSKiIDSCdv/e?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fc2defa-853a-48fb-94f4-08db24839abc
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 11:59:46.0766 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bs2rf00qRfOnKlfAVl7zvSg+KqhpG/V0Q2+6oKBMYpnkPDhr+/TSVveEH4e0fINt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8217
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
Cc: michael.hennerich@analog.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nuno.sa@analog.com, linaro-mm-sig@lists.linaro.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 14.03.23 um 11:52 schrieb Paul Cercueil:
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
> ---
>   drivers/usb/gadget/function/f_fs.c  | 398 ++++++++++++++++++++++++++++
>   include/uapi/linux/usb/functionfs.h |  14 +-
>   2 files changed, 411 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> index ddfc537c7526..365fb716f0ad 100644
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
> @@ -124,6 +127,26 @@ struct ffs_ep {
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
> +static inline struct ffs_dma_fence *to_ffs_dma_fence(struct dma_fence *fence)
> +{
> +	return container_of(fence, struct ffs_dma_fence, base);
> +}
> +
>   struct ffs_epfile {
>   	/* Protects ep->ep and ep->req. */
>   	struct mutex			mutex;
> @@ -197,6 +220,8 @@ struct ffs_epfile {
>   	unsigned char			isoc;	/* P: ffs->eps_lock */
>   
>   	unsigned char			_pad;
> +
> +	struct list_head		dmabufs;
>   };
>   
>   struct ffs_buffer {
> @@ -1279,19 +1304,354 @@ static ssize_t ffs_epfile_read_iter(struct kiocb *kiocb, struct iov_iter *to)
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
>   
>   	ENTER();
>   
> +	/* Close all attached DMABUFs */
> +	list_for_each_entry_safe(priv, tmp, &epfile->dmabufs, entry) {
> +		ffs_dmabuf_put(priv->attach);
> +	}
> +
>   	__ffs_epfile_read_buffer_free(epfile);
>   	ffs_data_closed(epfile->ffs);
>   
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
> +	ENTER();
> +
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
> +	struct ffs_dma_fence *dma_fence = to_ffs_dma_fence(fence);
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
> +int ffs_dma_resv_lock(struct dma_buf *dmabuf, bool nonblock)
> +{
> +	int ret;
> +
> +	ret = dma_resv_lock_interruptible(dmabuf->resv, NULL);
> +	if (ret) {
> +		if (ret != -EDEADLK)
> +			goto out;
> +		if (nonblock) {
> +			ret = -EBUSY;
> +			goto out;
> +		}
> +
> +		ret = dma_resv_lock_slow_interruptible(dmabuf->resv, NULL);
> +	}
> +
> +out:
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
> +	ffs_dmabuf_put(attach);
> +	ffs_dmabuf_put(attach);
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
> +	struct ffs_ep *ep = epfile->ep;
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
> +	fence = kmalloc(sizeof(*fence), GFP_KERNEL);
> +	if (!fence) {
> +		ret = -ENOMEM;
> +		goto err_unmap_attachment;
> +	}
> +
> +	fence->sgt = sg_table;
> +	fence->dir = dir;
> +	fence->priv = priv;
> +
> +	dma_fence_init(&fence->base, &ffs_dmabuf_fence_ops,
> +		       &priv->lock, priv->context, 0);

Sequence numbers must be unique, so constantly using 0 here is quite 
questionable.

If you set the use_64bit_seqno flag in your fence ops structure you can 
simply use a 64bit counter.

> +
> +	usb_req = usb_ep_alloc_request(ep->ep, GFP_ATOMIC);
> +	if (!usb_req) {
> +		ret = -ENOMEM;
> +		goto err_fence_put;
> +	}
> +
> +	ret = ffs_dma_resv_lock(dmabuf, nonblock);
> +	if (ret)
> +		goto err_free_request;
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

A dma_fence should only be published if nothing can go wrong with the 
request any more.

You are doing that correctly here, but it is good practice that you also 
don't allocate and initialize the fence before you publish it.

In other words reorder this and move the allocation and call to 
dma_fence_init() here if possible.

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

Already using GFP_ATOMIC gets you a lot of bonus points for this patch 
:) Background is that as soon as you have published a fence you can't 
use GFP_KERNEL that easily any more because that memory allocation might 
wait for the fence.

But even better would be to try to avoid memory allocation in the 
critical code path altogether. Would it be possible to call this 
function with the dma_resv_lock held?

Regards,
Christian.


> +	if (ret) {
> +		pr_warn("FFS: Failed to queue DMABUF: %d\n", ret);
> +		ffs_dmabuf_signal_done(fence, ret);
> +		usb_ep_free_request(ep->ep, usb_req);
> +	}
> +
> +	dma_buf_put(dmabuf);
> +
> +	return ret;
> +
> +err_resv_unlock:
> +	dma_resv_unlock(dmabuf->resv);
> +err_free_request:
> +	usb_ep_free_request(ep->ep, usb_req);
> +err_fence_put:
> +	dma_fence_put(&fence->base);
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
> @@ -1364,8 +1724,45 @@ static long ffs_epfile_ioctl(struct file *file, unsigned code,
>   			ret = -EFAULT;
>   		return ret;
>   	}
> +	case FUNCTIONFS_DMABUF_ATTACH:
> +	{
> +		int fd;
> +
> +		if (copy_from_user(&fd, (void __user *)value, sizeof(fd))) {
> +			ret = -EFAULT;
> +			break;
> +		}
> +
> +		ret = ffs_dmabuf_attach(file, fd);
> +		break;
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
> +		ret = ffs_dmabuf_detach(file, fd);
> +		break;
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
> +		ret = ffs_dmabuf_transfer(file, &req);
> +		break;
> +	}
>   	default:
>   		ret = -ENOTTY;
> +		break;
>   	}
>   	spin_unlock_irq(&epfile->ffs->eps_lock);
>   
> @@ -1925,6 +2322,7 @@ static int ffs_epfiles_create(struct ffs_data *ffs)
>   	for (i = 1; i <= count; ++i, ++epfile) {
>   		epfile->ffs = ffs;
>   		mutex_init(&epfile->mutex);
> +		INIT_LIST_HEAD(&epfile->dmabufs);
>   		if (ffs->user_flags & FUNCTIONFS_VIRTUAL_ADDR)
>   			sprintf(epfile->name, "ep%02x", ffs->eps_addrmap[i]);
>   		else
> diff --git a/include/uapi/linux/usb/functionfs.h b/include/uapi/linux/usb/functionfs.h
> index d77ee6b65328..1412ab9f8ccc 100644
> --- a/include/uapi/linux/usb/functionfs.h
> +++ b/include/uapi/linux/usb/functionfs.h
> @@ -84,6 +84,15 @@ struct usb_ext_prop_desc {
>   	__le16	wPropertyNameLength;
>   } __attribute__((packed));
>   
> +/* Flags for usb_ffs_dmabuf_transfer_req->flags (none for now) */
> +#define USB_FFS_DMABUF_TRANSFER_MASK	0x0
> +
> +struct usb_ffs_dmabuf_transfer_req {
> +	int fd;
> +	__u32 flags;
> +	__u64 length;
> +} __attribute__((packed));
> +
>   #ifndef __KERNEL__
>   
>   /*
> @@ -288,6 +297,9 @@ struct usb_functionfs_event {
>   #define	FUNCTIONFS_ENDPOINT_DESC	_IOR('g', 130, \
>   					     struct usb_endpoint_descriptor)
>   
> -
> +#define FUNCTIONFS_DMABUF_ATTACH	_IOW('g', 131, int)
> +#define FUNCTIONFS_DMABUF_DETACH	_IOW('g', 132, int)
> +#define FUNCTIONFS_DMABUF_TRANSFER	_IOW('g', 133, \
> +					     struct usb_ffs_dmabuf_transfer_req)
>   
>   #endif /* _UAPI__LINUX_FUNCTIONFS_H__ */

