Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B90AA7D04
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2019 09:48:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72D8789337;
	Wed,  4 Sep 2019 07:48:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AEE689337
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2019 07:48:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C67FC83F3B;
 Wed,  4 Sep 2019 07:48:32 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-72.ams2.redhat.com
 [10.36.117.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D888219C4F;
 Wed,  4 Sep 2019 07:48:29 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id EBBCA93E3; Wed,  4 Sep 2019 09:48:28 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/virtio: fix command submission with objects but without
 fence.
Date: Wed,  4 Sep 2019 09:48:28 +0200
Message-Id: <20190904074828.32502-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Wed, 04 Sep 2019 07:48:32 +0000 (UTC)
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
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 Gerd Hoffmann <kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T25seSBjYWxsIHZpcnRpb19ncHVfYXJyYXlfYWRkX2ZlbmNlIGlmIHdlIGFjdHVhbGx5IGhhdmUg
YSBmZW5jZS4KCkZpeGVzOiBkYTc1OGQ1MTk2OGEgKCJkcm0vdmlydGlvOiByZXdvcmsgdmlydGlv
X2dwdV9leGVjYnVmZmVyX2lvY3RsIGZlbmNpbmciKQpTaWduZWQtb2ZmLWJ5OiBHZXJkIEhvZmZt
YW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRn
cHVfdnEuYyB8IDkgKysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA0
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdw
dV92cS5jIGIvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X3ZxLmMKaW5kZXggNTk1ZmE2
ZWMyZDU4Li43ZmQyODUxZjdiOTcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8v
dmlydGdwdV92cS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV92cS5jCkBA
IC0zMzksMTEgKzMzOSwxMiBAQCBzdGF0aWMgdm9pZCB2aXJ0aW9fZ3B1X3F1ZXVlX2ZlbmNlZF9j
dHJsX2J1ZmZlcihzdHJ1Y3QgdmlydGlvX2dwdV9kZXZpY2UgKnZnZGV2LAogCQlnb3RvIGFnYWlu
OwogCX0KIAotCWlmIChmZW5jZSkKKwlpZiAoZmVuY2UpIHsKIAkJdmlydGlvX2dwdV9mZW5jZV9l
bWl0KHZnZGV2LCBoZHIsIGZlbmNlKTsKLQlpZiAodmJ1Zi0+b2JqcykgewotCQl2aXJ0aW9fZ3B1
X2FycmF5X2FkZF9mZW5jZSh2YnVmLT5vYmpzLCAmZmVuY2UtPmYpOwotCQl2aXJ0aW9fZ3B1X2Fy
cmF5X3VubG9ja19yZXN2KHZidWYtPm9ianMpOworCQlpZiAodmJ1Zi0+b2JqcykgeworCQkJdmly
dGlvX2dwdV9hcnJheV9hZGRfZmVuY2UodmJ1Zi0+b2JqcywgJmZlbmNlLT5mKTsKKwkJCXZpcnRp
b19ncHVfYXJyYXlfdW5sb2NrX3Jlc3YodmJ1Zi0+b2Jqcyk7CisJCX0KIAl9CiAJbm90aWZ5ID0g
dmlydGlvX2dwdV9xdWV1ZV9jdHJsX2J1ZmZlcl9sb2NrZWQodmdkZXYsIHZidWYpOwogCXNwaW5f
dW5sb2NrKCZ2Z2Rldi0+Y3RybHEucWxvY2spOwotLSAKMi4xOC4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
