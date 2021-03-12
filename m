Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29683338F6E
	for <lists+dri-devel@lfdr.de>; Fri, 12 Mar 2021 15:07:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B35546EC39;
	Fri, 12 Mar 2021 14:07:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B89A86EC39
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Mar 2021 14:07:45 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id e18so1847633wrt.6
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Mar 2021 06:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=0b94v7S34F+yLOJy1ewvn7dt40NwWiU/Q8n4vHSPEiA=;
 b=XFWc9HL48dKo2J8ISHJxsSvF7n/teqj0UITJY0vXYJ/lbUYwued6kXgJqZQZLkyGql
 4+0yeQDRwXOJ6smUNxSDubBFHU9KdD8fIzIrlcxkSzqBDtwaKQCIEt+2b1+iCyD6tj0b
 8SvnkSoKRO24Trx/AL/rHGcFguDp7SviwUzQE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=0b94v7S34F+yLOJy1ewvn7dt40NwWiU/Q8n4vHSPEiA=;
 b=Sh5vunVyedlDT5x/0uO7nRHFnHL/JbmBe2nzSV0Q0aOhVUeqdCMu/g1oK4Tq+RRBHJ
 90Iy9MOY8td/igGd2HLqs4mLetzzQHMoQzfMl1p3feUhXHGARRFStbRaPagSNymRoE1U
 0AXWVG+gkcdGviH4DZpJrZNEEMv5tfmNtjWF38YUkPuUminqgjDrYyguWiM3OtmFyJNh
 XF1tBbSbNbHI5xUYOSbGzTzNjNAj0Lx+4kOTwoaN8L1rTldBEY1awL/w4MgvSR/q1D59
 tp1ARLnY25SPfiomuLf2gzi7g7UekcX0VxFI/ydn0D9md7PxSRSHYv1YhvqlCswnDApU
 8iGA==
X-Gm-Message-State: AOAM533XtOFXxE1bU5VgPhSP9GgHW6NLNi8K83M6RP4gLP3uol5lKNTn
 b99jnNRkaHHEmkEjxzT6LewR4g==
X-Google-Smtp-Source: ABdhPJxse6kS7PMvxKaC+u15I2lZJQSm6UO7GbTrgtUDupCCuocqmsqXDUqNwE+1aiA0VjVsMdPYeA==
X-Received: by 2002:a5d:5047:: with SMTP id h7mr14781415wrt.111.1615558064393; 
 Fri, 12 Mar 2021 06:07:44 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id v13sm8959320wrt.45.2021.03.12.06.07.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 06:07:43 -0800 (PST)
Date: Fri, 12 Mar 2021 15:07:41 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH] dma-fence: Document recoverable page fault implications
Message-ID: <YEt1rVg/flnZHsgG@phenom.ffwll.local>
References: <20210203152921.2429937-1-daniel.vetter@ffwll.ch>
 <8e28d123-e7ea-aade-dd7f-af0eb2999ce6@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8e28d123-e7ea-aade-dd7f-af0eb2999ce6@amd.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Felix Kuehling <felix.kuehling@amd.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 linaro-mm-sig@lists.linaro.org, Jerome Glisse <jglisse@redhat.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 03, 2021 at 04:40:38PM +0100, Christian K=F6nig wrote:
> Am 03.02.21 um 16:29 schrieb Daniel Vetter:
> > Recently there was a fairly long thread about recoreable hardware page
> > faults, how they can deadlock, and what to do about that.
> > =

> > While the discussion is still fresh I figured good time to try and
> > document the conclusions a bit. This documentation section explains
> > what's the potential problem, and the remedies we've discussed,
> > roughly ordered from best to worst.
> > =

> > v2: Linus -> Linux typoe (Dave)
> > =

> > v3:
> > - Make it clear drivers only need to implement one option (Christian)
> > - Make it clearer that implicit sync is out the window with exclusive
> >    fences (Christian)
> > - Add the fairly theoretical option of segementing the memory (either
> >    statically or through dynamic checks at runtime for which piece of
> >    memory is managed how) and explain why it's not a great idea (Felix)
> > =

> > References: https://nam11.safelinks.protection.outlook.com/?url=3Dhttps=
%3A%2F%2Flore.kernel.org%2Fdri-devel%2F20210107030127.20393-1-Felix.Kuehlin=
g%40amd.com%2F&amp;data=3D04%7C01%7Cchristian.koenig%40amd.com%7C767e1096b9=
554ab5b6dd08d8c8587f0f%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C6374796=
29728871138%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJ=
BTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DFth2y8c3LuNbweQGrsS7VjYESGls=
hu6DfQyikiWBwyQ%3D&amp;reserved=3D0
> > Cc: Dave Airlie <airlied@gmail.com>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Thomas Hellstr=F6m <thomas.hellstrom@intel.com>
> > Cc: "Christian K=F6nig" <christian.koenig@amd.com>
> > Cc: Jerome Glisse <jglisse@redhat.com>
> > Cc: Felix Kuehling <felix.kuehling@amd.com>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: linux-media@vger.kernel.org
> > Cc: linaro-mm-sig@lists.linaro.org
> =

> Reviewed-by: Christian K=F6nig <christian.koenig@amd.com>

