Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C23C3463F6
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 16:58:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 203CA6EC11;
	Tue, 23 Mar 2021 15:58:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (mblankhorst.nl
 [IPv6:2a02:2308::216:3eff:fe92:dfa3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 493136EC31
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 15:57:46 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v9 57/70] drm/i915/selftests: Prepare i915_request tests for
 obj->mm.lock removal
Date: Tue, 23 Mar 2021 16:50:46 +0100
Message-Id: <20210323155059.628690-58-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210323155059.628690-1-maarten.lankhorst@linux.intel.com>
References: <20210323155059.628690-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U3RyYWlnaHRmb3J3YXJkIGNvbnZlcnNpb24gYnkgdXNpbmcgdW5sb2NrZWQgdmVyc2lvbnMuCgpT
aWduZWQtb2ZmLWJ5OiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXgu
aW50ZWwuY29tPgpSZXZpZXdlZC1ieTogVGhvbWFzIEhlbGxzdHLDtm0gPHRob21hcy5oZWxsc3Ry
b21AbGludXguaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L3NlbGZ0ZXN0cy9p
OTE1X3JlcXVlc3QuYyB8IDEwICsrKysrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlv
bnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUv
c2VsZnRlc3RzL2k5MTVfcmVxdWVzdC5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvc2VsZnRlc3Rz
L2k5MTVfcmVxdWVzdC5jCmluZGV4IDgwMzVlYTc1NjVlZC4uYTI3Y2M1MDRmODM5IDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9zZWxmdGVzdHMvaTkxNV9yZXF1ZXN0LmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvc2VsZnRlc3RzL2k5MTVfcmVxdWVzdC5jCkBAIC02MTksNyAr
NjE5LDcgQEAgc3RhdGljIHN0cnVjdCBpOTE1X3ZtYSAqZW1wdHlfYmF0Y2goc3RydWN0IGRybV9p
OTE1X3ByaXZhdGUgKmk5MTUpCiAJaWYgKElTX0VSUihvYmopKQogCQlyZXR1cm4gRVJSX0NBU1Qo
b2JqKTsKIAotCWNtZCA9IGk5MTVfZ2VtX29iamVjdF9waW5fbWFwKG9iaiwgSTkxNV9NQVBfV0Ip
OworCWNtZCA9IGk5MTVfZ2VtX29iamVjdF9waW5fbWFwX3VubG9ja2VkKG9iaiwgSTkxNV9NQVBf
V0IpOwogCWlmIChJU19FUlIoY21kKSkgewogCQllcnIgPSBQVFJfRVJSKGNtZCk7CiAJCWdvdG8g
ZXJyOwpAQCAtNzgxLDcgKzc4MSw3IEBAIHN0YXRpYyBzdHJ1Y3QgaTkxNV92bWEgKnJlY3Vyc2l2
ZV9iYXRjaChzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqaTkxNSkKIAlpZiAoZXJyKQogCQlnb3Rv
IGVycjsKIAotCWNtZCA9IGk5MTVfZ2VtX29iamVjdF9waW5fbWFwKG9iaiwgSTkxNV9NQVBfV0Mp
OworCWNtZCA9IGk5MTVfZ2VtX29iamVjdF9waW5fbWFwX3VubG9ja2VkKG9iaiwgSTkxNV9NQVBf
V0MpOwogCWlmIChJU19FUlIoY21kKSkgewogCQllcnIgPSBQVFJfRVJSKGNtZCk7CiAJCWdvdG8g
ZXJyOwpAQCAtODE2LDcgKzgxNiw3IEBAIHN0YXRpYyBpbnQgcmVjdXJzaXZlX2JhdGNoX3Jlc29s
dmUoc3RydWN0IGk5MTVfdm1hICpiYXRjaCkKIHsKIAl1MzIgKmNtZDsKIAotCWNtZCA9IGk5MTVf
Z2VtX29iamVjdF9waW5fbWFwKGJhdGNoLT5vYmosIEk5MTVfTUFQX1dDKTsKKwljbWQgPSBpOTE1
X2dlbV9vYmplY3RfcGluX21hcF91bmxvY2tlZChiYXRjaC0+b2JqLCBJOTE1X01BUF9XQyk7CiAJ
aWYgKElTX0VSUihjbWQpKQogCQlyZXR1cm4gUFRSX0VSUihjbWQpOwogCkBAIC0xMDY5LDggKzEw
NjksOCBAQCBzdGF0aWMgaW50IGxpdmVfc2VxdWVudGlhbF9lbmdpbmVzKHZvaWQgKmFyZykKIAkJ
aWYgKCFyZXF1ZXN0W2lkeF0pCiAJCQlicmVhazsKIAotCQljbWQgPSBpOTE1X2dlbV9vYmplY3Rf
cGluX21hcChyZXF1ZXN0W2lkeF0tPmJhdGNoLT5vYmosCi0JCQkJCSAgICAgIEk5MTVfTUFQX1dD
KTsKKwkJY21kID0gaTkxNV9nZW1fb2JqZWN0X3Bpbl9tYXBfdW5sb2NrZWQocmVxdWVzdFtpZHhd
LT5iYXRjaC0+b2JqLAorCQkJCQkJICAgICAgIEk5MTVfTUFQX1dDKTsKIAkJaWYgKCFJU19FUlIo
Y21kKSkgewogCQkJKmNtZCA9IE1JX0JBVENIX0JVRkZFUl9FTkQ7CiAKLS0gCjIuMzEuMAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
