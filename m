Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A06903E3A4E
	for <lists+dri-devel@lfdr.de>; Sun,  8 Aug 2021 14:52:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E03C389B65;
	Sun,  8 Aug 2021 12:52:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6AC5489B4D
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Aug 2021 12:52:30 +0000 (UTC)
X-UUID: 23d95bde4c0e4e66b9998018f04a5f7d-20210808
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=JLQ+zb7/tEJb5TAPLTu2fShkGO7kQEonorKyASSHm3g=; 
 b=EXD5ulbQjUfwOLkc1SBi76I7FtdwU/0MEL6Q+qiMdrRuBPtZmlUodW8501ca+HwgiXZPQFu4yQREJT7oVhsesScsVO8K57BZGySsemNNU40xKIx9x1lb3v6biRKLGZe67/yV21wXjWup9T5Njm+E+rRxY6w2kEo2wQFN3jDGo0U=;
X-UUID: 23d95bde4c0e4e66b9998018f04a5f7d-20210808
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 918776073; Sun, 08 Aug 2021 20:52:27 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sun, 8 Aug 2021 20:52:23 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Sun, 8 Aug 2021 20:52:22 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg
 <sam@ravnborg.org>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
CC: <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <yingjoe.chen@mediatek.com>, <eddie.huang@mediatek.com>,
 <cawa.cheng@mediatek.com>, <bibby.hsieh@mediatek.com>, <ck.hu@mediatek.com>,
 <stonea168@163.com>, Jitao Shi <jitao.shi@mediatek.com>
Subject: [PATCH v2 3/3] drm/mediatek: fine tune the dsi panel's power sequence
Date: Sun, 8 Aug 2021 20:52:18 +0800
Message-ID: <20210808125218.63029-4-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210808125218.63029-1-jitao.shi@mediatek.com>
References: <20210808125218.63029-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: C5AFE532C3BD71E978C6991D5609392D6891061BFE6B852291D72323DF9655412000:8
X-MTK: N
Content-Transfer-Encoding: base64
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

