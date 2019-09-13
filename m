Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 237F5B1C10
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2019 13:17:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08EF06EF19;
	Fri, 13 Sep 2019 11:17:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720058.outbound.protection.outlook.com [40.107.72.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 635CE6EF17
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2019 11:17:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HDLpNFfF0Gko8qyef/CMv+viumi+STdhmpIW13NckttDeywpx6dEngLAax8jyROG5aWiY3qknmbv3L9ymRfHfr5r1t3Ucm+e2TbkNfEk+aJbqSWMko2kKWATOi07yR8nMlM7s6td3sU6FX8kO715y7nO0a2QF0skFiPslF+lO585GGowtzy9zsmkZyUbuZrCHtZ5QIkrDE858KGDcAJ/6RTNgIDy7/l0S0xnU4VmCYQNmk1E4TY/byxP177g8Oex/UqZhS5gp7bf36f6n72E5S/ndilUv+/iM48bq+Ob9l4VNVrk2uDYGyAlctKyvDzufthNgljyMqQl8sNxf6bteA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UO5l3PQjM1ugJB4L/UbjGpVqlxVIMyjKLeICQsafB1M=;
 b=IIQcWmWv2We53rLJSxFAII75tceEWblyun/2EaPzL8yF05UVllJbb5cKG7/AuPC/fZkIGI5e+P4/x1VquqhP8hAfLdy/BtnsRLOytU7WJF9Jb/uJnsfolt4pYnSyrEwEjLxyn+pyM/hCIrZ8WAEKqKMm5ntSI7fxq3nJzqcXI8fvDnOf5ybtNrr3tV9LUlUzFIxD3AduDEAkdkpJpdYEkNZk6fR3hzh1XJg4kzQbV40KZjt6faBGEcg/rSLYZ1bOTtw5Dard7MJy/RHZgbWsEbtq6kgaB+exiFt9X1gZNRIx4WGdjdDqW9GECJdnrVJg1ba6YbiMYIKC7D9jW5VdJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB2390.namprd12.prod.outlook.com (52.132.141.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.17; Fri, 13 Sep 2019 11:17:26 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::9d43:b3d4:9ef:29fc]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::9d43:b3d4:9ef:29fc%8]) with mapi id 15.20.2241.022; Fri, 13 Sep 2019
 11:17:25 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0gKFZNd2FyZSk=?= <thomas_os@shipmail.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/ttm: Restore ttm prefaulting
Thread-Topic: [PATCH] drm/ttm: Restore ttm prefaulting
Thread-Index: AQHVaZllC5mEYnEjvkKjhlVosNMZ2qcpb6AAgAAD7wCAAALagA==
Date: Fri, 13 Sep 2019 11:17:25 +0000
Message-ID: <e5149328-480c-6952-2ecc-08f8c8af0a2d@amd.com>
References: <20190912183854.28194-1-thomas_os@shipmail.org>
 <0b4ef153-535d-593f-48ef-b0fb90b85096@amd.com>
 <fea9cb69-7dd9-d068-6603-8b59849e16c5@shipmail.org>
