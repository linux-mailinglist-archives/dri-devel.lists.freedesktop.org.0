Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF13BB790E
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 18:35:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8966610E949;
	Fri,  3 Oct 2025 16:35:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="l49eIL0z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com
 [74.125.224.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CE8410E949
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Oct 2025 16:35:38 +0000 (UTC)
Received: by mail-yx1-f41.google.com with SMTP id
 956f58d0204a3-6354f14b881so2148485d50.3
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Oct 2025 09:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759509337; x=1760114137; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cNSO+944ZR2H6x5RKg8sRR6z8l/HHp3toady+ufsnF8=;
 b=l49eIL0zaKXycaqLDtFwWZ6Rj8ZgdbqgzfKCyGN4CfzccKGREQbU00dLYtCqrTEJZS
 ehsU3Hl7Ts4ilHUvdtpXO7rEJ1GVzYBZBgbKXFpADDozxXJRlIrIx6ae0CbGP4+SiQsG
 pAIv0HViQzmYF8GiSBtlIAMf3UhjHh3KBuyv6D+9o2v92WAZ8avdRWefTLBY/2++yZeN
 m3P7p2lvsZf6gar4F5ywfp3PXrZlN7Th0kAclA4u91JDWMf93etSerRVV4Li9aHqP2VI
 jADzbNIeytJNvG9olaP/TG+Xx3H4tUtqZtL3UEfaFcTZjV2EIYjQLctFEuALsnlCE7ab
 lJgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759509337; x=1760114137;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cNSO+944ZR2H6x5RKg8sRR6z8l/HHp3toady+ufsnF8=;
 b=TphErfrSH73j3XVtCZ7Y1CdFTBpr80ZkRBg2CCbQb/WB2HZN0TZ93kAg4q66ANWf1J
 5pyDkosrt1Qfl14o9o7wAFsvpsAxFSz3iV37TXIHQkBAXpWV9SDZAIYhMHeb+K2ceWxH
 Pl7UX2iZkGCfxNIs+Hl3aDMKF7mCaQG+gqpAemOdIPm1LSs90NRijOdNpL5aNfFbp4Po
 1dcgcMki2ZJU9u1QAs2Svqx23YlEKywKc/As9S/rKkM8RA1gjGNi0OyLk6sbuvjcTffQ
 DfWU50R+yqFZRfKYS/OT59xcf+jkn7/2CazVNcQpQ9GkX7yfKaqp3Mm7ZfDNUxPf35PL
 Hatw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkD5i+IbHjgaZ5oQx90a1QpD7NLgRpXe2jVk0IAB/eJ6JCvW12Ca0vxie206sgEAMlwI4Pt2e01z0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzS1pYvNkvHkOsua+uB53p2fKxdUfxpZSfTTPfL9tVEhad8/riU
 aEN5DTkAB8KyuszHXmths9HxN12aFzLStfbmaqNKYSsQWAJVZges5XM4XaRN0AU5CPD83GTQDKC
 jF9WchvCQKAe1x/55qEmoCuqCEC6YfbY=
X-Gm-Gg: ASbGncs3j08fuYlyDxHKsrVDj9K22enONzf3AZVxGBPw3WsJ2d8BbImkqixvptD3EFW
 R2xswzT/RPUboaUMJ7mUu4deGretRbOGvkexSZNbsYzD7jYSpo42UuK2uib+mZvn4W/L9xDsQIX
 ue5vUGLvyCfVqwr5jH+tE/QaF3sfGwg8JyHz5gb04eKY5N9gCsjZarCymlz6cXK509N8InTd4YT
 XtlEBrtP0NbU57uNPyUMd7jT6VOX3LZsjaAyEA06+LDAtkulXh0K7g+EIs4JW7+RHSCKIpSO6Pn
 CFJthJFlb3h6gk/pvjRAtEPjubvRU/BP
X-Google-Smtp-Source: AGHT+IHv72FMSXkyo1Fp7W5d+5WY2maMzjTcyLcOZbJPZT49yNwAD+A8OjRUQe+ZgQqP+MgTmfVLfnAqYIUnbWaYqqc=
X-Received: by 2002:a53:8605:0:b0:639:41a5:cdc3 with SMTP id
 956f58d0204a3-63b9a107debmr2834822d50.34.1759509336837; Fri, 03 Oct 2025
 09:35:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250916210823.4033529-1-olvaffe@gmail.com>
 <20250916210823.4033529-6-olvaffe@gmail.com>
 <ca22f80c-c233-4030-81d1-f425b8c1fb83@arm.com>
 <CAPaKu7RKDwpSqJ6u8mjcc4G0Z-T7G1LxFw2rXQtxgSW=1_-jkw@mail.gmail.com>
 <25333c43-ccd0-440d-885c-19c5f54d315a@arm.com>
In-Reply-To: <25333c43-ccd0-440d-885c-19c5f54d315a@arm.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Fri, 3 Oct 2025 09:35:26 -0700
X-Gm-Features: AS18NWA2kPrwB1YCHLvLxzk2yW_P1b_E5W8thcxJvwpGrAwH92eaWiAlkEjvvII
Message-ID: <CAPaKu7QMwry6dLGignDZg+C38DGV=iGv1Y3Dv5nNagNwp7OHEQ@mail.gmail.com>
Subject: Re: [PATCH 05/10] drm/panthor: rename and document
 mmu_hw_do_operation_locked
To: Steven Price <steven.price@arm.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Grant Likely <grant.likely@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Oct 3, 2025 at 7:13=E2=80=AFAM Steven Price <steven.price@arm.com> =
wrote:
>
> On 03/10/2025 01:31, Chia-I Wu wrote:
> > On Thu, Oct 2, 2025 at 3:41=E2=80=AFAM Steven Price <steven.price@arm.c=
om> wrote:
> >>
> >> On 16/09/2025 22:08, Chia-I Wu wrote:
> >>> Rename mmu_hw_do_operation_locked to mmu_hw_flush_caches.
> >>
> >> This is confusing, you've renamed the _locked variant and left the
> >> wrapper mmu_hw_do_operation() with the old name.
> > The commit message says "rename and document", and I try to stay true
> > to it. I could certainly squash some of the commits to make this
> > series less confusing.
>
> The idea is to have commits where the code change makes sense. The
> subject and commit message then explain the reason for making the change.
>
> Squashing the commits isn't the answer, but you need to explain the
> "why" in the commit message. I believe the reasoning here is that you
> are going to get rid of the wrapper in a later commit ("simplify
> mmu_hw_flush_caches") but there's nothing here to say that. I had to dig
> through the later commits to find the relevant one.
>
> >>
> >> I agree "do operation" isn't a great name, although "flush caches"
> >> sounds to me like it's a function which does the whole cache flush dan=
ce
> >> in one go, but it's still the same "one part of a cache flush operatio=
n"
> >> code.
> > It gets the name from being a wrapper for panthor_gpu_flush_caches.
> > Which part of "cache flush operation" is missing?
>
> Well "operation" is missing... My point is that a function called
> mmu_hw_cmd_flush_caches sounds like it handles the whole procedure. It's
> less obvious that it is only doing one part of the operation, note that
> the description you gave is:
>
> >   * Issue LOCK/GPU_FLUSH_CACHES/UNLOCK commands in order to flush and
> >   * invalidate L2/MMU/LSC caches for a region.
>
> Which again is misleading. It issues *a* LOCK/... *command*. Just one.
> So you use it as part of a procedure to perform the flush/invalidate danc=
e.
>
> Sorry, I don't mean to be awkward about this, but renaming various
> things means I've got to remember the new name as well as the old name
> (when looking at older commits/backports). So if we're going to change a
> name we a good justification otherwise it's just code churn. Note also
> that we have very similar code in panfrost (panfrost_mmu.c) which
> currently has the same names as panthor. I'm not exactly happy with the
> duplication, but at least if they have the same names it's easy enough
> to reason about.
That's very fair. I was hoping the new names are objectively better,
but they clearly aren't. Let's drop the series.

>
> Thanks,
> Steve
>
> >>
> >> Thanks,
> >> Steve
> >>
> >>>
> >>> Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
> >>> ---
> >>>  drivers/gpu/drm/panthor/panthor_mmu.c | 22 +++++++++++++++++-----
> >>>  1 file changed, 17 insertions(+), 5 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/=
panthor/panthor_mmu.c
> >>> index 727339d80d37e..7d1645a24129d 100644
> >>> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> >>> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> >>> @@ -622,8 +622,20 @@ static void mmu_hw_cmd_unlock(struct panthor_dev=
ice *ptdev, u32 as_nr)
> >>>       write_cmd(ptdev, as_nr, AS_COMMAND_UNLOCK);
> >>>  }
> >>>
> >>> -static int mmu_hw_do_operation_locked(struct panthor_device *ptdev, =
int as_nr,
> >>> -                                   u64 iova, u64 size, u32 op)
> >>> +/**
> >>> + * mmu_hw_cmd_flush_caches() - Flush and invalidate L2/MMU/LSC cache=
s
> >>> + * @ptdev: Device.
> >>> + * @as_nr: AS to issue command to.
> >>> + * @iova: Start of the region.
> >>> + * @size: Size of the region.
> >>> + * @op: AS_COMMAND_FLUSH_*
> >>> + *
> >>> + * Issue LOCK/GPU_FLUSH_CACHES/UNLOCK commands in order to flush and
> >>> + * invalidate L2/MMU/LSC caches for a region.
> >>> + *
> >>> + * Return: 0 on success, a negative error code otherwise.
> >>> + */
> >>> +static int mmu_hw_flush_caches(struct panthor_device *ptdev, int as_=
nr, u64 iova, u64 size, u32 op)
> >>>  {
> >>>       const u32 l2_flush_op =3D CACHE_CLEAN | CACHE_INV;
> >>>       u32 lsc_flush_op;
> >>> @@ -680,7 +692,7 @@ static int mmu_hw_do_operation(struct panthor_vm =
*vm,
> >>>       int ret;
> >>>
> >>>       mutex_lock(&ptdev->mmu->as.slots_lock);
> >>> -     ret =3D mmu_hw_do_operation_locked(ptdev, vm->as.id, iova, size=
, op);
> >>> +     ret =3D mmu_hw_flush_caches(ptdev, vm->as.id, iova, size, op);
> >>>       mutex_unlock(&ptdev->mmu->as.slots_lock);
> >>>
> >>>       return ret;
> >>> @@ -691,7 +703,7 @@ static int panthor_mmu_as_enable(struct panthor_d=
evice *ptdev, u32 as_nr,
> >>>  {
> >>>       int ret;
> >>>
> >>> -     ret =3D mmu_hw_do_operation_locked(ptdev, as_nr, 0, ~0ULL, AS_C=
OMMAND_FLUSH_MEM);
> >>> +     ret =3D mmu_hw_flush_caches(ptdev, as_nr, 0, ~0ULL, AS_COMMAND_=
FLUSH_MEM);
> >>>       if (ret)
> >>>               return ret;
> >>>
> >>> @@ -702,7 +714,7 @@ static int panthor_mmu_as_disable(struct panthor_=
device *ptdev, u32 as_nr)
> >>>  {
> >>>       int ret;
> >>>
> >>> -     ret =3D mmu_hw_do_operation_locked(ptdev, as_nr, 0, ~0ULL, AS_C=
OMMAND_FLUSH_MEM);
> >>> +     ret =3D mmu_hw_flush_caches(ptdev, as_nr, 0, ~0ULL, AS_COMMAND_=
FLUSH_MEM);
> >>>       if (ret)
> >>>               return ret;
> >>>
> >>
>
