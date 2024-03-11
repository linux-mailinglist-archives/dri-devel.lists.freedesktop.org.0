Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3F587843D
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 16:53:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD62B112B2E;
	Mon, 11 Mar 2024 15:53:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.b="LjbxKM4v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8668112B2C;
 Mon, 11 Mar 2024 15:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:Cc:Reply-To:From:References:To:Subject:MIME-Version:Date:
 Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 In-Reply-To:References; bh=7Nzaw8VUrGQUVOLdB84ni+9NlL1ylZKBWiMnlBPGR7c=;
 t=1710172393; x=1710604393; b=LjbxKM4vyCtU2cWojJxJ+/lbbZTb49GqVECFfZElesRp+yQ
 DnnCs6xjXYQl26C9tu5sKvyaFf/IvvG0g02pWeCmjd/dtOTy9tmShhW8tF5ME28F8yA9zJh3r/ecj
 uoqUshGtfN4JGJpFr9CSs9csl7gbzUNpF2QDPzhTENVm2+5cueNyaTB0122sItA9dbbTQycW1Dx5J
 2z6Nra1imyn9zau7ESW57EZhph6S64OtFq18iA7cCe72Rb6P1x32F7NCa/5QoN87GtNf9Hr2AV9Z/
 vO1zTB2LEbBgpyy/Vjv9R5OWEv6XtJweGFPel1dc16v+GktTd1TkkAE8nrWDTekg==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1rjhxe-0003pi-HZ; Mon, 11 Mar 2024 16:53:10 +0100
Message-ID: <ee2e74d2-1a7a-4e24-8502-80cf2ffad59d@leemhuis.info>
Date: Mon, 11 Mar 2024 16:53:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] Divide-by-zero on DisplayPort MST unplug with nouveau
Content-Language: en-US, de-DE
To: Imre Deak <imre.deak@intel.com>
References: <ZeoAPFIF6NClUl4P@debian.local>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Cc: regressions@lists.linux.dev, Chris Bainbridge
 <chris.bainbridge@gmail.com>, intel-gfx <intel-gfx@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
In-Reply-To: <ZeoAPFIF6NClUl4P@debian.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1710172393;
 f2868a73; 
X-HE-SMSGID: 1rjhxe-0003pi-HZ
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
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07.03.24 18:58, Chris Bainbridge wrote:
> ----- Forwarded message from Chris Bainbridge <chris.bainbridge@gmail.c=
om> -----
>=20
> Date: Sat, 10 Feb 2024 21:24:59 +0000

Hmm, it looks like nobody is looking into this regression. Is there a
good reason?

Imre, or did you maybe just miss that Chris' regression seems to be
caused by a commit of yours? He initally proposed a fix (the forwarded
mail that is quoted here) more a month ago already here:
https://lore.kernel.org/all/ZcfpqwnkSoiJxeT9@debian.local/

Chris recently filed a ticket, too:
https://gitlab.freedesktop.org/drm/misc/kernel/-/issues/36

Mostly silence there as well. :-/

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S: Chris, sorry, I had missed that you initially proposed the fix a
month ago; if I had noticed this earlier I had sent a mail like this one
earlier.
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

