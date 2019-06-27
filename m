Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E18D58830
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 19:20:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC1F66E228;
	Thu, 27 Jun 2019 17:20:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820074.outbound.protection.outlook.com [40.107.82.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DB2B6E222;
 Thu, 27 Jun 2019 17:20:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=testarcselector01; d=microsoft.com; cv=none;
 b=Wjhwww/Y7Hsl4p6SsVhFypTzoGY8fMiqYnxexvzlNo8GTJFIZScZKBs2fWqXjKr2V3Ydp50TuE4fajEpLUvzUK32kXadb+9J+oM1PFCvedLyma2MqpN8l8AUBU9AmGU4Y1p5vIVj1dcD7Y/D/yEAa3sVwRiv7vwisK/rMZ+9bKU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=testarcselector01;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R8hTHuiYBS3Es7uLPKTvGHcO/o7iX9RTM2VbGcWA9lM=;
 b=bNYNisV8i3nQeS38Gw3Rkr+4yX8xa831u/TZRj5t9fI0J7voA9/8w4npiDjs0upDsF4pbp8RvHxOl70LjzD4BUYERSLUtvTkdaJMghO7TudThwqppZdVq2d32D2aEMbeCHyUHSaJmA4VZjlIEi9VuqrodsViyShj8SrT1U7rvl4=
ARC-Authentication-Results: i=1; test.office365.com
 1;spf=none;dmarc=none;dkim=none;arc=none
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB2343.namprd12.prod.outlook.com (52.132.140.166) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.13; Thu, 27 Jun 2019 17:20:11 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::7d27:3c4d:aed6:2935]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::7d27:3c4d:aed6:2935%6]) with mapi id 15.20.2008.018; Thu, 27 Jun 2019
 17:20:11 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 2/2] dma-buf: cleanup shared fence removal
Thread-Topic: [PATCH 2/2] dma-buf: cleanup shared fence removal
Thread-Index: AQHVLP3VMWiF09ciQkWCisybAkUKsaavpWqAgAAXJ4CAAAKTAA==
Date: Thu, 27 Jun 2019 17:20:11 +0000
Message-ID: <4844af2e-fbff-ceb9-c16e-32bb7012559f@amd.com>
References: <20190627101813.61430-1-christian.koenig@amd.com>
 <20190627101813.61430-2-christian.koenig@amd.com>
 <CAKMK7uGtdSxVSUor8P_8XH+uf4_A-kRfY6h+XnJoizscWE4AOg@mail.gmail.com>
 <f1a792c2-87e0-9aba-c6f1-0374122d025b@gmail.com>
 <CAKMK7uFoeugD0ASHm4DRLzq6h3aAvNhE1ODh-bxoH7Lucf1m3w@mail.gmail.com>
 <5e182e5d-efcb-00bd-fa31-6e8bc9571ce6@amd.com>
 <20190627171053.GN12905@phenom.ffwll.local>
