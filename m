Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 780986FBFE8
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 09:05:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80B6210E332;
	Tue,  9 May 2023 07:04:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 427 seconds by postgrey-1.36 at gabe;
 Mon, 08 May 2023 07:11:44 UTC
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D649810E058
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 07:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1683529904; x=1715065904;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ofX7qw+Ty5fqnVxprxeu0C19czuWL41VaypuHZ7PZKg=;
 b=Tnu0rpIvbzKfjGGDSXriWHLDQZMQOTQ9gyJOWjyk2yWlh9hGp3rt5rmq
 djScVAh+unJTQeX/4TX12m9trX21Uo7w9OIHLSJtqgMToC6GWq9dlOtyE
 Q+/uyPVpRsuHoA6I9bYtDQSdveVepKXWIW5uq8nS7i6+EpwubMZYXipBl
 Kv83Ld7Xrw/cEpF2xHppHKm37I8jYE6l0jA/Lzq0y1tErOPDIfUeCzqKs
 Ml+UjHi3W4/wVrtnfdyZkqDhyNv9NmHRnW9gBEq5NsBpCHge6FgjHx9Ww
 F2ffffH6lLwBLNFVVDy5f1pGX8WbtYZDTGf/bow3OusRvmZE10ykf0R9y Q==;
X-IronPort-AV: E=Sophos;i="5.99,258,1677567600"; d="scan'208";a="214169532"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 08 May 2023 00:04:31 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 8 May 2023 00:04:30 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 8 May 2023 00:04:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A6g6GmvyvA1mkm9HbOYSmCzcdBzMSLVpHSmCMWGO+iek1figM7BhH3Zx6a29lN9FO2W+Y2ydN05JCXc8iBL7lF3/dSjOdSQO5kqcAw428awskqR/rwMYE1sa3zcogVZy8XO7wmu3JiVElsifBphPJV3XN7pufMMw7+izHGsefpuC5eWNpeF+lrBwBnQ0IvikVGnf9Fbov9WPQddjdOxW1nrgzca5RNT421IjzOSk5eMe1f9U+TEngWPDzDEmsIMFxZDc1FImb2H1pOJ3agtp5kzr9yVAH5VECGmzY6E2UMmjjHkNowJ6B3LouqBZt7UKzFFfdUos3XRgGSHwIeDbWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ofX7qw+Ty5fqnVxprxeu0C19czuWL41VaypuHZ7PZKg=;
 b=J8RJn1MWo2H3LggKGjb8MAifq9R1nC49b/u8Gc6YAYVJDLLlFeWskcGd5TbMvhriNYy6JkQ1R13+wPQPKglI9gjkwbC7APrwy23Ek7iIdWLZAVkHlgWqRKAEGFAXMvyW2iXjzGicVpC+LIb2S6lXxLYChFlU1NB5PbY3QeAb3Z3eEorZm1nSbb4nyTbTgEdWqN1zBWf1OEH4xJpRPPkQl0eDAE+IzA1jrFFL8qy0KBhiTvOSDDj32brOYgwBq1NrBH61iRH+IT6FMTcr4osTSEjizOfyz+nHbRhr6coBFYAfarsFDyn7NX40sZIUnMAaH6hWeZOKU0CQpWEt+axm1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ofX7qw+Ty5fqnVxprxeu0C19czuWL41VaypuHZ7PZKg=;
 b=sNGAZLCpY9ov1zCy5Ur3rq1YnjbPxUsbHZv/HJbhHT8yDWlbzZOtHqZu5S006Ted/aZpWQ3Wcd+yy4/P3tQI/tQazViZDQXTNXOFhFUn1jF8S+muBi8+BTkP4GMeLCj9FiDbSoB3zCc1XaZkLOGxLzccsTLCqbLypRas6uCW0po=
