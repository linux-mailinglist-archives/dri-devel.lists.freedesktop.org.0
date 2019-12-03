Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35363110588
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 20:53:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 752FE6EC5A;
	Tue,  3 Dec 2019 19:53:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820072.outbound.protection.outlook.com [40.107.82.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C7856EC64;
 Tue,  3 Dec 2019 19:53:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C3srqA5nGLh1tNImq8NjKlpBPSzIbCXZlVbLj7gpjxyenSb29+1Ek0zoOikhkIuuy5Q4uPZ9hBpqsTAqvbvN4Pbz+JOAe+24uFm2PA0w0tMIsO2W3atv/vnHaaIdTNn33axzZJ6Xgd5/cFF7DK7U7VpjB7xkV/ApLQ5xJPdNBScooslQzeTzNZGNz/hurDg1+AnRYGFc+jX8pdmGNk0C4lZ7lfV+aWSe4556MIuxpAdNGlLfQxxpuUSvldzN6rfJWrGVn1hZMZKoCTUp0v2/egL03eqYxiglkyxebkXf9HEYza2krD+h1+vXjoBVl861plV3HZ7aOTzNkbGm5jkrhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=++n1vNgkU86K1iRYwHQIkruBSPJay9PXORCsG8L3vhc=;
 b=FkYjCcfVZRPtPeFqYajrPst5z/Tp1HRY87JWu3uaqJnFImya8jboRPMoBhHRgDWFG8ECf8MLKkTzFZ/ib2VHqMhXpxdULFrWurvh8OxkiJ9CkLsVcgR3+g5HTc49vExx6QiQFaQJDCbsAmF9zjqeZOuG+3eTpVPeRVg7jZitqxrH6DxdyF9N5MsQxMLUPDRTrjgjCFphF96p0yYzGYyB9AKxIpVZsFEeb/TdOt8wsKgclc/MxnbHspz4Al0yDRV87C7gUsH9UVpjHM07Ixwnc5kxXrVXmd27Vf1WYrsvnN/ps9f/E19cbquh3PZiWpPGh7FKLay4Ef8K+KbHN80gGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB2975.namprd12.prod.outlook.com (20.178.243.142) by
 MN2PR12MB4176.namprd12.prod.outlook.com (52.135.49.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.20; Tue, 3 Dec 2019 19:53:19 +0000
Received: from MN2PR12MB2975.namprd12.prod.outlook.com
 ([fe80::851c:eebf:b936:20fd]) by MN2PR12MB2975.namprd12.prod.outlook.com
 ([fe80::851c:eebf:b936:20fd%4]) with mapi id 15.20.2516.003; Tue, 3 Dec 2019
 19:53:19 +0000
From: "Deng, Emily" <Emily.Deng@amd.com>
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>
Subject: RE: [PATCH v4] drm/scheduler: Avoid accessing freed bad job.
Thread-Topic: [PATCH v4] drm/scheduler: Avoid accessing freed bad job.
Thread-Index: AQHVo9IhnWBRQA7TSUuQ4gUMKSHN+6edlxiAgACX24CACRV/kIABjnSAgAAHQTA=
Date: Tue, 3 Dec 2019 19:53:19 +0000
Message-ID: <MN2PR12MB29750A66FC759CDAF3C5B5878F420@MN2PR12MB2975.namprd12.prod.outlook.com>
References: <1574715089-14875-1-git-send-email-andrey.grodzovsky@amd.com>
 <b8b716a7-e235-38b2-ea6d-0a21881fa64e@amd.com>
 <MN2PR12MB2975CA8858F21FDF325C33FE8F440@MN2PR12MB2975.namprd12.prod.outlook.com>
 <MN2PR12MB2975F38D8FB87D9812E0B0C88F430@MN2PR12MB2975.namprd12.prod.outlook.com>
 <40f1020c-fccf-99f9-33ff-f82ef1f5f360@amd.com>
In-Reply-To: <40f1020c-fccf-99f9-33ff-f82ef1f5f360@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=true;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2019-12-03T19:53:17Z; 
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal Use Only -
 Unrestricted;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ActionId=762f74d3-669c-4e5c-b6c4-0000ce9b48f2;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=1
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_enabled: true
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_setdate: 2019-12-03T19:53:17Z
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_method: Standard
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_name: Internal Use Only -
 Unrestricted
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_actionid: 3c10444f-a362-44d0-a425-000089ae8b0e
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_contentbits: 0
x-originating-ip: [165.204.53.123]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ae4f8355-ed75-4c60-f347-08d7782a7249
x-ms-traffictypediagnostic: MN2PR12MB4176:|MN2PR12MB4176:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB4176074EC7E2188618AB392F8F420@MN2PR12MB4176.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 02408926C4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(39860400002)(346002)(136003)(366004)(189003)(199004)(13464003)(2906002)(446003)(229853002)(14444005)(66446008)(8936002)(71200400001)(81166006)(71190400001)(81156014)(4326008)(8676002)(33656002)(26005)(256004)(102836004)(52536014)(76176011)(25786009)(6246003)(14454004)(99286004)(305945005)(7696005)(7736002)(11346002)(86362001)(6116002)(3846002)(66574012)(54906003)(5660300002)(110136005)(316002)(53546011)(6506007)(6436002)(55016002)(478600001)(6636002)(186003)(66476007)(9686003)(66556008)(64756008)(66946007)(76116006)(74316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4176;
 H:MN2PR12MB2975.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QRgDw1vXCUhakOO9RLOYV75tWfo9CweXofaOL2+ffwkfs/54WYbdbeQAGyTyVk3tzFx8HK+6f0l7n+KQO52ivEGBqPgtveJQKsnXps4jmKqjitoOtDPb6NXLMIz3DSag9Z+sAXCsKuR/U59fEXON729TV0pa+x/HM5WtYlSXd2a0kFMvtS13YLIy01SbqXs7p2TwrlMi1ARg0EUtS1JlorUtYASAWzJAuqUec1iw/i1NKz8JjGgDp7nAP6OHjcriyep7dSY1iUweu2mRSDbv9fRfx9eyXSRTdTm5AR96G/RcutexZlZ400ZJoZ2CqQ+WVwhQAij3fp7PIkvV1z8fjEyoE/bBaChIsVjusavqyWVhghIyInhwVbk2A6iGUXZ6REm58wnPpbruSw559jR7yvhwyy0bNxajU8fXpXLfSTMMaJ0Jog3s1OuNxzJZ46kH
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae4f8355-ed75-4c60-f347-08d7782a7249
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2019 19:53:19.5804 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PdEi5tjFCDza8Jw7Jz/JdHYj2YCFvSFjFwB5Mu/YcIhKr8UIYb80Veq2OOOpUdW+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4176
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=++n1vNgkU86K1iRYwHQIkruBSPJay9PXORCsG8L3vhc=;
 b=aZA/EmhCv9TNUM/EjKm+IwNlcP3drHVgZQEZpRoC57O/paXEE3aNDUfZKkcx/5UW4Iq2MJufbwSy1LRHYoJ2riJTzCCLkNaERrGDGQA+GNypANm12wDAJfsl2W0j281W0eYYM/ZAl4uQ/39VnuaIRrvDZgi6tY2yZV6v2ALDrfE=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Emily.Deng@amd.com; 
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
Cc: "steven.price@arm.com" <steven.price@arm.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Koenig, 
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEludGVybmFsIERpc3RyaWJ1dGlvbiBPbmx5XQ0KDQpI
aSBBbGV4LA0KICAgIFdoZW4gd2Ugd2lsbCBjaGVycnkgcGljayB0aG9zZSBwYXRjaGVzIHRvIGRy
bS1uZXh0Pw0KDQo+LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj5Gcm9tOiBHcm9kem92c2t5
LCBBbmRyZXkgPEFuZHJleS5Hcm9kem92c2t5QGFtZC5jb20+DQo+U2VudDogVHVlc2RheSwgRGVj
ZW1iZXIgMywgMjAxOSAxMToxMCBBTQ0KPlRvOiBEZW5nLCBFbWlseSA8RW1pbHkuRGVuZ0BhbWQu
Y29tPjsgRGV1Y2hlciwgQWxleGFuZGVyDQo+PEFsZXhhbmRlci5EZXVjaGVyQGFtZC5jb20+DQo+
Q2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnOyBLb2VuaWcsDQo+Q2hyaXN0aWFuIDxDaHJpc3RpYW4uS29lbmlnQGFtZC5jb20+
OyBzdGV2ZW4ucHJpY2VAYXJtLmNvbQ0KPlN1YmplY3Q6IFJlOiBbUEFUQ0ggdjRdIGRybS9zY2hl
ZHVsZXI6IEF2b2lkIGFjY2Vzc2luZyBmcmVlZCBiYWQgam9iLg0KPg0KPlllcyAtIENocmlzdGlh
biBqdXN0IHB1c2hlZCBpdCB0byBkcm0tbmV4dC1taXNjIC0gSSBndWVzcyBBbGV4L0NocmlzdGlh
biBkaWRuJ3QgcHVsbA0KPnRvIGFtZC1zdGFnaW5nLWRybS1uZXh0IHlldC4NCj4NCj5BbmRyZXkN
Cj4NCj5PbiAxMi8yLzE5IDI6MjQgUE0sIERlbmcsIEVtaWx5IHdyb3RlOg0KPj4gW0FNRCBPZmZp
Y2lhbCBVc2UgT25seSAtIEludGVybmFsIERpc3RyaWJ1dGlvbiBPbmx5XQ0KPj4NCj4+IEhpIEFu
ZHJleSwNCj4+ICAgICAgU2VlbXMgdGhpcyBwYXRjaCBpcyBzdGlsbCBub3QgaW4gYW1kLXN0YWdp
bmctZHJtLW5leHQ/DQo+Pg0KPj4gQmVzdCB3aXNoZXMNCj4+IEVtaWx5IERlbmcNCj4+DQo+Pg0K
Pj4NCj4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPj4+IEZyb206IERlbmcsIEVtaWx5
DQo+Pj4gU2VudDogVHVlc2RheSwgTm92ZW1iZXIgMjYsIDIwMTkgNDo0MSBQTQ0KPj4+IFRvOiBH
cm9kem92c2t5LCBBbmRyZXkgPEFuZHJleS5Hcm9kem92c2t5QGFtZC5jb20+DQo+Pj4gQ2M6IGRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnOw0KPj4+IEtvZW5pZywgQ2hyaXN0aWFuIDxDaHJpc3RpYW4uS29lbmlnQGFtZC5jb20+OyBz
dGV2ZW4ucHJpY2VAYXJtLmNvbQ0KPj4+IFN1YmplY3Q6IFJFOiBbUEFUQ0ggdjRdIGRybS9zY2hl
ZHVsZXI6IEF2b2lkIGFjY2Vzc2luZyBmcmVlZCBiYWQgam9iLg0KPj4+DQo+Pj4gW0FNRCBPZmZp
Y2lhbCBVc2UgT25seSAtIEludGVybmFsIERpc3RyaWJ1dGlvbiBPbmx5XQ0KPj4+DQo+Pj4gUmV2
aWV3ZWQtYnk6IEVtaWx5IERlbmcgPEVtaWx5LkRlbmdAYW1kLmNvbT4NCj4+Pg0KPj4+PiAtLS0t
LU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPj4+PiBGcm9tOiBHcm9kem92c2t5LCBBbmRyZXkgPEFu
ZHJleS5Hcm9kem92c2t5QGFtZC5jb20+DQo+Pj4+IFNlbnQ6IFR1ZXNkYXksIE5vdmVtYmVyIDI2
LCAyMDE5IDc6MzcgQU0NCj4+Pj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7
IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOw0KPj4+PiBLb2VuaWcsIENocmlzdGlhbiA8
Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29tPjsgRGVuZywgRW1pbHkNCj4+Pj4gPEVtaWx5LkRlbmdA
YW1kLmNvbT47IHN0ZXZlbi5wcmljZUBhcm0uY29tDQo+Pj4+IFN1YmplY3Q6IFJlOiBbUEFUQ0gg
djRdIGRybS9zY2hlZHVsZXI6IEF2b2lkIGFjY2Vzc2luZyBmcmVlZCBiYWQgam9iLg0KPj4+Pg0K
Pj4+PiBQaW5nDQo+Pj4+DQo+Pj4+IEFuZHJleQ0KPj4+Pg0KPj4+PiBPbiAxMS8yNS8xOSAzOjUx
IFBNLCBBbmRyZXkgR3JvZHpvdnNreSB3cm90ZToNCj4+Pj4+IFByb2JsZW06DQo+Pj4+PiBEdWUg
dG8gYSByYWNlIGJldHdlZW4gZHJtX3NjaGVkX2NsZWFudXBfam9icyBpbiBzY2hlZCB0aHJlYWQg
YW5kDQo+Pj4+PiBkcm1fc2NoZWRfam9iX3RpbWVkb3V0IGluIHRpbWVvdXQgd29yayB0aGVyZSBp
cyBhIHBvc3NpYmxpdHkgdGhhdA0KPj4+Pj4gYmFkIGpvYiB3YXMgYWxyZWFkeSBmcmVlZCB3aGls
ZSBzdGlsbCBiZWluZyBhY2Nlc3NlZCBmcm9tIHRoZQ0KPj4+Pj4gdGltZW91dCB0aHJlYWQuDQo+
Pj4+Pg0KPj4+Pj4gRml4Og0KPj4+Pj4gSW5zdGVhZCBvZiBqdXN0IHBlZWtpbmcgYXQgdGhlIGJh
ZCBqb2IgaW4gdGhlIG1pcnJvciBsaXN0IHJlbW92ZSBpdA0KPj4+Pj4gZnJvbSB0aGUgbGlzdCB1
bmRlciBsb2NrIGFuZCB0aGVuIHB1dCBpdCBiYWNrIGxhdGVyIHdoZW4gd2UgYXJlDQo+Pj4+PiBn
YXJhbnRlZWQgbm8gcmFjZSB3aXRoIG1haW4gc2NoZWQgdGhyZWFkIGlzIHBvc3NpYmxlIHdoaWNo
IGlzIGFmdGVyDQo+Pj4+PiB0aGUgdGhyZWFkIGlzIHBhcmtlZC4NCj4+Pj4+DQo+Pj4+PiB2Mjog
TG9jayBhcm91bmQgcHJvY2Vzc2luZyByaW5nX21pcnJvcl9saXN0IGluIGRybV9zY2hlZF9jbGVh
bnVwX2pvYnMuDQo+Pj4+Pg0KPj4+Pj4gdjM6IFJlYmFzZSBvbiB0b3Agb2YgZHJtLW1pc2MtbmV4
dC4gdjIgaXMgbm90IG5lZWRlZCBhbnltb3JlIGFzDQo+Pj4+PiBkcm1fc2NoZWRfZ2V0X2NsZWFu
dXBfam9iIGFscmVhZHkgaGFzIGEgbG9jayB0aGVyZS4NCj4+Pj4+DQo+Pj4+PiB2NDogRml4IGNv
bW1lbnRzIHRvIHJlbGZlY3QgbGF0ZXN0IGNvZGUgaW4gZHJtLW1pc2MuDQo+Pj4+Pg0KPj4+Pj4g
U2lnbmVkLW9mZi1ieTogQW5kcmV5IEdyb2R6b3Zza3kgPGFuZHJleS5ncm9kem92c2t5QGFtZC5j
b20+DQo+Pj4+PiBSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5p
Z0BhbWQuY29tPg0KPj4+Pj4gVGVzdGVkLWJ5OiBFbWlseSBEZW5nIDxFbWlseS5EZW5nQGFtZC5j
b20+DQo+Pj4+PiAtLS0NCj4+Pj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRf
bWFpbi5jIHwgMjcNCj4+Pj4gKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+Pj4+PiAgICAx
IGZpbGUgY2hhbmdlZCwgMjcgaW5zZXJ0aW9ucygrKQ0KPj4+Pj4NCj4+Pj4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYw0KPj4+Pj4gYi9kcml2ZXJz
L2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYw0KPj4+Pj4gaW5kZXggNjc3NDk1NS4uMWJm
OWM0MCAxMDA2NDQNCj4+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRf
bWFpbi5jDQo+Pj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4u
Yw0KPj4+Pj4gQEAgLTI4NCwxMCArMjg0LDIxIEBAIHN0YXRpYyB2b2lkIGRybV9zY2hlZF9qb2Jf
dGltZWRvdXQoc3RydWN0DQo+Pj4+IHdvcmtfc3RydWN0ICp3b3JrKQ0KPj4+Pj4gICAgCXVuc2ln
bmVkIGxvbmcgZmxhZ3M7DQo+Pj4+Pg0KPj4+Pj4gICAgCXNjaGVkID0gY29udGFpbmVyX29mKHdv
cmssIHN0cnVjdCBkcm1fZ3B1X3NjaGVkdWxlciwNCj4+Pj4+IHdvcmtfdGRyLndvcmspOw0KPj4+
Pj4gKw0KPj4+Pj4gKwkvKiBQcm90ZWN0cyBhZ2FpbnN0IGNvbmN1cnJlbnQgZGVsZXRpb24gaW4N
Cj4+Pj4gZHJtX3NjaGVkX2dldF9jbGVhbnVwX2pvYiAqLw0KPj4+Pj4gKwlzcGluX2xvY2tfaXJx
c2F2ZSgmc2NoZWQtPmpvYl9saXN0X2xvY2ssIGZsYWdzKTsNCj4+Pj4+ICAgIAlqb2IgPSBsaXN0
X2ZpcnN0X2VudHJ5X29yX251bGwoJnNjaGVkLT5yaW5nX21pcnJvcl9saXN0LA0KPj4+Pj4gICAg
CQkJCSAgICAgICBzdHJ1Y3QgZHJtX3NjaGVkX2pvYiwgbm9kZSk7DQo+Pj4+Pg0KPj4+Pj4gICAg
CWlmIChqb2IpIHsNCj4+Pj4+ICsJCS8qDQo+Pj4+PiArCQkgKiBSZW1vdmUgdGhlIGJhZCBqb2Ig
c28gaXQgY2Fubm90IGJlIGZyZWVkIGJ5IGNvbmN1cnJlbnQNCj4+Pj4+ICsJCSAqIGRybV9zY2hl
ZF9jbGVhbnVwX2pvYnMuIEl0IHdpbGwgYmUgcmVpbnNlcnRlZCBiYWNrIGFmdGVyDQo+Pj4+IHNj
aGVkLT50aHJlYWQNCj4+Pj4+ICsJCSAqIGlzIHBhcmtlZCBhdCB3aGljaCBwb2ludCBpdCdzIHNh
ZmUuDQo+Pj4+PiArCQkgKi8NCj4+Pj4+ICsJCWxpc3RfZGVsX2luaXQoJmpvYi0+bm9kZSk7DQo+
Pj4+PiArCQlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZzY2hlZC0+am9iX2xpc3RfbG9jaywgZmxh
Z3MpOw0KPj4+Pj4gKw0KPj4+Pj4gICAgCQlqb2ItPnNjaGVkLT5vcHMtPnRpbWVkb3V0X2pvYihq
b2IpOw0KPj4+Pj4NCj4+Pj4+ICAgIAkJLyoNCj4+Pj4+IEBAIC0yOTgsNiArMzA5LDggQEAgc3Rh
dGljIHZvaWQgZHJtX3NjaGVkX2pvYl90aW1lZG91dChzdHJ1Y3QNCj4+Pj4gd29ya19zdHJ1Y3Qg
KndvcmspDQo+Pj4+PiAgICAJCQlqb2ItPnNjaGVkLT5vcHMtPmZyZWVfam9iKGpvYik7DQo+Pj4+
PiAgICAJCQlzY2hlZC0+ZnJlZV9ndWlsdHkgPSBmYWxzZTsNCj4+Pj4+ICAgIAkJfQ0KPj4+Pj4g
Kwl9IGVsc2Ugew0KPj4+Pj4gKwkJc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmc2NoZWQtPmpvYl9s
aXN0X2xvY2ssIGZsYWdzKTsNCj4+Pj4+ICAgIAl9DQo+Pj4+Pg0KPj4+Pj4gICAgCXNwaW5fbG9j
a19pcnFzYXZlKCZzY2hlZC0+am9iX2xpc3RfbG9jaywgZmxhZ3MpOyBAQCAtMzcwLDYNCj4+Pj4+
ICszODMsMjAgQEAgdm9pZCBkcm1fc2NoZWRfc3RvcChzdHJ1Y3QgZHJtX2dwdV9zY2hlZHVsZXIg
KnNjaGVkLA0KPj4+Pj4gc3RydWN0DQo+Pj4+IGRybV9zY2hlZF9qb2IgKmJhZCkNCj4+Pj4+ICAg
IAlrdGhyZWFkX3Bhcmsoc2NoZWQtPnRocmVhZCk7DQo+Pj4+Pg0KPj4+Pj4gICAgCS8qDQo+Pj4+
PiArCSAqIFJlaW5zZXJ0IGJhY2sgdGhlIGJhZCBqb2IgaGVyZSAtIG5vdyBpdCdzIHNhZmUgYXMN
Cj4+Pj4+ICsJICogZHJtX3NjaGVkX2dldF9jbGVhbnVwX2pvYiBjYW5ub3QgcmFjZSBhZ2FpbnN0
IHVzIGFuZCByZWxlYXNlIHRoZQ0KPj4+Pj4gKwkgKiBiYWQgam9iIGF0IHRoaXMgcG9pbnQgLSB3
ZSBwYXJrZWQgKHdhaXRlZCBmb3IpIGFueSBpbiBwcm9ncmVzcw0KPj4+Pj4gKwkgKiAoZWFybGll
cikgY2xlYW51cHMgYW5kIGRybV9zY2hlZF9nZXRfY2xlYW51cF9qb2Igd2lsbCBub3QgYmUNCj4+
Pj4gY2FsbGVkDQo+Pj4+PiArCSAqIG5vdyB1bnRpbCB0aGUgc2NoZWR1bGVyIHRocmVhZCBpcyB1
bnBhcmtlZC4NCj4+Pj4+ICsJICovDQo+Pj4+PiArCWlmIChiYWQgJiYgYmFkLT5zY2hlZCA9PSBz
Y2hlZCkNCj4+Pj4+ICsJCS8qDQo+Pj4+PiArCQkgKiBBZGQgYXQgdGhlIGhlYWQgb2YgdGhlIHF1
ZXVlIHRvIHJlZmxlY3QgaXQgd2FzIHRoZSBlYXJsaWVzdA0KPj4+Pj4gKwkJICogam9iIGV4dHJh
Y3RlZC4NCj4+Pj4+ICsJCSAqLw0KPj4+Pj4gKwkJbGlzdF9hZGQoJmJhZC0+bm9kZSwgJnNjaGVk
LT5yaW5nX21pcnJvcl9saXN0KTsNCj4+Pj4+ICsNCj4+Pj4+ICsJLyoNCj4+Pj4+ICAgIAkgKiBJ
dGVyYXRlIHRoZSBqb2IgbGlzdCBmcm9tIGxhdGVyIHRvICBlYXJsaWVyIG9uZSBhbmQgZWl0aGVy
IGRlYWN0aXZlDQo+Pj4+PiAgICAJICogdGhlaXIgSFcgY2FsbGJhY2tzIG9yIHJlbW92ZSB0aGVt
IGZyb20gbWlycm9yIGxpc3QgaWYgdGhleSBhbHJlYWR5DQo+Pj4+PiAgICAJICogc2lnbmFsZWQu
DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
