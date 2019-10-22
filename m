Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C56DFBC7
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 04:39:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B27C66E338;
	Tue, 22 Oct 2019 02:39:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CD8D6E328
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 02:39:29 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-B2tmot1FNk2gcBMnSqETHQ-1; Mon, 21 Oct 2019 22:39:23 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B4B1476;
 Tue, 22 Oct 2019 02:39:21 +0000 (UTC)
Received: from malachite.redhat.com (ovpn-120-98.rdu2.redhat.com
 [10.10.120.98])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2BAE760126;
 Tue, 22 Oct 2019 02:39:19 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 02/14] drm/dp_mst: Remove PDT teardown in
 drm_dp_destroy_port() and refactor
Date: Mon, 21 Oct 2019 22:35:57 -0400
Message-Id: <20191022023641.8026-3-lyude@redhat.com>
In-Reply-To: <20191022023641.8026-1-lyude@redhat.com>
References: <20191022023641.8026-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: B2tmot1FNk2gcBMnSqETHQ-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1571711967;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gKy6W32x2qP1eZ4WJP4J8ASTecONLiBU0JVgq0FS4mI=;
 b=WFKYn8VmMF5UQ47aD/cp6PrY6WT9w44aVxKtio9je6qmVDmwIwdYIkBS9Sr1a4yFtDdLgC
 q2NPefSA2naEZsOwJdqIPXjQSRcKO0gQ6r1ynl5dgEPTsw7XI3/YXqu/83QTsRZy9F6Wdq
 luNnlnoNej17DKL5nTA/V9AzN+fuLLs=
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-kernel@vger.kernel.org, Harry Wentland <hwentlan@amd.com>,
 Juston Li <juston.li@intel.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyB3aWxsIGFsbG93IHVzIHRvIGFkZCBzb21lIGxvY2tpbmcgZm9yIHBvcnQtPiogbWVtYmVy
