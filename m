Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84CB782B419
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 18:30:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF1F810E986;
	Thu, 11 Jan 2024 17:30:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D4DC10E986
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 17:30:49 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 40BHUcSQ028698;
 Thu, 11 Jan 2024 11:30:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1704994238;
 bh=gTnuOd1liaA1cTS1/8MS3fyRnvkMY17fCbVAXhovc88=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=Tg1xTk0QFs8noasBA22wbNZz/4Y/MK7EAA6xds3KXm5uotl5HlN1GT4QuRfyrVHPA
 s1zECmx0JJExo6m4pkws+inNXl/venFXd/LGX6bGNTJs7ZjPcIcDSpbK4Z31/q1ekB
 YfMIilOrk10tsYFFM2oUYq+xgWyZ9YoMntuVthXE=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 40BHUct5008947
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 11 Jan 2024 11:30:38 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 11
 Jan 2024 11:30:38 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 11 Jan 2024 11:30:38 -0600
Received: from [10.249.40.136] ([10.249.40.136])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 40BHUbYO096156;
 Thu, 11 Jan 2024 11:30:37 -0600
Message-ID: <d67aba3f-d95a-4dfc-8fdb-234843047432@ti.com>
Date: Thu, 11 Jan 2024 11:30:37 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/8] iio: new DMABUF based API, v5
To: Paul Cercueil <paul@crapouillou.net>, Jonathan Cameron <jic23@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, Vinod Koul
 <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>
References: <20231219175009.65482-1-paul@crapouillou.net>
 <6ec8c7c4-588a-48b5-b0c5-56ca5216a757@ti.com>
 <bbd6e9d6f239efee8886e08f3c3493fc968e53ce.camel@crapouillou.net>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <bbd6e9d6f239efee8886e08f3c3493fc968e53ce.camel@crapouillou.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 =?UTF-8?Q?Nuno_S=C3=A1?= <noname.nuno@gmail.com>, dmaengine@vger.kernel.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/11/24 3:20 AM, Paul Cercueil wrote:
> Hi Andrew,
> 
> Le lundi 08 janvier 2024 à 15:12 -0600, Andrew Davis a écrit :
>> On 12/19/23 11:50 AM, Paul Cercueil wrote:
>>> [V4 was: "iio: Add buffer write() support"][1]
>>>
>>> Hi Jonathan,
>>>
>>> This is a respin of the V3 of my patchset that introduced a new
>>> interface based on DMABUF objects [2].
>>>
>>> The V4 was a split of the patchset, to attempt to upstream buffer
>>> write() support first. But since there is no current user upstream,
>>> it
>>> was not merged. This V5 is about doing the opposite, and contains
>>> the
>>> new DMABUF interface, without adding the buffer write() support. It
>>> can
>>> already be used with the upstream adi-axi-adc driver.
>>>
>>> In user-space, Libiio uses it to transfer back and forth blocks of
>>> samples between the hardware and the applications, without having
>>> to
>>> copy the data.
>>>
>>> On a ZCU102 with a FMComms3 daughter board, running Libiio from the
>>> pcercuei/dev-new-dmabuf-api branch [3], compiled with
>>> WITH_LOCAL_DMABUF_API=OFF (so that it uses fileio):
>>>     sudo utils/iio_rwdev -b 4096 -B cf-ad9361-lpc
>>>     Throughput: 116 MiB/s
>>>
>>> Same hardware, with the DMABUF API (WITH_LOCAL_DMABUF_API=ON):
>>>     sudo utils/iio_rwdev -b 4096 -B cf-ad9361-lpc
>>>     Throughput: 475 MiB/s
>>>
>>> This benchmark only measures the speed at which the data can be
>>> fetched
>>> to iio_rwdev's internal buffers, and does not actually try to read
>>> the
>>> data (e.g. to pipe it to stdout). It shows that fetching the data
>>> is
>>> more than 4x faster using the new interface.
>>>
>>> When actually reading the data, the performance difference isn't
>>> that
>>> impressive (maybe because in case of DMABUF the data is not in
>>> cache):
>>>
>>> WITH_LOCAL_DMABUF_API=OFF (so that it uses fileio):
>>>     sudo utils/iio_rwdev -b 4096 cf-ad9361-lpc | dd of=/dev/zero
>>> status=progress
>>>     2446422528 bytes (2.4 GB, 2.3 GiB) copied, 22 s, 111 MB/s
>>>
>>> WITH_LOCAL_DMABUF_API=ON:
>>>     sudo utils/iio_rwdev -b 4096 cf-ad9361-lpc | dd of=/dev/zero
>>> status=progress
>>>     2334388736 bytes (2.3 GB, 2.2 GiB) copied, 21 s, 114 MB/s
>>>
>>> One interesting thing to note is that fileio is (currently)
>>> actually
>>> faster than the DMABUF interface if you increase a lot the buffer
>>> size.
>>> My explanation is that the cache invalidation routine takes more
>>> and
>>> more time the bigger the DMABUF gets. This is because the DMABUF is
>>> backed by small-size pages, so a (e.g.) 64 MiB DMABUF is backed by
>>> up
>>> to 16 thousands pages, that have to be invalidated one by one. This
>>> can
>>> be addressed by using huge pages, but the udmabuf driver does not
>>> (yet)
>>> support creating DMABUFs backed by huge pages.
>>>
>>
>> Have you tried DMABUFs created using the DMABUF System heap exporter?
>> (drivers/dma-buf/heaps/system_heap.c) It should be able to handle
>> larger allocation better here, and if you don't have any active
>> mmaps or vmaps then it can skip CPU-side coherency maintenance
>> (useful for device to device transfers).
> 
> I didn't know about it!
> 
> But udmabuf also allows you to skip CPU-side coherency maintenance,
> since DMABUFs have two ioctls to start/finish CPU access anyway.
> 

