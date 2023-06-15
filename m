Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 395A1730EDB
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 07:52:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 910BE10E00F;
	Thu, 15 Jun 2023 05:52:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC32510E00F
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 05:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1686808361; x=1718344361;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=C7aF0yWfV1s1VE1VWExjYLax2b0knlBo4p9+gKyeABY=;
 b=Uwk4LDR1kiUI0NdcPyRpVKIkkXkgQVstn6gSJkSPQwSTjhLm4iPrBpjK
 yV2IkzrPrlL0R0BezoWTWevFDDLHk6Uojv7MvP1lbnzAjIMDTER3qWQb8
 p9T6Sam5Y28/YhtpRmsIyrCHb9DAFNfghdKbA45Fc6J1Nv+10rIxTobxw
 7IlFJF+jWvXDQXaq3rCbs9h4xKQzWQdsVln7KEzRKvbKxRmRBxnkyTxZV
 Ssmro1qfNeA9WT0S9fJ14H18PRXgcpHP350/7Wq5CwiZ9gNHadsouOxty
 ZcbMHJLt5TI2aQ43q+L67nvVIJTYVYLa5pXrzdZloF2GZUJQeiUsyW1HV A==;
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; d="scan'208";a="217955968"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 14 Jun 2023 22:52:40 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 14 Jun 2023 22:52:33 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Wed, 14 Jun 2023 22:52:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c+akLWvHGV9Eplo3ptX18v1E/h67Y41HMci42yK9Jikv1zhksUZSIy6le7CLi3BpsL0jGcSr0nTCXiyYyfycYZbRXLHXkNgXFzUWCPWVoq99JkB1tBXR01oh5+lf08Wb5wvoLi8EAzI0fyVcR+4FQS8Ck/iDkrKAULYW6nTL39I+WhNipwei3TgHXBYio6rShazHy3jEeCs5pLbw9e01xTLqXlSqQ2rSzJ+b9wIUo0+UF4ut0xpG1N+D7PfpPTca/ElrEJwc3mPG8FIcEei4JC+OG2EwKpkYxl7/eqPPf7Xi5iWt60iFetVKry0dHMvljdDMPssrwRDClbPo/bibHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C7aF0yWfV1s1VE1VWExjYLax2b0knlBo4p9+gKyeABY=;
 b=Wn5RtAfPoVOHwxdxkh+yj0eo2zWxGvwch9nBXgXUS36H0MOGgQ87Mv5IxgLGUCWBBeUuBBhZZRBUZvROyqTw8C9LBmz/m4OLKuBiCAw08IrRfWO82BVW6w6tSJrWuvJ3axcWxxJ4lL9UmMs1aJ5ehXM2pNVYynjlK3CCWxAv4t3yPyV6blYiXK8hrrgf24a2jKoAaKVk0MHMA3zfSS3Ugdzmn4+v2q1YfMZxkatv9F1QLBpoaPQhA6Rn4ivfB6ERHXLhAAWNf9fHQ5J57XTSBdT37JgJ4HfnuRmkUL25rld5AB99w2q6HgF92aPndRrZkEx43rOS889DEY5dn4/EmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C7aF0yWfV1s1VE1VWExjYLax2b0knlBo4p9+gKyeABY=;
 b=vYhCajh6lb5N5tBpc1VnAtl8fziK95uxtfyvTeyf2qmqJBgCl2ixeJ9ydddC9jPv2pFYs7eaYKeIYUzXpdc9lQ6lz1uhtOQrLH3VkxSoN++Eni1QxS7sNpPewxvty1RivGnzAjMjdsLpWQ08+ELhhrYAicHlqiF8DfuFTsuLyR8=
