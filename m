Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB38531935B
	for <lists+dri-devel@lfdr.de>; Thu, 11 Feb 2021 20:49:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2741E6E49F;
	Thu, 11 Feb 2021 19:49:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10olkn2078.outbound.protection.outlook.com [40.92.40.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F66889D79
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Feb 2021 17:51:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kDv+qq8pwe2nx5vpM3R8FVK348AKDYAnJHlVPFLS3mSl/hFPEgu2iLSAf2cOicKd5dZFbuCO6EZDltoNba4bMcSBL7BVHyhDbUvwLOg1uHQC6x9W+GDimK2LzmzXc4nD96z8/h5Zk97naRTZvmULgAr31U6Weq41c9zkVyxnKggbMq1QHF1j+lhuH/9bV4HfUyD4SK0iOUJWX2asGYJYBdZsoOtTmTp+yFd4SaJlbU5Tg50MLuYX7Evd5CotTYKURxdsN7ggIfwrHPnLEoTw5IDg6Ifd6vIhC0YCiuefVCajN8jPI97MsMMUYSt8lXZOCTW8L9o3mhMoodVAS/xWOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F40UvSLm5DXn2wilQfrjbt4+oWdVDJSunvT+fcQT3zk=;
 b=Q5j1Y4RW0cPZIoc8WdmqzhRnWC99EzP4L9odFDglypnuk1r2cqOHdKtRuG6gbG+hCF2SZ1azzZmipIqjd0VBVN1U82aQV86Kxq9m0lo2P13h6mEhPJ4KzFUwBms7WP5wOG/fr2oV6zmqRn5laZau84/Wd3F+3oEhAjgdpOQBnv3XeekC6ooz8v/ytBHCD+flbckY8ZhwAJILowqhuT82FoNZGk3LzxxoWlCV22e+Q3GJNw66KDX7jbtX3bLBh1vQsONGXIpf0Mbl59yslJuQgu30kmrnZcQ/1jlFwD8LZ+lRrDhsQLKiAsYin/dPXw9gpG/UdRt93FP204yMl2WvgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F40UvSLm5DXn2wilQfrjbt4+oWdVDJSunvT+fcQT3zk=;
 b=KWmvbAystW9BizJ8Fm1UGODprowcMWO0Tx6nrmF0wZwglo6kbyMh/HpiirHClMwbRPDJ4M2Nqy6lXAneKudXCQo480M31QB5C5vDV5u6Q6qF5DE8F7kA7/3t0MGJjX/La82ddPOYd8qqJh8OGmrbKu0yjRlcqnWnS8Wnx27mZt6KZ72brFZD6rYf2i9DVx0/omr7i79UGCeDUHaT+TDVRMZTjkujWHAxNMztH9yp8Y3zs4lk654h1B8XaI42tOyR+74dDyulBNAx4mjY+mxeI+ZRYwAHjzW1ZkQrOrTZA3wBnyLal1xUwraLlk8/2oiutEDcBq5yz1lExTr6j67I2A==
Received: from DM6NAM10FT054.eop-nam10.prod.protection.outlook.com
 (2a01:111:e400:7e86::49) by
 DM6NAM10HT209.eop-nam10.prod.protection.outlook.com (2a01:111:e400:7e86::463)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25; Thu, 11 Feb
 2021 17:51:56 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com (10.13.152.55) by
 DM6NAM10FT054.mail.protection.outlook.com (10.13.153.167) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.25 via Frontend Transport; Thu, 11 Feb 2021 17:51:55 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::c1c9:7368:b8b3:454a]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::c1c9:7368:b8b3:454a%3]) with mapi id 15.20.3846.027; Thu, 11 Feb 2021
 17:51:55 +0000
From: Christopher Morgan <macromorgan@hotmail.com>
To: "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "sam@ravnborg.org"
 <sam@ravnborg.org>, "airlied@linux.ie" <airlied@linux.ie>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, =?iso-8859-1?Q?Heiko_St=FCbner?=
 <heiko@sntech.de>
