Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56895BDF95
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 15:59:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E83D56EBC4;
	Wed, 25 Sep 2019 13:59:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770081.outbound.protection.outlook.com [40.107.77.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F95B6EBBB;
 Wed, 25 Sep 2019 13:59:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kuq2vF6gBec76Taon34JYVAlJ8hR8ZBqnWkH8BTz5nANgLMqLf2CsiQGKcV6AlgRD+hNzheGGEtpL39QrXQ6MYEL4SOzOY7d5iIajHEfnndvpMElh7juMlvnCQbR0N2DY/1NMF4+f+XK4Ao1k7EkJMd87001eINj0K0exrtRInP/Q1x2xvm32ZOKvAtrT1z3aouiqRybNz7DcZW9h41om0Y9HPxTSUYezeV1d/KjvYwy4UtvA+yE46AWt2clrExZwQC1Dvlh1gbVRK+hwPd2MBAOCRgjsO9CUbC8baCtazENn5Hhykfqc7BxIPwCdycmH573Y7yx/D1bSnQkxoNtUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=51Uvd4TdZLKr1FYkWm3vMScI/H1fPkaa8dkISoYwpkw=;
 b=b54lwQy0mQKCkOfsbWE89ga3WGSjiHBe16Y6zsqd6RkBg2NiRUh9InOYWlTr3gvpXYFYwztDYgL9QwipQywX/EyL0Binz8d+3b+ck7lDS9Bg64OTwmlJ6W/ywuzbiPn0PQBWHipBOzGT4ClqdgOFmfsuxJbmi0g9u8n0MkxrGQ6c6MowGwa3NO1fEJJ2IKB48ERv9GKHmUTQLzXjWUdkxtqtteUuqFO20hlrpmLWoxiBSFAMbPO1OV3PNKfwwgW/9YnEYcY6g9BwmVPK1epOdo5BM7PMsrUxXkFsbAhAZ2Qf8yImik/q0/xO1K1lwl8B/ltGWmJcIFkfRHQipeoBew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1803.namprd12.prod.outlook.com (10.175.88.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.26; Wed, 25 Sep 2019 13:59:14 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::9d43:b3d4:9ef:29fc]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::9d43:b3d4:9ef:29fc%8]) with mapi id 15.20.2284.023; Wed, 25 Sep 2019
 13:59:14 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Huang, Ray" <Ray.Huang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>
Subject: Re: [PATCH v2 11/11] drm/amdgpu: set TMZ bits in PTEs for secure BO
 (v4)
Thread-Topic: [PATCH v2 11/11] drm/amdgpu: set TMZ bits in PTEs for secure BO
 (v4)
Thread-Index: AQHVc6eInhzv98xv6k2WnBfCzCjcIKc8a30A
Date: Wed, 25 Sep 2019 13:59:14 +0000
Message-ID: <507b6359-897a-20a1-2fff-28634858f464@amd.com>
References: <1569419090-5304-1-git-send-email-ray.huang@amd.com>
 <1569419090-5304-12-git-send-email-ray.huang@amd.com>
