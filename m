Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0029D40CF72
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 00:36:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D72989F0B;
	Wed, 15 Sep 2021 22:36:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 301 seconds by postgrey-1.36 at gabe;
 Wed, 15 Sep 2021 22:36:38 UTC
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id 810AA89EB7
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Sep 2021 22:36:38 +0000 (UTC)
X-UUID: f3196c0ae63f4b62806365649775f9df-20210916
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=wd4AHgRylyyah26OepnTFpZldLYrIb0DmjPk2ihhdak=; 
 b=TIuaieUwd0oD14bV/ChZMbED+oJn67CUmwXf1hyJlun23wR0g+BfUpiTdv8wgQQrBLzv9DSQduD9sMmNCWJW0S0C3JzJCQ1yNe671zxOWbIFC7DyaA6UNf9ShelJEuJFfghEgP25uQ4X97CwR9LrnRW8Joy6FmqXYmC5cEJEnBw=;
X-UUID: f3196c0ae63f4b62806365649775f9df-20210916
Received: from mtkcas32.mediatek.inc [(172.27.7.253)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 985539400; Thu, 16 Sep 2021 06:31:32 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 16 Sep 2021 06:31:25 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Thu, 16 Sep 2021 06:31:24 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
CC: <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <ck.hu@mediatek.com>,
 <stonea168@163.com>, <huijuan.xie@mediatek.com>, <rex-bc.chen@mediatek.com>,
 <shuijing.li@mediatek.com>, Jitao Shi <jitao.shi@mediatek.com>
Subject: [PATCH v7 0/3] force hsa hbp hfp packets multiple of lanenum to avoid
 screen shift
Date: Thu, 16 Sep 2021 06:31:14 +0800
Message-ID: <20210915223117.7857-1-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 101387587980953D686CCAE49E93230E7C3CB646B0F487D43AC92405D5FD9DC02000:8
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

Q2hhbmdlcyBzaW5jZSB2NjoNCiAtIEFkZCAiYm9vbCBoc19wYWNrZXRfZW5kX2FsaWduZWQiIGlu
ICJzdHJ1Y3QgbWlwaV9kc2lfZGV2aWNlIiB0byBjb250cm9sIHRoZSBkc2kgYWxpZ25lZC4NCiAt
IENvbmZpZyB0aGUgImhzX3BhY2tldF9lbmRfYWxpZ25lZCIgaW4gQU5YNzcyNSAuYXR0YWNoKCku
DQoNCkNoYW5nZXMgc2luY2UgdjU6DQogLSBTZWFyY2ggdGhlIGFueDc2MjUgY29tcGF0aWJsZSBh
cyBmbGFnIHRvIGNvbnRyb2wgZHNpIG91dHB1dCBhbGlnbmVkLg0KDQpDaGFuZ2VzIHNpbmNlIHY0
Og0KIC0gTW92ZSAiZHQtYmluZGluZ3M6IGRybS9icmlkZ2U6IGFueDc2MjU6IGFkZCBmb3JjZV9k
c2lfZW5kX3dpdGhvdXRfbnVsbCIgYmVmb3JlDQogICAiZHJtL21lZGlhdGVrOiBmb3JjZSBoc2Eg
aGJwIGhmcCBwYWNrZXRzIG11bHRpcGxlIG9mIGxhbmVudW0gdG8gYXZvaWQiLg0KDQogLSBSZXRp
dGxlICJkdC1iaW5kaW5nczogZHJtL2JyaWRnZTogYW54NzYyNTogYWRkIGZvcmNlX2RzaV9lbmRf
d2l0aG91dF9udWxsIi4NCg0KSml0YW8gU2hpICgzKToNCiAgZHJtL2RzaTogdHJhbnNlciBkc2kg
aHMgcGFja2V0IGFsaWduZWQNCiAgZHJtL21lZGlhdGVrOiBpbXBsbWVudCB0aGUgZHNpIGhzIHBh
Y2tldHMgYWxpZ25lZA0KICBkcm0vYnJpZGdlOiBhbng3NjI1OiBjb25maWcgaHMgcGFja2V0cyBl
bmQgYWxpZ25lZCB0byBhdm9pZCBzY3JlZW4NCiAgICBzaGlmdA0KDQogZHJpdmVycy9ncHUvZHJt
L2JyaWRnZS9hbmFsb2dpeC9hbng3NjI1LmMgfCAgMSArDQogZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kc2kuYyAgICAgICAgfCAxMCArKysrKysrKysrDQogaW5jbHVkZS9kcm0vZHJtX21p
cGlfZHNpLmggICAgICAgICAgICAgICAgfCAgMiArKw0KIDMgZmlsZXMgY2hhbmdlZCwgMTMgaW5z
ZXJ0aW9ucygrKQ0KDQotLSANCjIuMjUuMQ0K

