Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6E6112810
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 10:45:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A61972B67;
	Wed,  4 Dec 2019 09:44:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id C523B72B53
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 09:44:47 +0000 (UTC)
X-UUID: 02123bff78ae46e7b293be369beb67bb-20191204
X-UUID: 02123bff78ae46e7b293be369beb67bb-20191204
Received: from mtkcas09.mediatek.inc [(172.21.101.178)] by
 mailgw01.mediatek.com (envelope-from <bibby.hsieh@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1598259957; Wed, 04 Dec 2019 17:44:44 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 4 Dec 2019 17:44:37 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Wed, 4 Dec 2019 17:43:48 +0800
From: Bibby Hsieh <bibby.hsieh@mediatek.com>
To: David Airlie <airlied@linux.ie>, Matthias Brugger
 <matthias.bgg@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH v3 2/6] drm/mediatek: handle events when enabling/disabling
 crtc
Date: Wed, 4 Dec 2019 17:44:37 +0800
Message-ID: <20191204094441.5116-3-bibby.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20191204094441.5116-1-bibby.hsieh@mediatek.com>
References: <20191204094441.5116-1-bibby.hsieh@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=mediatek.com; s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=wfbgAypWcJD8BoKp0RqiMZYqAeZg3ySAwC4T95RExtU=; 
 b=lJrr/ueupVz0WSkoDJlS95bYPJ7eU51g0D/wDusXx9gUdyDB6luLRFND2OY5/RXFgaSU0oAml0NT5V+VcYqOqWxwwqoCcKS7p4sgTiz0MtaAazHP286eoVbKFvw8hFxg1mgWGCFjBhv+E+d17E2esRd9rKQSC8xqVaeXBFg2Z/o=;
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
Cc: drinkcat@chromium.org, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, tfiga@chromium.org,
 Thierry Reding <thierry.reding@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGRyaXZlciBjdXJyZW50bHkgaGFuZGxlcyB2YmxhbmsgZXZlbnRzIG9ubHkgd2hlbiB1cGRh
dGluZyBwbGFuZXMgb24NCmFuIGFscmVhZHkgZW5hYmxlZCBDUlRDLiBUaGUgYXRvbWljIHVwZGF0
ZSBBUEkgaG93ZXZlciBhbGxvd3MgcmVxdWVzdGluZw0KYW4gZXZlbnQgd2hlbiBlbmFibGluZyBv
ciBkaXNhYmxpbmcgYSBDUlRDLiBUaGlzIGN1cnJlbnRseSBsZWFkcyB0bw0KZXZlbnQgb2JqZWN0
cyBiZWluZyBsZWFrZWQgaW4gdGhlIGtlcm5lbCBhbmQgdG8gZXZlbnRzIG5vdCBiZWluZyBzZW50
DQpvdXQuIEZpeCBpdC4NCg0KU2lnbmVkLW9mZi1ieTogQmliYnkgSHNpZWggPGJpYmJ5LmhzaWVo
QG1lZGlhdGVrLmNvbT4NClJldmlld2VkLWJ5OiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPg0K
LS0tDQogZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5jIHwgOCArKysrKysr
Kw0KIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykNCg0KZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHJtX2NydGMuYw0KaW5kZXggZjVlZWIwZWViZjc2Li40YmM1MjM0NjA5M2QgMTAw
NjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMNCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYw0KQEAgLTMzOCw2ICszMzgs
NyBAQCBzdGF0aWMgaW50IG10a19jcnRjX2RkcF9od19pbml0KHN0cnVjdCBtdGtfZHJtX2NydGMg
Km10a19jcnRjKQ0KIHN0YXRpYyB2b2lkIG10a19jcnRjX2RkcF9od19maW5pKHN0cnVjdCBtdGtf
ZHJtX2NydGMgKm10a19jcnRjKQ0KIHsNCiAJc3RydWN0IGRybV9kZXZpY2UgKmRybSA9IG10a19j
cnRjLT5iYXNlLmRldjsNCisJc3RydWN0IGRybV9jcnRjICpjcnRjID0gJm10a19jcnRjLT5iYXNl
Ow0KIAlpbnQgaTsNCiANCiAJRFJNX0RFQlVHX0RSSVZFUigiJXNcbiIsIF9fZnVuY19fKTsNCkBA
IC0zNjQsNiArMzY1LDEzIEBAIHN0YXRpYyB2b2lkIG10a19jcnRjX2RkcF9od19maW5pKHN0cnVj
dCBtdGtfZHJtX2NydGMgKm10a19jcnRjKQ0KIAkJbXRrX2RkcF9jb21wX3VucHJlcGFyZShtdGtf
Y3J0Yy0+ZGRwX2NvbXBbaV0pOw0KIA0KIAlwbV9ydW50aW1lX3B1dChkcm0tPmRldik7DQorDQor
CWlmIChjcnRjLT5zdGF0ZS0+ZXZlbnQgJiYgIWNydGMtPnN0YXRlLT5hY3RpdmUpIHsNCisJCXNw
aW5fbG9ja19pcnEoJmNydGMtPmRldi0+ZXZlbnRfbG9jayk7DQorCQlkcm1fY3J0Y19zZW5kX3Zi
bGFua19ldmVudChjcnRjLCBjcnRjLT5zdGF0ZS0+ZXZlbnQpOw0KKwkJY3J0Yy0+c3RhdGUtPmV2
ZW50ID0gTlVMTDsNCisJCXNwaW5fdW5sb2NrX2lycSgmY3J0Yy0+ZGV2LT5ldmVudF9sb2NrKTsN
CisJfQ0KIH0NCiANCiBzdGF0aWMgdm9pZCBtdGtfY3J0Y19kZHBfY29uZmlnKHN0cnVjdCBkcm1f
Y3J0YyAqY3J0YykNCi0tIA0KMi4xOC4wDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
