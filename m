Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C07BD80AB99
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 19:06:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F7A810EAE7;
	Fri,  8 Dec 2023 18:06:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 385 seconds by postgrey-1.36 at gabe;
 Fri, 08 Dec 2023 17:36:28 UTC
Received: from box.trvn.ru (box.trvn.ru [194.87.146.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 474AF10E2A9
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 17:36:28 +0000 (UTC)
Received: from authenticated-user (box.trvn.ru [194.87.146.52])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by box.trvn.ru (Postfix) with ESMTPSA id A5C3540553;
 Fri,  8 Dec 2023 22:29:56 +0500 (+05)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=trvn.ru; s=mail;
 t=1702056596; bh=pE1CgVVtfrCp3JU4zkCtGvAWVS8WMu77iEkbFx9RX3A=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=H6bFXMwMOLaXxikuXgL8LmhBYLTRucYC2wSXAOKHRUayOQqfcO3JMs5w5bJ2MJxZy
 0hIBMYlirOzk2yNVgsN9ta1FNMhxPGfOgngYbOQAztFti879V9/ccAutdxJS68Hdjp
 cEtj+xzgsd2WbdQYQ9qiTDpFtHORtSBvNOABVWFWPPXE3YDxvZhyYTEHgMHjfVr+qb
 JhOvfACM9SxzAja3ZOnuGMMcAM1/p1bwMgf2/PZoEXeYueDAQ34+tUWbD+c7BZKvG2
 Zen5AP7kbxjkv8eAddJHtkXbuBC5KQHZ59wmOAK38QYgfG4iBr6kG5bp17mewWEHXt
 SYl6RRMni7QlA==
MIME-Version: 1.0
Date: Fri, 08 Dec 2023 22:29:55 +0500
From: Nikita Travkin <nikita@trvn.ru>
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: Associate PWM device to
 auxiliary device
In-Reply-To: <20231127101547.734061-2-u.kleine-koenig@pengutronix.de>
References: <20231127101547.734061-2-u.kleine-koenig@pengutronix.de>
Message-ID: <d50daa43b4f7a21245bef144e1c6d810@trvn.ru>
X-Sender: nikita@trvn.ru
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 08 Dec 2023 18:06:06 +0000
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 Bjorn Andersson <andersson@kernel.org>,
 Douglas Anderson <dianders@chromium.org>, Maxime Ripard <mripard@kernel.org>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 kernel@pengutronix.de, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Uwe Kleine-König писал(а) 27.11.2023 15:15:
> It's the ti_sn65dsi86.pwm auxiliary driver that creates the pwmchip, so
> let the auxiliary device be the parent of the pwm device.
> 
> Note that getting a reference to the ti-sn65dsi86's pwm using pwm_get()
> isn't affected by this change as ti_sn65dsi86_add_aux_device() sets the
> auxiliary device's of_node to that of the main device.
> 
> Also change PM runtime tracking and diagnostic messages to use that one.
> As the PM runtime functions also handle parent devices this should work
> fine, too.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
> Hello,
> 
> this patch has an (easy to resolve) conflict with a patch I sent earlier
> "drm/bridge: ti-sn65dsi86: Simplify using pm_runtime_resume_and_get()"
> (https://lore.kernel.org/dri-devel/20231123175425.496956-2-u.kleine-koenig@pengutronix.de).
> I was unsure if I should base this new patch on that older one.
> 
> While I think the patch is fine, I'd have a better feeling about it if
> someone could give feedback that the PWM still works as intended with
> this change.
> 

Hi, with this patch applied, pwm backlight fails to
probe on sc7180-acer-aspire1:

[    0.377853] pwm-backlight backlight: failed to apply initial PWM state: -13
[    0.378349] pwm-backlight: probe of backlight failed with error -13

Seems like the pwmchip device should get runtime_pm enabled?
The following patch seem to fix it.

Nikita


diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 254f0039dad2..b6813f9f6a8f 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -1593,6 +1593,8 @@ static int ti_sn_pwm_probe(struct auxiliary_device *adev,
 	pdata->pchip.of_xlate = of_pwm_single_xlate;
 	pdata->pchip.of_pwm_n_cells = 1;
 
+	pm_runtime_enable(&adev->dev);
+
 	return pwmchip_add(&pdata->pchip);
 }