Received: from IA1PR11MB6193.namprd11.prod.outlook.com (2603:10b6:208:3eb::19)
 by MW4PR11MB7077.namprd11.prod.outlook.com (2603:10b6:303:223::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.26; Thu, 15 Jun
 2023 05:52:31 +0000
Received: from IA1PR11MB6193.namprd11.prod.outlook.com
 ([fe80::fae1:9490:ead6:1009]) by IA1PR11MB6193.namprd11.prod.outlook.com
 ([fe80::fae1:9490:ead6:1009%4]) with mapi id 15.20.6477.028; Thu, 15 Jun 2023
 05:52:31 +0000
From: <Manikandan.M@microchip.com>
To: <Claudiu.Beznea@microchip.com>, <lee@kernel.org>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
 <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <sam@ravnborg.org>, <bbrezillon@kernel.org>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 5/9] drm: atmel-hlcdc: add compatible string check for
 XLCDC and HLCDC
Thread-Topic: [PATCH 5/9] drm: atmel-hlcdc: add compatible string check for
 XLCDC and HLCDC
Thread-Index: AQHZncWR2rtrJdjaJEKmZ/pOm5WbTq+J3RiAgAGCgQA=
Date: Thu, 15 Jun 2023 05:52:31 +0000
Message-ID: <c86e30d4-5c62-1446-035c-1f155b482d0e@microchip.com>
References: <20230613070426.467389-1-manikandan.m@microchip.com>
 <20230613070426.467389-6-manikandan.m@microchip.com>
 <f0797746-ee52-582f-48c8-e6497426a7d6@microchip.com>
