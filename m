Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4179FE121B
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 08:25:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95F396E958;
	Wed, 23 Oct 2019 06:25:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04E3C6E958
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 06:25:49 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-jmzfOARtMemy09B3Bu1Opw-1; Wed, 23 Oct 2019 02:25:44 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C4242107AD31;
 Wed, 23 Oct 2019 06:25:43 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-43.ams2.redhat.com
 [10.36.116.43])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B7CAD194B6;
 Wed, 23 Oct 2019 06:25:40 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0FED09D76; Wed, 23 Oct 2019 08:25:40 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/3] drm/virtio: Simplify virtio_gpu_primary_plane_update
 workflow.
Date: Wed, 23 Oct 2019 08:25:38 +0200
Message-Id: <20191023062539.11728-3-kraxel@redhat.com>
In-Reply-To: <20191023062539.11728-1-kraxel@redhat.com>
References: <20191023062539.11728-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: jmzfOARtMemy09B3Bu1Opw-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1571811948;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oVc09gtJkfw81t/CSZzvN6PZuWLwf46NNAtbbfhMjiE=;
 b=hcm5oN/NQG3VmcvCFz0Ik4s36RRkLJKWvP7qpQ55nJTm6lacoYg/38NJ1EQMco7WLJlT23
 I6roqYlREZ2G5aDUNy8Tn7D/ZfUD8FOhY9fc80EpDZMl0U3FM/WUEqMi3pPl3QD0IHnXuv
 oxN2Vh82wcHHlgZMdJL3p8oPTUJgFdg=
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
 Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmV0dXJuIGVhcmx5IGZvciB0aGUgbm8gZnJhbWVidWZmZXIgKG9yIGRpc2FibGVkIG91dHB1dCkg
