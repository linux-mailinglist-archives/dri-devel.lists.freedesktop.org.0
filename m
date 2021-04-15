Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D910D361479
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 00:02:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A44EA6EB0B;
	Thu, 15 Apr 2021 22:02:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 440076EB09
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Apr 2021 22:02:45 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1618524165; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=VcI5fIJKe6nWXnWhbgnIiPQQPk1pRsqC2DiYAJVoLCw=;
 b=lfbF+bPkaarmt887aNSUVB/0HBeH3OC3OwxWCu/MiCxQmvG8ZHxtfkQ613KFOBQyiFEQYid5
 UWSxmR2In/36HC63D1Yw1RyxiNgxiKv6XDUikOHOpvi+3DNxNwc9oQvjG7t1cMP8c6O++ce4
 AFyWpk6g3YdTqh0EUd5mCwsAqAI=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 6078b803febcffa80f159868 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 15 Apr 2021 22:02:43
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id E9C23C433ED; Thu, 15 Apr 2021 22:02:42 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: khsieh)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id C0002C433C6;
 Thu, 15 Apr 2021 22:02:40 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 15 Apr 2021 15:02:40 -0700
From: khsieh@codeaurora.org
To: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v2 3/3] drm/msm/dp: check main link status before start
 aux read
In-Reply-To: <161851718969.46595.12896385877607476879@swboyd.mtv.corp.google.com>
References: <1618355504-5401-1-git-send-email-khsieh@codeaurora.org>
 <161843459482.46595.11409016331159748598@swboyd.mtv.corp.google.com>
 <60bceecc3d4dcc71c66a4b093d0e6c0f@codeaurora.org>
 <161851718969.46595.12896385877607476879@swboyd.mtv.corp.google.com>
