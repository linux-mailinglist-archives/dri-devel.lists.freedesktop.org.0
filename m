Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28228C49A9
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 10:37:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EA5D6E906;
	Wed,  2 Oct 2019 08:37:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820089.outbound.protection.outlook.com [40.107.82.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40D516E901;
 Wed,  2 Oct 2019 08:37:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LIroRxRdV6sA7qt4vLJGAoCDs3szHNhOk+vv/0eonk3xuG62jfeHSXZGBIGcyc7lUa5/2m0qMSx9x8T7QJb5i7Mp2DGlWiOqhCfAcKqz+Kn/cCrh8awnVMB+WI7dqEHZWB22+zTjdyGb0AoUenBg1cu2xBX4BjY8iVGB85vqVDNubJqBxbF773i1QBqkfxWBpDj02FPzTnSb4DQnsrAMyRVLyKkDOnDlKBEhrFL2RMjoVYdyKsoWtwoVUb5U1OFFGt50z3TjJW+YxRdYy1q6pg3iEGWmr2HtcRNZl0GBTIqVjdBuacvFy3LARSzKLrP80chCzthcuYFaFMyVLB4Avw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/zkjDsu4O2PLLT2swux/mtxRjnTbBgISe9KHV7+n2AE=;
 b=XyZxs7Vxopi3h0u+m8x1oDKEKPa16yDJq6Tk9zBMfrhTOzOXR6E+VKoFjoTjDUr1zKSIFKwTfLwyosqNiD0s9rphKRwI9swWrmbxeElMvEDqq/CMLk6OZSESJKj/l56GeUlpbczoJRs5B2Q5DjMamSO0EUyT4tLUFaK6x2IYE2U3mtn5bHrX9dvGAz0/WKUd597oZmeem56Dw9ahQ+WWMvUomN8CgwCCe0py/tru61fZthIqNybpCduGZkczufAA/cWRbKL8KjA7POC++XDEgh6ffn4PNfl5PJm1eTCuLDN4ImWhewi7gLWN919NyziLBDvRtWOhw8DmYvEXGReCHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1435.namprd12.prod.outlook.com (10.168.240.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Wed, 2 Oct 2019 08:37:50 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::bd8c:bbd5:66a4:9e83]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::bd8c:bbd5:66a4:9e83%5]) with mapi id 15.20.2305.023; Wed, 2 Oct 2019
 08:37:50 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 1/4] dma-buf: change DMA-buf locking convention
Thread-Topic: [PATCH 1/4] dma-buf: change DMA-buf locking convention
Thread-Index: AQHVbVPkWzky0N2Xn0SoVd76Go5NWKcvz5eAgAAJGwCAAAL9AIAABfgAgAARP4CAAAK6gIAKqtQAgAx+LwA=
Date: Wed, 2 Oct 2019 08:37:50 +0000
Message-ID: <be8abe51-05f5-bd06-2633-0d32828e0e43@amd.com>
References: <20190829142917.13058-1-christian.koenig@amd.com>
 <20190829142917.13058-2-christian.koenig@amd.com>
 <20190903080522.GM2112@phenom.ffwll.local>
 <cd5acbac-73a4-a51a-4383-2c7517e7c180@gmail.com>
 <88f748d2-43de-ae2a-b895-40d8b3be5c78@gmail.com>
 <20190917123150.GM3958@phenom.ffwll.local>
 <da55aa8d-f2b8-0428-ed22-23dc17f71d77@amd.com>
 <20190917131320.GU3958@phenom.ffwll.local>
 <e0e50037-df08-86e3-e8b2-768683e5cce0@amd.com>
 <20190917134524.GY3958@phenom.ffwll.local>
 <7de46ca8-8cb5-d545-42ad-6a7cb4cf753a@amd.com>
 <CAKMK7uFc6CKyF-dW6FE7Hzdz5La7N265DZu_PR7=rKXFjg4QBw@mail.gmail.com>
 <97bb8f03-7fa3-6e61-a1ff-0ffcadbc1a39@amd.com>
