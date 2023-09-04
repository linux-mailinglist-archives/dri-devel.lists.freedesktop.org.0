Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84444791C59
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 20:08:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 825E710E0D7;
	Mon,  4 Sep 2023 18:08:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from de-smtp-delivery-113.mimecast.com
 (de-smtp-delivery-113.mimecast.com [194.104.111.113])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3293E10E0D7
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 18:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=toradex-com; t=1693850896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fk22hQVQEhlIiF2PqzQ91kuxeTmN8GISTuD5VXq4EqY=;
 b=N3lmaw+RPLyKEXG70UfPInobT/ikKSbKf8bd30DYFNCLEici0cLVDuOTaO9ykaF+MuWJuc
 Kh3id5kPuc3oIvzQEGu/icgGYUxHLLr3jaEk8jZnJTEtZGiv4qtymmERCjO/75XIGny5Px
 WZcTv+HIcjBGgQH6rWG+lOgSok6SQ7g=
Received: from CHE01-GV0-obe.outbound.protection.outlook.com
 (mail-gv0che01lp2042.outbound.protection.outlook.com [104.47.22.42]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-40-2G5Ms86mP0OIyWYjVgDUXg-3; Mon, 04 Sep 2023 20:08:14 +0200
X-MC-Unique: 2G5Ms86mP0OIyWYjVgDUXg-3
Received: from GVAP278MB0679.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:4b::13)
 by ZRAP278MB0143.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:12::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Mon, 4 Sep
 2023 18:08:12 +0000
Received: from GVAP278MB0679.CHEP278.PROD.OUTLOOK.COM
 ([fe80::b790:4918:d21c:71ff]) by GVAP278MB0679.CHEP278.PROD.OUTLOOK.COM
 ([fe80::b790:4918:d21c:71ff%4]) with mapi id 15.20.6745.030; Mon, 4 Sep 2023
 18:08:12 +0000
From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
To: "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>, Stefan Eichenberger
 <stefan.eichenberger@toradex.com>, "tomi.valkeinen@ideasonboard.com"
 <tomi.valkeinen@ideasonboard.com>, "adrien.grassein@gmail.com"
 <adrien.grassein@gmail.com>, "rfoss@kernel.org" <rfoss@kernel.org>,
 "airlied@gmail.com" <airlied@gmail.com>, Francesco Dolcini
 <francesco.dolcini@toradex.com>, "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>
Subject: Re: [PATCH 3/4] drm/bridge: lt8912b: Manually disable HPD only if it
 was enabled
Thread-Topic: [PATCH 3/4] drm/bridge: lt8912b: Manually disable HPD only if it
 was enabled
Thread-Index: AQHZ31rEQ9B5AddLfk2dySZvpk3rdg==
Date: Mon, 4 Sep 2023 18:08:12 +0000
Message-ID: <cb069b10a38b018868f370fada3e97da7257264b.camel@toradex.com>
References: <20230804-lt8912b-v1-0-c542692c6a2f@ideasonboard.com>
 <20230804-lt8912b-v1-3-c542692c6a2f@ideasonboard.com>
