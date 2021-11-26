Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FB745F14F
	for <lists+dri-devel@lfdr.de>; Fri, 26 Nov 2021 17:08:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B70AB6EA6A;
	Fri, 26 Nov 2021 16:08:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30CB36EA6A;
 Fri, 26 Nov 2021 16:08:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id F02011F46A35
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1637942898; bh=Ci7/9ZWyAcBVEF/jeNsVFmDeMz8SORfGUiL+pIGvVyw=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=lM0OTiHiCIbsae3BTfRWTQXRE+weAUvwS0yqAkN+U86aeBt28UDaxhD80op9jk4Za
 oaD7xgNfY6HYBIqtdcrmY80q5Y3hRQ/EOKinSsM+K+cFaPuQwFyla/uHEA0U0mMXXg
 f+hGI7UkdQ3iizQxrd8y6M+kYSFhYbvpZOxrOyX9wlQ6xFqFuTMywIlih/LzWlKOh1
 HypFpXLnts3R9dkrrbWF+qfXs+B5FB0NAzMF3Y4kL33VhbLk57B1lTjqX41xNW+pyk
 XGTm3UpuNU9rAHZiqzEOc0UV3HEHXIi995YlTlh3jTgC3k5QMqef/c02JIOaA6oQP4
 8BSo3NGd5KEZw==
Subject: Re: [PATCH] drm/msm: Initialize MDSS irq domain at probe time
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, robdclark@gmail.com
References: <20211125150947.354076-1-angelogioacchino.delregno@collabora.com>
 <32cdade5-1487-9182-e939-4d93f8a27ad6@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <59fc38f7-564a-8596-364a-502db6bb04ed@collabora.com>
Date: Fri, 26 Nov 2021 17:08:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <32cdade5-1487-9182-e939-4d93f8a27ad6@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
 linux-arm-msm@vger.kernel.org, konrad.dybcio@somainline.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 jami.kettunen@somainline.org, maxime@cerno.tech, marijn.suijten@somainline.org,
 kernel@collabora.com, sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 26/11/21 01:06, Dmitry Baryshkov ha scritto:
