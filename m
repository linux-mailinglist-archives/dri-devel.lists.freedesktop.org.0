Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A73B8D1AA33
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 18:31:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9644E10E065;
	Tue, 13 Jan 2026 17:31:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="SbsgZNDg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EB2910E065
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 17:31:14 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 8EF031A2839;
 Tue, 13 Jan 2026 17:31:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 43C8360701;
 Tue, 13 Jan 2026 17:31:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 089C0103C81D3; Tue, 13 Jan 2026 18:30:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1768325470; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=ArN+gzNluv41ve7tNs9bCuLTGUt8HRF4hQp5onhOiSg=;
 b=SbsgZNDgkfZHCx/r34yGumijNEEAujBA1Asley4Zy9v924+EMnfgnRIOcSjOdM5mvGqWPR
 lWsq+4rbWv1be42TFPaquIJOTEqiazGpexh6KgVqdj/vsp21Futc53PdAYnOxHNcXKfXWM
 UPMA6t4YXAPOUmX4w/xDnACUO3E4LMeMErPwCMH1EWAjKXwOnIsQ28a7Nib3ZS84y0pFQm
 0r3v24ZarNzuyfppzipCFobDWeOQLNpJc0/4gSmi7B9gJ2tirl0htm/b1q7gv8HVWCGTPs
 rlMphTDPohwx9XlNXbinFpmLjBit+nuMZZCTpdBFpyRuhJNgeuQUSxvN+fm7cQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 13 Jan 2026 18:30:58 +0100
Message-Id: <DFNN251V4JL9.2ECEDGOKN8I4F@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v2 2/6] drm/meson/dw-hdmi: convert to
 of_drm_find_and_get_bridge()
Cc: "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Kevin
 Hilman" <khilman@baylibre.com>, "Jerome Brunet" <jbrunet@baylibre.com>,
 "Philipp Zabel" <p.zabel@pengutronix.de>, "Shawn Guo"
 <shawnguo@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam"
 <festevam@gmail.com>, "Chun-Kuang Hu" <chunkuang.hu@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>, "Inki Dae"
 <inki.dae@samsung.com>, "Seung-Woo Kim" <sw0312.kim@samsung.com>, "Kyungmin
 Park" <kyungmin.park@samsung.com>, "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Alim Akhtar" <alim.akhtar@samsung.com>, "Laurent Pinchart"
 <laurent.pinchart+renesas@ideasonboard.com>, "Tomi Valkeinen"
 <tomi.valkeinen+renesas@ideasonboard.com>, "Kieran Bingham"
 <kieran.bingham+renesas@ideasonboard.com>, "Geert Uytterhoeven"
 <geert+renesas@glider.be>, "Magnus Damm" <magnus.damm@gmail.com>, "Marek
 Szyprowski" <m.szyprowski@samsung.com>, "Hui Pu" <Hui.Pu@gehealthcare.com>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-amlogic@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <imx@lists.linux.dev>,
 <linux-mediatek@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
 <linux-renesas-soc@vger.kernel.org>
To: "Martin Blumenstingl" <martin.blumenstingl@googlemail.com>
X-Mailer: aerc 0.20.1
References: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-3-v2-0-8d7a3dbacdf4@bootlin.com>
 <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-3-v2-2-8d7a3dbacdf4@bootlin.com>
 <CAFBinCBWUXNwEDCJNEmdCtOcGO9eVFfZFC9p9fpdRTesZ7xBSQ@mail.gmail.com>
In-Reply-To: <CAFBinCBWUXNwEDCJNEmdCtOcGO9eVFfZFC9p9fpdRTesZ7xBSQ@mail.gmail.com>
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

On Mon Jan 12, 2026 at 11:21 PM CET, Martin Blumenstingl wrote:
> Hi Luca,
>
> On Fri, Jan 9, 2026 at 11:03=E2=80=AFAM Luca Ceresoli <luca.ceresoli@boot=
lin.com> wrote:
>>
>> of_drm_find_bridge() is deprecated. Move to its replacement
>> of_drm_find_and_get_bridge() which gets a bridge reference, and ensure i=
t
>> is put when done.
>>
>> dw_hdmi->bridge is used only in dw_hdmi_top_thread_irq(), so in order to
>> avoid potential use-after-free ensure the irq is freed before putting th=
e
>> dw_hdmi->bridge reference.
>>
>> Acked-by: Maxime Ripard <mripard@kernel.org>
>> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>
> [...]
>> @@ -789,8 +789,12 @@ static void meson_dw_hdmi_unbind(struct device *dev=
, struct device *master,
>>                                    void *data)
>>  {
>>         struct meson_dw_hdmi *meson_dw_hdmi =3D dev_get_drvdata(dev);
>> +       struct platform_device *pdev =3D to_platform_device(dev);
>> +       int irq =3D platform_get_irq(pdev, 0);
>>
>> +       devm_free_irq(dev, irq, meson_dw_hdmi);
> I have one question (so I can understand things better):
> is there a particular reason why you went with free'ing the IRQ
> instead of "just" masking it (so the hardware won't fire anymore of
> those IRQs)?

One reason is symmetry: _bind requests the irq, so _unbind does the
reverse.

Another is I don't have the hardware, so I wanted my changes to be as small
and clear as possible.

In principle one could request/free the irq in probe/remove and then
enable/disable it in bind/unbind. Whether it would be a good or bad idea I
don't know, but surely it would be more complex and I wouldn't want to do
it without any chance to test it on hardware.

Also, that would only optimize the case of multiple bind/unbind cycles,
which are not quite realistic without bridge hotplug. And brigde hotplug
does not exist yet in mainline, and when it will arrive it will be used
only for a few use cases.

I hope this answers your question.

Best regards,
Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
