Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 653C81A64B2
	for <lists+dri-devel@lfdr.de>; Mon, 13 Apr 2020 11:29:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02F3E6E421;
	Mon, 13 Apr 2020 09:29:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com
 [148.163.135.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E74889C59
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Apr 2020 08:39:46 +0000 (UTC)
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
 by mx0a-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03D8ZlEU005571; Mon, 13 Apr 2020 04:39:31 -0400
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
 by mx0a-00128a01.pphosted.com with ESMTP id 30b7r5xqru-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Apr 2020 04:39:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m95MxQW7AU+1+xMGNEFnd17Nr+/A5+eOTHBiyUmwnFAR1TOyxq5BfDxg1GtDcLQ6dAwhB1tKNemr8FFsBLZrF6EwjccRKUEKYr0Zoms6fXCiY1O4Rehf2jsyCk6SZI+lV6l8AumgLxmRJgR+fOnEl0lTsYf9vH4SNo95c4QT3pX3noK4hfU7968A4G6Ofp7Jzt8M6ai1lwPDSaPpP6CoHt3N3SGHx+l+Mlfj+7eQ0nCJ8eWKkmsCgQyL9FnfYEPnkspqdnlUVyrT9Zhs4ts+OWDluUJA7hGEJv1EM8F86WfkDLMrYFRq7rW69pyXjoLLkbAwAI36G43rH6R67r0Nzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dWmKmTgf1zVlX3nWh5Bqi3KTfiBx8EnWWgPRZ1j6dEM=;
 b=a5Ni3NAohC7dxrWK3pGz3Psc42s4fHss3QunPT8dwAs2gJdDfVdVnEXvH0TRACAaOhspDCLfIByRVuc04JLG5Q+yQQY3BzbFOCizq52mRJi2M8IuiF3/UXJ0tx7QkcvEYA5rl2M1OwEEIOrl8E0ygeIF9SrdXYq7J/W5/mwqSHA0N8Qea4mPXHooTGWilPyEIHjJhmqe0GlmB6Pr/RsFhtR0yieZSzD5KHEtLcidq0zeRxulKyhNnHyte2LdJc8bOrfISxfVIwAF6NuimBckwT9j1m/f107iKPPmooHGdVmUWQgf9KSpblfMVdELqjoySltrvgtdMWmOUDP2FabZvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dWmKmTgf1zVlX3nWh5Bqi3KTfiBx8EnWWgPRZ1j6dEM=;
 b=oAaf0jQgjVuRA73qxbl/ZDZgNR4nd30HpnxnxFH4guThr4OcavG7b4AIVAJxC+f1FIKVK3UGDPYRP1UUq19UikBISbGMaU153s2QpPIc1DdS1YiJOqlpnkehOQiZm/n/Diaw/4jbTOXY1alHmCtIa6iE6nxhIvhjMrANNRFlWBw=
Received: from DM6PR03MB5274.namprd03.prod.outlook.com (2603:10b6:5:24b::14)
 by DM6PR03MB3817.namprd03.prod.outlook.com (2603:10b6:5:50::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.28; Mon, 13 Apr
 2020 08:39:29 +0000
Received: from DM6PR03MB5274.namprd03.prod.outlook.com
 ([fe80::41b:c63a:335f:b637]) by DM6PR03MB5274.namprd03.prod.outlook.com
 ([fe80::41b:c63a:335f:b637%5]) with mapi id 15.20.2878.028; Mon, 13 Apr 2020
 08:39:29 +0000
From: "Togorean, Bogdan" <Bogdan.Togorean@analog.com>
To: Andrzej Hajda <a.hajda@samsung.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [RESEND 2/2] drm: bridge: adv7511: Extend list of audio sample
 rates
Thread-Topic: [RESEND 2/2] drm: bridge: adv7511: Extend list of audio sample
 rates
Thread-Index: AQHV6wrnb32BIu99g0+rwV7SMOiq0ahuBu+AgAj/BPA=
Date: Mon, 13 Apr 2020 08:39:29 +0000
Message-ID: <DM6PR03MB527487EAB8D2977CF1925BBC9BDD0@DM6PR03MB5274.namprd03.prod.outlook.com>
References: <20200224120155.15510-1-bogdan.togorean@analog.com>
 <CGME20200224165503eucas1p2a8aea2390c4b0421e99641e0d4183167@eucas1p2.samsung.com>
 <20200224120155.15510-2-bogdan.togorean@analog.com>
 <6ecea2a4-ba7a-929e-3536-22bbb1a39f40@samsung.com>
In-Reply-To: <6ecea2a4-ba7a-929e-3536-22bbb1a39f40@samsung.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?utf-8?B?UEcxbGRHRStQR0YwSUc1dFBTSmliMlI1TG5SNGRDSWdjRDBpWXpwY2RYTmxj?=
 =?utf-8?B?bk5jWW5SdloyOXlaV0ZjWVhCd1pHRjBZVnh5YjJGdGFXNW5YREE1WkRnME9X?=
 =?utf-8?B?STJMVE15WkRNdE5HRTBNQzA0TldWbExUWmlPRFJpWVRJNVpUTTFZbHh0YzJk?=
 =?utf-8?B?elhHMXpaeTAwTmpsaVl6STNZaTAzWkRZeUxURXhaV0V0T0RZek1TMHhPREZr?=
 =?utf-8?B?WldFMU5EWmxaREpjWVcxbExYUmxjM1JjTkRZNVltTXlOMk10TjJRMk1pMHhN?=
 =?utf-8?B?V1ZoTFRnMk16RXRNVGd4WkdWaE5UUTJaV1F5WW05a2VTNTBlSFFpSUhONlBT?=
 =?utf-8?B?SXhOakUxSWlCMFBTSXhNekl6TVRJME1EYzJOak00TXpreE5UUWlJR2c5SWpG?=
 =?utf-8?B?NVZVRmFjemhCV2tOVVZuQnlRM1phZUcxV2FtNUVjbEp0UlQwaUlHbGtQU0lp?=
 =?utf-8?B?SUdKc1BTSXdJaUJpYnowaU1TSWdZMms5SW1OQlFVRkJSVkpJVlRGU1UxSlZS?=
 =?utf-8?B?azVEWjFWQlFVVnZRMEZCUTNsQ2VUUkxZbmhJVjBGU1VuTmxiM2RoVURRNFUw?=
 =?utf-8?B?WkhlRFpxUW04dmFuaEpSRUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRklRVUZCUVVSaFFWRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGRlFVRlJRVUpCUVVGQldHWnFXRVYzUVVGQlFVRkJRVUZCUVVGQlFVRkJT?=
 =?utf-8?B?alJCUVVGQ2FFRkhVVUZoVVVKbVFVaE5RVnBSUW1wQlNGVkJZMmRDYkVGR09F?=
 =?utf-8?B?RmpRVUo1UVVjNFFXRm5RbXhCUjAxQlpFRkNla0ZHT0VGYVowSm9RVWQzUVdO?=
 =?utf-8?B?M1FteEJSamhCV21kQ2RrRklUVUZoVVVJd1FVZHJRV1JuUW14QlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVWQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlowRkJRVUZCUVc1blFVRkJSMFZCV2tGQ2NFRkdPRUZqZDBKc1FVZE5RV1JS?=
 =?utf-8?B?UW5sQlIxVkJXSGRDZDBGSVNVRmlkMEp4UVVkVlFWbDNRakJCU0UxQldIZENN?=
 =?utf-8?B?RUZIYTBGYVVVSjVRVVJGUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRlJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRMEZCUVVGQlFVTmxRVUZCUVZsUlFtdEJSMnRCV0hkQ2Vr?=
 =?utf-8?B?RkhWVUZaZDBJeFFVaEpRVnBSUW1aQlNFRkJZMmRDZGtGSGIwRmFVVUpxUVVo?=
 =?utf-8?B?UlFXTjNRbVpCU0ZGQllWRkNiRUZJU1VGTlowRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZDUVVGQlFVRkJRVUZCUVVsQlFVRkJRVUZCUFQwaUx6NDhMMjFs?=
 =?utf-8?Q?dGE+?=
x-dg-rorf: true
x-originating-ip: [5.15.28.91]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 66408f48-bbef-4ff8-9234-08d7df862e53
x-ms-traffictypediagnostic: DM6PR03MB3817:
x-microsoft-antispam-prvs: <DM6PR03MB381792055B48DCA1E7FACF449BDD0@DM6PR03MB3817.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 037291602B
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR03MB5274.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(39860400002)(346002)(366004)(376002)(396003)(136003)(186003)(52536014)(71200400001)(26005)(76116006)(66476007)(5660300002)(64756008)(66446008)(478600001)(7696005)(66946007)(66556008)(6506007)(316002)(8676002)(54906003)(110136005)(9686003)(4326008)(55016002)(81156014)(33656002)(7416002)(8936002)(86362001)(2906002);
 DIR:OUT; SFP:1101; 
received-spf: None (protection.outlook.com: analog.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BWyqYOs4soWtUUvccqWRnfvYdZOqeMJdM68TVfjL/RiYsFgrXT56jX0/RAQsO7638ZmR8MjDYVBHItzT3BhllwQwsdlLArvdQtDdNDhZrQr3mMxIEwJJbfW2X4rrkAr9wp2oFuddglMw8pbIlyegzcQsVgEGEiGM5IcmePIzbD8EWjVKqU6vgkros4b4dGLJnxkZxMH1b2iQaPXLZ35kMuoa81zCZ/rJU6C01JJ9pCitguSfNMHookV5HsRX6ti1ueuJmTCBc2sSfw22/S5NGDjcArHhprAcCocGcwR28r8uj3pC96uqk4YtpsB7cVMs/X3lATI3evgEv7rCh2WnBigqisFWaYYTe+q+8FMuMkqqGQCtvwkY04u6VlRcuoAWV1FRYm3vzukWy7MgBhpzFsaYVhk0CS0JuXxl98usjT6Xs745Zxf1/9YVGsStOyBU
x-ms-exchange-antispam-messagedata: YigT1RGHz8xzNzFUJ93ZNaOn2NFH4LcbDYKjuyWgpU6bF06Zy6r3Yc7QGd+sJ+oJWqvDAykg+IXp5fIiCk8tguU/d5WSE/YDxYOGpDr86U8B2K9QyiTOK9ndNkFK9BD/OTwPJvlh8pRI6P5faR1OOw==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66408f48-bbef-4ff8-9234-08d7df862e53
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2020 08:39:29.1756 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qbQ66lK3TR+HKDxj2y73zyIVSiddstoZeOLtlfViDCneF1B0XgdMYWb2VmBkrBY9wUjPhm0CAK1zhMQ5Z9ZYySroL0002qKlEUMZTN0Z/cY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3817
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-13_02:2020-04-12,
 2020-04-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0 adultscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004130077
X-Mailman-Approved-At: Mon, 13 Apr 2020 09:29:25 +0000
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
Cc: "jernej.skrabec@siol.net" <jernej.skrabec@siol.net>,
 "narmstrong@baylibre.com" <narmstrong@baylibre.com>,
 "airlied@linux.ie" <airlied@linux.ie>, "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "alexios.zavras@intel.com" <alexios.zavras@intel.com>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiA+IEFEVjc1MTEgc3VwcG9ydCBzYW1wbGUgcmF0ZXMgdXAgdG8gMTkya0h6LiBDVFMgYW5kIE4g
cGFyYW1ldGVycyBzaG91bGQNCj4gPiBiZSBjb21wdXRlZCBhY2NvcmRpbmdseSBzbyB0aGlzIGNv
bW1pdCBleHRlbmQgdGhlIGxpc3QgdXAgdG8gbWF4aW11bQ0KPiA+IHN1cHBvcnRlZCBzYW1wbGUg
cmF0ZS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJvZ2RhbiBUb2dvcmVhbiA8Ym9nZGFuLnRv
Z29yZWFuQGFuYWxvZy5jb20+DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
YWR2NzUxMS9hZHY3NTExX2F1ZGlvLmMgfCAxMiArKysrKysrKysrKysNCj4gPiAgMSBmaWxlIGNo
YW5nZWQsIDEyIGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYnJpZGdlL2Fkdjc1MTEvYWR2NzUxMV9hdWRpby5jDQo+IGIvZHJpdmVycy9ncHUvZHJt
L2JyaWRnZS9hZHY3NTExL2Fkdjc1MTFfYXVkaW8uYw0KPiA+IGluZGV4IDFlOWIxMjhkMjI5Yi4u
MTNlOGNlZTZlODI3IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYWR2
NzUxMS9hZHY3NTExX2F1ZGlvLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Fk
djc1MTEvYWR2NzUxMV9hdWRpby5jDQo+ID4gQEAgLTI3LDYgKzI3LDE4IEBAIHN0YXRpYyB2b2lk
IGFkdjc1MTFfY2FsY19jdHNfbih1bnNpZ25lZCBpbnQgZl90bWRzLA0KPiB1bnNpZ25lZCBpbnQg
ZnMsDQo+ID4gIAljYXNlIDQ4MDAwOg0KPiA+ICAJCSpuID0gNjE0NDsNCj4gPiAgCQlicmVhazsN
Cj4gPiArCWNhc2UgODgyMDA6DQo+ID4gKwkJKm4gPSAxMjU0NDsNCj4gPiArCQlicmVhazsNCj4g
PiArCWNhc2UgOTYwMDA6DQo+ID4gKwkJKm4gPSAxMjI4ODsNCj4gPiArCQlicmVhazsNCj4gPiAr
CWNhc2UgMTc2NDAwOg0KPiA+ICsJCSpuID0gMjUwODg7DQo+ID4gKwkJYnJlYWs7DQo+ID4gKwlj
YXNlIDE5MjAwMDoNCj4gPiArCQkqbiA9IDI0NTc2Ow0KPiA+ICsJCWJyZWFrOw0KPiANCj4gDQo+
IEkgd291bGQgcHV0Og0KPiANCj4gY2FzZSAzMjAwMDoNCj4gY2FzZSA0ODAwMDoNCj4gY2FzZSA5
NjAwMDoNCj4gY2FzZSAxOTIwMDA6DQo+IMKgwqDCoCAqbiA9IGZzICogMTI4IC8gMTAwMDsNCj4g
wqDCoMKgIGJyZWFrOw0KPiBjYXNlIDQ0MTAwOg0KPiBjYXNlIDg4MjAwOg0KPiBjYXNlIDE3NjQw
MDoNCj4gwqDCoMKgICpuID0gZnMgKiAxMjggLyA5MDA7DQo+IMKgwqDCoCBicmVhazsNCj4gDQo+
IFRvIHVuY292ZXIgdGhlIG1hZ2ljLiBVcCB0byB5b3UuDQpHcmVhdCBzb2x1dGlvbiBBbmRyemVq
LA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgc3VnZ2VzdGlvbi4NCg0KUmVnYXJkcywNCkJvZ2Rhbg0K
PiANCj4gUmV2aWV3ZWQtYnk6IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5jb20+DQo+
IA0KPiANCj4gUmVnYXJkcw0KPiBBbmRyemVqDQo+ID4gIAl9DQo+ID4NCj4gPiAgCSpjdHMgPSAo
KGZfdG1kcyAqICpuKSAvICgxMjggKiBmcykpICogMTAwMDsNCj4gDQoNCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