Subject: Proposed Changes to Elida-KD35T133 Panel Driver
Thread-Topic: Proposed Changes to Elida-KD35T133 Panel Driver
Thread-Index: AdcAnjfEGuXIFq3tQrqQ/RLo2R2syg==
Date: Thu, 11 Feb 2021 17:51:55 +0000
Message-ID: <SN6PR06MB53426C7236890DEEDE4EE632A58C9@SN6PR06MB5342.namprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:24B1DB568D2258FF83EFA05C10D3C9E649167F28ED8C0E500CB0FC0C61ABA82C;
 UpperCasedChecksum:0092F10F1DCD525DAA3FCA0743A10A8E009E39B96103D3A9F7B7B8519CDAECDE;
 SizeAsReceived:7115; Count:41
x-tmn: [SOfq7lkf9dwcj6sU1fy/tnIWPGYLs95ixcbf0IVVjlZ/V45ZU6o3mbhc7mT9PpKGaxwfsr85LMw=]
x-ms-publictraffictype: Email
x-incomingheadercount: 41
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 5f843316-f606-4ac7-bd7f-08d8ceb5b8b3
x-ms-traffictypediagnostic: DM6NAM10HT209:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /NWHqCOv5xCjf0RcSHQfDsjFhw1sBQwVHzWMOz8h3g+TL22yw6O8zI5JQCqr9gYHluHZJGbd8F0lcPHyHLj0kUsW2RMnb+j9oS/zYpO/RWT74Do1xD2hlAd2+ziGcS6t6LhAwpMC6qQEl9Pf/WUU65BDmXJz5l01WH+WeQ8ueSqNWmN7oOnzaQAmeFJIiWOcdPHHKAVNrLRSvC6KEnDuLgJacYI+Q2pzpbH/NYs47GTb23Mnu38HyB8ZwGhm9AuvO8s/y+Y3ySfVq4q+vbuVFCignd7RXV1LY4hdj+3xThJgJms7y5C5WER6xHLGoF6V25n0xg0BUCSEzTnSfzhPhi+E5uTSWShCIn+6O1aZ1pvI5rcYfDeYxAZ8oMAfycIZpslIJox9pwLSY/EM1McoCg==
x-ms-exchange-antispam-messagedata: dq+zCjqj7Dqt2pH/CpNLOR0muIqAB2Hmu7Z8OdgGnQOKmQe7Yv0FpOwYgWvhqkobbzEBuq/USFOA7xzXdo0D3Kd1UuSbcrnfT+RkNaG5MqWbQ+95JlscyTbHxvm5Qu0qG08O9dVfTs7RMoQrUKtfu5HXIKTQENldeMt7RIQ2geCkXCMOTg7i/r/2Z3xobdmIIURkLDUM7Vv6f0IVG2YSrg==
x-ms-exchange-transport-forked: True
Content-Type: multipart/mixed;
 boundary="_003_SN6PR06MB53426C7236890DEEDE4EE632A58C9SN6PR06MB5342namp_"
MIME-Version: 1.0
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM10FT054.eop-nam10.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f843316-f606-4ac7-bd7f-08d8ceb5b8b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2021 17:51:55.4345 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6NAM10HT209
X-Mailman-Approved-At: Thu, 11 Feb 2021 19:49:13 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_003_SN6PR06MB53426C7236890DEEDE4EE632A58C9SN6PR06MB5342namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I'd like to make the following changes to this panel driver.  The first pat=
ch is to add rotation support (rotates only the DRM connector at this time)=
.  The panel is currently rotated 270 degrees in the Odroid Go Advance, and=
 this change allows us to describe that hardware better.

The second patch just fixes a typo.  The panel in question is 3.5 inches in=
 size not 5.5 inches.

Thank you.



--_003_SN6PR06MB53426C7236890DEEDE4EE632A58C9SN6PR06MB5342namp_
Content-Type: application/octet-stream;
	name="0001-drm-panel-add-rotation-support-for-Elida-KD35T133-pa.patch"
