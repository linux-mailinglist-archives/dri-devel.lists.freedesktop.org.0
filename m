Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2027B76F779
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 04:03:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64C1310E127;
	Fri,  4 Aug 2023 02:03:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on2048.outbound.protection.outlook.com [40.107.14.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE75210E127
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 02:03:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nMSmNDLNYdmHllNlFi3CZrfi3cRlzp/8tVzKytjw25FKIfXtoE3wl4rm1yZaVbjIxMja5trpfcTGeT8Uo+pQB8L34jQjMoQT+/3UeAmL75wOWNVs61s+LnY5RWnAJ8V+weG5moNzREk/fHQ2cWoyodmXVbnRQACG9XFYxB5SasXB6iUPBVMuXVYl4rIC6vyN/LYMbMq+D34ItjHei9t7iVjOpn7rzyn1Xh5yS8q6ke+eKWVEm6jiUw2BNnOukZAwLsqdSrLdUqbrtMFG3AkRM+NWbbFKhXErphRAaIk5+/tpZaKbsQH5fzPabbsNaVbMVvZwFjJ2sS4THo+e3FdEIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n9wgQfEoc4sLwvsVpe8yyMvOt5E4FXJzbK4bWoNsCwo=;
 b=V1iFkY/yQNJ4nCSFv71bDhd493VE2BwycPrBwwCUq30a1Fu4I6hnoDspLhPncB/H0zn0aGUvWUowsdMjq8UrlX8QLJS9fYrb5lmL+1DPCi8C71pfK1WNoBegSNhEMINVZoYiv2O9243O3uWiALFJtua6bTs7Pj65Kq4TfLcGnQyvaESKFnmlNri/jlL8OBpCHsF/q6X7GgmADvpaAVcBQ9OteA2EMqJKFgzxjSYHzjJsaMrs9yf7SBKjEPy5MyG08Dxarq8ktz+2NDNIIb/vLtG0wFd1Wtjl9CL8K7+y/Ts0WSDnn35259KTTiZJ2OxqKCxhAZS8NXaRQK1N5ZngBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n9wgQfEoc4sLwvsVpe8yyMvOt5E4FXJzbK4bWoNsCwo=;
 b=bfU8SKciM8CnBWSJ69Hxs33V52qyuhAY5P90xJd23bKYV4Ha9hIxMsky5Fl71drlu00SCm44e+bvrQhmkbe9p6GTn9tuGC8JWNqlnGEuxi8KS9WnFOdMaxlQoBxN5JSmxnr2Rw/zBqTA3ec7QcmFVW4VkVXPQlhnOPll3hd6ZGI=
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AS1PR04MB9261.eurprd04.prod.outlook.com (2603:10a6:20b:4c7::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.20; Fri, 4 Aug
 2023 02:03:25 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::3505:c499:96d4:1429]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::3505:c499:96d4:1429%4]) with mapi id 15.20.6631.046; Fri, 4 Aug 2023
 02:03:24 +0000
From: Sandor Yu <sandor.yu@nxp.com>
To: "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm: bridge: dw_hdmi: Fix ELD is not updated issue
Thread-Topic: [PATCH] drm: bridge: dw_hdmi: Fix ELD is not updated issue
Thread-Index: AQHZxnfaqzc4aHMGLUWbE9dBBfqFSw==
Date: Fri, 4 Aug 2023 02:03:24 +0000
Message-ID: <PAXPR04MB9448CDABEE9A1B55F8ADCC3AF409A@PAXPR04MB9448.eurprd04.prod.outlook.com>
References: <20230726014833.1647244-1-Sandor.yu@nxp.com>
 <743b7abb-127d-49c1-f863-1a7d388b8166@linaro.org>