Pulled this in, thanks everyone who helped clarify the situation here.

Cheers, Daniel

> I still haven't fully given up on supporting implicit sync with user fenc=
es,
> but it is really an eeek, let's try very hard to avoid that, problem.
> =

> Christian
> =

> > ---
> >   Documentation/driver-api/dma-buf.rst | 76 ++++++++++++++++++++++++++++
> >   1 file changed, 76 insertions(+)
> > =

> > diff --git a/Documentation/driver-api/dma-buf.rst b/Documentation/drive=
r-api/dma-buf.rst
> > index a2133d69872c..7f37ec30d9fd 100644
> > --- a/Documentation/driver-api/dma-buf.rst
> > +++ b/Documentation/driver-api/dma-buf.rst
> > @@ -257,3 +257,79 @@ fences in the kernel. This means:
> >     userspace is allowed to use userspace fencing or long running compu=
te
> >     workloads. This also means no implicit fencing for shared buffers i=
n these
> >     cases.
> > +
> > +Recoverable Hardware Page Faults Implications
> > +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > +
> > +Modern hardware supports recoverable page faults, which has a lot of
> > +implications for DMA fences.
> > +
> > +First, a pending page fault obviously holds up the work that's running=
 on the
> > +accelerator and a memory allocation is usually required to resolve the=
 fault.
> > +But memory allocations are not allowed to gate completion of DMA fence=
s, which
> > +means any workload using recoverable page faults cannot use DMA fences=
 for
> > +synchronization. Synchronization fences controlled by userspace must b=
e used
> > +instead.
> > +
> > +On GPUs this poses a problem, because current desktop compositor proto=
cols on
> > +Linux rely on DMA fences, which means without an entirely new userspac=
e stack
> > +built on top of userspace fences, they cannot benefit from recoverable=
 page
> > +faults. Specifically this means implicit synchronization will not be p=
ossible.
> > +The exception is when page faults are only used as migration hints and=
 never to
> > +on-demand fill a memory request. For now this means recoverable page
> > +faults on GPUs are limited to pure compute workloads.
> > +
> > +Furthermore GPUs usually have shared resources between the 3D renderin=
g and
> > +compute side, like compute units or command submission engines. If bot=
h a 3D
> > +job with a DMA fence and a compute workload using recoverable page fau=
lts are
> > +pending they could deadlock:
> > +
> > +- The 3D workload might need to wait for the compute job to finish and=
 release
> > +  hardware resources first.
> > +
> > +- The compute workload might be stuck in a page fault, because the mem=
ory
> > +  allocation is waiting for the DMA fence of the 3D workload to comple=
te.
> > +
> > +There are a few options to prevent this problem, one of which drivers =
need to
> > +ensure:
> > +
> > +- Compute workloads can always be preempted, even when a page fault is=
 pending
> > +  and not yet repaired. Not all hardware supports this.
> > +
> > +- DMA fence workloads and workloads which need page fault handling have
> > +  independent hardware resources to guarantee forward progress. This c=
ould be
> > +  achieved through e.g. through dedicated engines and minimal compute =
unit
> > +  reservations for DMA fence workloads.
> > +
> > +- The reservation approach could be further refined by only reserving =
the
> > +  hardware resources for DMA fence workloads when they are in-flight. =
This must
> > +  cover the time from when the DMA fence is visible to other threads u=
p to
> > +  moment when fence is completed through dma_fence_signal().
> > +
> > +- As a last resort, if the hardware provides no useful reservation mec=
hanics,
> > +  all workloads must be flushed from the GPU when switching between jo=
bs
> > +  requiring DMA fences or jobs requiring page fault handling: This mea=
ns all DMA
> > +  fences must complete before a compute job with page fault handling c=
an be
> > +  inserted into the scheduler queue. And vice versa, before a DMA fenc=
e can be
> > +  made visible anywhere in the system, all compute workloads must be p=
reempted
> > +  to guarantee all pending GPU page faults are flushed.
> > +
> > +- Only a fairly theoretical option would be to untangle these dependen=
cies when
> > +  allocating memory to repair hardware page faults, either through sep=
arate
> > +  memory blocks or runtime tracking of the full dependency graph of al=
l DMA
> > +  fences. This results very wide impact on the kernel, since resolving=
 the page
> > +  on the CPU side can itself involve a page fault. It is much more fea=
sible and
> > +  robust to limit the impact of handling hardware page faults to the s=
pecific
> > +  driver.
> > +
> > +Note that workloads that run on independent hardware like copy engines=
 or other
> > +GPUs do not have any impact. This allows us to keep using DMA fences i=
nternally
> > +in the kernel even for resolving hardware page faults, e.g. by using c=
opy
> > +engines to clear or copy memory needed to resolve the page fault.
> > +
> > +In some ways this page fault problem is a special case of the `Infinit=
e DMA
> > +Fences` discussions: Infinite fences from compute workloads are allowe=
d to
> > +depend on DMA fences, but not the other way around. And not even the p=
age fault
> > +problem is new, because some other CPU thread in userspace might
> > +hit a page fault which holds up a userspace fence - supporting page fa=
ults on
> > +GPUs doesn't anything fundamentally new.
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
