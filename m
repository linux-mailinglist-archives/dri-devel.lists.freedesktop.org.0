Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4D440CF74
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 00:36:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD5D589F69;
	Wed, 15 Sep 2021 22:36:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id 282D089EB7
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Sep 2021 22:36:39 +0000 (UTC)
X-UUID: 328715b8918b48dab949af03ffe0e9cd-20210916
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=K4sUHrG9FiWJ+xXPyHc2Tp8+z7CI8TODSnKF0q/cGy8=; 
 b=n1C+DdpGIfY6udh15esBrHpS6NrMWpsoUFhSTrRK2gilDNySL8UmavPc18bTZBgGCrMPJiq7Rhfn6AJhjZ3p4O/pnFDnU3G9S0VbeXrdAVWqWRaiaesphk9HRFRjxhtPfH1FMo8vnoiFA7zl/wxk21w6fuo6UDF87Cph/7ZZsyE=;
X-UUID: 328715b8918b48dab949af03ffe0e9cd-20210916
Received: from mtkcas35.mediatek.inc [(172.27.5.253)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 691049152; Thu, 16 Sep 2021 06:31:31 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 16 Sep 2021 06:31:27 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Thu, 16 Sep 2021 06:31:27 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
CC: <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <ck.hu@mediatek.com>,
 <stonea168@163.com>, <huijuan.xie@mediatek.com>, <rex-bc.chen@mediatek.com>,
 <shuijing.li@mediatek.com>, Jitao Shi <jitao.shi@mediatek.com>
Subject: [PATCH v7 3/3] drm/bridge: anx7625: config hs packets end aligned to
 avoid screen shift
Date: Thu, 16 Sep 2021 06:31:17 +0800
Message-ID: <20210915223117.7857-4-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210915223117.7857-1-jitao.shi@mediatek.com>
References: <20210915223117.7857-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 1CBBB7F95158FC69DBD6EFE178D63E5FD6817AF989C525D5C38CD30A0E8D35B22000:8
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

VGhpcyBkZXZpY2UgcmVxdWlyZXMgdGhlIHBhY2tldHMgb24gbGFuZXMgYWxpZ25lZCBhdCB0aGUg
ZW5kIHRvIGZpeA0Kc2NyZWVuIHNoaWZ0IG9yIHNjcm9sbC4NCg0KU2lnbmVkLW9mZi1ieTogSml0
YW8gU2hpIDxqaXRhby5zaGlAbWVkaWF0ZWsuY29tPg0KLS0tDQogZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS9hbmFsb2dpeC9hbng3NjI1LmMgfCAxICsNCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKykNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW54
NzYyNS5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9hbng3NjI1LmMNCmluZGV4
IDE0ZDczZmIxZGQxNS4uZDc2ZmI2M2ZhOWY3IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2JyaWRnZS9hbmFsb2dpeC9hbng3NjI1LmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
YW5hbG9naXgvYW54NzYyNS5jDQpAQCAtMTMyNyw2ICsxMzI3LDcgQEAgc3RhdGljIGludCBhbng3
NjI1X2F0dGFjaF9kc2koc3RydWN0IGFueDc2MjVfZGF0YSAqY3R4KQ0KIAkJTUlQSV9EU0lfTU9E
RV9WSURFT19TWU5DX1BVTFNFCXwNCiAJCU1JUElfRFNJX01PREVfTk9fRU9UX1BBQ0tFVAl8DQog
CQlNSVBJX0RTSV9NT0RFX1ZJREVPX0hTRTsNCisJZHNpLT5oc19wYWNrZXRfZW5kX2FsaWduZWQg
PSB0cnVlOw0KIA0KIAlpZiAobWlwaV9kc2lfYXR0YWNoKGRzaSkgPCAwKSB7DQogCQlEUk1fREVW
X0VSUk9SKGRldiwgImZhaWwgdG8gYXR0YWNoIGRzaSB0byBob3N0LlxuIik7DQotLSANCjIuMjUu
MQ0K

