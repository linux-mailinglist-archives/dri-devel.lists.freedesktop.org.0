Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D1568727
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2019 12:41:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2641A89944;
	Mon, 15 Jul 2019 10:41:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam04on062b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe4d::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 727F589935
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 10:41:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jy6Lb0scwklXWc0QYetfLXRrKWx0z/i3ibspFPdORsrXFA5eftSwga3WLubaMg0cNtq5plkvAADyV8JDOn+ThoUT28gMSjukTAh0UYYoY4fBodVIsce67MX73ASMCX6txWY5wqrHgPrOfsyeG1wPXpHvJ1B2dhHl8Toddbh9T+ya6vvKvWRSVRzycv1idUJlxerJoHVyd1Bj0yqqYnnzqGY7JmKPoFM8P8yCeCUS7nqdzcJcjd3XJ21cuExFF7NDiAdp39D9Il3eHEUKCty4w/FvFPqlLNoWQomNkffescHsaq/NX0m0ayvF0E5zjvCt2yCBKRdrgmN3tOBZK3/uWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n7fpjXiYkMsnjDVfLBOuSB+zVCyVmISXEzjbcHA+OC8=;
 b=duMSD4cnJOGyrTP0JLsjc8VoAXvXWPegPrehy/jahirgOqKL3W4rCiQeFP7iPkZrrFkA6UX58V8z0gTgtuTrb2RlrIzdm34nB3IDPzjWOR0FGwNF3XpmaBzjDNJ1O64i1uylqHJYin0w28bo0FLvKRdBrVLGN5/K93tCk22lyrJo5CMqJ5DZRXgRTpbjj0f5EuFiXHEJippV7h2XuhE2avJXp0+xamRF2s18Fk2DTGIrpuf1n1zfF1Wpvq9Gzyzq+gNHVcMogTGnNfGv8Ss23LCh0/U0kka+iNP6GOUARu18tCxvSneu7B3HafOjOao5D7a8Y3zqoaOAIyvib26D/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Mon, 15 Jul 2019 10:41:14 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::cda7:cfc1:ce62:bcb7]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::cda7:cfc1:ce62:bcb7%10]) with mapi id 15.20.2073.012; Mon, 15 Jul
 2019 10:41:14 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [bug report] drm/ttm: add transparent huge page support for DMA
 allocations v2
Thread-Topic: [bug report] drm/ttm: add transparent huge page support for DMA
 allocations v2
Thread-Index: AQHVLPGOv8ZFH37+40SwLhEqcDKxyqavrjOAgAAKLQCAAATKgIAAANEAgAAEAICAAO1lgIAABzYAgAS+OoCAFiTrAA==
Date: Mon, 15 Jul 2019 10:41:14 +0000
Message-ID: <4af89284-b37a-83fd-6962-45fe2c064c16@amd.com>
References: <20190627140626.GA6027@mwanda>
 <41b33cc3-2f07-681a-5fee-25a328de46bd@amd.com>
 <20190627165532.GD10652@lst.de>
 <278388a6-bd2d-2891-19be-97e33bc470a5@amd.com>
 <20190627171536.GA11117@lst.de>
 <f851fb21-fdf6-f5d7-0f53-7d6ed060b191@amd.com>
 <20190628073935.GA29114@lst.de>
 <32b2a05f-735a-92ef-cc09-67b8017015ee@amd.com>
 <20190701083117.GA22587@lst.de>
