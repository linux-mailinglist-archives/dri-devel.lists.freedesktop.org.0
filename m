Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C1710C280
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2019 03:43:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7CC26E5EF;
	Thu, 28 Nov 2019 02:42:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id 61F0C6E038
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2019 02:42:44 +0000 (UTC)
X-UUID: 0688d35b088f4a7b8ee31327d0567410-20191128
X-UUID: 0688d35b088f4a7b8ee31327d0567410-20191128
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
 (envelope-from <bibby.hsieh@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 819091257; Thu, 28 Nov 2019 10:42:42 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 28 Nov 2019 10:42:28 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Thu, 28 Nov 2019 10:42:45 +0800
From: Bibby Hsieh <bibby.hsieh@mediatek.com>
To: David Airlie <airlied@linux.ie>, Matthias Brugger
 <matthias.bgg@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH v1 0/6] drm/mediatek: fix cursor issue and apply CMDQ in
Date: Thu, 28 Nov 2019 10:42:32 +0800
Message-ID: <20191128024238.9399-1-bibby.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=mediatek.com; s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=oHZC5icCH5/wMlvpWjG0WjAvOh0Af+uvtWMpfg0PxOw=; 
 b=ez+4GEyULaJkqHYk9IA+WzOQRwpYrzeuk40EgDmL5i/k6/KYQOj/9uiDJzxKW4wgLSRaPJC2pO8vHi3lXV06VHQmDxjpNezW8MpLdBxm7VrXWdPjz2AQ6D1+9IWPtXp/jBUeq6TAdubdAxvrPObIcjT+wQ2bdcyH3iT1rg4YYNg=;
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
aHdvcmsvcGF0Y2gvMTE1NDUxNy8pDQoNCkNoYW5nZXMgc2luY2UgdjA6DQogLSByZW1vdmUgcmVk
dW5kYW50IGNvZGUNCiAtIHJlbW92ZSBwYXRjaA0KICAgImRybS9tZWRpYXRlazogZml4IGF0b21p
Y19zdGF0ZSByZWZlcmVuY2UgY291bnRpbmciDQogICBBZnRlciByZW1vdmUgdGhpcyBwYXRjaCwg
dGhlIGlzc3VlIHdlIG1ldCBiZWZvcmUgaXMgZ29uZS4NCiAgIFNvIEkgZG8gbm90IGFkZCBhbnkg
ZXh0cmEgY29kZSB0byBkbyBzb21ldGhpbmcuDQoNCkJpYmJ5IEhzaWVoICg2KToNCiAgZHJtL21l
ZGlhdGVrOiBwdXQgImV2ZW50IiBpbiBjcml0aWNhbCBzZWN0aW9uDQogIGRybS9tZWRpYXRlazog
dXNlIERSTSBjb3JlJ3MgYXRvbWljIGNvbW1pdCBoZWxwZXINCiAgZHJtL21lZGlhdGVrOiBoYW5k
bGUgZXZlbnRzIHdoZW4gZW5hYmxpbmcvZGlzYWJsaW5nIGNydGMNCiAgZHJtL21lZGlhdGVrOiB1
cGRhdGUgY3Vyc29ycyBieSB1c2luZyBhc3luYyBhdG9taWMgdXBkYXRlDQogIGRybS9tZWRpYXRl
azogc3VwcG9ydCBDTURRIGludGVyZmFjZSBpbiBkZHAgY29tcG9uZW50DQogIGRybS9tZWRpYXRl
azogYXBwbHkgQ01EUSBjb250cm9sIGZsb3cNCg0KIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZGlzcF9jb2xvci5jICAgfCAgIDcgKy0NCiBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2Rpc3Bfb3ZsLmMgICAgIHwgIDY1ICsrKysrLS0tLQ0KIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfZGlzcF9yZG1hLmMgICAgfCAgNDMgKysrLS0tDQogZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kcm1fY3J0Yy5jICAgICB8IDEzOSArKysrKysrKysrKysrKysrKy0NCiBkcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmggICAgIHwgICAyICsNCiBkcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5jIHwgMTUxICsrKysrKysrKysrKysrKy0t
LS0tDQogZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuaCB8ICA1NSAr
KysrLS0tDQogZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMgICAgICB8ICA5
NiArKystLS0tLS0tLS0tDQogZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2Lmgg
ICAgICB8ICAgOSArLQ0KIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX3BsYW5lLmMg
ICAgfCAgNTAgKysrKysrKw0KIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX3BsYW5l
LmggICAgfCAgIDIgKw0KIDExIGZpbGVzIGNoYW5nZWQsIDQyMyBpbnNlcnRpb25zKCspLCAxOTYg
ZGVsZXRpb25zKC0pDQoNCi0tIA0KMi4xOC4wDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
