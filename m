Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31654D0C09
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 12:00:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 010A889BCD;
	Wed,  9 Oct 2019 10:00:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEB1E89B30;
 Wed,  9 Oct 2019 10:00:29 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1iI8lc-00089O-NS; Wed, 09 Oct 2019 10:00:24 +0000
From: Colin King <colin.king@canonical.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Chris Wilson <chris@chris-wilson.co.uk>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH][next] drm/i915/selftests: fix null pointer dereference on
 pointer data
Date: Wed,  9 Oct 2019 11:00:24 +0100
Message-Id: <20191009100024.23077-1-colin.king@canonical.com>
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

RnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KCkluIHRoZSBj
YXNlIHdoZXJlIGRhdGEgZmFpbHMgdG8gYmUgYWxsb2NhdGVkIHRoZSBlcnJvciBleGl0IHBhdGgg
aXMKdmlhIGxhYmVsICdvdXQnIHdoZXJlIGRhdGEgaXMgZGVyZWZlcmVuY2VkIGluIGEgZm9yLWxv
b3AuICBGaXggdGhpcwpieSBleGl0aW5nIHZpYSB0aGUgbGFiZWwgJ291dF9maWxlJyBpbnN0ZWFk
IHRvIGF2b2lkIHRoZSBudWxsIHBvaW50ZXIKZGVyZWZlcmVuY2UuCgpBZGRyZXNzZXMtQ292ZXJp
dHk6ICgiRGVyZWZlcmVuY2UgYWZ0ZXIgbnVsbCBjaGVjayIpCkZpeGVzOiA1MGQxNmQ0NGNjZTQg
KCJkcm0vaTkxNS9zZWxmdGVzdHM6IEV4ZXJjaXNlIGNvbnRleHQgc3dpdGNoaW5nIGluIHBhcmFs
bGVsIikKU2lnbmVkLW9mZi1ieTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2Fs
LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vc2VsZnRlc3RzL2k5MTVfZ2VtX2Nv
bnRleHQuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9zZWxmdGVzdHMvaTkx
NV9nZW1fY29udGV4dC5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL3NlbGZ0ZXN0cy9pOTE1
X2dlbV9jb250ZXh0LmMKaW5kZXggZmI1OGMwOTE5ZWExLi5lNWMyMzUwNTFhZTUgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9zZWxmdGVzdHMvaTkxNV9nZW1fY29udGV4dC5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9zZWxmdGVzdHMvaTkxNV9nZW1fY29udGV4
dC5jCkBAIC0yNjMsNyArMjYzLDcgQEAgc3RhdGljIGludCBsaXZlX3BhcmFsbGVsX3N3aXRjaCh2
b2lkICphcmcpCiAJaWYgKCFkYXRhKSB7CiAJCWk5MTVfZ2VtX2NvbnRleHRfdW5sb2NrX2VuZ2lu
ZXMoY3R4KTsKIAkJZXJyID0gLUVOT01FTTsKLQkJZ290byBvdXQ7CisJCWdvdG8gb3V0X2ZpbGU7
CiAJfQogCiAJbSA9IDA7IC8qIFVzZSB0aGUgZmlyc3QgY29udGV4dCBhcyBvdXIgdGVtcGxhdGUg
Zm9yIHRoZSBlbmdpbmVzICovCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
