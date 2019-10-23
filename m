Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA4CE121C
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 08:26:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94ED26E957;
	Wed, 23 Oct 2019 06:25:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 048EF6E957
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 06:25:49 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-3S4sJz8-Pe6gMCGzRnyvDA-1; Wed, 23 Oct 2019 02:25:44 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ADE7D1005509;
 Wed, 23 Oct 2019 06:25:43 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-43.ams2.redhat.com
 [10.36.116.43])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CDF715DA8D;
 Wed, 23 Oct 2019 06:25:40 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 27FE49D31; Wed, 23 Oct 2019 08:25:40 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/3] drm/virtio: factor out virtio_gpu_update_dumb_bo
Date: Wed, 23 Oct 2019 08:25:39 +0200
Message-Id: <20191023062539.11728-4-kraxel@redhat.com>
In-Reply-To: <20191023062539.11728-1-kraxel@redhat.com>
References: <20191023062539.11728-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: 3S4sJz8-Pe6gMCGzRnyvDA-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1571811948;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2rJJiMpAk3KTFb/8+6jAIUN/X+McNBs+lfMw6ea3i+w=;
 b=UvFcKRGdjiLQyztjzQVYsTmN20NzV2ZjpKj9HCGfcsiyBKZuBXe6tiKl1u2DAaUIv/cyqo
 sRfmQEVUvbnuYMVH3k+LC8HYH4FaYi0gmAtLAhy4IZaIj6IBJrCrSsZthySvBoVptbGrtz
 yg9XTWrrKnVaLS0Mw/5nhp66f/mcK/A=
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

Tm8gZnVuY3Rpb25hbCBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5OiBHZXJkIEhvZmZtYW5uIDxrcmF4
ZWxAcmVkaGF0LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfcGxhbmUu
YyB8IDM2ICsrKysrKysrKysrKysrKy0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjEgaW5z
ZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3ZpcnRpby92aXJ0Z3B1X3BsYW5lLmMgYi9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVf
cGxhbmUuYwppbmRleCAwYjVhNzYwYmMyOTMuLmJjNGJjNDQ3NWE4YyAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X3BsYW5lLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L3ZpcnRpby92aXJ0Z3B1X3BsYW5lLmMKQEAgLTEwMiw2ICsxMDIsMjUgQEAgc3RhdGljIGludCB2
aXJ0aW9fZ3B1X3BsYW5lX2F0b21pY19jaGVjayhzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSwKIAly
ZXR1cm4gcmV0OwogfQogCitzdGF0aWMgdm9pZCB2aXJ0aW9fZ3B1X3VwZGF0ZV9kdW1iX2JvKHN0
cnVjdCB2aXJ0aW9fZ3B1X2RldmljZSAqdmdkZXYsCisJCQkJICAgICAgc3RydWN0IHZpcnRpb19n
cHVfb2JqZWN0ICpibywKKwkJCQkgICAgICBzdHJ1Y3QgZHJtX3BsYW5lX3N0YXRlICpzdGF0ZSkK
K3sKKwlzdHJ1Y3QgdmlydGlvX2dwdV9vYmplY3RfYXJyYXkgKm9ianM7CisKKwlvYmpzID0gdmly
dGlvX2dwdV9hcnJheV9hbGxvYygxKTsKKwlpZiAoIW9ianMpCisJCXJldHVybjsKKwl2aXJ0aW9f
Z3B1X2FycmF5X2FkZF9vYmoob2JqcywgJmJvLT5iYXNlLmJhc2UpOworCXZpcnRpb19ncHVfY21k
X3RyYW5zZmVyX3RvX2hvc3RfMmQKKwkJKHZnZGV2LCAwLAorCQkgc3RhdGUtPnNyY193ID4+IDE2
LAorCQkgc3RhdGUtPnNyY19oID4+IDE2LAorCQkgc3RhdGUtPnNyY194ID4+IDE2LAorCQkgc3Rh
dGUtPnNyY195ID4+IDE2LAorCQkgb2JqcywgTlVMTCk7Cit9CisKIHN0YXRpYyB2b2lkIHZpcnRp
b19ncHVfcHJpbWFyeV9wbGFuZV91cGRhdGUoc3RydWN0IGRybV9wbGFuZSAqcGxhbmUsCiAJCQkJ
CSAgICBzdHJ1Y3QgZHJtX3BsYW5lX3N0YXRlICpvbGRfc3RhdGUpCiB7CkBAIC0xMjksMjEgKzE0
OCw4IEBAIHN0YXRpYyB2b2lkIHZpcnRpb19ncHVfcHJpbWFyeV9wbGFuZV91cGRhdGUoc3RydWN0
IGRybV9wbGFuZSAqcGxhbmUsCiAKIAl2Z2ZiID0gdG9fdmlydGlvX2dwdV9mcmFtZWJ1ZmZlcihw
bGFuZS0+c3RhdGUtPmZiKTsKIAlibyA9IGdlbV90b192aXJ0aW9fZ3B1X29iaih2Z2ZiLT5iYXNl
Lm9ialswXSk7Ci0JaWYgKGJvLT5kdW1iKSB7Ci0JCXN0cnVjdCB2aXJ0aW9fZ3B1X29iamVjdF9h
cnJheSAqb2JqczsKLQotCQlvYmpzID0gdmlydGlvX2dwdV9hcnJheV9hbGxvYygxKTsKLQkJaWYg
KCFvYmpzKQotCQkJcmV0dXJuOwotCQl2aXJ0aW9fZ3B1X2FycmF5X2FkZF9vYmoob2Jqcywgdmdm
Yi0+YmFzZS5vYmpbMF0pOwotCQl2aXJ0aW9fZ3B1X2NtZF90cmFuc2Zlcl90b19ob3N0XzJkCi0J
CQkodmdkZXYsIDAsCi0JCQkgcGxhbmUtPnN0YXRlLT5zcmNfdyA+PiAxNiwKLQkJCSBwbGFuZS0+
c3RhdGUtPnNyY19oID4+IDE2LAotCQkJIHBsYW5lLT5zdGF0ZS0+c3JjX3ggPj4gMTYsCi0JCQkg
cGxhbmUtPnN0YXRlLT5zcmNfeSA+PiAxNiwKLQkJCSBvYmpzLCBOVUxMKTsKLQl9CisJaWYgKGJv
LT5kdW1iKQorCQl2aXJ0aW9fZ3B1X3VwZGF0ZV9kdW1iX2JvKHZnZGV2LCBibywgcGxhbmUtPnN0
YXRlKTsKIAogCURSTV9ERUJVRygiaGFuZGxlIDB4JXgsIGNydGMgJWR4JWQrJWQrJWQsIHNyYyAl
ZHglZCslZCslZFxuIiwKIAkJICBiby0+aHdfcmVzX2hhbmRsZSwKLS0gCjIuMTguMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
