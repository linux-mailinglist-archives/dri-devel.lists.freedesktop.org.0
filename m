Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A85CFB0CDD
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 12:27:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 899B96ECB5;
	Thu, 12 Sep 2019 10:27:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam04on0607.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe4d::607])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED2116ECB4;
 Thu, 12 Sep 2019 10:27:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KwXkYh7PHa9JT8wcYaA7mk7quco3oQdLNHrTFZ2IpA9PR1Qgc2eA8NcTIldf320BKTzfyWlygzkha3IxrhZkbStnUG7eoI04EnMqWIZbufLwvtHWc3Q5662g14Gv9l6UhgPJof1J8BGQlHSu3NZ/uRr9/xI+OsYrAn4n2jEyAbt0c4hzOmwAU1MSmlSSSoFnKDoYEf7g11TDSFkR4c12d28N+RORZCFKRclyfD6lYSdz22TuOMnjZsdFmiZoaJ8noA8lbTaBnoFwezzqPyHssBt6gMqNxxj5iFxhQrfMF3MxZwXYZyCMyTEczf2VWmlprZQd2MbWtZTjp3pxJhBM8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yPItzebs9LL4MneJNHH8n9OFBwLC7owyhZ8wnsuwlvI=;
 b=HQl+uRp1+SqSvCUx/L7+GgMnXJb7JWMBwDmvXqJBc8k8YGyh+1Q/fZ0QVb0hespZvNnElWXgZ98JDo+enNbYcLfOtpB4X9geCG4xo8igtufNMZW5s0efsA3qF7RT5DNnWopGfCpoo/Q7PnAyJU2O9scFIkS7yPTexJm1eGpaUOPpcmY44aiqeapUEgBtFCe/Cm62bZBdfh2LUYAFtkt5QoLCzzZqeG4IQud+msEDBNknjN1v3hQe1mGftSh0mn8QiJ9g8csbGXkCR/bIqZgHn56n8ku9Ahjcr/oDizlh3EZU0HwqVHxSmv1GF9cBG5g90ubXiflL+35bKbMTaX+GOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (20.179.83.157) by
 MN2PR12MB2989.namprd12.prod.outlook.com (20.178.241.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.15; Thu, 12 Sep 2019 10:27:17 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::e105:cd24:c71d:c38d]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::e105:cd24:c71d:c38d%4]) with mapi id 15.20.2263.016; Thu, 12 Sep 2019
 10:27:17 +0000
From: "Huang, Ray" <Ray.Huang@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>
Subject: Re: [PATCH 14/14] drm/amdgpu: set TMZ bits in PTEs for secure bo (v2)
Thread-Topic: [PATCH 14/14] drm/amdgpu: set TMZ bits in PTEs for secure bo (v2)
Thread-Index: AQHVaJcopKpC1OzuDEifbwgZtSrWx6cmY2qAgAH6I4A=
Date: Thu, 12 Sep 2019 10:27:16 +0000
Message-ID: <MN2PR12MB3309544896408F62494EC8B3ECB00@MN2PR12MB3309.namprd12.prod.outlook.com>
References: <1568202584-14471-1-git-send-email-ray.huang@amd.com>
 <1568202584-14471-15-git-send-email-ray.huang@amd.com>
 <5704cdc8-754e-538e-9547-738ef81efa7c@amd.com>
