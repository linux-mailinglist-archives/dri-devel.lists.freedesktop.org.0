Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B22100A40
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2019 18:30:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9102989E98;
	Mon, 18 Nov 2019 17:30:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 81C3E89E98
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 17:30:15 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E56321FB;
 Mon, 18 Nov 2019 09:30:14 -0800 (PST)
Received: from e112269-lin.cambridge.arm.com (e112269-lin.cambridge.arm.com
 [10.1.194.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A35263F703;
 Mon, 18 Nov 2019 09:30:13 -0800 (PST)
From: Steven Price <steven.price@arm.com>
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: [PATCH] drm/panfrost: devfreq: Round frequencies to OPPs
Date: Mon, 18 Nov 2019 17:30:02 +0000
Message-Id: <20191118173002.32015-1-steven.price@arm.com>
X-Mailer: git-send-email 2.20.1
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
Cc: Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q3VycmVudGx5IHdoZW4gc2V0dGluZyBhIGZyZXF1ZW5jeSBpbiBwYW5mcm9zdF9kZXZmcmVxX3Rh
cmdldCB0aGUKcmV0dXJuZWQgZnJlcXVlbmN5IGlzIHRoZSBhY3R1YWwgZnJlcXVlbmN5IHRoYXQg
dGhlIGNsb2NrIGRyaXZlciByZXBvcnRzCih0aGUgcmV0dXJuIG9mIGNsa19nZXRfcmF0ZSgpKS4g
SG93ZXZlciwgd2hlcmUgdGhlIHByb3ZpZGVkIE9QUHMgZG9uJ3QKcHJlY2lzZWx5IG1hdGNoIHRo
ZSBmcmVxdWVuY2llcyB0aGF0IHRoZSBjbG9jayBhY3R1YWxseSBhY2hpZXZlcyBkZXZmcmVxCndp
bGwgdGhlbiBjb21wbGFpbiAocmVwZWF0ZWRseSk6CgogIGRldmZyZXEgZGV2ZnJlcTA6IENvdWxk
bid0IHVwZGF0ZSBmcmVxdWVuY3kgdHJhbnNpdGlvbiBpbmZvcm1hdGlvbi4KClRvIGF2b2lkIHRo
aXMgY2hhbmdlIHBhbmZyb3N0X2RldmZyZXFfdGFyZ2V0KCkgdG8gZmV0Y2ggdGhlIG9wcCB1c2lu
ZwpkZXZmcmVxX3JlY29tbWVuZWRfb3BwKCkgYW5kIG5vdCBhY3R1YWxseSBxdWVyeSB0aGUgY2xv
Y2sgZm9yIHRoZQpmcmVxdWVuY3kuCgpBIHNpbWlsYXIgcHJvYmxlbSBleGlzdHMgd2l0aCBwYW5m
cm9zdF9kZXZmcmVxX2dldF9jdXJfZnJlcSgpLCBidXQgaW4KdGhpcyBjYXNlIGJlY2F1c2UgdGhl
IGZ1bmN0aW9uIGlzIG9wdGlvbmFsIHdlIGNhbiBqdXN0IHJlbW92ZSBpdCBhbmQKZGV2ZnJlcSB3
aWxsIGZhbGwgYmFjayB0byB1c2luZyB0aGUgcHJldmlvdXNseSBzZXQgZnJlcXVlbmN5LgoKRml4
ZXM6IDIyMWJjNzc5MTRjYiAoImRybS9wYW5mcm9zdDogVXNlIGdlbmVyaWMgY29kZSBmb3IgZGV2
ZnJlcSIpClNpZ25lZC1vZmYtYnk6IFN0ZXZlbiBQcmljZSA8c3RldmVuLnByaWNlQGFybS5jb20+
Ci0tLQogZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmZyZXEuYyB8IDE5ICsr
KysrKy0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDEzIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9z
dF9kZXZmcmVxLmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2ZnJlcS5j
CmluZGV4IDRjNGU4YTMwYTFhYy4uNTM2YmE5M2IwZjQ2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2ZnJlcS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9w
YW5mcm9zdC9wYW5mcm9zdF9kZXZmcmVxLmMKQEAgLTE4LDE1ICsxOCwxOCBAQCBzdGF0aWMgdm9p
ZCBwYW5mcm9zdF9kZXZmcmVxX3VwZGF0ZV91dGlsaXphdGlvbihzdHJ1Y3QgcGFuZnJvc3RfZGV2
aWNlICpwZmRldik7CiBzdGF0aWMgaW50IHBhbmZyb3N0X2RldmZyZXFfdGFyZ2V0KHN0cnVjdCBk
ZXZpY2UgKmRldiwgdW5zaWduZWQgbG9uZyAqZnJlcSwKIAkJCQkgICB1MzIgZmxhZ3MpCiB7Ci0J
c3RydWN0IHBhbmZyb3N0X2RldmljZSAqcGZkZXYgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsKKwlz
dHJ1Y3QgZGV2X3BtX29wcCAqb3BwOwogCWludCBlcnI7CiAKKwlvcHAgPSBkZXZmcmVxX3JlY29t
bWVuZGVkX29wcChkZXYsIGZyZXEsIGZsYWdzKTsKKwlpZiAoSVNfRVJSKG9wcCkpCisJCXJldHVy
biBQVFJfRVJSKG9wcCk7CisJZGV2X3BtX29wcF9wdXQob3BwKTsKKwogCWVyciA9IGRldl9wbV9v
cHBfc2V0X3JhdGUoZGV2LCAqZnJlcSk7CiAJaWYgKGVycikKIAkJcmV0dXJuIGVycjsKIAotCSpm
cmVxID0gY2xrX2dldF9yYXRlKHBmZGV2LT5jbG9jayk7Ci0KIAlyZXR1cm4gMDsKIH0KIApAQCAt
NjAsMjAgKzYzLDEwIEBAIHN0YXRpYyBpbnQgcGFuZnJvc3RfZGV2ZnJlcV9nZXRfZGV2X3N0YXR1
cyhzdHJ1Y3QgZGV2aWNlICpkZXYsCiAJcmV0dXJuIDA7CiB9CiAKLXN0YXRpYyBpbnQgcGFuZnJv
c3RfZGV2ZnJlcV9nZXRfY3VyX2ZyZXEoc3RydWN0IGRldmljZSAqZGV2LCB1bnNpZ25lZCBsb25n
ICpmcmVxKQotewotCXN0cnVjdCBwYW5mcm9zdF9kZXZpY2UgKnBmZGV2ID0gcGxhdGZvcm1fZ2V0
X2RydmRhdGEodG9fcGxhdGZvcm1fZGV2aWNlKGRldikpOwotCi0JKmZyZXEgPSBjbGtfZ2V0X3Jh
dGUocGZkZXYtPmNsb2NrKTsKLQotCXJldHVybiAwOwotfQotCiBzdGF0aWMgc3RydWN0IGRldmZy
ZXFfZGV2X3Byb2ZpbGUgcGFuZnJvc3RfZGV2ZnJlcV9wcm9maWxlID0gewogCS5wb2xsaW5nX21z
ID0gNTAsIC8qIH4zIGZyYW1lcyAqLwogCS50YXJnZXQgPSBwYW5mcm9zdF9kZXZmcmVxX3Rhcmdl
dCwKIAkuZ2V0X2Rldl9zdGF0dXMgPSBwYW5mcm9zdF9kZXZmcmVxX2dldF9kZXZfc3RhdHVzLAot
CS5nZXRfY3VyX2ZyZXEgPSBwYW5mcm9zdF9kZXZmcmVxX2dldF9jdXJfZnJlcSwKIH07CiAKIGlu
dCBwYW5mcm9zdF9kZXZmcmVxX2luaXQoc3RydWN0IHBhbmZyb3N0X2RldmljZSAqcGZkZXYpCi0t
IAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
