Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 801A084B76F
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 15:08:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83D09112C31;
	Tue,  6 Feb 2024 14:08:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="Va0OfujC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CE0E112C16
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Feb 2024 13:57:07 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-40f030bf978so9840325e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Feb 2024 05:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1707227826; x=1707832626; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=kb3EfwQ1MJaeA9+O1qYrsLSl0T9nvfGVDQWyYC/ou2o=;
 b=Va0OfujCCqhQ3sA17wVJsYkaW0j13/i6pPuldIdooh07RsXB8WeUujyVmuWi1As+s5
 KZAUsi8ci6LdYcm8kIeu7W65qrc1ajlTexE28RDIouS3ksnXWgZL/A4e6Z+WkMissknM
 ZXRzt4VX7jOLuY+yNVEBRJVK9YFCRYst6x5lQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707227826; x=1707832626;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kb3EfwQ1MJaeA9+O1qYrsLSl0T9nvfGVDQWyYC/ou2o=;
 b=Bq+jWnTUg6Os5CtFEtoTO03GPQcEH6+mVdARtLjHIYA6sBDBnO0sx7Up4J5pg96xTo
 RGKDycH7EBJFd5yEBmBH7Pix7LtIgrO7LUAGqBMRxhCnNenL8MDiFEEGe+/w2qoYgp14
 eECzzg2dNjkmwl/M9klSoUTTPKHYytT4GE8mos+T5+Ga2eoWGCq4NBiVi+ITep+CTXgd
 TyCj5iqavLoDScH/dX7Z4quZhF1FexJz3eW1sTGX9xv34ImJbpNdf516+DAP8+jne4SG
 hHul02685pws0gbGJItAdMFkJ+RCp/2f1Us/DOEbtEkWtZPIJRrUjcClbF9+GIe5jKy/
 IH1w==
X-Gm-Message-State: AOJu0Yz7KAZw4R0k072IhoPDk/HkiuMD9Zu5kPgzpju/TeeEM5w+YXbN
 bIyK0R/LA7s5IrCTzbQjmxJZA7XECkGtPs412Rg8BVWfpXew9jcmj+nTWgqL/gI=
X-Google-Smtp-Source: AGHT+IFOqn0cbJK+WY/X2jzsNFe5DlfE9RRoN3pYgv6uF/Bp/mQ+6ZreQmabY1RjWhfdxFOF8hFqgg==
X-Received: by 2002:a05:600c:1d07:b0:40f:dd10:180f with SMTP id
 l7-20020a05600c1d0700b0040fdd10180fmr2171433wms.3.1707227826124; 
 Tue, 06 Feb 2024 05:57:06 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCVlNRdjfnrbeDjDbrCKYEBO3kd6rGhLpeMtXIG9oqKa+D8JDxEGy5DMCrqpoHSWZs0/bNypXMCfWtNtUPqoesQgAB0H6Daunh1Zgxlc+2Ut33t2ErRQSVGy8smjuSRGtY0tvTXLVh7k2qgPJ93b3ErEDdLGeMwVxq55VuThizfQDT/p92QBrVwVt6BC9+X/SgRZrG0aownrL7ZHiM5971IDJlkOtrvm6vm9btDr7rv6V6gklC7NhCAFtqZc8Pe/XJ7+9n2Rv5Auu909IPa39tT735ZRStAPQXX0KhuLsVAp7u7JKEaZy/OQBZ7OyT7GVfzIqxz+sgDsJt66dHh2BvC1uWUyIwCoa0jWx1h5P8wd7yKn0PYKtKi83LfG4m6t2/LSboEDvEmcshMx0eJHZjkLyWzcDWnLXG0SAj4nS4G+WWjIVaUS8optm2+U6EPGTnjDirg8XZAwCT2sFJbsh9+wpp7btXrzOT/ocxKYjY8ji4cYLruFDMZrZtrTNBc7+j0i3Mnw/EvN2ackeUuZ4g==
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a5d50c6000000b0033afcc069c3sm2153649wrt.84.2024.02.06.05.57.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Feb 2024 05:57:05 -0800 (PST)
Date: Tue, 6 Feb 2024 14:57:03 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>,
 Jonathan Cameron <jic23@kernel.org>,
 Nuno =?iso-8859-1?Q?S=E1?= <noname.nuno@gmail.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 linux-usb@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Christoph Hellwig <hch@lst.de>
Subject: Re: [Linaro-mm-sig] Re: [PATCH v5 1/6] dma-buf: Add
 dma_buf_{begin,end}_access()
