Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2HHYBdWDpWkCDAYAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 13:34:29 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77EE31D89DE
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 13:34:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8940D10E4B7;
	Mon,  2 Mar 2026 12:34:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ABMSQRTk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52E4A10E4B7
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 12:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772454864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3doa6HfxdfxJ1p5CQxQkAhxxDryXGM6DiFWfZesWQ/A=;
 b=ABMSQRTksCmKVK6dZ9Mc0reiQq/D/tTWkMwtMWktqLXgJnnU/zlu34Pr3hSKc4EBow726E
 QVLN9yQzsgKfqJUD/IeBZM7Nx4QZJuPXlPUAGppBVoPuf6Uj/VTTT3VZE5VCUB6qRByE1e
 IUcrigBO0PiEIkEL9m5p0OUQd4bKU0c=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554-2YgL5xnNPR6-GnmQNHvTLA-1; Mon, 02 Mar 2026 07:34:23 -0500
X-MC-Unique: 2YgL5xnNPR6-GnmQNHvTLA-1
X-Mimecast-MFC-AGG-ID: 2YgL5xnNPR6-GnmQNHvTLA_1772454863
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-506c0da79c5so437345901cf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2026 04:34:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772454863; x=1773059663;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=3doa6HfxdfxJ1p5CQxQkAhxxDryXGM6DiFWfZesWQ/A=;
 b=PgZWoLE3YODnWnvCZrMdKLxFrOJuUpAzJJPv+Jep1u+aZwz+ayqWUysb7Nd6Ndms3u
 hehkw2LWBleV6NdbUQZbdE4+kf7CmDES+2nHBhYU1qFMmeTurf/hSfwxtXAE1wMOmY0x
 qeuuAb6Oyupn1Vh9BhK+uoJcY6lC4DeWvR3aZsSCIM6soyPBgbDiw7La9PhcGm4izImE
 AqAzS7pp8wGadmcsnjDuGo+7o6feWKiOiXJUvGAzJBw05gFv2SzbqX61xSl/2P+MJIhm
 MhBWYwovqCDFQuZcea38wDlx9HkB0b1/OCV0NvRCbLQ5s8dE37Lk4iQasQrDRKisaGOM
 YgIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAkbQeqvMYDniZNQb3CxwTFj4ABU3UaRbQ68CkKmcuyulwmcCZMKg2/YekPUcsm/ujx7gXDOf6/ss=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy2VjMOctpn2iIdMBZyuMUyi8DBHpiaGqaV/td9B7Cr5rLd+YVh
 vRSWMQBNOPYNcT3cAA8sXEcLeaElMnWUp6Rg6UaZFc3FL1J84kcdKrZ0hRZ/foVvb/At5bFGHBE
 YNcOPy9eMzqKSMZwtV9saYdzIxE/5ndPSSv2ySglZ/tp/ia40djioVjFWj9/eENcJvBFGz2hmJc
 Yl1MeWGaXQ7DDkVCXUbuqxZceEiagp8tnd9nB7ZIl8SALI
X-Gm-Gg: ATEYQzyHWY4NbuFNO/L5Kj8C5ZPtuLUjQjILAGsd/vbjWbNZzbN91CMwWWqsDVCFiLj
 k1I0PLpsCqB0ykuCYTc5PSwgOs0Hma8/UNt7wg7wPrnSU1BoDFKER6/jmVfvUAm8jrnNpCitI+L
 yIeEGiJPHkEwGRTfEUpBtekpc68vYLNYBhcfMYEdq2SuqQVQ61W8NzfzesRKtmwNCF2xyFL4pKm
 ygpq0g=
X-Received: by 2002:ac8:7f49:0:b0:502:a1c6:4ee with SMTP id
 d75a77b69052e-50752714b06mr153678771cf.1.1772454862540; 
 Mon, 02 Mar 2026 04:34:22 -0800 (PST)
X-Received: by 2002:ac8:7f49:0:b0:502:a1c6:4ee with SMTP id
 d75a77b69052e-50752714b06mr153678311cf.1.1772454862031; Mon, 02 Mar 2026
 04:34:22 -0800 (PST)