QWRkIHRoZSBkcm1fcGFuZWxfcHJlcGFyZV9wb3dlciBhbmQgZHJtX3BhbmVsX3VucHJlcGFyZV9w
b3dlciBjb250cm9sLg0KVHVybiBvbiBwYW5lbCBwb3dlcihkcm1fcGFuZWxfcHJlcGFyZV9wb3dl
cikgYW5kIGNvbnRyb2wgYmVmb3JlIGRzaQ0KZW5hYmxlLiBBbmQgdGhlbiBkc2kgZW5hYmxlLCBz
ZW5kIGRjcyBjbWQgaW4gZHJtX3BhbmVsX3ByZXBhcmUsIGxhc3QNCnR1cm4gb24gYmFja2xpZ2h0
Lg0KDQpNb3N0IGRzaSBwYW5lbHMsIGhhdmUgZml2ZSBzdGVwcyB3aGVuIHBvd2Vyb24uDQoNCjEu
IHR1cm4gb24gZHNpIHNpZ25hbCB0byBMUDExICAgLS0+IGRzaSBob3N0J3MgYWN0aW9uDQoyLiB0
dXJuIG9uIHRoZSBwb3dlciBzdXBwbGllcywgIC0tPiBwYW5lbCdzIGFjdGlvbg0KMy4gc2VuZCB0
aGUgRENTICBjbWQgdG8gcGFuZWwgICAtLT4gcGFuZWwncyBhY3Rpb24NCjQuIHN0YXJ0IHNlbmQg
dmlkZW8gc3RyZWFtICAgICAgLS0+IGRzaSBob3N0J3MgYWN0aW9uDQo1LiB0dXJuIG9uIGJhY2ts
aWdodC4gICAgICAgICAgIC0tPiBwYW5lbCdzIGFjdGlvbg0KDQp3ZSBwdXQgInR1cm4gb24gdGhl
IHBvd2VyIHN1cHBsaWVzIiBhbmQgInNlbmQgdGhlIERDUyAgY21kIHRvIHBhbmVsIiBpbg0KcGFu
ZWxfcHJlcGFyZS4gQW5kICJ0dXJuIG9uIGJhY2tsaWdodCIgaW4gcGFuZWxfZW5hYmxlLg0KDQpC
dXQgc29tZSBvdGhlciBwYW5lbHMgaGFzIGEgc3BlY2lhbCBwb3dlcm9uIHNlcXVlbmNlIGFzIHRo
ZSBmb2xsb3dpbmcuDQoNCjEuIHR1cm4gb24gdGhlIHBvd2VyIHN1cHBsaWVzLCAgLS0+IHBhbmVs
J3MgYWN0aW9uDQoyLiB0dXJuIG9uIGRzaSBzaWduYWwgdG8gTFAxMSAgIC0tPiBkc2kgaG9zdCdz
IGFjdGlvbg0KMy4gc2VuZCB0aGUgRENTICBjbWQgdG8gcGFuZWwgICAtLT4gcGFuZWwncyBhY3Rp
b24NCjQuIHN0YXJ0IHNlbmQgdmlkZW8gc3RyZWFtICAgICAgLS0+IGRzaSBob3N0J3MgYWN0aW9u
DQo1LiB0dXJuIG9uIGJhY2tsaWdodC4gICAgICAgICAgIC0tPiBwYW5lbCdzIGFjdGlvbg0KDQpw
YW5lbCdzIGFjdGlvbnMgYXJlIGRpdmlkZWQgaW50byB0aHJlZSBwYXJ0cy4NCg0KU28gSSBhZGQg
YSBuZXcgYXBpICJkcm1fcGFuZWxfcHJlcGFyZV9wb3dlci9ybV9wYW5lbF91bnByZXBhcmVfcG93
ZXIiIHRvDQpjb250cm9sIHRoZSBzZXF1ZW5jZS4NCg0KU2lnbmVkLW9mZi1ieTogSml0YW8gU2hp
IDxqaXRhby5zaGlAbWVkaWF0ZWsuY29tPg0KLS0tDQogZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kc2kuYyB8IDI5ICsrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tDQogMSBmaWxlIGNo
YW5nZWQsIDI0IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kc2kuYw0KaW5kZXggYWU0MDNjNjdjYmQ5Li4yNGY4OWExZGQ0MjEgMTAwNjQ0DQot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jDQorKysgYi9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jDQpAQCAtMTg0LDYgKzE4NCw3IEBAIHN0cnVjdCBtdGtf
ZHNpIHsNCiAJc3RydWN0IGRybV9lbmNvZGVyIGVuY29kZXI7DQogCXN0cnVjdCBkcm1fYnJpZGdl
IGJyaWRnZTsNCiAJc3RydWN0IGRybV9icmlkZ2UgKm5leHRfYnJpZGdlOw0KKwlzdHJ1Y3QgZHJt
X3BhbmVsICpwYW5lbDsNCiAJc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcjsNCiAJc3Ry
dWN0IHBoeSAqcGh5Ow0KIA0KQEAgLTYxOSwxMCArNjIwLDE4IEBAIHN0YXRpYyBpbnQgbXRrX2Rz
aV9wb3dlcm9uKHN0cnVjdCBtdGtfZHNpICpkc2kpDQogCWRzaS0+ZGF0YV9yYXRlID0gRElWX1JP
VU5EX1VQX1VMTChkc2ktPnZtLnBpeGVsY2xvY2sgKiBiaXRfcGVyX3BpeGVsLA0KIAkJCQkJICBk
c2ktPmxhbmVzKTsNCiANCisJaWYgKGRzaS0+cGFuZWwpIHsNCisJCXJldCA9IHBhbmVsX2JyaWRn
ZV9wcmVwYXJlX3Bvd2VyKGRzaS0+bmV4dF9icmlkZ2UpDQorCQlpZiAocmV0KSB7DQorCQkJRFJN
X0lORk8oImNhbid0IHByZXBhcmUgcG93ZXIgdGhlIHBhbmVsXG4iKTsNCisJCQlnb3RvIGVycl9y
ZWZjb3VudDsNCisJCX0NCisJfQ0KKw0KIAlyZXQgPSBjbGtfc2V0X3JhdGUoZHNpLT5oc19jbGss
IGRzaS0+ZGF0YV9yYXRlKTsNCiAJaWYgKHJldCA8IDApIHsNCiAJCWRldl9lcnIoZGV2LCAiRmFp
bGVkIHRvIHNldCBkYXRhIHJhdGU6ICVkXG4iLCByZXQpOw0KLQkJZ290byBlcnJfcmVmY291bnQ7
DQorCQlnb3RvIGVycl9wcmVwYXJlX3Bvd2VyOw0KIAl9DQogDQogCXBoeV9wb3dlcl9vbihkc2kt
PnBoeSk7DQpAQCAtNjY1LDYgKzY3NCwxMSBAQCBzdGF0aWMgaW50IG10a19kc2lfcG93ZXJvbihz
dHJ1Y3QgbXRrX2RzaSAqZHNpKQ0KIAljbGtfZGlzYWJsZV91bnByZXBhcmUoZHNpLT5lbmdpbmVf
Y2xrKTsNCiBlcnJfcGh5X3Bvd2VyX29mZjoNCiAJcGh5X3Bvd2VyX29mZihkc2ktPnBoeSk7DQor
ZXJyX3ByZXBhcmVfcG93ZXI6DQorCWlmIChkc2ktPnBhbmVsKSB7DQorCQlpZiAocGFuZWxfYnJp
ZGdlX3VucHJlcGFyZV9wb3dlcihkc2ktPm5leHRfYnJpZGdlKSkNCisJCQlkZXZfZXJyKGRldiwg
IkNhbid0IHVucHJlcGFyZSBwb3dlciB0aGUgcGFuZWxcbiIpOw0KKwl9DQogZXJyX3JlZmNvdW50
Og0KIAlkc2ktPnJlZmNvdW50LS07DQogCXJldHVybiByZXQ7DQpAQCAtNjk4LDYgKzcxMiwxMiBA
QCBzdGF0aWMgdm9pZCBtdGtfZHNpX3Bvd2Vyb2ZmKHN0cnVjdCBtdGtfZHNpICpkc2kpDQogCWNs
a19kaXNhYmxlX3VucHJlcGFyZShkc2ktPmRpZ2l0YWxfY2xrKTsNCiANCiAJcGh5X3Bvd2VyX29m
Zihkc2ktPnBoeSk7DQorDQorCWlmIChkc2ktPnBhbmVsKSB7DQorCQlyZXQgPSBwYW5lbF9icmlk
Z2VfdW5wcmVwYXJlX3Bvd2VyKGRzaS0+bmV4dF9icmlkZ2UpOw0KKwkJaWYgKHJldCkNCisJCQlk
ZXZfZXJyKGRldiwgIkNhbid0IHVucHJlcGFyZSBwb3dlciB0aGUgcGFuZWwgcmV0OiVkXG4iLCBy
ZXQpOw0KKwl9DQogfQ0KIA0KIHN0YXRpYyB2b2lkIG10a19vdXRwdXRfZHNpX2VuYWJsZShzdHJ1
Y3QgbXRrX2RzaSAqZHNpKQ0KQEAgLTEwMDEsNyArMTAyMSw2IEBAIHN0YXRpYyBpbnQgbXRrX2Rz
aV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KIHsNCiAJc3RydWN0IG10a19k
c2kgKmRzaTsNCiAJc3RydWN0IGRldmljZSAqZGV2ID0gJnBkZXYtPmRldjsNCi0Jc3RydWN0IGRy
bV9wYW5lbCAqcGFuZWw7DQogCXN0cnVjdCByZXNvdXJjZSAqcmVnczsNCiAJaW50IGlycV9udW07
DQogCWludCByZXQ7DQpAQCAtMTAxOSwxMiArMTAzOCwxMiBAQCBzdGF0aWMgaW50IG10a19kc2lf
cHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCiAJfQ0KIA0KIAlyZXQgPSBkcm1f
b2ZfZmluZF9wYW5lbF9vcl9icmlkZ2UoZGV2LT5vZl9ub2RlLCAwLCAwLA0KLQkJCQkJICAmcGFu
ZWwsICZkc2ktPm5leHRfYnJpZGdlKTsNCisJCQkJCSAgJmRzaS0+cGFuZWwsICZkc2ktPm5leHRf
YnJpZGdlKTsNCiAJaWYgKHJldCkNCiAJCWdvdG8gZXJyX3VucmVnaXN0ZXJfaG9zdDsNCiANCi0J
aWYgKHBhbmVsKSB7DQotCQlkc2ktPm5leHRfYnJpZGdlID0gZGV2bV9kcm1fcGFuZWxfYnJpZGdl
X2FkZChkZXYsIHBhbmVsKTsNCisJaWYgKGRzaS0+cGFuZWwpIHsNCisJCWRzaS0+bmV4dF9icmlk
Z2UgPSBkZXZtX2RybV9wYW5lbF9icmlkZ2VfYWRkKGRldiwgZHNpLT5wYW5lbCk7DQogCQlpZiAo
SVNfRVJSKGRzaS0+bmV4dF9icmlkZ2UpKSB7DQogCQkJcmV0ID0gUFRSX0VSUihkc2ktPm5leHRf
YnJpZGdlKTsNCiAJCQlnb3RvIGVycl91bnJlZ2lzdGVyX2hvc3Q7DQotLSANCjIuMjUuMQ0K

