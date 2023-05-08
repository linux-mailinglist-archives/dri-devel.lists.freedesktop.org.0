Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3876FBFF2
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 09:05:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADE4C10E344;
	Tue,  9 May 2023 07:04:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 313DF10E010;
 Mon,  8 May 2023 07:06:33 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2972C21DFD;
 Mon,  8 May 2023 07:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1683529591; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RIca1CkgJkV42R/Nik3JrPCn3w5E6KqyHEkMf3u7NNw=;
 b=q31z3mr8q4Q8FZgaE689QYC4FRQIzckSADv7eX29NgY7JMbK9R4wWg2IlVheAvuUqMWlD7
 7EYjvAcQb2YbZ+lNxkXVBrJuTNBUZ6rIt+lcCio5/GrVb2L7eBraUV7ueNCh/y0Av4rkw4
 TlEm4ChGaMgwY64lwrlxznSZQmM8Ijk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1683529591;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RIca1CkgJkV42R/Nik3JrPCn3w5E6KqyHEkMf3u7NNw=;
 b=XrL/mvkJUhC1ImWfjovkdHwEhNPu2xA2Fs1z+v2GXGbvZnkjbFlktM613puHuCAHpdOVU/
 jxT3w/8ls7Q2HWCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 965DC1346B;
 Mon,  8 May 2023 07:06:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id AIO4I3SfWGSlKgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 08 May 2023 07:06:28 +0000
Message-ID: <935faac5-280b-b2e0-3fdb-d0424990e43a@suse.de>
Date: Mon, 8 May 2023 09:06:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 00/53] drm: Convert to platform remove callback returning
 void
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 James@pengutronix.de, Liviu Dudau <liviu.dudau@arm.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>,
 Brian Starkey <brian.starkey@arm.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Russell King <linux@armlinux.org.uk>,
 Joel Stanley <joel@jms.id.au>, Sam Ravnborg <sam@ravnborg.org>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Rahul T R <r-ravikumar@ti.com>, Jayshri Pawar <jpawar@cadence.com>,
 Liu Ying <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Minghao Chi <chi.minghao@zte.com.cn>,
 Mark Brown <broonie@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Lucas Stach <l.stach@pengutronix.de>, Inki Dae <inki.dae@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Stefan Agner <stefan@agner.ch>,
 Alison Wang <alison.wang@nxp.com>, Xinliang Liu <xinliang.liu@linaro.org>,
 Tian Tao <tiantao6@hisilicon.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, Danilo Krummrich <dakr@redhat.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Cercueil
 <paul@crapouillou.net>, Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Edmund Dea <edmund.j.dea@intel.com>, Qiang Yu <yuq825@gmail.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Ricardo Ribalda <ribalda@chromium.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Johan Hovold <johan+linaro@kernel.org>, Joel@pengutronix.de,
 Stephen Boyd <swboyd@chromium.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Liu Shixin <liushixin2@huawei.com>, Douglas Anderson
 <dianders@chromium.org>, Miaoqian Lin <linmq006@gmail.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>, Marek Vasut <marex@denx.de>,
 Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Tomi Valkeinen <tomba@kernel.org>,
 Guo Zhengkui <guozhengkui@vivo.com>, Yuan Can <yuancan@huawei.com>,
 Arnd Bergmann <arnd@arndb.de>, Liang He <windhl@126.com>,
 Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=c3=bcbner?=
 <heiko@sntech.de>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Deepak R Varma <drv@mailo.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Jonathan Hunter
 <jonathanh@nvidia.com>, Maxime Ripard <maxime@cerno.tech>,
 =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Jyri Sarha <jyri.sarha@iki.fi>, Alexey Brodkin <abrodkin@synopsys.com>,
 Emma Anholt <emma@anholt.net>, Melissa Wen <mwen@igalia.com>,
 Hyun Kwon <hyun.kwon@xilinx.com>, Michal Simek <michal.simek@xilinx.com>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------mP4DtmCgHrSLYeotlpqkQH54"
X-Mailman-Approved-At: Tue, 09 May 2023 07:04:45 +0000
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
Cc: linux-aspeed@lists.ozlabs.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, John Stultz <jstultz@google.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>, linux-samsung-soc@vger.kernel.org,
 lima@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 linux-rockchip@lists.infradead.org,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Mali DP Maintainers <malidp@foss.arm.com>, NXP Linux Team <linux-imx@nxp.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>, linux-sunxi@lists.linux.dev,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, etnaviv@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andrew Jeffery <andrew@aj.id.au>, linux-stm32@st-md-mailman.stormreply.com,
 linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 kernel@pengutronix.de, Yongqin Liu <yongqin.liu@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------mP4DtmCgHrSLYeotlpqkQH54