Received: from SJ2PR11MB7648.namprd11.prod.outlook.com (2603:10b6:a03:4c3::17)
 by CO1PR11MB4900.namprd11.prod.outlook.com (2603:10b6:303:9e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 07:04:29 +0000
Received: from SJ2PR11MB7648.namprd11.prod.outlook.com
 ([fe80::27bf:a69f:806f:67be]) by SJ2PR11MB7648.namprd11.prod.outlook.com
 ([fe80::27bf:a69f:806f:67be%2]) with mapi id 15.20.6363.031; Mon, 8 May 2023
 07:04:28 +0000
From: <Claudiu.Beznea@microchip.com>
To: <u.kleine-koenig@pengutronix.de>, <sam@ravnborg.org>,
 <bbrezillon@kernel.org>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 06/53] drm/atmel-hlcdc: Convert to platform remove
 callback returning void
Thread-Topic: [PATCH 06/53] drm/atmel-hlcdc: Convert to platform remove
 callback returning void
Thread-Index: AQHZgXtUwZyiW290jEyGLgYIjLe16A==
Date: Mon, 8 May 2023 07:04:28 +0000
Message-ID: <72256963-3420-1aaf-9419-5f8d8e109fd7@microchip.com>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
 <20230507162616.1368908-7-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230507162616.1368908-7-u.kleine-koenig@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR11MB7648:EE_|CO1PR11MB4900:EE_
