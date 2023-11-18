Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C431C7F011D
	for <lists+dri-devel@lfdr.de>; Sat, 18 Nov 2023 17:28:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3788310E160;
	Sat, 18 Nov 2023 16:28:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6A0110E160
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Nov 2023 16:28:17 +0000 (UTC)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-1e99b05c8f4so356764fac.0
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Nov 2023 08:28:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1700324897; x=1700929697; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CDmKu2GyolC/00aWIuRVuuwu3nG1NpeN0p+cvPNMlUg=;
 b=f7YM20wt0baQ7oJQiX8PNT7zRatjZw86+CLY3HA9KMfG+rv8158LzEWk7Fjuiv3qHU
 1bGVAIK6M9jhqvocOtA8XC0NMs4XdHkwG2vHEQ7rFXnAkkZLkMqDzBuAHGjTHlFF4yjo
 L+hm7yXVIkYCZUS1csvQF7E1okue6I3fjC1KA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700324897; x=1700929697;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CDmKu2GyolC/00aWIuRVuuwu3nG1NpeN0p+cvPNMlUg=;
 b=JT/OSYX0wNp/s8Aj+bLlXsTlLUvUUmYAI55SZQvi9ZQ2tmHEn+1upAeBjsYFfyq5i6
 nZ7wsdp/1cwQ0xg5WGTf7F1W/YAmu8ZTOm4c8nMZI3qXK+zMmh27Pis2LS1CvopRZ5zP
 O0WgYn3fHJ/8LEWSPfDBAOuGxR1AnFkTxpo2dJfHHeLX+5jF/DtuS0CZ1p5+J4CUOctk
 2Z7K9TOHtMmy8f15z7FwMI9KexDsJQaLe3uel1DtPfoNhlAAvUH7od7kFcyJhu42GwIO
 wfe9gFY0C8XsaD71LpzvuC/yBdAkuPHgq5DsUruUeqP3NDPimd1tAvWUl0cdwdiPfIhe
 JgnQ==
X-Gm-Message-State: AOJu0Yyx6FaBIctAPUVRBJ9R+ENorSRTuHazCHhOUuNa2/C7ZFh3aVyN
 AICirYA6zNIYHpaTayUdllNBg3u+yoX9g19c+ZsHTA==
X-Google-Smtp-Source: AGHT+IEw+5F/dqwwVhln1/qQgZP8jlvQUkqZgo8tO0NZ0U+noibin8fx3tzS3GCxZgJ6LHGpMeVBz4Q2H2Q20Li8LSE=
X-Received: by 2002:a05:6870:1f13:b0:1d5:1a99:537f with SMTP id
 pd19-20020a0568701f1300b001d51a99537fmr2439679oab.2.1700324896704; Sat, 18
 Nov 2023 08:28:16 -0800 (PST)
MIME-Version: 1.0
References: <87leazm0ya.fsf@alyssa.is>
 <ba5c6bda-1512-4155-ad8a-de5dc5fe1f2b@suse.de>
