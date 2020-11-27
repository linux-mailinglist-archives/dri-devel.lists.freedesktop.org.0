Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CA52C6853
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 15:59:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A4026EE13;
	Fri, 27 Nov 2020 14:59:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1B256EE13
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 14:59:40 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id g14so5844169wrm.13
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 06:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=it3ol+ZeWQ4rYyHrgpltQLqbbIUXIOjwAhCa+oPfH+s=;
 b=j7sAsElhMs1pJ3oLKKQc4vRgjO7FnTg2gJB+ERY1aVoq9B3Kidji3dwqa4epdYfGmX
 Y9dDeOiBz/7FXHZDy9wS98Hll5+gzKd/C9kFbUp0WWahy+h8PcMdMplDRaf6WBwr3GVa
 qF8l1nVjZ27qrBH/mfCdwqomaIRSpmsw4W6ss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=it3ol+ZeWQ4rYyHrgpltQLqbbIUXIOjwAhCa+oPfH+s=;
 b=q5jMhDaZyvV5tJ014deTcGOxDpr1pu31tqQFeqwQsSFdenqE0N44yywaqCuTp+314+
 mzTQFq4dISM0Mw2j2o43GRbgvyEvGcwNjUx8Q3EsqvQb1LSpSrbD17f4TwPzuHSNn5n/
 uBQRaCyRe/FR1KBUZg1flpXc1+1tFDQiyXzuEDeaXU/b2Tce55/MDeUKr3ZYLoX7Wxtp
 F58rf1uyr62KThGD/W3BBe188gOBcKOEOyg53Gu3eIdjMtt9CkevhXNk0l9OiuVXpwHw
 CHh+dYKPi1gbX86gJv+8xrEtvG3oeWw53pqn0Ia08XCph9Q5RUKwKp5L9REPvdnkF8wf
 eBgQ==
X-Gm-Message-State: AOAM530NNBjDF3vlPv3+AyoI7Kcwv0Kll1H0GH6U6o25MJ7dcZdA/3UO
 OanKgi0xXYr+qHEwZvaElThfIw==
X-Google-Smtp-Source: ABdhPJy3GghY+taDAWhK4tAUu8YGGpb98/a4dXXflRTnZUIWFRySC3q4VPiZLGbI86IO2Txu5eBHBg==
X-Received: by 2002:a5d:634b:: with SMTP id b11mr11252636wrw.97.1606489179420; 
 Fri, 27 Nov 2020 06:59:39 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id x4sm15169206wrv.81.2020.11.27.06.59.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2020 06:59:38 -0800 (PST)
Date: Fri, 27 Nov 2020 15:59:36 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Subject: Re: [PATCH v3 05/12] drm/ttm: Expose ttm_tt_unpopulate for driver use
Message-ID: <20201127145936.GC401619@phenom.ffwll.local>
References: <e2f4f1dc-2a2a-face-87b2-6d61ed7d3305@amd.com>
 <01280cba-56b8-77c6-b40f-d7e69a5ad4c6@amd.com>
 <0ceca974-80f8-feb3-d5e9-5182f35bb2c4@amd.com>
 <20288c45-270c-3ed7-2ac4-eeb6e5c50776@amd.com>
 <2df98c1a-8ed4-fb87-f8f7-e3962e8d9c52@amd.com>
 <041210e5-e237-b72e-dcbc-17027d057c55@gmail.com>
 <20201125104021.GV401619@phenom.ffwll.local>
 <71683ae7-f443-c15a-7003-6ba4ad3d4b15@gmail.com>
 <20201125163621.GZ401619@phenom.ffwll.local>
 <bf6c0657-ac8f-545d-cf3f-e3f5e5d50a84@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bf6c0657-ac8f-545d-cf3f-e3f5e5d50a84@amd.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, gregkh@linuxfoundation.org,
 Alexander.Deucher@amd.com, yuq825@gmail.com, christian.koenig@amd.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 25, 2020 at 02:34:44PM -0500, Andrey Grodzovsky wrote:
> =

