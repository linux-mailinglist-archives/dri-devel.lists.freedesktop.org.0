Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E31FAC0029
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2019 09:41:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 908496EE82;
	Fri, 27 Sep 2019 07:41:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from Galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EC636ECD2;
 Thu, 26 Sep 2019 10:56:54 +0000 (UTC)
Received: from localhost ([127.0.0.1] helo=flow.W.breakpoint.cc)
 by Galois.linutronix.de with esmtp (Exim 4.80)
 (envelope-from <bigeasy@linutronix.de>)
 id 1iDRS6-0004T8-MK; Thu, 26 Sep 2019 12:56:50 +0200
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drm/i915: Drop the IRQ-off asserts
Date: Thu, 26 Sep 2019 12:56:44 +0200
Message-Id: <20190926105644.16703-3-bigeasy@linutronix.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190926105644.16703-1-bigeasy@linutronix.de>
References: <20190926105644.16703-1-bigeasy@linutronix.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 27 Sep 2019 07:40:57 +0000
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
 Clark Williams <williams@redhat.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGxvY2tkZXBfYXNzZXJ0X2lycXNfZGlzYWJsZWQoKSBjaGVjayBpcyBuZWVkbGVzcy4gVGhl
IHByZXZpb3VzCmxvY2tkZXBfYXNzZXJ0X2hlbGQoKSBjaGVjayBlbnN1cmVzIHRoYXQgdGhlIGxv
Y2sgaXMgYWNxdWlyZWQgYW5kIHdoaWxlCnRoZSBsb2NrIGlzIGFjcXVpcmVkIGxvY2tkZXAgYWxz
byBwcmludHMgYSB3YXJuaW5nIGlmIHRoZSBpbnRlcnJ1cHRzIGFyZQpub3QgZGlzYWJsZWQgaWYg
dGhleSBoYXZlIHRvIGJlLgpUaGVzZSBJUlEtb2ZmIGFzc2VydHMgdHJpZ2dlciBvbiBQUkVFTVBU
X1JUIGJlY2F1c2UgdGhlIGxvY2tzIGJlY29tZQpzbGVlcGluZyBsb2NrcyBhbmQgZG8gbm90IHJl
YWxseSBkaXNhYmxlIGludGVycnVwdHMuCgpSZW1vdmUgbG9ja2RlcF9hc3NlcnRfaXJxc19kaXNh
YmxlZCgpLgoKUmVwb3J0ZWQtYnk6IENsYXJrIFdpbGxpYW1zIDx3aWxsaWFtc0ByZWRoYXQuY29t
PgpTaWduZWQtb2ZmLWJ5OiBTZWJhc3RpYW4gQW5kcnplaiBTaWV3aW9yIDxiaWdlYXN5QGxpbnV0
cm9uaXguZGU+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfYnJlYWRjcnVtYnMu
YyB8IDMgLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRlbF9icmVhZGNydW1icy5jIGIvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZ3QvaW50ZWxfYnJlYWRjcnVtYnMuYwppbmRleCBmNzUwMzc1MDU2ZGU0Li41NTMx
NzA4MWQ0OGIwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRlbF9icmVh
ZGNydW1icy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX2JyZWFkY3J1bWJz
LmMKQEAgLTEyMCw3ICsxMjAsNiBAQCBfX2RtYV9mZW5jZV9zaWduYWxfX25vdGlmeShzdHJ1Y3Qg
ZG1hX2ZlbmNlICpmZW5jZSwKIAlzdHJ1Y3QgZG1hX2ZlbmNlX2NiICpjdXIsICp0bXA7CiAKIAls
b2NrZGVwX2Fzc2VydF9oZWxkKGZlbmNlLT5sb2NrKTsKLQlsb2NrZGVwX2Fzc2VydF9pcnFzX2Rp
c2FibGVkKCk7CiAKIAlsaXN0X2Zvcl9lYWNoX2VudHJ5X3NhZmUoY3VyLCB0bXAsIGxpc3QsIG5v
ZGUpIHsKIAkJSU5JVF9MSVNUX0hFQUQoJmN1ci0+bm9kZSk7CkBAIC0yNjksNyArMjY4LDYgQEAg
dm9pZCBpbnRlbF9lbmdpbmVfZmluaV9icmVhZGNydW1icyhzdHJ1Y3QgaW50ZWxfZW5naW5lX2Nz
ICplbmdpbmUpCiBib29sIGk5MTVfcmVxdWVzdF9lbmFibGVfYnJlYWRjcnVtYihzdHJ1Y3QgaTkx
NV9yZXF1ZXN0ICpycSkKIHsKIAlsb2NrZGVwX2Fzc2VydF9oZWxkKCZycS0+bG9jayk7Ci0JbG9j
a2RlcF9hc3NlcnRfaXJxc19kaXNhYmxlZCgpOwogCiAJaWYgKHRlc3RfYml0KEk5MTVfRkVOQ0Vf
RkxBR19BQ1RJVkUsICZycS0+ZmVuY2UuZmxhZ3MpKSB7CiAJCXN0cnVjdCBpbnRlbF9icmVhZGNy
dW1icyAqYiA9ICZycS0+ZW5naW5lLT5icmVhZGNydW1iczsKQEAgLTMxOSw3ICszMTcsNiBAQCB2
b2lkIGk5MTVfcmVxdWVzdF9jYW5jZWxfYnJlYWRjcnVtYihzdHJ1Y3QgaTkxNV9yZXF1ZXN0ICpy
cSkKIAlzdHJ1Y3QgaW50ZWxfYnJlYWRjcnVtYnMgKmIgPSAmcnEtPmVuZ2luZS0+YnJlYWRjcnVt
YnM7CiAKIAlsb2NrZGVwX2Fzc2VydF9oZWxkKCZycS0+bG9jayk7Ci0JbG9ja2RlcF9hc3NlcnRf
aXJxc19kaXNhYmxlZCgpOwogCiAJLyoKIAkgKiBXZSBtdXN0IHdhaXQgZm9yIGItPmlycV9sb2Nr
IHNvIHRoYXQgd2Uga25vdyB0aGUgaW50ZXJydXB0IGhhbmRsZXIKLS0gCjIuMjMuMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