Message-ID: <ZcI6r_F1RQf8MCrq@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>, 
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Jonathan Cameron <jic23@kernel.org>,
 Nuno =?iso-8859-1?Q?S=E1?= <noname.nuno@gmail.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 linux-usb@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Christoph Hellwig <hch@lst.de>
References: <2ac7562c-d221-409a-bfee-1b3cfcc0f1c6@amd.com>
 <ZbKiCPhRvWaz4Icn@phenom.ffwll.local>
 <c97e38ee-b860-4990-87f1-3e59d7d9c999@amd.com>
 <Zbi6zQYtnfOZu5Wh@phenom.ffwll.local>
 <a2346244-e22b-4ff6-b6cd-1da7138725ae@amd.com>
 <7eec45a95808afe94ac65a8518df853356ecf117.camel@crapouillou.net>
 <ZbjSJi07gQhZ4WMC@phenom.ffwll.local>
 <1d912523-b980-4386-82b2-8d79808398c1@amd.com>
 <ZboNyju8h4vfSd7v@phenom.ffwll.local>
 <b2906521-998f-4a65-adb2-23caff207a4a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b2906521-998f-4a65-adb2-23caff207a4a@gmail.com>
X-Operating-System: Linux phenom 6.6.11-amd64 
X-Mailman-Approved-At: Tue, 06 Feb 2024 14:08:39 +0000
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

