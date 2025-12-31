Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC9ACEC109
	for <lists+dri-devel@lfdr.de>; Wed, 31 Dec 2025 15:10:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92EEA10E191;
	Wed, 31 Dec 2025 14:10:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="k8Bg++C5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BAEE10E191
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Dec 2025 14:10:02 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id ECD8C4E41EB5;
 Wed, 31 Dec 2025 14:10:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 71D8060744;
 Wed, 31 Dec 2025 14:10:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DA1C7113B0768; Wed, 31 Dec 2025 15:09:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1767190199; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Kwmt6Ld2ymKsGv8aHlzarXZ4Mpw1oBA58a1vcP2IVBU=;
 b=k8Bg++C50iPo3h/1+U7lERfby7onNJWRCYqg6clGSVa0vvkS8O+UT0PL3hC1DQXe4pRyCk
 lo9bC1vgVXho4dnby9mFl+p80fd2RPtE7L0qCfyfdqf6L9WD1/MXP3Ohk46oDbKw1v7Smm
 IrtQKEKfy/6lKIetZ0WB2Ixzkg0kXlcJnGyxOpfrFwu/O3Orwlp0DMyHE0zOfDffnkxJqK
 7F7oVKWnHl06pSS4mVrFj6WYfGwKJZARKMkK1W7394uucSeFpcmhW5Y3+vdHP73Zmrl62i
 eDTJnzUqoqnIaPtvoAGP8ToqtfazEzX8Z/thOINKfWxNytDF/HjDSbL6Uby4mg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 31 Dec 2025 15:09:51 +0100
Message-Id: <DFCGN2M06GGU.25B1SFMCHNMKL@bootlin.com>
Subject: Re: [PATCH] drm/bridge: synopsys: dw-dp: return when attach bridge
 fail
Cc: "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
To: "Osama Abdelkader" <osama.abdelkader@gmail.com>, "Andy Yan"
 <andy.yan@rock-chips.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20251226223229.123860-1-osama.abdelkader@gmail.com>
In-Reply-To: <20251226223229.123860-1-osama.abdelkader@gmail.com>
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

On Fri Dec 26, 2025 at 11:32 PM CET, Osama Abdelkader wrote:
> When drm_bridge_attach() fails, the function should return an error
> instead of continuing execution.
>
> Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>

Looks like a bugfix, should it have a 'Fixes:' tag and 'Cc: stable@...'?
See https://docs.kernel.org/process/submitting-patches.html

> --- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> @@ -2062,8 +2062,10 @@ struct dw_dp *dw_dp_bind(struct device *dev, struc=
t drm_encoder *encoder,
>  	}
>
>  	ret =3D drm_bridge_attach(encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_C=
ONNECTOR);
> -	if (ret)
> +	if (ret) {
>  		dev_err_probe(dev, ret, "Failed to attach bridge\n");
> +		return ERR_PTR(ret);
> +	}
>
>  	dw_dp_init_hw(dp);
>

It could be more concise, without adding braces:

	if (ret)
		return ERR_PTR(dev_err_probe(dev, ret, "Failed to attach bridge\n"));

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
