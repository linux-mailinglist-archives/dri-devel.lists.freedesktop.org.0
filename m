Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 748BC83000
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 12:48:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2803089010;
	Tue,  6 Aug 2019 10:48:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id C59A089010
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2019 10:48:43 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6C036337;
 Tue,  6 Aug 2019 03:48:43 -0700 (PDT)
Received: from DESKTOP-E1NTVVP.cambridge.arm.com (unknown [10.1.25.192])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 427DB3F694;
 Tue,  6 Aug 2019 03:48:42 -0700 (PDT)
From: Brian Starkey <brian.starkey@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>,
 "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>,
 "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>, nd@arm.com,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2] drm/crc-debugfs: Add notes about CRC<->commit interactions
Date: Tue,  6 Aug 2019 11:48:35 +0100
Message-Id: <20190806104835.26075-1-brian.starkey@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190806091233.GX7444@phenom.ffwll.local>
References: <20190806091233.GX7444@phenom.ffwll.local>
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
Cc: LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q1JDIGdlbmVyYXRpb24gY2FuIGJlIGltcGFjdGVkIGJ5IGNvbW1pdHMgY29taW5nIGZyb20gdXNl
cnNwYWNlLCBhbmQKZW5hYmxpbmcgQ1JDIGdlbmVyYXRpb24gbWF5IGl0c2VsZiB0cmlnZ2VyIGEg
Y29tbWl0LiBBZGQgbm90ZXMgYWJvdXQKdGhpcyB0byB0aGUga2VybmVsZG9jLgoKU2lnbmVkLW9m
Zi1ieTogQnJpYW4gU3RhcmtleSA8YnJpYW4uc3RhcmtleUBhcm0uY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9kcm1fZGVidWdmc19jcmMuYyB8IDE3ICsrKysrKysrKysrKystLS0tCiBpbmNsdWRl
L2RybS9kcm1fY3J0Yy5oICAgICAgICAgICAgfCAgNCArKysrCiAyIGZpbGVzIGNoYW5nZWQsIDE3
IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2RybV9kZWJ1Z2ZzX2NyYy5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kZWJ1Z2ZzX2NyYy5j
CmluZGV4IDdjYTQ4NmQ3NTBlOS4uNzcxNTliNmU3N2MzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vZHJtX2RlYnVnZnNfY3JjLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kZWJ1Z2Zz
X2NyYy5jCkBAIC02NSwxMCArNjUsMTkgQEAKICAqIGl0IHN1Ym1pdHMuIEluIHRoaXMgZ2VuZXJh
bCBjYXNlLCB0aGUgbWF4aW11bSB1c2Vyc3BhY2UgY2FuIGRvIGlzIHRvIGNvbXBhcmUKICAqIHRo
ZSByZXBvcnRlZCBDUkNzIG9mIGZyYW1lcyB0aGF0IHNob3VsZCBoYXZlIHRoZSBzYW1lIGNvbnRl
bnRzLgogICoKLSAqIE9uIHRoZSBkcml2ZXIgc2lkZSB0aGUgaW1wbGVtZW50YXRpb24gZWZmb3J0
IGlzIG1pbmltYWwsIGRyaXZlcnMgb25seSBuZWVkIHRvCi0gKiBpbXBsZW1lbnQgJmRybV9jcnRj
X2Z1bmNzLnNldF9jcmNfc291cmNlLiBUaGUgZGVidWdmcyBmaWxlcyBhcmUgYXV0b21hdGljYWxs
eQotICogc2V0IHVwIGlmIHRoYXQgdmZ1bmMgaXMgc2V0LiBDUkMgc2FtcGxlcyBuZWVkIHRvIGJl
IGNhcHR1cmVkIGluIHRoZSBkcml2ZXIgYnkKLSAqIGNhbGxpbmcgZHJtX2NydGNfYWRkX2NyY19l
bnRyeSgpLgorICogT24gdGhlIGRyaXZlciBzaWRlIHRoZSBpbXBsZW1lbnRhdGlvbiBlZmZvcnQg
aXMgbWluaW1hbCwgZHJpdmVycyBvbmx5IG5lZWQKKyAqIHRvIGltcGxlbWVudCAmZHJtX2NydGNf
ZnVuY3Muc2V0X2NyY19zb3VyY2UuIFRoZSBkZWJ1Z2ZzIGZpbGVzIGFyZQorICogYXV0b21hdGlj
YWxseSBzZXQgdXAgaWYgdGhhdCB2ZnVuYyBpcyBzZXQuIENSQyBzYW1wbGVzIG5lZWQgdG8gYmUg
Y2FwdHVyZWQKKyAqIGluIHRoZSBkcml2ZXIgYnkgY2FsbGluZyBkcm1fY3J0Y19hZGRfY3JjX2Vu
dHJ5KCkuIERlcGVuZGluZyBvbiB0aGUgZHJpdmVyCisgKiBhbmQgSFcgcmVxdWlyZW1lbnRzLCAm
ZHJtX2NydGNfZnVuY3Muc2V0X2NyY19zb3VyY2UgbWF5IHJlc3VsdCBpbiBhIGNvbW1pdAorICog
KGV2ZW4gYSBmdWxsIG1vZGVzZXQpLgorICoKKyAqIENSQyByZXN1bHRzIG11c3QgYmUgcmVsaWFi
bGUgYWNyb3NzIG5vbi1mdWxsLW1vZGVzZXQgYXRvbWljIGNvbW1pdHMsIHNvIGlmIGEKKyAqIGNv
bW1pdCB2aWEgRFJNX0lPQ1RMX01PREVfQVRPTUlDIHdvdWxkIGRpc2FibGUgb3Igb3RoZXJ3aXNl
IGludGVyZmVyZSB3aXRoCisgKiBDUkMgZ2VuZXJhdGlvbiwgdGhlbiB0aGUgZHJpdmVyIG11c3Qg
bWFyayB0aGF0IGNvbW1pdCBhcyBhIGZ1bGwgbW9kZXNldAorICogKGRybV9hdG9taWNfY3J0Y19u
ZWVkc19tb2Rlc2V0KCkgc2hvdWxkIHJldHVybiB0cnVlKS4gQXMgYSByZXN1bHQsIHRvIGVuc3Vy
ZQorICogY29uc2lzdGVudCByZXN1bHRzLCBnZW5lcmljIHVzZXJzcGFjZSBtdXN0IHJlLXNldHVw
IENSQyBnZW5lcmF0aW9uIGFmdGVyIGEKKyAqIGxlZ2FjeSBTRVRDUlRDIG9yIGFuIGF0b21pYyBj
b21taXQgd2l0aCBEUk1fTU9ERV9BVE9NSUNfQUxMT1dfTU9ERVNFVC4KICAqLwogCiBzdGF0aWMg
aW50IGNyY19jb250cm9sX3Nob3coc3RydWN0IHNlcV9maWxlICptLCB2b2lkICpkYXRhKQpkaWZm
IC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2NydGMuaCBiL2luY2x1ZGUvZHJtL2RybV9jcnRjLmgK
aW5kZXggMTI4ZDhiMjEwNjIxLi43ZDE0YzExYmRjMGEgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJt
L2RybV9jcnRjLmgKKysrIGIvaW5jbHVkZS9kcm0vZHJtX2NydGMuaApAQCAtNzU2LDYgKzc1Niw5
IEBAIHN0cnVjdCBkcm1fY3J0Y19mdW5jcyB7CiAJICogcHJvdmlkZWQgZnJvbSB0aGUgY29uZmln
dXJlZCBzb3VyY2UuIERyaXZlcnMgbXVzdCBhY2NlcHQgYW4gImF1dG8iCiAJICogc291cmNlIG5h
bWUgdGhhdCB3aWxsIHNlbGVjdCBhIGRlZmF1bHQgc291cmNlIGZvciB0aGlzIENSVEMuCiAJICoK
KwkgKiBUaGlzIG1heSB0cmlnZ2VyIGFuIGF0b21pYyBtb2Rlc2V0IGNvbW1pdCBpZiBuZWNlc3Nh
cnksIHRvIGVuYWJsZSBDUkMKKwkgKiBnZW5lcmF0aW9uLgorCSAqCiAJICogTm90ZSB0aGF0ICJh
dXRvIiBjYW4gZGVwZW5kIHVwb24gdGhlIGN1cnJlbnQgbW9kZXNldCBjb25maWd1cmF0aW9uLAog
CSAqIGUuZy4gaXQgY291bGQgcGljayBhbiBlbmNvZGVyIG9yIG91dHB1dCBzcGVjaWZpYyBDUkMg
c2FtcGxpbmcgcG9pbnQuCiAJICoKQEAgLTc2Nyw2ICs3NzAsNyBAQCBzdHJ1Y3QgZHJtX2NydGNf
ZnVuY3MgewogCSAqIDAgb24gc3VjY2VzcyBvciBhIG5lZ2F0aXZlIGVycm9yIGNvZGUgb24gZmFp
bHVyZS4KIAkgKi8KIAlpbnQgKCpzZXRfY3JjX3NvdXJjZSkoc3RydWN0IGRybV9jcnRjICpjcnRj
LCBjb25zdCBjaGFyICpzb3VyY2UpOworCiAJLyoqCiAJICogQHZlcmlmeV9jcmNfc291cmNlOgog
CSAqCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
