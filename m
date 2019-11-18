Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D00E101AF4
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 09:05:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E18B6EBE5;
	Tue, 19 Nov 2019 08:04:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0522C89E5B
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 12:27:34 +0000 (UTC)
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 7018DD82C25D6298FA2;
 Mon, 18 Nov 2019 20:27:29 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.439.0; Mon, 18 Nov 2019
 20:27:21 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <mripard@kernel.org>, <wens@csie.org>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 1/5] drm/sun4i: Use PTR_ERR_OR_ZERO() to simplify code in
 sun4i_hdmi_init_regmap_fields
Date: Mon, 18 Nov 2019 20:34:40 +0800
Message-ID: <1574080484-48744-2-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574080484-48744-1-git-send-email-zhengbin13@huawei.com>
References: <1574080484-48744-1-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 19 Nov 2019 08:04:07 +0000
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
Cc: zhengbin13@huawei.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgY29jY2ljaGVjayB3YXJuaW5nOgoKZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjRpX2hk
bWlfaTJjLmM6MjgxOjEtMzogV0FSTklORzogUFRSX0VSUl9PUl9aRVJPIGNhbiBiZSB1c2VkCgpS
ZXBvcnRlZC1ieTogSHVsayBSb2JvdCA8aHVsa2NpQGh1YXdlaS5jb20+ClNpZ25lZC1vZmYtYnk6
IHpoZW5nYmluIDx6aGVuZ2JpbjEzQGh1YXdlaS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3N1
bjRpL3N1bjRpX2hkbWlfaTJjLmMgfCA1ICstLS0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3N1bjRp
L3N1bjRpX2hkbWlfaTJjLmMgYi9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNGlfaGRtaV9pMmMu
YwppbmRleCBiNjZmYTI3Li5hYzQzNWU1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vc3Vu
NGkvc3VuNGlfaGRtaV9pMmMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNGlfaGRt
aV9pMmMuYwpAQCAtMjc4LDEwICsyNzgsNyBAQCBzdGF0aWMgaW50IHN1bjRpX2hkbWlfaW5pdF9y
ZWdtYXBfZmllbGRzKHN0cnVjdCBzdW40aV9oZG1pICpoZG1pKQogCWhkbWktPmZpZWxkX2RkY19z
Y2tfZW4gPQogCQlkZXZtX3JlZ21hcF9maWVsZF9hbGxvYyhoZG1pLT5kZXYsIGhkbWktPnJlZ21h
cCwKIAkJCQkJaGRtaS0+dmFyaWFudC0+ZmllbGRfZGRjX3Nja19lbik7Ci0JaWYgKElTX0VSUiho
ZG1pLT5maWVsZF9kZGNfc2NrX2VuKSkKLQkJcmV0dXJuIFBUUl9FUlIoaGRtaS0+ZmllbGRfZGRj
X3Nja19lbik7Ci0KLQlyZXR1cm4gMDsKKwlyZXR1cm4gUFRSX0VSUl9PUl9aRVJPKGhkbWktPmZp
ZWxkX2RkY19zY2tfZW4pOwogfQoKIGludCBzdW40aV9oZG1pX2kyY19jcmVhdGUoc3RydWN0IGRl
dmljZSAqZGV2LCBzdHJ1Y3Qgc3VuNGlfaGRtaSAqaGRtaSkKLS0KMi43LjQKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
