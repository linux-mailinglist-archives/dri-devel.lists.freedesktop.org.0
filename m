Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B23AF101AF7
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 09:05:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0BD36EBCB;
	Tue, 19 Nov 2019 08:04:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EED76E4A1
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 12:00:24 +0000 (UTC)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id E9ABEFB709371A4E7DEC;
 Mon, 18 Nov 2019 20:00:22 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.439.0; Mon, 18 Nov 2019
 20:00:12 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <tomi.valkeinen@ti.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <sebastian.reichel@collabora.com>, <laurent.pinchart@ideasonboard.com>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH 4/4] drm/omap: dss: Use PTR_ERR_OR_ZERO() to simplify code in
 hdmi_phy_init
Date: Mon, 18 Nov 2019 20:07:33 +0800
Message-ID: <1574078853-69002-5-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574078853-69002-1-git-send-email-zhengbin13@huawei.com>
References: <1574078853-69002-1-git-send-email-zhengbin13@huawei.com>
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

Rml4ZXMgY29jY2ljaGVjayB3YXJuaW5nOgoKZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL2hk
bWlfcGh5LmM6MTk0OjEtMzogV0FSTklORzogUFRSX0VSUl9PUl9aRVJPIGNhbiBiZSB1c2VkCgpS
ZXBvcnRlZC1ieTogSHVsayBSb2JvdCA8aHVsa2NpQGh1YXdlaS5jb20+ClNpZ25lZC1vZmYtYnk6
IHpoZW5nYmluIDx6aGVuZ2JpbjEzQGh1YXdlaS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL29t
YXBkcm0vZHNzL2hkbWlfcGh5LmMgfCA1ICstLS0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL29tYXBk
cm0vZHNzL2hkbWlfcGh5LmMgYi9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3MvaGRtaV9waHku
YwppbmRleCAwMGJiZjI0Li40MDhiMmUwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vb21h
cGRybS9kc3MvaGRtaV9waHkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3MvaGRt
aV9waHkuYwpAQCAtMTkxLDggKzE5MSw1IEBAIGludCBoZG1pX3BoeV9pbml0KHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYsIHN0cnVjdCBoZG1pX3BoeV9kYXRhICpwaHksCgogCXJlcyA9IHBs
YXRmb3JtX2dldF9yZXNvdXJjZV9ieW5hbWUocGRldiwgSU9SRVNPVVJDRV9NRU0sICJwaHkiKTsK
IAlwaHktPmJhc2UgPSBkZXZtX2lvcmVtYXBfcmVzb3VyY2UoJnBkZXYtPmRldiwgcmVzKTsKLQlp
ZiAoSVNfRVJSKHBoeS0+YmFzZSkpCi0JCXJldHVybiBQVFJfRVJSKHBoeS0+YmFzZSk7Ci0KLQly
ZXR1cm4gMDsKKwlyZXR1cm4gUFRSX0VSUl9PUl9aRVJPKHBoeS0+YmFzZSk7CiB9Ci0tCjIuNy40
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