In-Reply-To: <f0797746-ee52-582f-48c8-e6497426a7d6@microchip.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6193:EE_|MW4PR11MB7077:EE_
x-ms-office365-filtering-correlation-id: 467745ad-941f-4ea4-41b3-08db6d64b57e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IBEW70U5QxuspkwT3LdsXRA8qb+u0thhHCpELb7xxU/J9Z4DhwX+SBJafjbZt5JrYGoFC10Gj3Kx87AdmLs7y8JyGkU4RNy0hZlkIOL0S/H9YPrL6OVsIU0I0prevCeUYDJD0Ig1YXf7cx4gGs0PzO2Ahcn7XzQMn5ci1o1XJwrXRX0+lEl1V1g4UHMTL30dFLO7hVEPkgSKRBv/Ixo8KCwXxEmf6aV+UAuC+z59QVQOMsrMR+WjbM+v7+PhjC27W1AMZQZZxgPDrAGfyz5Lc8htx2wPe9/uBt9st7BXIT5qnZT7bL8eG7xkU7fgelF7cLOL+nRHgCD/mS5oxqmLUonOrVmEBz0oeKumArUuR55otmyNkigr9GQBaIBt+MWYTTcucrf310oS0E/4slsVViThLUteLHIvDzv+Bdnxcimr+cjduzKixPxlYrUSSj1KxFMQ9YwtFLPn2OZSu9Qvj4eePcKVbyPcA/eNflhQDfn79a2mSTAVufMko2oJXSMn/TUUS6NcSPlBqnyngv6bk7fk/ownwSJ2PoEek7GIpcrHUwChgrmpX9pJSD8TzBUMB7g56cPZWkF4Y9Y9+Gx+9uUKyvtbYXzvKv1KphLo0DTrowy6qelf9jMLegG81s+lPuBGhEsWM+zO0z8o2d5W99obiUYez+vSrmV4pZ4YEec=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6193.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(396003)(366004)(136003)(346002)(39860400002)(451199021)(2906002)(41300700001)(7416002)(5660300002)(38070700005)(8936002)(8676002)(36756003)(86362001)(31696002)(71200400001)(6486002)(107886003)(478600001)(83380400001)(186003)(26005)(6512007)(6506007)(53546011)(64756008)(66556008)(2616005)(31686004)(66446008)(66476007)(66946007)(76116006)(91956017)(921005)(4326008)(122000001)(110136005)(38100700002)(54906003)(316002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OENNTU5uNXhHTm5GcnhUNW5QSUovRGJ5YkhxMVUyS1VUdEFFNDMyT0ZFRUJz?=
 =?utf-8?B?blpwWDRtTjFTZDVRenJ0MHFJYUZqRjdsNTcxM2lCL2dQSHpKRGpLNHg0SERD?=
 =?utf-8?B?b3QwN2lIUkVDaFdabjBrQS9sZWRZMnNjd2xDZndFVEpiL21pdHJibDRBQnpV?=
 =?utf-8?B?TVZEQnUxSXZvQzdPcGFkeFl4aU9DZkpFa2V0N1hDaEpzb1ZhRlFrUHJid0VN?=
 =?utf-8?B?MHdvUnBiWHNYelNGRVJ0Z1lqRnhYcUlPclc4Tk5qVG13eE1PZlpGeWwzYUhr?=
 =?utf-8?B?d1hGbld6VWF4dlcySlhOZW9Vdk1GbUdNbkZOUXl0a1FuZktRSHlSQzE0WGIw?=
 =?utf-8?B?d01ZNDF3TzkxQktoQ2Z4TUU4bml5MUk0YUR1RDFlRlVCQ3ZYN2gvc2k3YzVS?=
 =?utf-8?B?dElEaFF0eDN1aTdkb25QU1gwTTUyemM2eXVaMlJmSzRQaUd5K2NRSWM3Z0Ur?=
 =?utf-8?B?bU53eWpQUTRVbkZDSStDbWpXaGxSZ2x1VkVVbVRqSXkxamhVMFBUTmNDbnpm?=
 =?utf-8?B?eFVLcFRzSTh5djM3MnVKRExmWXRJOXBLVEh5aHlyT3daOERnV3JYbWgzTzJH?=
 =?utf-8?B?REw5aHUrNEJ3UmlFNTNQUGxudjN0SU8vOXlSRTFKY1VGaHJqdjNaYjFocW01?=
 =?utf-8?B?czJkQXlxTFRrYTR2aHB6bmoyKzNMZ0JGbmkwcDVPT3d3bkpzTFdKMGc1Wkhh?=
 =?utf-8?B?RVB5QkJxdGVENFR4djhEUlRIcGczV3Z0WmZtZlcrTVFsRWZ2SzRqcDdvUWUw?=
 =?utf-8?B?WUJiRkgyeGJNaTFIQlZmUlNZc3IvVytOTEp1TGhuWVNrajkvZE1Da2NnQnJn?=
 =?utf-8?B?ejdHQU9vZ3NXNUpEMU1icE9xVllFUHM2MXpmOSt2ZE1uUm9yZkNjSndEb1NY?=
 =?utf-8?B?TzE4MUMxUmJVc29wc1k2cURjd1ZVcmkvdlZLaUtLMUluOWxaVzZBM3J3RjU3?=
 =?utf-8?B?OXkza1F4OVB0VnFabDNsQXV2cVNXK1FCbFBNYUtud01oWWE2amNNS0EyQitr?=
 =?utf-8?B?cDJWTFYwdXREU3dGaW9qRE9hNm51Skx6bFVoQjdZRkY0QWpiNzV4MkdTcDAr?=
 =?utf-8?B?RlBOMlI0a2VlSzVJeWZ3cEhJeXF3QTFpK1R4SGV2LzZZQmpsNXBDRE5PMXF1?=
 =?utf-8?B?dnVZQ29CRWRxWGNLNUpCdTM2QmpHKytHU2VuRURmNkptQXRtZUM0em9vRUhj?=
 =?utf-8?B?alZRTzhqZUNZNmNINmJSOHR4VEtTQUI3T0kzWDdsSlBaRTdISEhUbDhKeWN2?=
 =?utf-8?B?cmJrYUM0dGxhVUMvMXdwQmo5VVFka3lzT3dZUGVnc0wzelNteGFJNEFKNk9w?=
 =?utf-8?B?d2RiZkI1QjNFbFY5UDErbkNEM0svK1FtZ1Z5eDNWL3V5ZFRCNDE3UUdObGVv?=
 =?utf-8?B?M0JLOFIrcmV2WFVXYjB0YzNVbkQyVHpWTmVLTFJGeTdoMXlscERJNUNPMTJm?=
 =?utf-8?B?SDIrVEQ3b0hscXo5QjBibVozQklVNFhqSW1kNmlmTDRIS2FTaE15cXUzWEdp?=
 =?utf-8?B?ZUN1cGgyZkI3MVJURVJpMkFTUGxMTkdsb0s1TDJIMEllL012RG1Wak55Wk91?=
 =?utf-8?B?amFOVDNPd0plM2YzdkM0TWJucklpcytDTUliRFhNc1dodWJsaGRacHQydUND?=
 =?utf-8?B?aFJsd09xZ2FCUytRYlVCbzR4TWdrM09SSkdGbko4RTJSMm02U1ZVNW9BWVdM?=
 =?utf-8?B?eWhZTGRDRXhGYVJrNUdsSnBtRWVtem1pVWZmSlZOMTlFMk5YbGtBbmRVNEtZ?=
 =?utf-8?B?YXFxRk1XV29YOG41NFgvM25mYWtodTdKb1B2eEYxeUtCUWFHVVo1WWZXeWRB?=
 =?utf-8?B?eXB6MUJtMEhVUnRuZEVndkhlaGt5SWdFTWFRTlUvb25qeVFkVHN2c1VQaWNM?=
 =?utf-8?B?UXN2UmQ2ODdRRWdMY0lpc1UwR1ZOK010ek43YnN4MG01eENOV1AzSHFpbjIy?=
 =?utf-8?B?ejNoSDJqSVNjdGVQbnFHSUJwT2huWDZxenRheWNudWtQd2MvUWRCRU4wSjlI?=
 =?utf-8?B?Sk1VekpkalhGRWJLdlhPT2ZXQVJOVy9Ta2pPOU55emx1M2RtOE9UL3BTeTBL?=
 =?utf-8?B?YlJLajkvbVl6bVBHcXJZaDVmVE92VmV5bjFCVWNGY3ZOR0IvaEYzemZ0a2N6?=
 =?utf-8?Q?TcnPnnkcF48uIh3J2ZmThNE3+?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6381083E74C32F41B9B972FF04B67E52@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6193.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 467745ad-941f-4ea4-41b3-08db6d64b57e
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2023 05:52:31.1874 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7wnb+9HAsTuCWTLhkoWbfYGV8h6g5MFQ6XzBsd7jwRnZOx8K9ZMVSW2BSeIqrtqAmjoO4jIKcCkxftBvZ+Bxa48R76t6ralKgJwzaU6v4Pc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7077
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
Cc: Balakrishnan.S@microchip.com, Nayabbasha.Sayed@microchip.com,
 Balamanikandan.Gunasundar@microchip.com, Varshini.Rajendran@microchip.com,
 Dharma.B@microchip.com, Durai.ManickamKR@microchip.com,
 Hari.PrasathGE@microchip.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTQvMDYvMjMgMTI6MTksIENsYXVkaXUgQmV6bmVhIC0gTTE4MDYzIHdyb3RlOg0KPiBPbiAx
My4wNi4yMDIzIDEwOjA0LCBNYW5pa2FuZGFuIE11cmFsaWRoYXJhbiB3cm90ZToNCj4+IEZyb206
IER1cmFpIE1hbmlja2FtIEtSIDxkdXJhaS5tYW5pY2thbWtyQG1pY3JvY2hpcC5jb20+DQo+Pg0K
Pj4gQWRkIGNvbXBhdGlibGUgc3RyaW5nIGNoZWNrIHRvIGRpZmZlcmVudGlhdGUgWExDREMgYW5k
IEhMQ0RDIGNvZGUNCj4+IHdpdGhpbiB0aGUgYXRtZWwtaGxjZGMgZHJpdmVyIGZpbGVzLg0KPj4N
Cj4+IFNpZ25lZC1vZmYtYnk6IER1cmFpIE1hbmlja2FtIEtSIDxkdXJhaS5tYW5pY2thbWtyQG1p
Y3JvY2hpcC5jb20+DQo+PiBTaWduZWQtb2ZmLWJ5OiBNYW5pa2FuZGFuIE11cmFsaWRoYXJhbiA8
bWFuaWthbmRhbi5tQG1pY3JvY2hpcC5jb20+DQo+PiAtLS0NCj4+ICAgZHJpdmVycy9ncHUvZHJt
L2F0bWVsLWhsY2RjL2F0bWVsX2hsY2RjX2RjLmMgfCA3ICsrKysrKysNCj4+ICAgZHJpdmVycy9n
cHUvZHJtL2F0bWVsLWhsY2RjL2F0bWVsX2hsY2RjX2RjLmggfCAxICsNCj4+ICAgMiBmaWxlcyBj
aGFuZ2VkLCA4IGluc2VydGlvbnMoKykNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2F0bWVsLWhsY2RjL2F0bWVsX2hsY2RjX2RjLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXRtZWwt
aGxjZGMvYXRtZWxfaGxjZGNfZGMuYw0KPj4gaW5kZXggZDdhZDgyOGU5ZThjLi5mYmJkMjU5MmVm
YzcgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXRtZWwtaGxjZGMvYXRtZWxfaGxj
ZGNfZGMuYw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2F0bWVsLWhsY2RjL2F0bWVsX2hsY2Rj
X2RjLmMNCj4+IEBAIC03NjEsNiArNzYxLDEzIEBAIHN0YXRpYyBpbnQgYXRtZWxfaGxjZGNfZGNf
bG9hZChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQ0KPj4gICAJaWYgKCFkYykNCj4+ICAgCQlyZXR1
cm4gLUVOT01FTTsNCj4+ICAgDQo+PiArCS8qIFNBTTlYNyBzdXBwb3J0cyBYTENEQyAqLw0KPj4g
KwlpZiAoIXN0cmNtcChtYXRjaC0+Y29tcGF0aWJsZSwgIm1pY3JvY2hpcCxzYW05eDcteGxjZGMi
KSkNCj4gDQo+IFRoaXMgY291bGQgYmUgYXZvaWRlZCBpZiBpeF94bGNkIGluIGFkZGVkIGluIGRy
aXZlciBkYXRhLg0KU3VyZSwgSSB3aWxsIGNoZWNrIGZvciB0aGUgZmVhc2liaWxpdHkgb2YgdGhl
IGNvZGUuDQpUaGFuayB5b3UNCj4gDQo+PiArCQlkYy0+aXNfeGxjZGMgPSB0cnVlOw0KPj4gKwll
bHNlDQo+PiArCQkvKiBPdGhlciBTb0MncyB0aGF0IHN1cHBvcnRzIEhMQ0RDIElQICovDQo+PiAr
CQlkYy0+aXNfeGxjZGMgPSBmYWxzZTsNCj4+ICsNCj4+ICAgCWRjLT5kZXNjID0gbWF0Y2gtPmRh
dGE7DQo+PiAgIAlkYy0+aGxjZGMgPSBkZXZfZ2V0X2RydmRhdGEoZGV2LT5kZXYtPnBhcmVudCk7
DQo+PiAgIAlkZXYtPmRldl9wcml2YXRlID0gZGM7DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2F0bWVsLWhsY2RjL2F0bWVsX2hsY2RjX2RjLmggYi9kcml2ZXJzL2dwdS9kcm0vYXRt
ZWwtaGxjZGMvYXRtZWxfaGxjZGNfZGMuaA0KPj4gaW5kZXggYWVkMTc0MmIzNjY1Li44MDRlNGQ0
NzZmMmIgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXRtZWwtaGxjZGMvYXRtZWxf
aGxjZGNfZGMuaA0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2F0bWVsLWhsY2RjL2F0bWVsX2hs
Y2RjX2RjLmgNCj4+IEBAIC00NTEsNiArNDUxLDcgQEAgc3RydWN0IGF0bWVsX2hsY2RjX2RjIHsN
Cj4+ICAgCQl1MzIgaW1yOw0KPj4gICAJCXN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpzdGF0ZTsN
Cj4+ICAgCX0gc3VzcGVuZDsNCj4+ICsJYm9vbCBpc194bGNkYzsNCj4+ICAgfTsNCj4+ICAgDQo+
PiAgIGV4dGVybiBzdHJ1Y3QgYXRtZWxfaGxjZGNfZm9ybWF0cyBhdG1lbF9obGNkY19wbGFuZV9y
Z2JfZm9ybWF0czsNCj4gDQoNCi0tIA0KVGhhbmtzIGFuZCBSZWdhcmRzLA0KTWFuaWthbmRhbiBN
Lg0KDQo=
