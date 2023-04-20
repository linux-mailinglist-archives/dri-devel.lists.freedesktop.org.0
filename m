Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C746E9CD3
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 22:07:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B65C10E2EA;
	Thu, 20 Apr 2023 20:07:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AD3510E2EA
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 20:07:14 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id
 3f1490d57ef6-b9268714fdfso1134360276.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 13:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682021233; x=1684613233;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IACsV0gExguY8/2Pgj3Sb0dr0rjM7AsQYNMIn+w1H04=;
 b=JwBcNTcm+7BtgOFwLpG07k4XFC+bEC41BxlSGvxtDbN6/OPtNdDkwLToCcd0XkOgn0
 slHxjReThBC3v6v4G67EF7bL5zEgMbhOeCeR2/eZbl2TvrTvET+RvacHEihxFeDsp0fL
 jR0I7AiJSbeYA6Gg7SYTL8lnRz2jTCebPar3ktVOJOYrAcIfPnblTL9DOZCh0laECDlB
 sFAJAx214QST22uqUT1617en+lvdz2bgHyQJHIgFGIoj6v8b1HefQd6sMst8yU6JqJF+
 YhqnEXFKWNKGypSs3lq0AaPJOZPVb12VpCNi0/EMbsQwKOyFe67KjbmifEPFRmtc+bp7
 y7vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682021233; x=1684613233;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IACsV0gExguY8/2Pgj3Sb0dr0rjM7AsQYNMIn+w1H04=;
 b=HlbOU1BhSgJRXbeqt0fLx7woyJErWz+1LObc8wE9v4Bg/89DpvWt5ydqHiQmGwsoFo
 6/Tqd5IlyrC9y2G/Ucjx0wOcCFVn3xBDfFyEg/+TYU/5QyJcCM0T4hYXcQyEASpXLMCI
 CKqbLTn7i41qo72aAB15nPzsj7+eR9Km6aa6EpkhfH6TKdeZeqzbSm9S34FuPe2ksBCU
 kV4aCoIeWTvftksIHZOPlRh+clt1pSbbdvXavhwY8naqkLwXoyeS+WBDjbU3Zr2jdVsH
 R97tWYjrKHGbLV7TtctJ+cu6aZzqNCHuYzYBME+v4SGuJvN5I3pI6KfiianlgWFBMolV
 yHnw==
X-Gm-Message-State: AAQBX9fbwY39pbhBr/svtSYsLmTU8AiHqHS00B0e+OkowPPmSpbNPNTy
 AQlyBI8LIwXplTD4hg327fX/fdUCwdYZKafQVLEisA==
X-Google-Smtp-Source: AKy350bId68KPX8WnQ0ACIaWkUt4S/ZlHcBBGxSomhg9MfKRSYQ/EwwK8HzwMzIOsWSORu7B1EnJazR/ZuGp1pdifGA=
X-Received: by 2002:a81:ed5:0:b0:54f:6f2e:b3f5 with SMTP id
 204-20020a810ed5000000b0054f6f2eb3f5mr122533ywo.13.1682021232326; Thu, 20 Apr
 2023 13:07:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230328023129.3596968-1-zhouzongmin@kylinos.cn>
 <20230420200148.GD3280@jannau.net>
In-Reply-To: <20230420200148.GD3280@jannau.net>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 20 Apr 2023 23:07:01 +0300
Message-ID: <CAA8EJpoK3yv3E==bJuDoQhsW2Q1LdqKakJgdZx6S=ec-CvyGyw@mail.gmail.com>
Subject: Re: [PATCH] drm/probe_helper: fix the warning reported when calling
 drm_kms_helper_poll_disable during suspend
To: Janne Grunau <j@jannau.net>
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
Cc: neil.armstrong@linaro.org, tony.luck@intel.com, tzimmermann@suse.de,
 linux-kernel@vger.kernel.org, Zongmin Zhou <zhouzongmin@kylinos.cn>,
 gpiccoli@igalia.com, linux-hardening@vger.kernel.org,
 dri-devel@lists.freedesktop.org, laurentiu.palcu@oss.nxp.com,
 keescook@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 20 Apr 2023 at 23:01, Janne Grunau <j@jannau.net> wrote:
>
> On 2023-03-28 10:31:29 +0800, Zongmin Zhou wrote:
> > When drivers call drm_kms_helper_poll_disable from
> > their device suspend implementation without enabled output polling befo=
re,
> > following warning will be reported,due to work->func not be initialized=
:
>
> we see the same warning with the wpork in progress kms driver for apple
> silicon SoCs. The connectors do not need to polled so the driver never
> calls drm_kms_helper_poll_init().
>
> > [   55.141361] WARNING: CPU: 3 PID: 372 at kernel/workqueue.c:3066 __fl=
ush_work+0x22f/0x240
> > [   55.141382] Modules linked in: nls_iso8859_1 snd_hda_codec_generic l=
edtrig_audio snd_hda_intel snd_intel_dspcfg snd_intel_sdw_acpi snd_hda_code=
c snd_hda_core snd_hwdep snd_pcm snd_seq_midi snd_seq_midi_event snd_rawmid=
i snd_seq intel_rapl_msr intel_rapl_common bochs drm_vram_helper drm_ttm_he=
lper snd_seq_device nfit ttm crct10dif_pclmul snd_timer ghash_clmulni_intel=
 binfmt_misc sha512_ssse3 aesni_intel drm_kms_helper joydev input_leds sysc=