Content-Type: multipart/mixed; boundary="------------0cZuiczuakIfMobe8DLWpYSU";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 James@pengutronix.de, Liviu Dudau <liviu.dudau@arm.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>,
 Brian Starkey <brian.starkey@arm.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Russell King <linux@armlinux.org.uk>,
 Joel Stanley <joel@jms.id.au>, Sam Ravnborg <sam@ravnborg.org>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Rahul T R <r-ravikumar@ti.com>, Jayshri Pawar <jpawar@cadence.com>,
 Liu Ying <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Minghao Chi <chi.minghao@zte.com.cn>,
 Mark Brown <broonie@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Lucas Stach <l.stach@pengutronix.de>, Inki Dae <inki.dae@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Stefan Agner <stefan@agner.ch>,
 Alison Wang <alison.wang@nxp.com>, Xinliang Liu <xinliang.liu@linaro.org>,
 Tian Tao <tiantao6@hisilicon.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, Danilo Krummrich <dakr@redhat.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Cercueil
 <paul@crapouillou.net>, Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Edmund Dea <edmund.j.dea@intel.com>, Qiang Yu <yuq825@gmail.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Ricardo Ribalda <ribalda@chromium.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Johan Hovold <johan+linaro@kernel.org>, Joel@pengutronix.de,
 Stephen Boyd <swboyd@chromium.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Liu Shixin <liushixin2@huawei.com>, Douglas Anderson
 <dianders@chromium.org>, Miaoqian Lin <linmq006@gmail.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>, Marek Vasut <marex@denx.de>,
 Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Tomi Valkeinen <tomba@kernel.org>,
 Guo Zhengkui <guozhengkui@vivo.com>, Yuan Can <yuancan@huawei.com>,
 Arnd Bergmann <arnd@arndb.de>, Liang He <windhl@126.com>,
 Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=c3=bcbner?=
 <heiko@sntech.de>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Deepak R Varma <drv@mailo.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Jonathan Hunter
 <jonathanh@nvidia.com>, Maxime Ripard <maxime@cerno.tech>,
 =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Jyri Sarha <jyri.sarha@iki.fi>, Alexey Brodkin <abrodkin@synopsys.com>,
 Emma Anholt <emma@anholt.net>, Melissa Wen <mwen@igalia.com>,
 Hyun Kwon <hyun.kwon@xilinx.com>, Michal Simek <michal.simek@xilinx.com>
Cc: Mali DP Maintainers <malidp@foss.arm.com>,
 dri-devel@lists.freedesktop.org, kernel@pengutronix.de,
 Andrew Jeffery <andrew@aj.id.au>, linux-aspeed@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, Jonas Karlman <jonas@kwiboo.se>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 etnaviv@lists.freedesktop.org, Alim Akhtar <alim.akhtar@samsung.com>,
 linux-samsung-soc@vger.kernel.org,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Yongqin Liu
 <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>,
 linux-mips@vger.kernel.org, lima@lists.freedesktop.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mediatek@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, Sean Paul <sean@poorly.run>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org
Message-ID: <935faac5-280b-b2e0-3fdb-d0424990e43a@suse.de>
Subject: Re: [PATCH 00/53] drm: Convert to platform remove callback returning
 void
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>