Message-ID: <78036f23979206070bd9c9df180e2866@codeaurora.org>
X-Sender: khsieh@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
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
Cc: freedreno@lists.freedesktop.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 abhinavk@codeaurora.org, dri-devel@lists.freedesktop.org,
 aravindh@codeaurora.org, sean@poorly.run
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-04-15 13:06, Stephen Boyd wrote:
> Quoting khsieh@codeaurora.org (2021-04-15 10:37:29)
>> On 2021-04-14 14:09, Stephen Boyd wrote:
>> > Quoting Kuogee Hsieh (2021-04-13 16:11:44)
>> >> Make sure main link is in connection state before start aux
>> >> read/write operation to avoid unnecessary long delay due to
>> >> main link had been unplugged.
>> >>
>> >> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
>> >> ---
>> >>  drivers/gpu/drm/msm/dp/dp_aux.c  |  5 +++++
>> >>  drivers/gpu/drm/msm/dp/dp_link.c | 20 +++++++++++++++-----
>> >>  2 files changed, 20 insertions(+), 5 deletions(-)
>> >>
>> >> diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c
>> >> b/drivers/gpu/drm/msm/dp/dp_aux.c
>> >> index 7c22bfe..fae3806 100644
>> >> --- a/drivers/gpu/drm/msm/dp/dp_aux.c
>> >> +++ b/drivers/gpu/drm/msm/dp/dp_aux.c
>> >> @@ -343,6 +343,11 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux
>> >> *dp_aux,
>> >>
>> >>         mutex_lock(&aux->mutex);
>> >>
>> >> +       if (!dp_catalog_link_is_connected(aux->catalog)) {
>> >> +               ret = -ETIMEDOUT;
>> >> +               goto unlock_exit;
>> >> +       }
>> >
>> > I get a crash here sometimes when plugging and unplugging an apple HDMI
>> > dongle during suspend/resume. I guess device power management
>> > (dp_pm_suspend()) is happening in parallel with aux transfers from the
>> > kthread. Why doesn't the aux communication start reporting NAKs once
>> > the
>> > cable is disconnected?
>> >
>> > [  366.210058] hdmi-audio-codec hdmi-audio-codec.15.auto: calling
>> > platform_pm_suspend+0x0/0x60 @ 7175, parent:
>> > ae90000.displayport-controller
>> > [  366.222825] hdmi-audio-codec hdmi-audio-codec.15.auto:
>> > platform_pm_suspend+0x0/0x60 returned 0 after 1 usecs
>> > [  366.232939] msm-dp-display ae90000.displayport-controller: calling
>> > dp_pm_suspend+0x0/0x80 @ 7175, parent: ae00000.mdss
>> > [  366.244006] msm-dp-display ae90000.displayport-controller:
>> > dp_pm_suspend+0x0/0x80 returned 0 after 79 usecs
>> > [  366.254025] msm_dsi ae94000.dsi: calling
>> > pm_runtime_force_suspend+0x0/0xb4 @ 7175, parent: ae00000.mdss
>> > [  366.263669] msm_dsi ae94000.dsi: pm_runtime_force_suspend+0x0/0xb4
>> > returned 0 after 0 usecs
>> > [  366.272290] panel-simple panel: calling
>> > platform_pm_suspend+0x0/0x60 @ 7175, parent: platform
>> > [  366.272501] ti_sn65dsi86 2-002d: calling
>> > pm_runtime_force_suspend+0x0/0xb4 @ 176, parent: i2c-2
>> > [  366.281055] panel-simple panel: platform_pm_suspend+0x0/0x60
>> > returned 0 after 0 usecs
>> > [  366.281081] leds mmc1::: calling led_suspend+0x0/0x4c @ 7175,
>> > parent: 7c4000.sdhci
>> > [  366.290065] ti_sn65dsi86 2-002d: pm_runtime_force_suspend+0x0/0xb4
>> > returned 0 after 0 usecs
>> > [  366.298046] leds mmc1::: led_suspend+0x0/0x4c returned 0 after 1
>> > usecs
>> > [  366.302994] Internal error: synchronous external abort: 96000010
>> > [#1] PREEMPT SMP
>> > [  366.303006] Modules linked in: vhost_vsock
>> > vmw_vsock_virtio_transport_common vsock vhost rfcomm algif_hash
>> > algif_skcipher af_alg xt_cgroup uinput xt_MASQUERADE venus_enc
>> > hci_uart venus_dec btqca cros_ec_typec typec bluetooth qcom_spmi_adc5
>> > snd_soc_sc7180 qcom_spmi_temp_alarm ecdh_generic qcom_spmi_adc_tm5
>> > qcom_vadc_common snd_soc_qcom_common ecc snd_soc_rt5682_i2c
>> > snd_soc_rt5682 snd_soc_rl6231 venus_core v4l2_mem2mem
>> > snd_soc_lpass_sc7180 snd_soc_lpass_hdmi snd_soc_lpass_cpu
>> > snd_soc_lpass_platform snd_soc_max98357a fuse iio_trig_sysfs
>> > cros_ec_sensors cros_ec_sensors_ring cros_ec_lid_angle
>> > cros_ec_sensors_core industrialio_triggered_buffer kfifo_buf
>> > cros_ec_sensorhub lzo_rle lzo_compress zram ath10k_snoc ath10k_core
>> > ath mac80211 cfg80211 cdc_ether usbnet r8152 mii uvcvideo
>> > videobuf2_vmalloc joydev
>> > [  366.303211] CPU: 0 PID: 224 Comm: dp_hpd_handler Not tainted 5.4.109
>> > #27
>> > [  366.303216] Hardware name: Google Lazor (rev3+) with KB Backlight
>> > (DT)
>> > [  366.303225] pstate: 60c00009 (nZCv daif +PAN +UAO)
>> > [  366.303234] pc : dp_catalog_link_is_connected+0x20/0x34
>> > [  366.303244] lr : dp_aux_transfer+0x44/0x284
>> > [  366.303250] sp : ffffffc011bfbbe0
>> > [  366.303254] x29: ffffffc011bfbbe0 x28: aaaaaaaaaaaaaaaa
>> > [  366.303262] x27: 000000000000000c x26: ffffff896f8212bc
>> > [  366.303269] x25: 0000000000000001 x24: 0000000000000001
>> > [  366.303275] x23: 0000000000000020 x22: ffffff896ff82118
>> > [  366.303282] x21: ffffffc011bfbc50 x20: ffffff896ff82090
>> > [  366.303289] x19: ffffff896ffc3598 x18: 0000000000000000
>> > [  366.303295] x17: 0000000000000000 x16: 0000000000000001
>> > [  366.303303] x15: 0000000000000000 x14: 00000000000002ef
>> > [  366.303311] x13: 0000000000000400 x12: ffffffeb896ea060
>> > [  366.303317] x11: 0000000000000000 x10: 0000000000000000
>> > [  366.303324] x9 : ffffff896f061100 x8 : ffffffc010582204
>> > [  366.303331] x7 : 000000b2b5593519 x6 : 00000000003033ff
>> > [  366.303338] x5 : 0000000000000000 x4 : 0000000000000001
>> > [  366.303345] x3 : ffffff896ff432a1 x2 : 0000000000000000
>> > [  366.303352] x1 : 0000000000000119 x0 : ffffff896ffc3598
>> > [  366.303360] Call trace:
>> > [  366.303367]  dp_catalog_link_is_connected+0x20/0x34
>> > [  366.303374]  dp_aux_transfer+0x44/0x284mutex.
>> > [  366.303387]  drm_dp_dpcd_access+0x8c/0x11c
>> > [  366.303393]  drm_dp_dpcd_read+0x64/0x10c
>> > [  366.303399]  dp_link_process_request+0x94/0xaf8
>> > [  366.303405]  dp_display_usbpd_attention_cb+0x38/0x140
>> > [  366.303411]  hpd_event_thread+0x3f0/0x48c
>> > [  366.303426]  kthread+0x140/0x17c
>> > [  366.303439]  ret_from_fork+0x10/0x18
>> > [  366.303458] Code: d503201f f85f0268 f9400508 91081108 (b9400108)
>> >
>> it needs to make sure core clock enabled before access dp ctrl 
>> registers
>> I am look into it
> 
> Is it really necessary to have this patch at all? I think there are
> bigger problems with suspend/resume of the DP driver in relation to the
> kthread stopping. I hope that the aux channel would start NAKing
> transfers once the cable is disconnected too, so that we don't need to
> do an extra check for each aux transfer.

I am working on duplicate this problem, but it is not happen on me yet 
so far.
 From kernel dump, i can see it crash at dp_irq_hdp_handle() after 
suspended.
dp_irq_hpd_handle and dp_pm_suspend() are serialized by event_mutex.

After suspend, ahb clock is disabled.
Hence next dp_catalog_link_is_connected() crash at acess dp ctrl 
registers.


aux channel does not do NAKing immediately if unplugged. Therefore 
aux_transfer will wait until timeout (HZ/4).
worst, drm_dp_dpcd_access() will retry 32 times before return dpcd 
read/write failed.
This patch try to eliminate the time spinning on waiting for timeout 32 
times.

This patch does not necessary need.
I can drop it.


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
