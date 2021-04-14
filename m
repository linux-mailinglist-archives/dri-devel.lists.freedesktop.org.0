Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D1835FCF5
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 23:10:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A07D6E86F;
	Wed, 14 Apr 2021 21:09:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 080126E86F
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Apr 2021 21:09:56 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 b8-20020a17090a5508b029014d0fbe9b64so13172291pji.5
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Apr 2021 14:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=XUvEjx9oD+o9hXej8wFRxK1F3qgbozxnuSdrWd2xpgI=;
 b=D2A9kqVTe/moJOZjuMVQFpDyVvkfac9TvaUNuCYOtTDV9K+RZvk3kfLq/SynNJyPfO
 lFeEoFc3Ur5Qcw7KuYPpt5mOnjJTctQIbwRrVJPo1y6Mg5IJb2Umtvh9qAJqui6aCV/S
 4s7sD0Enom1zEr7SOGdDNsAesHWWg3RKpK6f0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=XUvEjx9oD+o9hXej8wFRxK1F3qgbozxnuSdrWd2xpgI=;
 b=AdLI7kXQT2d91ZC4cct/dZhmz9/DNgt4riCz+6KILuGuvgoyO4s1OtGafTl8sLfj/X
 e02ad2Gki7YNbjunDv4dMjbLRScwmhDsaSuqiS2ulIrnsU64HgoKFrkOchjwAnwVdiSv
 CMDI/Cy8KWZ87TLx/0lJnAYO6CYgh9MP2971wJtFl5JyUq/jL7DBI/knisLXB74keiMK
 3zPP0EtbD94tBqm6PZbM3mGf2rSG2lXmUzKETRiJmgvtXoi2Bd90Bl8f+Yl69tXkRj5Z
 3P5cm4ZV2b/yPG6be/+WR29dztC7PskABIZ71J9VEseekF2fFM4GMgbcRLJlq5VNVlRC
 KxJA==
X-Gm-Message-State: AOAM533w4wd/anABbX35gxb5SUE6/W1/KKjZ68bAuospyrXJ0TunBpKf
 OG9Gw/EUgGwYRsAFbKSsMhvRJg==
X-Google-Smtp-Source: ABdhPJyLdprVA+RHvHefmzwZ02g2RSj3jvVTfeyAqpxEnX8Z3stwk65vqAm8Skr/d/2SV1J+OJU2IA==
X-Received: by 2002:a17:90a:ff06:: with SMTP id
 ce6mr100952pjb.204.1618434596539; 
 Wed, 14 Apr 2021 14:09:56 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:753e:814e:f002:498a])
 by smtp.gmail.com with ESMTPSA id v11sm383741pgg.68.2021.04.14.14.09.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Apr 2021 14:09:56 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1618355504-5401-1-git-send-email-khsieh@codeaurora.org>
References: <1618355504-5401-1-git-send-email-khsieh@codeaurora.org>
Subject: Re: [PATCH v2 3/3] drm/msm/dp: check main link status before start
 aux read
From: Stephen Boyd <swboyd@chromium.org>
To: Kuogee Hsieh <khsieh@codeaurora.org>, robdclark@gmail.com, sean@poorly.run
Date: Wed, 14 Apr 2021 14:09:54 -0700
Message-ID: <161843459482.46595.11409016331159748598@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
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
Cc: airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 abhinavk@codeaurora.org, khsieh@codeaurora.org, tanmay@codeaurora.org,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2021-04-13 16:11:44)
> Make sure main link is in connection state before start aux
> read/write operation to avoid unnecessary long delay due to
> main link had been unplugged.
> 
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_aux.c  |  5 +++++
>  drivers/gpu/drm/msm/dp/dp_link.c | 20 +++++++++++++++-----
>  2 files changed, 20 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
> index 7c22bfe..fae3806 100644
> --- a/drivers/gpu/drm/msm/dp/dp_aux.c
> +++ b/drivers/gpu/drm/msm/dp/dp_aux.c
> @@ -343,6 +343,11 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_aux,
>  
>         mutex_lock(&aux->mutex);
>  
> +       if (!dp_catalog_link_is_connected(aux->catalog)) {
> +               ret = -ETIMEDOUT;
> +               goto unlock_exit;
> +       }

