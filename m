Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BC76B2008
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 10:30:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF6C310E7CA;
	Thu,  9 Mar 2023 09:29:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2134.outbound.protection.outlook.com [40.107.114.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B90710E5E9
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 09:23:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M2I2x0NOknicrUfWkF62MzpVqqC3ysFbwkEKNbBOoLgw4uohcquGKhWP9lBpkXtZWh6kYOMSeUEKquq/3pbcaiuDd2aSa8bOw7XMoiq6R3dyj95DHqgFKaWOIZxRTjWQGf8jIY4kW9WOPR5WcKl2vMklyT6k6pTMHCjfyGUf8oOxO+KKr+jjP3S6P3Lva7xmGTpjdcMCf8aztlTCkeiO6HQSR/LCWj1r+Uk37ubAyZknwKqbnqPgCV8iuS3yn5iIgks+suGaTumQsyULcaYOv2lVkOek8sE+jSXbshVAclVfR/f4zNW6HCU4vTjqxV3Uhj62jrqfcX6qBbmKNvnzvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V43d7GsfdBhvFizUBaC8CeTPRWbXX6JBdEBfhAJkkVY=;
 b=Ill3I8Mmrv046kX9XmBaT6pHFal7hLV9COpEmxoUQPZamivoF/vldhQjkmd0SbVQ1WMHloo75K9b2Ne9GRn+uENDirtUx1kz+M1aAdxHqfByMZFztLWftnb/mT16VBzcxY34dHjXPJ5IYWt4WzuafwgJ7zWVhWAcisYp7ZFLMu91vNT3kx5X5vqNSnKVMbT4luXPnJYsed7P1Dwu+bT1KsysOL57vsCLVkUYJt8UVrJ3XOfXOVFRfgZveY2I0RZnx0z9zZWobLRo1Zxs4uyNYL2D7WdFFhOTriamUuV7V+ft1LrwJ0oMJkMU72KdOti4VDFwR+93Bve8aQrSohIWSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dm.renesas.com; dmarc=pass action=none
 header.from=dm.renesas.com; dkim=pass header.d=dm.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dm.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V43d7GsfdBhvFizUBaC8CeTPRWbXX6JBdEBfhAJkkVY=;
 b=GgY9FqxUFHfJO5+BYVVIkze22ILPUYwIziHyYuQTiSJ6AKA4zJhrvhXaFZvXtID0W4mu1MBytohJpMMB22cFaf0SHXQaCRiHdwPKDbdHbkYdi9ANcp6PzRmulgxyebljjAMB+gBAKVW3jkO6DZnLrAdgMAQ8+IJTu08TjX16NDQ=
Received: from OS3PR01MB8460.jpnprd01.prod.outlook.com (2603:1096:604:197::13)
 by TYWPR01MB10887.jpnprd01.prod.outlook.com (2603:1096:400:2a9::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.16; Wed, 8 Mar
 2023 09:23:39 +0000
Received: from OS3PR01MB8460.jpnprd01.prod.outlook.com
 ([fe80::e332:554a:7:7135]) by OS3PR01MB8460.jpnprd01.prod.outlook.com
 ([fe80::e332:554a:7:7135%5]) with mapi id 15.20.6178.017; Wed, 8 Mar 2023
 09:23:39 +0000
From: DLG Adam Ward <DLG-Adam.Ward.opensource@dm.renesas.com>
To: =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <u.kleine-koenig@pengutronix.de>,
 Support Opensource <support.opensource@diasemi.com>, Lee Jones
 <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, Jingoo Han
 <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
Subject: RE: [PATCH 04/13] backlight: da9052_bl: Convert to platform remove
 callback returning void
Thread-Topic: [PATCH 04/13] backlight: da9052_bl: Convert to platform remove
 callback returning void
Thread-Index: AQHZUZEyRn3JpsBPfk2oMx4WNnxoha7wm67g
Date: Wed, 8 Mar 2023 09:23:39 +0000
Message-ID: <OS3PR01MB8460D738F16B676AA7C376A0C2B49@OS3PR01MB8460.jpnprd01.prod.outlook.com>
References: <20230308073945.2336302-1-u.kleine-koenig@pengutronix.de>
 <20230308073945.2336302-5-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230308073945.2336302-5-u.kleine-koenig@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=dm.renesas.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS3PR01MB8460:EE_|TYWPR01MB10887:EE_
x-ms-office365-filtering-correlation-id: 2f4d2475-39c9-4c58-cb71-08db1fb6cd6e
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mmrMnVrmvCVpNKIIdW0DzoIr5wEe7lKyzfNd7DWhoxJvolIaBNIPRnrIB9IouBe1ihr7jB1/6J9twZaxLq8lP/48XN+HpVpDSTT7dhenoWlNxes+uMXRXPKytNURJ6/vNTuu/7j/gC/mv0objW6NuXz6zVGOqapuP3HKIr5hOAZQsSnU0Jby+GkJ0qvwJevySKfIuyzh2XKUdgm64wsEwMJZWBYoAZvHe6qZ3Sjnv6fY7x6UMwXgRwF61qtG6tHA1giXAobzkpaPHx6Hy1N2042STNZ0PN3gEaMbc+XdsmdmukKcvlnzv3eNTwc4pYYFc/mTMQJWK5YG7c9nGUoC82O2V5Ml38gGPkxwxJJgtn5lb66V+H7TrrXtIZXvv0piYs+QvBxX+cQSLUhmNiRRO7d0gnxtAUrrkhNq94u72zcjeWBlXcbQ4JkRSaHJWU9yP2wzk4IQbnRTZj7f4W2xphGWWusNHtM1C1J96Jz8ud4OEK8NYAoAiZUMuTCDD5nNjELXyRovt1YyMnsx7GledHSSdeJuJd3RA/LRlfibsttOXZbdJZMJiSOZSi1VGlS4IgBCcEc4qee/K2gK6Kykq47Uw7yNK8J1m0b04JdmJ2DxpOGwlCt5lfSFgSqkodqLv9+ezKrau+r/tXhAmun1MQ0lHeOupM/Lemv/jJjYobybAHXBUgnbDO/BTA6fxmwgIsByMT0g6Zv5lyHHf/tc+w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8460.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(39860400002)(396003)(376002)(136003)(366004)(451199018)(26005)(6506007)(53546011)(33656002)(38070700005)(86362001)(122000001)(186003)(38100700002)(9686003)(55016003)(66946007)(64756008)(66476007)(66446008)(41300700001)(76116006)(4326008)(8676002)(4744005)(66556008)(2906002)(52536014)(8936002)(5660300002)(71200400001)(7696005)(478600001)(110136005)(316002)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bVJjWUVIaHA2OGNWRUlhS2l4dXhabkZVMFh0NW16YlpITUZScHFlUnNLUERv?=
 =?utf-8?B?VnB1WHduZHcxOXRPSVViRDBOdmgwNVZ5V3psZGx4WGxGcktQRUJ1SExxZnRC?=
 =?utf-8?B?MktWRWU0U0tiZGhid2VNZGFIQUJRK3gxMXlIbzF0R3VweXl6WENaNjFpN2R1?=
 =?utf-8?B?V2ZCNFpGekhWSGZSNnFHVy9KcHZXSHN6aHZCNWc2YVBlTENHRDBBQi9ubG9k?=
 =?utf-8?B?djJET3MzQkVEakRDMXh6bllEVWNVK2JkOTU5Q3Vmc0lReW1zcUxCMHVUWVRi?=
 =?utf-8?B?c2JQaHIzRmNGbS9IaENGUmVPWnZYYzFYb0Z0aHRabElIVjV6S3hkOHBvSWJE?=
 =?utf-8?B?cWcwbTZ4bU80M1R0VjVlSnJSY2hobkFDOTlKb2hEbDlia21sWTRjaG1oQzBk?=
 =?utf-8?B?T0sxVkkycnkwOXJoaVRRdGpkWDcyUWw1bUhLd3FzOTBUMmZyY3FlL3RKUG4y?=
 =?utf-8?B?KzBJbzRjZEMwRDlQN2I3QTlUU0dLU2lPTGhtVHJXb0FpRVViTDVhNkxNVTZ2?=
 =?utf-8?B?L05pdVdkL1U0OWZFc2FldTlERWFVaFdqc29CMUQwRUlYNzB1RFdDRU5aSkFR?=
 =?utf-8?B?MlJSUE1mT2hLbEVYZUxUSHpGdU5HTW5kMDMrVCt4SWdBM05uY1NXd1pJVTlu?=
 =?utf-8?B?ZytkTDJNY2I5WDhPRkhHRlRCc3J6SUNMUkNDekx4SjEyb09JaEtvbVAzQnFr?=
 =?utf-8?B?UlB3TlRrTHBSUmpSN0dhNzJnenNWWnc0UUdFcDFtMys4cTk4RUVHVDVzTW5J?=
 =?utf-8?B?Nm5QYzZtK3JwQ2dGeWVJb0hYdWVweVZKQmVqc2RrL0ljdHpBSnlQMGxucVdm?=
 =?utf-8?B?VnpqVy9yakhHRVlYZk5ESERoMUhsbEpYWGVNQTl1Wnl6RFZ1bjJZZTN2aThJ?=
 =?utf-8?B?VzJyV0lNZERvSG9kT2I5a2pFcDJRcDN2cWdGcE1wZkFmalNJaW96QUFJODFN?=
 =?utf-8?B?cUoxeVpDRkZTdm9Kbm9uM2ZZaExOTHFtZzNiVzNIUXFBazZqOHFNVllhZmZT?=
 =?utf-8?B?cThFYVI3N2tLcHRNZzVoSld0YWpFMGU2OXV0RXA1bzV1VmtaSHFnL09FMGhu?=
 =?utf-8?B?eUdoMERqUkpaYk9DcWQyeldXYVVXQUpXMVRJSWVDdmhXNC8wUjVjdXNMOVo3?=
 =?utf-8?B?Um9Mb0pZMzgzWlFQd0M3aDAxc1lJajFzNDJIbnBiSy84dk9pc0JzLzB4aXF2?=
 =?utf-8?B?d012Qm9rbU1MS2FCMnB3L3dTL2J0TmZkMDNBQXRabXlrRVFZaGdhK1UrUWxM?=
 =?utf-8?B?NWY2RmpaWU15MzVzYU1KQy9DL1k5MjZLWXlleHRmZ1dSSndQL2Z6QWRlS2x6?=
 =?utf-8?B?R2VpVWtLdG1MS051clM2Mk5rZVltdzdRYS9wN1RzM0sxNFcyUjZMZWo0cEc3?=
 =?utf-8?B?WWM2VEZCNkZNT29mdVNRT0VESTQxZk5Fc0hlSHZnUzF6ZGNHWDdzeFN3Z1FI?=
 =?utf-8?B?dWpiSGZGcUw2dkRvL2dYbUJWVjlyVEZkV255NFJHaWxjb3Ruc05VYW0vZGRl?=
 =?utf-8?B?eU5hcDRGaXdHbjhFMUYyc0pCbFVvVlEvSVl6VXlGTlpSWHlYdis0MEhoNjRR?=
 =?utf-8?B?WVFkbHh5VDRidGxCM3QzOHcwLzMrQ1ZiOGNqWld3WFdLb09NR0tmMlpWbmho?=
 =?utf-8?B?TTcyMUpXREM1dzhzYTlLbldQZSswb2FwZjdrZnlYRzFCRXZVVGY3VE94bXpM?=
 =?utf-8?B?TzhkbGlKRjVha0U0NmtsbGZRQXRVV3RwRkUvVlduUzNhbms2aUdnU2UxdDU2?=
 =?utf-8?B?UlREOCt0eDdhb3hjTkFlTmRoVVBaOS9BWm5IRFlQWEk5VVY1NE5JRjBQVkNt?=
 =?utf-8?B?eWVUWnNVSUNXNFFKdVZaMk1SckZkek93dytFY094UG53UlVValpEdW5DbHoz?=
 =?utf-8?B?OGdjcmtSZkRmd2hZNFpFaUdlQllGUUREVkZiWGhkWDRQWGVRRVB5UWJocmts?=
 =?utf-8?B?RHlLWElobjFNYUduc1hxc1A2ZjE0OEtrRUc3RStjamNsNlRtTUJYQVBObzlX?=
 =?utf-8?B?My9Jc0MrODFyYUlkd1FnMUZsdkhQZzkrS0s2MjBjUFhKbkx1RnVRQjhqbmkv?=
 =?utf-8?B?a2NySVVLUVNtQjFxaW5URGVCWWhoNml2UCtsNDFoTm5CN0FpczJhN2FxekMw?=
 =?utf-8?B?LzdiVGthcGZpMzBsNHAwYitSTVVmQWgxbHl4bUxQUUMvNlRDU0loZzl0Q014?=
 =?utf-8?B?cnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: dm.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8460.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f4d2475-39c9-4c58-cb71-08db1fb6cd6e
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2023 09:23:39.3531 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AhYKuvPCYaj+EZrP+t6y56p38vKmJN+zg5+wHfsIGGkCa1G5Mx0sIJN0GbNdeNBl0l1ISJjQPLhHA6fquzuxhcbWTO0NxVdfPCvr3sXMxZ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10887
X-Mailman-Approved-At: Thu, 09 Mar 2023 09:29:54 +0000
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
Cc: "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDgvMDMvMjAyMyAwNzo0MCwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6IA0KPlRoZSAucmVt
b3ZlKCkgY2FsbGJhY2sgZm9yIGEgcGxhdGZvcm0gZHJpdmVyIHJldHVybnMgYW4gaW50IHdoaWNo
IG1ha2VzIG1hbnkgZHJpdmVyIGF1dGhvcnMgd3JvbmdseSBhc3N1bWUgaXQncyBwb3NzaWJsZSB0
byBkbyBlcnJvciBoYW5kbGluZyBieSByZXR1cm5pbmcgYW4gZXJyb3IgY29kZS4gSG93ZXZlciB0
aGUgdmFsdWUgcmV0dXJuZWQgaXMgKG1vc3RseSkgaWdub3JlZCA+YW5kIHRoaXMgdHlwaWNhbGx5
IHJlc3VsdHMgaW4gcmVzb3VyY2UgbGVha3MuIFRvIGltcHJvdmUgaGVyZSB0aGVyZSBpcyBhIHF1
ZXN0IHRvIG1ha2UgdGhlIHJlbW92ZSBjYWxsYmFjayByZXR1cm4gdm9pZC4gSW4gdGhlIGZpcnN0
IHN0ZXAgb2YgdGhpcyBxdWVzdCBhbGwgZHJpdmVycyBhcmUgY29udmVydGVkIHRvIC5yZW1vdmVf
bmV3KCkgd2hpY2ggYWxyZWFkeSByZXR1cm5zIHZvaWQuDQo+DQo+VHJpdmlhbGx5IGNvbnZlcnQg
dGhpcyBkcml2ZXIgZnJvbSBhbHdheXMgcmV0dXJuaW5nIHplcm8gaW4gdGhlIHJlbW92ZSBjYWxs
YmFjayB0byB0aGUgdm9pZCByZXR1cm5pbmcgdmFyaWFudC4NCj4NCj5TaWduZWQtb2ZmLWJ5OiBV
d2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPg0KDQpBY2tl
ZC1ieTogQWRhbSBXYXJkIDxETEctQWRhbS5XYXJkLm9wZW5zb3VyY2VAZG0ucmVuZXNhcy5jb20+
DQoNCg==