Y2FzZS4KUmVzdWx0cyBpbiBhIHNpbXBsZXIgY29kZSBmbG93IGZvciB0aGUgcmVtYWluaW5nIGNh
c2VzLgpObyBmdW5jdGlvbmFsIGNoYW5nZS4KClNpZ25lZC1vZmYtYnk6IEdlcmQgSG9mZm1hbm4g
PGtyYXhlbEByZWRoYXQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9w
bGFuZS5jIHwgNjIgKysrKysrKysrKysrKystLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAz
MyBpbnNlcnRpb25zKCspLCAyOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vdmlydGlvL3ZpcnRncHVfcGxhbmUuYyBiL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmly
dGdwdV9wbGFuZS5jCmluZGV4IDM5MDUyNDE0MzEzOS4uMGI1YTc2MGJjMjkzIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfcGxhbmUuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vdmlydGlvL3ZpcnRncHVfcGxhbmUuYwpAQCAtMTEwLDcgKzExMCw2IEBAIHN0YXRpYyB2
b2lkIHZpcnRpb19ncHVfcHJpbWFyeV9wbGFuZV91cGRhdGUoc3RydWN0IGRybV9wbGFuZSAqcGxh
bmUsCiAJc3RydWN0IHZpcnRpb19ncHVfb3V0cHV0ICpvdXRwdXQgPSBOVUxMOwogCXN0cnVjdCB2
aXJ0aW9fZ3B1X2ZyYW1lYnVmZmVyICp2Z2ZiOwogCXN0cnVjdCB2aXJ0aW9fZ3B1X29iamVjdCAq
Ym87Ci0JdWludDMyX3QgaGFuZGxlOwogCiAJaWYgKHBsYW5lLT5zdGF0ZS0+Y3J0YykKIAkJb3V0
cHV0ID0gZHJtX2NydGNfdG9fdmlydGlvX2dwdV9vdXRwdXQocGxhbmUtPnN0YXRlLT5jcnRjKTsK
QEAgLTExOSw0NyArMTE4LDUyIEBAIHN0YXRpYyB2b2lkIHZpcnRpb19ncHVfcHJpbWFyeV9wbGFu
ZV91cGRhdGUoc3RydWN0IGRybV9wbGFuZSAqcGxhbmUsCiAJaWYgKFdBUk5fT04oIW91dHB1dCkp
CiAJCXJldHVybjsKIAotCWlmIChwbGFuZS0+c3RhdGUtPmZiICYmIG91dHB1dC0+ZW5hYmxlZCkg
ewotCQl2Z2ZiID0gdG9fdmlydGlvX2dwdV9mcmFtZWJ1ZmZlcihwbGFuZS0+c3RhdGUtPmZiKTsK
LQkJYm8gPSBnZW1fdG9fdmlydGlvX2dwdV9vYmoodmdmYi0+YmFzZS5vYmpbMF0pOwotCQloYW5k
bGUgPSBiby0+aHdfcmVzX2hhbmRsZTsKLQkJaWYgKGJvLT5kdW1iKSB7Ci0JCQlzdHJ1Y3Qgdmly
dGlvX2dwdV9vYmplY3RfYXJyYXkgKm9ianM7CisJaWYgKCFwbGFuZS0+c3RhdGUtPmZiIHx8ICFv
dXRwdXQtPmVuYWJsZWQpIHsKKwkJRFJNX0RFQlVHKCJub2ZiXG4iKTsKKwkJdmlydGlvX2dwdV9j
bWRfc2V0X3NjYW5vdXQodmdkZXYsIG91dHB1dC0+aW5kZXgsIDAsCisJCQkJCSAgIHBsYW5lLT5z
dGF0ZS0+c3JjX3cgPj4gMTYsCisJCQkJCSAgIHBsYW5lLT5zdGF0ZS0+c3JjX2ggPj4gMTYsCisJ
CQkJCSAgIDAsIDApOworCQlyZXR1cm47CisJfQorCisJdmdmYiA9IHRvX3ZpcnRpb19ncHVfZnJh
bWVidWZmZXIocGxhbmUtPnN0YXRlLT5mYik7CisJYm8gPSBnZW1fdG9fdmlydGlvX2dwdV9vYmoo
dmdmYi0+YmFzZS5vYmpbMF0pOworCWlmIChiby0+ZHVtYikgeworCQlzdHJ1Y3QgdmlydGlvX2dw
dV9vYmplY3RfYXJyYXkgKm9ianM7CiAKLQkJCW9ianMgPSB2aXJ0aW9fZ3B1X2FycmF5X2FsbG9j
KDEpOwotCQkJaWYgKCFvYmpzKQotCQkJCXJldHVybjsKLQkJCXZpcnRpb19ncHVfYXJyYXlfYWRk
X29iaihvYmpzLCB2Z2ZiLT5iYXNlLm9ialswXSk7Ci0JCQl2aXJ0aW9fZ3B1X2NtZF90cmFuc2Zl
cl90b19ob3N0XzJkCi0JCQkJKHZnZGV2LCAwLAotCQkJCSBwbGFuZS0+c3RhdGUtPnNyY193ID4+
IDE2LAotCQkJCSBwbGFuZS0+c3RhdGUtPnNyY19oID4+IDE2LAotCQkJCSBwbGFuZS0+c3RhdGUt
PnNyY194ID4+IDE2LAotCQkJCSBwbGFuZS0+c3RhdGUtPnNyY195ID4+IDE2LAotCQkJCSBvYmpz
LCBOVUxMKTsKLQkJfQotCX0gZWxzZSB7Ci0JCWhhbmRsZSA9IDA7CisJCW9ianMgPSB2aXJ0aW9f
Z3B1X2FycmF5X2FsbG9jKDEpOworCQlpZiAoIW9ianMpCisJCQlyZXR1cm47CisJCXZpcnRpb19n
cHVfYXJyYXlfYWRkX29iaihvYmpzLCB2Z2ZiLT5iYXNlLm9ialswXSk7CisJCXZpcnRpb19ncHVf
Y21kX3RyYW5zZmVyX3RvX2hvc3RfMmQKKwkJCSh2Z2RldiwgMCwKKwkJCSBwbGFuZS0+c3RhdGUt
PnNyY193ID4+IDE2LAorCQkJIHBsYW5lLT5zdGF0ZS0+c3JjX2ggPj4gMTYsCisJCQkgcGxhbmUt
PnN0YXRlLT5zcmNfeCA+PiAxNiwKKwkJCSBwbGFuZS0+c3RhdGUtPnNyY195ID4+IDE2LAorCQkJ
IG9ianMsIE5VTEwpOwogCX0KIAotCURSTV9ERUJVRygiaGFuZGxlIDB4JXgsIGNydGMgJWR4JWQr
JWQrJWQsIHNyYyAlZHglZCslZCslZFxuIiwgaGFuZGxlLAorCURSTV9ERUJVRygiaGFuZGxlIDB4
JXgsIGNydGMgJWR4JWQrJWQrJWQsIHNyYyAlZHglZCslZCslZFxuIiwKKwkJICBiby0+aHdfcmVz
X2hhbmRsZSwKIAkJICBwbGFuZS0+c3RhdGUtPmNydGNfdywgcGxhbmUtPnN0YXRlLT5jcnRjX2gs
CiAJCSAgcGxhbmUtPnN0YXRlLT5jcnRjX3gsIHBsYW5lLT5zdGF0ZS0+Y3J0Y195LAogCQkgIHBs
YW5lLT5zdGF0ZS0+c3JjX3cgPj4gMTYsCiAJCSAgcGxhbmUtPnN0YXRlLT5zcmNfaCA+PiAxNiwK
IAkJICBwbGFuZS0+c3RhdGUtPnNyY194ID4+IDE2LAogCQkgIHBsYW5lLT5zdGF0ZS0+c3JjX3kg
Pj4gMTYpOwotCXZpcnRpb19ncHVfY21kX3NldF9zY2Fub3V0KHZnZGV2LCBvdXRwdXQtPmluZGV4
LCBoYW5kbGUsCisJdmlydGlvX2dwdV9jbWRfc2V0X3NjYW5vdXQodmdkZXYsIG91dHB1dC0+aW5k
ZXgsCisJCQkJICAgYm8tPmh3X3Jlc19oYW5kbGUsCiAJCQkJICAgcGxhbmUtPnN0YXRlLT5zcmNf
dyA+PiAxNiwKIAkJCQkgICBwbGFuZS0+c3RhdGUtPnNyY19oID4+IDE2LAogCQkJCSAgIHBsYW5l
LT5zdGF0ZS0+c3JjX3ggPj4gMTYsCiAJCQkJICAgcGxhbmUtPnN0YXRlLT5zcmNfeSA+PiAxNik7
Ci0JaWYgKGhhbmRsZSkKLQkJdmlydGlvX2dwdV9jbWRfcmVzb3VyY2VfZmx1c2godmdkZXYsIGhh
bmRsZSwKLQkJCQkJICAgICAgcGxhbmUtPnN0YXRlLT5zcmNfeCA+PiAxNiwKLQkJCQkJICAgICAg
cGxhbmUtPnN0YXRlLT5zcmNfeSA+PiAxNiwKLQkJCQkJICAgICAgcGxhbmUtPnN0YXRlLT5zcmNf
dyA+PiAxNiwKLQkJCQkJICAgICAgcGxhbmUtPnN0YXRlLT5zcmNfaCA+PiAxNik7CisJdmlydGlv
X2dwdV9jbWRfcmVzb3VyY2VfZmx1c2godmdkZXYsIGJvLT5od19yZXNfaGFuZGxlLAorCQkJCSAg
ICAgIHBsYW5lLT5zdGF0ZS0+c3JjX3ggPj4gMTYsCisJCQkJICAgICAgcGxhbmUtPnN0YXRlLT5z
cmNfeSA+PiAxNiwKKwkJCQkgICAgICBwbGFuZS0+c3RhdGUtPnNyY193ID4+IDE2LAorCQkJCSAg
ICAgIHBsYW5lLT5zdGF0ZS0+c3JjX2ggPj4gMTYpOwogfQogCiBzdGF0aWMgaW50IHZpcnRpb19n
cHVfY3Vyc29yX3ByZXBhcmVfZmIoc3RydWN0IGRybV9wbGFuZSAqcGxhbmUsCi0tIAoyLjE4LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
