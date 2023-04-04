Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 681CE6D6E2B
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 22:39:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E51510E037;
	Tue,  4 Apr 2023 20:39:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5352410E037
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 20:39:54 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-947a47eb908so44551066b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Apr 2023 13:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1680640793;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ExcUThm1Iuc2jKHFlfp1iXOibAJoWiAFt/diaC9gBAU=;
 b=fdXzdJj9HVn8/VzlZteTpwtnGe5nvp4/r4vZ2arzDi98p+3fQlHIHz8lTTwRLEb+3D
 25AZmGZT6SopEBzOoNXiRi18qw+fPCeRadPKyks3MRa8ypR0+1TxhRRWFvmQBcA493f+
 hxde4YGYVSaNpkN4VvhYSkvJ9QG/Dsr9HEvDY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680640793;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ExcUThm1Iuc2jKHFlfp1iXOibAJoWiAFt/diaC9gBAU=;
 b=JyLBX0+7rZFhbJRyY/wE1vrshUTabYO8PpnhGFz78czOWWYcuL3Gn8aAh+p18DoniW
 0dqn/lPkpZTiFzwNbqy3uzFIO0iM4rZX9i9+XPWfZyDwjj5pAWSHS0BxkRoSZyi6xZev
 JFMtzqjYiVc+FbPZDI3InQ8DUovvU8+Gq9JrYioXqRlTjEue3uPWwSRckQWWHwMocg2/
 5WGaC5HaBcCg+4ds1a+RuHPvLTXzE8+Kowon66RUMxU+AjpsUBO+jeRO6xP9hvLo6GF+
 55Zycaqu6eSu2b+H7ArpZ8pfPAyvw0MkYHygyvMkWPCQpM3b0c7ljsphcne78yIQqYkt
 VENQ==
X-Gm-Message-State: AAQBX9couqPuRrztnOsKqYRyOVfLv/5fFvZWV9GU6eunpsWqottu6m7g
 VsA9LOk7BUnl7EAEnAKPjR2xoQ==
X-Google-Smtp-Source: AKy350YrViAVfRB3P6JwrUL8jALkCnKTz4rPr0d39i9sKw2E1CdTnWEBB2+DQX5rbLPjB/zRFcyqEw==
X-Received: by 2002:a05:6402:268e:b0:502:616b:cbd5 with SMTP id
 w14-20020a056402268e00b00502616bcbd5mr693211edd.2.1680640792735; 
 Tue, 04 Apr 2023 13:39:52 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 u12-20020a50c04c000000b004d8d2735251sm6385242edd.43.2023.04.04.13.39.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 13:39:52 -0700 (PDT)
Date: Tue, 4 Apr 2023 22:39:50 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v2] drm/vblank: Fix for drivers that do not
 drm_vblank_init()
Message-ID: <ZCyLFm1s/0SvdtVP@phenom.ffwll.local>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>,
 dri-devel@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20230403160314.1210533-1-robdclark@gmail.com>
 <20230403162541.GA3195909@dev-arch.thelio-3990X>
 <CAF6AEGsdT95-uAKcv2+hdMLKd2xwfPeN+FMuDTRMc-Ps7WbRjw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGsdT95-uAKcv2+hdMLKd2xwfPeN+FMuDTRMc-Ps7WbRjw@mail.gmail.com>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
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
 Nathan Chancellor <nathan@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 03, 2023 at 10:50:34AM -0700, Rob Clark wrote:
