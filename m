Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67781CD4DE7
	for <lists+dri-devel@lfdr.de>; Mon, 22 Dec 2025 08:31:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2067210E092;
	Mon, 22 Dec 2025 07:31:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="dds3KG6i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E47510E092
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 07:31:11 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 0DEB21A2365;
 Mon, 22 Dec 2025 07:31:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D36DF606C1;
 Mon, 22 Dec 2025 07:31:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id AED821037114E; Mon, 22 Dec 2025 08:30:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1766388663; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=FhfvIIRgj6Aycs5UyhUwijnDEuwt7q2c8fX68qjbfxI=;
 b=dds3KG6i2S3Ix1WU4NKTXXyH21pMocW+PTkSDO3Egjok8yzK5zVeHJ3kbiumuGq3Yj2HRo
 NVBdWWaPxPlQBlayK1IYfKdtbQXz8UbiLzTmGWwtuOZNSfN1xHWHEl3OmAwjZph4aMysaY
 cOXQENMUe4sMpLVsi1J1TBSR80NIqn3DWJVvZC/1isGu4OQFATbvYVT/R8YGfEIQInjFwt
 LLS8tjB70jTmOZ7DJOZrqy6J6sHcEDqBiFm/SOzacWNl6J4KlwJBKTtIlEHYC5dxziUrrK
 IXQLQcVVwdUsfQWxqpQBhLDT9lQ5XYU+M8hgbzYw9WBfLx5gLgarvXMFQYCGbA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 22 Dec 2025 08:30:53 +0100
Message-Id: <DF4KIOREQYK3.2JEGF51OECQCE@bootlin.com>
Cc: "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Jonathan
 Corbet" <corbet@lwn.net>, "Alexey Brodkin" <abrodkin@synopsys.com>, "Phong
 LE" <ple@baylibre.com>, "Liu Ying" <victor.liu@nxp.com>, "Shawn Guo"
 <shawnguo@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam"
 <festevam@gmail.com>, "Kevin Hilman" <khilman@baylibre.com>, "Jerome
 Brunet" <jbrunet@baylibre.com>, "Hui Pu" <Hui.Pu@gehealthcare.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>
To: "Martin Blumenstingl" <martin.blumenstingl@googlemail.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 12/22] drm/meson: encoder_hdmi: get/put the next bridge
X-Mailer: aerc 0.20.1
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-0-b5165fab8058@bootlin.com>
 <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-12-b5165fab8058@bootlin.com>
 <CAFBinCCUVOYsiwwVmyGtxN=MdqYatAaj-piVO9_E_iZX9gwiMQ@mail.gmail.com>
In-Reply-To: <CAFBinCCUVOYsiwwVmyGtxN=MdqYatAaj-piVO9_E_iZX9gwiMQ@mail.gmail.com>
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

Hello Martin,

On Sun Dec 21, 2025 at 10:51 PM CET, Martin Blumenstingl wrote:
> On Tue, Dec 16, 2025 at 7:00=E2=80=AFPM Luca Ceresoli <luca.ceresoli@boot=
lin.com> wrote:
>>
>> This driver obtains a bridge pointer from of_drm_find_bridge() in the pr=
obe
>> function and stores it until driver removal. of_drm_find_bridge() is
>> deprecated. Move to of_drm_find_and_get_bridge() for the bridge to be
>> refcounted and use bridge->next_bridge to put the reference on
>> deallocation.
>>
>> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> And additionally I runtime tested this on meson-gxl-s905x-libretech-cc
> where I still have HDMI output, so:
> Tested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Thank you for the quick testing!

I think I can append '# meson-gxl-s905x-libretech-cc' to your 'Tested-by:'
line when I'll apply the patch, to make it more informative.

Best regards,
Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
