Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E76668527
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 22:15:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98A3E10E083;
	Thu, 12 Jan 2023 21:14:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F06110E088
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 21:14:53 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20230112211451euoutp0187070ef0d59fb7304e789bfcfffa002d~5rDeXNFTD1744917449euoutp01f
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 21:14:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20230112211451euoutp0187070ef0d59fb7304e789bfcfffa002d~5rDeXNFTD1744917449euoutp01f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1673558091;
 bh=6gvN6Vw02mHX6P2a1AEN/GSBtOS5nJZK0sS3imtBBK4=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=VxU0PqPETrv9fzD8IrQUlKVdFbTw1fGMLVmwVacYtMCjbQzs67JvSEm/QLmDea/rr
 dZ+GptdUkzy2U+CUHkCA73BGr3JXBNnabdSoCSBzMOqxuLZj5+tqV4zFho2I8xHUp+
 q0y8MOhKGNHZIY9h7t5BwV+jfMzfDN1ZFg+vmYxI=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20230112211450eucas1p2a034073a6085098348863bfe4ec386c4~5rDdjvUR21995519955eucas1p2B;
 Thu, 12 Jan 2023 21:14:50 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 0D.C4.56180.A4870C36; Thu, 12
 Jan 2023 21:14:50 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20230112211449eucas1p2e5097a74179162c179a61ef873639df4~5rDcW_ahR1921619216eucas1p2B;
 Thu, 12 Jan 2023 21:14:49 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20230112211449eusmtrp2d172459280364f500bea67ee71e4b987~5rDcQ0yes2339823398eusmtrp2a;
 Thu, 12 Jan 2023 21:14:49 +0000 (GMT)
X-AuditID: cbfec7f2-ab5ff7000000db74-20-63c0784a569d
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 6F.2C.52424.84870C36; Thu, 12
 Jan 2023 21:14:48 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20230112211448eusmtip15ee54b0544ef7475c0faeef79dfdb6e4~5rDbj5I0i3030530305eusmtip1I;
 Thu, 12 Jan 2023 21:14:48 +0000 (GMT)
