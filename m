Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7C26D4F8A
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 19:51:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BE3610E00A;
	Mon,  3 Apr 2023 17:50:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAF8A10E00A
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Apr 2023 17:50:54 +0000 (UTC)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-17786581fe1so31640610fac.10
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Apr 2023 10:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680544253;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8RHAwAS5sJDxIzhA3f2qW4W6/P4D/N6yDGJtxJ46p5g=;
 b=AV5GuUIGOiGGG0p8pCT62rVfnsr/wU8LAIGVHyyYU1jBwbYCRppaYyolYu6VfJkrs/
 7adEk3gH0kyV84icCqCzT+Nq9EEC0FRqrqLsm3ULJuhlpEZkAvMUumPvJ3AOlhxtdZEq
 TO0GFVFL5u/LeGClWdCYQoAqMzDpzR2o9VjanMCp6Pl6shRl1gW02YFClelxgIeKIDgO
 9CYLI/mmUj/1A4timsLBO+a5ZfH5g5bahWr+zgyxjR0y+x8hmnTrw6VSJYq07SItIitS
 BySiXxU2uJ2yDgRVVujO214aayzHLG06VaLv3D+d6LByZ6b1VT5AyxlzsZtFcjB+GRYj
 zHnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680544253;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8RHAwAS5sJDxIzhA3f2qW4W6/P4D/N6yDGJtxJ46p5g=;
 b=U6loDyfzTndqcfZ/0LLwQyckcAJnscnHtC/et/w1VjHuHZRS6MwM/IND5Am0ZnakHn
 v2bYgQ/3MTpg2wAeX3z6UqgdTv4ehmY65AACJNLDrx3V1DWcTHWJFmkHnyVlDBnX8zGE
 d599bgPAvt5yIUDDxONiXG+fa+I+ilGyd93wRKsP3yU94ZZdmP+A9F7K3Ik4vwCQPFRZ
 zrDwqlLww3i0llQOlwORMNuMG5Key2xJy9qJ4shDsGNDLnT4JMezy+7vJg4pkGeIo5gQ
 bdfyBz/XAiNPlgQI4nO2AYUyLOPawQ/Ua7Dl6AKEhLt9E0OsD7CwLsq7aJruK1Lqrwxh
 F/tw==
X-Gm-Message-State: AAQBX9eIx0ja+q1H6q83FccUn2nAyCxcBVlPul37Y5f3a77J9Lafk5dv
 vccc3tMIIm4+tT3RFXI1skdfXo8JrbmcRITZiNQ=
X-Google-Smtp-Source: AKy350YFFENSyFl8lsfKlgFMxJuVJvdrqWh3SxKEy/O2evSD9TI96nsxbFb2L5SOQdvLB6R/ey12qLWimCjQV02e6eQ=
X-Received: by 2002:a05:6870:b016:b0:17f:5b1a:20ce with SMTP id
 y22-20020a056870b01600b0017f5b1a20cemr55569oae.5.1680544253257; Mon, 03 Apr
 2023 10:50:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230403160314.1210533-1-robdclark@gmail.com>
 <20230403162541.GA3195909@dev-arch.thelio-3990X>
In-Reply-To: <20230403162541.GA3195909@dev-arch.thelio-3990X>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 3 Apr 2023 10:50:34 -0700
Message-ID: <CAF6AEGsdT95-uAKcv2+hdMLKd2xwfPeN+FMuDTRMc-Ps7WbRjw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/vblank: Fix for drivers that do not
 drm_vblank_init()
