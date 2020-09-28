Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D3627A82C
	for <lists+dri-devel@lfdr.de>; Mon, 28 Sep 2020 09:07:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA6116E3D0;
	Mon, 28 Sep 2020 07:06:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD1016E084;
 Mon, 28 Sep 2020 04:54:42 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id z26so10252418oih.12;
 Sun, 27 Sep 2020 21:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=zBQfoV2KczaLF/np9UnNTPVIq5S9FrhPz7MqxIsQ7cA=;
 b=AtgQNxEFowexaGYVxU1pq4BqpzFDpT/fSCZ0vOPk3unI6qkON6+N1p5GfjTKc5rtds
 K+cT1+C5m90vsRJ4g6RBqEXi0XZN1VxDpN7xO4vaokUM74XXF8D0J40NUrBQsFZI/Uzg
 Aa74nKycLxpfauSkJxuxVjY0Ozk4KIQYBwg+o03GL+TT+/s8Ffb/8bhnIKUk/62A/6yp
 6p5phJ+fJcn3M046+Ubru0YikCMeAmGNLEFlEmZLdwgcm/0nK94OwDSzbuPALp6Lmm/w
 ZP7fWU6AWOSstfpcjm9YK6kUJjS4VqT2tfU/SA4y/cEYQhHkAZ446MY1d7RfV6QEmnAM
 ejjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=zBQfoV2KczaLF/np9UnNTPVIq5S9FrhPz7MqxIsQ7cA=;
 b=C1IPc3kYU45fIITYlRdltpCUF8aS5KY32eYpnovDbB5qQgV2XkXXoyxbFoGky/Q4pj
 8SNRMWW2FR5lELnaefmzbRgs66rDAgFV/E6B7tnT42+S3QPV8SyZJtrd4PYN3sxrf8yW
 6DDNp8DL9ec0sHZ6Aa6UA87gCsRxrEC4NYcg72Ay5QFeaAgSwVZkcq5ab4lzqNCYo8Ur
 p238we5Z1Hipnkeu9tD0xUiVz+4+l2YeJ80UYmQqIFrENvql256rZcARkUN7trq22SVy
 /8G2zAYSJD4aSfrbZ73ftstmBMl4NABRUYnPh6jbOfii8n5BOR2Xl8vBHXddwAXpXC8i
 /Y7g==
X-Gm-Message-State: AOAM531+tZ9jyjdNALdxEqvuisEtFMRgL04SmgNZtyAmt9A3uEH+1P6f
 959JzJvik4bBgNErX5bp3je9n5hcigdN1f+FJLU=
X-Google-Smtp-Source: ABdhPJzujeU1dIUd3UMJ9hrjw4Co0k9IW+9THC7E7XCRtIQW0JgBY+mKZDs2Oh1yGsrovMg+cq/6FXTkE/KoS49Dgo8=
X-Received: by 2002:aca:4710:: with SMTP id u16mr4766570oia.25.1601268881982; 
 Sun, 27 Sep 2020 21:54:41 -0700 (PDT)
MIME-Version: 1.0
From: Tony Fischetti <tony.fischetti@gmail.com>
Date: Mon, 28 Sep 2020 00:54:31 -0400
Message-ID: <CAOMV6SXOMu1wVPeWR9=d7e7A7qy4ZupBVGB_1B2HneVA-WEizQ@mail.gmail.com>
Subject: REGRESSION: [i915] kernel NULL pointer dereference
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com, 
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch, 
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailman-Approved-At: Mon, 28 Sep 2020 07:06:24 +0000
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
Content-Type: multipart/mixed; boundary="===============2079114642=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============2079114642==
Content-Type: multipart/alternative; boundary="000000000000e689cb05b0587602"

--000000000000e689cb05b0587602
Content-Type: text/plain; charset="UTF-8"

I just tested the v5.9-rc7 release on two of my machines and on one of the
machines, I got a bug/oops that prevents the video driver from working
properly.

