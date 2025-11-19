Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D05BC705A6
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 18:12:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E02FA10E684;
	Wed, 19 Nov 2025 17:12:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="TiXCrvZS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12A0410E67B
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 17:12:48 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id C93AAC1118C;
 Wed, 19 Nov 2025 17:12:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id DA13360699;
 Wed, 19 Nov 2025 17:12:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1BD7710371A3F; Wed, 19 Nov 2025 18:12:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1763572366; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=UB7/F7zzy1OltvdHfLAL9s9iwGMEQBiMw1GwZS3Jz/g=;
 b=TiXCrvZSCVy76DX2Smg0KhMJAAAyorlNCvFnIBuWxYCc8sPn+y07thF01qCZJWdW0zxjtt
 QTSglPNXsj2cdoq6W7OgeMTwOs7DPMMYjC/qlM83ILJu8Y57AC1ElLm0p/agZGMVsPEd57
 ssnCHklS9abwXjP9CJqgojVl1tIaKai47fbM2IKqV8KP/ccvwK1ohoSQvBBHvMniGqgVBA
 uAxNjrs2MTVu938+q1ATby86xxF5GGiiBvPES0KPmrYWxREzSAqj22i0vMN/O1KUU/TJIQ
 hmyg+Ns3V0qplRbHiVzAWDEdvsThN78n3pvuoTq4D/xj2ankQOaknRfCyeZM2Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 19 Nov 2025 18:12:40 +0100
Message-Id: <DECU85YFDJFQ.51DNK1JF0CQ4@bootlin.com>
Cc: "Bajjuri Praneeth" <praneeth@ti.com>, "Louis Chauvet"
 <louis.chauvet@bootlin.com>, <stable@vger.kernel.org>,
 <thomas.petazzoni@bootlin.com>, "Jyri Sarha" <jyri.sarha@iki.fi>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Thomas Zimmermann"
 <tzimmermann@suse.de>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>
To: "Kory Maincent" <kory.maincent@bootlin.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Douglas Anderson" <dianders@chromium.org>, "Tomi
 Valkeinen" <tomi.valkeinen@ideasonboard.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3] drm/tilcdc: Fix removal actions in case of failed probe
X-Mailer: aerc 0.20.1
References: <20251118133850.125561-1-kory.maincent@bootlin.com>
In-Reply-To: <20251118133850.125561-1-kory.maincent@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
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

Hello K=C3=B6ry,

On Tue Nov 18, 2025 at 2:38 PM CET, Kory Maincent wrote:
> From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
>
> The drm_kms_helper_poll_fini() and drm_atomic_helper_shutdown() helpers
> should only be called when the device has been successfully registered.
> Currently, these functions are called unconditionally in tilcdc_fini(),
> which causes warnings during probe deferral scenarios.
>
> [    7.972317] WARNING: CPU: 0 PID: 23 at drivers/gpu/drm/drm_atomic_stat=
e_helper.c:175 drm_atomic_helper_crtc_duplicate_state+0x60/0x68
> ...
> [    8.005820]  drm_atomic_helper_crtc_duplicate_state from drm_atomic_ge=
t_crtc_state+0x68/0x108
> [    8.005858]  drm_atomic_get_crtc_state from drm_atomic_helper_disable_=
all+0x90/0x1c8
> [    8.005885]  drm_atomic_helper_disable_all from drm_atomic_helper_shut=
down+0x90/0x144
> [    8.005911]  drm_atomic_helper_shutdown from tilcdc_fini+0x68/0xf8 [ti=
lcdc]
> [    8.005957]  tilcdc_fini [tilcdc] from tilcdc_pdev_probe+0xb0/0x6d4 [t=
ilcdc]
>
> Fix this by rewriting the failed probe cleanup path using the standard
> goto error handling pattern, which ensures that cleanup functions are
> only called on successfully initialized resources. Additionally, remove
> the now-unnecessary is_registered flag.
>
> Cc: stable@vger.kernel.org
> Fixes: 3c4babae3c4a ("drm: Call drm_atomic_helper_shutdown() at shutdown/=
remove time for misc drivers")
> Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>

Except for the bug reported by the kernel test robot, this patch looks
good to me. Just a couple thoughts, below.

> @@ -372,16 +371,34 @@ static int tilcdc_init(const struct drm_driver *ddr=
v, struct device *dev)
>
>  	ret =3D drm_dev_register(ddev, 0);
>  	if (ret)
> -		goto init_failed;
> -	priv->is_registered =3D true;
> +		goto stop_poll;
>
>  	drm_client_setup_with_color_mode(ddev, bpp);
>
>  	return 0;
>
> -init_failed:
> -	tilcdc_fini(ddev);
> +stop_poll:
> +	drm_kms_helper_poll_fini(ddev);
> +	tilcdc_irq_uninstall(ddev);
> +unbind_component:
> +	if (priv->is_componentized)
> +		component_unbind_all(dev, ddev);
> +unregister_cpufreq_notif:
> +#ifdef CONFIG_CPU_FREQ
> +	cpufreq_unregister_notifier(&priv->freq_transition,
> +				    CPUFREQ_TRANSITION_NOTIFIER);
> +#endif
> +destroy_crtc:
> +	tilcdc_crtc_destroy(priv->crtc);
> +disable_pm:
> +	pm_runtime_disable(dev);
> +	clk_put(priv->clk);
> +free_wq:
> +	destroy_workqueue(priv->wq);
> +put_drm:
>  	platform_set_drvdata(pdev, NULL);

I'm not 100% sure this is needed, but perhaps it is because of the
component framework being used.

If it is needed, then shouldn't it be present in tilcdc_fini() as well?

> +	ddev->dev_private =3D NULL;
> +	drm_dev_put(ddev);
>
>  	return ret;
>  }

About tilcdc_fini(), I think it can be itself cleaned up a lot (in another =
patch). Basically
it should do the same thing (almost) that are here below the 'return 0'
line, and in the same order. Now the list of actions is auite different and
the order is very different.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
