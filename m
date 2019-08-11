Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 568D089102
	for <lists+dri-devel@lfdr.de>; Sun, 11 Aug 2019 11:15:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 136556E30F;
	Sun, 11 Aug 2019 09:15:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25E686E30F;
 Sun, 11 Aug 2019 09:15:36 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from haswell.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 17958643-1500050 
 for multiple; Sun, 11 Aug 2019 10:15:25 +0100
From: Chris Wilson <chris@chris-wilson.co.uk>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/4] dma-fence: Have dma_fence_signal call signal_locked
Date: Sun, 11 Aug 2019 10:15:23 +0100
Message-Id: <20190811091523.9382-1-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <3b4da1e6-b5df-0f0e-cf4d-21dd6fd33e32@amd.com>
References: <3b4da1e6-b5df-0f0e-cf4d-21dd6fd33e32@amd.com>
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
Cc: intel-gfx@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm93IHRoYXQgZG1hX2ZlbmNlX3NpZ25hbCBhbHdheXMgdGFrZXMgdGhlIHNwaW5sb2NrIHRvIGZs
dXNoIHRoZQpjYl9saXN0LCBzaW1wbHkgdGFrZSB0aGUgc3BpbmxvY2sgYW5kIGNhbGwgZG1hX2Zl
bmNlX3NpZ25hbF9sb2NrZWQoKSB0bwphdm9pZCBjb2RlIHJlcGV0aXRpb24uCgpTdWdnZXN0ZWQt
Ynk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KU2lnbmVkLW9m
Zi1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+CkNjOiBDaHJpc3Rp
YW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Ci0tLQogZHJpdmVycy9kbWEtYnVm
L2RtYS1mZW5jZS5jIHwgMzIgKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAyMCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLmMgYi9kcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNl
LmMKaW5kZXggYWI0YTQ1NmJiYTA0Li4zNjdiNzEwODRkMzQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
ZG1hLWJ1Zi9kbWEtZmVuY2UuYworKysgYi9kcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLmMKQEAg
LTEyMiwyNiArMTIyLDE4IEBAIEVYUE9SVF9TWU1CT0woZG1hX2ZlbmNlX2NvbnRleHRfYWxsb2Mp
OwogICovCiBpbnQgZG1hX2ZlbmNlX3NpZ25hbF9sb2NrZWQoc3RydWN0IGRtYV9mZW5jZSAqZmVu
Y2UpCiB7Ci0JaW50IHJldCA9IDA7Ci0KLQlsb2NrZGVwX2Fzc2VydF9oZWxkKGZlbmNlLT5sb2Nr
KTsKLQogCWlmIChXQVJOX09OKCFmZW5jZSkpCiAJCXJldHVybiAtRUlOVkFMOwogCi0JaWYgKCFf
X2RtYV9mZW5jZV9zaWduYWwoZmVuY2UpKSB7Ci0JCXJldCA9IC1FSU5WQUw7CisJbG9ja2RlcF9h
c3NlcnRfaGVsZChmZW5jZS0+bG9jayk7CiAKLQkJLyoKLQkJICogd2UgbWlnaHQgaGF2ZSByYWNl
ZCB3aXRoIHRoZSB1bmxvY2tlZCBkbWFfZmVuY2Vfc2lnbmFsLAotCQkgKiBzdGlsbCBydW4gdGhy
b3VnaCBhbGwgY2FsbGJhY2tzCi0JCSAqLwotCX0gZWxzZSB7Ci0JCV9fZG1hX2ZlbmNlX3NpZ25h
bF9fdGltZXN0YW1wKGZlbmNlLCBrdGltZV9nZXQoKSk7Ci0JfQorCWlmICghX19kbWFfZmVuY2Vf
c2lnbmFsKGZlbmNlKSkKKwkJcmV0dXJuIC1FSU5WQUw7CiAKKwlfX2RtYV9mZW5jZV9zaWduYWxf
X3RpbWVzdGFtcChmZW5jZSwga3RpbWVfZ2V0KCkpOwogCV9fZG1hX2ZlbmNlX3NpZ25hbF9fbm90
aWZ5KGZlbmNlKTsKLQlyZXR1cm4gcmV0OworCisJcmV0dXJuIDA7CiB9CiBFWFBPUlRfU1lNQk9M
KGRtYV9mZW5jZV9zaWduYWxfbG9ja2VkKTsKIApAQCAtMTYxLDE5ICsxNTMsMTkgQEAgRVhQT1JU
X1NZTUJPTChkbWFfZmVuY2Vfc2lnbmFsX2xvY2tlZCk7CiBpbnQgZG1hX2ZlbmNlX3NpZ25hbChz
dHJ1Y3QgZG1hX2ZlbmNlICpmZW5jZSkKIHsKIAl1bnNpZ25lZCBsb25nIGZsYWdzOworCWludCBy
ZXQ7CiAKIAlpZiAoIWZlbmNlKQogCQlyZXR1cm4gLUVJTlZBTDsKIAotCWlmICghX19kbWFfZmVu
Y2Vfc2lnbmFsKGZlbmNlKSkKLQkJcmV0dXJuIC1FSU5WQUw7Ci0KLQlfX2RtYV9mZW5jZV9zaWdu
YWxfX3RpbWVzdGFtcChmZW5jZSwga3RpbWVfZ2V0KCkpOworCWlmICh0ZXN0X2JpdChETUFfRkVO
Q0VfRkxBR19TSUdOQUxFRF9CSVQsICZmZW5jZS0+ZmxhZ3MpKQorCQlyZXR1cm4gMDsKIAogCXNw
aW5fbG9ja19pcnFzYXZlKGZlbmNlLT5sb2NrLCBmbGFncyk7Ci0JX19kbWFfZmVuY2Vfc2lnbmFs
X19ub3RpZnkoZmVuY2UpOworCXJldCA9IGRtYV9mZW5jZV9zaWduYWxfbG9ja2VkKGZlbmNlKTsK
IAlzcGluX3VubG9ja19pcnFyZXN0b3JlKGZlbmNlLT5sb2NrLCBmbGFncyk7Ci0JcmV0dXJuIDA7
CisKKwlyZXR1cm4gcmV0OwogfQogRVhQT1JUX1NZTUJPTChkbWFfZmVuY2Vfc2lnbmFsKTsKIAot
LSAKMi4yMy4wLnJjMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
