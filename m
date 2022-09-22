Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A41FE5E6B5E
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 21:00:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD85210E068;
	Thu, 22 Sep 2022 19:00:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 433 seconds by postgrey-1.36 at gabe;
 Thu, 22 Sep 2022 18:59:57 UTC
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 795F710E067;
 Thu, 22 Sep 2022 18:59:57 +0000 (UTC)
Received: from g550jk.localnet (212095005231.public.telering.at [212.95.5.231])
 by mail.z3ntu.xyz (Postfix) with ESMTPSA id CE32AC6F7E;
 Thu, 22 Sep 2022 18:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
 t=1663872732; bh=KdT3GQnKbtD+Gy6qAnxENeBL3H5RB8RdcqUSV2ItXfQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Zs10k8aMASZB+UpMveA+AwZ+V9OkKQRREY31HGRvnVoVK/+q+SeAoc8a52rBQ4FFY
 ngu9zfpnekmPh+u4QFhO2SHN/tI2+wRM19f7yz8Jdgx6jN6mf0voGBzQkPgU3uIxAy
 O/4qbsZeBVSVHo1/w7Fxawo1InI/d7LWgTTcKMkk=
From: Luca Weiss <luca@z3ntu.xyz>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v1 1/4] drm/msm/mdp5: stop overriding drvdata
Date: Thu, 22 Sep 2022 20:52:08 +0200
Message-ID: <10146868.nUPlyArG6x@g550jk>
In-Reply-To: <20220620213054.1872954-2-dmitry.baryshkov@linaro.org>
References: <20220620213054.1872954-1-dmitry.baryshkov@linaro.org>
 <20220620213054.1872954-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

On Montag, 20. Juni 2022 23:30:51 CEST Dmitry Baryshkov wrote:
> The rest of the code expects that master's device drvdata is the
> struct msm_drm_private instance. Do not override the mdp5's drvdata.
> 
> Fixes: 6874f48bb8b0 ("drm/msm: make mdp5/dpu devices master components")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

In search of a fix for a problem on msm8974/msm8226 crashing during shutdown
I tried applying this patch.
On top of 6.0-rc6 with some of my patches incl. adding display support to
msm8226 which generally works fine without this patch, plus only this patch on
top.

Unfortunately it seems display isn't probing anymore and I'm getting a null
pointer dereference in dmesg as seen below.

Hope that's helpful so you can fix that ;)

Regards
Luca