In-Reply-To: <20230804-lt8912b-v1-3-c542692c6a2f@ideasonboard.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GVAP278MB0679:EE_|ZRAP278MB0143:EE_
x-ms-office365-filtering-correlation-id: 9ea7a26c-8562-42cc-647a-08dbad71e731
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: ZxUpLSteGezpaw0AFEcSOc47FT32KRIFE27pVfVlLd8OnOPI2VQBBL9KyxKsGi6iQBQYH5DdMEE8+rsPy4Adl/3fNWy2wZlyhQgup2reaNgnVo+wMy6eIhxnx90ZjMRSDJa9FLVVk1lqGn54vXKF/xJHWcWt/BFWNVvUtRIpdXQgnBuWxb7KgQdBngF4JOy6JptpLc4Fap0nON1L5EP8LXEbPVGWE5wrIV/hPjZqgI/8yaax6M0ax99qAILxaS0jfZN6+KMuIlY+o/viSYKPe0hNlX8OJpPTu1jDp7ZuSpCs7+TG7g2mqchbO51XjcTLg7p2kkohEqE7tLNmDendgSNXOA83OdKTaWX25igfiU6adhlMLL/W7k9mQdOHYWNo6xnELpqfpkVNvVr+O5wfDPp544QTnURiwCa7O4utiK1/it/jjO+BcLjZWHcp3InONWDsT2U32RMhTUc6rHvBds6Ee2ia1hso/Fo5maWnuKu0CQyAPBFg3WzKx7/2LO0NQZq08qbH7BfsWUc1qFaliK3rUkIRGbhZlxPwe4WYoK5sHXQ1hvFKr9yIkU443I0a7pz5ZaTYE1jSmxkHn+fUQ+BBtSh6Ur5HGcoxztai4OBf3d0XFbuPQZXuZ09O5J3lkX19YxaJVCQDN7kTHSYk1Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GVAP278MB0679.CHEP278.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39840400004)(396003)(346002)(366004)(376002)(1800799009)(186009)(451199024)(2906002)(38070700005)(38100700002)(36756003)(86362001)(921005)(122000001)(71200400001)(4326008)(8936002)(8676002)(2616005)(5660300002)(44832011)(76116006)(91956017)(110136005)(41300700001)(6512007)(54906003)(64756008)(66446008)(66556008)(66946007)(66476007)(316002)(6506007)(6486002)(7416002)(83380400001)(478600001);
 DIR:OUT; SFP:1102
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V3YwbmJBN2lER2FyeHR1ajN0RHc0TFY0NVRCZ2tkSEdiMkxaTXpjUUdJV0JR?=
 =?utf-8?B?VTBFQTRiWnlxQkZrWHZnTU0zOE9vaFZYNno1MXI1Ty96eHJLZFlWS2lnbUFy?=
 =?utf-8?B?bWFNVjZqQlFVbW8yNllITFA4R0NCVTlhOXBTaE0rMHM2WGZ0UDBydVpSZURO?=
 =?utf-8?B?SWtFRTI4QnUvS0JMMGFZSWMxOStRd3QyNFFVSFpUMlFZV1JNVXNXK05wUmxO?=
 =?utf-8?B?cXpCa0tZOGVVSXJ1ZXRsUHY2YjQ3OTluWnBtRTQrRUhJR2N0QlR0WnBjbHM3?=
 =?utf-8?B?YlVmUTlJeG9pR1hUVG11N3lEQ0NLWjE3MTZ2dGdWZUlJNWZyakpGWHV3Qkdv?=
 =?utf-8?B?VVhUWWhCblY4ZTJvNm9sUDRIc0lzMGhuU1ErbkpXTmplV3ZCbGpLNTJLTkhK?=
 =?utf-8?B?UjRxajdLZ0xUS0hTSU1oWmltVFpFWWJsdzVhMWl3YlBUZTFEQ1F0cVlxMmpJ?=
 =?utf-8?B?MXR1bER0VzFoWjlSWWZneXd4S0FKQml2M3RnN0ZmV1ArNTRFclVwMjN3SldX?=
 =?utf-8?B?cGc0eWE5SlNGMlBuejJDWTJIUmlCbkFEQndlbFlXQTVuMnUyNU9yaFZwMFd0?=
 =?utf-8?B?dzI3WS80ZUlqeDZNMzVIWDFSdUJnTVZjQXFibkl2dTBCbnZLZ01BN2dBcHpG?=
 =?utf-8?B?c1l2dVQ4MXN1Q04yTUFacWI3QzdlYzNWbmVnSGNSQUV4V0FHOEVFVHl0Qnps?=
 =?utf-8?B?N2dYWXpoSG5pTVN5RytwZHBwaUFiSTVUZUpUTmlJZ0g1ZG04eXB6R25lc0lZ?=
 =?utf-8?B?MVIzYm81c0g5WlAvaGZFN29lSndheWh4U1ZMN2I1NXl1S1k5OHczbXJpdzJN?=
 =?utf-8?B?dU5Fdkw5VkFOMmNyWmRXWEh1MUZPNjVKeUs1emdoTCs0YlpiZlZEQUlSMXd5?=
 =?utf-8?B?SmJzQTdMMjhBZmZ5dlpsang3SDBNZ1hzVmdqZVFmRUp3VzVSU3NQbTRQWnp0?=
 =?utf-8?B?SDFqMC9NaGIrZ081UENTcjNxY0lPWlFNY0toaG1TNmVyTmFPV3lqeXZmL2RZ?=
 =?utf-8?B?MktyZlVFVFd5eG5JZHpSOGZRdVlWbHhwS3BtUHYrZDIrNmNaTzg4N2tNS0tY?=
 =?utf-8?B?djhpSXVDTDNIeEYzVFIvQVZBZnV1Tjd3Mmo1bXNHbEtSa2lLbFlyZHhza1M1?=
 =?utf-8?B?VGVPWStVNHA1RUdZNmZmNWovTWVnUlk3ZjlKU3ZIa1pSeHc1dmhYOW8vS0RL?=
 =?utf-8?B?dVhYbGovc1RKOWt1Vks0c1RSTmp5SWV6QnErRWtJL2tPZjJJTmI1UEtTUE80?=
 =?utf-8?B?amxaamo0ZE1sL2dGK05aNUVhWW4ySndsM3FOaVZyTmZtM25nZm5Vck9YWUdx?=
 =?utf-8?B?SEpIZWRaaHVxVlM1WVlDZVZ3cWRUKzZ2ZFpFRW1lR044ZXB1SHlvWXhNdVJs?=
 =?utf-8?B?VWczVDB0cnBqT0tkZTFkd2JFRUFoY21xREJMR1JCSDJINFhYbFRqRDJYZXdH?=
 =?utf-8?B?WWFHbTNQMXc3NVlCZGxGQzVqZmZWZFppa2hyckEydzZ6TWVnNG9qRWNkV1Fr?=
 =?utf-8?B?dC9qc1orSmhnN1hhWENKYlBXV3NWem5FanNxVDlkY09PWFRtdlc5VkZ0bWQ3?=
 =?utf-8?B?ZlFQUXFJYmxVMlJ4bnBPN3R5Skp3WTZYdm95cWI1RWdmb294VVMwcWhKZnhO?=
 =?utf-8?B?dk53VlJKYXNjMnZITGJCOUNWcHBUc3YrSHVwekcwYjdLZnQydDZ6eXN5SElC?=
 =?utf-8?B?YkN1dnFDN1NXbFdJK09ZUUVtVDROZHFqTlQrT3BoMlRPSkJ1NUlPYTNwdHhV?=
 =?utf-8?B?cnJMYmZzcjdSNXFGZnRWQzZ5SEhNejc3eU1lTFhGbEdWVlBlOENHdUtLQkpv?=
 =?utf-8?B?L2o3UjFEZy9IcFJHM2FBbldnZGl3UTZ4WGFPcHZybjhHWXBzclYzUEdkQ1Vo?=
 =?utf-8?B?SXQxZUh5MHhaWVQrU0VhQkhGMnFXRVFBc2hUZkg0VVNCSVNtQnFnQzl4Vmtq?=
 =?utf-8?B?WEJzTjhGc0w3Qmh3RStYKyt3ZUo1MDFOYW90OUJHVEpoSzJOMEc3Z0wyaEVl?=
 =?utf-8?B?YmF2VzlxZkpSc08xNThxZEwxb3dxbnlRNUVBblk0N240QVFLb1pDMWwrWm5u?=
 =?utf-8?B?K1BocTRmN0cyd1kycXVQWHhlQmdCQ2xRYmh6ZGJxY3ZUZXc3ZkNseXBwSUpy?=
 =?utf-8?B?U3dyckRZMk1GY0tWUGYzM3h3V0xKYU1HK2tKRE05TmtDSjM2MlN1b0dHaVRy?=
 =?utf-8?Q?at9nkwgn2Kpxm6qXWmCcuco=3D?=
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GVAP278MB0679.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ea7a26c-8562-42cc-647a-08dbad71e731
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2023 18:08:12.4537 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Oxd0hyChZX/r+HfB9Dm3t5WMOkBUhgqF/1WCyVQVQKJhQjJ/cIYLgsBQBaHwwpl0JNrE9c2SpqYiWPmuaTTu/UyYshrgnzE91zwnsn9Zc2E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZRAP278MB0143
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: toradex.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-ID: <367F2779FF10D7409ED9885EB2E3801F@CHEP278.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVG9taQ0KDQpMb29rcyBnb29kLiBUaGFua3MhIFRlc3RlZCBib3RoIG9uIFZlcmRpbiBBTTYy
IGFzIHdlbGwgYXMgb24gVmVyZGluIGlNWDhNIE1pbmkuDQoNCkp1c3QgYSBtaW5vciBuaXQtcGlj
ayBpbiB5b3VyIGNvbW1pdCBtZXNzYWdlLg0KDQpPbiBGcmksIDIwMjMtMDgtMDQgYXQgMTM6NDgg
KzAzMDAsIFRvbWkgVmFsa2VpbmVuIHdyb3RlOg0KPiBsdDg5MTJiIG9ubHkgY2FsbHMgZHJtX2Jy
aWRnZV9ocGRfZW5hYmxlKCkgaWYgaXQgY3JlYXRlcyBhIGNvbm5lY3RvciBhbmQNCj4gdGhlIG5l
eHQgYnJpZGdlIGhhcyBEUk1fQlJJREdFX09QX0hQRCBzZXQuIEhvd2V2ZXIsIHdoZW4gY2FsbGlu
Zw0KPiBkcm1fYnJpZGdlX2hwZF9kaXNhYmxlKCkgaXQgbWlzc2VzIGNoZWNraW5nIGlmIGEgY29u
bmVjdG9yIHdhcyBjcmVhdGVkLA0KPiBjYWxsaW5nIGRybV9icmlkZ2VfaHBkX2Rpc2FibGUoKSBl
dmVuIGlmIEhQRCB3YXMgbmVudmVyIGVuYWJsZWQuIEkgZG9uJ3QNCg0Kd2FzIG5ldmVyIGVuYWJs
ZWQNCg0KPiBzZWUgYW55IGlzc3VlcyBjYXVzaW5nIGJ5IHRoaXMgd3JvbmcgY2FsbCwgdGhvdWdo
Lg0KDQphbnkgaXNzdWVzIGNhdXNlZCBieSB0aGlzIHdyb25nIGNhbGwNCg0KPiBBZGQgdGhlIGNo
ZWNrIHRvIGF2b2lkIHdyb25nbHkgY2FsbGluZyBkcm1fYnJpZGdlX2hwZF9kaXNhYmxlKCkuDQo+
IA0KPiBGaXhlczogM2IwYTAxYTZhNTIyICgiZHJtL2JyaWRnZTogbHQ4OTEyYjogQWRkIGhvdCBw
bHVnIGRldGVjdGlvbiIpDQo+IFNpZ25lZC1vZmYtYnk6IFRvbWkgVmFsa2VpbmVuIDx0b21pLnZh
bGtlaW5lbkBpZGVhc29uYm9hcmQuY29tPg0KDQpGb3IgdGhlIHdob2xlIHNlcmllczoNCg0KVGVz
dGVkLWJ5OiBNYXJjZWwgWmlzd2lsZXIgPG1hcmNlbC56aXN3aWxlckB0b3JhZGV4LmNvbT4NCg0K
PiAtLS0NCj4gwqBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2xvbnRpdW0tbHQ4OTEyYi5jIHwgMiAr
LQ0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiAN
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvbG9udGl1bS1sdDg5MTJiLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2xvbnRpdW0tbHQ4OTEyYi5jDQo+IGluZGV4IDJkNzUy
ZTA4MzQzMy4uOWVlNjM5ZTc1YTFjIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL2xvbnRpdW0tbHQ4OTEyYi5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvbG9u
dGl1bS1sdDg5MTJiLmMNCj4gQEAgLTU4Nyw3ICs1ODcsNyBAQCBzdGF0aWMgdm9pZCBsdDg5MTJf
YnJpZGdlX2RldGFjaChzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlKQ0KPiDCoA0KPiDCoMKgwqDC
oMKgwqDCoMKgbHQ4OTEyX2hhcmRfcG93ZXJfb2ZmKGx0KTsNCj4gwqANCj4gLcKgwqDCoMKgwqDC
oMKgaWYgKGx0LT5oZG1pX3BvcnQtPm9wcyAmIERSTV9CUklER0VfT1BfSFBEKQ0KPiArwqDCoMKg
wqDCoMKgwqBpZiAobHQtPmNvbm5lY3Rvci5kZXYgJiYgbHQtPmhkbWlfcG9ydC0+b3BzICYgRFJN
X0JSSURHRV9PUF9IUEQpDQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZHJtX2Jy
aWRnZV9ocGRfZGlzYWJsZShsdC0+aGRtaV9wb3J0KTsNCj4gwqB9DQoNCkNoZWVycw0KDQpNYXJj
ZWwNCg==

