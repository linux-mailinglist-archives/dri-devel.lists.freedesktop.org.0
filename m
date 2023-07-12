Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3D4750C13
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 17:15:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7718310E569;
	Wed, 12 Jul 2023 15:14:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::601])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B57F10E4D6;
 Wed, 12 Jul 2023 10:47:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i9y9F3bK8eZ2iRf+lGql5tA04nNtMrc/oKqP5W355vVcaTSVXifcq0zjtO9N6UDoGXtLNvbIKv6V9q6Wr/qNxDGRUhrcOlyKZG7eb+Fg5IRtNLnE77K8gF6w2OoNHQEazCzpfD8qcgZ3m5dhf+hZzpn0V9KKQ+nBLxfHbA7ZO6UGDkitod/BTN431/tQe+cw+dG1gECFQ5tAs8jTpx8kunEJCv1V34oGHQB330NfDBf9+Yrx4KP0MjKwMXG/xlWI0+I3HGgyb+zyDfQwPq4ijOblSkQRobgPowde3FQIh3jKeT7t944yOeNunVqRd5gj4Tw3Tqyao0/lBOBqHleRlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jtiXEW1wD2EK6Q02eAsJIMpx8KRKJYL0nEclxMsyTSg=;
 b=naFtHbvNX/8ipT88UW6vtBqJjkVey/c2feinkWKKNlbfWVi/4tfISb/bz8n+ltwoKfjH8KA3s03NoWCnJTb1L0fml8gfwUpmJtKbpf3nMnhNz8UJV2b1T9ij9+6O3nO3yFtBfkVzg9sbc9UnvdTSFmjGB5bDWZ0AKJCQDl6KEEVFC2+bdK9bwnLZ4QEjz+r106db++Lg5HEV9jbjzk1gU5MrJGiKOfYuiaF9n6Fk7h27mPCER3MOqi9tlO38NEp39BmT+svixzfbSTWT8C2FXKOAlqMGwxzyRX5XE9oZFtyI2L0viDJQMaAMoqJgiAZs6ba8o47MeMXemw8MWxpnpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jtiXEW1wD2EK6Q02eAsJIMpx8KRKJYL0nEclxMsyTSg=;
 b=HclMOfeK57hRWyLK9HHoLORteEMFDGP1Bf5OE9Lgz31+9wtLUA4TMmlxu2C1+sFxYh9cTPh/4qxS111lQOQXwFATkn8k1HKYDTUEa3mvkBAwd0V7H9MYVlfGlMeMzznJI7udvHomoFW+av7E5FThBQvDyDMklRWPlxN1xqOwYc8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BL1PR12MB5349.namprd12.prod.outlook.com (2603:10b6:208:31f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.31; Wed, 12 Jul
 2023 10:47:02 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::669f:5dca:d38a:9921]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::669f:5dca:d38a:9921%4]) with mapi id 15.20.6588.017; Wed, 12 Jul 2023
 10:47:02 +0000
