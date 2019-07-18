Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A196C470
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2019 03:44:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACC0E6E2D1;
	Thu, 18 Jul 2019 01:44:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F2596E2CD
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 01:44:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C7F2744BCD;
 Thu, 18 Jul 2019 01:44:25 +0000 (UTC)
Received: from whitewolf.redhat.com (ovpn-120-112.rdu2.redhat.com
 [10.10.120.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8C20619C78;
 Thu, 18 Jul 2019 01:44:24 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 06/26] drm/dp_mst: Move PDT teardown for ports into
 destroy_connector_work
Date: Wed, 17 Jul 2019 21:42:29 -0400
Message-Id: <20190718014329.8107-7-lyude@redhat.com>
In-Reply-To: <20190718014329.8107-1-lyude@redhat.com>
References: <20190718014329.8107-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Thu, 18 Jul 2019 01:44:25 +0000 (UTC)
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Juston Li <juston.li@intel.com>, Harry Wentland <hwentlan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyB3aWxsIGFsbG93IHVzIHRvIGFkZCBzb21lIGxvY2tpbmcgZm9yIHBvcnQgUERUcywgd2hp
Y2ggY2FuJ3QgYmUKZG9uZSBmcm9tIGRybV9kcF9kZXN0cm95X3BvcnQoKSBzaW5jZSB3ZSBkb24n
dCBrbm93IHdoYXQgbG9ja3MgdGhlCmNhbGxlciBtaWdodCBiZSBob2xkaW5nLiBBbHNvLCB0aGlz
IGdldHMgcmlkIG9mIGEgZ29vZCBiaXQgb2YgdW5uZWVkZWQKY29kZS4KCkNjOiBKdXN0b24gTGkg
PGp1c3Rvbi5saUBpbnRlbC5jb20+CkNjOiBJbXJlIERlYWsgPGltcmUuZGVha0BpbnRlbC5jb20+
CkNjOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgpDYzog
SGFycnkgV2VudGxhbmQgPGh3ZW50bGFuQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEx5dWRlIFBh
dWwgPGx5dWRlQHJlZGhhdC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9w
b2xvZ3kuYyB8IDQyICsrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDE3IGluc2VydGlvbnMoKyksIDI1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21z
dF90b3BvbG9neS5jCmluZGV4IGRlZmM1ZTA5ZmI5YS4uMDI5NWUwMDdjODM2IDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKQEAgLTE1MDksMzEgKzE1MDksMjIgQEAgc3RhdGlj
IHZvaWQgZHJtX2RwX2Rlc3Ryb3lfcG9ydChzdHJ1Y3Qga3JlZiAqa3JlZikKIAkJY29udGFpbmVy
X29mKGtyZWYsIHN0cnVjdCBkcm1fZHBfbXN0X3BvcnQsIHRvcG9sb2d5X2tyZWYpOwogCXN0cnVj
dCBkcm1fZHBfbXN0X3RvcG9sb2d5X21nciAqbWdyID0gcG9ydC0+bWdyOwogCi0JaWYgKCFwb3J0
LT5pbnB1dCkgewotCQlrZnJlZShwb3J0LT5jYWNoZWRfZWRpZCk7Ci0KLQkJLyoKLQkJICogVGhl
IG9ubHkgdGltZSB3ZSBkb24ndCBoYXZlIGEgY29ubmVjdG9yCi0JCSAqIG9uIGFuIG91dHB1dCBw
b3J0IGlzIGlmIHRoZSBjb25uZWN0b3IgaW5pdAotCQkgKiBmYWlscy4KLQkJICovCi0JCWlmIChw
b3J0LT5jb25uZWN0b3IpIHsKLQkJCS8qIHdlIGNhbid0IGRlc3Ryb3kgdGhlIGNvbm5lY3RvciBo
ZXJlLCBhcwotCQkJICogd2UgbWlnaHQgYmUgaG9sZGluZyB0aGUgbW9kZV9jb25maWcubXV0ZXgK
LQkJCSAqIGZyb20gYW4gRURJRCByZXRyaWV2YWwgKi8KLQotCQkJbXV0ZXhfbG9jaygmbWdyLT5k
ZXN0cm95X2Nvbm5lY3Rvcl9sb2NrKTsKLQkJCWxpc3RfYWRkKCZwb3J0LT5uZXh0LCAmbWdyLT5k
ZXN0cm95X2Nvbm5lY3Rvcl9saXN0KTsKLQkJCW11dGV4X3VubG9jaygmbWdyLT5kZXN0cm95X2Nv
bm5lY3Rvcl9sb2NrKTsKLQkJCXNjaGVkdWxlX3dvcmsoJm1nci0+ZGVzdHJveV9jb25uZWN0b3Jf
d29yayk7Ci0JCQlyZXR1cm47Ci0JCX0KLQkJLyogbm8gbmVlZCB0byBjbGVhbiB1cCB2Y3BpCi0J
CSAqIGFzIGlmIHdlIGhhdmUgbm8gY29ubmVjdG9yIHdlIG5ldmVyIHNldHVwIGEgdmNwaSAqLwot
CQlkcm1fZHBfcG9ydF90ZWFyZG93bl9wZHQocG9ydCwgcG9ydC0+cGR0KTsKLQkJcG9ydC0+cGR0
ID0gRFBfUEVFUl9ERVZJQ0VfTk9ORTsKKwkvKiBUaGVyZSdzIG5vdGhpbmcgdGhhdCBuZWVkcyBs
b2NraW5nIHRvIGRlc3Ryb3kgYW4gaW5wdXQgcG9ydCB5ZXQgKi8KKwlpZiAocG9ydC0+aW5wdXQp
IHsKKwkJZHJtX2RwX21zdF9wdXRfcG9ydF9tYWxsb2MocG9ydCk7CisJCXJldHVybjsKIAl9Ci0J
ZHJtX2RwX21zdF9wdXRfcG9ydF9tYWxsb2MocG9ydCk7CisKKwlrZnJlZShwb3J0LT5jYWNoZWRf
ZWRpZCk7CisKKwkvKgorCSAqIHdlIGNhbid0IGRlc3Ryb3kgdGhlIGNvbm5lY3RvciBoZXJlLCBh
cyB3ZSBtaWdodCBiZSBob2xkaW5nIHRoZQorCSAqIG1vZGVfY29uZmlnLm11dGV4IGZyb20gYW4g
RURJRCByZXRyaWV2YWwKKwkgKi8KKwltdXRleF9sb2NrKCZtZ3ItPmRlc3Ryb3lfY29ubmVjdG9y
X2xvY2spOworCWxpc3RfYWRkKCZwb3J0LT5uZXh0LCAmbWdyLT5kZXN0cm95X2Nvbm5lY3Rvcl9s
aXN0KTsKKwltdXRleF91bmxvY2soJm1nci0+ZGVzdHJveV9jb25uZWN0b3JfbG9jayk7CisJc2No
ZWR1bGVfd29yaygmbWdyLT5kZXN0cm95X2Nvbm5lY3Rvcl93b3JrKTsKIH0KIAogLyoqCkBAIC0z
ODgxLDcgKzM4NzIsOCBAQCBkcm1fZHBfZmluaXNoX2Rlc3Ryb3lfcG9ydChzdHJ1Y3QgZHJtX2Rw
X21zdF9wb3J0ICpwb3J0KQogewogCUlOSVRfTElTVF9IRUFEKCZwb3J0LT5uZXh0KTsKIAotCXBv
cnQtPm1nci0+Y2JzLT5kZXN0cm95X2Nvbm5lY3Rvcihwb3J0LT5tZ3IsIHBvcnQtPmNvbm5lY3Rv
cik7CisJaWYgKHBvcnQtPmNvbm5lY3RvcikKKwkJcG9ydC0+bWdyLT5jYnMtPmRlc3Ryb3lfY29u
bmVjdG9yKHBvcnQtPm1nciwgcG9ydC0+Y29ubmVjdG9yKTsKIAogCWRybV9kcF9wb3J0X3RlYXJk
b3duX3BkdChwb3J0LCBwb3J0LT5wZHQpOwogCXBvcnQtPnBkdCA9IERQX1BFRVJfREVWSUNFX05P
TkU7Ci0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
