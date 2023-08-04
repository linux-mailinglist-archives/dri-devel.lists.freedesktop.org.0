Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E98770C3A
	for <lists+dri-devel@lfdr.de>; Sat,  5 Aug 2023 01:10:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81BE510E146;
	Fri,  4 Aug 2023 23:09:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C68B10E141
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 23:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691190592;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rGCnB3fJiFhED+4NmrRDcI4D3P863dc+KOY1iErYZgo=;
 b=F3RfCxdIyo/3LZ1QrBUer7tuYDE9f5sjjBfxHZ6PPCyqDaVst7ziWrVG09FBRfEVb2PX/B
 40vYvCpaaBKa0EiMpnY7n0MBmkOHKG7idgnrMgtmo033DjgOpPaDqSaSCHxKl2n3pyxbie
 UKxXro3JRMwq4qEDLvTsvjT+qV/c6tg=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-529-4BWzHVNmOQCckC_m7qJi_A-1; Fri, 04 Aug 2023 19:09:51 -0400
X-MC-Unique: 4BWzHVNmOQCckC_m7qJi_A-1
Received: by mail-lj1-f199.google.com with SMTP id
 38308e7fff4ca-2b04d5ed394so4295871fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Aug 2023 16:09:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691190590; x=1691795390;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rGCnB3fJiFhED+4NmrRDcI4D3P863dc+KOY1iErYZgo=;
 b=AOVkFlNeaecAc5VUdLlrbu8ceUEYnReez9WEoTjZ3VEoHACzKHkQZEWA5WeJ6aacj6
 oYsAQoU29r6YMrhwfOw2Zbk3Bh1KJ5gMcsdoorOphrplkz1l5rozz/Nt2y63RpaJmzHS
 QZMNZ836uL1HUAnROD8E/R7H2IZnvpnW2ti3uI2SbweWvykelIibbzwUOmwhOA60bwyB
 myvuZljP2CVUIzVxJ7DJXOvpRWGozqc3JGn8LcxFUF/ue8pvEgDdbxMQS5ZXmMjLBkVp
 Fje3MQgbdA7b3r0p+ScTEKZOYTRl9dU97mAlABpnrkjn7I3QJO7NmRqMkCCgCAQ0nA53
 YdrQ==
X-Gm-Message-State: ABy/qLYE/YsSgTj5kkDLanoUuBiR9LcmqiUMRDEdYNH8B6yRQovxgaSh
 yHcuzCF1eoctAXDYKS8GvvtcK+zr+EpPIKwzTNPmaO0QeCtKQLqamP5IgXb5/Vi5emcajsfrWCb
 q65IcR5/zrkOenIEqFiinWkweZQSlul4iUbqMllt/5CU7
X-Received: by 2002:a2e:bc84:0:b0:2b9:a156:6239 with SMTP id
 h4-20020a2ebc84000000b002b9a1566239mr13238004ljf.1.1691190590116; 
 Fri, 04 Aug 2023 16:09:50 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHgKpvsw++h/1/U4MD4NAKlDRdCgpsinNaKCo62Wk9tbcmL7YBD3v7x4v6+EDuDTCwUK2Ub1EkbIZavXxH3PrA=
X-Received: by 2002:a2e:bc84:0:b0:2b9:a156:6239 with SMTP id
 h4-20020a2ebc84000000b002b9a1566239mr13237989ljf.1.1691190589643; Fri, 04 Aug
 2023 16:09:49 -0700 (PDT)
MIME-Version: 1.0
References: <20be6650-5db3-b72a-a7a8-5e817113cff5@kravcenko.com>
 <c27fb4dd-b2dc-22de-4425-6c7db5f543ba@leemhuis.info>
 <CACO55ttcUEUjdVgx4y7pv26VAGeHS5q1wVKWrMw5=o9QLaJLZw@mail.gmail.com>
 <977ac5b0-4ab8-7782-10e1-b4bee6b58030@kravcenko.com>
In-Reply-To: <977ac5b0-4ab8-7782-10e1-b4bee6b58030@kravcenko.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Sat, 5 Aug 2023 01:09:38 +0200
Message-ID: <CACO55tvq=GoPJZxouiTT0tty9A0fEeyS1uGjWLHjfJgq=VA4ug@mail.gmail.com>
Subject: Re: nouveau bug in linux/6.1.38-2
To: Olaf Skibbe <news@kravcenko.com>
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
Cc: Linux kernel regressions list <regressions@lists.linux.dev>,
 nouveau@lists.freedesktop.org, 1042753@bugs.debian.org,
 dri-devel@lists.freedesktop.org, Thorsten Leemhuis <regressions@leemhuis.info>,
 Ben Skeggs <bskeggs@redhat.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 4, 2023 at 8:10=E2=80=AFPM Olaf Skibbe <news@kravcenko.com> wro=
te:
>
> Dear all,
>
> On Fri, 4 Aug 2023 at 14:15, Karol Herbst wrote:
>
> >>> 62aecf23f3d1 drm/nouveau: add nv_encoder pointer check for NULL
> >>> fb725beca62d drm/nouveau/dp: check for NULL nv_connector->native_mode
> >>> 90748be0f4f3 drm/nouveau: don't detect DSM for non-NVIDIA device
> >>> 5a144bad3e75 nouveau: fix client work fence deletion race
> >
> > mind retrying with only fb725beca62d and 62aecf23f3d1 reverted? Would
> > be weird if the other two commits are causing it. If that's the case,
> > it's a bit worrying that reverting either of the those causes issues,
> > but maybe there is a good reason for it. Anyway, mind figuring out
> > which of the two you need reverted to fix your issue? Thanks!
>
> The result is:
>
> Patch with commit fb725beca62d reverted: Graphics works. I attached the
> respective patch again to this mail.
>

