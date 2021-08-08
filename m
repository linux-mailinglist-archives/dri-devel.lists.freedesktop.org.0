Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3473E3A4C
	for <lists+dri-devel@lfdr.de>; Sun,  8 Aug 2021 14:52:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98AC489B4D;
	Sun,  8 Aug 2021 12:52:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id C644F8991C
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Aug 2021 12:52:32 +0000 (UTC)
X-UUID: 5909495ecc69422eb6d36bc8add5059d-20210808
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Q1Yw7il2MClM4mQcrsnzuY1x1dqtCZCR9HbDGp8SKAI=; 
 b=W5gfZS9kyuafMII0UxctAa1EviYfK5WUo+80fyBDWbosFf99EKK9+sSuGU8Had/DAQliNaKwIfTzkgTC8QerEx93fXstMjFJtMmqt7czpI7qPcnuvLyiOeSrFn/4cV7T2ERfeNhIPG2Zz+RvTxHfyenwoQxmaTIbBEWMs3fMUqI=;
X-UUID: 5909495ecc69422eb6d36bc8add5059d-20210808
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1933725988; Sun, 08 Aug 2021 20:52:27 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sun, 8 Aug 2021 20:52:22 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Sun, 8 Aug 2021 20:52:21 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg
 <sam@ravnborg.org>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
CC: <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <yingjoe.chen@mediatek.com>, <eddie.huang@mediatek.com>,
 <cawa.cheng@mediatek.com>, <bibby.hsieh@mediatek.com>, <ck.hu@mediatek.com>,
 <stonea168@163.com>, Jitao Shi <jitao.shi@mediatek.com>
Subject: [PATCH v2 2/3] drm/panel: boe-tv101wum-n16 seperate the panel power
 control
Date: Sun, 8 Aug 2021 20:52:17 +0800
Message-ID: <20210808125218.63029-3-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210808125218.63029-1-jitao.shi@mediatek.com>
References: <20210808125218.63029-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 91DADB6A7DB04B0D8E055F2F81CE174C97CD576C95473630420598D377E816CF2000:8
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