[    2.616083] platform fd922800.dsi: Fixing up cyclic dependency with fd900100.mdp
[    2.636031] msm_mdp fd900100.mdp: No interconnect support may cause display underflows!
[    2.638435] [drm] using 32m VRAM carveout
[    2.646026] msm_mdp fd900100.mdp: [drm:msm_drm_bind [msm]] VRAM: 1c100000->1e100000
[    2.647055] msm_mdp fd900100.mdp: bound fd922800.dsi (ops dsi_ops [msm])
[    2.654642] 8<--- cut here ---
[    2.662750] Unable to handle kernel NULL pointer dereference at virtual address 000004d8
[    2.664358] [000004d8] *pgd=00000000
[    2.672610] Internal error: Oops: 5 [#1] PREEMPT SMP ARM
[    2.676106] Modules linked in: msm gpu_sched qnoc_msm8974 icc_smd_rpm
[    2.681403] CPU: 0 PID: 108 Comm: kworker/u2:5 Not tainted 6.0.0-rc6-00034-g3b2cf6d374af #217
[    2.687746] Hardware name: Generic DT based system
[    2.696242] Workqueue: events_unbound deferred_probe_work_func
[    2.700931] PC is at mdp5_runtime_resume+0x30/0x168 [msm]
[    2.706747] LR is at mdp5_runtime_resume+0x30/0x168 [msm]
[    2.712217] pc : [<bf044794>]    lr : [<bf044794>]    psr: 60000013
[    2.717598] sp : d0a49a48  ip : bf0c0370  fp : c196d094
[    2.723671] r10: c036a9dc  r9 : c2bfabc0  r8 : 00000000
[    2.728880] r7 : c3079c94  r6 : c196d010  r5 : c08fab08  r4 : 00000000
[    2.734092] r3 : c2bfabc0  r2 : 00000000  r1 : 00000000  r0 : 00000002
[    2.740691] Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
[    2.747204] Control: 10c5387d  Table: 1307006a  DAC: 00000051
[    2.754403] Register r0 information: non-paged memory
[    2.760129] Register r1 information: NULL pointer
[    2.765163] Register r2 information: NULL pointer
[    2.769850] Register r3 information: slab task_struct start c2bfabc0 pointer offset 0
[    2.774550] Register r4 information: NULL pointer
[    2.782350] Register r5 information: non-slab/vmalloc memory
[    2.787041] Register r6 information: slab kmalloc-1k start c196d000 pointer offset 16 size 1024
[    2.792781] Register r7 information: slab kmalloc-1k start c3079c00 pointer offset 148 size 1024
[    2.801201] Register r8 information: NULL pointer
[    2.810216] Register r9 information: slab task_struct start c2bfabc0 pointer offset 0
[    2.814827] Register r10 information: non-slab/vmalloc memory
[    2.822631] Register r11 information: slab kmalloc-1k start c196d000 pointer offset 148 size 1024
[    2.828371] Register r12 information: 242-page vmalloc region starting at 0xbf025000 allocated at load_module+0x9a4/0x1f44
[    2.837233] Process kworker/u2:5 (pid: 108, stack limit = 0x(ptrval))
[    2.848155] Stack: (0xd0a49a48 to 0xd0a4a000)
[    2.854665] 9a40:                   c3079c10 c08fab08 c196d010 c08fd82c c3079c10 c08fab08
[    2.859020] 9a60: c196d010 00000004 d0a49a9c c2bfabc0 c036a9dc c08fd9a8 c3079c10 c08fab08
[    2.867179] 9a80: c196d010 c08fd0f8 c3079c10 00000000 0bebc200 00000000 ffffffff ffadf800
[    2.875339] 9aa0: 8807ce68 a6e11243 d0940100 60000013 00000004 c3079c94 c307e840 c3079c10
[    2.883499] 9ac0: c3079c10 00000001 c152654c c08fd484 c306b040 c3079c00 c11d4314 bf044ab8
[    2.891658] 9ae0: c3079c10 d0a49b34 c3207900 00000018 c3080400 c3080400 00000000 c0dd2950
[    2.899818] 9b00: d0a49b14 a6e11243 3f0c81c2 c0dd29d0 c1179a84 bf0c0710 c3219ec0 d0a49b34
[    2.907977] 9b20: 00000004 c0492c60 00000000 c0dd2d18 d0a49b48 c117985c c307ea34 c3080400
[    2.916137] 9b40: 00000000 c3079c10 cbf5b000 a6e11243 00000001 c307e840 c3080400 00000000
[    2.924297] 9b60: c3079c10 cbf5b000 c307e840 00000001 c152654c bf071b38 1e100000 00000000
[    2.932457] 9b80: 00000000 a6e11243 00000001 c307fc08 00000001 c307fc08 c3079dc0 a0000113
[    2.940617] 9ba0: c152654c a6e11243 c152654c c3202300 c3202300 c3207900 c1526568 c32078c0
[    2.948776] 9bc0: 00000018 00000001 c152654c c08e6a70 00000001 c3202300 00000000 c3207900
[    2.956935] 9be0: 00000000 c3202300 c1526560 bf0b81d4 00000000 c0e9531c c1805800 c08e6d3c
[    2.965096] 9c00: c307ec40 c307fc08 c307fc08 00000000 c1526570 bf096abc c307fc00 c3203340
[    2.973256] 9c20: c307fc08 c08e61a4 c0ea4380 d0a49c30 000000ff 000000ff 00000000 00000000
[    2.981415] 9c40: 00000001 00000000 00000000 a6e11243 c307fc08 00000000 c15264f4 c08eed68
[    2.989575] 9c60: c307fc08 c15264f4 c307fc08 0000001d c1526570 c08ef010 c15cc76c c15264f4
[    2.997734] 9c80: c307fc08 c08ef0a0 00000001 c15264f4 d0a49cdc c307fc08 c1526570 c08ef690
[    3.005895] 9ca0: 00000000 d0a49cdc c08ef5fc c15cc740 c1526570 c08ecfa4 c1805800 c194f06c
[    3.014055] 9cc0: c1af8038 a6e11243 c307fc08 00000001 c307fc4c c08ef34c c307fc08 c307fc08
[    3.022213] 9ce0: 00000001 a6e11243 c307fc08 c307fc08 c152624c c08ee038 c307fc08 00000000
[    3.030374] 9d00: c307ac10 c08eab20 c307fc9c 60000113 00000001 c03a8660 d0a49d58 a6e11243
[    3.038534] 9d20: c307fc08 c32020c0 c32020c0 c307fc08 00000000 a6e11243 c307fc00 c307fc00
[    3.046692] 9d40: d0a49d88 c307ec40 c307fc08 00000000 c15818c0 c1812005 c1805800 c08d4d1c
[    3.054852] 9d60: cbdd8020 00000000 c307ec40 c11548e4 00000000 c08d4e60 00000000 00000000
[    3.063012] 9d80: d0a49dfc 00000000 3234676c 00003733 00000000 00000000 00000000 00000000
[    3.071172] 9da0: cbdd8020 a6e11243 00000000 c307ec40 00000000 cbdd7724 c3208cc0 bf098170
[    3.079331] 9dc0: bf0dc6fc bf09a80c c3217240 c3208cc0 00000000 c307ac00 cbdd7724 00000000
[    3.087491] 9de0: c15818c0 c1812005 c1805800 bf095c98 00000000 d0a49dfc 00000000 cbdd831c
[    3.095650] 9e00: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    3.103810] 9e20: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    3.111971] 9e40: 00000000 a6e11243 bf0daf30 00000000 c307ac10 bf0daf30 00000000 c08f155c
[    3.120130] 9e60: c307ac10 00000000 bf0daf30 c08eed68 c307ac10 bf0daf30 c307ac10 0000001d
[    3.128289] 9e80: 00000000 c08ef010 c15cc76c bf0daf30 c307ac10 c08ef0a0 00000001 bf0daf30
[    3.136449] 9ea0: d0a49eec c307ac10 00000000 c08ef690 00000000 d0a49eec c08ef5fc 00000000
[    3.144610] 9ec0: 00000000 c08ecfa4 c1805800 c188e86c c30f2938 a6e11243 c307ac10 00000001
[    3.152770] 9ee0: c307ac54 c08ef34c c15818c0 c307ac10 00000001 a6e11243 c307ac10 c307ac10
[    3.160928] 9f00: c1526b10 c08ee038 c307ac10 c1526858 c152686c c08ee478 c1526890 c3017200
[    3.169089] 9f20: c1805800 c1812000 00000000 c033fbf0 c2bfabc0 c1805800 c180581c c3017200
[    3.177249] 9f40: c1805800 c3017218 c180581c c1403d40 c2bfabc0 00000088 c1805800 c0340304
[    3.185409] 9f60: 00000000 c0de2740 00000000 c3013500 c03402c0 c3017200 c2bfabc0 c30134c0
[    3.193567] 9f80: d0a2deb8 00000000 00000000 c034665c c3013500 c0346564 00000000 00000000
[    3.201727] 9fa0: 00000000 00000000 00000000 c0300148 00000000 00000000 00000000 00000000
[    3.209886] 9fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    3.218046] 9fe0: 00000000 00000000 00000000 00000000 00000013 00000000 00000000 00000000
[    3.226210]  mdp5_runtime_resume [msm] from __rpm_callback+0x3c/0x168
[    3.234359]  __rpm_callback from rpm_callback+0x50/0x54
[    3.240774]  rpm_callback from rpm_resume+0x424/0x77c
[    3.245809]  rpm_resume from __pm_runtime_resume+0x34/0x6c
[    3.251019]  __pm_runtime_resume from mdp5_kms_init+0x1ec/0xee0 [msm]
[    3.256405]  mdp5_kms_init [msm] from msm_drm_bind+0x138/0x610 [msm]
[    3.262915]  msm_drm_bind [msm] from try_to_bring_up_aggregate_device+0x168/0x1c4
[    3.269345]  try_to_bring_up_aggregate_device from __component_add+0x98/0x13c
[    3.276717]  __component_add from dsi_host_attach+0x88/0x11c [msm]
[    3.283834]  dsi_host_attach [msm] from lgd_lg4237_probe+0xfc/0x1b4
[    3.289911]  lgd_lg4237_probe from really_probe+0xc8/0x2ec
[    3.296070]  really_probe from __driver_probe_device+0x84/0xe4
[    3.301626]  __driver_probe_device from driver_probe_device+0x30/0x104
[    3.307444]  driver_probe_device from __device_attach_driver+0x94/0x108
[    3.313954]  __device_attach_driver from bus_for_each_drv+0x88/0xd4
[    3.320465]  bus_for_each_drv from __device_attach+0xa8/0x1bc
[    3.326712]  __device_attach from bus_probe_device+0x84/0x8c
[    3.332616]  bus_probe_device from device_add+0x39c/0x8d8
[    3.338344]  device_add from mipi_dsi_device_register_full+0xc4/0x140
[    3.343643]  mipi_dsi_device_register_full from mipi_dsi_host_register+0xc8/0x170
[    3.350072]  mipi_dsi_host_register from msm_dsi_host_register+0x34/0x4c [msm]
[    3.357538]  msm_dsi_host_register [msm] from msm_dsi_manager_register+0x110/0x1d0 [msm]
[    3.364659]  msm_dsi_manager_register [msm] from dsi_dev_probe+0x17c/0x22c [msm]
[    3.372903]  dsi_dev_probe [msm] from platform_probe+0x5c/0xb0
[    3.380274]  platform_probe from really_probe+0xc8/0x2ec
[    3.385913]  really_probe from __driver_probe_device+0x84/0xe4
[    3.391383]  __driver_probe_device from driver_probe_device+0x30/0x104
[    3.397027]  driver_probe_device from __device_attach_driver+0x94/0x108
[    3.403538]  __device_attach_driver from bus_for_each_drv+0x88/0xd4
[    3.410048]  bus_for_each_drv from __device_attach+0xa8/0x1bc
[    3.416297]  __device_attach from bus_probe_device+0x84/0x8c
[    3.422198]  bus_probe_device from deferred_probe_work_func+0x78/0xa4
[    3.427930]  deferred_probe_work_func from process_one_work+0x1e4/0x510
[    3.434267]  process_one_work from worker_thread+0x44/0x510
[    3.440688]  worker_thread from kthread+0xf8/0x128
[    3.446242]  kthread from ret_from_fork+0x14/0x2c
[    3.451102] Exception stack(0xd0a49fb0 to 0xd0a49ff8)
[    3.455880] 9fa0:                                     00000000 00000000 00000000 00000000
[    3.460929] 9fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    3.469087] 9fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[    3.477242] Code: e3a00002 e3001370 e34b1f0c eb61bb8f (e59434d8) 
[    3.484215] ---[ end trace 0000000000000000 ]---