Message-ID: <94eb6e4d-9384-152f-351b-ebb217411da9@amd.com>
Date: Wed, 12 Jul 2023 12:46:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH RFC v1 00/52] drm/crtc: Rename struct drm_crtc::dev to
 drm_dev
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>, "Pan, Xinhui"
 <Xinhui.Pan@amd.com>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Guchun Chen <guchun.chen@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Evan Quan <evan.quan@amd.com>, Likun Gao <Likun.Gao@amd.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>,
 David Francis <David.Francis@amd.com>, Hawking Zhang
 <Hawking.Zhang@amd.com>, Graham Sider <Graham.Sider@amd.com>,
 Lang Yu <Lang.Yu@amd.com>, Philip Yang <Philip.Yang@amd.com>,
 Yifan Zhang <yifan1.zhang@amd.com>, Tim Huang <Tim.Huang@amd.com>,
 Zack Rusin <zackr@vmware.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jani Nikula <jani.nikula@intel.com>, xurui <xurui@kylinos.cn>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>,
 =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Hersen Wu
 <hersenxs.wu@amd.com>, Fangzhi Zuo <jerry.zuo@amd.com>,
 Stylon Wang <stylon.wang@amd.com>, Alan Liu <haoping.liu@amd.com>,
 Wayne Lin <Wayne.Lin@amd.com>, Aaron Liu <aaron.liu@amd.com>,
 Melissa Wen <mwen@igalia.com>, Bhawanpreet Lakha
 <Bhawanpreet.Lakha@amd.com>, David Tadokoro <davidbtadokoro@usp.br>,
 Wenjing Liu <wenjing.liu@amd.com>,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Alexey Kodanev <aleksei.kodanev@bell-sw.com>, Roman Li <roman.li@amd.com>,
 =?UTF-8?Q?Joaqu=c3=adn_Ignacio_Aramend=c3=ada?= <samsagax@gmail.com>,
 Dave Airlie <airlied@redhat.com>, Russell King <linux@armlinux.org.uk>,
 Liviu Dudau <liviu.dudau@arm.com>, Joel Stanley <joel@jms.id.au>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>,
 Danilo Krummrich <dakr@redhat.com>, Deepak Rawat <drawat.floss@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 Hans de Goede <hdegoede@redhat.com>, Luca Coelho <luciano.coelho@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Vinod Govindapillai <vinod.govindapillai@intel.com>,
 =?UTF-8?Q?=c5=81ukasz_Bartosik?= <lb@semihalf.com>,
 Anusha Srivatsa <anusha.srivatsa@intel.com>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Uma Shankar <uma.shankar@intel.com>, Imre Deak <imre.deak@intel.com>,
 Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 =?UTF-8?Q?Jouni_H=c3=b6gander?= <jouni.hogander@intel.com>,
 Mika Kahola <mika.kahola@intel.com>,
 =?UTF-8?Q?Jos=c3=a9_Roberto_de_Souza?= <jose.souza@intel.com>,
 Arun R Murthy <arun.r.murthy@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Khaled Almahallawy <khaled.almahallawy@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Nirmoy Das <nirmoy.das@intel.com>,
 Fei Yang <fei.yang@intel.com>, Animesh Manna <animesh.manna@intel.com>,
 Deepak R Varma <drv@mailo.com>, "Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Vandita Kulkarni <vandita.kulkarni@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 Manasi Navare <manasi.d.navare@intel.com>,
 Drew Davenport <ddavenport@chromium.org>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Marian Cichy
 <m.cichy@pengutronix.de>, Dan Carpenter <error27@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Edmund Dea <edmund.j.dea@intel.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Vinod Polimera <quic_vpolimer@quicinc.com>,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Liu Shixin
 <liushixin2@huawei.com>, Marek Vasut <marex@denx.de>,
 Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Tomi Valkeinen <tomba@kernel.org>,
 Emma Anholt <emma@anholt.net>, Gerd Hoffmann <kraxel@redhat.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Biju Das <biju.das.jz@bp.renesas.com>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>,
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Jyri Sarha <jyri.sarha@iki.fi>,
 David Lechner <david@lechnology.com>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Michal Simek <michal.simek@amd.com>
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0084.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::11) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|BL1PR12MB5349:EE_
X-MS-Office365-Filtering-Correlation-Id: bbe76e35-279b-4ed7-d359-08db82c55318
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V27m7ouus2JdRMtlqLdd/n247ZrMuKZDwr4JBTL1QCGI4Lx5ekLb2Uc+Nuniho2hNO8hFTqjEenhlZl6pI+0PL87b9htT67aAjQbw7DUiaTjH8PDUTlOcRrFNJ0y7xGIuURiAv+JP8WqKPUFWAs9ZiHI/1t09QdN93+qnREtJQfv0/nC1P4MSocvDFShLk1L8j7s3RbdRzXGu262TmccL6yKC50SIpTN1aExZ4Nc/n7p/0JYtVL9mp8TbEVauOMv8a5uzipSjT2Z9wqJagncH5TEaQZIpa9cHZd8qZL40RExWbGxmx7/Tqr9z7gXSD9nC6QsQ3cWrpAjMDNda0ZFgh6CfFgHjCG4IGM/y5xhhJV0Nu1Y24fi9laQoX8DcAmotse07Zls8LDtF1L8uToWR0tq+HAY9z7RygxVbI74ztj5OJm8powLgRORs8hZIrkYjPMSQwpwFqd+RRuVmvbAE5qGqmVA+FIAbKcpmzTcO05fkBJqAlTsRI9NANTbAo0VJJxMX8aZK1CTQGLkQhNGvrZQ36i50x7oBrQbyuYxqdJ88MMlQ/HjDV3RsXU4AvQxU1pJx+DyS+5rsikhPA5zCwGEmyvlPNYJX6DJK7gDrjCm7yBVw+AY5Ox5jSnSp9D0CaJ7eig4bOom+UDc0MmZV9ZFNc9ZkZ75xC0a964hlQ4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(366004)(39860400002)(346002)(376002)(136003)(451199021)(31686004)(4326008)(6636002)(6486002)(1191002)(6666004)(478600001)(66476007)(36756003)(66556008)(41300700001)(316002)(54906003)(66946007)(110136005)(86362001)(6506007)(31696002)(83380400001)(2616005)(66574015)(186003)(6512007)(921005)(38100700002)(7336002)(7406005)(8936002)(7366002)(2906002)(30864003)(8676002)(5660300002)(7276002)(7416002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NFEwdW5IVE83UjRWNkMwR2l1bnBNNkNwVGVQVSszTG8rbWdBeGFTNVdHUUN2?=
 =?utf-8?B?cm93NDRvWnFsSGY5TXFOOW1udW1WcTFYb3lCKzJKUEtmSzRtM2tVSzdnckcv?=
 =?utf-8?B?RXBXSlBGR2QzUkRJSjlvR1hZcWVNTnAyVktQYjZUQi9zMEh1QlQrNFYwT054?=
 =?utf-8?B?eXlrdVhCS3BuYWw4ZVVQVnRHaFZEUEE5SDZLeW5kc0NkQlNpK1lkNG5aeW93?=
 =?utf-8?B?d09vcGdjdEwySzR4Z1hydnczemU4M1p4bTZaQlY4RXYrcDFhNXYxdmwwTDFk?=
 =?utf-8?B?MkZWdkRBNXhUZUJTb1BNdWJ1QUUySUduSElPa3htbjJzbmY0bFJCZU5XR2Vu?=
 =?utf-8?B?c3ZUdGVoNE5ycVk1Vks5SXozT3EyZ3dEdUhyTWhpanBpck1yUjFsOXl3WVg5?=
 =?utf-8?B?VDA3aXQweE8xRXl6THBqaTJZUU5sZmNkK09hOHdDbVBqRE1mWTR6YWVGK3VO?=
 =?utf-8?B?djd6WHdkSi9Mem8wOXV2MkRDL2lRMkt5Z0ZRVDJMNGNGc2p5TzB4UmFjNU5X?=
 =?utf-8?B?K0FIV0FraHlRbjd6VHFzLzhNWEFYajZUSHVyYzM0eEFzWm9ZS3FYem9tT0R0?=
 =?utf-8?B?L2E1QTc5dzcwczVYeTJ3aFBkV2lZcVNWQjBuM2l0SkU2MG1GK3VSQU13bmhl?=
 =?utf-8?B?WndkNGtOUDM2cHg1eGVRY2RoaE1KZXlsczYrOTdpV01aeTVUY3JodUhQcGtk?=
 =?utf-8?B?ckFMY0k3cFZKU3QwVW9IUjJ0UjVyaUhLNWZQZU5xUDNQdzg0cFhuZGlSZHBp?=
 =?utf-8?B?V0lqQnQwU2Y3Q0pOZXBJN3FKVXdvblhRWnNKTUo2RlYxRmgzMlpnS2FiM0cw?=
 =?utf-8?B?dGhLVEpRdU1VS2JDcnVzZmdVeUx5Smt3dXZpNlQyU0ZsVWxDejFjb3JZNWsx?=
 =?utf-8?B?NjBNL3NIdk1yRzRjUXI5TGFXWUtLWDBoUTd5VU5MSGhxd2FiMGpkN1dQcW14?=
 =?utf-8?B?T2pCRTloRnFRQ215bGY4TDR2cjloWkVFNnN5Q29adHladVQ5UlFDTGNvQldR?=
 =?utf-8?B?V3Z1L1QxSUNSay82ejZFclFoWUVDLzlZblcxemZuTy9Lc3A3cWtCYkhUNjd6?=
 =?utf-8?B?eUQxbG9ET2Z5VkRPVkhpV3p0ZVR6ck90UlhMVWNQVlRJVUJ0K21DV0dIczBI?=
 =?utf-8?B?ZEFHL0F1emFIN1RGOVhGZGZucmVwR3dlZmF3cVhxdWdHODBTYytsTi9hSHpk?=
 =?utf-8?B?V1ErUzhVdldwbG5sZXpJSWhGb2ZkVXh0ZWpyNzBqd3dHWFNiMUNuaEhoNkpr?=
 =?utf-8?B?Mlk2MVIyWFJnYXQxcW9VVUJpVzBjQytDdzhwNDNTak1yVkpUcVV1L1dnVmJq?=
 =?utf-8?B?TXlibVc4RGE4VitNYnA1d252RmlsdmMzeWN5VTBTRzNPOXZvakdZMzAxbFl4?=
 =?utf-8?B?aEc3ZmdQRkFpdHM2MFh2aW9mYnhrT3RKOGlRUGNRRldRUFRSeWhDUm40RTg5?=
 =?utf-8?B?N3pORzlGSWFDdjZOVzAzZXpUdmx6aDBNSnhQbkVsa0NXSDJ5eFhudGNyMC9a?=
 =?utf-8?B?SmZscXVuaXYvRGJjWGJqRWJoajFMSmp6emo2TUh0SkxuT2pZY3lDR3pzRDd6?=
 =?utf-8?B?WXVtWU9xeHpaRHhMZnhKRnRwaW5FVDlaTXB6aUtXV1puVk5OT0RMM1VpVTdN?=
 =?utf-8?B?cXRuZEorL0Ezb2RTMTNkRkk5djNySEYxenpDRkVVMzlKNFdqL2VicUhJUlZw?=
 =?utf-8?B?eUxlRTNPWmdidlRJS0lnSjVBODBIK2ZrT0tFL0hEVWpweTI1aG4xVE9kd3dY?=
 =?utf-8?B?aWZNMDM0YkRjMmhtOXZDSVlLMFpRWnpPZHNrK3g2d0F2UXkrRWVmMDhRQ3hP?=
 =?utf-8?B?ZkpKeDFpTWVXOVBGYXVneXBMUkVzRW9aSThaOU93K0xDWnRZS3czVDF6czdO?=
 =?utf-8?B?R2pYNXpiN0dlWVNkSjFQdCtjU1BURVlEaVVjMkdPR3gycGNlUzlYbDRhQm53?=
 =?utf-8?B?OEpwUFBQM3JEdFZhdC8zRXgreXFtdUIwc0o2dXcyWWtpV3NqY1RUM0tSTWdQ?=
 =?utf-8?B?KzZBVXRKSUZYd3cycG4zWklLaC9DQXkzY3F5ZkpmR2NBbXZNSXYySDNvNHlm?=
 =?utf-8?B?MTBVcXQzQ1BUWit1QXlheXUxOTZPSE8rWGlIQ3dqdDBWbWtwYWREbkVGY1VU?=
 =?utf-8?B?RzVuZ1NTNGlJWW9xdmpGVkxVQ0ZuenFLdEIxU1V1ZTlhUXhhMUdFMDRlMDBW?=
 =?utf-8?Q?1wogSGDXTmhOPZ9ad8XCHtEag+2lrksACdlFk2n0JFbu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbe76e35-279b-4ed7-d359-08db82c55318
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 10:47:02.1153 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DstsdDNwdz59DklArxQdBCUEXtKqLpTjplzq+TEWkeNgrluBGhaEOMYLSYBYGFOk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5349
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>, linux-hyperv@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Yongqin Liu <yongqin.liu@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>,
 linux-samsung-soc@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-rockchip@lists.infradead.org,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 NXP Linux Team <linux-imx@nxp.com>, spice-devel@lists.freedesktop.org,
 linux-sunxi@lists.linux.dev,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, xen-devel@lists.xenproject.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Gurchetan Singh <gurchetansingh@chromium.org>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andrew Jeffery <andrew@aj.id.au>, linux-mips@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, kernel@pengutronix.de,
 John Stultz <jstultz@google.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 12.07.23 um 11:46 schrieb Uwe Kleine-König:
> Hello,
>
> while I debugged an issue in the imx-lcdc driver I was constantly
> irritated about struct drm_device pointer variables being named "dev"
> because with that name I usually expect a struct device pointer.
>
> I think there is a big benefit when these are all renamed to "drm_dev".
> I have no strong preference here though, so "drmdev" or "drm" are fine
> for me, too. Let the bikesheding begin!
>
> Some statistics:
>
> $ git grep -ohE 'struct drm_device *\* *[^ (),;]*' v6.5-rc1 | sort | uniq -c | sort -n
>        1 struct drm_device *adev_to_drm
>        1 struct drm_device *drm_
>        1 struct drm_device          *drm_dev
>        1 struct drm_device        *drm_dev
>        1 struct drm_device *pdev
>        1 struct drm_device *rdev
>        1 struct drm_device *vdev
>        2 struct drm_device *dcss_drv_dev_to_drm
>        2 struct drm_device **ddev
>        2 struct drm_device *drm_dev_alloc
>        2 struct drm_device *mock
>        2 struct drm_device *p_ddev
>        5 struct drm_device *device
>        9 struct drm_device * dev
>       25 struct drm_device *d
>       95 struct drm_device *
>      216 struct drm_device *ddev
>      234 struct drm_device *drm_dev
>      611 struct drm_device *drm
>     4190 struct drm_device *dev
>
> This series starts with renaming struct drm_crtc::dev to drm_dev. If
> it's not only me and others like the result of this effort it should be
> followed up by adapting the other structs and the individual usages in
> the different drivers.
>
> To make this series a bit easier handleable, I first added an alias for
> drm_crtc::dev, then converted the drivers one after another and the last
> patch drops the "dev" name. This has the advantage of being easier to
> review, and if I should have missed an instance only the last patch must
> be dropped/reverted. Also this series might conflict with other patches,
> in this case the remaining patches can still go in (apart from the last
> one of course). Maybe it also makes sense to delay applying the last
> patch by one development cycle?

When you automatically generate the patch (with cocci for example) I 
usually prefer a single patch instead.

Background is that this makes merge conflicts easier to handle and detect.

When you have multiple patches and a merge conflict because of some 
added lines using the old field the build breaks only on the last patch 
which removes the old field.

In such cases reviewing the patch just means automatically re-generating 
it and double checking that you don't see anything funky.

Apart from that I honestly absolutely don't care what the name is.

Cheers,
Christian.

>
> The series was compile tested for arm, arm64, powerpc and amd64 using an
> allmodconfig (though I only build drivers/gpu/).
>
> Best regards
> Uwe
>
> Uwe Kleine-König (52):
>    drm/crtc: Start renaming struct drm_crtc::dev to drm_dev
>    drm/core: Use struct drm_crtc::drm_dev instead of struct drm_crtc::dev
>    drm/amd: Use struct drm_crtc::drm_dev instead of struct drm_crtc::dev
>    drm/armada: Use struct drm_crtc::drm_dev instead of struct
>      drm_crtc::dev
>    drm/arm: Use struct drm_crtc::drm_dev instead of struct drm_crtc::dev
>    drm/aspeed: Use struct drm_crtc::drm_dev instead of struct
>      drm_crtc::dev
>    drm/ast: Use struct drm_crtc::drm_dev instead of struct drm_crtc::dev
>    drm/atmel-hlcdc: Use struct drm_crtc::drm_dev instead of struct
>      drm_crtc::dev
>    drm/exynos: Use struct drm_crtc::drm_dev instead of struct
>      drm_crtc::dev
>    drm/fsl-dcu: Use struct drm_crtc::drm_dev instead of struct
>      drm_crtc::dev
>    drm/gma500: Use struct drm_crtc::drm_dev instead of struct
>      drm_crtc::dev
>    drm/gud: Use struct drm_crtc::drm_dev instead of struct drm_crtc::dev
>    drm/hisilicon: Use struct drm_crtc::drm_dev instead of struct
>      drm_crtc::dev
>    drm/hyperv: Use struct drm_crtc::drm_dev instead of struct
>      drm_crtc::dev
>    drm/i915: Use struct drm_crtc::drm_dev instead of struct drm_crtc::dev
>    drm/imx: Use struct drm_crtc::drm_dev instead of struct drm_crtc::dev
>    drm/ingenic: Use struct drm_crtc::drm_dev instead of struct
>      drm_crtc::dev
>    drm/kmb: Use struct drm_crtc::drm_dev instead of struct drm_crtc::dev
>    drm/logicvc: Use struct drm_crtc::drm_dev instead of struct
>      drm_crtc::dev
>    drm/mcde: Use struct drm_crtc::drm_dev instead of struct drm_crtc::dev
>    drm/mediatek: Use struct drm_crtc::drm_dev instead of struct
>      drm_crtc::dev
>    drm/meson: Use struct drm_crtc::drm_dev instead of struct
>      drm_crtc::dev
>    drm/mgag200: Use struct drm_crtc::drm_dev instead of struct
>      drm_crtc::dev
>    drm/msm: Use struct drm_crtc::drm_dev instead of struct drm_crtc::dev
>    drm/mxsfb: Use struct drm_crtc::drm_dev instead of struct
>      drm_crtc::dev
>    drm/nouveau: Use struct drm_crtc::drm_dev instead of struct
>      drm_crtc::dev
>    drm/omapdrm: Use struct drm_crtc::drm_dev instead of struct
>      drm_crtc::dev
>    drm/panel-ili9341: Use struct drm_crtc::drm_dev instead of struct
>      drm_crtc::dev
>    drm/pl111: Use struct drm_crtc::drm_dev instead of struct
>      drm_crtc::dev
>    drm/qxl: Use struct drm_crtc::drm_dev instead of struct drm_crtc::dev
>    drm/radeon: Use struct drm_crtc::drm_dev instead of struct
>      drm_crtc::dev
>    drm/renesas: Use struct drm_crtc::drm_dev instead of struct
>      drm_crtc::dev
>    drm/rockchip: Use struct drm_crtc::drm_dev instead of struct
>      drm_crtc::dev
>    drm/solomon: Use struct drm_crtc::drm_dev instead of struct
>      drm_crtc::dev
>    drm/sprd: Use struct drm_crtc::drm_dev instead of struct drm_crtc::dev
>    drm/sti: Use struct drm_crtc::drm_dev instead of struct drm_crtc::dev
>    drm/stm: Use struct drm_crtc::drm_dev instead of struct drm_crtc::dev
>    drm/sun4i: Use struct drm_crtc::drm_dev instead of struct
>      drm_crtc::dev
>    drm/tegra: Use struct drm_crtc::drm_dev instead of struct
>      drm_crtc::dev
>    drm/tidss: Use struct drm_crtc::drm_dev instead of struct
>      drm_crtc::dev
>    drm/tilcdc: Use struct drm_crtc::drm_dev instead of struct
>      drm_crtc::dev
>    drm/tiny: Use struct drm_crtc::drm_dev instead of struct drm_crtc::dev
>    drm/tve200: Use struct drm_crtc::drm_dev instead of struct
>      drm_crtc::dev
>    drm/udl: Use struct drm_crtc::drm_dev instead of struct drm_crtc::dev
>    drm/vboxvideo: Use struct drm_crtc::drm_dev instead of struct
>      drm_crtc::dev
>    drm/vc4: Use struct drm_crtc::drm_dev instead of struct drm_crtc::dev
>    drm/virtio: Use struct drm_crtc::drm_dev instead of struct
>      drm_crtc::dev
>    drm/vkms: Use struct drm_crtc::drm_dev instead of struct drm_crtc::dev
>    drm/vmwgfx: Use struct drm_crtc::drm_dev instead of struct
>      drm_crtc::dev
>    drm/xen: Use struct drm_crtc::drm_dev instead of struct drm_crtc::dev
>    drm/xlnx: Use struct drm_crtc::drm_dev instead of struct drm_crtc::dev
>    drm/crtc: Complete renaming struct drm_crtc::dev to drm_dev
>
>   drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   |  18 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c       |   6 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_pll.c       |   6 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c      |   8 +-
>   drivers/gpu/drm/amd/amdgpu/atombios_crtc.c    |  22 +--
>   drivers/gpu/drm/amd/amdgpu/dce_v10_0.c        |  26 +--
>   drivers/gpu/drm/amd/amdgpu/dce_v11_0.c        |  28 ++--
>   drivers/gpu/drm/amd/amdgpu/dce_v6_0.c         |  26 +--
>   drivers/gpu/drm/amd/amdgpu/dce_v8_0.c         |  26 +--
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  29 ++--
>   .../drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c |  20 +--
>   .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    |   8 +-
>   .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c |  22 +--
>   .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   |   2 +-
>   .../gpu/drm/arm/display/komeda/komeda_crtc.c  |  24 +--
>   .../gpu/drm/arm/display/komeda/komeda_kms.c   |   2 +-
>   drivers/gpu/drm/arm/hdlcd_crtc.c              |   4 +-
>   drivers/gpu/drm/arm/malidp_crtc.c             |   7 +-
>   drivers/gpu/drm/armada/armada_crtc.c          |  10 +-
>   drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c      |   6 +-
>   drivers/gpu/drm/ast/ast_dp.c                  |   2 +-
>   drivers/gpu/drm/ast/ast_mode.c                |  26 +--
>   .../gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c    |  10 +-
>   drivers/gpu/drm/drm_atomic.c                  |  22 +--
>   drivers/gpu/drm/drm_atomic_helper.c           |  20 ++-
>   drivers/gpu/drm/drm_atomic_state_helper.c     |   2 +-
>   drivers/gpu/drm/drm_atomic_uapi.c             |  22 +--
>   drivers/gpu/drm/drm_blend.c                   |   2 +-
>   drivers/gpu/drm/drm_color_mgmt.c              |  10 +-
>   drivers/gpu/drm/drm_crtc.c                    |  19 ++-
>   drivers/gpu/drm/drm_crtc_helper.c             |  10 +-
>   drivers/gpu/drm/drm_debugfs.c                 |   2 +-
>   drivers/gpu/drm/drm_debugfs_crc.c             |   2 +-
>   drivers/gpu/drm/drm_fb_helper.c               |   6 +-
>   drivers/gpu/drm/drm_mipi_dbi.c                |   4 +-
>   drivers/gpu/drm/drm_plane.c                   |   2 +-
>   drivers/gpu/drm/drm_plane_helper.c            |   2 +-
>   drivers/gpu/drm/drm_self_refresh_helper.c     |   2 +-
>   drivers/gpu/drm/drm_vblank.c                  |  40 ++---
>   drivers/gpu/drm/drm_vblank_work.c             |   2 +-
>   drivers/gpu/drm/exynos/exynos_drm_crtc.c      |   8 +-
>   drivers/gpu/drm/exynos/exynos_drm_plane.c     |   4 +-
>   drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c    |  16 +-
>   drivers/gpu/drm/gma500/cdv_intel_display.c    |   2 +-
>   drivers/gpu/drm/gma500/cdv_intel_dp.c         |   2 +-
>   drivers/gpu/drm/gma500/gma_display.c          |  20 +--
>   drivers/gpu/drm/gma500/oaktrail_crtc.c        |   8 +-
>   drivers/gpu/drm/gma500/oaktrail_hdmi.c        |   4 +-
>   drivers/gpu/drm/gma500/psb_intel_display.c    |   2 +-
>   drivers/gpu/drm/gma500/psb_irq.c              |   6 +-
>   drivers/gpu/drm/gud/gud_pipe.c                |   6 +-
>   .../gpu/drm/hisilicon/hibmc/hibmc_drm_de.c    |  20 +--
>   .../gpu/drm/hisilicon/kirin/kirin_drm_ade.c   |   4 +-
>   drivers/gpu/drm/hyperv/hyperv_drm_modeset.c   |   6 +-
>   drivers/gpu/drm/i915/display/g4x_dp.c         |   4 +-
>   drivers/gpu/drm/i915/display/hsw_ips.c        |  16 +-
>   drivers/gpu/drm/i915/display/i9xx_plane.c     |   4 +-
>   drivers/gpu/drm/i915/display/i9xx_wm.c        |  40 ++---
>   drivers/gpu/drm/i915/display/icl_dsi.c        |   2 +-
>   drivers/gpu/drm/i915/display/intel_atomic.c   |   2 +-
>   .../gpu/drm/i915/display/intel_atomic_plane.c |   4 +-
>   drivers/gpu/drm/i915/display/intel_audio.c    |   2 +-
>   drivers/gpu/drm/i915/display/intel_bw.c       |  10 +-
>   drivers/gpu/drm/i915/display/intel_cdclk.c    |   6 +-
>   drivers/gpu/drm/i915/display/intel_color.c    | 124 +++++++-------
>   drivers/gpu/drm/i915/display/intel_crtc.c     |  20 +--
>   .../drm/i915/display/intel_crtc_state_dump.c  |   4 +-
>   drivers/gpu/drm/i915/display/intel_cursor.c   |   2 +-
>   drivers/gpu/drm/i915/display/intel_ddi.c      |  28 ++--
>   drivers/gpu/drm/i915/display/intel_display.c  | 154 +++++++++---------
>   .../gpu/drm/i915/display/intel_display_irq.c  |  22 +--
>   .../gpu/drm/i915/display/intel_display_rps.c  |   2 +-
>   .../drm/i915/display/intel_display_trace.h    |  12 +-
>   drivers/gpu/drm/i915/display/intel_dp.c       |   2 +-
>   drivers/gpu/drm/i915/display/intel_dpll.c     |  38 ++---
>   drivers/gpu/drm/i915/display/intel_dpll_mgr.c |  44 ++---
>   drivers/gpu/drm/i915/display/intel_dpt.c      |   2 +-
>   drivers/gpu/drm/i915/display/intel_drrs.c     |  10 +-
>   drivers/gpu/drm/i915/display/intel_dsb.c      |   8 +-
>   drivers/gpu/drm/i915/display/intel_fbc.c      |   2 +-
>   drivers/gpu/drm/i915/display/intel_fdi.c      |  22 +--
>   .../drm/i915/display/intel_fifo_underrun.c    |   6 +-
>   drivers/gpu/drm/i915/display/intel_hdmi.c     |   2 +-
>   .../drm/i915/display/intel_modeset_setup.c    |  22 +--
>   .../drm/i915/display/intel_modeset_verify.c   |   2 +-
>   drivers/gpu/drm/i915/display/intel_panel.c    |   4 +-
>   .../gpu/drm/i915/display/intel_pch_display.c  |  32 ++--
>   .../gpu/drm/i915/display/intel_pch_refclk.c   |   2 +-
>   drivers/gpu/drm/i915/display/intel_pipe_crc.c |  10 +-
>   .../drm/i915/display/intel_plane_initial.c    |   6 +-
>   drivers/gpu/drm/i915/display/intel_psr.c      |  14 +-
>   drivers/gpu/drm/i915/display/intel_sdvo.c     |   2 +-
>   drivers/gpu/drm/i915/display/intel_vblank.c   |  24 +--
>   drivers/gpu/drm/i915/display/intel_vdsc.c     |  18 +-
>   drivers/gpu/drm/i915/display/intel_vrr.c      |  18 +-
>   drivers/gpu/drm/i915/display/skl_scaler.c     |  10 +-
>   .../drm/i915/display/skl_universal_plane.c    |   6 +-
>   drivers/gpu/drm/i915/display/skl_watermark.c  |  42 ++---
>   drivers/gpu/drm/i915/display/vlv_dsi.c        |   2 +-
>   drivers/gpu/drm/imx/dcss/dcss-crtc.c          |  20 +--
>   drivers/gpu/drm/imx/ipuv3/ipuv3-crtc.c        |  15 +-
>   drivers/gpu/drm/imx/lcdc/imx-lcdc.c           |  16 +-
>   drivers/gpu/drm/ingenic/ingenic-drm-drv.c     |   4 +-
>   drivers/gpu/drm/kmb/kmb_crtc.c                |  16 +-
>   drivers/gpu/drm/logicvc/logicvc_crtc.c        |  14 +-
>   drivers/gpu/drm/mcde/mcde_display.c           |  18 +-
>   drivers/gpu/drm/mediatek/mtk_drm_crtc.c       |  22 +--
>   drivers/gpu/drm/meson/meson_crtc.c            |  12 +-
>   drivers/gpu/drm/mgag200/mgag200_g200.c        |   4 +-
>   drivers/gpu/drm/mgag200/mgag200_g200eh.c      |   2 +-
>   drivers/gpu/drm/mgag200/mgag200_g200er.c      |   4 +-
>   drivers/gpu/drm/mgag200/mgag200_g200ev.c      |   4 +-
>   drivers/gpu/drm/mgag200/mgag200_g200se.c      |   6 +-
>   drivers/gpu/drm/mgag200/mgag200_g200wb.c      |   2 +-
>   drivers/gpu/drm/mgag200/mgag200_mode.c        |  10 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c |   6 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      |  70 ++++----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   2 +-
>   drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c     |  12 +-
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c     |  20 +--
>   drivers/gpu/drm/msm/msm_drv.c                 |   4 +-
>   drivers/gpu/drm/mxsfb/lcdif_kms.c             |  18 +-
>   drivers/gpu/drm/mxsfb/mxsfb_kms.c             |  16 +-
>   drivers/gpu/drm/nouveau/dispnv04/crtc.c       |  58 +++----
>   drivers/gpu/drm/nouveau/dispnv04/cursor.c     |  10 +-
>   drivers/gpu/drm/nouveau/dispnv50/atom.h       |   2 +-
>   drivers/gpu/drm/nouveau/dispnv50/crc.c        |  30 ++--
>   drivers/gpu/drm/nouveau/dispnv50/crc907d.c    |   6 +-
>   drivers/gpu/drm/nouveau/dispnv50/crcc37d.c    |   6 +-
>   drivers/gpu/drm/nouveau/dispnv50/crcc57d.c    |   2 +-
>   drivers/gpu/drm/nouveau/dispnv50/disp.c       |   5 +-
>   drivers/gpu/drm/nouveau/dispnv50/head.c       |   4 +-
>   drivers/gpu/drm/nouveau/dispnv50/head507d.c   |  26 +--
>   drivers/gpu/drm/nouveau/dispnv50/head827d.c   |  10 +-
>   drivers/gpu/drm/nouveau/dispnv50/head907d.c   |  26 +--
>   drivers/gpu/drm/nouveau/dispnv50/head917d.c   |   6 +-
>   drivers/gpu/drm/nouveau/dispnv50/headc37d.c   |  18 +-
>   drivers/gpu/drm/nouveau/dispnv50/headc57d.c   |  10 +-
>   drivers/gpu/drm/nouveau/nouveau_connector.h   |   2 +-
>   drivers/gpu/drm/nouveau/nouveau_display.c     |   2 +-
>   drivers/gpu/drm/omapdrm/omap_crtc.c           |  56 +++----
>   drivers/gpu/drm/omapdrm/omap_irq.c            |   6 +-
>   drivers/gpu/drm/panel/panel-ilitek-ili9341.c  |   4 +-
>   drivers/gpu/drm/pl111/pl111_display.c         |  16 +-
>   drivers/gpu/drm/qxl/qxl_display.c             |   2 +-
>   drivers/gpu/drm/radeon/atombios_crtc.c        |  54 +++---
>   drivers/gpu/drm/radeon/radeon_cursor.c        |  14 +-
>   drivers/gpu/drm/radeon/radeon_display.c       |  28 ++--
>   drivers/gpu/drm/radeon/radeon_kms.c           |   6 +-
>   drivers/gpu/drm/radeon/radeon_legacy_crtc.c   |  16 +-
>   .../gpu/drm/renesas/rcar-du/rcar_du_crtc.c    |  14 +-
>   .../gpu/drm/renesas/shmobile/shmob_drm_crtc.c |  20 +--
>   drivers/gpu/drm/rockchip/rockchip_drm_vop.c   |   8 +-
>   drivers/gpu/drm/rockchip/rockchip_drm_vop2.c  |  15 +-
>   drivers/gpu/drm/solomon/ssd130x.c             |   2 +-
>   drivers/gpu/drm/sprd/sprd_dpu.c               |   6 +-
>   drivers/gpu/drm/sti/sti_crtc.c                |  14 +-
>   drivers/gpu/drm/stm/ltdc.c                    |  12 +-
>   drivers/gpu/drm/sun4i/sun4i_crtc.c            |  12 +-
>   drivers/gpu/drm/tegra/dc.c                    |  12 +-
>   drivers/gpu/drm/tidss/tidss_crtc.c            |  19 ++-
>   drivers/gpu/drm/tidss/tidss_irq.c             |   4 +-
>   drivers/gpu/drm/tilcdc/tilcdc_crtc.c          |  43 ++---
>   drivers/gpu/drm/tiny/bochs.c                  |   6 +-
>   drivers/gpu/drm/tiny/cirrus.c                 |   2 +-
>   drivers/gpu/drm/tiny/gm12u320.c               |   4 +-
>   drivers/gpu/drm/tiny/hx8357d.c                |   4 +-
>   drivers/gpu/drm/tiny/ili9163.c                |   4 +-
>   drivers/gpu/drm/tiny/ili9225.c                |   8 +-
>   drivers/gpu/drm/tiny/ili9341.c                |   4 +-
>   drivers/gpu/drm/tiny/ili9486.c                |   4 +-
>   drivers/gpu/drm/tiny/mi0283qt.c               |   4 +-
>   drivers/gpu/drm/tiny/ofdrm.c                  |   8 +-
>   drivers/gpu/drm/tiny/panel-mipi-dbi.c         |   6 +-
>   drivers/gpu/drm/tiny/repaper.c                |   8 +-
>   drivers/gpu/drm/tiny/simpledrm.c              |   2 +-
>   drivers/gpu/drm/tiny/st7586.c                 |   6 +-
>   drivers/gpu/drm/tiny/st7735r.c                |   4 +-
>   drivers/gpu/drm/tve200/tve200_display.c       |  14 +-
>   drivers/gpu/drm/udl/udl_modeset.c             |   4 +-
>   drivers/gpu/drm/vboxvideo/vbox_mode.c         |   6 +-
>   drivers/gpu/drm/vc4/vc4_crtc.c                |  38 ++---
>   drivers/gpu/drm/vc4/vc4_hdmi.c                |   2 +-
>   drivers/gpu/drm/vc4/vc4_hvs.c                 |  12 +-
>   drivers/gpu/drm/vc4/vc4_txp.c                 |   2 +-
>   drivers/gpu/drm/virtio/virtgpu_display.c      |   4 +-
>   drivers/gpu/drm/vkms/vkms_crtc.c              |  12 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_kms.c           |   4 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c          |  10 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c          |   8 +-
>   drivers/gpu/drm/xen/xen_drm_front_kms.c       |  10 +-
>   drivers/gpu/drm/xlnx/zynqmp_kms.c             |   8 +-
>   include/drm/drm_atomic_helper.h               |   2 +-
>   include/drm/drm_crtc.h                        |   4 +-
>   194 files changed, 1296 insertions(+), 1264 deletions(-)
>
> base-commit: 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5

