Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C591F6379
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jun 2020 10:24:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D535B6E064;
	Thu, 11 Jun 2020 08:24:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFCB66E064
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 08:24:51 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id r7so5206770wro.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 01:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=I7CFmjNVokSFfXlefCwOMnHWTGM8u0u2rwA+Ac9BAuU=;
 b=ZYCk+BrcYh5uC5ILnO8zgbft/itNXs3wMMVfknsvikvnA/sGgOZkqqqI+5y7FcIikz
 OsVoyLjtvOl8vOshbzf8D7rVr7yII4DBqnCml8Ni6BqPM98Q2J8KkFUB4IKVv65/Lr+B
 bNDCFRKqGfoU6YU57ASCs70U4h28+yVD4m1jc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=I7CFmjNVokSFfXlefCwOMnHWTGM8u0u2rwA+Ac9BAuU=;
 b=KcAtTJ/GsPTnx3AKt+TSkWDCxeT1lHRWUyDfF3MjwB8RG67X45HGwBF0VQixn0BSfV
 LsGTRoYY5iCXvQ9BERQDESJAmM8uqI3yu0gX/Ir/OiPr8vVmNUX4oBP4L19cJYCBh1le
 YJTa/xGAaTdLdvVHBtJWtQLNjmS0or2Vcwk8gei7/YMCqMQCPK0fw9CYkNYiw383gHzP
 nHff73DarOYn5cTxRfjjjGSotK6Pl73BYLfVZKcyZQKrImUJcAYPwykryNxeMkqWXegW
 dQxpnnOlxBWyzzB6nxZrf66UyIFT/OqAChJ5KMyHMqP+xBJTsWnhS+qeVHB7nc5uTQl8
 yoyA==
X-Gm-Message-State: AOAM531qufDsfRD6It9mncui8HMFW0plrIjyVyVliBZUSb2qBDiw1kD/
 QMIBoQVYxGIB6j8fKX/FyhJBoQ==
X-Google-Smtp-Source: ABdhPJzTg7+kohJfX0AkSNgU+bHmELA+kMn17jTwJyprJk7KMrIgqEUZxxKVgSf6bWIebhHM4FnTpg==
X-Received: by 2002:adf:f58b:: with SMTP id f11mr8242208wro.155.1591863890210; 
 Thu, 11 Jun 2020 01:24:50 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j5sm3851256wrm.57.2020.06.11.01.24.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2020 01:24:49 -0700 (PDT)
Date: Thu, 11 Jun 2020 10:24:47 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m_=28Intel=29?= <thomas_os@shipmail.org>
Subject: Re: [PATCH 1/6] drm/ttm: Add unampping of the entire device address
 space
Message-ID: <20200611082447.GC20149@phenom.ffwll.local>
References: <f36c1fa1-bbee-477a-9cb2-ed2726f27eef@email.android.com>
 <eb9e5896-1f16-2102-350a-1e64d9af7ea8@shipmail.org>
 <b415e3d1-eed9-9b11-b8c1-c85c7b57eb93@amd.com>
 <ce6f6109-67df-e3d0-d56e-3f5c27df40a0@amd.com>
 <20200610153020.GZ20149@phenom.ffwll.local>
 <715ad9d4-7763-382e-237e-8daab42eff46@shipmail.org>
 <CAKMK7uGyKKEk4fFdr45ipe0MmS_1qrv8z0QEPWk=zuwhiUajVA@mail.gmail.com>
 <a243f0c6-2b92-a9a8-5ed7-b33a403db54e@shipmail.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a243f0c6-2b92-a9a8-5ed7-b33a403db54e@shipmail.org>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: "michel@daenzer.net" <michel@daenzer.net>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 11, 2020 at 08:12:37AM +0200, Thomas Hellstr=F6m (Intel) wrote:
> =

> On 6/10/20 11:16 PM, Daniel Vetter wrote:
> > On Wed, Jun 10, 2020 at 10:30 PM Thomas Hellstr=F6m (Intel)
> > <thomas_os@shipmail.org> wrote:
> > > =