Mind checking if instead of reverting the entire commit that this is
enough to fix it as well?

https://gitlab.freedesktop.org/karolherbst/nouveau/-/commit/f99ae069876f7ff=
eb6368da0381485e8c3adda43.patch


> Patch with commit 62aecf23f3d1 reverted: Screen remains black, error
> message:
>
> # dmesg | grep -A 36 "cut here"
> [    2.921358] ------------[ cut here ]------------
> [    2.921361] WARNING: CPU: 1 PID: 176 at drivers/gpu/drm/nouveau/nvkm/e=
ngine/disp/dp.c:460 nvkm_dp_acquire+0x26a/0x490 [nouveau]
> [    2.921627] Modules linked in: sd_mod(E) t10_pi(E) crc64_rocksoft(E) s=
r_mod(E) crc64(E) crc_t10dif(E) crct10dif_generic(E) cdrom(E) nouveau(E+) m=
xm_wmi(E) i2c_algo_bit(E) drm_display_helper(E) cec(E) ahci(E) rc_core(E) d=
rm_ttm_helper(E) libahci(E) ttm(E) ehci_pci(E) crct10dif_pclmul(E) crct10di=
f_common(E) ehci_hcd(E) drm_kms_helper(E) crc32_pclmul(E) firewire_ohci(E) =
sdhci_pci(E) cqhci(E) libata(E) e1000e(E) sdhci(E) psmouse(E) crc32c_intel(=
E) lpc_ich(E) ptp(E) i2c_i801(E) scsi_mod(E) i2c_smbus(E) firewire_core(E) =
scsi_common(E) usbcore(E) crc_itu_t(E) mmc_core(E) drm(E) pps_core(E) usb_c=
ommon(E) battery(E) video(E) wmi(E) button(E)
> [    2.921695] CPU: 1 PID: 176 Comm: kworker/u16:5 Tainted: G            =
E      6.1.0-0.a.test-amd64 #1  Debian 6.1.38-2a~test
> [    2.921701] Hardware name: Dell Inc. Latitude E6510/0N5KHN, BIOS A17 0=
5/12/2017
> [    2.921705] Workqueue: nvkm-disp nv50_disp_super [nouveau]
> [    2.921948] RIP: 0010:nvkm_dp_acquire+0x26a/0x490 [nouveau]
> [    2.922192] Code: 48 8b 44 24 58 65 48 2b 04 25 28 00 00 00 0f 85 37 0=
2 00 00 48 83 c4 60 44 89 e0 5b 5d 41 5c 41 5d 41 5e 41 5f c3 cc cc cc cc <=
0f> 0b c1 e8 03 41 88 6d 62 44 89 fe 48 89 df 48 69 c0 cf 0d d6 26
> [    2.922196] RSP: 0018:ffffc077c04dfd60 EFLAGS: 00010246
> [    2.922201] RAX: 0000000000041eb0 RBX: ffff9a8482624c00 RCX: 000000000=
0041eb0
> [    2.922204] RDX: ffffffffc0b47760 RSI: 0000000000000000 RDI: ffffc077c=
04dfcf0
> [    2.922206] RBP: 0000000000000001 R08: ffffc077c04dfc64 R09: 000000000=
0005b76
> [    2.922209] R10: 000000000000000d R11: ffffc077c04dfde0 R12: 00000000f=
fffffea
> [    2.922212] R13: ffff9a8517541e00 R14: 0000000000044d45 R15: 000000000=
0000000
> [    2.922215] FS:  0000000000000000(0000) GS:ffff9a85a3c40000(0000) knlG=
S:0000000000000000
> [    2.922219] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    2.922222] CR2: 000055f660bcb3a8 CR3: 0000000197610000 CR4: 000000000=
00006e0
> [    2.922226] Call Trace:
> [    2.922231]  <TASK>
> [    2.922235]  ? __warn+0x7d/0xc0
> [    2.922244]  ? nvkm_dp_acquire+0x26a/0x490 [nouveau]
> [    2.922487]  ? report_bug+0xe6/0x170
> [    2.922494]  ? handle_bug+0x41/0x70
> [    2.922501]  ? exc_invalid_op+0x13/0x60
> [    2.922505]  ? asm_exc_invalid_op+0x16/0x20
> [    2.922512]  ? init_reset_begun+0x20/0x20 [nouveau]
> [    2.922708]  ? nvkm_dp_acquire+0x26a/0x490 [nouveau]
> [    2.922954]  nv50_disp_super_2_2+0x70/0x430 [nouveau]
> [    2.923200]  nv50_disp_super+0x113/0x210 [nouveau]
> [    2.923445]  process_one_work+0x1c7/0x380
> [    2.923456]  worker_thread+0x4d/0x380
> [    2.923463]  ? rescuer_thread+0x3a0/0x3a0
> [    2.923469]  kthread+0xe9/0x110
> [    2.923476]  ? kthread_complete_and_exit+0x20/0x20
> [    2.923482]  ret_from_fork+0x22/0x30
> [    2.923493]  </TASK>
> [    2.923494] ---[ end trace 0000000000000000 ]---
>
> (Maybe it's worth to mention that the LED back-light is on, while the
> screen appears black.)
>
> Cheers,
> Olaf
>
> P.S.: By the way: as a linux user for more than 20 years, I am very
> pleased to have the opportunity to contribute at least a little bit to
> the improvement. I'd like to use the chance to thank you all very much
> for building and developing this great operating system.

