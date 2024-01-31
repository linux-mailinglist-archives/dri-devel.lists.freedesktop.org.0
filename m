Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E676F843A54
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 10:09:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81F3010F452;
	Wed, 31 Jan 2024 09:08:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD51E10F452
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jan 2024 09:08:27 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-a3169f46d73so114427166b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jan 2024 01:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1706692046; x=1707296846; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=1nyHmju9XQ/E8K2Rl2IixeUYmuUjABoJpLGoEfLLyas=;
 b=GmfKon/xWrVSXD431NXbIELwtNoU3uVrmQS8a+Cq9kZivNX1hH7ionLDj5NU09cgqv
 Y4SV5QX/XSXIbYlguoTBgBK3vTwADk5FjQZFHyTESLmEnwdUVgZzrGXHgdRvZEYZ0+ih
 QnlIRm0xzHbKbqULZuhUKrw9C3VYq6rMyEOc0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706692046; x=1707296846;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1nyHmju9XQ/E8K2Rl2IixeUYmuUjABoJpLGoEfLLyas=;
 b=ErS9aMbx2TiLwp8UD4QeZthmcKhSkF+RpAjjaK0BZhxbgUDpNVGyP1aTsR6Ha8Hyld
 kFpaQX64+9HfE3r/hqIdiK0RhVB0kGmsL3vWl4x1glIP3kmmyxVhdT/aLfS08E4mUYj5
 R/dUsXtQ95VGuC9bsASMX5Pn/pypBXlgAXYWbWG1uGf0n0NhIg7bh5ZfK9uvcb1U6kH2
 riGmZmW5+QWJicAPWSCVRIoX3GKSNaGWSmE/RDrlE1BAOxR/7i72tyDa0TwNyOqEdOZF
 A/lpBJs7CNbRUHpNjJohMGV68kIqXWNkqpEsQZB1VnvYGFMnTV3EaTV047A2q7QN+Z5r
 lMDQ==
X-Forwarded-Encrypted: i=0;
 AJvYcCUg3LruYTCX0oV6zSdxsIK9yAwh4JQxSqqd31yT7m9CqAr9QE0TZbZpK9FCoLVKPejt5oH9j5KXm4nKjMib5WtQH+PdF2CgGfy+CrKHLIvT
X-Gm-Message-State: AOJu0YzKwkIxsCyFiLaTes6vSpJTIH+3oP+2+FUZlBJEChT0fSzazlmm
 4y51NtzeLf1gCdGQ6k2a4hKjIWYM2xIeDW6yQroI9c65hMULQkMb353Ej437Mgj/teChcGHy8wZ
 8
X-Google-Smtp-Source: AGHT+IHB5eqCZmKzcjc2g7JPPAdNArJ7kHHK+OzqhPuyUPAp6vhMz/LdxOxvFmt5K7lTdhhiKUG0EQ==
X-Received: by 2002:a17:906:4887:b0:a36:63d6:2886 with SMTP id
 v7-20020a170906488700b00a3663d62886mr583896ejq.3.1706692045444; 
 Wed, 31 Jan 2024 01:07:25 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 rs6-20020a170907890600b00a26d20a48dasm5966647ejc.125.2024.01.31.01.07.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Jan 2024 01:07:24 -0800 (PST)
Date: Wed, 31 Jan 2024 10:07:22 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [Linaro-mm-sig] Re: [PATCH v5 1/6] dma-buf: Add
 dma_buf_{begin,end}_access()
Message-ID: <ZboNyju8h4vfSd7v@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, 
 Paul Cercueil <paul@crapouillou.net>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
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
References: <577501f9-9d1c-4f8d-9882-7c71090e5ef3@amd.com>
 <7928c0866ac5b2bfaaa56ad3422bedc9061e0f7b.camel@crapouillou.net>
 <2ac7562c-d221-409a-bfee-1b3cfcc0f1c6@amd.com>
 <ZbKiCPhRvWaz4Icn@phenom.ffwll.local>
 <c97e38ee-b860-4990-87f1-3e59d7d9c999@amd.com>
 <Zbi6zQYtnfOZu5Wh@phenom.ffwll.local>
 <a2346244-e22b-4ff6-b6cd-1da7138725ae@amd.com>
 <7eec45a95808afe94ac65a8518df853356ecf117.camel@crapouillou.net>
 <ZbjSJi07gQhZ4WMC@phenom.ffwll.local>
 <1d912523-b980-4386-82b2-8d79808398c1@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1d912523-b980-4386-82b2-8d79808398c1@amd.com>
X-Operating-System: Linux phenom 6.6.11-amd64 
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
Cc: linaro-mm-sig@lists.linaro.org,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 linux-usb@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Christoph Hellwig <hch@lst.de>, Paul Cercueil <paul@crapouillou.net>,
 Nuno =?iso-8859-1?Q?S=E1?= <noname.nuno@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Jonathan Cameron <jic23@kernel.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 30, 2024 at 02:09:45PM +0100, Christian König wrote:
