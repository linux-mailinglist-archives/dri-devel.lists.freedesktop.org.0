Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6047559EF4C
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 00:36:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DA1110E408;
	Tue, 23 Aug 2022 22:36:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com
 [IPv6:2607:f8b0:4864:20::1130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51CA910E4A7
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 22:35:55 +0000 (UTC)
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-335624d1e26so417421507b3.4
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 15:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen.nl; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=25bHUFwznIvscoPSIXI4nrh191O0fscyqMMg8G6anZc=;
 b=iOioT8cTFgWHkt7eq20VkJcPpO3loNEZL5FL4ITGFyK1TgbBH6C7BXECk50vGU7lp+
 5ehWoKs87ZDr1nLguwhnDGvOmZZ6QUC07h5lThUdb3oL0/sMy279+TuP8d9ZQRdNC7ax
 Vk0748unYyOfffXrLn2a/yZDJ0/DV4BFRT3V2lj46ZM01xBNvt687k4lpXCuOIGC3t+u
 ErqsZUiheyzEuZnNCrdvlEwOgLeWTstbK3UzrO7+2qxLaB7OX2VCizJM9YzZNLed3lH/
 jMy8SDEIHFaZ7+ZGmbz5749dre+RAijgll14LTX9Yc3v9FhOB2+3PBFIEBiRBBcsoWRZ
 VHHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=25bHUFwznIvscoPSIXI4nrh191O0fscyqMMg8G6anZc=;
 b=pbSNzFeBMnoByzPu/4eUU3vdXxPTF4600TgVWFGrFHCO4q5FN/5AZtBydFuSVSueab
 lmRA/OAjcY0tv84z8YWTKBslBFFLQlZbDx+h6dXYzyHD/fErB7tFSG08jlg4Qc/9XE1M
 y5uYc+J2GJMEppum+EG8227uivz5JN+u2fASTmmj4zRsE18VLX4tgv8NTw4jJvG47A7p
 BfQ6tFkze0Tnkd/5qwGnCJ+BLtFLOD/IMzzsUmSb2fI9dVsCgLb0r6z3zQ/NCcpLRQpK
 0+oF4l3DeazS5MOLGzT+HBTm5gUZtIm+0gh/9Li9C6FZIXzu8L30Jaxopv6tyVTvZDl1
 cxSg==
X-Gm-Message-State: ACgBeo3W/yCbeuuFOkLmW2ReXC0KceLbLvxOTzsC1VPi8+kGC++vs3eO
 5AxH6GiCXJE1HVQrFQEa2BwHiqbLZfHNhxg3/NeTBg==
X-Google-Smtp-Source: AA6agR7k/Eu+yOgSsVLACQMInamKd2rz9n2q18cHOad5hzHvlOWkSQNd6PWnVRZwWEr2SrDPV4SrBlbY51BAj0RV4Yk=
X-Received: by 2002:a05:6902:91d:b0:672:e583:9ed9 with SMTP id
 bu29-20020a056902091d00b00672e5839ed9mr26100875ybb.225.1661294153853; Tue, 23
 Aug 2022 15:35:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220813012801.1115950-1-bas@basnieuwenhuizen.nl>
 <c83f20bd-a753-ddcb-d4f3-fb5348189153@amd.com>
 <CAP+8YyGU1=MRt_ycn4U2npeVdsgLQjfo66jWU4DtODjiAhxQ4w@mail.gmail.com>
 <945ff305-61a8-b3d1-1712-7243d8001d9b@amd.com>
In-Reply-To: <945ff305-61a8-b3d1-1712-7243d8001d9b@amd.com>
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Date: Wed, 24 Aug 2022 00:35:48 +0200
Message-ID: <CAP+8YyFNxQtWT2WQEcFOKfHp+Zio44gateB6FPGrHAq84pF5aQ@mail.gmail.com>
Subject: Re: [PATCH 0/6] amdgpu: Allow explicitly synchronized submissions.
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 23, 2022 at 12:16 PM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Hi Bas,
>
> I've just pushed an updated drm-exec branch to fdo which should now
> include the bo_list bug fix.

Still getting the same thing:

[  103.598784] ------------[ cut here ]------------
[  103.598787] WARNING: CPU: 2 PID: 2505 at
drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:667
amdgpu_ttm_tt_get_user_pages+0x15c/0x190 [amdgpu]
[  103.599016] Modules linked in: uinput snd_seq_dummy snd_hrtimer
snd_seq snd_seq_device ccm algif_aead cbc des_generic libdes ecb md4
cmac algif_hash algif_skcipher af_alg bnep intel_ra
pl_msr snd_soc_acp5x_mach snd_acp5x_i2s snd_acp5x_pcm_dma
intel_rapl_common rtw88_8822ce rtw88_8822c rtw88_pci edac_mce_amd
rtw88_core kvm_amd mac80211 kvm btusb btrtl libarc4 btbcm irqby
pass rapl btintel pcspkr btmtk joydev cfg80211 snd_hda_codec_hdmi
bluetooth i2c_piix4 snd_soc_nau8821 snd_hda_intel snd_intel_dspcfg
snd_soc_core snd_intel_sdw_acpi snd_hda_codec snd_pci_
acp5x snd_hda_core snd_rn_pci_acp3x snd_compress snd_acp_config
ac97_bus snd_soc_acpi snd_pcm_dmaengine snd_hwdep ecdh_generic
snd_pci_acp3x cdc_acm mousedev ecc rfkill snd_pcm ina2xx_adc
kfifo_buf snd_timer snd opt3001 ina2xx industrialio soundcore
acpi_cpufreq spi_amd mac_hid fuse ip_tables x_tables overlay ext4
crc16 mbcache jbd2 mmc_block vfat fat usbhid amdgpu drm_tt
m_helper ttm agpgart drm_exec gpu_sched i2c_algo_bit
[  103.599064]  drm_display_helper drm_kms_helper syscopyarea
sysfillrect sysimgblt fb_sys_fops drm serio_raw sdhci_pci atkbd libps2
cqhci vivaldi_fmap ccp crct10dif_pclmul sdhci i8042 cr
c32_pclmul xhci_pci hid_multitouch ghash_clmulni_intel aesni_intel
crypto_simd cryptd wdat_wdt mmc_core cec sp5100_tco rng_core
xhci_pci_renesas serio video i2c_hid_acpi 8250_dw i2c_hid b
trfs blake2b_generic libcrc32c crc32c_generic crc32c_intel xor
raid6_pq dm_mirror dm_region_hash dm_log dm_mod pkcs8_key_parser
crypto_user
[  103.599091] CPU: 2 PID: 2505 Comm: ForzaHorizon5.e Not tainted
5.18.0-1-neptune-00172-g067e00b76d9c #25
[  103.599093] Hardware name: Valve Jupiter/Jupiter, BIOS F7A0105 03/21/202=
2
[  103.599095] RIP: 0010:amdgpu_ttm_tt_get_user_pages+0x15c/0x190 [amdgpu]
[  103.599232] Code: 66 ed c0 48 c7 c7 60 cb 09 c1 e8 5f 87 c1 cb eb
9c 48 c7 c6 c5 8e f3 c0 bf 02 00 00 00 e8 8c a4 ee ff 41 be f2 ff ff
ff eb 8b <0f> 0b eb f4 41 be fd ff ff ff e9 7c ff
ff ff 48 83 b8 a0 00 00 00
[  103.599234] RSP: 0018:ffffc195020afb98 EFLAGS: 00010282
[  103.599235] RAX: ffff9d840b878000 RBX: ffff9d8300b1e1c0 RCX: 00000000000=
00001
[  103.599236] RDX: 0000000000000dc0 RSI: ffff9d840b878000 RDI: ffff9d835bd=
b3000
[  103.599237] RBP: ffff9d84d2617520 R08: 0000000000001000 R09: ffff9d840b8=
78000
[  103.599238] R10: 0000000000000005 R11: 0000000000000000 R12: ffff9d83103=
0e240
[  103.599239] R13: 0000000032080000 R14: 0000000000000001 R15: ffff9d8313c=
30060
[  103.599240] FS:  000000001c86f640(0000) GS:ffff9d862fe80000(0000)
knlGS:000000001abf0000
[  103.599242] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  103.599242] CR2: 00007f0be80210e8 CR3: 000000017fa08000 CR4: 00000000003=
50ee0
[  103.599244] Call Trace:
[  103.599247]  <TASK>
[  103.599250]  amdgpu_cs_ioctl+0x9cc/0x2080 [amdgpu]
[  103.599390]  ? amdgpu_cs_find_mapping+0x110/0x110 [amdgpu]
[  103.599525]  drm_ioctl_kernel+0xc5/0x170 [drm]
[  103.599547]  drm_ioctl+0x229/0x400 [drm]
[  103.599563]  ? amdgpu_cs_find_mapping+0x110/0x110 [amdgpu]
[  103.599700]  amdgpu_drm_ioctl+0x4a/0x80 [amdgpu]
[  103.599832]  __x64_sys_ioctl+0x8c/0xc0
[  103.599837]  do_syscall_64+0x3a/0x80
[  103.599841]  entry_SYSCALL_64_after_hwframe+0x44/0xae
[  103.599844] RIP: 0033:0x7f0c9f59b59b
[  103.599846] Code: ff ff ff 85 c0 79 9b 49 c7 c4 ff ff ff ff 5b 5d
4c 89 e0 41 5c c3 66 0f 1f 84 00 00 00 00 00 f3 0f 1e fa b8 10 00 00
00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d a5
a8 0c 00 f7 d8 64 89 01 48
[  103.599847] RSP: 002b:000000001c86d498 EFLAGS: 00000246 ORIG_RAX:
0000000000000010
[  103.599849] RAX: ffffffffffffffda RBX: 000000001c86d510 RCX: 00007f0c9f5=
9b59b
[  103.599850] RDX: 000000001c86d510 RSI: 00000000c0186444 RDI: 00000000000=
00021
[  103.599850] RBP: 00000000c0186444 R08: 00007f0c3ad55840 R09: 000000001c8=
6d4e0
[  103.599851] R10: 0000000000000000 R11: 0000000000000246 R12: 00007f0c3a1=
9b200
[  103.599852] R13: 0000000000000021 R14: 00007f0c3aff8cf0 R15: 000000001c8=
6d6e0
[  103.599854]  </TASK>
[  103.599854] ---[ end trace 0000000000000000 ]---
[  103.599856] [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to
process the buffer list -14!
[  103.599995] ------------[ cut here ]------------
[  103.599995] refcount_t: underflow; use-after-free.
[  103.600002] WARNING: CPU: 2 PID: 2505 at lib/refcount.c:28
refcount_warn_saturate+0xa6/0xf0
[  103.600006] Modules linked in: uinput snd_seq_dummy snd_hrtimer
snd_seq snd_seq_device ccm algif_aead cbc des_generic libdes ecb md4
cmac algif_hash algif_skcipher af_alg bnep intel_ra
pl_msr snd_soc_acp5x_mach snd_acp5x_i2s snd_acp5x_pcm_dma
intel_rapl_common rtw88_8822ce rtw88_8822c rtw88_pci edac_mce_amd
rtw88_core kvm_amd mac80211 kvm btusb btrtl libarc4 btbcm irqby
pass rapl btintel pcspkr btmtk joydev cfg80211 snd_hda_codec_hdmi
bluetooth i2c_piix4 snd_soc_nau8821 snd_hda_intel snd_intel_dspcfg
snd_soc_core snd_intel_sdw_acpi snd_hda_codec snd_pci_
acp5x snd_hda_core snd_rn_pci_acp3x snd_compress snd_acp_config
ac97_bus snd_soc_acpi snd_pcm_dmaengine snd_hwdep ecdh_generic
snd_pci_acp3x cdc_acm mousedev ecc rfkill snd_pcm ina2xx_adc
kfifo_buf snd_timer snd opt3001 ina2xx industrialio soundcore
acpi_cpufreq spi_amd mac_hid fuse ip_tables x_tables overlay ext4
crc16 mbcache jbd2 mmc_block vfat fat usbhid amdgpu drm_tt
m_helper ttm agpgart drm_exec gpu_sched i2c_algo_bit
[  103.600043]  drm_display_helper drm_kms_helper syscopyarea
sysfillrect sysimgblt fb_sys_fops drm serio_raw sdhci_pci atkbd libps2
cqhci vivaldi_fmap ccp crct10dif_pclmul sdhci i8042 cr
c32_pclmul xhci_pci hid_multitouch ghash_clmulni_intel aesni_intel
crypto_simd cryptd wdat_wdt mmc_core cec sp5100_tco rng_core
xhci_pci_renesas serio video i2c_hid_acpi 8250_dw i2c_hid b
trfs blake2b_generic libcrc32c crc32c_generic crc32c_intel xor
raid6_pq dm_mirror dm_region_hash dm_log dm_mod pkcs8_key_parser
crypto_user
[  103.600062] CPU: 2 PID: 2505 Comm: ForzaHorizon5.e Tainted: G
 W         5.18.0-1-neptune-00172-g067e00b76d9c #25
[  103.600064] Hardware name: Valve Jupiter/Jupiter, BIOS F7A0105 03/21/202=
2
[  103.600065] RIP: 0010:refcount_warn_saturate+0xa6/0xf0
[  103.600066] Code: 05 2d c4 6d 01 01 e8 90 68 58 00 0f 0b c3 80 3d
1d c4 6d 01 00 75 95 48 c7 c7 b8 db 3a 8d c6 05 0d c4 6d 01 01 e8 71
68 58 00 <0f> 0b c3 80 3d fc c3 6d 01 00 0f 85 72
ff ff ff 48 c7 c7 10 dc 3a
[  103.600068] RSP: 0018:ffffc195020afba8 EFLAGS: 00010286
[  103.600069] RAX: 0000000000000000 RBX: ffffc195020afc58 RCX: 00000000000=
00027
[  103.600070] RDX: ffff9d862fea0768 RSI: 0000000000000001 RDI: ffff9d862fe=
a0760
[  103.600070] RBP: 0000000000000000 R08: 0000000000000000 R09: ffffc195020=
af9b8
[  103.600071] R10: 0000000000000003 R11: ffffffff8dac5168 R12: 00000000fff=
fffff
[  103.600072] R13: 0000000000000018 R14: 0000000000000001 R15: ffff9d8313c=
30060
[  103.600073] FS:  000000001c86f640(0000) GS:ffff9d862fe80000(0000)
knlGS:000000001abf0000
[  103.600074] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  103.600075] CR2: 00007f0be80210e8 CR3: 000000017fa08000 CR4: 00000000003=
50ee0
[  103.600076] Call Trace:
[  103.600076]  <TASK>
[  103.600077]  amdgpu_cs_parser_fini+0x11e/0x160 [amdgpu]
[  103.600213]  amdgpu_cs_ioctl+0x40a/0x2080 [amdgpu]
[  103.600350]  ? amdgpu_cs_find_mapping+0x110/0x110 [amdgpu]
[  103.600485]  drm_ioctl_kernel+0xc5/0x170 [drm]
[  103.600502]  drm_ioctl+0x229/0x400 [drm]
[  103.600518]  ? amdgpu_cs_find_mapping+0x110/0x110 [amdgpu]
[  103.600654]  amdgpu_drm_ioctl+0x4a/0x80 [amdgpu]
[  103.600787]  __x64_sys_ioctl+0x8c/0xc0
[  103.600788]  do_syscall_64+0x3a/0x80
[  103.600791]  entry_SYSCALL_64_after_hwframe+0x44/0xae
[  103.600792] RIP: 0033:0x7f0c9f59b59b
[  103.600793] Code: ff ff ff 85 c0 79 9b 49 c7 c4 ff ff ff ff 5b 5d
4c 89 e0 41 5c c3 66 0f 1f 84 00 00 00 00 00 f3 0f 1e fa b8 10 00 00
00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d a5
a8 0c 00 f7 d8 64 89 01 48
[  103.600794] RSP: 002b:000000001c86d498 EFLAGS: 00000246 ORIG_RAX:
0000000000000010
[  103.600795] RAX: ffffffffffffffda RBX: 000000001c86d510 RCX: 00007f0c9f5=
9b59b
[  103.600796] RDX: 000000001c86d510 RSI: 00000000c0186444 RDI: 00000000000=
00021
[  103.600797] RBP: 00000000c0186444 R08: 00007f0c3ad55840 R09: 000000001c8=
6d4e0
[  103.600798] R10: 0000000000000000 R11: 0000000000000246 R12: 00007f0c3a1=
9b200
[  103.600798] R13: 0000000000000021 R14: 00007f0c3aff8cf0 R15: 000000001c8=
6d6e0
[  103.600800]  </TASK>
[  103.600800] ---[ end trace 0000000000000000 ]---


