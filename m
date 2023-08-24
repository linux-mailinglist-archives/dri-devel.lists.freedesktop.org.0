Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9305D7871C7
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 16:37:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABC5E10E560;
	Thu, 24 Aug 2023 14:37:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [IPv6:2607:f8b0:4864:20::c2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 353B310E55D;
 Thu, 24 Aug 2023 14:37:52 +0000 (UTC)
Received: by mail-oo1-xc2a.google.com with SMTP id
 006d021491bc7-56ee1ed7781so3452408eaf.3; 
 Thu, 24 Aug 2023 07:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692887871; x=1693492671;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6o2ZOzS0JMq71T3BvQHWRtn6n0Naj278KFpjqiFiWXw=;
 b=AZFFwro5yLZ0vEPT544VBqd0ppSjUxe2mNbK5cpWxbTOeyYBpLhntjoPgUNompTmp0
 FMXL+bO9Up1X9ybnHi9iA6jcSlkcdMB/aLVRb1w7nH5MbMTfXJwcUqPPzP8sVizkMyZE
 FxgTNHnbKzIxG4F7G48iBW8CrKqqrUBB9hOHtuVtsgTHgglLSeoze7Zl7C9dEYRLoFSv
 ivLsS1pSKnejzriaxy05wT8OZmW9dTgJcduBlf0XrfYLRXWnjQAmrP4tO4RN5HWSNu7p
 oIDU3L0+3kXsUcm1rhkllqtGRT7/O9nukO1mZdbgAxq5wUvGPdq7JJUuLRriVxT27XNb
 hM0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692887871; x=1693492671;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6o2ZOzS0JMq71T3BvQHWRtn6n0Naj278KFpjqiFiWXw=;
 b=g6h73VWI/qg/HZgo/9GvTqMpWOVrP9iMrEa3JacvVPJ6Lnh18lspUZpEIPRXCuAuxI
 m9WTnmqn/MBTU5sVzFxtmJsTvs8jlanSSZJ3+4GE8Cyaghx78lNBgHlUgjxsFfa7PnE8
 /Skmq49QFI40OIKcdvKM77EYXxOjyJAyBik1zqwqIOd/LSX4tNolW5vSipnXivSDIFw8
 6fTGOOnpGIH6vu+nv5Jbips/+ixjtVWOLFK+kAWGAOBsjputrbj1U2e4AEgbqcYobkYw
 L/bxsYtZad3pcwUNMLkgdx94rrWdf63XvTqqg4eOeM4Yix2zGyvxMq2CE2aCkME48Kf5
 +BAQ==
X-Gm-Message-State: AOJu0YyRGiqkH4h90AbvgmiLYq08wLfta/FW2J3Utgkvy7k0miX17+bv
 Zf7lnlCI6/hprzYsWAI7J1B6NQqWmH6L/C1AJTk=
X-Google-Smtp-Source: AGHT+IHScBrnxmIPHIGRU83oJMjjbc1Dqi2WGE1vyd1r4mVoBR4fgCbsUq+gq25t3bEaXdL3OyfwmZFAHh0CctQI4eY=
X-Received: by 2002:a4a:301e:0:b0:570:fdf2:41f0 with SMTP id
 q30-20020a4a301e000000b00570fdf241f0mr2511525oof.1.1692887871297; Thu, 24 Aug
 2023 07:37:51 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1692524665.git.christophe.jaillet@wanadoo.fr>
 <5d52550a-92a1-55e7-69ad-92f18330ff48@amd.com>
 <09943fe4-792f-e2b8-05d0-2c11f688b8bd@amd.com>
 <05d2313c-1ff9-6c9e-727a-2364f5472325@amd.com>
In-Reply-To: <05d2313c-1ff9-6c9e-727a-2364f5472325@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 24 Aug 2023 10:37:40 -0400
Message-ID: <CADnq5_MCcFxXVWiAKJsaQ5esPCXnRtRTF0ES3r_OarMcNG96+w@mail.gmail.com>
Subject: Re: [PATCH 0/4] drm/amdgpu: Explicitly add a flexible array at the
 end of 'struct amdgpu_bo_list' and simplify amdgpu_bo_list_create()
To: "Somalapuram, Amaranath" <asomalap@amd.com>
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
Cc: Shashank Sharma <shashank.sharma@amd.com>, Xinhui.Pan@amd.com,
 dri-devel@lists.freedesktop.org, Arunpravin.PaneerSelvam@amd.com,
 Felix.Kuehling@amd.com, "Somalapuram,
 Amaranath" <Amaranath.Somalapuram@amd.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, "Prosyak,
 Vitaly" <Vitaly.Prosyak@amd.com>, alexander.deucher@amd.com,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 22, 2023 at 9:35=E2=80=AFAM Somalapuram, Amaranath <asomalap@am=
d.com> wrote:
>
>
> On 8/21/2023 6:30 PM, Shashank Sharma wrote:
> > + Amar should be able to help.
> >
> > Amar,
> >
> > Can you please check this patch (series if required) with a few IGTs
> > and probably with Xonotic as well ?
> >
> Tested patch series  with IGT and Xonoti,
> 1st time I observed while launching  xonoti, some kernel WARNING. But
> unable to reproduced it.
> Attaching dmesg.

This looks unrelated.  I think I saw a display patch that went out
this week to fix this.  I've applied the patches.  We'll see how CI
likes them as well.

Thanks!

Alex


>
> [  739.564460] ------------[ cut here ]------------
> [  739.564466] amdgpu 0000:03:00.0:
> drm_WARN_ON_ONCE(drm_drv_uses_atomic_modeset(dev))
> [  739.564518] WARNING: CPU: 15 PID: 1072 at
> drivers/gpu/drm/drm_vblank.c:728
> drm_crtc_vblank_helper_get_vblank_timestamp_internal+0x375/0x3d0 [drm]
> [  739.564593] Modules linked in: amdgpu snd_hda_codec_realtek
> snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi intel_rapl_msr
> intel_rapl_common snd_hda_intel edac_mce_amd binfmt_misc
> snd_intel_dspcfg snd_intel_sdw_acpi snd_hda_codec iommu_v2 snd_hda_core
> drm_buddy kvm_amd snd_hwdep gpu_sched nls_iso8859_1 snd_pcm
> drm_suballoc_helper drm_ttm_helper kvm ttm snd_seq_midi
> drm_display_helper snd_seq_midi_event snd_rawmidi cec rc_core snd_seq
> crct10dif_pclmul ghash_clmulni_intel drm_kms_helper sha512_ssse3
> aesni_intel snd_seq_device i2c_algo_bit crypto_simd snd_timer
> snd_rn_pci_acp3x syscopyarea cryptd sysfillrect snd_acp_config
> snd_soc_acpi joydev input_leds rapl wmi_bmof sysimgblt snd snd_pci_acp3x
> ccp k10temp soundcore mac_hid amd_pmc sch_fq_codel msr parport_pc ppdev
> lp drm parport ramoops reed_solomon pstore_blk pstore_zone efi_pstore
> ip_tables x_tables autofs4 uas usb_storage hid_generic nvme usbhid hid
> crc32_pclmul i2c_piix4 r8169 nvme_core ahci xhci_pci libahci realtek
> xhci_pci_renesas video wmi gpio_amdpt
> [  739.564703]  gpio_generic
> [  739.564707] CPU: 15 PID: 1072 Comm: gnome-shell Not tainted 6.3.0-rc4+=
 #5
> [  739.564713] Hardware name: AMD Artic/Artic-RN, BIOS WAF2309N 03/07/202=
2
> [  739.564716] RIP:
> 0010:drm_crtc_vblank_helper_get_vblank_timestamp_internal+0x375/0x3d0 [dr=
m]
> [  739.564779] Code: 4c 8b 67 50 4d 85 e4 75 03 4c 8b 27 e8 44 23 d9 d3
> 48 c7 c1 58 7a 62 c0 4c 89 e2 48 c7 c7 74 a4 62 c0 48 89 c6 e8 cb 12 4c
> d3 <0f> 0b eb 85 4c 8b 65 98 44 8b 5d 94 41 89 c5 4d 85 e4 74 05 4d 8b
> [  739.564782] RSP: 0018:ffffbde6c172faf0 EFLAGS: 00010282
> [  739.564787] RAX: 0000000000000000 RBX: ffffffffc0e89370 RCX:
> 0000000000000000
> [  739.564790] RDX: 0000000000000002 RSI: ffffffff950ca531 RDI:
> 00000000ffffffff
> [  739.564793] RBP: ffffbde6c172fb60 R08: 0000000000000000 R09:
> 00000000ffffdfff
> [  739.564795] R10: ffffbde6c172f958 R11: ffffffff95556ec8 R12:
> ffff9d4881cd0820
> [  739.564798] R13: 0000000000000000 R14: 0000000000000000 R15:
> ffff9d4886b9b8a8
> [  739.564800] FS:  00007fac3d72c5c0(0000) GS:ffff9d4da5fc0000(0000)
> knlGS:0000000000000000
> [  739.564804] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  739.564807] CR2: 000055e4351b4a38 CR3: 0000000122ad8000 CR4:
> 0000000000350ee0
> [  739.564810] Call Trace:
> [  739.564813]  <TASK>
> [  739.564817]  ? dma_resv_get_singleton+0xb7/0x130
> [  739.564828] drm_crtc_vblank_helper_get_vblank_timestamp+0x20/0x30 [drm=
]
> [  739.564889]  drm_crtc_get_last_vbltimestamp+0x59/0x90 [drm]
> [  739.564950]  drm_crtc_next_vblank_start+0x44/0x80 [drm]
> [  739.565010]  drm_atomic_helper_wait_for_fences+0x87/0x1e0
> [drm_kms_helper]
> [  739.565045]  drm_atomic_helper_commit+0xa1/0x160 [drm_kms_helper]
> [  739.565076]  drm_atomic_commit+0x9d/0xd0 [drm]
> [  739.565172]  ? __pfx___drm_printfn_info+0x10/0x10 [drm]
> [  739.565240]  drm_mode_atomic_ioctl+0xa0b/0xba0 [drm]
> [  739.565306]  ? __pfx_drm_mode_atomic_ioctl+0x10/0x10 [drm]
> [  739.565381]  drm_ioctl_kernel+0xbf/0x150 [drm]
> [  739.565474]  drm_ioctl+0x29e/0x500 [drm]
> [  739.565539]  ? __pfx_drm_mode_atomic_ioctl+0x10/0x10 [drm]
> [  739.565606]  ? _raw_spin_unlock_irqrestore+0x2b/0x50
> [  739.565614]  amdgpu_drm_ioctl+0x52/0x90 [amdgpu]
> [  739.566064]  __x64_sys_ioctl+0x99/0xd0
> [  739.566073]  do_syscall_64+0x3f/0x90
> [  739.566079]  entry_SYSCALL_64_after_hwframe+0x72/0xdc
> [  739.566086] RIP: 0033:0x7fac40b1aaff
> [  739.566091] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10
> 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f
> 05 <41> 89 c0 3d 00 f0 ff ff 77 1f 48 8b 44 24 18 64 48 2b 04 25 28 00
> [  739.566094] RSP: 002b:00007ffc71f5c250 EFLAGS: 00000246 ORIG_RAX:
> 0000000000000010
> [  739.566099] RAX: ffffffffffffffda RBX: 00007ffc71f5c2f0 RCX:
> 00007fac40b1aaff
> [  739.566102] RDX: 00007ffc71f5c2f0 RSI: 00000000c03864bc RDI:
> 0000000000000009
> [  739.566104] RBP: 00000000c03864bc R08: 0000000000000010 R09:
> 0000000000000010
> [  739.566107] R10: 0000000000000007 R11: 0000000000000246 R12:
> 000055e43609c5d0
> [  739.566110] R13: 0000000000000009 R14: 000055e43488cac0 R15:
> 000055e435f14ee0
> [  739.566116]  </TASK>
> [  739.566118] ---[ end trace 0000000000000000 ]---
>
> >
> > Regards
> >
> > Shashank
> >
> > On 21/08/2023 13:03, Christian K=C3=B6nig wrote:
> >> Am 20.08.23 um 11:51 schrieb Christophe JAILLET:
> >>> This serie simplifies amdgpu_bo_list_create() and usage of the 'struc=
t
> >>> amdgpu_bo_list'.
> >>
> >> Oh, yes please. That's something I always wanted to cleanup as well.
> >>
> >>> It is compile tested only.
> >>
> >> That bothers me a bit. Arun, Vitaly, Shashank can anybody with time
> >> run a quick test on this? Preferable the IGT tests, but this just
> >> some game should probably do as well.
> >>
> >> Apart from that looks good to me,
> >> Christian.
> >>
> >>>
> >>> Christophe JAILLET (4):
> >>>    drm/amdgpu: Explicitly add a flexible array at the end of 'struct
> >>>      amdgpu_bo_list'
> >>>    drm/amdgpu: Remove a redundant sanity check
> >>>    drm/amdgpu: Remove amdgpu_bo_list_array_entry()
> >>>    drm/amdgpu: Use kvzalloc() to simplify code
> >>>
> >>>   drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c | 15 ++-------------
> >>>   drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h | 18 ++++++------------
> >>>   2 files changed, 8 insertions(+), 25 deletions(-)
> >>>
> >>
