Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 513B2707BCE
	for <lists+dri-devel@lfdr.de>; Thu, 18 May 2023 10:20:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C6C610E4F3;
	Thu, 18 May 2023 08:20:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5DF610E4E5
 for <dri-devel@lists.freedesktop.org>; Thu, 18 May 2023 07:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1684395542; x=1715931542;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=uSTkrbAO7Ncg5G3B0H2CZkAdV5X66E3cgDWt/Md9oFY=;
 b=EM+w+C8por7/IpqkEmdewf16kt/fnAiiyACQEVYDmFhUqleEsaBiap62
 MhaxgQWXuQ++4YABKYyvQQnZfIgRPKIV5Gj94Xu/KEzpdDeSs+z4iMjd7
 o7Jw9dnuIhKYOOcu2TlK70F2yXjqAPqp7vM1MqLvIeGWF3qnXj/opApV3
 GhfjkmQtlNGnx8FtXrm18FSboVuAl+oWzHcPyEsOj8vl/g1UxJjSZh4Ju
 +9JF2naocbb4gj8iMBeeUQNTClva2KvkWZaA7zfgF4dEPOiAIKcnZ4CpU
 STTtJ0yhT2TLvGGYsVRtR27r+0QSa6BO11FM5wDNt+m1ruwbw9LrON+yB A==;
X-IronPort-AV: E=Sophos;i="5.99,284,1677567600"; d="scan'208";a="216051304"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 18 May 2023 00:38:59 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 18 May 2023 00:38:56 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 18 May 2023 00:38:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GQ8EcSQ3zIME+DehnLyKp3iC6hs5lqNO2r1QhZRcIrcKJ5amBYZXfyLh2R3zzIOHt3SUx3CrVc2SuDi7UZcND2oCdBSd25+K55L49Na2FoChSML36h/7eDX/v2mBBWdTVHOh2Ql7qSEsaBXmM9P6v3gIAnU83hkIGLfEZy+9gq6DCIMEMZ6QaD2fIouh1szhagXnC3VEnHS+Zjmusn62n+lP6MMASytPTt0B/SzFk4exFP0v8OG5jcSS9Dbbyt/IR5BM3VcdbQRWBXdmE055XuYoSY9h9nrHOLGvA2vRaBuxX02ZJRai5oihnbUQL37VviGrN1rHUw+XAwqRWXbXtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uSTkrbAO7Ncg5G3B0H2CZkAdV5X66E3cgDWt/Md9oFY=;
 b=R2XOx3FP97KJ5N2kRw5ERbcXxZyPs/yS1Y8Ckc8xXfJqE2MC6gCnaFozox8Pmqz/Ml9s1zWDhMnSMcs28e7dp8nkBzpLdhsHq86knJnpjj1PjIhFAktMJ64Y0UuvPggB2InfEOLk3131OLN20FnlnU4fMe0auYErufmOZFgzDsbMSactYN0wi9O1lu85IBHERNMlFU4yg8IPzitbfV5bcy7zxZoqxB0AzshBkf5uNkkAnDWcQySibOxacoOxs+a/qel23jY2sa3YnNVa3YoQ/0ZV9/taySaCEg74LFxAqPoIBi2/JvARyp4pwK3arBoVbgGzb1nEznvCGqVBxzt9Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uSTkrbAO7Ncg5G3B0H2CZkAdV5X66E3cgDWt/Md9oFY=;
 b=uPCry+jAcMt3FOJ6CpO42Ij5cauJuKEPWo4ykMorVhwwH7oIVU4oiLbr9km0sA69pqVF+h5HOnsPq5kB6HA4IfrExc3TPdFmDI7r8IP4sMduAtF6/nLW6e1pI8RS/7j/wl9iatWKNLZtK9r49Ec4ktR7bSQytmUFEbbjOIxaqMU=
