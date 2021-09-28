Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1F341B2FA
	for <lists+dri-devel@lfdr.de>; Tue, 28 Sep 2021 17:31:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96D576E0F5;
	Tue, 28 Sep 2021 15:31:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C7256E0F5;
 Tue, 28 Sep 2021 15:31:15 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 z184-20020a1c7ec1000000b003065f0bc631so2674974wmc.0; 
 Tue, 28 Sep 2021 08:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=FsN/fCo7r6BqWXRWyecStM0iHpOHHFdsOUPHUfPZmk4=;
 b=m2IvqQPArQ3gmZH+vbWs/F4xB+ZJC5rcjIX6VxRDqe/mOCRhMrBQ6Lrnxs0AV/GWLK
 5bvQf+5KaUBPCa08rphJGgpYUzT/juQA2mzanEykF7KR1o0RPGaYR1nN/mahX+muUZE4
 Q9spI4GVpkNubyZDsqBxnWTwFLK1l9uPzjkQBxneNwnmn4331P2JKvq0nCtmXd5SOg9n
 T4kMSKxW8mI6oUhi7AfKe6pu+rUFTPAg0ij+gNJlhtJFNft0VbDgm4eYazy/mhq0N/Lw
 yKGvk3xpOrAyzpd9TPEyXaS5oI9MV+5wwot8RlSFg7bVhLXOJRD4BVUIl1UrumwMajIo
 0vsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FsN/fCo7r6BqWXRWyecStM0iHpOHHFdsOUPHUfPZmk4=;
 b=fbAg7KzeQQzGxtdKX2XOm8zfGp51U57bQiwjvap33lKhuZxjBgVlhTZ9InxqAd5HWO
 AgNAzHxfXwIUIVwztQPQbMLE+0pyU+6THezrYwLyK/scZRU+Gi114H3zuFUuHNsoR/eF
 +kfIwbJgXOxy/nJHTZmcbmTghCvXUJ5a9iGkJ5URAyzpujMY61eG5eAZiyqa0pYbDXZS
 nRRBkIeRDTsM4X3Dmc42AXwGW2Z/h3eOQpsygzl9HfK8hJh2KGoXJEjMP1pOKHG4MZbW
 NYfLujb4w2B2npbw4wJhak0fQhtrlxUcVJZzp85L2NyKgkBv+AdlZphupQkWaxLq2Z5o
 QIfg==
X-Gm-Message-State: AOAM533HWvzpNEtVVV1P/iSoNzYQ1UFjyon9EOdWF7t1UQzzHq7h04Ak
 lABykwvZG/ZGMzxoHdA1p548MTPufA3nkUA+Ulk=
X-Google-Smtp-Source: ABdhPJwTvRK+5sabvBWudsj3UeqhoyqclgpHynD6xJC3yg6DnP94bvQlIRyd4pVAYkbxL5RwtKqCb9tN7bvhRgbtinY=
X-Received: by 2002:a1c:f201:: with SMTP id s1mr5358976wmc.101.1632843073673; 
 Tue, 28 Sep 2021 08:31:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210927152928.831245-1-robdclark@gmail.com>
 <f1c6fff0-a220-86d9-8572-2de3d47ab96a@codeaurora.org>
In-Reply-To: <f1c6fff0-a220-86d9-8572-2de3d47ab96a@codeaurora.org>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 28 Sep 2021 08:35:46 -0700
Message-ID: <CAF6AEGtSjaaWPUeke9mtaOen0fkyZYTMULLGzWDH4+nyFn47bQ@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH] drm/msm: Switch ordering of runpm put vs
 devfreq_idle
To: Akhil P Oommen <akhilpo@codeaurora.org>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>, 
 Rob Clark <robdclark@chromium.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 open list <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 28, 2021 at 7:52 AM Akhil P Oommen <akhilpo@codeaurora.org> wro=
