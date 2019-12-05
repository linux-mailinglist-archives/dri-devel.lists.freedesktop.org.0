Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A24AD113DE1
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2019 10:28:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84A0E6F617;
	Thu,  5 Dec 2019 09:27:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id ADEBC6F60E
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2019 09:27:55 +0000 (UTC)
X-UUID: b1466d2943124a3084fad19447f88ba3-20191205
X-UUID: b1466d2943124a3084fad19447f88ba3-20191205
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by
 mailgw01.mediatek.com (envelope-from <bibby.hsieh@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1179283622; Thu, 05 Dec 2019 17:27:51 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 5 Dec 2019 17:27:44 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Thu, 5 Dec 2019 17:26:52 +0800
From: Bibby Hsieh <bibby.hsieh@mediatek.com>
To: David Airlie <airlied@linux.ie>, Matthias Brugger
 <matthias.bgg@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH v4 4/7] drm/mediatek: disable all the planes in atomic_disable
Date: Thu, 5 Dec 2019 17:27:46 +0800
Message-ID: <20191205092749.4021-5-bibby.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20191205092749.4021-1-bibby.hsieh@mediatek.com>
References: <20191205092749.4021-1-bibby.hsieh@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=mediatek.com; s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=3o3Wfx+85Ct3d0biiPy/482nOLIBAS/s4EBtF+buL3o=; 
 b=pwV7PxrHWQNubFymaeRFO42LW0Qb718AbtIcEpYF3i2SRUmf6TMZ3FpX/NG9pzGnaFWjE+EzeBy2uwl86woj6ehq4IAfS8RIwONE34VCRnEJ85ITOx7uaHaTLA2LkhCGApQrgxzId2t89x14rhySYoY+LF3D/zFuHVLI5xTcwO8=;
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

VW5kZXIgc2hhZG93IHJlZ2lzdGVyIGNhc2UsIHdlIGRvIG5vdCBkaXNhYmxlIGFsbCB0aGUgcGxh
bmUgYmVmb3JlDQpkaXNhYmxlIGFsbCB0aGUgaGFyZHdhcmVzLiBGaXggaXQuDQoNClNpZ25lZC1v
ZmYtYnk6IEJpYmJ5IEhzaWVoIDxiaWJieS5oc2llaEBtZWRpYXRlay5jb20+DQotLS0NCiBkcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMgfCAxICsNCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKykNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfZHJtX2NydGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMu
Yw0KaW5kZXggZTg4N2E2ODc3YmNkLi5lNDBjOGNmN2Q3NGYgMTAwNjQ0DQotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZHJtX2NydGMuYw0KQEAgLTU1MCw2ICs1NTAsNyBAQCBzdGF0aWMgdm9pZCBt
dGtfZHJtX2NydGNfYXRvbWljX2Rpc2FibGUoc3RydWN0IGRybV9jcnRjICpjcnRjLA0KIAl9DQog
CW10a19jcnRjLT5wZW5kaW5nX3BsYW5lcyA9IHRydWU7DQogDQorCW10a19kcm1fY3J0Y19od19j
b25maWcobXRrX2NydGMpOw0KIAkvKiBXYWl0IGZvciBwbGFuZXMgdG8gYmUgZGlzYWJsZWQgKi8N
CiAJZHJtX2NydGNfd2FpdF9vbmVfdmJsYW5rKGNydGMpOw0KIA0KLS0gDQoyLjE4LjANCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
