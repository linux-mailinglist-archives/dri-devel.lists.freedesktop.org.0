Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 006F11F742E
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jun 2020 08:54:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B0B76E250;
	Fri, 12 Jun 2020 06:54:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 381866E260
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jun 2020 06:54:30 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id q25so7230857wmj.0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 23:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=/A2sKJCzh2oT4BJrATj3vyVR0tXfmTNJbae39Fj8Jog=;
 b=PlXAmb3Ew+Q0kh2Hd21/AENUO8fLwZC8+Gjc/IuXK9eJ9VYERobUM1w885u3pcSMSt
 /2c8AvH2aKwSaXlBy9TemClcG8feOpbftA9rs7Js9l1uHB9go92035NMKiF7IC+wUqkH
 oSui0JAiV46g7Vm//3PIQdWMD6/FxiwDw1G9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=/A2sKJCzh2oT4BJrATj3vyVR0tXfmTNJbae39Fj8Jog=;
 b=CiWydsGy+OWZbQrlrooMlrJnzr40khTH2iLxoNKWzBWLp9ZRTJ50YNHPBUu4A/PB6c
 gl5A0peXI87JHgIhEHGCK2BEIgayeCJKeRXN3JqqOLi9uOCffazJl4Fcu9sQLjYIP1Ul
 Oj9dfb1p7MnXpI0RRafP/g49X4dg+aeFT6hAl4YoyYymhgVCHWJbVqeGEJPJkIrJApCG
 TACM9crbBn0yP1vI1gQ7HMmvzYUXxS7LdrwtJK/r4+bP7AG99NVi9yTWnvl4mkIXixMy
 dpUUkFCk4GwVDrcZS5efaLpY5rHsPU2HLjp/bvw4A715zgrUd1D4QiT8Sjehv0xPIKtR
 ziSA==
X-Gm-Message-State: AOAM533yHjIuBv8yG1sq2aXEj03ZyQs2dDT9rtth5WSoK0OYDpVU6fH0
 8l5rc8jNaLGWNKRoohk9K5kRgmVZ+Vs=
X-Google-Smtp-Source: ABdhPJw6c2crghFoJp50f1t2up0pX7//hajsVAVJYEdNFc698vbOCY30Ib+DCB4rYQlgrCFZZ7NfFA==
X-Received: by 2002:a1c:4c16:: with SMTP id z22mr12384500wmf.17.1591944868702; 
 Thu, 11 Jun 2020 23:54:28 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p16sm9250695wru.27.2020.06.11.23.54.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2020 23:54:27 -0700 (PDT)
Date: Fri, 12 Jun 2020 08:54:25 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Subject: Re: [PATCH 1/6] drm/ttm: Add unampping of the entire device address
 space
Message-ID: <20200612065425.GI20149@phenom.ffwll.local>
References: <f36c1fa1-bbee-477a-9cb2-ed2726f27eef@email.android.com>
 <eb9e5896-1f16-2102-350a-1e64d9af7ea8@shipmail.org>
 <b415e3d1-eed9-9b11-b8c1-c85c7b57eb93@amd.com>
 <ce6f6109-67df-e3d0-d56e-3f5c27df40a0@amd.com>
 <20200610153020.GZ20149@phenom.ffwll.local>
 <715ad9d4-7763-382e-237e-8daab42eff46@shipmail.org>
 <52eec123-3fb1-843d-4ede-1fa0daeaa8ce@amd.com>
 <36ee0021-3044-4ae9-0d13-cbc1aba03022@shipmail.org>
 <95df8d05-72b3-f4bd-f68a-696e402e5599@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <95df8d05-72b3-f4bd-f68a-696e402e5599@amd.com>
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
Cc: "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "michel@daenzer.net" <michel@daenzer.net>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m_=28Intel=29?= <thomas_os@shipmail.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 11, 2020 at 11:06:16AM -0400, Andrey Grodzovsky wrote:
> =