The only way it lets you skip that is if your application just doesn't
call those begin/end ioctls, which is wrong. That may work on a system
where CPU caches can be snooped by all devices that could attach to
a buffer(x86), but that might not work on others(ARM). So calling
those begin/end ioctls is required[0]. If maintenance is not actually
needed then the kernel will turn those calls into NOPs for you, but only
the kernel can know when that is correct (based on the running system
and the devices attached to that buffer), not userspace.

>> Allocating DMABUFs out of user pages has a bunch of other issues you
>> might run into also. I'd argue udmabuf is now completely superseded
>> by DMABUF system heaps. Try it out :)
> 
> I'm curious, what other issues?
> 

For starters the {begin,end}_cpu_access() callbacks don't actually
sync the pages for any of the devices attached to the DMABUF, it
only makes a fake mapping for the misc device(CPU) then syncs with
that. That probably works for the QEMU case it was designed for where
the device is always a VM instance running on the same CPU, but for
any real devices the sync never happens towards them.

I have some patches fixing the above I'll post this cycle, but it
wont help with folks doing reads/wrties on the original shmem/memfd
outside of the begin/end ioctls. So there is a fundamental issue
with the buffer's backing memory's ownership/lifecycle that makes
udmabuf broken by design.

The DMABUF System Heap owns the backing memory and manages that
memory's lifecycle as all correct DMABUF exporters must.

> The good thing about udmabuf is that the memory is backed by pages, so
> we can use MSG_ZEROCOPY on sockets to transfer the mmapped data over
> the network (having a DMABUF interface to the network stack would be
> better, but I'm not opening that can of worms).
> 

Yes, having a DMABUF importer interface for the network stack would be
the best long-term solution here, and one will probably end up being
needed for zero-copy buffer passing directly between HW and network
which seems to be a growing area of interest. And would help solve
some cases where MSG_ZEROCOPY fails (such as devices without
scatter-gather) by making sure the backing buffer meets the needs
of all attached devices, etc.. But I do agree let's leave those
worm-cans for someone else to open :)

I wonder what would happen if you tried a MSG_ZEROCOPY on a buffer
that was an mmap'd address from a DMABUF.. probably nothing good
but might be worth looking into.

Andrew

