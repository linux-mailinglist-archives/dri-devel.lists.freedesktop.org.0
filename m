Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A19419200
	for <lists+dri-devel@lfdr.de>; Mon, 27 Sep 2021 12:09:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D2AF89C84;
	Mon, 27 Sep 2021 10:08:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2084.outbound.protection.outlook.com [40.107.101.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A3E689CDF
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Sep 2021 10:08:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j8YG+Ks8NltYRxNaCwBoyZqyldRNf+KxwyEzkjGlJPCBmVxR/agr1/kJFW+eaLXHOHragfOMEhGj31zbuAzJso/1nbBjfDMDIJcft3Nyqrz1slaMUPpmjIcGjNbvr0Ub0hBwx6hJEAu3VY3VXqlTDUC6PnUGPXahx9iHpb0NJDb9SvV15LFnLEyHCESxDJheBmOcTBeSGRHgxLhr2jIsok7wNHQ1dS/+pXCEaXHMgKgiOWHuUKjpaQE96Wc9AGHc17H9XbtDT9oD1E/GsBGu+9kwNg2nxI12xm5b+UiKX7wNWOXADsD5jiuodHmYqyPSg7jm3xQm+GsSF1S+Rc+iBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=5HHJYK6IoKK7V9U5qbvtq7fri9mik45678zQK5D2H60=;
 b=B5FoXzc524M11UBEtdB89ijb8srPJQGCLbM3C1YuREtBMF85HDdjv+egjnX0Cf+2VVMsetoMz868p4U0JxcmbIAhBDYqurAesIwjBIQjaBcaoxGQjicuelzB9xFskNNtd1nYDQSI0MWa+2rAN1VgIhTVqDXELe5WbPl3mFosncVne8BQMfSGQujuQb+ppzJ24X0BIB+DJ3aZ3pAhbMB2QGa0nmWXKswKBaH4RRkDJ/2bfMEgz9mHZ1BeZnE5n/PZ1GTG94cVv7znLDeTAFRLtRtVZTgtVga+wq1d23ulzEuk0ApVeZYGPrke55AxCjKhx1ftySzsHSaoSC113BqKBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5HHJYK6IoKK7V9U5qbvtq7fri9mik45678zQK5D2H60=;
 b=ujqK2oyWjRnc93LlBJYmm3TYzqzzTCMLnZ2ejmILVQ0Sf+dqI4o6XldFqUbTVdftrNZ25DVvV2idOyBkhDm7wksMm1bhkiTp70mjfVvJzGNc3fziU1MDnQeS+XBJSNuR9EWw19NKJc1hh2SBeeebHa/CdpYiyWUq9n0YhlcPxZs=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR12MB1216.namprd12.prod.outlook.com
 (2603:10b6:300:10::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.18; Mon, 27 Sep
 2021 10:08:53 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a%10]) with mapi id 15.20.4544.021; Mon, 27 Sep
 2021 10:08:53 +0000
Subject: Re: [PATCH] dma-buf: move dma-buf symbols into the DMA_BUF module
 namespace
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Alex Deucher <alexander.deucher@amd.com>, "Pan, Xinhui"
 <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <YU8oVDFoeD5YYeDT@kroah.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <18108ec3-550f-be65-7fe6-655444b7f75b@amd.com>
Date: Mon, 27 Sep 2021 12:08:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <YU8oVDFoeD5YYeDT@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: FR0P281CA0014.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::19) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [192.168.178.21] (91.14.161.181) by
 FR0P281CA0014.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:15::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.7 via Frontend Transport; Mon, 27 Sep 2021 10:08:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 60cbe865-dab0-457c-0749-08d9819ecf36
