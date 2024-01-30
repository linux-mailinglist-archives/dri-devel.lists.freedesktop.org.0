Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D5A841E97
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 10:02:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CE3910F859;
	Tue, 30 Jan 2024 09:02:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0613D10F859
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 09:02:06 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-55369c59708so1503069a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 01:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1706605264; x=1707210064; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=iviL2+SAMhL4f4M9BrsRO99N0cHmSw6DwmN85C/fnbs=;
 b=Ng8KFMXdh8NM7s0vQDcgXmwVdgimeZJ/x2h9h5xeoKy9BFwqU1Jb5od5AMXW4MLtko
 /BjqVp2jHOWik9EipTjfi7/It8mtWIERNCn6j8QFOyBwcfH72xLBWbIpLVDT4Xo9A7DF
 CkhwBZCgf0RZHpavH4QcxEqSmUqwA6UiqRZc8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706605264; x=1707210064;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iviL2+SAMhL4f4M9BrsRO99N0cHmSw6DwmN85C/fnbs=;
 b=D6b5/MhAWR/UyKEuLjV1kVSD9XZjH/Ek3pyWqaC5De6QiV9s7yvm6iYZ0/ku7Eqj71
 RLw6/VbJP/gy2FqDR2F4/81WrYZ3ySXJQhs06EGcHomJVTBDOSmEIalIjGH5z0ghC5ZS
 qpxYR+htWfwz1I0aj8rqBYljTtk6G/q6JUA468467QX3tus+upQohr7RPW7ayYM9vGnm
 5mYCTxEWgEi7ALNDdgMRIEe6UWGUF6oDpMSwKWeXRTA4zS6S95YHmzS8LR5I8EogeNJa
 RGSax1oifBwRp/V64ahy+yT66cQY+bHH9plOcW0CrOkUeN9UwJ1aumrLKiBdHQS61V6H
 5X9Q==
X-Forwarded-Encrypted: i=0;
 AJvYcCXqiWtQkXLbCkqAzDkMDekytwpD3gUZ2SdL0xtpeqxDEE8IWxP09AY/I7ghduy6xNOtaxXbrKoEjHmaWJkLTjhMP8iJmLMVsLvdpdWPnuOs
X-Gm-Message-State: AOJu0YxSJFYv/OVWrm12J5Lu4LX71bvdrsxhMe4B1KPR6A2CJJuPkgJ7
 gsNM/dnehL9+K6pNL8QX+UF3aiFpVUFDaeoBkF2c5/wgfeKBzbaBItER1S46lPg=
X-Google-Smtp-Source: AGHT+IEEz+ER+ZYgh2X+lnwADbolE5wAPyK/z45mUwIpueFK9FUVKRy/g+fVGncVxRfL19fA0sSQhQ==
X-Received: by 2002:aa7:d9c3:0:b0:55e:fe18:157b with SMTP id
 v3-20020aa7d9c3000000b0055efe18157bmr3565284eds.3.1706605264361; 
 Tue, 30 Jan 2024 01:01:04 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 fd12-20020a056402388c00b00557d839727esm4647498edb.7.2024.01.30.01.01.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jan 2024 01:01:03 -0800 (PST)
Date: Tue, 30 Jan 2024 10:01:01 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [Linaro-mm-sig] Re: [PATCH v5 1/6] dma-buf: Add
 dma_buf_{begin,end}_access()
