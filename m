Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C01DA6E6F0
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 23:59:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23B8210E4E9;
	Mon, 24 Mar 2025 22:59:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PTtr9Mf9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15EF310E0E6;
 Mon, 24 Mar 2025 22:58:59 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-6f666c94285so47383707b3.3; 
 Mon, 24 Mar 2025 15:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742857138; x=1743461938; darn=lists.freedesktop.org;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xOweNL3SXc2nhIPv7ifUcHo8yRDM2GGo5EVKCdQ2n5I=;
 b=PTtr9Mf9SrvWzitnkxplUYUXAleg57HLbRJNWfwgey3B7G383MfMykrzE9snHfhuKZ
 X7T+pxaSXNznH+9GioAcE9OpD3r6XSYq1AI4EPV2XWROebHPq6O/DHs2U6r/Wdene5Mb
 G8OBkSMffyEOpX0VevqhWk9h1BGCFs6jQ52TXBuQaeMze1qmE151QCvL7lmoZ2u8C2fp
 +r8z3uBEkee/hSMbVSztyaRbnPSTni9olI/oSsY3lYmCAQvrAKUPjPdcfrMp5rjduskC
 CxlEqvVbeja6tMiW3XJl9ZBEMPygqNfjZjd6THF7fhWVBzHwNotBIGL4RsPKw/vW3jbE
 DNeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742857138; x=1743461938;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xOweNL3SXc2nhIPv7ifUcHo8yRDM2GGo5EVKCdQ2n5I=;
 b=sQ0ZHpXCZ3Cx213/3G9qqDqPoY2FrGM7ft9OVGKT9QW1c5rNsznFQQZt9V4HDWmMK1
 qLsdh49M4aQRjJmkcuyk4Hv34B3GZZpaqoLGhiEKp2ElrYDYJYLjoEgNRfOFfsd7jNxa
 nVkOb4v0iAwEgPd+ycZ1EvBvecxaLNdc0hggoJjp0/douhOHXaqdV1aYCo83vvZE64Zs
 3X8PDF1I8RQkPerbxsdRLMN0cNNgsWa0NVagf37mz/Bv8kstVHPYXXkTDaOK31w8NzF7
 Lv2Dd6fW8St0PEgFpXqu7sj6LcSi+gFqiU4EIfqIbh3MVUP+gsTr3lKpIws5Sf3K9LJL
 Dy/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfemqLuQcpRM/LYIh8HOoGgAEP97xT8H+UwEwfGyOd4K32oedFtenK/enTRROtctQGdENj6qdZmCBQ@lists.freedesktop.org,
 AJvYcCVJaWYPPeSGPUk80X0WXhKUDe36qxj/7DqZH1IJvmw/epDIuwhaLGPTDBkwMk1bWVniKEMkzg4Jx6QYTiYrFQ==@lists.freedesktop.org,
 AJvYcCVyofEJJIxFggwMmF0RUiG5ZfDN/ZxA9ZkIqURBm8QVBa1D9IyUdMew2RKaeQafRBTCA6+5SCMU@lists.freedesktop.org,
 AJvYcCWauDuRqjn5baeEit8BpYMgJUc2X/zrm/xIecdmXYlmerC1/QjV7z5HaGFq8F2Lf7xpj7NCLvkL55kbHXtqXQp5Mg==@lists.freedesktop.org,
 AJvYcCXEFsOQfhfa68+r9ceetmFqBLmTf5eGN1+xHEkVrdkm7za6lEFdri8xkmq43q8JZFYtz1UpZYv+fblk@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw9CqThENdsuroI2UiaQ89flVw84i1d/b3cZJTffrKO980zAAgP
 Zat97te3E6oT8+M//Dl/ntvfB9c6Xs8cBYrVqlu3yTqwtoiwrpomykDwQ4Er6f0ij0mpkrHOaHJ
 mPgLdpt8aI3/cT/yg5SHV9/Yuf+w=
X-Gm-Gg: ASbGnctTkV0lmbYtxGOa2eSwB2WT+OD+m34b5XAqu0QXm0U7cOuaCuuLAWlbO8fSfSn
 RGazUXVs4uncf1tTflt7ULBhL4kk5NSSEfWomOi593WYh8r65ttIpP0nkLEQwGYpdBJKLmseXgw
 yLUmThbH3kdaKv4LO+3MRTgpgJ
