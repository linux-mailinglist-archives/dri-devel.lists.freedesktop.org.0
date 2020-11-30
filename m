Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C95642C864D
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 15:15:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9855B6E4B6;
	Mon, 30 Nov 2020 14:15:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67A066E4B3
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 14:15:40 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id o1so2464566wrx.7
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 06:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=IgBfSB4WekniYd9pdwPZZW0Wkybx1dv6/CoGKJ9KzS4=;
 b=CMTvc+CXeU4sdF6XV3flKgzZ7QVVOJa8MoKzoprN/d48Frv/TDrh+gi3Ilt5Gn0CLy
 nPoHeJfvu/S3tuEg5uZOpvuf2D9eJ1xnlDXkJMiGD+Ss+S0J+iEGjCx9tzAusHGiCC6N
 voQJgWhZIaeFAtyCsoVC7f8+h348gNDR+uKvg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=IgBfSB4WekniYd9pdwPZZW0Wkybx1dv6/CoGKJ9KzS4=;
 b=XYdFVJEtg5fev3zL5MoY8b0xnoTTfLdCN2bb75MDyqPURaAvCAKP9zp9vbosM8GOyc
 YowGMMXn2Cce/q2LJjbGAx66Aj6YmgN6G1SoWroAMUGNGB1bEvXHk/Xrdan4MMak3Ppt
 nVUYHOTBafmaoOi5DhvjYZsCI+2us0EaSHztqoyP4lfMHpXpxvO7SBHZU0ZvfDls6DIN
 AQ8Y8es1kHIQHRFpJ11kn/eoaSoQKxeAKIIuwVTYAXHh7D0giOeYrZcjvB3LXS1747dV
 t0qcPYhI9s8yYtj18LeZqkNwD11o2MYI+JVpP3RSlDd+qbNPb8xfdur6YWmb+myyaPXd
 6ZOA==
X-Gm-Message-State: AOAM530Ze5xrtwTSMDcK8ZrfH33p78yzxKuU8cRD6g3jdzTINeNPOa4x
 tq60R6MIB3jB+yDzMoC8OKDKZw==
X-Google-Smtp-Source: ABdhPJwiSP+2DsTqtF61GlHH/QPsyy/jIQQVZVYs4iO+5T+qLHykLB+VvGpZHJfRV6j4TBAM27Bmng==
X-Received: by 2002:a5d:5604:: with SMTP id l4mr28195390wrv.127.1606745738905; 
 Mon, 30 Nov 2020 06:15:38 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s2sm24359044wmh.37.2020.11.30.06.15.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Nov 2020 06:15:38 -0800 (PST)
Date: Mon, 30 Nov 2020 15:15:35 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Subject: Re: [PATCH v3 05/12] drm/ttm: Expose ttm_tt_unpopulate for driver use
Message-ID: <20201130141535.GM401619@phenom.ffwll.local>
References: <0ceca974-80f8-feb3-d5e9-5182f35bb2c4@amd.com>
 <20288c45-270c-3ed7-2ac4-eeb6e5c50776@amd.com>
 <2df98c1a-8ed4-fb87-f8f7-e3962e8d9c52@amd.com>
 <041210e5-e237-b72e-dcbc-17027d057c55@gmail.com>
 <20201125104021.GV401619@phenom.ffwll.local>
 <71683ae7-f443-c15a-7003-6ba4ad3d4b15@gmail.com>
 <20201125163621.GZ401619@phenom.ffwll.local>
 <bf6c0657-ac8f-545d-cf3f-e3f5e5d50a84@amd.com>
 <20201127145936.GC401619@phenom.ffwll.local>
 <a1759f4c-1b00-fb6f-697c-40db915fb58e@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a1759f4c-1b00-fb6f-697c-40db915fb58e@amd.com>
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

On Fri, Nov 27, 2020 at 11:04:55AM -0500, Andrey Grodzovsky wrote:
> =

> On 11/27/20 9:59 AM, Daniel Vetter wrote:
> > On Wed, Nov 25, 2020 at 02:34:44PM -0500, Andrey Grodzovsky wrote:
> > > On 11/25/20 11:36 AM, Daniel Vetter wrote:
> > > > On Wed, Nov 25, 2020 at 01:57:40PM +0100, Christian K=F6nig wrote:
> > > > > Am 25.11.20 um 11:40 schrieb Daniel Vetter:
> > > > > > On Tue, Nov 24, 2020 at 05:44:07PM +0100, Christian K=F6nig wro=
te:
> > > > > > > Am 24.11.20 um 17:22 schrieb Andrey Grodzovsky:
> > > > > > > > On 11/24/20 2:41 AM, Christian K=F6nig wrote:
> > > > > > > > > Am 23.11.20 um 22:08 schrieb Andrey Grodzovsky:
> > > > > > > > > > On 11/23/20 3:41 PM, Christian K=F6nig wrote:
> > > > > > > > > > > Am 23.11.20 um 21:38 schrieb Andrey Grodzovsky:
> > > > > > > > > > > > On 11/23/20 3:20 PM, Christian K=F6nig wrote:
> > > > > > > > > > > > > Am 23.11.20 um 21:05 schrieb Andrey Grodzovsky:
> > > > > > > > > > > > > > On 11/25/20 5:42 AM, Christian K=F6nig wrote:
> > > > > > > > > > > > > > > Am 21.11.20 um 06:21 schrieb Andrey Grodzovsk=
y:
> > > > > > > > > > > > > > > > It's needed to drop iommu backed pages on d=
evice unplug
> > > > > > > > > > > > > > > > before device's IOMMU group is released.
> > > > > > > > > > > > > > > It would be cleaner if we could do the whole
> > > > > > > > > > > > > > > handling in TTM. I also need to double check
> > > > > > > > > > > > > > > what you are doing with this function.
> > > > > > > > > > > > > > > =

