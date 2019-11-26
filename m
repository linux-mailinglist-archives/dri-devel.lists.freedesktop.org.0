Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E12A410998C
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 08:25:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E63CA6E02D;
	Tue, 26 Nov 2019 07:25:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B67A6E216
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 07:25:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C7567AD76;
 Tue, 26 Nov 2019 07:25:48 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, john.p.donnelly@oracle.com,
 kraxel@redhat.com, sam@ravnborg.org
Subject: [PATCH 1/4] drm/mgag200: Extract device type from flags
Date: Tue, 26 Nov 2019 08:25:42 +0100
Message-Id: <20191126072545.22663-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191126072545.22663-1-tzimmermann@suse.de>
References: <20191126072545.22663-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkcyBhIGNvbnZlcnNpb24gZnVuY3Rpb24gdGhhdCBleHRyYWN0cyB0aGUgZGV2aWNlIHR5cGUg
ZnJvbSB0aGUKUENJIGlkLXRhYmxlIGZsYWdzLiBBbGxvd3MgZm9yIHN0b3JpbmcgYWRkaXRpb25h
bCBpbmZvcm1hdGlvbiBpbiB0aGUKb3RoZXIgZmxhZyBiaXRzLgoKU2lnbmVkLW9mZi1ieTogVGhv
bWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L21nYWcyMDAvbWdhZzIwMF9kcnYuaCAgfCA3ICsrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9tZ2Fn
MjAwL21nYWcyMDBfbWFpbi5jIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9t
Z2FnMjAwX2Rydi5oIGIvZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9kcnYuaAppbmRl
eCAwZWE5YTUyNWU1N2QuLjk3NjQwNDYzNDA5MiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L21nYWcyMDAvbWdhZzIwMF9kcnYuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2Fn
MjAwX2Rydi5oCkBAIC0xNTAsNiArMTUwLDggQEAgZW51bSBtZ2FfdHlwZSB7CiAJRzIwMF9FVzMs
CiB9OwogCisjZGVmaW5lIE1HQUcyMDBfVFlQRV9NQVNLCSgweDAwMDAwMGZmKQorCiAjZGVmaW5l
IElTX0cyMDBfU0UobWRldikgKG1kZXYtPnR5cGUgPT0gRzIwMF9TRV9BIHx8IG1kZXYtPnR5cGUg
PT0gRzIwMF9TRV9CKQogCiBzdHJ1Y3QgbWdhX2RldmljZSB7CkBAIC0xODEsNiArMTgzLDExIEBA
IHN0cnVjdCBtZ2FfZGV2aWNlIHsKIAl1MzIgdW5pcXVlX3Jldl9pZDsKIH07CiAKK3N0YXRpYyBp
bmxpbmUgZW51bSBtZ2FfdHlwZQorbWdhZzIwMF90eXBlX2Zyb21fZHJpdmVyX2RhdGEoa2VybmVs
X3Vsb25nX3QgZHJpdmVyX2RhdGEpCit7CisJcmV0dXJuIChlbnVtIG1nYV90eXBlKShkcml2ZXJf
ZGF0YSAmIE1HQUcyMDBfVFlQRV9NQVNLKTsKK30KIAkJCQkvKiBtZ2FnMjAwX21vZGUuYyAqLwog
aW50IG1nYWcyMDBfbW9kZXNldF9pbml0KHN0cnVjdCBtZ2FfZGV2aWNlICptZGV2KTsKIHZvaWQg
bWdhZzIwMF9tb2Rlc2V0X2Zpbmkoc3RydWN0IG1nYV9kZXZpY2UgKm1kZXYpOwpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9tYWluLmMgYi9kcml2ZXJzL2dwdS9k
cm0vbWdhZzIwMC9tZ2FnMjAwX21haW4uYwppbmRleCA1Zjc0YWFiY2QzZGYuLjUxN2M1NjkzYWQ2
OSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9tYWluLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9tYWluLmMKQEAgLTk0LDcgKzk0LDcg
QEAgc3RhdGljIGludCBtZ2FnMjAwX2RldmljZV9pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYs
CiAJc3RydWN0IG1nYV9kZXZpY2UgKm1kZXYgPSBkZXYtPmRldl9wcml2YXRlOwogCWludCByZXQs
IG9wdGlvbjsKIAotCW1kZXYtPnR5cGUgPSBmbGFnczsKKwltZGV2LT50eXBlID0gbWdhZzIwMF90
eXBlX2Zyb21fZHJpdmVyX2RhdGEoZmxhZ3MpOwogCiAJLyogSGFyZGNvZGUgdGhlIG51bWJlciBv
ZiBDUlRDcyB0byAxICovCiAJbWRldi0+bnVtX2NydGMgPSAxOwotLSAKMi4yMy4wCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