X-MS-TrafficTypeDiagnostic: MWHPR12MB1216:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR12MB1216309124B96C21F3D7E41A83A79@MWHPR12MB1216.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JoKPFZ1kOC4jaN7jxLgMA0Knt7xxxVM2xWK87p6J6dAjQoxGfn0Wcr1sdx7A4JwT88y8vE4g35E3bNFLvwjQOz9YumNN33CdeYOUF2CKGMM6q5SWmzinaC+px2esb7rx64StyzNjHtKXP8ri8X6uPvQwGLGJgNu2yrEmeT6a10McMsdWAvKA0GgNMkXQoPZFdXO9ldcWRDRKKKmb5aw9E0+SbEwC+IuXKk3SO2lwP10TCu1sV9Zvb9TX7R0Kt4XUfST74BmCtDu3Ow5ZYpH7HZaewbstjsLwGs1706FsCACWZ3NnM/7EFScAVw4KiMOY2HZneeWsqR4RkEy8iRZvZV9pHY8zrzmknwmGnEoSw0ICYqWFMUj3bRy8KD7La46hycQi4KVJe9IUfk+RgO1giQ+nJ/ky1uvTCZKWYJwF2rnkNGVKHgZJxPuA83uzmsY93bWRbka2LzbucVoaVNMGhP7QJO8BdwMcAySNe+fhalB7gyUHcDf588sp4DhTrXke9oeZWvbK8RagB4s9SILdPbsOj0YkYWCySJVP+huF2N/TdD31WL4bHOp4/R4PckIThVm0Vs5DylIHhgnDij93U2H4JjWaW04oHplVfKcJqSE1s4xtUffIOZVLPPM9T8iD5x+IgU4M4Hloz2fLBLdC1gBmdRBej6yS5ZyZwA4XmymNjWciAHIWgXh/9aHInFXxT2vMjGSr5DGmkni/r41KyKksStlDEHHGArtfV8jx6vEa38M7yj/BDJj+NT5OYUum
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(16576012)(8676002)(31686004)(316002)(30864003)(5660300002)(7416002)(36756003)(66946007)(2906002)(6666004)(26005)(54906003)(66556008)(8936002)(186003)(31696002)(4326008)(86362001)(110136005)(66574015)(508600001)(38100700002)(2616005)(83380400001)(956004)(66476007)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1NWQndCbkxjdDlSKzY4YWNabE1TNFFsRVh5TlM1NStnUW4xd09UaUMvc2U0?=
 =?utf-8?B?NEFtZUhJODZTM2doY01xS3lKYVhLZkcvcFlZdEZQUkJGVjlPSW5iWDN4eW84?=
 =?utf-8?B?eG5sSUowTjM1ckpzMmY4bGI0bTZTcXRjTVREd2J1NFpiL2RHV1R4WS9hQVl1?=
 =?utf-8?B?eHdidjFjUmlYcTg0cHVuRnJzNWljRDNieHdMQmNkM2RVeGtvVmZZUDVHbm5D?=
 =?utf-8?B?eXBRWitHZWFiYzd2M1liOG1BKzlqSXdZeCs4Q3FPMU1mYUpvakdBN3V1NUhB?=
 =?utf-8?B?WFg0bEdqdXJnWjhkZjNTR00yY1BzZVVFaThCekNoTjhKM1BsU3BqOHhBY2FW?=
 =?utf-8?B?OWVkOWdsNUNBSm1veHNWaUFYWFFXT0laYlE4VU50eWJKd1oxOFoySUFQbzh1?=
 =?utf-8?B?Tnp1OGNyUlk1RFE4VXhoR1JlM1hRcUVhQlhpZjE2cUl5VjRzalBXdkFXQ3hk?=
 =?utf-8?B?SGxtTHpEMVpwU2lhS1pTalRQZk5kREFXSmZkSnRGNE1oblpnNXUrYjR5aVJY?=
 =?utf-8?B?NzV3VlZ1R3kycDlvMFJhMWxDSlBadm1hWE5jd2s5dWZKSXM3anAxMmhPU1hR?=
 =?utf-8?B?UFRISlZuMjZPaXV4bFByYm16VGRXUzZBSW5UUWRLd2txVUVmaG41K3FzSXR4?=
 =?utf-8?B?VUsvOEVzclFUMFZwZzl0UEswcUY1VTN3UFVmcDg0SklTMXlwY3ZLNnV2NUhG?=
 =?utf-8?B?cG9COTlMZUhmcTFxTG5vTm1jUmdoUHRKaVo2aUI4aFdZdkF6MXlkSHkzeHh1?=
 =?utf-8?B?bVdhbXl1K0ltS1cvSFg2NEhlVXhtVTVCOGxuLzc0S2ZiRTBYQW5vUkRxbFF1?=
 =?utf-8?B?QWRNbUgzZjV0NDNqaVluVk1sMHRoRFUzZ3A2UW9QdmpsQ1duK1JpcWxTNGlM?=
 =?utf-8?B?emtaYk1xVG5mTTRuaHRON3hrNUtTT25xTlB3YVU2Kzc1ak45Qm5CWU1rNXlS?=
 =?utf-8?B?V1FqSGpJbzRvWUF1ekorSGlCdzNTOHI0am1MaVJmQ0ttQjFnWU5iaG9XVFZ1?=
 =?utf-8?B?SGpyck42azAyeGpLUVZIQm1oQzdPNC9tcUNSWHEvL0NvcE12dUp3bFY4ckF5?=
 =?utf-8?B?ZFVNZHYvUnBIOTJ3QVRGNStvUTJhUm14UGNuZG9qRFFPdUhMUG8wNXMzQTVx?=
 =?utf-8?B?N3RRMVNHNkREYU1Tcm5TR1RhV1pDSFc4ODBCN25qY3dUMTA2Y3lMVFRuNnRu?=
 =?utf-8?B?TEExT1hSRFNJS3FQbkJJY3RKdEJNR0NMZDZEc0wzZzY3WG1RaGtVbDU5NUJp?=
 =?utf-8?B?UzYvTmtuK3FzRkt3amsyN1dXVDdEaFpZTThBa3FuNXJTTlYvb25vUzZCcmVi?=
 =?utf-8?B?OXUxdFpPM3ZSdjBEK01UZGJjQk9XRjVmYU9ZYXRrNTRMaEswZDVsVHkyUlV3?=
 =?utf-8?B?cWRTK0swQjFkeEtsTFhpMEFaT2ZlcEFjaHN4clpDRk9zY2Z6VkJlYlJMQk5R?=
 =?utf-8?B?Rys2bGVsU1BWSy80MGNRRkFTUHNEK1hhVUFFTXBudTZvTHNSZFV1NUtuVzE5?=
 =?utf-8?B?cDVoZm8vVEZ5M0c2Ui9TRVIydEsvRFl2Q0JMNzc4WXFjaHh3bWhic09GNnpC?=
 =?utf-8?B?L1E3Uk1GSlZZU1orQ29QOFZMVmxwUzYrZ2tjZ0JiTnNQbTRrNGhSbGdEVmdQ?=
 =?utf-8?B?SkpGTitaRHhiRXcxWVNsYmZrZGluU0VzREpOL21oU1ExVFpzU1BoYSswWSsz?=
 =?utf-8?B?UXoxajZRN21zRUpWaU4vcWIyVFU4U011WnZ4OVZGdFl0V2l0R0lNa0F2b2xL?=
 =?utf-8?Q?rPy1B3nnrRp30m6XmxOVidjjfandlWr6dKKDssM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60cbe865-dab0-457c-0749-08d9819ecf36
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2021 10:08:53.2595 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WWwVY5VITolPZc1fYwpllnQf6PnOCBgROFGf5ObN+BBCW5gsnE1SC3rnCPUKE0aR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1216
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

