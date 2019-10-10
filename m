Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E25CD398D
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2019 08:48:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AE916EBA4;
	Fri, 11 Oct 2019 06:48:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from Galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 580306E030;
 Thu, 10 Oct 2019 16:06:48 +0000 (UTC)
Received: from localhost ([127.0.0.1] helo=flow.W.breakpoint.cc)
 by Galois.linutronix.de with esmtp (Exim 4.80)
 (envelope-from <bigeasy@linutronix.de>)
 id 1iIaxh-00056C-2N; Thu, 10 Oct 2019 18:06:45 +0200
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915: Don't disable interrupts independently of the lock
Date: Thu, 10 Oct 2019 18:06:40 +0200
Message-Id: <20191010160640.6472-1-bigeasy@linutronix.de>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 11 Oct 2019 06:48:21 +0000
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
Cc: David Airlie <airlied@linux.ie>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, tglx@linutronix.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGxvY2tzIChhY3RpdmUubG9jayBhbmQgcnEtPmxvY2spIG5lZWQgdG8gYmUgdGFrZW4gd2l0
aCBkaXNhYmxlZAppbnRlcnJ1cHRzLiBUaGlzIGlzIGRvbmUgaW4gaTkxNV9yZXF1ZXN0X3JldGly
ZSgpIGJ5IGRpc2FibGluZyB0aGUKaW50ZXJydXB0cyBpbmRlcGVuZGVudGx5IG9mIHRoZSBsb2Nr
cyBpdHNlbGYuCldoaWxlIGxvY2FsX2lycV9kaXNhYmxlKCkrc3Bpbl9sb2NrKCkgZXF1YWxzIHNw
aW5fbG9ja19pcnEoKSBvbiB2YW5pbGxhCml0IGRvZXMgbm90IG9uIFBSRUVNUFRfUlQuIEFsc28s
IGl0IGlzIG5vdCBvYnZpb3VzIGlmIHRoZXJlIGlzIGEgc3BlY2lhbCByZWFzb24KdG8gd2h5IHRo
ZSBpbnRlcnJ1cHRzIGFyZSBkaXNhYmxlZCBpbmRlcGVuZGVudGx5IG9mIHRoZSBsb2NrLgoKRW5h
YmxlL2Rpc2FibGUgaW50ZXJydXB0cyBhcyBwYXJ0IG9mIHRoZSBsb2NraW5nIGluc3RydWN0aW9u
LgoKU2lnbmVkLW9mZi1ieTogU2ViYXN0aWFuIEFuZHJ6ZWogU2lld2lvciA8YmlnZWFzeUBsaW51
dHJvbml4LmRlPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfcmVxdWVzdC5jIHwgICAg
OCArKy0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMo
LSkKCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfcmVxdWVzdC5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2k5MTVfcmVxdWVzdC5jCkBAIC0yNTEsMTUgKzI1MSwxMyBAQCBzdGF0
aWMgYm9vbCBpOTE1X3JlcXVlc3RfcmV0aXJlKHN0cnVjdCBpCiAJCWFjdGl2ZS0+cmV0aXJlKGFj
dGl2ZSwgcnEpOwogCX0KIAotCWxvY2FsX2lycV9kaXNhYmxlKCk7Ci0KIAkvKgogCSAqIFdlIG9u
bHkgbG9vc2VseSB0cmFjayBpbmZsaWdodCByZXF1ZXN0cyBhY3Jvc3MgcHJlZW1wdGlvbiwKIAkg
KiBhbmQgc28gd2UgbWF5IGZpbmQgb3Vyc2VsdmVzIGF0dGVtcHRpbmcgdG8gcmV0aXJlIGEgX2Nv
bXBsZXRlZF8KIAkgKiByZXF1ZXN0IHRoYXQgd2UgaGF2ZSByZW1vdmVkIGZyb20gdGhlIEhXIGFu
ZCBwdXQgYmFjayBvbiBhIHJ1bgogCSAqIHF1ZXVlLgogCSAqLwotCXNwaW5fbG9jaygmcnEtPmVu
Z2luZS0+YWN0aXZlLmxvY2spOworCXNwaW5fbG9ja19pcnEoJnJxLT5lbmdpbmUtPmFjdGl2ZS5s
b2NrKTsKIAlsaXN0X2RlbCgmcnEtPnNjaGVkLmxpbmspOwogCXNwaW5fdW5sb2NrKCZycS0+ZW5n
aW5lLT5hY3RpdmUubG9jayk7CiAKQEAgLTI3OCw5ICsyNzYsNyBAQCBzdGF0aWMgYm9vbCBpOTE1
X3JlcXVlc3RfcmV0aXJlKHN0cnVjdCBpCiAJCV9fbm90aWZ5X2V4ZWN1dGVfY2IocnEpOwogCX0K
IAlHRU1fQlVHX09OKCFsaXN0X2VtcHR5KCZycS0+ZXhlY3V0ZV9jYikpOwotCXNwaW5fdW5sb2Nr
KCZycS0+bG9jayk7Ci0KLQlsb2NhbF9pcnFfZW5hYmxlKCk7CisJc3Bpbl91bmxvY2tfaXJxKCZy
cS0+bG9jayk7CiAKIAlyZW1vdmVfZnJvbV9jbGllbnQocnEpOwogCWxpc3RfZGVsKCZycS0+bGlu
ayk7Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
