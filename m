Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A9E5B812C
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 08:02:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF9C910E78F;
	Wed, 14 Sep 2022 06:01:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FD2A10E560;
 Wed, 14 Sep 2022 06:01:52 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A4684617FE;
 Wed, 14 Sep 2022 06:01:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02E79C433D6;
 Wed, 14 Sep 2022 06:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663135311;
 bh=fYar8ghS4OUdVFgdAeY840z/WV0wqwrpaBV4nR+aLKY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ltBdMgXO1PHwNLPbX63MHzNGNlpZM5ZfSGHmgXIxTclCem6qRPG190lfdxQMQ84Zk
 XdgqMSY3Ge4OYq+cwwwFa/LF3Mjw6pnUw6OZcf9kRoHqNpWj0zb2w5rJGtX6mZ9VFj
 y8EMDgNqjwCCW+LjNXkF0o+x/jOZiJyxOr+Q3XFTYyJDmoviyGZXWPPXlO6uJjVn8R
 J6CEJMMQhBDN+pDN+4q2L9vqrLMQP6FSHAzVFqyrv4Ap5cHpmhxH08pIcUxvtahDB9
 0qZGdFOGI+GwTj51TvD2fkCB0o1/C6qyWZREXXnkLhYuSKIlRc6viE7RNzGoEi4X+I
 kOgofLNrZovcg==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1oYLT5-0002lj-Cy; Wed, 14 Sep 2022 08:01:51 +0200
Date: Wed, 14 Sep 2022 08:01:51 +0200
From: Johan Hovold <johan@kernel.org>
To: Steev Klimaszewski <steev@kali.org>
Subject: Re: [PATCH v2 00/10] drm/msm: probe deferral fixes
Message-ID: <YyFuT9N0f8bg0epk@hovoldconsulting.com>
References: <20220913085320.8577-1-johan+linaro@kernel.org>
 <ca6a97c5-1abe-b215-0ff2-443f4ed9a25f@kali.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ca6a97c5-1abe-b215-0ff2-443f4ed9a25f@kali.org>
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
Cc: dri-devel@lists.freedesktop.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org,
 Jonas Karlman <jonas@kwiboo.se>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>, freedreno@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, Robert Foss <robert.foss@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linux-arm-msm@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 13, 2022 at 03:23:10PM -0500, Steev Klimaszewski wrote:
> Hi Johan,
> 
> On 9/13/22 3:53 AM, Johan Hovold wrote:
> > The MSM DRM driver is currently broken in multiple ways with respect to
> > probe deferral. Not only does the driver currently fail to probe again
> > after a late deferral, but due to a related use-after-free bug this also
> > triggers NULL-pointer dereferences.

> > In some cases, such has for the DP IRQ, the above situation can also be
> > avoided by moving the allocation in question to the platform driver
> > probe (d0) or component bind (between d2 and d3). But as doing so is not
> > a general fix, this can be done later as a cleanup/optimisation.

> I've tested this on both sc8180x (Lenovo Flex 5G) and sdm850 (Lenovo 
> Yoga C630), and both of them show the same issue:

[ Copied the below from IRC instead as the formatting in your mail was
off. ]

