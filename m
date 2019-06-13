Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C38435CC
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 14:18:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 029DC8999A;
	Thu, 13 Jun 2019 12:18:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 109B589996
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 12:18:20 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Jun 2019 05:18:19 -0700
X-ExtLoop1: 1
Received: from ovasilev-desk1.fi.intel.com ([10.237.72.57])
 by orsmga001.jf.intel.com with ESMTP; 13 Jun 2019 05:18:17 -0700
From: Oleg Vasilev <oleg.vasilev@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] drm/vkms: stop generating CRCs on buffer overflow
Date: Thu, 13 Jun 2019 15:18:01 +0300
Message-Id: <20190613121802.2193-2-oleg.vasilev@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190613121802.2193-1-oleg.vasilev@intel.com>
References: <20190613121802.2193-1-oleg.vasilev@intel.com>
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
Cc: Shayenne Moura <shayenneluzmoura@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QmVjYXVzZSBpbnRlcnJ1cHRzIGFyZSBnZW5lcmF0ZWQgYXJ0aWZpdGlhbGx5LCBrZXJuZWwgYnVn
IG1heSBsZWFkIHRvCmluZmludGUgYXR0ZW1wdHMgdG8gc3VibWl0IENSQy4KClNpZ25lZC1vZmYt
Ynk6IE9sZWcgVmFzaWxldiA8b2xlZy52YXNpbGV2QGludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vdmttcy92a21zX2NyYy5jIHwgMTAgKysrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDkg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS92a21zL3ZrbXNfY3JjLmMgYi9kcml2ZXJzL2dwdS9kcm0vdmttcy92a21zX2NyYy5jCmluZGV4
IGQ3YjQwOWEzYzBmOC4uYmM3MTdhODg4OGI1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
dmttcy92a21zX2NyYy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS92a21zL3ZrbXNfY3JjLmMKQEAg
LTE2Nyw2ICsxNjcsNyBAQCB2b2lkIHZrbXNfY3JjX3dvcmtfaGFuZGxlKHN0cnVjdCB3b3JrX3N0
cnVjdCAqd29yaykKIAl1MzIgY3JjMzIgPSAwOwogCXU2NCBmcmFtZV9zdGFydCwgZnJhbWVfZW5k
OwogCXVuc2lnbmVkIGxvbmcgZmxhZ3M7CisJaW50IHJldDsKIAogCXNwaW5fbG9ja19pcnFzYXZl
KCZvdXQtPnN0YXRlX2xvY2ssIGZsYWdzKTsKIAlmcmFtZV9zdGFydCA9IGNydGNfc3RhdGUtPmZy
YW1lX3N0YXJ0OwpAQCAtMjAyLDcgKzIwMywxNCBAQCB2b2lkIHZrbXNfY3JjX3dvcmtfaGFuZGxl
KHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yaykKIAkgKiBtaXNzaW5nIGZyYW1lcwogCSAqLwogCXdo
aWxlIChmcmFtZV9zdGFydCA8PSBmcmFtZV9lbmQpCi0JCWRybV9jcnRjX2FkZF9jcmNfZW50cnko
Y3J0YywgdHJ1ZSwgZnJhbWVfc3RhcnQrKywgJmNyYzMyKTsKKwl7CisJCXJldCA9IGRybV9jcnRj
X2FkZF9jcmNfZW50cnkoY3J0YywgdHJ1ZSwgZnJhbWVfc3RhcnQrKywgJmNyYzMyKTsKKwkJaWYg
KHJldCkgeworCQkJRFJNX1dBUk4oIlZLTVMgc3RvcCBnZW5lcmF0aW5nIENSQ3NcbiIpOworCQkJ
b3V0LT5jcmNfZW5hYmxlZCA9IGZhbHNlOworCQkJYnJlYWs7CisJCX0KKwl9CiAKIG91dDoKIAkv
KiB0byBhdm9pZCB1c2luZyB0aGUgc2FtZSB2YWx1ZSBmb3IgZnJhbWUgbnVtYmVyIGFnYWluICov
Ci0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
