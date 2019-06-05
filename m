Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E900E36CDC
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 09:04:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4E4C897BC;
	Thu,  6 Jun 2019 07:03:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86BF7898FD
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 11:49:01 +0000 (UTC)
X-UUID: 0e95e89091ce4746a67411bab00b16fb-20190605
X-UUID: 0e95e89091ce4746a67411bab00b16fb-20190605
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by
 mailgw02.mediatek.com (envelope-from <yongqiang.niu@mediatek.com>)
 (mhqrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 530520526; Wed, 05 Jun 2019 19:43:57 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 5 Jun 2019 19:43:55 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 5 Jun 2019 19:43:55 +0800
From: <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob
 Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v3, 22/27] drm/mediatek: distinguish ovl and ovl_2l by layer_nr
Date: Wed, 5 Jun 2019 19:43:01 +0800
Message-ID: <1559734986-7379-23-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1559734986-7379-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1559734986-7379-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Thu, 06 Jun 2019 07:03:45 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+CgpkaXN0aW5n
dWlzaCBvdmwgYW5kIG92bF8ybCBieSBsYXllcl9uciB3aGVuIGdldCBjb21wCmlkCgpTaWduZWQt
b2ZmLWJ5OiBZb25ncWlhbmcgTml1IDx5b25ncWlhbmcubml1QG1lZGlhdGVrLmNvbT4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMgfCA5ICsrKysrKy0tLQogMSBm
aWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMgYi9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMKaW5kZXggYjVhOTkwNy4uNjMwNzJkMSAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYwpAQCAtMzI3LDcgKzMyNywxMiBAQCBz
dGF0aWMgaW50IG10a19kaXNwX292bF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
KQogCWlmIChpcnEgPCAwKQogCQlyZXR1cm4gaXJxOwogCi0JY29tcF9pZCA9IG10a19kZHBfY29t
cF9nZXRfaWQoZGV2LT5vZl9ub2RlLCBNVEtfRElTUF9PVkwpOworCXByaXYtPmRhdGEgPSBvZl9k
ZXZpY2VfZ2V0X21hdGNoX2RhdGEoZGV2KTsKKworCWNvbXBfaWQgPSBtdGtfZGRwX2NvbXBfZ2V0
X2lkKGRldi0+b2Zfbm9kZSwKKwkJCQkgICAgICBwcml2LT5kYXRhLT5sYXllcl9uciA9PSA0ID8K
KwkJCQkgICAgICBNVEtfRElTUF9PVkwgOgorCQkJCSAgICAgIE1US19ESVNQX09WTF8yTCk7CiAJ
aWYgKGNvbXBfaWQgPCAwKSB7CiAJCWRldl9lcnIoZGV2LCAiRmFpbGVkIHRvIGlkZW50aWZ5IGJ5
IGFsaWFzOiAlZFxuIiwgY29tcF9pZCk7CiAJCXJldHVybiBjb21wX2lkOwpAQCAtMzQwLDggKzM0
NSw2IEBAIHN0YXRpYyBpbnQgbXRrX2Rpc3Bfb3ZsX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UgKnBkZXYpCiAJCXJldHVybiByZXQ7CiAJfQogCi0JcHJpdi0+ZGF0YSA9IG9mX2RldmljZV9n
ZXRfbWF0Y2hfZGF0YShkZXYpOwotCiAJcGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwgcHJpdik7
CiAKIAlyZXQgPSBkZXZtX3JlcXVlc3RfaXJxKGRldiwgaXJxLCBtdGtfZGlzcF9vdmxfaXJxX2hh
bmRsZXIsCi0tIAoxLjguMS4xLmRpcnR5CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
