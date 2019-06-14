Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBC645949
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 11:51:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9AE9896C4;
	Fri, 14 Jun 2019 09:51:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 694FE896C4
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 09:51:20 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C2DA621721;
 Fri, 14 Jun 2019 09:51:19 +0000 (UTC)
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 1/2] drm: debugfs: make drm_debugfs_remove_files() a void
 function
Date: Fri, 14 Jun 2019 11:51:09 +0200
Message-Id: <20190614095110.3716-1-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1560505880;
 bh=iOpdFvSH3lQnymOzypBokmI9+g0uhnAJnYe9Fi4ro2I=;
 h=From:To:Cc:Subject:Date:From;
 b=Qz6OWEbwkcwaAtDrHO0CYPAjYe8odHg7WsKojXC+SMmH80SRV5lCnBZ6+tzazxX+x
 /Fzt8Ldt/QoDHQ5qq5kKxXfTvXBpbKdGpTJ7BzADZ4J6Spscq9k8lN4K8iHbOdWFkQ
 fZlQDxN4Hr1X0hYD4Kxh07r/bEAvKK8a4tsIW1qE=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sean Paul <sean@poorly.run>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGZ1bmN0aW9uIGNhbiBub3QgZmFpbCwgYW5kIG5vIG9uZSBjaGVja3MgdGhlIGN1cnJlbnQg
