Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 568E43B0393
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 14:03:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A375289D57;
	Tue, 22 Jun 2021 12:03:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7158B89D57;
 Tue, 22 Jun 2021 12:03:39 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1018A2197B;
 Tue, 22 Jun 2021 12:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624363418; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=b32klkIYrcgDwLjsOXNPtGfabL1pjsRWdmyLWY2If74=;
 b=YEjtGQTj7WE3EBMSt7lk4DghGAb/GNt8c9citD3R4rUWbnss5uEUL/bXUtj9pC4hRPXU6W
 T1AxziIAbFoEH3jwv6S3zcWMPAulcZrvgZjDeuLWcw7sWjsOpT86NZb1YYz3LEKKW9UnYQ
 U4f6um+e1Obyk2Vs3YJAcTuWFUfjTZ0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624363418;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=b32klkIYrcgDwLjsOXNPtGfabL1pjsRWdmyLWY2If74=;
 b=HylWSuIgqmGQDy2eO8DuV1/NBDQOEdyR6j843k1Apmzbn1i3CNjs4hk+AkODdi1yoE0A8+
 QvWMiLOl9F3GCoDw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id DCFA2118DD;
 Tue, 22 Jun 2021 12:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624363418; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=b32klkIYrcgDwLjsOXNPtGfabL1pjsRWdmyLWY2If74=;
 b=YEjtGQTj7WE3EBMSt7lk4DghGAb/GNt8c9citD3R4rUWbnss5uEUL/bXUtj9pC4hRPXU6W
 T1AxziIAbFoEH3jwv6S3zcWMPAulcZrvgZjDeuLWcw7sWjsOpT86NZb1YYz3LEKKW9UnYQ
 U4f6um+e1Obyk2Vs3YJAcTuWFUfjTZ0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624363418;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=b32klkIYrcgDwLjsOXNPtGfabL1pjsRWdmyLWY2If74=;
 b=HylWSuIgqmGQDy2eO8DuV1/NBDQOEdyR6j843k1Apmzbn1i3CNjs4hk+AkODdi1yoE0A8+
 QvWMiLOl9F3GCoDw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id 0ZPzNJnR0WCnBQAALh3uQQ
 (envelope-from <tzimmermann@suse.de>); Tue, 22 Jun 2021 12:03:37 +0000
To: Alexander Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: radeon on drm-tip: null-ptr deref in radeon_ttm_bo_destroy()
Message-ID: <f470eff7-93c9-e08d-d272-93107b36c090@suse.de>
Date: Tue, 22 Jun 2021 14:03:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="emJWzM92wfx63AUf3UW45ZT69kRTF1IyQ"
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--emJWzM92wfx63AUf3UW45ZT69kRTF1IyQ
Content-Type: multipart/mixed; boundary="nEnGtNxKX0B2HHL8XbVeM4OXS5QS5yoti";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Alexander Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Message-ID: <f470eff7-93c9-e08d-d272-93107b36c090@suse.de>
Subject: radeon on drm-tip: null-ptr deref in radeon_ttm_bo_destroy()

--nEnGtNxKX0B2HHL8XbVeM4OXS5QS5yoti
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,

on drm-tip, I see a null-ptr deref in radeon_ttm_bo_destroy(). Happens=20
when I try to start weston or X. Full error is below. Let me know if you =

need more info.

Best regards
Thomas

> [ 1849.999218] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

> [ 1850.006544] BUG: KASAN: null-ptr-deref in radeon_ttm_bo_destroy+0x39=
/0x1d0 [radeon]

> [ 1850.014312] Read of size 4 at addr 0000000000000010 by task weston/1=
434

> [ 1850.020938]=20

> [ 1850.022434] CPU: 7 PID: 1434 Comm: weston Tainted: G            E   =
  5.13.0-rc7-1-default+ #972

> [ 1850.031233] Hardware name: Dell Inc. OptiPlex 9020/0N4YC8, BIOS A24 =
10/24/2018

> [ 1850.038466] Call Trace:

> [ 1850.040920]  dump_stack+0xa5/0xdc

> [ 1850.044249]  ? radeon_ttm_bo_destroy+0x39/0x1d0 [radeon]

> [ 1850.049639]  kasan_report.cold+0x5f/0xd8

> [ 1850.053575]  ? radeon_ttm_bo_destroy+0x39/0x1d0 [radeon]

> [ 1850.058967]  radeon_ttm_bo_destroy+0x39/0x1d0 [radeon]

> [ 1850.064189]  radeon_bo_unref+0x1f/0x30 [radeon]

> [ 1850.068798]  radeon_gem_object_free+0x5f/0x80 [radeon]