Message-ID: <f3070150-d4d2-ebfc-4ed6-d732c463e2dc@samsung.com>
Date: Thu, 12 Jan 2023 22:14:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] drm/probe_helper: sort out poll_running vs poll_enabled
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20230112154247.1532202-1-dmitry.baryshkov@linaro.org>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrCKsWRmVeSWpSXmKPExsWy7djPc7peFQeSDRYf4LI4cX0Rk8W2DhuL
 /9smMltMPP+TzeLK1/dsFnOen2W02Pl1D4vFxP1n2S3e77zFaPHm4ARWi+cLfzBb3J18hNHi
 +J2nTA68HrMbLrJ47P22gMVj56y77B6bVnWyedy5tofN4373cSaPR0d2s3gc33WL3WPinjqP
 z5vkAriiuGxSUnMyy1KL9O0SuDK2HTrCVHDZu+Llrw6WBsbF9l2MnBwSAiYSDU/OsXQxcnEI
 CaxglNh2bA0rhPOFUeLsrCNsEM5nRon5t04zwbTsW9TMCJFYzijxa8IsZgjnI6PEiYMzmEGq
 eAXsJN5dnckOYrMIqEocvX+JESIuKHFy5hOghRwcogIpEpv+lIGYwgI+EufW5YBUMAuIS9x6
 Mp8JZKSIwHxGiZ6/88BOYha4yiTxYdEysJlsAoYSXW+72EBsTgFniWsbJ7BAdMtLbH87B+wg
 CYH1nBJP/5yBOttF4tOOZWwQtrDEq+Nb2CFsGYn/OyHWSQi0M0os+H0fypnAKNHw/BYjRJW1
 xJ1zv9hAbmUW0JRYv0sfIuwocW3iS2aQsIQAn8SNt4IQR/BJTNo2HSrMK9HRJgRRrSYx6/g6
 uLUHL1xinsCoNAspWGYhBcAsJO/MQti7gJFlFaN4amlxbnpqsWFearlecWJucWleul5yfu4m
 RmDCO/3v+KcdjHNffdQ7xMjEwXiIUYKDWUmEd8/R/clCvCmJlVWpRfnxRaU5qcWHGKU5WJTE
 eWdsnZ8sJJCeWJKanZpakFoEk2Xi4JRqYCq2uvpm5+Q0dbtHniHfX5hvYa/TeWjRLPppas2r
 mDanSUoKwa4nfs//Ps3iwbLASkafG27VN07NtzzTk5jQ8TzGUKyztGpJnpKJ1HaRUuU815ia
 yzfMpT6/vWp9ys5F88e+e776BydtSstP6Nydxeyx0cowt99lYm/F1KbFZ2LcmANNyg/r7lPL
 e3utXWlV8JplDJaPGSoVxb5x/7J2eFjXE7Llh9CfALdFxUmrjVUv7zk9kfGbSGT+yzLvlltZ
 G0yX/FDrZ1brVfMSuVv/pJNvx+wpmZsy9k4MFJ7MufDqTXOZy73LG4McWVhYThmJ8q6OPslS
 +WXXfyeTOBV5gZoWXUvfdR5lp7KK3X8psRRnJBpqMRcVJwIAtdtub+cDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrOIsWRmVeSWpSXmKPExsVy+t/xu7oeFQeSDeYetbQ4cX0Rk8W2DhuL
 /9smMltMPP+TzeLK1/dsFnOen2W02Pl1D4vFxP1n2S3e77zFaPHm4ARWi+cLfzBb3J18hNHi
 +J2nTA68HrMbLrJ47P22gMVj56y77B6bVnWyedy5tofN4373cSaPR0d2s3gc33WL3WPinjqP
 z5vkArii9GyK8ktLUhUy8otLbJWiDS2M9AwtLfSMTCz1DI3NY62MTJX07WxSUnMyy1KL9O0S
 9DK2HTrCVHDZu+Llrw6WBsbF9l2MnBwSAiYS+xY1M3YxcnEICSxllOg8eZYNIiEjcXJaAyuE
 LSzx51oXG0TRe0aJnp2bmUASvAJ2Eu+uzmQHsVkEVCWO3r/ECBEXlDg58wkLiC0qkCLR/Pwk
 0CAODmEBH4lz63JAwswC4hK3nsxnApkpIjCfUeL5u3tgC5gFrjJJnDj0jBli2zRGiXWzF4Gd
 xCZgKNH1tgvM5hRwlri2cQILxCgzia6tXYwQtrzE9rdzmCcwCs1CcsgsJBtnIWmZhaRlASPL
 KkaR1NLi3PTcYiO94sTc4tK8dL3k/NxNjMAY33bs55YdjCtffdQ7xMjEwXiIUYKDWUmEd8/R
 /clCvCmJlVWpRfnxRaU5qcWHGE2BoTGRWUo0OR+YZPJK4g3NDEwNTcwsDUwtzYyVxHk9CzoS
 hQTSE0tSs1NTC1KLYPqYODilGpjMzj19ySHAfEPyU+Meh7izojeq10lqicfvVuHlvPggX729
 e3PP13MrZ1q8+uUqW26azjrxS9qjjsNnmAMZD36vmVjiFfjq2aG5X+9cdFjr5LHeduHhuoWv
 aoplm5+sDd7+hjV1SZGIiM+JqnXbS3NzDhv3bjb6ZjGvwuykyvTK21J/RL2tzFn5b9uY/xFn
 +6B4daNB4gexeUEpX/W9S3rnL3/zZkLPXX4Jlr1v1wUeiLyuNr0qe2lxfw3nXS72NE/NcOON
 rfcCDqQmNBzN0XMOSZ96otuh2XZ3zIwk/xczGy07f4n+bd0YnC6QnGbSsfI6v5RRREn22duK
 q9c2q0VYl/UlX3PkYxK3kZpoo8RSnJFoqMVcVJwIALQ7qXR6AwAA
