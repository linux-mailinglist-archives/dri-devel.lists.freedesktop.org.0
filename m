Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5D9F9007
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 13:54:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A9086E0AB;
	Tue, 12 Nov 2019 12:54:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820044.outbound.protection.outlook.com [40.107.82.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6CD86E0AB
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 12:54:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aOEhlb5DIQQ7jTkocBJB33gCIb6fQYFoxIjBf56rJjp4K+5CfDtpTKCfKV23GR/7sqOpGf1tSHQAzz2m0wiDAqRA2nF+TDXlN20B8CKWNoGPz4jbdgljZLErqn2h9wdRjwx5Gc7VVVVkNaQAispsgBJfbUIiYxfkf68EqwftMLN0w8oULRdCMb0zilmCUWVLPGXYml8sDXFQARQTDGuAvxa00W+WWTvpoQyFLaGojvnJFX1BLrUbOoG5Qlv2HvbI2FTUGMhpCerJ3wkehOVeQug4ZxAAFrU+NhAu7bCO60tVS52AkHlJ1mnGWQw0t0i0jqnjD9oXr7jxz1S3+4yrDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PJUlRZCMmm0lAxbP8EZjRbZlWAph93kE913ltimdtq8=;
 b=jJDNNy8EuRiwyeZFju4jYFnoM0B4euFLfRttyOX15YyrRIcL5CJO0BEP1HzPcVrI9jrclacM79uL0Wu59HZMlVpaXxMAVz697PIzfEf26BtN3XkxI7c93EYKVD+1GiAJ21wDyPDI4hZE0ds0dTuCEnjQYoYCncqv2HW8w7h33eC+sLUqfXXkHbqU2UvrA9EqC7K/WkaK19V9gbdj2FHa5i1HTO5y4lIjAKUF1ejRG1fXj94+WVySd2ujptlZ3aCu1qHACZXqCUsVPhfBAKupPHsQzTV3zryBK0gwkKK1jsAUOv8imYEAlAZWk/89ZJFdLezDXxtZ7N0SeKj2RC0rLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
Received: from MN2PR05MB6141.namprd05.prod.outlook.com (20.178.241.217) by
 MN2PR05MB6622.namprd05.prod.outlook.com (20.178.246.222) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.21; Tue, 12 Nov 2019 12:54:24 +0000
Received: from MN2PR05MB6141.namprd05.prod.outlook.com
 ([fe80::fc6c:1ed8:d63d:4dc8]) by MN2PR05MB6141.namprd05.prod.outlook.com
 ([fe80::fc6c:1ed8:d63d:4dc8%5]) with mapi id 15.20.2451.023; Tue, 12 Nov 2019
 12:54:24 +0000
From: Thomas Hellstrom <thellstrom@vmware.com>
To: Emil Velikov <emil.l.velikov@gmail.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 3/5] drm/vmwgfx: drop DRM_AUTH for render ioctls
Thread-Topic: [PATCH 3/5] drm/vmwgfx: drop DRM_AUTH for render ioctls
Thread-Index: AQHVkLT/I99B2IXlWkW8imDMq4fMng==
Date: Tue, 12 Nov 2019 12:54:24 +0000
Message-ID: <MN2PR05MB6141A83232659D80B2B9629DA1770@MN2PR05MB6141.namprd05.prod.outlook.com>
References: <20191101130313.8862-1-emil.l.velikov@gmail.com>
 <20191101130313.8862-3-emil.l.velikov@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [155.4.205.35]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 93d72963-c908-404f-ecf5-08d7676f720e