In-Reply-To: <20190701083117.GA22587@lst.de>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0104.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:19::20) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 099e1d3b-0ff6-429b-ed1e-08d70910f592
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1705; 
x-ms-traffictypediagnostic: DM5PR12MB1705:
x-microsoft-antispam-prvs: <DM5PR12MB17055CE54D801A4F136867BC83CF0@DM5PR12MB1705.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 00997889E7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(396003)(366004)(346002)(39860400002)(199004)(189003)(76176011)(64126003)(478600001)(31696002)(65956001)(52116002)(2906002)(65806001)(476003)(2616005)(68736007)(46003)(25786009)(7736002)(446003)(11346002)(186003)(386003)(6506007)(14444005)(14454004)(102836004)(256004)(8676002)(36756003)(305945005)(6116002)(6436002)(8936002)(31686004)(6246003)(65826007)(4326008)(6486002)(229853002)(486006)(81166006)(81156014)(316002)(58126008)(54906003)(71200400001)(71190400001)(86362001)(66946007)(66476007)(66556008)(64756008)(66446008)(5660300002)(99286004)(6916009)(53936002)(6512007)(14583001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1705;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 9A35Wf+S7RSgQRnS/3vj3IV0zf8azCsn/unVTbyaBh9Oh4MMrPZuowiRr1n/fHo8GE2NTxXSq3BomqTG05chXCXEw6GdU7uRXPp8s21aZLXP7ml6vPndqcxSvijf6NO/4H4lQCptT5Pg9kKnDIfIH48ZDxx9Bz75mJ2S1F57IzqTpKxq1FB5ujH89uw5EiMGjnhKyXoVPgBzBOqU+pTb1jAOCdh7Vd+R5OH0bziV0ArOXhSEKwFkYwCIK7251DWOEunQkzi6cmW0hAreANfPgTXA71PkPG0UiJcFQ83rni30KYpyfoXOW9n9/i0frGlGh9xA9JnHc7gPBZpdS5FPapBwaevYaw8ApK5jhBPvWGeG4MBvq1nu86Q5lQrn809X3p5lxOvWxz5fyrP+InEU4pKq5oWsdFXkyYG+BvEq5TU=
Content-ID: <E3C7D4FEC25CE74C8BE765DF12B88F3E@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 099e1d3b-0ff6-429b-ed1e-08d70910f592
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2019 10:41:14.2780 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1705
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n7fpjXiYkMsnjDVfLBOuSB+zVCyVmISXEzjbcHA+OC8=;
 b=Cm75rOi0E44EmlgJjmN9NC4i6n4fbn5ZAIFlJVj8nE/VzcDIXVmmyAkwGvlNsPwZYTTcD90lB18olLsRBCEBH3Dv4ksbDP0utCK7tiV4NrGrFd6QBqCAAd6jGhFKT674LnUz56z710mrfQctqLK349mrJMtt+KPutQXxPWAeyHw=
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQ2hyaXN0b3BoLA0KDQpzb3JyeSBmb3IgdGhlIGRlbGF5ZWQgcmVzcG9uc2UsIEkgd2FzIG9u
IGEgdHdvIHdlZWsgdmFjYXRpb24uDQoNCkFtIDAxLjA3LjE5IHVtIDEwOjMxIHNjaHJpZWIgQ2hy
aXN0b3BoIEhlbGx3aWc6DQo+IE9uIEZyaSwgSnVuIDI4LCAyMDE5IGF0IDA4OjA1OjI4QU0gKzAw
MDAsIEtvZW5pZywgQ2hyaXN0aWFuIHdyb3RlOg0KPiBbU05JUF0NCj4+PiBMZXRzIHB1dCBpdCBp
biBhbm90aGVyIHdheS4gIE91dHNpZGUgb2YgeDg2IHVuY2FjaGVkIG1hcHBpbmdzIGFyZSB0aGUN
Cj4+PiBub3JtLCBidXQgdGhlcmUgaXMgbm8gd2F5IHRvIGV4cGxpY2l0bHkgcmVxdWVzdCB0aGVt
IG9uIGFyY2hpdGVjdHVyZXMNCj4+PiB0aGF0IGFyZSBETUEgY29oZXJlbnQuICBBZGRpbmcgYSBE
TUFfQVRUUl9VTkNBQ0hFRCB3b3VsZCBiZSBtb3N0bHkNCj4+PiB0cml2aWFsLCB3ZSBqdXN0IG5l
ZWQgdG8gZGVmaW5lIHByb3BlciBzZW1hbnRpY3MgZm9yIGl0Lg0KPj4gU291bmRzIGdvb2QuIENh
biB5b3UgZG8gdGhpcz8gQ2F1c2UgSSBvbmx5IGtub3cgeDg2IGFuZCBhIGZldyBiaXRzIG9mIEFS
TS4NCj4gU28gd2hhdCBzZW1hbnRpY3MgZG8geW91IG5lZWQ/ICBHaXZlbiB0aGF0IHdlIGhhdmUg
c29tZSBhcmNoaXRlY3R1cmVzDQo+IHRoYXQgY2FuJ3Qgc2V0IHBhZ2VzIGFzIHVuY2FjaGVkIGF0
IHJ1bnRpbWUgaXQgZWl0aGVyIGhhcyB0byBiZSBhIGhpbnQsDQo+IG9yIHdlIGNvdWxkIGZhaWwg
aXQgaWYgbm90IHN1cHBvcnRlZCBieSBpbXBsZW1lbnRhdGlvbi4gIFdoaWNoIG9uZSB3b3VsZA0K
PiB5b3UgcHJlZmVyPw0KDQpXZWxsIGZpcnN0IG9mIGFsbCBJIHRoaW5rIHdlIG5lZWQgYSBmdW5j
dGlvbiB3aGljaCBjYW4gdGVsbCBpZiBpdCdzIA0Kc3VwcG9ydGVkIGluIGdlbmVyYWwgb24gdGhl
IGN1cnJlbnQgYXJjaGl0ZWN0dXJlLg0KDQpUaGVuIEkndmUgYXNrZWQgYXJvdW5kIGEgYml0IGFu
ZCB3ZSB1bmZvcnR1bmF0ZWx5IGZvdW5kIGEgZmV3IG1vcmUgY2FzZXMgDQpJIGRpZG4ndCBrbmV3
IGJlZm9yZSB3aGVyZSB1bmNhY2hlZCBhY2Nlc3MgdG8gc3lzdGVtIG1lbW9yeSBpcyANCm1hbmRh
dG9yeS4gVGhlIG9ubHkgZ29vZCBuZXdzIEkgaGF2ZSBpcyB0aGF0IHRoZSBBTUQgZGV2aWNlcyBu
ZWVkaW5nIA0KdGhhdCBhcmUgYWxsIGludGVncmF0ZWQgaW50byB0aGUgQ1BVLiBTbyBhdCBsZWFz
dCBmb3IgQU1EIGhhcmR3YXJlIHdlIA0KY2FuIHNhZmVseSBhc3N1bWUgeDg2IGZvciB0aG9zZSBj
YXNlcy4NCg0KQnV0IGJlY2F1c2Ugb2YgdGhhdCBJIHdvdWxkIHNheSB3ZSBzaG91bGQgaGFyZCBm
YWlsIGlmIGl0IGlzIG5vdCANCnBvc3NpYmxlIHRvIGdldCBzb21lIHVuY2FjaGVkIG1lbW9yeS4N
Cg0KPj4+PiBBZGRpdGlvbmFsIHRvIHRoYXQgd2UgbmVlZCBhIHdheSB0byBmb3JjZSBhIGNvaGVy
ZW50IG1hcHBpbmdzIHdpdGgNCj4+Pj4gZG1hX21hcF9wYWdlKCkgd2hpY2ggZmFpbHMgd2hlbiB0
aGlzIGlzbid0IGd1YXJhbnRlZWQuDQo+Pj4gV2UgY2FuJ3QgZm9yY2UgdGhpbmdzIHRvIGJlIGNv
aGVyZW50IHRoYXQgd2VyZW4ndCBhbGxvY2F0ZSBzcGVjaWZpY2FsbHkNCj4+PiB0byBiZSBETUEg
Y29oZXJlbnQuICBJZiB5b3Ugd2FudCBjb2hlcmVudCBETUEgbWVtb3J5IGl0IG5lZWRzIHRvIGNv
bWUNCj4+PiBmcm9tIGRtYV9hbGxvY18qLg0KPj4gWWVhaCwgYnV0IHlvdSBjYW4gcmV0dXJuIGFu
IGVycm9yIGluc3RlYWQgb2YgdXNpbmcgYm91bmNlIGJ1ZmZlcnMgOikNCj4+DQo+PiBTZWUgT3Bl
bkdMLCBPcGVuQ0wgYW5kIFZ1bGthbiBoYXZlIEFQSXMgd2hpY2ggYWxsb3cgYW4gYXBwbGljYXRp
b24gdG8NCj4+IGdpdmUgYSBtYWxsb2NlZCBwb2ludGVyIHRvIHRoZSBkcml2ZXIgYW5kIHNheSBo
ZXkgSSB3YW50IHRvIGFjY2VzcyB0aGlzDQo+PiBtZW1vcnkgY29oZXJlbnRseSBmcm9tIHRoZSBH
UFUuDQo+Pg0KPj4gSW4gdGhpcyBzaXR1YXRpb24gaXQgaXMgdmFsaWQgdG8gcmV0dXJuIGFuIGVy
cm9yIHNheWluZyBzb3JyeSB0aGF0DQo+PiBkZXZpY2UgY2FuJ3QgYWNjZXNzIHRoYXQgbWVtb3J5
IGNvaGVyZW50bHksIGJ1dCBpdCdzIG5vdCBvayB0byBqdXN0IG1hcA0KPj4gaXQgbm9uLWNvaGVy
ZW50bHkuDQo+Pg0KPj4gRm9yIE9wZW5HTCBhbmQgT3BlbkNMIHdlIGNhbiBzdGlsbCBzYXkgdGhh
dCB0aGUgY3VycmVudCBwbGF0Zm9ybSBkb2Vzbid0DQo+PiBzdXBwb3J0IHRoaXMgZmVhdHVyZSwg
YnV0IHRoYXQgcmVuZGVycyBhIGJ1bmNoIG9mIGFwcGxpY2F0aW9ucyB1bnVzYWJsZS4NCj4+DQo+
PiBGb3IgVnVsa2FuIGl0J3MgZXZlbiB3b3JzZSBiZWNhdXNlIGl0IGlzIGFjdHVhbGx5IHBhcnQg
b2YgdGhlIGNvcmUgQVBJDQo+PiBhcyBmYXIgYXMgSSBrbm93IChidXQgdGFrZSB0aGlzIHdpdGgg
YSBncmFpbiBvZiBzYWx0IEknbSBub3QgcmVhbGx5IGFuDQo+PiB1c2Vyc3BhY2UgZGV2ZWxvcGVy
KS4NCj4gV2UnbGwgaGF2ZSB0byBmYWlsIHRoaXMgaW4gbWFueSBjYXNlcyB0aGVuLCBlLmcuIGFs
bCB0aGUgdGltZSB3aGVuDQo+IHRoZSBkZXZpY2UgaXMgbm90IGNvaGVyZW50LCB3aGljaCBpcyBx
dWl0ZSBmcmVxdWVudCwgd2hlbiB0aGUgZGV2aWNlDQo+IGRvZXNuJ3Qgc3VwcG9ydCBhZGRyZXNz
aW5nIGFsbCBwaHlzaWNhbCBhZGRyZXNzIHNwYWNlICh3aGljaCBzZWVtcw0KPiB0byBiZSByZWFz
b25hYmx5IGNvbW1vbiBldmVuIGZvciBHUFVzKSwgb3IgaWYgd2UgYXJlIHVzaW5nIGFuIGlvbW11
DQo+IGFuZCB0aGUgZGV2aWNlIGlzIGV4dGVybmFsICh3aGljaCB3b3VsZCBnaXQgZUdQVXMgaGFy
ZCkuDQoNClllYWgsIGJ1dCBhcyBJIHNhaWQgZmFpbGluZyBpcyBwZXJmZWN0bHkgZmluZSBmb3Ig
dGhvc2UgQVBJcy4NCg0KU2VlIHdoZW4geW91IGhhdmUgYSBoYXJkd2FyZSBwbGF0Zm9ybSB3aGVy
ZSBhIGRldmljZSBpcyBub3QgY29oZXJlbnQgYW5kIA0KdXNlIChiaW5hcnkpIHVzZXJzcGFjZSBz
b2Z0d2FyZSB3aGljaCByZXF1aXJlcyBpdCB0byBiZSBjb2hlcmVudCwgdGhlbiANCnNvbWV0aGlu
ZyBpcyByZWFsbHkgYnJva2VuIGFuZCB5b3UgZWl0aGVyIG5lZWQgdG8gcmVwbGFjZSB0aGUgaGFy
ZHdhcmUgDQpvciB0aGUgc29mdHdhcmUuDQoNCldoZW4gd2UgcmV0dXJuIGEgcHJvcGVyIGVycm9y
IGNvZGUgd2UgYXQgbGVhc3QgZ2l2ZSB0aGUgdXNlciBhIGdvb2QgaWRlYSANCm9mIHdoYXQncyBn
b2luZyB3cm9uZy4NCg0KSSBtZWFuIHRoZSBvbmx5IG90aGVyIHBvc3NpYmxlIHdvcmthcm91bmQg
aW4gdGhlIGtlcm5lbCBJIGNhbiBzZWUgaXMgdG8gDQppbnN0ZWFkIG9mIHRyeWluZyB0byBtYXAg
YSBwYWdlIGJhY2tpbmcgYSBjZXJ0YWluIHVzZXJzcGFjZSBhZGRyZXNzIGlzIA0KdG8gY2hhbmdl
IHdoZXJlIHRoaXMgdXNlcnNwYWNlIGFkZHJlc3MgaXMgcG9pbnRpbmcgdG8uIFlvdSBrbm93IHdo
YXQgSSANCm1lYW4/IChJdCdzIGtpbmQgb2YgaGFyZCB0byBleHBsYWluIGJlY2F1c2UgSSdtIG5v
dCBhIG5hdGl2ZSBzcGVha2VyIG9mIA0KRW5nbGlzaCkgQnV0IHRoYXQgYXBwcm9hY2ggc291bmRz
IGxpa2UgYSBkZWVwIHJhYmJpdCBob2xlIHRvIG1lLg0KDQpSZWdhcmRzLA0KQ2hyaXN0aWFuLg0K
DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