X-CMS-MailID: 20230112211449eucas1p2e5097a74179162c179a61ef873639df4
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20230112154254eucas1p1d943fb43a0316d6dd33e01be799c790a
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230112154254eucas1p1d943fb43a0316d6dd33e01be799c790a
References: <CGME20230112154254eucas1p1d943fb43a0316d6dd33e01be799c790a@eucas1p1.samsung.com>
 <20230112154247.1532202-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12.01.2023 16:42, Dmitry Baryshkov wrote:
> There are two flags attemting to guard connector polling:
> poll_enabled and poll_running. While poll_enabled semantics is clearly
> defined and fully adhered (mark that drm_kms_helper_poll_init() was
> called and not finalized by the _fini() call), the poll_running flag
> doesn't have such clearliness.
>
> This flag is used only in drm_helper_probe_single_connector_modes() to
> guard calling of drm_kms_helper_poll_enable, it doesn't guard the
> drm_kms_helper_poll_fini(), etc. Change it to only be set if the polling
> is actually running. Tie HPD enablement to this flag.
>
> This fix the following warning reported after merging the HPD series:
>
> Hot plug detection already enabled
> WARNING: CPU: 2 PID: 9 at drivers/gpu/drm/drm_bridge.c:1257 drm_bridge_hpd_enable+0x94/0x9c [drm]
> Modules linked in: videobuf2_memops snd_soc_simple_card snd_soc_simple_card_utils fsl_imx8_ddr_perf videobuf2_common snd_soc_imx_spdif adv7511 etnaviv imx8m_ddrc imx_dcss mc cec nwl_dsi gov
> CPU: 2 PID: 9 Comm: kworker/u8:0 Not tainted 6.2.0-rc2-15208-g25b283acd578 #6
> Hardware name: NXP i.MX8MQ EVK (DT)
> Workqueue: events_unbound deferred_probe_work_func
> pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : drm_bridge_hpd_enable+0x94/0x9c [drm]
> lr : drm_bridge_hpd_enable+0x94/0x9c [drm]
> sp : ffff800009ef3740
> x29: ffff800009ef3740 x28: ffff000009331f00 x27: 0000000000001000
> x26: 0000000000000020 x25: ffff800001148ed8 x24: ffff00000a8fe000
> x23: 00000000fffffffd x22: ffff000005086348 x21: ffff800001133ee0
> x20: ffff00000550d800 x19: ffff000005086288 x18: 0000000000000006
> x17: 0000000000000000 x16: ffff8000096ef008 x15: 97ffff2891004260
> x14: 2a1403e194000000 x13: 97ffff2891004260 x12: 2a1403e194000000
> x11: 7100385f29400801 x10: 0000000000000aa0 x9 : ffff800008112744
> x8 : ffff000000250b00 x7 : 0000000000000003 x6 : 0000000000000011
> x5 : 0000000000000000 x4 : ffff0000bd986a48 x3 : 0000000000000001
> x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff000000250000
> Call trace:
>   drm_bridge_hpd_enable+0x94/0x9c [drm]
>   drm_bridge_connector_enable_hpd+0x2c/0x3c [drm_kms_helper]
>   drm_kms_helper_poll_enable+0x94/0x10c [drm_kms_helper]
>   drm_helper_probe_single_connector_modes+0x1a8/0x510 [drm_kms_helper]
>   drm_client_modeset_probe+0x204/0x1190 [drm]
>   __drm_fb_helper_initial_config_and_unlock+0x5c/0x4a4 [drm_kms_helper]
>   drm_fb_helper_initial_config+0x54/0x6c [drm_kms_helper]
>   drm_fbdev_client_hotplug+0xd0/0x140 [drm_kms_helper]
>   drm_fbdev_generic_setup+0x90/0x154 [drm_kms_helper]
>   dcss_kms_attach+0x1c8/0x254 [imx_dcss]
>   dcss_drv_platform_probe+0x90/0xfc [imx_dcss]
>   platform_probe+0x70/0xcc
>   really_probe+0xc4/0x2e0
>   __driver_probe_device+0x80/0xf0
>   driver_probe_device+0xe0/0x164
>   __device_attach_driver+0xc0/0x13c
>   bus_for_each_drv+0x84/0xe0
>   __device_attach+0xa4/0x1a0
>   device_initial_probe+0x1c/0x30
>   bus_probe_device+0xa4/0xb0
>   deferred_probe_work_func+0x90/0xd0
>   process_one_work+0x200/0x474
>   worker_thread+0x74/0x43c
>   kthread+0xfc/0x110
>   ret_from_fork+0x10/0x20
> ---[ end trace 0000000000000000 ]---
>
> Reported-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> Fixes: c8268795c9a9 ("drm/probe-helper: enable and disable HPD on connectors")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Seems to be fixing the issue I've observed recently on the Amlogic Meson 
based boards. Feel free to add:

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

