Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3FFB750C0C
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 17:14:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A466C10E566;
	Wed, 12 Jul 2023 15:14:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2AF410E143;
 Wed, 12 Jul 2023 11:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689160486; x=1720696486;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=pa2Bj6VqT5cElyyhfEvI8AxkZz4IX9juc4rRJw0HbBE=;
 b=gaflAFx5VZTk90cRxsoZ6xtpXo3QqZFz1W0I1AvvxO8tSbO2id+zhepa
 kjdRdAzyY9uzbzT+Cqckdt/FQkhaumynR/EU82CiAHgs6g+EoJMXknaP6
 OWuvibY031yz+kU/r4IyW7sb2380+RJf267SDhzy9VhR+5vlO+3MN4YCf
 DvBwECBuTwF0YT9+eVQtKFg4ARg3Wem1NW+hdJLONqc5/pmi5NWfUjp7i
 YYcqeVKYdSVsKBZYmmY2OVOF6tZzkhad1KE0ZCSVN1QSdtkrg2Foz5Dgg
 3x1vUVfEl9e087oOxybF1QhrCRR23mtZ4LyPBJZHeqXSIXjz0cebxDR7u A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="368396151"
X-IronPort-AV: E=Sophos;i="6.01,199,1684825200"; d="scan'208";a="368396151"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2023 04:14:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="1052148842"
X-IronPort-AV: E=Sophos;i="6.01,199,1684825200"; d="scan'208";a="1052148842"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.31.249])
 ([10.213.31.249])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2023 04:13:48 -0700
Message-ID: <60a183df-9776-1f10-bbd7-248531921888@intel.com>
Date: Wed, 12 Jul 2023 13:13:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH RFC v1 00/52] drm/crtc: Rename struct drm_crtc::dev to
 drm_dev
