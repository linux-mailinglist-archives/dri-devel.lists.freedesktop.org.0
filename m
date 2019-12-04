Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB136112809
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 10:44:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 526C972B5C;
	Wed,  4 Dec 2019 09:44:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id C005472B34
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 09:44:45 +0000 (UTC)
X-UUID: 45b07bbb5c8f467d84a4d6058623ffde-20191204
X-UUID: 45b07bbb5c8f467d84a4d6058623ffde-20191204
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
 (envelope-from <bibby.hsieh@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1504589868; Wed, 04 Dec 2019 17:44:43 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 4 Dec 2019 17:44:26 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Wed, 4 Dec 2019 17:43:48 +0800
From: Bibby Hsieh <bibby.hsieh@mediatek.com>
To: David Airlie <airlied@linux.ie>, Matthias Brugger
 <matthias.bgg@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH v3 0/6] drm/mediatek: fix cursor issue and apply CMDQ in MTK
 DRM
Date: Wed, 4 Dec 2019 17:44:35 +0800
Message-ID: <20191204094441.5116-1-bibby.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=mediatek.com; s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=9c+0u2uq+nknwNcqDuJh0AzVEuM8VtGPxvy/e0XpUMc=; 
 b=IaiGs6c/JAPiiAMmQpc9h6PCnaSSZT6kFGXY38PuHS96pA3HEdFU/DRd8uI6qDXTKJT68LpV2hBH3hW2xDlBTnYRdRgIJLlYYWCx0v9vQzX03HO2krjUEvVIu4lK7cWXFyfcJl/2ctwniu4Zc7GCCWqcjCYTz21FNTH1GPVCVrs=;
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
aHdvcmsvcGF0Y2gvMTE1NDUxNy8pDQoNCkNoYW5nZXMgc2luY2UgdjI6DQogLSBtb3ZlIHNvbWUg
Y2hhbmdlcyB0byBhbm90aGVyIHBhdGNoDQogLSBkaXNhYmxlIGxheWVyIGluIGF0b21pY19kaXNh
YmxlKCkNCg0KQ2hhbmdlcyBzaW5jZSB2MToNCiAtIHJlbW92ZSByZWR1bmRhbnQgY29kZQ0KIC0g
bWVyZ2UgdGhlIGR1cGxpY2F0ZSBjb2RlDQogLSB1c2UgYXN5bmMgaW5zdGVhZCBvZiBjdXJzb3IN
Cg0KQ2hhbmdlcyBzaW5jZSB2MDoNCiAtIHJlbW92ZSByZWR1bmRhbnQgY29kZQ0KIC0gcmVtb3Zl
IHBhdGNoDQogICAiZHJtL21lZGlhdGVrOiBmaXggYXRvbWljX3N0YXRlIHJlZmVyZW5jZSBjb3Vu
dGluZyINCiAgIEFmdGVyIHJlbW92ZSB0aGlzIHBhdGNoLCB0aGUgaXNzdWUgd2UgbWV0IGJlZm9y
ZSBpcyBnb25lLg0KICAgU28gSSBkbyBub3QgYWRkIGFueSBleHRyYSBjb2RlIHRvIGRvIHNvbWV0
aGluZy4NCg0KQmliYnkgSHNpZWggKDYpOg0KICBkcm0vbWVkaWF0ZWs6IHVzZSBEUk0gY29yZSdz
IGF0b21pYyBjb21taXQgaGVscGVyDQogIGRybS9tZWRpYXRlazogaGFuZGxlIGV2ZW50cyB3aGVu
IGVuYWJsaW5nL2Rpc2FibGluZyBjcnRjDQogIGRybS9tZWRpYXRlazogdXBkYXRlIGN1cnNvcnMg
YnkgdXNpbmcgYXN5bmMgYXRvbWljIHVwZGF0ZQ0KICBkcm0vbWVkaWF0ZWs6IHJlbW92ZSB1bnVz
ZWQgZXh0ZXJuYWwgZnVuY3Rpb24NCiAgZHJtL21lZGlhdGVrOiBzdXBwb3J0IENNRFEgaW50ZXJm
YWNlIGluIGRkcCBjb21wb25lbnQNCiAgZHJtL21lZGlhdGVrOiBhcHBseSBDTURRIGNvbnRyb2wg
Zmxvdw0KDQogZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX2NvbG9yLmMgICB8ICAg
NyArLQ0KIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYyAgICAgfCAgNjcg
KysrKy0tLS0NCiBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfcmRtYS5jICAgIHwg
IDQzICsrLS0tDQogZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5jICAgICB8
IDE2OSArKysrKysrKysrKysrKysrLS0tLQ0KIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZHJtX2NydGMuaCAgICAgfCAgIDIgKw0KIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJt
X2RkcF9jb21wLmMgfCAxMzYgKysrKysrKysrKysrLS0tLQ0KIGRyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHJtX2RkcF9jb21wLmggfCAgNDcgKysrLS0tDQogZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19kcm1fZHJ2LmMgICAgICB8ICA4NiArLS0tLS0tLS0tDQogZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmggICAgICB8ICAgNyAtDQogZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kcm1fcGxhbmUuYyAgICB8ICA1MCArKysrKysNCiBkcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2RybV9wbGFuZS5oICAgIHwgICAyICsNCiAxMSBmaWxlcyBjaGFuZ2Vk
LCAzOTQgaW5zZXJ0aW9ucygrKSwgMjIyIGRlbGV0aW9ucygtKQ0KDQotLSANCjIuMTguMA0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
