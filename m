Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A92A7290B6
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 09:16:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EF0510E635;
	Fri,  9 Jun 2023 07:16:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5425F10E05E
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jun 2023 16:08:50 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id
 d9443c01a7336-1b23f04e333so4159315ad.3
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jun 2023 09:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1686240530; x=1688832530;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yZrPvXOaXEQPKsXtUpbfz4WhJ7pTJywi1kpaIctsmkU=;
 b=NzZ3alQEbWy3kXwu2NQwHz9MWV5gNYTI2Q2S228dtuQhU/2hB9/ov22WzJEiZYuFO4
 SyJDZA7OoZ0PJx4WxwL5lL7XbEiMkm3ea4MOvXZrfg/5ThUQ4ewEPcwG0/+eUvlX6MVi
 tSNj+Vnf0XmZ4/EepgKhTwWTtbkmvl7MT+kmo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686240530; x=1688832530;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yZrPvXOaXEQPKsXtUpbfz4WhJ7pTJywi1kpaIctsmkU=;
 b=coWZ/B55oNEzsF/bgKuTUZvODmfreHejc0CIm54UiNm0b1ZoioWqYj2PRzor6wUBlD
 ZPrEf2VRTdDAdu+PktnwznSBjikMOHL8QIrzAihroYBI9S4adNfkJfshKwvri0THDAd5
 IBuZNdMGX8/oO7BkmLkh862RiRzE59qWn5/GM1XtVKYHVP9P5hZWKuaHk8rUd3zLa2I9
 0cqlGMMDpTDu/7IJIuaBad3Ww1OpQNxyEF6TILMvx8oNtPTRL1Xh3q3pIS29/0YNQfFC
 UNBgwmqK45VXaCoB+Galh8c6i5BiZEXoLh+XrRgQiGVhHNLDHSo3unWvIGYa/dW7lD+1
 eBaw==
X-Gm-Message-State: AC+VfDxuQQhFaVgHyP70AZTYQiMDSKrl0lx2a9ozsB6zvcPQeDCvfZA1
 Ml30n2SjTjQWml1NOr32NVeNd5Ty4yu/cf2W/jWRiQ==
X-Google-Smtp-Source: ACHHUZ5qy/8bdIHttI6LXqkRPoxKzg2iVsqVhX90WvNIok+47RNWD8x+8vH7YWLB38w9RD/+ic8yig==
X-Received: by 2002:a17:902:ec90:b0:1af:9c18:a160 with SMTP id
 x16-20020a170902ec9000b001af9c18a160mr5259461plg.17.1686240529743; 
 Thu, 08 Jun 2023 09:08:49 -0700 (PDT)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com.
 [209.85.214.178]) by smtp.gmail.com with ESMTPSA id
 je17-20020a170903265100b001aafdf8063dsm1623231plb.157.2023.06.08.09.08.48
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jun 2023 09:08:49 -0700 (PDT)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-1b025aaeddbso158995ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jun 2023 09:08:48 -0700 (PDT)
X-Received: by 2002:a05:6e02:1a22:b0:330:af65:de3d with SMTP id
 g2-20020a056e021a2200b00330af65de3dmr115540ile.11.1686240508041; Thu, 08 Jun
 2023 09:08:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
 <20230601154002.uv2wfatpb7b45duz@pengutronix.de>
In-Reply-To: <20230601154002.uv2wfatpb7b45duz@pengutronix.de>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 8 Jun 2023 09:08:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WvP--wJwBQtnSoW_xb57R1Wf9dH0XzWxe+NorczXfeAw@mail.gmail.com>
Message-ID: <CAD=FV=WvP--wJwBQtnSoW_xb57R1Wf9dH0XzWxe+NorczXfeAw@mail.gmail.com>
Subject: Re: [PATCH 00/53] drm: Convert to platform remove callback returning
 void
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 09 Jun 2023 07:16:27 +0000
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
Cc: Xinliang Liu <xinliang.liu@linaro.org>, dri-devel@lists.freedesktop.org,
 Russell King <linux@armlinux.org.uk>, Alim Akhtar <alim.akhtar@samsung.com>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Steven Price <steven.price@arm.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>, linux-samsung-soc@vger.kernel.org,
 Robert Foss <rfoss@kernel.org>, Karol Herbst <kherbst@redhat.com>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Danilo Krummrich <dakr@redhat.com>,
 NXP Linux Team <linux-imx@nxp.com>, Miaoqian Lin <linmq006@gmail.com>,
 linux-sunxi@lists.linux.dev, Rahul T R <r-ravikumar@ti.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Jani Nikula <jani.nikula@intel.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 etnaviv@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Sean Paul <sean@poorly.run>, Johan Hovold <johan+linaro@kernel.org>,
 Hyun Kwon <hyun.kwon@xilinx.com>, Andrew Jeffery <andrew@aj.id.au>,
 Jingoo Han <jingoohan1@gmail.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, kernel@pengutronix.de,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-aspeed@lists.ozlabs.org,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Thierry Reding <thierry.reding@gmail.com>, John Stultz <jstultz@google.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>, Liang He <windhl@126.com>,
 lima@lists.freedesktop.org, Chunyan Zhang <zhang.lyra@gmail.com>,
 Alexey Brodkin <abrodkin@synopsys.com>, Minghao Chi <chi.minghao@zte.com.cn>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org,
 Ben Skeggs <bskeggs@redhat.com>, Russell King <linux+etnaviv@armlinux.org.uk>,
 Alain Volmat <alain.volmat@foss.st.com>, Liu Ying <victor.liu@nxp.com>,
 linux-arm-msm@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Boris Brezillon <bbrezillon@kernel.org>, Sandy Huang <hjc@rock-chips.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Yuan Can <yuancan@huawei.com>, Michal Simek <michal.simek@xilinx.com>,
 linux-tegra@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Mali DP Maintainers <malidp@foss.arm.com>, Joel Stanley <joel@jms.id.au>,
 nouveau@lists.freedesktop.org, Orson Zhai <orsonzhai@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Guo Zhengkui <guozhengkui@vivo.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Alison Wang <alison.wang@nxp.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mark Brown <broonie@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Liu Shixin <liushixin2@huawei.com>, Tomi Valkeinen <tomba@kernel.org>,
 Deepak R Varma <drv@mailo.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Ricardo Ribalda <ribalda@chromium.org>, Tian Tao <tiantao6@hisilicon.com>,
 Shawn Guo <shawnguo@kernel.org>, Yannick Fertre <yannick.fertre@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, Emma Anholt <emma@anholt.net>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-mips@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>, Marek Vasut <marex@denx.de>,
 linux-renesas-soc@vger.kernel.org, Yongqin Liu <yongqin.liu@linaro.org>,
 Jayshri Pawar <jpawar@cadence.com>, Jonas Karlman <jonas@kwiboo.se>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Melissa Wen <mwen@igalia.com>,
 linux-mediatek@lists.infradead.org,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Qiang Yu <yuq825@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jyri Sarha <jyri.sarha@iki.fi>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Jun 1, 2023 at 8:40=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> Hello,
