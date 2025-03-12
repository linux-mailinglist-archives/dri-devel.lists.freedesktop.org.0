Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F2AA5E1BC
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 17:27:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D37BF10E1BB;
	Wed, 12 Mar 2025 16:26:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BLf2X4K/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DA8B10E044;
 Wed, 12 Mar 2025 16:26:58 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-6fecfae554bso44225157b3.0; 
 Wed, 12 Mar 2025 09:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741796817; x=1742401617; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KtbMoxoY+0r+dGRFaJbObtRqRCRzGoMTxZlGjKoABT8=;
 b=BLf2X4K/JPn7y4ChfYtcQOn9P0w/vYmxGQESwHcvqEGlnWK3x4GYM/RaurQgSAs3rS
 T3JiK+OWLfRmuO/QNdZ3dQdlYfkQ7KaIBHKEGJY1xznikhyAHF2XdPbSuKMZZ3jL9/QP
 y1VZRwkTJZCOQNnXhXrAFAPFrPskAD2IRJKMHXPvnnu/s/AAQl34JGvGgnHZmd06uGiW
 HttbELr2r2bPCa0baFEQCIvo0leRLef/CtVp8zEqLIJrZxG1eKLX98shZusVtq2rwSq3
 s95yuD8twht6O6AHmcV4KcB8FlFkkVK81vbb0V0OLBkDlmV+nRxLtx00f7BTLJahdZpT
 MrqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741796817; x=1742401617;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KtbMoxoY+0r+dGRFaJbObtRqRCRzGoMTxZlGjKoABT8=;
 b=NC5iXDKygDREJa+FPBNckPBkrZHEqznX9Az/tZTb4kDgN99vHN+BwDsvTQjz/cBvcJ
 nTFhlco+KjdJhLotpPKbsAO1rT4PkbyFiuGeha3pbUenlJxzj6m3OzueyIcx8Eu0BhW6
 c3niIfVEeUHJ3+zL7M67Nm4i1FsGUjYUqmb7hO8x/oDsLBZslqZ/kKtBgwHFC+UJxak+
 ZBBiFAxxXnaBS2XXjiLugTV9mA8C105Yga8wXal8LiD2XnGEaZ9aKX68pVZcTTkT1xtM
 YLcz1MSgcRxnoOz2nGwy1iE/PWf90Fko0Hs4lWS4Cs2GpJL1DOtdXTsM5bPOgLOC6Hc6
 O65A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUE17NOI656Gw04Iw/4lUczc93V28l2AYVSIWNQurQz3+w3Gpyz7B73xkyNKCdFMgSSmc/zVxyLzk7Q@lists.freedesktop.org,
 AJvYcCUO6lfh6Nqy4x92mrWidKk4oUPzfllcRaScysE7wl6eQWt7CkDPXT0OGMacKHsRW6tSPjoT1Sp2@lists.freedesktop.org,
 AJvYcCW532afzTqPexFfq89H3Wyrxz733O1oUj5xdv4IfDDwqhcRmMp7H/lT4tD70+3zjZEforREt6K4M8ClpzfDV98E0g==@lists.freedesktop.org,
 AJvYcCWs0biqzup7sdLtvMeSwEF30T6YtWrv6fdBCLGHXqYuJDsceW3sB54+usJhwwDinXtGOFl6dz5+xfBOW4mpQA==@lists.freedesktop.org,
 AJvYcCXMeB1MNSXNF4SXMwvOlGbBcee5taSvj0Irx4aR+eyWPuNEqygCZTxRNKbmLXXHDLrAb0hY+fMudL+o@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy2vzHTRCjvTvpZoJWF3iGECTFU0wrUlYqU0x7/GpHHIP4G3dJx
 O9Vm5ET2pcm+UnzKSa/IP8cywQvAPm38VQ6CfLaZ8cvcpRf0k+vVhdFHSx37e2oprlHXIvPbMfU
 HJR9K/LNtXURqRhEmBECtFJRUOf0=
X-Gm-Gg: ASbGncsdyaKh81FAfqhSOpS6X0xnFpdgkzNcHAS03Ctj9E1TaEJVmTZvlx28pN5v24n
 ZO/13AlvCX0bSxJhZhRpjG1U+Qk5HOZoS+bMSoj//Zo9JMA3FwTaJVzpZJrpBsichsBlcRFuBvJ
 CuMujUjMyr+gtLQTYeQKPMIefn