X-Google-Smtp-Source: AGHT+IGJQhE8J9Fev2YDAjew937hy/BDBKy0IxGWP41fseJBpVPTdqCggsrZGeRZCl04ynbwuEzhtC0igtYRZyc/8n8=
X-Received: by 2002:a05:690c:4444:b0:6ef:652b:91cf with SMTP id
 00721157ae682-700bacd28e9mr200033997b3.27.1742857137825; Mon, 24 Mar 2025
 15:58:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250125064619.8305-1-jim.cromie@gmail.com>
 <20250125064619.8305-29-jim.cromie@gmail.com>
 <160ec360-918d-414f-aef9-606cfa1749df@bootlin.com>
 <CAJfuBxxzXoKummiBDGODidpRj7Fm2UDip-T0qkB7L9tscK0zCQ@mail.gmail.com>
In-Reply-To: <CAJfuBxxzXoKummiBDGODidpRj7Fm2UDip-T0qkB7L9tscK0zCQ@mail.gmail.com>
From: jim.cromie@gmail.com
Date: Mon, 24 Mar 2025 16:58:31 -0600
X-Gm-Features: AQ5f1Jq_ealCWnlM2C-q0MIDv15aWKUMJ6YjQ3JJZCvoTPWllKRV36DEBSe2p6k
Message-ID: <CAJfuBxwCPfPHqWFx0Jh+sucT2smf7o_5TmDJELkV7J--ftotuA@mail.gmail.com>
Subject: Re: [PATCH 28/63] dyndbg-API: promote DYNDBG_CLASSMAP_PARAM to API
To: Jim Cromie <jim.cromie@gmail.com>, linux-kernel@vger.kernel.org,
 jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org, 
 intel-gfx-trybot@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch, 
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com, 
 ville.syrjala@linux.intel.com
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

On Sun, Mar 16, 2025 at 3:14=E2=80=AFPM <jim.cromie@gmail.com> wrote:
>
> On Tue, Feb 25, 2025 at 7:29=E2=80=AFAM Louis Chauvet <louis.chauvet@boot=
lin.com> wrote:
> >
> >
> >
> > Le 25/01/2025 =C3=A0 07:45, Jim Cromie a =C3=A9crit :
> > > move the DYNDBG_CLASSMAP_PARAM macro from test-dynamic-debug.c into
> > > the header, and refine it, by distinguishing the 2 use cases:
> > >
> > > 1.DYNDBG_CLASSMAP_PARAM_REF
> > >      for DRM, to pass in extern __drm_debug by name.
> > >      dyndbg keeps bits in it, so drm can still use it as before
> > >
> > > 2.DYNDBG_CLASSMAP_PARAM
> > >      new user (test_dynamic_debug) doesn't need to share state,
> > >      decls a static long unsigned int to store the bitvec.
> > >
> > > __DYNDBG_CLASSMAP_PARAM
> > >     bottom layer - allocate,init a ddebug-class-param, module-param-c=
b.
> > >
> > > Modify ddebug_sync_classbits() argtype deref inside the fn, to give
> > > access to all kp members.
> > >
> > > Also clean up and improve comments in test-code, and add
> > > MODULE_DESCRIPTIONs.
> > >
> > > Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> > > ---
> > >
> > > -v9
> > >   - fixup drm-print.h  add PARAM_REF forwarding macros
> > >     with DYNDBG_CLASSMAP_PARAM_REF in the API, add DRM_ variant
> > > ---
> > >   include/linux/dynamic_debug.h   | 38 +++++++++++++++++++++
> > >   lib/dynamic_debug.c             | 60 ++++++++++++++++++++++--------=
---
> > >   lib/test_dynamic_debug.c        | 59 +++++++++++++-----------------=
--
> > >   lib/test_dynamic_debug_submod.c |  9 ++++-
> > >   4 files changed, 111 insertions(+), 55 deletions(-)
> > >
> > > diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_de=
bug.h
> > > index 48d76a273f68..b47d1088b7ad 100644
> > > --- a/include/linux/dynamic_debug.h
> > > +++ b/include/linux/dynamic_debug.h
> > > @@ -205,6 +205,44 @@ struct ddebug_class_param {
> > >       const struct ddebug_class_map *map;
> > >   };
> > >
> > > +/**
> > > + * DYNDBG_CLASSMAP_PARAM - control a ddebug-classmap from a sys-para=
m
> > > + * @_name:  sysfs node name
> > > + * @_var:   name of the classmap var defining the controlled classes=
/bits
> > > + * @_flags: flags to be toggled, typically just 'p'
> > > + *
> > > + * Creates a sysfs-param to control the classes defined by the
> > > + * exported classmap, with bits 0..N-1 mapped to the classes named.
> > > + * This version keeps class-state in a private long int.
> > > + */
> > > +#define DYNDBG_CLASSMAP_PARAM(_name, _var, _flags)                  =
 \
