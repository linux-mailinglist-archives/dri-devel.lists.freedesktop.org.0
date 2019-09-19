Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 823A2B739D
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2019 08:58:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CE5F6F77D;
	Thu, 19 Sep 2019 06:58:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id A6FB26F77D
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 06:58:45 +0000 (UTC)
X-UUID: ac7d909c85ea4f26a8f1980efecd237e-20190919
X-UUID: ac7d909c85ea4f26a8f1980efecd237e-20190919
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 1547420039; Thu, 19 Sep 2019 14:58:40 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS33DR.mediatek.inc
 (172.27.6.106) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Thu, 19 Sep 2019 14:58:36 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (172.27.4.253) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Thu, 19 Sep 2019 14:58:35 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v7 3/9] drm/mediatek: replace writeb() with mtk_dsi_mask()
Date: Thu, 19 Sep 2019 14:58:00 +0800
Message-ID: <20190919065806.111016-4-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190919065806.111016-1-jitao.shi@mediatek.com>
References: <20190919065806.111016-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-AS-Product-Ver: SMEX-12.5.0.1684-8.5.1010-24920.005
X-TM-AS-Result: No-6.079800-8.000000-10
X-TMASE-MatchedRID: k/L/ofNtQd07cRSju2zlXqMY62qeQBkLy733NwuklsIy/xh6GqNHVWMg
 VHfStGn65UUUZCVUbO+bHAuQ1dUnuWJZXQNDzktSGjzBgnFZvQ6CxYB2hPS4vSS30GKAkBxW7fK
 xaM2xqkBHHd35tBrozO9EJt2F5OksHxPMjOKY7A/QLWxBF9DMQcRB0bsfrpPIfiAqrjYtFiQcos
 wtc7gt2g2WiK0Y4tZwxJbqWiccMa7tCocc2G1Lq37cGd19dSFd
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--6.079800-8.000000
X-TMASE-Version: SMEX-12.5.0.1684-8.5.1010-24920.005
X-TM-SNTS-SMTP: 467409EFD92600159E2DB5F3B02363269D1CE4BE3B660A29B3D1A6361BF09E7A2000:8
X-MTK: N
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
Cc: Jitao Shi <jitao.shi@mediatek.com>, srv_heupstream@mediatek.com,
 stonea168@163.com, cawa.cheng@mediatek.com, sj.huang@mediatek.com,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 yingjoe.chen@mediatek.com, eddie.huang@mediatek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHdyaXRlYigpIGlzIHVuYXZhaWxhYmxlIGluIG10ODE3My4gQmVjYXVzZSB0aGUgbXQ4MTcz
IGRzaSBtb2R1bGUKZG9lc24ndCBzdXBwb3J0IDhiaXQgbW9kZSBhY2Nlc3MuCgpTaWduZWQtb2Zm
LWJ5OiBKaXRhbyBTaGkgPGppdGFvLnNoaUBtZWRpYXRlay5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19kc2kuYyB8IDQgKysrLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHNpLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jCmluZGV4
IDdlMjRkMDNjZGNjYy4uYWM4ZTgwZTM3OWY3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RzaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNp
LmMKQEAgLTk2MCw3ICs5NjAsOSBAQCBzdGF0aWMgdm9pZCBtdGtfZHNpX2NtZHEoc3RydWN0IG10
a19kc2kgKmRzaSwgY29uc3Qgc3RydWN0IG1pcGlfZHNpX21zZyAqbXNnKQogCX0KIAogCWZvciAo
aSA9IDA7IGkgPCBtc2ctPnR4X2xlbjsgaSsrKQotCQl3cml0ZWIodHhfYnVmW2ldLCBkc2ktPnJl
Z3MgKyByZWdfY21kcV9vZmYgKyBjbWRxX29mZiArIGkpOworCQltdGtfZHNpX21hc2soZHNpLCAo
cmVnX2NtZHFfb2ZmICsgY21kcV9vZmYgKyBpKSAmICh+MHgzVSksCisJCQkgICAgICgweGZmVUwg
PDwgKCgoaSArIGNtZHFfb2ZmKSAmIDNVKSAqIDhVKSksCisJCQkgICAgIHR4X2J1ZltpXSA8PCAo
KChpICsgY21kcV9vZmYpICYgM1UpICogOFUpKTsKIAogCW10a19kc2lfbWFzayhkc2ksIHJlZ19j
bWRxX29mZiwgY21kcV9tYXNrLCByZWdfdmFsKTsKIAltdGtfZHNpX21hc2soZHNpLCBEU0lfQ01E
UV9TSVpFLCBDTURRX1NJWkUsIGNtZHFfc2l6ZSk7Ci0tIAoyLjIxLjAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
