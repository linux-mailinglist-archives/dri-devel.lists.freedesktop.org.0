Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA68D21BB5
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2019 18:37:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB7EA89916;
	Fri, 17 May 2019 16:37:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (usa-sjc-mx-foss1.foss.arm.com [217.140.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9E6EF8987C
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2019 16:37:32 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7A3581715;
 Fri, 17 May 2019 09:37:32 -0700 (PDT)
Received: from e110467-lin.cambridge.arm.com (e110467-lin.cambridge.arm.com
 [10.1.196.75])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B05A63F575;
 Fri, 17 May 2019 09:37:31 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: liviu.dudau@arm.com
Subject: [PATCH 1/2] drm/arm/hdlcd: Actually validate CRTC modes
Date: Fri, 17 May 2019 17:37:21 +0100
Message-Id: <9db0bac184d9fa69c4f65bf954ab59b53d431e15.1558111042.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.21.0.dirty
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmF0aGVyIHRoYW4gYWxsb3dpbmcgYW55IG9sZCBtb2RlIHRocm91Z2gsIHRoZW4gc3Vic2VxdWVu
dGx5IHJlZnVzaW5nCnVubWF0Y2hhYmxlIGNsb2NrIHJhdGVzIGluIGF0b21pY19jaGVjayB3aGVu
IGl0J3MgdG9vIGxhdGUgdG8gYmFjayBvdXQKYW5kIHBpY2sgYSBkaWZmZXJlbnQgbW9kZSwgbGV0
J3MgZG8gdGhhdCB2YWxpZGF0aW9uIHVwLWZyb250IHdoZXJlIGl0CndpbGwgY2F1c2UgdW5zdXBw
b3J0ZWQgbW9kZXMgdG8gYmUgY29ycmVjdGx5IHBydW5lZCBpbiB0aGUgZmlyc3QgcGxhY2UuCgpU
aGlzIGFsc28gZWxpbWluYXRlcyBhbiBpc3N1ZSB3aGVyZWJ5IGEgcGVyY2VpdmVkIGNsb2NrIHJh
dGUgb2YgMCB3b3VsZApjYXVzZSBhdG9taWMgZGlzYWJsZSB0byBmYWlsIGFuZCBwcmV2ZW50IHRo
ZSBtb2R1bGUgZnJvbSBiZWluZyB1bmxvYWRlZC4KClNpZ25lZC1vZmYtYnk6IFJvYmluIE11cnBo
eSA8cm9iaW4ubXVycGh5QGFybS5jb20+Ci0tLQoKVGhpcyBzdXBlcnNlZGVzIG15IHByZXZpb3Vz
IHBhdGNoIGhlcmU6Cmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC8yODg1
NTMvCi0tLQogZHJpdmVycy9ncHUvZHJtL2FybS9oZGxjZF9jcnRjLmMgfCAxMSArKysrKy0tLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2hkbGNkX2NydGMuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hcm0vaGRsY2RfY3J0Yy5jCmluZGV4IDBiMmI2MmY4ZmEzYy4uZWNhYzZmZTBiMjEzIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2hkbGNkX2NydGMuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vYXJtL2hkbGNkX2NydGMuYwpAQCAtMTg2LDIwICsxODYsMTkgQEAgc3RhdGljIHZvaWQg
aGRsY2RfY3J0Y19hdG9taWNfZGlzYWJsZShzdHJ1Y3QgZHJtX2NydGMgKmNydGMsCiAJY2xrX2Rp
c2FibGVfdW5wcmVwYXJlKGhkbGNkLT5jbGspOwogfQogCi1zdGF0aWMgaW50IGhkbGNkX2NydGNf
YXRvbWljX2NoZWNrKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKLQkJCQkgICBzdHJ1Y3QgZHJtX2Ny
dGNfc3RhdGUgKnN0YXRlKQorc3RhdGljIGVudW0gZHJtX21vZGVfc3RhdHVzIGhkbGNkX2NydGNf
bW9kZV92YWxpZChzdHJ1Y3QgZHJtX2NydGMgKmNydGMsCisJCWNvbnN0IHN0cnVjdCBkcm1fZGlz
cGxheV9tb2RlICptb2RlKQogewogCXN0cnVjdCBoZGxjZF9kcm1fcHJpdmF0ZSAqaGRsY2QgPSBj
cnRjX3RvX2hkbGNkX3ByaXYoY3J0Yyk7Ci0Jc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm1vZGUg
PSAmc3RhdGUtPmFkanVzdGVkX21vZGU7CiAJbG9uZyByYXRlLCBjbGtfcmF0ZSA9IG1vZGUtPmNs
b2NrICogMTAwMDsKIAogCXJhdGUgPSBjbGtfcm91bmRfcmF0ZShoZGxjZC0+Y2xrLCBjbGtfcmF0
ZSk7CiAJaWYgKHJhdGUgIT0gY2xrX3JhdGUpIHsKIAkJLyogY2xvY2sgcmVxdWlyZWQgYnkgbW9k
ZSBub3Qgc3VwcG9ydGVkIGJ5IGhhcmR3YXJlICovCi0JCXJldHVybiAtRUlOVkFMOworCQlyZXR1
cm4gTU9ERV9OT0NMT0NLOwogCX0KIAotCXJldHVybiAwOworCXJldHVybiBNT0RFX09LOwogfQog
CiBzdGF0aWMgdm9pZCBoZGxjZF9jcnRjX2F0b21pY19iZWdpbihzdHJ1Y3QgZHJtX2NydGMgKmNy
dGMsCkBAIC0yMjAsNyArMjE5LDcgQEAgc3RhdGljIHZvaWQgaGRsY2RfY3J0Y19hdG9taWNfYmVn
aW4oc3RydWN0IGRybV9jcnRjICpjcnRjLAogfQogCiBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9j
cnRjX2hlbHBlcl9mdW5jcyBoZGxjZF9jcnRjX2hlbHBlcl9mdW5jcyA9IHsKLQkuYXRvbWljX2No
ZWNrCT0gaGRsY2RfY3J0Y19hdG9taWNfY2hlY2ssCisJLm1vZGVfdmFsaWQJPSBoZGxjZF9jcnRj
X21vZGVfdmFsaWQsCiAJLmF0b21pY19iZWdpbgk9IGhkbGNkX2NydGNfYXRvbWljX2JlZ2luLAog
CS5hdG9taWNfZW5hYmxlCT0gaGRsY2RfY3J0Y19hdG9taWNfZW5hYmxlLAogCS5hdG9taWNfZGlz
YWJsZQk9IGhkbGNkX2NydGNfYXRvbWljX2Rpc2FibGUsCi0tIAoyLjIxLjAuZGlydHkKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