--------------0cZuiczuakIfMobe8DLWpYSU
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCmZvciB0aGUgd2hvbGUgc2VyaWVzOg0KDQpSZXZpZXdlZC1ieTogVGhvbWFzIFpp
bW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQoNClBsZWFzZSBzZWUgbXkgY29tbWVu
dCBvbiB0aGUgcGF0Y2hlcyB0byB0aW55Ly4NCg0KTGV0IG1lIGtub3cgaWYgeW91IHdhbnQg
bWUgdG8gbWVyZ2UgdGhpcyBwYXRjaHNldCBpbnRvIGRybS1taXNjLW5leHQuDQoNCkJlc3Qg
cmVnYXJkcw0KVGhvbWFzDQoNCkFtIDA3LjA1LjIzIHVtIDE4OjI1IHNjaHJpZWIgVXdlIEts
ZWluZS1Lw7ZuaWc6DQo+IEhlbGxvLA0KPiANCj4gdGhpcyBwYXRjaCBzZXJpZXMgYWRhcHRz
IHRoZSBwbGF0Zm9ybSBkcml2ZXJzIGJlbG93IGRyaXZlcnMvZ3B1L2RybQ0KPiB0byB1c2Ug
dGhlIC5yZW1vdmVfbmV3KCkgY2FsbGJhY2suIENvbXBhcmVkIHRvIHRoZSB0cmFkaXRpb25h
bCAucmVtb3ZlKCkNCj4gY2FsbGJhY2sgLnJlbW92ZV9uZXcoKSByZXR1cm5zIG5vIHZhbHVl
LiBUaGlzIGlzIGEgZ29vZCB0aGluZyBiZWNhdXNlDQo+IHRoZSBkcml2ZXIgY29yZSBkb2Vz
bid0IChhbmQgY2Fubm90KSBjb3BlIGZvciBlcnJvcnMgZHVyaW5nIHJlbW92ZS4gVGhlDQo+
IG9ubHkgZWZmZWN0IG9mIGEgbm9uLXplcm8gcmV0dXJuIHZhbHVlIGluIC5yZW1vdmUoKSBp
cyB0aGF0IHRoZSBkcml2ZXINCj4gY29yZSBlbWl0cyBhIHdhcm5pbmcuIFRoZSBkZXZpY2Ug
aXMgcmVtb3ZlZCBhbnlob3cgYW5kIGFuIGVhcmx5IHJldHVybg0KPiBmcm9tIC5yZW1vdmUo
KSB1c3VhbGx5IHlpZWxkcyBhIHJlc291cmNlIGxlYWsuDQo+IA0KPiBCeSBjaGFuZ2luZyB0
aGUgcmVtb3ZlIGNhbGxiYWNrIHRvIHJldHVybiB2b2lkIGRyaXZlciBhdXRob3JzIGNhbm5v
dA0KPiByZWFzb25hYmx5IChidXQgd3JvbmdseSkgYXNzdW1lIGFueSBtb3JlIHRoYXQgdGhl
cmUgaGFwcGVucyBzb21lIGtpbmQgb2YNCj4gY2xlYW51cCBsYXRlci4NCj4gDQo+IEJlc3Qg
cmVnYXJkcw0KPiBVd2UNCj4gDQo+IFV3ZSBLbGVpbmUtS8O2bmlnICg1Myk6DQo+ICAgIGRy
bS9rb21lZGE6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmlu
ZyB2b2lkDQo+ICAgIGRybS9hcm0vaGRsY2Q6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3Zl
IGNhbGxiYWNrIHJldHVybmluZyB2b2lkDQo+ICAgIGRybS9hcm0vbWFsaWRwOiBDb252ZXJ0
IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZA0KPiAgICBkcm0v
YXJtYWRhOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcg
dm9pZA0KPiAgICBkcm0vYXNwZWVkOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxs
YmFjayByZXR1cm5pbmcgdm9pZA0KPiAgICBkcm0vYXRtZWwtaGxjZGM6IENvbnZlcnQgdG8g
cGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkDQo+ICAgIGRybS9icmlk
Z2U6IGNkbnMtZHNpOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1
cm5pbmcNCj4gICAgICB2b2lkDQo+ICAgIGRybS9icmlkZ2U6IGRpc3BsYXktY29ubmVjdG9y
OiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjaw0KPiAgICAgIHJldHVybmlu
ZyB2b2lkDQo+ICAgIGRybS9icmlkZ2U6IGZzbC1sZGI6IENvbnZlcnQgdG8gcGxhdGZvcm0g
cmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZw0KPiAgICAgIHZvaWQNCj4gICAgZHJtL2lteC9p
bXg4KjogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZv
aWQNCj4gICAgZHJtL2JyaWRnZTogbHZkcy1jb2RlYzogQ29udmVydCB0byBwbGF0Zm9ybSBy
ZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nDQo+ICAgICAgdm9pZA0KPiAgICBkcm0vYnJpZGdl
OiBud2wtZHNpOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5p
bmcNCj4gICAgICB2b2lkDQo+ICAgIGRybS9icmlkZ2U6IHNpbXBsZS1icmlkZ2U6IENvbnZl
cnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrDQo+ICAgICAgcmV0dXJuaW5nIHZvaWQN
Cj4gICAgZHJtL2JyaWRnZTogc3lub3BzeXM6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3Zl
IGNhbGxiYWNrIHJldHVybmluZw0KPiAgICAgIHZvaWQNCj4gICAgZHJtL2JyaWRnZTogdGhj
NjNsdmQxMDI0OiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjaw0KPiAgICAg
IHJldHVybmluZyB2b2lkDQo+ICAgIGRybS9icmlkZ2U6IHRmcDQxMDogQ29udmVydCB0byBw
bGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQNCj4gICAgZHJtL2V0bmF2
aXY6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lk
DQo+ICAgIGRybS9leHlub3M6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNr
IHJldHVybmluZyB2b2lkDQo+ICAgIGRybS9mc2wtZGN1OiBDb252ZXJ0IHRvIHBsYXRmb3Jt
IHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZA0KPiAgICBkcm0vaGlzaWxpY29uOiBD
b252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZA0KPiAg
ICBkcm0vaW14L2Rjc3M6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJl
dHVybmluZyB2b2lkDQo+ICAgIGRybS9pbXgvaXB1djM6IENvbnZlcnQgdG8gcGxhdGZvcm0g
cmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkDQo+ICAgIGRybS9pbmdlbmljOiBDb252
ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZA0KPiAgICBk
cm0va21iOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcg
dm9pZA0KPiAgICBkcm0vbGltYTogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJh
Y2sgcmV0dXJuaW5nIHZvaWQNCj4gICAgZHJtL2xvZ2ljdmM6IENvbnZlcnQgdG8gcGxhdGZv
cm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkDQo+ICAgIGRybS9tY2RlOiBDb252
ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZA0KPiAgICBk
cm0vbWVkaWF0ZWs6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVy
bmluZyB2b2lkDQo+ICAgIGRybS9tZWRpYXRlazogQ29udmVydCB0byBwbGF0Zm9ybSByZW1v
dmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQNCj4gICAgZHJtL21lc29uOiBDb252ZXJ0IHRv
IHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZA0KPiAgICBkcm0vbXNt
OiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZA0K
PiAgICBkcm0vbXhzZmI6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJl
dHVybmluZyB2b2lkDQo+ICAgIGRybS9ub3V2ZWF1OiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJl
bW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZA0KPiAgICBkcm0vb21hcDogQ29udmVydCB0
byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQNCj4gICAgZHJtL3Bh
bmVsOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9p
ZA0KPiAgICBkcm0vcGFuZnJvc3Q6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxi
YWNrIHJldHVybmluZyB2b2lkDQo+ICAgIGRybS9yY2FyLWR1OiBDb252ZXJ0IHRvIHBsYXRm
b3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZA0KPiAgICBkcm0vcm9ja2NoaXA6
IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkDQo+
ICAgIGRybS9zaG1vYmlsZTogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sg
cmV0dXJuaW5nIHZvaWQNCj4gICAgZHJtL3NwcmQ6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVt
b3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkDQo+ICAgIGRybS9zdGk6IENvbnZlcnQgdG8g
cGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkDQo+ICAgIGRybS9zdG06
IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkDQo+
ICAgIGRybS9zdW40aTogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0
dXJuaW5nIHZvaWQNCj4gICAgZHJtL3RlZ3JhOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92
ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZA0KPiAgICBkcm0vdGVzdHM6IGhlbHBlcnM6IENv
bnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkDQo+ICAg
IGRybS90aWRzczogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJu
aW5nIHZvaWQNCj4gICAgZHJtL3RpbGNkYzogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUg
Y2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQNCj4gICAgZHJtL3Rpbnk6IENvbnZlcnQgdG8gcGxh
dGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkDQo+ICAgIGRybS90aW55OiBD
b252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZA0KPiAg
ICBkcm0vdHZlMjAwOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1
cm5pbmcgdm9pZA0KPiAgICBkcm0vdjNkOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBj
YWxsYmFjayByZXR1cm5pbmcgdm9pZA0KPiAgICBkcm0vdmM0OiBDb252ZXJ0IHRvIHBsYXRm
b3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZA0KPiAgICBkcm0veGxueC96eW5x
bXBfZHBzdWI6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmlu
Zw0KPiAgICAgIHZvaWQNCj4gDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tv
bWVkYS9rb21lZGFfZHJ2LmMgICAgIHwgNSArKy0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9h
cm0vaGRsY2RfZHJ2LmMgICAgICAgICAgICAgICAgICAgICB8IDUgKystLS0NCj4gICBkcml2
ZXJzL2dwdS9kcm0vYXJtL21hbGlkcF9kcnYuYyAgICAgICAgICAgICAgICAgICAgfCA1ICsr
LS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FybWFkYS9hcm1hZGFfY3J0Yy5jICAgICAgICAg
ICAgICAgIHwgNSArKy0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hcm1hZGEvYXJtYWRhX2Ry
di5jICAgICAgICAgICAgICAgICB8IDUgKystLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYXNw
ZWVkL2FzcGVlZF9nZnhfZHJ2LmMgICAgICAgICAgICAgfCA2ICsrLS0tLQ0KPiAgIGRyaXZl
cnMvZ3B1L2RybS9hdG1lbC1obGNkYy9hdG1lbF9obGNkY19kYy5jICAgICAgICB8IDYgKyst
LS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9jYWRlbmNlL2NkbnMtZHNpLWNvcmUu
YyAgICAgIHwgNiArKy0tLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Rpc3BsYXkt
Y29ubmVjdG9yLmMgICAgICAgICAgfCA2ICsrLS0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9i
cmlkZ2UvZnNsLWxkYi5jICAgICAgICAgICAgICAgICAgICB8IDYgKystLS0tDQo+ICAgZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS9pbXgvaW14OHFtLWxkYi1kcnYuYyAgICAgICAgIHwgNiAr
Ky0tLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2lteC9pbXg4cXhwLWxkYi1kcnYu
YyAgICAgICAgfCA2ICsrLS0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvaW14L2lt
eDhxeHAtcGl4ZWwtY29tYmluZXIuYyB8IDYgKystLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJt
L2JyaWRnZS9pbXgvaW14OHF4cC1waXhlbC1saW5rLmMgICAgIHwgNiArKy0tLS0NCj4gICBk
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL2lteC9pbXg4cXhwLXB4bDJkcGkuYyAgICAgICAgfCA2
ICsrLS0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvbHZkcy1jb2RlYy5jICAgICAg
ICAgICAgICAgICB8IDYgKystLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9ud2wt
ZHNpLmMgICAgICAgICAgICAgICAgICAgIHwgNSArKy0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2Uvc2ltcGxlLWJyaWRnZS5jICAgICAgICAgICAgICB8IDYgKystLS0tDQo+ICAg
ZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLWFoYi1hdWRpby5jIHwg
NiArKy0tLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkt
Y2VjLmMgICAgICAgfCA2ICsrLS0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lu
b3BzeXMvZHctaGRtaS1ncC1hdWRpby5jICB8IDYgKystLS0tDQo+ICAgZHJpdmVycy9ncHUv
ZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLWkycy1hdWRpby5jIHwgNiArKy0tLS0NCj4g
ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RoYzYzbHZkMTAyNC5jICAgICAgICAgICAgICAg
fCA2ICsrLS0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktdGZwNDEwLmMgICAg
ICAgICAgICAgICAgICB8IDYgKystLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYv
ZXRuYXZpdl9kcnYuYyAgICAgICAgICAgICAgIHwgNiArKy0tLS0NCj4gICBkcml2ZXJzL2dw
dS9kcm0vZXRuYXZpdi9ldG5hdml2X2dwdS5jICAgICAgICAgICAgICAgfCA1ICsrLS0tDQo+
ICAgZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3M1NDMzX2RybV9kZWNvbi5jICAgICAg
IHwgNiArKy0tLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vczdfZHJtX2Rl
Y29uLmMgICAgICAgICAgfCA2ICsrLS0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9leHlub3Mv
ZXh5bm9zX2RwLmMgICAgICAgICAgICAgICAgICB8IDYgKystLS0tDQo+ICAgZHJpdmVycy9n
cHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2Rydi5jICAgICAgICAgICAgIHwgNSArKy0tLQ0K
PiAgIGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9kc2kuYyAgICAgICAgICAg
ICB8IDYgKystLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2Zp
bWMuYyAgICAgICAgICAgIHwgNiArKy0tLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vZXh5bm9z
L2V4eW5vc19kcm1fZmltZC5jICAgICAgICAgICAgfCA2ICsrLS0tLQ0KPiAgIGRyaXZlcnMv
Z3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9nMmQuYyAgICAgICAgICAgICB8IDYgKystLS0t
DQo+ICAgZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2dzYy5jICAgICAgICAg
ICAgIHwgNiArKy0tLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1f
bWljLmMgICAgICAgICAgICAgfCA2ICsrLS0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9leHlu
b3MvZXh5bm9zX2RybV9yb3RhdG9yLmMgICAgICAgICB8IDYgKystLS0tDQo+ICAgZHJpdmVy
cy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX3NjYWxlci5jICAgICAgICAgIHwgNiArKy0t
LS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19oZG1pLmMgICAgICAgICAg
ICAgICAgfCA2ICsrLS0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX21p
eGVyLmMgICAgICAgICAgICAgICB8IDYgKystLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2Zz
bC1kY3UvZnNsX2RjdV9kcm1fZHJ2LmMgICAgICAgICAgIHwgNiArKy0tLS0NCj4gICBkcml2
ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2tpcmluL2R3X2RybV9kc2kuYyAgICAgICAgfCA2ICsr
LS0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24va2lyaW4va2lyaW5fZHJtX2Ry
di5jICAgICB8IDUgKystLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vaW14L2Rjc3MvZGNzcy1k
cnYuYyAgICAgICAgICAgICAgICAgfCA2ICsrLS0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9p
bXgvaXB1djMvZHdfaGRtaS1pbXguYyAgICAgICAgICAgICB8IDYgKystLS0tDQo+ICAgZHJp
dmVycy9ncHUvZHJtL2lteC9pcHV2My9pbXgtZHJtLWNvcmUuYyAgICAgICAgICAgIHwgNSAr
Ky0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9pbXgvaXB1djMvaW14LWxkYi5jICAgICAgICAg
ICAgICAgICB8IDUgKystLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vaW14L2lwdXYzL2lteC10
dmUuYyAgICAgICAgICAgICAgICAgfCA1ICsrLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2lt
eC9pcHV2My9pcHV2My1jcnRjLmMgICAgICAgICAgICAgIHwgNSArKy0tLQ0KPiAgIGRyaXZl
cnMvZ3B1L2RybS9pbXgvaXB1djMvcGFyYWxsZWwtZGlzcGxheS5jICAgICAgICB8IDYgKyst
LS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2luZ2VuaWMvaW5nZW5pYy1kcm0tZHJ2LmMgICAg
ICAgICAgIHwgNiArKy0tLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vaW5nZW5pYy9pbmdlbmlj
LWlwdS5jICAgICAgICAgICAgICAgfCA1ICsrLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2tt
Yi9rbWJfZHJ2LmMgICAgICAgICAgICAgICAgICAgICAgIHwgNSArKy0tLQ0KPiAgIGRyaXZl
cnMvZ3B1L2RybS9saW1hL2xpbWFfZHJ2LmMgICAgICAgICAgICAgICAgICAgICB8IDUgKyst
LS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vbG9naWN2Yy9sb2dpY3ZjX2RybS5jICAgICAgICAg
ICAgICAgfCA2ICsrLS0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9tY2RlL21jZGVfZHJ2LmMg
ICAgICAgICAgICAgICAgICAgICB8IDYgKystLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL21j
ZGUvbWNkZV9kc2kuYyAgICAgICAgICAgICAgICAgICAgIHwgNiArKy0tLS0NCj4gICBkcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2NlYy5jICAgICAgICAgICAgICAgICAgfCA1ICsr
LS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX2FhbC5jICAgICAg
ICAgICAgIHwgNiArKy0tLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rp
c3BfY2NvcnIuYyAgICAgICAgICAgfCA2ICsrLS0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZGlzcF9jb2xvci5jICAgICAgICAgICB8IDYgKystLS0tDQo+ICAgZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX2dhbW1hLmMgICAgICAgICAgIHwgNiAr
Ky0tLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfbWVyZ2UuYyAg
ICAgICAgICAgfCA2ICsrLS0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZGlzcF9vdmwuYyAgICAgICAgICAgICB8IDYgKystLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kaXNwX3JkbWEuYyAgICAgICAgICAgIHwgNiArKy0tLS0NCj4gICBk
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwLmMgICAgICAgICAgICAgICAgICAgfCA2
ICsrLS0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMgICAgICAg
ICAgICAgICAgICB8IDYgKystLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kcm1fZHJ2LmMgICAgICAgICAgICAgIHwgNiArKy0tLS0NCj4gICBkcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2RzaS5jICAgICAgICAgICAgICAgICAgfCA2ICsrLS0tLQ0KPiAg
IGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jICAgICAgICAgICAgICAgICB8
IDUgKystLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWlfZGRjLmMg
ICAgICAgICAgICAgfCA2ICsrLS0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfbWRwX3JkbWEuYyAgICAgICAgICAgICB8IDUgKystLS0NCj4gICBkcml2ZXJzL2dwdS9k
cm0vbWVzb24vbWVzb25fZHJ2LmMgICAgICAgICAgICAgICAgICAgfCA2ICsrLS0tLQ0KPiAg
IGRyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9kd19oZG1pLmMgICAgICAgICAgICAgICB8
IDYgKystLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYWRyZW5vX2Rldmlj
ZS5jICAgICAgICAgIHwgNSArKy0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9k
cHUxL2RwdV9rbXMuYyAgICAgICAgICAgICB8IDYgKystLS0tDQo+ICAgZHJpdmVycy9ncHUv
ZHJtL21zbS9kaXNwL21kcDQvbWRwNF9rbXMuYyAgICAgICAgICAgIHwgNiArKy0tLS0NCj4g
ICBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9tZHA1X2ttcy5jICAgICAgICAgICAg
fCA1ICsrLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL21zbS9kcC9kcF9kaXNwbGF5LmMgICAg
ICAgICAgICAgICAgIHwgNiArKy0tLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9k
c2kuYyAgICAgICAgICAgICAgICAgICAgICAgfCA2ICsrLS0tLQ0KPiAgIGRyaXZlcnMvZ3B1
L2RybS9tc20vaGRtaS9oZG1pLmMgICAgICAgICAgICAgICAgICAgICB8IDYgKystLS0tDQo+
ICAgZHJpdmVycy9ncHUvZHJtL21zbS9oZG1pL2hkbWlfcGh5LmMgICAgICAgICAgICAgICAg
IHwgNiArKy0tLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9kcnYuYyAgICAgICAg
ICAgICAgICAgICAgICAgfCA2ICsrLS0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9tc20vbXNt
X21kc3MuYyAgICAgICAgICAgICAgICAgICAgICB8IDYgKystLS0tDQo+ICAgZHJpdmVycy9n
cHUvZHJtL214c2ZiL2xjZGlmX2Rydi5jICAgICAgICAgICAgICAgICAgIHwgNiArKy0tLS0N
Cj4gICBkcml2ZXJzL2dwdS9kcm0vbXhzZmIvbXhzZmJfZHJ2LmMgICAgICAgICAgICAgICAg
ICAgfCA2ICsrLS0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfcGxh
dGZvcm0uYyAgICAgICAgICB8IDUgKystLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vb21hcGRy
bS9kc3MvZGlzcGMuYyAgICAgICAgICAgICAgICAgfCA1ICsrLS0tDQo+ICAgZHJpdmVycy9n
cHUvZHJtL29tYXBkcm0vZHNzL2RzaS5jICAgICAgICAgICAgICAgICAgIHwgNiArKy0tLS0N
Cj4gICBkcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3MvZHNzLmMgICAgICAgICAgICAgICAg
ICAgfCA2ICsrLS0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9oZG1pNC5j
ICAgICAgICAgICAgICAgICB8IDUgKystLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vb21hcGRy
bS9kc3MvaGRtaTUuYyAgICAgICAgICAgICAgICAgfCA1ICsrLS0tDQo+ICAgZHJpdmVycy9n
cHUvZHJtL29tYXBkcm0vZHNzL3ZlbmMuYyAgICAgICAgICAgICAgICAgIHwgNSArKy0tLQ0K
PiAgIGRyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfZG1tX3RpbGVyLmMgICAgICAgICAg
ICB8IDkgKysrLS0tLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9kcnYu
YyAgICAgICAgICAgICAgICAgIHwgNiArKy0tLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vcGFu
ZWwvcGFuZWwtbHZkcy5jICAgICAgICAgICAgICAgICAgfCA2ICsrLS0tLQ0KPiAgIGRyaXZl
cnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zZWlrby00M3d2ZjFnLmMgICAgICAgICB8IDYgKyst
LS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNoYXJwLWxzMDM3djdkdzAx
LmMgICAgIHwgNiArKy0tLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2lt
cGxlLmMgICAgICAgICAgICAgICAgfCA2ICsrLS0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9w
YW5mcm9zdC9wYW5mcm9zdF9kcnYuYyAgICAgICAgICAgICB8IDUgKystLS0NCj4gICBkcml2
ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2NtbS5jICAgICAgICAgICAgICAgICAgfCA2ICsr
LS0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfZHJ2LmMgICAgICAg
ICAgICAgICB8IDYgKystLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9k
d19oZG1pLmMgICAgICAgICAgICAgIHwgNiArKy0tLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0v
cmNhci1kdS9yY2FyX2x2ZHMuYyAgICAgICAgICAgICAgICAgfCA2ICsrLS0tLQ0KPiAgIGRy
aXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfbWlwaV9kc2kuYyAgICAgICAgICAgICB8IDYg
KystLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcnpnMmxfbWlwaV9kc2kuYyAg
ICAgICAgICAgIHwgNiArKy0tLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvYW5h
bG9naXhfZHAtcm9ja2NoaXAuYyAgICAgfCA2ICsrLS0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2Ry
bS9yb2NrY2hpcC9jZG4tZHAtY29yZS5jICAgICAgICAgICAgICB8IDYgKystLS0tDQo+ICAg
ZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL2R3LW1pcGktZHNpLXJvY2tjaGlwLmMgICAgIHwg
NiArKy0tLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvZHdfaGRtaS1yb2NrY2hp
cC5jICAgICAgICAgfCA2ICsrLS0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9p
bm5vX2hkbWkuYyAgICAgICAgICAgICAgICB8IDYgKystLS0tDQo+ICAgZHJpdmVycy9ncHUv
ZHJtL3JvY2tjaGlwL3JrMzA2Nl9oZG1pLmMgICAgICAgICAgICAgIHwgNiArKy0tLS0NCj4g
ICBkcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX2Rydi5jICAgICAgICAg
fCA2ICsrLS0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9sdmRz
LmMgICAgICAgICAgICB8IDYgKystLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlw
L3JvY2tjaGlwX3ZvcDJfcmVnLmMgICAgICAgIHwgNiArKy0tLS0NCj4gICBkcml2ZXJzL2dw
dS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfdm9wX3JlZy5jICAgICAgICAgfCA2ICsrLS0tLQ0K
PiAgIGRyaXZlcnMvZ3B1L2RybS9zaG1vYmlsZS9zaG1vYl9kcm1fZHJ2LmMgICAgICAgICAg
ICB8IDYgKystLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL3NwcmQvc3ByZF9kcHUuYyAgICAg
ICAgICAgICAgICAgICAgIHwgNiArKy0tLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vc3ByZC9z
cHJkX2RybS5jICAgICAgICAgICAgICAgICAgICAgfCA1ICsrLS0tDQo+ICAgZHJpdmVycy9n
cHUvZHJtL3NwcmQvc3ByZF9kc2kuYyAgICAgICAgICAgICAgICAgICAgIHwgNiArKy0tLS0N
Cj4gICBkcml2ZXJzL2dwdS9kcm0vc3RpL3N0aV9jb21wb3NpdG9yLmMgICAgICAgICAgICAg
ICAgfCA1ICsrLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL3N0aS9zdGlfZHJ2LmMgICAgICAg
ICAgICAgICAgICAgICAgIHwgNiArKy0tLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vc3RpL3N0
aV9kdm8uYyAgICAgICAgICAgICAgICAgICAgICAgfCA1ICsrLS0tDQo+ICAgZHJpdmVycy9n
cHUvZHJtL3N0aS9zdGlfaGRhLmMgICAgICAgICAgICAgICAgICAgICAgIHwgNSArKy0tLQ0K
PiAgIGRyaXZlcnMvZ3B1L2RybS9zdGkvc3RpX2hkbWkuYyAgICAgICAgICAgICAgICAgICAg
ICB8IDYgKystLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL3N0aS9zdGlfaHF2ZHAuYyAgICAg
ICAgICAgICAgICAgICAgIHwgNSArKy0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9zdGkvc3Rp
X3R2b3V0LmMgICAgICAgICAgICAgICAgICAgICB8IDUgKystLS0NCj4gICBkcml2ZXJzL2dw
dS9kcm0vc3RtL2Rydi5jICAgICAgICAgICAgICAgICAgICAgICAgICAgfCA2ICsrLS0tLQ0K
PiAgIGRyaXZlcnMvZ3B1L2RybS9zdG0vZHdfbWlwaV9kc2ktc3RtLmMgICAgICAgICAgICAg
ICB8IDYgKystLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjRpX2JhY2tlbmQu
YyAgICAgICAgICAgICAgIHwgNiArKy0tLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vc3VuNGkv
c3VuNGlfZHJ2LmMgICAgICAgICAgICAgICAgICAgfCA2ICsrLS0tLQ0KPiAgIGRyaXZlcnMv
Z3B1L2RybS9zdW40aS9zdW40aV9mcm9udGVuZC5jICAgICAgICAgICAgICB8IDYgKystLS0t
DQo+ICAgZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjRpX2hkbWlfZW5jLmMgICAgICAgICAg
ICAgIHwgNiArKy0tLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNGlfdGNvbi5j
ICAgICAgICAgICAgICAgICAgfCA2ICsrLS0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9zdW40
aS9zdW40aV90di5jICAgICAgICAgICAgICAgICAgICB8IDYgKystLS0tDQo+ICAgZHJpdmVy
cy9ncHUvZHJtL3N1bjRpL3N1bjZpX2RyYy5jICAgICAgICAgICAgICAgICAgIHwgNiArKy0t
LS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNmlfbWlwaV9kc2kuYyAgICAgICAg
ICAgICAgfCA2ICsrLS0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW44aV9kd19o
ZG1pLmMgICAgICAgICAgICAgICB8IDYgKystLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL3N1
bjRpL3N1bjhpX21peGVyLmMgICAgICAgICAgICAgICAgIHwgNiArKy0tLS0NCj4gICBkcml2
ZXJzL2dwdS9kcm0vc3VuNGkvc3VuOGlfdGNvbl90b3AuYyAgICAgICAgICAgICAgfCA2ICsr
LS0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9kcGF1eC5jICAgICAgICAgICAgICAg
ICAgICAgICB8IDYgKystLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL3Rlc3RzL2RybV9rdW5p
dF9oZWxwZXJzLmMgICAgICAgICAgIHwgNSArKy0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS90
aWRzcy90aWRzc19kcnYuYyAgICAgICAgICAgICAgICAgICB8IDYgKystLS0tDQo+ICAgZHJp
dmVycy9ncHUvZHJtL3RpbGNkYy90aWxjZGNfcGFuZWwuYyAgICAgICAgICAgICAgIHwgNiAr
Ky0tLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vdGlueS9hcmNwZ3UuYyAgICAgICAgICAgICAg
ICAgICAgICAgfCA2ICsrLS0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS90aW55L29mZHJtLmMg
ICAgICAgICAgICAgICAgICAgICAgICB8IDYgKystLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJt
L3Rpbnkvc2ltcGxlZHJtLmMgICAgICAgICAgICAgICAgICAgIHwgNiArKy0tLS0NCj4gICBk
cml2ZXJzL2dwdS9kcm0vdHZlMjAwL3R2ZTIwMF9kcnYuYyAgICAgICAgICAgICAgICAgfCA2
ICsrLS0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS92M2QvdjNkX2Rydi5jICAgICAgICAgICAg
ICAgICAgICAgICB8IDYgKystLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfY3J0
Yy5jICAgICAgICAgICAgICAgICAgICAgIHwgNSArKy0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2Ry
bS92YzQvdmM0X2RwaS5jICAgICAgICAgICAgICAgICAgICAgICB8IDUgKystLS0NCj4gICBk
cml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9kcnYuYyAgICAgICAgICAgICAgICAgICAgICAgfCA2
ICsrLS0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2RzaS5jICAgICAgICAgICAg
ICAgICAgICAgICB8IDYgKystLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfaGRt
aS5jICAgICAgICAgICAgICAgICAgICAgIHwgNSArKy0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2Ry
bS92YzQvdmM0X2h2cy5jICAgICAgICAgICAgICAgICAgICAgICB8IDUgKystLS0NCj4gICBk
cml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF90eHAuYyAgICAgICAgICAgICAgICAgICAgICAgfCA1
ICsrLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfdjNkLmMgICAgICAgICAgICAg
ICAgICAgICAgIHwgNSArKy0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS92YzQvdmM0X3ZlYy5j
ICAgICAgICAgICAgICAgICAgICAgICB8IDUgKystLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0v
eGxueC96eW5xbXBfZHBzdWIuYyAgICAgICAgICAgICAgICAgfCA2ICsrLS0tLQ0KPiAgIDE1
OSBmaWxlcyBjaGFuZ2VkLCAzMTkgaW5zZXJ0aW9ucygrKSwgNTk3IGRlbGV0aW9ucygtKQ0K
PiANCj4gDQo+IGJhc2UtY29tbWl0OiA0NTczOTFiMDM4MDMzNWQ1ZTlhNWJhYmRlYzkwYWM1
MzkyOGIyM2I0DQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBE
ZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KRnJhbmtl
bnN0cmFzc2UgMTQ2LCA5MDQ2MSBOdWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYs
IEFuZHJldyBNeWVycywgQW5kcmV3IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAz
NjgwOSAoQUcgTnVlcm5iZXJnKQ0K

