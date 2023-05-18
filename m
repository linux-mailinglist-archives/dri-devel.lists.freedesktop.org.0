Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 702C4707BD0
	for <lists+dri-devel@lfdr.de>; Thu, 18 May 2023 10:20:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C10B10E4F6;
	Thu, 18 May 2023 08:20:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01C4F10E03F
 for <dri-devel@lists.freedesktop.org>; Thu, 18 May 2023 07:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1684395510; x=1715931510;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=h8geLpCv1xn+fbqE+K6gWLeud9KKyULiITwZgz4d7mg=;
 b=axxxcW1scWns5nY0X1f/IpmnWOUBlb28PLpfkCvIQ7cXjXq8ti7Zvuoi
 677HJW/YK81FNpGbOC52ouYXPbpCbLmXy1Tuf/9WfhGwH33UsT5uLReK1
 04je2uF5v9/AZEQ1WiVuh6D9HxvRBpDB4AkN+Nw6bl4R21Ul8T/p0sZis
 bTfe9ghRyHoEHBKPlYzj3X0M91GV6VekayvSxeiFkl9+ug4p+dYp8yOJH
 WoH24leCdWQ8nn82nqhlu+ayAJKODB3K3EfdtwIDfCt1TdftI2weCUYN8
 9x+wrVEVgRux+BgFimrHqBqmf7g7Mm528ahWkXWIQCWeNuF7AuOw46+HL w==;
X-IronPort-AV: E=Sophos;i="5.99,284,1677567600"; d="scan'208";a="216051228"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 18 May 2023 00:38:28 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 18 May 2023 00:38:27 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 18 May 2023 00:38:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fGkn9JtVt7DkNzrfUCbGkmhREzQN7nx0zj45coe8wH4qtzGM5dvUZIeVZEHaT3PG5YqwiKHbE7r8xenrspKfr+Kajvm1LGMwJO07RfI41rqzEYCZJ8yVHcyrnBCGDgqxdbTgDi/mXwCvkMGQs9rD+c0pEmdLnSr0qHlqjx+SeIc3fu9uY3jTSb2nZJ9VSqV4VcAAthHJVJiwBbUfP96a4D5V0gStlC70AjinKy7LOoCbMoysa18B/Ptax91I9/Xt4BjnhfxQ92eLAAJUnVsF76ckz47MviLXechpBXsXLxLkMwXhjxu/zQ2Ee3BAVnRhFo+v9h9ViNItTH6O8H4oMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h8geLpCv1xn+fbqE+K6gWLeud9KKyULiITwZgz4d7mg=;
 b=INYAmP9KCe9qpvBy1F4bsh988rBWjU3BX1wG9b82JNnBXpmrPUL1nijePkTTgAljZVhS17lOP8pXav3FhJpuZxm0m0eno9PF/Oho7UxuREtwVSTFKSLkIPfd8cPpsHywach1Myh9Xw1ZR6zP5G9zeGhLD1EUiNmgrM1WUzX3yyKFtaMSrrrQfBMnb8Od6mim4B4fjWYFvEekwVwF0BCgO/C8Y+gGivl1+9u6FXM1ObF0sGm/vstuwbt/42s8i6dyT4HXH1/9pPNqU/x1x2iLNItP+m2cMt8qmJetS17yBaczXiXzuQwEi2TJjgqFcpDhY0KnNLrt77Tw0S5C8mzwVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h8geLpCv1xn+fbqE+K6gWLeud9KKyULiITwZgz4d7mg=;
 b=MJkd1ZdW4fl/9hau2aTd5OboKR2of0bG4ZZDiVbZTaBUmsAa5OUUL3yWtEfSBYFmPMSwdQAs4vSnyrXXguhyGlmgpLMVd0dxeDcFYF6qVUNghGVKhtaLgQfkZJB9uuc8lPayW/U7STR2y+n4zRGgw9Li4IkKWF7HKCX9RToWDtc=
