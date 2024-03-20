Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C186B880E24
	for <lists+dri-devel@lfdr.de>; Wed, 20 Mar 2024 10:00:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00E3710F246;
	Wed, 20 Mar 2024 09:00:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=asem.it header.i=@asem.it header.b="j/DzefHR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2085.outbound.protection.outlook.com [40.107.243.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBAE410F2AD
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 09:00:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LWjH80ZsuXp7aAD2jpRERyxV70+qGnTcf3MZkgYCWyquJVEwbau4p1WRaMoEDpdFXsZbmcVEqh+48P8wHRoIzsafzDU+tbnCuubzAV3jYzuia0rL+Nse3GiitksTCV4IxflxTRzItmywfhMc26yo6zzMTEns0SY4AUQSqzs6iYAd6ejGNGfTO9KY8BS8QpHlis75iu/6qXvPcJd6hI1ZPsA0N6pmQZzxZUHyat1CM6c+c1TOzJNrO7PQGAHhIjK5AvFvMBvPmVENjXG8Ht1Zd4H9GUvScnR5L14HT1BAgXalAxS22MMpAu92n0YAPoDcI1qLRCrHNLj60sbX6LFYZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O8JlZmV07eKwSJWngchNrPvWFzYsK106BxZiDIwFAzI=;
 b=Bp47Ece2EtIWhLnNDcqVOCZhu0NtzGYN2t9DRjWa7XkuW6Bs86WrZcxWRTXS13jMH5E/sqWE0cZNNK8U/hm/FAsuVKEP+m02bLhwVPJ91OtOZR56xLO8a6NHeD05gM9LxgthWvgz3eUYqmw+BnmKZjqQgiWpIl4Z9dq4iAeq7F6eO3/sLA6mgvQpOizST0301h3bvbZr+igJYPwmjw+UTlaeO7bIFWx/HTZ41/a3M4Ws9hBCMrYBRlE76treqW8ciOn2jdhTweujDnNEtCj354wPL+uvBq1AD2myUMv2NXeGeiY23So0wU9ITlImxnVv21635vdaaB/mmEWL2fxahQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=asem.it; dmarc=pass action=none header.from=asem.it; dkim=pass
 header.d=asem.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O8JlZmV07eKwSJWngchNrPvWFzYsK106BxZiDIwFAzI=;
 b=j/DzefHRy6og5G5XqnCaS30O9G+ZjD9Dz8jKS8zWGNk4Mq8Zxwm5EMha7gZ3ej6hG7Bd9URJx9cwVgxkE3PoM/YSttnqCJfforf8UaZDQnYdXYdGgOCO1IU3kotOVGYp+p9LWVoXZwTQrYTqsum/qLigH16Jh+jWqwxmf3meHiAde1Db4cKc2N6/Fz4acLDAuSh7Tyzv205YiOrBJ8YxTZ6DN14S8Tt63gs3g3o/DLYwXdnSvrn5rD94J6tZHmoHWLI90H2RHWjlJ6x11IPdvnCax1JgJuA2tWmWgcU0VvsvTSzNIGbO9JMzgJDQyb2+OsZ5DLFDrQdESpd76NeYtA==
