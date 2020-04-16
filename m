Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE02E1AD681
	for <lists+dri-devel@lfdr.de>; Fri, 17 Apr 2020 08:59:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EAC76E348;
	Fri, 17 Apr 2020 06:59:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com
 [148.163.135.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F37686E2E8
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 11:57:21 +0000 (UTC)
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
 by mx0a-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03GBqFTa019187; Thu, 16 Apr 2020 07:57:10 -0400
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
 by mx0a-00128a01.pphosted.com with ESMTP id 30dn9adggu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Apr 2020 07:57:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lwa6nbITHiUTot9BMDm7VoNh7/xCFVvNrEAv1OSApZrK/QTRimuoq7HHa52/XiNwS7d7WP0xzmOQ2q3MDtn9dn/C0tqvhrIr6hLHfswFF9S55RrWpIJNGlqjrmeo3O7hpdigV/j+t9OJXb85GUqCLDtiPTZlBxxpR7uMMUn/mbLSb7WurJYfCfCUst41aTdnUrzx+gDRdFIErrddi2MCA6tW9E6YPPicyLLFG7E/7cuFSXyDVcKOfNlV5sOFW99yyj4zbN/4VnYZwqvoysoHL+4UICzq6qb3g8noMYxVJwnk3Qo1wdyvHVj6mHOGFOE096H4RfbtapH6IfVivMsU/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZdnCqNRO9owwkVrvROjzR7ZFOAEIGwXebJHmRoT/HLo=;
 b=EAOWpy4kEe09sBXtIaQax95VcpApAIE/M9rDtwW7hrgXKQt0+pX78L3hAajeQKfTxGoL8HhdAO4gAozTr7dvQV9T/YuE+N/120FwkqVomOx53GL17hwqUt3aipbUMJzWfu6nmWPOOy/1SMvobcyhEAu0HH37tJ+KwuT/tF+WIZBx9suFdw/yAbyGnpKLwjxecoW5F2WQ45w4of38GTqIPeXEfJMgp9lUAGhF3r5sLPJozRdB4MypX0WygPwX2cAi9r5gDDRI0u4oBDoMJS89PzggQdPq/Qa8nempe0puZf/T+ShXsdCS6kV43DIX1Rfzlpzqdro6yPXGfVzNQ+xOMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZdnCqNRO9owwkVrvROjzR7ZFOAEIGwXebJHmRoT/HLo=;
 b=DVskSv5VEX7a2+gBgetuK7xmII6guIen/iAuXAhMAuRfxwVfHZRxnjO38HAV5Gi1PrJLVCeDE5/flBtCo9B8Jp3E3SBLrUXFq324OMuNn6w3FaWrhKpJux8piXQJP6JbKqknVThRsYAgEnBWq9a2QNAvGskdMnPasG8hlh3b89M=
Received: from DM6PR03MB4411.namprd03.prod.outlook.com (2603:10b6:5:10f::14)
 by DM6PR03MB4186.namprd03.prod.outlook.com (2603:10b6:5:5d::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.26; Thu, 16 Apr
 2020 11:57:08 +0000
Received: from DM6PR03MB4411.namprd03.prod.outlook.com
 ([fe80::c47f:ceee:cfda:6a7f]) by DM6PR03MB4411.namprd03.prod.outlook.com
 ([fe80::c47f:ceee:cfda:6a7f%3]) with mapi id 15.20.2921.027; Thu, 16 Apr 2020
 11:57:08 +0000
From: "Ardelean, Alexandru" <alexandru.Ardelean@analog.com>
To: "vkoul@kernel.org" <vkoul@kernel.org>, "airlied@linux.ie"
 <airlied@linux.ie>, "Sa, Nuno" <Nuno.Sa@analog.com>,
 "stefan.popa@analog.com" <stefan.popa@analog.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "trivial@kernel.org" <trivial@kernel.org>, "jic23@kernel.org"
 <jic23@kernel.org>, "lars@metafoo.de" <lars@metafoo.de>,
 "Hennerich, Michael" <Michael.Hennerich@analog.com>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "tiwai@suse.com" <tiwai@suse.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "perex@perex.cz" <perex@perex.cz>
Subject: Re: [PATCH trivial 0/6] Fix misspellings of "Analog Devices"
Thread-Topic: [PATCH trivial 0/6] Fix misspellings of "Analog Devices"
Thread-Index: AQHWE+TlxWwioFJLmkWlJ0KLdTxLOqh7pIIA
Date: Thu, 16 Apr 2020 11:57:07 +0000
Message-ID: <9adccf5b3d7e812912c969f3c758d9ef96a47a0b.camel@analog.com>
References: <20200416103058.15269-1-geert+renesas@glider.be>
In-Reply-To: <20200416103058.15269-1-geert+renesas@glider.be>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [188.27.130.47]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f34af2d4-037d-4cb7-4d43-08d7e1fd4a20
x-ms-traffictypediagnostic: DM6PR03MB4186:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR03MB4186A84F45C15412C091CD7DF9D80@DM6PR03MB4186.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0375972289
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR03MB4411.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(39860400002)(366004)(136003)(376002)(346002)(396003)(8936002)(7416002)(64756008)(66446008)(66556008)(66476007)(2616005)(66946007)(8676002)(316002)(71200400001)(5660300002)(54906003)(2906002)(91956017)(76116006)(478600001)(26005)(6506007)(86362001)(6486002)(36756003)(186003)(4326008)(110136005)(81156014)(966005)(6512007)(921003)(1121003);
 DIR:OUT; SFP:1101; 
received-spf: None (protection.outlook.com: analog.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6lx31jT2XYbD7iLXkYwjyN0HogQ9+bn2y7T5Db7d03dSRgURn/UesDacDENB3a2IezDi9ES5LU0NUJTJI83bgu5ex280A3VZGEznpyKuWG3VOndCjlkRFVaOtHt09tsZisnTRdNRH4ZoXYcxfygSHeXpsh4YnRBmA/02oW8Xc530T1r4LGQNCQsJsVDYt3iIoPfV2y9+ceVLH8mGgf0DWVXuB+AmcdVL4HJAcPSUxTT/Yo8lx/T8OO1eaLvVNayT3zZaumMw3HrrEPhKbdalIj84nLPGZt8BLMhH06WYJyiHNbjE8ajwQSczLpooZxQFFAYtDIhu1qrs1tFqCGgIJyRWJ06KZKwWLblej2KRiWtsYfAnYIRMBHlfYX9GYlPbWXP0pFN2cy4Fvl92A2JAUcxLJExorDIn8wnbCaWVxdkZJfWLm9rt5KmXMQabjONgZ0z4J5CtQkWrJLoxb7TkR2bE1yUV/U89UEEt0oTuobLoyiST7IY6aFguyORDOOu7ZKVsWX3RCEswcMSEIZTHMfQCVkjol6e8PFuFcTyySWhbJuc7Xe0ZONftDTwuoI7uUyMSMLjcxap5UsUrKc9AEQ==
x-ms-exchange-antispam-messagedata: MSy14ga/VWOxkPa3EgtAilO8BQSme3x+iON1zbJT7z4x6fnDhW7o8b5OVDbzVnUIpnx7JmyoJ3aboZ721XctaMzRo77XAEcMF0jx3znsGcOVnhupdWP9mm/8e/LoIMBxYneUfc9pnv9mJzWkZ91EFw==
Content-ID: <347BDF7D162C684494D4C1E982D12D0E@namprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f34af2d4-037d-4cb7-4d43-08d7e1fd4a20
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2020 11:57:08.0602 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nlCfkprmpvyIm/E5eE1joevHDZqqemvDkNvb4/eLxJNm14zyQryAacJSHO91fo/krme0jrMCGEFtmTZzm12DqVNZ5oPMewufTgXdlzkVR7M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4186
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-16_03:2020-04-14,
 2020-04-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999 clxscore=1011
 mlxscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004160084
X-Mailman-Approved-At: Fri, 17 Apr 2020 06:59:46 +0000
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2020-04-16 at 12:30 +0200, Geert Uytterhoeven wrote:
> [External]
> 
> 	Hi all,
> 
> In several files the company also known as ADI is spelled as "Analog
> Device".  However, according to https://www.analog.com/, the company
> name is spelled "Analog Devices".
> 
> Hence this patch series, one per subsystem, fixes these misspellings.
> 
> Thanks for your comments!

For the entire series:

Reviewed-by: Alexandru Ardelean <alexandru.ardelean@analog.com>

Many thanks :)
Alex

> 
> Geert Uytterhoeven (6):
>   dt-bindings: Fix misspellings of "Analog Devices"
>   dma: Fix misspelling of "Analog Devices"
>   drm: Fix misspellings of "Analog Devices"
>   iio: Fix misspellings of "Analog Devices"
>   ALSA: Fix misspellings of "Analog Devices"
>   ASoC: Fix misspellings of "Analog Devices"
> 
>  .../devicetree/bindings/display/bridge/adi,adv7123.txt        | 4 ++--
>  .../devicetree/bindings/display/bridge/adi,adv7511.txt        | 4 ++--
>  Documentation/devicetree/bindings/dma/adi,axi-dmac.txt        | 2 +-
>  Documentation/devicetree/bindings/iio/dac/ad5755.txt          | 2 +-
>  drivers/dma/Kconfig                                           | 2 +-
>  drivers/gpu/drm/bridge/adv7511/Kconfig                        | 2 +-
>  drivers/gpu/drm/drm_fb_cma_helper.c                           | 2 +-
>  drivers/gpu/drm/tegra/fb.c                                    | 2 +-
>  drivers/iio/adc/ad7791.c                                      | 2 +-
>  drivers/iio/trigger/iio-trig-hrtimer.c                        | 2 +-
>  drivers/staging/iio/Documentation/overview.txt                | 2 +-
>  sound/isa/ad1816a/ad1816a.c                                   | 2 +-
>  sound/pci/ac97/ac97_patch.c                                   | 2 +-
>  sound/pci/hda/Kconfig                                         | 4 ++--
>  sound/soc/codecs/ad1980.c                                     | 2 +-
>  sound/soc/codecs/ad73311.c                                    | 2 +-
>  sound/soc/codecs/wm8782.c                                     | 2 +-
>  17 files changed, 20 insertions(+), 20 deletions(-)
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