> On Mon, Apr 3, 2023 at 9:25 AM Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > On Mon, Apr 03, 2023 at 09:03:14AM -0700, Rob Clark wrote:
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > This should fix a crash that was reported on ast (and possibly other
> > > drivers which do not initialize vblank).
> > >
> > >    fbcon: Taking over console
> > >    Unable to handle kernel NULL pointer dereference at virtual address 0000000000000074
> > >    Mem abort info:
> > >      ESR = 0x0000000096000004
> > >      EC = 0x25: DABT (current EL), IL = 32 bits
> > >      SET = 0, FnV = 0
> > >      EA = 0, S1PTW = 0
> > >      FSC = 0x04: level 0 translation fault
> > >    Data abort info:
> > >      ISV = 0, ISS = 0x00000004
> > >      CM = 0, WnR = 0
> > >    user pgtable: 4k pages, 48-bit VAs, pgdp=0000080009d16000
> > >    [0000000000000074] pgd=0000000000000000, p4d=0000000000000000
> > >    Internal error: Oops: 0000000096000004 [#1] SMP
> > >    Modules linked in: ip6table_nat tun nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 rfkill ip_set nf_tables nfnetlink qrtr sunrpc binfmt_misc vfat fat xfs snd_usb_audio snd_hwdep snd_usbmidi_lib snd_seq snd_pcm snd_rawmidi snd_timer snd_seq_device snd soundcore joydev mc ipmi_ssif ipmi_devintf ipmi_msghandler arm_spe_pmu arm_cmn arm_dsu_pmu arm_dmc620_pmu cppc_cpufreq loop zram crct10dif_ce polyval_ce nvme polyval_generic ghash_ce sbsa_gwdt igb nvme_core ast nvme_common i2c_algo_bit xgene_hwmon gpio_dwapb scsi_dh_rdac scsi_dh_emc scsi_dh_alua ip6_tables ip_tables dm_multipath fuse
> > >    CPU: 12 PID: 469 Comm: kworker/12:1 Not tainted 6.3.0-rc2-00008-gd39e48ca80c0 #1
> > >    Hardware name: ADLINK AVA Developer Platform/AVA Developer Platform, BIOS TianoCore 2.04.100.07 (SYS: 2.06.20220308) 09/08/2022
> > >    Workqueue: events fbcon_register_existing_fbs
> > >    pstate: 20400009 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> > >    pc : drm_crtc_next_vblank_start+0x2c/0x98
> > >    lr : drm_atomic_helper_wait_for_fences+0x90/0x240
> > >    sp : ffff80000d583960
> > >    x29: ffff80000d583960 x28: ffff07ff8fc187b0 x27: 0000000000000000
> > >    x26: ffff07ff99c08c00 x25: 0000000000000038 x24: ffff07ff99c0c000
> > >    x23: 0000000000000001 x22: 0000000000000038 x21: 0000000000000000
> > >    x20: ffff07ff9640a280 x19: 0000000000000000 x18: ffffffffffffffff
> > >    x17: 0000000000000000 x16: ffffb24d2eece1c0 x15: 0000003038303178
> > >    x14: 3032393100000048 x13: 0000000000000000 x12: 0000000000000000
> > >    x11: 0000000000000000 x10: 0000000000000000 x9 : ffffb24d2eeeaca0
> > >    x8 : ffff80000d583628 x7 : 0000080077783000 x6 : 0000000000000000
> > >    x5 : ffff80000d584000 x4 : ffff07ff99c0c000 x3 : 0000000000000130
> > >    x2 : 0000000000000000 x1 : ffff80000d5839c0 x0 : ffff07ff99c0cc08
> > >    Call trace:
> > >     drm_crtc_next_vblank_start+0x2c/0x98
> > >     drm_atomic_helper_wait_for_fences+0x90/0x240
> > >     drm_atomic_helper_commit+0xb0/0x188
> > >     drm_atomic_commit+0xb0/0xf0
> > >     drm_client_modeset_commit_atomic+0x218/0x280
> > >     drm_client_modeset_commit_locked+0x64/0x1a0
> > >     drm_client_modeset_commit+0x38/0x68
> > >     __drm_fb_helper_restore_fbdev_mode_unlocked+0xb0/0xf8
> > >     drm_fb_helper_set_par+0x44/0x88
> > >     fbcon_init+0x1e0/0x4a8
> > >     visual_init+0xbc/0x118
> > >     do_bind_con_driver.isra.0+0x194/0x3a0
> > >     do_take_over_console+0x50/0x70
> > >     do_fbcon_takeover+0x74/0xf8
> > >     do_fb_registered+0x13c/0x158
> > >     fbcon_register_existing_fbs+0x78/0xc0
> > >     process_one_work+0x1ec/0x478
> > >     worker_thread+0x74/0x418
> > >     kthread+0xec/0x100
> > >     ret_from_fork+0x10/0x20
> > >    Code: f9400004 b9409013 f940a082 9ba30a73 (b9407662)
> > >    ---[ end trace 0000000000000000 ]---
> > >
> > > v2: Use drm_dev_has_vblank()
> > >
> > > Reported-by: Nathan Chancellor <nathan@kernel.org>
> > > Fixes: d39e48ca80c0 ("drm/atomic-helper: Set fence deadline for vblank")
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> >
> > Still appears to work for me:
> >
> > Tested-by: Nathan Chancellor <nathan@kernel.org>
> 
> Thanks for confirming

Pushed to drm-misc-next.
-Daniel

> 
> BR,
> -R
> 
> >
> > > ---
> > >  drivers/gpu/drm/drm_vblank.c | 10 ++++++++--
> > >  1 file changed, 8 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> > > index 299fa2a19a90..877e2067534f 100644
> > > --- a/drivers/gpu/drm/drm_vblank.c
> > > +++ b/drivers/gpu/drm/drm_vblank.c
> > > @@ -996,10 +996,16 @@ EXPORT_SYMBOL(drm_crtc_vblank_count_and_time);
> > >  int drm_crtc_next_vblank_start(struct drm_crtc *crtc, ktime_t *vblanktime)
> > >  {
> > >       unsigned int pipe = drm_crtc_index(crtc);
> > > -     struct drm_vblank_crtc *vblank = &crtc->dev->vblank[pipe];
> > > -     struct drm_display_mode *mode = &vblank->hwmode;
> > > +     struct drm_vblank_crtc *vblank;
> > > +     struct drm_display_mode *mode;
> > >       u64 vblank_start;
> > >
> > > +     if (!drm_dev_has_vblank(crtc->dev))
> > > +             return -EINVAL;
> > > +
> > > +     vblank = &crtc->dev->vblank[pipe];
> > > +     mode = &vblank->hwmode;
> > > +
> > >       if (!vblank->framedur_ns || !vblank->linedur_ns)
> > >               return -EINVAL;
> > >
> > > --
> > > 2.39.2
> > >

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