[0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/dma-buf/dma-buf.c#n1323

>> Andrew
> 
> Cheers,
> -Paul
> 
>>> Anyway, the real benefits happen when the DMABUFs are either shared
>>> between IIO devices, or between the IIO subsystem and another
>>> filesystem. In that case, the DMABUFs are simply passed around
>>> drivers,
>>> without the data being copied at any moment.
>>>
>>> We use that feature to transfer samples from our transceivers to
>>> USB,
>>> using a DMABUF interface to FunctionFS [4].
>>>
>>> This drastically increases the throughput, to about 274 MiB/s over
>>> a
>>> USB3 link, vs. 127 MiB/s using IIO's fileio interface + write() to
>>> the
>>> FunctionFS endpoints, for a lower CPU usage (0.85 vs. 0.65 load
>>> avg.).
>>>
>>> Based on linux-next/next-20231219.
>>>
>>> Cheers,
>>> -Paul
>>>
>>> [1]
>>> https://lore.kernel.org/all/20230807112113.47157-1-paul@crapouillou.net/
>>> [2]
>>> https://lore.kernel.org/all/20230403154800.215924-1-paul@crapouillou.net/
>>> [3]
>>> https://github.com/analogdevicesinc/libiio/tree/pcercuei/dev-new-dmabuf-api
>>> [4]
>>> https://lore.kernel.org/all/20230322092118.9213-1-paul@crapouillou.net/
>>>
>>> ---
>>> Changelog:
>>> - [3/8]: Replace V3's dmaengine_prep_slave_dma_array() with a new
>>>     dmaengine_prep_slave_dma_vec(), which uses a new 'dma_vec'
>>> struct.
>>>     Note that at some point we will need to support cyclic transfers
>>>     using dmaengine_prep_slave_dma_vec(). Maybe with a new "flags"
>>>     parameter to the function?
>>>
>>> - [4/8]: Implement .device_prep_slave_dma_vec() instead of V3's
>>>     .device_prep_slave_dma_array().
>>>
>>>     @Vinod: this patch will cause a small conflict with my other
>>>     patchset adding scatter-gather support to the axi-dmac driver.
>>>     This patch adds a call to axi_dmac_alloc_desc(num_sgs), but the
>>>     prototype of this function changed in my other patchset - it
>>> would
>>>     have to be passed the "chan" variable. I don't know how you
>>> prefer it
>>>     to be resolved. Worst case scenario (and if @Jonathan is okay
>>> with
>>>     that) this one patch can be re-sent later, but it would make
>>> this
>>>     patchset less "atomic".
>>>
>>> - [5/8]:
>>>     - Use dev_err() instead of pr_err()
>>>     - Inline to_iio_dma_fence()
>>>     - Add comment to explain why we unref twice when detaching
>>> dmabuf
>>>     - Remove TODO comment. It is actually safe to free the file's
>>>       private data even when transfers are still pending because it
>>>       won't be accessed.
>>>     - Fix documentation of new fields in struct
>>> iio_buffer_access_funcs
>>>     - iio_dma_resv_lock() does not need to be exported, make it
>>> static
>>>
>>> - [7/8]:
>>>     - Use the new dmaengine_prep_slave_dma_vec().
>>>     - Restrict to input buffers, since output buffers are not yet
>>>       supported by IIO buffers.
>>>
>>> - [8/8]:
>>>     Use description lists for the documentation of the three new
>>> IOCTLs
>>>     instead of abusing subsections.
>>>
>>> ---
>>> Alexandru Ardelean (1):
>>>     iio: buffer-dma: split iio_dma_buffer_fileio_free() function
>>>
>>> Paul Cercueil (7):
>>>     iio: buffer-dma: Get rid of outgoing queue
>>>     dmaengine: Add API function dmaengine_prep_slave_dma_vec()
>>>     dmaengine: dma-axi-dmac: Implement device_prep_slave_dma_vec
>>>     iio: core: Add new DMABUF interface infrastructure
>>>     iio: buffer-dma: Enable support for DMABUFs
>>>     iio: buffer-dmaengine: Support new DMABUF based userspace API
>>>     Documentation: iio: Document high-speed DMABUF based API
>>>
>>>    Documentation/iio/dmabuf_api.rst              |  54 +++
>>>    Documentation/iio/index.rst                   |   2 +
>>>    drivers/dma/dma-axi-dmac.c                    |  40 ++
>>>    drivers/iio/buffer/industrialio-buffer-dma.c  | 242 ++++++++---
>>>    .../buffer/industrialio-buffer-dmaengine.c    |  52 ++-
>>>    drivers/iio/industrialio-buffer.c             | 402
>>> ++++++++++++++++++
>>>    include/linux/dmaengine.h                     |  25 ++
>>>    include/linux/iio/buffer-dma.h                |  33 +-
>>>    include/linux/iio/buffer_impl.h               |  26 ++
>>>    include/uapi/linux/iio/buffer.h               |  22 +
>>>    10 files changed, 836 insertions(+), 62 deletions(-)
>>>    create mode 100644 Documentation/iio/dmabuf_api.rst
>>>
> 