In-Reply-To: <97bb8f03-7fa3-6e61-a1ff-0ffcadbc1a39@amd.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM0PR04CA0025.eurprd04.prod.outlook.com
 (2603:10a6:208:122::38) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6b28d6f7-0526-4c19-cffa-08d74713cf1c
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM5PR12MB1435:
x-microsoft-antispam-prvs: <DM5PR12MB14358D590FC1199BD7B843BF839C0@DM5PR12MB1435.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0178184651
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(396003)(346002)(39860400002)(136003)(199004)(189003)(229853002)(36756003)(99286004)(58126008)(6486002)(8936002)(6116002)(316002)(2616005)(6916009)(305945005)(476003)(81166006)(81156014)(2906002)(65806001)(65956001)(7736002)(54906003)(8676002)(6436002)(5660300002)(186003)(66574012)(478600001)(6512007)(102836004)(25786009)(31686004)(14454004)(46003)(446003)(6506007)(386003)(256004)(14444005)(11346002)(86362001)(31696002)(5024004)(71190400001)(71200400001)(6246003)(66446008)(52116002)(66946007)(4326008)(66476007)(66556008)(76176011)(64756008)(486006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1435;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KX0zA9LE7gmDeWeK5ircLa6s8Cnbk8azqli8L1baLSM8tiDN1t+f5xh4DVRz+En0dCPtD69o5BD+uN6SJ2herRxeAoyQQVsp2DfbpmbauViaV942MHVArjZPXXoU8n8ek8hRv+49g6UAPtvoDTVTXXqjw5ugxW3Nwlik6Frm1azw+ns1tDcPCVWicsCQl1Qp4BY50xLxwtgU+cPKNei1jbSiYapiDC1Fc6R6LfbAMUkk5c85m2OpBWvsehIxjU2qDVZeVnw57CMiK+5I7ocuE5umyAS29X/eAa3JkE/ek93ZrQHR+PYTSnAlUqXc+Cv73dHca+cVrOVlFJYbU0vtL1nyozAFUOdG1BmYxAf0EOW3KQ3RoFi2hg8vASpcQRdJ/AS/OTt5dXKftHvNfimNANo5k+nkzrUhGzbzrCQxqfM=
x-ms-exchange-transport-forked: True
Content-ID: <4398970BF8EC3E429F49C6B0E9C8DD28@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b28d6f7-0526-4c19-cffa-08d74713cf1c
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2019 08:37:50.3656 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Waik8Bg2nF8qy+6CcYesVJe+qRiwsnShIds3YrKJVN7N5nxCjcHy/nz/naNuxC7B
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1435
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/zkjDsu4O2PLLT2swux/mtxRjnTbBgISe9KHV7+n2AE=;
 b=XiI3uvl57Naqspo7EIuPuIKi327pFv2c3niWz3YvIyC31hGh3w45zacJglz193O8VnntaDFQSNDOWXmRliK70XhjLEL09FLIgxWavYWfjAluPoRGiNg+3KHEP64ZeE+IEW1NLvTN7gZ4IW7yGKTrJzy0EN7NbKmfAFDi7vSjtxM=
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
Cc: "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGFuaWVsLA0KDQpvbmNlIG1vcmUgYSBwaW5nIG9uIHRoaXMuIEFueSBtb3JlIGNvbW1lbnRz
IG9yIGNhbiB3ZSBnZXQgaXQgY29taXR0ZWQ/DQoNClRoYW5rcywNCkNocmlzdGlhbi4NCg0KQW0g
MjQuMDkuMTkgdW0gMTE6NTAgc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOg0KPiBBbSAxNy4wOS4x
OSB1bSAxNjo1NiBzY2hyaWViIERhbmllbCBWZXR0ZXI6DQo+PiBbU05JUF0NCj4+Pj4+Pj4+Pj4+
PiDCoMKgwqDCoMKgICvCoMKgwqAgLyogV2hlbiBlaXRoZXIgdGhlIGltcG9ydGVyIG9yIHRoZSBl
eHBvcnRlciANCj4+Pj4+Pj4+Pj4+PiBjYW4ndCBoYW5kbGUgZHluYW1pYw0KPj4+Pj4+Pj4+Pj4+
ICvCoMKgwqDCoCAqIG1hcHBpbmdzIHdlIGNhY2hlIHRoZSBtYXBwaW5nIGhlcmUgdG8gYXZvaWQg
aXNzdWVzIA0KPj4+Pj4+Pj4+Pj4+IHdpdGggdGhlDQo+Pj4+Pj4+Pj4+Pj4gK8KgwqDCoMKgICog
cmVzZXJ2YXRpb24gb2JqZWN0IGxvY2suDQo+Pj4+Pj4+Pj4+Pj4gK8KgwqDCoMKgICovDQo+Pj4+
Pj4+Pj4+Pj4gK8KgwqDCoCBpZiAoZG1hX2J1Zl9hdHRhY2htZW50X2lzX2R5bmFtaWMoYXR0YWNo
KSAhPQ0KPj4+Pj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBkbWFfYnVmX2lzX2R5bmFtaWMoZG1h
YnVmKSkgew0KPj4+Pj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBzdHJ1Y3Qgc2dfdGFibGUgKnNn
dDsNCj4+Pj4+Pj4+Pj4+PiArDQo+Pj4+Pj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGlmIChkbWFf
YnVmX2lzX2R5bmFtaWMoYXR0YWNoLT5kbWFidWYpKQ0KPj4+Pj4+Pj4+Pj4+ICsgZG1hX3Jlc3Zf
bG9jayhhdHRhY2gtPmRtYWJ1Zi0+cmVzdiwgTlVMTCk7DQo+Pj4+Pj4+Pj4+Pj4gKw0KPj4+Pj4+
Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBzZ3QgPSBkbWFidWYtPm9wcy0+bWFwX2RtYV9idWYoYXR0
YWNoLCANCj4+Pj4+Pj4+Pj4+PiBETUFfQklESVJFQ1RJT05BTCk7DQo+Pj4+Pj4+Pj4+PiBOb3cg
d2UncmUgYmFjayB0byBlbmZvcmNpbmcgRE1BX0JJREksIHdoaWNoIHdvcmtzIG5pY2VseSANCj4+
Pj4+Pj4+Pj4+IGFyb3VuZCB0aGUNCj4+Pj4+Pj4+Pj4+IGxvY2tpbmcgcGFpbiwgYnV0IGFwcGFy
ZW50bHkgdXBzZXRzIHRoZSBhcm0tc29jIGZvbGtzIHdobyANCj4+Pj4+Pj4+Pj4+IHdhbnQgdG8N
Cj4+Pj4+Pj4+Pj4+IGNvbnRyb2wNCj4+Pj4+Pj4+Pj4+IHRoaXMgYmV0dGVyLg0KPj4+Pj4+Pj4+
PiBUYWtlIGFub3RoZXIgbG9vayBhdCBkbWFfYnVmX21hcF9hdHRhY2htZW50KCksIHdlIHN0aWxs
IHRyeSANCj4+Pj4+Pj4+Pj4gdG8gZ2V0IHRoZQ0KPj4+Pj4+Pj4+PiBjYWNoaW5nIHRoZXJlIGZv
ciBBUk0uDQo+Pj4+Pj4+Pj4+DQo+Pj4+Pj4+Pj4+IFdoYXQgd2UgZG8gaGVyZSBpcyB0byBiaWRp
cmVjdGlvbmFsbHkgbWFwIHRoZSBidWZmZXIgdG8gYXZvaWQgDQo+Pj4+Pj4+Pj4+IHRoZQ0KPj4+
Pj4+Pj4+PiBsb2NraW5nIGh5ZHJhIHdoZW4gaW1wb3J0ZXIgYW5kIGV4cG9ydGVyIGRpc2FncmVl
IG9uIGxvY2tpbmcuDQo+Pj4+Pj4+Pj4+DQo+Pj4+Pj4+Pj4+IFNvIHRoZSBBUk0gZm9sa3MgY2Fu
IGVhc2lseSBhdm9pZCB0aGF0IGJ5IHN3aXRjaGluZyB0byANCj4+Pj4+Pj4+Pj4gZHluYW1pYyBs
b2NraW5nDQo+Pj4+Pj4+Pj4+IGZvciBib3RoLg0KPj4+Pj4+Pj4gU28geW91IHN0aWxsIGJyZWFr
IHRoZSBjb250cmFjdCBiZXR3ZWVuIGltcG9ydGVyIGFuZCBleHBvcnRlciwgDQo+Pj4+Pj4+PiBl
eGNlcHQgbm90DQo+Pj4+Pj4+PiBmb3IgYW55dGhpbmcgdGhhdCdzIHJ1biBpbiBpbnRlbC1nZngt
Y2kgc28gYWxsIGlzIGdvb2Q/DQo+Pj4+Pj4+IE5vLCB0aGUgY29udHJhY3QgYmV0d2VlbiBpbXBv
cnRlciBhbmQgZXhwb3J0ZXIgc3RheXMgZXhhY3RseSB0aGUgDQo+Pj4+Pj4+IHNhbWUgaXQNCj4+
Pj4+Pj4gaXMgY3VycmVudGx5IGFzIGxvbmcgYXMgeW91IGRvbid0IHN3aXRjaCB0byBkeW5hbWlj
IGRtYS1idWYgDQo+Pj4+Pj4+IGhhbmRsaW5nLg0KPj4+Pj4+Pg0KPj4+Pj4+PiBUaGVyZSBpcyBu
byBmdW5jdGlvbmFsIGNoYW5nZSBmb3IgdGhlIEFSTSBmb2xrcyBoZXJlLiBUaGUgb25seSANCj4+
Pj4+Pj4gY2hhbmdlDQo+Pj4+Pj4+IHdoaWNoIHRha2VzIGVmZmVjdCBpcyBiZXR3ZWVuIGk5MTUg
YW5kIGFtZGdwdSBhbmQgdGhhdCBpcyBwZXJmZWN0bHkNCj4+Pj4+Pj4gY292ZXJlZCBieSBpbnRl
bC1nZngtY2kuDQo+Pj4+Pj4gVGhlcmUncyBwZW9wbGUgd2hvIHdhbnQgdG8gcnVuIGFtZGdwdSBv
biBBUk0/DQo+Pj4+PiBTdXJlIHRoZXJlIGFyZSwgd2UgZXZlbiByZWNlbnRseSBmaXhlZCBzb21l
IGJ1Z3MgZm9yIHRoaXMuDQo+Pj4+Pg0KPj4+Pj4gQnV0IGFzIGZhciBhcyBJIGtub3cgdGhlcmUg
aXMgbm8gb25lIGN1cnJlbnRseSB3aGljaCBpcyBhZmZlY3QgYnkgDQo+Pj4+PiB0aGlzDQo+Pj4+
PiBjaGFuZ2Ugb24gQVJNIHdpdGggYW1kZ3B1Lg0KPj4+PiBCdXQgZG9uJ3QgeW91IGJyZWFrIHRo
ZW0gd2l0aCB0aGlzIG5vdz8NCj4+PiBObywgd2Ugc2VlIHRoZSBiaWRpcmVjdGlvbmFsIGF0dGFj
aG1lbnQgYXMgY29tcGF0aWJsZSB3aXRoIHRoZSBvdGhlciANCj4+PiBvbmVzLg0KPj4+DQo+Pj4+
IGFtZGdwdSB3aWxsIHNvb24gc2V0IHRoZSBkeW5hbWljIGZsYWcgb24gZXhwb3J0cywgd2hpY2gg
Zm9yY2VzIHRoZSANCj4+Pj4gY2FjaGluZw0KPj4+PiBhdCBjcmVhdGUgdGltZSAodG8gYXZvaWQg
dGhlIGxvY2tpbmcgZnVuKSwgd2hpY2ggd2lsbCB0aGVuIHJlc3VsdCBpbiBhDQo+Pj4+IEVCVVNZ
IGF0IG1hcF9hdHRhY2htZW50IHRpbWUgYmVjYXVzZSB3ZSBoYXZlIGEgY2FjaGVkIG1hcHBpbmcs
IGJ1dCANCj4+Pj4gaXQncw0KPj4+PiB0aGUgd3JvbmcgdHlwZS4NCj4+PiBTZWUgdGhlIGNoZWNr
IGluIGRtYV9idWZfbWFwX2F0dGFjaG1lbnQoKToNCj4+Pg0KPj4+IMKgwqDCoMKgwqAgaWYgKGF0
dGFjaC0+ZGlyICE9IGRpcmVjdGlvbiAmJiBhdHRhY2gtPmRpciAhPSBETUFfQklESVJFQ1RJT05B
TCkNCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIEVSUl9QVFIoLUVCVVNZKTsNCj4+IEht
LCBJIG1pc3JlYWQgdGhpcy4gU28geWVhaCBzaG91bGQgd29yaywgKy8tIHRoZSBpc3N1ZSB0aGF0
IHdlIG1pZ2h0DQo+PiBub3QgZmx1c2ggZW5vdWdoLiBCdXQgSSBndWVzcyB0aGF0IGNhbiBiZSBm
aXhlZCB3aGVuZXZlciwgaXQncyBub3QNCj4+IGxpa2UgZG1hLWFwaSBzZW1hbnRpY3MgYXJlIGEg
Z3JlYXQgZml0IGZvciB1cy4gTWF5YmUgYSBmaXhtZSBjb21tZW50DQo+PiB3b3VsZCBiZSB1c2Vm
dWwgaGVyZSAuLi4gSSdsbCBsb29rIGF0IHRoaXMgdG9tb3Jyb3cgb3Igc28gYmVjYXVzZSBhdG0N
Cj4+IGJyYWluIGlzIHNsb3csIEknbSBkb3duIHdpdGggdGhlIHVzdWFsIHBvc3QtY29uZmVyZW5j
ZSBjb2xkIGl0IHNlZW1zDQo+PiA6LS8NCj4NCj4gSG9wZSB5b3VyIGFyZSBmZWVsaW5nIGJldHRl
ciBub3csIGFkZGluZyBhIGNvbW1lbnQgaXMgb2YgY291cnNlIG5vdCBhIA0KPiBwcm9ibGVtLg0K
Pg0KPiBXaXRoIHRoYXQgZml4ZWQgY2FuIEkgZ2V0IGFuIHJldmlld2VkLWJ5IG9yIGF0IGxlYXN0
IGFuZCBhY2tlZC1ieT8NCj4NCj4gSSB3YW50IHRvIGxhbmQgYXQgbGVhc3Qgc29tZSBwYXJ0cyBv
ZiB0aG9zZSBjaGFuZ2VzIG5vdy4NCj4NCj4gUmVnYXJkcywNCj4gQ2hyaXN0aWFuLg0KPg0KPj4g
LURhbmllbA0KPj4NCj4NCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