Content-Description:  0001-drm-panel-add-rotation-support-for-Elida-KD35T133-pa.patch
Content-Disposition: attachment;
	filename="0001-drm-panel-add-rotation-support-for-Elida-KD35T133-pa.patch";
	size=1543; creation-date="Thu, 11 Feb 2021 17:51:00 GMT";
	modification-date="Thu, 11 Feb 2021 17:51:00 GMT"
Content-Transfer-Encoding: base64

RnJvbSA5YjZkZDQ0YjljZjhmNDIwNmQ4OWYzNzg2NDk3ZmNjYjFhNDdlZTg3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBDaHJpcyBNb3JnYW4gPG1hY3JvbW9yZ2FuQGhvdG1haWwuY29t
PgpEYXRlOiBUaHUsIDExIEZlYiAyMDIxIDEwOjU2OjQ5IC0wNjAwClN1YmplY3Q6IFtQQVRDSCAx
LzJdIGRybS9wYW5lbDogYWRkIHJvdGF0aW9uIHN1cHBvcnQgZm9yIEVsaWRhIEtEMzVUMTMzIHBh
bmVscwoKVXBkYXRlIHRoZSBwYW5lbCB0byBhbGxvdyBzZXR0aW5nIHRoZSByb3RhdGlvbiB2YWx1
ZSBpbiBkZXZpY2UgdHJlZS4KClNpZ25lZC1vZmYtYnk6IENocmlzIE1vcmdhbiA8bWFjcm9tb3Jn
YW5AaG90bWFpbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLWVsaWRhLWtk
MzV0MTMzLmMgfCA4ICsrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLWVsaWRhLWtkMzV0MTMzLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtZWxpZGEta2QzNXQxMzMuYwppbmRleCBiYzM2
YWEzYzExMjMuLmQ4NTM0NDA2ZDFlZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmVs
L3BhbmVsLWVsaWRhLWtkMzV0MTMzLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVs
LWVsaWRhLWtkMzV0MTMzLmMKQEAgLTQyLDYgKzQyLDcgQEAgc3RydWN0IGtkMzV0MTMzIHsKIAlz
dHJ1Y3QgZ3Bpb19kZXNjICpyZXNldF9ncGlvOwogCXN0cnVjdCByZWd1bGF0b3IgKnZkZDsKIAlz
dHJ1Y3QgcmVndWxhdG9yICppb3ZjYzsKKwllbnVtIGRybV9wYW5lbF9vcmllbnRhdGlvbiBvcmll
bnRhdGlvbjsKIAlib29sIHByZXBhcmVkOwogfTsKIApAQCAtMjE2LDYgKzIxNyw3IEBAIHN0YXRp
YyBpbnQga2QzNXQxMzNfZ2V0X21vZGVzKHN0cnVjdCBkcm1fcGFuZWwgKnBhbmVsLAogCWNvbm5l
Y3Rvci0+ZGlzcGxheV9pbmZvLndpZHRoX21tID0gbW9kZS0+d2lkdGhfbW07CiAJY29ubmVjdG9y
LT5kaXNwbGF5X2luZm8uaGVpZ2h0X21tID0gbW9kZS0+aGVpZ2h0X21tOwogCWRybV9tb2RlX3By
b2JlZF9hZGQoY29ubmVjdG9yLCBtb2RlKTsKKwlkcm1fY29ubmVjdG9yX3NldF9wYW5lbF9vcmll
bnRhdGlvbihjb25uZWN0b3IsIGN0eC0+b3JpZW50YXRpb24pOwogCiAJcmV0dXJuIDE7CiB9CkBA
IC0yNTgsNiArMjYwLDEyIEBAIHN0YXRpYyBpbnQga2QzNXQxMzNfcHJvYmUoc3RydWN0IG1pcGlf
ZHNpX2RldmljZSAqZHNpKQogCQlyZXR1cm4gcmV0OwogCX0KIAorCXJldCA9IG9mX2RybV9nZXRf
cGFuZWxfb3JpZW50YXRpb24oZGV2LT5vZl9ub2RlLCAmY3R4LT5vcmllbnRhdGlvbik7CisJaWYg
KHJldCA8IDApIHsKKwkJZGV2X2VycihkZXYsICIlcE9GOiBmYWlsZWQgdG8gZ2V0IG9yaWVudGF0
aW9uICVkXG4iLCBkZXYtPm9mX25vZGUsIHJldCk7CisJCXJldHVybiByZXQ7CisJfQorCiAJbWlw
aV9kc2lfc2V0X2RydmRhdGEoZHNpLCBjdHgpOwogCiAJY3R4LT5kZXYgPSBkZXY7Ci0tIAoyLjI1
LjEKCg==