This regression must have occurred somewhere between v5.9-rc8 and v5.9-rc9.
I'm attempting to git bisect it, but I wanted to bring it to your attention
since I'm unfamiliar with this subsystem and it's unlikely that I'll be
able to fix it/offer a patch myself.

Below are the relevant journal log entries. Please let me know if there's
any more information I can provide.


BUG: kernel NULL pointer dereference, address: 0000000000000054
#PF: supervisor write access in kernel mode
#PF: error_code(0x0002) - not-present page
PGD 0 P4D 0
Oops: 0002 [#1] PREEMPT SMP NOPTI
CPU: 1 PID: 480 Comm: kworker/u25:0 Not tainted 5.9.0-rc7-alice-glass+ #1
Hardware name: LENOVO 10ST001QUS/312A, BIOS M1UKT4BA 11/11/2019
Workqueue: i915-userptr-acquire __i915_gem_userptr_get_pages_worker [i915]
RIP: 0010:__get_user_pages_remote+0xa0/0x2d0
Code: 85 e7 01 00 00 83 3b 01 0f 85 e0 01 00 00 f7 c1 00 00 04 00 0f 84 12
01 00 00 65 48 8b 04 25 00 6d 01 00 48 8b 80 58 03 00 00 <c7> 40 54 01 00
00 00 c6 04 24 00 4d 8d 6f 68 48

RSP: 0018:ffffaa38005a3df0 EFLAGS: 00010206
RAX: 0000000000000000 RBX: ffffaa38005a3e64 RCX: 0000000000040001
RDX: 00000000000007e9 RSI: 00007ff21f800000 RDI: ffff8afde99a0440
RBP: 00007ff21f800000 R08: ffff8afde221c000 R09: 0000000000000000
R10: 0000000000000006 R11: 0000000000000005 R12: ffff8afde221c000
R13: ffff8afde221c000 R14: 0000000000042003 R15: ffff8afde99a0440
FS:  0000000000000000(0000) GS:ffff8afdfe240000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000054 CR3: 000000048320a005 CR4: 00000000001706e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 __i915_gem_userptr_get_pages_worker+0xd1/0x2b0 [i915]
 process_one_work+0x1c7/0x310
 worker_thread+0x28/0x3c0
 ? set_worker_desc+0xb0/0xb0
 kthread+0x123/0x140
 ? kthread_use_mm+0xe0/0xe0
 ret_from_fork+0x1f/0x30
Modules linked in: snd_hda_codec_hdmi snd_hda_codec_realtek
snd_hda_codec_generic ledtrig_audio iwlmvm mac80211 libarc4
x86_pkg_temp_thermal intel_powerclamp coretemp crct10dif_pclm ul
crc32_pclmul crc32c_intel iwlwifi i915 ghash_clmulni_intel i2c_algo_bit
drm_kms_helper snd_hda_intel syscopyarea snd_intel_dspcfg sysfillrect
mei_hdcp sysimgblt tpm_crb fb_sys_fops snd_hda_codec aesni_intel cec
snd_hwdep crypto_simd snd_hda_core glue_helper drm wmi_bmof
intel_wmi_thunderbolt snd_pcm intel_cstate i2c_i801 snd_timer mei_me
cfg80211 mei i2c_smbus pcspkr i2c_core wmi thermal tpm_tis tpm_tis_core tpm
rng_core acpi_pad ppdev lp ip_tables x_tables
CR2: 0000000000000054
---[ end trace aa62f3a2cc9e91a3 ]---

--000000000000e689cb05b0587602
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I just tested the v5.9-rc7 release on two of my machi=
nes and on one of the machines, I got a bug/oops that prevents the video dr=
iver from working properly.</div><div><br></div><div>This regression must h=
ave occurred somewhere between v5.9-rc8 and v5.9-rc9.</div><div>I&#39;m att=
empting to git bisect it, but I wanted to bring it to your attention since =
I&#39;m unfamiliar with this subsystem and it&#39;s unlikely that I&#39;ll =
be able to fix it/offer a patch myself.</div><div><br></div><div>Below are =
the relevant journal log entries. Please let me know if there&#39;s any mor=
e information I can provide.<br></div><div><br></div><div><br></div><div>BU=
G: kernel NULL pointer dereference, address: 0000000000000054</div>#PF: sup=
ervisor write access in kernel mode<br>#PF: error_code(0x0002) - not-presen=
t page<br>PGD 0 P4D 0<br>Oops: 0002 [#1] PREEMPT SMP NOPTI<br>CPU: 1 PID: 4=
80 Comm: kworker/u25:0 Not tainted 5.9.0-rc7-alice-glass+ #1<br>Hardware na=
me: LENOVO 10ST001QUS/312A, BIOS M1UKT4BA 11/11/2019<br>Workqueue: i915-use=
rptr-acquire __i915_gem_userptr_get_pages_worker [i915]<br>RIP: 0010:__get_=
user_pages_remote+0xa0/0x2d0<br>Code: 85 e7 01 00 00 83 3b 01 0f 85 e0 01 0=
0 00 f7 c1 00 00 04 00 0f 84 12 01 00 00 65 48 8b 04 25 00 6d 01 00 48 8b 8=
0 58 03 00 00 &lt;c7&gt; 40 54 01 00 00 00 c6 04 24 00 4d 8d 6f 68 48<br><b=
r>RSP: 0018:ffffaa38005a3df0 EFLAGS: 00010206<br>RAX: 0000000000000000 RBX:=
 ffffaa38005a3e64 RCX: 0000000000040001<br>RDX: 00000000000007e9 RSI: 00007=
ff21f800000 RDI: ffff8afde99a0440<br>RBP: 00007ff21f800000 R08: ffff8afde22=
1c000 R09: 0000000000000000<br>R10: 0000000000000006 R11: 0000000000000005 =
R12: ffff8afde221c000<br>R13: ffff8afde221c000 R14: 0000000000042003 R15: f=
fff8afde99a0440<br>FS: =C2=A00000000000000000(0000) GS:ffff8afdfe240000(000=
0) knlGS:0000000000000000<br>CS: =C2=A00010 DS: 0000 ES: 0000 CR0: 00000000=
80050033<br>CR2: 0000000000000054 CR3: 000000048320a005 CR4: 00000000001706=
e0<br>DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000<br>=
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400<br>Call T=
race:<br>=C2=A0__i915_gem_userptr_get_pages_worker+0xd1/0x2b0 [i915]<br>=C2=
=A0process_one_work+0x1c7/0x310<br>=C2=A0worker_thread+0x28/0x3c0<br>=C2=A0=
? set_worker_desc+0xb0/0xb0<br>=C2=A0kthread+0x123/0x140<br>=C2=A0? kthread=
_use_mm+0xe0/0xe0<br>=C2=A0ret_from_fork+0x1f/0x30<br>Modules linked in: sn=
d_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio =
iwlmvm mac80211 libarc4 x86_pkg_temp_thermal intel_powerclamp coretemp crct=
10dif_pclm ul crc32_pclmul crc32c_intel iwlwifi i915 ghash_clmulni_intel i2=
c_algo_bit drm_kms_helper snd_hda_intel syscopyarea snd_intel_dspcfg sysfil=
lrect mei_hdcp sysimgblt tpm_crb fb_sys_fops snd_hda_codec aesni_intel cec =
snd_hwdep crypto_simd snd_hda_core glue_helper drm wmi_bmof intel_wmi_thund=
erbolt snd_pcm intel_cstate i2c_i801 snd_timer mei_me cfg80211 mei i2c_smbu=
s pcspkr i2c_core wmi thermal tpm_tis tpm_tis_core tpm rng_core acpi_pad pp=
dev lp ip_tables x_tables<br>CR2: 0000000000000054<br>---[ end trace aa62f3=
a2cc9e91a3 ]---<br></div>

--000000000000e689cb05b0587602--

--===============2079114642==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2079114642==--
