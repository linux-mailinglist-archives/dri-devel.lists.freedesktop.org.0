Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9AC4DB68B
	for <lists+dri-devel@lfdr.de>; Wed, 16 Mar 2022 17:45:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ECD010E6EA;
	Wed, 16 Mar 2022 16:45:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.hc3962-90.iphmx.com (esa.hc3962-90.iphmx.com
 [216.71.142.165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C0BA10E6E8;
 Wed, 16 Mar 2022 16:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1647449143; x=1648053943;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KOdVfCi2hRbFZrKDAP2ur1n6UrdrfLcGOeLjI1qXjK8=;
 b=RweTfe1RG4/QxPfdVMQJeTVTPx8TrT8zlQk/wsTbvq7gvLbjkC4564Ts
 Jatcn9Ietn/2nrqntAHgYhmrxoUupmGX6g7Yc9pLHd7XhEtzQKGo0phVl
 OLDOJMBikW/48nO7evUZh52thweNo8fHo9Locz5LAz77C+A580SNS+9n2 0=;
Received: from mail-co1nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.168])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2022 16:45:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C1VrSnzugcPRDv6q/eF2eNokjIWcGQqhNyNMTLGhM8z7q0cG09J/tkXZf+Y/Mw3wLis1D1i3ctUeghtaKrpyqWm7q5q6k+osPJtNHQPb3xobucYBCq4pOeFZrbcJTHIGtp1ZGdPTm4GeuKLUTErYMvB7hxx0KcU0pn6Nh1wqo8zgAZaqrXfUi9+6xt4d2S9R1HpMt/TrSACDKLmtmHSnl2CYYWiU+YJArYyZhbEOTn/Dgui+0dXfbt4TO3vMuuoomqBQh4y+PzdUewK2Du9yHzYY/k8lp7GROKQqTqHM46nlC83aiOcUQhGi23LrQUbyYyXyEhHPp+Qwb3a5l5xqkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KOdVfCi2hRbFZrKDAP2ur1n6UrdrfLcGOeLjI1qXjK8=;
 b=Ti12Apu2QNXQ0Y5oDu3orxXLX2o9jf4T1bkP7GhjQlB4G2RyAaEx+kpldOrdwV+BNiD8Qi4BIeinWagPb2NdDxrfJGJDB9vdXHUt037dwIakkZ5wjpQwdkYb5WdCKKcPKWPZJB71+d5d57eQ7PvbuTtZ1h3Z1JxPjtuhMnMPE4pCzruzUyjH/11S4nhupYi040tVfx/fkAaaX5fwPQ9ZYZBNHJuwG5dI4JITizP19uzL5i9OWkZWi1Islx5VACrI24770g2hmRXRIGjC75tS6bxfzwhIIJJ+z2oWK7/bS2tRihPxe0DEtfZ4nzsq/Cvj62Pu+r15TQgJXLvT7WSmlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from MW4PR02MB7186.namprd02.prod.outlook.com (2603:10b6:303:73::6)
 by CY4PR02MB2390.namprd02.prod.outlook.com (2603:10b6:903:f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Wed, 16 Mar
 2022 16:45:38 +0000
Received: from MW4PR02MB7186.namprd02.prod.outlook.com
 ([fe80::9c20:19b5:ccfe:804c]) by MW4PR02MB7186.namprd02.prod.outlook.com
 ([fe80::9c20:19b5:ccfe:804c%7]) with mapi id 15.20.5081.016; Wed, 16 Mar 2022
 16:45:38 +0000
From: "Sankeerth Billakanti (QUIC)" <quic_sbillaka@quicinc.com>
To: "swboyd@chromium.org" <swboyd@chromium.org>, "dmitry.baryshkov@linaro.org"
 <dmitry.baryshkov@linaro.org>
Subject: RE: [RFC PATCH v2 4/5] drm/msm/dp: replace dp_connector with
 drm_bridge_connector
Thread-Topic: [RFC PATCH v2 4/5] drm/msm/dp: replace dp_connector with
 drm_bridge_connector
Thread-Index: AQHYOPbpvT74UO3ZjEeT9eVJ9FelGqzCOJfw
Date: Wed, 16 Mar 2022 16:45:38 +0000
Message-ID: <MW4PR02MB7186CC4C92091EF914082C08E1119@MW4PR02MB7186.namprd02.prod.outlook.com>
References: <552d9809-0499-23b5-e437-a77c893b96c2@quicinc.com>
 <64a5ae1a-df65-b0a5-5d0d-cfb1d4da3bf7@quicinc.com>
In-Reply-To: <64a5ae1a-df65-b0a5-5d0d-cfb1d4da3bf7@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3de8b08c-e4f4-49c5-f61e-08da076c66c1
x-ms-traffictypediagnostic: CY4PR02MB2390:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <CY4PR02MB239015C95628B5876E3B8EB39D119@CY4PR02MB2390.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 763C+8G9YFOOq4QeJqAryo+iB2qCMJRovgoHvlE1AIR6RfeRl1rEY2gdM7/dhpMZA2XbzNUXi6bwRz4onWzhEaVgi0wAbLiT9Eopv40HbFAaXi5qvzqYj3KZHNHZSYgIzsyvxKPb1x7NaqxFC3XLbdV0WLY9rGmSZ2gJ+E2tkcynNPCYNJuZTikrsm5L8iMRe5ubh1UxltU8yKDORAFH+uxpxU4Q0XwptcoJ3lgQ2499wZ8gvyJbv7nQMhvcFyzj+/kHgjLi0M19g2DBNHMYTtndyf4rEYTXIhxndPVGWE8BHZ9sLO1bZG1lwaBQNHQCatv6ZwM91yTIz6ybAf5dSI4A7ADrMmW/yE5nleSSTE07JiB40XUtVsQXSB7Vbp+M0Feir76h4hG9HGaPaoooCeRigvDO7fSNtURdSgkd8hy2kPz96epT360XodlWGtAu1v8JhNG6Ts2XcgTbr7j9SuFNT5YEGIcODWvVxCkJbROBirC1jPgPjWcFOmFOKr0sek08EVmdEEg+OCAwJ1kdxv/GMagk4tAs5orpm+VM9vQyPE1APX4vr+i3lh/2EYV3fnAZX4kptbs0fMCrTvyNFmR2SSXWJPgHFuXAMHuc5a4qQK1Xff9de6bHZ9q/R/X5/38e9nwQsxbdzOqIDUwAUPNmy9xbI5CGBQPDoCZj8/+hxSTyplqAXOZmb2QjRvwHRW+s5xqGWo5Y6xA60NhjXw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR02MB7186.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(122000001)(33656002)(66446008)(66556008)(66476007)(8676002)(508600001)(4326008)(64756008)(66946007)(76116006)(316002)(55016003)(5660300002)(26005)(186003)(9686003)(8936002)(2906002)(52536014)(7696005)(6506007)(53546011)(86362001)(7416002)(38100700002)(38070700005)(110136005)(83380400001)(54906003)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b2FCbGRLdXZnK1FWd1JwdnpMMEduZkRJSlNxbWRzRDhtTHRuQXlqa0pWa0Zy?=
 =?utf-8?B?bnV4RFdLSXRVeWwzVDVZdTQ2QTRmSkxTY0thS2RsNkxRdlA4VU84RjFNQTE1?=
 =?utf-8?B?WEhmTWFqSHFsQVJDc2xYR2xxM2hBRTJDZXNaL0Z5dU9HWTU0MVIxdkZlVzBP?=
 =?utf-8?B?SFJnRzRlenBpVXpHa1ZuQ1I0TDdjR0NZU21PUHZmL3hiM2pnQ0tHY29CdW9B?=
 =?utf-8?B?Tm1QTmdUU0E0dGx4SUxjVkhNMTZkM0xzcm80TU1lODc4cWk3b2hvZmdWWGdm?=
 =?utf-8?B?WkVJb1dWWHhhU2xSQW9tY01iS0lqdlBsS3EwZTExQ2xtWXYzamdsVGZQNHlw?=
 =?utf-8?B?V1JyT240ZHhvNExNbHZyZUVPOW1xbmI2YW0zRmhUWnRhbUFoZjhOYXlmMzZT?=
 =?utf-8?B?VjJsaHU5bElEVWI4cVlzcStTSVFmMkZ1cGVCYVlrcTRvY1hoSVFrS2RkMkZo?=
 =?utf-8?B?dnpFczVicElsY2V2UzlzRnlHNlZXdFltT2h3cXEyVE9lY2ZUYjB3eC9NL1hi?=
 =?utf-8?B?SHFGZEJNT2VybW1SYW1pd0hZUFV6bk9WOG9ySW9iYU1XcFdDN1ZDcW9VTU8x?=
 =?utf-8?B?eFlBeU91YWZ1WWkxTUp5TDdUbkpRTllkVThCOEpSbG0wQTI0S0JOSTlSM3dt?=
 =?utf-8?B?NmxZLzhXTVl5RWRZWnJoaGUzZEtJN3I0Z1RoTDJHOEVLUmpXY3JCNkxWa2VK?=
 =?utf-8?B?UTlvZ2szdksyc3Rzd0VETXRtdkl0TTRHNXdobjNzMUdoTkx3RFYveDBrTHdE?=
 =?utf-8?B?VkJnQVJYZlV3RFpDWDNCV040bGJyZDRSTUlvZXJMWnFRVjVpNUVhdHcrVi83?=
 =?utf-8?B?NXZONHZndHAzdU9JWFIxd1NuMXZMV3dEcm5xeGVSdDVpWWFQTjNzUS9PSkNm?=
 =?utf-8?B?STFUdE5qUENGdVlIdkRzOHFMMFpWLzNvd1ljT3VlYVNCTDV4MmQ4NE81Nzc5?=
 =?utf-8?B?R3ZRVVZpR2J1Y0tsYklMbnFUSDkvdFBVcGprMHRXa3hiSXduaWg2Um5HRFVX?=
 =?utf-8?B?Wm5yWmFEcWJsQ1EvaHlOTmNFQUw0WnY4YmVYNHFBdUYxSjFZSDRwTmdzTnh2?=
 =?utf-8?B?Rzdud3RsMEttR3ZXRXUvTloveWJaam1IVnpaaDlGN2EyUDBnbXFXUkNobW4v?=
 =?utf-8?B?cE12WEZvQWNSWkhReDF6b21TRFh3bktNZC9DRjFyZzJuVzBMbVZ6OXZXd1JN?=
 =?utf-8?B?cFkwdmd3TmZ6V0FvenBGZk52MWZjbVgrUCtOWXNQWVJYNDRTS09FSDZ2T1ZO?=
 =?utf-8?B?NTNpNERkTzZwZUlUVG1EN294QXlFSnlFQjNXeXI0U25waHRhSFhlWXl4R3V5?=
 =?utf-8?B?dHg2MWJSbEVYb0l1clh6djhVL25QWnVkMUtBaDI5QnJQUkR3NTY2Y0FtdWtt?=
 =?utf-8?B?dnZNUWtkcDFmeDdFSWM5bFJ3M2RIR2R3ZWNDZjNmZEVuL3FIQnhJTVcyWmZP?=
 =?utf-8?B?dW93VEwvWFJzRFB3YjlOTU8wVXlvUmg1Sk11bWNBdk14MDFNODY3OWh5NTUv?=
 =?utf-8?B?ME8rWUdjUHBteFhENEkzaUVORyswalUzdDdCNFh4QmpzTGRFOEM4eUlyMWpD?=
 =?utf-8?B?RXZsaU5hOVd4bTdmeEhqMmVvdWc1eVBPSjlDUCsySlpRZmNpbWJpcGlXV3k0?=
 =?utf-8?B?NnBFdGExejY1SUczMkVCaE1keStJRnp4V0lDVUhHQkZvSnBZYUxmamV0WEZC?=
 =?utf-8?B?QzYxRUtBYWtMcFZDUHltVEFYU2YyME53dGxzbHA3SldzenBzOFgrYWVuVEVj?=
 =?utf-8?B?cmJQZ2VwSFpQcnJTRTc0QkJsMFB0N0l5WVB3cWpTK1FxNkNLUVBTbWdBeld1?=
 =?utf-8?B?WlJvaVdQTEx1MGhTd00rUXcrN09Bbzk3YnVtZGVTT2M4VWxFMFI2V1E0ekdL?=
 =?utf-8?B?My9weSt0S2Y2RU04OW9FQ0toRVhwdVFNUitnbFo1VEJ5Rm1zTVVhUHJqczZw?=
 =?utf-8?Q?C5tcxETo6m9MsNkT8V/Ms/C1Eu/vjgHe?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR02MB7186.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3de8b08c-e4f4-49c5-f61e-08da076c66c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2022 16:45:38.6028 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vKd7Bi79BElHBHtrUZ3gWuCpHTEBTRYBi04XmcLUfoCmjEfHG9OG9iZGGrJfru2rkBw0zZ4qUGoOcy7nuj76dbvAJKHTP1i2OdLaSfytVM0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB2390
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
Cc: "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 "Sankeerth Billakanti
 \(QUIC\)" <quic_sbillaka@quicinc.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
 "sean@poorly.run" <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBTdWJqZWN0OiBSZTogW1JGQyBQQVRDSCB2MiA0LzVdIGRybS9tc20vZHA6IHJlcGxhY2UgZHBf
Y29ubmVjdG9yIHdpdGgNCj4gZHJtX2JyaWRnZV9jb25uZWN0b3INCj4gRGF0ZTogV2VkLCAyMyBG
ZWIgMjAyMiAxNjo0MDo1NiAtMDgwMA0KPiBGcm9tOiBLdW9nZWUgSHNpZWggPHF1aWNfa2hzaWVo
QHF1aWNpbmMuY29tPg0KPiBUbzogU3RlcGhlbiBCb3lkIDxzd2JveWRAY2hyb21pdW0ub3JnPiwg
RG1pdHJ5IEJhcnlzaGtvdg0KPiA8ZG1pdHJ5LmJhcnlzaGtvdkBsaW5hcm8ub3JnPg0KPiBDQzog
QWJoaW5hdiBLdW1hciA8cXVpY19hYmhpbmF2a0BxdWljaW5jLmNvbT4sIEJqb3JuIEFuZGVyc3Nv
bg0KPiA8Ympvcm4uYW5kZXJzc29uQGxpbmFyby5vcmc+LCBSb2IgQ2xhcmsgPHJvYmRjbGFya0Bn
bWFpbC5jb20+LCBTZWFuIFBhdWwNCj4gPHNlYW5AcG9vcmx5LnJ1bj4sIERhdmlkIEFpcmxpZSA8
YWlybGllZEBsaW51eC5pZT4sIERhbmllbCBWZXR0ZXINCj4gPGRhbmllbEBmZndsbC5jaD4sIGxp
bnV4LWFybS1tc21Admdlci5rZXJuZWwub3JnLCBkcmktDQo+IGRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZywgZnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiANCj4gDQo+IE9uIDIv
MjMvMjAyMiAxOjMzIFBNLCBTdGVwaGVuIEJveWQgd3JvdGU6DQo+ID4gUXVvdGluZyBLdW9nZWUg
SHNpZWggKDIwMjItMDItMjMgMTA6Mjc6MjYpDQo+ID4+IE9uIDIvMjMvMjAyMiAxMDoyMiBBTSwg
RG1pdHJ5IEJhcnlzaGtvdiB3cm90ZToNCj4gPj4+IE9uIDIzLzAyLzIwMjIgMjA6MjEsIEt1b2dl
ZSBIc2llaCB3cm90ZToNCj4gPj4+DQo+ID4+PiBJbiB0aGUgcGFuZWwgZGV2aWNlIG5vZGUuDQo+
ID4+Pg0KPiA+Pj4gQ2FuIHlvdSBwbGVhc2Ugc2hhcmUgaXQgdG9vPw0KPiA+Pg0KPiA+PiAmc29j
IHsNCj4gPj4gICDCoMKgwqDCoMKgwqDCoCBlZHBfcG93ZXJfc3VwcGx5OiBlZHBfcG93ZXIgew0K
PiA+PiAgIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb21wYXRpYmxlID0gInJlZ3Vs
YXRvci1maXhlZCI7DQo+ID4+ICAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlZ3Vs
YXRvci1uYW1lID0gImVkcF9iYWNrbGlnaHRfcG93ZXIiOw0KPiA+Pg0KPiA+PiAgIMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZWd1bGF0b3ItYWx3YXlzLW9uOw0KPiA+PiAgIMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZWd1bGF0b3ItYm9vdC1vbjsNCj4gPj4gICDCoMKg
wqDCoMKgwqDCoCB9Ow0KPiA+Pg0KPiA+PiAgIMKgwqDCoMKgwqDCoMKgIGVkcF9iYWNrbGlnaHQ6
IGVkcF9iYWNrbGlnaHQgew0KPiA+PiAgIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBj
b21wYXRpYmxlID0gInB3bS1iYWNrbGlnaHQiOw0KPiA+Pg0KPiA+PiAgIMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBwd21zID0gPCZwbTgzNTBjX3B3bSAzIDY1NTM1PjsNCj4gPj4gICDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcG93ZXItc3VwcGx5ID0gPCZlZHBfcG93ZXJf
c3VwcGx5PjsNCj4gPj4gICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZW5hYmxlLWdw
aW8gPSA8JnBtODM1MGNfZ3Bpb3MgNyBHUElPX0FDVElWRV9ISUdIPjsNCj4gPj4NCj4gPj4gICDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsN
Cj4gPj4gICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGluY3RybC0wID0gPCZiYWNr
bGlnaHRfcHdtX2RlZmF1bHQ+Ow0KPiA+PiAgIMKgwqDCoMKgwqDCoMKgIH07DQo+ID4+DQo+ID4+
ICAgwqDCoMKgwqDCoMKgwqAgZWRwX3BhbmVsOiBlZHBfcGFuZWwgew0KPiA+PiAgIMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb21wYXRpYmxlID0gInNoYXJwX2xxMTQwbTFqdzQ2IjsN
Cj4gPiBJcyB0aGF0IHN1cHBvc2VkIHRvIGJlIHNoYXJwLGxxMTQwbTFqdzQ2IHdpdGggYSBjb21t
YSBpbnN0ZWFkIG9mIGFuDQo+ID4gdW5kZXJzY29yZT8NCj4gDQo+IFN0ZXBoZW4sDQo+IA0KPiBU
aGlzIGlzIG91ciBpbnRlcm5hbCBicmFuY2ggd2hpY2ggZG9lcyBub3QgaGF2ZSBwYXRjaGVzIHVw
IHRvIGRhdGUgeWV0Lg0KPiANCj4gSSB3aWxsIGNoZXJyeS1waWNrIG5ld2VyIGVkcCByZWxhdGVk
IHBhdGNoZXMgd2hpY2ggYXJlIHVuZGVyIHJldmlldyBub3cgdG8NCj4gcmUgdGVzdCBpdC4NCg0K
VGVzdGVkLWJ5OiBTYW5rZWVydGggQmlsbGFrYW50aSA8cXVpY19zYmlsbGFrYUBxdWljaW5jLmNv
bT4NCg0KRGV0ZWN0IHJldHVybmVkIGVEUCBub3QgY29ubmVjdGVkIGJlY2F1c2UgdGhlIHBhbmVs
IHBvd2VyIHdhcyBub3Qgb24gYW5kIG1vZGVfdmFsaWQgd2FzIGZhaWxpbmcgYmVjYXVzZSB0aGUg
RFAgbW9kZV92YWxpZCBpcyBkaWZmZXJlbnQgZnJvbSBlRFANCg==