cywgaW4KcGFydGljdWxhciB0aGUgUERUIGFuZCAtPmNvbm5lY3Rvciwgd2hpY2ggY2FuJ3QgYmUg
ZG9uZSBmcm9tCmRybV9kcF9kZXN0cm95X3BvcnQoKSBzaW5jZSB3ZSBkb24ndCBrbm93IHdoYXQg
bG9ja3MgdGhlIGNhbGxlciBtaWdodCBiZQpob2xkaW5nLgoKTm90ZSB0aGF0IHdlIGFscmVhZHkg
ZG8gdGhpcyBpbiBkZWxheWVkX2Rlc3Ryb3lfd29yayAocmVuYW1lZCBmcm9tCmRlc3Ryb3lfY29u
bmVjdG9yX3dvcmsgaW4gdGhpcyBwYXRjaCkgZm9yIHBvcnRzLCB3ZSdyZSBqdXN0IG1ha2luZyBp
dCBzbwptc3RicyBhcmUgYWxzbyBkZXN0cm95ZWQgaW4gdGhpcyB3b3JrZXIuCgpDaGFuZ2VzIHNp
bmNlIHYyOgoqIENsYXJpZnkgY29tbWl0IG1lc3NhZ2UKQ2hhbmdlcyBzaW5jZSB2NDoKKiBDbGFy
aWZ5IGNvbW1pdCBtZXNzYWdlIG1vcmUKCkNjOiBKdXN0b24gTGkgPGp1c3Rvbi5saUBpbnRlbC5j
b20+CkNjOiBJbXJlIERlYWsgPGltcmUuZGVha0BpbnRlbC5jb20+CkNjOiBWaWxsZSBTeXJqw6Rs
w6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgpDYzogSGFycnkgV2VudGxhbmQgPGh3
ZW50bGFuQGFtZC5jb20+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNo
PgpSZXZpZXdlZC1ieTogU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+ClNpZ25lZC1vZmYtYnk6
IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9k
cF9tc3RfdG9wb2xvZ3kuYyB8IDQwICsrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxl
IGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDI0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMgYi9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2RwX21zdF90b3BvbG9neS5jCmluZGV4IDY2ZmYyMjZkOGM4Ni4uMjA0ZDBjODMyYzY1IDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKQEAgLTE1MTAsMzEgKzE1MTAsMjIg
QEAgc3RhdGljIHZvaWQgZHJtX2RwX2Rlc3Ryb3lfcG9ydChzdHJ1Y3Qga3JlZiAqa3JlZikKIAkJ
Y29udGFpbmVyX29mKGtyZWYsIHN0cnVjdCBkcm1fZHBfbXN0X3BvcnQsIHRvcG9sb2d5X2tyZWYp
OwogCXN0cnVjdCBkcm1fZHBfbXN0X3RvcG9sb2d5X21nciAqbWdyID0gcG9ydC0+bWdyOwogCi0J
aWYgKCFwb3J0LT5pbnB1dCkgewotCQlrZnJlZShwb3J0LT5jYWNoZWRfZWRpZCk7CisJLyogVGhl
cmUncyBub3RoaW5nIHRoYXQgbmVlZHMgbG9ja2luZyB0byBkZXN0cm95IGFuIGlucHV0IHBvcnQg
eWV0ICovCisJaWYgKHBvcnQtPmlucHV0KSB7CisJCWRybV9kcF9tc3RfcHV0X3BvcnRfbWFsbG9j
KHBvcnQpOworCQlyZXR1cm47CisJfQogCi0JCS8qCi0JCSAqIFRoZSBvbmx5IHRpbWUgd2UgZG9u
J3QgaGF2ZSBhIGNvbm5lY3RvcgotCQkgKiBvbiBhbiBvdXRwdXQgcG9ydCBpcyBpZiB0aGUgY29u
bmVjdG9yIGluaXQKLQkJICogZmFpbHMuCi0JCSAqLwotCQlpZiAocG9ydC0+Y29ubmVjdG9yKSB7
Ci0JCQkvKiB3ZSBjYW4ndCBkZXN0cm95IHRoZSBjb25uZWN0b3IgaGVyZSwgYXMKLQkJCSAqIHdl
IG1pZ2h0IGJlIGhvbGRpbmcgdGhlIG1vZGVfY29uZmlnLm11dGV4Ci0JCQkgKiBmcm9tIGFuIEVE
SUQgcmV0cmlldmFsICovCisJa2ZyZWUocG9ydC0+Y2FjaGVkX2VkaWQpOwogCi0JCQltdXRleF9s
b2NrKCZtZ3ItPmRlbGF5ZWRfZGVzdHJveV9sb2NrKTsKLQkJCWxpc3RfYWRkKCZwb3J0LT5uZXh0
LCAmbWdyLT5kZXN0cm95X3BvcnRfbGlzdCk7Ci0JCQltdXRleF91bmxvY2soJm1nci0+ZGVsYXll
ZF9kZXN0cm95X2xvY2spOwotCQkJc2NoZWR1bGVfd29yaygmbWdyLT5kZWxheWVkX2Rlc3Ryb3lf
d29yayk7Ci0JCQlyZXR1cm47Ci0JCX0KLQkJLyogbm8gbmVlZCB0byBjbGVhbiB1cCB2Y3BpCi0J
CSAqIGFzIGlmIHdlIGhhdmUgbm8gY29ubmVjdG9yIHdlIG5ldmVyIHNldHVwIGEgdmNwaSAqLwot
CQlkcm1fZHBfcG9ydF90ZWFyZG93bl9wZHQocG9ydCwgcG9ydC0+cGR0KTsKLQkJcG9ydC0+cGR0
ID0gRFBfUEVFUl9ERVZJQ0VfTk9ORTsKLQl9Ci0JZHJtX2RwX21zdF9wdXRfcG9ydF9tYWxsb2Mo
cG9ydCk7CisJLyoKKwkgKiB3ZSBjYW4ndCBkZXN0cm95IHRoZSBjb25uZWN0b3IgaGVyZSwgYXMg
d2UgbWlnaHQgYmUgaG9sZGluZyB0aGUKKwkgKiBtb2RlX2NvbmZpZy5tdXRleCBmcm9tIGFuIEVE
SUQgcmV0cmlldmFsCisJICovCisJbXV0ZXhfbG9jaygmbWdyLT5kZWxheWVkX2Rlc3Ryb3lfbG9j
ayk7CisJbGlzdF9hZGQoJnBvcnQtPm5leHQsICZtZ3ItPmRlc3Ryb3lfcG9ydF9saXN0KTsKKwlt
dXRleF91bmxvY2soJm1nci0+ZGVsYXllZF9kZXN0cm95X2xvY2spOworCXNjaGVkdWxlX3dvcmso
Jm1nci0+ZGVsYXllZF9kZXN0cm95X3dvcmspOwogfQogCiAvKioKQEAgLTM5ODEsNyArMzk3Miw4
IEBAIHN0YXRpYyB2b2lkIGRybV9kcF90eF93b3JrKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yaykK
IHN0YXRpYyBpbmxpbmUgdm9pZAogZHJtX2RwX2RlbGF5ZWRfZGVzdHJveV9wb3J0KHN0cnVjdCBk
cm1fZHBfbXN0X3BvcnQgKnBvcnQpCiB7Ci0JcG9ydC0+bWdyLT5jYnMtPmRlc3Ryb3lfY29ubmVj
dG9yKHBvcnQtPm1nciwgcG9ydC0+Y29ubmVjdG9yKTsKKwlpZiAocG9ydC0+Y29ubmVjdG9yKQor
CQlwb3J0LT5tZ3ItPmNicy0+ZGVzdHJveV9jb25uZWN0b3IocG9ydC0+bWdyLCBwb3J0LT5jb25u
ZWN0b3IpOwogCiAJZHJtX2RwX3BvcnRfdGVhcmRvd25fcGR0KHBvcnQsIHBvcnQtPnBkdCk7CiAJ
cG9ydC0+cGR0ID0gRFBfUEVFUl9ERVZJQ0VfTk9ORTsKLS0gCjIuMjEuMAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