X-Google-Smtp-Source: AGHT+IGwIilqLIs/47ywUA0mPYyex6iczz3P9omqm4iVSKnzzFj5OIFe77lwOuSPi2ImR4Qb3aQ4cT3QgKXQHZMGiKI=
X-Received: by 2002:a05:690c:3708:b0:6f9:b0a6:6a15 with SMTP id
 00721157ae682-6ff09293b84mr115686997b3.38.1741796816745; Wed, 12 Mar 2025
 09:26:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250125064619.8305-1-jim.cromie@gmail.com>
 <2025022012-viscous-cringing-bf88@gregkh>
 <Z7b50rGRA4RuybgC@phenom.ffwll.local>
 <caba927a-b71b-40bf-96b6-d15418ed705a@bootlin.com>
In-Reply-To: <caba927a-b71b-40bf-96b6-d15418ed705a@bootlin.com>
From: jim.cromie@gmail.com
Date: Wed, 12 Mar 2025 10:26:30 -0600
X-Gm-Features: AQ5f1JqGa1v3EYAxZlTMvkfJud0RHhUAoGaupEFx5s7t6c1Ynr_sb_DXNN9AMWQ
Message-ID: <CAJfuBxwmFETyYZ4_sy92TtZr2a+CbjhGKidGU91uL5XiJy5cOQ@mail.gmail.com>
Subject: Re: [PATCH 00/63] Fix CONFIG_DRM_USE_DYNAMIC_DEBUG=y
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
 jbaron@akamai.com, ukaszb@chromium.org, 
 intel-gfx-trybot@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, tvrtko.ursulin@linux.intel.com, 
 jani.nikula@intel.com, ville.syrjala@linux.intel.com
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

hello everyone,

sorry for the late reply.  I have a cleaner version cooking now.
less inter-commit churn, by bringing more cleanups forward.

I'll send a -v2 soon.  (lets forget all the meandering crap versions I sent=
)

Louis, thanks for testing !!!!!

