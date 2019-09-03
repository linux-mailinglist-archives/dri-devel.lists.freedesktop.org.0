Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02487A754C
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 22:48:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C2E389A16;
	Tue,  3 Sep 2019 20:48:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2711C899B5;
 Tue,  3 Sep 2019 20:48:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A39A63018FC5;
 Tue,  3 Sep 2019 20:48:12 +0000 (UTC)
Received: from malachite.bss.redhat.com (dhcp-10-20-1-34.bss.redhat.com
 [10.20.1.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1EAF51001956;
 Tue,  3 Sep 2019 20:48:08 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH v2 08/27] drm/dp_mst: Remove PDT teardown in
 drm_dp_destroy_port() and refactor
Date: Tue,  3 Sep 2019 16:45:46 -0400
Message-Id: <20190903204645.25487-9-lyude@redhat.com>
In-Reply-To: <20190903204645.25487-1-lyude@redhat.com>
References: <20190903204645.25487-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Tue, 03 Sep 2019 20:48:12 +0000 (UTC)
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
Cc: Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Juston Li <juston.li@intel.com>,
 Harry Wentland <hwentlan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyB3aWxsIGFsbG93IHVzIHRvIGFkZCBzb21lIGxvY2tpbmcgZm9yIHBvcnQtPiogbWVtYmVy
cywgaW4KcGFydGljdWxhciB0aGUgUERUIGFuZCAtPmNvbm5lY3Rvciwgd2hpY2ggY2FuJ3QgYmUg
ZG9uZSBmcm9tCmRybV9kcF9kZXN0cm95X3BvcnQoKSBzaW5jZSB3ZSBkb24ndCBrbm93IHdoYXQg
bG9ja3MgdGhlIGNhbGxlciBtaWdodCBiZQpob2xkaW5nLgoKQ2hhbmdlcyBzaW5jZSB2MjoKKiBD
bGFyaWZ5IGNvbW1pdCBtZXNzYWdlCgpDYzogSnVzdG9uIExpIDxqdXN0b24ubGlAaW50ZWwuY29t
PgpDYzogSW1yZSBEZWFrIDxpbXJlLmRlYWtAaW50ZWwuY29tPgpDYzogVmlsbGUgU3lyasOkbMOk
IDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KQ2M6IEhhcnJ5IFdlbnRsYW5kIDxod2Vu
dGxhbkBhbWQuY29tPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4K
U2lnbmVkLW9mZi1ieTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jIHwgNDAgKysrKysrKysrKystLS0tLS0tLS0t
LS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgMjQgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKaW5kZXggZjVmMWQ4YjUwZmI2Li5h
ZjMxODlkZjI4YWEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9s
b2d5LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYwpAQCAtMTUx
MSwzMSArMTUxMSwyMiBAQCBzdGF0aWMgdm9pZCBkcm1fZHBfZGVzdHJveV9wb3J0KHN0cnVjdCBr
cmVmICprcmVmKQogCQljb250YWluZXJfb2Yoa3JlZiwgc3RydWN0IGRybV9kcF9tc3RfcG9ydCwg
dG9wb2xvZ3lfa3JlZik7CiAJc3RydWN0IGRybV9kcF9tc3RfdG9wb2xvZ3lfbWdyICptZ3IgPSBw
b3J0LT5tZ3I7CiAKLQlpZiAoIXBvcnQtPmlucHV0KSB7Ci0JCWtmcmVlKHBvcnQtPmNhY2hlZF9l
ZGlkKTsKKwkvKiBUaGVyZSdzIG5vdGhpbmcgdGhhdCBuZWVkcyBsb2NraW5nIHRvIGRlc3Ryb3kg
YW4gaW5wdXQgcG9ydCB5ZXQgKi8KKwlpZiAocG9ydC0+aW5wdXQpIHsKKwkJZHJtX2RwX21zdF9w
dXRfcG9ydF9tYWxsb2MocG9ydCk7CisJCXJldHVybjsKKwl9CiAKLQkJLyoKLQkJICogVGhlIG9u
bHkgdGltZSB3ZSBkb24ndCBoYXZlIGEgY29ubmVjdG9yCi0JCSAqIG9uIGFuIG91dHB1dCBwb3J0
IGlzIGlmIHRoZSBjb25uZWN0b3IgaW5pdAotCQkgKiBmYWlscy4KLQkJICovCi0JCWlmIChwb3J0
LT5jb25uZWN0b3IpIHsKLQkJCS8qIHdlIGNhbid0IGRlc3Ryb3kgdGhlIGNvbm5lY3RvciBoZXJl
LCBhcwotCQkJICogd2UgbWlnaHQgYmUgaG9sZGluZyB0aGUgbW9kZV9jb25maWcubXV0ZXgKLQkJ
CSAqIGZyb20gYW4gRURJRCByZXRyaWV2YWwgKi8KKwlrZnJlZShwb3J0LT5jYWNoZWRfZWRpZCk7
CiAKLQkJCW11dGV4X2xvY2soJm1nci0+ZGVsYXllZF9kZXN0cm95X2xvY2spOwotCQkJbGlzdF9h
ZGQoJnBvcnQtPm5leHQsICZtZ3ItPmRlc3Ryb3lfcG9ydF9saXN0KTsKLQkJCW11dGV4X3VubG9j
aygmbWdyLT5kZWxheWVkX2Rlc3Ryb3lfbG9jayk7Ci0JCQlzY2hlZHVsZV93b3JrKCZtZ3ItPmRl
bGF5ZWRfZGVzdHJveV93b3JrKTsKLQkJCXJldHVybjsKLQkJfQotCQkvKiBubyBuZWVkIHRvIGNs
ZWFuIHVwIHZjcGkKLQkJICogYXMgaWYgd2UgaGF2ZSBubyBjb25uZWN0b3Igd2UgbmV2ZXIgc2V0
dXAgYSB2Y3BpICovCi0JCWRybV9kcF9wb3J0X3RlYXJkb3duX3BkdChwb3J0LCBwb3J0LT5wZHQp
OwotCQlwb3J0LT5wZHQgPSBEUF9QRUVSX0RFVklDRV9OT05FOwotCX0KLQlkcm1fZHBfbXN0X3B1
dF9wb3J0X21hbGxvYyhwb3J0KTsKKwkvKgorCSAqIHdlIGNhbid0IGRlc3Ryb3kgdGhlIGNvbm5l
Y3RvciBoZXJlLCBhcyB3ZSBtaWdodCBiZSBob2xkaW5nIHRoZQorCSAqIG1vZGVfY29uZmlnLm11
dGV4IGZyb20gYW4gRURJRCByZXRyaWV2YWwKKwkgKi8KKwltdXRleF9sb2NrKCZtZ3ItPmRlbGF5
ZWRfZGVzdHJveV9sb2NrKTsKKwlsaXN0X2FkZCgmcG9ydC0+bmV4dCwgJm1nci0+ZGVzdHJveV9w
b3J0X2xpc3QpOworCW11dGV4X3VubG9jaygmbWdyLT5kZWxheWVkX2Rlc3Ryb3lfbG9jayk7CisJ
c2NoZWR1bGVfd29yaygmbWdyLT5kZWxheWVkX2Rlc3Ryb3lfd29yayk7CiB9CiAKIC8qKgpAQCAt
Mzk5OCw3ICszOTg5LDggQEAgc3RhdGljIHZvaWQgZHJtX2RwX3R4X3dvcmsoc3RydWN0IHdvcmtf
c3RydWN0ICp3b3JrKQogc3RhdGljIGlubGluZSB2b2lkCiBkcm1fZHBfZGVsYXllZF9kZXN0cm95
X3BvcnQoc3RydWN0IGRybV9kcF9tc3RfcG9ydCAqcG9ydCkKIHsKLQlwb3J0LT5tZ3ItPmNicy0+
ZGVzdHJveV9jb25uZWN0b3IocG9ydC0+bWdyLCBwb3J0LT5jb25uZWN0b3IpOworCWlmIChwb3J0
LT5jb25uZWN0b3IpCisJCXBvcnQtPm1nci0+Y2JzLT5kZXN0cm95X2Nvbm5lY3Rvcihwb3J0LT5t
Z3IsIHBvcnQtPmNvbm5lY3Rvcik7CiAKIAlkcm1fZHBfcG9ydF90ZWFyZG93bl9wZHQocG9ydCwg
cG9ydC0+cGR0KTsKIAlwb3J0LT5wZHQgPSBEUF9QRUVSX0RFVklDRV9OT05FOwotLSAKMi4yMS4w
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
