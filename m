Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 822E59B42EF
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 08:17:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 834F710E5BA;
	Tue, 29 Oct 2024 07:17:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="u6l8CiXx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11011025.outbound.protection.outlook.com [40.107.74.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C87210E5B8
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 07:17:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d3gNEF8vCxIvkdQwF/3abTSBwZeETiQzx643VFHpCtyP7TaeYyCO1FN8UWid1e5bkjMu3pabQsRZ3XLENeKEJGZj12fLZGBttsjMc7yNjxiIDGQI0UquOu9tVO8luMfX3bBMDTHRvdXE9naLbFiv13S7iLdJ4z4jeaFy6O/z3TPdUCM0t8xgmL7CnYBqkslfBC1WUxRG8Pey1b8efeboxKmbJ9u7WOA8MgMYbHf9SNGRG1+ovV2Agrt84iwv2vBFnvFGHga+JdBhAZ8WoG3J7y8P7HG9NQOJN3bsG5kcXW/LJT/qli7G8zJoKL6mqCJO37AzYeZkNKDB9wTCdTEEXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T/bp0fBZlLA+F4wB5ufg1Ka0LnNhaRHokPETr3quBPs=;
 b=LIUZx0k8l1SXUXYz3+RwqlVqFUR5PobCspiBCrfKoYhgpuLiHC/kBfdQXz5T5w42oh+ioAZXNP53muVfYtki74iuotiNqc1151XGC1fWoVYsGe0/mjg5sr/lodPvYVLusFqbnZFRlwGPr7ok7EwMl26IfCM8dImlWKE6n4NuX9Xa8w5SJzFjPczI2W9odmLuXUXfwlTWeheQy0l+akOpj0dUjRCFBoRpU34m2iQ0uIScFkTyjLAD0XJ3rZn2Rd1/Zrub8uS6kO/vkY0ZjxtgA4/QrC/ipaUwI0g5Hm7XrB/SumS3qYJwaG3BN0+DDgBtPiI3Ag1X32qqGGjRF35YNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T/bp0fBZlLA+F4wB5ufg1Ka0LnNhaRHokPETr3quBPs=;
 b=u6l8CiXxu9r+aCg4Qzn7sBxdKcn8kxdzmlGNUc/fJ5s3MRqA8OaLqy6/TfsPtwrAaYMuAaHGD4rgj6VWLQkrovDsIh4w/Ck1KhhHMLDZBfuEPoFOh0rmoJuPOP7Bnb43rLfOFlYQVX08PeBo93pw/AHhO6SA4bIPYp1sOZZV25I=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB10605.jpnprd01.prod.outlook.com (2603:1096:400:300::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Tue, 29 Oct
 2024 07:17:18 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%3]) with mapi id 15.20.8093.025; Tue, 29 Oct 2024
 07:17:18 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Liu Ying <victor.liu@nxp.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
CC: "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>, "rfoss@kernel.org"
 <rfoss@kernel.org>, laurent.pinchart <laurent.pinchart@ideasonboard.com>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>, "jernej.skrabec@gmail.com"
 <jernej.skrabec@gmail.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
 <mripard@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>, 
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "quic_jesszhan@quicinc.com" <quic_jesszhan@quicinc.com>, "mchehab@kernel.org"
 <mchehab@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de"
 <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will@kernel.org"
 <will@kernel.org>, "sakari.ailus@linux.intel.com"
 <sakari.ailus@linux.intel.com>, "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
 "tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>,
 "quic_bjorande@quicinc.com" <quic_bjorande@quicinc.com>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>, "arnd@arndb.de"
 <arnd@arndb.de>, "nfraprado@collabora.com" <nfraprado@collabora.com>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, "sam@ravnborg.org"
 <sam@ravnborg.org>, "marex@denx.de" <marex@denx.de>
Subject: RE: [PATCH v4 08/13] dt-bindings: display: Document dual-link LVDS
 display common properties
Thread-Topic: [PATCH v4 08/13] dt-bindings: display: Document dual-link LVDS
 display common properties
Thread-Index: AQHbKOKZPN4b66+xp0G7h8Y65TjgzbKdQo2AgAAK22CAAATsgIAAAEOw
Date: Tue, 29 Oct 2024 07:17:17 +0000
Message-ID: <TY3PR01MB1134610B42A1D3424D97B04CA864B2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20241028023740.19732-1-victor.liu@nxp.com>
 <20241028023740.19732-9-victor.liu@nxp.com>
 <01c1c4f3-1652-4b08-bd35-08b4e1c04c79@nxp.com>
 <TY3PR01MB11346805C5D524D264669D178864B2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <750920ae-36b9-47f5-84e9-779332739f86@nxp.com>