> ---
>   drivers/gpu/drm/drm_probe_helper.c | 110 +++++++++++++++++------------
>   1 file changed, 63 insertions(+), 47 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
> index 7973f2589ced..ef919d95fea6 100644
> --- a/drivers/gpu/drm/drm_probe_helper.c
> +++ b/drivers/gpu/drm/drm_probe_helper.c
> @@ -222,6 +222,45 @@ drm_connector_mode_valid(struct drm_connector *connector,
>   	return ret;
>   }
>   
> +static void drm_kms_helper_disable_hpd(struct drm_device *dev)
> +{
> +	struct drm_connector *connector;
> +	struct drm_connector_list_iter conn_iter;
> +
> +	drm_connector_list_iter_begin(dev, &conn_iter);
> +	drm_for_each_connector_iter(connector, &conn_iter) {
> +		const struct drm_connector_helper_funcs *funcs =
> +			connector->helper_private;
> +
> +		if (funcs && funcs->disable_hpd)
> +			funcs->disable_hpd(connector);
> +	}
> +	drm_connector_list_iter_end(&conn_iter);
> +}
> +
> +static bool drm_kms_helper_enable_hpd(struct drm_device *dev)
> +{
> +	bool poll = false;
> +	struct drm_connector *connector;
> +	struct drm_connector_list_iter conn_iter;
> +
> +	drm_connector_list_iter_begin(dev, &conn_iter);
> +	drm_for_each_connector_iter(connector, &conn_iter) {
> +		const struct drm_connector_helper_funcs *funcs =
> +			connector->helper_private;
> +
> +		if (funcs && funcs->disable_hpd)
> +			funcs->disable_hpd(connector);
> +
> +		if (connector->polled & (DRM_CONNECTOR_POLL_CONNECT |
> +					 DRM_CONNECTOR_POLL_DISCONNECT))
> +			poll = true;
> +	}
> +	drm_connector_list_iter_end(&conn_iter);
> +
> +	return poll;
> +}
> +
>   #define DRM_OUTPUT_POLL_PERIOD (10*HZ)
>   /**
>    * drm_kms_helper_poll_enable - re-enable output polling.
> @@ -241,26 +280,14 @@ drm_connector_mode_valid(struct drm_connector *connector,
>   void drm_kms_helper_poll_enable(struct drm_device *dev)
>   {
>   	bool poll = false;
> -	struct drm_connector *connector;
> -	struct drm_connector_list_iter conn_iter;
>   	unsigned long delay = DRM_OUTPUT_POLL_PERIOD;
>   
> -	if (!dev->mode_config.poll_enabled || !drm_kms_helper_poll)
> +	if (!dev->mode_config.poll_enabled ||
> +	    !drm_kms_helper_poll ||
> +	    dev->mode_config.poll_running)
>   		return;
>   
> -	drm_connector_list_iter_begin(dev, &conn_iter);
> -	drm_for_each_connector_iter(connector, &conn_iter) {
> -		const struct drm_connector_helper_funcs *funcs =
> -			connector->helper_private;
> -
> -		if (funcs && funcs->enable_hpd)
> -			funcs->enable_hpd(connector);
> -
> -		if (connector->polled & (DRM_CONNECTOR_POLL_CONNECT |
> -					 DRM_CONNECTOR_POLL_DISCONNECT))
> -			poll = true;
> -	}
> -	drm_connector_list_iter_end(&conn_iter);
> +	poll = drm_kms_helper_enable_hpd(dev);
>   
>   	if (dev->mode_config.delayed_event) {
>   		/*
> @@ -279,6 +306,8 @@ void drm_kms_helper_poll_enable(struct drm_device *dev)
>   
>   	if (poll)
>   		schedule_delayed_work(&dev->mode_config.output_poll_work, delay);
> +
> +	dev->mode_config.poll_running = true;
>   }
>   EXPORT_SYMBOL(drm_kms_helper_poll_enable);
>   
> @@ -567,10 +596,7 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
>   	}
>   
>   	/* Re-enable polling in case the global poll config changed. */
> -	if (drm_kms_helper_poll != dev->mode_config.poll_running)
> -		drm_kms_helper_poll_enable(dev);
> -
> -	dev->mode_config.poll_running = drm_kms_helper_poll;
> +	drm_kms_helper_poll_enable(dev);
>   
>   	if (connector->status == connector_status_disconnected) {
>   		DRM_DEBUG_KMS("[CONNECTOR:%d:%s] disconnected\n",
> @@ -710,8 +736,12 @@ static void output_poll_execute(struct work_struct *work)
>   	changed = dev->mode_config.delayed_event;
>   	dev->mode_config.delayed_event = false;
>   
> -	if (!drm_kms_helper_poll)
> +	if (!drm_kms_helper_poll &&
> +	    dev->mode_config.poll_running) {
> +		drm_kms_helper_disable_hpd(dev);
> +		dev->mode_config.poll_running = false;
>   		goto out;
> +	}
>   
>   	if (!mutex_trylock(&dev->mode_config.mutex)) {
>   		repoll = true;
> @@ -808,30 +838,6 @@ bool drm_kms_helper_is_poll_worker(void)
>   }
>   EXPORT_SYMBOL(drm_kms_helper_is_poll_worker);
>   
> -static void drm_kms_helper_poll_disable_fini(struct drm_device *dev, bool fini)
> -{
> -	struct drm_connector *connector;
> -	struct drm_connector_list_iter conn_iter;
> -
> -	if (!dev->mode_config.poll_enabled)
> -		return;
> -
> -	if (fini)
> -		dev->mode_config.poll_enabled = false;
> -
> -	drm_connector_list_iter_begin(dev, &conn_iter);
> -	drm_for_each_connector_iter(connector, &conn_iter) {
> -		const struct drm_connector_helper_funcs *funcs =
> -			connector->helper_private;
> -
> -		if (funcs && funcs->disable_hpd)
> -			funcs->disable_hpd(connector);
> -	}
> -	drm_connector_list_iter_end(&conn_iter);
> -
> -	cancel_delayed_work_sync(&dev->mode_config.output_poll_work);
> -}
> -
>   /**
>    * drm_kms_helper_poll_disable - disable output polling
>    * @dev: drm_device
> @@ -848,7 +854,12 @@ static void drm_kms_helper_poll_disable_fini(struct drm_device *dev, bool fini)
>    */
>   void drm_kms_helper_poll_disable(struct drm_device *dev)
>   {
> -	drm_kms_helper_poll_disable_fini(dev, false);
> +	if (dev->mode_config.poll_running)
> +		drm_kms_helper_disable_hpd(dev);
> +
> +	cancel_delayed_work_sync(&dev->mode_config.output_poll_work);
> +
> +	dev->mode_config.poll_running = false;
>   }
>   EXPORT_SYMBOL(drm_kms_helper_poll_disable);
>   
> @@ -886,7 +897,12 @@ EXPORT_SYMBOL(drm_kms_helper_poll_init);
>    */
>   void drm_kms_helper_poll_fini(struct drm_device *dev)
>   {
> -	drm_kms_helper_poll_disable_fini(dev, true);
> +	if (!dev->mode_config.poll_enabled)
> +		return;
> +
> +	drm_kms_helper_poll_disable(dev);
> +
> +	dev->mode_config.poll_enabled = false;
>   }
>   EXPORT_SYMBOL(drm_kms_helper_poll_fini);
>   

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

