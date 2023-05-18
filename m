Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E826707BC2
	for <lists+dri-devel@lfdr.de>; Thu, 18 May 2023 10:20:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1140610E4E4;
	Thu, 18 May 2023 08:20:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FA0210E03F
 for <dri-devel@lists.freedesktop.org>; Thu, 18 May 2023 07:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1684395445; x=1715931445;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=QjP5BRvKL20YViOl3cf4xTCLASAgcmH4AzYZnjDG1jc=;
 b=iQCNgfeObEwn20Hy9IahiW3teV8sVE3P5lStvEReTKBxhGOwNAzrUPAp
 ptf47eaku0IvWracv2Uw+01KjIR03JJnBekWgou6nMnFW4B/nlZtqJPMg
 kaekGQJDqqrBoj80QM10QU3zya+neeKyHvb9cX5C3uYGw47sX445/ptQm
 1wVA2hwCHJ14ZNX2PTx1hpP46pSeNh7YIdBICS+VF13pSmanJetOBEJvv
 G7i3wesRykPURZ1itKRCPe/aEG38Lgs05K1ruMjmZk6pMAyjvuA41sxWV
 UFq087agz/0VuDiBoL+ltP8mIuFoqEPcCBq+lNAs1CZ51LygSOopa1xKS Q==;
X-IronPort-AV: E=Sophos;i="5.99,284,1677567600"; d="scan'208";a="216050944"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 18 May 2023 00:37:17 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 18 May 2023 00:37:12 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 18 May 2023 00:37:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c6EQwqoZgOIIBgSqAz8zlMKi0C7MHzGdo2Xdusg6PJYliGnrsA25pKN/PGpzBMo/JnP5TRrYiGHnihBZq5R2agj0hMGwUVoE9YBonhLXvKl7LvIKB9xeUR7ASGWFJK/z8R7QRnqtPtYfm6GiNiSLKJOlDvhU6aXq4kFTPASHWiu7Z1FsBjpEX/h18ImmmMznPYAorfznmP+LqMr5qmBaYQudOVgiXYqVwQmOzk/ezbxjxs3hactnTLaMGMQd39hHifD4yy7VDOTPs7Sm1UDRsHbvlJ1TC/xVqTyQa9Af55OPc6J/179kv1M//UmjH59Ue4IebBKyt+5SeaAC/bfeUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QjP5BRvKL20YViOl3cf4xTCLASAgcmH4AzYZnjDG1jc=;
 b=YgwKs7klzhqgZtAfskfVBtwOIbFAPYUl97+ZhHidC9RsJp0T9rl0VeLtwiojB49UpnthN/dvoENKJwvzJ1hv1GtOHJtY/MuloOdYakMeS99d91YRYRBoBqX4eV5Cnyki9iVKCILce+G8ACXPO57iku4XvONQI51Xn1o/kPPr/jn+yruMm3V4VV1uwIbsP7AZpPgEPaJy6f94t1yV6w5l1K10yj3+NqPezTez2/oVLvJmCzffLyk/38lUvaCH6hESBpi7JLMjr/fIv1HugOXPlIQljAHObMNILISitehxBWwveH2jNXOxD1w0CscHVVgq42jmX0eEXBW6ydfmSJ+edQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QjP5BRvKL20YViOl3cf4xTCLASAgcmH4AzYZnjDG1jc=;
 b=mlHua0VdZE7IO4bp+bGyoHSnUMbGDRA77A+RHRxSvzj1fPGH2TKBnwPBj+GuSO/J+iE4mfIwGj52hKcoMrbMYv6uC0xSRGJvH3TQplQmXaHPVmvqC+AR2uhSxg62lUcFLxrf6vP2ULASC8BVOGtYohPxqR9my1AuQ2TfZ73+o3s=