> > > > > > > > > > > > > > > Christian.
> > > > > > > > > > > > > > Check patch "drm/amdgpu: Register IOMMU topology
> > > > > > > > > > > > > > notifier per device." to see
> > > > > > > > > > > > > > how i use it. I don't see why this should go
> > > > > > > > > > > > > > into TTM mid-layer - the stuff I do inside
> > > > > > > > > > > > > > is vendor specific and also I don't think TTM is
> > > > > > > > > > > > > > explicitly aware of IOMMU ?
> > > > > > > > > > > > > > Do you mean you prefer the IOMMU notifier to be
> > > > > > > > > > > > > > registered from within TTM
> > > > > > > > > > > > > > and then use a hook to call into vendor specifi=
c handler ?
> > > > > > > > > > > > > No, that is really vendor specific.
> > > > > > > > > > > > > =

> > > > > > > > > > > > > What I meant is to have a function like
> > > > > > > > > > > > > ttm_resource_manager_evict_all() which you only n=
eed
> > > > > > > > > > > > > to call and all tt objects are unpopulated.
> > > > > > > > > > > > So instead of this BO list i create and later itera=
te in
> > > > > > > > > > > > amdgpu from the IOMMU patch you just want to do it
> > > > > > > > > > > > within
> > > > > > > > > > > > TTM with a single function ? Makes much more sense.
> > > > > > > > > > > Yes, exactly.
> > > > > > > > > > > =

> > > > > > > > > > > The list_empty() checks we have in TTM for the LRU are
> > > > > > > > > > > actually not the best idea, we should now check the
> > > > > > > > > > > pin_count instead. This way we could also have a list=
 of the
> > > > > > > > > > > pinned BOs in TTM.
> > > > > > > > > > So from my IOMMU topology handler I will iterate the TT=
M LRU for
> > > > > > > > > > the unpinned BOs and this new function for the pinned o=
nes=A0 ?
> > > > > > > > > > It's probably a good idea to combine both iterations in=
to this
> > > > > > > > > > new function to cover all the BOs allocated on the devi=
ce.
> > > > > > > > > Yes, that's what I had in my mind as well.
> > > > > > > > > =

> > > > > > > > > > > BTW: Have you thought about what happens when we unpo=
pulate
> > > > > > > > > > > a BO while we still try to use a kernel mapping for i=
t? That
> > > > > > > > > > > could have unforeseen consequences.
> > > > > > > > > > Are you asking what happens to kmap or vmap style mappe=
d CPU
> > > > > > > > > > accesses once we drop all the DMA backing pages for a p=
articular
> > > > > > > > > > BO ? Because for user mappings
> > > > > > > > > > (mmap) we took care of this with dummy page reroute but=
 indeed
> > > > > > > > > > nothing was done for in kernel CPU mappings.
> > > > > > > > > Yes exactly that.
> > > > > > > > > =

> > > > > > > > > In other words what happens if we free the ring buffer wh=
ile the
> > > > > > > > > kernel still writes to it?
> > > > > > > > > =

> > > > > > > > > Christian.
> > > > > > > > While we can't control user application accesses to the map=
ped buffers
> > > > > > > > explicitly and hence we use page fault rerouting
> > > > > > > > I am thinking that in this=A0 case we may be able to sprink=
le
> > > > > > > > drm_dev_enter/exit in any such sensitive place were we might
> > > > > > > > CPU access a DMA buffer from the kernel ?
> > > > > > > Yes, I fear we are going to need that.
> > > > > > Uh ... problem is that dma_buf_vmap are usually permanent thing=
s. Maybe we
> > > > > > could stuff this into begin/end_cpu_access
> > > =

> > > Do you mean guarding with drm_dev_enter/exit in dma_buf_ops.begin/end=
_cpu_access
> > > driver specific hook ?
> > > =

> > > =

> > > > > > (but only for the kernel, so a
> > > > > > bit tricky)?
> > > =

> > > Why only kernel ? Why is it a problem to do it if it comes from dma_b=
uf_ioctl by
> > > some user process ? And=A0 if we do need this distinction I think we =
should be able to
> > > differentiate by looking at current->mm (i.e. mm_struct) pointer bein=
g NULL
> > > for kernel thread.
> > Userspace mmap is handled by punching out the pte. So we don't need to =
do
> > anything special there.
> > =

