Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5EF32C2927
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 15:17:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05EF36E42F;
	Tue, 24 Nov 2020 14:16:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEB6C6E423
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 14:16:57 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id r3so4184043wrt.2
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 06:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=lxaE8Not9jvLvGdPE1uCtN/cVkn9pPEtSLdbQyT9QXw=;
 b=Jqu3MmOxKtv9AEVJ44kKeuVO3gO1NOKfm+ACsbPcrxj2eHlEcRRMnE0TnNyC+zJYnI
 MKrPTvaoz4din/kg4k7SyOw5E6Rymxd/rfxXl/XrvCFIkFNXPpHJXYjcLwa+ea5x8oiU
 SW2i+f/oPr9w2wLEKdEgW7VtTgihlydGLaYjg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=lxaE8Not9jvLvGdPE1uCtN/cVkn9pPEtSLdbQyT9QXw=;
 b=VlCnyfBKXJSGve30IrZLm86KrtXwLgYOedCNGZzu+qqMji9PkhajU9ZnOc4pBRaybt
 r2CqyJZa1GR8V50rVMERseaoRgH4bwfNNu2GCDmju63RHltWUffAEjDfJq/mlWjhmkxR
 /AdSkPGt6fiVHaCm5UjXEygOP68VckvDrJsg5mWXptGxm5Sn1swI1CEOBmXPCGMagaod
 1HYdRD2ENT0hNr2+PW3ln/0HZA8p3u59vPLBOgQBdmRpf+njPUNbdvqJSdGNbLSOiNAt
 TVhxdB09pjTZ0sMi/uriAtEXr6eU8AQpopApS9B7q8E/m2ns7Ybgc148LT0K0RDeaPm/
 9G/w==
X-Gm-Message-State: AOAM531I8P2Lt2AL1jU2NFTiOvz6ckIm+NkEsvs14AMPP4JlBXVuQnGm
 SWy5aN0kFfot7BO+gl8qmyJ5Dg==
X-Google-Smtp-Source: ABdhPJyvnAcNxBa7hPAnh3R0lC3dqHK5F5aliN5y0/6utGHWrgRKu8r7ObJFr2IEqd22MvzLgTn5ig==
X-Received: by 2002:adf:9cc6:: with SMTP id h6mr5554394wre.341.1606227416430; 
 Tue, 24 Nov 2020 06:16:56 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id h2sm6243879wme.45.2020.11.24.06.16.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 06:16:55 -0800 (PST)
Date: Tue, 24 Nov 2020 15:16:52 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Tomasz Figa <tfiga@chromium.org>
Subject: Re: [PATCH v6 09/17] media/videbuf1|2: Mark follow_pfn usage as unsafe
Message-ID: <20201124141652.GL401619@phenom.ffwll.local>
Mail-Followup-To: Tomasz Figa <tfiga@chromium.org>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, KVM list <kvm@vger.kernel.org>,
 Linux MM <linux-mm@kvack.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Kees Cook <keescook@chromium.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 John Hubbard <jhubbard@nvidia.com>,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Jan Kara <jack@suse.cz>, Pawel Osciak <pawel@osciak.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Laurent Dufour <ldufour@linux.ibm.com>,
 Vlastimil Babka <vbabka@suse.cz>,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 Michel Lespinasse <walken@google.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20201119144146.1045202-1-daniel.vetter@ffwll.ch>
 <20201119144146.1045202-10-daniel.vetter@ffwll.ch>
 <f1f3a1d8-d62a-6e93-afc1-87a8e51081e9@xs4all.nl>
 <e1f7d30b-2012-0249-66c7-cf9d7d6246ad@xs4all.nl>
 <CAKMK7uEzFAtr9yxjaxi-kiuZhb+hWT3q6E41OegJr+J2-zkT8w@mail.gmail.com>
 <9035555a-af6b-e2dd-dbad-41ca70235e21@xs4all.nl>
 <CAKMK7uFrXJh9jc5-v02A=JE8B3aThbYtTxFN-CGQUB=0TGmKgQ@mail.gmail.com>
 <d44c6518-bd9c-87e0-dce4-2b63890e0f7e@xs4all.nl>
 <CAAFQd5DMTwUKE0B5L-WC5ehrrQVeRD_af+TG0FpYiPg0g=89Hg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAFQd5DMTwUKE0B5L-WC5ehrrQVeRD_af+TG0FpYiPg0g=89Hg@mail.gmail.com>
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
Cc: Jan Kara <jack@suse.cz>, KVM list <kvm@vger.kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, Linux MM <linux-mm@kvack.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Michel Lespinasse <walken@google.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Daniel Jordan <daniel.m.jordan@oracle.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>, Pawel Osciak <pawel@osciak.com>,
 John Hubbard <jhubbard@nvidia.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Laurent Dufour <ldufour@linux.ibm.com>, Vlastimil Babka <vbabka@suse.cz>,
 LKML <linux-kernel@vger.kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 20, 2020 at 09:23:12PM +0900, Tomasz Figa wrote:
> On Fri, Nov 20, 2020 at 9:08 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
> >
> > On 20/11/2020 11:51, Daniel Vetter wrote:
> > > On Fri, Nov 20, 2020 at 11:39 AM Hans Verkuil <hverkuil@xs4all.nl> wr=
ote:
> > >>
> > >> On 20/11/2020 10:18, Daniel Vetter wrote:
> > >>> On Fri, Nov 20, 2020 at 9:28 AM Hans Verkuil <hverkuil@xs4all.nl> w=
rote:
> > >>>>
> > >>>> On 20/11/2020 09:06, Hans Verkuil wrote:
> > >>>>> On 19/11/2020 15:41, Daniel Vetter wrote:
> > >>>>>> The media model assumes that buffers are all preallocated, so th=
at
> > >>>>>> when a media pipeline is running we never miss a deadline becaus=
e the
> > >>>>>> buffers aren't allocated or available.
> > >>>>>>
> > >>>>>> This means we cannot fix the v4l follow_pfn usage through
> > >>>>>> mmu_notifier, without breaking how this all works. The only real=
 fix
> > >>>>>> is to deprecate userptr support for VM_IO | VM_PFNMAP mappings a=
nd
> > >>>>>> tell everyone to cut over to dma-buf memory sharing for zerocopy.
> > >>>>>>
> > >>>>>> userptr for normal memory will keep working as-is, this only aff=
ects
> > >>>>>> the zerocopy userptr usage enabled in 50ac952d2263 ("[media]
> > >>>>>> videobuf2-dma-sg: Support io userptr operations on io memory").
> > >>>>>>
> > >>>>>> Acked-by: Tomasz Figa <tfiga@chromium.org>
> > >>>>>
> > >>>>> Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> > >>>>
> > >>>> Actually, cancel this Acked-by.
> > >>>>
> > >>>> So let me see if I understand this right: VM_IO | VM_PFNMAP mappin=
gs can
> > >>>> move around. There is a mmu_notifier that can be used to be notifi=
ed when
> > >>>> that happens, but that can't be used with media buffers since thos=
e buffers
> > >>>> must always be available and in the same place.
> > >>>>
> > >>>> So follow_pfn is replaced by unsafe_follow_pfn to signal that what=
 is attempted
> > >>>> is unsafe and unreliable.
> > >>>>
> > >>>> If CONFIG_STRICT_FOLLOW_PFN is set, then unsafe_follow_pfn will fa=
il, if it
> > >>>> is unset, then it writes a warning to the kernel log but just cont=
inues while
> > >>>> still unsafe.
> > >>>>
> > >>>> I am very much inclined to just drop VM_IO | VM_PFNMAP support in =
the media
> > >>>> subsystem. For vb2 there is a working alternative in the form of d=
mabuf, and
> > >>>> frankly for vb1 I don't care. If someone really needs this for a v=
b1 driver,
> > >>>> then they can do the work to convert that driver to vb2.
> > >>>>
> > >>>> I've added Mauro to the CC list and I'll ping a few more people to=
 see what
> > >>>> they think, but in my opinion support for USERPTR + VM_IO | VM_PFN=
MAP
> > >>>> should just be killed off.
> > >>>>
> > >>>> If others would like to keep it, then frame_vector.c needs a comme=
nt before
> > >>>> the 'while' explaining why the unsafe_follow_pfn is there and that=
 using
> > >>>> dmabuf is the proper alternative to use. That will make it easier =
for
> > >>>> developers to figure out why they see a kernel warning and what to=
 do to
> > >>>> fix it, rather than having to dig through the git history for the =
reason.
> > >>>
> > >>> I'm happy to add a comment, but otherwise if you all want to ditch
> > >>> this, can we do this as a follow up on top? There's quite a bit of
> > >>> code that can be deleted and I'd like to not hold up this patch set
> > >>> here on that - it's already a fairly sprawling pain touching about 7
> > >>> different subsystems (ok only 6-ish now since the s390 patch landed=
).
> > >>> For the comment, is the explanation next to unsafe_follow_pfn not g=
ood
> > >>> enough?
> > >>
> > >> No, because that doesn't mention that you should use dma-buf as a re=
placement.
> > >> That's really the critical piece of information I'd like to see. Tha=
t doesn't
> > >> belong in unsafe_follow_pfn, it needs to be in frame_vector.c since =
it's
> > >> vb2 specific.
> > >
> > > Ah makes sense, I'll add that.
> > >
> > >>>
> > >>> So ... can I get you to un-cancel your ack?
> > >>
> > >> Hmm, I really would like to see support for this to be dropped compl=
etely.
> > >>
> > >> How about this: just replace follow_pfn() by -EINVAL instead of unsa=
fe_follow_pfn().
> > >>
> > >> Add a TODO comment that this code now can be cleaned up a lot. Such =
a clean up patch
> > >> can be added on top later, and actually that is something that I can=
 do once this
> > >> series has landed.
> > >>
> > >> Regardless, frame_vector.c should mention dma-buf as a replacement i=
n a comment
> > >> since I don't want users who hit this issue to have to dig through g=
it logs
> > >> to find that dma-buf is the right approach.
> > >>
> > >> BTW, nitpick: the subject line of this patch says 'videbuf' instead =
of 'videobuf'.
> > >
> > > Will fix to, and next round will have the additional -EINVAL on top.
> > > Iirc Mauro was pretty clear that we can't just delete this, so I kinda
> > > don't want to get stuck in this discussion with my patches :-)
> >
> > Ah, I found that discussion for the v2 of this series.
> >
> > Yes, add that on top and we can discuss whether to Ack that -EINVAL pat=
ch or
> > not.
> >
> > I don't see why we would want to continue supporting a broken model tha=
t is
> > also a security risk, as I understand it.
> >
> > Tomasz, can you look at the discussion for this old RFC patch of mine:
> >
> > https://patchwork.linuxtv.org/project/linux-media/patch/20200221084531.=
576156-9-hverkuil-cisco@xs4all.nl/
> >
> > Specifically, if we just drop support for follow_pfn(), would that cause
> > problems for Chromium since that is apparently still using USERPTR for =
encoders?
> >
> =

> Nope, we use regular page-backed user pointers and not IO/PFNMAP ones.
> =

> By the way, for any inter-device sharing we're using DMABUF. USERPTR
> is left only in case of the data coming from the CPU, e.g. network.

Yeah Mauro wasn't too enthusiastic even about this patch here, so I think
I'll just leave it as-is. I fixed the typo in the commit message subject.
-Daniel

> =

> > Regards,
> >
> >         Hans
> >
> > > -Daniel
> > >
> > >>
> > >> Regards,
> > >>
> > >>         Hans
> > >>
> > >>>
> > >>> Thanks, Daniel
> > >>>
> > >>>>
> > >>>> Regards,
> > >>>>
> > >>>>         Hans
> > >>>>
> > >>>>>
> > >>>>> Thanks!
> > >>>>>
> > >>>>>       Hans
> > >>>>>
> > >>>>>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > >>>>>> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> > >>>>>> Cc: Kees Cook <keescook@chromium.org>
> > >>>>>> Cc: Dan Williams <dan.j.williams@intel.com>
> > >>>>>> Cc: Andrew Morton <akpm@linux-foundation.org>
> > >>>>>> Cc: John Hubbard <jhubbard@nvidia.com>
> > >>>>>> Cc: J=E9r=F4me Glisse <jglisse@redhat.com>
> > >>>>>> Cc: Jan Kara <jack@suse.cz>
> > >>>>>> Cc: Dan Williams <dan.j.williams@intel.com>
> > >>>>>> Cc: linux-mm@kvack.org
> > >>>>>> Cc: linux-arm-kernel@lists.infradead.org
> > >>>>>> Cc: linux-samsung-soc@vger.kernel.org
> > >>>>>> Cc: linux-media@vger.kernel.org
> > >>>>>> Cc: Pawel Osciak <pawel@osciak.com>
> > >>>>>> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> > >>>>>> Cc: Kyungmin Park <kyungmin.park@samsung.com>
> > >>>>>> Cc: Tomasz Figa <tfiga@chromium.org>
> > >>>>>> Cc: Laurent Dufour <ldufour@linux.ibm.com>
> > >>>>>> Cc: Vlastimil Babka <vbabka@suse.cz>
> > >>>>>> Cc: Daniel Jordan <daniel.m.jordan@oracle.com>
> > >>>>>> Cc: Michel Lespinasse <walken@google.com>
> > >>>>>> Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > >>>>>> --
> > >>>>>> v3:
> > >>>>>> - Reference the commit that enabled the zerocopy userptr use cas=
e to
> > >>>>>>   make it abundandtly clear that this patch only affects that, a=
nd not
> > >>>>>>   normal memory userptr. The old commit message already explaine=
d that
> > >>>>>>   normal memory userptr is unaffected, but I guess that was not =
clear
> > >>>>>>   enough.
> > >>>>>> ---
> > >>>>>>  drivers/media/common/videobuf2/frame_vector.c | 2 +-
> > >>>>>>  drivers/media/v4l2-core/videobuf-dma-contig.c | 2 +-
> > >>>>>>  2 files changed, 2 insertions(+), 2 deletions(-)
> > >>>>>>
> > >>>>>> diff --git a/drivers/media/common/videobuf2/frame_vector.c b/dri=
vers/media/common/videobuf2/frame_vector.c
> > >>>>>> index a0e65481a201..1a82ec13ea00 100644
> > >>>>>> --- a/drivers/media/common/videobuf2/frame_vector.c
> > >>>>>> +++ b/drivers/media/common/videobuf2/frame_vector.c
> > >>>>>> @@ -70,7 +70,7 @@ int get_vaddr_frames(unsigned long start, unsi=
gned int nr_frames,
> > >>>>>>                      break;
> > >>>>>>
> > >>>>>>              while (ret < nr_frames && start + PAGE_SIZE <=3D vm=
a->vm_end) {
> > >>>>>> -                    err =3D follow_pfn(vma, start, &nums[ret]);
> > >>>>>> +                    err =3D unsafe_follow_pfn(vma, start, &nums=
[ret]);
> > >>>>>>                      if (err) {
> > >>>>>>                              if (ret =3D=3D 0)
> > >>>>>>                                      ret =3D err;
> > >>>>>> diff --git a/drivers/media/v4l2-core/videobuf-dma-contig.c b/dri=
vers/media/v4l2-core/videobuf-dma-contig.c
> > >>>>>> index 52312ce2ba05..821c4a76ab96 100644
> > >>>>>> --- a/drivers/media/v4l2-core/videobuf-dma-contig.c
> > >>>>>> +++ b/drivers/media/v4l2-core/videobuf-dma-contig.c
> > >>>>>> @@ -183,7 +183,7 @@ static int videobuf_dma_contig_user_get(stru=
ct videobuf_dma_contig_memory *mem,
> > >>>>>>      user_address =3D untagged_baddr;
> > >>>>>>
> > >>>>>>      while (pages_done < (mem->size >> PAGE_SHIFT)) {
> > >>>>>> -            ret =3D follow_pfn(vma, user_address, &this_pfn);
> > >>>>>> +            ret =3D unsafe_follow_pfn(vma, user_address, &this_=
pfn);
> > >>>>>>              if (ret)
> > >>>>>>                      break;
> > >>>>>>
> > >>>>>>
> > >>>>>
> > >>>>
> > >>>
> > >>>
> > >>
> > >
> > >
> >

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