> On 11/25/20 11:36 AM, Daniel Vetter wrote:
> > On Wed, Nov 25, 2020 at 01:57:40PM +0100, Christian K=F6nig wrote:
> > > Am 25.11.20 um 11:40 schrieb Daniel Vetter:
> > > > On Tue, Nov 24, 2020 at 05:44:07PM +0100, Christian K=F6nig wrote:
> > > > > Am 24.11.20 um 17:22 schrieb Andrey Grodzovsky:
> > > > > > On 11/24/20 2:41 AM, Christian K=F6nig wrote:
> > > > > > > Am 23.11.20 um 22:08 schrieb Andrey Grodzovsky:
> > > > > > > > On 11/23/20 3:41 PM, Christian K=F6nig wrote:
> > > > > > > > > Am 23.11.20 um 21:38 schrieb Andrey Grodzovsky:
> > > > > > > > > > On 11/23/20 3:20 PM, Christian K=F6nig wrote:
> > > > > > > > > > > Am 23.11.20 um 21:05 schrieb Andrey Grodzovsky:
> > > > > > > > > > > > On 11/25/20 5:42 AM, Christian K=F6nig wrote:
> > > > > > > > > > > > > Am 21.11.20 um 06:21 schrieb Andrey Grodzovsky:
> > > > > > > > > > > > > > It's needed to drop iommu backed pages on devic=
e unplug
> > > > > > > > > > > > > > before device's IOMMU group is released.
> > > > > > > > > > > > > It would be cleaner if we could do the whole
> > > > > > > > > > > > > handling in TTM. I also need to double check
> > > > > > > > > > > > > what you are doing with this function.
> > > > > > > > > > > > > =

> > > > > > > > > > > > > Christian.
> > > > > > > > > > > > Check patch "drm/amdgpu: Register IOMMU topology
> > > > > > > > > > > > notifier per device." to see
> > > > > > > > > > > > how i use it. I don't see why this should go
> > > > > > > > > > > > into TTM mid-layer - the stuff I do inside
> > > > > > > > > > > > is vendor specific and also I don't think TTM is
> > > > > > > > > > > > explicitly aware of IOMMU ?
> > > > > > > > > > > > Do you mean you prefer the IOMMU notifier to be
> > > > > > > > > > > > registered from within TTM
> > > > > > > > > > > > and then use a hook to call into vendor specific ha=
ndler ?
> > > > > > > > > > > No, that is really vendor specific.
> > > > > > > > > > > =

> > > > > > > > > > > What I meant is to have a function like
> > > > > > > > > > > ttm_resource_manager_evict_all() which you only need
> > > > > > > > > > > to call and all tt objects are unpopulated.
> > > > > > > > > > So instead of this BO list i create and later iterate in
> > > > > > > > > > amdgpu from the IOMMU patch you just want to do it
> > > > > > > > > > within
> > > > > > > > > > TTM with a single function ? Makes much more sense.
> > > > > > > > > Yes, exactly.
> > > > > > > > > =

> > > > > > > > > The list_empty() checks we have in TTM for the LRU are
> > > > > > > > > actually not the best idea, we should now check the
> > > > > > > > > pin_count instead. This way we could also have a list of =
the
> > > > > > > > > pinned BOs in TTM.
> > > > > > > > So from my IOMMU topology handler I will iterate the TTM LR=
U for
> > > > > > > > the unpinned BOs and this new function for the pinned ones=
=A0 ?
> > > > > > > > It's probably a good idea to combine both iterations into t=
his
> > > > > > > > new function to cover all the BOs allocated on the device.
> > > > > > > Yes, that's what I had in my mind as well.
> > > > > > > =

> > > > > > > > > BTW: Have you thought about what happens when we unpopula=
te
> > > > > > > > > a BO while we still try to use a kernel mapping for it? T=
hat
> > > > > > > > > could have unforeseen consequences.
> > > > > > > > Are you asking what happens to kmap or vmap style mapped CPU
> > > > > > > > accesses once we drop all the DMA backing pages for a parti=
cular
> > > > > > > > BO ? Because for user mappings
> > > > > > > > (mmap) we took care of this with dummy page reroute but ind=
eed
> > > > > > > > nothing was done for in kernel CPU mappings.
> > > > > > > Yes exactly that.
> > > > > > > =

> > > > > > > In other words what happens if we free the ring buffer while =
the
> > > > > > > kernel still writes to it?
> > > > > > > =

> > > > > > > Christian.
> > > > > > While we can't control user application accesses to the mapped =
buffers
> > > > > > explicitly and hence we use page fault rerouting
> > > > > > I am thinking that in this=A0 case we may be able to sprinkle
> > > > > > drm_dev_enter/exit in any such sensitive place were we might
> > > > > > CPU access a DMA buffer from the kernel ?
> > > > > Yes, I fear we are going to need that.
> > > > Uh ... problem is that dma_buf_vmap are usually permanent things. M=
aybe we
> > > > could stuff this into begin/end_cpu_access
> =

> =