x-ms-office365-filtering-correlation-id: 1e6f38dd-3c54-461d-3d22-08db4f92770c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: d6Jaq8eX+86wLI2XbxaJfQQaOxKwBO5nIUuSFOzfvqqkr7n6LjtQkzbd1PA3uPA5E4jkB06PQJ8uZO0XeC+UEzXgBEpErLuj4oO8xJOVWC2DahG6RUKj2H4ZWlaadz7CLIeBFu73ij3aC2uNUM4j2szJY8w5KLTXEnmG0mdGO8GXYDGt5ZtQtEA4B/l73cXoPS7JptDIPVwerJqUVMZefG1UcrP7rQv48d1FIxnS4DjlpX+OSYhkEbs2F/YxDSiY9/xHQXk65E4+jX8wiuBoK//7NUMjj9C1WYeIbFAxR/kS3e5M94TFlL86nUdQ6uu+SbqsnM6kChygD33pFNayqaVKd8Ht7ynjNAjo2AcCTDloGb2YXbBCZ5vle9WXzw513fz5X32tn95rY/0fbQTCyD62v/+zg5GyzOh/KpsNUs6Yc10j5fqNahcPqxmbb47+9pQEMs8zmQOjca27JHIUh3g1UD8HMATuMmFdzmoHQaMtf1fUOc2ZkHwFnQDm7+3d9Bh2uNDBe7/vklK9awNmfbPdHIQkf7XIm8VuVb5KubbwROQYwpApsSR846sf0fWWmJO85IDclGrG0pnciXzNmRR6iEJq6wkNPmUIqxkjeyzvKK+xDub7tZMTIl5HcYQ2KGX6kVwhZQmrnAe7s86UDyL4XiHS52gJURFba8qZ5JJNWqPG0k+GmjduBQQi444o
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR11MB7648.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(136003)(376002)(346002)(396003)(39860400002)(451199021)(4744005)(31686004)(478600001)(54906003)(2906002)(8936002)(8676002)(316002)(64756008)(66446008)(66476007)(66556008)(4326008)(5660300002)(41300700001)(110136005)(71200400001)(66946007)(76116006)(91956017)(6486002)(6512007)(6506007)(53546011)(26005)(186003)(2616005)(36756003)(38070700005)(38100700002)(31696002)(86362001)(122000001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MVNlb0NwQWRmTlUxeTF2blJuK2dyRlliS1pheUc0ZXVFT0EwOGhabjhjM0pC?=
 =?utf-8?B?R011WjZmam9LWVR2N1BVVDdYbWxuWmMxTGxQcnRTajhrRzdLQ0JLWXFQNm9o?=
 =?utf-8?B?YlF2T05PNHN0cVRrTlJEY084bG4yb0tRazhQcGF5TzUzaGQvZ242enBWaWYy?=
 =?utf-8?B?Q2dKYlozSzhtZDVseWkwaTNnNnFPRVVneVM2OXRzQzRUNzVXNVlzSzE2MGdZ?=
 =?utf-8?B?VzFST3M0UzNQdi9OSUY1Z1hCUkN4b1dZQ3U0NVZrZEhIZmk0b3EvbUZYT0Vi?=
 =?utf-8?B?ZENaNWtMNEZSODV5MzJyeHlnWjFzMktKUjJpczJMTEZoQTVTNTUvSTJkM1ZE?=
 =?utf-8?B?Wk1Ma1FrSE5pbG5hM0NkN2NjRk52dzZOeGxpZ1NJYUltenpUbTVrRy9pTXQ0?=
 =?utf-8?B?b3JteGVtQU5NcTMzd2J6Y2k0SFBwNHRCd1pORzZkZGoydUlpeTNhWGI1TDBz?=
 =?utf-8?B?Y2NOc29zYk41L256Yng2RTVGV0NseXhkUlU5d0lhMldKMEYzYXVmL01IMmN0?=
 =?utf-8?B?MnhET0o2UUljeDI3UkhjVWV5ZzFEVkJZRFBSTTN0aXV0bThzaE1JVG5CWVBi?=
 =?utf-8?B?MEg2aEE0NFpCUE03dThGdDdVU05sZFYvbHh6b010cDZmcFJDYXNaWEVBUFAy?=
 =?utf-8?B?OU8xcElzNnkvQ3cxRGdXLzQ4ZGE4SHJITjNPMGJHSWpJcmZyV1Y1U0EzZXpH?=
 =?utf-8?B?TkRPSmFFNVJGbHJxZkNsNHJEeGlDaGZmU2kvU1dwODZvM1BUcEMrVVdramsw?=
 =?utf-8?B?MFd1M0dQTmtOSVlkRHpON0h6M3pmUHhkblc4c0pZRE4zeFBnbzN3eGw4TGdE?=
 =?utf-8?B?MnFNQ0JXdW8wRGhpdVpodngvSmhDK1lyejBjUWp1UU5NUzlWOXlPYWlMam0z?=
 =?utf-8?B?TXRSbzY4N2NWNWthbks5TE1VMXVYajZmUHhrejB1SHhsRWtGSTlFZ0dUZ1Zj?=
 =?utf-8?B?bW4xZXFZNEpvVFhEbVM0Mk1ISjlIVFlZLzdwbHJGTHZsTWZudVg2bVZGNXRE?=
 =?utf-8?B?ZHhCTUhwdVpxeS9nclBRSXMxeWdJZ2xpTk1wc3FuTm5FSW1QWnpWeDdLbEVQ?=
 =?utf-8?B?NEtCTEtMcEQ5RkN4dkNLMEg1d0lyTThRU2FicTZ6dGVVdVNjVXh4cDVTcVhN?=
 =?utf-8?B?WVVMRjB6ditqLzhJdTZsUm1MVzBWN2FHanpQUThPY1JJR2NGd0tXRXhsdWo4?=
 =?utf-8?B?L0NnMnVibVR5SytndzhELzJ2UXFWU1V1Tkd4d3VxRlFhUTdONXp5RzYzOVJi?=
 =?utf-8?B?b3lCNHduZlJyTFZpZHlrbSt3TWl0dDVvZ0hhalNyaGI4cVVBZkMwTHZmSUEx?=
 =?utf-8?B?bUlVM0lQSS9ITU9KNGFnSGtma1JXYUtURDYxT05vejFsZVhCWEVweHhqMnZU?=
 =?utf-8?B?c0F5UDFNdHJVenphRklyQWhtY1l6a2tmTlV0aVh0cVA0QmhIL2hieWtwdXBX?=
 =?utf-8?B?WWYxUG9jcDYwdU9pWFZhbnNnTDhsbG5LNlhpUGo4aVNqL3FFY2ZFMkp2VStF?=
 =?utf-8?B?OFlUQmY1Y1pDV3ZmTVcrTTY3WU9mUll6WlBPVlJsNnI1bjdFMEVUaUJ1S2Uw?=
 =?utf-8?B?dWt5NkdxMW9xenhNeFM2Smh3dGhPa0d0a0hpanJoZ2RxcndlTjBBYmprSlhm?=
 =?utf-8?B?MjJTV1p1TXFwdzMreWdwNWV5U0JOSjdERk1tSU15Y2oyUVY0RHAzSHdFRmp5?=
 =?utf-8?B?bk54UXN1U2FocDF6cnBDTjRNbGwzbkU3cEN2VlZkR01JK2MvTUZwVVhjc1Bk?=
 =?utf-8?B?aE9FdjdpSWEraUxJZTBSdS9BTlJ1NEhGR1ljOHZxeS8ra0ovVWlMK2lQeVlh?=
 =?utf-8?B?S0JXUjFkV0JNZFcybmNUUFhXcmcrcC93cmR3cVZRVEgzSGdlTGFUUjExRC9v?=
 =?utf-8?B?WW10L2lMb3QwelZFS1FFbVduQ0pZRHlpNUZIclMyay9SNzBNenkzL2ZHN1hJ?=
 =?utf-8?B?KzhMd1l0R0M5WTJzNkdxSnVDcHZ1Q2ZxVkxocVRYM1J1Q2txQThOL1JuZko0?=
 =?utf-8?B?aFdsRnFuN012ald5dTBhWU84bHZZcTl6MVVlV05WaUJ6SVRzWmxVVmc0SEVl?=
 =?utf-8?B?WVBaNWN6amd3b1E5V3VIbkZMekRaU1JoaDNDQzJOZWxPNTZmb0tUSERsdEJM?=
 =?utf-8?B?MDIvU3lhZExPWXZpRWFMbTc1NjRadUIyakpOditEdmk0aFUraXFxcWZOZURW?=
 =?utf-8?B?REE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0CDE7A1389923041A5850CD8E3A7E4FA@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e6f38dd-3c54-461d-3d22-08db4f92770c
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2023 07:04:28.3871 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 34GB81nDxI0c62LT8nCNeG4oHPcSIB73J9JdJmsoHjZhU00gdZg72lzWi8GE0VLA14xACY77lI4hc+bdV5hRjCb3G/69jl9lnA0U6ZoB9WQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4900
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
Cc: kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDcuMDUuMjAyMyAxOToyNSwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6DQo+IA0KPiBUaGUg
LnJlbW92ZSgpIGNhbGxiYWNrIGZvciBhIHBsYXRmb3JtIGRyaXZlciByZXR1cm5zIGFuIGludCB3
aGljaCBtYWtlcw0KPiBtYW55IGRyaXZlciBhdXRob3JzIHdyb25nbHkgYXNzdW1lIGl0J3MgcG9z
c2libGUgdG8gZG8gZXJyb3IgaGFuZGxpbmcgYnkNCj4gcmV0dXJuaW5nIGFuIGVycm9yIGNvZGUu
IEhvd2V2ZXIgdGhlIHZhbHVlIHJldHVybmVkIGlzIChtb3N0bHkpIGlnbm9yZWQNCj4gYW5kIHRo
aXMgdHlwaWNhbGx5IHJlc3VsdHMgaW4gcmVzb3VyY2UgbGVha3MuIFRvIGltcHJvdmUgaGVyZSB0
aGVyZSBpcyBhDQo+IHF1ZXN0IHRvIG1ha2UgdGhlIHJlbW92ZSBjYWxsYmFjayByZXR1cm4gdm9p
ZC4gSW4gdGhlIGZpcnN0IHN0ZXAgb2YgdGhpcw0KPiBxdWVzdCBhbGwgZHJpdmVycyBhcmUgY29u
dmVydGVkIHRvIC5yZW1vdmVfbmV3KCkgd2hpY2ggYWxyZWFkeSByZXR1cm5zDQo+IHZvaWQuDQo+
IA0KPiBUcml2aWFsbHkgY29udmVydCB0aGlzIGRyaXZlciBmcm9tIGFsd2F5cyByZXR1cm5pbmcg
emVybyBpbiB0aGUgcmVtb3ZlDQo+IGNhbGxiYWNrIHRvIHRoZSB2b2lkIHJldHVybmluZyB2YXJp
YW50Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtv
ZW5pZ0BwZW5ndXRyb25peC5kZT4NClJldmlld2VkLWJ5OiBDbGF1ZGl1IEJlem5lYSA8Y2xhdWRp
dS5iZXpuZWFAbWljcm9jaGlwLmNvbT4NCg==
