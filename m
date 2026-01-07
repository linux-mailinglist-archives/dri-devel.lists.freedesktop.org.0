Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 805A6CFFCDF
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 20:42:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBE7810E200;
	Wed,  7 Jan 2026 19:42:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GEG+81G2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com
 [74.125.224.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 619D210E2D0
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 19:42:08 +0000 (UTC)
Received: by mail-yx1-f52.google.com with SMTP id
 956f58d0204a3-64669a2ecb5so1537730d50.1
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jan 2026 11:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767814927; x=1768419727; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=l3CmMBINc9iPjQgxKIlkeId47+fF9G8T5dbAjnuxxnk=;
 b=GEG+81G2ITntQ4W2synV4bY14yw+hBadC58cwYzYzwPx0WLW8ngXxtMuG4Eem6R6Y3
 OSp/dzuQRxLJx391H3CsOgWh8ARCNuW8SmqWzfeYPCOMlkuILrthRUpqf+TAFQMndsqU
 TAYANTX0Y7TRrtIXJnbKjoIls+XRpOpiXnecIRi3Z7Gr4KUDv4hQ3KnB4i/ofzvDcTjh
 KsNum5hW6ed0lH6yUXuJwJa2Jem+ilX9LMAg5S9up9jYYoOAEVzyJ0m7AZqbdKgvYwEr
 HKsWBaDmS1+S8A7OBH4oVPk7omF+thpNSR/oXTbiSZnOiYnZ2L4dMWi+35NKt9flteaa
 38kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767814927; x=1768419727;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l3CmMBINc9iPjQgxKIlkeId47+fF9G8T5dbAjnuxxnk=;
 b=otgb/aJ08ff3Wl//U7ute3YGxpSDGrDG+E2Q9ukezcRmJnrA/8gOBEQSelFSHY03zS
 jdg3L2RrFJnej/HgsgIYe5TZl8e45iDmWuuFJ3U6cL0OuZwM1WpwL2wQrA8yAxuzjXU4
 TYih7G3bVjJEtNGkFdKM6hOFZRERao/M8cHBr8o3FeFGr4Upk0lMQ8kJrfzRxJIFWtZE
 eEcI0tO2pUdup4S6d+CQOjwny28jIra4LVpY5gHe3Z3699koKsHf7VJ8lOEl93TFOMQL
 S91Ea9ZR4SlKeyvkkygSF1NYFlFiQ2EzR1UqaFFf4wlUI4pzjUSWVIpe4yXZXs07Peb+
 i0gQ==
X-Gm-Message-State: AOJu0YwojZmit8v0TlQ9kCde1gwgPHuv9YVXAQJSaZclQ5uAOxY4/qYk
 qvLO4lMOlhbirNAPvhvx2YwNWeUtDECTNfrhWGpdjlMNurCOqEzyVpwdY7K1Q+P8rsczqif/CRL
 tvZevfrmr8geYPIyDWz/1v+lEIn138A/odSOwT3o=
X-Gm-Gg: AY/fxX6+w++XFLgV+AtdJUh0Pf8Icz4+Z0NWF6eym9ybnsPLwIHWgU72H4RYeArz0/W
 sy/dKvXEVWNzJ5cI7tpQI/dL5I+gBVk5yjdcYeA8Gpa48n++tkaK6T2eFT+ILgUOQKi8mum8v11
 +cF8ZCwxH/sb4isHnJ9d0IL3EWJVKToGAivdjwbP0CIV/DXsoIn0ja8DgOIZsJWugISHMqwLrJu
 jaNsMfJkq74E2XW33jJnAfDZnL3xxpRVZ1xg+A1Jcl1eiyXDqPwDw16LauFxdHENnOi6WFqx2nw
 bD/6t4IPsSD+4pAzQZd3LfaXwLE9QPANPIfGQ7FH6XLwbT+l9zPDgid4bKIM4YOEyCONGGRDpyc
 tLOdLS5uExKdCMdtQKJ619U3dREs2iNLj0eVLFb1HZ09oL2vqHsRpMOASDPUu5ry4O2hyI4Y=
X-Google-Smtp-Source: AGHT+IExB865aqlHwxt6u5aR1krJ5Zuk4EVFGq33E3WOcRTkJZdr/LDaiF7RA7cubk89zWdWdT6266fT7regytU423o=
X-Received: by 2002:a05:690e:b85:b0:641:f5bc:692e with SMTP id
 956f58d0204a3-6470d2f4d8emr5136548d50.39.1767814926765; Wed, 07 Jan 2026
 11:42:06 -0800 (PST)
MIME-Version: 1.0
References: <CAFrh3J_OtTdve_ryOXZLfBV9sWDZ--HyTJZi9mSQ6gko98PJrA@mail.gmail.com>
 <f2dc09294c3af2e9d97e72e10f8f3674368a8b36@intel.com>
In-Reply-To: <f2dc09294c3af2e9d97e72e10f8f3674368a8b36@intel.com>
From: Satadru Pramanik <satadru@gmail.com>
Date: Wed, 7 Jan 2026 14:41:55 -0500
X-Gm-Features: AQt7F2oZTjuIB2So7Al0wjNKvkQq0ppKvVG2wzvyZQB3jcLtq8L8UouwTBTK7CE
Message-ID: <CAFrh3J9UaXpUk=JyxfyE7QBv9T8-scP8Wod9F=Hho1BoTSTifA@mail.gmail.com>
Subject: Re: 6.19.0-rc4 regression from 6.19.0-rc3 in i915: [drm] PCH PWM1
 enabled
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>
Content-Type: multipart/alternative; boundary="000000000000bd13060647d17c6a"
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

--000000000000bd13060647d17c6a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you. It just occurred to me that I did file a bug at
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13803 for this
issue with kernel 6.14, and then the issue went away. With 6.18.1 I don't
see this warning.

But it has returned, and thus I have added a subsequent comment at
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13803#note_3261088

Regards,

Satadru


On Wed, Jan 7, 2026 at 5:33=E2=80=AFAM Jani Nikula <jani.nikula@linux.intel=
.com>
wrote:

> On Tue, 06 Jan 2026, Satadru Pramanik <satadru@gmail.com> wrote:
> > Hello all, I'm newly getting this in my dmesg on my MacBookPro11,3 afte=
r
> > updating from 6.19.0-rc3 to 6.19.0-rc4 on Ubuntu 25.10. I'm using the
> > nouveau driver for my display, but this warning appears to be from i915=
,
> > which my laptop also may be using for some portion of display enablemen=
t.
>
> AFAICS there were no related changes in the drm subsystem between -rc3
> and -rc4. I suspect something else changed. If you think otherwise,
> please bisect.
>
> > [  200.760128] ------------[ cut here ]------------
> > [  200.760132] i915 0000:00:02.0: [drm] PCH PWM1 enabled
> > [  200.760134] WARNING:
> > drivers/gpu/drm/i915/display/intel_display_power.c:1234 at
> > hsw_enable_pc8+0x8a4/0xb10 [i915], CPU#0: kworker/u32:6/1378
> > [  200.760351] Modules linked in: snd_seq_dummy snd_hrtimer
> > scsi_transport_iscsi qrtr ccm algif_aead des3_ede_x86_64 des_generic
> libdes
> > md4 rfcomm cmac algif_hash algif_skcipher af_alg bnep blocklayoutdriver
> > nfsv4 nfs lockd grace nfs_localio netfs sunrpc binfmt_misc nls_iso8859_=
1
> > cmdlinepart spi_nor mtd snd_hda_codec_intelhdmi intel_rapl_msr zfs(POE)
> > intel_rapl_common x86_pkg_temp_thermal intel_powerclamp nouveau
> input_leds
> > i915 spl(OE) snd_hda_codec_cs420x snd_hda_codec_generic
> > snd_hda_codec_nvhdmi snd_hda_codec_hdmi hid_apple drm_ttm_helper corete=
mp
> > facetimehd(OE) snd_hda_intel gpu_sched btusb videobuf2_dma_sg
> > snd_intel_dspcfg drm_gpuvm videobuf2_memops btrtl snd_intel_sdw_acpi
> > videobuf2_v4l2 snd_seq_midi snd_hda_codec btintel snd_seq_midi_event
> > drm_exec drm_buddy iTCO_wdt videodev kvm_intel btbcm mxm_wmi i2c_algo_b=
it
> > btmtk snd_hwdep intel_pmc_bxt snd_rawmidi spi_intel_platform wl(POE)
> joydev
> > hid_generic videobuf2_common kvm spi_intel snd_hda_core
> iTCO_vendor_support
> > applesmc ghash_clmulni_intel nvme ttm rapl bluetooth
> > [  200.760418]  snd_seq intel_cstate uas usbhid drm_display_helper
> snd_pcm
> > nvme_core cfg80211 cec efi_pstore rc_core hid mc bcm5974 sbs thunderbol=
t
> > apple_mfi_fastcharge drm_client_lib i2c_i801 drm_kms_helper i2c_mux
> > usb_storage i2c_smbus lpc_ich sbshc snd_timer apple_gmux snd_seq_device
> > acpi_als industrialio_triggered_buffer mei_me kfifo_buf drm snd
> > industrialio mei soundcore video wmi mac_hid dm_mirror dm_region_hash
> > dm_log tcp_bbr sch_fq_codel pkcs8_key_parser msr parport_pc ppdev lp
> > parport nfnetlink dmi_sysfs autofs4 aesni_intel
> > [  200.760461] CPU: 0 UID: 0 PID: 1378 Comm: kworker/u32:6 Tainted: P
>  U
> >  W  OE       6.19.0-rc4 #1 PREEMPT(lazy)
> > [  200.760466] Tainted: [P]=3DPROPRIETARY_MODULE, [U]=3DUSER, [W]=3DWAR=
N,
> > [O]=3DOOT_MODULE, [E]=3DUNSIGNED_MODULE
>
> Basically all bets are off with the proprietary modules. Can you
> reproduce without?
>
> > [  200.760468] Hardware name: Apple Inc.
> > MacBookPro11,3/Mac-2BD1B31983FE1663, BIOS 432.60.3.0.0 10/27/2021
> > [  200.760470] Workqueue: pm pm_runtime_work
> > [  200.760478] Sched_ext: lavd_1.0.20_g3c8138b8_x86_64_unknown_linux_gn=
u
> > (enabled+all), task: runnable_at=3D+0ms
> > [  200.760480] RIP: 0010:hsw_enable_pc8+0x8aa/0xb10 [i915]
> > [  200.760653] Code: 32 12 00 48 85 ff 74 04 48 8b 7f 08 4c 8b 67 50 4d
> 85
> > e4 75 03 4c 8b 27 e8 e3 73 a7 e4 48 8d 3d dc 03 30 00 4c 89 e2 48 89 c6
> > <67> 48 0f b9 3a e9 df f9 ff ff 48 8b 3b 80 bb 4b 14 00 00 00 0f 84
> > [  200.760655] RSP: 0018:ffffaf668250fc68 EFLAGS: 00010282
> > [  200.760658] RAX: ffffffffc1d688a4 RBX: ffff920740f62000 RCX:
> > ffffffffc180f0d0
> > [  200.760660] RDX: ffff920742008030 RSI: ffffffffc1d688a4 RDI:
> > ffffffffc1c038d0
> > [  200.760661] RBP: ffffaf668250fc90 R08: 0000000000000002 R09:
> > 0000000000000064
> > [  200.760663] R10: 0000000000000000 R11: 0000000000000001 R12:
> > ffff920742008030
> > [  200.760664] R13: ffff920740ed4000 R14: 0000000000000000 R15:
> > ffff920740ed4000
> > [  200.760666] FS:  0000000000000000(0000) GS:ffff920b06bfd000(0000)
> > knlGS:0000000000000000
> > [  200.760668] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [  200.760669] CR2: 00007f72423b701c CR3: 00000001777eb004 CR4:
> > 00000000001726f0
> > [  200.760671] Call Trace:
> > [  200.760673]  <TASK>
> > [  200.760678]  intel_display_power_suspend+0x61/0x80 [i915]
> > [  200.760852]  intel_runtime_suspend+0xd7/0x230 [i915]
> > [  200.760963]  ? __pfx_pci_pm_runtime_suspend+0x10/0x10
> > [  200.760970]  pci_pm_runtime_suspend+0x6a/0x1a0
> > [  200.760974]  __rpm_callback+0x4b/0x1f0
> > [  200.760979]  ? __pfx_pci_pm_runtime_suspend+0x10/0x10
> > [  200.760983]  rpm_callback+0x6f/0x80
> > [  200.760986]  rpm_suspend+0xe1/0x5e0
> > [  200.760990]  ? __schedule+0x44b/0x1650
> > [  200.760996]  pm_runtime_work+0x91/0xa0
> > [  200.761000]  process_one_work+0x188/0x360
> > [  200.761005]  worker_thread+0x327/0x460
> > [  200.761007]  ? __pfx_worker_thread+0x10/0x10
> > [  200.761010]  kthread+0x10b/0x220
> > [  200.761015]  ? __pfx_kthread+0x10/0x10
> > [  200.761018]  ret_from_fork+0x16e/0x1e0
> > [  200.761023]  ? __pfx_kthread+0x10/0x10
> > [  200.761027]  ret_from_fork_asm+0x1a/0x30
> > [  200.761034]  </TASK>
> > [  200.761035] ---[ end trace 0000000000000000 ]---
> >
> >
> > inxi -IG gives me this:
> > Graphics:
> >   Device-1: Intel Crystal Well Integrated Graphics driver: i915 v: kern=
el
> >   Device-2: NVIDIA GK107M [GeForce GT 750M Mac Edition] driver: nouveau
> >     v: kernel
> >   Display: wayland server: X.Org v: 24.1.8 with: Xwayland v: 24.1.8
> >     compositor: gnome-shell v: 49.0 driver: X: loaded: modesetting
> >     unloaded: fbdev,vesa dri: nouveau gpu: nouveau resolution:
> > 3840x2400~60Hz
> >   API: EGL v: 1.5 drivers: crocus,nouveau,swrast
> >     platforms: gbm,wayland,x11,surfaceless,device
> >   API: OpenGL v: 4.6 compat-v: 4.3 vendor: mesa
> >     v: 25.3.2+git2512181741.a943c55aea0~q~mesarc2 renderer: NVE7
> >   API: Vulkan v: 1.4.321 drivers: nvk,intel,llvmpipe
> >     surfaces: xcb,xlib,wayland
> >   Info: Tools: api: eglinfo, glxinfo, vulkaninfo x11: xdriinfo, xdpyinf=
o,
> >     xprop, xrandr
> > Info:
> >   Memory: total: 16 GiB available: 15.53 GiB used: 4.85 GiB (31.2%)
> >   Processes: 468 Uptime: 17m Shell: Bash inxi: 3.3.39
> >
> > Please let me know if I'm sending this to the wrong list?
>
> In general, please report i915 issues as described at [1].
>
> BR,
> Jani.
>
>
> [1]
> https://drm.pages.freedesktop.org/intel-docs/how-to-file-i915-bugs.html
>
>
> --
> Jani Nikula, Intel
>

--000000000000bd13060647d17c6a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br></div><div>Thank you. It just occurred to me that=
 I did file a bug at=C2=A0<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/13803" target=3D"_blank">https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/13803</a> for this issue with kernel 6.14, and then=
 the issue went away. With 6.18.1 I don&#39;t see this warning.</div><div><=
br></div><div>But it has returned, and thus I have added a subsequent comme=
nt at=C2=A0<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/13803#note_3261088">https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/13803#note_3261088</a></div><div><br></div><div>Regards,</div><div><br>=
</div><div>Satadru</div><div><br></div></div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan 7, 2026 at 5:33=E2=80=AF=
AM Jani Nikula &lt;<a href=3D"mailto:jani.nikula@linux.intel.com" target=3D=
"_blank">jani.nikula@linux.intel.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">On Tue, 06 Jan 2026, Satadru Pramanik &=
lt;<a href=3D"mailto:satadru@gmail.com" target=3D"_blank">satadru@gmail.com=
</a>&gt; wrote:<br>
&gt; Hello all, I&#39;m newly getting this in my dmesg on my MacBookPro11,3=
 after<br>
&gt; updating from 6.19.0-rc3 to 6.19.0-rc4 on Ubuntu 25.10. I&#39;m using =
the<br>
&gt; nouveau driver for my display, but this warning appears to be from i91=
5,<br>
&gt; which my laptop also may be using for some portion of display enableme=
nt.<br>
<br>
AFAICS there were no related changes in the drm subsystem between -rc3<br>
and -rc4. I suspect something else changed. If you think otherwise,<br>
please bisect.<br>
<br>
&gt; [=C2=A0 200.760128] ------------[ cut here ]------------<br>
&gt; [=C2=A0 200.760132] i915 0000:00:02.0: [drm] PCH PWM1 enabled<br>
&gt; [=C2=A0 200.760134] WARNING:<br>
&gt; drivers/gpu/drm/i915/display/intel_display_power.c:1234 at<br>
&gt; hsw_enable_pc8+0x8a4/0xb10 [i915], CPU#0: kworker/u32:6/1378<br>
&gt; [=C2=A0 200.760351] Modules linked in: snd_seq_dummy snd_hrtimer<br>
&gt; scsi_transport_iscsi qrtr ccm algif_aead des3_ede_x86_64 des_generic l=
ibdes<br>
&gt; md4 rfcomm cmac algif_hash algif_skcipher af_alg bnep blocklayoutdrive=
r<br>
&gt; nfsv4 nfs lockd grace nfs_localio netfs sunrpc binfmt_misc nls_iso8859=
_1<br>
&gt; cmdlinepart spi_nor mtd snd_hda_codec_intelhdmi intel_rapl_msr zfs(POE=
)<br>
&gt; intel_rapl_common x86_pkg_temp_thermal intel_powerclamp nouveau input_=
leds<br>
&gt; i915 spl(OE) snd_hda_codec_cs420x snd_hda_codec_generic<br>
&gt; snd_hda_codec_nvhdmi snd_hda_codec_hdmi hid_apple drm_ttm_helper coret=
emp<br>
&gt; facetimehd(OE) snd_hda_intel gpu_sched btusb videobuf2_dma_sg<br>
&gt; snd_intel_dspcfg drm_gpuvm videobuf2_memops btrtl snd_intel_sdw_acpi<b=
r>
&gt; videobuf2_v4l2 snd_seq_midi snd_hda_codec btintel snd_seq_midi_event<b=
r>
&gt; drm_exec drm_buddy iTCO_wdt videodev kvm_intel btbcm mxm_wmi i2c_algo_=
bit<br>
&gt; btmtk snd_hwdep intel_pmc_bxt snd_rawmidi spi_intel_platform wl(POE) j=
oydev<br>
&gt; hid_generic videobuf2_common kvm spi_intel snd_hda_core iTCO_vendor_su=
pport<br>
&gt; applesmc ghash_clmulni_intel nvme ttm rapl bluetooth<br>
&gt; [=C2=A0 200.760418]=C2=A0 snd_seq intel_cstate uas usbhid drm_display_=
helper snd_pcm<br>
&gt; nvme_core cfg80211 cec efi_pstore rc_core hid mc bcm5974 sbs thunderbo=
lt<br>
&gt; apple_mfi_fastcharge drm_client_lib i2c_i801 drm_kms_helper i2c_mux<br=
>
&gt; usb_storage i2c_smbus lpc_ich sbshc snd_timer apple_gmux snd_seq_devic=
e<br>
&gt; acpi_als industrialio_triggered_buffer mei_me kfifo_buf drm snd<br>
&gt; industrialio mei soundcore video wmi mac_hid dm_mirror dm_region_hash<=
br>
&gt; dm_log tcp_bbr sch_fq_codel pkcs8_key_parser msr parport_pc ppdev lp<b=
r>
&gt; parport nfnetlink dmi_sysfs autofs4 aesni_intel<br>
&gt; [=C2=A0 200.760461] CPU: 0 UID: 0 PID: 1378 Comm: kworker/u32:6 Tainte=
d: P=C2=A0 =C2=A0 =C2=A0U<br>
&gt;=C2=A0 W=C2=A0 OE=C2=A0 =C2=A0 =C2=A0 =C2=A06.19.0-rc4 #1 PREEMPT(lazy)=
<br>
&gt; [=C2=A0 200.760466] Tainted: [P]=3DPROPRIETARY_MODULE, [U]=3DUSER, [W]=
=3DWARN,<br>
&gt; [O]=3DOOT_MODULE, [E]=3DUNSIGNED_MODULE<br>
<br>
Basically all bets are off with the proprietary modules. Can you<br>
reproduce without?<br>
<br>
&gt; [=C2=A0 200.760468] Hardware name: Apple Inc.<br>
&gt; MacBookPro11,3/Mac-2BD1B31983FE1663, BIOS 432.60.3.0.0 10/27/2021<br>
&gt; [=C2=A0 200.760470] Workqueue: pm pm_runtime_work<br>
&gt; [=C2=A0 200.760478] Sched_ext: lavd_1.0.20_g3c8138b8_x86_64_unknown_li=
nux_gnu<br>
&gt; (enabled+all), task: runnable_at=3D+0ms<br>
&gt; [=C2=A0 200.760480] RIP: 0010:hsw_enable_pc8+0x8aa/0xb10 [i915]<br>
&gt; [=C2=A0 200.760653] Code: 32 12 00 48 85 ff 74 04 48 8b 7f 08 4c 8b 67=
 50 4d 85<br>
&gt; e4 75 03 4c 8b 27 e8 e3 73 a7 e4 48 8d 3d dc 03 30 00 4c 89 e2 48 89 c=
6<br>
&gt; &lt;67&gt; 48 0f b9 3a e9 df f9 ff ff 48 8b 3b 80 bb 4b 14 00 00 00 0f=
 84<br>
&gt; [=C2=A0 200.760655] RSP: 0018:ffffaf668250fc68 EFLAGS: 00010282<br>
&gt; [=C2=A0 200.760658] RAX: ffffffffc1d688a4 RBX: ffff920740f62000 RCX:<b=
r>
&gt; ffffffffc180f0d0<br>
&gt; [=C2=A0 200.760660] RDX: ffff920742008030 RSI: ffffffffc1d688a4 RDI:<b=
r>
&gt; ffffffffc1c038d0<br>
&gt; [=C2=A0 200.760661] RBP: ffffaf668250fc90 R08: 0000000000000002 R09:<b=
r>
&gt; 0000000000000064<br>
&gt; [=C2=A0 200.760663] R10: 0000000000000000 R11: 0000000000000001 R12:<b=
r>
&gt; ffff920742008030<br>
&gt; [=C2=A0 200.760664] R13: ffff920740ed4000 R14: 0000000000000000 R15:<b=
r>
&gt; ffff920740ed4000<br>
&gt; [=C2=A0 200.760666] FS:=C2=A0 0000000000000000(0000) GS:ffff920b06bfd0=
00(0000)<br>
&gt; knlGS:0000000000000000<br>
&gt; [=C2=A0 200.760668] CS:=C2=A0 0010 DS: 0000 ES: 0000 CR0: 000000008005=
0033<br>
&gt; [=C2=A0 200.760669] CR2: 00007f72423b701c CR3: 00000001777eb004 CR4:<b=
r>
&gt; 00000000001726f0<br>
&gt; [=C2=A0 200.760671] Call Trace:<br>
&gt; [=C2=A0 200.760673]=C2=A0 &lt;TASK&gt;<br>
&gt; [=C2=A0 200.760678]=C2=A0 intel_display_power_suspend+0x61/0x80 [i915]=
<br>
&gt; [=C2=A0 200.760852]=C2=A0 intel_runtime_suspend+0xd7/0x230 [i915]<br>
&gt; [=C2=A0 200.760963]=C2=A0 ? __pfx_pci_pm_runtime_suspend+0x10/0x10<br>
&gt; [=C2=A0 200.760970]=C2=A0 pci_pm_runtime_suspend+0x6a/0x1a0<br>
&gt; [=C2=A0 200.760974]=C2=A0 __rpm_callback+0x4b/0x1f0<br>
&gt; [=C2=A0 200.760979]=C2=A0 ? __pfx_pci_pm_runtime_suspend+0x10/0x10<br>
&gt; [=C2=A0 200.760983]=C2=A0 rpm_callback+0x6f/0x80<br>
&gt; [=C2=A0 200.760986]=C2=A0 rpm_suspend+0xe1/0x5e0<br>
&gt; [=C2=A0 200.760990]=C2=A0 ? __schedule+0x44b/0x1650<br>
&gt; [=C2=A0 200.760996]=C2=A0 pm_runtime_work+0x91/0xa0<br>
&gt; [=C2=A0 200.761000]=C2=A0 process_one_work+0x188/0x360<br>
&gt; [=C2=A0 200.761005]=C2=A0 worker_thread+0x327/0x460<br>
&gt; [=C2=A0 200.761007]=C2=A0 ? __pfx_worker_thread+0x10/0x10<br>
&gt; [=C2=A0 200.761010]=C2=A0 kthread+0x10b/0x220<br>
&gt; [=C2=A0 200.761015]=C2=A0 ? __pfx_kthread+0x10/0x10<br>
&gt; [=C2=A0 200.761018]=C2=A0 ret_from_fork+0x16e/0x1e0<br>
&gt; [=C2=A0 200.761023]=C2=A0 ? __pfx_kthread+0x10/0x10<br>
&gt; [=C2=A0 200.761027]=C2=A0 ret_from_fork_asm+0x1a/0x30<br>
&gt; [=C2=A0 200.761034]=C2=A0 &lt;/TASK&gt;<br>
&gt; [=C2=A0 200.761035] ---[ end trace 0000000000000000 ]---<br>
&gt;<br>
&gt;<br>
&gt; inxi -IG gives me this:<br>
&gt; Graphics:<br>
&gt;=C2=A0 =C2=A0Device-1: Intel Crystal Well Integrated Graphics driver: i=
915 v: kernel<br>
&gt;=C2=A0 =C2=A0Device-2: NVIDIA GK107M [GeForce GT 750M Mac Edition] driv=
er: nouveau<br>
&gt;=C2=A0 =C2=A0 =C2=A0v: kernel<br>
&gt;=C2=A0 =C2=A0Display: wayland server: X.Org v: 24.1.8 with: Xwayland v:=
 24.1.8<br>
&gt;=C2=A0 =C2=A0 =C2=A0compositor: gnome-shell v: 49.0 driver: X: loaded: =
modesetting<br>
&gt;=C2=A0 =C2=A0 =C2=A0unloaded: fbdev,vesa dri: nouveau gpu: nouveau reso=
lution:<br>
&gt; 3840x2400~60Hz<br>
&gt;=C2=A0 =C2=A0API: EGL v: 1.5 drivers: crocus,nouveau,swrast<br>
&gt;=C2=A0 =C2=A0 =C2=A0platforms: gbm,wayland,x11,surfaceless,device<br>
&gt;=C2=A0 =C2=A0API: OpenGL v: 4.6 compat-v: 4.3 vendor: mesa<br>
&gt;=C2=A0 =C2=A0 =C2=A0v: 25.3.2+git2512181741.a943c55aea0~q~mesarc2 rende=
rer: NVE7<br>
&gt;=C2=A0 =C2=A0API: Vulkan v: 1.4.321 drivers: nvk,intel,llvmpipe<br>
&gt;=C2=A0 =C2=A0 =C2=A0surfaces: xcb,xlib,wayland<br>
&gt;=C2=A0 =C2=A0Info: Tools: api: eglinfo, glxinfo, vulkaninfo x11: xdriin=
fo, xdpyinfo,<br>
&gt;=C2=A0 =C2=A0 =C2=A0xprop, xrandr<br>
&gt; Info:<br>
&gt;=C2=A0 =C2=A0Memory: total: 16 GiB available: 15.53 GiB used: 4.85 GiB =
(31.2%)<br>
&gt;=C2=A0 =C2=A0Processes: 468 Uptime: 17m Shell: Bash inxi: 3.3.39<br>
&gt;<br>
&gt; Please let me know if I&#39;m sending this to the wrong list?<br>
<br>
In general, please report i915 issues as described at [1].<br>
<br>
BR,<br>
Jani.<br>
<br>
<br>
[1] <a href=3D"https://drm.pages.freedesktop.org/intel-docs/how-to-file-i91=
5-bugs.html" rel=3D"noreferrer" target=3D"_blank">https://drm.pages.freedes=
ktop.org/intel-docs/how-to-file-i915-bugs.html</a><br>
<br>
<br>
-- <br>
Jani Nikula, Intel<br>
</blockquote></div>

--000000000000bd13060647d17c6a--