MIME-Version: 1.0
References: <20260228130946.50919-2-ltao@redhat.com>
 <31690b028081ba72ca9babf2d09417376e10f2f1@intel.com>
In-Reply-To: <31690b028081ba72ca9babf2d09417376e10f2f1@intel.com>
From: Tao Liu <ltao@redhat.com>
Date: Tue, 3 Mar 2026 01:33:44 +1300
X-Gm-Features: AaiRm52a0YHO0oHtZTipmB5LVpX2kFAg8VVxT3gl0IBhaHYmqB6zATtNCm8_Zxk
Message-ID: <CAO7dBbV2AtmXRCQkNgYvaAVW8S_jWoQgqC6c1k83H-aug_tNeA@mail.gmail.com>
Subject: Re: [PATCH] i915: Fix NULL pointer dereference in
 intel_dmc_update_dc6_allowed_count()
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com, 
 tursulin@ursulin.net, airlied@gmail.com, simona@ffwll.ch, imre.deak@intel.com, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, kexec@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0YMWq-ORGeBzLdWQ28mLfncew0azzhZFvqPW5HSXK_k_1772454863
X-Mimecast-Originator: redhat.com
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jani.nikula@linux.intel.com,m:rodrigo.vivi@intel.com,m:joonas.lahtinen@linux.intel.com,m:tursulin@ursulin.net,m:airlied@gmail.com,m:simona@ffwll.ch,m:imre.deak@intel.com,m:intel-gfx@lists.freedesktop.org,m:intel-xe@lists.freedesktop.org,m:kexec@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[ltao@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[intel.com,linux.intel.com,ursulin.net,gmail.com,ffwll.ch,lists.freedesktop.org,lists.infradead.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[ltao@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	NEURAL_HAM(-0.00)[-0.992];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 77EE31D89DE
X-Rspamd-Action: no action

On Mon, Mar 2, 2026 at 10:14=E2=80=AFPM Jani Nikula <jani.nikula@linux.inte=
l.com> wrote:
>
> On Sun, 01 Mar 2026, Tao Liu <ltao@redhat.com> wrote:
> > There is a NULL pointer dereference issue noticed in i915 when 2nd kern=
el
> > bootup during kdump. This will panic 2nd kernel and lead to no vmcore
> > generation. The issue is observed in Meteorlake CPU(cpuid: 0xA06A2):
>
> The previously posted fix is [1].

Thanks for the link, I didn't notice it. For kdump case, as far as I
have tested, only adding (!dmc) check for
intel_dmc_update_dc6_allowed_count() is sufficient to allow kdump to
work.

Thanks,
Tao Liu

>
> Imre, please R-b that. It's a NULL pointer dereference in the wild, in
> stable kernels. We need to get it fixed instead of bikeshedding on
> potential incorrect debugfs results.
>
> BR,
> Jani.
>
>
> [1] https://lore.kernel.org/r/20251202183950.2450315-1-jani.nikula@intel.=
com
>
>
> >
> >     BUG: kernel NULL pointer dereference, address: 0000000000000000
> >     #PF: supervisor read access in kernel mode
> >     #PF: error_code(0x0000) - not-present page
> >     PGD 0 P4D 0
> >     Oops: Oops: 0000 [#1] SMP NOPTI
> >     ...
> >     RIP: 0010:intel_dmc_update_dc6_allowed_count+0x16/0xa0 [i915]
> >     ...
> >
> > It is easy to locate the NULL pointer dereference by disassembly:
> >
> >     00000000001171e0 <intel_dmc_update_dc6_allowed_count>:
> >       1171e0:       f3 0f 1e fa             endbr64
> >       1171e4:       e8 00 00 00 00          call   1171e9
> >       1171e9:       41 55                   push   %r13
> >       1171eb:       41 54                   push   %r12
> >       1171ed:       55                      push   %rbp
> >       1171ee:       53                      push   %rbx
> >       1171ef:       4c 8b a7 18 03 00 00    mov    0x318(%rdi),%r12
> >       1171f6:       49 8b 2c 24             mov    (%r12),%rbp
> >
> > To fix this, add a NULL pointer check before dereferencing.
> >
> > Signed-off-by: Tao Liu <ltao@redhat.com>
> > ---
> >
> > The issue doesn't happen in 1st kernel, but in 2nd kernel of kdump. I'm=
 not
> > an expert to i915 and unsure what lead to the NULL pointer. To help fur=
ther
> > analysis, here is the full stack:
> >
> > [    8.608520]  <TASK>
> > [    8.610652]  gen9_set_dc_state.part.0+0x25d/0x2f0 [i915]
> > [    8.616096]  icl_display_core_init+0x2d/0x620 [i915]
> > [    8.621266]  intel_power_domains_init_hw+0x1b2/0x500 [i915]
> > [    8.627047]  intel_display_driver_probe_noirq+0x87/0x300 [i915]
> > [    8.633188]  i915_driver_probe+0x207/0x5d0 [i915]
> > [    8.637977]  ? drm_privacy_screen_get+0x198/0x1c0
> > [    8.642832]  local_pci_probe+0x41/0x90
> > [    8.646646]  pci_call_probe+0x58/0x160
> > [    8.650458]  ? pci_assign_irq+0x2f/0x160
> > [    8.654447]  ? pci_match_device+0xf8/0x120
> > [    8.658522]  pci_device_probe+0x95/0x140
> > [    8.662582]  call_driver_probe+0x27/0x110
> > [    8.666570]  really_probe+0xcc/0x2c0
> > [    8.670190]  __driver_probe_device+0x78/0x120
> > [    8.674692]  driver_probe_device+0x1f/0xa0
> > [    8.678857]  __driver_attach+0xfa/0x230
> > [    8.682757]  ? __pfx___driver_attach+0x10/0x10
> > [    8.687185]  bus_for_each_dev+0x8e/0xe0
> > [    8.691159]  bus_add_driver+0x11f/0x200
> > [    8.694970]  driver_register+0x72/0xd0
> > [    8.698853]  i915_init+0x26/0x90 [i915]
> > [    8.702837]  ? __pfx_i915_init+0x10/0x10 [i915]
> > [    8.707433]  do_one_initcall+0x5c/0x320
> > [    8.711409]  do_init_module+0x60/0x240
> > [    8.715132]  init_module_from_file+0xd6/0x130
> > [    8.719634]  idempotent_init_module+0x114/0x310
> > [    8.724241]  __x64_sys_finit_module+0x71/0xe0
> > [    8.728671]  do_syscall_64+0x11b/0x6d0
> > [    8.732483]  ? ksys_read+0x6b/0xe0
> > [    8.735854]  ? arch_exit_to_user_mode_prepare.isra.0+0xa2/0xd0
> > [    8.741768]  ? do_syscall_64+0x153/0x6d0
> > [    8.745828]  ? do_syscall_64+0x153/0x6d0
> > [    8.749814]  ? do_syscall_64+0x153/0x6d0
> > [    8.753800]  ? clear_bhb_loop+0x30/0x80
> > [    8.757700]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> >
> > ---
> >  drivers/gpu/drm/i915/display/intel_dmc.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm=
/i915/display/intel_dmc.c
> > index 1006b060c3f3..fd2756badc0c 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dmc.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dmc.c
> > @@ -1578,7 +1578,7 @@ void intel_dmc_update_dc6_allowed_count(struct in=
tel_display *display,
> >       struct intel_dmc *dmc =3D display_to_dmc(display);
> >       u32 dc5_cur_count;
> >
> > -     if (DISPLAY_VER(dmc->display) < 14)
> > +     if (!dmc || DISPLAY_VER(dmc->display) < 14)
> >               return;
> >
> >       dc5_cur_count =3D intel_de_read(dmc->display, DG1_DMC_DEBUG_DC5_C=
OUNT);
>
> --
> Jani Nikula, Intel
>