To: Nathan Chancellor <nathan@kernel.org>
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
Cc: Rob Clark <robdclark@chromium.org>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 3, 2023 at 9:25=E2=80=AFAM Nathan Chancellor <nathan@kernel.org=
> wrote:
>
> On Mon, Apr 03, 2023 at 09:03:14AM -0700, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > This should fix a crash that was reported on ast (and possibly other
> > drivers which do not initialize vblank).
> >
> >    fbcon: Taking over console
> >    Unable to handle kernel NULL pointer dereference at virtual address =
0000000000000074
> >    Mem abort info:
> >      ESR =3D 0x0000000096000004
> >      EC =3D 0x25: DABT (current EL), IL =3D 32 bits
> >      SET =3D 0, FnV =3D 0
> >      EA =3D 0, S1PTW =3D 0
> >      FSC =3D 0x04: level 0 translation fault
> >    Data abort info:
> >      ISV =3D 0, ISS =3D 0x00000004
> >      CM =3D 0, WnR =3D 0
> >    user pgtable: 4k pages, 48-bit VAs, pgdp=3D0000080009d16000
> >    [0000000000000074] pgd=3D0000000000000000, p4d=3D0000000000000000
> >    Internal error: Oops: 0000000096000004 [#1] SMP
> >    Modules linked in: ip6table_nat tun nft_fib_inet nft_fib_ipv4 nft_fi=
b_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft=
_ct nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 rfkill =
ip_set nf_tables nfnetlink qrtr sunrpc binfmt_misc vfat fat xfs snd_usb_aud=
io snd_hwdep snd_usbmidi_lib snd_seq snd_pcm snd_rawmidi snd_timer snd_seq_=
device snd soundcore joydev mc ipmi_ssif ipmi_devintf ipmi_msghandler arm_s=
pe_pmu arm_cmn arm_dsu_pmu arm_dmc620_pmu cppc_cpufreq loop zram crct10dif_=
ce polyval_ce nvme polyval_generic ghash_ce sbsa_gwdt igb nvme_core ast nvm=
e_common i2c_algo_bit xgene_hwmon gpio_dwapb scsi_dh_rdac scsi_dh_emc scsi_=
dh_alua ip6_tables ip_tables dm_multipath fuse
> >    CPU: 12 PID: 469 Comm: kworker/12:1 Not tainted 6.3.0-rc2-00008-gd39=
e48ca80c0 #1
> >    Hardware name: ADLINK AVA Developer Platform/AVA Developer Platform,=
 BIOS TianoCore 2.04.100.07 (SYS: 2.06.20220308) 09/08/2022
> >    Workqueue: events fbcon_register_existing_fbs
> >    pstate: 20400009 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=3D--)
> >    pc : drm_crtc_next_vblank_start+0x2c/0x98
> >    lr : drm_atomic_helper_wait_for_fences+0x90/0x240
> >    sp : ffff80000d583960
> >    x29: ffff80000d583960 x28: ffff07ff8fc187b0 x27: 0000000000000000
> >    x26: ffff07ff99c08c00 x25: 0000000000000038 x24: ffff07ff99c0c000
> >    x23: 0000000000000001 x22: 0000000000000038 x21: 0000000000000000
> >    x20: ffff07ff9640a280 x19: 0000000000000000 x18: ffffffffffffffff
> >    x17: 0000000000000000 x16: ffffb24d2eece1c0 x15: 0000003038303178
> >    x14: 3032393100000048 x13: 0000000000000000 x12: 0000000000000000
> >    x11: 0000000000000000 x10: 0000000000000000 x9 : ffffb24d2eeeaca0
> >    x8 : ffff80000d583628 x7 : 0000080077783000 x6 : 0000000000000000
> >    x5 : ffff80000d584000 x4 : ffff07ff99c0c000 x3 : 0000000000000130
> >    x2 : 0000000000000000 x1 : ffff80000d5839c0 x0 : ffff07ff99c0cc08
> >    Call trace:
> >     drm_crtc_next_vblank_start+0x2c/0x98
> >     drm_atomic_helper_wait_for_fences+0x90/0x240
> >     drm_atomic_helper_commit+0xb0/0x188
> >     drm_atomic_commit+0xb0/0xf0
> >     drm_client_modeset_commit_atomic+0x218/0x280
> >     drm_client_modeset_commit_locked+0x64/0x1a0
> >     drm_client_modeset_commit+0x38/0x68
> >     __drm_fb_helper_restore_fbdev_mode_unlocked+0xb0/0xf8
> >     drm_fb_helper_set_par+0x44/0x88
> >     fbcon_init+0x1e0/0x4a8
> >     visual_init+0xbc/0x118
> >     do_bind_con_driver.isra.0+0x194/0x3a0
> >     do_take_over_console+0x50/0x70
> >     do_fbcon_takeover+0x74/0xf8
> >     do_fb_registered+0x13c/0x158
> >     fbcon_register_existing_fbs+0x78/0xc0
> >     process_one_work+0x1ec/0x478
> >     worker_thread+0x74/0x418
> >     kthread+0xec/0x100
> >     ret_from_fork+0x10/0x20
> >    Code: f9400004 b9409013 f940a082 9ba30a73 (b9407662)
> >    ---[ end trace 0000000000000000 ]---
> >
> > v2: Use drm_dev_has_vblank()
> >
> > Reported-by: Nathan Chancellor <nathan@kernel.org>
> > Fixes: d39e48ca80c0 ("drm/atomic-helper: Set fence deadline for vblank"=
)
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>
> Still appears to work for me:
>
> Tested-by: Nathan Chancellor <nathan@kernel.org>

Thanks for confirming

BR,
-R

>
> > ---
> >  drivers/gpu/drm/drm_vblank.c | 10 ++++++++--
> >  1 file changed, 8 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.=
c
> > index 299fa2a19a90..877e2067534f 100644
> > --- a/drivers/gpu/drm/drm_vblank.c
> > +++ b/drivers/gpu/drm/drm_vblank.c
> > @@ -996,10 +996,16 @@ EXPORT_SYMBOL(drm_crtc_vblank_count_and_time);
> >  int drm_crtc_next_vblank_start(struct drm_crtc *crtc, ktime_t *vblankt=
ime)
> >  {
> >       unsigned int pipe =3D drm_crtc_index(crtc);
> > -     struct drm_vblank_crtc *vblank =3D &crtc->dev->vblank[pipe];
> > -     struct drm_display_mode *mode =3D &vblank->hwmode;
> > +     struct drm_vblank_crtc *vblank;
> > +     struct drm_display_mode *mode;
> >       u64 vblank_start;
> >
> > +     if (!drm_dev_has_vblank(crtc->dev))
> > +             return -EINVAL;
> > +
> > +     vblank =3D &crtc->dev->vblank[pipe];
> > +     mode =3D &vblank->hwmode;
> > +
> >       if (!vblank->framedur_ns || !vblank->linedur_ns)
> >               return -EINVAL;
> >
> > --
> > 2.39.2
> >