Content-Language: en-US
To: Julia Lawall <julia.lawall@inria.fr>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
 <94eb6e4d-9384-152f-351b-ebb217411da9@amd.com>
 <20230712110253.paoyrmcbvlhpfxbf@pengutronix.de>
 <acd7913-3c42-7354-434-a826b6c8718@inria.fr>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <acd7913-3c42-7354-434-a826b6c8718@inria.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 12 Jul 2023 15:14:33 +0000
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Xinliang Liu <xinliang.liu@linaro.org>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Alexey Kodanev <aleksei.kodanev@bell-sw.com>, dri-devel@lists.freedesktop.org,
 Vandita Kulkarni <vandita.kulkarni@intel.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Arun R Murthy <arun.r.murthy@intel.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Liu Shixin <liushixin2@huawei.com>, linux-samsung-soc@vger.kernel.org,
 Samuel Holland <samuel@sholland.org>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Wenjing Liu <wenjing.liu@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Danilo Krummrich <dakr@redhat.com>, NXP Linux Team <linux-imx@nxp.com>,
 spice-devel@lists.freedesktop.org,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 linux-sunxi@lists.linux.dev, Stylon Wang <stylon.wang@amd.com>,
 Tim Huang <Tim.Huang@amd.com>, Suraj Kandpal <suraj.kandpal@intel.com>,
 =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Yifan Zhang <yifan1.zhang@amd.com>,
 Jani Nikula <jani.nikula@intel.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Hersen Wu <hersenxs.wu@amd.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 =?UTF-8?Q?=c5=81ukasz_Bartosik?= <lb@semihalf.com>,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 Andrew Jeffery <andrew@aj.id.au>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>, kernel@pengutronix.de,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-aspeed@lists.ozlabs.org, nouveau@lists.freedesktop.org,
 Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 =?UTF-8?Q?Jos=c3=a9_Roberto_de_Souza?= <jose.souza@intel.com>,
 virtualization@lists.linux-foundation.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Yongqin Liu <yongqin.liu@linaro.org>,
 Mario Limonciello <mario.limonciello@amd.com>, Fei Yang <fei.yang@intel.com>,
 David Lechner <david@lechnology.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 "Jiri Slaby \(SUSE\)" <jirislaby@kernel.org>,
 David Francis <David.Francis@amd.com>, Aaron Liu <aaron.liu@amd.com>,
 Vinod Polimera <quic_vpolimer@quicinc.com>, linux-rockchip@lists.infradead.org,
 Fangzhi Zuo <jerry.zuo@amd.com>, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 Ben Skeggs <bskeggs@redhat.com>,
 =?UTF-8?Q?Jouni_H=c3=b6gander?= <jouni.hogander@intel.com>,
 Dave Airlie <airlied@redhat.com>, linux-mips@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Animesh Manna <animesh.manna@intel.com>,
 linux-renesas-soc@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, linux-amlogic@lists.infradead.org,
 Evan Quan <evan.quan@amd.com>, Michal Simek <michal.simek@amd.com>,
 linux-arm-kernel@lists.infradead.org, Sean Paul <sean@poorly.run>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, Sandy Huang <hjc@rock-chips.com>,
 Swati Sharma <swati2.sharma@intel.com>, John Stultz <jstultz@google.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Drew Davenport <ddavenport@chromium.org>, Kevin Hilman <khilman@baylibre.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Anusha Srivatsa <anusha.srivatsa@intel.com>, Dan Carpenter <error27@gmail.com>,
 Karol Herbst <kherbst@redhat.com>, linux-hyperv@vger.kernel.org,
 Melissa Wen <melissa.srw@gmail.com>,
 =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>,
 Luca Coelho <luciano.coelho@intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Likun Gao <Likun.Gao@amd.com>, Sam Ravnborg <sam@ravnborg.org>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Deepak Rawat <drawat.floss@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Joel Stanley <joel@jms.id.au>, Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Alan Liu <haoping.liu@amd.com>,
 Philip Yang <Philip.Yang@amd.com>, intel-gfx@lists.freedesktop.org,
 Alison Wang <alison.wang@nxp.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Mikko Perttunen <mperttunen@nvidia.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Tomi Valkeinen <tomba@kernel.org>, Deepak R Varma <drv@mailo.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Tian Tao <tiantao6@hisilicon.com>, Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Khaled Almahallawy <khaled.almahallawy@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, Emma Anholt <emma@anholt.net>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Roman Li <roman.li@amd.com>,
 Paul Cercueil <paul@crapouillou.net>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Marek Vasut <marex@denx.de>, Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 xen-devel@lists.xenproject.org, Guchun Chen <guchun.chen@amd.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Russell King <linux@armlinux.org.uk>, Leo Li <sunpeng.li@amd.com>,
 Uma Shankar <uma.shankar@intel.com>, Mika Kahola <mika.kahola@intel.com>,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Vinod Govindapillai <vinod.govindapillai@intel.com>,
 linux-tegra@vger.kernel.org,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>,
 =?UTF-8?Q?Joaqu=c3=adn_Ignacio_Aramend=c3=ada?= <samsagax@gmail.com>,
 Melissa Wen <mwen@igalia.com>, Hans de Goede <hdegoede@redhat.com>,
 linux-mediatek@lists.infradead.org,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 David Tadokoro <davidbtadokoro@usp.br>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Orson Zhai <orsonzhai@gmail.com>, amd-gfx@lists.freedesktop.org,
 Jyri Sarha <jyri.sarha@iki.fi>, Yannick Fertre <yannick.fertre@foss.st.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Philippe Cornu <philippe.cornu@foss.st.com>, Wayne Lin <Wayne.Lin@amd.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Nirmoy Das <nirmoy.das@intel.com>, Lang Yu <Lang.Yu@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12.07.2023 13:07, Julia Lawall wrote:
