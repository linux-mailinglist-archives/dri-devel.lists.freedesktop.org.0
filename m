Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A82F4A313
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 15:59:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F175B6E1BE;
	Tue, 18 Jun 2019 13:58:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3360D6E1BA
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 13:58:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C24AF30872C5;
 Tue, 18 Jun 2019 13:58:25 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-33.ams2.redhat.com
 [10.36.116.33])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 78C801001DE7;
 Tue, 18 Jun 2019 13:58:25 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E8DDF17474; Tue, 18 Jun 2019 15:58:21 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 08/12] drm/virtio: rework virtio_gpu_object_create fencing
Date: Tue, 18 Jun 2019 15:58:16 +0200
Message-Id: <20190618135821.8644-9-kraxel@redhat.com>
In-Reply-To: <20190618135821.8644-1-kraxel@redhat.com>
References: <20190618135821.8644-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Tue, 18 Jun 2019 13:58:30 +0000 (UTC)
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

VXNlIGdlbSByZXNlcnZhdGlvbiBoZWxwZXJzIGFuZCBkaXJlY3QgcmVzZXJ2YXRpb25fb2JqZWN0
XyogY2FsbHMKaW5zdGVhZCBvZiB0dG0uCgpTaWduZWQtb2ZmLWJ5OiBHZXJkIEhvZmZtYW5uIDxr
cmF4ZWxAcmVkaGF0LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfb2Jq
ZWN0LmMgfCAyOCArKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgOCBp
bnNlcnRpb25zKCspLCAyMCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vdmlydGlvL3ZpcnRncHVfb2JqZWN0LmMgYi9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRn
cHVfb2JqZWN0LmMKaW5kZXggODJiZmJmOTgzZmQyLi40NjFmMTVmMjY1MTcgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9vYmplY3QuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vdmlydGlvL3ZpcnRncHVfb2JqZWN0LmMKQEAgLTE0MSwzNCArMTQxLDIyIEBAIGludCB2
aXJ0aW9fZ3B1X29iamVjdF9jcmVhdGUoc3RydWN0IHZpcnRpb19ncHVfZGV2aWNlICp2Z2RldiwK
IAogCWlmIChmZW5jZSkgewogCQlzdHJ1Y3QgdmlydGlvX2dwdV9mZW5jZV9kcml2ZXIgKmRydiA9
ICZ2Z2Rldi0+ZmVuY2VfZHJ2OwotCQlzdHJ1Y3QgbGlzdF9oZWFkIHZhbGlkYXRlX2xpc3Q7Ci0J
CXN0cnVjdCB0dG1fdmFsaWRhdGVfYnVmZmVyIG1haW5idWY7CisJCXN0cnVjdCBkcm1fZ2VtX29i
amVjdCAqb2JqID0gJmJvLT5nZW1fYmFzZTsKIAkJc3RydWN0IHd3X2FjcXVpcmVfY3R4IHRpY2tl
dDsKIAkJdW5zaWduZWQgbG9uZyBpcnFfZmxhZ3M7Ci0JCWJvb2wgc2lnbmFsZWQ7CiAKLQkJSU5J
VF9MSVNUX0hFQUQoJnZhbGlkYXRlX2xpc3QpOwotCQltZW1zZXQoJm1haW5idWYsIDAsIHNpemVv
ZihzdHJ1Y3QgdHRtX3ZhbGlkYXRlX2J1ZmZlcikpOwotCi0JCS8qIHVzZSBhIGdlbSByZWZlcmVu
Y2Ugc2luY2UgdW5yZWYgbGlzdCB1bmRvZXMgdGhlbSAqLwotCQlkcm1fZ2VtX29iamVjdF9nZXQo
JmJvLT5nZW1fYmFzZSk7Ci0JCW1haW5idWYuYm8gPSAmYm8tPnRibzsKLQkJbGlzdF9hZGQoJm1h
aW5idWYuaGVhZCwgJnZhbGlkYXRlX2xpc3QpOwotCi0JCXJldCA9IHZpcnRpb19ncHVfb2JqZWN0
X2xpc3RfdmFsaWRhdGUoJnRpY2tldCwgJnZhbGlkYXRlX2xpc3QpOworCQlkcm1fZ2VtX29iamVj
dF9nZXQob2JqKTsKKwkJcmV0ID0gZHJtX2dlbV9sb2NrX3Jlc2VydmF0aW9ucygmb2JqLCAxLCAm
dGlja2V0KTsKIAkJaWYgKHJldCA9PSAwKSB7CiAJCQlzcGluX2xvY2tfaXJxc2F2ZSgmZHJ2LT5s
b2NrLCBpcnFfZmxhZ3MpOwotCQkJc2lnbmFsZWQgPSB2aXJ0aW9fZmVuY2Vfc2lnbmFsZWQoJmZl
bmNlLT5mKTsKLQkJCWlmICghc2lnbmFsZWQpCisJCQlpZiAoIXZpcnRpb19mZW5jZV9zaWduYWxl
ZCgmZmVuY2UtPmYpKQogCQkJCS8qIHZpcnRpbyBjcmVhdGUgY29tbWFuZCBzdGlsbCBpbiBmbGln
aHQgKi8KLQkJCQl0dG1fZXVfZmVuY2VfYnVmZmVyX29iamVjdHMoJnRpY2tldCwgJnZhbGlkYXRl
X2xpc3QsCi0JCQkJCQkJICAgICZmZW5jZS0+Zik7CisJCQkJcmVzZXJ2YXRpb25fb2JqZWN0X2Fk
ZF9leGNsX2ZlbmNlKG9iai0+cmVzdiwKKwkJCQkJCQkJICAmZmVuY2UtPmYpOwogCQkJc3Bpbl91
bmxvY2tfaXJxcmVzdG9yZSgmZHJ2LT5sb2NrLCBpcnFfZmxhZ3MpOwotCQkJaWYgKHNpZ25hbGVk
KQotCQkJCS8qIHZpcnRpbyBjcmVhdGUgY29tbWFuZCBmaW5pc2hlZCAqLwotCQkJCXR0bV9ldV9i
YWNrb2ZmX3Jlc2VydmF0aW9uKCZ0aWNrZXQsICZ2YWxpZGF0ZV9saXN0KTsKIAkJfQotCQl2aXJ0
aW9fZ3B1X3VucmVmX2xpc3QoJnZhbGlkYXRlX2xpc3QpOworCQlkcm1fZ2VtX3VubG9ja19yZXNl
cnZhdGlvbnMoJm9iaiwgMSwgJnRpY2tldCk7CisJCWRybV9nZW1fb2JqZWN0X3B1dF91bmxvY2tl
ZChvYmopOwogCX0KIAogCSpib19wdHIgPSBibzsKLS0gCjIuMTguMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