Received: from SJ2PR11MB7648.namprd11.prod.outlook.com (2603:10b6:a03:4c3::17)
 by DS0PR11MB8017.namprd11.prod.outlook.com (2603:10b6:8:115::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Thu, 18 May
 2023 07:38:54 +0000
Received: from SJ2PR11MB7648.namprd11.prod.outlook.com
 ([fe80::27bf:a69f:806f:67be]) by SJ2PR11MB7648.namprd11.prod.outlook.com
 ([fe80::27bf:a69f:806f:67be%5]) with mapi id 15.20.6411.019; Thu, 18 May 2023
 07:38:54 +0000
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
Subject: Re: [PATCH v3 46/65] clk: at91: smd: Switch to determine_rate
Thread-Topic: [PATCH v3 46/65] clk: at91: smd: Switch to determine_rate
Thread-Index: AQHZiVvMh8mlcLuc5k2DWCq7QLqcHw==
Date: Thu, 18 May 2023 07:38:54 +0000
Message-ID: <ca4e1c30-1faf-f4e5-980b-20f5307a580c@microchip.com>
References: <20221018-clk-range-checks-fixes-v3-0-9a1358472d52@cerno.tech>
 <20221018-clk-range-checks-fixes-v3-46-9a1358472d52@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v3-46-9a1358472d52@cerno.tech>
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
x-ms-office365-filtering-correlation-id: ab55f6ba-3d35-435f-a903-08db5772ee99
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1W9jjSH6AuCOEUHJUPkFhxD27c4UwT4ID1jj/+NZQFo9ilnqG7bi2ehJ7Chx7c46LrT04adEQ9nCjE69Ujv0ae5AShM7lK8rNORQVzVKs8uULjRt65zVqEwr/kl0kF/BtseO53w8/X0NP8e2PJa+XrhIDV3DyvCvlh0dMM7PifHinGnCoTjwyw9EcIfn9lKFrrVHa2URZ/mkwd/KEVXrMI3TxBY+dbrH4FByhyuzkzSwuzw9l+6zFzJaLvGGt8K6qHhMsTRufnPSAFWKhLB/W5DvPYtznSeNjiUthvfJmt9UmCxR/Gex4KVC+yXj2nkFWZSXNLdvrmfIQd6da/KXR3orMqkEmcw2pm624i3COXCU1qQ+DFAV3xRyXxY1n9WEmFZ/fxfTYVzlfoj7JXAjBK+BrUc3viWROF/3EhtrhfRcYLYZSutge+O2nFPfMph8SFTUMrnXdVn0WvHrgovl10pd5cyD9DkZyh+PPURErNAr6olGoVfeoaQmd2jHNx7uMH6h4nleb4B6ZGRkn9lLVjmOxUuFtz/QPyNvQfQmhDwhRlf1c+FI3Kv9vBk7lC2CfLeTpk+Pb1tRT/eBPWsV8wdy5THZLQeOElUqWDwY3mMyILWbCjwWvoGrXmBrapGUVWUDKAt1vJHekNqnfa9H+QcNlGna5WmJ2rsxHmk4cmNUHlyoVlREIDHqah8Ypm6ez/4UW/v/ypmnMQ7nBVa7Iw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR11MB7648.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(39860400002)(136003)(396003)(346002)(366004)(451199021)(110136005)(2906002)(91956017)(41300700001)(316002)(54906003)(478600001)(7406005)(7416002)(7366002)(31686004)(71200400001)(6486002)(66946007)(8676002)(66446008)(4326008)(8936002)(66556008)(76116006)(66476007)(64756008)(5660300002)(6506007)(26005)(53546011)(186003)(2616005)(83380400001)(36756003)(86362001)(38070700005)(921005)(38100700002)(122000001)(6512007)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QUs1cGFIRGZ2Nnl3NnVkZjdCYTJMWE0yU3ljMW1RS3dSUFZSM1Q5dFFaYUhL?=
 =?utf-8?B?dXkzT0phSzlROHdCMWdQVUZjT2pGWWcxeENHcytHNU9vdGgwRGNPT050RGxn?=
 =?utf-8?B?bG5LMFNPWGtNU0NLWlEya1U5SDdQd1VzUUI3RVpuV0ZjTHN0WndoNzVQNFBl?=
 =?utf-8?B?a1p3UTJpWjJPTkZxWnVrR0FWVUpQSWdSNWdrb2U4dVFmRjZZRE9ocDlYN1hT?=
 =?utf-8?B?WERudGI5TzhrZDdFZUdWMm1ZOTlINWJTUGUyQUEvOEtYRkVpRXZhNE1jR3RT?=
 =?utf-8?B?RDVVajhoc1pTL2FyTzk0dHY5UHNlbG5jbnlaZ1paaysyVXZRTFl1QXpOcWFZ?=
 =?utf-8?B?Q3VuNS9oSWVXdXZMKzlPK1lhcnlYUmlHQmFscmVYczZ3bkgycWZicEFyN3RG?=
 =?utf-8?B?dGRmWVc3RjdqUzhlVE1pSjdNQ0RZQXVoaDhpK0pCczIrcjlVWUhiSkJVekxW?=
 =?utf-8?B?MW9ZbG9hNTNmR1FQMWZlaU42eFJoYm5rTnRIVElUWktidjZVcENhL0twZTBO?=
 =?utf-8?B?UEw2SDVCTGtsRFZWazNBZXN0aHZpbVFmelE2ekdTZ2tnR0FFemhZQjhwSjFn?=
 =?utf-8?B?eFhSVWFKY3NlVEIySXZHY3lJY011L0RPSWFUbDhPM2daN2xLZVZpUjk1d0VW?=
 =?utf-8?B?TGRQSXRHV3lDcTdDNmp1RkdKL1BjbVdVdEVXc2FhMUJFWkh6aExYbkNqSHpH?=
 =?utf-8?B?OVdNTit6Yzl4WGw1ejJLbVo2WGE4ZmJid1dBSzI0eEYwVGhVa2N5QWdDS2dT?=
 =?utf-8?B?ZG1oQ2JzMkg3d3ArTDFNRE8ySFp0QmJMenQvcTVlNkVKMkJ6MW84TEh1WWRL?=
 =?utf-8?B?RVVhbUtIL1JJbmFqSEQySFRseENIQ1VTeHVoU25VbDd0QzRLa0FYdDFoa2Fm?=
 =?utf-8?B?YWhHZVpuc1RPc0hBUlhrMWNoRWhwSXZJT1V2WkFxRFF3T3o2UXVYZEk2ZDhU?=
 =?utf-8?B?ajZhWlJiZE14SXAzMWlndER2Y3FERXRuNUpiVGU1NFV6bXpNYTdLbE1TdG1Q?=
 =?utf-8?B?NHVENStLRnM1UUk0ZmhwMjFHYXpUU0tJMzU2ZWgrbkVoeEFaQTI4SHJ2bG5s?=
 =?utf-8?B?Q3FDV0pmcnl6RzBESWNxUHFUYnFJcExTRU1LK0YvdXV6amxuek1mK01sSkJa?=
 =?utf-8?B?VlFPdnJ5ZXRadnpUaTVudTBiemYwdU14eEVDSGhVTkh0RmNQZ0V1WDFOOERY?=
 =?utf-8?B?M25NcjEra0hOMUlsc2pBQ2QwUzNWSFB6NWhOVk8raEhRZjdGMXhpd0RlUEcz?=
 =?utf-8?B?N2VBTitiSy81OUQ5ck8wNHFpQ29JSGtVV09ZbkpQcGVyNHA4TEdwOWRqM0Rq?=
 =?utf-8?B?WjhCUzVIaklWOU42bElxZHNoeko4UHVxaCtTVyswaEpyTWNXUUJKc1IvZG1O?=
 =?utf-8?B?eGhERTAyeG5YSVJxQ2JVeXVTNFJqMEc5SG9UUkpzOXpSeHdxcnRMNFF2ZUsy?=
 =?utf-8?B?d0l0ZG5xVUhRd0paSFFNUVp5d1RGZk1LR0RzWWE5Yk1wL29XRkRlcmQvUG5U?=
 =?utf-8?B?TDNOQ2tScFdJekxRL2FuN3dEMGo4YUhjMFhHU1VpRkhRTHBUWGNXWFNaamx1?=
 =?utf-8?B?WGRhUnBBZDRjbkkzYmxETllacTduWmdJTmUvRElMVWN3eFRiOHFoVkxteWtx?=
 =?utf-8?B?anp3cUcrUytZQ1VGVUM5QTAwQ01YU2JncHNLUmRiZXZ3bGRvYlJLYjhwL0Zx?=
 =?utf-8?B?Q1NwR0pyV0JhQVFFQ2x2dFlWdUVMZ1RWOTlxS2Nmc2drZHZUdEVINHBVbGJJ?=
 =?utf-8?B?cHk3dHB1RDM0VWc4MDJ1M0xtZC8xZmxKcmlBTitOTkZZNDNJcGEweGh6Q1d4?=
 =?utf-8?B?R005cWhpV1AyQ1hpN05RQ0UreG13NWNoUWdlWE8ybVVnSEVHcUxOZFVSSnNM?=
 =?utf-8?B?RlB3Nm5RVnJlU01uUGNQbUptSjNLdGpRcjY1K2ZGVnVIeHZDQlljZlpNSG9k?=
 =?utf-8?B?cEJpMTF5d0o1NXZNZVh4eHRpQ09sTlRnQWhrKzQ3TUFQeFNLam5ESGYwaDVI?=
 =?utf-8?B?VElIN01vbDJITWNkUFA5eWFYVGRmdUpzSEFJMENvZjhLT3dLdE1MQ3lJdjcz?=
 =?utf-8?B?dE1hN0Q5a3UvbXRFS2hSVzhISkkwb0VnMEl4TTBjL0RhamxsTHh2cFFmUUhE?=
 =?utf-8?Q?Tknp64AFOs0aW/Y0Ca/7yY1y/?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3DD7ECCC95B9014AB73596C62ABF099D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab55f6ba-3d35-435f-a903-08db5772ee99
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2023 07:38:54.3655 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tIHhA4JV6XGm3rx5F/qQ0KuLDMr+ApqTlMwb8yKOan+wL9HsAdxRpZF7IK+WSL5XYR+LHfkrIt/p3oqci7HB1qTSrkKEsfWH8Ivy4uxtKxY=
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

T24gMDQuMDQuMjAyMyAxMzoxMSwgTWF4aW1lIFJpcGFyZCB3cm90ZToNCj4gRVhURVJOQUwgRU1B
SUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25v
dyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBUaGUgQXRtZWwgU0FNOXg1IFNNRCBjbG9ja3Mg
aW1wbGVtZW50cyBhIG11eCB3aXRoIGEgc2V0X3BhcmVudA0KPiBob29rLCBidXQgZG9lc24ndCBw
cm92aWRlIGEgZGV0ZXJtaW5lX3JhdGUgaW1wbGVtZW50YXRpb24uDQo+IA0KPiBUaGlzIGlzIGEg
Yml0IG9kZCwgc2luY2Ugc2V0X3BhcmVudCgpIGlzIHRoZXJlIHRvLCBhcyBpdHMgbmFtZSBpbXBs
aWVzLA0KPiBjaGFuZ2UgdGhlIHBhcmVudCBvZiBhIGNsb2NrLiBIb3dldmVyLCB0aGUgbW9zdCBs
aWtlbHkgY2FuZGlkYXRlIHRvDQo+IHRyaWdnZXIgdGhhdCBwYXJlbnQgY2hhbmdlIGlzIGEgY2Fs
bCB0byBjbGtfc2V0X3JhdGUoKSwgd2l0aA0KPiBkZXRlcm1pbmVfcmF0ZSgpIGZpZ3VyaW5nIG91
dCB3aGljaCBwYXJlbnQgaXMgdGhlIGJlc3Qgc3VpdGVkIGZvciBhDQo+IGdpdmVuIHJhdGUuDQo+
IA0KPiBUaGUgb3RoZXIgdHJpZ2dlciB3b3VsZCBiZSBhIGNhbGwgdG8gY2xrX3NldF9wYXJlbnQo
KSwgYnV0IGl0J3MgZmFyIGxlc3MNCj4gdXNlZCwgYW5kIGl0IGRvZXNuJ3QgbG9vayBsaWtlIHRo
ZXJlJ3MgYW55IG9idmlvdXMgdXNlciBmb3IgdGhhdCBjbG9jay4NCj4gDQo+IFNvLCB0aGUgc2V0
X3BhcmVudCBob29rIGlzIGVmZmVjdGl2ZWx5IHVudXNlZCwgcG9zc2libHkgYmVjYXVzZSBvZiBh
bg0KPiBvdmVyc2lnaHQuIEhvd2V2ZXIsIGl0IGNvdWxkIGFsc28gYmUgYW4gZXhwbGljaXQgZGVj
aXNpb24gYnkgdGhlDQo+IG9yaWdpbmFsIGF1dGhvciB0byBhdm9pZCBhbnkgcmVwYXJlbnRpbmcg
YnV0IHRocm91Z2ggYW4gZXhwbGljaXQgY2FsbCB0bw0KPiBjbGtfc2V0X3BhcmVudCgpLg0KPiAN
Cj4gVGhlIGRyaXZlciBkb2VzIGltcGxlbWVudCByb3VuZF9yYXRlKCkgdGhvdWdoLCB3aGljaCBt
ZWFucyB0aGF0IHdlIGNhbg0KPiBjaGFuZ2UgdGhlIHJhdGUgb2YgdGhlIGNsb2NrLCBidXQgd2Ug
d2lsbCBuZXZlciBnZXQgdG8gY2hhbmdlIHRoZQ0KPiBwYXJlbnQuDQo+IA0KPiBIb3dldmVyLCBJ
dCdzIGhhcmQgdG8gdGVsbCB3aGV0aGVyIGl0J3MgYmVlbiBkb25lIG9uIHB1cnBvc2Ugb3Igbm90
Lg0KPiANCj4gU2luY2Ugd2UnbGwgc3RhcnQgbWFuZGF0aW5nIGEgZGV0ZXJtaW5lX3JhdGUoKSBp
bXBsZW1lbnRhdGlvbiwgbGV0J3MNCj4gY29udmVydCB0aGUgcm91bmRfcmF0ZSgpIGltcGxlbWVu
dGF0aW9uIHRvIGEgZGV0ZXJtaW5lX3JhdGUoKSwgd2hpY2gNCj4gd2lsbCBhbHNvIG1ha2UgdGhl
IGN1cnJlbnQgYmVoYXZpb3IgZXhwbGljaXQuIEFuZCBpZiBpdCB3YXMgYW4NCj4gb3ZlcnNpZ2h0
LCB0aGUgY2xvY2sgYmVoYXZpb3VyIGNhbiBiZSBhZGp1c3RlZCBsYXRlciBvbi4NCj4gDQo+IFNp
Z25lZC1vZmYtYnk6IE1heGltZSBSaXBhcmQgPG1heGltZUBjZXJuby50ZWNoPg0KDQpSZXZpZXdl
ZC1ieTogQ2xhdWRpdSBCZXpuZWEgPGNsYXVkaXUuYmV6bmVhQG1pY3JvY2hpcC5jb20+DQoNClRl
c3RlZC1ieTogQ2xhdWRpdSBCZXpuZWEgPGNsYXVkaXUuYmV6bmVhQG1pY3JvY2hpcC5jb20+DQoN
Cj4gLS0tDQo+ICBkcml2ZXJzL2Nsay9hdDkxL2Nsay1zbWQuYyB8IDI5ICsrKysrKysrKysrKysr
KysrLS0tLS0tLS0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgMTIg
ZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvYXQ5MS9jbGstc21k
LmMgYi9kcml2ZXJzL2Nsay9hdDkxL2Nsay1zbWQuYw0KPiBpbmRleCAxNjAzNzg0MzhmMWIuLjA5
YzY0OWM4NTk4ZSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9jbGsvYXQ5MS9jbGstc21kLmMNCj4g
KysrIGIvZHJpdmVycy9jbGsvYXQ5MS9jbGstc21kLmMNCj4gQEAgLTM2LDI2ICszNiwzMSBAQCBz
dGF0aWMgdW5zaWduZWQgbG9uZyBhdDkxc2FtOXg1X2Nsa19zbWRfcmVjYWxjX3JhdGUoc3RydWN0
IGNsa19odyAqaHcsDQo+ICAgICAgICAgcmV0dXJuIHBhcmVudF9yYXRlIC8gKHNtZGRpdiArIDEp
Ow0KPiAgfQ0KPiANCj4gLXN0YXRpYyBsb25nIGF0OTFzYW05eDVfY2xrX3NtZF9yb3VuZF9yYXRl
KHN0cnVjdCBjbGtfaHcgKmh3LCB1bnNpZ25lZCBsb25nIHJhdGUsDQo+IC0gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgKnBhcmVudF9yYXRlKQ0K
PiArc3RhdGljIGludCBhdDkxc2FtOXg1X2Nsa19zbWRfZGV0ZXJtaW5lX3JhdGUoc3RydWN0IGNs
a19odyAqaHcsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHN0cnVjdCBjbGtfcmF0ZV9yZXF1ZXN0ICpyZXEpDQo+ICB7DQo+ICAgICAgICAgdW5zaWduZWQg
bG9uZyBkaXY7DQo+ICAgICAgICAgdW5zaWduZWQgbG9uZyBiZXN0cmF0ZTsNCj4gICAgICAgICB1
bnNpZ25lZCBsb25nIHRtcDsNCj4gDQo+IC0gICAgICAgaWYgKHJhdGUgPj0gKnBhcmVudF9yYXRl
KQ0KPiAtICAgICAgICAgICAgICAgcmV0dXJuICpwYXJlbnRfcmF0ZTsNCj4gKyAgICAgICBpZiAo
cmVxLT5yYXRlID49IHJlcS0+YmVzdF9wYXJlbnRfcmF0ZSkgew0KPiArICAgICAgICAgICAgICAg
cmVxLT5yYXRlID0gcmVxLT5iZXN0X3BhcmVudF9yYXRlOw0KPiArICAgICAgICAgICAgICAgcmV0
dXJuIDA7DQo+ICsgICAgICAgfQ0KPiANCj4gLSAgICAgICBkaXYgPSAqcGFyZW50X3JhdGUgLyBy
YXRlOw0KPiAtICAgICAgIGlmIChkaXYgPiBTTURfTUFYX0RJVikNCj4gLSAgICAgICAgICAgICAg
IHJldHVybiAqcGFyZW50X3JhdGUgLyAoU01EX01BWF9ESVYgKyAxKTsNCj4gKyAgICAgICBkaXYg
PSByZXEtPmJlc3RfcGFyZW50X3JhdGUgLyByZXEtPnJhdGU7DQo+ICsgICAgICAgaWYgKGRpdiA+
IFNNRF9NQVhfRElWKSB7DQo+ICsgICAgICAgICAgICAgICByZXEtPnJhdGUgPSByZXEtPmJlc3Rf
cGFyZW50X3JhdGUgLyAoU01EX01BWF9ESVYgKyAxKTsNCj4gKyAgICAgICAgICAgICAgIHJldHVy
biAwOw0KPiArICAgICAgIH0NCj4gDQo+IC0gICAgICAgYmVzdHJhdGUgPSAqcGFyZW50X3JhdGUg
LyBkaXY7DQo+IC0gICAgICAgdG1wID0gKnBhcmVudF9yYXRlIC8gKGRpdiArIDEpOw0KPiAtICAg
ICAgIGlmIChiZXN0cmF0ZSAtIHJhdGUgPiByYXRlIC0gdG1wKQ0KPiArICAgICAgIGJlc3RyYXRl
ID0gcmVxLT5iZXN0X3BhcmVudF9yYXRlIC8gZGl2Ow0KPiArICAgICAgIHRtcCA9IHJlcS0+YmVz
dF9wYXJlbnRfcmF0ZSAvIChkaXYgKyAxKTsNCj4gKyAgICAgICBpZiAoYmVzdHJhdGUgLSByZXEt
PnJhdGUgPiByZXEtPnJhdGUgLSB0bXApDQo+ICAgICAgICAgICAgICAgICBiZXN0cmF0ZSA9IHRt
cDsNCj4gDQo+IC0gICAgICAgcmV0dXJuIGJlc3RyYXRlOw0KPiArICAgICAgIHJlcS0+cmF0ZSA9
IGJlc3RyYXRlOw0KPiArICAgICAgIHJldHVybiAwOw0KPiAgfQ0KPiANCj4gIHN0YXRpYyBpbnQg
YXQ5MXNhbTl4NV9jbGtfc21kX3NldF9wYXJlbnQoc3RydWN0IGNsa19odyAqaHcsIHU4IGluZGV4
KQ0KPiBAQCAtOTgsNyArMTAzLDcgQEAgc3RhdGljIGludCBhdDkxc2FtOXg1X2Nsa19zbWRfc2V0
X3JhdGUoc3RydWN0IGNsa19odyAqaHcsIHVuc2lnbmVkIGxvbmcgcmF0ZSwNCj4gDQo+ICBzdGF0
aWMgY29uc3Qgc3RydWN0IGNsa19vcHMgYXQ5MXNhbTl4NV9zbWRfb3BzID0gew0KPiAgICAgICAg
IC5yZWNhbGNfcmF0ZSA9IGF0OTFzYW05eDVfY2xrX3NtZF9yZWNhbGNfcmF0ZSwNCj4gLSAgICAg
ICAucm91bmRfcmF0ZSA9IGF0OTFzYW05eDVfY2xrX3NtZF9yb3VuZF9yYXRlLA0KPiArICAgICAg
IC5kZXRlcm1pbmVfcmF0ZSA9IGF0OTFzYW05eDVfY2xrX3NtZF9kZXRlcm1pbmVfcmF0ZSwNCj4g
ICAgICAgICAuZ2V0X3BhcmVudCA9IGF0OTFzYW05eDVfY2xrX3NtZF9nZXRfcGFyZW50LA0KPiAg
ICAgICAgIC5zZXRfcGFyZW50ID0gYXQ5MXNhbTl4NV9jbGtfc21kX3NldF9wYXJlbnQsDQo+ICAg
ICAgICAgLnNldF9yYXRlID0gYXQ5MXNhbTl4NV9jbGtfc21kX3NldF9yYXRlLA0KPiANCj4gLS0N
Cj4gMi4zOS4yDQo+IA0KDQo=