opyarea crypto_simd snd cryptd sysfillrect sysimgblt mac_hid serio_raw soun=
dcore qemu_fw_cfg sch_fq_codel msr parport_pc ppdev lp parport drm ramoops =
reed_solomon pstore_blk pstore_zone efi_pstore virtio_rng ip_tables x_table=
s autofs4 hid_generic usbhid hid ahci virtio_net i2c_i801 crc32_pclmul psmo=
use virtio_scsi libahci i2c_smbus lpc_ich xhci_pci net_failover virtio_blk =
xhci_pci_renesas failover
> > [   55.141430] CPU: 3 PID: 372 Comm: kworker/u16:9 Not tainted 6.2.0-rc=
6+ #16
> > [   55.141433] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS=
 rel-1.12.1-0-ga5cab58e9a3f-prebuilt.qemu.org 04/01/2014
> > [   55.141435] Workqueue: events_unbound async_run_entry_fn
> > [   55.141441] RIP: 0010:__flush_work+0x22f/0x240
> > [   55.141444] Code: 8b 43 28 48 8b 53 30 89 c1 e9 f9 fe ff ff 4c 89 f7=
 e8 b5 95 d9 00 e8 00 53 08 00 45 31 ff e9 11 ff ff ff 0f 0b e9 0a ff ff ff=
 <0f> 0b 45 31 ff e9 00 ff ff ff e8 e2 54 d8 00 66 90 90 90 90 90 90
> > [   55.141446] RSP: 0018:ff59221940833c18 EFLAGS: 00010246
> > [   55.141449] RAX: 0000000000000000 RBX: 0000000000000000 RCX: fffffff=
f9b72bcbe
> > [   55.141450] RDX: 0000000000000001 RSI: 0000000000000001 RDI: ff3ea01=
e4265e330
> > [   55.141451] RBP: ff59221940833c90 R08: 0000000000000000 R09: 8080808=
080808080
> > [   55.141453] R10: ff3ea01e42b3caf4 R11: 000000000000000f R12: ff3ea01=
e4265e330
> > [   55.141454] R13: 0000000000000001 R14: ff3ea01e505e5e80 R15: 0000000=
000000001
> > [   55.141455] FS:  0000000000000000(0000) GS:ff3ea01fb7cc0000(0000) kn=
lGS:0000000000000000
> > [   55.141456] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [   55.141458] CR2: 0000563543ad1546 CR3: 000000010ee82005 CR4: 0000000=
000771ee0
> > [   55.141464] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000=
000000000
> > [   55.141465] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000=
000000400
> > [   55.141466] PKRU: 55555554
> > [   55.141467] Call Trace:
> > [   55.141469]  <TASK>
> > [   55.141472]  ? pcie_wait_cmd+0xdf/0x220
> > [   55.141478]  ? mptcp_seq_show+0xe0/0x180
> > [   55.141484]  __cancel_work_timer+0x124/0x1b0
> > [   55.141487]  cancel_delayed_work_sync+0x17/0x20
> > [   55.141490]  drm_kms_helper_poll_disable+0x26/0x40 [drm_kms_helper]
> > [   55.141516]  drm_mode_config_helper_suspend+0x25/0x90 [drm_kms_helpe=
r]
> > [   55.141531]  ? __pm_runtime_resume+0x64/0x90
> > [   55.141536]  bochs_pm_suspend+0x16/0x20 [bochs]
> > [   55.141540]  pci_pm_suspend+0x8b/0x1b0
> > [   55.141545]  ? __pfx_pci_pm_suspend+0x10/0x10
> > [   55.141547]  dpm_run_callback+0x4c/0x160
> > [   55.141550]  __device_suspend+0x14c/0x4c0
> > [   55.141553]  async_suspend+0x24/0xa0
> > [   55.141555]  async_run_entry_fn+0x34/0x120
> > [   55.141557]  process_one_work+0x21a/0x3f0
> > [   55.141560]  worker_thread+0x4e/0x3c0
> > [   55.141563]  ? __pfx_worker_thread+0x10/0x10
> > [   55.141565]  kthread+0xf2/0x120
> > [   55.141568]  ? __pfx_kthread+0x10/0x10
> > [   55.141570]  ret_from_fork+0x29/0x50
> > [   55.141575]  </TASK>
> > [   55.141575] ---[ end trace 0000000000000000 ]---
> >
> > Fixes: a4e771729a51 ("drm/probe_helper: sort out poll_running vs poll_e=
nabled")
> > Signed-off-by: Zongmin Zhou<zhouzongmin@kylinos.cn>
> > ---
> >  drivers/gpu/drm/drm_probe_helper.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_p=
robe_helper.c
> > index 8127be134c39..ac72b18e2257 100644
> > --- a/drivers/gpu/drm/drm_probe_helper.c
> > +++ b/drivers/gpu/drm/drm_probe_helper.c
> > @@ -855,7 +855,8 @@ void drm_kms_helper_poll_disable(struct drm_device =
*dev)
> >       if (dev->mode_config.poll_running)
> >               drm_kms_helper_disable_hpd(dev);
> >
> > -     cancel_delayed_work_sync(&dev->mode_config.output_poll_work);
> > +     if (dev->mode_config.poll_enabled)
> > +             cancel_delayed_work_sync(&dev->mode_config.output_poll_wo=
rk);
>
> Checking for dev->mode_config.poll_enabled at the start of the function
> and return early if it is not true looks more in style with the rest of
> drm_probe_helper.c.

I think it is an error to call drm_kms_helper_poll_disable() if
polling was not initialized. So, in my opinion the fix should go to
the drm_mode_config_helper_suspend() / _resume() instead. Please add a
guard there using dev->mode_config.poll_enabled.


> No difference functionally of course. Tested with the apple kms driver.
>
> Reviewed-by: Janne Grunau <j@jannau.net>
>
> ciao
> Janne



--=20
With best wishes
Dmitry
