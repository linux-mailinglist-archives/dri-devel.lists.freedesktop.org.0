Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 712F0439C0D
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 18:48:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B815D89E9B;
	Mon, 25 Oct 2021 16:48:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3B45789E9B
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 16:46:45 +0000 (UTC)
X-UUID: f2c475db3da0402fb6361c90c782cba9-20211026
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=4LdtB6wZbt4FH3119IIp3MaemJ/vnPtBQ+w2XS+88rM=; 
 b=tkeqXzK5k2m2hoaiss7PwpkFZ+qfZ6djRBUwnvodHSPN22ZZTmeqpAaLN6K+4IkgjsjU0zpnFZhI1qFv9duMiG+rqoAwo7PpjTTTYqukexYZm63Lo2CZV04iAmnwGe5V9LXoAI1FiiajFZ8O3j5X5eC8if25CyubSmWGOyyhYV0=;
X-UUID: f2c475db3da0402fb6361c90c782cba9-20211026
Received: from mtkmbs10n2.mediatek.inc [(172.27.4.253)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 2094163715; Tue, 26 Oct 2021 00:15:24 +0800
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 26 Oct 2021 00:14:37 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 26 Oct 2021 00:14:36 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 26 Oct 2021 00:14:36 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, "Jassi
 Brar" <jassisinghbrar@gmail.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>
CC: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <hsinyi@chromium.org>, <fshao@chromium.org>, <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>
Subject: [PATCH v3 5/5] drm/mediatek: clear pending flag when cmdq packet is
 done.
Date: Tue, 26 Oct 2021 00:14:34 +0800
Message-ID: <20211025161434.2641-6-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211025161434.2641-1-jason-jh.lin@mediatek.com>
References: <20211025161434.2641-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
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

RnJvbTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+DQoNCkluIGNt
ZHEgbW9kZSwgcGFja2V0IG1heSBiZSBmbHVzaGVkIGJlZm9yZSBpdCBpcyBleGVjdXRlZCwgc28N
CnRoZSBwZW5kaW5nIGZsYWcgc2hvdWxkIGJlIGNsZWFyZWQgYWZ0ZXIgY21kcSBwYWNrZXQgaXMg
ZG9uZS4NCg0KU2lnbmVkLW9mZi1ieTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRp
YXRlay5jb20+DQpTaWduZWQtb2ZmLWJ5OiBqYXNvbi1qaC5saW4gPGphc29uLWpoLmxpbkBtZWRp
YXRlay5jb20+DQotLS0NCiBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMg
fCA1MSArKysrKysrKysrKysrKysrKysrKysrLS0tDQogMSBmaWxlIGNoYW5nZWQsIDQ2IGluc2Vy
dGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Ry
bV9jcnRjLmMNCmluZGV4IGMyMDRmY2UyZmViZS4uYmMzYmU0OGU2YjIzIDEwMDY0NA0KLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5jDQorKysgYi9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMNCkBAIC0yNzUsOCArMjc1LDQyIEBAIHN0YXRp
YyBpbnQgbXRrX2RybV9jbWRxX3BrdF9jcmVhdGUoc3RydWN0IGNtZHFfY2xpZW50ICpjbGllbnQs
IHN0cnVjdCBjbWRxX3BrdCAqDQogDQogc3RhdGljIHZvaWQgZGRwX2NtZHFfY2Ioc3RydWN0IG1i
b3hfY2xpZW50ICpjbCwgdm9pZCAqbXNzZykNCiB7DQorCXN0cnVjdCBjbWRxX2NiX2RhdGEgKmRh
dGEgPSBtc3NnOw0KIAlzdHJ1Y3QgY21kcV9jbGllbnQgKmNtZHFfY2wgPSBjb250YWluZXJfb2Yo
Y2wsIHN0cnVjdCBjbWRxX2NsaWVudCwgY2xpZW50KTsNCiAJc3RydWN0IG10a19kcm1fY3J0YyAq
bXRrX2NydGMgPSBjb250YWluZXJfb2YoY21kcV9jbCwgc3RydWN0IG10a19kcm1fY3J0YywgY21k
cV9jbGllbnQpOw0KKwlzdHJ1Y3QgbXRrX2NydGNfc3RhdGUgKnN0YXRlOw0KKwl1bnNpZ25lZCBp
bnQgaTsNCisNCisJaWYgKGRhdGEtPnN0YSA8IDApDQorCQlyZXR1cm47DQorDQorCXN0YXRlID0g
dG9fbXRrX2NydGNfc3RhdGUobXRrX2NydGMtPmJhc2Uuc3RhdGUpOw0KKw0KKwlzdGF0ZS0+cGVu
ZGluZ19jb25maWcgPSBmYWxzZTsNCisNCisJaWYgKG10a19jcnRjLT5wZW5kaW5nX3BsYW5lcykg
ew0KKwkJZm9yIChpID0gMDsgaSA8IG10a19jcnRjLT5sYXllcl9ucjsgaSsrKSB7DQorCQkJc3Ry
dWN0IGRybV9wbGFuZSAqcGxhbmUgPSAmbXRrX2NydGMtPnBsYW5lc1tpXTsNCisJCQlzdHJ1Y3Qg
bXRrX3BsYW5lX3N0YXRlICpwbGFuZV9zdGF0ZTsNCisNCisJCQlwbGFuZV9zdGF0ZSA9IHRvX210
a19wbGFuZV9zdGF0ZShwbGFuZS0+c3RhdGUpOw0KKw0KKwkJCXBsYW5lX3N0YXRlLT5wZW5kaW5n
LmNvbmZpZyA9IGZhbHNlOw0KKwkJfQ0KKwkJbXRrX2NydGMtPnBlbmRpbmdfcGxhbmVzID0gZmFs
c2U7DQorCX0NCisNCisJaWYgKG10a19jcnRjLT5wZW5kaW5nX2FzeW5jX3BsYW5lcykgew0KKwkJ
Zm9yIChpID0gMDsgaSA8IG10a19jcnRjLT5sYXllcl9ucjsgaSsrKSB7DQorCQkJc3RydWN0IGRy
bV9wbGFuZSAqcGxhbmUgPSAmbXRrX2NydGMtPnBsYW5lc1tpXTsNCisJCQlzdHJ1Y3QgbXRrX3Bs
YW5lX3N0YXRlICpwbGFuZV9zdGF0ZTsNCisNCisJCQlwbGFuZV9zdGF0ZSA9IHRvX210a19wbGFu
ZV9zdGF0ZShwbGFuZS0+c3RhdGUpOw0KKw0KKwkJCXBsYW5lX3N0YXRlLT5wZW5kaW5nLmFzeW5j
X2NvbmZpZyA9IGZhbHNlOw0KKwkJfQ0KKwkJbXRrX2NydGMtPnBlbmRpbmdfYXN5bmNfcGxhbmVz
ID0gZmFsc2U7DQorCX0NCiANCiAJbXRrX2NydGMtPmNtZHFfdmJsYW5rX2NudCA9IDA7DQogfQ0K
QEAgLTQzMiw3ICs0NjYsOCBAQCBzdGF0aWMgdm9pZCBtdGtfY3J0Y19kZHBfY29uZmlnKHN0cnVj
dCBkcm1fY3J0YyAqY3J0YywNCiAJCQkJICAgIHN0YXRlLT5wZW5kaW5nX3ZyZWZyZXNoLCAwLA0K
IAkJCQkgICAgY21kcV9oYW5kbGUpOw0KIA0KLQkJc3RhdGUtPnBlbmRpbmdfY29uZmlnID0gZmFs
c2U7DQorCQlpZiAoIWNtZHFfaGFuZGxlKQ0KKwkJCXN0YXRlLT5wZW5kaW5nX2NvbmZpZyA9IGZh
bHNlOw0KIAl9DQogDQogCWlmIChtdGtfY3J0Yy0+cGVuZGluZ19wbGFuZXMpIHsNCkBAIC00NTIs
OSArNDg3LDEyIEBAIHN0YXRpYyB2b2lkIG10a19jcnRjX2RkcF9jb25maWcoc3RydWN0IGRybV9j
cnRjICpjcnRjLA0KIAkJCQltdGtfZGRwX2NvbXBfbGF5ZXJfY29uZmlnKGNvbXAsIGxvY2FsX2xh
eWVyLA0KIAkJCQkJCQkgIHBsYW5lX3N0YXRlLA0KIAkJCQkJCQkgIGNtZHFfaGFuZGxlKTsNCi0J
CQlwbGFuZV9zdGF0ZS0+cGVuZGluZy5jb25maWcgPSBmYWxzZTsNCisJCQlpZiAoIWNtZHFfaGFu
ZGxlKQ0KKwkJCQlwbGFuZV9zdGF0ZS0+cGVuZGluZy5jb25maWcgPSBmYWxzZTsNCiAJCX0NCi0J
CW10a19jcnRjLT5wZW5kaW5nX3BsYW5lcyA9IGZhbHNlOw0KKw0KKwkJaWYgKCFjbWRxX2hhbmRs
ZSkNCisJCQltdGtfY3J0Yy0+cGVuZGluZ19wbGFuZXMgPSBmYWxzZTsNCiAJfQ0KIA0KIAlpZiAo
bXRrX2NydGMtPnBlbmRpbmdfYXN5bmNfcGxhbmVzKSB7DQpAQCAtNDc0LDkgKzUxMiwxMiBAQCBz
dGF0aWMgdm9pZCBtdGtfY3J0Y19kZHBfY29uZmlnKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywNCiAJ
CQkJbXRrX2RkcF9jb21wX2xheWVyX2NvbmZpZyhjb21wLCBsb2NhbF9sYXllciwNCiAJCQkJCQkJ
ICBwbGFuZV9zdGF0ZSwNCiAJCQkJCQkJICBjbWRxX2hhbmRsZSk7DQotCQkJcGxhbmVfc3RhdGUt
PnBlbmRpbmcuYXN5bmNfY29uZmlnID0gZmFsc2U7DQorCQkJaWYgKCFjbWRxX2hhbmRsZSkNCisJ
CQkJcGxhbmVfc3RhdGUtPnBlbmRpbmcuYXN5bmNfY29uZmlnID0gZmFsc2U7DQogCQl9DQotCQlt
dGtfY3J0Yy0+cGVuZGluZ19hc3luY19wbGFuZXMgPSBmYWxzZTsNCisNCisJCWlmICghY21kcV9o
YW5kbGUpDQorCQkJbXRrX2NydGMtPnBlbmRpbmdfYXN5bmNfcGxhbmVzID0gZmFsc2U7DQogCX0N
CiB9DQogDQotLSANCjIuMTguMA0K

