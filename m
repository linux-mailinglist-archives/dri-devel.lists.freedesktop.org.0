Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1909D41B263
	for <lists+dri-devel@lfdr.de>; Tue, 28 Sep 2021 16:52:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2303A89DFC;
	Tue, 28 Sep 2021 14:52:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F2D289DFB
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 14:52:45 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1632840769; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: From: References: Cc: To: Subject: MIME-Version: Date:
 Message-ID: Sender; bh=f4WFcVRXiFJASWpKKkg7ZPFGull7j3liSd4EXDLOK4g=;
 b=bEU3F7jEKKoct+u2SEA/T21M6NWOev+eWa9fUGJ3QL4VJmkV6LZ962IjttF6hSPJGIfKZ3y0
 pEuTKWPP5O16bDC1bNzLsDeyVYTLxVOdErjMF4Yo96dqA91TTTtcraLg+EhOfbJhRP+SImDa
 V6EfLpeb4p5mwKS/o0ORcbnebEo=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 61532c22a5a9bab6e828b037 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 28 Sep 2021 14:52:18
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id A1B3FC43619; Tue, 28 Sep 2021 14:52:18 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 NICE_REPLY_A,SPF_FAIL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.10] (unknown [59.89.231.221])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akhilpo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 69BF7C43617;
 Tue, 28 Sep 2021 14:52:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 69BF7C43617
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
Message-ID: <f1c6fff0-a220-86d9-8572-2de3d47ab96a@codeaurora.org>
Date: Tue, 28 Sep 2021 20:22:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH] drm/msm: Switch ordering of runpm put vs devfreq_idle
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Rob Clark <robdclark@chromium.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
References: <20210927152928.831245-1-robdclark@gmail.com>
From: Akhil P Oommen <akhilpo@codeaurora.org>
In-Reply-To: <20210927152928.831245-1-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 9/27/2021 8:59 PM, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> I've seen a few crashes like:
> 
>      Internal error: synchronous external abort: 96000010 [#1] PREEMPT SMP
>      Modules linked in: snd_seq_dummy snd_seq snd_seq_device bridge stp llc tun nf_nat_tftp nf_conntrack_tftp nf_nat_ftp nf_conntrack_ftp esp6 ah6 ip6t_REJECT ip6t_ipv6header vhost_vsock vhost vmw_vsock_virtio_transport_common vsock rfcomm algif_hash algif_skcipher af_alg uinput veth xt_cgroup xt_MASQUERADE venus_enc venus_dec videobuf2_dma_contig qcom_spmi_adc5 qcom_spmi_adc_tm5 hci_uart qcom_vadc_common cros_ec_typec qcom_spmi_temp_alarm typec btqca snd_soc_rt5682_i2c snd_soc_rt5682 snd_soc_sc7180 bluetooth snd_soc_qcom_common snd_soc_rl6231 ecdh_generic ecc venus_core v4l2_mem2mem snd_soc_lpass_sc7180 snd_soc_lpass_hdmi snd_soc_lpass_cpu snd_soc_lpass_platform snd_soc_max98357a ip6table_nat fuse iio_trig_sysfs cros_ec_lid_angle cros_ec_sensors cros_ec_sensors_core industrialio_triggered_buffer kfifo_buf cros_ec_sensorhub lzo_rle ath10k_snoc lzo_compress ath10k_core ath zram mac80211 cfg80211 ax88179_178a usbnet mii uvcvideo videobuf2_vmalloc joydev
>      CPU: 3 PID: 212 Comm: A618-worker Tainted: G W 5.4.139-16300-g88d8e1285982 #1
>      Hardware name: Google Pompom (rev1) with LTE (DT)
>      pstate: 60c00009 (nZCv daif +PAN +UAO)
>      pc : a6xx_gmu_set_oob+0x114/0x200
>      lr : a6xx_gmu_set_oob+0x10c/0x200
>      sp : ffffffc011b7bc20
>      x29: ffffffc011b7bc20 x28: ffffffdad27c5000
>      x27: 0000000000000001 x26: ffffffdad1521044
>      x25: ffffffbef7498338 x24: 0000000000000018
>      x23: 0000000000000002 x22: 0000000000014648
>      x21: 0000033732fe638b x20: 0000000080000000
>      x19: ffffffbef7433bc8 x18: 0000000040000000
>      x17: 000000243508d982 x16: 000000000000b67e
>      x15: 00000000000090d4 x14: 0000000000000024
>      x13: 0000000000000024 x12: 0000000000017521
>      x11: 0000000000000b48 x10: 0000000000326a48
>      x9 : 1a130d33f6371600 x8 : ffffffc011e54648
>      x7 : 614948e00005003c x6 : ffffffbe3cd17e60
>      x5 : 0000000000000040 x4 : 0000000000000004
>      x3 : 0000000000000000 x2 : ffffffbef7488000
>      x1 : ffffffbef7488000 x0 : 0000000000000000
>      Call trace:
>      a6xx_gmu_set_oob+0x114/0x200
>      a6xx_gmu_set_freq+0xe0/0x1fc
>      msm_devfreq_target+0x80/0x13c
>      msm_devfreq_idle+0x54/0x94
>      retire_submit+0x170/0x254
>      retire_submits+0xa4/0xdc
>      retire_worker+0x1c/0x28
>      kthread_worker_fn+0xf4/0x1bc
>      kthread+0x140/0x158
>      ret_from_fork+0x10/0x18
>      Code: 52800c81 9415bbe5 f9400a68 8b160108 (b9400108)
>      ---[ end trace 16b871df2482cd61 ]---
>      Kernel panic - not syncing: Fatal exception
>      SMP: stopping secondary CPUs
>      Kernel Offset: 0x1ac1400000 from 0xffffffc010000000
>      PHYS_OFFSET: 0xffffffc280000000
>      CPU features: 0x88102e,2a80aa38
>      Memory Limit: none
> 
> Which smells a lot like touching hw after power collapse.  I'm not
> *entirely* sure how it could have taken 66ms (the autosuspend delay)
> before we get to a6xx_gmu_set_oob(), but to be safe we should move
> the pm_runtime_put_autosuspend() after msm_devfreq_idle().
https://elixir.bootlin.com/linux/v5.15-rc1/source/drivers/gpu/drm/msm/adreno/a6xx_gmu.c#L132
We have this check in the gmu freq set path which should avoid this 
scenario. I might be a bit pedantic here, but I feel that the original 
code is more accurate. We should immediately mark last busy and put 
runtime_pm refcount.

-Akhil.

> 
> Fixes: 9bc95570175a ("drm/msm: Devfreq tuning")
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/msm_gpu.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index d1a16642ecd5..2b2bbe7499e6 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -667,9 +667,6 @@ static void retire_submit(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
>   
>   	msm_submit_retire(submit);
>   
> -	pm_runtime_mark_last_busy(&gpu->pdev->dev);
> -	pm_runtime_put_autosuspend(&gpu->pdev->dev);
> -
>   	spin_lock_irqsave(&ring->submit_lock, flags);
>   	list_del(&submit->node);
>   	spin_unlock_irqrestore(&ring->submit_lock, flags);
> @@ -683,6 +680,9 @@ static void retire_submit(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
>   	mutex_unlock(&gpu->active_lock);
>   
>   	msm_gem_submit_put(submit);
> +
> +	pm_runtime_mark_last_busy(&gpu->pdev->dev);
> +	pm_runtime_put_autosuspend(&gpu->pdev->dev);
>   }
>   
>   static void retire_submits(struct msm_gpu *gpu)
> 

