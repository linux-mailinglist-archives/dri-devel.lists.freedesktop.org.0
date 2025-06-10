Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9044FAD3F09
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 18:34:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ACA310E591;
	Tue, 10 Jun 2025 16:34:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="OE39vPKy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33D5910E591
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 16:34:22 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20250610163420euoutp01af4a01e06458356442cca6c239e57fa1~Hu5xV1GH53071530715euoutp01o
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 16:34:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20250610163420euoutp01af4a01e06458356442cca6c239e57fa1~Hu5xV1GH53071530715euoutp01o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1749573260;
 bh=NS7GzjVzxQWVeneNGnikOfI3wBaZea46fIVMRvzt3fA=;
 h=Date:Subject:From:To:Cc:In-Reply-To:References:From;
 b=OE39vPKyqrq7U68twaogEU5JZBFGOcbJJ6ConSRJecWeHnrF1m7BY4w11r7p/M+zQ
 ZI2dpgINR57Y8CPwpGaWh4dUqPoRYPUKqNNgJXcewuShwRwExE+8KM8wTJCusyjAPa
 nEkfCGJDopqTNJxi9rs2hQLSoOvUyWwPUb6Huyl0=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20250610163420eucas1p25f008a064b4511f1c3bee4b862eaa94a~Hu5xE6xJS2358223582eucas1p2B;
 Tue, 10 Jun 2025 16:34:20 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250610163418eusmtip2e9144f0c61d4a2cdcbabc925173949e3~Hu5vrCJWM0431404314eusmtip2f;
 Tue, 10 Jun 2025 16:34:18 +0000 (GMT)
Message-ID: <3d65e71e-5847-4c0f-98ff-318086f14ee2@samsung.com>
Date: Tue, 10 Jun 2025 18:34:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Linaro-mm-sig] [PATCH v3 2/3] udmabuf: use sgtable-based
 scatterlist wrappers
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev
Cc: Gerd Hoffmann <kraxel@redhat.com>, Vivek Kasireddy
 <vivek.kasireddy@intel.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Robin Murphy
 <robin.murphy@arm.com>, stable@vger.kernel.org
Content-Language: en-US
In-Reply-To: <c90bf515-9050-4ed7-b733-28b14536b913@samsung.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250610163420eucas1p25f008a064b4511f1c3bee4b862eaa94a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250507160922eucas1p11bd044bb458626dc0004bd2fd83605c0
X-EPHeader: CA
X-CMS-RootMailID: 20250507160922eucas1p11bd044bb458626dc0004bd2fd83605c0
References: <20250507160913.2084079-1-m.szyprowski@samsung.com>
 <CGME20250507160922eucas1p11bd044bb458626dc0004bd2fd83605c0@eucas1p1.samsung.com>
 <20250507160913.2084079-3-m.szyprowski@samsung.com>
 <7a6475cb-4ebe-46a3-92a2-f29fbc8e5e41@amd.com>
 <c90bf515-9050-4ed7-b733-28b14536b913@samsung.com>
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

On 14.05.2025 15:44, Marek Szyprowski wrote:
> On 08.05.2025 11:57, Christian König wrote:
>> On 5/7/25 18:09, Marek Szyprowski wrote:
>>> Use common wrappers operating directly on the struct sg_table 
>>> objects to
>>> fix incorrect use of scatterlists sync calls. dma_sync_sg_for_*()
>>> functions have to be called with the number of elements originally 
>>> passed
>>> to dma_map_sg_*() function, not the one returned in sgtable's nents.
>>>
>>> Fixes: 1ffe09590121 ("udmabuf: fix dma-buf cpu access")
>>> CC: stable@vger.kernel.org
>>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>> Acked-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>
>> Should I push this one to drm-misc-fixes for upstreaming?
>
> Yes, please. The other 2 patches have been taken by the media maintainers.

Gentle ping

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