Am 25.09.21 um 15:47 schrieb Greg Kroah-Hartman:
> In order to better track where in the kernel the dma-buf code is used,
> put the symbols in the namespace DMA_BUF and modify all users of the
> symbols to properly import the namespace to not break the build at the
> same time.
>
> Now the output of modinfo shows the use of these symbols, making it
> easier to watch for users over time:
>
> $ modinfo drivers/misc/fastrpc.ko | grep import
> import_ns:      DMA_BUF
>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Acked-by: Christian König <christian.koenig@amd.com>

> ---
>
> The topic of dma-buf came up in the Maintainer's summit yesterday, and
> one comment was to put the symbols in their own module namespace, to
> make it easier to notice and track who was using them.  This patch does
> so, and finds some "interesting" users of the api already in the tree.
>
> Only test-built on x86 allmodconfig, don't know what other arches will
> pick up, will let 0-day run on it for a bit...
>
> Comments?
>
>
>
>   drivers/dma-buf/dma-buf.c                     | 34 +++++++++----------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       |  3 ++
>   drivers/gpu/drm/drm_gem_framebuffer_helper.c  |  3 ++
>   drivers/gpu/drm/drm_prime.c                   |  3 ++
>   drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c   |  3 ++
>   drivers/gpu/drm/exynos/exynos_drm_gem.c       |  3 ++
>   drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |  3 ++
>   drivers/gpu/drm/tegra/gem.c                   |  3 ++
>   drivers/gpu/drm/vmwgfx/ttm_object.c           |  3 ++
>   drivers/infiniband/core/umem_dmabuf.c         |  3 ++
>   .../media/common/videobuf2/videobuf2-core.c   |  1 +
>   .../common/videobuf2/videobuf2-dma-contig.c   |  1 +
>   .../media/common/videobuf2/videobuf2-dma-sg.c |  1 +
>   .../common/videobuf2/videobuf2-vmalloc.c      |  1 +
>   drivers/misc/fastrpc.c                        |  1 +
>   .../staging/media/tegra-vde/dmabuf-cache.c    |  3 ++
>   drivers/tee/tee_shm.c                         |  3 ++
>   drivers/virtio/virtio_dma_buf.c               |  1 +
>   drivers/xen/gntdev-dmabuf.c                   |  3 ++
>   samples/vfio-mdev/mbochs.c                    |  1 +
>   20 files changed, 60 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 63d32261b63f..6c2b5ea828a6 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -610,7 +610,7 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
>   	module_put(exp_info->owner);
>   	return ERR_PTR(ret);
>   }
> -EXPORT_SYMBOL_GPL(dma_buf_export);
> +EXPORT_SYMBOL_NS_GPL(dma_buf_export, DMA_BUF);
>   
>   /**
>    * dma_buf_fd - returns a file descriptor for the given struct dma_buf
> @@ -634,7 +634,7 @@ int dma_buf_fd(struct dma_buf *dmabuf, int flags)
>   
>   	return fd;
>   }
> -EXPORT_SYMBOL_GPL(dma_buf_fd);
> +EXPORT_SYMBOL_NS_GPL(dma_buf_fd, DMA_BUF);
>   
>   /**
>    * dma_buf_get - returns the struct dma_buf related to an fd
> @@ -660,7 +660,7 @@ struct dma_buf *dma_buf_get(int fd)
>   
>   	return file->private_data;
>   }
> -EXPORT_SYMBOL_GPL(dma_buf_get);
> +EXPORT_SYMBOL_NS_GPL(dma_buf_get, DMA_BUF);
>   
>   /**
>    * dma_buf_put - decreases refcount of the buffer
> @@ -679,7 +679,7 @@ void dma_buf_put(struct dma_buf *dmabuf)
>   
>   	fput(dmabuf->file);
>   }
> -EXPORT_SYMBOL_GPL(dma_buf_put);
> +EXPORT_SYMBOL_NS_GPL(dma_buf_put, DMA_BUF);
>   
>   static void mangle_sg_table(struct sg_table *sg_table)
>   {
> @@ -810,7 +810,7 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
>   	dma_buf_detach(dmabuf, attach);
>   	return ERR_PTR(ret);
>   }
> -EXPORT_SYMBOL_GPL(dma_buf_dynamic_attach);
> +EXPORT_SYMBOL_NS_GPL(dma_buf_dynamic_attach, DMA_BUF);
>   
>   /**
>    * dma_buf_attach - Wrapper for dma_buf_dynamic_attach
> @@ -825,7 +825,7 @@ struct dma_buf_attachment *dma_buf_attach(struct dma_buf *dmabuf,
>   {
>   	return dma_buf_dynamic_attach(dmabuf, dev, NULL, NULL);
>   }
> -EXPORT_SYMBOL_GPL(dma_buf_attach);
> +EXPORT_SYMBOL_NS_GPL(dma_buf_attach, DMA_BUF);
>   
>   static void __unmap_dma_buf(struct dma_buf_attachment *attach,
>   			    struct sg_table *sg_table,
> @@ -871,7 +871,7 @@ void dma_buf_detach(struct dma_buf *dmabuf, struct dma_buf_attachment *attach)
>   
>   	kfree(attach);
>   }
> -EXPORT_SYMBOL_GPL(dma_buf_detach);
> +EXPORT_SYMBOL_NS_GPL(dma_buf_detach, DMA_BUF);
>   
>   /**
>    * dma_buf_pin - Lock down the DMA-buf
> @@ -901,7 +901,7 @@ int dma_buf_pin(struct dma_buf_attachment *attach)
>   
>   	return ret;
>   }
> -EXPORT_SYMBOL_GPL(dma_buf_pin);
> +EXPORT_SYMBOL_NS_GPL(dma_buf_pin, DMA_BUF);
>   
>   /**
>    * dma_buf_unpin - Unpin a DMA-buf
> @@ -922,7 +922,7 @@ void dma_buf_unpin(struct dma_buf_attachment *attach)
>   	if (dmabuf->ops->unpin)
>   		dmabuf->ops->unpin(attach);
>   }
> -EXPORT_SYMBOL_GPL(dma_buf_unpin);
> +EXPORT_SYMBOL_NS_GPL(dma_buf_unpin, DMA_BUF);
>   
>   /**
>    * dma_buf_map_attachment - Returns the scatterlist table of the attachment;
> @@ -1012,7 +1012,7 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
>   #endif /* CONFIG_DMA_API_DEBUG */
>   	return sg_table;
>   }
> -EXPORT_SYMBOL_GPL(dma_buf_map_attachment);
> +EXPORT_SYMBOL_NS_GPL(dma_buf_map_attachment, DMA_BUF);
>   
>   /**
>    * dma_buf_unmap_attachment - unmaps and decreases usecount of the buffer;might
> @@ -1048,7 +1048,7 @@ void dma_buf_unmap_attachment(struct dma_buf_attachment *attach,
>   	    !IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY))
>   		dma_buf_unpin(attach);
>   }
> -EXPORT_SYMBOL_GPL(dma_buf_unmap_attachment);
> +EXPORT_SYMBOL_NS_GPL(dma_buf_unmap_attachment, DMA_BUF);
>   
>   /**
>    * dma_buf_move_notify - notify attachments that DMA-buf is moving
> @@ -1068,7 +1068,7 @@ void dma_buf_move_notify(struct dma_buf *dmabuf)
>   		if (attach->importer_ops)
>   			attach->importer_ops->move_notify(attach);
>   }
> -EXPORT_SYMBOL_GPL(dma_buf_move_notify);
> +EXPORT_SYMBOL_NS_GPL(dma_buf_move_notify, DMA_BUF);
>   
>   /**
>    * DOC: cpu access
> @@ -1212,7 +1212,7 @@ int dma_buf_begin_cpu_access(struct dma_buf *dmabuf,
>   
>   	return ret;
>   }
> -EXPORT_SYMBOL_GPL(dma_buf_begin_cpu_access);
> +EXPORT_SYMBOL_NS_GPL(dma_buf_begin_cpu_access, DMA_BUF);
>   
>   /**
>    * dma_buf_end_cpu_access - Must be called after accessing a dma_buf from the
> @@ -1240,7 +1240,7 @@ int dma_buf_end_cpu_access(struct dma_buf *dmabuf,
>   
>   	return ret;
>   }
> -EXPORT_SYMBOL_GPL(dma_buf_end_cpu_access);
> +EXPORT_SYMBOL_NS_GPL(dma_buf_end_cpu_access, DMA_BUF);
>   
>   
>   /**
> @@ -1282,7 +1282,7 @@ int dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma,
>   
>   	return dmabuf->ops->mmap(dmabuf, vma);
>   }
> -EXPORT_SYMBOL_GPL(dma_buf_mmap);
> +EXPORT_SYMBOL_NS_GPL(dma_buf_mmap, DMA_BUF);
>   
>   /**
>    * dma_buf_vmap - Create virtual mapping for the buffer object into kernel
> @@ -1336,7 +1336,7 @@ int dma_buf_vmap(struct dma_buf *dmabuf, struct dma_buf_map *map)
>   	mutex_unlock(&dmabuf->lock);
>   	return ret;
>   }
> -EXPORT_SYMBOL_GPL(dma_buf_vmap);
> +EXPORT_SYMBOL_NS_GPL(dma_buf_vmap, DMA_BUF);
>   
>   /**
>    * dma_buf_vunmap - Unmap a vmap obtained by dma_buf_vmap.
> @@ -1360,7 +1360,7 @@ void dma_buf_vunmap(struct dma_buf *dmabuf, struct dma_buf_map *map)
>   	}
>   	mutex_unlock(&dmabuf->lock);
>   }
> -EXPORT_SYMBOL_GPL(dma_buf_vunmap);
> +EXPORT_SYMBOL_NS_GPL(dma_buf_vunmap, DMA_BUF);
>   
>   #ifdef CONFIG_DEBUG_FS
>   static int dma_buf_debug_show(struct seq_file *s, void *unused)
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 38dade421d46..38e144504649 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -41,6 +41,7 @@
>   #include <linux/swiotlb.h>
>   #include <linux/dma-buf.h>
>   #include <linux/sizes.h>
> +#include <linux/module.h>
>   
>   #include <drm/ttm/ttm_bo_api.h>
>   #include <drm/ttm/ttm_bo_driver.h>
> @@ -59,6 +60,8 @@
>   #include "amdgpu_res_cursor.h"
>   #include "bif/bif_4_1_d.h"
>   
> +MODULE_IMPORT_NS(DMA_BUF);
> +
>   #define AMDGPU_TTM_VRAM_MAX_DW_READ	(size_t)128
>   
>   static int amdgpu_ttm_backend_bind(struct ttm_device *bdev,
> diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> index 3c75d79dbb65..746fd8c73845 100644
> --- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> +++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> @@ -6,6 +6,7 @@
>    */
>   
>   #include <linux/slab.h>
> +#include <linux/module.h>
>   
>   #include <drm/drm_damage_helper.h>
>   #include <drm/drm_fb_helper.h>
> @@ -17,6 +18,8 @@
>   
>   #include "drm_internal.h"
>   
> +MODULE_IMPORT_NS(DMA_BUF);
> +
>   #define AFBC_HEADER_SIZE		16
>   #define AFBC_TH_LAYOUT_ALIGNMENT	8
>   #define AFBC_HDR_ALIGN			64
> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index deb23dbec8b5..d8ba95744410 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -29,6 +29,7 @@
>   #include <linux/export.h>
>   #include <linux/dma-buf.h>
>   #include <linux/rbtree.h>
> +#include <linux/module.h>
>   
>   #include <drm/drm.h>
>   #include <drm/drm_drv.h>
> @@ -39,6 +40,8 @@
>   
>   #include "drm_internal.h"
>   
> +MODULE_IMPORT_NS(DMA_BUF);
> +
>   /**
>    * DOC: overview and lifetime rules
>    *
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
> index 6d8bed9c739d..6788ea8490d1 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
> @@ -5,10 +5,13 @@
>   
>   #include <drm/drm_prime.h>
>   #include <linux/dma-buf.h>
> +#include <linux/module.h>
>   
>   #include "etnaviv_drv.h"
>   #include "etnaviv_gem.h"
>   
> +MODULE_IMPORT_NS(DMA_BUF);
> +
>   static struct lock_class_key etnaviv_prime_lock_class;
>   
>   struct sg_table *etnaviv_gem_prime_get_sg_table(struct drm_gem_object *obj)
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
> index 4396224227d1..0a0c042a3155 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
> @@ -9,6 +9,7 @@
>   #include <linux/dma-buf.h>
>   #include <linux/pfn_t.h>
>   #include <linux/shmem_fs.h>
> +#include <linux/module.h>
>   
>   #include <drm/drm_prime.h>
>   #include <drm/drm_vma_manager.h>
> @@ -17,6 +18,8 @@
>   #include "exynos_drm_drv.h"
>   #include "exynos_drm_gem.h"
>   
> +MODULE_IMPORT_NS(DMA_BUF);
> +
>   static int exynos_drm_alloc_buf(struct exynos_drm_gem *exynos_gem, bool kvmap)
>   {
>   	struct drm_device *dev = exynos_gem->base.dev;
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> index afa34111de02..abb854281347 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> @@ -7,11 +7,14 @@
>   #include <linux/dma-buf.h>
>   #include <linux/highmem.h>
>   #include <linux/dma-resv.h>
> +#include <linux/module.h>
>   
>   #include "i915_drv.h"
>   #include "i915_gem_object.h"
>   #include "i915_scatterlist.h"
>   
> +MODULE_IMPORT_NS(DMA_BUF);
> +
>   I915_SELFTEST_DECLARE(static bool force_different_devices;)
>   
>   static struct drm_i915_gem_object *dma_buf_to_obj(struct dma_buf *buf)
> diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
> index 6ec598f5d5b3..d38fd7e12b57 100644
> --- a/drivers/gpu/drm/tegra/gem.c
> +++ b/drivers/gpu/drm/tegra/gem.c
> @@ -12,6 +12,7 @@
>   
>   #include <linux/dma-buf.h>
>   #include <linux/iommu.h>
> +#include <linux/module.h>
>   
>   #include <drm/drm_drv.h>
>   #include <drm/drm_prime.h>
> @@ -20,6 +21,8 @@
>   #include "drm.h"
>   #include "gem.h"
>   
> +MODULE_IMPORT_NS(DMA_BUF);
> +
>   static void tegra_bo_put(struct host1x_bo *bo)
>   {
>   	struct tegra_bo *obj = host1x_to_tegra_bo(bo);
> diff --git a/drivers/gpu/drm/vmwgfx/ttm_object.c b/drivers/gpu/drm/vmwgfx/ttm_object.c
> index 04789b2bb2a2..899945f54dc7 100644
> --- a/drivers/gpu/drm/vmwgfx/ttm_object.c
> +++ b/drivers/gpu/drm/vmwgfx/ttm_object.c
> @@ -48,8 +48,11 @@
>   #include <linux/spinlock.h>
>   #include <linux/slab.h>
>   #include <linux/atomic.h>
> +#include <linux/module.h>
>   #include "ttm_object.h"
>   
> +MODULE_IMPORT_NS(DMA_BUF);
> +
>   /**
>    * struct ttm_object_file
>    *
> diff --git a/drivers/infiniband/core/umem_dmabuf.c b/drivers/infiniband/core/umem_dmabuf.c
> index e824baf4640d..2d14929543af 100644
> --- a/drivers/infiniband/core/umem_dmabuf.c
> +++ b/drivers/infiniband/core/umem_dmabuf.c
> @@ -6,9 +6,12 @@
>   #include <linux/dma-buf.h>
>   #include <linux/dma-resv.h>
>   #include <linux/dma-mapping.h>
> +#include <linux/module.h>
>   
>   #include "uverbs.h"
>   
> +MODULE_IMPORT_NS(DMA_BUF);
> +
>   int ib_umem_dmabuf_map_pages(struct ib_umem_dmabuf *umem_dmabuf)
>   {
>   	struct sg_table *sgt;
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> index 508ac295eb06..773c68dcd158 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -2978,3 +2978,4 @@ EXPORT_SYMBOL_GPL(vb2_thread_stop);
>   MODULE_DESCRIPTION("Media buffer core framework");
>   MODULE_AUTHOR("Pawel Osciak <pawel@osciak.com>, Marek Szyprowski");
>   MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS(DMA_BUF);
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> index a7f61ba85440..9a1a9baca2e4 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> @@ -755,3 +755,4 @@ EXPORT_SYMBOL_GPL(vb2_dma_contig_set_max_seg_size);
>   MODULE_DESCRIPTION("DMA-contig memory handling routines for videobuf2");
>   MODULE_AUTHOR("Pawel Osciak <pawel@osciak.com>");
>   MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS(DMA_BUF);
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> index c5b06a509566..db90ebb8950f 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> @@ -666,3 +666,4 @@ EXPORT_SYMBOL_GPL(vb2_dma_sg_memops);
>   MODULE_DESCRIPTION("dma scatter/gather memory handling routines for videobuf2");
>   MODULE_AUTHOR("Andrzej Pietrasiewicz");
>   MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS(DMA_BUF);
> diff --git a/drivers/media/common/videobuf2/videobuf2-vmalloc.c b/drivers/media/common/videobuf2/videobuf2-vmalloc.c
> index 83f95258ec8c..fa983897d0e9 100644
> --- a/drivers/media/common/videobuf2/videobuf2-vmalloc.c
> +++ b/drivers/media/common/videobuf2/videobuf2-vmalloc.c
> @@ -444,3 +444,4 @@ EXPORT_SYMBOL_GPL(vb2_vmalloc_memops);
>   MODULE_DESCRIPTION("vmalloc memory handling routines for videobuf2");
>   MODULE_AUTHOR("Pawel Osciak <pawel@osciak.com>");
>   MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS(DMA_BUF);
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index beda610e6b30..fa5c067f1c1e 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -1763,3 +1763,4 @@ static void fastrpc_exit(void)
>   module_exit(fastrpc_exit);
>   
>   MODULE_LICENSE("GPL v2");
> +MODULE_IMPORT_NS(DMA_BUF);
> diff --git a/drivers/staging/media/tegra-vde/dmabuf-cache.c b/drivers/staging/media/tegra-vde/dmabuf-cache.c
> index a93b317885bf..a98d03419b8f 100644
> --- a/drivers/staging/media/tegra-vde/dmabuf-cache.c
> +++ b/drivers/staging/media/tegra-vde/dmabuf-cache.c
> @@ -12,9 +12,12 @@
>   #include <linux/sched.h>
>   #include <linux/slab.h>
>   #include <linux/workqueue.h>
> +#include <linux/module.h>
>   
>   #include "vde.h"
>   
> +MODULE_IMPORT_NS(DMA_BUF);
> +
>   struct tegra_vde_cache_entry {
>   	enum dma_data_direction dma_dir;
>   	struct dma_buf_attachment *a;
> diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
> index 8a9384a64f3e..8a8deb95e918 100644
> --- a/drivers/tee/tee_shm.c
> +++ b/drivers/tee/tee_shm.c
> @@ -10,8 +10,11 @@
>   #include <linux/slab.h>
>   #include <linux/tee_drv.h>
>   #include <linux/uio.h>
> +#include <linux/module.h>
>   #include "tee_private.h"
>   
> +MODULE_IMPORT_NS(DMA_BUF);
> +
>   static void release_registered_pages(struct tee_shm *shm)
>   {
>   	if (shm->pages) {
> diff --git a/drivers/virtio/virtio_dma_buf.c b/drivers/virtio/virtio_dma_buf.c
> index 5127a2f0c986..2521a75009c3 100644
> --- a/drivers/virtio/virtio_dma_buf.c
> +++ b/drivers/virtio/virtio_dma_buf.c
> @@ -86,3 +86,4 @@ int virtio_dma_buf_get_uuid(struct dma_buf *dma_buf,
>   EXPORT_SYMBOL(virtio_dma_buf_get_uuid);
>   
>   MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS(DMA_BUF);
> diff --git a/drivers/xen/gntdev-dmabuf.c b/drivers/xen/gntdev-dmabuf.c
> index 4c13cbc99896..12e380db7f55 100644
> --- a/drivers/xen/gntdev-dmabuf.c
> +++ b/drivers/xen/gntdev-dmabuf.c
> @@ -14,6 +14,7 @@
>   #include <linux/slab.h>
>   #include <linux/types.h>
>   #include <linux/uaccess.h>
> +#include <linux/module.h>
>   
>   #include <xen/xen.h>
>   #include <xen/grant_table.h>
> @@ -21,6 +22,8 @@
>   #include "gntdev-common.h"
>   #include "gntdev-dmabuf.h"
>   
> +MODULE_IMPORT_NS(DMA_BUF);
> +
>   #ifndef GRANT_INVALID_REF
>   /*
>    * Note on usage of grant reference 0 as invalid grant reference:
> diff --git a/samples/vfio-mdev/mbochs.c b/samples/vfio-mdev/mbochs.c
> index c313ab4d1f4e..a83be6cd162f 100644
> --- a/samples/vfio-mdev/mbochs.c
> +++ b/samples/vfio-mdev/mbochs.c
> @@ -1493,5 +1493,6 @@ static void __exit mbochs_dev_exit(void)
>   	mbochs_class = NULL;
>   }
>   
> +MODULE_IMPORT_NS(DMA_BUF);
>   module_init(mbochs_dev_init)
>   module_exit(mbochs_dev_exit)