> On 6/11/20 2:35 AM, Thomas Hellstr=F6m (Intel) wrote:
> > =

> > On 6/10/20 11:19 PM, Andrey Grodzovsky wrote:
> > > =

> > > On 6/10/20 4:30 PM, Thomas Hellstr=F6m (Intel) wrote:
> > > > =

> > > > On 6/10/20 5:30 PM, Daniel Vetter wrote:
> > > > > On Wed, Jun 10, 2020 at 04:05:04PM +0200, Christian K=F6nig wrote:
> > > > > > Am 10.06.20 um 15:54 schrieb Andrey Grodzovsky:
> > > > > > > =

> > > > > > > On 6/10/20 6:15 AM, Thomas Hellstr=F6m (Intel) wrote:
> > > > > > > > =

> > > > > > > > On 6/9/20 7:21 PM, Koenig, Christian wrote:
> > > > > > > > > =

> > > > > > > > > Am 09.06.2020 18:37 schrieb "Grodzovsky, Andrey"
> > > > > > > > > <Andrey.Grodzovsky@amd.com>:
> > > > > > > > > =

> > > > > > > > > =

> > > > > > > > > =A0=A0=A0=A0 On 6/5/20 2:40 PM, Christian K=F6nig wrote:
> > > > > > > > > =A0=A0=A0=A0 > Am 05.06.20 um 16:29 schrieb Andrey Grodzo=
vsky:
> > > > > > > > > =A0=A0=A0=A0 >>
> > > > > > > > > =A0=A0=A0=A0 >> On 5/11/20 2:45 AM, Christian K=F6nig wro=
te:
> > > > > > > > > =A0=A0=A0=A0 >>> Am 09.05.20 um 20:51 schrieb Andrey Grod=
zovsky:
> > > > > > > > > =A0=A0=A0=A0 >>>> Signed-off-by: Andrey Grodzovsky
> > > > > > > > > <andrey.grodzovsky@amd.com>
> > > > > > > > > =A0=A0=A0=A0 >>>> ---
> > > > > > > > > =A0=A0=A0=A0 >>>> drivers/gpu/drm/ttm/ttm_bo.c | 22 +++++=
++++++++++++++++-
> > > > > > > > > =A0=A0=A0=A0 >>>> include/drm/ttm/ttm_bo_driver.h | 2 ++
> > > > > > > > > =A0=A0=A0=A0 >>>> =A0 2 files changed, 23 insertions(+), =
1 deletion(-)
> > > > > > > > > =A0=A0=A0=A0 >>>>
> > > > > > > > > =A0=A0=A0=A0 >>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo=
.c
> > > > > > > > > =A0=A0=A0=A0 >>>> b/drivers/gpu/drm/ttm/ttm_bo.c
> > > > > > > > > =A0=A0=A0=A0 >>>> index c5b516f..eae61cc 100644
> > > > > > > > > =A0=A0=A0=A0 >>>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> > > > > > > > > =A0=A0=A0=A0 >>>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> > > > > > > > > =A0=A0=A0=A0 >>>> @@ -1750,9 +1750,29 @@ void ttm_bo_unma=
p_virtual(struct
> > > > > > > > > =A0=A0=A0=A0 >>>> ttm_buffer_object *bo)
> > > > > > > > > =A0=A0=A0=A0 >>>> ttm_bo_unmap_virtual_locked(bo);
> > > > > > > > > =A0=A0=A0=A0 >>>> ttm_mem_io_unlock(man);
> > > > > > > > > =A0=A0=A0=A0 >>>> =A0 }
> > > > > > > > > =A0=A0=A0=A0 >>>> +EXPORT_SYMBOL(ttm_bo_unmap_virtual);
> > > > > > > > > =A0=A0=A0=A0 >>>> =A0 +void ttm_bo_unmap_virtual_address_=
space(struct
> > > > > > > > > =A0=A0=A0=A0 ttm_bo_device *bdev)
> > > > > > > > > =A0=A0=A0=A0 >>>> +{
> > > > > > > > > =A0=A0=A0=A0 >>>> +=A0=A0=A0 struct ttm_mem_type_manager =
*man;
> > > > > > > > > =A0=A0=A0=A0 >>>> +=A0=A0=A0 int i;
> > > > > > > > > =A0=A0=A0=A0 >>>> -EXPORT_SYMBOL(ttm_bo_unmap_virtual);
> > > > > > > > > =A0=A0=A0=A0 >>>
> > > > > > > > > =A0=A0=A0=A0 >>>> +=A0=A0=A0 for (i =3D 0; i < TTM_NUM_ME=
M_TYPES; i++) {
> > > > > > > > > =A0=A0=A0=A0 >>>> +=A0=A0=A0=A0=A0=A0=A0 man =3D &bdev->m=
an[i];
> > > > > > > > > =A0=A0=A0=A0 >>>> +=A0=A0=A0=A0=A0=A0=A0 if (man->has_typ=
e && man->use_type)
> > > > > > > > > =A0=A0=A0=A0 >>>> + ttm_mem_io_lock(man, false);
> > > > > > > > > =A0=A0=A0=A0 >>>> +=A0=A0=A0 }
> > > > > > > > > =A0=A0=A0=A0 >>>
> > > > > > > > > =A0=A0=A0=A0 >>> You should drop that it will just result=
 in a deadlock
> > > > > > > > > =A0=A0=A0=A0 warning for
> > > > > > > > > =A0=A0=A0=A0 >>> Nouveau and has no effect at all.
> > > > > > > > > =A0=A0=A0=A0 >>>
> > > > > > > > > =A0=A0=A0=A0 >>> Apart from that looks good to me,
> > > > > > > > > =A0=A0=A0=A0 >>> Christian.
> > > > > > > > > =A0=A0=A0=A0 >>
> > > > > > > > > =A0=A0=A0=A0 >>
> > > > > > > > > =A0=A0=A0=A0 >> As I am considering to re-include this in=
 V2 of the
> > > > > > > > > =A0=A0=A0=A0 patchsets, can
> > > > > > > > > =A0=A0=A0=A0 >> you clarify please why this will have no =
effect at all ?
> > > > > > > > > =A0=A0=A0=A0 >
> > > > > > > > > =A0=A0=A0=A0 > The locks are exclusive for Nouveau to all=
ocate/free the io
> > > > > > > > > =A0=A0=A0=A0 address
> > > > > > > > > =A0=A0=A0=A0 > space.
> > > > > > > > > =A0=A0=A0=A0 >
> > > > > > > > > =A0=A0=A0=A0 > Since we don't do this here we don't need =
the locks.
> > > > > > > > > =A0=A0=A0=A0 >
> > > > > > > > > =A0=A0=A0=A0 > Christian.
> > > > > > > > > =

> > > > > > > > > =

> > > > > > > > > =A0=A0=A0=A0 So basically calling
> > > > > > > > > unmap_mapping_range doesn't require any
> > > > > > > > > extra
> > > > > > > > > =A0=A0=A0=A0 locking around it and whatever locks
> > > > > > > > > are taken within the function
> > > > > > > > > =A0=A0=A0=A0 should be enough ?
> > > > > > > > > =

> > > > > > > > > =

> > > > > > > > > =

> > > > > > > > > I think so, yes.
> > > > > > > > > =

> > > > > > > > > Christian.
> > > > > > > > Yes, that's true. However, without the bo
> > > > > > > > reservation, nothing stops
> > > > > > > > a PTE from being immediately re-faulted back again. Even wh=
ile
> > > > > > > > unmap_mapping_range() is running.
> > > > > > > > =

> > > > > > > Can you explain more on this - specifically, which
> > > > > > > function to reserve
> > > > > > > the BO, why BO reservation would prevent re-fault of the PTE ?
> > > > > > > =

> > > > > > Thomas is talking about
> > > > > > ttm_bo_reserver()/ttm_bo_unreserve(), but we don't
> > > > > > need this because we unmap everything because the whole
> > > > > > device is gone and
> > > > > > not just manipulate a single BO.
> > > > > > =

> > > > > > > > So the device removed flag needs to be advertized before th=
is
> > > > > > > > function is run,
> > > > > > > > =

> > > > > > > I indeed intend to call this=A0 right after calling
> > > > > > > drm_dev_unplug from
> > > > > > > amdgpu_pci_remove while adding drm_dev_enter/exit in
> > > > > > > ttm_bo_vm_fault (or
> > > > > > > in amdgpu specific wrapper since I don't see how can I access=
 struct
> > > > > > > drm_device from ttm_bo_vm_fault) and this in my understanding=
 should
> > > > > > > stop a PTE from being re-faulted back as you pointed
> > > > > > > out - so again I
> > > > > > > don't see how=A0 bo reservation would prevent it so it looks =
like I am
> > > > > > > missing something...
> > > > > > > =

> > > > > > > =

> > > > > > > > (perhaps with a memory barrier pair).
> > > > > > > > =

> > > > > > > drm_dev_unplug and drm_dev_enter/exit are RCU synchronized an=
d so I
> > > > > > > don't think require any extra memory barriers for visibility =
of the
> > > > > > > removed flag being set
> > > > > > > =

> > > > > > As far as I can see that should be perfectly sufficient.
> > > > > Only if you have a drm_dev_enter/exit pair in your fault handler.
> > > > > Otherwise you're still open to the races Thomas described.
> > > > > But aside from
> > > > > that the drm_dev_unplug stuff has all the barriers and stuff
> > > > > to make sure
> > > > > nothing escapes.
> > > > > =

> > > > > Failure to drm_dev_enter could then also trigger the special
> > > > > case where we
> > > > > put a dummy page in place.
> > > > > -Daniel
> > > > =

> > > > Hmm, Yes, indeed advertizing the flag before the call to
> > > > unmap_mapping_range isn't enough, since there might be fault
> > > > handlers running that haven't picked up the flag when
> > > > unmap_mapping_range is launched.
> > > =

> > > =

> > > If you mean those fault handlers that were in progress when the flag
> > > (drm_dev_unplug) was set in amdgpu_pci_remove then as long as i wrap
> > > the entire fault handler (probably using amdgpu specific .fault hook
> > > around ttm_bo_vm_fault) with drm_dev_enter/exit pair then
> > > drm_dev_unplug->synchronize_srcu will block until those in progress
> > > faults have completed and only after this i will call
> > > unmap_mapping_range. Should this be enough ?
> > > =

> > > Andrey
> > > =

> > > =

> > Yes, I believe so. Although I suspect you might trip lockdep with
> > reverse locking order against the mmap_sem which is a constant pain in
> > fault handlers. If that's the case, you might be able to introduce
> > another srcu lock for this special purpose and synchronize just before
> > the address-space-wide unmap_mapping_range(). If it turns out that an
> > address space srcu lock like this is really needed, we should follow
> > Daniel's suggestion and try to use it from drm-wide helpers.
> > =

> > /Thomas
> =

> =

> Does it make sense to prefault and set to zero page the entire VA range
> covered by the given VMA on the first page fault post device disconnect to
> save on other similar page faults ?

Performance doesn't matter at all on hotunplug, as long as we eventually
finish. Timing out the pci transactions will be so slow (while all the
hotunplug processing is going on) that serving a few billion minor faults
is peanuts. Simpler code wins here imo.

Also if you want to prefault, you also really want to prefault for the
normal use-case, and that should be done (iirc already is?) in the ttm
fault handler.
-Daniel

> =

> Andrey
> =

> =

> > =

> > =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