> On 25/11/2021 18:09, AngeloGioacchino Del Regno wrote:
>> Since commit 8f59ee9a570c ("drm/msm/dsi: Adjust probe order"), the
>> DSI host gets initialized earlier, but this caused unability to probe
>> the entire stack of components because they all depend on interrupts
>> coming from the main `mdss` node (mdp5, or dpu1).
>>
>> To fix this issue, also anticipate probing mdp5 or dpu1 by initializing
>> them at msm_pdev_probe() time: this will make sure that we add the
>> required interrupt controller mapping before dsi and/or other components
>> try to initialize, finally satisfying the dependency.
>>
>> While at it, also change the allocation of msm_drm_private to use the
>> devm variant of kzalloc().
>>
>> Fixes: 8f59ee9a570c ("drm/msm/dsi: Adjust probe order")
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> Another issue (or a pack of issues):
> Now the msm_drm_init() is unbalanced with msm_drm_uninit(). Bits of code (putting 
> the drm dev, removing the IRQ domain, etc) have to be called now from the 
> msm_pdev_remove() function rather than from the unbind path.
> 
> The following changes fix the observed issues here, however additional care should 
> be taken.
> 
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 5a92417d21d0..0abb16256b61 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -342,7 +342,6 @@ static int msm_drm_uninit(struct device *dev)
>          struct drm_device *ddev = platform_get_drvdata(pdev);
>          struct msm_drm_private *priv = ddev->dev_private;
>          struct msm_kms *kms = priv->kms;
> -       struct msm_mdss *mdss = priv->mdss;
>          int i;
> 
>          /*
> @@ -402,14 +401,7 @@ static int msm_drm_uninit(struct device *dev)
> 
>          component_unbind_all(dev, ddev);
> 
> -       if (mdss && mdss->funcs)
> -               mdss->funcs->destroy(ddev);
> -
> -       ddev->dev_private = NULL;
> -       drm_dev_put(ddev);
> -
>          destroy_workqueue(priv->wq);
> -       kfree(priv);
> 
>          return 0;
>   }
> @@ -515,7 +507,6 @@ static int msm_drm_init(struct device *dev, const
>          struct drm_device *ddev = platform_get_drvdata(pdev);
>          struct msm_drm_private *priv = ddev->dev_private;
>          struct msm_kms *kms = priv->kms;
> -       struct msm_mdss *mdss = priv->mdss;
>          int ret, i;
> 
>          priv->wq = alloc_ordered_workqueue("msm", 0);
> @@ -538,12 +529,12 @@ static int msm_drm_init(struct device *dev, const
> 
>          ret = msm_init_vram(ddev);
>          if (ret)
> -               goto err_destroy_mdss;
> +               return ret;
> 
>          /* Bind all our sub-components: */
>          ret = component_bind_all(dev, ddev);
>          if (ret)
> -               goto err_destroy_mdss;
> +               return ret;
> 
>          dma_set_max_seg_size(dev, UINT_MAX);
> 
> @@ -649,10 +640,6 @@ static int msm_drm_init(struct device *dev, const
>   err_msm_uninit:
>          msm_drm_uninit(dev);
>          return ret;
> -err_destroy_mdss:
> -       if (mdss && mdss->funcs)
> -               mdss->funcs->destroy(ddev);
> -       return ret;
>   }
> 
>   /*
> @@ -1424,9 +1411,20 @@ static int msm_pdev_probe(struct platform_device
> 
>   static int msm_pdev_remove(struct platform_device *pdev)
>   {
> +       struct drm_device *ddev = platform_get_drvdata(pdev);
> +       struct msm_drm_private *priv = ddev->dev_private;
> +       struct msm_mdss *mdss = priv->mdss;
> +
>          component_master_del(&pdev->dev, &msm_drm_ops);
> +
>          of_platform_depopulate(&pdev->dev);
> 
> +       if (mdss && mdss->funcs)
> +               mdss->funcs->destroy(ddev);
> +
> +       ddev->dev_private = NULL;
> +       drm_dev_put(ddev);
> +
>          return 0;
>   }
> 
> 
> 

Hello,
I had a chance to get back to this patch... and there's a bit more to do...

Applying your suggestion makes the kernel crash when removing the DSI panel:

[   92.084668] Unable to handle kernel paging request at virtual address 
ffffdd7f137945d8

[   92.092848] Mem abort info:

[   92.095758]   ESR = 0x96000007

[   92.098918]   EC = 0x25: DABT (current EL), IL = 32 bits

[   92.104395]   SET = 0, FnV = 0

[   92.107545]   EA = 0, S1PTW = 0

[   92.110785]   FSC = 0x07: level 3 translation fault

[   92.115802] Data abort info:

[   92.118767]   ISV = 0, ISS = 0x00000007

[   92.122720]   CM = 0, WnR = 0

[   92.125770] swapper pgtable: 4k pages, 48-bit VAs, pgdp=0000000082466000

[   92.132668] [ffffdd7f137945d8] pgd=100000017ffff003, p4d=100000017ffff003, 
pud=10000001034bb003, pmd=1000000108ec2003, pte=0000000000000000

[   92.145530] Internal error: Oops: 96000007 [#1] SMP

[   92.150557] Modules linked in: af_alg ipv6 uvcvideo videobuf2_vmalloc 
snd_soc_hdmi_codec venus_enc venus_dec videobuf2_dma_contig videobuf2_memops 
cdc_ether usbnet hci_uart ath10k_snoc msm venus_core r8152 ath10k_core btqca btbcm 
v4l2_mem2mem ti_sn65dsi86(-) ath gpu_sched videobuf2_v4l2 sx9310 cros_ec_typec 
drm_dp_aux_bus bluetooth mac80211 snd_soc_rt5682_i2c qrtr typec drm_kms_helper 
sbs_battery snd_soc_rt5682 videobuf2_common cros_usbpd_charger cros_usbpd_logger 
cros_ec_chardev elan_i2c pwm_cros_ec industrialio_triggered_buffer qcom_q6v5_mss 
videodev snd_soc_rl6231 kfifo_buf qcom_spmi_adc5 drm snd_soc_sc7180 
qcom_vadc_common qcom_pil_info qcom_spmi_temp_alarm ecdh_generic crct10dif_ce 
libarc4 mc snd_soc_qcom_common ecc qcom_stats qcom_q6v5 ipa cfg80211 
snd_soc_lpass_sc7180 i2c_qcom_geni reset_qcom_pdc qcom_sysmon dispcc_sc7180 
spi_geni_qcom snd_soc_lpass_hdmi videocc_sc7180 qcom_common qcom_glink_smem 
snd_soc_lpass_cpu spi_qcom_qspi lpasscorecc_sc7180 qmi_helpers gpucc_sc7180

[   92.150710]  snd_soc_lpass_platform icc_osm_l3 mdt_loader qcom_wdt 
snd_soc_max98357a socinfo rmtfs_mem pwm_bl rfkill uinput btrfs blake2b_generic 
libcrc32c xor xor_neon raid6_pq zstd_compress cuse fuse [last unloaded: panel_edp]

[   92.239499] CPU: 2 PID: 1627 Comm: rmmod Not tainted 5.16.0-rc2-next-20211125+ #29

[   92.239508] Hardware name: Google Lazor Limozeen without Touchscreen (rev5 - 
rev8) (DT)

[   92.239512] pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)

[   92.239518] pc : drm_panel_disable+0x80/0xe0 [drm]

[   92.268628] rfkill: input handler enabled

[   92.276336] lr : drm_panel_disable+0x6c/0xe0 [drm]

[   92.297469] sp : ffff80000c7c38a0

[   92.297474] x29: ffff80000c7c38a0 x28: ffffdd7f136e6e68 x27: ffff280ed1801400

[   92.308207] x26: ffff280ec46c5080 x25: ffff280ec46b3880 x24: ffffdd7f1341e6f8

[   92.315534] x23: 0000000000000038 x22: ffff280ec46c50d8 x21: ffff280ec0a28e00

[   92.322858] x20: 0000000000000000 x19: ffff280ec3de7c80 x18: 0000000000000020

[   92.330191] x17: 0000000000000000 x16: ffffdd7f4b7acec0 x15: 0000000000000000

[   92.337531] x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000

[   92.344859] x11: 0000000000000000 x10: 0000000000000000 x9 : ffffdd7f13335000

[   92.352182] x8 : ffff280f03fed280 x7 : 0000000000000001 x6 : ffff280edf1c2600

[   92.359504] x5 : 0000000000000002 x4 : ffff280f03fed280 x3 : ffff280ec4689820

[   92.366835] x2 : 0000000000000000 x1 : ffffdd7f137945c8 x0 : 0000000000000000

[   92.374159] Call trace:

[   92.376682]  drm_panel_disable+0x80/0xe0 [drm]

[   92.381367]  panel_bridge_disable+0x18/0x2c [drm_kms_helper]

[   92.387281]  drm_atomic_bridge_chain_disable+0x98/0xd0 [drm]

[   92.393194]  disable_outputs+0xfc/0x31c [drm_kms_helper]

[   92.398738]  drm_atomic_helper_commit_modeset_disables+0x20/0x50 [drm_kms_helper]

[   92.406482]  msm_atomic_commit_tail+0x188/0x500 [msm]

[   92.411772]  commit_tail+0xa4/0x184 [drm_kms_helper]

[   92.416954]  drm_atomic_helper_commit+0x164/0x3fc [drm_kms_helper]

[   92.423373]  drm_atomic_commit+0x50/0x60 [drm]

[   92.428064]  drm_atomic_helper_disable_all+0x1f8/0x20c [drm_kms_helper]

[   92.434989]  drm_atomic_helper_shutdown+0x80/0x130 [drm_kms_helper]

[   92.441497]  msm_drm_uninit.isra.0+0x14c/0x174 [msm]

[   92.446729]  msm_drm_unbind+0x14/0x20 [msm]

[   92.451125]  component_del+0xa8/0x160

[   92.454898]  dsi_dev_detach+0x24/0x30 [msm]

[   92.459294]  dsi_host_detach+0x20/0x64 [msm]

[   92.463764]  devm_mipi_dsi_detach+0x2c/0x40

[   92.468069]  devm_action_release+0x18/0x24

[   92.472278]  devres_release_group+0x100/0x1b0

[   92.476755]  i2c_device_remove+0x48/0xf0

[   92.480790]  __device_release_driver+0x188/0x23c

[   92.485534]  driver_detach+0xfc/0x1e0

[   92.489303]  bus_remove_driver+0x5c/0xd0

[   92.493333]  driver_unregister+0x34/0x64

[   92.497363]  i2c_del_driver+0x58/0x70

[   92.501134]  ti_sn65dsi86_exit+0x44/0x98c [ti_sn65dsi86]

[   92.506611]  __arm64_sys_delete_module+0x198/0x22c

[   92.511535]  invoke_syscall+0x48/0x114

[   92.515389]  el0_svc_common.constprop.0+0x44/0xec

[   92.520223]  do_el0_svc+0x28/0x90

[   92.523629]  el0_svc+0x20/0x60

[   92.526780]  el0t_64_sync_handler+0xec/0xf0

[   92.531085]  el0t_64_sync+0x1a0/0x1a4

[   92.534879] Code: f94013f5 52800000 f9400a61 b40000a1 (f9400821)

[   92.541134] ---[ end trace 1bc553757c40a199 ]---



I'll look into this.
In the meanwhile, if anyone has any suggestion before I solve this issue,
as to speed up getting this fix done (as it's pretty much critical), you're
welcome.
