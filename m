Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 537B7155A80
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 16:18:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4F276FCF5;
	Fri,  7 Feb 2020 15:17:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F0056E8BC;
 Fri,  7 Feb 2020 15:17:55 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from haswell.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 20150106-1500050 
 for multiple; Fri, 07 Feb 2020 15:17:21 +0000
From: Chris Wilson <chris@chris-wilson.co.uk>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/mm: Break long searches in fragmented address spaces
Date: Fri,  7 Feb 2020 15:17:20 +0000
Message-Id: <20200207151720.2812125-1-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.25.0
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
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2UgdHJ5IGhhcmQgdG8gc2VsZWN0IGEgc3VpdGFibGUgaG9sZSBpbiB0aGUgZHJtX21tIGZpcnN0
IHRpbWUuIEJ1dCBpZgp0aGF0IGlzIHVuc3VjY2Vzc2Z1bCwgd2UgdGhlbiBoYXZlIHRvIGxvb2sg
YXQgbmVpZ2hib3VyaW5nIG5vZGVzLCBhbmQKdGhpcyByZXF1aXJlcyB0cmF2ZXJzaW5nIHRoZSBy
YnRyZWUuIFdhbGtpbmcgdGhlIHJidHJlZSBjYW4gYmUgc2xvdwoobXVjaCBzbG93ZXIgdGhhbiBh
IGxpbmVhciBsaXN0IGZvciBkZWVwIHRyZWVzKSwgYW5kIGlmIHRoZSBkcm1fbW0gaGFzCmJlZW4g
cHVycG9zZWZ1bGx5IGZyYWdtZW50ZWQgb3VyIHNlYXJjaCBjYW4gYmUgdHJhcHBlZCBmb3IgYSBs
b25nLCBsb25nCnRpbWUuIEZvciBub24tcHJlZW1wdGlibGUga2VybmVscywgd2UgbmVlZCB0byBi
cmVhayB1cCBsb25nIENQVSBib3VuZApzZWN0aW9ucyBieSBtYW51YWxseSBjaGVja2luZyBmb3Ig
Y29uZF9yZXNjaGVkKCk7IHNpbWlsYXJseSB3ZSBzaG91bGQKYWxzbyBiYWlsIG91dCBpZiB3ZSBo
YXZlIGJlZW4gdG9sZCB0byB0ZXJtaW5hdGUuIChJbiBhbiBpZGVhbCB3b3JsZCwgd2UKd291bGQg
YnJlYWsgZm9yIGFueSBzaWduYWwsIGJ1dCB3ZSBuZWVkIHRvIHRyYWRlIG9mZiBoYXZpbmcgdG8g
cGVyZm9ybQp0aGUgc2VhcmNoIGFnYWluIGFmdGVyIEVSRVNUQVJUU1lTLCB3aGljaCBhZ2FpbiBt
YXkgZm9ybSBhIHRyYXAgb2YKbWFraW5nIG5vIGZvcndhcmQgcHJvZ3Jlc3MuKQoKUmVwb3J0ZWQt
Ynk6IFpiaWduaWV3IEtlbXBjennFhHNraSA8emJpZ25pZXcua2VtcGN6eW5za2lAaW50ZWwuY29t
PgpTaWduZWQtb2ZmLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4K
Q2M6IFpiaWduaWV3IEtlbXBjennFhHNraSA8emJpZ25pZXcua2VtcGN6eW5za2lAaW50ZWwuY29t
PgpDYzogSm9vbmFzIExhaHRpbmVuIDxqb29uYXMubGFodGluZW5AbGludXguaW50ZWwuY29tPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fbW0uYyB8IDggKysrKysrKy0KIDEgZmlsZSBjaGFuZ2Vk
LCA3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vZHJtX21tLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX21tLmMKaW5kZXggMmE2ZTM0NjYz
MTQ2Li40N2Q1ZGU5Y2EwYTggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fbW0uYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX21tLmMKQEAgLTQ1LDYgKzQ1LDcgQEAKICNpbmNsdWRl
IDxsaW51eC9leHBvcnQuaD4KICNpbmNsdWRlIDxsaW51eC9pbnRlcnZhbF90cmVlX2dlbmVyaWMu
aD4KICNpbmNsdWRlIDxsaW51eC9zZXFfZmlsZS5oPgorI2luY2x1ZGUgPGxpbnV4L3NjaGVkL3Np
Z25hbC5oPgogI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4KICNpbmNsdWRlIDxsaW51eC9zdGFja3Ry
YWNlLmg+CiAKQEAgLTM2Niw2ICszNjcsMTEgQEAgbmV4dF9ob2xlKHN0cnVjdCBkcm1fbW0gKm1t
LAogCSAgc3RydWN0IGRybV9tbV9ub2RlICpub2RlLAogCSAgZW51bSBkcm1fbW1faW5zZXJ0X21v
ZGUgbW9kZSkKIHsKKwkvKiBTZWFyY2hpbmcgaXMgc2xvdzsgY2hlY2sgaWYgd2UgcmFuIG91dCBv
ZiB0aW1lL3BhdGllbmNlICovCisJY29uZF9yZXNjaGVkKCk7CisJaWYgKGZhdGFsX3NpZ25hbF9w
ZW5kaW5nKGN1cnJlbnQpKQorCQlyZXR1cm4gTlVMTDsKKwogCXN3aXRjaCAobW9kZSkgewogCWRl
ZmF1bHQ6CiAJY2FzZSBEUk1fTU1fSU5TRVJUX0JFU1Q6CkBAIC01NTcsNyArNTYzLDcgQEAgaW50
IGRybV9tbV9pbnNlcnRfbm9kZV9pbl9yYW5nZShzdHJ1Y3QgZHJtX21tICogY29uc3QgbW0sCiAJ
CXJldHVybiAwOwogCX0KIAotCXJldHVybiAtRU5PU1BDOworCXJldHVybiBzaWduYWxfcGVuZGlu
ZyhjdXJyZW50KSA/IC1FUkVTVEFSVFNZUyA6IC1FTk9TUEM7CiB9CiBFWFBPUlRfU1lNQk9MKGRy
bV9tbV9pbnNlcnRfbm9kZV9pbl9yYW5nZSk7CiAKLS0gCjIuMjUuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
