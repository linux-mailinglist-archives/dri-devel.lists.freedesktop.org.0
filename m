Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F664A30C
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 15:58:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9ECF6E1B4;
	Tue, 18 Jun 2019 13:58:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE6746E1B4
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 13:58:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6EEECB0AA6;
 Tue, 18 Jun 2019 13:58:26 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-33.ams2.redhat.com
 [10.36.116.33])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 246F81001DFF;
 Tue, 18 Jun 2019 13:58:26 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A6CFB1753A; Tue, 18 Jun 2019 15:58:22 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 11/12] drm/virtio: rework virtio_gpu_object_create fencing
 even more.
Date: Tue, 18 Jun 2019 15:58:19 +0200
Message-Id: <20190618135821.8644-12-kraxel@redhat.com>
In-Reply-To: <20190618135821.8644-1-kraxel@redhat.com>
References: <20190618135821.8644-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Tue, 18 Jun 2019 13:58:31 +0000 (UTC)
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm93IHdpdGggdHRtIGluaXRpYWxpemF0aW9uIGJlaW5nIG91dCBvZiB0aGUgd2F5IHdlIGNhbiBz
aW1wbGlmeQp2aXJ0aW9fZ3B1X29iamVjdF9jcmVhdGUgZmVuY2luZyBldmVuIG1vcmUuICBObyBu
ZWVkIHRvIGNoZWNrIHdoZW5ldmVyCnRoZSBjb21tYW5kIGlzIHN0aWxsIHJ1bm5pbmcgYWZ0ZXIg
dHRtX2JvX2luaXQoKSByZXR1cm5lZC4gIFdlIGhhdmUgYQpmdWxseSBpbml0aWFsaXplZCBnZW0g
Ym8gYmVmb3JlIHdlIGtpY2sgb2ZmIHRoZSByZXNvdXJjZSBjcmVhdGlvbgpjb21tYW5kLCBzbyB3
ZSBjYW4gc2ltcGx5IGFkZCB0aGUgZmVuY2UgdG8gdGhlIGJvJ3MgcmVzZXJ2YXRpb24gb2JqZWN0
CmJlZm9yZWhhbmQuCgpTaWduZWQtb2ZmLWJ5OiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0
LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfb2JqZWN0LmMgfCAyNyAr
KysrKysrKystLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCsp
LCAxOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3Zp
cnRncHVfb2JqZWN0LmMgYi9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfb2JqZWN0LmMK
aW5kZXggZDBlMzI4ZGIwYTU1Li40MzAxNDU2ZjA4N2YgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS92aXJ0aW8vdmlydGdwdV9vYmplY3QuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdmlydGlv
L3ZpcnRncHVfb2JqZWN0LmMKQEAgLTEyMCwzMCArMTIwLDIxIEBAIGludCB2aXJ0aW9fZ3B1X29i
amVjdF9jcmVhdGUoc3RydWN0IHZpcnRpb19ncHVfZGV2aWNlICp2Z2RldiwKIAl9CiAJYm8tPmR1
bWIgPSBwYXJhbXMtPmR1bWI7CiAKLQlpZiAocGFyYW1zLT52aXJnbCkgewotCQl2aXJ0aW9fZ3B1
X2NtZF9yZXNvdXJjZV9jcmVhdGVfM2QodmdkZXYsIGJvLCBwYXJhbXMsIGZlbmNlKTsKLQl9IGVs
c2UgewotCQl2aXJ0aW9fZ3B1X2NtZF9jcmVhdGVfcmVzb3VyY2UodmdkZXYsIGJvLCBwYXJhbXMs
IGZlbmNlKTsKLQl9Ci0KIAlpZiAoZmVuY2UpIHsKLQkJc3RydWN0IHZpcnRpb19ncHVfZmVuY2Vf
ZHJpdmVyICpkcnYgPSAmdmdkZXYtPmZlbmNlX2RydjsKIAkJc3RydWN0IGRybV9nZW1fb2JqZWN0
ICpvYmogPSAmYm8tPmJhc2UuYmFzZTsKIAkJc3RydWN0IHd3X2FjcXVpcmVfY3R4IHRpY2tldDsK
LQkJdW5zaWduZWQgbG9uZyBpcnFfZmxhZ3M7CiAKLQkJZHJtX2dlbV9vYmplY3RfZ2V0KG9iaik7
CiAJCXJldCA9IGRybV9nZW1fbG9ja19yZXNlcnZhdGlvbnMoJm9iaiwgMSwgJnRpY2tldCk7Ci0J
CWlmIChyZXQgPT0gMCkgewotCQkJc3Bpbl9sb2NrX2lycXNhdmUoJmRydi0+bG9jaywgaXJxX2Zs
YWdzKTsKLQkJCWlmICghdmlydGlvX2ZlbmNlX3NpZ25hbGVkKCZmZW5jZS0+ZikpCi0JCQkJLyog
dmlydGlvIGNyZWF0ZSBjb21tYW5kIHN0aWxsIGluIGZsaWdodCAqLwotCQkJCXJlc2VydmF0aW9u
X29iamVjdF9hZGRfZXhjbF9mZW5jZShvYmotPnJlc3YsCi0JCQkJCQkJCSAgJmZlbmNlLT5mKTsK
LQkJCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmRydi0+bG9jaywgaXJxX2ZsYWdzKTsKLQkJfQor
CQlpZiAocmV0ID09IDApCisJCQlyZXNlcnZhdGlvbl9vYmplY3RfYWRkX2V4Y2xfZmVuY2Uob2Jq
LT5yZXN2LAorCQkJCQkJCSAgJmZlbmNlLT5mKTsKIAkJZHJtX2dlbV91bmxvY2tfcmVzZXJ2YXRp
b25zKCZvYmosIDEsICZ0aWNrZXQpOwotCQlkcm1fZ2VtX29iamVjdF9wdXRfdW5sb2NrZWQob2Jq
KTsKKwl9CisKKwlpZiAocGFyYW1zLT52aXJnbCkgeworCQl2aXJ0aW9fZ3B1X2NtZF9yZXNvdXJj
ZV9jcmVhdGVfM2QodmdkZXYsIGJvLCBwYXJhbXMsIGZlbmNlKTsKKwl9IGVsc2UgeworCQl2aXJ0
aW9fZ3B1X2NtZF9jcmVhdGVfcmVzb3VyY2UodmdkZXYsIGJvLCBwYXJhbXMsIGZlbmNlKTsKIAl9
CiAKIAlyZXQgPSB2aXJ0aW9fZ3B1X29iamVjdF9hdHRhY2godmdkZXYsIGJvLCBOVUxMKTsKLS0g
CjIuMTguMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
