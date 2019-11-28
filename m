Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B132F10C282
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2019 03:43:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63ABB6E5F8;
	Thu, 28 Nov 2019 02:42:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id BD4F56E5EA
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2019 02:42:46 +0000 (UTC)
X-UUID: 76abfeb4e35846eaac3301e9b8d6294c-20191128
X-UUID: 76abfeb4e35846eaac3301e9b8d6294c-20191128
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by
 mailgw02.mediatek.com (envelope-from <bibby.hsieh@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 189081807; Thu, 28 Nov 2019 10:42:44 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 28 Nov 2019 10:42:13 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Thu, 28 Nov 2019 10:42:46 +0800
From: Bibby Hsieh <bibby.hsieh@mediatek.com>
To: David Airlie <airlied@linux.ie>, Matthias Brugger
 <matthias.bgg@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH v1 1/6] drm/mediatek: put "event" in critical section
Date: Thu, 28 Nov 2019 10:42:33 +0800
Message-ID: <20191128024238.9399-2-bibby.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20191128024238.9399-1-bibby.hsieh@mediatek.com>
References: <20191128024238.9399-1-bibby.hsieh@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: C415EC28D10D4D98CA7C3A32C93B685D07027E2639E1945941113FD2332F427D2000:8
X-MTK: N
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=mediatek.com; s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=0vCTXwJv2GLquxlzgk2gQwFIoM5oJce1MlX2/bKkJNM=; 
 b=iGsRTk0hlXIKkYRJHKjnT3BEismMYbiqiECs+a4wrWvhd6JsMftn4hdzeZirt/aTDnnffNgkza/cWiNLGPeyy7rxcsXosCYW0tMwn7q6cNJ17BGUs/86giuAEB8LfTJq/mjFXbomI9+II2zeubL7/eaQpGXjqkW7GsaMAQU9/CY=;
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

VGhlIHN0YXRlLT5iYXNlLmV2ZW50IHZhcmlhYmxlIHdvdWxkIGJlIGFjY2VzcyBieSB0aHJlYWQg
Y29udGV4dA0KaW4gbXRrX2RybV9jcnRjX2F0b21pY19iZWdpbigpIG9yIGJ5IGludGVycnVwdCBj
b250ZXh0IGluDQptdGtfZHJtX2NydGNfZmluaXNoX3BhZ2VfZmxpcCgpLCBzbyBlYWNoIHBhcnQg
c2hvdWxkIGJlIGEgY3JpdGljYWwNCnNlY3Rpb24uIEZpeCBpdC4NCg0KRml4ZXM6IDExOWY1MTcz
NjI4YSAoImRybS9tZWRpYXRlazogQWRkIERSTSBEcml2ZXIgZm9yIE1lZGlhdGVrIFNvQyBNVDgx
NzMuIikNCg0KU2lnbmVkLW9mZi1ieTogQmliYnkgSHNpZWggPGJpYmJ5LmhzaWVoQG1lZGlhdGVr
LmNvbT4NCi0tLQ0KIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYyB8IDMg
KysrDQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQ0KDQpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5jIGIvZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19kcm1fY3J0Yy5jDQppbmRleCAyOWQwNTgyZTkwZTkuLjcxZjQwODlhODExNyAx
MDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYw0KKysr
IGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5jDQpAQCAtNDgzLDEyICs0
ODMsMTUgQEAgc3RhdGljIHZvaWQgbXRrX2RybV9jcnRjX2F0b21pY19iZWdpbihzdHJ1Y3QgZHJt
X2NydGMgKmNydGMsDQogCWlmIChtdGtfY3J0Yy0+ZXZlbnQgJiYgc3RhdGUtPmJhc2UuZXZlbnQp
DQogCQlEUk1fRVJST1IoIm5ldyBldmVudCB3aGlsZSB0aGVyZSBpcyBzdGlsbCBhIHBlbmRpbmcg
ZXZlbnRcbiIpOw0KIA0KKwlzcGluX2xvY2tfaXJxKCZjcnRjLT5kZXYtPmV2ZW50X2xvY2spOw0K
IAlpZiAoc3RhdGUtPmJhc2UuZXZlbnQpIHsNCiAJCXN0YXRlLT5iYXNlLmV2ZW50LT5waXBlID0g
ZHJtX2NydGNfaW5kZXgoY3J0Yyk7DQogCQlXQVJOX09OKGRybV9jcnRjX3ZibGFua19nZXQoY3J0
YykgIT0gMCk7DQorCQlXQVJOX09OKG10a19jcnRjLT5ldmVudCk7DQogCQltdGtfY3J0Yy0+ZXZl
bnQgPSBzdGF0ZS0+YmFzZS5ldmVudDsNCiAJCXN0YXRlLT5iYXNlLmV2ZW50ID0gTlVMTDsNCiAJ
fQ0KKwlzcGluX3VubG9ja19pcnEoJmNydGMtPmRldi0+ZXZlbnRfbG9jayk7DQogfQ0KIA0KIHN0
YXRpYyB2b2lkIG10a19kcm1fY3J0Y19hdG9taWNfZmx1c2goc3RydWN0IGRybV9jcnRjICpjcnRj
LA0KLS0gDQoyLjE4LjANCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
