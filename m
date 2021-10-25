Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08639439D8C
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 19:24:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 000EC6E0D5;
	Mon, 25 Oct 2021 17:24:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id E7DA66E0D5
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 17:22:14 +0000 (UTC)
X-UUID: d64a063f3166418085dfc46272b90698-20211026
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=WElT1Lx8LbA8icMNDDxrAWleUDCbW6En04tUFvAKKaE=; 
 b=XLJwcASPFmt8n8yJBwHrr/R1lycEqRksKoA3+Kuug69tnU5k8ROpTQRuyynj4qkgNJCCLXiVUeEfhKfofKSm7qDSpM2l1pRTp+auCziFyL6h06jZGnKTy3jqwdeAoOfR+/vhvJrjjTkd9A2PxKUGKxNtuO/m9HA1qodtofcnTgE=;
X-UUID: d64a063f3166418085dfc46272b90698-20211026
Received: from mtkexhb02.mediatek.inc [(172.27.7.253)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1201599510; Tue, 26 Oct 2021 00:14:36 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 26 Oct 2021 00:14:35 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 26 Oct 2021 00:14:35 +0800
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
Subject: [PATCH v3 0/5] CMDQ refinement of Mediatek DRM driver
Date: Tue, 26 Oct 2021 00:14:29 +0800
Message-ID: <20211025161434.2641-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
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

VGhlc2UgcmVmaW5lbWVudHMgaW5jbHVkZSB1c2luZyBzdGFuZGFyZCBtYWlsYm94IGNhbGxiYWNr
IGludGVyZmFjZSwNCnRpbWVvdXQgZGV0ZWN0aW9uLCBhbmQgYSBmaXhlZCBjbWRxX2hhbmRsZS4N
Cg0KQ2hhbmdlIGluIHYzOg0KMS4gUmV2ZXJ0ICJkcm0vbWVkaWF0ZWs6IGNsZWFyIHBlbmRpbmcg
ZmxhZyB3aGVuIGNtZHEgcGFja2V0IGlzIGRvbmUiDQogICBhbmQgYWRkIGl0IGFmdGVyIHRoZSBD
TURRIHJlZmluZW1lbnQgcGF0aGVzLg0KMi4gQ2hhbmdlIHRoZSByZW1vdmUgb2Ygc3RydWN0IGNt
ZHFfY2xpZW50IHRvIHJlbW92ZSB0aGUgcG9pbnRlciBvZg0KICAgc3RydWN0IGNtZHFfY2xpZW50
Lg0KMy4gRml4IHBrdCBidWYgYWxsb2Mgb25jZSBidXQgZnJlZSBtYW55IHRpbWVzLg0KDQpDaGFu
Z2VzIGluIHYyOg0KMS4gRGVmaW5lIG10a19kcm1fY21kcV9wa3RfY3JlYXRlKCkgYW5kIG10a19k
cm1fY21kcV9wa3RfZGVzdHJveSgpDQogICB3aGVuIENPTkZJR19NVEtfQ01EUSBpcyByZWFjaGFi
bGUuDQoNCkNodW4tS3VhbmcgSHUgKDQpOg0KICBkcm0vbWVkaWF0ZWs6IFVzZSBtYWlsYm94IHJ4
X2NhbGxiYWNrIGluc3RlYWQgb2YgY21kcV90YXNrX2NiDQogIGRybS9tZWRpYXRlazogUmVtb3Zl
IHRoZSBwb2ludGVyIG9mIHN0cnVjdCBjbWRxX2NsaWVudA0KICBkcm0vbWVkaWF0ZWs6IERldGVj
dCBDTURRIGV4ZWN1dGlvbiB0aW1lb3V0DQogIGRybS9tZWRpYXRlazogQWRkIGNtZHFfaGFuZGxl
IGluIG10a19jcnRjDQoNCllvbmdxaWFuZyBOaXUgKDEpOg0KICBkcm0vbWVkaWF0ZWs6IGNsZWFy
IHBlbmRpbmcgZmxhZyB3aGVuIGNtZHEgcGFja2V0IGlzIGRvbmUuDQoNCiBkcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMgfCAxNzEgKysrKysrKysrKysrKysrKysrKystLS0t
DQogMSBmaWxlIGNoYW5nZWQsIDE0NyBpbnNlcnRpb25zKCspLCAyNCBkZWxldGlvbnMoLSkNCg0K
LS0gDQoyLjE4LjANCg==

