Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E782830C9E
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2019 12:32:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88B0C892E2;
	Fri, 31 May 2019 10:32:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 983A7892E2;
 Fri, 31 May 2019 10:32:08 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <colin.king@canonical.com>)
 id 1hWepN-0002fd-GV; Fri, 31 May 2019 10:32:01 +0000
From: Colin King <colin.king@canonical.com>
To: Matthew Auld <matthew.auld@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Chris Wilson <chris@chris-wilson.co.uk>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH][next] drm/i915: fix use of uninitialized pointer vaddr
Date: Fri, 31 May 2019 11:32:01 +0100
Message-Id: <20190531103201.10124-1-colin.king@canonical.com>
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KClRoZSBhc3Np
Z25tZW50IG9mIGVyciBpcyB1c2luZyB0aGUgaW5jb3JyZWN0IHBvaW50ZXIgdmFkZHIgdGhhdCBo
YXMKbm90IGJlZW4gaW5pdGlhbGl6ZWQuIEZpeCB0aGlzIGJ5IHVzaW5nIHRoZSBjb3JyZWN0IHBv
aW50ZXIgb2JqIGluc3RlYWQuCgpBZGRyZXNzZXMtQ292ZXJpdHk6ICgiVW5pbml0aWFsaXplZCBw
b2ludGVyIHJlYWQiKQpGaXhlczogNjUwMWFhNGUzYTQ1ICgiZHJtL2k5MTU6IGFkZCBpbi1rZXJu
ZWwgYmxpdHRlciBjbGllbnQiKQpTaWduZWQtb2ZmLWJ5OiBDb2xpbiBJYW4gS2luZyA8Y29saW4u
a2luZ0BjYW5vbmljYWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9zZWxmdGVz
dHMvaTkxNV9nZW1fb2JqZWN0X2JsdC5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUv
Z2VtL3NlbGZ0ZXN0cy9pOTE1X2dlbV9vYmplY3RfYmx0LmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9nZW0vc2VsZnRlc3RzL2k5MTVfZ2VtX29iamVjdF9ibHQuYwppbmRleCA4ZGU1NjhkMmM3OTIu
LmUyM2Q4YzllOTI5OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL3NlbGZ0
ZXN0cy9pOTE1X2dlbV9vYmplY3RfYmx0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2Vt
L3NlbGZ0ZXN0cy9pOTE1X2dlbV9vYmplY3RfYmx0LmMKQEAgLTMyLDcgKzMyLDcgQEAgc3RhdGlj
IGludCBpZ3RfZmlsbF9ibHQodm9pZCAqYXJnKQogCiAJCW9iaiA9IGk5MTVfZ2VtX29iamVjdF9j
cmVhdGVfaW50ZXJuYWwoaTkxNSwgc3opOwogCQlpZiAoSVNfRVJSKG9iaikpIHsKLQkJCWVyciA9
IFBUUl9FUlIodmFkZHIpOworCQkJZXJyID0gUFRSX0VSUihvYmopOwogCQkJZ290byBlcnJfZmx1
c2g7CiAJCX0KIAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