In-Reply-To: <1569419090-5304-12-git-send-email-ray.huang@amd.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM4PR0902CA0004.eurprd09.prod.outlook.com
 (2603:10a6:200:9b::14) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e3a19102-be6a-40e3-221a-08d741c08c75
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM5PR12MB1803; 
x-ms-traffictypediagnostic: DM5PR12MB1803:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB18031932E13CB417FA0C4CCB83870@DM5PR12MB1803.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01713B2841
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(366004)(39860400002)(396003)(376002)(136003)(189003)(199004)(6436002)(71190400001)(478600001)(6246003)(110136005)(86362001)(446003)(6116002)(25786009)(229853002)(2906002)(31696002)(305945005)(450100002)(81156014)(81166006)(2201001)(2501003)(7736002)(8936002)(8676002)(36756003)(46003)(66556008)(66476007)(6506007)(102836004)(476003)(66446008)(6636002)(2616005)(186003)(14454004)(66574012)(5660300002)(316002)(31686004)(76176011)(6512007)(54906003)(64756008)(486006)(66946007)(65806001)(11346002)(71200400001)(99286004)(256004)(52116002)(65956001)(58126008)(4326008)(386003)(6486002)(14444005)(21314003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1803;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: IbFuYlvf+62YJxLhsny/5xxkGG7JETbDn4vbiF4jwC3qeKQ/uL580k2dy3jC8kCvDz0Y0hVM2C1goMcBgdzDdrQ3JT7o+QRdp7MNwciEOzNzIYqYvjFbIwxKnwGgHmFePG7YICNULk/FBGlJtLaOkmIgEuR0fE31+4m/Rb3pSSf5TpCNzqu15ExppzU+83/Mx2qyedjcSeUvuSW9/uE3YWWRFCSKqK3obmp8fO+hy8w7kyHdPPnqyZyjVvmPGRdosoehrE8+xdNjfltaHX2Jq19vNeebA746SqhaeCCwww8j/EH9BEhCJqMB1lX02uckDH05XfpLtJ6WWxxAyWflxvfoRWTM/rGRmmWQmjBCLEi8o6RUGwptFVG7E/qgar0wePuNFxaQCAMtu4vyFsRxyLSjHViOKZKLi58RvBXzBIk=
Content-ID: <921E3C8CC00C744AA7D5B37D73B357BE@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3a19102-be6a-40e3-221a-08d741c08c75
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2019 13:59:14.4166 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mfwPV4n9GF/owzre3t6c/SCdGikbzhRfOjTUYm477CMRXrkxuD+nyb0leVftELXq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1803
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=51Uvd4TdZLKr1FYkWm3vMScI/H1fPkaa8dkISoYwpkw=;
 b=M4QjVtXCU4u9dbhnDBx7hMsHfGFZmuvgCiIThW2tR9ipspDurq6pDgujAUNipmqV2Gjmlw5oqrpPiyTtFSV+mSlscKbivghhM6jvgiA+I4B/Nvpy8xuzYeVy/ijr/DWfbMwzjJOPMw5prUDllunotdxYHGr5g9zE9N7xTUo4xrQ=
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
Cc: "Tuikov, Luben" <Luben.Tuikov@amd.com>, "Liu, Aaron" <Aaron.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjUuMDkuMTkgdW0gMTU6NDUgc2NocmllYiBIdWFuZywgUmF5Og0KPiBGcm9tOiBBbGV4IERl
dWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+DQo+DQo+IElmIGEgYnVmZmVyIG9iamVj
dCBpcyBzZWN1cmUsIGkuZS4gY3JlYXRlZCB3aXRoDQo+IEFNREdQVV9HRU1fQ1JFQVRFX0VOQ1JZ
UFRFRCwgdGhlbiB0aGUgVE1aIGJpdCBvZg0KPiB0aGUgUFRFcyB0aGF0IGJlbG9uZyB0aGUgYnVm
ZmVyIG9iamVjdCBzaG91bGQgYmUNCj4gc2V0Lg0KPg0KPiB2MTogZGVzaWduIGFuZCBkcmFmdCB0
aGUgc2tlbGV0aW9uIG9mIFRNWiBiaXRzIHNldHRpbmcgb24gUFRFcyAoQWxleCkNCj4gdjI6IHJl
dHVybiBmYWlsdXJlIG9uY2UgY3JlYXRlIHNlY3VyZSBCTyBvbiBub24tVE1aIHBsYXRmb3JtICAo
UmF5KQ0KPiB2MzogYW1kZ3B1X2JvX2VuY3J5cHRlZCgpIG9ubHkgY2hlY2tzIHRoZSBCTyAoTHVi
ZW4pDQo+IHY0OiBtb3ZlIFRNWiBmbGFnIHNldHRpbmcgaW50byBhbWRncHVfdm1fYm9fdXBkYXRl
ICAoQ2hyaXN0aWFuKQ0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRl
ci5kZXVjaGVyQGFtZC5jb20+DQo+IFJldmlld2VkLWJ5OiBIdWFuZyBSdWkgPHJheS5odWFuZ0Bh
bWQuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBIdWFuZyBSdWkgPHJheS5odWFuZ0BhbWQuY29tPg0K
PiBTaWduZWQtb2ZmLWJ5OiBMdWJlbiBUdWlrb3YgPGx1YmVuLnR1aWtvdkBhbWQuY29tPg0KPiBS
ZXZpZXdlZC1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPg0KPiAt
LS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2VtLmMgICAgfCAxMiAr
KysrKysrKysrKy0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0
LmggfCAxMSArKysrKysrKysrKw0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV92bS5jICAgICB8ICA1ICsrKysrDQo+ICAgMyBmaWxlcyBjaGFuZ2VkLCAyNyBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfZ2VtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
Z2VtLmMNCj4gaW5kZXggMjJlYWI3NC4uNTMzMjEwNCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dlbS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9nZW0uYw0KPiBAQCAtMjIyLDcgKzIyMiw4IEBAIGludCBhbWRncHVf
Z2VtX2NyZWF0ZV9pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRhLA0KPiAg
IAkJICAgICAgQU1ER1BVX0dFTV9DUkVBVEVfQ1BVX0dUVF9VU1dDIHwNCj4gICAJCSAgICAgIEFN
REdQVV9HRU1fQ1JFQVRFX1ZSQU1fQ0xFQVJFRCB8DQo+ICAgCQkgICAgICBBTURHUFVfR0VNX0NS
RUFURV9WTV9BTFdBWVNfVkFMSUQgfA0KPiAtCQkgICAgICBBTURHUFVfR0VNX0NSRUFURV9FWFBM
SUNJVF9TWU5DKSkNCj4gKwkJICAgICAgQU1ER1BVX0dFTV9DUkVBVEVfRVhQTElDSVRfU1lOQyB8
DQo+ICsJCSAgICAgIEFNREdQVV9HRU1fQ1JFQVRFX0VOQ1JZUFRFRCkpDQo+ICAgDQo+ICAgCQly
ZXR1cm4gLUVJTlZBTDsNCj4gICANCj4gQEAgLTIzMCw2ICsyMzEsMTEgQEAgaW50IGFtZGdwdV9n
ZW1fY3JlYXRlX2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsDQo+ICAg
CWlmIChhcmdzLT5pbi5kb21haW5zICYgfkFNREdQVV9HRU1fRE9NQUlOX01BU0spDQo+ICAgCQly
ZXR1cm4gLUVJTlZBTDsNCj4gICANCj4gKwlpZiAoIWFkZXYtPnRtei5lbmFibGVkICYmIChmbGFn
cyAmIEFNREdQVV9HRU1fQ1JFQVRFX0VOQ1JZUFRFRCkpIHsNCj4gKwkJRFJNX0VSUk9SKCJDYW5u
b3QgYWxsb2NhdGUgc2VjdXJlIGJ1ZmZlciB3aGlsZSB0bXogaXMgZGlzYWJsZWRcbiIpOw0KPiAr
CQlyZXR1cm4gLUVJTlZBTDsNCj4gKwl9DQo+ICsNCj4gICAJLyogY3JlYXRlIGEgZ2VtIG9iamVj
dCB0byBjb250YWluIHRoaXMgb2JqZWN0IGluICovDQo+ICAgCWlmIChhcmdzLT5pbi5kb21haW5z
ICYgKEFNREdQVV9HRU1fRE9NQUlOX0dEUyB8DQo+ICAgCSAgICBBTURHUFVfR0VNX0RPTUFJTl9H
V1MgfCBBTURHUFVfR0VNX0RPTUFJTl9PQSkpIHsNCj4gQEAgLTI1MSw2ICsyNTcsMTAgQEAgaW50
IGFtZGdwdV9nZW1fY3JlYXRlX2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRh
dGEsDQo+ICAgCQlyZXN2ID0gdm0tPnJvb3QuYmFzZS5iby0+dGJvLnJlc3Y7DQo+ICAgCX0NCj4g
ICANCj4gKwlpZiAoZmxhZ3MgJiBBTURHUFVfR0VNX0NSRUFURV9FTkNSWVBURUQpIHsNCj4gKwkJ
LyogWFhYOiBwYWQgb3V0IGFsaWdubWVudCB0byBtZWV0IFRNWiByZXF1aXJlbWVudHMgKi8NCj4g
Kwl9DQo+ICsNCj4gICAJciA9IGFtZGdwdV9nZW1fb2JqZWN0X2NyZWF0ZShhZGV2LCBzaXplLCBh
cmdzLT5pbi5hbGlnbm1lbnQsDQo+ICAgCQkJCSAgICAgKHUzMikoMHhmZmZmZmZmZiAmIGFyZ3Mt
PmluLmRvbWFpbnMpLA0KPiAgIAkJCQkgICAgIGZsYWdzLCB0dG1fYm9fdHlwZV9kZXZpY2UsIHJl
c3YsICZnb2JqKTsNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9vYmplY3QuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3Qu
aA0KPiBpbmRleCA1YTNjMTc3Li43NWM3MzkyIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X29iamVjdC5oDQo+IEBAIC0yMjQsNiArMjI0LDE3IEBAIHN0YXRpYyBp
bmxpbmUgYm9vbCBhbWRncHVfYm9fZXhwbGljaXRfc3luYyhzdHJ1Y3QgYW1kZ3B1X2JvICpibykN
Cj4gICAJcmV0dXJuIGJvLT5mbGFncyAmIEFNREdQVV9HRU1fQ1JFQVRFX0VYUExJQ0lUX1NZTkM7
DQo+ICAgfQ0KPiAgIA0KPiArLyoqDQo+ICsgKiBhbWRncHVfYm9fZW5jcnlwdGVkIC0gdGVzdCBp
ZiB0aGUgQk8gaXMgZW5jcnlwdGVkDQo+ICsgKiBAYm86IHBvaW50ZXIgdG8gYSBidWZmZXIgb2Jq
ZWN0DQo+ICsgKg0KPiArICogUmV0dXJuIHRydWUgaWYgdGhlIGJ1ZmZlciBvYmplY3QgaXMgZW5j
cnlwdGVkLCBmYWxzZSBvdGhlcndpc2UuDQo+ICsgKi8NCj4gK3N0YXRpYyBpbmxpbmUgYm9vbCBh
bWRncHVfYm9fZW5jcnlwdGVkKHN0cnVjdCBhbWRncHVfYm8gKmJvKQ0KPiArew0KPiArCXJldHVy
biBiby0+ZmxhZ3MgJiBBTURHUFVfR0VNX0NSRUFURV9FTkNSWVBURUQ7DQo+ICt9DQo+ICsNCj4g
ICBib29sIGFtZGdwdV9ib19pc19hbWRncHVfYm8oc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpi
byk7DQo+ICAgdm9pZCBhbWRncHVfYm9fcGxhY2VtZW50X2Zyb21fZG9tYWluKHN0cnVjdCBhbWRn
cHVfYm8gKmFibywgdTMyIGRvbWFpbik7DQo+ICAgDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV92bS5jDQo+IGluZGV4IGIyODVhYjIuLjhlMTNiMWZkMyAxMDA2NDQNCj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMNCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMNCj4gQEAgLTE2ODgsNiArMTY4OCwxMSBAQCBp
bnQgYW1kZ3B1X3ZtX2JvX3VwZGF0ZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwNCj4gICAN
Cj4gICAJaWYgKGJvKSB7DQo+ICAgCQlmbGFncyA9IGFtZGdwdV90dG1fdHRfcHRlX2ZsYWdzKGFk
ZXYsIGJvLT50Ym8udHRtLCBtZW0pOw0KPiArDQo+ICsJCWlmIChhbWRncHVfYm9fZW5jcnlwdGVk
KGJvKSkgew0KPiArCQkJZmxhZ3MgfD0gQU1ER1BVX1BURV9UTVo7DQo+ICsJCX0NCj4gKw0KDQpZ
b3UgY2FuIGRyb3AgdGhlIHt9IGhlcmUsIGFwYXJ0IGZyb20gdGhhdCB0aGUgcGF0Y2ggaXMgUmV2
aWV3ZWQtYnk6IA0KQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPi4N
Cg0KIEZyb20gdGhlIGRlc2lnbiBpdCB3b3VsZCBiZSBpbmRlZWQgbmljZXIgdG8gaGF2ZSB0aGF0
IGluIA0KYW1kZ3B1X3R0bV90dF9wdGVfZmxhZ3MoKSwgYnV0IHdlIHdvdWxkIG5lZWQgdG8gbWFr
ZSBzdXJlIHRoYXQgdGhpcyBpcyANCm5vdCBjYWxsZWQgYW55IG1vcmUgZnJvbSBiaW5kaW5nIGEg
dHQuDQoNClJlZ2FyZHMsDQpDaHJpc3RpYW4uDQoNCj4gICAJCWJvX2FkZXYgPSBhbWRncHVfdHRt
X2FkZXYoYm8tPnRiby5iZGV2KTsNCj4gICAJfSBlbHNlIHsNCj4gICAJCWZsYWdzID0gMHgwOw0K
DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
