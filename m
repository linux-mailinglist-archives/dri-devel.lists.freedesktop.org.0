Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9AA1625A7A
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 13:31:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88FE810E16E;
	Fri, 11 Nov 2022 12:31:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D47B510E16E
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 12:31:20 +0000 (UTC)
Received: from [192.168.2.41] (unknown [109.252.117.140])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id A01BF6602A53;
 Fri, 11 Nov 2022 12:31:18 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1668169879;
 bh=gT2Zg1km2mpUlaANAsdrhIMFKbouao1ucd64mMJD3XE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=RfVQvH8QKuuVvlOeRkaRv1xbN5mRU15bCs/pLrqhMZmLqmfFEtPJUzxsUpgII32Wt
 RzbP1bCPO/IQhBcgGjgH7rY8TPuBPBHhwqjHn7CblZkEc2/uo7SohO81qvz94Uqbdz
 Z0jbjnoSKGsy3QhTL2m+5xOnUfu7NojWBWYXYh0rRWl+U1FPlfYNTuVFixeRODo8XB
 pGHTMtGpXpHvb0e8/qOSHqZEgAEMqjjz6dK7L7HVoEqGgel4c3fGt+vDdREDppOPbh
 Vb5Xd6bOxxTNdpUl6GqS+p6kYFilFnoNkiQawBM+8YA0p9Rxb9NEOBgA1Jf4Ij3aXP
 FMlenubFaL+pQ==
Message-ID: <512e97ec-5d5e-4d6a-e547-13ca4036f3d1@collabora.com>
Date: Fri, 11 Nov 2022 15:31:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] udmabuf: add vmap method to udmabuf_ops
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Lukasz Wiecaszek <lukasz.wiecaszek@googlemail.com>, kraxel@redhat.com
References: <20221111114528.608801-1-lukasz.wiecaszek@gmail.com>
 <2ee10e0e-a347-71a5-051a-02b9bac0bbb6@amd.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <2ee10e0e-a347-71a5-051a-02b9bac0bbb6@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Lukasz Wiecaszek <lukasz.wiecaszek@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/11/22 15:05, Christian König wrote:
> Adding Dmitry as well.
> 
> Am 11.11.22 um 12:45 schrieb Lukasz Wiecaszek:
>> The reason behind that patch is associated with videobuf2 subsystem
>> (or more genrally with v4l2 framework) and user created
>> dma buffers (udmabuf). In some circumstances
>> when dealing with V4L2_MEMORY_DMABUF buffers videobuf2 subsystem
>> wants to use dma_buf_vmap() method on the attached dma buffer.
>> As udmabuf does not have .vmap operation implemented,
>> such dma_buf_vmap() natually fails.
>>
>> videobuf2_common: [cap-000000003473b2f1] __vb2_queue_alloc: allocated
>> 3 buffers, 1 plane(s) each
>> videobuf2_common: [cap-000000003473b2f1] __prepare_dmabuf: buffer for
>> plane 0 changed
>> videobuf2_common: [cap-000000003473b2f1] __prepare_dmabuf: failed to
>> map dmabuf for plane 0
>> videobuf2_common: [cap-000000003473b2f1] __buf_prepare: buffer
>> preparation failed: -14
>>
>> The patch itself seems to be strighforward.
>> It adds implementation of .vmap method to 'struct dma_buf_ops
>> udmabuf_ops'.
>> .vmap method itself uses vm_map_ram() to map pages linearly
>> into the kernel virtual address space (only if such mapping
>> hasn't been created yet).
> 
> Of hand that sounds sane to me.
> 
> You should probably mention somewhere in a code comment that the cached
> vaddr is protected by the reservation lock being taken. That's not
> necessary obvious to everybody.
> 
> Apart from that looks good to me.

Adding a comment won't hurt.

We have the dma_resv_assert_held() in dma_buf_vmap() that will help
spotting a missing lock at runtime by developers. While the
dmbuf_ops->vmap() shouldn't be ever used directly by importers.

-- 
Best regards,
Dmitry