U2VwZXJhdGUgdGhlIHBhbmVsIHBvd2VyIGNvbnRyb2wgZnJvbSBwcmVwYXJlL3VucHJlcGFyZS4N
Cg0KU2lnbmVkLW9mZi1ieTogSml0YW8gU2hpIDxqaXRhby5zaGlAbWVkaWF0ZWsuY29tPg0KLS0t
DQogLi4uL2dwdS9kcm0vcGFuZWwvcGFuZWwtYm9lLXR2MTAxd3VtLW5sNi5jICAgIHwgNzIgKysr
KysrKysrKysrKy0tLS0tLQ0KIDEgZmlsZSBjaGFuZ2VkLCA1MCBpbnNlcnRpb25zKCspLCAyMiBk
ZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1i
b2UtdHYxMDF3dW0tbmw2LmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtYm9lLXR2MTAx
d3VtLW5sNi5jDQppbmRleCBkYjlkMGI4NmQ1NDIuLmRjNDkwNzlhNzRkMSAxMDA2NDQNCi0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1ib2UtdHYxMDF3dW0tbmw2LmMNCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1ib2UtdHYxMDF3dW0tbmw2LmMNCkBAIC01MCw2ICs1
MCw3IEBAIHN0cnVjdCBib2VfcGFuZWwgew0KIAlzdHJ1Y3QgcmVndWxhdG9yICphdmRkOw0KIAlz
dHJ1Y3QgZ3Bpb19kZXNjICplbmFibGVfZ3BpbzsNCiANCisJYm9vbCBwcmVwYXJlZF9wb3dlcjsN
CiAJYm9vbCBwcmVwYXJlZDsNCiB9Ow0KIA0KQEAgLTQ4OCwyMiArNDg5LDEzIEBAIHN0YXRpYyBp
bnQgYm9lX3BhbmVsX2VudGVyX3NsZWVwX21vZGUoc3RydWN0IGJvZV9wYW5lbCAqYm9lKQ0KIAly
ZXR1cm4gMDsNCiB9DQogDQotc3RhdGljIGludCBib2VfcGFuZWxfdW5wcmVwYXJlKHN0cnVjdCBk
cm1fcGFuZWwgKnBhbmVsKQ0KK3N0YXRpYyBpbnQgYm9lX3BhbmVsX3VucHJlcGFyZV9wb3dlcihz
dHJ1Y3QgZHJtX3BhbmVsICpwYW5lbCkNCiB7DQogCXN0cnVjdCBib2VfcGFuZWwgKmJvZSA9IHRv
X2JvZV9wYW5lbChwYW5lbCk7DQotCWludCByZXQ7DQogDQotCWlmICghYm9lLT5wcmVwYXJlZCkN
CisJaWYgKCFib2UtPnByZXBhcmVkX3Bvd2VyKQ0KIAkJcmV0dXJuIDA7DQogDQotCXJldCA9IGJv
ZV9wYW5lbF9lbnRlcl9zbGVlcF9tb2RlKGJvZSk7DQotCWlmIChyZXQgPCAwKSB7DQotCQlkZXZf
ZXJyKHBhbmVsLT5kZXYsICJmYWlsZWQgdG8gc2V0IHBhbmVsIG9mZjogJWRcbiIsIHJldCk7DQot
CQlyZXR1cm4gcmV0Ow0KLQl9DQotDQotCW1zbGVlcCgxNTApOw0KLQ0KIAlpZiAoYm9lLT5kZXNj
LT5kaXNjaGFyZ2Vfb25fZGlzYWJsZSkgew0KIAkJcmVndWxhdG9yX2Rpc2FibGUoYm9lLT5hdmVl
KTsNCiAJCXJlZ3VsYXRvcl9kaXNhYmxlKGJvZS0+YXZkZCk7DQpAQCAtNTEyLDYgKzUwNCw3IEBA
IHN0YXRpYyBpbnQgYm9lX3BhbmVsX3VucHJlcGFyZShzdHJ1Y3QgZHJtX3BhbmVsICpwYW5lbCkN
CiAJCXVzbGVlcF9yYW5nZSg1MDAwLCA3MDAwKTsNCiAJCXJlZ3VsYXRvcl9kaXNhYmxlKGJvZS0+
cHAxODAwKTsNCiAJfSBlbHNlIHsNCisJCW1zbGVlcCgxNTApOw0KIAkJZ3Bpb2Rfc2V0X3ZhbHVl
KGJvZS0+ZW5hYmxlX2dwaW8sIDApOw0KIAkJdXNsZWVwX3JhbmdlKDUwMCwgMTAwMCk7DQogCQly
ZWd1bGF0b3JfZGlzYWJsZShib2UtPmF2ZWUpOw0KQEAgLTUyMCwxNyArNTEzLDM5IEBAIHN0YXRp
YyBpbnQgYm9lX3BhbmVsX3VucHJlcGFyZShzdHJ1Y3QgZHJtX3BhbmVsICpwYW5lbCkNCiAJCXJl
Z3VsYXRvcl9kaXNhYmxlKGJvZS0+cHAxODAwKTsNCiAJfQ0KIA0KKwlib2UtPnByZXBhcmVkX3Bv
d2VyID0gZmFsc2U7DQorDQorCXJldHVybiAwOw0KK30NCisNCitzdGF0aWMgaW50IGJvZV9wYW5l
bF91bnByZXBhcmUoc3RydWN0IGRybV9wYW5lbCAqcGFuZWwpDQorew0KKwlzdHJ1Y3QgYm9lX3Bh
bmVsICpib2UgPSB0b19ib2VfcGFuZWwocGFuZWwpOw0KKwlpbnQgcmV0Ow0KKw0KKwlpZiAoIWJv
ZS0+cHJlcGFyZWQpDQorCQlyZXR1cm4gMDsNCisNCisJaWYgKCFib2UtPmRlc2MtPmRpc2NoYXJn
ZV9vbl9kaXNhYmxlKSB7DQorCQlyZXQgPSBib2VfcGFuZWxfZW50ZXJfc2xlZXBfbW9kZShib2Up
Ow0KKwkJaWYgKHJldCA8IDApIHsNCisJCQlkZXZfZXJyKHBhbmVsLT5kZXYsICJmYWlsZWQgdG8g
c2V0IHBhbmVsIG9mZjogJWRcbiIsDQorCQkJCXJldCk7DQorCQkJcmV0dXJuIHJldDsNCisJCX0N
CisJfQ0KKw0KIAlib2UtPnByZXBhcmVkID0gZmFsc2U7DQogDQogCXJldHVybiAwOw0KIH0NCiAN
Ci1zdGF0aWMgaW50IGJvZV9wYW5lbF9wcmVwYXJlKHN0cnVjdCBkcm1fcGFuZWwgKnBhbmVsKQ0K
K3N0YXRpYyBpbnQgYm9lX3BhbmVsX3ByZXBhcmVfcG93ZXIoc3RydWN0IGRybV9wYW5lbCAqcGFu
ZWwpDQogew0KIAlzdHJ1Y3QgYm9lX3BhbmVsICpib2UgPSB0b19ib2VfcGFuZWwocGFuZWwpOw0K
IAlpbnQgcmV0Ow0KIA0KLQlpZiAoYm9lLT5wcmVwYXJlZCkNCisJaWYgKGJvZS0+cHJlcGFyZWRf
cG93ZXIpDQogCQlyZXR1cm4gMDsNCiANCiAJZ3Bpb2Rfc2V0X3ZhbHVlKGJvZS0+ZW5hYmxlX2dw
aW8sIDApOw0KQEAgLTU1OCwxOCArNTczLDEwIEBAIHN0YXRpYyBpbnQgYm9lX3BhbmVsX3ByZXBh
cmUoc3RydWN0IGRybV9wYW5lbCAqcGFuZWwpDQogCWdwaW9kX3NldF92YWx1ZShib2UtPmVuYWJs
ZV9ncGlvLCAxKTsNCiAJdXNsZWVwX3JhbmdlKDYwMDAsIDEwMDAwKTsNCiANCi0JcmV0ID0gYm9l
X3BhbmVsX2luaXRfZGNzX2NtZChib2UpOw0KLQlpZiAocmV0IDwgMCkgew0KLQkJZGV2X2Vycihw
YW5lbC0+ZGV2LCAiZmFpbGVkIHRvIGluaXQgcGFuZWw6ICVkXG4iLCByZXQpOw0KLQkJZ290byBw
b3dlcm9mZjsNCi0JfQ0KLQ0KLQlib2UtPnByZXBhcmVkID0gdHJ1ZTsNCisJYm9lLT5wcmVwYXJl
ZF9wb3dlciA9IHRydWU7DQogDQogCXJldHVybiAwOw0KIA0KLXBvd2Vyb2ZmOg0KLQlyZWd1bGF0
b3JfZGlzYWJsZShib2UtPmF2ZWUpOw0KIHBvd2Vyb2ZmYXZkZDoNCiAJcmVndWxhdG9yX2Rpc2Fi
bGUoYm9lLT5hdmRkKTsNCiBwb3dlcm9mZjF2ODoNCkBAIC01ODAsNiArNTg3LDI1IEBAIHN0YXRp
YyBpbnQgYm9lX3BhbmVsX3ByZXBhcmUoc3RydWN0IGRybV9wYW5lbCAqcGFuZWwpDQogCXJldHVy
biByZXQ7DQogfQ0KIA0KK3N0YXRpYyBpbnQgYm9lX3BhbmVsX3ByZXBhcmUoc3RydWN0IGRybV9w
YW5lbCAqcGFuZWwpDQorew0KKwlzdHJ1Y3QgYm9lX3BhbmVsICpib2UgPSB0b19ib2VfcGFuZWwo
cGFuZWwpOw0KKwlpbnQgcmV0Ow0KKw0KKwlpZiAoYm9lLT5wcmVwYXJlZCkNCisJCXJldHVybiAw
Ow0KKw0KKwlyZXQgPSBib2VfcGFuZWxfaW5pdF9kY3NfY21kKGJvZSk7DQorCWlmIChyZXQgPCAw
KSB7DQorCQlkZXZfZXJyKHBhbmVsLT5kZXYsICJmYWlsZWQgdG8gaW5pdCBwYW5lbDogJWRcbiIs
IHJldCk7DQorCQlyZXR1cm4gcmV0Ow0KKwl9DQorDQorCWJvZS0+cHJlcGFyZWQgPSB0cnVlOw0K
Kw0KKwlyZXR1cm4gMDsNCit9DQorDQogc3RhdGljIGludCBib2VfcGFuZWxfZW5hYmxlKHN0cnVj
dCBkcm1fcGFuZWwgKnBhbmVsKQ0KIHsNCiAJbXNsZWVwKDEzMCk7DQpAQCAtNzQ5LDcgKzc3NSw5
IEBAIHN0YXRpYyBpbnQgYm9lX3BhbmVsX2dldF9tb2RlcyhzdHJ1Y3QgZHJtX3BhbmVsICpwYW5l
bCwNCiANCiBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9wYW5lbF9mdW5jcyBib2VfcGFuZWxfZnVu
Y3MgPSB7DQogCS51bnByZXBhcmUgPSBib2VfcGFuZWxfdW5wcmVwYXJlLA0KKwkudW5wcmVwYXJl
X3Bvd2VyID0gYm9lX3BhbmVsX3VucHJlcGFyZV9wb3dlciwNCiAJLnByZXBhcmUgPSBib2VfcGFu
ZWxfcHJlcGFyZSwNCisJLnByZXBhcmVfcG93ZXIgPSBib2VfcGFuZWxfcHJlcGFyZV9wb3dlciwN
CiAJLmVuYWJsZSA9IGJvZV9wYW5lbF9lbmFibGUsDQogCS5nZXRfbW9kZXMgPSBib2VfcGFuZWxf
Z2V0X21vZGVzLA0KIH07DQotLSANCjIuMjUuMQ0K

