Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE86C6F518B
	for <lists+dri-devel@lfdr.de>; Wed,  3 May 2023 09:31:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C92B610E1BF;
	Wed,  3 May 2023 07:30:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1118 seconds by postgrey-1.36 at gabe;
 Tue, 02 May 2023 12:34:35 UTC
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0B8910E04D
 for <dri-devel@lists.freedesktop.org>; Tue,  2 May 2023 12:34:35 +0000 (UTC)
Received: from frapeml500002.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Q9f8p2tH7z6J6nt;
 Tue,  2 May 2023 20:12:26 +0800 (CST)
Received: from [10.45.146.102] (10.45.146.102) by
 frapeml500002.china.huawei.com (7.182.85.205) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 2 May 2023 14:15:52 +0200
Message-ID: <e05b416d-a298-cf71-0c04-a1fe6b993bf7@huawei.com>
Date: Tue, 2 May 2023 14:15:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 0/7] Allow dynamic allocation of software IO TLB bounce
 buffers
Content-Language: en-US
To: Mike Lothian <mike@fireburn.co.uk>, =?UTF-8?B?UGV0ciBUZXNhxZnDrWs=?=
 <petr@tesarici.cz>
References: <cover.1681898595.git.petr.tesarik.ext@huawei.com>
 <CAHbf0-HwQhFsYW8cp0t9660877b9tTxZBego7VSfx0ayAwKePQ@mail.gmail.com>
 <20230428110735.4348511d@meshulam.tesarici.cz>
 <CAHbf0-HnctoNN3AQoCeCfd-d7ppKBhWJHD+EbfmbfeTkbS1jqg@mail.gmail.com>
From: Petr Tesarik <petr.tesarik.ext@huawei.com>
In-Reply-To: <CAHbf0-HnctoNN3AQoCeCfd-d7ppKBhWJHD+EbfmbfeTkbS1jqg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.45.146.102]
X-ClientProxiedBy: frapeml500008.china.huawei.com (7.182.85.71) To
 frapeml500002.china.huawei.com (7.182.85.205)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 03 May 2023 07:30:49 +0000
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Muchun Song <muchun.song@linux.dev>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Kim Phillips <kim.phillips@amd.com>, Will Deacon <will@kernel.org>,
 Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>, "open
 list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 "open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>,
 Borislav Petkov <bp@suse.de>, Won Chung <wonchung@google.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "Paul E. McKenney" <paulmck@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 "Steven Rostedt \(Google\)" <rostedt@goodmis.org>,
 Zhen Lei <thunder.leizhen@huawei.com>, Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Petr Tesarik <petr.tesarik.ext@huawei.com>, Kees Cook <keescook@chromium.org>,
 Ondrej Zary <linux@zary.sk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Roberto Sassu <roberto.sassu@huawei.com>,
 open list <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Mike,

On 5/1/2023 12:29 PM, Mike Lothian wrote:
> Hi
> 
> I've not had any issues since using this, but I imagine most people
> won't know how to set swiotlb=dynamic if they start seeing this (when
> it lands)
> 
> Any clue as to why this broke last cycle?

IIRC the kernel messages indicate high swiotlb utilization. The most
likely cause is that either the wifi driver is using more DMA buffers at
once, or another device driver is now using swiotlb; it could also be a
driver for a device that was previously not supported.

If you're adventurous, you can use ftrace to capture the backtraces of
swiotlb_tbl_map_single. This would reveal the other driver. Debugging
increased DMA buffer usage by your wifi driver may be more difficult,
because that's a dynamic process, which may change dramatically if you
add some sort of tracing into the picture... As always, YMMV.

Petr T

