Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01BBD7ABA3E
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 21:46:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE50210E70B;
	Fri, 22 Sep 2023 19:46:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAAD110E70B
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Sep 2023 19:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695411996;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lgBGztj4sz0iW+a01m2mEydm4kdstp7gRucCor8xk/0=;
 b=NYWcogZtuTtE02Zqm7YQQGM7Kv7nx1zzG2E6EtDFb8/rcnaNrKD/MkEWtBt70xEzLhozCg
 G7kgLybhlpNkAM8fFrgEgrru793LpmymLMN6Nxd/uui/4f8nrlRkiziVU89EEHRPFgjQRv
 ODpL0qN0+0RChaZuORR5LFrxqQMAfXg=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-692-kK5gb6B7P16JxCToWUyKGQ-1; Fri, 22 Sep 2023 15:46:33 -0400
X-MC-Unique: kK5gb6B7P16JxCToWUyKGQ-1
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-77410b85b63so241968485a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Sep 2023 12:46:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695411992; x=1696016792;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QoMwPPuAg6FS1El9R19fUzuHPnwiUs1CpWpEG9b6rSI=;
 b=RwPR+r4oUmZu+ZzRaunkMcJ2Mrml1bRETj24zTieJs5hBZI+x2Q3R8S+10BCYRE1DU
 u036W629tLhz5pyqtWZvsLMFlVm5dA5d4cIbtr1upTlAdC4f9W+WUjyO556eUnbieFqt
 kc14eROBD/w+SihNYOIZo5huObq3qWeN9GVStTWnLV9FBvpkEfpeygOMoEG4m2Gh2q0h
 /eLcEzSTMd0w55DVWnJs0fx1iFfrQywpGkw9XdbpmZPdErzuHan3Y8+JqFn9czFhGJe5
 wm6g8+Q+pLrrMFJgjOS2USsLwXzVE99gWfLAxG2Xa3gfZznCsoRwD2c5P5hUPewdaCS5
 tMqw==
X-Gm-Message-State: AOJu0YyfSRrGTrHSChN21dZ5I8oAokfAfpg4oOPqhWC0Mxg/GmC6MQ4M
 8cwiMDmms0qwFQPwZbyhiYOm6RmRNiUUn2gOCWqhdvhQC26EnQqjrIvRmWDru7eURYS/6X3ZOa6
 +q4Ff2NCMf9GlKR455YH2D1tzyLPN
X-Received: by 2002:a05:620a:4629:b0:774:14bd:ecc9 with SMTP id
 br41-20020a05620a462900b0077414bdecc9mr466545qkb.23.1695411992697; 
 Fri, 22 Sep 2023 12:46:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGPwqORwpQffFB3UirGjAKv58V+TV5RxGLHhdiobRGCGjlocIp9UjXi964A9Ty4Gi/1CoI/rA==
X-Received: by 2002:a05:620a:4629:b0:774:14bd:ecc9 with SMTP id
 br41-20020a05620a462900b0077414bdecc9mr466531qkb.23.1695411992389; 
 Fri, 22 Sep 2023 12:46:32 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c6c:a300::feb? ([2600:4040:5c6c:a300::feb])
 by smtp.gmail.com with ESMTPSA id
 c26-20020a05620a11ba00b0076cb1eff83csm1658093qkk.5.2023.09.22.12.46.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Sep 2023 12:46:31 -0700 (PDT)
Message-ID: <6e0cf1239c2bbf0d6c7bf0db7747009e8c2a7869.camel@redhat.com>
Subject: Re: [PATCH] drm/mst: check connector state before dereference
From: Lyude Paul <lyude@redhat.com>
To: Fangzhi Zuo <Jerry.Zuo@amd.com>, dri-devel@lists.freedesktop.org
Date: Fri, 22 Sep 2023 15:46:31 -0400
In-Reply-To: <20230919205151.393346-1-Jerry.Zuo@amd.com>
References: <20230919205151.393346-1-Jerry.Zuo@amd.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
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
Cc: Rodrigo.Siqueira@amd.com, manasi.d.navare@intel.com,
 John Lindgren <john@jlindgren.net>, Wayne.Lin@amd.com,
 mario.limonciello@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