> From: Chris Bainbridge <chris.bainbridge@gmail.com>
> To: dri-devel@lists.freedesktop.org
> Cc: lyude@redhat.com, ville.syrjala@linux.intel.com, stanislav.lisovski=
y@intel.com,
> 	mripard@kernel.org, imre.deak@intel.com
> Subject: [PATCH] Fix divide-by-zero on DP unplug with nouveau
>=20
> The following trace occurs when using nouveau and unplugging a DP MST
> adaptor:
>>  divide error: 0000 [#1] PREEMPT SMP PTI
>  CPU: 7 PID: 2962 Comm: Xorg Not tainted 6.8.0-rc3+ #744
>  Hardware name: Razer Blade/DANA_MB, BIOS 01.01 08/31/2018
>  RIP: 0010:drm_dp_bw_overhead+0xb4/0x110 [drm_display_helper]
>  Code: c6 b8 01 00 00 00 75 61 01 c6 41 0f af f3 41 0f af f1 c1 e1 04 4=
8 63 c7 31 d2 89 ff 48 8b 5d f8 c9 48 0f af f1 48 8d 44 06 ff <48> f7 f7 =
31 d2 31 c9 31 f6 31 ff 45 31 c0 45 31 c9 45 31 d2 45 31
>  RSP: 0018:ffffb2c5c211fa30 EFLAGS: 00010206
>  RAX: ffffffffffffffff RBX: 0000000000000000 RCX: 0000000000f59b00
>  RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
>  RBP: ffffb2c5c211fa48 R08: 0000000000000001 R09: 0000000000000020
>  R10: 0000000000000004 R11: 0000000000000000 R12: 0000000000023b4a
>  R13: ffff91d37d165800 R14: ffff91d36fac6d80 R15: ffff91d34a764010
>  FS:  00007f4a1ca3fa80(0000) GS:ffff91d6edbc0000(0000) knlGS:0000000000=
000000
>  CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>  CR2: 0000559491d49000 CR3: 000000011d180002 CR4: 00000000003706f0
>  Call Trace:
>   <TASK>
>   ? show_regs+0x6d/0x80
>   ? die+0x37/0xa0
>   ? do_trap+0xd4/0xf0
>   ? do_error_trap+0x71/0xb0
>   ? drm_dp_bw_overhead+0xb4/0x110 [drm_display_helper]
>   ? exc_divide_error+0x3a/0x70
>   ? drm_dp_bw_overhead+0xb4/0x110 [drm_display_helper]
>   ? asm_exc_divide_error+0x1b/0x20
>   ? drm_dp_bw_overhead+0xb4/0x110 [drm_display_helper]
>   ? drm_dp_calc_pbn_mode+0x2e/0x70 [drm_display_helper]
>   nv50_msto_atomic_check+0xda/0x120 [nouveau]
>   drm_atomic_helper_check_modeset+0xa87/0xdf0 [drm_kms_helper]
>   drm_atomic_helper_check+0x19/0xa0 [drm_kms_helper]
>   nv50_disp_atomic_check+0x13f/0x2f0 [nouveau]
>   drm_atomic_check_only+0x668/0xb20 [drm]
>   ? drm_connector_list_iter_next+0x86/0xc0 [drm]
>   drm_atomic_commit+0x58/0xd0 [drm]
>   ? __pfx___drm_printfn_info+0x10/0x10 [drm]
>   drm_atomic_connector_commit_dpms+0xd7/0x100 [drm]
>   drm_mode_obj_set_property_ioctl+0x1c5/0x450 [drm]
>   ? __pfx_drm_connector_property_set_ioctl+0x10/0x10 [drm]
>   drm_connector_property_set_ioctl+0x3b/0x60 [drm]
>   drm_ioctl_kernel+0xb9/0x120 [drm]
>   drm_ioctl+0x2d0/0x550 [drm]
>   ? __pfx_drm_connector_property_set_ioctl+0x10/0x10 [drm]
>   nouveau_drm_ioctl+0x61/0xc0 [nouveau]
>   __x64_sys_ioctl+0xa0/0xf0
>   do_syscall_64+0x76/0x140
>   ? do_syscall_64+0x85/0x140
>   ? do_syscall_64+0x85/0x140
>   entry_SYSCALL_64_after_hwframe+0x6e/0x76
>  RIP: 0033:0x7f4a1cd1a94f
>  Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 8=
9 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <41> 89 c0 =
3d 00 f0 ff ff 77 1f 48 8b 44 24 18 64 48 2b 04 25 28 00
>  RSP: 002b:00007ffd2f1df520 EFLAGS: 00000246 ORIG_RAX: 0000000000000010=

>  RAX: ffffffffffffffda RBX: 00007ffd2f1df5b0 RCX: 00007f4a1cd1a94f
>  RDX: 00007ffd2f1df5b0 RSI: 00000000c01064ab RDI: 000000000000000f
>  RBP: 00000000c01064ab R08: 000056347932deb8 R09: 000056347a7d99c0
>  R10: 0000000000000000 R11: 0000000000000246 R12: 000056347938a220
>  R13: 000000000000000f R14: 0000563479d9f3f0 R15: 0000000000000000
>   </TASK>
>  Modules linked in: rfcomm xt_conntrack nft_chain_nat xt_MASQUERADE nf_=
nat nf_conntrack_netlink nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 xfrm_=
user xfrm_algo xt_addrtype nft_compat nf_tables nfnetlink br_netfilter br=
idge stp llc ccm cmac algif_hash overlay algif_skcipher af_alg bnep binfm=
t_misc snd_sof_pci_intel_cnl snd_sof_intel_hda_common snd_soc_hdac_hda sn=
d_sof_pci snd_sof_xtensa_dsp snd_sof_intel_hda snd_sof snd_sof_utils snd_=
soc_acpi_intel_match snd_soc_acpi snd_soc_core snd_compress snd_sof_intel=
_hda_mlink snd_hda_ext_core iwlmvm intel_rapl_msr intel_rapl_common intel=
_tcc_cooling x86_pkg_temp_thermal intel_powerclamp mac80211 coretemp kvm_=
intel snd_hda_codec_hdmi kvm snd_hda_codec_realtek snd_hda_codec_generic =
uvcvideo libarc4 snd_hda_intel snd_intel_dspcfg snd_hda_codec iwlwifi vid=
eobuf2_vmalloc videobuf2_memops uvc irqbypass btusb videobuf2_v4l2 snd_se=
q_midi crct10dif_pclmul hid_multitouch crc32_pclmul snd_seq_midi_event bt=
rtl snd_hwdep videodev polyval_clmulni polyval_generic snd_rawmidi
>   ghash_clmulni_intel aesni_intel btintel crypto_simd snd_hda_core cryp=
td snd_seq btbcm ee1004 8250_dw videobuf2_common btmtk rapl nls_iso8859_1=
 mei_hdcp thunderbolt bluetooth intel_cstate wmi_bmof intel_wmi_thunderbo=
lt cfg80211 snd_pcm mc snd_seq_device i2c_i801 r8169 ecdh_generic snd_tim=
er i2c_smbus ecc snd mei_me intel_lpss_pci mei ahci intel_lpss soundcore =
realtek libahci idma64 intel_pch_thermal i2c_hid_acpi i2c_hid acpi_pad sc=
h_fq_codel msr parport_pc ppdev lp parport efi_pstore ip_tables x_tables =
autofs4 dm_crypt raid10 raid456 libcrc32c async_raid6_recov async_memcpy =
async_pq async_xor xor async_tx raid6_pq raid1 raid0 joydev input_leds hi=
d_generic usbhid hid nouveau i915 drm_ttm_helper gpu_sched drm_gpuvm drm_=
exec i2c_algo_bit drm_buddy ttm drm_display_helper drm_kms_helper cec rc_=
core drm nvme nvme_core mxm_wmi xhci_pci xhci_pci_renesas video wmi pinct=
rl_cannonlake mac_hid
>  ---[ end trace 0000000000000000 ]---
>=20
> Fix this by avoiding the divide if bpp is 0.
>=20
> Fixes: c1d6a22b7219 ("drm/dp: Add helpers to calculate the link BW over=
head")
> Signed-off-by: Chris Bainbridge <chris.bainbridge@gmail.com>
> ---
>  drivers/gpu/drm/display/drm_dp_helper.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/=
display/drm_dp_helper.c
> index b1ca3a1100da..bb8794c8f99c 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -4024,6 +4024,9 @@ int drm_dp_bw_overhead(int lane_count, int hactiv=
e,
>  							  bpp_x16, symbol_size,
>  							  is_mst);
> =20
> +	/* Avoid potential divide by zero in DIV_ROUND_UP_ULL */
> +	if (bpp_x16 =3D=3D 0)
> +		return 0;
>  	return DIV_ROUND_UP_ULL(mul_u32_u32(symbol_cycles * symbol_size * lan=
e_count,
>  					    overhead * 16),
>  				hactive * bpp_x16);

P. P.S.:

#regzbot duplicate:
https://lore.kernel.org/all/ZcfpqwnkSoiJxeT9@debian.local/
#regzbot poke
