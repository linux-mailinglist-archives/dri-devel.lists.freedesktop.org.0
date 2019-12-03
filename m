Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F71A10F85B
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 08:10:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4F496E3BB;
	Tue,  3 Dec 2019 07:10:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id BB5836E3B5
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 07:10:41 +0000 (UTC)
X-UUID: 0c0762a80d214397bcc0e652d3238e29-20191203
X-UUID: 0c0762a80d214397bcc0e652d3238e29-20191203
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
 (envelope-from <bibby.hsieh@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 712491289; Tue, 03 Dec 2019 15:10:39 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 3 Dec 2019 15:10:22 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Tue, 3 Dec 2019 15:10:20 +0800
From: Bibby Hsieh <bibby.hsieh@mediatek.com>
To: David Airlie <airlied@linux.ie>, Matthias Brugger
 <matthias.bgg@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH v2 2/6] drm/mediatek: handle events when enabling/disabling
 crtc
Date: Tue, 3 Dec 2019 15:10:32 +0800
Message-ID: <20191203071036.14158-3-bibby.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20191203071036.14158-1-bibby.hsieh@mediatek.com>
References: <20191203071036.14158-1-bibby.hsieh@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=mediatek.com; s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=E3WWij+MiWDFEiYV731J6/aLSHz2tHaD2rV3Nhtiehs=; 
 b=ozCIte92qSd0JEtjoRPX35Qm/Qi9SlKJXBkuSIUhI+0gG1rh6kSQPnP+mwyKg3hDTs0COAw9s32Paynw11eRnO2ohoC6vVxETJaPFM8M5Nd63AIYiBvm4JFKBh5SQsiChAXr6Rwk/EbMR3LAG6HDkKWhEuupDUG145OZFB18I74=;
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
YXRlay9tdGtfZHJtX2NydGMuYw0KaW5kZXggMjlkMDU4MmU5MGU5Li40YzI1YWQyMTgyYjAgMTAw
NjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMNCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYw0KQEAgLTMzNCw2ICszMzQs
NyBAQCBzdGF0aWMgaW50IG10a19jcnRjX2RkcF9od19pbml0KHN0cnVjdCBtdGtfZHJtX2NydGMg
Km10a19jcnRjKQ0KIHN0YXRpYyB2b2lkIG10a19jcnRjX2RkcF9od19maW5pKHN0cnVjdCBtdGtf
ZHJtX2NydGMgKm10a19jcnRjKQ0KIHsNCiAJc3RydWN0IGRybV9kZXZpY2UgKmRybSA9IG10a19j
cnRjLT5iYXNlLmRldjsNCisJc3RydWN0IGRybV9jcnRjICpjcnRjID0gJm10a19jcnRjLT5iYXNl
Ow0KIAlpbnQgaTsNCiANCiAJRFJNX0RFQlVHX0RSSVZFUigiJXNcbiIsIF9fZnVuY19fKTsNCkBA
IC0zNTcsNiArMzU4LDEzIEBAIHN0YXRpYyB2b2lkIG10a19jcnRjX2RkcF9od19maW5pKHN0cnVj
dCBtdGtfZHJtX2NydGMgKm10a19jcnRjKQ0KIAltdGtfZGlzcF9tdXRleF91bnByZXBhcmUobXRr
X2NydGMtPm11dGV4KTsNCiANCiAJcG1fcnVudGltZV9wdXQoZHJtLT5kZXYpOw0KKw0KKwlpZiAo
Y3J0Yy0+c3RhdGUtPmV2ZW50ICYmICFjcnRjLT5zdGF0ZS0+YWN0aXZlKSB7DQorCQlzcGluX2xv
Y2tfaXJxKCZjcnRjLT5kZXYtPmV2ZW50X2xvY2spOw0KKwkJZHJtX2NydGNfc2VuZF92Ymxhbmtf
ZXZlbnQoY3J0YywgY3J0Yy0+c3RhdGUtPmV2ZW50KTsNCisJCWNydGMtPnN0YXRlLT5ldmVudCA9
IE5VTEw7DQorCQlzcGluX3VubG9ja19pcnEoJmNydGMtPmRldi0+ZXZlbnRfbG9jayk7DQorCX0N
CiB9DQogDQogc3RhdGljIHZvaWQgbXRrX2NydGNfZGRwX2NvbmZpZyhzdHJ1Y3QgZHJtX2NydGMg
KmNydGMpDQotLSANCjIuMTguMA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