In-Reply-To: <ba5c6bda-1512-4155-ad8a-de5dc5fe1f2b@suse.de>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Sat, 18 Nov 2023 17:28:05 +0100
Message-ID: <CAKMK7uGhucd8EzfLmBATE_X3s=uBLu3+W7HSkJqeQM7rx7jMPA@mail.gmail.com>
Subject: Re: Use after free with GEM shadow-buffered planes
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: Alyssa Ross <hi@alyssa.is>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 17 Nov 2023 at 15:08, Thomas Zimmermann <tzimmermann@suse.de> wrote=
:
>
> Hi
>
> Am 15.11.23 um 17:32 schrieb Alyssa Ross:
> > [Originally reported at https://gitlab.freedesktop.org/drm/misc/-/issue=
s/33]
> >
> > The following happens in a cycle:
> >
> >   =E2=80=A2 An atomic state is allocated
> >   =E2=80=A2 A plane state is allocated (drm_gem_duplicate_shadow_plane_=
state())
> >   =E2=80=A2 Commit (drm_atomic_helper_commit(), possibly nonblocking / =
asynchronously)
> >   =E2=80=A2 The previous plane state is freed (drm_gem_destroy_shadow_p=
lane_state())
> >   =E2=80=A2 The atomic state is put
>
> We acquire a reference on the state at
>
>
> https://elixir.bootlin.com/linux/v6.5/source/drivers/gpu/drm/drm_atomic_h=
elper.c#L2057
>
> and release it at
>
>
> https://elixir.bootlin.com/linux/v6.5/source/drivers/gpu/drm/drm_atomic_h=
elper.c#L1833
>
> All new sub-state, such as for planes, should be kept allocated during
> that time.
>
> >
> > But what happens if a nonblocking commit doesn't get scheduled until a
> > couple of iterations later in the cycle?  Plane states are not
> > refcounted, so by that point, the plane state has been freed, and so
> > commit_tail() will encounter a use after free when it accesses the plan=
e
> > state.
>
> I think it's assumed that the old plane state can be gone by the time
> the commit happens. But why would the new plane state? Did you figure
> this out in your analysis?
>
> >
> > I encountered this issue using simpledrm on the Asahi kernel based on
> > v6.5, but none of the files I examined to determine that this is a
> > use-after-free have been modified from mainline.  I've also reviewed th=
e
> > diff between my kernel and tip of mainline (8f6f76a6a29f), and didn't
> > see anything that would affect this issue.
>
> It could be that we're passing the wrong state at
>
>
> https://elixir.bootlin.com/linux/v6.5/source/drivers/gpu/drm/drm_atomic_h=
elper.c#L2919

Yeah that's buggy, and I think we we discussed this, I missed it. So
the lifetime rules are somewhat tricky:

- An atomic commit is only allowed to look at the subsequent state
objects until it signals comletion of that commit with the hw_done()
helper. After that point ownership of those state structures is handed
to the next commit, which can release them.

- The next commit has to wait for hw_done completions of the previous
commits, so that it doesn't release state objects too early.

- This means that when you're after hw_done() in the commit code, you
can only look at the old state structures. This means that
->cleanup_fb is fine, but the ->end_fb_access case is not. It needs to
be moved much earlier, probably into the varios commit_planes()
functions (we have two of those iirc).

- But ->end_fb_access _is_ in the right place for the case where we've
aborted a commit before the point of no return.

> in some corner case, but I really don't see how.
>
> At least that's how it's supposed to work. I'm still trying to get an
> idea how you end up with an invalid plane state.

It's indeed a very tricky situation here, but I think I understand the
bug. Maybe we need a bunch more commits in relevant places to explain
this all ..

Cheers, Sima