> > > On 6/10/20 5:30 PM, Daniel Vetter wrote:
> > > > On Wed, Jun 10, 2020 at 04:05:04PM +0200, Christian K=F6nig wrote:
> > > > > Am 10.06.20 um 15:54 schrieb Andrey Grodzovsky:
> > > > > > On 6/10/20 6:15 AM, Thomas Hellstr=F6m (Intel) wrote:
> > > > > > > On 6/9/20 7:21 PM, Koenig, Christian wrote:
> > > > > > > > Am 09.06.2020 18:37 schrieb "Grodzovsky, Andrey"
> > > > > > > > <Andrey.Grodzovsky@amd.com>:
> > > > > > > > =

> > > > > > > > =

> > > > > > > >       On 6/5/20 2:40 PM, Christian K=F6nig wrote:
> > > > > > > >       > Am 05.06.20 um 16:29 schrieb Andrey Grodzovsky:
> > > > > > > >       >>
> > > > > > > >       >> On 5/11/20 2:45 AM, Christian K=F6nig wrote:
> > > > > > > >       >>> Am 09.05.20 um 20:51 schrieb Andrey Grodzovsky:
> > > > > > > >       >>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzov=
sky@amd.com>
> > > > > > > >       >>>> ---
> > > > > > > >       >>>> drivers/gpu/drm/ttm/ttm_bo.c    | 22 +++++++++++=
++++++++++-
> > > > > > > >       >>>> include/drm/ttm/ttm_bo_driver.h |  2 ++
> > > > > > > >       >>>>   2 files changed, 23 insertions(+), 1 deletion(=
-)
> > > > > > > >       >>>>
> > > > > > > >       >>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c
> > > > > > > >       >>>> b/drivers/gpu/drm/ttm/ttm_bo.c
> > > > > > > >       >>>> index c5b516f..eae61cc 100644
> > > > > > > >       >>>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> > > > > > > >       >>>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> > > > > > > >       >>>> @@ -1750,9 +1750,29 @@ void ttm_bo_unmap_virtual=
(struct
> > > > > > > >       >>>> ttm_buffer_object *bo)
> > > > > > > >       >>>> ttm_bo_unmap_virtual_locked(bo);
> > > > > > > >       >>>> ttm_mem_io_unlock(man);
> > > > > > > >       >>>>   }
> > > > > > > >       >>>> +EXPORT_SYMBOL(ttm_bo_unmap_virtual);
> > > > > > > >       >>>>   +void ttm_bo_unmap_virtual_address_space(struct
> > > > > > > >       ttm_bo_device *bdev)
> > > > > > > >       >>>> +{
> > > > > > > >       >>>> +    struct ttm_mem_type_manager *man;
> > > > > > > >       >>>> +    int i;
> > > > > > > >       >>>> -EXPORT_SYMBOL(ttm_bo_unmap_virtual);
> > > > > > > >       >>>
> > > > > > > >       >>>> +    for (i =3D 0; i < TTM_NUM_MEM_TYPES; i++) {
> > > > > > > >       >>>> +        man =3D &bdev->man[i];
> > > > > > > >       >>>> +        if (man->has_type && man->use_type)
> > > > > > > >       >>>> + ttm_mem_io_lock(man, false);
> > > > > > > >       >>>> +    }
> > > > > > > >       >>>
> > > > > > > >       >>> You should drop that it will just result in a dea=
dlock
> > > > > > > >       warning for
> > > > > > > >       >>> Nouveau and has no effect at all.
> > > > > > > >       >>>
> > > > > > > >       >>> Apart from that looks good to me,
> > > > > > > >       >>> Christian.
> > > > > > > >       >>
> > > > > > > >       >>
> > > > > > > >       >> As I am considering to re-include this in V2 of the
> > > > > > > >       patchsets, can
> > > > > > > >       >> you clarify please why this will have no effect at=
 all ?
> > > > > > > >       >
> > > > > > > >       > The locks are exclusive for Nouveau to allocate/fre=
e the io
> > > > > > > >       address
> > > > > > > >       > space.
> > > > > > > >       >
> > > > > > > >       > Since we don't do this here we don't need the locks.
> > > > > > > >       >
> > > > > > > >       > Christian.
> > > > > > > > =

> > > > > > > > =

> > > > > > > >       So basically calling unmap_mapping_range doesn't requ=
ire any extra
> > > > > > > >       locking around it and whatever locks are taken within=
 the function
> > > > > > > >       should be enough ?
> > > > > > > > =

> > > > > > > > =

> > > > > > > > =

> > > > > > > > I think so, yes.
> > > > > > > > =

> > > > > > > > Christian.
> > > > > > > Yes, that's true. However, without the bo reservation, nothin=
g stops
> > > > > > > a PTE from being immediately re-faulted back again. Even while
> > > > > > > unmap_mapping_range() is running.
> > > > > > > =

> > > > > > Can you explain more on this - specifically, which function to =
reserve
> > > > > > the BO, why BO reservation would prevent re-fault of the PTE ?
> > > > > > =

> > > > > Thomas is talking about ttm_bo_reserver()/ttm_bo_unreserve(), but=
 we don't
> > > > > need this because we unmap everything because the whole device is=
 gone and
> > > > > not just manipulate a single BO.
> > > > > =

> > > > > > > So the device removed flag needs to be advertized before this
> > > > > > > function is run,
> > > > > > > =

> > > > > > I indeed intend to call this  right after calling drm_dev_unplu=
g from
> > > > > > amdgpu_pci_remove while adding drm_dev_enter/exit in ttm_bo_vm_=
fault (or
> > > > > > in amdgpu specific wrapper since I don't see how can I access s=
truct
> > > > > > drm_device from ttm_bo_vm_fault) and this in my understanding s=
hould
> > > > > > stop a PTE from being re-faulted back as you pointed out - so a=
gain I
> > > > > > don't see how  bo reservation would prevent it so it looks like=
 I am
> > > > > > missing something...
> > > > > > =

> > > > > > =

> > > > > > > (perhaps with a memory barrier pair).
> > > > > > > =

> > > > > > drm_dev_unplug and drm_dev_enter/exit are RCU synchronized and =
so I
> > > > > > don't think require any extra memory barriers for visibility of=
 the
> > > > > > removed flag being set
> > > > > > =

> > > > > As far as I can see that should be perfectly sufficient.
> > > > Only if you have a drm_dev_enter/exit pair in your fault handler.
> > > > Otherwise you're still open to the races Thomas described. But asid=
e from
> > > > that the drm_dev_unplug stuff has all the barriers and stuff to mak=
e sure
> > > > nothing escapes.
> > > > =

> > > > Failure to drm_dev_enter could then also trigger the special case w=
here we
> > > > put a dummy page in place.
> > > > -Daniel
> > > Hmm, Yes, indeed advertizing the flag before the call to
> > > unmap_mapping_range isn't enough, since there might be fault handlers
> > > running that haven't picked up the flag when unmap_mapping_range is
> > > launched.
> > Hm ... Now I'm not sure drm_dev_enter/exit is actually good enough. I
> > guess if you use vmf_insert_pfn within the drm_dev_enter/exit critical
> > section, it should be fine. But I think you can also do fault handlers
> > that just return the struct page and then let core handle the pte
> > wrangling, those would indeed race and we can't have that I think.
> =

> For the TTM drivers, having a fault handler that defers the pte insertion=
 to
> the core would break also the bo synchronization so I don't think that wi=
ll
> ever happen. To make sure we could perhaps add a return value warning at =
the
> end of the fault handler with a comment explaining why this is a bad idea.

Yeah good thing at least is that vram drivers all use ttm thus far, so
that worry is handled.

And for usb/spi and other panels/ports connected over some bus that can't
do mmio, the mmaps all point at system memory. So we don't have that
problem there.
-Daniel

> =

> > =

> > I think we should try and make sure (as much as possible) that this is
> > done all done in helpers and not some open coded stuff in drivers, or
> > we'll just get it all wrong in the details.
> =

> If doable, considering all the various fault handlers we have in DRM, I
> agree.
> =

> /Thomas
> =

> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