On Tue, Feb 06, 2024 at 02:28:35PM +0100, Christian König wrote:
> Am 31.01.24 um 10:07 schrieb Daniel Vetter:
> > On Tue, Jan 30, 2024 at 02:09:45PM +0100, Christian König wrote:
> > > Am 30.01.24 um 11:40 schrieb Daniel Vetter:
> > > > On Tue, Jan 30, 2024 at 10:48:23AM +0100, Paul Cercueil wrote:
> > > > > Le mardi 30 janvier 2024 à 10:23 +0100, Christian König a écrit :
> > > > > >    I would say we start with the DMA-API by getting away from sg_tables
> > > > > > to something cleaner and state oriented.
> > > > > FYI I am already adding a 'dma_vec' object in my IIO DMABUF patchset,
> > > > > which is just a dead simple
> > > > > 
> > > > > struct dma_vec {
> > > > >     dma_addr_t addr;
> > > > >     size_t len;
> > > > > };
> > > > > 
> > > > > (The rationale for introducing it in the IIO DMABUF patchset was that
> > > > > the "scatterlist" wouldn't allow me to change the transfer size.)
> > > > > 
> > > > > So I believe a new "sg_table"-like could just be an array of struct
> > > > > dma_vec + flags.
> > > > Yeah that's pretty much the proposal I've seen, split the sg table into
> > > > input data (struct page + len) and output data (which is the dma_addr_t +
> > > > len you have above).
> > > I would extend that a bit and say we have an array with
> > > dma_addr+power_of_two_order and a header structure with lower bit offset and
> > > some DMA transaction flags.
> > > 
> > > But this is something which can be worked as an optimization later on. For a
> > > start this proposal here looks good to me as well.
> > > 
> > > > The part I don't expect to ever happen, because it hasn't the past 20 or
> > > > so years, is that the dma-api will give us information about what is
> > > > needed to keep the buffers coherency between various devices and the cpu.
> > > Well maybe that's what we are doing wrong.
> > > 
> > > Instead of asking the dma-api about the necessary information we should give
> > > the API the opportunity to work for us.
> > > 
> > > In other words we don't need the information about buffer coherency what we
> > > need is that the API works for as and fulfills the requirements we have.
> > > 
> > > So the question is really what should we propose to change on the DMA-api
> > > side to get this working as expected?
> > So one thing I've been pondering, kinda picking up your point about CXL,
> > is that we do make the coherency protocol more explicit by adding a
> > coherency mode to dma_buf that the exporter sets. Some ideas for values
> > this could have:
> > 
> > - ATTOMIC_COHERENT: Fully cache coherent, including device/cpu atomis.
> >    This would be for CXL. Non-CXL devices could still participate with the
> >    old model using explicit devices flushes, but must at comply with
> >    CPU_COHERENT.
> > 
> >    There's also the power9-only nvlink that would fit here, but I guess
> >    going forward CXL (and cache-coherent integrated gpu) would really be
> >    the only users of this flag.
> > 
> >    Peer2peer would have the same rules, otherwise doesn't really make
> >    sense. Also we might want to forbib non-CXL imports for these buffers
> >    maybe even? Not sure on that.
> > 
> > - CPU_COHERENT: device transactions do snoop cpu devices caches, but
> >    devices might do their own caching which isn't snooped by the cpu and
> >    needs explicit device-side invalidate/flushing. This means pcie
> >    importers are not allowed to use pcie no-snoop transactions, intel igpu
> >    wouldn't be allowed to use MOCS that do the same, similar for arm
> >    integrated devices.
> > 
> >    Importers can skip all explicit cache management apis like
> >    dma_buf_begin/end_cpu_access, or the newly proposed
> >    dma_buf_begin/end_device_access here.
> > 
> >    We'd need to figure out what exactly this means for peer2peer
> >    transactions, I have no idea whether the no-snoop flag even does
> >    anything for those.
> > 
> >    We might also want to split up CPU_COHERENT into CPU_COHERENT_WB and
> >    CPU_WOHERENT_WC, so that importers know whether cpu reads are going to
> >    be crawling or not.
> > 
> > - MEMORY_COHERENT: devices transactions do not snoop any caches, but
> >    promise that all transactions are fully flushed to system memory. Any
> >    devices transactions which do fill cpu caches must call the proposed
> >    dma_buf_begin/end_device_access functions proposed here. Any cpu access
> >    must be braketed by calls to dma_buf_begin/end_cpu_access.
> > 
> >    If your device does fill cpu caches, then essentially you'd not be able
> >    to import such buffers. Not sure whether we need to put the
> >    responsibility of checking that onto importers or exporters. Ideally
> >    core dma-buf.c code would check this.
> > 
> >    Also maybe the cpu WC mapping mode would actually need to be a sub-mode
> >    for MEMORY_COHERENT, because all cpu wc achieves is to avoid the need to
> >    call dma_buf_begin/end_cpu_access, you would still need your devices to
> >    be memory coherent. And if they're not, then you cannot use that
> >    dma-buf.
> > 
> >    Or maybe alternatively we need to guarantee that exporters which set
> >    MEMORY_COHERENT implement dma_buf_begin/end_device_access to make things
> >    work for these cpu-coherent but not memory-coherent devices. This
> >    becomes very tricky with device/arch/bus specific details I think.
> > 
> > - DMA_API_COHERENT: The memory is allocated or mapped by the dma-api, and
> >    the exact coherency mode is not know. Importers _must_ braket all cpu
> >    and device access with the respective dma_buf functions. This is
> >    essentially the "we have no idea" default.
> > 
> >    Note that exporters might export memory allocated with dma_map_alloc
> >    with MEMORY_COHERENT or CPU_COHERENT if they know how the memory exactly
> >    works. E.g. for most arm soc gpu/display drivers we can assume that the
> >    dma-api gives us MEMORY_COHERENT or CPU_COHERENT_WC, and just use that.
> >    Essentially this would make the current implicit assumptions explicit.
> > 
> >    udmabuf would need to set this, definitely if Paul's patches to add the
> >    explicit device flushes land.
> > 
> > - DEFAULT_COHERENT: This would be the backwards compat legacy yolo
> >    behvaior. I'm not sure whether we should alias that with
> >    DMA_API_COHERENT or leave it as a special value to mark exporters which
> >    haven't been updated for the much more explicit coherency handling yet.
> > 
> >    The specification for this coherency mode would be a flat out "who
> >    knows, just don't break existing use-cases with actual users".
> >    Essentially the only reason we'd have this would be to make sure we can
> >    avoid regressions of these existing use-cases, by keeping whatever
> >    horrible heuristics we have in current exporters.
> > 
> >    It would also allow us to convert exporters and importers on a case by
> >    case basis.
> > 
> > Note that all these coherency modes are defined in terms of bus-sepecific
> > device access and in terms of dma_buf apis the importer must call or can
> > skip. This way we'd avoid having to change the dma-api in a first step,
> > and if this all works out properly we could then use the resulting dma-api
> > as a baseline to propose dma-api extensions.
> 
> When I read this for the first time my initial impression was that the idea
> mostly looked good, but while thinking about it more and more I came to the
> conclusion that this would go into the wrong direction.
> 
> Maybe I'm repeating myself, but I think we first of all have to talk a bit
> about some aspects of coherency:
> 
> 1. Intra device coherency. This means that intra devices caches are
> invalidated before beginning an operation and flushed before signaling that
> an operation finished.
> 
> 2. Inter device and device to CPU coherency. This means that caches which
> sit in between devices and between devices and the CPU need to be
> invalidated and flushed appropriately when buffers are accessed by different
> parties.
> 
> Number 1 is device specific, part of the DMA-buf framework and handled by
> dma_fences. As far as I can see that part is actually quite well designed
> and I don't see any obvious need for change.
> 
> Number 2 is platform specific and I completely agree with the DMA-api folks
> that this doesn't belong into DMA-buf in the first place. That's why I think
> the begin_cpu_access()/end_cpu_access() callbacks are actually a bit
> misplaced. We still can use those in the exporter, but to make better buffer
> placement decisions, but should not invalidate any caches when they are
> called.

I don't think there's cases where we can avoid the cache management in
begin/end_cpu_access, because there are SoC out there with the following
constraints:

- Device access is not coherent with cpu caches, no snooping going on at
  all. Device2device dma is fully coherent though (since there's no caches
  to take care of at all).

- Mapping as write-combined on the cpu is not possible. Not every platform
  is reasonable and has something like pat with cache control in each pte.
  Or they have, but in practice it's not useable.

Which means your options are only a) no cpu access b) bracket cpu access
with cache management. So I'm not sure what exactly you have in mind here,
since people really don't like a) that's why we added that cpu access
braketing stuff?