Received: from PH0PR22MB3789.namprd22.prod.outlook.com (2603:10b6:510:29c::11)
 by DM4PR22MB3674.namprd22.prod.outlook.com (2603:10b6:8:65::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.34; Wed, 20 Mar
 2024 09:00:13 +0000
Received: from PH0PR22MB3789.namprd22.prod.outlook.com
 ([fe80::35ce:ff48:fa8b:d4a7]) by PH0PR22MB3789.namprd22.prod.outlook.com
 ([fe80::35ce:ff48:fa8b:d4a7%7]) with mapi id 15.20.7386.025; Wed, 20 Mar 2024
 09:00:13 +0000
From: FLAVIO SULIGOI <f.suligoi@asem.it>
To: 'Thomas Zimmermann' <tzimmermann@suse.de>, "lee@kernel.org"
 <lee@kernel.org>, "daniel.thompson@linaro.org" <daniel.thompson@linaro.org>,
 "jingoohan1@gmail.com" <jingoohan1@gmail.com>, "deller@gmx.de"
 <deller@gmx.de>, "andy@kernel.org" <andy@kernel.org>, "geert@linux-m68k.org"
 <geert@linux-m68k.org>, "dan.carpenter@linaro.org"
 <dan.carpenter@linaro.org>, "sam@ravnborg.org" <sam@ravnborg.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>, Nicolas
 Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: RE: EXTERNAL: Re: [PATCH v2 6/6] backlight: Remove fb_blank from
 struct backlight_properties
Thread-Topic: EXTERNAL: Re: [PATCH v2 6/6] backlight: Remove fb_blank from
 struct backlight_properties
Thread-Index: AQHaeqMNhOWwbc8AK0uuu/eEdiHVPbFAUjcAgAABqkA=
Date: Wed, 20 Mar 2024 09:00:13 +0000
Message-ID: <PH0PR22MB37893D15CC8D0C53C5444287F9332@PH0PR22MB3789.namprd22.prod.outlook.com>
References: <20240319093915.31778-1-tzimmermann@suse.de>
 <20240319093915.31778-7-tzimmermann@suse.de>
 <PH0PR22MB37892E08DA11EDF48D956646F9332@PH0PR22MB3789.namprd22.prod.outlook.com>
 <ae872d58-6245-4528-97f8-e5772393067d@suse.de>
In-Reply-To: <ae872d58-6245-4528-97f8-e5772393067d@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=asem.it;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR22MB3789:EE_|DM4PR22MB3674:EE_
x-ms-office365-filtering-correlation-id: b2b7ffaf-b748-4996-d9e1-08dc48bc27af
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ct90EgE9gB87S/xHF8mFyGEqNpWNiY4FVEqYMf0AlbFCEnt8KZ19HwvhrBPSUlprAzWgHeu/vh4V/oT5cqZyOGm/oLFo/adfV9qW/lt5lkoDSdwouVrrUY6Act02DsM77EnnwFis3z7qAeVjC4DQZ6TJcAPIcJa31poKbIMY8rLAqYKcqDJVhJPwSVd8n3T9lo9tsw9paZVfoHIa/ywcV62kjV+wa2eiPkavr1/25arpZrhjDCeYXm666wuPkqBDgZm4Kb3yMZlpL/eXfJxBzf9ejqPdldMAGB0ozicnZCJqZjwgRe/jQV2LLOWvw8lb80MSBr3Bi0ZP0671tub4jtl8buQXa9UCw6jmaS/i0hctyEcFgegfe9vPTmccbWsVvV80sb36WH/iId+ZBoK+kWETTCzfTa1ZdPdqM+Iwb/nmAbsyy3y4vWMGzjozmm2wRCUH2SWx3HdiJ5lVyktKQ8xorQsAUs+BbKUvkMD/auzVs18HyYgkWg5P+kwxJnKVc4aFE3hfwRCy4r92MXnUnHI4lsdxHx+X52EuqcJKLs4/IYvjPWxaYkEQxIagocGeB1adNmaq3RwUVlWu+C3Nk2hiXYdT54ef/xe3nOi1eP1W92V+Ra8gsfx4uTmYOQbQtd5u85ECCe11gOWI6ujbllboG8sCLcPi52w9Yxo39B+dvlP7bK0Jbx0jCFoyo+qoJO7WUK12gRjq0nbaJMPOLQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR22MB3789.namprd22.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005)(7416005)(38070700009); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bVM0R1d0N0xUcTBCeE5qbWl2UG5VR29zUFBqRlVPYk9pcVBJZDUrL3VWUFow?=
 =?utf-8?B?cGpCSklpNDg0MEhqTE9qdVFObmF4TDd5azJZcWZOWVZTbmhDZjFuVWRkcVN2?=
 =?utf-8?B?U1QyUjhKeDRpOXJpeTVsRjJOV0htRlRBMG1LUENxeDFPbCs0MTJYM2ZtSmtn?=
 =?utf-8?B?RDN3NENzRWE2L2l0Y0hibUtER2pwRjY5T3FJc2lvSEloSVQ0eWZkM3d0blNP?=
 =?utf-8?B?Y3pleDQrVis1Mkp2ZlpxRHNZRFptMk5RclZBQW1xeWk0c2NvSnZoQ1NWYzkw?=
 =?utf-8?B?aWx5MlNhaTVXTUVEclBienpnYzg4UU1VRi9pSGt2ak5ab1J0dGd5ZjNDajJJ?=
 =?utf-8?B?aTJNMlRTZHg5OTVYdXJTSXhRcHZmbU9SUHdFMUR3TWFDNDk0dUFTKzNKTitR?=
 =?utf-8?B?bURoMWcxWkE2VDlOdTkrNnBGdU1qS2t3RDd1QjJoNkRsLzV5dkx2aGlHMUpm?=
 =?utf-8?B?emVPVTFVQU8rNUVuVEZTWHl6ajhIUWVteUx2VVQ4NWdreEZQWUVUNUVkMDFm?=
 =?utf-8?B?NHpSVTkrd2JoTUVpbDBlUE52WkZTcGw1QVhVNmIzeXZUVWtJdWZEYzNQT0Ew?=
 =?utf-8?B?b29rb1c5alNWL3pkbE96aGRBM3BPak5jNE9ncVVPazY1aExpZXoyV3NiNHFK?=
 =?utf-8?B?VHhuYkNOU1pJSHpYNEg2MzNRVjdueVA5a1ZwVWtwbkFic0JkWEVuYWtOa2J2?=
 =?utf-8?B?VnpvQXpOUHliSGpDRHB4cnMvQjBGdGJMV0dmdzdYbkNzY1BJVEVNcDc3RURy?=
 =?utf-8?B?Q3NYcS9EUjJVZ251eTVod09mRzM3MUgxTmgvNXJKd2hLSG5obWs3NlpsTnNw?=
 =?utf-8?B?TnA4bHpCQjVqcGtKKzBjbVVMMVI1eU4rUTgvSGg0OUE0OTNrZEs4TFRaNmxM?=
 =?utf-8?B?T2I5V2RlOWxnWkxtdjQ3aFFWNlJlcWFFait5aXM4bEZjSGFRU0M3MlpsUlFr?=
 =?utf-8?B?bzdwY25xVXVuSHRsZGoxM1hsczJEd1pQa0R3TG1sZkUrMmFYck1ud2toSm1x?=
 =?utf-8?B?ZmlHWm04dmRMU1ZzbUIxeCt0Tldrd3drOEJxV205WlVGZWo5TkI0bUdoYXNh?=
 =?utf-8?B?bTZ5UFlxczcvU1JOeU1iWEFoeWxaOFI3TWF1emYxajBvU2FVRUYwNGQwSUU3?=
 =?utf-8?B?cU1sYW9saUJESlJuS0MxdUlFRUcyVWNybHowd0g2TUh6NjhYamJ5dVQzVXlv?=
 =?utf-8?B?WmdzOVYveXQvTkUrSmprK3MrM2dLZW5FT2dqcUxLbnBBbUFkbjM4VWVZTDMw?=
 =?utf-8?B?YjZTTnZ4NUFWWFJiODluYWZQQlV6M1RYcGUwR2dkaVJzRnJOdEcwSTBTNjl2?=
 =?utf-8?B?YzNZSVVtdWU3NU5tWThUd0lCaWNxbUFLaSt2TnRxcXZCRkJibnFMcExNV0hs?=
 =?utf-8?B?WHlBekZKVjJxOGVKUHdKUm9YRHozd3N3ZEw4Qlp5c28wRCthZWdiQ1U0TGhh?=
 =?utf-8?B?cGxDUGFwSXArcFJEQ09ZZjM4VU5TOTNJQ1hDVGF1VXZRWjBhUjVVWEFkYUo4?=
 =?utf-8?B?UWlBSi90TE8yTnRCVitBcy8wMlZWOGdZME9XaE9IVVZpc3F5VTBnSG9Pcmda?=
 =?utf-8?B?OUtKUThiSWg0QlBPcFd0TjdBTkx4NnVkT1BCVm0rY29hVTB4WkRUN1h5OEdE?=
 =?utf-8?B?WlZ4dkRaRUEydVJmanQ0ak96N0lmSXRFWlRkeG1hWlUrcnYzT3NzUW1jOFJp?=
 =?utf-8?B?YzNkVk9DZGZsNU44TDlJTHFSS0paREVKV1Zhc0lmRGFjUG1SS3YyTTVWeFJG?=
 =?utf-8?B?VE05UWpKYWszNjZHcFpPVHgvNFU4bERneXNRaDBBK292aHBkYnZXS042NWxI?=
 =?utf-8?B?VUcwSnUrMTh0T0Ivam5jeG10OTFnREdadVJKU0hLUzNhWlltbHpuTTBSYlhG?=
 =?utf-8?B?R3dsTE4zdko3eWU3VlZOYnhKdnBPcXVDVVQvQWFkaHoxbnRXNCtwT2dTYnpE?=
 =?utf-8?B?Z09rMCtrK0k4amNNTzBWU205NlJMbm1ra0sxSzUzUmovRUY0RFlFODhEZ2NW?=
 =?utf-8?B?elNOZy9RaDhjay9xM1N3VUhvaXYwc2FFaVVoa1ZQNk41ZTNuYUlOZWw3Wk1j?=
 =?utf-8?B?blJtNmluVHZMSXZxWkpZSGhmK21scTF0a3U4VGV5Z3VPZjUvVnpyOUlFTExX?=
 =?utf-8?B?ZFcwTEQ5YVc5bGZ1Z1lRZkJHOEtNNzJxTUo5ZEJmQWUvdlJNWGNub0JqdEdI?=
 =?utf-8?Q?nzMshBja1w1vi4SO8n178p0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: asem.it
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR22MB3789.namprd22.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2b7ffaf-b748-4996-d9e1-08dc48bc27af
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2024 09:00:13.6181 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 855b093e-7340-45c7-9f0c-96150415893e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aVmzh/7hplmVbtiIlvzOQ8kJMv8aPty6K7nevvu2GVHU9NpdOgnKAqRBeLxcSHRu/a3yIDP/Tnonokg9zk/gIuit+k2kI2Dhowq02j49amcpEsxstTr3YXhiTxdeeKf0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR22MB3674
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