te:
>
> On 9/27/2021 8:59 PM, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > I've seen a few crashes like:
> >
> >      Internal error: synchronous external abort: 96000010 [#1] PREEMPT =
SMP
> >      Modules linked in: snd_seq_dummy snd_seq snd_seq_device bridge stp=
 llc tun nf_nat_tftp nf_conntrack_tftp nf_nat_ftp nf_conntrack_ftp esp6 ah6=
 ip6t_REJECT ip6t_ipv6header vhost_vsock vhost vmw_vsock_virtio_transport_c=
ommon vsock rfcomm algif_hash algif_skcipher af_alg uinput veth xt_cgroup x=
t_MASQUERADE venus_enc venus_dec videobuf2_dma_contig qcom_spmi_adc5 qcom_s=
pmi_adc_tm5 hci_uart qcom_vadc_common cros_ec_typec qcom_spmi_temp_alarm ty=
pec btqca snd_soc_rt5682_i2c snd_soc_rt5682 snd_soc_sc7180 bluetooth snd_so=
c_qcom_common snd_soc_rl6231 ecdh_generic ecc venus_core v4l2_mem2mem snd_s=
oc_lpass_sc7180 snd_soc_lpass_hdmi snd_soc_lpass_cpu snd_soc_lpass_platform=
 snd_soc_max98357a ip6table_nat fuse iio_trig_sysfs cros_ec_lid_angle cros_=
ec_sensors cros_ec_sensors_core industrialio_triggered_buffer kfifo_buf cro=
s_ec_sensorhub lzo_rle ath10k_snoc lzo_compress ath10k_core ath zram mac802=
11 cfg80211 ax88179_178a usbnet mii uvcvideo videobuf2_vmalloc joydev
> >      CPU: 3 PID: 212 Comm: A618-worker Tainted: G W 5.4.139-16300-g88d8=
e1285982 #1
> >      Hardware name: Google Pompom (rev1) with LTE (DT)
> >      pstate: 60c00009 (nZCv daif +PAN +UAO)
> >      pc : a6xx_gmu_set_oob+0x114/0x200
> >      lr : a6xx_gmu_set_oob+0x10c/0x200
> >      sp : ffffffc011b7bc20
> >      x29: ffffffc011b7bc20 x28: ffffffdad27c5000
> >      x27: 0000000000000001 x26: ffffffdad1521044
> >      x25: ffffffbef7498338 x24: 0000000000000018
> >      x23: 0000000000000002 x22: 0000000000014648
> >      x21: 0000033732fe638b x20: 0000000080000000
> >      x19: ffffffbef7433bc8 x18: 0000000040000000
> >      x17: 000000243508d982 x16: 000000000000b67e
> >      x15: 00000000000090d4 x14: 0000000000000024
> >      x13: 0000000000000024 x12: 0000000000017521
> >      x11: 0000000000000b48 x10: 0000000000326a48
> >      x9 : 1a130d33f6371600 x8 : ffffffc011e54648
> >      x7 : 614948e00005003c x6 : ffffffbe3cd17e60
> >      x5 : 0000000000000040 x4 : 0000000000000004
> >      x3 : 0000000000000000 x2 : ffffffbef7488000
> >      x1 : ffffffbef7488000 x0 : 0000000000000000
> >      Call trace:
> >      a6xx_gmu_set_oob+0x114/0x200
> >      a6xx_gmu_set_freq+0xe0/0x1fc
> >      msm_devfreq_target+0x80/0x13c
> >      msm_devfreq_idle+0x54/0x94
> >      retire_submit+0x170/0x254
> >      retire_submits+0xa4/0xdc
> >      retire_worker+0x1c/0x28
> >      kthread_worker_fn+0xf4/0x1bc
> >      kthread+0x140/0x158
> >      ret_from_fork+0x10/0x18
> >      Code: 52800c81 9415bbe5 f9400a68 8b160108 (b9400108)
> >      ---[ end trace 16b871df2482cd61 ]---
> >      Kernel panic - not syncing: Fatal exception
> >      SMP: stopping secondary CPUs
> >      Kernel Offset: 0x1ac1400000 from 0xffffffc010000000
> >      PHYS_OFFSET: 0xffffffc280000000
> >      CPU features: 0x88102e,2a80aa38
> >      Memory Limit: none
> >
> > Which smells a lot like touching hw after power collapse.  I'm not
> > *entirely* sure how it could have taken 66ms (the autosuspend delay)
> > before we get to a6xx_gmu_set_oob(), but to be safe we should move
> > the pm_runtime_put_autosuspend() after msm_devfreq_idle().
> https://elixir.bootlin.com/linux/v5.15-rc1/source/drivers/gpu/drm/msm/adr=
eno/a6xx_gmu.c#L132
> We have this check in the gmu freq set path which should avoid this
> scenario. I might be a bit pedantic here, but I feel that the original
> code is more accurate. We should immediately mark last busy and put
> runtime_pm refcount.

The problem is that get_if_in_use(gmu->dev) doesn't prevent the _gpu_
device from suspending and racing down the _set_oob()/_clear_oob()
path in parallel with set_freq().. I think that (plus the potential
for either of those paths to race with get_timestamp()) is related to
the gmu OOB crashes I'm seeing from the field.

A better plan is probably something along the lines of [1].. maybe
re-worked a bit if it is not acceptable to start using c99.  Which
we'll also need if we wanted to defer slightly clamping to idle.  (Or
if we had IFPC working we could just drop the whole freq change on
idle<->active transitions ;-))

[1] https://patchwork.freedesktop.org/patch/455928/?series=3D95119&rev=3D1

>
> -Akhil.
>
> >
> > Fixes: 9bc95570175a ("drm/msm: Devfreq tuning")
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >   drivers/gpu/drm/msm/msm_gpu.c | 6 +++---
> >   1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gp=
u.c
> > index d1a16642ecd5..2b2bbe7499e6 100644
> > --- a/drivers/gpu/drm/msm/msm_gpu.c
> > +++ b/drivers/gpu/drm/msm/msm_gpu.c
> > @@ -667,9 +667,6 @@ static void retire_submit(struct msm_gpu *gpu, stru=
ct msm_ringbuffer *ring,
> >
> >       msm_submit_retire(submit);
> >
> > -     pm_runtime_mark_last_busy(&gpu->pdev->dev);
> > -     pm_runtime_put_autosuspend(&gpu->pdev->dev);
> > -
> >       spin_lock_irqsave(&ring->submit_lock, flags);
> >       list_del(&submit->node);
> >       spin_unlock_irqrestore(&ring->submit_lock, flags);
> > @@ -683,6 +680,9 @@ static void retire_submit(struct msm_gpu *gpu, stru=
ct msm_ringbuffer *ring,
> >       mutex_unlock(&gpu->active_lock);
> >
> >       msm_gem_submit_put(submit);
> > +
> > +     pm_runtime_mark_last_busy(&gpu->pdev->dev);
> > +     pm_runtime_put_autosuspend(&gpu->pdev->dev);
> >   }
> >
> >   static void retire_submits(struct msm_gpu *gpu)
> >
>