> Am 30.01.24 um 11:40 schrieb Daniel Vetter:
> > On Tue, Jan 30, 2024 at 10:48:23AM +0100, Paul Cercueil wrote:
> > > Le mardi 30 janvier 2024 à 10:23 +0100, Christian König a écrit :
> > > >   I would say we start with the DMA-API by getting away from sg_tables
> > > > to something cleaner and state oriented.
> > > FYI I am already adding a 'dma_vec' object in my IIO DMABUF patchset,
> > > which is just a dead simple
> > > 
> > > struct dma_vec {
> > >    dma_addr_t addr;
> > >    size_t len;
> > > };
> > > 
> > > (The rationale for introducing it in the IIO DMABUF patchset was that
> > > the "scatterlist" wouldn't allow me to change the transfer size.)
> > > 
> > > So I believe a new "sg_table"-like could just be an array of struct
> > > dma_vec + flags.
> > Yeah that's pretty much the proposal I've seen, split the sg table into
> > input data (struct page + len) and output data (which is the dma_addr_t +
> > len you have above).
> 
> I would extend that a bit and say we have an array with
> dma_addr+power_of_two_order and a header structure with lower bit offset and
> some DMA transaction flags.
> 
> But this is something which can be worked as an optimization later on. For a
> start this proposal here looks good to me as well.
> 
> > The part I don't expect to ever happen, because it hasn't the past 20 or
> > so years, is that the dma-api will give us information about what is
> > needed to keep the buffers coherency between various devices and the cpu.
> 
> Well maybe that's what we are doing wrong.
> 
> Instead of asking the dma-api about the necessary information we should give
> the API the opportunity to work for us.
> 
> In other words we don't need the information about buffer coherency what we
> need is that the API works for as and fulfills the requirements we have.
> 
> So the question is really what should we propose to change on the DMA-api
> side to get this working as expected?

So one thing I've been pondering, kinda picking up your point about CXL,
is that we do make the coherency protocol more explicit by adding a
coherency mode to dma_buf that the exporter sets. Some ideas for values
this could have:

- ATTOMIC_COHERENT: Fully cache coherent, including device/cpu atomis.
  This would be for CXL. Non-CXL devices could still participate with the
  old model using explicit devices flushes, but must at comply with
  CPU_COHERENT.

  There's also the power9-only nvlink that would fit here, but I guess
  going forward CXL (and cache-coherent integrated gpu) would really be
  the only users of this flag.

  Peer2peer would have the same rules, otherwise doesn't really make
  sense. Also we might want to forbib non-CXL imports for these buffers
  maybe even? Not sure on that.

- CPU_COHERENT: device transactions do snoop cpu devices caches, but
  devices might do their own caching which isn't snooped by the cpu and
  needs explicit device-side invalidate/flushing. This means pcie
  importers are not allowed to use pcie no-snoop transactions, intel igpu
  wouldn't be allowed to use MOCS that do the same, similar for arm
  integrated devices.

  Importers can skip all explicit cache management apis like
  dma_buf_begin/end_cpu_access, or the newly proposed
  dma_buf_begin/end_device_access here.

  We'd need to figure out what exactly this means for peer2peer
  transactions, I have no idea whether the no-snoop flag even does
  anything for those.

  We might also want to split up CPU_COHERENT into CPU_COHERENT_WB and
  CPU_WOHERENT_WC, so that importers know whether cpu reads are going to
  be crawling or not.

- MEMORY_COHERENT: devices transactions do not snoop any caches, but
  promise that all transactions are fully flushed to system memory. Any
  devices transactions which do fill cpu caches must call the proposed
  dma_buf_begin/end_device_access functions proposed here. Any cpu access
  must be braketed by calls to dma_buf_begin/end_cpu_access.

  If your device does fill cpu caches, then essentially you'd not be able
  to import such buffers. Not sure whether we need to put the
  responsibility of checking that onto importers or exporters. Ideally
  core dma-buf.c code would check this.

  Also maybe the cpu WC mapping mode would actually need to be a sub-mode
  for MEMORY_COHERENT, because all cpu wc achieves is to avoid the need to
  call dma_buf_begin/end_cpu_access, you would still need your devices to
  be memory coherent. And if they're not, then you cannot use that
  dma-buf.

  Or maybe alternatively we need to guarantee that exporters which set
  MEMORY_COHERENT implement dma_buf_begin/end_device_access to make things
  work for these cpu-coherent but not memory-coherent devices. This
  becomes very tricky with device/arch/bus specific details I think.

- DMA_API_COHERENT: The memory is allocated or mapped by the dma-api, and
  the exact coherency mode is not know. Importers _must_ braket all cpu
  and device access with the respective dma_buf functions. This is
  essentially the "we have no idea" default.

  Note that exporters might export memory allocated with dma_map_alloc
  with MEMORY_COHERENT or CPU_COHERENT if they know how the memory exactly
  works. E.g. for most arm soc gpu/display drivers we can assume that the
  dma-api gives us MEMORY_COHERENT or CPU_COHERENT_WC, and just use that.
  Essentially this would make the current implicit assumptions explicit.

  udmabuf would need to set this, definitely if Paul's patches to add the
  explicit device flushes land.

- DEFAULT_COHERENT: This would be the backwards compat legacy yolo
  behvaior. I'm not sure whether we should alias that with
  DMA_API_COHERENT or leave it as a special value to mark exporters which
  haven't been updated for the much more explicit coherency handling yet.

  The specification for this coherency mode would be a flat out "who
  knows, just don't break existing use-cases with actual users".
  Essentially the only reason we'd have this would be to make sure we can
  avoid regressions of these existing use-cases, by keeping whatever
  horrible heuristics we have in current exporters.

  It would also allow us to convert exporters and importers on a case by
  case basis.

Note that all these coherency modes are defined in terms of bus-sepecific
device access and in terms of dma_buf apis the importer must call or can
skip. This way we'd avoid having to change the dma-api in a first step,
and if this all works out properly we could then use the resulting dma-api
as a baseline to propose dma-api extensions.

I think starting right out with designing dma-api extension is a few
bridges too far. Both from a "how do we convince upstream" pov, but maybe
even more from a "how do we figure out what we even need" pov.

> Regards,
> Christian.
> 
> 
> 
> 
> 
> > -Sima
> 
> _______________________________________________
> Linaro-mm-sig mailing list -- linaro-mm-sig@lists.linaro.org
> To unsubscribe send an email to linaro-mm-sig-leave@lists.linaro.org

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
