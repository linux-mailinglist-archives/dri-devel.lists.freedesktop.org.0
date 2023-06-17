Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3773A734578
	for <lists+dri-devel@lfdr.de>; Sun, 18 Jun 2023 10:22:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5595F10E0F3;
	Sun, 18 Jun 2023 08:22:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E53210E00D
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jun 2023 18:03:52 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4f866a3d8e4so469419e87.0
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jun 2023 11:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1687025030; x=1689617030;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sD3IWEzBGQZ8mcTerhCj4o67e1f5v1lsAPNkuhRyMbk=;
 b=D/NV9ZuZ+LuatN0mGKyv34QEjO67gq6UOroFdIlKQ3OcUuF0FVsi17zQtsLg7LvYee
 dv5NnRFdutTcD5lbhLnRNKERsoOYqIaSkyuPsfPzmW6IPG1EMuZPxhluDhJQzChRJpmC
 ZoT0sF8eX8nRr+PjAJ17VeJNOHgZnU4ehCnMI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687025030; x=1689617030;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sD3IWEzBGQZ8mcTerhCj4o67e1f5v1lsAPNkuhRyMbk=;
 b=V8rlOjRsBaFIjzhf+1aAUfeE4ur8Xy0iMr+Dsg8uWaimP1TIOYLLCxP0ncFU2gc6MF
 fmoHqFrJdPEPXmccQ0qYm7onx1KTccMZP1Ae+ry/7WRlCWSHpxaN9C2OBY0Y6Hwsb3u8
 Ty3kFA4mNoR1oeYfQTD+e6D+FUhrADOjQY9U0i736njAVlDNID8Zk0aG0iaI7lZCS3Jr
 Z5gTuTg2YTX7psNTkKOG0zjgKj8CC98XvYIXTO5kHgwphcq0fnjfj1nvKKjkAtGho5mT
 PVa6g4bf+gz8cVSehaQS1UnMqzPacac5T+26+hzLpTPRJg9WZ8HC/vA94vn5k52fuECq
 cRTg==
X-Gm-Message-State: AC+VfDypD6NBGVP/bC6HbVOP/r9a7DwPGdbagKzrBpR5tIqdyUH11vnn
 AYiLaCEXywATYuaKM9ElrqXz3zf0VF778/zvu85lXe6Mn+o=
X-Google-Smtp-Source: ACHHUZ7aQ4lPZpgVG3rm10wbUq7AHEpEHTpKhpQETzL0f+Wj/+YiLMYIxbSQ3bXFYzDT4W1mNkodPQ==
X-Received: by 2002:a19:3807:0:b0:4f6:6b:a43b with SMTP id
 f7-20020a193807000000b004f6006ba43bmr3253755lfa.52.1687025030344; 
 Sat, 17 Jun 2023 11:03:50 -0700 (PDT)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com.
 [209.85.167.42]) by smtp.gmail.com with ESMTPSA id
 j20-20020ac253b4000000b004edc72be17csm3502574lfh.2.2023.06.17.11.03.50
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Jun 2023 11:03:50 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-4f85fa03cd9so1346e87.1
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jun 2023 11:03:50 -0700 (PDT)
X-Received: by 2002:a05:600c:444e:b0:3f4:2736:b5eb with SMTP id
 v14-20020a05600c444e00b003f42736b5ebmr491530wmn.1.1687024655682; Sat, 17 Jun
 2023 10:57:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
 <20230601154002.uv2wfatpb7b45duz@pengutronix.de>
 <CAD=FV=WvP--wJwBQtnSoW_xb57R1Wf9dH0XzWxe+NorczXfeAw@mail.gmail.com>
 <20230617161222.wy55pbomnrrlfy5u@pengutronix.de>