> > > +     static unsigned long _name##_bvec;                             =
 \
> > > +     __DYNDBG_CLASSMAP_PARAM(_name, _name##_bvec, _var, _flags)
> > > +
> > > +/**
> > > + * DYNDBG_CLASSMAP_PARAM_REF - wrap a classmap with a controlling sy=
s-param
> > > + * @_name:  sysfs node name
> > > + * @_bits:  name of the module's unsigned long bit-vector, ex: __drm=
_debug
> > > + * @_var:   name of the (exported) classmap var defining the classes=
/bits
> > > + * @_flags: flags to be toggled, typically just 'p'
> > > + *
> > > + * Creates a sysfs-param to control the classes defined by the
> > > + * exported clasmap, with bits 0..N-1 mapped to the classes named.
> > > + * This version keeps class-state in user @_bits.  This lets drm che=
ck
> > > + * __drm_debug elsewhere too.
> > > + */
> > > +#define DYNDBG_CLASSMAP_PARAM_REF(_name, _bits, _var, _flags)       =
         \
> > > +     __DYNDBG_CLASSMAP_PARAM(_name, _bits, _var, _flags)
> > > +
> > > +#define __DYNDBG_CLASSMAP_PARAM(_name, _bits, _var, _flags)         =
 \
> > > +     static struct ddebug_class_param _name##_##_flags =3D {        =
   \
> > > +             .bits =3D &(_bits),                                    =
   \
> > > +             .flags =3D #_flags,                                    =
   \
> > > +             .map =3D &(_var),                                      =
   \
> > > +     };                                                             =
 \
