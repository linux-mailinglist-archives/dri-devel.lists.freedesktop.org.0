Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A950B3C93ED
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 00:40:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60FB96E50C;
	Wed, 14 Jul 2021 22:40:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07E736E46B
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 22:40:32 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1626302434; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=dN9FeDkip9Ae1ehWv6t+0cl0YVXUST9OaSt8TvUu8iE=;
 b=n9vNadXzzvZD3zn578b/h7yVtDYyfMwRocvsB3fM24/+2GHfx79+pZ+z0BMumJd5gzfYndAx
 6mbKIjPLr8zMkYtMZC+sNaDYIVMZw7rFGwCogFUS0ua2Yq0v2R/puPJU9KbInFwnH5ziOl4b
 FN/Elk24Uc+hsIP6tI/KGgEeH4g=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 60ef67da25e56632782a76eb (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 14 Jul 2021 22:40:26
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id F066AC43217; Wed, 14 Jul 2021 22:40:25 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id BA39FC433F1;
 Wed, 14 Jul 2021 22:40:24 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 14 Jul 2021 15:40:24 -0700
From: abhinavk@codeaurora.org
To: Sean Paul <sean@poorly.run>
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: Initialize dp->aux->drm_dev
 before registration
In-Reply-To: <20210714152910.55093-1-sean@poorly.run>
References: <20210714152910.55093-1-sean@poorly.run>
Message-ID: <6aaaf808dbde4d71170c06437800ed1b@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
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
Cc: Sean Paul <seanpaul@chromium.org>, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-07-14 08:28, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> Avoids the following WARN:
> [    3.009556] ------------[ cut here ]------------
> [    3.014306] WARNING: CPU: 7 PID: 109 at
> drivers/gpu/drm/drm_dp_helper.c:1796 drm_dp_aux_register+0xa4/0xac
> [    3.024209] Modules linked in:
> [    3.027351] CPU: 7 PID: 109 Comm: kworker/7:8 Not tainted 5.10.47 
> #69
> [    3.033958] Hardware name: Google Lazor (rev1 - 2) (DT)
> [    3.039323] Workqueue: events deferred_probe_work_func
> [    3.044596] pstate: 60c00009 (nZCv daif +PAN +UAO -TCO BTYPE=--)
> [    3.050761] pc : drm_dp_aux_register+0xa4/0xac
> [    3.055329] lr : dp_aux_register+0x40/0x88
> [    3.059538] sp : ffffffc010ad3920
> [    3.062948] x29: ffffffc010ad3920 x28: ffffffa64196ac70
> [    3.067239] mmc1: Command Queue Engine enabled
> [    3.068406] x27: ffffffa64196ac68 x26: 0000000000000001
> [    3.068407] x25: 0000000000000002 x24: 0000000000000060
> [    3.068409] x23: ffffffa642ab3400 x22: ffffffe126c10e5b
> [    3.068410] x21: ffffffa641dc3188 x20: ffffffa641963c10
> [    3.068412] x19: ffffffa642aba910 x18: 00000000ffff0a00
> [    3.068414] x17: 000000476f8e002a x16: 00000000000000b8
> [    3.073008] mmc1: new HS400 Enhanced strobe MMC card at address 0001
> [    3.078448] x15: ffffffffffffffff x14: ffffffffffffffff
> [    3.078450] x13: 0000000000000030 x12: 0000000000000030
> [    3.078452] x11: 0101010101010101 x10: ffffffe12647a914
> [    3.078453] x9 : ffffffe12647a8cc x8 : 0000000000000000
> [    3.084452] mmcblk1: mmc1:0001 DA4032 29.1 GiB
> [    3.089372]
> [    3.089372] x7 : 6c6064717372fefe x6 : ffffffa642b11494
> [    3.089374] x5 : 0000000000000000 x4 : 6d006c657869ffff
> [    3.089375] x3 : 000000006c657869 x2 : 000000000000000c
> [    3.089376] x1 : ffffffe126c3ae3c x0 : ffffffa642aba910
> [    3.089381] Call trace:
> [    3.094931] mmcblk1boot0: mmc1:0001 DA4032 partition 1 4.00 MiB
> [    3.100291]  drm_dp_aux_register+0xa4/0xac
> [    3.100292]  dp_aux_register+0x40/0x88
> [    3.100294]  dp_display_bind+0x64/0xcc
> [    3.100295]  component_bind_all+0xdc/0x210
> [    3.100298]  msm_drm_bind+0x1e8/0x5d4
> [    3.100301]  try_to_bring_up_master+0x168/0x1b0
> [    3.105861] mmcblk1boot1: mmc1:0001 DA4032 partition 2 4.00 MiB
> [    3.112282]  __component_add+0xa0/0x158
> [    3.112283]  component_add+0x1c/0x28
> [    3.112284]  dp_display_probe+0x33c/0x380
> [    3.112286]  platform_drv_probe+0x9c/0xbc
> [    3.112287]  really_probe+0x140/0x35c
> [    3.112289]  driver_probe_device+0x84/0xc0
> [    3.112292]  __device_attach_driver+0x94/0xb0
> [    3.117967] mmcblk1rpmb: mmc1:0001 DA4032 partition 3 16.0 MiB,
> chardev (239:0)
> [    3.123201]  bus_for_each_drv+0x8c/0xd8
> [    3.123202]  __device_attach+0xc4/0x150
> [    3.123204]  device_initial_probe+0x1c/0x28
> [    3.123205]  bus_probe_device+0x3c/0x9c
> [    3.123206]  deferred_probe_work_func+0x90/0xcc
> [    3.123211]  process_one_work+0x218/0x3ec
> [    3.131976]  mmcblk1: p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12
> [    3.134123]  worker_thread+0x288/0x3e8
> [    3.134124]  kthread+0x148/0x1b0
> [    3.134127]  ret_from_fork+0x10/0x30
> [    3.134128] ---[ end trace cfb9fce3f70f824d ]---
> 
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
It looks like 
https://github.com/torvalds/linux/commit/6cba3fe433415b2549c909ce72601902c8254a83 
is not yet present
in the lazor codebase, once it gets backported we will hit the same 
issue, Hence

Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c
> b/drivers/gpu/drm/msm/dp/dp_display.c
> index 051c1be1de7e..987f9e330138 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -219,6 +219,7 @@ static int dp_display_bind(struct device *dev,
> struct device *master,
>  		goto end;
>  	}
> 
> +	dp->aux->drm_dev = drm;
>  	rc = dp_aux_register(dp->aux);
>  	if (rc) {
>  		DRM_ERROR("DRM DP AUX register failed\n");
