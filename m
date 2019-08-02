Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 303467FEAC
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 18:37:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22A456EEE5;
	Fri,  2 Aug 2019 16:37:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DDAD6EEE4;
 Fri,  2 Aug 2019 16:37:08 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from haswell.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 17822167-1500050 
 for multiple; Fri, 02 Aug 2019 17:37:01 +0100
From: Chris Wilson <chris@chris-wilson.co.uk>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/syncobj: Lookup the syncobj with RCU protection
Date: Fri,  2 Aug 2019 17:36:59 +0100
Message-Id: <20190802163659.23255-2-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.23.0.rc0
In-Reply-To: <20190802163659.23255-1-chris@chris-wilson.co.uk>
References: <20190802163659.23255-1-chris@chris-wilson.co.uk>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmVsYXggdGhlIHNwaW5sb2NrIHVzZWQgZm9yIGxvb2tpbmcgdXAgdGhlIGhhbmRsZSBpbiB0aGUg
WEFycmF5IGFuZAphY3F1aXJpbmcgYSByZWZlcmVuY2UgdG8gaXQgdG8gYW4gUkNVIHByb3RlY3Rl
ZCBjcml0aWNhbCBzZWN0aW9uLiBUaGlzCmluY3VycyB0aGUgcmVxdWlyZW1lbnQgdGhhdCB3ZSBw
cm90ZWN0IHRoZSBzeW5jb2JqIHN0cnVjdCBpdHNlbGYgdXNpbmcKUkNVLCB3aGljaCB3ZSBhY2hp
ZXZlIGJ5IHNpbXBseSBjYWxsaW5nIGtmcmVlX3JjdSgpIGFuZCBiZWluZyBtb3JlCmNhcmVmdWwg
aW4gYWNxdWlyaW5nIG91ciByZWZlcmVuY2UuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpcyBXaWxzb24g
PGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0
ZXJAZmZ3bGwuY2g+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9zeW5jb2JqLmMgfCAxMiArKysr
Ky0tLS0tLS0KIGluY2x1ZGUvZHJtL2RybV9zeW5jb2JqLmggICAgIHwgIDIgKysKIDIgZmlsZXMg
Y2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fc3luY29iai5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9zeW5jb2Jq
LmMKaW5kZXggNGZjNzFkYzlmYzQzLi5hYWZjMDM5ODZhNDggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9kcm1fc3luY29iai5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fc3luY29iai5j
CkBAIC04NiwxMyArODYsMTEgQEAgc3RydWN0IGRybV9zeW5jb2JqICpkcm1fc3luY29ial9maW5k
KHN0cnVjdCBkcm1fZmlsZSAqZmlsZV9wcml2YXRlLAogewogCXN0cnVjdCBkcm1fc3luY29iaiAq
c3luY29iajsKIAotCXhhX2xvY2soJmZpbGVfcHJpdmF0ZS0+c3luY29ianMpOwotCisJcmN1X3Jl
YWRfbG9jaygpOwogCXN5bmNvYmogPSB4YV9sb2FkKCZmaWxlX3ByaXZhdGUtPnN5bmNvYmpzLCBo
YW5kbGUpOwotCWlmIChzeW5jb2JqKQotCQlkcm1fc3luY29ial9nZXQoc3luY29iaik7Ci0KLQl4
YV91bmxvY2soJmZpbGVfcHJpdmF0ZS0+c3luY29ianMpOworCWlmIChzeW5jb2JqICYmICFrcmVm
X2dldF91bmxlc3NfemVybygmc3luY29iai0+cmVmY291bnQpKQorCQlzeW5jb2JqID0gTlVMTDsK
KwlyY3VfcmVhZF91bmxvY2soKTsKIAogCXJldHVybiBzeW5jb2JqOwogfQpAQCAtMzA5LDcgKzMw
Nyw3IEBAIHZvaWQgZHJtX3N5bmNvYmpfZnJlZShzdHJ1Y3Qga3JlZiAqa3JlZikKIAkJCQkJCSAg
IHN0cnVjdCBkcm1fc3luY29iaiwKIAkJCQkJCSAgIHJlZmNvdW50KTsKIAlkcm1fc3luY29ial9y
ZXBsYWNlX2ZlbmNlKHN5bmNvYmosIE5VTEwpOwotCWtmcmVlKHN5bmNvYmopOworCWtmcmVlX3Jj
dShzeW5jb2JqLCByY3UpOwogfQogRVhQT1JUX1NZTUJPTChkcm1fc3luY29ial9mcmVlKTsKIApk
aWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX3N5bmNvYmouaCBiL2luY2x1ZGUvZHJtL2RybV9z
eW5jb2JqLmgKaW5kZXggNmNmNzI0M2ExZGM1Li43YzE1MDNkNDdhYmYgMTAwNjQ0Ci0tLSBhL2lu
Y2x1ZGUvZHJtL2RybV9zeW5jb2JqLmgKKysrIGIvaW5jbHVkZS9kcm0vZHJtX3N5bmNvYmouaApA
QCAtNjEsNiArNjEsOCBAQCBzdHJ1Y3QgZHJtX3N5bmNvYmogewogCSAqIEBmaWxlOiBBIGZpbGUg
YmFja2luZyBmb3IgdGhpcyBzeW5jb2JqLgogCSAqLwogCXN0cnVjdCBmaWxlICpmaWxlOworCisJ
c3RydWN0IHJjdV9oZWFkIHJjdTsKIH07CiAKIHZvaWQgZHJtX3N5bmNvYmpfZnJlZShzdHJ1Y3Qg
a3JlZiAqa3JlZik7Ci0tIAoyLjIzLjAucmMwCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