Message-ID: <Zbi6zQYtnfOZu5Wh@phenom.ffwll.local>
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
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <442f69f31ece6d441f3dc41c3dfeb4dcf52c00b8.camel@crapouillou.net>
 <0b6b8738-9ea3-44fa-a624-9297bd55778f@amd.com>
 <e4620acdf24628d904cedcb0030d78b14559f337.camel@crapouillou.net>
 <85a89505-edeb-4619-86c1-157f7abdd190@amd.com>
 <0fe2755fb320027234c086bcc88fd107855234c5.camel@crapouillou.net>
 <577501f9-9d1c-4f8d-9882-7c71090e5ef3@amd.com>
 <7928c0866ac5b2bfaaa56ad3422bedc9061e0f7b.camel@crapouillou.net>
 <2ac7562c-d221-409a-bfee-1b3cfcc0f1c6@amd.com>
 <ZbKiCPhRvWaz4Icn@phenom.ffwll.local>
 <c97e38ee-b860-4990-87f1-3e59d7d9c999@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c97e38ee-b860-4990-87f1-3e59d7d9c999@amd.com>
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
 Paul Cercueil <paul@crapouillou.net>,
 Nuno =?iso-8859-1?Q?S=E1?= <noname.nuno@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Jonathan Cameron <jic23@kernel.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 26, 2024 at 05:42:50PM +0100, Christian König wrote:
> Am 25.01.24 um 19:01 schrieb Daniel Vetter:
> > On Thu, Jan 25, 2024 at 04:00:16PM +0100, Christian König wrote:
> > > Am 24.01.24 um 11:58 schrieb Paul Cercueil:
> > > > [SNIP]
> > > > > > The problem was then that dma_buf_unmap_attachment cannot be called
> > > > > > before the dma_fence is signaled, and calling it after is already
> > > > > > too
> > > > > > late (because the fence would be signaled before the data is
> > > > > > sync'd).
> > > > >    Well what sync are you talking about? CPU sync? In DMA-buf that is
> > > > > handled differently.
> > > > >    For importers it's mandatory that they can be coherent with the
> > > > > exporter. That usually means they can snoop the CPU cache if the
> > > > > exporter can snoop the CPU cache.
> > > > I seem to have such a system where one device can snoop the CPU cache
> > > > and the other cannot. Therefore if I want to support it properly, I do
> > > > need cache flush/sync. I don't actually try to access the data using
> > > > the CPU (and when I do, I call the sync start/end ioctls).
> > > Usually that isn't a problem as long as you don't access the data with the
> > > CPU.
> > > 
> > > [SNIP]
> > > 
> > > > > > (and I *think* there is a way to force coherency in the
> > > > > > Ultrascale's
> > > > > > interconnect - we're investigating it)
> > > > >    What you can do is that instead of using udmabuf or dma-heaps is
> > > > > that the device which can't provide coherency act as exporters of the
> > > > > buffers.
> > > > >    The exporter is allowed to call sync_for_cpu/sync_for_device on it's
> > > > > own buffers and also gets begin/end CPU access notfications. So you
> > > > > can then handle coherency between the exporter and the CPU.
> > > > But again that would only work if the importers would call
> > > > begin_cpu_access() / end_cpu_access(), which they don't, because they
> > > > don't actually access the data using the CPU.
> > > Wow, that is a completely new use case then.
> > > 
> > > Neither DMA-buf nor the DMA subsystem in Linux actually supports this as far
> > > as I can see.
> > > 
> > > > Unless you mean that the exporter can call sync_for_cpu/sync_for_device
> > > > before/after every single DMA transfer so that the data appears
> > > > coherent to the importers, without them having to call
> > > > begin_cpu_access() / end_cpu_access().
> > > Yeah, I mean the importers don't have to call begin_cpu_access() /
> > > end_cpu_access() if they don't do CPU access :)
> > > 
> > > What you can still do as exporter is to call sync_for_device() and
> > > sync_for_cpu() before and after each operation on your non-coherent device.
> > > Paired with the fence signaling that should still work fine then.
> > > 
> > > But taking a step back, this use case is not something even the low level
> > > DMA subsystem supports. That sync_for_cpu() does the right thing is
> > > coincident and not proper engineering.
> > > 
> > > What you need is a sync_device_to_device() which does the appropriate
> > > actions depending on which devices are involved.
> > > 
> > > > In which case - this would still demultiply the complexity; my USB-
> > > > functionfs interface here (and IIO interface in the separate patchset)
> > > > are not device-specific, so I'd rather keep them importers.
> > > > >    If you really don't have coherency between devices then that would
> > > > > be a really new use case and we would need much more agreement on how
> > > > > to do this.
> > > > [snip]
> > > > 
> > > > Agreed. Desiging a good generic solution would be better.
> > > > 
> > > > With that said...
> > > > 
> > > > Let's keep it out of this USB-functionfs interface for now. The
> > > > interface does work perfectly fine on platforms that don't have
> > > > coherency problems. The coherency issue in itself really is a
> > > > tangential issue.
> > > Yeah, completely agree.
> > > 
> > > > So I will send a v6 where I don't try to force the cache coherency -
> > > > and instead assume that the attached devices are coherent between
> > > > themselves.
> > > > 
> > > > But it would be even better to have a way to detect non-coherency and
> > > > return an error on attach.
> > > Take a look into the DMA subsystem. I'm pretty sure we already have
> > > something like this in there.
> > > 
> > > If nothing else helps you could take a look if the coherent memory access
> > > mask is non zero or something like that.
> > Jumping in way late and apolgies to everyone since yes I indeed suggested
> > this entire mess to Paul in some private thread.
> > 
> > And worse, I think we need it, it's just that we got away without it thus
> > far.
> > 
> > So way back at the og dma-buf kick-off dma coherency was discussed, and a
> > few things where noted:
> > - the dma api only supports device<->cpu coherency
> > - getting the full coherency model off the ground right away is probably
> >    too hard, so we made the decision that where it matters, relevant
> >    flushing needs to be done in dma_buf_map/unmap.
> > 
> > If you look at the earliest patches for dma-buf we had pretty clear
> > language that all dma-operations should be bracketed with map/unmap. Of
> > course that didn't work out for drm at all, and we had to first get
> > dma_resv_lock and dma_fence landed and then your dynamic exporter/importer
> > support in just to get the buffer migration functionality working, which
> > was only one of the things discussed that braketing everything with
> > map/unmap was supposed to take care of.
> > 
> > The other was coherency management. But looking through archives I think
> > this was already agreed to be postponed for later in the original kick-off
> > meeting and never further discussed on the mailing list.
> > 
> > This worked for a fairly long time, because thus far dma-buf was used on
> > fairly reaasonable architectures where all participating devices are
> > coherent enough.
> > 
> > We did have to add the cpu access flushing fairly quickly because there's
> > a lot of SoC chips (including intel) where that was necessary, but even
> > that was added later on, as an opt-in and without fixing every. See
> > fc13020e086b ("dma-buf: add support for kernel cpu access").
> > 
> > The ioctl to allow userspace to do flushing was added even later on, and
> > there the entire yolo opt-in situation is even worse. c11e391da2a8
> > ("dma-buf: Add ioctls to allow userspace to flush") was only in 2016, 5
> > years after dma-buf landed.
> > 
> > It looks like it's finally time to add the device side flushing functions
> > we've talked about first over 12 years ago :-)
> > 
> > The reason this pops up now is that unlike other dma-buf users on maybe
> > somewhat more funky architectures, Paul's patches want to use dma_fence
> > for synchronization of the dma operations. Which means you cannot call the
> > full dma_buf_map/unmap dance because that takes dma_resv_lock, and
> > absolute no-go in a dma_fence critical path.
> > 
> > And yes in those 12 years the dma-api hasn't gained the device2device sync
> > support we'd need, but neither has it gained the multiple devices <-> cpu
> > sync support we'd strictly need for dma-buf. So yes this is all a terrible
> > hodge-podge of hacks, but if we'd require theoretically perfect code we'd
> > still have zero dma-buf support in upstream.
> > 
> > This also includes how we landed these extensions, none of them in the
> > past have landed with a "update all existing exporters/importers" rule. We
> > talked about that every time, and rejected it every time for imo pretty
> > good reasons - the perf impact tends to be way too harsh if you impose
> > over-flushing on everyone, including the reasonable platforms. And we
> > currently can't do less than overflushing with the current dma-api
> > interfaces because we dont have the specific flush functions we'd need. So
> > really this isn't doing a worse abuse of the dma-api than what we have.
> > It's definitely a bit wasteful since the functions we use do in theory
> > flush too much. But in practice on the these funky architectures they
> > flush enough.
> > 
> > There's also the very hard issue of actually trying to optimize flushes,
> > because a dma operation might only access part of a buffer, and you might
> > interleave read/write access by different devices in very innovative ways.
> > So I'm firmly on the "make it work first, then fast" side of things.
> > 
> > So dma-buf will continue to be a thing that's tested for specific combos,
> > and then we'll patch them. It's a decade-plus tradition at this point.
> > 
> > Which is all a very long winded way of saying that yes, I think we need
> > this, and we needed this 12 years ago already if we'd have aimed for
> > perfect.
> > 
> > I have a bunch of detail comments on the patch itself, but I guess we
> > first need to find consensus on whether it's a good idea in the first
> > place.
> 
> Well I think we should have some solution, but I'm not sure if it should be
> part of DMA-buf.
> 
> Essentially a DMA-buf exports the buffers as he uses it and the importer (or
> the DMA-buf subsystem) is then the one who says ok I can use this or I can't
> use this or I need to call extra functions to use this or whatever.
> 
> It's not the job of the exporter to provide the coherency for the importer,
> cause otherwise we would have a lot of code in the exporter which can only
> be tested when you have the right importer around. And I strongly think that
> this is a no-go for having a reliable solution.

The trouble is, that if you have other memory than stuff allocated by the
dma-api or mapped using the dma-api, then by necessity the exporter has to
deal with this.

Which is the exact same reason we also force the exporters to deal with
the cpu cache flushing - you're argument that it's not great to replicate
this everywhere holds there equally.

The other thing is that right now the exporter is the only one who
actually knows what kind of dma coherency rules apply for a certain piece
of memory. E.g. on i915-gem even if it's dma_map_sg mapped the underlying
i915-gem buffer might be non-coherent, and i915-gem makes it all work by
doing the appropriate amount of clflush.

Similar funky things happen in other cases.

So unless we add an interface which allows importers to figure out how
much flushing is needed, currently the exporter is the only one who knows
(because it can inspect the struct device at dma_buf_attach time).

We could flip this around, but it would be a rather serious depature from
the dma-buf design approach thus far.

> That's why I think the approach of having DMA-buf callbacks is most likely
> the wrong thing to do.
> 
> What should happen instead is that the DMA subsystem provides functionality
> which to devices which don't support coherency through it's connection to
> say I want to access this data, please make sure to flush the appropriate
> catches. But that's just a very very rough design idea.
> 
> This will become more with CXL at the horizon I think.

Yeah CXL will make this all even more fun, but we are firmly there already
with devices deciding per-buffer (or sometimes even per-access with
intel's MOCS stuff) what coherency mode to use for a buffer.

Also arm soc generally have both coherent and non-coherent device
interconnects, and I think some devices can switch with runtime flags too
which mode they use for a specific transition.

CXL just extends this to pcie devices.

So the mess is here, how do we deal with it?

My take is that the opt-in callback addition is far from great, but it's
in line with how we extended dma-buf the past decade plus too. So unless
someone's volunteering to pour some serious time into re-engineering this
all (including testing all the different device/driver<->device/driver
interactions) I think there's only really one other option: To not support
these cases at all. And I don't really like that, because it means people
will hack together something even worse in their drivers.

By adding it to dma-buf it'll stare us in our faces at least :-/

Cheers, Sima

> 
> Regards,
> Christian.
> 
> > 
> > Cheers, Sima
> 
> _______________________________________________
> Linaro-mm-sig mailing list -- linaro-mm-sig@lists.linaro.org
> To unsubscribe send an email to linaro-mm-sig-leave@lists.linaro.org

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