--------------0cZuiczuakIfMobe8DLWpYSU--

--------------mP4DtmCgHrSLYeotlpqkQH54
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmRYn3MFAwAAAAAACgkQlh/E3EQov+AK
uw/+NorlWfWUfdC7SRPtXNIkRrwjEYv0sjqshTzSkLh+4Ox+nWXOIc2c615TNLa01/gY4ch/DLe1
6GffTnP9xKNo8H7aZhMIg+Xo5vJeLqZMbN3MqWNW1Cm8FiVlESVcmP7n2GeUeGCcjvInDU38psao
4HWMwKfC6e4LwJyNC9Vh7ldp9QGcJY/5tiYsnofS9xXBKx0LnIyd6HiWJ5kgtzJ7s3bSLTTAECQw
j/kln2/aneEkqQQjZxFwIfkd/O5EoaTCggPpfEfbST9iLPHnRfdSs+aTctO9ylspHhNSj2jRCS6D
xIQL7KdcX/lc+1au69REYXRalMqWLFcDSEpExRCARROlt+urIyQmEaMqzALCu/nO75u1f6IBO0jX
tho2T67/YF/42Fa5XVHoaNGnZf4iGCLC22SMUtLHSyoM3Lfum3bBabgaEDUmY1gpvZk08Abc1ufn
JJ47nLEH5wH/eaHbkiM8PFzSgjfgoa58qfL+n54EatI7stzfIuC6DCBG2xY2H89iQ1QVd3zFSfOe
fcXjZadR5xO23PaGGZY0vMRUGkU4dnLHpe/32bfDSrQDGBVbkv3DERgGElYYU1xlKrNqsNm5DXxW
vp8caiohUKq9JbgImuHNLKUsSzXN60hxr0jTgS9wBE8mBFVke+N+yVV1gTSTDwQ3pouMXvtQBHje
5Vo=
=ymhu
-----END PGP SIGNATURE-----

--------------mP4DtmCgHrSLYeotlpqkQH54--