Received: from SJ2PR11MB7648.namprd11.prod.outlook.com (2603:10b6:a03:4c3::17)
 by DS0PR11MB8017.namprd11.prod.outlook.com (2603:10b6:8:115::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Thu, 18 May
 2023 07:37:04 +0000
Received: from SJ2PR11MB7648.namprd11.prod.outlook.com
 ([fe80::27bf:a69f:806f:67be]) by SJ2PR11MB7648.namprd11.prod.outlook.com
 ([fe80::27bf:a69f:806f:67be%5]) with mapi id 15.20.6411.019; Thu, 18 May 2023
 07:37:04 +0000
From: <Claudiu.Beznea@microchip.com>
To: <maxime@cerno.tech>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
 <afaerber@suse.de>, <mani@kernel.org>, <Nicolas.Ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <jcmvbkbc@gmail.com>,
 <ckeepax@opensource.cirrus.com>, <rf@opensource.cirrus.com>,
 <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
 <luca.ceresoli@bootlin.com>, <david@lechnology.com>, <nsekhar@ti.com>,
 <abelvesa@kernel.org>, <shawnguo@kernel.org>, <s.hauer@pengutronix.de>,
 <kernel@pengutronix.de>, <festevam@gmail.com>, <linux-imx@nxp.com>,
 <matthias.bgg@gmail.com>, <geert+renesas@glider.be>, <dinguyen@kernel.org>,
 <pdeschrijver@nvidia.com>, <pgaikwad@nvidia.com>, <thierry.reding@gmail.com>, 
 <jonathanh@nvidia.com>, <ulf.hansson@linaro.org>, <linus.walleij@linaro.org>, 
 <airlied@gmail.com>, <daniel@ffwll.ch>, <vkoul@kernel.org>,
 <kishon@kernel.org>, <a.zummo@towertech.it>, <wens@csie.org>,
 <jernej.skrabec@gmail.com>, <samuel@sholland.org>, <lgirdwood@gmail.com>,
 <broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <paul@crapouillou.net>, <orsonzhai@gmail.com>,
 <baolin.wang@linux.alibaba.com>, <zhang.lyra@gmail.com>
Subject: Re: [PATCH v3 06/65] clk: at91: main: Add a determine_rate hook
Thread-Topic: [PATCH v3 06/65] clk: at91: main: Add a determine_rate hook
Thread-Index: AQHZiVuK76JtSAxFEUSi6IVLveVz2Q==
Date: Thu, 18 May 2023 07:37:03 +0000
Message-ID: <accb9d15-b5ab-e99d-5b02-589688e68964@microchip.com>
References: <20221018-clk-range-checks-fixes-v3-0-9a1358472d52@cerno.tech>
 <20221018-clk-range-checks-fixes-v3-6-9a1358472d52@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v3-6-9a1358472d52@cerno.tech>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR11MB7648:EE_|DS0PR11MB8017:EE_
x-ms-office365-filtering-correlation-id: 3672536e-dba7-4e55-503b-08db5772acd7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: svgADzVIkG9Ipspkiub+OIQxikKpvfDv79yA952i59OUfKO043EbUFSGar3XJXCDqqDseu4E64H+S0YHJ1fsxd78jL56YL9pjiahzM/MqdIg63n9IUOmotJUIh9ws18EJbfhrEiWXTXerLsg8YONyoEVoQmtgPLzB0DlM621C8FZv6uLxhUXYnzPvT4RDj9SrV7nHBdIv+yxsgzeSrBh6CSVb0u6Yo8Ls2Tazoy5JKJm2cE0pRcnApdpqvO2Ur/sotkXL/eVPnY/yh0bKRySPm2xtQxbM1ILnIaXbPaOCOr/ibwbAO+PdoAXBc9hANHW44+zE/8cVY1Gg40aI5Wsm2qGVajZcFY3xZd24+F0eioNPoBIohcwHrnFrQy1oO5Gngym1ONoDUUGUH25awXaURoPP3/6cOY2G7UvtBhc7J18uxxXCQRltsPliYiy7DeE6wL/SRLtSrbVcGjAt9eYbwLoZOGl+oIt9JHlDgIvKcIW6c9azOsXvJBMOAAp1d/77uyAA7lsyf89wy0RFsIdioE1PShoHcHjO+t/i550COWBMTig6Lr2A9klgFziXS1tThwim7M2dA1i7X4EAcabYOs6biIdZ3sYIB+i+iN3t3JXaOOunHqbA4okXSglCDpgHGKkKdVRaXH21UPhpl1SAh60SLtCD3+HQIFfjG2jSe6wBXK+5AZcSY+7hOeTcWjocifJ7qU2AzpVHwhP8mglLw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR11MB7648.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(39860400002)(136003)(396003)(346002)(366004)(451199021)(110136005)(2906002)(91956017)(41300700001)(316002)(54906003)(478600001)(7406005)(7416002)(7366002)(31686004)(71200400001)(6486002)(66946007)(8676002)(66446008)(4326008)(8936002)(66556008)(76116006)(66476007)(64756008)(5660300002)(6506007)(26005)(53546011)(186003)(2616005)(83380400001)(36756003)(86362001)(38070700005)(921005)(38100700002)(122000001)(6512007)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NzMzNFdsSHRwLys1eVpQVE4wRFNBbVlBOTNoUXlab0ptZHcxa3lOQUZsa1Rv?=
 =?utf-8?B?dGJ4dmhNb3N3Tlo5Mmsvd29RZk5lZ2F4czgyM05Ed1F4TUJSbXArK0YvMWtu?=
 =?utf-8?B?UFV1M3BCY1o5VkhwV0xvYnp3TzVLUFlsNHNJcnprRGJJVGFKS000K29mWnpB?=
 =?utf-8?B?N2RBa01YMjVaWUJoTXd2K0htWTJUTml0bGNZWHZsZDhWTnRrSS9waWppSEtF?=
 =?utf-8?B?S2xhTWZyUEJuV1ZCQW5hRzdTdUU5MFBSV01odkJMWkZLaGxuUkd5QVJQSDUz?=
 =?utf-8?B?aWlrZnY0R0hiTDQzWEw5SU44Wm1xTTFvbi9Ma1FHMFFzZ2phbGI0TjRYSXhy?=
 =?utf-8?B?cDQ3QXpMc2pZMHhFNTFqUW5kZ3d1bE9IN2hlc2RFMzIyU3lWTU1lOGhKZExm?=
 =?utf-8?B?ZlRENkkxelVOeWxIZzZKNEt0ZGVsNjJ0ZlhyQ245b1VpQ2tvaDV0ZjN3UWFo?=
 =?utf-8?B?RktDRm1HSEowUDRZd1NaeFpNUWkzZGZiZ3J0WHNzYS9hRnV2MWduVnBmeWlL?=
 =?utf-8?B?a2MrWkJjc3NhYkxCTDlab0tBVjBtVnFUbWJVdVRtaVBmd1p1dERBRVRyYUtL?=
 =?utf-8?B?Mk9xVWhNRlBJMStMVzJqZnNxeThhcVhSL0UwYWhXK2hwTzJaZm1FRWJQUk5M?=
 =?utf-8?B?TlREQ2Nra2lqOTJnSi9odnZTL3E5bTJuR1FGRFpPYUpXdlB1c2NIMGZYSVAy?=
 =?utf-8?B?c1dpM0Z6T3YyNlZ2MERiWkhBQTZwY2RORjhtZS80aUxwbDNYM0xzZnRhbXVh?=
 =?utf-8?B?U2tnMTBxUFFxSUk2VW9MNkFRaXgzNTlyVXNERlQrQmVLVnk3QVdIaVJuWUF0?=
 =?utf-8?B?WS9vTDc1KzlYTGs1OURwczdCOTZaYmwxQ2JMTjhQQ3E2bm1IVkIya3o3NGYv?=
 =?utf-8?B?SGk5Mk53MFFELzF6WndITGFSd00vRGFTbUp5VHIxMHpQeXpsVnIyZWxWaklN?=
 =?utf-8?B?dXRiUDdnRmVvVzBrUUZyUDBMZVR1UUhweEpTalFzeFNjQlprUk9OZndBTnh3?=
 =?utf-8?B?eGNEbGZ1Y0RVTjBEV1dSaUlrcVhENnFRRjhQTDJrN3dRS1BJNE51RGZBSk5D?=
 =?utf-8?B?MngySjVEVlc0eTZQVURqUnM4UjdleUc3OVY0WVdtbnZBVXVYa0IvbHFUeG9G?=
 =?utf-8?B?ek43VFVzaEltdXhKZkVqMENPb1FHZll2Z0ZKbm5uaXloT0xoUDBvQW9QQ3Mv?=
 =?utf-8?B?VjhEdDd0SEt1Z1VnRFRaS0FZL2crYTYvWFJsL0t4R0g3NGZKOWFmYTQ5bUxU?=
 =?utf-8?B?NHZVZVI0SzNkVm9KVmV5U0ptaDE3QStOcUlDVGdPYTNucldjcnRReUxUdEtx?=
 =?utf-8?B?TWliUVpxN2wremllZUMwY3ZpdmQweXBaamFRV0IvT0FOZklCdVA0ZEJFUnpt?=
 =?utf-8?B?R00zTlkvMkNJclhnV3JTOUJQMDZab2Q5OUg1R1dSQkljSXVGUWpJeFVxa2Za?=
 =?utf-8?B?d0ROL2lPdDljb1pWOVJ3SEhUL0xVSmRtYitSZGdXcTZVdFE2bW5WVmt6QjZz?=
 =?utf-8?B?SHYwK0RaVVR3dERQeDRBa1VwNnR3ckdzVUN2UE1kR1QraUF1M2Y4RC9Hanhn?=
 =?utf-8?B?Mkx6eUFaMGVZbnpySzM5YUorTk1JVEg3cVI4VVYxS3ZsY3FMeWNsZS90UTZt?=
 =?utf-8?B?ejhnWXVaV2I4d2I1a0NydnlNcksxRHpaR1plOTN4dUttenZpdWxPM2ZnZE8r?=
 =?utf-8?B?Y0FaQlRQeFB2R01oaERHYW5rU05MSm5yMVdEbE9Hek94eEFPZnRaRnd2eXNw?=
 =?utf-8?B?ZVNPSUVCUTFDcmRTWXBsVGlxbEdncHNWZzdkaE1IeTl5d21XZkRaaEhZZTRU?=
 =?utf-8?B?eG5ZWEprd2U2VWdMNk83Wk41REpzTm5sdnRrMmVEK1M3ZG1TL210TzYwR29J?=
 =?utf-8?B?WmEya1NwUnBzN1VlS2NZUDlrQ1Q3K1JqZExEUDlwVGNhNm1iaVJKR29jaUdW?=
 =?utf-8?B?eXNXQVR5c2IxQnVWdnNxT1J4Q094Z1FOTlV0clEvY01XTUFrcTlsQzVsclRO?=
 =?utf-8?B?TFY3THROajlPTWs4dVpRU0IrZnpVSVgzSHgzM0RBbmttREhweDE5aG9aU1Fw?=
 =?utf-8?B?T2E5b0IzTk9Ga0M3Rm9vZCtCYVAxN2d4OUdDOCtTbTYrR0phRGRhQzJkN0pi?=
 =?utf-8?B?M2R3Tk85VWhYRnlYSXNJUm9wV0VNZ1dvYUpKUFVBbXk1YzhjVEFwdm5zZURV?=
 =?utf-8?B?b1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <124125420FC9B54DBBBC21352E2305E4@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3672536e-dba7-4e55-503b-08db5772acd7
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2023 07:37:03.9669 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4zsk8Js+16+SoYb2hQiTld5L1rVJrJvdp893c3J0N/+wKa4SUiHxoy/6uR9hQJsSJNQPBPfK4icBzLr8PW6Ih8x4aPRr+3Yqet0MM2GNA7o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8017
X-Mailman-Approved-At: Thu, 18 May 2023 08:20:23 +0000
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
Cc: linux-rtc@vger.kernel.org, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, linux-actions@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-renesas-soc@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDQuMDQuMjAyMyAxMzoxMCwgTWF4aW1lIFJpcGFyZCB3cm90ZToNCj4gRVhURVJOQUwgRU1B
SUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25v
dyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBUaGUgU0FNOXg1IG1haW4gY2xvY2sgaW1wbGVt
ZW50cyBhIG11eCB3aXRoIGEgc2V0X3BhcmVudCBob29rLCBidXQNCj4gZG9lc24ndCBwcm92aWRl
IGEgZGV0ZXJtaW5lX3JhdGUgaW1wbGVtZW50YXRpb24uDQo+IA0KPiBUaGlzIGlzIGEgYml0IG9k
ZCwgc2luY2Ugc2V0X3BhcmVudCgpIGlzIHRoZXJlIHRvLCBhcyBpdHMgbmFtZSBpbXBsaWVzLA0K
PiBjaGFuZ2UgdGhlIHBhcmVudCBvZiBhIGNsb2NrLiBIb3dldmVyLCB0aGUgbW9zdCBsaWtlbHkg
Y2FuZGlkYXRlIHRvDQo+IHRyaWdnZXIgdGhhdCBwYXJlbnQgY2hhbmdlIGlzIGEgY2FsbCB0byBj
bGtfc2V0X3JhdGUoKSwgd2l0aA0KPiBkZXRlcm1pbmVfcmF0ZSgpIGZpZ3VyaW5nIG91dCB3aGlj
aCBwYXJlbnQgaXMgdGhlIGJlc3Qgc3VpdGVkIGZvciBhDQo+IGdpdmVuIHJhdGUuDQo+IA0KPiBU
aGUgb3RoZXIgdHJpZ2dlciB3b3VsZCBiZSBhIGNhbGwgdG8gY2xrX3NldF9wYXJlbnQoKSwgYnV0
IGl0J3MgZmFyIGxlc3MNCj4gdXNlZCwgYW5kIGl0IGRvZXNuJ3QgbG9vayBsaWtlIHRoZXJlJ3Mg
YW55IG9idmlvdXMgdXNlciBmb3IgdGhhdCBjbG9jay4NCj4gDQo+IFNvLCB0aGUgc2V0X3BhcmVu
dCBob29rIGlzIGVmZmVjdGl2ZWx5IHVudXNlZCwgcG9zc2libHkgYmVjYXVzZSBvZiBhbg0KPiBv
dmVyc2lnaHQuIEhvd2V2ZXIsIGl0IGNvdWxkIGFsc28gYmUgYW4gZXhwbGljaXQgZGVjaXNpb24g
YnkgdGhlDQo+IG9yaWdpbmFsIGF1dGhvciB0byBhdm9pZCBhbnkgcmVwYXJlbnRpbmcgYnV0IHRo
cm91Z2ggYW4gZXhwbGljaXQgY2FsbCB0bw0KPiBjbGtfc2V0X3BhcmVudCgpLg0KPiANCj4gVGhl
IGxhdHRlciBjYXNlIHdvdWxkIGJlIGVxdWl2YWxlbnQgdG8gc2V0dGluZyB0aGUgZmxhZw0KPiBD
TEtfU0VUX1JBVEVfTk9fUkVQQVJFTlQsIHRvZ2V0aGVyIHdpdGggc2V0dGluZyBvdXIgZGV0ZXJt
aW5lX3JhdGUgaG9vaw0KPiB0byBfX2Nsa19tdXhfZGV0ZXJtaW5lX3JhdGUoKS4gSW5kZWVkLCBp
ZiBubyBkZXRlcm1pbmVfcmF0ZQ0KPiBpbXBsZW1lbnRhdGlvbiBpcyBwcm92aWRlZCwgY2xrX3Jv
dW5kX3JhdGUoKSAodGhyb3VnaA0KPiBjbGtfY29yZV9yb3VuZF9yYXRlX25vbG9jaygpKSB3aWxs
IGNhbGwgaXRzZWxmIG9uIHRoZSBwYXJlbnQgaWYNCj4gQ0xLX1NFVF9SQVRFX1BBUkVOVCBpcyBz
ZXQsIGFuZCB3aWxsIG5vdCBjaGFuZ2UgdGhlIGNsb2NrIHJhdGUNCj4gb3RoZXJ3aXNlLiBfX2Ns
a19tdXhfZGV0ZXJtaW5lX3JhdGUoKSBoYXMgdGhlIGV4YWN0IHNhbWUgYmVoYXZpb3Igd2hlbg0K
PiBDTEtfU0VUX1JBVEVfTk9fUkVQQVJFTlQgaXMgc2V0Lg0KPiANCj4gQW5kIGlmIGl0IHdhcyBh
biBvdmVyc2lnaHQsIHRoZW4gd2UgYXJlIGF0IGxlYXN0IGV4cGxpY2l0IGFib3V0IG91cg0KPiBi
ZWhhdmlvciBub3cgYW5kIGl0IGNhbiBiZSBmdXJ0aGVyIHJlZmluZWQgZG93biB0aGUgbGluZS4N
Cj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1heGltZSBSaXBhcmQgPG1heGltZUBjZXJuby50ZWNoPg0K
DQpSZXZpZXdlZC1ieTogQ2xhdWRpdSBCZXpuZWEgPGNsYXVkaXUuYmV6bmVhQG1pY3JvY2hpcC5j
b20+DQoNClRlc3RlZC1ieTogQ2xhdWRpdSBCZXpuZWEgPGNsYXVkaXUuYmV6bmVhQG1pY3JvY2hp
cC5jb20+DQoNCj4gLS0tDQo+ICBkcml2ZXJzL2Nsay9hdDkxL2Nsay1tYWluLmMgfCAzICsrLQ0K
PiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL2F0OTEvY2xrLW1haW4uYyBiL2RyaXZlcnMvY2xrL2F0
OTEvY2xrLW1haW4uYw0KPiBpbmRleCA4NjAxYjI3YzFhZTAuLmUwNGU3MjM5NDYzMiAxMDA2NDQN
Cj4gLS0tIGEvZHJpdmVycy9jbGsvYXQ5MS9jbGstbWFpbi5jDQo+ICsrKyBiL2RyaXZlcnMvY2xr
L2F0OTEvY2xrLW1haW4uYw0KPiBAQCAtNTMzLDYgKzUzMyw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgY2xrX29wcyBzYW05eDVfbWFpbl9vcHMgPSB7DQo+ICAgICAgICAgLnByZXBhcmUgPSBjbGtf
c2FtOXg1X21haW5fcHJlcGFyZSwNCj4gICAgICAgICAuaXNfcHJlcGFyZWQgPSBjbGtfc2FtOXg1
X21haW5faXNfcHJlcGFyZWQsDQo+ICAgICAgICAgLnJlY2FsY19yYXRlID0gY2xrX3NhbTl4NV9t
YWluX3JlY2FsY19yYXRlLA0KPiArICAgICAgIC5kZXRlcm1pbmVfcmF0ZSA9IF9fY2xrX211eF9k
ZXRlcm1pbmVfcmF0ZSwNCj4gICAgICAgICAuc2V0X3BhcmVudCA9IGNsa19zYW05eDVfbWFpbl9z
ZXRfcGFyZW50LA0KPiAgICAgICAgIC5nZXRfcGFyZW50ID0gY2xrX3NhbTl4NV9tYWluX2dldF9w
YXJlbnQsDQo+ICAgICAgICAgLnNhdmVfY29udGV4dCA9IGNsa19zYW05eDVfbWFpbl9zYXZlX2Nv
bnRleHQsDQo+IEBAIC01NjUsNyArNTY2LDcgQEAgYXQ5MV9jbGtfcmVnaXN0ZXJfc2FtOXg1X21h
aW4oc3RydWN0IHJlZ21hcCAqcmVnbWFwLA0KPiAgICAgICAgIGluaXQub3BzID0gJnNhbTl4NV9t
YWluX29wczsNCj4gICAgICAgICBpbml0LnBhcmVudF9uYW1lcyA9IHBhcmVudF9uYW1lczsNCj4g
ICAgICAgICBpbml0Lm51bV9wYXJlbnRzID0gbnVtX3BhcmVudHM7DQo+IC0gICAgICAgaW5pdC5m
bGFncyA9IENMS19TRVRfUEFSRU5UX0dBVEU7DQo+ICsgICAgICAgaW5pdC5mbGFncyA9IENMS19T
RVRfUEFSRU5UX0dBVEUgfCBDTEtfU0VUX1JBVEVfTk9fUkVQQVJFTlQ7DQo+IA0KPiAgICAgICAg
IGNsa21haW4tPmh3LmluaXQgPSAmaW5pdDsNCj4gICAgICAgICBjbGttYWluLT5yZWdtYXAgPSBy
ZWdtYXA7DQo+IA0KPiAtLQ0KPiAyLjM5LjINCj4gDQoNCg==