x-ms-traffictypediagnostic: MN2PR05MB6622:|MN2PR05MB6622:
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR05MB66221B7C24911CB86C704CA6A1770@MN2PR05MB6622.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:534;
x-forefront-prvs: 021975AE46
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(396003)(136003)(366004)(39860400002)(199004)(189003)(81166006)(86362001)(305945005)(66476007)(74316002)(7736002)(3846002)(66066001)(110136005)(14454004)(316002)(446003)(2501003)(81156014)(486006)(6116002)(8936002)(478600001)(2906002)(476003)(71190400001)(71200400001)(4326008)(8676002)(66446008)(25786009)(186003)(14444005)(107886003)(256004)(64756008)(102836004)(6246003)(99286004)(33656002)(229853002)(52536014)(91956017)(76116006)(9686003)(5660300002)(26005)(76176011)(66556008)(6436002)(66946007)(53546011)(7696005)(6506007)(55016002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR05MB6622;
 H:MN2PR05MB6141.namprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: vmware.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MkOGMQ3+JR+xNxveGLg+NCTb2eWWmmpNwpDbwXkESQnHWIuuzQKwztqtXnhr43VtiDvlJVWMLWM7VZdGjD0qJqshZUhQgveiax/mzEwiRhAvBmbtc0TQI4/zPITv3rzpBoQ8Ao++f5zQTBXT0g6aafwE4JhuEJ9ZY5sII6IrJVmjNlSZcYruwJs5AsRj/56/W5E9iZgBXHQIncSRztqdxxUj98mAqSAa+oPGX1NF7AidHS6ogVamp176jL0VpcpT8SERCh6GKPP+v3LwPLAl/NCPGuO2sCurtgjWzGOL+SRTJshKIR+liMVZaNViOnKU9Ws8L+daXJ1CVH3PT+QdkX2/2DyA6ql+9eC/VUUf4CcSS+nKimNEukSmusfmd8aMH9QUIJwSOUeU4a14ALaJgiBuXdKoJrKowIe2iZT0+QlWFvX9DIVS/1j9EIFSbwQE
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93d72963-c908-404f-ecf5-08d7676f720e
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2019 12:54:24.7766 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ET2eiIwCqnPWXOuUp9ogkalNs1XmkVYNUvBG10GEOG5qV7NjyM4yGtB7Y9xa3Dp+xKKak3bQYV0c8ZLQljRSNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR05MB6622
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vmware.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PJUlRZCMmm0lAxbP8EZjRbZlWAph93kE913ltimdtq8=;
 b=L7q6YhtOp7H+2UG3n97oqAXZ20fwNUHPwVPXGoFSW8jKALu8Bdwd7DxTEv08s2+gqMeH51FW5qBjnNnYyPZ+hkqNlsKzmmJjqk7vZvk+2pLBG5XnjTmQ1ZflFX4VDBxKpDFwOrEVCDj/Ea1+/6mylmnYrya28aPEe92M45tFWrw=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=thellstrom@vmware.com; 
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
Cc: Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTEvMS8xOSAyOjA1IFBNLCBFbWlsIFZlbGlrb3Ygd3JvdGU6Cj4gRnJvbTogRW1pbCBWZWxp
a292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KPgo+IFdpdGggZWFybGllciBjb21taXQg
OWM4NGFlYmE2N2NjICgiZHJtL3Ztd2dmeDogS2lsbCB1bm5lZWRlZCBsZWdhY3kKPiBzZWN1cml0
eSBmZWF0dXJlcyIpIHdlIHJlbW92ZWQgdGhlIG5vIGxvbmdlciBhcHBsaWNhYmxlIHZhbGlkYXRp
b24sIGFzCj4gd2Ugbm93IGhhdmUgaXNvbGF0aW9uIG9mIHByaW1hcnkgY2xpZW50cyBmcm9tIGRp
ZmZlcmVudCBtYXN0ZXIgcmVhbG1zLgo+Cj4gQXMgb2YgbGFzdCBjb21taXQsIHdlJ3JlIGV4cGxp
Y2l0bHkgY2hlY2tpbmcgZm9yIGF1dGhlbnRpY2F0aW9uIGluIHRoZQo+IG9ubHkgcmVuZGVyIGlv
Y3RscyB3aGljaCBjYXJlIGFib3V0IG9uZS4KPgo+IFdpdGggdGhvc2UgaW4gcGxhY2UsIHRoZSBE
Uk1fQVVUSCB0b2tlbiBzZXJ2ZXMgbm8gcmVhbCBwdXJwb3NlLiBMZXQncwo+IGRyb3AgaXQuCj4K
PiBDYzogVk13YXJlIEdyYXBoaWNzIDxsaW51eC1ncmFwaGljcy1tYWludGFpbmVyQHZtd2FyZS5j
b20+Cj4gQ2M6IFRob21hcyBIZWxsc3Ryb20gPHRoZWxsc3Ryb21Adm13YXJlLmNvbT4KPiBTaWdu
ZWQtb2ZmLWJ5OiBFbWlsIFZlbGlrb3YgPGVtaWwudmVsaWtvdkBjb2xsYWJvcmEuY29tPgo+IC0t
LQo+ICBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9kcnYuYyB8IDI4ICsrKysrKysrKysr
KysrLS0tLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDE0
IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13
Z2Z4X2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmMKPiBpbmRleCA4
MWE5NTY1MTY0M2YuLjI1M2ZhZTE2MDE3NSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
dm13Z2Z4L3Ztd2dmeF9kcnYuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4
X2Rydi5jCj4gQEAgLTE2NSw5ICsxNjUsOSBAQAo+ICAKPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBk
cm1faW9jdGxfZGVzYyB2bXdfaW9jdGxzW10gPSB7Cj4gIAlWTVdfSU9DVExfREVGKFZNV19HRVRf
UEFSQU0sIHZtd19nZXRwYXJhbV9pb2N0bCwKPiAtCQkgICAgICBEUk1fQVVUSCB8IERSTV9SRU5E
RVJfQUxMT1cpLAo+ICsJCSAgICAgIERSTV9SRU5ERVJfQUxMT1cpLAo+ICAJVk1XX0lPQ1RMX0RF
RihWTVdfQUxMT0NfRE1BQlVGLCB2bXdfYm9fYWxsb2NfaW9jdGwsCj4gLQkJICAgICAgRFJNX0FV
VEggfCBEUk1fUkVOREVSX0FMTE9XKSwKPiArCQkgICAgICBEUk1fUkVOREVSX0FMTE9XKSwKPiAg
CVZNV19JT0NUTF9ERUYoVk1XX1VOUkVGX0RNQUJVRiwgdm13X2JvX3VucmVmX2lvY3RsLAo+ICAJ
CSAgICAgIERSTV9SRU5ERVJfQUxMT1cpLAo+ICAJVk1XX0lPQ1RMX0RFRihWTVdfQ1VSU09SX0JZ
UEFTUywKPiBAQCAtMTgyLDE2ICsxODIsMTYgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1faW9j
dGxfZGVzYyB2bXdfaW9jdGxzW10gPSB7Cj4gIAkJICAgICAgRFJNX01BU1RFUiksCj4gIAo+ICAJ
Vk1XX0lPQ1RMX0RFRihWTVdfQ1JFQVRFX0NPTlRFWFQsIHZtd19jb250ZXh0X2RlZmluZV9pb2N0
bCwKPiAtCQkgICAgICBEUk1fQVVUSCB8IERSTV9SRU5ERVJfQUxMT1cpLAo+ICsJCSAgICAgIERS
TV9SRU5ERVJfQUxMT1cpLAo+ICAJVk1XX0lPQ1RMX0RFRihWTVdfVU5SRUZfQ09OVEVYVCwgdm13
X2NvbnRleHRfZGVzdHJveV9pb2N0bCwKPiAgCQkgICAgICBEUk1fUkVOREVSX0FMTE9XKSwKPiAg
CVZNV19JT0NUTF9ERUYoVk1XX0NSRUFURV9TVVJGQUNFLCB2bXdfc3VyZmFjZV9kZWZpbmVfaW9j
dGwsCj4gLQkJICAgICAgRFJNX0FVVEggfCBEUk1fUkVOREVSX0FMTE9XKSwKPiArCQkgICAgICBE
Uk1fUkVOREVSX0FMTE9XKSwKPiAgCVZNV19JT0NUTF9ERUYoVk1XX1VOUkVGX1NVUkZBQ0UsIHZt
d19zdXJmYWNlX2Rlc3Ryb3lfaW9jdGwsCj4gIAkJICAgICAgRFJNX1JFTkRFUl9BTExPVyksCj4g
IAlWTVdfSU9DVExfREVGKFZNV19SRUZfU1VSRkFDRSwgdm13X3N1cmZhY2VfcmVmZXJlbmNlX2lv
Y3RsLAo+IC0JCSAgICAgIERSTV9BVVRIIHwgRFJNX1JFTkRFUl9BTExPVyksCj4gLQlWTVdfSU9D
VExfREVGKFZNV19FWEVDQlVGLCB2bXdfZXhlY2J1Zl9pb2N0bCwgRFJNX0FVVEggfAo+ICsJCSAg
ICAgIERSTV9SRU5ERVJfQUxMT1cpLAo+ICsJVk1XX0lPQ1RMX0RFRihWTVdfRVhFQ0JVRiwgdm13
X2V4ZWNidWZfaW9jdGwsCj4gIAkJICAgICAgRFJNX1JFTkRFUl9BTExPVyksCj4gIAlWTVdfSU9D
VExfREVGKFZNV19GRU5DRV9XQUlULCB2bXdfZmVuY2Vfb2JqX3dhaXRfaW9jdGwsCj4gIAkJICAg
ICAgRFJNX1JFTkRFUl9BTExPVyksCj4gQEAgLTIwMSw5ICsyMDEsOSBAQCBzdGF0aWMgY29uc3Qg
c3RydWN0IGRybV9pb2N0bF9kZXNjIHZtd19pb2N0bHNbXSA9IHsKPiAgCVZNV19JT0NUTF9ERUYo
Vk1XX0ZFTkNFX1VOUkVGLCB2bXdfZmVuY2Vfb2JqX3VucmVmX2lvY3RsLAo+ICAJCSAgICAgIERS
TV9SRU5ERVJfQUxMT1cpLAo+ICAJVk1XX0lPQ1RMX0RFRihWTVdfRkVOQ0VfRVZFTlQsIHZtd19m
ZW5jZV9ldmVudF9pb2N0bCwKPiAtCQkgICAgICBEUk1fQVVUSCB8IERSTV9SRU5ERVJfQUxMT1cp
LAo+ICsJCSAgICAgIERSTV9SRU5ERVJfQUxMT1cpLAo+ICAJVk1XX0lPQ1RMX0RFRihWTVdfR0VU
XzNEX0NBUCwgdm13X2dldF9jYXBfM2RfaW9jdGwsCj4gLQkJICAgICAgRFJNX0FVVEggfCBEUk1f
UkVOREVSX0FMTE9XKSwKPiArCQkgICAgICBEUk1fUkVOREVSX0FMTE9XKSwKPiAgCj4gIAkvKiB0
aGVzZSBhbGxvdyBkaXJlY3QgYWNjZXNzIHRvIHRoZSBmcmFtZWJ1ZmZlcnMgbWFyayBhcyBtYXN0
ZXIgb25seSAqLwo+ICAJVk1XX0lPQ1RMX0RFRihWTVdfUFJFU0VOVCwgdm13X3ByZXNlbnRfaW9j
dGwsCj4gQEAgLTIyMSwyOCArMjIxLDI4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2lvY3Rs
X2Rlc2Mgdm13X2lvY3Rsc1tdID0gewo+ICAJCSAgICAgIERSTV9SRU5ERVJfQUxMT1cpLAo+ICAJ
Vk1XX0lPQ1RMX0RFRihWTVdfQ1JFQVRFX1NIQURFUiwKPiAgCQkgICAgICB2bXdfc2hhZGVyX2Rl
ZmluZV9pb2N0bCwKPiAtCQkgICAgICBEUk1fQVVUSCB8IERSTV9SRU5ERVJfQUxMT1cpLAo+ICsJ
CSAgICAgIERSTV9SRU5ERVJfQUxMT1cpLAo+ICAJVk1XX0lPQ1RMX0RFRihWTVdfVU5SRUZfU0hB
REVSLAo+ICAJCSAgICAgIHZtd19zaGFkZXJfZGVzdHJveV9pb2N0bCwKPiAgCQkgICAgICBEUk1f
UkVOREVSX0FMTE9XKSwKPiAgCVZNV19JT0NUTF9ERUYoVk1XX0dCX1NVUkZBQ0VfQ1JFQVRFLAo+
ICAJCSAgICAgIHZtd19nYl9zdXJmYWNlX2RlZmluZV9pb2N0bCwKPiAtCQkgICAgICBEUk1fQVVU
SCB8IERSTV9SRU5ERVJfQUxMT1cpLAo+ICsJCSAgICAgIERSTV9SRU5ERVJfQUxMT1cpLAo+ICAJ
Vk1XX0lPQ1RMX0RFRihWTVdfR0JfU1VSRkFDRV9SRUYsCj4gIAkJICAgICAgdm13X2diX3N1cmZh
Y2VfcmVmZXJlbmNlX2lvY3RsLAo+IC0JCSAgICAgIERSTV9BVVRIIHwgRFJNX1JFTkRFUl9BTExP
VyksCj4gKwkJICAgICAgRFJNX1JFTkRFUl9BTExPVyksCj4gIAlWTVdfSU9DVExfREVGKFZNV19T
WU5DQ1BVLAo+ICAJCSAgICAgIHZtd191c2VyX2JvX3N5bmNjcHVfaW9jdGwsCj4gIAkJICAgICAg
RFJNX1JFTkRFUl9BTExPVyksCj4gIAlWTVdfSU9DVExfREVGKFZNV19DUkVBVEVfRVhURU5ERURf
Q09OVEVYVCwKPiAgCQkgICAgICB2bXdfZXh0ZW5kZWRfY29udGV4dF9kZWZpbmVfaW9jdGwsCj4g
LQkJICAgICAgRFJNX0FVVEggfCBEUk1fUkVOREVSX0FMTE9XKSwKPiArCQkgICAgICBEUk1fUkVO
REVSX0FMTE9XKSwKPiAgCVZNV19JT0NUTF9ERUYoVk1XX0dCX1NVUkZBQ0VfQ1JFQVRFX0VYVCwK
PiAgCQkgICAgICB2bXdfZ2Jfc3VyZmFjZV9kZWZpbmVfZXh0X2lvY3RsLAo+IC0JCSAgICAgIERS
TV9BVVRIIHwgRFJNX1JFTkRFUl9BTExPVyksCj4gKwkJICAgICAgRFJNX1JFTkRFUl9BTExPVyks
Cj4gIAlWTVdfSU9DVExfREVGKFZNV19HQl9TVVJGQUNFX1JFRl9FWFQsCj4gIAkJICAgICAgdm13
X2diX3N1cmZhY2VfcmVmZXJlbmNlX2V4dF9pb2N0bCwKPiAtCQkgICAgICBEUk1fQVVUSCB8IERS
TV9SRU5ERVJfQUxMT1cpLAo+ICsJCSAgICAgIERSTV9SRU5ERVJfQUxMT1cpLAo+ICB9Owo+ICAK
PiAgc3RhdGljIGNvbnN0IHN0cnVjdCBwY2lfZGV2aWNlX2lkIHZtd19wY2lfaWRfbGlzdFtdID0g
ewoKUmV2aWV3ZWQtYnk6IFRob21hcyBIZWxsc3Ryb20gPHRoZWxsc3Ryb21Adm13YXJlLmNvbT4K
CkRvIHlvdSB3YW50IG1lIHRvIHRha2UgdGhpcyB0aHJvdWdoIHRoZSB2bXdnZnggdHJlZT8KClRo
YW5rcywKClRob21hcwoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