In-Reply-To: <750920ae-36b9-47f5-84e9-779332739f86@nxp.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB10605:EE_
x-ms-office365-filtering-correlation-id: 71fc44f5-f69b-4e8b-c191-08dcf7e9b8d6
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?a2xhNE5yMHpmbHZVVXpuenhwdjhaRXd5anB0bzBWRnRkeFZGc2c0WmR6MlRx?=
 =?utf-8?B?ZkQwSmdyR21TRndLcUF6MXZCMkhaWDEvZmVWQXY5OUswZzVqUGlTczNYcUFX?=
 =?utf-8?B?MVhqRFdLL3RuZ2U3cEdHZ0hWMGRPaFFjTm5NdzNUU2krRzQxdnAzandOUWgr?=
 =?utf-8?B?c0JHdzBsckNFc1hoTEIvb25lNllocDI5SzRZWHZCZ3dIb1FYb0pTclJ5T3E5?=
 =?utf-8?B?YWd1TWkyZDFtdlNxalZyM1hveVQzNXF3VUZVUWh5ZGpLM1I0T2hnQUxWeVhl?=
 =?utf-8?B?bjVaM2hqSFkrRGJGKzR4T3J6TnMzbUhiTVkyK3lDWXYrWnkzU2xLZ2xtb0FZ?=
 =?utf-8?B?Lzk5dStrT0tTakRZdW8vNHRYTUt4UTMyUTJnOHc0NndjNkp6djJ6MkVQZi96?=
 =?utf-8?B?aXU1MXJ2TUNjTEdDendPNWw5VWRvamRkSFoyeTFSNXhpTURUa0owaDBTT01S?=
 =?utf-8?B?QTRnYlhqMGhmSU9xYjJUTDhVV200YkNXazBwNklMRTBmVlc4a3FPREF1VmZw?=
 =?utf-8?B?QWF4dmpMTmt6R1hsWlpEcllzek96Q3J6bTFRdkJINE5JOUFlbkVpczZweU14?=
 =?utf-8?B?bmpSSnJidzhBZHBYOW5nYkJKOEkrZ1Jkd3VJcXNieHQyZnhkNjd1Rng1OVBa?=
 =?utf-8?B?WUpCM3ZmdG0zc2FSQ2FZLzcydlVrTUdVbFBUdldNdUhEOVBBMGNvNTA5b0ZH?=
 =?utf-8?B?djF0SWN6enBZSnhxakhNWXUrYXlZQkxIRGNRcnRKSlQ1a1ZuSi9LcVBZNmkz?=
 =?utf-8?B?dmpPQy9USTlVc1FpelFSL041eVN6RE5NVWZkbFpvRkZselcvS0RKQVpPOFVk?=
 =?utf-8?B?THp3NEtlVGpXQU9aY3Q4Vjl0TFFSVlhRZkljd2pKeG9mUlhnbXlJUC9lY3ox?=
 =?utf-8?B?c2plalhYSlluMEJXTE9zK3lxNnpuNEs4NE1FMDBsTFRqRWZaVlhuTkNMSHJr?=
 =?utf-8?B?dTBxLzVTZlIvdWtjajBaazJtQTdqZkwwK0NaZE1QRUxxMlBPYjJNbkdZN1Fj?=
 =?utf-8?B?cFprZzdCU3E0NGM3SlpqMDYxRWpCM1hYM05JSVVCS1BvaTZOdTdicXNxbkNG?=
 =?utf-8?B?UkpBanhDWUlPZ2ZmcXUvbERaOTZEV1I2Q2NLbDhsQzIxd0xGdWJDcnB5T3pr?=
 =?utf-8?B?b1RIc0pHOEdZbWJwTWZoSUdGdFMxUFQzSEEwNHlLTm4rR2V5ZW44WGxVcy9G?=
 =?utf-8?B?ZzhFVHVlWmQvcm9LdlMxaU01bjVQcTR3UHF4UDIwc2FLTFc5QjdlV0NtQ3lU?=
 =?utf-8?B?b3Naek1QaHRXbk8zUUE3dTVuc1NFSjB5Uk9Sa1FnbUZ1cGFBbzVDcWVVVDNN?=
 =?utf-8?B?ZVg0OHlUdHFCdFEwbTh6SDJXUHNYMVNSV21KaTBpYU1VK0trcE5ZMjhySlkv?=
 =?utf-8?B?ZHlLdzlwQ1JKNWpCbHo5MVZBOEVNVVkxS2ttMkE1ekN4Z1pwdE9YZzJhb2I0?=
 =?utf-8?B?WlM5NjMrY2p0WVpJTGZFbnlLWGI2azJGb2o0ZzhITkorMVBQMFA2eHNhYUlN?=
 =?utf-8?B?Zm9ydTFBaHM5VDhDWDg5NURiMGttOXRrMlQ0ektiVmNvRnd5NkRUaWIxUFJB?=
 =?utf-8?B?SXJhRWFpQms4Y0dUc050OThnNDREYWRiRDlCcnZ3WTAvZFczbEozZGNaYUUv?=
 =?utf-8?B?ZlZHd0M1TVZzbmhYZklnNTFmMERFVFpwTEtVd2hXUFN3TlNGOHVVS0xnMGFJ?=
 =?utf-8?B?OFZTR3lCejVEUTZFOEtDVGZrMUUySGtNdW1FZVBEOGRlYk95VlNIdUZuYU1X?=
 =?utf-8?Q?58VYuAVpdRerSXK+rq7MLBWhPfeJdCGUV+EePTe?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ampOdG9jUTZXUzVvdnQ2RWNhczJLNW02WDIrNEZXbFUwZFBqK1NaZWM5TkU2?=
 =?utf-8?B?TVFJZFlYSjBEdTNTU2JWRWI5MWxpRnMwZHBOM291bXRTeEk0bXN1eGc5K0RZ?=
 =?utf-8?B?QzBQUVhmNG43Vy8rZjhYcGZzWDhFbFR5MG1yYlNIZHhUaXFlbzZvZkc0d0gr?=
 =?utf-8?B?bFBRYjIzYUxLV1lwMmlySjNEUzBIOUpHei9pcEQzQmlSbWdVMERYaGxadk03?=
 =?utf-8?B?Yy8wWlJFc0x0bUhBL0FVWkdHbmtONjR4cmNuWUNaeXJ5MjMxK2JCQ3NPY05H?=
 =?utf-8?B?OTlKTjUrRU40cWZScldZZUNqdkNtdjY4WkN0ZnlVSERpYjRWY0xteXBpUVV0?=
 =?utf-8?B?dGwzck5Da2c0c0lGTlhvOWRDWG1LbE9hd28xQ1hhWWowcS9WenM2MzIrZ1RE?=
 =?utf-8?B?Z2tCUm9ZL2twTUdhMzNIK0o3ZThHN1UzcU5VWW11ek5IOWZESjFMMG50STVV?=
 =?utf-8?B?YkJiK3I4S1VLeGpyUkh2NnZBUGxnVG01eU5wR1pvRGQwdTFJZ3EvakpGaDMr?=
 =?utf-8?B?Y09Oa2VlV3VOZlVvVDMvbjRrWDFEOFV1elZhaVdFRHlEbVZUY2pOVjhxa1pw?=
 =?utf-8?B?b0JsNTJ4SHU1Vk5BazRHQlQ3Y2lkNENNcXJSRCtRaHpUSmVGekNYNjlsTWxV?=
 =?utf-8?B?RWZsT0tXc1RjYzZBTjc5T2h4MEoxUGZQRG9uV3BDY055NzBmblZGaVZkMWxY?=
 =?utf-8?B?NklKcVZ4Q3piWkdRcVp4VEZiZVZEVWV3dFhXVlNNZXI2aXpkRFNhMnJNdnVO?=
 =?utf-8?B?d3RzUituTVh1aWwvMmF1ZlM0Ni9vMGxha0dlTWUrWHl3bWdUcXNaWVhENjBS?=
 =?utf-8?B?Rk5oUmJSMkszbXYzTTVlMlVNYVRCWThKZm5tQlZuYjFzTmpCdkFFVzZlQlRU?=
 =?utf-8?B?OHpxRTV3dXN0bDR2eHprZmJrSlkyUTRjTElUbE5GRXk5clBHaWRuMDl3aGcx?=
 =?utf-8?B?OTJXbTVKYXdMY0ZoYTIwZ0paZEk2SHRnWVpjc2U2cC9sOUNxbDFpek12b2pQ?=
 =?utf-8?B?MXpFZ3UxbTlRdG5Eck8rNFMrdXRyUTkzQWNIb0E4SVhYQmZPVThOMWtBR2R6?=
 =?utf-8?B?U2srT3p0WHU5MzNtL01WM0lRWVMycUZJQjVpS25yWHdpaW9wb29CWU1iNmp0?=
 =?utf-8?B?WDd2TTRxbldWZkJlMkR4aFFZYkJsQmFBZnVLc1h5ZnpML1Vob1phbnNCTU5F?=
 =?utf-8?B?ODRlQjZJNWwxUkFybk9neVAzNFdiVDcvR1VqT2hmYjdnZjhiK2ExUHY2blR2?=
 =?utf-8?B?ZWcwT0VOa3huRmEzbUVDRkw0WnFkeVpiNndmcHJNdFN3cFV1YXJ1SjREbFly?=
 =?utf-8?B?VWp6WkxVYU5xNUJnbVRLK0tybFFzRkdsVVYxL2ZOSmV0dkRrQXJwcENvWEZE?=
 =?utf-8?B?ajd0Z1FkZkRoL2pRZTl4cG5nN1JrcTV5R0IrNmpvRjM4cllJS2NsRnNKd0U0?=
 =?utf-8?B?ZE5zemg5cXliVTIvWUg3WlZKbElXRnM4UXB5VVozVm9rc3ppRFBrbTBGMG92?=
 =?utf-8?B?VnJMejB5QXpGbHU5TFNrSGJVeTZOSHh6MVdmSTFDSUV2cjNGb01lZDFSd2t4?=
 =?utf-8?B?RXJIM1pwRGR1cVIvS1NMR09wMHMyV1VQZmZBdEhBbXZxdDRZc3M3V1A2VC9p?=
 =?utf-8?B?a1hmVS9idDQ5dHY3Z2JyQStwemdQZzBBZlk5UlUvc2ZMMEFaMmxpdUUzSHA0?=
 =?utf-8?B?M2JXU3puejI3MVZuMUorNGVrcWM3WGxyQXhNcTBnZGI3ZGJFNWFwSXp1WDdv?=
 =?utf-8?B?cTFiVUZIR3Y5NGExTnhnRFdDYjgzVTJFaExqQ09rcDZFbFF4MVRSVFE3NCt3?=
 =?utf-8?B?bHdVTHV6NTYzY01ZS2hORW5tWFFJMDhSRWNsczRUajkxamYycUpYSHdpclEy?=
 =?utf-8?B?aFZidWxlanl4dHJDdHhmdnQ3K1JXZU1LM3NGMkQzU2kzc2s4WHhWbHQ0TmNF?=
 =?utf-8?B?ejg0Z1I4Y09qaGFTcDZsRThnb1RBK1Bsa2lhZlRubm40UWYyVnBJaUtCKzFC?=
 =?utf-8?B?YkFyeFhOQ3N3N0FLR05SOVUybHNjdTFxeUJxZ3pIQTFZZGxHZWdoMmNWWEJz?=
 =?utf-8?B?SW5IRlNWRnBEVTJEOUJBTHpOeGl3OTZoVDdoSkJQc3VMSjlMcGZpaWlmVzJK?=
 =?utf-8?B?eFpyTUVrbVRZYUtPMTlGRnVuWTdTM2cwbnI0eGFvVXZoUGlLcTl3UHBNWXVj?=
 =?utf-8?B?eEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71fc44f5-f69b-4e8b-c191-08dcf7e9b8d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2024 07:17:18.0272 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gpRlWZJ/QMe4y2SkKguyx9vJQ+L0L08AzAKHaHp46dSdYbgwYlKOL/ixkXo1aXSrnI9EyOyon0Ea7y+DbJrTewFScRiES56uLFM3cr+0uQg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10605
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