> > > +     module_param_cb(_name, &param_ops_dyndbg_classes,              =
 \
> > > +                     &_name##_##_flags, 0600)
> > > +
> > >   /*
> > >    * pr_debug() and friends are globally enabled or modules have sele=
ctively
> > >    * enabled them.
> > > diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
> > > index 781781835094..9283f2866415 100644
> > > --- a/lib/dynamic_debug.c
> > > +++ b/lib/dynamic_debug.c
> > > @@ -660,6 +660,30 @@ static int ddebug_apply_class_bitmap(const struc=
t ddebug_class_param *dcp,
> > >
> > >   #define CLASSMAP_BITMASK(width) ((1UL << (width)) - 1)
> > >
> > > +static void ddebug_class_param_clamp_input(unsigned long *inrep, con=
st struct kernel_param *kp)
> > > +{
> > > +     const struct ddebug_class_param *dcp =3D kp->arg;
> > > +     const struct ddebug_class_map *map =3D dcp->map;
> > > +
> > > +     switch (map->map_type) {
> > > +     case DD_CLASS_TYPE_DISJOINT_BITS:
> > > +             /* expect bits. mask and warn if too many */
> > > +             if (*inrep & ~CLASSMAP_BITMASK(map->length)) {
> > > +                     pr_warn("%s: input: 0x%lx exceeds mask: 0x%lx, =
masking\n",
> > > +                             KP_NAME(kp), *inrep, CLASSMAP_BITMASK(m=
ap->length));
> > > +                     *inrep &=3D CLASSMAP_BITMASK(map->length);
> > > +             }
> > > +             break;
> > > +     case DD_CLASS_TYPE_LEVEL_NUM:
> > > +             /* input is bitpos, of highest verbosity to be enabled =
*/
> > > +             if (*inrep > map->length) {
> > > +                     pr_warn("%s: level:%ld exceeds max:%d, clamping=
\n",
> > > +                             KP_NAME(kp), *inrep, map->length);
> > > +                     *inrep =3D map->length;
> > > +             }
> > > +             break;
> > > +     }
> > > +}
> > >   static int param_set_dyndbg_module_classes(const char *instr,
> > >                                          const struct kernel_param *k=
p,
> > >                                          const char *modnm)
> > > @@ -678,26 +702,15 @@ static int param_set_dyndbg_module_classes(cons=
t char *instr,
> > >               pr_err("expecting numeric input, not: %s > %s\n", instr=
, KP_NAME(kp));
> > >               return -EINVAL;
> > >       }
> > > +     ddebug_class_param_clamp_input(&inrep, kp);
> > >
> > >       switch (map->map_type) {
> > >       case DD_CLASS_TYPE_DISJOINT_BITS:
> > > -             /* expect bits. mask and warn if too many */
> > > -             if (inrep & ~CLASSMAP_BITMASK(map->length)) {
> > > -                     pr_warn("%s: input: 0x%lx exceeds mask: 0x%lx, =
masking\n",
> > > -                             KP_NAME(kp), inrep, CLASSMAP_BITMASK(ma=
p->length));
> > > -                     inrep &=3D CLASSMAP_BITMASK(map->length);
> > > -             }
> > >               v2pr_info("bits:0x%lx > %s.%s\n", inrep, modnm ?: "*", =
KP_NAME(kp));
> > >               totct +=3D ddebug_apply_class_bitmap(dcp, &inrep, *dcp-=
>bits, modnm);
> > >               *dcp->bits =3D inrep;
> > >               break;
> > >       case DD_CLASS_TYPE_LEVEL_NUM:
> > > -             /* input is bitpos, of highest verbosity to be enabled =
*/
> > > -             if (inrep > map->length) {
> > > -                     pr_warn("%s: level:%ld exceeds max:%d, clamping=
\n",
> > > -                             KP_NAME(kp), inrep, map->length);
> > > -                     inrep =3D map->length;
> > > -             }
> > >               old_bits =3D CLASSMAP_BITMASK(*dcp->lvl);
> > >               new_bits =3D CLASSMAP_BITMASK(inrep);
> > >               v2pr_info("lvl:%ld bits:0x%lx > %s\n", inrep, new_bits,=
 KP_NAME(kp));
> > > @@ -1163,15 +1176,24 @@ static const struct proc_ops proc_fops =3D {
> > >   static void ddebug_sync_classbits(const struct kernel_param *kp, co=
nst char *modname)
> > >   {
> > >       const struct ddebug_class_param *dcp =3D kp->arg;
> > > +     unsigned long new_bits;
> > >
> > > -     /* clamp initial bitvec, mask off hi-bits */
> > > -     if (*dcp->bits & ~CLASSMAP_BITMASK(dcp->map->length)) {
> > > -             *dcp->bits &=3D CLASSMAP_BITMASK(dcp->map->length);
> > > -             v2pr_info("preset classbits: %lx\n", *dcp->bits);
> > > +     ddebug_class_param_clamp_input(dcp->bits, kp);
> > > +
> > > +     switch (dcp->map->map_type) {
> > > +     case DD_CLASS_TYPE_DISJOINT_BITS:
> > > +             v2pr_info("  %s: classbits: 0x%lx\n", KP_NAME(kp), *dcp=
->bits);
> > > +             ddebug_apply_class_bitmap(dcp, dcp->bits, 0UL, modname)=
;
> > > +             break;
> > > +     case DD_CLASS_TYPE_LEVEL_NUM:
> > > +             new_bits =3D CLASSMAP_BITMASK(*dcp->lvl);
> > > +             v2pr_info("  %s: lvl:%ld bits:0x%lx\n", KP_NAME(kp), *d=
cp->lvl, new_bits);
> > > +             ddebug_apply_class_bitmap(dcp, &new_bits, 0UL, modname)=
;
> > > +             break;
> > > +     default:
> > > +             pr_err("bad map type %d\n", dcp->map->map_type);
> > > +             return;
> > >       }
> > > -     /* force class'd prdbgs (in USEr module) to match (DEFINEr modu=
le) class-param */
> > > -     ddebug_apply_class_bitmap(dcp, dcp->bits, ~0, modname);
> > > -     ddebug_apply_class_bitmap(dcp, dcp->bits, 0, modname);
> >
> > Hi Jim,
> >
> > We lost the double call with ~0/0, is it normal?
>
> Good catch,
>
> I thought so, since it guarantees the pr_debugs' state to
> comport with sysfs settings on modprobe.
>
> I will review.
>

Ok, Im pretty sure I put those in to override DEBUG settings,
ie reset the default print state to whatever the controlling sysfs node,
if it was declared with CLASSMAP_PARAM*, has the var set at.

It now seems like extra work to clean up a corner case
which they asked for, by defining DEBUG