I wrote the test script and submod.ko so the lib/* parts would stand
by themselves.
And this time, I left the old DECLARE_ macro, so DRM doesnt get a
flag-day breakage :-)

But for ease of testing, I'll keep the DRM parts in the series.
Taking 1st N commits is normal workflow ?

On Fri, Feb 28, 2025 at 9:24=E2=80=AFAM Louis Chauvet <louis.chauvet@bootli=
n.com> wrote:
>
>
>
> Le 20/02/2025 =C3=A0 10:45, Simona Vetter a =C3=A9crit :
> > On Thu, Feb 20, 2025 at 09:31:41AM +0100, Greg KH wrote:
> >> On Fri, Jan 24, 2025 at 11:45:14PM -0700, Jim Cromie wrote:
> >>> This series fixes dynamic-debug's support for DRM debug-categories.
> >>> Classmaps-v1 evaded full review, and got committed in 2 chunks:
> >>>
> >>>    b7b4eebdba7b..6ea3bf466ac6       # core dyndbg changes
> >>>    0406faf25fb1..ee7d633f2dfb       # drm adoption
> >>>
> >>> DRM-CI found a regression during init with drm.debug=3D<initval>; the
> >>> static-keys under the drm-dbgs in drm.ko got enabled, but those in
> >>> drivers & helpers did not.
> >>>
> >>> Root Problem:
> >>>
> >>> DECLARE_DYNDBG_CLASSMAP violated a K&R rule "define once, refer
> >>> afterwards".  Replace it with DYNDBG_CLASSMAP_DEFINE (invoked once in
> >>> drm-core) and DYNDBG_CLASSMAP_USE (invoked repeatedly, in drivers &
> >>> helpers).
> >>>
> >>> _DEFINE exports the classmap it creates (in drm.ko), other modules
> >>> _USE the classmap.  The _USE adds a record ref'g the _DEFINEd (&
> >>> exported) classmap, in a 2nd __dyndbg_class_users section.
> >>>
> >>> So now at modprobe, dyndbg scans the new section after the 1st
> >>> __dyndbg_class_maps section, follows the linkage to the _DEFINEr
> >>> module, finds the (optional) kernel-param controlling the classmap,
> >>> examines its drm.debug=3D<initval>, and applies it to the module bein=
g
> >>> initialized.
> >>>
> >>> To recapitulate the multi-module problem wo DRM involvement, Add:
> >>>
> >>> A. tools/testing/selftests/dynamic_debug/*
> >>>
> >>> This alters pr_debugs in the test-modules, counts the results and
> >>> checks them against expectations.  It uses this formula to test most
> >>> of the control grammar, including the new class keyword.
> >>>
> >>> B. test_dynamic_debug_submod.ko
> >>>
> >>> This alters the test-module to build both parent & _submod ko's, with
> >>> _DEFINE and _USE inside #if/#else blocks.  This recap's DRM's 2 modul=
e
> >>> failure scenario, allowing A to exersize several cases.
> >>>
> >>> The #if/#else puts the 2 macro uses together for clarity, and gives
> >>> the 2 modules identical sets of debugs.
> >>>
> >>> Recent DRM-CI tests are here:
> >>>    https://patchwork.freedesktop.org/series/139147/
> >>>
> >>> Previous rev:
> >>>    https://lore.kernel.org/lkml/20240716185806.1572048-1-jim.cromie@g=
mail.com/
> >>>
> >>> Noteworthy Additions:
> >>>
> >>> 1- drop class "protection" special case, per JBaron's preference.
> >>>     only current use is marked BROKEN so nobody to affect.
> >>>     now framed as policy-choice:
> >>>     #define ddebug_client_module_protects_classes() false
> >>>     subsystems wanting protection can change this.
> >>>
> >>> 2- compile-time arg-tests in DYNDBG_CLASSMAP_DEFINE
> >>>     implement several required constraints, and fail obviously.
> >>>
> >>> 3- modprobe time check of conflicting class-id reservations
> >>>     only affects 2+classmaps users.
> >>>     compile-time solution not apparent.
> >>>
> >>> 4- dyndbg can now cause modprobe to fail.
> >>>     needed to catch 3.
> >>>     maybe some loose ends here on failure.
> >>>
> >>> 5- refactor & rename ddebug_attach_*module_classes
> >>>     reduce repetetive boilerplate on 2 types: maps, users.
> >>>     rework mostly brought forward in patchset to reduce churn
> >>>     TBD: maybe squash more.
> >>>
> >>> Several recent trybot submissions (against drm-tip) have been passing
> >>> CI.BAT, and failing one or few CI.IGT tests randomly; re-tests do not
> >>> reliably repeat the failures.
> >>>
> >>> its also at github.com:jimc/linux.git
> >>>    dd-fix-9[st]-ontip  &  dd-fix-9-13
> >>>
> >>> Ive been running it on my desktop w/o issues.
> >>>
> >>> The drivers/gpu/drm patches are RFC, I think there might be a single
> >>> place to call DRM_CLASSMAP_USE(drm_dedbug_classes) to replace the
> >>> sprinkling of _USEs in drivers and helpers.  IIRC, I tried adding a
> >>> _DEFINE into drm_drv.c, that didn't do it, so I punted for now.
> >>>
> >>> I think the dyndbg core additions are ready for review and merging
> >>> into a (next-next) test/integration tree.
> >>
> >> So whose tree should this go through?
> >
> > I'm trying to get some drm folks to review/test this, but thus far not
> > much success :-/ I think it's good stuff, but I'm somewhat hesitant if =
no
>
> I tested the VKMS driver with this, and it works!
>
> Tested-by: Louis Chauvet <louis.chauvet@bootlin.com>
>
> > one else agrees that it's useful for CI or in-field crash-recording or
> > whatever ...
> >
> > I guess worst case we can land it and hope it attracts more folks?
> >
> > Wrt tree I don't care, but I guess we should then also land the drm sid=
e
> > too.
> > -Sima
> >
> >> And I think the last patch in this series isn't correct, it looks like=
 a
> >> 000 email somehow.
> >>
> >> thanks,
> >>
> >> greg k-h
> >
>
> --
> Louis Chauvet, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