Also what exactly would you do in begin/end_cpu_access instead of cache
management? Note that you kinda need to call dma_buf_vmap (for kernel
access) or dma_buf_mmap (for userspace) before you can call these, and any
placement changes should be done in those functions and not in
begin/end_cpu_access. Especially for dma_buf_vmap the buffer must be
pinned, so you have no other choice. And for userspace you'd need fault
handlers, you cannot rely on the begin/end ioct calls, because that would
defacto make those into a pin/unpin ioctl, which defeats the point of
having more dynamic memory management for these buffers.

> The flushing and invalidation for platform caches should really be in the
> DMA-buf framework and not the exporter.
> 
> So in my thinking the enumeration you outlined above should really go into
> struct device and explaining to everybody what the coherency properties of
> DMA operations of this device is.

So that's the part that I think dma-api folks really don't like. They
don't want higher levels to know about cache management at all, so I don't
see how we can make this happen.

The other issue is that we have a ton of exporter which flaunt the dma-api
rules for their platform/device, e.g. x86 is officially fully cache
coherent. Except integrated gpu/camera isp are not, and for rendering you
can select the coherency mode on a per-transaction level in the cs
packets.

So putting this into a struct device flags is not going to work I think
for these two cases: for dma-api allocated/managed memory I don't
think'll get it, and for stuff like i915-gem it's too strict, we need at
least a per-buffer flag for this.

> > I think starting right out with designing dma-api extension is a few
> > bridges too far. Both from a "how do we convince upstream" pov, but maybe
> > even more from a "how do we figure out what we even need" pov.
> 
> Well I totally agree on the "how do we figure out what we even need", but I
> disagree a bit on that we don't know what DMA-api extension we need.
> 
> We don't have the full picture yet, but as I already outlined from the
> DMA-api pov we have two major things on our TODO list:
> 
> 1. Somehow remove the struct pages from the DMA-buf *importer* API.
> 
>     My best suggestion at the moment for this is to split sg_tables into two
> data structures, one for the struct pages and one for the DMA addresses.
> 
>     Mangling the addresses to ensure that no importer messes with the struct
> pages was a good step, but it also creates problems when
> dma_sync_sg_for_cpu() dma_sync_for_device() are supposed to be called.

Hm yeah we need to temporarily unmangle those around those calls. Since
it's a debug only option this should't be a big deal.

I agree that eventually we should aim towards splitting this properly, but
I think as long as the dma-api itself isn't there yet, it doesn't make too
much sense to charge ahead in dma-buf code.

> 2. Add some dma_sync_sg_between_devices(A, B....).
> 
>     And on this I think we are on the same page that we are going to need
> this, but we are just not clear on who is going to use it.

Yeah I think this we might be able to eventually get added to dma-api. But
I think that's only on the table once
- we have this in dma-buf code (can be in dma-buf.c or in exporters, I'm
  not extremely opionated about this).
- we have real-world use-cases where fusing superflous caches management
  operations with the existing dma_sync_sg_for_device/cpu actually matters
- someone's willing to roll out the infrastructure work - altough a
  default implementation that just calss dma_sync_sg_for_device/cpu in the
  right order is probably good enough as fallback for most platforms.

I think the other issue is that all this is multi-year projects with a lot
of effort, and I think we need something that will work a lot sooner for
Paul's use-case here.

Cheers, Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