In-Reply-To: <743b7abb-127d-49c1-f863-1a7d388b8166@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9448:EE_|AS1PR04MB9261:EE_
x-ms-office365-filtering-correlation-id: 6ed95c4a-59e0-4348-bc11-08db948efca1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aYXyvm/6hGk+q2jKmTpQCSzHVXCbMq3a8Wh34mQKVzkVLwBSbSV9OM7JIp8i1aJPJhNRjtKHcSs2LOe3QhV6zjQQsjEr8bdz3X2A+35yvodQr8nI7FjbjdiEJkGCBRjAQQ4D6lz9FnTMtN8CznqotPtw/Bp+7J+G6cZpCFxKxm+Nz+rwPi7HTDg4CVNLPwGN+CM7bhVAAW9zWglh1++3gQq0HK7kyRD6T36f6DuyuztGqoqUr4aRUCkhH+O9dSW9WOdQQM7v4Cvv3H9fu8K4Nqp9Zv5Es2QYbb8dbb9wKXlDAe5i1CzMAD9YEuJo70lED/Bp+Ett07TimYFwbde2HQKi/Jz2CBroFiCH1N+pd6Ou+UvPp97wKjF9/OVU8+/AJ+f7CZm9mA1Jvb94Y5wVPqKPpqBIOVTBDocWcWEL5tQNCpqXzhJju4MBPDOCrKjabfDkDOsXpsbFrvyxeAEIQ5/xF57/ywe+/In8CYeTCLWaqEFndADGwfWG7REwL94pUNEWs7vNzG3sLcwdOKUfytvE6FQqXyVZjVnAIZgKBdeAFkZ9RJC4zvwGNlzOyDwlDoD6Hdx9Bjz+6FuA5yOcBHSQjhHxKD4TfTUs1eKJWEPv0f8eBtpsQf9FWQQW8I4h
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(346002)(376002)(136003)(366004)(396003)(451199021)(1800799003)(186006)(53546011)(8676002)(26005)(6506007)(83380400001)(66476007)(2906002)(316002)(76116006)(4326008)(66946007)(5660300002)(66446008)(64756008)(66556008)(44832011)(8936002)(7416002)(41300700001)(7696005)(71200400001)(15650500001)(52536014)(9686003)(110136005)(478600001)(55016003)(54906003)(38100700002)(122000001)(33656002)(86362001)(38070700005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VU0zWk8xVjRaVW85QlFoekd2aFpUQ0dTb2V3SDY3QVMvZ3JCVVcrSkNmN0Jy?=
 =?utf-8?B?UzFvY0RlbXY1cy9yYTFscDBCdFREVHdoMlZQc0phWkFDTDdULzc5ZjltYmFh?=
 =?utf-8?B?NnZKM2VVT2tlWlBBSGluSytFTGNBTlN1ZlIwNWZyVm44MVE2NWNIT21DSzVx?=
 =?utf-8?B?VG9jOG1pKzhWUm5TQzRBSzlWaVR5VzJGRlpRbXNNVlBXazkxcG9GWm5FcXQr?=
 =?utf-8?B?dGNLaEF5ZG1OYXV4NEhPTGJma3FHSXJZNzhtU0ZBTHQxMWRSNzdUL1ZtZnAx?=
 =?utf-8?B?L0lFR28vMTFmMnVzUkVaL2gra1R1eEpLdHhxSjR5T1dybDFLc0M1WnQzMHZy?=
 =?utf-8?B?d05MMHRxUDFkQlltd1hLN3NpZkZpcnhsRzlwL1lwOHRGY1cwU2RHZ3lJN0o4?=
 =?utf-8?B?K0dEK1NDMjhJUDgxa2J2OHBtNEtGZEFkRlh0b0lxQitucUNTUXEwVXhlSEVN?=
 =?utf-8?B?Ky83b1lQajRwUlhhbm42THVobTg4Y3BWb0xuNW5ycDZRcklYM04wTUFjbUhq?=
 =?utf-8?B?TkNOQXlDeFBWNGhpSVY1b3BiT2djOUdxWnhhL2czUjhnRDZsMWxPQnVZSTBN?=
 =?utf-8?B?eUFTWkROY1ZBaEZUUHJxRG1pY3hjcjJRQVUxOUR3K2FZYmNlbzFMVHRkWmw1?=
 =?utf-8?B?Rm4ycVhDK3F0TkV6TDVYaVVXQ0ZsYk5qcUx4Z2FMYURodG5obWtQMTJXT2E1?=
 =?utf-8?B?Sm1YNXJSYTg2Y1I5bEh4YUhtS3NZUzJsK2czcVFla09uYm1teHB6d2JUeWxG?=
 =?utf-8?B?ZHVpT0hRQ0lJVTN4M2dZUUF2cFFGSU5BUGpRVjNzNTFoTmpTZjNqcVdxYmtq?=
 =?utf-8?B?YzcrTzJnbFV4Ym9IKzZCQ1hGcVBhenhtN3dlc3pKL2MvUytVUDdjZHlnTG8x?=
 =?utf-8?B?SFgxVlNoVUZYUTBlWEgxZFhZaDU4NHpSU1pmcjFSTmtSODkzbDh3aHlkYk81?=
 =?utf-8?B?V3dxY2FBcUVqOHA4eFJOUmsyZENLQ2dKaXk4VGo4amxZNmJ2aEgwSTdOYnA0?=
 =?utf-8?B?RU4ycTNnRk4vU1MraDRsbVBvUFpRNERpRFpqUVhhaEFjYmtRdjF3Z2hSQ3ps?=
 =?utf-8?B?cGJWREt2N1FaMVQxeWNvWkxpWVBhU1RUMDhKcVFZcyt1bVA4Q21mOENoQVNH?=
 =?utf-8?B?T3VWWkk3am4yREMvbEVuTHVpaW5EQlZHS3JSdVhCaUU4OGdnMmNzc2doOVQy?=
 =?utf-8?B?KzRFQnJERGdmV0NGdmorUmVtNzVodjdoNlNvU085YTNlaEN3NUxaMis2QVVh?=
 =?utf-8?B?dWNWVG00L2EwYVVxSFc2RXhkaVY1MHRnKy9DMWpMZVRtK1FWT0dnMHRtVzJY?=
 =?utf-8?B?alhOWjZqanVyWjdUNkpIeDVTWFR6OTVZZHZLdHAyQ29UM2NCUStJaWV6SEQv?=
 =?utf-8?B?K2s2UzA0dmFHTVpzYVBYSmRVNmdKVVdSTlpqYlJEYWcyRmhIMkxzdDYvUi9H?=
 =?utf-8?B?d3dKcEVPMEZKQjhMNkRSL213QlpHUUI5dDQrakFMSnRtanVOUVBxd1R4N2VY?=
 =?utf-8?B?cS9wMXh1N0xwQitrQVZiYWVFbS90MlF1N3Z1b08xZWtnV0VmZ01IU3l1cWFw?=
 =?utf-8?B?eENrNFFUU2hRUzI4MUtsRU5sNURYbTM0VnhBZXEyLzhxRi9FbC9BcUtPaEVO?=
 =?utf-8?B?d0xqRUdIQVpmSGVka2Z2TXdLSU1PQVJFWW11aHZyajhMNFBvVDVtRDMzVVF1?=
 =?utf-8?B?QmhENGFBSFFPSUE3dnRWZHZidWI2RFhFbW1LZTVQVmZFZXo0ZmtId2FiL0Zi?=
 =?utf-8?B?cjZnT08xak82WmdxdHlPYkdTWnRiZGdGeHl3RkxtUlpIZVBDWEM1ei9EU3g1?=
 =?utf-8?B?cjJ6VE1yRkJiSTIvZEREd1hEUi8rSFJLV1FGOUp5dnBialQrUjh1Wjd3VVhL?=
 =?utf-8?B?VGpxSlBTRS90UlZabS82SjViNWJKWWM5TUh0a0xTbjk5SVdTRzJ4SzNPSGt5?=
 =?utf-8?B?N2FQSHMvaWtrR0N5c1djR242Q0d0WGswYjFTZEtpbXNwSHo1WmIvZmIzeU10?=
 =?utf-8?B?YzRWL2FlREFybUlIc253MUNxeUJLc1RzM04wRWlsemhEelJRUXZ6M3pCQy80?=
 =?utf-8?B?NzVEcEp1cmFZUWhuTkdlM1duUWw3SkEvU1doVlRwdldoL3RNUG9rV2tPT25S?=
 =?utf-8?Q?JQdg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ed95c4a-59e0-4348-bc11-08db948efca1
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2023 02:03:24.7450 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y4WL2c9/shgcqowXryiHy6sfCRxvShlLr+QeTCMkQJtT3EAyfhIl3/MvXYZ89oGjzjdyWgdNApyKd2i9a6IgUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9261
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
Cc: "the.cheaterman@gmail.com" <the.cheaterman@gmail.com>,
 "rfoss@kernel.org" <rfoss@kernel.org>, "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "cychiang@chromium.org" <cychiang@chromium.org>,
 "S.J. Wang" <shengjiu.wang@nxp.com>,
 "adrian.larumbe@collabora.com" <adrian.larumbe@collabora.com>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "treding@nvidia.com" <treding@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTmVpbCwNCg0KVGhhbmtzIGZvciB5b3VyIGNvbW1lbnRzLA0KIA0KPiANCj4gSGksDQo+IA0K
PiBPbiAyNi8wNy8yMDIzIDAzOjQ4LCBTYW5kb3IgWXUgd3JvdGU6DQo+ID4gVGhlIEVMRCAoRURJ
RC1MaWtlIERhdGEpIGlzIG5vdCB1cGRhdGVkIHdoZW4gdGhlIEhETUkgY2FibGUgaXMgcGx1Z2dl
ZA0KPiA+IGludG8gZGlmZmVyZW50IEhETUkgbW9uaXRvcnMuDQo+ID4gVGhpcyBpcyBiZWNhdXNl
IHRoZSBFRElEIGlzIG5vdCB1cGRhdGVkIGluIHRoZSBIRE1JIEhQRCBmdW5jdGlvbi4NCj4gPiBB
cyBhIHJlc3VsdCwgdGhlIEVMRCBkYXRhIHJlbWFpbnMgdW5jaGFuZ2VkIGFuZCBtYXkgbm90IHJl
ZmxlY3QgdGhlDQo+ID4gY2FwYWJpbGl0aWVzIG9mIHRoZSBuZXdseSBjb25uZWN0ZWQgSERNSSBz
aW5rIGRldmljZS4NCj4gPg0KPiA+IFRvIGFkZHJlc3MgdGhpcyBpc3N1ZSwgdGhlIGhhbmRsZV9w
bHVnZ2VkX2NoYW5nZSBmdW5jdGlvbiBzaG91bGQgbW92ZQ0KPiA+IHRvIHRoZSBicmlkZ2VfYXRv
bWljX2VuYWJsZSBhbmQgYnJpZGdlX2F0b21pY19kaXNhYmxlIGZ1bmN0aW9ucy4NCj4gPiBNYWtl
IHN1cmUgdGhlIEVESUQgaXMgcHJvcGVybHkgdXBkYXRlZCBiZWZvcmUgdXBkYXRpbmcgRUxELg0K
PiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogU2FuZG9yIFl1IDxTYW5kb3IueXVAbnhwLmNvbT4NCj4g
PiAtLS0NCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jIHwg
MjEgKysrKy0tLS0tLS0tLS0tLS0tLS0tDQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRp
b25zKCspLCAxNyBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYw0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMNCj4gPiBpbmRleCA5YTNkYjUyMzRhMGUwLi42ZmE0ODQ4
NTkxMjI2IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMv
ZHctaGRtaS5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1o
ZG1pLmMNCj4gPiBAQCAtMTk2LDcgKzE5Niw2IEBAIHN0cnVjdCBkd19oZG1pIHsNCj4gPg0KPiA+
ICAgICAgIGhkbWlfY29kZWNfcGx1Z2dlZF9jYiBwbHVnZ2VkX2NiOw0KPiA+ICAgICAgIHN0cnVj
dCBkZXZpY2UgKmNvZGVjX2RldjsNCj4gPiAtICAgICBlbnVtIGRybV9jb25uZWN0b3Jfc3RhdHVz
IGxhc3RfY29ubmVjdG9yX3Jlc3VsdDsNCj4gPiAgIH07DQo+ID4NCj4gPiAgICNkZWZpbmUgSERN
SV9JSF9QSFlfU1RBVDBfUlhfU0VOU0UgXCBAQCAtMjM1LDcgKzIzNCw3IEBAIGludA0KPiA+IGR3
X2hkbWlfc2V0X3BsdWdnZWRfY2Ioc3RydWN0IGR3X2hkbWkgKmhkbWksIGhkbWlfY29kZWNfcGx1
Z2dlZF9jYg0KPiBmbiwNCj4gPiAgICAgICBtdXRleF9sb2NrKCZoZG1pLT5tdXRleCk7DQo+ID4g
ICAgICAgaGRtaS0+cGx1Z2dlZF9jYiA9IGZuOw0KPiA+ICAgICAgIGhkbWktPmNvZGVjX2RldiA9
IGNvZGVjX2RldjsNCj4gPiAtICAgICBwbHVnZ2VkID0gaGRtaS0+bGFzdF9jb25uZWN0b3JfcmVz
dWx0ID09DQo+IGNvbm5lY3Rvcl9zdGF0dXNfY29ubmVjdGVkOw0KPiA+ICsgICAgIHBsdWdnZWQg
PSBoZG1pLT5jb25uZWN0b3Iuc3RhdHVzID09IGNvbm5lY3Rvcl9zdGF0dXNfY29ubmVjdGVkOw0K
PiANCj4gUGxlYXNlIHVzZSBjdXJyX2Nvbm4gaW5zdGVhZCwgY29ubmVjdG9yIGlzIG5vdCBhbHdh
eXMgdmFsaWQuDQpjdXJyX2Nvbm4gaXMgTlVMTCB3aGVuIGR3X2hkbWlfc2V0X3BsdWdnZWRfY2Ig
aXMgY2FsbGVkIGJ5IGR3X2hkbWlfYnJpZGdlX2F0b21pY19kaXNhYmxlLg0KSSB3aWxsIGFkZCB0
aGUgdmFyaWFibGUgb2YgbGFzdF9jb25uZWN0b3JfcmVzdWwgYmFjayB0byBkcml2ZXIgbGF0ZXIu
DQoNCkIuUg0KU2FuZG9yIA0KPiANCj4gPiAgICAgICBoYW5kbGVfcGx1Z2dlZF9jaGFuZ2UoaGRt
aSwgcGx1Z2dlZCk7DQo+ID4gICAgICAgbXV0ZXhfdW5sb2NrKCZoZG1pLT5tdXRleCk7DQo+ID4N
Cj4gPiBAQCAtMjQ0NiwyMCArMjQ0NSw3IEBAIHN0YXRpYyB2b2lkIGR3X2hkbWlfdXBkYXRlX3Bo
eV9tYXNrKHN0cnVjdA0KPiA+IGR3X2hkbWkgKmhkbWkpDQo+ID4NCj4gPiAgIHN0YXRpYyBlbnVt
IGRybV9jb25uZWN0b3Jfc3RhdHVzIGR3X2hkbWlfZGV0ZWN0KHN0cnVjdCBkd19oZG1pDQo+ICpo
ZG1pKQ0KPiA+ICAgew0KPiA+IC0gICAgIGVudW0gZHJtX2Nvbm5lY3Rvcl9zdGF0dXMgcmVzdWx0
Ow0KPiA+IC0NCj4gPiAtICAgICByZXN1bHQgPSBoZG1pLT5waHkub3BzLT5yZWFkX2hwZChoZG1p
LCBoZG1pLT5waHkuZGF0YSk7DQo+ID4gLQ0KPiA+IC0gICAgIG11dGV4X2xvY2soJmhkbWktPm11
dGV4KTsNCj4gPiAtICAgICBpZiAocmVzdWx0ICE9IGhkbWktPmxhc3RfY29ubmVjdG9yX3Jlc3Vs
dCkgew0KPiA+IC0gICAgICAgICAgICAgZGV2X2RiZyhoZG1pLT5kZXYsICJyZWFkX2hwZCByZXN1
bHQ6ICVkIiwgcmVzdWx0KTsNCj4gPiAtICAgICAgICAgICAgIGhhbmRsZV9wbHVnZ2VkX2NoYW5n
ZShoZG1pLA0KPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlc3VsdCA9
PQ0KPiBjb25uZWN0b3Jfc3RhdHVzX2Nvbm5lY3RlZCk7DQo+ID4gLSAgICAgICAgICAgICBoZG1p
LT5sYXN0X2Nvbm5lY3Rvcl9yZXN1bHQgPSByZXN1bHQ7DQo+ID4gLSAgICAgfQ0KPiA+IC0gICAg
IG11dGV4X3VubG9jaygmaGRtaS0+bXV0ZXgpOw0KPiA+IC0NCj4gPiAtICAgICByZXR1cm4gcmVz
dWx0Ow0KPiA+ICsgICAgIHJldHVybiBoZG1pLT5waHkub3BzLT5yZWFkX2hwZChoZG1pLCBoZG1p
LT5waHkuZGF0YSk7DQo+ID4gICB9DQo+ID4NCj4gPiAgIHN0YXRpYyBzdHJ1Y3QgZWRpZCAqZHdf
aGRtaV9nZXRfZWRpZChzdHJ1Y3QgZHdfaGRtaSAqaGRtaSwgQEANCj4gPiAtMjk1OCw2ICsyOTQ0
LDcgQEAgc3RhdGljIHZvaWQgZHdfaGRtaV9icmlkZ2VfYXRvbWljX2Rpc2FibGUoc3RydWN0DQo+
IGRybV9icmlkZ2UgKmJyaWRnZSwNCj4gPiAgICAgICBoZG1pLT5jdXJyX2Nvbm4gPSBOVUxMOw0K
PiA+ICAgICAgIGR3X2hkbWlfdXBkYXRlX3Bvd2VyKGhkbWkpOw0KPiA+ICAgICAgIGR3X2hkbWlf
dXBkYXRlX3BoeV9tYXNrKGhkbWkpOw0KPiA+ICsgICAgIGhhbmRsZV9wbHVnZ2VkX2NoYW5nZSho
ZG1pLCBmYWxzZSk7DQo+ID4gICAgICAgbXV0ZXhfdW5sb2NrKCZoZG1pLT5tdXRleCk7DQo+ID4g
ICB9DQo+ID4NCj4gPiBAQCAtMjk3Niw2ICsyOTYzLDcgQEAgc3RhdGljIHZvaWQNCj4gZHdfaGRt
aV9icmlkZ2VfYXRvbWljX2VuYWJsZShzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlLA0KPiA+ICAg
ICAgIGhkbWktPmN1cnJfY29ubiA9IGNvbm5lY3RvcjsNCj4gPiAgICAgICBkd19oZG1pX3VwZGF0
ZV9wb3dlcihoZG1pKTsNCj4gPiAgICAgICBkd19oZG1pX3VwZGF0ZV9waHlfbWFzayhoZG1pKTsN
Cj4gPiArICAgICBoYW5kbGVfcGx1Z2dlZF9jaGFuZ2UoaGRtaSwgdHJ1ZSk7DQo+ID4gICAgICAg
bXV0ZXhfdW5sb2NrKCZoZG1pLT5tdXRleCk7DQo+ID4gICB9DQo+ID4NCj4gPiBAQCAtMzM2OSw3
ICszMzU3LDYgQEAgc3RydWN0IGR3X2hkbWkgKmR3X2hkbWlfcHJvYmUoc3RydWN0DQo+IHBsYXRm
b3JtX2RldmljZSAqcGRldiwNCj4gPiAgICAgICBoZG1pLT5yeHNlbnNlID0gdHJ1ZTsNCj4gPiAg
ICAgICBoZG1pLT5waHlfbWFzayA9ICh1OCl+KEhETUlfUEhZX0hQRCB8DQo+IEhETUlfUEhZX1JY
X1NFTlNFKTsNCj4gPiAgICAgICBoZG1pLT5tY19jbGtkaXMgPSAweDdmOw0KPiA+IC0gICAgIGhk
bWktPmxhc3RfY29ubmVjdG9yX3Jlc3VsdCA9IGNvbm5lY3Rvcl9zdGF0dXNfZGlzY29ubmVjdGVk
Ow0KPiA+DQo+ID4gICAgICAgbXV0ZXhfaW5pdCgmaGRtaS0+bXV0ZXgpOw0KPiA+ICAgICAgIG11
dGV4X2luaXQoJmhkbWktPmF1ZGlvX211dGV4KTsNCj4gDQo+IFRoYW5rcywNCj4gTmVpbA0KDQo=