Received: from SJ2PR11MB7648.namprd11.prod.outlook.com (2603:10b6:a03:4c3::17)
 by DS0PR11MB8017.namprd11.prod.outlook.com (2603:10b6:8:115::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Thu, 18 May
 2023 07:38:26 +0000
Received: from SJ2PR11MB7648.namprd11.prod.outlook.com
 ([fe80::27bf:a69f:806f:67be]) by SJ2PR11MB7648.namprd11.prod.outlook.com
 ([fe80::27bf:a69f:806f:67be%5]) with mapi id 15.20.6411.019; Thu, 18 May 2023
 07:38:26 +0000
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
Subject: Re: [PATCH v3 07/65] clk: at91: sckc: Add a determine_rate hook
Thread-Topic: [PATCH v3 07/65] clk: at91: sckc: Add a determine_rate hook
Thread-Index: AQHZiVu6mMAsLYAy0kOu5A2m3KQy7w==
Date: Thu, 18 May 2023 07:38:25 +0000
Message-ID: <10fca778-f8a5-e844-7fcb-469a0cf31a90@microchip.com>
References: <20221018-clk-range-checks-fixes-v3-0-9a1358472d52@cerno.tech>
 <20221018-clk-range-checks-fixes-v3-7-9a1358472d52@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v3-7-9a1358472d52@cerno.tech>
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
x-ms-office365-filtering-correlation-id: 6c72a09a-642c-47f3-562a-08db5772dd7c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zpChqX+M06zBaM60HPDo8ThsKxfqaUtv2yGj0NCaNhfzMQjK+weUgv16LxhFLGcgtswln/ASG9/dwxyhgICkZJZmYm8274ZublUefbwzE9qM5F9AcMQ/M6Vpu0bPOf/LzLKE2zg20DGQuifxCnx1VVbfROTs6QLuYkqVn4MQpy3VX7JsTc4usL9C9m61h+gKnX6M3w8Y5YwYzdT1kgSTAVVN6M8pOYLlVczQfbMGkhusXRMVvIDmMovLeMzfk6KitYtu8j9120np8Bc4Dl0/JbP5jg/FC7DrHDNtSHkAbeBnEfLTYvNcGiZU7OVHKzCFlkDEnCZ7Zj04BTuXcEz1n/sPN8+H3k0JltcdA6KBe9ZFgkpO3wsJEQceE1cg/zKXvXiAdt/kHlqP1icjZn5e87IvGvSefETCjMJo5wuCT4w4xVCzS3IqyoHZw9BpckBkoe6riTXXLO4mXsDYEUFhot+gACwl66caE3V5RYviBj/qEDQ+rIIwQtxk5f7DwQH0+laws9rDYsvDL4bF4K2Vab8qAP+38U6UfTK2ATMUX7aUZtcUUwMTwpvDI/VnVinrsjpc9v2ejK02XS0iYFHItDwup+8XNNVatmUhkpgL3fZlnVOsYWo8zViYtJrkl7YuIzA18knZK21Kq3imzMvuNDtb6v58Du8eELpKvbXGaX5pc/IyHRu61rvWO+lvY9C62Fl/76KCXxZazdM2zpEkqA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR11MB7648.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(39860400002)(136003)(396003)(346002)(366004)(451199021)(110136005)(2906002)(91956017)(41300700001)(316002)(54906003)(478600001)(7406005)(7416002)(7366002)(31686004)(71200400001)(6486002)(66946007)(8676002)(66446008)(4326008)(8936002)(66556008)(76116006)(66476007)(64756008)(5660300002)(6506007)(26005)(53546011)(186003)(2616005)(83380400001)(36756003)(86362001)(38070700005)(921005)(38100700002)(122000001)(6512007)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S3dtLzAzbXU0R2dPZWtKSDZzMUp4bXk3Wms3TDVKK1JSaHZjbHpJZmtpUXNV?=
 =?utf-8?B?V3lwdDlHSzIzMUdyakx5aVNEWVVlNkh0dkEzdjdXV1poOFI1amlqdUpqdWVU?=
 =?utf-8?B?L3k2dFdtUGpzdXh5WVFYZmdVQjJDNXd4NnR0blNaWkRCTDZwemVEYi9PWnBM?=
 =?utf-8?B?OWE5ZFNhVHdPQy9Nb1VFcFVPdmp0SWc1SFlwNVU3YmtrNXY5bk1HK3hBMVFv?=
 =?utf-8?B?MEdsVEsrRlVZbjg2eVVBV28rV3ZSaklocFhtcmg5MEtOZFNuV0xUQzBOODNR?=
 =?utf-8?B?R0VBSzIyZGhRdXdUcXR1WWFYamIwN21KUU1MekZDTmIzRDk0dG14eVVmMDh5?=
 =?utf-8?B?RHZJemJQcXhQeEdGdkVRRkErNGphaFc5KzdlZDE1b2xoR0xKbjc1dE9RemZw?=
 =?utf-8?B?bDVLbGhFOURtTmEyR0tYcDNUazRpQUtvM1VSamFueTZNOWxVVmxnZXZia3lZ?=
 =?utf-8?B?QlAwUjB4dmJZYW83bVAxQzJkSEhhc3F3U2J6MkExdTNYNHhCRzhEQlpWcGM3?=
 =?utf-8?B?TzRZM0M1bGdUOHNsUnRRTzRiRGs4bUtFTUszdmkxK0crVUdVQXMwUUpLTzBh?=
 =?utf-8?B?OVBDZUNMaDAyaHM3VXNoNjE1MjA0WUxBdTBoOGdmM09pcjZ2d0hJaEszRG9w?=
 =?utf-8?B?UENEQ3l3Vm5RV2QwUUFWeWN2TWFKT0FER1cyblhId2FrcmF3Q1lYdDNqakhn?=
 =?utf-8?B?M3BSQVhOODgyOGFBRjQzMXJSNzJQUE5XUVYzSkFQSlRRVjVsbjVla2x1Y21K?=
 =?utf-8?B?anRsODBZcWNuUjV2eGZiQXZBQkJGZHY5Tnh3K0hYNWd2Q01Kd2h3Q0xNWmxq?=
 =?utf-8?B?dnBDOWl5TmZiNFlSb2NIaHFhTGxxMFZNeUxlRjJhR3ovdkRsak5DOWVudjlM?=
 =?utf-8?B?ODRIcHJUKzR0dU1kdkhGTFl1Q01JRkpwRThMVVVZVy80SjNyYUsxZVhIZm1k?=
 =?utf-8?B?Ukd1MzA4OFU5N1hmbmxnU2kyeE1hWkpKQnJYUUd2dWN0cDJ4VlJoeGRZbkND?=
 =?utf-8?B?aVJrR0E0VTJWREtJSCtPbmR1QUpsNGpXWDc3VDhXdzMwRUhRZDRSMUFURWtG?=
 =?utf-8?B?MldQT0RlT1loLzMzS3p2TUMxKzVJbHFHQUxyeWRDaTJZb2tpY21sbFN1RGln?=
 =?utf-8?B?a05zNXRvRXVWcFEyNEtwSnQ4bGs1eEsxbFl0SkhicHltdUFxWjM5bFJENFVh?=
 =?utf-8?B?VFFaT3lWWk41NVRaT1BSU1hxdGhHYXBPcWE0bTBQWUgzK25hdUlHMjBxVTlt?=
 =?utf-8?B?c2JidkNoQlJ0NHlITUxoWldqMnNpZlNURHcwVTB5eHNHY3BIWmo3V2k4b0NP?=
 =?utf-8?B?ZlRoMitQRHM3bVZhaTdTWVZjbWc5MU4vUzkwaWdqbDJKTnhjZzRkdVl2bE5o?=
 =?utf-8?B?dmQzeUNLeGgzYWJoZ3l0OU1nQVdQQUhFdUF3TENkL1VpbnlVQ0piTzVGS2Qy?=
 =?utf-8?B?cFVmSlFEZ0h1a0NUQW1lTnpqY2Y4b2hIaElIVkNoSDNIME1ycWxEbWRkMEV2?=
 =?utf-8?B?WHdDNHcwaW5vdnJVeDlEY09FN2kzdDRsRUYxSzM0WElCNnp4RC91emlvdVE4?=
 =?utf-8?B?WGxlaWhtZXZqSzN6OWk2eC9OK0xmcTBSdHA4VjdBbXJycytiYytvYkwyQVZi?=
 =?utf-8?B?QzUvTWpzcmIyVWdRQnQzNmdPMERzS0pLeTcwMlUxMWNTaWw4S1ZFbzd3ckR2?=
 =?utf-8?B?QW5HdDY2S3c5ZFU5N3NBSmU4cXI1WnpnbVRXQWJxZ1BYbWZGYUZiTUZNVk5a?=
 =?utf-8?B?bWlPQWhZR0tIRFlxbVN6d2RqQ01QLzBGTGc0eTVJS3o2YnlDSGN4d2hDbElx?=
 =?utf-8?B?WWhOVnEwVDlNYzlRc3lZZmxtRzVveVpwejNyT0RLRURSejRTNnNIbWIrdk1N?=
 =?utf-8?B?RzlSdWFENFpJUmhiakRuUUo2bEs5T0xnVjdaMmZSc0xCS3B2cURYZE9MTnpZ?=
 =?utf-8?B?L2VOMXpXZDVOZDB3dy8zeHFzMWlRYWM3NXEwZktOb0lkdGNZWE5iVmlJQUVF?=
 =?utf-8?B?cWkrTzNFcHY0ZDhZdFVadmJaeDFaMXRJRzQzdkhRcENReE9Kcnd3V0daZGVy?=
 =?utf-8?B?Wk51VGF2MnRENUZ6bUU2dWQ4a3B5aU14MkROMWtBOXpUT2NlMEhSdWVJWjZD?=
 =?utf-8?B?WXVlZGtkUW9OZTFuRzdlMUlnRE42cllmWlAxM1FwWnFZOGtKUmJuUlJTUFZF?=
 =?utf-8?B?UlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5CDF0816C96D4B46AA2D2570930E37F2@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c72a09a-642c-47f3-562a-08db5772dd7c
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2023 07:38:25.6333 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G+qwxf8q/DeJrMIiITjrg9bFuaCLfylK8CzHJI5SxpoHmmBKuG9pqJQgjwGS3LdK+3Qt67xwRXUpIxLvH3tjdljOq44y7XX5dNHF+0k6NxI=
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
dyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBUaGUgU0FNOXg1IHNsb3cgY2xvY2sgaW1wbGVt
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
cC5jb20+DQoNCj4gLS0tDQo+ICBkcml2ZXJzL2Nsay9hdDkxL3Nja2MuYyB8IDMgKystDQo+ICAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9jbGsvYXQ5MS9zY2tjLmMgYi9kcml2ZXJzL2Nsay9hdDkxL3Nja2Mu
Yw0KPiBpbmRleCBmZGM5YjY2OWY4YTcuLjljNDI5NjFhOGEyZiAxMDA2NDQNCj4gLS0tIGEvZHJp
dmVycy9jbGsvYXQ5MS9zY2tjLmMNCj4gKysrIGIvZHJpdmVycy9jbGsvYXQ5MS9zY2tjLmMNCj4g
QEAgLTMxMCw2ICszMTAsNyBAQCBzdGF0aWMgdTggY2xrX3NhbTl4NV9zbG93X2dldF9wYXJlbnQo
c3RydWN0IGNsa19odyAqaHcpDQo+ICB9DQo+IA0KPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBjbGtf
b3BzIHNhbTl4NV9zbG93X29wcyA9IHsNCj4gKyAgICAgICAuZGV0ZXJtaW5lX3JhdGUgPSBfX2Ns
a19tdXhfZGV0ZXJtaW5lX3JhdGUsDQo+ICAgICAgICAgLnNldF9wYXJlbnQgPSBjbGtfc2FtOXg1
X3Nsb3dfc2V0X3BhcmVudCwNCj4gICAgICAgICAuZ2V0X3BhcmVudCA9IGNsa19zYW05eDVfc2xv
d19nZXRfcGFyZW50LA0KPiAgfTsNCj4gQEAgLTMzNyw3ICszMzgsNyBAQCBhdDkxX2Nsa19yZWdp
c3Rlcl9zYW05eDVfc2xvdyh2b2lkIF9faW9tZW0gKnNja2NyLA0KPiAgICAgICAgIGluaXQub3Bz
ID0gJnNhbTl4NV9zbG93X29wczsNCj4gICAgICAgICBpbml0LnBhcmVudF9uYW1lcyA9IHBhcmVu
dF9uYW1lczsNCj4gICAgICAgICBpbml0Lm51bV9wYXJlbnRzID0gbnVtX3BhcmVudHM7DQo+IC0g
ICAgICAgaW5pdC5mbGFncyA9IDA7DQo+ICsgICAgICAgaW5pdC5mbGFncyA9IENMS19TRVRfUkFU
RV9OT19SRVBBUkVOVDsNCj4gDQo+ICAgICAgICAgc2xvd2NrLT5ody5pbml0ID0gJmluaXQ7DQo+
ICAgICAgICAgc2xvd2NrLT5zY2tjciA9IHNja2NyOw0KPiANCj4gLS0NCj4gMi4zOS4yDQo+IA0K
DQo=