SGkgTGl1IFlpbmcsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGl1
IFlpbmcgPHZpY3Rvci5saXVAbnhwLmNvbT4NCj4gU2VudDogMjkgT2N0b2JlciAyMDI0IDA3OjEz
DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjQgMDgvMTNdIGR0LWJpbmRpbmdzOiBkaXNwbGF5OiBE
b2N1bWVudCBkdWFsLWxpbmsgTFZEUyBkaXNwbGF5IGNvbW1vbiBwcm9wZXJ0aWVzDQo+IA0KPiBP
biAxMC8yOS8yMDI0LCBCaWp1IERhcyB3cm90ZToNCj4gPiBIaSBMaXUgWWluZywNCj4gDQo+IEhp
IEJpanUsDQo+IA0KPiA+DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZy
b206IExpdSBZaW5nIDx2aWN0b3IubGl1QG54cC5jb20+DQo+ID4+IFNlbnQ6IDI5IE9jdG9iZXIg
MjAyNCAwNjoxNw0KPiA+PiBTdWJqZWN0OiBSZTogW1BBVENIIHY0IDA4LzEzXSBkdC1iaW5kaW5n
czogZGlzcGxheTogRG9jdW1lbnQNCj4gPj4gZHVhbC1saW5rIExWRFMgZGlzcGxheSBjb21tb24g
cHJvcGVydGllcw0KPiA+Pg0KPiA+PiBPbiAxMC8yOC8yMDI0LCBMaXUgWWluZyB3cm90ZToNCj4g
Pj4+IER1YWwtbGluayBMVkRTIGRpc3BsYXlzIHJlY2VpdmUgb2RkIHBpeGVscyBhbmQgZXZlbiBw
aXhlbHMNCj4gPj4+IHNlcGFyYXRlbHkgZnJvbSBkdWFsIExWRFMgbGlua3MuICBPbmUgbGluayBy
ZWNlaXZlcyBvZGQgcGl4ZWxzIGFuZA0KPiA+Pj4gdGhlIG90aGVyIHJlY2VpdmVzIGV2ZW4gcGl4
ZWxzLiAgU29tZSBvZiB0aG9zZSBkaXNwbGF5cyBtYXkgYWxzbyB1c2UNCj4gPj4+IG9ubHkgb25l
IExWRFMgbGluayB0byByZWNlaXZlIGFsbCBwaXhlbHMsIGJlaW5nIG9kZCBhbmQgZXZlbiBhZ25v
c3RpYy4NCj4gPj4+IERvY3VtZW50IGNvbW1vbiBwcm9wZXJ0aWVzIGZvciB0aG9zZSBkaXNwbGF5
cyBieSBleHRlbmRpbmcgTFZEUw0KPiA+Pj4gZGlzcGxheSBjb21tb24gcHJvcGVydGllcyBkZWZp
bmVkIGluIGx2ZHMueWFtbC4NCj4gPj4+DQo+ID4+PiBTdWdnZXN0ZWQtYnk6IERtaXRyeSBCYXJ5
c2hrb3YgPGRtaXRyeS5iYXJ5c2hrb3ZAbGluYXJvLm9yZz4NCj4gPj4+IFNpZ25lZC1vZmYtYnk6
IExpdSBZaW5nIDx2aWN0b3IubGl1QG54cC5jb20+DQo+ID4+PiAtLS0NCj4gPj4+IHY0Og0KPiA+
Pj4gKiBTcXVhc2ggY2hhbmdlIGZvciBhZHZhbnRlY2gsaWRrLTIxMjF3ci55YW1sIGFuZA0KPiA+
Pj4gICBwYW5lbC1zaW1wbGUtbHZkcy1kdWFsLXBvcnRzLnlhbWwgd2l0aCBsdmRzLWR1YWwtcG9y
dHMueWFtbC4NCj4gPj4+IChSb2IpDQo+ID4+PiAqIEltcHJvdmUgZGVzY3JpcHRpb24gaW4gbHZk
cy1kdWFsLXBvcnRzLnlhbWwuICAoS3J6eXN6dG9mKQ0KPiA+Pj4NCj4gPj4+IHYzOg0KPiA+Pj4g
KiBOZXcgcGF0Y2guICAoRG1pdHJ5KQ0KPiA+Pj4NCj4gPj4+ICAuLi4vYmluZGluZ3MvZGlzcGxh
eS9sdmRzLWR1YWwtcG9ydHMueWFtbCAgICAgfCA3NiArKysrKysrKysrKysrKysrKysrDQo+ID4+
PiAgLi4uL2Rpc3BsYXkvcGFuZWwvYWR2YW50ZWNoLGlkay0yMTIxd3IueWFtbCAgIHwgMTQgKy0t
LQ0KPiA+Pj4gIC4uLi9wYW5lbC9wYW5lbC1zaW1wbGUtbHZkcy1kdWFsLXBvcnRzLnlhbWwgICB8
IDIwICstLS0tDQo+ID4+PiAgMyBmaWxlcyBjaGFuZ2VkLCA3OCBpbnNlcnRpb25zKCspLCAzMiBk
ZWxldGlvbnMoLSkgIGNyZWF0ZSBtb2RlDQo+ID4+PiAxMDA2NDQNCj4gPj4+IERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2x2ZHMtZHVhbC1wb3J0cy55YW1sDQo+ID4+
Pg0KPiA+Pj4gZGlmZiAtLWdpdA0KPiA+Pj4gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZGlzcGxheS9sdmRzLWR1YWwtcG9ydHMueWFtbA0KPiA+Pj4gYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9sdmRzLWR1YWwtcG9ydHMueWFtbA0KPiA+Pj4g
bmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uNWY3YTMwNjQw
NDA0DQo+ID4+PiAtLS0gL2Rldi9udWxsDQo+ID4+PiArKysgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZGlzcGxheS9sdmRzLWR1YWwtcG9ydHMueWFtbA0KPiA+Pj4gQEAgLTAs
MCArMSw3NiBAQA0KPiA+Pj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9u
bHkgT1IgQlNELTItQ2xhdXNlKSAlWUFNTCAxLjINCj4gPj4+ICstLS0NCj4gPj4+ICskaWQ6IGh0
dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2Rpc3BsYXkvbHZkcy1kdWFsLXBvcnRzLnlhbWwj
DQo+ID4+PiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3Jl
LnlhbWwjDQo+ID4+PiArDQo+ID4+PiArdGl0bGU6IER1YWwtbGluayBMVkRTIERpc3BsYXkgQ29t
bW9uIFByb3BlcnRpZXMNCj4gPj4+ICsNCj4gPj4+ICttYWludGFpbmVyczoNCj4gPj4+ICsgIC0g
TGl1IFlpbmcgPHZpY3Rvci5saXVAbnhwLmNvbT4NCj4gPj4+ICsNCj4gPj4+ICtkZXNjcmlwdGlv
bjogfA0KPiA+Pj4gKyAgQ29tbW9uIHByb3BlcnRpZXMgZm9yIExWRFMgZGlzcGxheXMgd2l0aCBk
dWFsIExWRFMgbGlua3MuIEV4dGVuZA0KPiA+Pj4gK0xWRFMgZGlzcGxheQ0KPiA+Pj4gKyAgY29t
bW9uIHByb3BlcnRpZXMgZGVmaW5lZCBpbiBsdmRzLnlhbWwuDQo+ID4+PiArDQo+ID4+PiArICBE
dWFsLWxpbmsgTFZEUyBkaXNwbGF5cyByZWNlaXZlIG9kZCBwaXhlbHMgYW5kIGV2ZW4gcGl4ZWxz
DQo+ID4+PiArIHNlcGFyYXRlbHkgZnJvbSAgdGhlIGR1YWwgTFZEUyBsaW5rcy4gT25lIGxpbmsg
cmVjZWl2ZXMgb2RkIHBpeGVscw0KPiA+Pj4gKyBhbmQgdGhlIG90aGVyIHJlY2VpdmVzICBldmVu
IHBpeGVscy4gU29tZSBvZiB0aG9zZSBkaXNwbGF5cyBtYXkNCj4gPj4+ICsgYWxzbyB1c2Ugb25s
eSBvbmUgTFZEUyBsaW5rIHRvICByZWNlaXZlIGFsbCBwaXhlbHMsIGJlaW5nIG9kZCBhbmQgZXZl
biBhZ25vc3RpYy4NCj4gPj4+ICsNCj4gPj4+ICthbGxPZjoNCj4gPj4+ICsgIC0gJHJlZjogbHZk
cy55YW1sIw0KPiA+Pj4gKw0KPiA+Pj4gK3Byb3BlcnRpZXM6DQo+ID4+PiArICBwb3J0czoNCj4g
Pj4+ICsgICAgJHJlZjogL3NjaGVtYXMvZ3JhcGgueWFtbCMvcHJvcGVydGllcy9wb3J0cw0KPiA+
Pj4gKw0KPiA+Pj4gKyAgICBwcm9wZXJ0aWVzOg0KPiA+Pj4gKyAgICAgIHBvcnRAMDoNCj4gPj4+
ICsgICAgICAgICRyZWY6IC9zY2hlbWFzL2dyYXBoLnlhbWwjLyRkZWZzL3BvcnQtYmFzZQ0KPiA+
Pj4gKyAgICAgICAgdW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZQ0KPiA+Pj4gKyAgICAgICAg
ZGVzY3JpcHRpb246IHRoZSBmaXJzdCBMVkRTIGlucHV0IGxpbmsNCj4gPj4+ICsNCj4gPj4+ICsg
ICAgICAgIHByb3BlcnRpZXM6DQo+ID4+PiArICAgICAgICAgIGR1YWwtbHZkcy1vZGQtcGl4ZWxz
Og0KPiA+Pj4gKyAgICAgICAgICAgIHR5cGU6IGJvb2xlYW4NCj4gPj4+ICsgICAgICAgICAgICBk
ZXNjcmlwdGlvbjogdGhlIGZpcnN0IExWRFMgaW5wdXQgbGluayBmb3Igb2RkIHBpeGVscw0KPiA+
Pj4gKw0KPiA+Pj4gKyAgICAgICAgICBkdWFsLWx2ZHMtZXZlbi1waXhlbHM6DQo+ID4+PiArICAg
ICAgICAgICAgdHlwZTogYm9vbGVhbg0KPiA+Pj4gKyAgICAgICAgICAgIGRlc2NyaXB0aW9uOiB0
aGUgZmlyc3QgTFZEUyBpbnB1dCBsaW5rIGZvciBldmVuIHBpeGVscw0KPiA+Pj4gKw0KPiA+Pj4g
KyAgICAgICAgb25lT2Y6DQo+ID4+PiArICAgICAgICAgIC0gcmVxdWlyZWQ6IFtkdWFsLWx2ZHMt
b2RkLXBpeGVsc10NCj4gPj4+ICsgICAgICAgICAgLSByZXF1aXJlZDogW2R1YWwtbHZkcy1ldmVu
LXBpeGVsc10NCj4gPj4+ICsgICAgICAgICAgLSBwcm9wZXJ0aWVzOg0KPiA+Pj4gKyAgICAgICAg
ICAgICAgZHVhbC1sdmRzLW9kZC1waXhlbHM6IGZhbHNlDQo+ID4+PiArICAgICAgICAgICAgICBk
dWFsLWx2ZHMtZXZlbi1waXhlbHM6IGZhbHNlDQo+ID4+PiArDQo+ID4+PiArICAgICAgcG9ydEAx
Og0KPiA+Pj4gKyAgICAgICAgJHJlZjogL3NjaGVtYXMvZ3JhcGgueWFtbCMvJGRlZnMvcG9ydC1i
YXNlDQo+ID4+PiArICAgICAgICB1bmV2YWx1YXRlZFByb3BlcnRpZXM6IGZhbHNlDQo+ID4+PiAr
ICAgICAgICBkZXNjcmlwdGlvbjogdGhlIHNlY29uZCBMVkRTIGlucHV0IGxpbmsNCj4gPj4+ICsN
Cj4gPj4+ICsgICAgICAgIHByb3BlcnRpZXM6DQo+ID4+PiArICAgICAgICAgIGR1YWwtbHZkcy1v
ZGQtcGl4ZWxzOg0KPiA+Pj4gKyAgICAgICAgICAgIHR5cGU6IGJvb2xlYW4NCj4gPj4+ICsgICAg
ICAgICAgICBkZXNjcmlwdGlvbjogdGhlIHNlY29uZCBMVkRTIGlucHV0IGxpbmsgZm9yIG9kZCBw
aXhlbHMNCj4gPj4+ICsNCj4gPj4+ICsgICAgICAgICAgZHVhbC1sdmRzLWV2ZW4tcGl4ZWxzOg0K
PiA+Pj4gKyAgICAgICAgICAgIHR5cGU6IGJvb2xlYW4NCj4gPj4+ICsgICAgICAgICAgICBkZXNj
cmlwdGlvbjogdGhlIHNlY29uZCBMVkRTIGlucHV0IGxpbmsgZm9yIGV2ZW4gcGl4ZWxzDQo+ID4+
PiArDQo+ID4+PiArICAgICAgICBvbmVPZjoNCj4gPj4+ICsgICAgICAgICAgLSByZXF1aXJlZDog
W2R1YWwtbHZkcy1vZGQtcGl4ZWxzXQ0KPiA+Pj4gKyAgICAgICAgICAtIHJlcXVpcmVkOiBbZHVh
bC1sdmRzLWV2ZW4tcGl4ZWxzXQ0KPiA+Pj4gKyAgICAgICAgICAtIHByb3BlcnRpZXM6DQo+ID4+
PiArICAgICAgICAgICAgICBkdWFsLWx2ZHMtb2RkLXBpeGVsczogZmFsc2UNCj4gPj4+ICsgICAg
ICAgICAgICAgIGR1YWwtbHZkcy1ldmVuLXBpeGVsczogZmFsc2UNCj4gPj4NCj4gPj4gSG1tLCBJ
IHNob3VsZCByZXF1aXJlIHBvcnRAMCBvciBwb3J0QDEuDQo+ID4NCj4gPiBGb3IgZHVhbCBMVkRT
LCB5b3UgbmVlZCAzIHBvcnRzIGFzIGNvbW1vbiB1c2UgY2FzZQ0KPiANCj4gRm9yIExWRFMgcGFu
ZWxzLCBvbmx5IHR3byBwb3J0cyBmb3IgTFZEUyBzaW5rIGFyZSBuZWVkZWQuDQo+IEZvciBkaXNw
bGF5IGJyaWRnZXMgd2l0aCBMVkRTIHNpbmssIG9uZSBhZGRpdGlvbmFsIG91dHB1dCBwb3J0IGlz
IG5lZWRlZC4gIEhvd2V2ZXIsIEknbSBub3Qgc3VyZSBpZg0KPiB0aGlzIG91dHB1dCBwb3J0IHNo
b3VsZCBiZSBkb2N1bWVudGVkIGluIHRoaXMgYmluZGluZyBvciBub3QsIGJlY2F1c2UgaXQgZG9l
c24ndCBsb29rIGNvbW1vbiBlbm91Z2gNCj4gY29uc2lkZXJpbmcgdGhlIExWRFMgcGFuZWxzLg0K
PiANCj4gPg0KPiA+IDIgaW5wdXQgcG9ydHMgYW5kIDEgb3V0cG9ydCBhbmQgYWxsIGFyZSByZXF1
aXJlZCBwcm9wZXJ0aWVzLg0KPiANCj4gVGhlIG91dHB1dCBwb3J0IGNhbm5vdCBiZSByZXF1aXJl
ZCBmb3IgTFZEUyBwYW5lbHMgYXQgbGVhc3QuDQoNCkFjay4NCg0KPiANCj4gV2UgbmVlZCB0byBy
ZXF1aXJlIG9uZSBvciB0d28gaW5wdXQgcG9ydHMsIGJlY2F1c2UgSVQ2MjYzIG1heSB1c2Ugb25l
IExWRFMgbGluayBvciB0d28uDQoNClRoaXMgcGF0Y2ggaXMgZm9yIGdlbmVyaWMgZHVhbCBsaW5r
IGNvbW1vbiBjYXNlcyBhbmQgaXMgbm90IGFwcGxpY2FibGUgZm9yIElUNjI2MyBzaW5nbGUgbGlu
ayBjYXNlLg0KDQoNCkNoZWVycywNCkJpanUNCg0KPiANCj4gPg0KPiA+IENoZWVycywNCj4gPiBC
aWp1DQo+ID4NCj4gPj4gV2lsbCB3YWl0IGEgd2hpbGUgZm9yIGNvbW1lbnRzIGFuZCBhZGQgdGhp
cyBpbiBuZXh0IHZlcnNpb24uDQo+ID4+DQo+ID4+IC0tODwtLQ0KPiA+PiAgICAgYW55T2Y6DQo+
ID4+ICAgICAgIC0gcmVxdWlyZWQ6DQo+ID4+ICAgICAgICAgICAtIHBvcnRAMA0KPiA+PiAgICAg
ICAtIHJlcXVpcmVkOg0KPiA+PiAgICAgICAgICAgLSBwb3J0QDENCj4gPj4gLS04PC0tDQo+ID4+
DQo+ID4+PiArDQo+ID4+PiArcmVxdWlyZWQ6DQo+ID4+PiArICAtIHBvcnRzDQo+ID4+PiArDQo+
ID4+PiArYWRkaXRpb25hbFByb3BlcnRpZXM6IHRydWUNCj4gPj4+ICsNCj4gPj4+ICsuLi4NCj4g
Pj4NCj4gPj4gWy4uLl0NCj4gPj4NCj4gPj4gLS0NCj4gPj4gUmVnYXJkcywNCj4gPj4gTGl1IFlp
bmcNCj4gPg0KPiANCj4gLS0NCj4gUmVnYXJkcywNCj4gTGl1IFlpbmcNCg0K
