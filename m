Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F7BEE45E
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2019 17:05:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58C076E5D2;
	Mon,  4 Nov 2019 16:05:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700040.outbound.protection.outlook.com [40.107.70.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFE0B6E5D2;
 Mon,  4 Nov 2019 16:05:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fLs7lc+CO4JS/R8ySqx7Bbehf4+2sgoVAu4CPiTeW8O/h2NQuHigJDmUpb5ZRjBnXSFXc4BucXtRNabUxMBSgG0h0jyZ5DNXX8SFhRchTYlTFtiyVU0JB+/21Ron17aSI38oRumGhzG7mQ970PXWKPbinMnwmjCwFv66QfnEHo3INHtgSR2dAcVszgNqs0oDA27rwGpJx44vZxEdsdtzTnlfWrnWjbcSx8aJ+eoPmCcVKGWef4/ydpY8b4dw89aSc4Pv2b+VDgttcV57qBnqCZbmy5T7LgBrMWTAQT9W5ovhvMTOBl3d63uNogMZ4pBWzWIAl4xVSQRUwer03Lji2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/nz3nVUPVNKW9nBC8xwC2SUB4Z58rKjTE0iamWIi/bw=;
 b=HBENfb9akbu61JJUbUO93TbEBLoLAtBR+Yw9ssZIO7db1t02q2W+SRpuw9zVt4UiI0ABCgItB0OMCjOnCN3s8t0QHHoRerCZWk6OEig349S5+4wMLUlfHsmhtwIUCDPeJvPGPJ7gazm9c26u+YCJW8pV7/4opd8eJaQvfXmTBYIiyx8k4WoJToi/8miyTeWySdZaOW1PjGa8aU3n+DrhdWC9i8naOrB9gA+zoUpZhwlgBf6LOOCP8Q/Z8GocZyuMYusH6KrGEg/2hs5LqBSS+dvB6rN8NMX+Bf5lGjBkB4IMZu/3Wfctq17acnYcnUZqPteArhJo5qmA4hHjhgUO3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB4236.namprd12.prod.outlook.com (10.141.184.142) by
 DM6PR12MB3484.namprd12.prod.outlook.com (20.178.199.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2408.24; Mon, 4 Nov 2019 16:05:20 +0000
Received: from DM6PR12MB4236.namprd12.prod.outlook.com
 ([fe80::ed47:5df:99fa:4073]) by DM6PR12MB4236.namprd12.prod.outlook.com
 ([fe80::ed47:5df:99fa:4073%5]) with mapi id 15.20.2408.024; Mon, 4 Nov 2019
 16:05:20 +0000
From: "Lakha, Bhawanpreet" <Bhawanpreet.Lakha@amd.com>
To: "Wentland, Harry" <Harry.Wentland@amd.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: drm/amd/display: Add HDCP module - static analysis bug report
Thread-Topic: drm/amd/display: Add HDCP module - static analysis bug report
Thread-Index: AQHVejcKxYM7N3T1jUOoIu2sebAn9adSieGA///b6ACAAEjNAIAAIkyAgAADWICAKDNugIAAS3CAgAALxwA=
Date: Mon, 4 Nov 2019 16:05:20 +0000
Message-ID: <370ed3d2-37c1-a63b-8e15-b01e40e9b893@amd.com>
References: <951eb7dc-bebe-5049-4998-f199e18b0bf3@canonical.com>
 <20191009163235.GT16989@phenom.ffwll.local>
 <a0d5f3a3-a2b3-5367-42f9-bde514571e25@amd.com>
 <CAKMK7uEtJRDhibWDv2TB2WrFzFooMWPSbveDD2N-rudAwvzVFA@mail.gmail.com>
 <c8f96b46-e81e-1e41-aafc-5f6ec236d66f@amd.com>
 <CAKMK7uHr3aeJRqJAscDDfsuBBnVXCeN9SS36-1UGuK84NyOD5Q@mail.gmail.com>
 <CAKMK7uH6EoY9MkzjSjU+Fe=E-XB4Tf9d2VsW=Tr=tFy1J-dJgg@mail.gmail.com>
 <53bf910b-5f9c-946b-17ee-602c24c0fa96@amd.com>
In-Reply-To: <53bf910b-5f9c-946b-17ee-602c24c0fa96@amd.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0029.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::42) To DM6PR12MB4236.namprd12.prod.outlook.com
 (2603:10b6:5:212::14)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 7a3d29e6-aecf-4a55-32d0-08d76140ca83
x-ms-traffictypediagnostic: DM6PR12MB3484:
x-ms-exchange-purlcount: 2
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB348401DA154938CBC9A877DAF97F0@DM6PR12MB3484.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0211965D06
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(366004)(136003)(396003)(346002)(189003)(199004)(6486002)(486006)(478600001)(6246003)(587094005)(66556008)(66476007)(64756008)(66446008)(99286004)(5660300002)(54906003)(71200400001)(71190400001)(6512007)(110136005)(25786009)(316002)(36756003)(6116002)(386003)(53546011)(31696002)(6506007)(6306002)(102836004)(3846002)(52116002)(31686004)(7736002)(305945005)(26005)(256004)(66946007)(186003)(76176011)(229853002)(8936002)(4326008)(14444005)(81156014)(8676002)(81166006)(966005)(66066001)(2616005)(446003)(11346002)(476003)(6436002)(14454004)(2906002)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3484;
 H:DM6PR12MB4236.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UuicnQNsa5ycALL3qpNOxAFehvgt6iKorR7Kg9vGehQLQwdTwZXPKqxfHOAl3efVzBZxVxxpU98TlHKdVckWXpmTAwQNHtvjFwUPgXTXZOMwxthxIm1j99XVQ1xG/XrFZbXZRz1KbWDxBZS5/pZvNH1HSlK2UdUBumsULW8gTH1hHLCRjr6M6fsNsImyFeI2XfjebJq/U6A6w2x2fyRMJi1yuSuNda5NvHVInOkApfflD+xqTdNngKpFU2jPzTr/HdEaoFVuawXoFFEZ6OedLJo28ZbQJ5Yjoabd/s081RY7f2STBvjEYyo1F37+gbN3aK2A1SL2I9St0Idn1XVguOhvcjyhi47VPZjZ5mLwWs4npBx7mOIS8U/7Ce3OEK3z3J99rJGKGsI9zbeF724xEHzRI0r9nZr5xo6IblprAGWh5TXe+aLpT4fGFOXUxo24YwZjtuPmesn3dJTUGA3kjBGRG8MPmFbz8bwlXnjIDE8=
Content-ID: <F7C86A86046AF147B0D7B80414EAA58D@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a3d29e6-aecf-4a55-32d0-08d76140ca83
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2019 16:05:20.2120 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cIieEEwnnfrgvkoMAaFPJRokw6vEhBB/IMFgiRtH2IgqWp2qPUtizE43VwIL16CQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3484
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/nz3nVUPVNKW9nBC8xwC2SUB4Z58rKjTE0iamWIi/bw=;
 b=1sliTk5RGd3tpyyLz3Xc1jgpJH7+5aEFTYw81nQ36e9YoQpJd2V8UkEm9JmP+ZGQOGEHtQqeqcRnxvt+yfC4ZsCDGpqIbU6WPBZf1b+dOPF5thPg2lP/ECXNNl0Asi2YUv0x+g7/0lriba1QpiAiwCgGsLFSJ1VrLUIfkb3vZP0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Bhawanpreet.Lakha@amd.com; 
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
Cc: "Li, Sun peng \(Leo\)" <Sunpeng.Li@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 Colin Ian King <colin.king@canonical.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGFuaWVsLA0KDQpJIGhhdmUgdGhlIHBhdGNoZXMgcHJlcGFyZWQgYnV0IHRoZXkgbmVlZGVk
IHNvbWUgdGVzdGluZyBiZWZvcmUgSSBzZW5kIHRoZW0gKGNvZGUgbmVlZGVkIGEgc2xpZ2h0IHJl
ZmFjdG9yIHRvIHVzZSB0aGUgZHJtX2hkY3AuaCksIEkgc2hvdWxkIGJlIGFibGUgdG8gc2VuZCB0
aGUgcGF0Y2hlcyB0aGlzIHdlZWsuDQoNCg0KVGhhbmtzLA0KDQpCaGF3YW4NCg0KT24gMjAxOS0x
MS0wNCAxMDoyMyBhLm0uLCBXZW50bGFuZCwgSGFycnkgd3JvdGU6DQo+IE9uIDIwMTktMTEtMDQg
NTo1MyBhLm0uLCBEYW5pZWwgVmV0dGVyIHdyb3RlOg0KPj4gT24gV2VkLCBPY3QgOSwgMjAxOSBh
dCAxMDo1OCBQTSBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+IHdyb3RlOg0KPj4+IE9u
IFdlZCwgT2N0IDksIDIwMTkgYXQgMTA6NDYgUE0gTGFraGEsIEJoYXdhbnByZWV0DQo+Pj4gPEJo
YXdhbnByZWV0Lkxha2hhQGFtZC5jb20+IHdyb3RlOg0KPj4+PiBJIG1pc3VuZGVyc3Rvb2QgYW5k
IHdhcyB0YWxraW5nIGFib3V0IHRoZSBrc3YgdmFsaWRhdGlvbiBzcGVjaWZpY2FsbHkNCj4+Pj4g
KHVzYWdlIG9mIGRybV9oZGNwX2NoZWNrX2tzdnNfcmV2b2tlZCgpKS4NCj4+PiBIbSBmb3IgdGhh
dCBzcGVjaWZpY2FsbHkgSSB0aGluayB5b3Ugd2FudCB0byBkbyBib3RoLCBpLmUuIGJvdGgNCj4+
PiBjb25zdWx0IHlvdXIgcHNwLCBidXQgYWxzbyBjaGVjayBmb3IgcmV2b2tlZCBrc3ZzIHdpdGgg
dGhlIGNvcmUNCj4+PiBoZWxwZXIuIEF0IGxlYXN0IG9uIHNvbWUgcGxhdGZvcm1zIG9ubHkgdGhl
IGNvcmUgaGVscGVyIG1pZ2h0IGhhdmUgdGhlDQo+Pj4gdXBkYXRlZCByZXZva2UgbGlzdC4NCj4+
Pg0KPiBJIHRoaW5rIGl0J3MgYW4gZWl0aGVyL29yLiBFaXRoZXIgd2UgdXNlIGFuIEhEQ1AgaW1w
bGVtZW50YXRpb24gdGhhdCdzDQo+IGZ1bGx5IHJ1bm5pbmcgaW4geDg2IGtlcm5lbCBzcGFjZSAo
c3RpbGwgbm90IHN1cmUgaG93IHRoYXQncyBjb21wbGlhbnQpDQo+IG9yIHdlIGZ1bGx5IHJlbHkg
b24gb3VyIFBTUCBGVyB0byBkbyB3aGF0IGl0J3MgZGVzaWduZWQgdG8gZG8uIEkgZG9uJ3QNCj4g
dGhpbmsgaXQgbWFrZXMgc2Vuc2UgdG8gbWl4IGFuZCBtYXRjaCBoZXJlLg0KPg0KPj4+PiBGb3Ig
dGhlIGRlZmluZXMgSSB3aWxsIGNyZWF0ZSBwYXRjaGVzIHRvIHVzZSBkcm1faGRjcCB3aGVyZSBp
dCBpcyB1c2FibGUuDQo+Pj4gVGhhbmtzIGEgbG90LiBJbWUgb25jZSB3ZSBoYXZlIHNoYXJlZCBk
ZWZpbml0aW9ucyBpdCdzIG11Y2ggZWFzaWVyIHRvDQo+Pj4gYWxzbyBzaGFyZSBzb21lIGhlbHBl
cnMsIHdoZXJlIGl0IG1ha2VzIHNlbnNlLg0KPj4+DQo+Pj4gQXNpZGUgSSB0aGluayB0aGUgaGRj
cCBjb2RlIGNvdWxkIGFsc28gdXNlIGEgYml0IG9mIGRlbWlkbGF5ZXJpbmcuIEF0DQo+Pj4gbGVh
c3QgSSdtIG5vdCB1bmRlcnN0YW5kaW5nIHdoeSB5b3UgYWRkIGEgMm5kIGFic3RyYWN0aW9uIGxh
eWVyIGZvcg0KPj4+IGkyYy9kcGNkLCBkbV9oZWxwZXIgYWxyZWFkeSBoYXMgdGhhdC4gVGhhdCBz
ZWVtcyBsaWtlIG9uZSBhYnN0cmFjdGlvbg0KPj4+IGxheWVyIHRvbyBtdWNoLg0KPj4gSSBoYXZl
bid0IHNlZW4gYW55dGhpbmcgZmx5IGJ5IG9yIGluIHRoZSBsYXRlc3QgcHVsbCByZXF1ZXN0IC4u
LiB5b3UNCj4+IGZvbGtzIHN0aWxsIHdvcmtpbmcgb24gdGhpcyBvciBtb3JlIHB1dCBvbiB0aGUg
Im1heWJlLCBwcm9iYWJseSBuZXZlciINCj4+IHBpbGU/DQo+Pg0KPiBGb2xsb3dpbmcgdXAgd2l0
aCBCaGF3YW4uDQo+DQo+IEhhcnJ5DQo+DQo+PiAtRGFuaWVsDQo+Pg0KPj4NCj4+PiAtRGFuaWVs
DQo+Pj4NCj4+Pj4NCj4+Pj4gQmhhd2FuDQo+Pj4+DQo+Pj4+IE9uIDIwMTktMTAtMDkgMjo0MyBw
Lm0uLCBEYW5pZWwgVmV0dGVyIHdyb3RlOg0KPj4+Pj4gT24gV2VkLCBPY3QgOSwgMjAxOSBhdCA4
OjIzIFBNIExha2hhLCBCaGF3YW5wcmVldA0KPj4+Pj4gPEJoYXdhbnByZWV0Lkxha2hhQGFtZC5j
b20+IHdyb3RlOg0KPj4+Pj4+IEhpLA0KPj4+Pj4+DQo+Pj4+Pj4gVGhlIHJlYXNvbiB3ZSBkb24n
dCB1c2UgZHJtX2hkY3AgaXMgYmVjYXVzZSBvdXIgcG9saWN5IGlzIHRvIGRvIGhkY3ANCj4+Pj4+
PiB2ZXJpZmljYXRpb24gdXNpbmcgUFNQL0hXIChvbmJvYXJkIHNlY3VyZSBwcm9jZXNzb3IpLg0K
Pj4+Pj4gaTkxNSBhbHNvIHVzZXMgaHcgdG8gYXV0aCwgd2Ugc3RpbGwgdXNlIHRoZSBwYXJ0cyBm
cm9tIGRybV9oZGNwIC4uLg0KPj4+Pj4gRGlkIHlvdSBhY3R1YWxseSBsb29rIGF0IHdoYXQncyBp
biB0aGVyZT8gSXQncyBlc3NlbnRpYWxseSBqdXN0IHNoYXJlZA0KPj4+Pj4gZGVmaW5lcyBhbmQg
ZGF0YSBzdHJ1Y3R1cmVzIGZyb20gdGhlIHN0YW5kYXJkLCBwbHVzIGEgZmV3IG1pbmltYWwNCj4+
Pj4+IGhlbHBlcnMgdG8gZW4vZGVjb2RlIHNvbWUgYml0cy4gSnVzdCBmcm9tIGEgcXVpY2sgcmVh
ZCB0aGUgZW50aXJlDQo+Pj4+PiBwYXRjaCB2ZXJ5IG11Y2ggbG9va3MgbGlrZSBtaWRsYXllciBl
dmVyeXdoZXJlIGRlc2lnbiB0aGF0IHdlDQo+Pj4+PiBkaXNjdXNzZWQgYmFjayB3aGVuIERDIGxh
bmRlZCAuLi4NCj4+Pj4+IC1EYW5pZWwNCj4+Pj4+DQo+Pj4+Pj4gQmhhd2FuDQo+Pj4+Pj4NCj4+
Pj4+PiBPbiAyMDE5LTEwLTA5IDEyOjMyIHAubS4sIERhbmllbCBWZXR0ZXIgd3JvdGU6DQo+Pj4+
Pj4+IE9uIFRodSwgT2N0IDAzLCAyMDE5IGF0IDExOjA4OjAzUE0gKzAxMDAsIENvbGluIElhbiBL
aW5nIHdyb3RlOg0KPj4+Pj4+Pj4gSGksDQo+Pj4+Pj4+Pg0KPj4+Pj4+Pj4gU3RhdGljIGFuYWx5
c2lzIHdpdGggQ292ZXJpdHkgaGFzIGRldGVjdGVkIGEgcG90ZW50aWFsIGlzc3VlIHdpdGgNCj4+
Pj4+Pj4+IGZ1bmN0aW9uIHZhbGlkYXRlX2Jrc3YgaW4NCj4+Pj4+Pj4+IGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9tb2R1bGVzL2hkY3AvaGRjcDFfZXhlY3V0aW9uLmMgd2l0aCByZWNlbnQN
Cj4+Pj4+Pj4+IGNvbW1pdDoNCj4+Pj4+Pj4+DQo+Pj4+Pj4+PiBjb21taXQgZWQ5ZDhlMmJjYjAw
M2VjOTQ2NThjYWZlOWIxYmIzOTYwZTIxMzllYw0KPj4+Pj4+Pj4gQXV0aG9yOiBCaGF3YW5wcmVl
dCBMYWtoYSA8Qmhhd2FucHJlZXQuTGFraGFAYW1kLmNvbT4NCj4+Pj4+Pj4+IERhdGU6ICAgVHVl
IEF1ZyA2IDE3OjUyOjAxIDIwMTkgLTA0MDANCj4+Pj4+Pj4+DQo+Pj4+Pj4+PiAgICAgICAgZHJt
L2FtZC9kaXNwbGF5OiBBZGQgSERDUCBtb2R1bGUNCj4+Pj4+Pj4gSSB0aGluayB0aGUgcmVhbCBx
dWVzdGlvbiBoZXJlIGlzIC4uLiB3aHkgaXMgdGhpcyBub3QgdXNpbmcgZHJtX2hkY3A/DQo+Pj4+
Pj4+IC1EYW5pZWwNCj4+Pj4+Pj4NCj4+Pj4+Pj4+IFRoZSBhbmFseXNpcyBpcyBhcyBmb2xsb3dz
Og0KPj4+Pj4+Pj4NCj4+Pj4+Pj4+ICAgICAyOCBzdGF0aWMgaW5saW5lIGVudW0gbW9kX2hkY3Bf
c3RhdHVzIHZhbGlkYXRlX2Jrc3Yoc3RydWN0IG1vZF9oZGNwICpoZGNwKQ0KPj4+Pj4+Pj4gICAg
IDI5IHsNCj4+Pj4+Pj4+DQo+Pj4+Pj4+PiBDSUQgODk4NTIgKCMxIG9mIDEpOiBPdXQtb2YtYm91
bmRzIHJlYWQgKE9WRVJSVU4pDQo+Pj4+Pj4+Pg0KPj4+Pj4+Pj4gMS4gb3ZlcnJ1bi1sb2NhbDoN
Cj4+Pj4+Pj4+IE92ZXJydW5uaW5nIGFycmF5IG9mIDUgYnl0ZXMgYXQgYnl0ZSBvZmZzZXQgNyBi
eSBkZXJlZmVyZW5jaW5nIHBvaW50ZXINCj4+Pj4+Pj4+ICh1aW50NjRfdCAqKWhkY3AtPmF1dGgu
bXNnLmhkY3AxLmJrc3YuDQo+Pj4+Pj4+Pg0KPj4+Pj4+Pj4gICAgIDMwICAgICAgICB1aW50NjRf
dCBuID0gKih1aW50NjRfdCAqKWhkY3AtPmF1dGgubXNnLmhkY3AxLmJrc3Y7DQo+Pj4+Pj4+PiAg
ICAgMzEgICAgICAgIHVpbnQ4X3QgY291bnQgPSAwOw0KPj4+Pj4+Pj4gICAgIDMyDQo+Pj4+Pj4+
PiAgICAgMzMgICAgICAgIHdoaWxlIChuKSB7DQo+Pj4+Pj4+PiAgICAgMzQgICAgICAgICAgICAg
ICAgY291bnQrKzsNCj4+Pj4+Pj4+ICAgICAzNSAgICAgICAgICAgICAgICBuICY9IChuIC0gMSk7
DQo+Pj4+Pj4+PiAgICAgMzYgICAgICAgIH0NCj4+Pj4+Pj4+DQo+Pj4+Pj4+PiBoZGNwLT5hdXRo
Lm1zZy5oZGNwMS5ia3N2IGlzIGFuIGFycmF5IG9mIDUgdWludDhfdCBhcyBkZWZpbmVkIGluDQo+
Pj4+Pj4+PiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvbW9kdWxlcy9oZGNwL2hkY3AuaCBh
cyBmb2xsb3dzOg0KPj4+Pj4+Pj4NCj4+Pj4+Pj4+IHN0cnVjdCBtb2RfaGRjcF9tZXNzYWdlX2hk
Y3AxIHsNCj4+Pj4+Pj4+ICAgICAgICAgICAgdWludDhfdCAgICAgICAgIGFuWzhdOw0KPj4+Pj4+
Pj4gICAgICAgICAgICB1aW50OF90ICAgICAgICAgYWtzdls1XTsNCj4+Pj4+Pj4+ICAgICAgICAg
ICAgdWludDhfdCAgICAgICAgIGFpbmZvOw0KPj4+Pj4+Pj4gICAgICAgICAgICB1aW50OF90ICAg
ICAgICAgYmtzdls1XTsNCj4+Pj4+Pj4+ICAgICAgICAgICAgdWludDE2X3QgICAgICAgIHIwcDsN
Cj4+Pj4+Pj4+ICAgICAgICAgICAgdWludDhfdCAgICAgICAgIGJjYXBzOw0KPj4+Pj4+Pj4gICAg
ICAgICAgICB1aW50MTZfdCAgICAgICAgYnN0YXR1czsNCj4+Pj4+Pj4+ICAgICAgICAgICAgdWlu
dDhfdCAgICAgICAgIGtzdmxpc3RbNjM1XTsNCj4+Pj4+Pj4+ICAgICAgICAgICAgdWludDE2X3Qg
ICAgICAgIGtzdmxpc3Rfc2l6ZTsNCj4+Pj4+Pj4+ICAgICAgICAgICAgdWludDhfdCAgICAgICAg
IHZwWzIwXTsNCj4+Pj4+Pj4+DQo+Pj4+Pj4+PiAgICAgICAgICAgIHVpbnQxNl90ICAgICAgICBi
aW5mb19kcDsNCj4+Pj4+Pj4+IH07DQo+Pj4+Pj4+Pg0KPj4+Pj4+Pj4gdmFyaWFibGUgbiBpcyBn
b2luZyB0byBjb250YWluIHRoZSBjb250YWlucyBvZiByMHAgYW5kIGJjYXBzLiBJJ20gbm90DQo+
Pj4+Pj4+PiBzdXJlIGlmIHRoYXQgaXMgaW50ZW50aW9uYWwuIElmIG5vdCwgdGhlbiB0aGUgY291
bnQgaXMgZ29pbmcgdG8gYmUNCj4+Pj4+Pj4+IGluY29ycmVjdCBpZiB0aGVzZSBhcmUgbm9uLXpl
cm8uDQo+Pj4+Pj4+Pg0KPj4+Pj4+Pj4gQ29saW4NCj4+Pj4+PiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPj4+Pj4+IGRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QNCj4+Pj4+PiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+Pj4+Pj4gaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwNCj4+Pj4+
DQo+Pj4NCj4+Pg0KPj4+IC0tDQo+Pj4gRGFuaWVsIFZldHRlcg0KPj4+IFNvZnR3YXJlIEVuZ2lu
ZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbg0KPj4+ICs0MSAoMCkgNzkgMzY1IDU3IDQ4IC0gaHR0cDov
L2Jsb2cuZmZ3bGwuY2gNCj4+DQo+Pg0KPj4gLS0NCj4+IERhbmllbCBWZXR0ZXINCj4+IFNvZnR3
YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbg0KPj4gKzQxICgwKSA3OSAzNjUgNTcgNDgg
LSBodHRwOi8vYmxvZy5mZndsbC5jaA0KPj4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