In-Reply-To: <20190627171053.GN12905@phenom.ffwll.local>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0086.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:18::26) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 61d9b25a-1b95-4e3b-3880-08d6fb23b5e8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB2343; 
x-ms-traffictypediagnostic: DM5PR12MB2343:
x-microsoft-antispam-prvs: <DM5PR12MB2343326D134E516BB68F61F583FD0@DM5PR12MB2343.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 008184426E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(396003)(376002)(346002)(39860400002)(136003)(189003)(199004)(6512007)(53936002)(52116002)(486006)(2616005)(65956001)(65806001)(305945005)(446003)(6486002)(11346002)(476003)(6436002)(6916009)(8676002)(186003)(229853002)(99286004)(5660300002)(36756003)(7736002)(65826007)(46003)(8936002)(386003)(73956011)(102836004)(53546011)(6506007)(4326008)(66946007)(25786009)(66446008)(64756008)(66476007)(64126003)(76176011)(66556008)(31696002)(86362001)(71190400001)(31686004)(71200400001)(6246003)(66574012)(54906003)(81166006)(81156014)(478600001)(14454004)(58126008)(256004)(2906002)(14444005)(68736007)(5024004)(6116002)(316002)(72206003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2343;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: rd/Z8TqZPOMzDd2Rm2zLCf8Ex8yJvVRVSD1GoPh7DG1FgVyThe+LLWHOIAEe5x30aUuwQ9nwqQtykrvtZOktlsvTg/gkUADxpVWxjvKVikcb5POonvBzRMTCshCi8rq9v6uS1NmsV8vbElhR9XrG8iFHjl/ROVN20o5HcA6uqMdab4kuIJ2ZTZwtbDbsg5YtQhGoLicXteHKO4F3Th+EedfAUSi+M2SMSytoLFjeKtG1M+QjN4kCSVoZxvjCTK8E4eAIApKrZSaxQlqovgu6YNA30WRQd3GlVBHRY4dsvC5+Cw972X01AR0I+XZY0J3aO+wGwU4so8XdVjmambUtjhw05BiNXf/B3zphUOb1Pq7Sv26AUgyrsPDlEFi5qULnMWIYPshzHqmhjo6C//bDer//XX96jJwnpKG0frciSSw=
Content-ID: <A0CC826A233D0C43A825541817FCC61F@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61d9b25a-1b95-4e3b-3880-08d6fb23b5e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2019 17:20:11.8359 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2343
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R8hTHuiYBS3Es7uLPKTvGHcO/o7iX9RTM2VbGcWA9lM=;
 b=0c0CvjzfQkydMVen5zCnHUKxuWcMeKawTM8rMhK4kun0JJfocxHGoBbXwR9elEHvyTkBxfyeq6a0fN2e7wpyQTdjB9dthjSU4tHSOt3G8N9fEYyCoLR+pYvtRxxlqD+BfDfqGy83cDG69pPjLznBsGYC/rEkLcxORSw5PqVXHps=
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjcuMDYuMTkgdW0gMTk6MTAgc2NocmllYiBEYW5pZWwgVmV0dGVyOg0KPiBPbiBUaHUsIEp1
biAyNywgMjAxOSBhdCAwMzo0ODowNlBNICswMDAwLCBLb2VuaWcsIENocmlzdGlhbiB3cm90ZToN
Cj4+IEFtIDI3LjA2LjE5IHVtIDE3OjM0IHNjaHJpZWIgRGFuaWVsIFZldHRlcjoNCj4+PiBPbiBU
aHUsIEp1biAyNywgMjAxOSBhdCAzOjE5IFBNIENocmlzdGlhbiBLw7ZuaWcNCj4+PiA8Y2tvZW5p
Zy5sZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+IHdyb3RlOg0KPj4+PiBBbSAyNy4wNi4xOSB1bSAx
Mjo0MyBzY2hyaWViIERhbmllbCBWZXR0ZXI6DQo+Pj4+PiBPbiBUaHUsIEp1biAyNywgMjAxOSBh
dCAxMjoxOCBQTSBDaHJpc3RpYW4gS8O2bmlnDQo+Pj4+PiA8Y2tvZW5pZy5sZWljaHR6dW1lcmtl
bkBnbWFpbC5jb20+IHdyb3RlOg0KPj4+Pj4+IFdoaWxlIGZyZWVpbmcgdXAgbWVtb3J5IGl0IGlz
IGVhc2llciB0byByZW1vdmUgYSBmZW5jZSBmcm9tIGEgcmVzZXJ2YXRpb24NCj4+Pj4+PiBvYmpl
Y3QgaW5zdGVhZCBvZiBzaWduYWxpbmcgaXQgYW5kIGluc3RhbGxpbmcgYSBuZXcgb25lIGluIGFs
bCBvdGhlciBvYmplY3RzLg0KPj4+Pj4+DQo+Pj4+Pj4gQ2xlYW4gdGhpcyB1cCBieSBhZGRpbmcg
dGhlIHJlbW92YWwgZnVuY3Rpb24gdG8gdGhlIGNvcmUgcmVzZXJ2YXRpb24gb2JqZWN0DQo+Pj4+
Pj4gY29kZSBpbnN0ZWFkIG9mIG1lc3Npbmcgd2l0aCB0aGUgaW50ZXJuYWwgaW4gYW1kZ3B1Lg0K
Pj4+Pj4+DQo+Pj4+Pj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UuDQo+Pj4+Pj4NCj4+Pj4+PiBTaWdu
ZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+DQo+
Pj4+Pj4gLS0tDQo+Pj4+Pj4gICAgIGRyaXZlcnMvZG1hLWJ1Zi9yZXNlcnZhdGlvbi5jICAgICAg
ICAgICAgICAgICB8IDYyICsrKysrKysrKysrKysrKysrKysNCj4+Pj4+PiAgICAgLi4uL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMgIHwgNDUgKy0tLS0tLS0tLS0tLS0N
Cj4+Pj4+PiAgICAgaW5jbHVkZS9saW51eC9yZXNlcnZhdGlvbi5oICAgICAgICAgICAgICAgICAg
IHwgIDMgKy0NCj4+Pj4+PiAgICAgMyBmaWxlcyBjaGFuZ2VkLCA2NSBpbnNlcnRpb25zKCspLCA0
NSBkZWxldGlvbnMoLSkNCj4+Pj4+Pg0KPj4+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2RtYS1i
dWYvcmVzZXJ2YXRpb24uYyBiL2RyaXZlcnMvZG1hLWJ1Zi9yZXNlcnZhdGlvbi5jDQo+Pj4+Pj4g
aW5kZXggZWY3MTBlZmZlZGZhLi5lNDNhMzE2YTAwNWQgMTAwNjQ0DQo+Pj4+Pj4gLS0tIGEvZHJp
dmVycy9kbWEtYnVmL3Jlc2VydmF0aW9uLmMNCj4+Pj4+PiArKysgYi9kcml2ZXJzL2RtYS1idWYv
cmVzZXJ2YXRpb24uYw0KPj4+Pj4+IEBAIC0yMzEsNiArMjMxLDY4IEBAIHZvaWQgcmVzZXJ2YXRp
b25fb2JqZWN0X2FkZF9zaGFyZWRfZmVuY2Uoc3RydWN0IHJlc2VydmF0aW9uX29iamVjdCAqb2Jq
LA0KPj4+Pj4+ICAgICB9DQo+Pj4+Pj4gICAgIEVYUE9SVF9TWU1CT0wocmVzZXJ2YXRpb25fb2Jq
ZWN0X2FkZF9zaGFyZWRfZmVuY2UpOw0KPj4+Pj4+DQo+Pj4+Pj4gKy8qKg0KPj4+Pj4+ICsgKiBy
ZXNlcnZhdGlvbl9vYmplY3RfcmVtb3ZlX3NoYXJlZF9mZW5jZSAtIHJlbW92ZSBzaGFyZWQgZmVu
Y2VzDQo+Pj4+Pj4gKyAqIEBvYmo6IHRoZSByZXNlcnZhdGlvbiBvYmplY3QNCj4+Pj4+PiArICog
QGNvbnRleHQ6IHRoZSBjb250ZXh0IG9mIHRoZSBmZW5jZXMgdG8gcmVtb3ZlDQo+Pj4+Pj4gKyAq
DQo+Pj4+Pj4gKyAqIFJlbW92ZSBzaGFyZWQgZmVuY2VzIGJhc2VkIG9uIHRoZWlyIGZlbmNlIGNv
bnRleHQuDQo+Pj4+Pj4gKyAqLw0KPj4+Pj4gVGhpcyBuZWVkcyBhIHNlcmlvdXMgZXhwbGFuYXRp
b24gb2YgIndoeT8iLiBSZW1vdmluZyBmZW5jZXMgd2l0aG91dA0KPj4+Pj4gZ3VhcmFudGVlaW5n
IHRoZXkncmUgYWxsIHNpZ25hbGVkIGlzIGEgZ29vZCB3YXkgdG8gY3JlYXRlIGhhdm9jLiBZb3Vy
DQo+Pj4+PiBjb21taXQgbWVzc2FnZSBoYXMgYSBmZXcgd29yZHMgYWJvdXQgd2hhdCB5b3UncmUg
ZG9pbmcgaGVyZSwgYnV0IGl0DQo+Pj4+PiBzdGlsbCBkb2Vzbid0IGV4cGxhaW4gd2h5IHRoaXMg
aXMgc2FmZSBhbmQgd2hlbiBleGFjdGx5IGl0IHNob3VsZCBiZQ0KPj4+Pj4gdXNlZC4NCj4+Pj4g
WWVhaCwgSSdtIG5vdCB2ZXJ5IGtlZW4gYWJvdXQgdGhpcyBlaXRoZXIuDQo+Pj4+DQo+Pj4+IFRo
ZSBrZXkgcG9pbnQgaXMgdGhlIG1lbW9yeSBpcyBub3QgYWNjZXNzaWJsZSBieSB0aGUgaGFyZHdh
cmUgYW55IG1vcmUNCj4+Pj4gYmVjYXVzZSBpdCBpcyBmcmVlZCBhbmQgcmVtb3ZlZCBmcm9tIHRo
ZSBwYWdlIHRhYmxlcy4NCj4+Pj4NCj4+Pj4gU28gZnVydGhlciBhY2Nlc3MgaXMgcHJldmVudGVk
IGFuZCBpbiB0aGlzIHNwZWNpYWwgY2FzZSBpdCBpcyBhY3R1YWxseQ0KPj4+PiB2YWxpZCB0byBk
byB0aGlzIGV2ZW4gaWYgdGhlIG9wZXJhdGlvbiByZXByZXNlbnRlZCBieSB0aGUgZmVuY2UgaXMg
c3RpbGwNCj4+Pj4gb25nb2luZy4NCj4+PiBIbSwgd2h5IGRvIHlvdSBoYXZlIHRvIHJlbW92ZSB0
aGVzZSBmZW5jZXMgdGhlbj8gQ2FuJ3QgeW91IGp1c3QgbGV0DQo+Pj4gdGhlbSBzaWduYWwgYW5k
IGdldCBjb2xsZWN0ZWQgYXMgdXN1YWw/IEFzIHNvb24gYXMgeW91IHNoYXJlIGJ1ZmZlcnMNCj4+
PiB0aGVzZSBmZW5jZXMgY2FuIGdldCBhbnl3aGVyZSwgc28geW91IG5lZWQgdG8gY29ycmVjdGx5
IHVud2luZCB0aGVtIG5vDQo+Pj4gbWF0dGVyIHdoYXQuDQo+Pj4NCj4+PiBZb3UncmUga2luZGEg
c3RpbGwganVzdCBkZXNjcmliaW5nIHdoYXQgeW91J3JlIGRvaW5nLCBub3Qgd2h5Lg0KPj4gSXQg
aXMgc2ltcGx5IG1vcmUgZWZmaWNpZW50IHRvIHJlbW92ZSB0aGUgZmVuY2UgZnJvbSBvbmUgcmVz
ZXJ2YXRpb24NCj4+IG9iamVjdCB0aGFuIHRvIGFkZCBhIG5ldyBmZW5jZSB0byBhbGwgb3RoZXIg
cmVzZXJ2YXRpb24gb2JqZWN0cyBpbiB0aGUNCj4+IHNhbWUgcHJvY2Vzcy4NCj4gT2ssIHlvdSBz
dGlsbCB0YWxrIGluIHJpZGRsZXMgYW5kIGRvbid0IGV4cGxhaW4gd2hhdCB0aGUgZ29hbCBvZiB0
aGlzDQo+IGVudGlyZSBkYW5jZSBpcywgc28gSSB3ZW50IGFuZCByZWFkIHRoZSBjb2RlLiBBc3N1
bWluZyBJIGRpZG4ndCBtaXNyZWFkDQo+IHRvbyBtdWNoOg0KPg0KPiAxLiB5b3UgY3JlYXRlIGEg
ZmFrZSBmZW5jZSBvbiBhIHBlci1wcm9jZXNzIHRpbWVsaW5lLg0KPiAyLiB5b3UgYXR0YWNoIHRo
aXMgbGliZXJhbGx5IHRvIGFsbCB0aGUgYm8geW91J3JlIGNyZWF0aW5nIG9uIHRoYXQNCj4gcHJv
Y2Vzcw0KPiAzLiB0aGUgZmVuY2UgbmV2ZXIgc2lnbmFscyBvbiBpdHMgb3duLCBidXQgaXQgaGFz
IGEgdmVyeSBtYWdpYw0KPiAtPmVuYWJsZV9zaWduYWxpbmcgY2FsbGJhY2sgd2hpY2ggaXMgdGhl
IG9ubHkgdGhpbmcgdGhhdCBtYWtlcyB0aGlzIGZlbmNlDQo+IHN3aXRjaCB0byBzaWduYWxsZWQg
aW4gYSBmaW5pdGUgdGltZS4gQmVmb3JlIHRoYXQgaXQncyBzdHVjayBmb3JldmVyLiBTbw0KPiBx
dWl0ZSBhIGJpdCBhIHNjaHLDtmRpbmdlciBmZW5jZTogSXQncyBub3QgYSByZWFsIGZlbmNlIChi
ZWNhdXNlIGl0IGZhaWxzDQo+IHRvIHNpZ25hbCBpbiBib3VuZGVkIHRpbWUpIGV4Y2VwdCB3aGVu
IHlvdSBzdGFydCB0byBsb29rIGF0IGl0Lg0KPiA0LiBMb29raW5nIGF0IHRoZSBmZW5jZSB0cmln
Z2VycyBldmljdGlvbiwgYXQgdGhhdCBwb2ludCB3ZSByZXBsYWNlIHRoaXMNCj4gbWFnaWMgZXZp
Y3Rpb24gZmVuY2Ugd2l0aCB0aGUgbmV4dCBzZXQsIHJlYWNxdWlyZSBidWZmZXJzIGFuZCB0aGVu
IHVuYmxvY2sNCj4gdGhlIGtmZCBwcm9jZXNzIG9uY2UgZXZlcnl0aGluZyBpcyBpbiBzaGFwZSBh
Z2Fpbi4NCj4NCj4gVGhpcyBpcyBzb29vb29vb29vb29vb29vb29vIG1hZ2ljIHRoYXQgSSByZWFs
bHkgZG9uJ3QgdGhpbmsgd2Ugc2hvdWxkDQo+IGVuY291cmFnZSBwZW9wbGUgd2l0aG91dCBjbHVl
IHRvIG1heWJlIHVzZSB0aGlzIGFuZCB0b3RhbGx5IGJyZWFrIGFsbA0KPiBmZW5jZXMgZ3VhcmFu
dGVlcy4NCg0KWWVhaCwgdGhhdCBpcyBjb3JyZWN0LiBCdXQgdGhpcyBpcyBjb21wbGV0ZWx5IHVu
cmVsYXRlZCB0byB3aHkgd2Ugd2FudCANCnRvIHJlbW92ZSB0aGUgZmVuY2UuDQoNCj4gSWYgeW91
IGRvIHdhbnQgdG8gbWFrZSBzdXJlIGFuIG9wdGltaXplZCB2ZXJzaW9uIHdpdGhpbg0KPiByZXNl
cnZhdGlvbl9vYmplY3QuYywgdGhlbiBpdCBzaG91bGQgYmUgY29kZSB3aGljaCByZXBsYWNlcyBm
ZW5jZXMgaWZmOg0KPiAtIHRoZXkncmUgdGhlIHNhbWUgY29udGV4dA0KPiAtIGxhdGVyIGluIHRo
ZSBvcmRlcmluZyB3aXRoaW4gdGhhdCBjb250ZXh0DQo+IC0gb2YgdGhlIHNhbWUgdHlwZSAoaS5l
LiBzYWZlIHZzIHNoYXJlZCkNCj4NCj4gVGhhdCB3b3VsZCBhY3R1YWxseSBiZSBzYWZlIHRoaW5n
IHRvIGRvLg0KDQpObywgdGhhdCB3b24ndCB3b3JrIGJlY2F1c2UgdGhlcmUgaXMgbm8gcmVwbGFj
ZW1lbnQgZm9yIHRoZSBmZW5jZSBpbiANCnF1ZXN0aW9uLg0KDQpTZWUgd2Ugd2FudCB0byByZW1v
dmUgdGhlIGZlbmNlIGJlY2F1c2UgdGhlIG1lbW9yeSBpcyBmcmVlZCB1cC4NCg0KPiBBbHNvLCB0
aGUgYWJvdmUgaXMgd2hhdCBJIGV4cGVjdGVkIHdoZW4gYXNraW5nICJ3aHkgZG8geW91IG5lZWQg
dGhpcyIsIG5vdA0KPiAid2UgcmVwbGFjZSBmZW5jZXMsIGl0cyBtb3JlIGVmZmljaWVudCIgSSBr
aW5kYSBnb3QgdGhhdCBmcm9tIHRoZSBjb2RlIDotKQ0KDQpXZWxsIEkgZXhwbGFpbmVkIHRoZSBz
aG9ydCB2ZXJzaW9uIHdoeSB3ZSBkbyB0aGlzLiBXaGF0IHlvdSBkdWcgdXAgaGVyZSANCmlzIGNv
cnJlY3QgYXMgd2VsbCwgYnV0IGNvbXBsZXRlbHkgdW5yZWxhdGVkIHRvIHJlbW92aW5nIHRoZSBm
ZW5jZS4NCg0KQWdhaW4sIHRoZSByZWFzb24gdG8gcmVtb3ZlIHRoZSBmZW5jZSBmcm9tIG9uZSBy
ZXNlcnZhdGlvbiBvYmplY3QgaXMgDQpzaW1wbHkgdGhhdCBpdCBpcyBmYXN0ZXIgdG8gcmVtb3Zl
IGl0IGZyb20gb25lIG9iamVjdCB0aGFuIHRvIGF0dGFjaCBhIA0KbmV3IGZlbmNlIHRvIGFsbCBv
dGhlciBvYmplY3RzLg0KDQpJdCdzIGp1c3QgYW4gb3B0aW1pemF0aW9uLA0KQ2hyaXN0aWFuLg0K
DQo+DQo+IFBsdXMgcmVhZGluZyB0aGlzIG5vdyB3aXRoIChhdCBsZWFzdCB0aGUgYmVsaWV2ZSBv
ZikgdW5kZXJzdGFuZGluZyB3aGF0DQo+IHlvdSdyZSBkb2luZywgcmVwbGFjaW5nIHRoZSBmZW5j
ZXMgYW5kIHJlYXR0YWNoaW5nIHRoZSBuZXh0IG9uZSBvZiB0aGVzZQ0KPiBtYWdpYyBmZW5jZXMg
ZG9lc24ndCBmZWVsIGxpa2UgaXQncyBhY3R1YWxseSBtYWtpbmcgYW55dGhpbmcgZmFzdGVyLiBK
dXN0DQo+IG1vcmUgb2JzY3VyZSAuLi4NCj4NCj4gTG9va2luZyBhdCByZXNlcnZhdGlvbl9vYmpl
Y3RfYWRkX3NoYXJlZF9mZW5jZSBpdCBzZWVtcyB0byBkdHJ0IGFscmVhZHkuDQo+IC1EYW5pZWwN
Cj4NCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