I get a crash here sometimes when plugging and unplugging an apple HDMI
dongle during suspend/resume. I guess device power management
(dp_pm_suspend()) is happening in parallel with aux transfers from the
kthread. Why doesn't the aux communication start reporting NAKs once the
cable is disconnected?

[  366.210058] hdmi-audio-codec hdmi-audio-codec.15.auto: calling platform_pm_suspend+0x0/0x60 @ 7175, parent: ae90000.displayport-controller
[  366.222825] hdmi-audio-codec hdmi-audio-codec.15.auto: platform_pm_suspend+0x0/0x60 returned 0 after 1 usecs
[  366.232939] msm-dp-display ae90000.displayport-controller: calling dp_pm_suspend+0x0/0x80 @ 7175, parent: ae00000.mdss
[  366.244006] msm-dp-display ae90000.displayport-controller: dp_pm_suspend+0x0/0x80 returned 0 after 79 usecs
[  366.254025] msm_dsi ae94000.dsi: calling pm_runtime_force_suspend+0x0/0xb4 @ 7175, parent: ae00000.mdss
[  366.263669] msm_dsi ae94000.dsi: pm_runtime_force_suspend+0x0/0xb4 returned 0 after 0 usecs
[  366.272290] panel-simple panel: calling platform_pm_suspend+0x0/0x60 @ 7175, parent: platform
[  366.272501] ti_sn65dsi86 2-002d: calling pm_runtime_force_suspend+0x0/0xb4 @ 176, parent: i2c-2
[  366.281055] panel-simple panel: platform_pm_suspend+0x0/0x60 returned 0 after 0 usecs
[  366.281081] leds mmc1::: calling led_suspend+0x0/0x4c @ 7175, parent: 7c4000.sdhci
[  366.290065] ti_sn65dsi86 2-002d: pm_runtime_force_suspend+0x0/0xb4 returned 0 after 0 usecs
[  366.298046] leds mmc1::: led_suspend+0x0/0x4c returned 0 after 1 usecs
[  366.302994] Internal error: synchronous external abort: 96000010 [#1] PREEMPT SMP
[  366.303006] Modules linked in: vhost_vsock vmw_vsock_virtio_transport_common vsock vhost rfcomm algif_hash algif_skcipher af_alg xt_cgroup uinput xt_MASQUERADE venus_enc hci_uart venus_dec btqca cros_ec_typec typec bluetooth qcom_spmi_adc5 snd_soc_sc7180 qcom_spmi_temp_alarm ecdh_generic qcom_spmi_adc_tm5 qcom_vadc_common snd_soc_qcom_common ecc snd_soc_rt5682_i2c snd_soc_rt5682 snd_soc_rl6231 venus_core v4l2_mem2mem snd_soc_lpass_sc7180 snd_soc_lpass_hdmi snd_soc_lpass_cpu snd_soc_lpass_platform snd_soc_max98357a fuse iio_trig_sysfs cros_ec_sensors cros_ec_sensors_ring cros_ec_lid_angle cros_ec_sensors_core industrialio_triggered_buffer kfifo_buf cros_ec_sensorhub lzo_rle lzo_compress zram ath10k_snoc ath10k_core ath mac80211 cfg80211 cdc_ether usbnet r8152 mii uvcvideo videobuf2_vmalloc joydev
[  366.303211] CPU: 0 PID: 224 Comm: dp_hpd_handler Not tainted 5.4.109 #27
[  366.303216] Hardware name: Google Lazor (rev3+) with KB Backlight (DT)
[  366.303225] pstate: 60c00009 (nZCv daif +PAN +UAO)
[  366.303234] pc : dp_catalog_link_is_connected+0x20/0x34
[  366.303244] lr : dp_aux_transfer+0x44/0x284
[  366.303250] sp : ffffffc011bfbbe0
[  366.303254] x29: ffffffc011bfbbe0 x28: aaaaaaaaaaaaaaaa 
[  366.303262] x27: 000000000000000c x26: ffffff896f8212bc 
[  366.303269] x25: 0000000000000001 x24: 0000000000000001 
[  366.303275] x23: 0000000000000020 x22: ffffff896ff82118 
[  366.303282] x21: ffffffc011bfbc50 x20: ffffff896ff82090 
[  366.303289] x19: ffffff896ffc3598 x18: 0000000000000000 
[  366.303295] x17: 0000000000000000 x16: 0000000000000001 
[  366.303303] x15: 0000000000000000 x14: 00000000000002ef 
[  366.303311] x13: 0000000000000400 x12: ffffffeb896ea060 
[  366.303317] x11: 0000000000000000 x10: 0000000000000000 
[  366.303324] x9 : ffffff896f061100 x8 : ffffffc010582204 
[  366.303331] x7 : 000000b2b5593519 x6 : 00000000003033ff 
[  366.303338] x5 : 0000000000000000 x4 : 0000000000000001 
[  366.303345] x3 : ffffff896ff432a1 x2 : 0000000000000000 
[  366.303352] x1 : 0000000000000119 x0 : ffffff896ffc3598 
[  366.303360] Call trace:
[  366.303367]  dp_catalog_link_is_connected+0x20/0x34
[  366.303374]  dp_aux_transfer+0x44/0x284
[  366.303387]  drm_dp_dpcd_access+0x8c/0x11c
[  366.303393]  drm_dp_dpcd_read+0x64/0x10c
[  366.303399]  dp_link_process_request+0x94/0xaf8
[  366.303405]  dp_display_usbpd_attention_cb+0x38/0x140
[  366.303411]  hpd_event_thread+0x3f0/0x48c
[  366.303426]  kthread+0x140/0x17c
[  366.303439]  ret_from_fork+0x10/0x18
[  366.303458] Code: d503201f f85f0268 f9400508 91081108 (b9400108) 

> +
>         aux->native = msg->request & (DP_AUX_NATIVE_WRITE & DP_AUX_NATIVE_READ);
>  
>         /* Ignore address only message */
> diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
> index be986da..d35b18e 100644
> --- a/drivers/gpu/drm/msm/dp/dp_link.c
> +++ b/drivers/gpu/drm/msm/dp/dp_link.c
> @@ -737,18 +737,25 @@ static int dp_link_parse_sink_count(struct dp_link *dp_link)
>         return 0;
>  }
>  
> -static void dp_link_parse_sink_status_field(struct dp_link_private *link)
> +static int dp_link_parse_sink_status_field(struct dp_link_private *link)
>  {
>         int len = 0;
>  
>         link->prev_sink_count = link->dp_link.sink_count;
> -       dp_link_parse_sink_count(&link->dp_link);
> +       len = dp_link_parse_sink_count(&link->dp_link);
> +       if (len < 0) {
> +               DRM_ERROR("DP lparse sink count failed\n");

Is it 'lparse' on purpose?

> +               return len;
> +       }
>  
>         len = drm_dp_dpcd_read_link_status(link->aux,
>                 link->link_status);
> -       if (len < DP_LINK_STATUS_SIZE)
> +       if (len < DP_LINK_STATUS_SIZE) {
>                 DRM_ERROR("DP link status read failed\n");
> -       dp_link_parse_request(link);
> +               return len;
> +       }
> +
> +       return dp_link_parse_request(link);
>  }
>  
>  /**
> @@ -1032,7 +1039,10 @@ int dp_link_process_request(struct dp_link *dp_link)
>  
>         dp_link_reset_data(link);
>  
> -       dp_link_parse_sink_status_field(link);
> +       ret = dp_link_parse_sink_status_field(link);
> +       if (ret) {
> +               return ret;
> +       }
>  
>         if (link->request.test_requested == DP_TEST_LINK_EDID_READ) {
>                 dp_link->sink_request |= DP_TEST_LINK_EDID_READ;

These are probably good fixes on their own given that
dp_link_parse_sink_count() can return an error and that was being
ignored.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