>
> Can you please test that with Forza? I'm still fighting getting a new
> kernel on my Steamdeck.
>
> Thanks,
> Christian.
>
> Am 22.08.22 um 01:08 schrieb Bas Nieuwenhuizen:
> > On Thu, Aug 18, 2022 at 3:20 PM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote:
> >> Hi Bas,
> >>
> >> I've just pushed the branch drm-exec to my fdo repository:
> >> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgi=
tlab.freedesktop.org%2Fckoenig%2Flinux-drm.git&amp;data=3D05%7C01%7Cchristi=
an.koenig%40amd.com%7Ccc04d790d774485a5cbd08da83ca03f4%7C3dd8961fe4884e608e=
11a82d994e183d%7C0%7C0%7C637967200920376906%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C=
&amp;sdata=3D8ZaXIdEQZe3oNCQtxoNjuBezB4YmPeDR2cLfXfxraZk%3D&amp;reserved=3D=
0
> >>
> >> This branch contains all the gang submit patches as well as the latest
> >> drm-exec stuff. VCN3/4 video decoding has some issues on it, but that
> >> probably shouldn't bother your work.
> > Hi Christian,
> >
> > The drm-exec branch doesn't seem to be capable of running Forza
> > Horizon 5. First bad commit seems to be
> >
> > commit 8bb3e919ce0109512f6631422f3fe52169836261
> > Author: Christian K=C3=B6nig <christian.koenig@amd.com>
> > Date:   Thu Jul 14 10:23:38 2022 +0200
> >
> >     drm/amdgpu: revert "partial revert "remove ctx->lock" v2"
> >
> >     This reverts commit 94f4c4965e5513ba624488f4b601d6b385635aec.
> >
> >     We found that the bo_list is missing a protection for its list entr=
ies.
> >     Since that is fixed now this workaround can be removed again.
> >
> >     Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> >
> >
> > and
> >
> > https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fpat=
chwork.freedesktop.org%2Fpatch%2F497679%2F&amp;data=3D05%7C01%7Cchristian.k=
oenig%40amd.com%7Ccc04d790d774485a5cbd08da83ca03f4%7C3dd8961fe4884e608e11a8=
2d994e183d%7C0%7C0%7C637967200920376906%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4=
wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp=
;sdata=3D0F7jd61YEApKySKpqIgODHM1x0JB83coaHgjzFeVPoU%3D&amp;reserved=3D0 ("=
drm/amdgpu: Fix
> > use-after-free on amdgpu_bo_list mutex")
> >
> > seems to fix things at that patch, but I'm not seeing the obvious
> > rebase over "drm/amdgpu: cleanup and reorder amdgpu_cs.c" yet (and/or
> > whether further issues were introduced).
> >
> >
> > Error logs:
> >
> > [  124.821691] ------------[ cut here ]------------
> > [  124.821696] WARNING: CPU: 3 PID: 2485 at
> > drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:667
> > amdgpu_ttm_tt_get_user_pages+0x15c/0x190 [amdgpu]
> > [  124.821955] Modules linked in: uinput snd_seq_dummy snd_hrtimer
> > snd_seq snd_seq_device ccm algif_aead cbc des_generic libdes ecb md4
> > cmac algif_hash algif_skcipher af_alg bnep intel_rapl_msr
> > intel_rapl_common snd_soc_acp5x_mach snd_acp5x_i2s snd_acp5x_pcm_dma
> > edac_mce_amd kvm_amd kvm rtw88_8822ce rtw88_8822c rtw88_pci irqbypass
> > rapl rtw88_core pcspkr joydev mac80211 btusb s
> > nd_hda_codec_hdmi btrtl libarc4 snd_hda_intel btbcm btintel
> > snd_intel_dspcfg btmtk snd_pci_acp5x i2c_piix4 snd_soc_nau8821
> > snd_intel_sdw_acpi snd_rn_pci_acp3x cfg80211 bluetooth snd_soc_core
> > snd_hda_codec snd_acp_config snd_soc_acpi snd_pci_acp3x ecdh_generic
> > snd_hda_core cdc_acm mousedev snd_compress ecc rfkill snd_hwdep
> > ac97_bus snd_pcm_dmaengine ina2xx_adc snd_pcm kfifo_buf
> > spi_amd snd_timer opt3001 ina2xx snd industrialio soundcore mac_hid
> > acpi_cpufreq fuse ip_tables x_tables overlay ext4 crc16 mbcache jbd2
> > mmc_block vfat fat usbhid amdgpu drm_ttm_helper ttm agpgart drm_exec
> > gpu_sched i2c_algo_bit
> > [  124.822016]  drm_display_helper drm_kms_helper syscopyarea
> > sysfillrect sysimgblt fb_sys_fops drm serio_raw atkbd crct10dif_pclmul
> > libps2 crc32_pclmul vivaldi_fmap sdhci_pci ghash_clmulni_intel i8042
> > ccp cqhci sdhci aesni_intel hid_multitouch xhci_pci crypto_simd cryptd
> > wdat_wdt mmc_core cec sp5100_tco rng_core xhci_pci_renesas serio video
> > i2c_hid_acpi 8250_dw i2c_hid btrfs
> > blake2b_generic libcrc32c crc32c_generic crc32c_intel xor raid6_pq
> > dm_mirror dm_region_hash dm_log dm_mod pkcs8_key_parser crypto_user
> > [  124.822051] CPU: 3 PID: 2485 Comm: ForzaHorizon5.e Not tainted
> > 5.18.0-1-neptune-00172-g067e00b76d9c #23
> > [  124.822054] Hardware name: Valve Jupiter/Jupiter, BIOS F7A0105 03/21=
/2022
> > [  124.822055] RIP: 0010:amdgpu_ttm_tt_get_user_pages+0x15c/0x190 [amdg=
pu]
> > [  124.822262] Code: e1 ef c0 48 c7 c7 10 4a 0c c1 e8 5f f7 3e dd eb
> > 9c 48 c7 c6 85 0a f6 c0 bf 02 00 00 00 e8 8c 74 e2 ff 41 be f2 ff ff
> > ff eb 8b <0f> 0b eb f4 41 be fd ff ff ff e9 7c ff ff ff 48 83 b8 a0 00
> > 00 00
> > [  124.822264] RSP: 0018:ffffa257827afb98 EFLAGS: 00010282
> > [  124.822267] RAX: ffff8b82240e6000 RBX: ffff8b8200a31100 RCX: 0000000=
000000001
> > [  124.822268] RDX: 0000000000000dc0 RSI: ffff8b82240e6000 RDI: ffff8b8=
2a4c7e800
> > [  124.822269] RBP: ffff8b82ee809320 R08: 0000000000001000 R09: ffff8b8=
2240e6000
> > [  124.822270] R10: 0000000000000006 R11: 0000000000000000 R12: ffff8b8=
2ee6dc9c0
> > [  124.822272] R13: 0000000031880000 R14: 0000000000000001 R15: ffff8b8=
23face440
> > [  124.822273] FS:  000000002773f640(0000) GS:ffff8b852fec0000(0000)
> > knlGS:000000001aba0000
> > [  124.822275] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [  124.822276] CR2: 0000000003ff4000 CR3: 00000001f1c2e000 CR4: 0000000=
000350ee0
> > [  124.822278] Call Trace:
> > [  124.822281]  <TASK>
> > [  124.822285]  amdgpu_cs_ioctl+0x9cc/0x2070 [amdgpu]
> > [  124.822496]  ? amdgpu_cs_find_mapping+0x110/0x110 [amdgpu]
> > [  124.822701]  drm_ioctl_kernel+0xc5/0x170 [drm]
> > [  124.822728]  ? futex_wait+0x18f/0x260
> > [  124.822733]  drm_ioctl+0x229/0x400 [drm]
> > [  124.822757]  ? amdgpu_cs_find_mapping+0x110/0x110 [amdgpu]
> > [  124.822963]  amdgpu_drm_ioctl+0x4a/0x80 [amdgpu]
> > [  124.823165]  __x64_sys_ioctl+0x8c/0xc0
> > [  124.823169]  do_syscall_64+0x3a/0x80
> > [  124.823174]  entry_SYSCALL_64_after_hwframe+0x44/0xae
> > [  124.823177] RIP: 0033:0x7f5525e1059b
> > [  124.823180] Code: ff ff ff 85 c0 79 9b 49 c7 c4 ff ff ff ff 5b 5d
> > 4c 89 e0 41 5c c3 66 0f 1f 84 00 00 00 00 00 f3 0f 1e fa b8 10 00 00
> > 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d a5 a8 0c 00 f7 d8 64 89
> > 01 48
> > [  124.823182] RSP: 002b:000000002773d548 EFLAGS: 00000246 ORIG_RAX:
> > 0000000000000010
> > [  124.823185] RAX: ffffffffffffffda RBX: 000000002773d5d0 RCX: 00007f5=
525e1059b
> > [  124.823186] RDX: 000000002773d5d0 RSI: 00000000c0186444 RDI: 0000000=
000000021
> > [  124.823187] RBP: 00000000c0186444 R08: 00007f54a4043c80 R09: 0000000=
02773d590
> > [  124.823188] R10: 0000000000000000 R11: 0000000000000246 R12: 00007f5=
4a4043d50
> > [  124.823190] R13: 0000000000000021 R14: 00007f54a4043cb0 R15: 00007f5=
4a4043d20
> > [  124.823192]  </TASK>
> > [  124.823193] ---[ end trace 0000000000000000 ]---
> > [  124.823197] [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to
> > process the buffer list -14!
> > [  124.823410] ------------[ cut here ]------------
> > [  124.823411] refcount_t: underflow; use-after-free.
> > [  124.823418] WARNING: CPU: 3 PID: 2485 at lib/refcount.c:28
> > refcount_warn_saturate+0xa6/0xf0
> > [  124.823424] Modules linked in: uinput snd_seq_dummy snd_hrtimer
> > snd_seq snd_seq_device ccm algif_aead cbc des_generic libdes ecb md4
> > cmac algif_hash algif_skcipher af_alg bnep intel_rapl_msr
> > intel_rapl_common snd_soc_acp5x_mach snd_acp5x_i2s snd_acp5x_pcm_dma
> > edac_mce_amd kvm_amd kvm rtw88_8822ce rtw88_8822c rtw88_pci irqbypass
> > rapl rtw88_core pcspkr joydev mac80211 btusb s
> > nd_hda_codec_hdmi btrtl libarc4 snd_hda_intel btbcm btintel
> > snd_intel_dspcfg btmtk snd_pci_acp5x i2c_piix4 snd_soc_nau8821
> > snd_intel_sdw_acpi snd_rn_pci_acp3x cfg80211 bluetooth snd_soc_core
> > snd_hda_codec snd_acp_config snd_soc_acpi snd_pci_acp3x ecdh_generic
> > snd_hda_core cdc_acm mousedev snd_compress ecc rfkill snd_hwdep
> > ac97_bus snd_pcm_dmaengine ina2xx_adc snd_pcm kfifo_buf
> > spi_amd snd_timer opt3001 ina2xx snd industrialio soundcore mac_hid
> > acpi_cpufreq fuse ip_tables x_tables overlay ext4 crc16 mbcache jbd2
> > mmc_block vfat fat usbhid amdgpu drm_ttm_helper ttm agpgart drm_exec
> > gpu_sched i2c_algo_bit
> > [  124.823485]  drm_display_helper drm_kms_helper syscopyarea
> > sysfillrect sysimgblt fb_sys_fops drm serio_raw atkbd crct10dif_pclmul
> > libps2 crc32_pclmul vivaldi_fmap sdhci_pci ghash_clmulni_intel i8042
> > ccp cqhci sdhci aesni_intel hid_multitouch xhci_pci crypto_simd cryptd
> > wdat_wdt mmc_core cec sp5100_tco rng_core xhci_pci_renesas serio video
> > i2c_hid_acpi 8250_dw i2c_hid btrfs
> > blake2b_generic libcrc32c crc32c_generic crc32c_intel xor raid6_pq
> > dm_mirror dm_region_hash dm_log dm_mod pkcs8_key_parser crypto_user
> > [  124.823516] CPU: 3 PID: 2485 Comm: ForzaHorizon5.e Tainted: G
> >   W         5.18.0-1-neptune-00172-g067e00b76d9c #23
> > [  124.823519] Hardware name: Valve Jupiter/Jupiter, BIOS F7A0105 03/21=
/2022
> > [  124.823520] RIP: 0010:refcount_warn_saturate+0xa6/0xf0
> > [  124.823523] Code: 05 2d c4 6d 01 01 e8 90 68 58 00 0f 0b c3 80 3d
> > 1d c4 6d 01 00 75 95 48 c7 c7 b8 db ba 9e c6 05 0d c4 6d 01 01 e8 71
> > 68 58 00 <0f> 0b c3 80 3d fc c3 6d 01 00 0f 85 72 ff ff ff 48 c7 c7 10
> > dc ba
> > [  124.823524] RSP: 0018:ffffa257827afba8 EFLAGS: 00010286
> > [  124.823526] RAX: 0000000000000000 RBX: ffffa257827afc58 RCX: 0000000=
000000027
> > [  124.823527] RDX: ffff8b852fee0768 RSI: 0000000000000001 RDI: ffff8b8=
52fee0760
> > [  124.823528] RBP: 0000000000000000 R08: 0000000000000000 R09: ffffa25=
7827af9b8
> > [  124.823529] R10: 0000000000000003 R11: ffffffff9f2c5168 R12: 0000000=
0ffffffff
> > [  124.823530] R13: 0000000000000018 R14: 0000000000000001 R15: ffff8b8=
23face440
> > [  124.823531] FS:  000000002773f640(0000) GS:ffff8b852fec0000(0000)
> > knlGS:000000001aba0000
> > [  124.823533] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [  124.823534] CR2: 0000000003ff4000 CR3: 00000001f1c2e000 CR4: 0000000=
000350ee0
> > [  124.823535] Call Trace:
> > [  124.823537]  <TASK>
> > [  124.823537]  amdgpu_cs_parser_fini+0x11e/0x160 [amdgpu]
> > [  124.823745]  amdgpu_cs_ioctl+0x40a/0x2070 [amdgpu]
> > [  124.823954]  ? amdgpu_cs_find_mapping+0x110/0x110 [amdgpu]
> > [  124.824159]  drm_ioctl_kernel+0xc5/0x170 [drm]
> > [  124.824185]  ? futex_wait+0x18f/0x260
> > [  124.824189]  drm_ioctl+0x229/0x400 [drm]
> > [  124.824213]  ? amdgpu_cs_find_mapping+0x110/0x110 [amdgpu]
> > [  124.824444]  amdgpu_drm_ioctl+0x4a/0x80 [amdgpu]
> > [  124.824651]  __x64_sys_ioctl+0x8c/0xc0
> > [  124.824655]  do_syscall_64+0x3a/0x80
> > [  124.824660]  entry_SYSCALL_64_after_hwframe+0x44/0xae
> > [  124.824663] RIP: 0033:0x7f5525e1059b
> > [  124.824665] Code: ff ff ff 85 c0 79 9b 49 c7 c4 ff ff ff ff 5b 5d
> > 4c 89 e0 41 5c c3 66 0f 1f 84 00 00 00 00 00 f3 0f 1e fa b8 10 00 00
> > 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d a5 a8 0c 00 f7 d8 64 89
> > 01 48
> > [  124.824667] RSP: 002b:000000002773d548 EFLAGS: 00000246 ORIG_RAX:
> > 0000000000000010
> > [  124.824670] RAX: ffffffffffffffda RBX: 000000002773d5d0 RCX: 00007f5=
525e1059b
> > [  124.824671] RDX: 000000002773d5d0 RSI: 00000000c0186444 RDI: 0000000=
000000021
> > [  124.824673] RBP: 00000000c0186444 R08: 00007f54a4043c80 R09: 0000000=
02773d590
> > [  124.824674] R10: 0000000000000000 R11: 0000000000000246 R12: 00007f5=
4a4043d50
> > [  124.824675] R13: 0000000000000021 R14: 00007f54a4043cb0 R15: 00007f5=
4a4043d20
> > [  124.824677]  </TASK>
> > [  124.824678] ---[ end trace 0000000000000000 ]---
> >
> >
> >
> >> Please rebase this work on top. It should at least make the TTM change=
s
> >> unnecessary.
> >>
> >> Going to take a closer look into the VM sync changes now.
> >>
> >> Regards,
> >> Christian.
> >>
> >> Am 13.08.22 um 03:27 schrieb Bas Nieuwenhuizen:
> >>> This adds a context option to use DMA_RESV_USAGE_BOOKKEEP for userspa=
ce submissions,
> >>> based on Christians TTM work.
> >>>
> >>> Disabling implicit sync is something we've wanted in radv for a while=
 for resolving
> >>> some corner cases. A more immediate thing that would be solved here i=
s avoiding a
> >>> bunch of implicit sync on GPU map/unmap operations as well, which hel=
ps with stutter
> >>> around sparse maps/unmaps.
> >>>
> >>> This has seen a significant improvement in stutter in Forza Horizon 5=
 and Forza
> >>> Horizon 4. (As games that had significant issues in sparse binding re=
lated stutter).
> >>> I've been able to pass a full vulkan-cts run on navi21 with this.
> >>>
> >>> Userspace code for this is available at
> >>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fg=
itlab.freedesktop.org%2Fmesa%2Fmesa%2F-%2Fmerge_requests%2F18032&amp;data=
=3D05%7C01%7Cchristian.koenig%40amd.com%7Ccc04d790d774485a5cbd08da83ca03f4%=
7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637967200920533109%7CUnknown%7=
CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn=
0%3D%7C3000%7C%7C%7C&amp;sdata=3D6vpUn1APkYZKO0xA7ixEpJgG7%2B1gHynGv1iO5BPf=
Ze4%3D&amp;reserved=3D0 and a branch
> >>> for the kernel code is available at
> >>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fg=
ithub.com%2FBNieuwenhuizen%2Flinux%2Ftree%2Fno-implicit-sync-5.19&amp;data=
=3D05%7C01%7Cchristian.koenig%40amd.com%7Ccc04d790d774485a5cbd08da83ca03f4%=
7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637967200920533109%7CUnknown%7=
CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn=
0%3D%7C3000%7C%7C%7C&amp;sdata=3DKV0DTPt35fuduIU4qFroTHGmsZ%2FSD9yWk8F6YjzE=
u4c%3D&amp;reserved=3D0
> >>>
> >>> This is a follow-up on RFC series https://nam11.safelinks.protection.=
outlook.com/?url=3Dhttps%3A%2F%2Fpatchwork.freedesktop.org%2Fseries%2F10457=
8%2F&amp;data=3D05%7C01%7Cchristian.koenig%40amd.com%7Ccc04d790d774485a5cbd=
08da83ca03f4%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C63796720092053310=
9%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1ha=
WwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DymhUQZPFcBhd0qHyt%2BawAwQYx9h=
UZjviF5T90ks0MEQ%3D&amp;reserved=3D0 .
> >>>
> >>> The main changes were:
> >>>
> >>> 1) Instead of replacing num_shared with usage, I'm just adding usage,=
 since
> >>>      num_shared was actually needed.
> >>> 2) We now agree that DMA_RESV_USAGE_BOOKKEEP is reasonable for this p=
urpose.
> >>>
> >>> Please let me know if I missed anything, especially with the change t=
o VM updates,
> >>> as we went back and forth a ton of times on that.
> >>>
> >>>
> >>> Bas Nieuwenhuizen (6):
> >>>     drm/ttm: Add usage to ttm_validate_buffer.
> >>>     drm/amdgpu: Add separate mode for syncing DMA_RESV_USAGE_BOOKKEEP=
.
> >>>     drm/amdgpu: Allow explicit sync for VM ops.
> >>>     drm/amdgpu: Refactor amdgpu_vm_get_pd_bo.
> >>>     drm/amdgpu: Add option to disable implicit sync for a context.
> >>>     drm/amdgpu: Bump amdgpu driver version.
> >>>
> >>>    .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 16 +++++++---
> >>>    drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        | 20 +++++++++---
> >>>    drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c       |  3 +-
> >>>    drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c       | 32 +++++++++++++++=
++--
> >>>    drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h       |  1 +
> >>>    drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  3 +-
> >>>    drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c       | 12 ++++---
> >>>    drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c       |  3 +-
> >>>    drivers/gpu/drm/amd/amdgpu/amdgpu_object.c    | 11 ++++---
> >>>    drivers/gpu/drm/amd/amdgpu/amdgpu_object.h    |  3 +-
> >>>    drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c      | 11 +++++--
> >>>    drivers/gpu/drm/amd/amdgpu/amdgpu_sync.h      |  4 +--
> >>>    drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       |  1 +
> >>>    drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c       |  2 +-
> >>>    drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        |  5 ++-
> >>>    drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h        |  3 +-
> >>>    drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c    |  3 +-
> >>>    drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c   |  3 +-
> >>>    drivers/gpu/drm/amd/amdkfd/kfd_svm.c          |  1 +
> >>>    drivers/gpu/drm/qxl/qxl_release.c             |  1 +
> >>>    drivers/gpu/drm/radeon/radeon_cs.c            |  2 ++
> >>>    drivers/gpu/drm/radeon/radeon_gem.c           |  1 +
> >>>    drivers/gpu/drm/radeon/radeon_vm.c            |  2 ++
> >>>    drivers/gpu/drm/ttm/ttm_execbuf_util.c        |  3 +-
> >>>    drivers/gpu/drm/vmwgfx/vmwgfx_resource.c      |  7 +++-
> >>>    drivers/gpu/drm/vmwgfx/vmwgfx_validation.c    |  1 +
> >>>    include/drm/ttm/ttm_execbuf_util.h            |  2 ++
> >>>    include/uapi/drm/amdgpu_drm.h                 |  3 ++
> >>>    28 files changed, 122 insertions(+), 37 deletions(-)
> >>>
>
