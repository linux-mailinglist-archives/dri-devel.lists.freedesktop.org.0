Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E00CB0BA
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2019 23:01:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1F6E6EA7E;
	Thu,  3 Oct 2019 21:01:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8F796EA7A;
 Thu,  3 Oct 2019 21:01:26 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from haswell.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 18715179-1500050 
 for multiple; Thu, 03 Oct 2019 22:01:03 +0100
From: Chris Wilson <chris@chris-wilson.co.uk>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/5] drm/i915/execlists: Skip redundant resubmission
Date: Thu,  3 Oct 2019 22:00:56 +0100
Message-Id: <20191003210100.22250-1-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.23.0
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
Cc: dri-devel@lists.freedesktop.org, tvrtko.ursulin@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SWYgd2UgdW53aW5kIHRoZSBhY3RpdmUgcmVxdWVzdHMsIGFuZCBvbiByZXN1Ym1pc3Npb24gZGlz
Y292ZXIgdGhhdCB3ZQppbnRlbmQgdG8gcHJlZW1wdCB0aGUgYWN0aXZlIGNvbnRleHQgd2l0aCBp
dHNlbGYsIHNpbXBseSBza2lwIHRoZSBFTFNQCnN1Ym1pc3Npb24uCgpTaWduZWQtb2ZmLWJ5OiBD
aHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vaTkxNS9ndC9pbnRlbF9scmMuYyB8IDE3ICsrKysrKysrKysrKysrKystCiAxIGZpbGUgY2hh
bmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX2xyYy5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Qv
aW50ZWxfbHJjLmMKaW5kZXggNDMxZDNiOGMzMzcxLi4zY2ZlYTE3NThmZDIgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX2xyYy5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2d0L2ludGVsX2xyYy5jCkBAIC0xNzM5LDExICsxNzM5LDI2IEBAIHN0YXRpYyB2b2lk
IGV4ZWNsaXN0c19kZXF1ZXVlKHN0cnVjdCBpbnRlbF9lbmdpbmVfY3MgKmVuZ2luZSkKIAogCWlm
IChzdWJtaXQpIHsKIAkJKnBvcnQgPSBleGVjbGlzdHNfc2NoZWR1bGVfaW4obGFzdCwgcG9ydCAt
IGV4ZWNsaXN0cy0+cGVuZGluZyk7Ci0JCW1lbXNldChwb3J0ICsgMSwgMCwgKGxhc3RfcG9ydCAt
IHBvcnQpICogc2l6ZW9mKCpwb3J0KSk7CiAJCWV4ZWNsaXN0cy0+c3dpdGNoX3ByaW9yaXR5X2hp
bnQgPQogCQkJc3dpdGNoX3ByaW8oZW5naW5lLCAqZXhlY2xpc3RzLT5wZW5kaW5nKTsKKworCQkv
KgorCQkgKiBTa2lwIGlmIHdlIGVuZGVkIHVwIHdpdGggZXhhY3RseSB0aGUgc2FtZSBzZXQgb2Yg
cmVxdWVzdHMsCisJCSAqIGUuZy4gdHJ5aW5nIHRvIHRpbWVzbGljZSBhIHBhaXIgb2Ygb3JkZXJl
ZCBjb250ZXh0cworCQkgKi8KKwkJaWYgKCFtZW1jbXAoZXhlY2xpc3RzLT5hY3RpdmUsIGV4ZWNs
aXN0cy0+cGVuZGluZywKKwkJCSAgICAocG9ydCAtIGV4ZWNsaXN0cy0+cGVuZGluZyArIDEpICog
c2l6ZW9mKCpwb3J0KSkpIHsKKwkJCWRvCisJCQkJZXhlY2xpc3RzX3NjaGVkdWxlX291dChmZXRj
aF9hbmRfemVybyhwb3J0KSk7CisJCQl3aGlsZSAocG9ydC0tICE9IGV4ZWNsaXN0cy0+cGVuZGlu
Zyk7CisKKwkJCWdvdG8gc2tpcF9zdWJtaXQ7CisJCX0KKworCQltZW1zZXQocG9ydCArIDEsIDAs
IChsYXN0X3BvcnQgLSBwb3J0KSAqIHNpemVvZigqcG9ydCkpOwogCQlleGVjbGlzdHNfc3VibWl0
X3BvcnRzKGVuZ2luZSk7CiAJfSBlbHNlIHsKK3NraXBfc3VibWl0OgogCQlyaW5nX3NldF9wYXVz
ZWQoZW5naW5lLCAwKTsKIAl9CiB9Ci0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
