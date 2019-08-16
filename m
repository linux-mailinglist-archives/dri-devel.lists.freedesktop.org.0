Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A21D19118D
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 17:27:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E12306EB48;
	Sat, 17 Aug 2019 15:24:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 48F6F6E14B
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 09:31:14 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8BE1028;
 Fri, 16 Aug 2019 02:31:13 -0700 (PDT)
Received: from e112269-lin.arm.com (e112269-lin.cambridge.arm.com
 [10.1.196.133])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BF0183F706;
 Fri, 16 Aug 2019 02:31:12 -0700 (PDT)
From: Steven Price <steven.price@arm.com>
To: Rob Herring <robh@kernel.org>,
	Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: [PATCH] drm/panfrost: Enable devfreq to work without regulator
Date: Fri, 16 Aug 2019 10:31:05 +0100
Message-Id: <20190816093107.30518-1-steven.price@arm.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 17 Aug 2019 15:24:21 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SWYgdGhlcmUgaXMgbm8gcmVndWxhdG9yIGRlZmluZWQgZm9yIHRoZSBHUFUgdGhlbiBzdGlsbCBj
b250cm9sIHRoZQpmcmVxdWVuY3kgdXNpbmcgdGhlIHN1cHBsaWVkIGNsb2NrLgoKU29tZSBib2Fy
ZHMgaGF2ZSBjbG9jayBjb250cm9sIGJ1dCBubyAoZGlyZWN0KSBjb250cm9sIG9mIHRoZSByZWd1
bGF0b3IuCkZvciBleGFtcGxlIHRoZSBIaUtleTk2MCB1c2VzIGEgbWFpbGJveCBwcm90b2NvbCB0
byBhIE1DVSB0byBjb250cm9sCmZyZXF1ZW5jaWVzIGFuZCBkb2Vzbid0IGRpcmVjdGx5IGNvbnRy
b2wgdGhlIHZvbHRhZ2UuIFRoaXMgcGF0Y2ggYWxsb3dzCmZyZXF1ZW5jeSBjb250cm9sIG9mIHRo
ZSBHUFUgb24gdGhpcyBzeXN0ZW0uCgpTaWduZWQtb2ZmLWJ5OiBTdGV2ZW4gUHJpY2UgPHN0ZXZl
bi5wcmljZUBhcm0uY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9k
ZXZmcmVxLmMgfCA3ICsrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDUg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZy
b3N0X2RldmZyZXEuYyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZmcmVx
LmMKaW5kZXggYTdjMThiY2ViN2ZkLi43N2UxYWQyNGRlNTMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZmcmVxLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L3BhbmZyb3N0L3BhbmZyb3N0X2RldmZyZXEuYwpAQCAtMzksNyArMzksNyBAQCBzdGF0aWMgaW50
IHBhbmZyb3N0X2RldmZyZXFfdGFyZ2V0KHN0cnVjdCBkZXZpY2UgKmRldiwgdW5zaWduZWQgbG9u
ZyAqZnJlcSwKIAkgKiBJZiBmcmVxdWVuY3kgc2NhbGluZyBmcm9tIGxvdyB0byBoaWdoLCBhZGp1
c3Qgdm9sdGFnZSBmaXJzdC4KIAkgKiBJZiBmcmVxdWVuY3kgc2NhbGluZyBmcm9tIGhpZ2ggdG8g
bG93LCBhZGp1c3QgZnJlcXVlbmN5IGZpcnN0LgogCSAqLwotCWlmIChvbGRfY2xrX3JhdGUgPCB0
YXJnZXRfcmF0ZSkgeworCWlmIChvbGRfY2xrX3JhdGUgPCB0YXJnZXRfcmF0ZSAmJiBwZmRldi0+
cmVndWxhdG9yKSB7CiAJCWVyciA9IHJlZ3VsYXRvcl9zZXRfdm9sdGFnZShwZmRldi0+cmVndWxh
dG9yLCB0YXJnZXRfdm9sdCwKIAkJCQkJICAgIHRhcmdldF92b2x0KTsKIAkJaWYgKGVycikgewpA
QCAtNTgsNyArNTgsNyBAQCBzdGF0aWMgaW50IHBhbmZyb3N0X2RldmZyZXFfdGFyZ2V0KHN0cnVj
dCBkZXZpY2UgKmRldiwgdW5zaWduZWQgbG9uZyAqZnJlcSwKIAkJcmV0dXJuIGVycjsKIAl9CiAK
LQlpZiAob2xkX2Nsa19yYXRlID4gdGFyZ2V0X3JhdGUpIHsKKwlpZiAob2xkX2Nsa19yYXRlID4g
dGFyZ2V0X3JhdGUgJiYgcGZkZXYtPnJlZ3VsYXRvcikgewogCQllcnIgPSByZWd1bGF0b3Jfc2V0
X3ZvbHRhZ2UocGZkZXYtPnJlZ3VsYXRvciwgdGFyZ2V0X3ZvbHQsCiAJCQkJCSAgICB0YXJnZXRf
dm9sdCk7CiAJCWlmIChlcnIpCkBAIC0xMzYsOSArMTM2LDYgQEAgaW50IHBhbmZyb3N0X2RldmZy
ZXFfaW5pdChzdHJ1Y3QgcGFuZnJvc3RfZGV2aWNlICpwZmRldikKIAlpbnQgcmV0OwogCXN0cnVj
dCBkZXZfcG1fb3BwICpvcHA7CiAKLQlpZiAoIXBmZGV2LT5yZWd1bGF0b3IpCi0JCXJldHVybiAw
OwotCiAJcmV0ID0gZGV2X3BtX29wcF9vZl9hZGRfdGFibGUoJnBmZGV2LT5wZGV2LT5kZXYpOwog
CWlmIChyZXQgPT0gLUVOT0RFVikgLyogT3B0aW9uYWwsIGNvbnRpbnVlIHdpdGhvdXQgZGV2ZnJl
cSAqLwogCQlyZXR1cm4gMDsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