>
> On Wed, 12 Jul 2023, Uwe Kleine-König wrote:
>
>> On Wed, Jul 12, 2023 at 12:46:33PM +0200, Christian König wrote:
>>> Am 12.07.23 um 11:46 schrieb Uwe Kleine-König:
>>>> Hello,
>>>>
>>>> while I debugged an issue in the imx-lcdc driver I was constantly
>>>> irritated about struct drm_device pointer variables being named "dev"
>>>> because with that name I usually expect a struct device pointer.
>>>>
>>>> I think there is a big benefit when these are all renamed to "drm_dev".
>>>> I have no strong preference here though, so "drmdev" or "drm" are fine
>>>> for me, too. Let the bikesheding begin!
>>>>
>>>> Some statistics:
>>>>
>>>> $ git grep -ohE 'struct drm_device *\* *[^ (),;]*' v6.5-rc1 | sort | uniq -c | sort -n
>>>>         1 struct drm_device *adev_to_drm
>>>>         1 struct drm_device *drm_
>>>>         1 struct drm_device          *drm_dev
>>>>         1 struct drm_device        *drm_dev
>>>>         1 struct drm_device *pdev
>>>>         1 struct drm_device *rdev
>>>>         1 struct drm_device *vdev
>>>>         2 struct drm_device *dcss_drv_dev_to_drm
>>>>         2 struct drm_device **ddev
>>>>         2 struct drm_device *drm_dev_alloc
>>>>         2 struct drm_device *mock
>>>>         2 struct drm_device *p_ddev
>>>>         5 struct drm_device *device
>>>>         9 struct drm_device * dev
>>>>        25 struct drm_device *d
>>>>        95 struct drm_device *
>>>>       216 struct drm_device *ddev
>>>>       234 struct drm_device *drm_dev
>>>>       611 struct drm_device *drm
>>>>      4190 struct drm_device *dev
>>>>
>>>> This series starts with renaming struct drm_crtc::dev to drm_dev. If
>>>> it's not only me and others like the result of this effort it should be
>>>> followed up by adapting the other structs and the individual usages in
>>>> the different drivers.
>>>>
>>>> To make this series a bit easier handleable, I first added an alias for
>>>> drm_crtc::dev, then converted the drivers one after another and the last
>>>> patch drops the "dev" name. This has the advantage of being easier to
>>>> review, and if I should have missed an instance only the last patch must
>>>> be dropped/reverted. Also this series might conflict with other patches,
>>>> in this case the remaining patches can still go in (apart from the last
>>>> one of course). Maybe it also makes sense to delay applying the last
>>>> patch by one development cycle?
>>> When you automatically generate the patch (with cocci for example) I usually
>>> prefer a single patch instead.
>> Maybe I'm too stupid, but only parts of this patch were created by
>> coccinelle. I failed to convert code like
>>
>> -       spin_lock_irq(&crtc->dev->event_lock);
>> +       spin_lock_irq(&crtc->drm_dev->event_lock);
>>
>> Added Julia to Cc, maybe she has a hint?!
> A priori, I see no reason why the rule below should not apply to the above
> code.  Is there a parsing problem in the containing function?  You can run
>
> spatch --parse-c file.c
>
> If there is a paring problem, please let me know and i will try to fix it
> so the while thing can be done automatically.

I guess some clever macros can fool spatch, at least I observe such 
things in i915 which often uses custom iterators.

Regards
Andrzej

>
> julia
>
>> (Up to now it's only
>>
>> @@
>> struct drm_crtc *crtc;
>> @@
>> -crtc->dev
>> +crtc->drm_dev
>>
>> )
>>
>>> Background is that this makes merge conflicts easier to handle and detect.
>> Really? Each file (apart from include/drm/drm_crtc.h) is only touched
>> once. So unless I'm missing something you don't get less or easier
>> conflicts by doing it all in a single patch. But you gain the freedom to
>> drop a patch for one driver without having to drop the rest with it. So
>> I still like the split version better, but I'm open to a more verbose
>> reasoning from your side.
>>
>>> When you have multiple patches and a merge conflict because of some added
>>> lines using the old field the build breaks only on the last patch which
>>> removes the old field.
>> Then you can revert/drop the last patch without having to respin the
>> whole single patch and thus caring for still more conflicts that arise
>> until the new version is sent.
>>
>> Best regards
>> Uwe
>>
>> --
>> Pengutronix e.K.                           | Uwe Kleine-König            |
>> Industrial Linux Solutions                 | https://www.pengutronix.de/ |
> >