SEkgVGhvbWFzLA0KDQouLi4NCj4gPj4gUmVtb3ZlIHRoZSBmaWVsZCBmYl9ibGFuayBmcm9tIHN0
cnVjdCBiYWNrbGlnaHRfcHJvcGVydGllcyBhbmQgcmVtb3ZlDQo+ID4+IGFsbCBjb2RlIHRoYXQg
c3RpbGwgc2V0cyBvciByZWFkcyBpdC4gQmFja2xpZ2h0IGJsYW5rIHN0YXR1cyBpcyBub3cNCj4g
Pj4gdHJhY2tlZCBleGNsdXNpdmVseSBpbiBzdHJ1Y3QgYmFja2xpZ2h0X3Byb3BlcnRpZXMuc3Rh
dGUuDQo+ID4+DQo+ID4+IFRoZSBjb3JlIGJhY2tsaWdodCBjb2RlIGtlZXBzIHRoZSBmYl9ibGFu
ayBhbmQgc3RhdGUgZmllbGRzIGluIHN5bmMsDQo+ID4+IGJ1dCBkb2Vzbid0IGRvIGFueXRoaW5n
IGVsc2Ugd2l0aCBmYl9ibGFuay4gU2V2ZXJhbCBkcml2ZXJzDQo+ID4+IGluaXRpYWxpemUgZmJf
YmxhbmsgdG8gRkJfQkxBTktfVU5CTEFOSyB0byBlbmFibGUgdGhlIGJhY2tsaWdodC4gVGhpcw0K
PiA+PiBpcyBhbHJlYWR5IHRoZSBkZWZhdWx0IGZvciB0aGUgc3RhdGUgZmllbGQuIFNvIHdlIGNh
biBkZWxldGUgdGhlDQo+ID4+IGZiX2JsYW5rIGNvZGUgZnJvbSBjb3JlIGFuZCBkcml2ZXJzIGFu
ZCByZWx5IG9uIHRoZSBzdGF0ZSBmaWVsZC4NCj4gPj4NCj4gPj4gU2lnbmVkLW9mZi1ieTogVGhv
bWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQo+ID4+IENjOiBGbGF2aW8gU3Vs
aWdvaSA8Zi5zdWxpZ29pQGFzZW0uaXQ+DQo+ID4+IENjOiBOaWNvbGFzIEZlcnJlIDxuaWNvbGFz
LmZlcnJlQG1pY3JvY2hpcC5jb20+DQo+ID4+IENjOiBBbGV4YW5kcmUgQmVsbG9uaSA8YWxleGFu
ZHJlLmJlbGxvbmlAYm9vdGxpbi5jb20+DQo+ID4+IENjOiBDbGF1ZGl1IEJlem5lYSA8Y2xhdWRp
dS5iZXpuZWFAdHV4b24uZGV2Pg0KPiA+PiBUZXN0ZWQtYnk6IEZsYXZpbyBTdWxpZ29pIDxmLnN1
bGlnb2lAYXNlbS5pdD4NCj4gPj4gUmV2aWV3ZWQtYnk6IERhbmllbCBUaG9tcHNvbiA8ZGFuaWVs
LnRob21wc29uQGxpbmFyby5vcmc+DQo+ID4+IFJldmlld2VkLWJ5OiBEYW4gQ2FycGVudGVyIDxk
YW4uY2FycGVudGVyQGxpbmFyby5vcmc+DQo+ID4gLi4uDQo+ID4NCj4gPiBDYW4geW91IGV4cGxh
aW4gd2hhdCBhcmUgdGhlIGRpZmZlcmVuY2VzIGJldHdlZW4gdGhlIHZlcnNpb24gMSBhbmQgdmVy
c2lvbg0KPiAyIG9mIHRoZSBwYXRjaD8NCj4gDQo+IFRoZXJlIGFyZSBub25lLiBJdCdzIHNpbXBs
eSBsYWJlbGVkIHYyIGJlY2F1c2UgaXQgaXMgcGFydCBvZiB0aGUgdmVyc2lvbg0KPiAyIG9mIHRo
aXMgc2VyaWVzLg0KLi4uDQoNCkFoLCBvay4gU29ycnkgZm9yIG15IHF1ZXN0aW9uLCBidXQgaGF2
aW5nIHJlY2VpdmVkIG9ubHkgdGhpcyBlbWFpbCBmcm9tIHRoZSBzZXJpZXMsDQpJIGRpZG4ndCB1
bmRlcnN0YW5kIHdoeSB2ZXJzaW9uIHR3by4NCkl0J3MgYWxsIGNsZWFyIG5vdyENCg0KQmVzdCBy
ZWdhcmRzLA0KRmxhdmlvDQo=