> > For kernel mmap the begin/end should be all in the same context (so we
> > could use the srcu lock that works underneath drm_dev_enter/exit), since
> > at least right now kernel vmaps of dma-buf are very long-lived.
> =

> =

> If by same context you mean the right drm_device (the exporter's one)
> then this should be ok as I am seeing from amdgpu implementation
> of the callback - amdgpu_dma_buf_begin_cpu_access. We just need to add
> handler for .end_cpu_access callback to call drm_dev_exit there.

Same context =3D same system call essentially. You cannot hold locks while
returning to userspace. And current userspace can call the
begin/end_cpu_access callbacks through ioctls, so just putting a
drm_dev_enter/exit in them will break really badly. Iirc there's an igt
also for testing these ioctl - if there isn't we really should have one.

Hence why we need to be more careful here about how's calling and where we
can put the drm_dev_enter/exit.
-Daniel

> =

> Andrey
> =

> =

> > =

> > But the good news is that Thomas Zimmerman is working on this problem
> > already for different reasons, so it might be that we won't have any
> > long-lived kernel vmap anymore. And we could put the drm_dev_enter/exit=
 in
> > there.
> > =

> > > > > Oh very very good point! I haven't thought about DMA-buf mmaps in=
 this
> > > > > context yet.
> > > > > =

> > > > > =

> > > > > > btw the other issue with dma-buf (and even worse with dma_fence=
) is
> > > > > > refcounting of the underlying drm_device. I'd expect that all y=
our
> > > > > > callbacks go boom if the dma_buf outlives your drm_device. That=
 part isn't
> > > > > > yet solved in your series here.
> > > > > Well thinking more about this, it seems to be a another really go=
od argument
> > > > > why mapping pages from DMA-bufs into application address space di=
rectly is a
> > > > > very bad idea :)
> > > > > =

> > > > > But yes, we essentially can't remove the device as long as there =
is a
> > > > > DMA-buf with mappings. No idea how to clean that one up.
> > > > drm_dev_get/put in drm_prime helpers should get us like 90% there I=
 think.
> > > =

> > > What are the other 10% ?
> > dma_fence, which is also about 90% of the work probably. But I'm
> > guesstimating only 10% of the oopses you can hit. Since generally the
> > dma_fence for a buffer don't outlive the underlying buffer. So usually =
no
> > problems happen when we've solved the dma-buf sharing, but the dma_fence
> > can outlive the dma-buf, so there's still possibilities of crashing.
> > =

> > > > The even more worrying thing is random dma_fence attached to the dm=
a_resv
> > > > object. We could try to clean all of ours up, but they could have e=
scaped
> > > > already into some other driver. And since we're talking about egpu
> > > > hotunplug, dma_fence escaping to the igpu is a pretty reasonable us=
e-case.
> > > > =

> > > > I have no how to fix that one :-/
> > > > -Daniel
> > > =

> > > I assume you are referring to sync_file_create/sync_file_get_fence AP=
I=A0 for
> > > dma_fence export/import ?
> > So dma_fence is a general issue, there's a pile of interfaces that resu=
lt
> > in sharing with other drivers:
> > - dma_resv in the dma_buf
> > - sync_file
> > - drm_syncobj (but I think that's not yet cross driver, but probably
> >    changes)
> > =

> > In each of these cases drivers can pick up the dma_fence and use it
> > internally for all kinds of purposes (could end up in the scheduler or
> > wherever).
> > =

> > > So with DMA bufs we have the drm_gem_object as exporter specific priv=
ate data
> > > and so we can do drm_dev_get and put at the drm_gem_object layer to b=
ind
> > > device life cycle
> > > to that of each GEM object but, we don't have such mid-layer for dma_=
fence
> > > which could allow
> > > us to increment device reference for each fence out there related to =
that
> > > device - is my understanding correct ?
> > Yeah that's the annoying part with dma-fence. No existing generic place=
 to
> > put the drm_dev_get/put. tbf I'd note this as a todo and try to solve t=
he
> > other problems first.
> > -Daniel
> > =

> > > Andrey
> > > =

> > > =

> > > Andrey
> > > =

> > > =

> > > > > Christian.
> > > > > =

> > > > > > -Daniel
> > > > > > =

> > > > > > > > Things like CPU page table updates, ring buffer accesses an=
d FW memcpy ?
> > > > > > > > Is there other places ?
> > > > > > > Puh, good question. I have no idea.
> > > > > > > =

> > > > > > > > Another point is that at this point the driver shouldn't ac=
cess any such
> > > > > > > > buffers as we are at the process finishing the device.
> > > > > > > > AFAIK there is no page fault mechanism for kernel mappings =
so I don't
> > > > > > > > think there is anything else to do ?
> > > > > > > Well there is a page fault handler for kernel mappings, but t=
hat one just
> > > > > > > prints the stack trace into the system log and calls BUG(); :)
> > > > > > > =

> > > > > > > Long story short we need to avoid any access to released page=
s after unplug.
> > > > > > > No matter if it's from the kernel or userspace.
> > > > > > > =

> > > > > > > Regards,
> > > > > > > Christian.
> > > > > > > =

> > > > > > > > Andrey

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