In-Reply-To: <20230617161222.wy55pbomnrrlfy5u@pengutronix.de>
From: Doug Anderson <dianders@chromium.org>
Date: Sat, 17 Jun 2023 10:57:23 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U5gbMUNteyyFcTvHVBDWzfthM0aDirJC+yXGovDwMOBA@mail.gmail.com>
Message-ID: <CAD=FV=U5gbMUNteyyFcTvHVBDWzfthM0aDirJC+yXGovDwMOBA@mail.gmail.com>
Subject: Re: patches dropped from drm-misc-next [Was: Re: [PATCH 00/53] drm:
 Convert to platform remove callback returning] void
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sun, 18 Jun 2023 08:21:45 +0000
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
Cc: Raymond Tan <raymond.tan@intel.com>, Xinliang Liu <xinliang.liu@linaro.org>,
 dri-devel@lists.freedesktop.org,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>, linux-samsung-soc@vger.kernel.org,
 Robert Foss <rfoss@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Danilo Krummrich <dakr@redhat.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-sunxi@lists.linux.dev,
 Rahul T R <r-ravikumar@ti.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Jani Nikula <jani.nikula@intel.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 etnaviv@lists.freedesktop.org, Yuan Can <yuancan@huawei.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sean Paul <sean@poorly.run>,
 Johan Hovold <johan+linaro@kernel.org>, Hyun Kwon <hyun.kwon@xilinx.com>,
 Andrew Jeffery <andrew@aj.id.au>, Jingoo Han <jingoohan1@gmail.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, kernel@pengutronix.de,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Miaoqian Lin <linmq006@gmail.com>, linux-aspeed@lists.ozlabs.org,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Thierry Reding <thierry.reding@gmail.com>, John Stultz <jstultz@google.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>, Liang He <windhl@126.com>,
 lima@lists.freedesktop.org, Chunyan Zhang <zhang.lyra@gmail.com>,
 Alexey Brodkin <abrodkin@synopsys.com>, Minghao Chi <chi.minghao@zte.com.cn>,
 Steven Price <steven.price@arm.com>, linux-rockchip@lists.infradead.org,
 Ben Skeggs <bskeggs@redhat.com>, Russell King <linux+etnaviv@armlinux.org.uk>,
 Alain Volmat <alain.volmat@foss.st.com>, Liu Ying <victor.liu@nxp.com>,
 linux-arm-msm@vger.kernel.org, Wang Jianzheng <wangjianzheng@vivo.com>,
 Maxime Ripard <mripard@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Boris Brezillon <bbrezillon@kernel.org>, Sandy Huang <hjc@rock-chips.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Karol Herbst <kherbst@redhat.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Mali DP Maintainers <malidp@foss.arm.com>, Joel Stanley <joel@jms.id.au>,
 nouveau@lists.freedesktop.org, Orson Zhai <orsonzhai@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Guo Zhengkui <guozhengkui@vivo.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Alison Wang <alison.wang@nxp.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mark Brown <broonie@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Paul Cercueil <paul@crapouillou.net>, Tomi Valkeinen <tomba@kernel.org>,
 Deepak R Varma <drv@mailo.com>,
 Karol Wachowski <karol.wachowski@linux.intel.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Ricardo Ribalda <ribalda@chromium.org>, Tian Tao <tiantao6@hisilicon.com>,
 Shawn Guo <shawnguo@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Emma Anholt <emma@anholt.net>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Liu Shixin <liushixin2@huawei.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Laura Nao <laura.nao@collabora.com>, Marek Vasut <marex@denx.de>,
 linux-renesas-soc@vger.kernel.org, Yongqin Liu <yongqin.liu@linaro.org>,
 Jayshri Pawar <jpawar@cadence.com>, Jonas Karlman <jonas@kwiboo.se>,
 Russell King <linux@armlinux.org.uk>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Qiang Yu <yuq825@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Melissa Wen <mwen@igalia.com>, linux-mediatek@lists.infradead.org,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, linux-tegra@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>, linux-mips@vger.kernel.org,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Jyri Sarha <jyri.sarha@iki.fi>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sat, Jun 17, 2023 at 9:15=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> [expanding recipents by the other affected persons]
>
> On Thu, Jun 08, 2023 at 09:08:15AM -0700, Doug Anderson wrote:
> > On Thu, Jun 1, 2023 at 8:40=E2=80=AFAM Uwe Kleine-K=C3=B6nig
> > <u.kleine-koenig@pengutronix.de> wrote:
> > >
> > > Hello,
> > >
> > > On Sun, May 07, 2023 at 06:25:23PM +0200, Uwe Kleine-K=C3=B6nig wrote=
:
> > > > this patch series adapts the platform drivers below drivers/gpu/drm
> > > > to use the .remove_new() callback. Compared to the traditional .rem=
ove()
> > > > callback .remove_new() returns no value. This is a good thing becau=
se
> > > > the driver core doesn't (and cannot) cope for errors during remove.=
 The