> Do you mean guarding with drm_dev_enter/exit in dma_buf_ops.begin/end_cpu=
_access
> driver specific hook ?
> =

> =

> > > > (but only for the kernel, so a
> > > > bit tricky)?
> =

> =

> Why only kernel ? Why is it a problem to do it if it comes from dma_buf_i=
octl by
> some user process ? And=A0 if we do need this distinction I think we shou=
ld be able to
> differentiate by looking at current->mm (i.e. mm_struct) pointer being NU=
LL
> for kernel thread.

Userspace mmap is handled by punching out the pte. So we don't need to do
anything special there.

For kernel mmap the begin/end should be all in the same context (so we
could use the srcu lock that works underneath drm_dev_enter/exit), since
at least right now kernel vmaps of dma-buf are very long-lived.

But the good news is that Thomas Zimmerman is working on this problem
already for different reasons, so it might be that we won't have any
long-lived kernel vmap anymore. And we could put the drm_dev_enter/exit in
there.

> > > Oh very very good point! I haven't thought about DMA-buf mmaps in this
> > > context yet.
> > > =

> > > =

> > > > btw the other issue with dma-buf (and even worse with dma_fence) is
> > > > refcounting of the underlying drm_device. I'd expect that all your
> > > > callbacks go boom if the dma_buf outlives your drm_device. That par=
t isn't
> > > > yet solved in your series here.
> > > Well thinking more about this, it seems to be a another really good a=
rgument
> > > why mapping pages from DMA-bufs into application address space direct=
ly is a
> > > very bad idea :)
> > > =

> > > But yes, we essentially can't remove the device as long as there is a
> > > DMA-buf with mappings. No idea how to clean that one up.
> > drm_dev_get/put in drm_prime helpers should get us like 90% there I thi=
nk.
> =

> =

> What are the other 10% ?

dma_fence, which is also about 90% of the work probably. But I'm
guesstimating only 10% of the oopses you can hit. Since generally the
dma_fence for a buffer don't outlive the underlying buffer. So usually no
problems happen when we've solved the dma-buf sharing, but the dma_fence
can outlive the dma-buf, so there's still possibilities of crashing.

> > The even more worrying thing is random dma_fence attached to the dma_re=
sv
> > object. We could try to clean all of ours up, but they could have escap=
ed
> > already into some other driver. And since we're talking about egpu
> > hotunplug, dma_fence escaping to the igpu is a pretty reasonable use-ca=
se.
> > =

> > I have no how to fix that one :-/
> > -Daniel
> =

> =

> I assume you are referring to sync_file_create/sync_file_get_fence API=A0=
 for
> dma_fence export/import ?

So dma_fence is a general issue, there's a pile of interfaces that result
in sharing with other drivers:
- dma_resv in the dma_buf
- sync_file
- drm_syncobj (but I think that's not yet cross driver, but probably
  changes)

In each of these cases drivers can pick up the dma_fence and use it
internally for all kinds of purposes (could end up in the scheduler or
wherever).

> So with DMA bufs we have the drm_gem_object as exporter specific private =
data
> and so we can do drm_dev_get and put at the drm_gem_object layer to bind
> device life cycle
> to that of each GEM object but, we don't have such mid-layer for dma_fence
> which could allow
> us to increment device reference for each fence out there related to that
> device - is my understanding correct ?

Yeah that's the annoying part with dma-fence. No existing generic place to
put the drm_dev_get/put. tbf I'd note this as a todo and try to solve the
other problems first.
-Daniel

> =

> Andrey
> =

> =

> Andrey
> =

> =

> > > Christian.
> > > =

> > > > -Daniel
> > > > =

> > > > > > Things like CPU page table updates, ring buffer accesses and FW=
 memcpy ?
> > > > > > Is there other places ?
> > > > > Puh, good question. I have no idea.
> > > > > =

> > > > > > Another point is that at this point the driver shouldn't access=
 any such
> > > > > > buffers as we are at the process finishing the device.
> > > > > > AFAIK there is no page fault mechanism for kernel mappings so I=
 don't
> > > > > > think there is anything else to do ?
> > > > > Well there is a page fault handler for kernel mappings, but that =
one just
> > > > > prints the stack trace into the system log and calls BUG(); :)
> > > > > =

> > > > > Long story short we need to avoid any access to released pages af=
ter unplug.
> > > > > No matter if it's from the kernel or userspace.
> > > > > =

> > > > > Regards,
> > > > > Christian.
> > > > > =

> > > > > > Andrey

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