In-Reply-To: <fea9cb69-7dd9-d068-6603-8b59849e16c5@shipmail.org>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0088.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:18::28) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3221dc75-509f-431b-152c-08d7383bf4a4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM5PR12MB2390; 
x-ms-traffictypediagnostic: DM5PR12MB2390:
x-microsoft-antispam-prvs: <DM5PR12MB23904B7145DFC4E90D70E01883B30@DM5PR12MB2390.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0159AC2B97
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(396003)(366004)(346002)(376002)(189003)(199004)(446003)(31686004)(4326008)(7736002)(66476007)(25786009)(66946007)(86362001)(64756008)(53936002)(71200400001)(305945005)(36756003)(6246003)(66446008)(66556008)(71190400001)(14454004)(66574012)(6512007)(6486002)(229853002)(8936002)(2906002)(81166006)(81156014)(8676002)(6116002)(99286004)(54906003)(5660300002)(52116002)(53546011)(102836004)(6436002)(76176011)(58126008)(110136005)(316002)(386003)(6506007)(46003)(31696002)(478600001)(65806001)(65956001)(256004)(2501003)(486006)(476003)(14444005)(2616005)(186003)(11346002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2390;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: nEPeY9lmkgvL+3lc2lQtD9q+q0GaJCrqv8ja6ydtu+JgV80CpvUBBzbO12BbVKwK46fZhmmFp80u0KBfCJfqF3LiCb+xdfhqCwc72pppMhaNjB7sUiHj8IEg3YtTsSgO0Qn2KaxCCKtARrQIZGEOxynERcJIdP1g33bSjfxfTXTP8KnkVlJGwr2eHdOPXHZQ7peCrv+elLdc4eHw3EYQdclnwP9x+jqs+wKkDkXqLNHh5cOF57tdiRvuGskwMZkZj5wNzlQTc6VEMSnvnt+Qdr8dfI9+onEcu9u4/wBq+vb64URSTRmp8Z48NBYmtDdbhXVdV460U2FjSlPX6xJIU2YiiIcmvXcUlFkOsMWEGyWsabDIvjftk4SJR91MR44M6jIpmu7gs3/hYvtAyKK8EJhOOskw2Eb9R5BLWHT/jr0=
x-ms-exchange-transport-forked: True
Content-ID: <945216581EC77C4597D03525D64FC769@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3221dc75-509f-431b-152c-08d7383bf4a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2019 11:17:25.8502 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DwxqKwS+EZ3LPpzzc78WRZDQ9l8mF3ohJo9uV6NMnzY1vpZoe7PsN4cF+ttU741o
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2390
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UO5l3PQjM1ugJB4L/UbjGpVqlxVIMyjKLeICQsafB1M=;
 b=ZypMIWMV0RbSIkDbRyT7sN6kmBR9AqM47MhzBRmQ6G0RD8NYTXm8FPvyZUnsVXGuSWydDCePSZk3OlrU7JFOezJrJHR8hw9SIdbBu7N/Gwwx1uy2xtyj1ZjgEYD30YY0bylSvtiC8nBGly17Qv9hePEideK/lpuV80yIjqB6ysk=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: "pv-drivers@vmware.com" <pv-drivers@vmware.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 "linux-graphics-maintainer@vmware.com" <linux-graphics-maintainer@vmware.com>,
 Souptick Joarder <jrdr.linux@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTMuMDkuMTkgdW0gMTM6MDcgc2NocmllYiBUaG9tYXMgSGVsbHN0csO2bSAoVk13YXJlKToN
Cj4gT24gOS8xMy8xOSAxMjo1MyBQTSwgS29lbmlnLCBDaHJpc3RpYW4gd3JvdGU6DQo+PiBBbSAx
Mi4wOS4xOSB1bSAyMDozOCBzY2hyaWViIFRob21hcyBIZWxsc3Ryw7ZtIChWTXdhcmUpOg0KPj4+
IEZyb206IFRob21hcyBIZWxsc3Ryb20gPHRoZWxsc3Ryb21Adm13YXJlLmNvbT4NCj4+Pg0KPj4+
IENvbW1pdCA0ZGFhNGZiYTNhMzggKCJncHU6IGRybTogdHRtOiBBZGRpbmcgbmV3IHJldHVybiB0
eXBlIA0KPj4+IHZtX2ZhdWx0X3QiKQ0KPj4+IGJyb2tlIFRUTSBwcmVmYXVsdGluZy4gU2luY2Ug
dm1mX2luc2VydF9taXhlZCgpIHR5cGljYWxseSBhbHdheXMgDQo+Pj4gcmV0dXJucw0KPj4+IFZN
X0ZBVUxUX05PUEFHRSwgcHJlZmF1bHRpbmcgc3RvcHMgYWZ0ZXIgdGhlIHNlY29uZCBQVEUuDQo+
Pj4NCj4+PiBSZXN0b3JlIChhbG1vc3QpIHRoZSBvcmlnaW5hbCBiZWhhdmlvdXIuIFVuZm9ydHVu
YXRlbHkgd2UgY2FuIG5vIGxvbmdlcg0KPj4+IHdpdGggdGhlIG5ldyB2bV9mYXVsdF90IHJldHVy
biB0eXBlIGRldGVybWluZSB3aGV0aGVyIGEgcHJlZmF1bHRpbmcNCj4+PiBQVEUgaW5zZXJ0aW9u
IGhpdCBhbiBhbHJlYWR5IHBvcHVsYXRlZCBQVEUsIGFuZCB0ZXJtaW5hdGUgdGhlIGluc2VydGlv
bg0KPj4+IGxvb3AuIEluc3RlYWQgd2UgY29udGludWUgd2l0aCB0aGUgcHJlLWRldGVybWluZWQg
bnVtYmVyIG9mIHByZWZhdWx0cy4NCj4+Pg0KPj4+IEZpeGVzOiA0ZGFhNGZiYTNhMzggKCJncHU6
IGRybTogdHRtOiBBZGRpbmcgbmV3IHJldHVybiB0eXBlIA0KPj4+IHZtX2ZhdWx0X3QiKQ0KPj4+
IENjOiBTb3VwdGljayBKb2FyZGVyIDxqcmRyLmxpbnV4QGdtYWlsLmNvbT4NCj4+PiBDYzogQ2hy
aXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPg0KPj4+IFNpZ25lZC1vZmYt
Ynk6IFRob21hcyBIZWxsc3Ryb20gPHRoZWxsc3Ryb21Adm13YXJlLmNvbT4NCj4+IFJldmlld2Vk
LWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+DQo+Pg0KPj4g
R29pbmcgdG8gcGljayB0aGF0IHVwIHdoZW4gQWxleCByZWJhc2VzIG91ciB1cHN0cmVhbSBicmFu
Y2guDQo+Pg0KPj4gQ2hyaXN0aWFuLg0KPj4NCj4+PiAtLS0NCj4+PiDCoMKgIGRyaXZlcnMvZ3B1
L2RybS90dG0vdHRtX2JvX3ZtLmMgfCAxNiArKysrKysrLS0tLS0tLS0tDQo+Pj4gwqDCoCAxIGZp
bGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQ0KPj4+DQo+Pj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3ZtLmMgDQo+Pj4gYi9kcml2ZXJz
L2dwdS9kcm0vdHRtL3R0bV9ib192bS5jDQo+Pj4gaW5kZXggNWE1ODBhZGViOWQxLi5hYTE4ZThh
NTM3MjcgMTAwNjQ0DQo+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdm0uYw0K
Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3ZtLmMNCj4+PiBAQCAtMjkwLDE1
ICsyOTAsMTMgQEAgdm1fZmF1bHRfdCB0dG1fYm9fdm1fZmF1bHRfcmVzZXJ2ZWQoc3RydWN0IA0K
Pj4+IHZtX2ZhdWx0ICp2bWYsDQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgZWxzZQ0KPj4+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0ID0gdm1mX2luc2VydF9wZm4oJmN2bWEsIGFk
ZHJlc3MsIHBmbik7DQo+Pj4gwqDCoCAtwqDCoMKgwqDCoMKgwqAgLyoNCj4+PiAtwqDCoMKgwqDC
oMKgwqDCoCAqIFNvbWVib2R5IGJlYXQgdXMgdG8gdGhpcyBQVEUgb3IgcHJlZmF1bHRpbmcgdG8N
Cj4+PiAtwqDCoMKgwqDCoMKgwqDCoCAqIGFuIGFscmVhZHkgcG9wdWxhdGVkIFBURSwgb3IgcHJl
ZmF1bHRpbmcgZXJyb3IuDQo+Pj4gLcKgwqDCoMKgwqDCoMKgwqAgKi8NCj4+PiAtDQo+Pj4gLcKg
wqDCoMKgwqDCoMKgIGlmICh1bmxpa2VseSgocmV0ID09IFZNX0ZBVUxUX05PUEFHRSAmJiBpID4g
MCkpKQ0KPj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOw0KPj4+IC3CoMKgwqDCoMKg
wqDCoCBlbHNlIGlmICh1bmxpa2VseShyZXQgJiBWTV9GQVVMVF9FUlJPUikpDQo+Pj4gLcKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgZ290byBvdXRfaW9fdW5sb2NrOw0KPj4+ICvCoMKgwqDCoMKgwqDC
oCAvKiBOZXZlciBlcnJvciBvbiBwcmVmYXVsdGVkIFBURXMgKi8NCj4+PiArwqDCoMKgwqDCoMKg
wqAgaWYgKHVubGlrZWx5KChyZXQgJiBWTV9GQVVMVF9FUlJPUikpKSB7DQo+Pj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgaWYgKGkgPT0gMCkNCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGdvdG8gb3V0X2lvX3VubG9jazsNCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBl
bHNlDQo+DQo+IFdlIGNvdWxkIHBlcmhhcHMgc2tpcCB0aGF0IGVsc2UuIExldCBtZSBrbm93IGlm
IHlvdSB3YW50IG1lIHRvIHJlc3Bpbi4NCg0KSSB3b3VsZCByYXRoZXIgbGlrZSB0byBrZWVwIGl0
LCB3aGVuIHNvbWV0aGluZyBnb2VzIHdyb25nIHdlIHNob3VsZCANCnJlYWxseSBzdG9wIGZhdWx0
aW5nIGluIG1vcmUuDQoNCkNocmlzdGlhbi4NCg0KPg0KPiAvVGhvbWFzDQo+DQo+DQo+DQo+Pj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsNCj4+PiArwqDCoMKgwqDCoMKg
wqAgfQ0KPj4+IMKgwqAgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYWRkcmVzcyArPSBQQUdFX1NJWkU7
DQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKHVubGlrZWx5KCsrcGFnZV9vZmZzZXQgPj0g
cGFnZV9sYXN0KSkNCj4NCj4NCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
