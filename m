Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19CB09ABC65
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 05:45:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2419010E34D;
	Wed, 23 Oct 2024 03:45:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="eylbEEHN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EB5410E71E
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 03:45:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1729655152; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=m5FwYQnbM6QKRuINVeOdRhKrCthb+x+5wICbLEkss3rLbgqGn0CwGZ4Wt+1TqEibmtjg1fAJzU0RJItDQblADKga6EmTe0UPJFt/tdeiVnbeQ0Owp/H5JbNL7zVjl/qMhuH9exyKUHWcZmBlcUgoqhymSdAX/lqPUtuUJshcUpE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1729655152;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=bD69v/LmDwH7n2YcKouaT8IqHWRouSE6Juo1fgHryKA=; 
 b=LKchE1rxzz9vSO62WOZBfmQNitrO/VhfKXStRs6ruwBjlk8m56nHbx8/KUINHiaBeKyFJ2S0UUJqhstlHGGgBGyOTGT+QUoRx2k+fHzpXUBRnC1+5yiN1wMOS9AexlaoMmPrufz47ypHQxySsveB3g7VKA8uT6ROU5djvjTL14c=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729655152; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=bD69v/LmDwH7n2YcKouaT8IqHWRouSE6Juo1fgHryKA=;
 b=eylbEEHNhpTSueTQJttV9IWq31SRryN+QXUcScVTFqS/XQPI4zXLZsfQ7jemNomg
 v8DSQI0NU/xAAi1pwdBUd7IYgb6kMUN46lluKlrGJq5dOqx4k2yLAhFcFGKWHs7nbzw
 D/UVHf15zdYcq+dj9qiK0maC0ddYwa4DK8AVAQs0=
Received: by mx.zohomail.com with SMTPS id 1729655150204869.5549867916085;
 Tue, 22 Oct 2024 20:45:50 -0700 (PDT)
Message-ID: <071a239f-50fd-44f3-9283-3dc928edb389@collabora.com>
Date: Wed, 23 Oct 2024 06:45:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] drm/virtio: Add a helper to map and note the dma
 addrs and lengths
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: Gerd Hoffmann <kraxel@redhat.com>, Rob Clark <robdclark@gmail.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>
References: <20240813035509.3360760-1-vivek.kasireddy@intel.com>
 <20240813035509.3360760-3-vivek.kasireddy@intel.com>
 <45fbbd65-7e97-41c3-898a-49b6fa65e27e@collabora.com>
 <IA0PR11MB7185625CF2B9E7635A0CF164F84C2@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <IA0PR11MB7185625CF2B9E7635A0CF164F84C2@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
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

On 10/22/24 07:51, Kasireddy, Vivek wrote:
> Hi Dmitry,
> 
>>
>> On 8/13/24 06:49, Vivek Kasireddy wrote:
>>> +long virtgpu_dma_buf_import_sgt(struct virtio_gpu_mem_entry **ents,
>>> +				unsigned int *nents,
>>> +				struct virtio_gpu_object *bo,
>>> +				struct dma_buf_attachment *attach)
>>> +{
>>> +	struct scatterlist *sl;
>>> +	struct sg_table *sgt;
>>> +	long i, ret;
>>> +
>>> +	dma_resv_assert_held(attach->dmabuf->resv);
>>> +
>>> +	ret = dma_resv_wait_timeout(attach->dmabuf->resv,
>>> +				    DMA_RESV_USAGE_KERNEL,
>>> +				    false, MAX_SCHEDULE_TIMEOUT);
>>
>> Why this wait is needed?
> The intention was to wait for any pending operations on the backing object
> to finish and let it become idle before mapping and accessing the underlying
> memory. But I suspect this wait may not be necessary given that we would
> have already called dma_buf_pin() at this point, which would have had the
> desired effect?

Looking at the dma_buf_map_attachment() code, I see that it does both of
pinning and waiting for the fence by itself. Hence should be safe to
drop both dma_buf_pin() and dma_resv_wait_timeout(), please test.

BTW, is any DG2 GPU suitable for testing of this patchset? Will I be
able to test it using a regular consumer A750 card?

-- 
Best regards,
Dmitry
