Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E77B0A8B8ED
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 14:26:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3725A10E8E6;
	Wed, 16 Apr 2025 12:26:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JAF4hkeC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A4A810E8E4;
 Wed, 16 Apr 2025 12:26:25 +0000 (UTC)
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 18B80446;
 Wed, 16 Apr 2025 14:24:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1744806259;
 bh=zZyoUoQs57ugcr6pi7AFEtiMgwqRDtvhMHoc4UZWdWY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=JAF4hkeCioakqnxQz9bTUPttghD/RANLFweNIr16lzd8pBObABa768eAO0Ei9TL72
 7cO7bfN79c4QAdYcmgkJgHS8kooHXkT81GJvZaMYZgJWIFvPnZjQhsTBa/3cZFLcSN
 tTqDr7CfXSzOZtaSh9msG9GiqvphRDXZnigsfMjA=
Message-ID: <f5880400-ab7b-4cae-81e4-893ce34a0460@ideasonboard.com>
Date: Wed, 16 Apr 2025 15:26:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 29/34] drm: zynqmp_dp: convert to devm_drm_bridge_alloc()
 API
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Anusha Srivatsa <asrivats@redhat.com>,
 Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>,
 =?UTF-8?Q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>,
 Hui Pu <Hui.Pu@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 Michal Simek <michal.simek@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Douglas Anderson
 <dianders@chromium.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Sagar, Vishal" <vishal.sagar@amd.com>
References: <20250407-drm-bridge-convert-to-alloc-api-v1-0-42113ff8d9c0@bootlin.com>
 <20250407-drm-bridge-convert-to-alloc-api-v1-29-42113ff8d9c0@bootlin.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20250407-drm-bridge-convert-to-alloc-api-v1-29-42113ff8d9c0@bootlin.com>
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

Hi,

On 07/04/2025 17:23, Luca Ceresoli wrote:
> This is the new API for allocating DRM bridges.
> 
> This driver has a peculiar structure. zynqmp_dpsub.c is the actual driver,
> which delegates to a submodule (zynqmp_dp.c) the allocation of a
> sub-structure embedding the drm_bridge and its initialization, however it
> does not delegate the drm_bridge_add(). Hence, following carefully the code
> flow, it is correct to change the allocation function and .funcs assignment
> in the submodule, while the drm_bridge_add() is not in that submodule.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Michal Simek <michal.simek@amd.com>
> Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>   drivers/gpu/drm/xlnx/zynqmp_dp.c | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> index 11d2415fb5a1f7fad03421898331289f2295d68b..de22b6457a78a7a2110f9f308d0b5a8700544010 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> @@ -2439,9 +2439,9 @@ int zynqmp_dp_probe(struct zynqmp_dpsub *dpsub)
>   	struct zynqmp_dp *dp;
>   	int ret;
>   
> -	dp = kzalloc(sizeof(*dp), GFP_KERNEL);
> -	if (!dp)
> -		return -ENOMEM;
> +	dp = devm_drm_bridge_alloc(&pdev->dev, struct zynqmp_dp, bridge, &zynqmp_dp_bridge_funcs);
> +	if (IS_ERR(dp))
> +		return PTR_ERR(dp);
>   
>   	dp->dev = &pdev->dev;
>   	dp->dpsub = dpsub;
> @@ -2488,7 +2488,6 @@ int zynqmp_dp_probe(struct zynqmp_dpsub *dpsub)
>   
>   	/* Initialize the bridge. */
>   	bridge = &dp->bridge;
> -	bridge->funcs = &zynqmp_dp_bridge_funcs;
>   	bridge->ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID
>   		    | DRM_BRIDGE_OP_HPD;
>   	bridge->type = DRM_MODE_CONNECTOR_DisplayPort;
> 

I haven't had time to look at this more, but jfyi: I got this when 
unloading modules, but it doesn't seem to happen every time:

[  103.010533] ------------[ cut here ]------------
[  103.015415] refcount_t: underflow; use-after-free.
[  103.020657] WARNING: CPU: 2 PID: 392 at lib/refcount.c:28 
refcount_warn_saturate+0xf4/0x148
[  103.029056] Modules linked in: zynqmp_dpsub(-) display_connector 
drm_display_helper drm_dma_helper drm_kms_helper drm drm_p
anel_orientation_quirks
[  103.042437] CPU: 2 UID: 0 PID: 392 Comm: rmmod Not tainted 
6.15.0-rc2+ #3 PREEMPT
[  103.050035] Hardware name: ZynqMP ZCU106 RevA (DT)
[  103.054836] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS 
BTYPE=--)
[  103.061814] pc : refcount_warn_saturate+0xf4/0x148
[  103.066632] lr : refcount_warn_saturate+0xf4/0x148
[  103.071441] sp : ffff800083b5bbb0
[  103.074766] x29: ffff800083b5bbb0 x28: ffff000806b23780 x27: 
0000000000000000
[  103.081953] x26: 0000000000000000 x25: 0000000000000000 x24: 
ffff000801a68400
[  103.089141] x23: ffff800081311a20 x22: ffff800083b5bc38 x21: 
ffff000801a68010
[  103.096329] x20: ffff0008040676c0 x19: ffff000804067240 x18: 
0000000000000006
[  103.103517] x17: 2e30303030303464 x16: 662d7968703a7968 x15: 
ffff800083b5b5a0
[  103.110705] x14: 0000000000000000 x13: 00000000000c0000 x12: 
0000000000000000
[  103.117892] x11: ffff80008163d6bc x10: 0000000000000028 x9 : 
ffff800080ead38c
[  103.125080] x8 : ffff800083b5b908 x7 : 0000000000000000 x6 : 
ffff800083b5b9c0
[  103.132268] x5 : ffff800083b5b948 x4 : 0000000000000001 x3 : 
00000000000000db
[  103.139455] x2 : 0000000000000000 x1 : 0000000000000000 x0 : 
ffff000806b23780
[  103.146644] Call trace:
[  103.149102]  refcount_warn_saturate+0xf4/0x148 (P)
[  103.153918]  drm_bridge_put.part.0+0x88/0xa0 [drm]
[  103.159188]  drm_bridge_put_void+0x1c/0x38 [drm]
[  103.164231]  devm_action_release+0x1c/0x30
[  103.168354]  release_nodes+0x68/0xa8
[  103.171957]  devres_release_all+0x98/0xf0
[  103.175993]  device_unbind_cleanup+0x20/0x70
[  103.180291]  device_release_driver_internal+0x208/0x250
[  103.185542]  driver_detach+0x54/0xa8
[  103.189145]  bus_remove_driver+0x78/0x108
[  103.193181]  driver_unregister+0x38/0x70
[  103.197131]  platform_driver_unregister+0x1c/0x30
[  103.201862]  zynqmp_dpsub_driver_exit+0x18/0x1100 [zynqmp_dpsub]
[  103.207931]  __arm64_sys_delete_module+0x1a8/0x2d0
[  103.212748]  invoke_syscall+0x50/0x120
[  103.216524]  el0_svc_common.constprop.0+0x48/0xf0
[  103.221256]  do_el0_svc+0x24/0x38
[  103.224598]  el0_svc+0x48/0x128
[  103.227766]  el0t_64_sync_handler+0x10c/0x138
[  103.232150]  el0t_64_sync+0x1a4/0x1a8
[  103.235841] irq event stamp: 7936
[  103.239173] hardirqs last  enabled at (7935): [<ffff8000800aaf78>] 
finish_task_switch.isra.0+0xb0/0x2a0
[  103.248600] hardirqs last disabled at (7936): [<ffff800080eaac74>] 
el1_dbg+0x24/0x90
[  103.256369] softirqs last  enabled at (7930): [<ffff800080066f98>] 
handle_softirqs+0x4a0/0x4c0
[  103.265007] softirqs last disabled at (7905): [<ffff800080010224>] 
__do_softirq+0x1c/0x28
[  103.273211] ---[ end trace 0000000000000000 ]---

  Tomi