> [ 1850.074016]  ? radeon_gem_object_mmap+0x70/0x70 [radeon]

> [ 1850.079404]  ? drm_gem_object_handle_put_unlocked+0xd0/0x160 [drm]

> [ 1850.085673]  ? drm_gem_object_free+0x25/0x40 [drm]

> [ 1850.090524]  drm_gem_object_release_handle+0x8e/0xa0 [drm]

> [ 1850.096070]  drm_gem_handle_delete+0x5b/0xa0 [drm]

> [ 1850.100922]  ? drm_gem_handle_create+0x50/0x50 [drm]

> [ 1850.105947]  drm_ioctl_kernel+0x131/0x180 [drm]

> [ 1850.110538]  ? drm_setversion+0x340/0x340 [drm]

> [ 1850.115135]  ? drm_gem_handle_create+0x50/0x50 [drm]

> [ 1850.120157]  drm_ioctl+0x309/0x540 [drm]

> [ 1850.124143]  ? drm_version+0x150/0x150 [drm]

> [ 1850.128470]  ? __lock_release+0x12f/0x4e0

> [ 1850.132496]  ? lock_downgrade+0xa0/0xa0

> [ 1850.136342]  ? rpm_callback+0xe0/0xe0

> [ 1850.140015]  ? mark_held_locks+0x23/0x90

> [ 1850.143951]  ? lockdep_hardirqs_on_prepare.part.0+0x128/0x1d0

> [ 1850.149708]  ? _raw_spin_unlock_irqrestore+0x37/0x40

> [ 1850.154684]  ? lockdep_hardirqs_on+0x77/0xf0

> [ 1850.158967]  ? _raw_spin_unlock_irqrestore+0x37/0x40

> [ 1850.163947]  radeon_drm_ioctl+0x75/0xd0 [radeon]

> [ 1850.168644]  __x64_sys_ioctl+0xb9/0xf0

> [ 1850.172406]  do_syscall_64+0x40/0xb0

> [ 1850.175992]  entry_SYSCALL_64_after_hwframe+0x44/0xae

> [ 1850.181053] RIP: 0033:0x7f7d5fd0c0bb

> [ 1850.184636] Code: ff ff ff 85 c0 79 8b 49 c7 c4 ff ff ff ff 5b 5d 4c=
 89 e0 41 5c c3 66 0f 1f 84 00 00 00 00 00 f3 0f 1e fa b8 10 00 00 00 0f =
05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 85 bd 0c 00 f7 d8 64 89 01 48

> [ 1850.203436] RSP: 002b:00007ffc3fb35778 EFLAGS: 00000246 ORIG_RAX: 00=
00000000000010

> [ 1850.211020] RAX: ffffffffffffffda RBX: 00007ffc3fb357c8 RCX: 00007f7=
d5fd0c0bb

> [ 1850.218171] RDX: 00007ffc3fb357c8 RSI: 0000000040086409 RDI: 0000000=
000000010

> [ 1850.225330] RBP: 0000000040086409 R08: 0000000000000000 R09: fffffff=
fffffffff

> [ 1850.232489] R10: 00007ffc3fbf4080 R11: 0000000000000246 R12: 0000556=
1d758e130

> [ 1850.239647] R13: 0000000000000010 R14: 00005561d7bda6f0 R15: 0000556=
1d7bcb250

> [ 1850.246863] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

> [ 1850.254107] Disabling lock debugging due to kernel taint

> [ 1850.259487] BUG: kernel NULL pointer dereference, address: 000000000=
0000010

> [ 1850.266458] #PF: supervisor read access in kernel mode

> [ 1850.271602] #PF: error_code(0x0000) - not-present page

> [ 1850.276746] PGD 0 P4D 0=20