--_003_SN6PR06MB53426C7236890DEEDE4EE632A58C9SN6PR06MB5342namp_
Content-Type: application/octet-stream;
	name="0002-drm-panel-correct-typo-in-comments-for-Elida-KD35T13.patch"
Content-Description:  0002-drm-panel-correct-typo-in-comments-for-Elida-KD35T13.patch
Content-Disposition: attachment;
	filename="0002-drm-panel-correct-typo-in-comments-for-Elida-KD35T13.patch";
	size=973; creation-date="Thu, 11 Feb 2021 17:51:00 GMT";
	modification-date="Thu, 11 Feb 2021 17:51:00 GMT"
Content-Transfer-Encoding: base64

RnJvbSA1OWZjMjk5YjljMTliNDhlZjdlYzBjMjExMTc2MmY5ZWY2ZmFiYjg2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBDaHJpcyBNb3JnYW4gPG1hY3JvbW9yZ2FuQGhvdG1haWwuY29t
PgpEYXRlOiBUaHUsIDExIEZlYiAyMDIxIDExOjA5OjA1IC0wNjAwClN1YmplY3Q6IFtQQVRDSCAy
LzJdIGRybS9wYW5lbDogY29ycmVjdCB0eXBvIGluIGNvbW1lbnRzIGZvciBFbGlkYSBLRDM1VDEz
MwogcGFuZWwgZHJpdmVyCgpVcGRhdGUgdGhlIGNvbW1lbnRzIHRvIHN0YXRlIHRoaXMgaXMgYSAz
LjUiIGRpc3BsYXkgYW5kIG5vdCBhIDUuNSIgZGlzcGxheQoKU2lnbmVkLW9mZi1ieTogQ2hyaXMg
TW9yZ2FuIDxtYWNyb21vcmdhbkBob3RtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcGFu
ZWwvcGFuZWwtZWxpZGEta2QzNXQxMzMuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5l
bC9wYW5lbC1lbGlkYS1rZDM1dDEzMy5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLWVs
aWRhLWtkMzV0MTMzLmMKaW5kZXggZDg1MzQ0MDZkMWVmLi5iY2U4NGQyZTZhZGEgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1lbGlkYS1rZDM1dDEzMy5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1lbGlkYS1rZDM1dDEzMy5jCkBAIC0xLDYgKzEsNiBA
QAogLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKIC8qCi0gKiBFbGlkYSBrZDM1
dDEzMyA1LjUiIE1JUEktRFNJIHBhbmVsIGRyaXZlcgorICogRWxpZGEga2QzNXQxMzMgMy41IiBN
SVBJLURTSSBwYW5lbCBkcml2ZXIKICAqIENvcHlyaWdodCAoQykgMjAyMCBUaGVvYnJvbWEgU3lz
dGVtcyBEZXNpZ24gdW5kIENvbnN1bHRpbmcgR21iSAogICoKICAqIGJhc2VkIG9uCi0tIAoyLjI1
LjEKCg==

--_003_SN6PR06MB53426C7236890DEEDE4EE632A58C9SN6PR06MB5342namp_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--_003_SN6PR06MB53426C7236890DEEDE4EE632A58C9SN6PR06MB5342namp_--