> ---
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c index c668a4b27cc6..daf5b5ca7233
> 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> @@ -203,7 +203,7 @@ static int mdp5_set_split_display(struct msm_kms *kms,
>  							  slave_encoder);
>  }
> 
> -static void mdp5_destroy(struct platform_device *pdev);
> +static void mdp5_destroy(struct mdp5_kms *mdp5_kms);
> 
>  static void mdp5_kms_destroy(struct msm_kms *kms)
>  {
> @@ -223,7 +223,7 @@ static void mdp5_kms_destroy(struct msm_kms *kms)
>  	}
> 
>  	mdp_kms_destroy(&mdp5_kms->base);
> -	mdp5_destroy(mdp5_kms->pdev);
> +	mdp5_destroy(mdp5_kms);
>  }
> 
>  #ifdef CONFIG_DEBUG_FS
> @@ -651,9 +651,8 @@ static int mdp5_kms_init(struct drm_device *dev)
>  	return ret;
>  }
> 
> -static void mdp5_destroy(struct platform_device *pdev)
> +static void mdp5_destroy(struct mdp5_kms *mdp5_kms)
>  {
> -	struct mdp5_kms *mdp5_kms = platform_get_drvdata(pdev);
>  	int i;
> 
>  	if (mdp5_kms->ctlm)
> @@ -667,7 +666,7 @@ static void mdp5_destroy(struct platform_device *pdev)
>  		kfree(mdp5_kms->intfs[i]);
> 
>  	if (mdp5_kms->rpm_enabled)
> -		pm_runtime_disable(&pdev->dev);
> +		pm_runtime_disable(&mdp5_kms->pdev->dev);
> 
>  	drm_atomic_private_obj_fini(&mdp5_kms->glob_state);
>  	drm_modeset_lock_fini(&mdp5_kms->glob_state_lock);
> @@ -816,8 +815,6 @@ static int mdp5_init(struct platform_device *pdev,
> struct drm_device *dev) goto fail;
>  	}
> 
> -	platform_set_drvdata(pdev, mdp5_kms);
> -
>  	spin_lock_init(&mdp5_kms->resource_lock);
> 
>  	mdp5_kms->dev = dev;
> @@ -915,7 +912,7 @@ static int mdp5_init(struct platform_device *pdev,
> struct drm_device *dev) return 0;
>  fail:
>  	if (mdp5_kms)
> -		mdp5_destroy(pdev);
> +		mdp5_destroy(mdp5_kms);
>  	return ret;
>  }
> 
> @@ -975,7 +972,8 @@ static int mdp5_dev_remove(struct platform_device *pdev)
> static __maybe_unused int mdp5_runtime_suspend(struct device *dev) {
>  	struct platform_device *pdev = to_platform_device(dev);
> -	struct mdp5_kms *mdp5_kms = platform_get_drvdata(pdev);
> +	struct msm_drm_private *priv = platform_get_drvdata(pdev);
> +	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(priv->kms));
> 
>  	DBG("");
> 
> @@ -985,7 +983,8 @@ static __maybe_unused int mdp5_runtime_suspend(struct
> device *dev) static __maybe_unused int mdp5_runtime_resume(struct device
> *dev) {
>  	struct platform_device *pdev = to_platform_device(dev);
> -	struct mdp5_kms *mdp5_kms = platform_get_drvdata(pdev);
> +	struct msm_drm_private *priv = platform_get_drvdata(pdev);
> +	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(priv->kms));
> 
>  	DBG("");