>
> On Sun, May 07, 2023 at 06:25:23PM +0200, Uwe Kleine-K=C3=B6nig wrote:
> > this patch series adapts the platform drivers below drivers/gpu/drm
> > to use the .remove_new() callback. Compared to the traditional .remove(=
)
> > callback .remove_new() returns no value. This is a good thing because
> > the driver core doesn't (and cannot) cope for errors during remove. The
> > only effect of a non-zero return value in .remove() is that the driver
> > core emits a warning. The device is removed anyhow and an early return
> > from .remove() usually yields a resource leak.
> >
> > By changing the remove callback to return void driver authors cannot
> > reasonably (but wrongly) assume any more that there happens some kind o=
f
> > cleanup later.
>
> I wonder if someone would volunteer to add the whole series to
> drm-misc-next?!

It looks as if Neil applied quite a few of them already, so I looked
at what was left...

I'm a little hesitant to just apply the whole kit-and-caboodle to
drm-misc-next since there are specific DRM trees for a bunch of them
and it would be better if they landed there. ...so I went through all
the patches that still applied to drm-misc-next, then used
'scripts/get_maintainer.pl --scm' to check if they were maintained
through drm-misc. That still left quite a few patches. I've applied
those ones and pushed to drm-misc-next:

71722685cd17 drm/xlnx/zynqmp_dpsub: Convert to platform remove
callback returning void
1ed54a19f3b3 drm/vc4: Convert to platform remove callback returning void
b957812839f8 drm/v3d: Convert to platform remove callback returning void
e2fd3192e267 drm/tve200: Convert to platform remove callback returning void
84e6da7ad553 drm/tiny: Convert to platform remove callback returning void
34cdd1f691ad drm/tidss: Convert to platform remove callback returning void
d665e3c9d37a drm/sun4i: Convert to platform remove callback returning void
0c259ab19146 drm/stm: Convert to platform remove callback returning void
9a865e45884a drm/sti: Convert to platform remove callback returning void
3c855610840e drm/rockchip: Convert to platform remove callback returning vo=
id
e41977a83b71 drm/panfrost: Convert to platform remove callback returning vo=
id
cef3776d0b5a drm/panel: Convert to platform remove callback returning void
bd296a594e87 drm/mxsfb: Convert to platform remove callback returning void
38ca2d93d323 drm/meson: Convert to platform remove callback returning void
fd1457d84bae drm/mcde: Convert to platform remove callback returning void
41a56a18615c drm/logicvc: Convert to platform remove callback returning voi=
d
980ec6444372 drm/lima: Convert to platform remove callback returning void
82a2c0cc1a22 drm/hisilicon: Convert to platform remove callback returning v=
oid
c3b28b29ac0a drm/fsl-dcu: Convert to platform remove callback returning voi=
d
a118fc6e71f9 drm/atmel-hlcdc: Convert to platform remove callback returning=
 void
9a32dd324c46 drm/aspeed: Convert to platform remove callback returning void
2c7d291c498c drm/arm/malidp: Convert to platform remove callback returning =
void
a920028df679 drm/arm/hdlcd: Convert to platform remove callback returning v=
oid
1bf3d76a7d15 drm/komeda: Convert to platform remove callback returning void

The following ones appeared to apply to the top of drm-misc-next, but
I didn't apply them since get_maintainer didn't say they were part of
drm-misc-next:

drm/tiny: Convert to platform remove callback returning void
drm/tilcdc: Convert to platform remove callback returning void
drm/sprd: Convert to platform remove callback returning void
drm/shmobile: Convert to platform remove callback returning void
drm/rcar-du: Convert to platform remove callback returning void
drm/omap: Convert to platform remove callback returning void
drm/nouveau: Convert to platform remove callback returning void
drm/mediatek: Convert to platform remove callback returning void
drm/kmb: Convert to platform remove callback returning void
drm/ingenic: Convert to platform remove callback returning void
drm/imx/ipuv3: Convert to platform remove callback returning void
drm/imx/dcss: Convert to platform remove callback returning void
drm/etnaviv: Convert to platform remove callback returning void
drm/armada: Convert to platform remove callback returning void

-Doug
