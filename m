Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F08BAC70CBC
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 20:25:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4024E10E258;
	Wed, 19 Nov 2025 19:25:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="b4MTTQQJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06CEC10E258
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 19:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1763580316; x=1764185116; i=markus.elfring@web.de;
 bh=gEn59hFZtQ2tVmel4ezQ6xaHST238q/COzyzoaCPxiQ=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=b4MTTQQJYD2ZRFoSVepAx59SUEw0bHEi9rk+ZZ7hNJZktnu0b38JeX98QtxinvGD
 2b1/DzydrRfVfQBIX2M/FJWCL2NKKZdRaBl+Cvf6NVyYyJr0whuQjHaYR3NmZn6Uw
 nNdaib1AO/F+jufOIjhY/d5fRgJoaVVuwYqXi++5D7fGUQQrXwP0P8UK6R11rwJ69
 waGlH3bsSq2AxB4Z+WMTBfTyMkMatSx8N7nJds1XuNMYABAf6Ldh6mhGfY/P9XPCj
 0dacF/nzzljH9pYMCrwLsuMId+J5YoMcygDgdpSpk/TOWmHdzpY911mPYe+r0JdeK
 Cr2+N6T9bKD1o+/+0w==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.92.228]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MSqXS-1viS5y1syM-00Mzfu; Wed, 19
 Nov 2025 20:25:16 +0100
Message-ID: <4677bcd3-8e90-462a-bfe7-25ed35ea07ea@web.de>
Date: Wed, 19 Nov 2025 20:25:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, dri-devel@lists.freedesktop.org
Cc: stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Alexey Brodkin <abrodkin@synopsys.com>, David Airlie <airlied@gmail.com>,
 Hui Pu <Hui.Pu@gehealthcare.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona.vetter@ffwll.ch>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20251119-drm-arcgpu-fix-device-node-leak-v1-1-06229edcfe6e@bootlin.com>
Subject: Re: [PATCH] drm/arcgpu: fix device node leak
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20251119-drm-arcgpu-fix-device-node-leak-v1-1-06229edcfe6e@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:hEBME8w7cyfvUgoAWN3l9fW/QMTzh0BLS3cZ3EhVdPpwqRX1qr4
 kEquqidXMQaeVdf16lbAwdpdy5NvuYmS1lRKzPHNXFQz+JVL5Xs3DbTIKTNPj7Sw0cQ2rqk
 byjoBYcsjRcQVyZHe0BGR3zYMJA64imyQkj2k2fr6CS0GHl2crtiE8nRltdIRTygedv2hRG
 ekpNwLFFUEjn8iIBIPS1g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:r5MWY86MvI0=;MEGWkI7PLWbOj+wjQhRV7D/Nkd5
 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
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

> This function gets a device_node reference via
> of_graph_get_remote_port_parent() and stores it in encoder_node, but nec=
er

                                                                       nev=
er?


> puts that reference. Add it.
=E2=80=A6
> +++ b/drivers/gpu/drm/tiny/arcpgu.c
> @@ -250,7 +250,8 @@ DEFINE_DRM_GEM_DMA_FOPS(arcpgu_drm_ops);
>  static int arcpgu_load(struct arcpgu_drm_private *arcpgu)
>  {
>  	struct platform_device *pdev =3D to_platform_device(arcpgu->drm.dev);
> -	struct device_node *encoder_node =3D NULL, *endpoint_node =3D NULL;
> +	struct device_node *encoder_node __free(device_node) =3D NULL;
> +	struct device_node *endpoint_node =3D NULL;
>  	struct drm_connector *connector =3D NULL;
>  	struct drm_device *drm =3D &arcpgu->drm;
>  	int ret;

May the scopes be reduced for any of these variables?

Regards,
Markus
