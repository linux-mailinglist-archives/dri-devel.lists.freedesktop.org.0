Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A850910F859
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 08:10:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14F7F6E3C4;
	Tue,  3 Dec 2019 07:10:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0A3D56E3B8
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 07:10:41 +0000 (UTC)
X-UUID: fd8c583ac3894792ad25a7da05373773-20191203
X-UUID: fd8c583ac3894792ad25a7da05373773-20191203
Received: from mtkmrs01.mediatek.inc [(172.21.131.159)] by
 mailgw02.mediatek.com (envelope-from <bibby.hsieh@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1119062967; Tue, 03 Dec 2019 15:10:38 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 3 Dec 2019 15:10:26 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Tue, 3 Dec 2019 15:10:19 +0800
From: Bibby Hsieh <bibby.hsieh@mediatek.com>
To: David Airlie <airlied@linux.ie>, Matthias Brugger
 <matthias.bgg@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH v2 0/6] drm/mediatek: fix cursor issue and apply CMDQ in MTK
 DRM
Date: Tue, 3 Dec 2019 15:10:30 +0800
Message-ID: <20191203071036.14158-1-bibby.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=mediatek.com; s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=RwR1gaBEERJeJ54o0Zn/3vUhZcwHLLvEJhQPdIaUvZQ=; 
 b=MvCeNJZofVnOCX6BdEvU3YCvEriFTgWH2Q360g0PwXWb4szdXfke83RCr9ifP6BuVoKFWVv03gxrmR97dLoLWLcxolwOaU5wS590yv/Kvra9ynfRMk+fGtECYiMJELECL0SoPem+YOMpwjAUVAX47YD0hR0dyHm+GoXyeJZNZVg=;
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

VGhlIENNRFEgKENvbW1hbmQgUXVldWUpIGluIE1UODE4MyBpcyB1c2VkIHRvIGhlbHAgdXBkYXRl
IGFsbA0KcmVsZXZhbnQgZGlzcGxheSBjb250cm9sbGVyIHJlZ2lzdGVycyB3aXRoIGNyaXRpY2Fs
IHRpbWUgbGltYXRpb24uDQpUaGlzIHBhdGNoIGFkZCBjbWRxIGludGVyZmFjZSBpbiBkZHBfY29t
cCBpbnRlcmZhY2UsIGxldCBhbGwNCmRkcF9jb21wIGludGVyZmFjZSBjYW4gc3VwcG9ydCBjcHUv
Y21kcSBmdW5jdGlvbiBhdCB0aGUgc2FtZSB0aW1lLg0KDQpUaGVzZSBwYXRjaGVzIGFsc28gY2Fu
IGZpeHVwIGN1cnNvciBtb3ZpbmcgaXMgbm90IHNtb290aA0Kd2hlbiBoZWF2eSBsb2FkIGluIHdl
YmdsLg0KDQpUaGlzIHBhdGNoIGRlcGVuZHMgb24gcHRhY2g6DQphZGQgZHJtIHN1cHBvcnQgZm9y
IE1UODE4Mw0KKGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvY292ZXIvMTExMjE1MTkvKQ0K
c3VwcG9ydCBnY2Ugb24gbXQ4MTgzIHBsYXRmb3JtDQooaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVs
Lm9yZy9jb3Zlci8xMTI1NTE0NykNCmRybS9tZWRpYXRlazogUmVmYWN0b3IgcGxhbmUgaW5pdC9j
aGVjayBhbmQgc3VwcG9ydCByb3RhdGlvbg0KKGh0dHBzOi8vcHctZW1lcmlsLmZyZWVkZXNrdG9w
Lm9yZy9zZXJpZXMvNjkwMTUvKQ0KZHJtL21lZGlhdGVrOiBDaGVjayByZXR1cm4gdmFsdWUgb2Yg
bXRrX2RybV9kZHBfY29tcF9mb3JfcGxhbmUNCihodHRwczovL2xvcmUua2VybmVsLm9yZy9wYXRj
aHdvcmsvcGF0Y2gvMTE1NDUxNy8pDQoNCkNoYW5nZXMgc2luY2UgdjE6DQogLSByZW1vdmUgcmVk
dW5kYW50IGNvZGUNCiAtIG1lcmdlIHRoZSBkdXBsaWNhdGUgY29kZQ0KIC0gdXNlIGFzeW5jIGlu
c3RlYWQgb2YgY3Vyc29yDQoNCkNoYW5nZXMgc2luY2UgdjA6DQogLSByZW1vdmUgcmVkdW5kYW50
IGNvZGUNCiAtIHJlbW92ZSBwYXRjaA0KICAgImRybS9tZWRpYXRlazogZml4IGF0b21pY19zdGF0
ZSByZWZlcmVuY2UgY291bnRpbmciDQogICBBZnRlciByZW1vdmUgdGhpcyBwYXRjaCwgdGhlIGlz
c3VlIHdlIG1ldCBiZWZvcmUgaXMgZ29uZS4NCiAgIFNvIEkgZG8gbm90IGFkZCBhbnkgZXh0cmEg
Y29kZSB0byBkbyBzb21ldGhpbmcuDQoNCg0KQmliYnkgSHNpZWggKDYpOg0KICBkcm0vbWVkaWF0
ZWs6IHVzZSBEUk0gY29yZSdzIGF0b21pYyBjb21taXQgaGVscGVyDQogIGRybS9tZWRpYXRlazog
aGFuZGxlIGV2ZW50cyB3aGVuIGVuYWJsaW5nL2Rpc2FibGluZyBjcnRjDQogIGRybS9tZWRpYXRl
azogdXBkYXRlIGN1cnNvcnMgYnkgdXNpbmcgYXN5bmMgYXRvbWljIHVwZGF0ZQ0KICBkcm0vbWVk
aWF0ZWs6IHJlbW92ZSB1bnVzZWQgZXh0ZXJuYWwgZnVuY3Rpb24NCiAgZHJtL21lZGlhdGVrOiBz
dXBwb3J0IENNRFEgaW50ZXJmYWNlIGluIGRkcCBjb21wb25lbnQNCiAgZHJtL21lZGlhdGVrOiBh
cHBseSBDTURRIGNvbnRyb2wgZmxvdw0KDQogZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
aXNwX2NvbG9yLmMgICB8ICAgNyArLQ0KIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlz
cF9vdmwuYyAgICAgfCAgNjcgKysrKy0tLS0NCiBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2Rpc3BfcmRtYS5jICAgIHwgIDQzICsrLS0tDQogZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kcm1fY3J0Yy5jICAgICB8IDE2OCArKysrKysrKysrKysrKysrLS0tLQ0KIGRyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuaCAgICAgfCAgIDIgKw0KIGRyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmMgfCAxMzYgKysrKysrKysrKysrLS0tLQ0KIGRy
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmggfCAgNDcgKysrLS0tDQog
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMgICAgICB8ICA4NiArLS0tLS0t
LS0tDQogZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmggICAgICB8ICAgNyAt
DQogZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fcGxhbmUuYyAgICB8ICA1MCArKysr
KysNCiBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9wbGFuZS5oICAgIHwgICAyICsN
CiAxMSBmaWxlcyBjaGFuZ2VkLCAzOTMgaW5zZXJ0aW9ucygrKSwgMjIyIGRlbGV0aW9ucygtKQ0K
DQotLSANCjIuMTguMA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