cmV0dXJuIHZhbHVlLApzbyBqdXN0IG1hcmsgaXQgYXMgYSB2b2lkIGZ1bmN0aW9uIHNvIG5vIG9u
ZSBnZXRzIGNvbmZ1c2VkLgoKQ2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3Jz
dEBsaW51eC5pbnRlbC5jb20+CkNjOiBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlwYXJkQGJvb3Rs
aW4uY29tPgpDYzogU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+CkNjOiBEYXZpZCBBaXJsaWUg
PGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNj
OiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnClNpZ25lZC1vZmYtYnk6IEdyZWcgS3Jv
YWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2RybV9kZWJ1Z2ZzLmMgfCA1ICsrLS0tCiBpbmNsdWRlL2RybS9kcm1fZGVidWdmcy5oICAg
ICB8IDkgKysrKy0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgOCBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVnZnMuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fZGVidWdmcy5jCmluZGV4IDZmMjgwMmU5YmZiNS4uNTE1NTY5MDAy
Yzg2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVnZnMuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vZHJtX2RlYnVnZnMuYwpAQCAtMjcwLDggKzI3MCw4IEBAIGludCBkcm1fZGVi
dWdmc19pbml0KHN0cnVjdCBkcm1fbWlub3IgKm1pbm9yLCBpbnQgbWlub3JfaWQsCiB9CiAKIAot
aW50IGRybV9kZWJ1Z2ZzX3JlbW92ZV9maWxlcyhjb25zdCBzdHJ1Y3QgZHJtX2luZm9fbGlzdCAq
ZmlsZXMsIGludCBjb3VudCwKLQkJCSAgICAgc3RydWN0IGRybV9taW5vciAqbWlub3IpCit2b2lk
IGRybV9kZWJ1Z2ZzX3JlbW92ZV9maWxlcyhjb25zdCBzdHJ1Y3QgZHJtX2luZm9fbGlzdCAqZmls
ZXMsIGludCBjb3VudCwKKwkJCSAgICAgIHN0cnVjdCBkcm1fbWlub3IgKm1pbm9yKQogewogCXN0
cnVjdCBsaXN0X2hlYWQgKnBvcywgKnE7CiAJc3RydWN0IGRybV9pbmZvX25vZGUgKnRtcDsKQEAg
LTI4OSw3ICsyODksNiBAQCBpbnQgZHJtX2RlYnVnZnNfcmVtb3ZlX2ZpbGVzKGNvbnN0IHN0cnVj
dCBkcm1faW5mb19saXN0ICpmaWxlcywgaW50IGNvdW50LAogCQl9CiAJfQogCW11dGV4X3VubG9j
aygmbWlub3ItPmRlYnVnZnNfbG9jayk7Ci0JcmV0dXJuIDA7CiB9CiBFWFBPUlRfU1lNQk9MKGRy
bV9kZWJ1Z2ZzX3JlbW92ZV9maWxlcyk7CiAKZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9k
ZWJ1Z2ZzLmggYi9pbmNsdWRlL2RybS9kcm1fZGVidWdmcy5oCmluZGV4IGFjMGY3NWRmMWFjOS4u
NDIyZDBkMjAxYzBhIDEwMDY0NAotLS0gYS9pbmNsdWRlL2RybS9kcm1fZGVidWdmcy5oCisrKyBi
L2luY2x1ZGUvZHJtL2RybV9kZWJ1Z2ZzLmgKQEAgLTgxLDggKzgxLDggQEAgc3RydWN0IGRybV9p
bmZvX25vZGUgewogaW50IGRybV9kZWJ1Z2ZzX2NyZWF0ZV9maWxlcyhjb25zdCBzdHJ1Y3QgZHJt
X2luZm9fbGlzdCAqZmlsZXMsCiAJCQkgICAgIGludCBjb3VudCwgc3RydWN0IGRlbnRyeSAqcm9v
dCwKIAkJCSAgICAgc3RydWN0IGRybV9taW5vciAqbWlub3IpOwotaW50IGRybV9kZWJ1Z2ZzX3Jl
bW92ZV9maWxlcyhjb25zdCBzdHJ1Y3QgZHJtX2luZm9fbGlzdCAqZmlsZXMsCi0JCQkgICAgIGlu
dCBjb3VudCwgc3RydWN0IGRybV9taW5vciAqbWlub3IpOwordm9pZCBkcm1fZGVidWdmc19yZW1v
dmVfZmlsZXMoY29uc3Qgc3RydWN0IGRybV9pbmZvX2xpc3QgKmZpbGVzLAorCQkJICAgICAgaW50
IGNvdW50LCBzdHJ1Y3QgZHJtX21pbm9yICptaW5vcik7CiAjZWxzZQogc3RhdGljIGlubGluZSBp
bnQgZHJtX2RlYnVnZnNfY3JlYXRlX2ZpbGVzKGNvbnN0IHN0cnVjdCBkcm1faW5mb19saXN0ICpm
aWxlcywKIAkJCQkJICAgaW50IGNvdW50LCBzdHJ1Y3QgZGVudHJ5ICpyb290LApAQCAtOTEsMTAg
KzkxLDkgQEAgc3RhdGljIGlubGluZSBpbnQgZHJtX2RlYnVnZnNfY3JlYXRlX2ZpbGVzKGNvbnN0
IHN0cnVjdCBkcm1faW5mb19saXN0ICpmaWxlcywKIAlyZXR1cm4gMDsKIH0KIAotc3RhdGljIGlu
bGluZSBpbnQgZHJtX2RlYnVnZnNfcmVtb3ZlX2ZpbGVzKGNvbnN0IHN0cnVjdCBkcm1faW5mb19s
aXN0ICpmaWxlcywKLQkJCQkJICAgaW50IGNvdW50LCBzdHJ1Y3QgZHJtX21pbm9yICptaW5vcikK
K3N0YXRpYyBpbmxpbmUgdm9pZCBkcm1fZGVidWdmc19yZW1vdmVfZmlsZXMoY29uc3Qgc3RydWN0
IGRybV9pbmZvX2xpc3QgKmZpbGVzLAorCQkJCQkgICAgaW50IGNvdW50LCBzdHJ1Y3QgZHJtX21p
bm9yICptaW5vcikKIHsKLQlyZXR1cm4gMDsKIH0KICNlbmRpZgogCi0tIAoyLjIyLjAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