In-Reply-To: <5704cdc8-754e-538e-9547-738ef81efa7c@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-imapappendstamp: MN2PR12MB3309.namprd12.prod.outlook.com
 (15.20.2263.000)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: efa86cac-9cb6-433a-2efa-08d7376bc915
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB2989; 
x-ms-traffictypediagnostic: MN2PR12MB2989:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB2989323DF61713B9FD264BF4ECB00@MN2PR12MB2989.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01583E185C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39850400004)(376002)(346002)(136003)(396003)(366004)(189003)(199004)(3846002)(476003)(66556008)(450100002)(71200400001)(4326008)(76116006)(486006)(7736002)(305945005)(74316002)(71190400001)(446003)(33656002)(7696005)(14454004)(2906002)(52536014)(102836004)(478600001)(25786009)(99286004)(5660300002)(26005)(6116002)(66946007)(256004)(186003)(14444005)(6506007)(11346002)(64756008)(66446008)(76176011)(8676002)(8936002)(316002)(6636002)(86362001)(53936002)(81156014)(6246003)(66066001)(81166006)(55016002)(6862004)(229853002)(6436002)(9686003)(54906003)(66476007)(21314003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2989;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: nNDwYIu2aUfbBwiy9q25PxMt47dofhSNn+SaxeTWiz46/R5LjeCtXN2U/DTOPVh3qshNvj/BbnRcqMyfXFXYfr3i41JfrvnGQ27jRRP7p7mKbNQ//A3l+ka8HGrIIKl11OsYh9iLBZUdN9OX3q5bhTJ6aVlVxjO96lMjW/Kbgg1kywePTwmdPPTHbEEFvU/mOO2xeJHX35Atn8OfnqgHeCYnqIqFBf5IDgrQOV6TecFydpROnjv7vmLzYxXLBcJ3MsRdVxQpxxMD7h3v/EDytz+Mbz1OxtY68cCTcdeI3WvtpkhftoqlRX0SB/YvzRlVMfxJrkO+3wL9HzrZnh2LOTJjxkC7xdYO91kJASJLrSqTjiWC91n57oyZXV1dx9KyvPCzpL216232ctwMyjmbE9IArlv3enasAroOCHAEToU=
Content-ID: <8632ECF67B51D34C80EB8684B8D6400B@amdcloud.onmicrosoft.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efa86cac-9cb6-433a-2efa-08d7376bc915
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2019 10:27:16.9412 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x7/MRDYUcIYTfHbTTt+4W8TbzSLBeoq5ao+6S8G6UerdEuE8OUN/gqtLHoi/GW4BIWJt65cx1I3xfAXxdekwOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2989
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yPItzebs9LL4MneJNHH8n9OFBwLC7owyhZ8wnsuwlvI=;
 b=w3h8Pbci5y9ZFVWNIADgusRmBfuGw52rc91614I7cymYyrF8U6yvag7hU0ReChIHuGMGAPPiSCFnhHHtbJgQt0dqvqBv4bN8mDy4MH+bSHcmWfbxT4hPs3siRVIOJOHx0a85MK+8ckQ8AVrtffq5caXV/VQDl0QACKYyRpma0TI=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ray.Huang@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Tuikov,
 Luben" <Luben.Tuikov@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Liu,
 Aaron" <Aaron.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBTZXAgMTEsIDIwMTkgYXQgMDg6MTM6MTlQTSArMDgwMCwgS29lbmlnLCBDaHJpc3Rp
YW4gd3JvdGU6Cj4gQW0gMTEuMDkuMTkgdW0gMTM6NTAgc2NocmllYiBIdWFuZywgUmF5Ogo+ID4g
RnJvbTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgo+ID4KPiA+IElm
IG9uZSBibyBpcyBzZWN1cmUgKGNyZWF0ZWQgd2l0aCBBTURHUFVfR0VNX0NSRUFURV9FTkNSWVBU
RUQpLCB0aGUgVE1aIGJpdHMgb2YKPiA+IFBURXMgdGhhdCBiZWxvbmdzIHRoYXQgYm8gc2hvdWxk
IGJlIHNldC4gVGhlbiBwc3AgaXMgYWJsZSB0byBwcm90ZWN0IHRoZSBwYWdlcwo+ID4gb2YgdGhp
cyBibyB0byBhdm9pZCB0aGUgYWNjZXNzIGZyb20gYW4gInVudHJ1c3QiIGRvbWFpbiBzdWNoIGFz
IENQVS4KPiA+Cj4gPiB2MTogZGVzaWduIGFuZCBkcmFmdCB0aGUgc2tlbGV0aW9uIG9mIHRteiBi
aXRzIHNldHRpbmcgb24gUFRFcyAoQWxleCkKPiA+IHYyOiByZXR1cm4gZmFpbHVyZSBvbmNlIGNy
ZWF0ZSBzZWN1cmUgYm8gb24gbm8tdG16IHBsYXRmb3JtICAoUmF5KQo+ID4KPiA+IFNpZ25lZC1v
ZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KPiA+IFJldmll
d2VkLWJ5OiBIdWFuZyBSdWkgPHJheS5odWFuZ0BhbWQuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTog
SHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4KPiA+IC0tLQo+ID4gICBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfZ2VtLmMgICAgfCAxMiArKysrKysrKysrKy0KPiA+ICAgZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5oIHwgMTAgKysrKysrKysrKwo+
ID4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMgICAgfCAgNSArKysr
Kwo+ID4gICAzIGZpbGVzIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkK
PiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dl
bS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dlbS5jCj4gPiBpbmRleCAy
MmVhYjc0Li41MzMyMTA0IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2dlbS5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfZ2VtLmMKPiA+IEBAIC0yMjIsNyArMjIyLDggQEAgaW50IGFtZGdwdV9nZW1fY3JlYXRlX2lv
Y3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsCj4gPiAgIAkJICAgICAgQU1E
R1BVX0dFTV9DUkVBVEVfQ1BVX0dUVF9VU1dDIHwKPiA+ICAgCQkgICAgICBBTURHUFVfR0VNX0NS
RUFURV9WUkFNX0NMRUFSRUQgfAo+ID4gICAJCSAgICAgIEFNREdQVV9HRU1fQ1JFQVRFX1ZNX0FM
V0FZU19WQUxJRCB8Cj4gPiAtCQkgICAgICBBTURHUFVfR0VNX0NSRUFURV9FWFBMSUNJVF9TWU5D
KSkKPiA+ICsJCSAgICAgIEFNREdQVV9HRU1fQ1JFQVRFX0VYUExJQ0lUX1NZTkMgfAo+ID4gKwkJ
ICAgICAgQU1ER1BVX0dFTV9DUkVBVEVfRU5DUllQVEVEKSkKPiA+ICAgCj4gPiAgIAkJcmV0dXJu
IC1FSU5WQUw7Cj4gPiAgIAo+ID4gQEAgLTIzMCw2ICsyMzEsMTEgQEAgaW50IGFtZGdwdV9nZW1f
Y3JlYXRlX2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsCj4gPiAgIAlp
ZiAoYXJncy0+aW4uZG9tYWlucyAmIH5BTURHUFVfR0VNX0RPTUFJTl9NQVNLKQo+ID4gICAJCXJl
dHVybiAtRUlOVkFMOwo+ID4gICAKPiA+ICsJaWYgKCFhZGV2LT50bXouZW5hYmxlZCAmJiAoZmxh
Z3MgJiBBTURHUFVfR0VNX0NSRUFURV9FTkNSWVBURUQpKSB7Cj4gPiArCQlEUk1fRVJST1IoIkNh
bm5vdCBhbGxvY2F0ZSBzZWN1cmUgYnVmZmVyIHdoaWxlIHRteiBpcyBkaXNhYmxlZFxuIik7Cj4g
PiArCQlyZXR1cm4gLUVJTlZBTDsKPiA+ICsJfQo+ID4gKwo+ID4gICAJLyogY3JlYXRlIGEgZ2Vt
IG9iamVjdCB0byBjb250YWluIHRoaXMgb2JqZWN0IGluICovCj4gPiAgIAlpZiAoYXJncy0+aW4u
ZG9tYWlucyAmIChBTURHUFVfR0VNX0RPTUFJTl9HRFMgfAo+ID4gICAJICAgIEFNREdQVV9HRU1f
RE9NQUlOX0dXUyB8IEFNREdQVV9HRU1fRE9NQUlOX09BKSkgewo+ID4gQEAgLTI1MSw2ICsyNTcs
MTAgQEAgaW50IGFtZGdwdV9nZW1fY3JlYXRlX2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYs
IHZvaWQgKmRhdGEsCj4gPiAgIAkJcmVzdiA9IHZtLT5yb290LmJhc2UuYm8tPnRiby5yZXN2Owo+
ID4gICAJfQo+ID4gICAKPiA+ICsJaWYgKGZsYWdzICYgQU1ER1BVX0dFTV9DUkVBVEVfRU5DUllQ
VEVEKSB7Cj4gPiArCQkvKiBYWFg6IHBhZCBvdXQgYWxpZ25tZW50IHRvIG1lZXQgVE1aIHJlcXVp
cmVtZW50cyAqLwo+ID4gKwl9Cj4gPiArCj4gPiAgIAlyID0gYW1kZ3B1X2dlbV9vYmplY3RfY3Jl
YXRlKGFkZXYsIHNpemUsIGFyZ3MtPmluLmFsaWdubWVudCwKPiA+ICAgCQkJCSAgICAgKHUzMiko
MHhmZmZmZmZmZiAmIGFyZ3MtPmluLmRvbWFpbnMpLAo+ID4gICAJCQkJICAgICBmbGFncywgdHRt
X2JvX3R5cGVfZGV2aWNlLCByZXN2LCAmZ29iaik7Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X29iamVjdC5oCj4gPiBpbmRleCA1YTNjMTc3Li4yODZlMmUyIDEwMDY0NAo+
ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5oCj4gPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmgKPiA+IEBAIC0y
MjQsNiArMjI0LDE2IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBhbWRncHVfYm9fZXhwbGljaXRfc3lu
YyhzdHJ1Y3QgYW1kZ3B1X2JvICpibykKPiA+ICAgCXJldHVybiBiby0+ZmxhZ3MgJiBBTURHUFVf
R0VNX0NSRUFURV9FWFBMSUNJVF9TWU5DOwo+ID4gICB9Cj4gPiAgIAo+ID4gKy8qKgo+ID4gKyAq
IGFtZGdwdV9ib19lbmNyeXB0ZWQgLSByZXR1cm4gd2hldGhlciB0aGUgYm8gaXMgZW5jcnlwdGVk
Cj4gPiArICovCj4gPiArc3RhdGljIGlubGluZSBib29sIGFtZGdwdV9ib19lbmNyeXB0ZWQoc3Ry
dWN0IGFtZGdwdV9ibyAqYm8pCj4gPiArewo+ID4gKwlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRl
diA9IGFtZGdwdV90dG1fYWRldihiby0+dGJvLmJkZXYpOwo+ID4gKwo+ID4gKwlyZXR1cm4gYWRl
di0+dG16LmVuYWJsZWQgJiYgKGJvLT5mbGFncyAmIEFNREdQVV9HRU1fQ1JFQVRFX0VOQ1JZUFRF
RCk7Cj4gCj4gQ2hlY2tpbmcgdGhlIGFkZXYtPnRtei5lbmFibGVkIGZsYWdzIHNob3VsZCBiZSBk
cm9wcGVkIGhlcmUuCj4gCgpUaGF0J3MgZmluZS4gQk8gc2hvdWxkIGJlIHZhbGlkYXRlZCB3aGls
ZSBpdCBpcyBjcmVhdGVkLgoKQnV0IGlmIHRoZSBCTyBpcyBjcmVhdGVkIGJ5IHZtaWQgMCwgaXMg
dGhpcyBjaGVja2luZyBuZWVkZWQ/Cgo+ID4gK30KPiA+ICsKPiA+ICAgYm9vbCBhbWRncHVfYm9f
aXNfYW1kZ3B1X2JvKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8pOwo+ID4gICB2b2lkIGFt
ZGdwdV9ib19wbGFjZW1lbnRfZnJvbV9kb21haW4oc3RydWN0IGFtZGdwdV9ibyAqYWJvLCB1MzIg
ZG9tYWluKTsKPiA+ICAgCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3R0bS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5j
Cj4gPiBpbmRleCAzNjYzNjU1Li44ZjAwYmIyIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfdHRtLmMKPiA+IEBAIC0xNDM0LDYgKzE0MzQsOCBAQCBib29sIGFtZGdw
dV90dG1fdHRfaXNfcmVhZG9ubHkoc3RydWN0IHR0bV90dCAqdHRtKQo+ID4gICB1aW50NjRfdCBh
bWRncHVfdHRtX3R0X3BkZV9mbGFncyhzdHJ1Y3QgdHRtX3R0ICp0dG0sIHN0cnVjdCB0dG1fbWVt
X3JlZyAqbWVtKQo+ID4gICB7Cj4gPiAgIAl1aW50NjRfdCBmbGFncyA9IDA7Cj4gPiArCXN0cnVj
dCB0dG1fYnVmZmVyX29iamVjdCAqdGJvID0gdHRtX21lbV9yZWdfdG9fYm8obWVtKTsKPiA+ICsJ
c3RydWN0IGFtZGdwdV9ibyAqYWJvID0gdHRtX3RvX2FtZGdwdV9ibyh0Ym8pOwo+IAo+IFRoYXQn
cyBhIGNsZWFyIE5BSy4gVGhlIGZ1bmN0aW9uIGlzIG5vdCBuZWNlc3NhcmlseSBjYWxsZWQgd2l0
aCAKPiAmYm8tPm1lbSwgd2hpY2ggaXMgYWxzbyB0aGUgcmVhc29uIHdoeSB0aGlzIGZ1bmN0aW9u
IGRvZXNuJ3QgZ2V0cyB0aGUgQk8gCj4gYXMgcGFyYW1ldGVyLgo+IAoKRG8geW91IG1lYW4gd2Ug
Y2FuIHJldmlzZSB0aGUgYmVsb3cgZnVuY3Rpb25zIHRvIHVzZSBibyBhcyB0aGUgcGFyYW1ldGVy
Cmluc3RlYWQ/IAoKdWludDY0X3QgYW1kZ3B1X3R0bV90dF9wZGVfZmxhZ3Moc3RydWN0IHR0bV90
dCAqdHRtLCBzdHJ1Y3QgYW1kZ3B1X2JvICpibykKdWludDY0X3QgYW1kZ3B1X3R0bV90dF9wdGVf
ZmxhZ3Moc3RydWN0IHR0bV90dCAqdHRtLCBzdHJ1Y3QgYW1kZ3B1X2JvICpibykKClRoYW5rcywK
UmF5Cgo+IENocmlzdGlhbi4KPiAKPiA+ICAgCj4gPiAgIAlpZiAobWVtICYmIG1lbS0+bWVtX3R5
cGUgIT0gVFRNX1BMX1NZU1RFTSkKPiA+ICAgCQlmbGFncyB8PSBBTURHUFVfUFRFX1ZBTElEOwo+
ID4gQEAgLTE0NDQsNiArMTQ0Niw5IEBAIHVpbnQ2NF90IGFtZGdwdV90dG1fdHRfcGRlX2ZsYWdz
KHN0cnVjdCB0dG1fdHQgKnR0bSwgc3RydWN0IHR0bV9tZW1fcmVnICptZW0pCj4gPiAgIAkJaWYg
KHR0bS0+Y2FjaGluZ19zdGF0ZSA9PSB0dF9jYWNoZWQpCj4gPiAgIAkJCWZsYWdzIHw9IEFNREdQ
VV9QVEVfU05PT1BFRDsKPiA+ICAgCX0KPiA+ICsJaWYgKGFtZGdwdV9ib19lbmNyeXB0ZWQoYWJv
KSkgewo+ID4gKwkJZmxhZ3MgfD0gQU1ER1BVX1BURV9UTVo7Cj4gPiArCX0KPiA+ICAgCj4gPiAg
IAlyZXR1cm4gZmxhZ3M7Cj4gPiAgIH0KPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
