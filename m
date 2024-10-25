Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B95029B12BA
	for <lists+dri-devel@lfdr.de>; Sat, 26 Oct 2024 00:36:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 849C610E157;
	Fri, 25 Oct 2024 22:36:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="IDKA3y4L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CED4510E157
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 22:36:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1729895803; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=nkRmsaf92K6hqAcYFf81lxbToMtWy5+z/jH+4TYswcoXo67iknQvUNirZ5H6wbQYEnL4dQw8DiwgRm6ndKVuofzWjZ97e7ZhPGb73x+3PhjBTKqAsUmXD8+VwV0pFtjp0sIdHPy494Izh/2W3rZsy1t7wsPW4ze104g1GdB8bH8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1729895803;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=7/FOJXcQrFZAKwpW0RqRurrCAwisI1+sIwTcT5UUPto=; 
 b=ZIvKLpqMVo3XFfiUNczrLaKFPIRXwfrZv84MBmDbpukSslSqpFJIkvPaGaNt5tGh0VpHJStED89MsvRNes+A1vqRI3VnABM9FdDSFQ8Q60J2CpFVb4FUVK7+x9Tw/r4zMlazsbvUXnjAves4BsbzKTm117dMw5Q1AsN8CH0Ahp4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729895803; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=7/FOJXcQrFZAKwpW0RqRurrCAwisI1+sIwTcT5UUPto=;
 b=IDKA3y4LHQDUv8WkFTPB5ijLJeKBC+eUVkfakSMgkMysUKN0n0xFtj62TkpedyNo
 VLbsxAhRHcmKL6dPgpEZkh7fNetviOh7y1UnCDB2axqXxqxiyfMB5EnVXmGbcRoqOO+
 cpO8/0iROD+suv46uWu5sacnRCtaIoFr+GOhXiAk=
Received: by mx.zohomail.com with SMTPS id 1729895801689139.50562847230208;
 Fri, 25 Oct 2024 15:36:41 -0700 (PDT)
Message-ID: <4feda09d-7a5e-4db4-83f8-f75eb0566b4a@collabora.com>
Date: Sat, 26 Oct 2024 01:36:38 +0300
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
 <071a239f-50fd-44f3-9283-3dc928edb389@collabora.com>
 <IA0PR11MB718548F4F8971C91FCA456CCF84E2@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <IA0PR11MB718548F4F8971C91FCA456CCF84E2@IA0PR11MB7185.namprd11.prod.outlook.com>
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

On 10/24/24 08:49, Kasireddy, Vivek wrote:
> Hi Dmitry,
> 
>> Subject: Re: [PATCH v2 2/5] drm/virtio: Add a helper to map and note the
>> dma addrs and lengths
>>
>> On 10/22/24 07:51, Kasireddy, Vivek wrote:
>>> Hi Dmitry,
>>>
>>>>
>>>> On 8/13/24 06:49, Vivek Kasireddy wrote:
>>>>> +long virtgpu_dma_buf_import_sgt(struct virtio_gpu_mem_entry
>> **ents,
>>>>> +				unsigned int *nents,
>>>>> +				struct virtio_gpu_object *bo,
>>>>> +				struct dma_buf_attachment *attach)
>>>>> +{
>>>>> +	struct scatterlist *sl;
>>>>> +	struct sg_table *sgt;
>>>>> +	long i, ret;
>>>>> +
>>>>> +	dma_resv_assert_held(attach->dmabuf->resv);
>>>>> +
>>>>> +	ret = dma_resv_wait_timeout(attach->dmabuf->resv,
>>>>> +				    DMA_RESV_USAGE_KERNEL,
>>>>> +				    false, MAX_SCHEDULE_TIMEOUT);
>>>>
>>>> Why this wait is needed?
>>> The intention was to wait for any pending operations on the backing object
>>> to finish and let it become idle before mapping and accessing the
>> underlying
>>> memory. But I suspect this wait may not be necessary given that we would
>>> have already called dma_buf_pin() at this point, which would have had the
>>> desired effect?
>>
>> Looking at the dma_buf_map_attachment() code, I see that it does both of
>> pinning and waiting for the fence by itself. Hence should be safe to
>> drop both dma_buf_pin() and dma_resv_wait_timeout(), please test.
> Sure, I'll retest again but it looks like dma_buf_map_attachment() pins and
> or waits for fence only in specific situations. That is, it pins only if the exporter
> is non-dynamic and if CONFIG_DMABUF_MOVE_NOTIFY is not enabled. And,
> it waits for the fence only if the importer is non-dynamic. Since I have only tested
> with a dynamic exporter (Xe driver), I did not encounter any issues but it makes
> sense to augment the code to account for non-dynamic exporters as well.

If exporter or importer is not dynamic, then dma-buf core pins buffer at
the buffer importing time, see dma_buf_attach(). Hence, I expect that
everything should work fine.

>> BTW, is any DG2 GPU suitable for testing of this patchset? Will I be
>> able to test it using a regular consumer A750 card?
> Yes, you can test with any DG2 dGPU as long as you can passthrough it to the
> Guest VM. And, if there is an iGPU available on the Host, you can use GTK/SDL UI
> for local display or Spice UI for remote display if there is no iGPU on the Host.
> This is exactly how I started testing this patch series but I am now predominantly
> testing this series with SRIOV enabled iGPUs and dGPUs.

Was hoping to try out SR-IOV on A750 if it's even possible at all. But
passthrough indeed is another an option, will try with passthrough, thanks.

-- 
Best regards,
Dmitry