(sorry if there's been discussion on the gitlab about this or related issue=
s,
I've been trying to let amd folks handle more issues like this)

Warnings would be fine but - I'm pretty sure the solution to this is alread=
y
mentioned in the documentation for these functions. Explanations below

On Tue, 2023-09-19 at 16:51 -0400, Fangzhi Zuo wrote:
> We are seeing the crash in the wild that we cannot repro ourselves.
> We want to be able to gather more data and the code should never be
> allowed to crash.
>=20
> [    8.433306] BUG: kernel NULL pointer dereference, address: 00000000000=
00008
> [    8.433318] #PF: supervisor read access in kernel mode
> [    8.433323] #PF: error_code(0x0000) - not-present page
> [    8.433327] PGD 0 P4D 0
> [    8.433333] Oops: 0000 [#1] PREEMPT SMP NOPTI
> [    8.433339] CPU: 7 PID: 488 Comm: Xorg Tainted: G           OE      6.=
2.10-arch1-1-00004-g72efbf0a04ca #2 cb04c5bbf595f3de9363c870cd584da0b91be45=
8
> [    8.433348] Hardware name: HP HP ProBook 445 G6/85D9, BIOS R80 Ver. 01=
.21.01 07/28/2022
> [    8.433351] RIP: 0010:drm_dp_atomic_find_time_slots+0x5e/0x260 [drm_di=
splay_helper]
> [    8.433387] Code: 01 00 00 48 8b 85 60 05 00 00 48 63 80 88 00 00 00 3=
b 43 28 0f 8d 2e 01 00 00 48 8b 53 30 48 8d 04 80 48 8d 04 c2 48 8b 40 18 <=
48> 8b 40 08 4d 8d 65 38 8b 88 90 00 00 00 b8 01 00 00 00 d3 e0 41
> [    8.433392] RSP: 0018:ffffb7b540ee36b0 EFLAGS: 00010293
> [    8.433397] RAX: 0000000000000000 RBX: ffff90d6064ae780 RCX: 000000000=
0000224
> [    8.433401] RDX: ffff90d6069e0400 RSI: ffff90d60c496568 RDI: ffff90d60=
64ae780
> [    8.433405] RBP: ffff90d60c483000 R08: 0000000000000407 R09: ffff90d60=
8c8e850
> [    8.433408] R10: 0000000000000002 R11: 0000000000000000 R12: ffffb7b54=
0ee3798
> [    8.433411] R13: ffff90d607ab9660 R14: ffff90d60c496568 R15: 000000000=
0000224
> [    8.433415] FS:  00007fead406e440(0000) GS:ffff90d9201c0000(0000) knlG=
S:0000000000000000
> [    8.433419] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    8.433423] CR2: 0000000000000008 CR3: 0000000102f96000 CR4: 000000000=
03506e0
> [    8.433427] Call Trace:
> [    8.433431]  <TASK>
> [    8.433437]  compute_mst_dsc_configs_for_link+0x31a/0xab0 [amdgpu b041=
282416fbbcc9f3f3583485c4c54bacfbbcf9]
> [    8.434321]  ? get_page_from_freelist+0x14a5/0x1630
> [    8.434338]  compute_mst_dsc_configs_for_state+0x1e1/0x250 [amdgpu b04=
1282416fbbcc9f3f3583485c4c54bacfbbcf9]

This is misuse of the drm_dp_atomic_release_time_slots() function - the doc=
s
specifically mention it should be called from the
drm_connector_helper_funcs.atomic_check() callback - which would ensure tha=
t
this function can't get called in any atomic check that doesn't already hav=
e
the connector state.

/**
 * drm_dp_atomic_release_time_slots() - Release allocated time slots
 * @state: global atomic state
 * @mgr: MST topology manager for the port
 * @port: The port to release the time slots from
 *
 * Releases any time slots that have been allocated to a port in the atomic
 * state. Any atomic drivers which support MST must call this function
 * unconditionally in their &drm_connector_helper_funcs.atomic_check() call=
back.
 * This helper will check whether time slots would be released by the new s=
tate and
 * respond accordingly, along with ensuring the MST state is always added t=
o the
 * atomic state whenever a new state would modify the state of payloads on =
the
 * topology.
 *
 * It is OK to call this even if @port has been removed from the system.
 * Additionally, it is OK to call this function multiple times on the same
 * @port as needed. It is not OK however, to call this function and
 * drm_dp_atomic_find_time_slots() on the same @port in a single atomic che=
ck
 * phase.
 *
 * See also:
 * drm_dp_atomic_find_time_slots()
 * drm_dp_mst_atomic_check()
 *
 * Returns:
 * 0 on success, negative error code otherwise
 */
=09
could you please fix that issue in amdgpu first and then re-evaluate things=
?

> [    8.435205]  amdgpu_dm_atomic_check+0xf33/0x11b0 [amdgpu b041282416fbb=
cc9f3f3583485c4c54bacfbbcf9]
> [    8.435985]  drm_atomic_check_only+0x5c0/0xa30
> [    8.435994]  drm_atomic_commit+0x5a/0xd0
> [    8.436001]  ? __pfx___drm_printfn_info+0x10/0x10
> [    8.436008]  drm_atomic_helper_set_config+0x74/0xb0
> [    8.436014]  drm_mode_setcrtc+0x515/0x7e0
> [    8.436023]  ? __pfx_drm_mode_setcrtc+0x10/0x10
> [    8.436029]  drm_ioctl_kernel+0xcd/0x170
> [    8.436036]  drm_ioctl+0x233/0x410
> [    8.436040]  ? __pfx_drm_mode_setcrtc+0x10/0x10
> [    8.436049]  amdgpu_drm_ioctl+0x4e/0x90 [amdgpu b041282416fbbcc9f3f358=
3485c4c54bacfbbcf9]
> [    8.436755]  __x64_sys_ioctl+0x94/0xd0
> [    8.436763]  do_syscall_64+0x5f/0x90
> [    8.436772]  ? amdgpu_drm_ioctl+0x71/0x90 [amdgpu b041282416fbbcc9f3f3=
583485c4c54bacfbbcf9]
> [    8.437477]  ? __x64_sys_ioctl+0xac/0xd0
> [    8.437484]  ? syscall_exit_to_user_mode+0x1b/0x40
> [    8.437492]  ? do_syscall_64+0x6b/0x90
> [    8.437499]  ? amdgpu_drm_ioctl+0x71/0x90 [amdgpu b041282416fbbcc9f3f3=
583485c4c54bacfbbcf9]
> [    8.438193]  ? __x64_sys_ioctl+0xac/0xd0
> [    8.438199]  ? syscall_exit_to_user_mode+0x1b/0x40
> [    8.438205]  ? do_syscall_64+0x6b/0x90
> [    8.438211]  ? syscall_exit_to_user_mode+0x1b/0x40
> [    8.438217]  ? do_syscall_64+0x6b/0x90
> [    8.438223]  entry_SYSCALL_64_after_hwframe+0x72/0xdc
> [    8.438231] RIP: 0033:0x7fead4a3f53f
> [    8.438258] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 0=
0 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <=
89> c2 3d 00 f0 ff ff 77 18 48 8b 44 24 18 64 48 2b 04 25 28 00 00
> [    8.438262] RSP: 002b:00007ffd20e26be0 EFLAGS: 00000246 ORIG_RAX: 0000=
000000000010
> [    8.438268] RAX: ffffffffffffffda RBX: 0000564cc75abfa0 RCX: 00007fead=
4a3f53f
> [    8.438271] RDX: 00007ffd20e26c70 RSI: 00000000c06864a2 RDI: 000000000=
000000f
> [    8.438273] RBP: 00007ffd20e26c70 R08: 0000000000000000 R09: 0000564cc=
75dec90
> [    8.438276] R10: 0000000000000000 R11: 0000000000000246 R12: 00000000c=
06864a2
> [    8.438278] R13: 000000000000000f R14: 0000564cc6cb7f00 R15: 0000564cc=
6ab4620
> [    8.438286]  </TASK>
> [    8.438288] Modules linked in: cmac algif_hash algif_skcipher af_alg b=
nep rtw88_8822be snd_hda_codec_realtek intel_rapl_msr intel_rapl_common rtw=
88_8822b snd_hda_codec_generic edac_mce_amd ledtrig_audio snd_hda_codec_hdm=
i rtw88_pci kvm_amd rtw88_core snd_hda_intel kvm snd_intel_dspcfg mac80211 =
nls_iso8859_1 snd_intel_sdw_acpi uvcvideo btusb vfat snd_hda_codec irqbypas=
s fat btrtl videobuf2_vmalloc crct10dif_pclmul crc32_pclmul videobuf2_memop=
s polyval_clmulni btbcm libarc4 snd_hda_core videobuf2_v4l2 polyval_generic=
 btintel gf128mul snd_hwdep btmtk ghash_clmulni_intel hid_multitouch sha512=
_ssse3 videodev r8169 snd_pcm cfg80211 bluetooth aesni_intel ucsi_acpi real=
tek typec_ucsi hp_wmi videobuf2_common crypto_simd mdio_devres sparse_keyma=
p snd_timer sp5100_tco cryptd typec mc ecdh_generic mousedev joydev rapl pl=
atform_profile snd psmouse rfkill k10temp wmi_bmof i2c_piix4 soundcore libp=
hy ccp roles hp_accel lis3lv02d i2c_hid_acpi i2c_amd_mp2_plat i2c_hid wirel=
ess_hotkey i2c_amd_mp2_pci
> [    8.438385]  acpi_cpufreq mac_hid vboxnetflt(OE) vboxnetadp(OE) vboxdr=
v(OE) sg crypto_user dm_mod fuse loop bpf_preload ip_tables x_tables ext4 c=
rc32c_generic crc16 mbcache jbd2 hid_logitech_hidpp hid_logitech_dj usbhid =
amdgpu rtsx_pci_sdmmc drm_ttm_helper serio_raw atkbd ttm mmc_core libps2 dr=
m_buddy vivaldi_fmap gpu_sched crc32c_intel xhci_pci drm_display_helper i80=
42 xhci_pci_renesas rtsx_pci cec video serio wmi
> [    8.438436] CR2: 0000000000000008
> [    8.438440] ---[ end trace 0000000000000000 ]---
> [    8.438443] RIP: 0010:drm_dp_atomic_find_time_slots+0x5e/0x260 [drm_di=
splay_helper]
> [    8.438470] Code: 01 00 00 48 8b 85 60 05 00 00 48 63 80 88 00 00 00 3=
b 43 28 0f 8d 2e 01 00 00 48 8b 53 30 48 8d 04 80 48 8d 04 c2 48 8b 40 18 <=
48> 8b 40 08 4d 8d 65 38 8b 88 90 00 00 00 b8 01 00 00 00 d3 e0 41
> [    8.438473] RSP: 0018:ffffb7b540ee36b0 EFLAGS: 00010293
> [    8.438477] RAX: 0000000000000000 RBX: ffff90d6064ae780 RCX: 000000000=
0000224
> [    8.438480] RDX: ffff90d6069e0400 RSI: ffff90d60c496568 RDI: ffff90d60=
64ae780
> [    8.438482] RBP: ffff90d60c483000 R08: 0000000000000407 R09: ffff90d60=
8c8e850
> [    8.438485] R10: 0000000000000002 R11: 0000000000000000 R12: ffffb7b54=
0ee3798
> [    8.438487] R13: ffff90d607ab9660 R14: ffff90d60c496568 R15: 000000000=
0000224
> [    8.438490] FS:  00007fead406e440(0000) GS:ffff90d9201c0000(0000) knlG=
S:0000000000000000
> [    8.438493] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    8.438496] CR2: 0000000000000008 CR3: 0000000102f96000 CR4: 000000000=
03506e0
>=20
> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2314#note_2080187
> Suggested-by: John Lindgren <john@jlindgren.net>
> Signed-off-by: Fangzhi Zuo <Jerry.Zuo@amd.com>
> ---
>  drivers/gpu/drm/display/drm_dp_mst_topology.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/=
drm/display/drm_dp_mst_topology.c
> index c490e8befc2f..995bf34154ec 100644
> --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> @@ -4314,7 +4314,9 @@ int drm_dp_atomic_find_time_slots(struct drm_atomic=
_state *state,
>  =09=09return PTR_ERR(topology_state);
> =20
>  =09conn_state =3D drm_atomic_get_new_connector_state(state, port->connec=
tor);
> -=09topology_state->pending_crtc_mask |=3D drm_crtc_mask(conn_state->crtc=
);
> +=09WARN_ON(!conn_state);
> +=09if (conn_state)
> +=09=09topology_state->pending_crtc_mask |=3D drm_crtc_mask(conn_state->c=
rtc);
> =20
>  =09/* Find the current allocation for this port, if any */
>  =09payload =3D drm_atomic_get_mst_payload_state(topology_state, port);
> @@ -4400,12 +4402,14 @@ int drm_dp_atomic_release_time_slots(struct drm_a=
tomic_state *state,
>  =09bool update_payload =3D true;
> =20
>  =09old_conn_state =3D drm_atomic_get_old_connector_state(state, port->co=
nnector);
> -=09if (!old_conn_state->crtc)
> +=09WARN_ON(!old_conn_state);

> +=09if (!old_conn_state || !old_conn_state->crtc)
>  =09=09return 0;
> =20
>  =09/* If the CRTC isn't disabled by this state, don't release it's paylo=
ad */
>  =09new_conn_state =3D drm_atomic_get_new_connector_state(state, port->co=
nnector);
> -=09if (new_conn_state->crtc) {
> +=09WARN_ON(!new_conn_state);
> +=09if (new_conn_state && new_conn_state->crtc) {
>  =09=09struct drm_crtc_state *crtc_state =3D
>  =09=09=09drm_atomic_get_new_crtc_state(state, new_conn_state->crtc);
> =20
> @@ -4432,7 +4436,7 @@ int drm_dp_atomic_release_time_slots(struct drm_ato=
mic_state *state,
>  =09=09return -EINVAL;
>  =09}
> =20
> -=09if (new_conn_state->crtc)
> +=09if (new_conn_state && new_conn_state->crtc)
>  =09=09return 0;
> =20
>  =09drm_dbg_atomic(mgr->dev, "[MST PORT:%p] TU %d -> 0\n", port, payload-=
>time_slots);

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