> Mike
> 
> On Fri, 28 Apr 2023 at 10:07, Petr Tesařík <petr@tesarici.cz> wrote:
>>
>> On Fri, 28 Apr 2023 09:53:38 +0100
>> Mike Lothian <mike@fireburn.co.uk> wrote:
>>
>>> On Wed, 19 Apr 2023 at 11:05, Petr Tesarik <petrtesarik@huaweicloud.com> wrote:
>>>>
>>>> From: Petr Tesarik <petr.tesarik.ext@huawei.com>
>>>>
>>>> The goal of my work is to provide more flexibility in the sizing of
>>>> SWIOTLB.
>>>>
>>>> The software IO TLB was designed with these assumptions:
>>>>
>>>> 1. It would not be used much, especially on 64-bit systems.
>>>> 2. A small fixed memory area (64 MiB by default) is sufficient to
>>>>    handle the few cases which require a bounce buffer.
>>>> 3. 64 MiB is little enough that it has no impact on the rest of the
>>>>    system.
>>>>
>>>> First, if SEV is active, all DMA must be done through shared
>>>> unencrypted pages, and SWIOTLB is used to make this happen without
>>>> changing device drivers. The software IO TLB size is increased to
>>>> 6% of total memory in sev_setup_arch(), but that is more of an
>>>> approximation. The actual requirements may vary depending on the
>>>> amount of I/O and which drivers are used. These factors may not be
>>>> know at boot time, i.e. when SWIOTLB is allocated.
>>>>
>>>> Second, other colleagues have noticed that they can reliably get
>>>> rid of occasional OOM kills on an Arm embedded device by reducing
>>>> the SWIOTLB size. This can be achieved with a kernel parameter, but
>>>> determining the right value puts additional burden on pre-release
>>>> testing, which could be avoided if SWIOTLB is allocated small and
>>>> grows only when necessary.
>>>>
>>>> Changes from v1-devel-v7:
>>>> - Add comments to acquire/release barriers
>>>> - Fix whitespace issues reported by checkpatch.pl
>>>>
>>>> Changes from v1-devel-v6:
>>>> - Provide long description of functions
>>>> - Fix kernel-doc (Returns: to Return:)
>>>> - Rename __lookup_dyn_slot() to lookup_dyn_slot_locked()
>>>>
>>>> Changes from RFC:
>>>> - Track dynamic buffers per device instead of per swiotlb
>>>> - Use a linked list instead of a maple tree
>>>> - Move initialization of swiotlb fields of struct device to a
>>>>   helper function
>>>> - Rename __lookup_dyn_slot() to lookup_dyn_slot_locked()
>>>> - Introduce per-device flag if dynamic buffers are in use
>>>> - Add one more user of DMA_ATTR_MAY_SLEEP
>>>> - Add kernel-doc comments for new (and some old) code
>>>> - Properly escape '*' in dma-attributes.rst
>>>>
>>>> Petr Tesarik (7):
>>>>   swiotlb: Use a helper to initialize swiotlb fields in struct device
>>>>   swiotlb: Move code around in preparation for dynamic bounce buffers
>>>>   dma-mapping: introduce the DMA_ATTR_MAY_SLEEP attribute
>>>>   swiotlb: Dynamically allocated bounce buffers
>>>>   swiotlb: Add a boot option to enable dynamic bounce buffers
>>>>   drm: Use DMA_ATTR_MAY_SLEEP from process context
>>>>   swiotlb: per-device flag if there are dynamically allocated buffers
>>>>
>>>>  .../admin-guide/kernel-parameters.txt         |   6 +-
>>>>  Documentation/core-api/dma-attributes.rst     |  10 +
>>>>  drivers/base/core.c                           |   4 +-
>>>>  drivers/gpu/drm/drm_gem_shmem_helper.c        |   2 +-
>>>>  drivers/gpu/drm/drm_prime.c                   |   2 +-
>>>>  include/linux/device.h                        |  12 +
>>>>  include/linux/dma-mapping.h                   |   6 +
>>>>  include/linux/swiotlb.h                       |  54 ++-
>>>>  kernel/dma/swiotlb.c                          | 382 ++++++++++++++++--
>>>>  9 files changed, 443 insertions(+), 35 deletions(-)
>>>>
>>>> --
>>>> 2.25.1
>>>>
>>>
>>> Hi
>>>
>>> Is this a potential fix for
>>> https://bugzilla.kernel.org/show_bug.cgi?id=217310 where I'm manually
>>> setting bigger buffers to keep my wifi working?
>>
>> Yes. With these patches applied, your system should run just fine with
>> swiotlb=dynamic. However, keep in mind that this implementation adds a
>> bit of overhead. In short, it trades a bit of performance for not
>> having to figure out the optimal swiotlb size at boot time.
>>
>> Petr T