> [ 1850.279283] Oops: 0000 [#1] SMP KASAN PTI

> [ 1850.283296] CPU: 7 PID: 1434 Comm: weston Tainted: G    B       E   =
  5.13.0-rc7-1-default+ #972

> [ 1850.292092] Hardware name: Dell Inc. OptiPlex 9020/0N4YC8, BIOS A24 =
10/24/2018

> [ 1850.299324] RIP: 0010:radeon_ttm_bo_destroy+0x40/0x1d0 [radeon]

> [ 1850.305323] Code: 81 c7 68 02 00 00 53 4c 8d ad 08 03 00 00 e8 47 0f=
 d6 ce 48 8b 9d 68 02 00 00 48 8d 7b 10 e8 37 0e d6 ce 48 8d bd 18 01 00 =
00 <44> 8b 7b 10 e8 27 0f d6 ce 4c 8b b5 18 01 00 00 4c 89 ef e8 18 0f

> [ 1850.324124] RSP: 0018:ffffc9000367fbf8 EFLAGS: 00010282

> [ 1850.329356] RAX: 0000000000000001 RBX: 0000000000000000 RCX: dffffc0=
000000000

> [ 1850.336499] RDX: 0000000000000007 RSI: 0000000000000004 RDI: ffff888=
18b2fd190

> [ 1850.343643] RBP: ffff88818b2fd078 R08: 0000000000000000 R09: fffffff=
f9154f743

> [ 1850.350787] R10: fffffbfff22a9ee8 R11: 0000000000000001 R12: ffff888=
18b2fd000

> [ 1850.357933] R13: ffff88818b2fd380 R14: ffff8881ecf87098 R15: ffff888=
1ecf87038

> [ 1850.365076] FS:  00007f7d5f6618c0(0000) GS:ffff8887b7e00000(0000) kn=
lGS:0000000000000000

> [ 1850.373176] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033

> [ 1850.378927] CR2: 0000000000000010 CR3: 000000024b49a002 CR4: 0000000=
0001706e0

> [ 1850.386070] Call Trace:

> [ 1850.388519]  radeon_bo_unref+0x1f/0x30 [radeon]

> [ 1850.393125]  radeon_gem_object_free+0x5f/0x80 [radeon]

> [ 1850.398338]  ? radeon_gem_object_mmap+0x70/0x70 [radeon]

> [ 1850.403724]  ? drm_gem_object_handle_put_unlocked+0xd0/0x160 [drm]

> [ 1850.409960]  ? drm_gem_object_free+0x25/0x40 [drm]

> [ 1850.414806]  drm_gem_object_release_handle+0x8e/0xa0 [drm]

> [ 1850.420346]  drm_gem_handle_delete+0x5b/0xa0 [drm]

> [ 1850.425194]  ? drm_gem_handle_create+0x50/0x50 [drm]

> [ 1850.430215]  drm_ioctl_kernel+0x131/0x180 [drm]

> [ 1850.434803]  ? drm_setversion+0x340/0x340 [drm]

> [ 1850.439386]  ? drm_gem_handle_create+0x50/0x50 [drm]

> [ 1850.444407]  drm_ioctl+0x309/0x540 [drm]

> [ 1850.448384]  ? drm_version+0x150/0x150 [drm]

> [ 1850.452708]  ? __lock_release+0x12f/0x4e0

> [ 1850.456722]  ? lock_downgrade+0xa0/0xa0

> [ 1850.460562]  ? rpm_callback+0xe0/0xe0

> [ 1850.464230]  ? mark_held_locks+0x23/0x90

> [ 1850.468155]  ? lockdep_hardirqs_on_prepare.part.0+0x128/0x1d0

> [ 1850.473910]  ? _raw_spin_unlock_irqrestore+0x37/0x40

> [ 1850.478880]  ? lockdep_hardirqs_on+0x77/0xf0

> [ 1850.483156]  ? _raw_spin_unlock_irqrestore+0x37/0x40

> [ 1850.488128]  radeon_drm_ioctl+0x75/0xd0 [radeon]

> [ 1850.492817]  __x64_sys_ioctl+0xb9/0xf0

> [ 1850.496570]  do_syscall_64+0x40/0xb0

> [ 1850.500150]  entry_SYSCALL_64_after_hwframe+0x44/0xae

> [ 1850.505209] RIP: 0033:0x7f7d5fd0c0bb

> [ 1850.508787] Code: ff ff ff 85 c0 79 8b 49 c7 c4 ff ff ff ff 5b 5d 4c=
 89 e0 41 5c c3 66 0f 1f 84 00 00 00 00 00 f3 0f 1e fa b8 10 00 00 00 0f =
05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 85 bd 0c 00 f7 d8 64 89 01 48

> [ 1850.527580] RSP: 002b:00007ffc3fb35778 EFLAGS: 00000246 ORIG_RAX: 00=
00000000000010

> [ 1850.535157] RAX: ffffffffffffffda RBX: 00007ffc3fb357c8 RCX: 00007f7=
d5fd0c0bb

> [ 1850.542299] RDX: 00007ffc3fb357c8 RSI: 0000000040086409 RDI: 0000000=
000000010

> [ 1850.549443] RBP: 0000000040086409 R08: 0000000000000000 R09: fffffff=
fffffffff

> [ 1850.556587] R10: 00007ffc3fbf4080 R11: 0000000000000246 R12: 0000556=
1d758e130

> [ 1850.563733] R13: 0000000000000010 R14: 00005561d7bda6f0 R15: 0000556=
1d7bcb250

> [ 1850.570878] Modules linked in: af_packet(E) rfkill(E) dmi_sysfs(E) i=
ntel_rapl_msr(E) snd_hda_codec_realtek(E) snd_hda_codec_generic(E) intel_=
rapl_common(E) ledtrig_audio(E) snd_hda_codec_hdmi(E) x86_pkg_temp_therma=
l(E) snd_hda_intel(E)

> [ 1850.570970]  blake2b_generic(E) libcrc32c(E) crc32c_intel(E) xor(E) =
raid6_pq(E) sg(E) dm_multipath(E) dm_mod(E) scsi_dh_rdac(E) scsi_dh_emc(E=
) scsi_dh_alua(E) msr(E) efivarfs(E)

> [ 1850.673011] CR2: 0000000000000010

> [ 1850.676355] ---[ end trace 7f92395c6274c049 ]---

> [ 1850.703761] RIP: 0010:radeon_ttm_bo_destroy+0x40/0x1d0 [radeon]

> [ 1850.709761] Code: 81 c7 68 02 00 00 53 4c 8d ad 08 03 00 00 e8 47 0f=
 d6 ce 48 8b 9d 68 02 00 00 48 8d 7b 10 e8 37 0e d6 ce 48 8d bd 18 01 00 =
00 <44> 8b 7b 10 e8 27 0f d6 ce 4c 8b b5 18 01 00 00 4c 89 ef e8 18 0f

> [ 1850.728562] RSP: 0018:ffffc9000367fbf8 EFLAGS: 00010282

> [ 1850.733800] RAX: 0000000000000001 RBX: 0000000000000000 RCX: dffffc0=
000000000

> [ 1850.740949] RDX: 0000000000000007 RSI: 0000000000000004 RDI: ffff888=
18b2fd190

> [ 1850.748095] RBP: ffff88818b2fd078 R08: 0000000000000000 R09: fffffff=
f9154f743

> [ 1850.755242] R10: fffffbfff22a9ee8 R11: 0000000000000001 R12: ffff888=
18b2fd000

> [ 1850.762388] R13: ffff88818b2fd380 R14: ffff8881ecf87098 R15: ffff888=
1ecf87038

> [ 1850.769533] FS:  00007f7d5f6618c0(0000) GS:ffff8887b7e00000(0000) kn=
lGS:0000000000000000

> [ 1850.777634] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033

> [ 1850.783391] CR2: 0000000000000010 CR3: 000000024b49a002 CR4: 0000000=
0001706e0

>=20

> CTRL-A Z for help | 115200 8N1 | NOR | Minicom 2.7.1 | VT102 | Online 0=
:30 | ttyUSB0                                                            =
                                                                         =
                   =20

>=20



--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--nEnGtNxKX0B2HHL8XbVeM4OXS5QS5yoti--

--emJWzM92wfx63AUf3UW45ZT69kRTF1IyQ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmDR0ZkFAwAAAAAACgkQlh/E3EQov+DW
HBAAqngpL6Y3x/E/9QEuTvZ7gRYxyNgh6/Hidjla8sd0u7Vh3kchAVGa92nZhNzzRJxds2iPObNJ
x2/zM45T28lFyW+ed0oSeJf/EtdSbSmk7tag/C518xHpZyL6yvyHBWkOIKxxKW4ErRpqKZsyXuzj
GW1w6HusiM5PlDxJZAuOejPTKtp77vNniADhbeg136RMp4x4XQXzlGbWvSl02meK8c62qBBbEbMS
udrl28TL4KsHODi118tc3L8v74/ykLCpMW3ZoFkhDJ2krgQpnvitugLs/0hw+c/bQkkKQJkvtEmT
Lqkk5zb20ojEkl1c9WE/OChELwkrNfjF9pPWh3rrIBSdCIzZt9JBb9E5S8sggHPDuNP+yhv2+sGc
sepwqpzv9yk7YpqE7oz+NMzLdChUWaC1FO4z8J1gqoTGdar0yL3cqWo+DB9qfkSNR+3UEMjmkYfs
oKpaJLorzBZRqE5l++SE+uUzB0olJ3SiB5eDgoX7BpbqfuuQ6JQizA7MCO/Cq7gmiYtIgCWEL+4h
2/pulrKy4dePh0SCY4h6ndtDfshnDfk9ySKG7pJsSXPMK4SaPLmCOZZd7zWglL7Nx60pZ1jvRhmP
7YzntaWU5nHEpoc60RSwtAUDUuGpZN4nPRd6x360FmAltLNbtbnKKHZvmdWOlfO0enT9smDPP3pm
goc=
=gABM
-----END PGP SIGNATURE-----

--emJWzM92wfx63AUf3UW45ZT69kRTF1IyQ--