> > > > only effect of a non-zero return value in .remove() is that the dri=
ver
> > > > core emits a warning. The device is removed anyhow and an early ret=
urn
> > > > from .remove() usually yields a resource leak.
> > > >
> > > > By changing the remove callback to return void driver authors canno=
t
> > > > reasonably (but wrongly) assume any more that there happens some ki=
nd of
> > > > cleanup later.
> > >
> > > I wonder if someone would volunteer to add the whole series to
> > > drm-misc-next?!
> >
> > It looks as if Neil applied quite a few of them already, so I looked
> > at what was left...
> >
> > I'm a little hesitant to just apply the whole kit-and-caboodle to
> > drm-misc-next since there are specific DRM trees for a bunch of them
> > and it would be better if they landed there. ...so I went through all
> > the patches that still applied to drm-misc-next, then used
> > 'scripts/get_maintainer.pl --scm' to check if they were maintained
> > through drm-misc. That still left quite a few patches. I've applied
> > those ones and pushed to drm-misc-next:
> >
> > 71722685cd17 drm/xlnx/zynqmp_dpsub: Convert to platform remove
> > callback returning void
> > 1ed54a19f3b3 drm/vc4: Convert to platform remove callback returning voi=
d
> > b957812839f8 drm/v3d: Convert to platform remove callback returning voi=
d
> > e2fd3192e267 drm/tve200: Convert to platform remove callback returning =
void
> > 84e6da7ad553 drm/tiny: Convert to platform remove callback returning vo=
id
> > 34cdd1f691ad drm/tidss: Convert to platform remove callback returning v=
oid
> > d665e3c9d37a drm/sun4i: Convert to platform remove callback returning v=
oid
> > 0c259ab19146 drm/stm: Convert to platform remove callback returning voi=
d
> > 9a865e45884a drm/sti: Convert to platform remove callback returning voi=
d
> > 3c855610840e drm/rockchip: Convert to platform remove callback returnin=
g void
> > e41977a83b71 drm/panfrost: Convert to platform remove callback returnin=
g void
> > cef3776d0b5a drm/panel: Convert to platform remove callback returning v=
oid
> > bd296a594e87 drm/mxsfb: Convert to platform remove callback returning v=
oid
> > 38ca2d93d323 drm/meson: Convert to platform remove callback returning v=
oid
> > fd1457d84bae drm/mcde: Convert to platform remove callback returning vo=
id
> > 41a56a18615c drm/logicvc: Convert to platform remove callback returning=
 void
> > 980ec6444372 drm/lima: Convert to platform remove callback returning vo=
id
> > 82a2c0cc1a22 drm/hisilicon: Convert to platform remove callback returni=
ng void
> > c3b28b29ac0a drm/fsl-dcu: Convert to platform remove callback returning=
 void
> > a118fc6e71f9 drm/atmel-hlcdc: Convert to platform remove callback retur=
ning void
> > 9a32dd324c46 drm/aspeed: Convert to platform remove callback returning =
void
> > 2c7d291c498c drm/arm/malidp: Convert to platform remove callback return=
ing void
> > a920028df679 drm/arm/hdlcd: Convert to platform remove callback returni=
ng void
> > 1bf3d76a7d15 drm/komeda: Convert to platform remove callback returning =
void
>
> Together with the patches that were applied later the topmost commit
> from this series is c2807ecb5290 ("drm/omap: Convert to platform remove
> callback returning void"). This commit was part for the following next
> tags:
>
>         $ git tag -l --contains c2807ecb5290
>         next-20230609
>         next-20230613
>         next-20230614
>         next-20230615
>
> However in next-20230616 they are missing. In next-20230616
> drm-misc/for-linux-next was cf683e8870bd4be0fd6b98639286700a35088660.
> Compared to c2807ecb5290 this adds 1149 patches but drops 37 (that are
> also not included with a different commit id). The 37 patches dropped
> are 13cdd12a9f934158f4ec817cf048fcb4384aa9dc..c2807ecb5290:
>
>         $ git shortlog -s 13cdd12a9f934158f4ec817cf048fcb4384aa9dc..c2807=
ecb5290
>              1  Christophe JAILLET
>              2  Jessica Zhang
>              5  Karol Wachowski
>              1  Laura Nao
>             27  Uwe Kleine-K=C3=B6nig
>              1  Wang Jianzheng
>
>
> I guess this was done by mistake because nobody told me about dropping
> my/these patches? Can c2807ecb5290 please be merged into drm-misc-next
> again?

Actually, it was probably a mistake that these patches got merged to
linuxnext during the 4 days that you noticed. However, your patches
aren't dropped and are still present in drm-misc-next.

drm-misc has a bit of a unique model and it's documented fairly well here:

https://drm.pages.freedesktop.org/maintainer-tools/drm-misc.html

The key is that committers can commit to drm-misc-next _at any time_
regardless of the merge window. The drm-misc merge strategy makes this
OK. Specifically, when it's late in the linux cycle then drm-misc-next
is supposed to stop merging to linuxnext. Then, shortly after the
merge window closes, patches will start flowing again.

So basically your patches are landed and should even keep the same git
hashes when they eventually make it to Linux. They just won't land for
another release cycle of Linux.

Hope that makes sense!

-Doug
