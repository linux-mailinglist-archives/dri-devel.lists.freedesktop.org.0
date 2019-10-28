Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87158E757C
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2019 16:49:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF9FB6E94D;
	Mon, 28 Oct 2019 15:49:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A047D6E946
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2019 15:49:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id ECB01B5A3;
 Mon, 28 Oct 2019 15:49:30 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, kraxel@redhat.com, sam@ravnborg.org,
 chen@aspeedtech.com
Subject: [PATCH 2/9] drm/ast: Check video-mode requirements against VRAM size
Date: Mon, 28 Oct 2019 16:49:21 +0100
Message-Id: <20191028154928.4058-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191028154928.4058-1-tzimmermann@suse.de>
References: <20191028154928.4058-1-tzimmermann@suse.de>
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

RWFjaCB2aWRlbyBtb2RlJ3MgcHJpbWFyeSBwbGFuZSByZXF1aXJlcyBhIG1pbmltdW0gYW1vdW50
IG9mIHZpZGVvCm1lbW9yeS4gRm9yIGRvdWJsZSBidWZmZXJpbmcsIHRoaXMgaXMgYXQgbW9zdCBo
YWxmIHRoZSBhdmFpbGFibGUKVlJBTS4gQ2hlY2sgdGhpcyBjb25zdHJhaW50LgoKU2lnbmVkLW9m
Zi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL2FzdC9hc3RfbWFpbi5jIHwgMjUgKysrKysrKysrKysrKysrKysrKysrKysrLQog
MSBmaWxlIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tYWluLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXN0
L2FzdF9tYWluLmMKaW5kZXggM2E5YjRjYjczZjJmLi40OGQ1N2FiNDI5NTUgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21haW4uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYXN0
L2FzdF9tYWluLmMKQEAgLTM4Nyw4ICszODcsMzEgQEAgc3RhdGljIGludCBhc3RfZ2V0X2RyYW1f
aW5mbyhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQogCXJldHVybiAwOwogfQogCitlbnVtIGRybV9t
b2RlX3N0YXR1cyBhc3RfbW9kZV9jb25maWdfbW9kZV92YWxpZChzdHJ1Y3QgZHJtX2RldmljZSAq
ZGV2LAorCQkJCQkJY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm1vZGUpCit7CisJc3Rh
dGljIGNvbnN0IHVuc2lnbmVkIGxvbmcgbWF4X2JwcCA9IDQ7IC8qIERSTV9GT1JNQVRfWFJHQkE4
ODg4ICovCisKKwlzdHJ1Y3QgYXN0X3ByaXZhdGUgKmFzdCA9IGRldi0+ZGV2X3ByaXZhdGU7CisJ
dW5zaWduZWQgbG9uZyBmYnNpemUsIGZicGFnZXMsIG1heF9mYnBhZ2VzOworCisJLyogVG8gc3Vw
cG9ydCBkb3VibGUgYnVmZmVyaW5nLCBhIGZyYW1lYnVmZmVyIG1heSBub3QKKwkgKiBjb25zdW1l
IG1vcmUgdGhhbiBoYWxmIG9mIHRoZSBhdmFpbGFibGUgVlJBTS4KKwkgKi8KKwltYXhfZmJwYWdl
cyA9IChhc3QtPnZyYW1fc2l6ZSAvIDIpID4+IFBBR0VfU0hJRlQ7CisKKwlmYnNpemUgPSBtb2Rl
LT5oZGlzcGxheSAqIG1vZGUtPnZkaXNwbGF5ICogbWF4X2JwcDsKKwlmYnBhZ2VzID0gRElWX1JP
VU5EX1VQKGZic2l6ZSwgUEFHRV9TSVpFKTsKKworCWlmIChmYnBhZ2VzID4gbWF4X2ZicGFnZXMp
CisJCXJldHVybiBNT0RFX01FTTsKKworCXJldHVybiBNT0RFX09LOworfQorCiBzdGF0aWMgY29u
c3Qgc3RydWN0IGRybV9tb2RlX2NvbmZpZ19mdW5jcyBhc3RfbW9kZV9mdW5jcyA9IHsKLQkuZmJf
Y3JlYXRlID0gZHJtX2dlbV9mYl9jcmVhdGUKKwkuZmJfY3JlYXRlID0gZHJtX2dlbV9mYl9jcmVh
dGUsCisJLm1vZGVfdmFsaWQgPSBhc3RfbW9kZV9jb25maWdfbW9kZV92YWxpZCwKIH07CiAKIHN0
YXRpYyB1MzIgYXN0X2dldF92cmFtX2luZm8oc3RydWN0IGRybV9kZXZpY2UgKmRldikKLS0gCjIu
MjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