>
> Best regards
> Thomas
>
> >
> > Here's an example of a use after free.  It's been a couple of weeks
> > since I thoroughly investigated this, but from memory, in this case, th=
e
> > plane state has been overwritten by a struct drm_crtc_state.
> >
> > Unable to handle kernel paging request at virtual address 0000000100000=
049
> > Mem abort info:
> >    ESR =3D 0x0000000096000005
> >    EC =3D 0x25: DABT (current EL), IL =3D 32 bits
> >    SET =3D 0, FnV =3D 0
> >    EA =3D 0, S1PTW =3D 0
> >    FSC =3D 0x05: level 1 translation fault
> > Data abort info:
> >    ISV =3D 0, ISS =3D 0x00000005, ISS2 =3D 0x00000000
> >    CM =3D 0, WnR =3D 0, TnD =3D 0, TagAccess =3D 0
> >    GCS =3D 0, Overlay =3D 0, DirtyBit =3D 0, Xs =3D 0
> > user pgtable: 16k pages, 48-bit VAs, pgdp=3D000000080e0e31b0
> > [0000000100000049] pgd=3D080000083d390003, p4d=3D080000083d390003, pud=
=3D080000083db9c003, pmd=3D0000000000000000
> > Internal error: Oops: 0000000096000005 [#1] PREEMPT SMP
> > Modules linked in: overlay uas usb_storage usbhid rfcomm snd_seq_dummy =
snd_hrtimer snd_seq snd_seq_device bnep des_generic libdes md4 brcmfmac_wcc=
 joydev hci_bcm4377 bluetooth brcmfmac brcmutil cfg80211 hid_magicmouse ecd=
h_generic ecc rfkill snd_soc_macaudio macsmc_hid macsmc_power macsmc_reboot=
 ofpart spi_nor apple_isp videobuf2_dma_sg snd_soc_cs42l84 snd_soc_tas2764 =
videobuf2_memops clk_apple_nco snd_soc_apple_mca apple_admac videobuf2_v4l2=
 videodev videobuf2_common mc hid_apple pwm_apple leds_pwm apple_soc_cpufre=
q xt_conntrack nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 ip6t_rpfilter ipt=
_rpfilter xt_pkttype xt_LOG nf_log_syslog nft_compat nf_tables nfnetlink lo=
op tun tap macvlan bridge stp llc fuse zstd zram dm_crypt xhci_plat_hcd xhc=
i_hcd nvmem_spmi_mfd rtc_macsmc gpio_macsmc tps6598x dockchannel_hid simple=
_mfd_spmi regmap_spmi nvme_apple phy_apple_atc dwc3 pcie_apple typec pci_ho=
st_common udc_core apple_sart macsmc_rtkit apple_rtkit_helper apple_dockcha=
nnel macsmc apple_rtkit mfd_core
> >   spmi_apple_controller nvmem_apple_efuses pinctrl_apple_gpio spi_apple=
 i2c_apple apple_dart apple_mailbox btrfs xor xor_neon raid6_pq
> > CPU: 0 PID: 1095074 Comm: kworker/u16:11 Tainted: G S                 6=
.5.0-asahi #1-NixOS
> > Hardware name: Apple MacBook Pro (13-inch, M2, 2022) (DT)
> > Workqueue: events_unbound commit_work
> > pstate: 21400009 (nzCv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=3D--)
> > pc : drm_gem_fb_vunmap+0x18/0x74
> > lr : drm_gem_end_shadow_fb_access+0x1c/0x2c
> > sp : ffff800087ea3d00
> > x29: ffff800087ea3d00 x28: 0000000000000000 x27: 0000000000000000
> > x26: ffff800081325000 x25: 00000000fffffef7 x24: ffff000046c5b560
> > x23: ffff000001fcaa05 x22: 0000000000000000 x21: 0000000100000001
> > x20: ffff000046c5b500 x19: 0000000000000001 x18: 0000000000000000
> > x17: 0000000000000000 x16: 0000000000000000 x15: 0000ffff2e2d5ab0
> > x14: 0000000000000195 x13: 0000000000000000 x12: ffff800081310a80
> > x11: 0000000000000001 x10: 1444e7e23f083897 x9 : 6e82f0b7605f292f
> > x8 : ffff0001249e0f48 x7 : 0000000000000004 x6 : 0000000000000190
> > x5 : 0000000000000001 x4 : ffff000093c54440 x3 : ffff00000e968000
> > x2 : ffff80008077883c x1 : ffff00009ce37498 x0 : 0000000100000001
> > Call trace:
> >   drm_gem_fb_vunmap+0x18/0x74
> >   drm_gem_end_shadow_fb_access+0x1c/0x2c
> >   drm_atomic_helper_cleanup_planes+0x58/0xd8
> >   drm_atomic_helper_commit_tail+0x90/0xa0
> >   commit_tail+0x15c/0x188
> >   commit_work+0x14/0x20
> >   process_one_work+0x1e0/0x344
> >   worker_thread+0x68/0x424
> >   kthread+0xf4/0x100
> >   ret_from_fork+0x10/0x20
> > Code: 910003fd a90153f3 f90013f5 aa0003f5 (f9402400)
> > ---[ end trace 0000000000000000 ]---
>
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)



--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