> [    7.449305] platform ae9a000.displayport-controller: Fixing up cyclic dependency with ae01000.mdp
> [    7.454344] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000008
> [    7.454406] Mem abort info:
> [    7.454423]   ESR = 0x0000000096000004
> [    7.454446]   EC = 0x25: DABT (current EL), IL = 32 bits
> [    7.454475]   SET = 0, FnV = 0
> [    7.454494]   EA = 0, S1PTW = 0
> [    7.454512]   FSC = 0x04: level 0 translation fault
> [    7.454539] Data abort info:
> [    7.454556]   ISV = 0, ISS = 0x00000004
> [    7.454577]   CM = 0, WnR = 0
> [    7.454595] user pgtable: 4k pages, 48-bit VAs, pgdp=0000000101504000
> [    7.454629] [0000000000000008] pgd=0000000000000000, p4d=0000000000000000
> [    7.454669] Internal error: Oops: 96000004 [#1] PREEMPT SMP
> [    7.454700] Modules linked in: i2c_hid_of i2c_hid leds_qcom_lpg led_class_multicolor rtc_pm8xxx msm mdt_loader gpu_sched drm_dp_aux_bus drm_display_helper drm_kms_helper drm phy_qcom_edp llcc_qcom i2c_qcom_geni phy_qcom_qmp_combo phy_qcom_snps_femto_v2 phy_qcom_qmp_ufs phy_qcom_qmp_pcie ufs_qcom pwm_bl
> [    7.454860] CPU: 2 PID: 76 Comm: kworker/u16:2 Not tainted 5.19.0-rc8-next-20220728 #26
> [    7.454902] Hardware name: LENOVO 82AK/LNVNB161216, BIOS EACN43WW(V1.15) 09/13/2021
> [    7.454941] Workqueue: events_unbound deferred_probe_work_func
> [    7.454982] pstate: 40400005 (nZcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [    7.455020] pc : dp_display_request_irq+0x50/0xdc [msm]
> [    7.455145] lr : dp_display_request_irq+0x2c/0xdc [msm]
> [    7.455265] sp : ffff800008c1bb30
> [    7.455285] x29: ffff800008c1bb30 x28: 0000000000000000 x27: 0000000000000000
> [    7.455327] x26: ffffc9c918420000 x25: ffffc9c9186ec570 x24: 000000000000003a
> [    7.455368] x23: ffffc9c918811d30 x22: ffff2a5806baa998 x21: ffff2a5806ba3410
> [    7.455410] x20: ffff2a5806baa880 x19: ffff2a5806baa998 x18: ffffffffffffffff
> [    7.455451] x17: 0000000000000038 x16: ffffc9c9164eeb24 x15: ffffffffffffffff
> [    7.455492] x14: ffff2a5806bc3004 x13: ffff2a5806bc3000 x12: 0000000000000000
> [    7.455533] x11: 0000000000000040 x10: ffffc9c918493080 x9 : ffffc9c918493078
> [    7.455574] x8 : ffff2a5800681b88 x7 : 0000000000000000 x6 : ffff2a5806baa880
> [    7.455616] x5 : ffffc9c8ca2de000 x4 : 0000000000080004 x3 : 0000000000000000
> [    7.455656] x2 : ffffc9c8ca296000 x1 : 00000000000000a8 x0 : 0000000000000000
> [    7.455698] Call trace:
> [    7.455714]  dp_display_request_irq+0x50/0xdc [msm]
> [    7.455834]  dp_display_probe+0xf8/0x4a4 [msm]
> [    7.455950]  platform_probe+0x6c/0xc4
> [    7.455976]  really_probe+0xbc/0x2d4
> [    7.455999]  __driver_probe_device+0x78/0xe0
> [    7.456025]  driver_probe_device+0x3c/0x13c
> [    7.456051]  __device_attach_driver+0xb8/0x120
> [    7.456077]  bus_for_each_drv+0x78/0xd0
> [    7.456105]  __device_attach+0x9c/0x1a0
> [    7.456129]  device_initial_probe+0x18/0x2c
> [    7.456154]  bus_probe_device+0x9c/0xa4
> [    7.456178]  deferred_probe_work_func+0x88/0xc0
> [    7.456204]  process_one_work+0x1d4/0x330
> [    7.456231]  worker_thread+0x70/0x42c
> [    7.456255]  kthread+0x10c/0x110
> [    7.456278]  ret_from_fork+0x10/0x20
> [    7.456306] Code: aa1403e6 f2a00104 f0000225 f0ffffe2 (f9400400)
> [    7.456341] ---[ end trace 0000000000000000 ]---

> This is from the sc8180x, sdm850 is the same call stack, just with 
> different addresses.
> 
> I do have 
> https://lore.kernel.org/all/20220712132258.671263-1-dmitry.baryshkov@linaro.org/ 
> applied here which makes the 10th patch not apply cleanly.

Yeah, that is expected. You need to drop Dmitry's series first. Once you
verified that this series works, you can add it back if you want but you
then need to restore the device pointer used when allocating the irq in
dp_display_request_irq():

-       rc = devm_request_irq(dp_display->drm_dev->dev, dp->irq,
+       rc = devm_request_irq(&dp->pdev->dev, dp->irq,
 
> It fails actually, but I applied it manually here.

Please drop that series and give this one another spin.

Johan
