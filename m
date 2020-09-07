Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF392605EC
	for <lists+dri-devel@lfdr.de>; Mon,  7 Sep 2020 22:47:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AB126E558;
	Mon,  7 Sep 2020 20:47:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B248A6E558
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Sep 2020 20:47:12 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-D_Uo6pBwMBmjwXIJfjUHXA-1; Mon, 07 Sep 2020 16:47:07 -0400
X-MC-Unique: D_Uo6pBwMBmjwXIJfjUHXA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 64C0F1005E5B;
 Mon,  7 Sep 2020 20:47:06 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-45.bne.redhat.com
 [10.64.54.45])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 13A9B60BE2;
 Mon,  7 Sep 2020 20:47:04 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 09/13] drm/gem_vram/ttm: move to driver backend destroy
 function.
Date: Tue,  8 Sep 2020 06:46:26 +1000
Message-Id: <20200907204630.1406528-10-airlied@gmail.com>
In-Reply-To: <20200907204630.1406528-1-airlied@gmail.com>
References: <20200907204630.1406528-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: gmail.com
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: kraxel@redhat.com, sroland@vmware.com, bskeggs@redhat.com,
 christian.koenig@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4KCkFja2VkLWJ5OiBUaG9tYXMg
WmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KQWNrZWQtYnk6IENocmlzdGlhbiBLw7Zu
aWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogRGF2ZSBBaXJsaWUg
PGFpcmxpZWRAcmVkaGF0LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV92cmFtX2hl
bHBlci5jIHwgOSArKy0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDcg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fdnJhbV9o
ZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmMKaW5kZXggNzg4
NTU3YmM1YzAxLi41MWY5ZmE0YzE3OGMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1f
Z2VtX3ZyYW1faGVscGVyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fdnJhbV9oZWxw
ZXIuYwpAQCAtOTY3LDE2ICs5NjcsMTIgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fZ2VtX29i
amVjdF9mdW5jcyBkcm1fZ2VtX3ZyYW1fb2JqZWN0X2Z1bmNzID0gewogICogVFRNIFRUCiAgKi8K
IAotc3RhdGljIHZvaWQgYmFja2VuZF9mdW5jX2Rlc3Ryb3koc3RydWN0IHR0bV9ib19kZXZpY2Ug
KmJkZXYsIHN0cnVjdCB0dG1fdHQgKnR0KQorc3RhdGljIHZvaWQgYm9fZHJpdmVyX3R0bV90dF9k
ZXN0cm95KHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2LCBzdHJ1Y3QgdHRtX3R0ICp0dCkKIHsK
IAl0dG1fdHRfZmluaSh0dCk7CiAJa2ZyZWUodHQpOwogfQogCi1zdGF0aWMgc3RydWN0IHR0bV9i
YWNrZW5kX2Z1bmMgYmFja2VuZF9mdW5jID0gewotCS5kZXN0cm95ID0gYmFja2VuZF9mdW5jX2Rl
c3Ryb3kKLX07Ci0KIC8qCiAgKiBUVE0gQk8gZGV2aWNlCiAgKi8KQEAgLTk5MSw4ICs5ODcsNiBA
QCBzdGF0aWMgc3RydWN0IHR0bV90dCAqYm9fZHJpdmVyX3R0bV90dF9jcmVhdGUoc3RydWN0IHR0
bV9idWZmZXJfb2JqZWN0ICpibywKIAlpZiAoIXR0KQogCQlyZXR1cm4gTlVMTDsKIAotCXR0LT5m
dW5jID0gJmJhY2tlbmRfZnVuYzsKLQogCXJldCA9IHR0bV90dF9pbml0KHR0LCBibywgcGFnZV9m
bGFncyk7CiAJaWYgKHJldCA8IDApCiAJCWdvdG8gZXJyX3R0bV90dF9pbml0OwpAQCAtMTA1NSw2
ICsxMDQ5LDcgQEAgc3RhdGljIGludCBib19kcml2ZXJfaW9fbWVtX3Jlc2VydmUoc3RydWN0IHR0
bV9ib19kZXZpY2UgKmJkZXYsCiAKIHN0YXRpYyBzdHJ1Y3QgdHRtX2JvX2RyaXZlciBib19kcml2
ZXIgPSB7CiAJLnR0bV90dF9jcmVhdGUgPSBib19kcml2ZXJfdHRtX3R0X2NyZWF0ZSwKKwkudHRt
X3R0X2Rlc3Ryb3kgPSBib19kcml2ZXJfdHRtX3R0X2Rlc3Ryb3ksCiAJLmV2aWN0aW9uX3ZhbHVh
YmxlID0gdHRtX2JvX2V2aWN0aW9uX3ZhbHVhYmxlLAogCS5ldmljdF9mbGFncyA9IGJvX2RyaXZl
cl9ldmljdF9mbGFncywKIAkubW92ZV9ub3RpZnkgPSBib19kcml2ZXJfbW92ZV9ub3RpZnksCi0t
IAoyLjI3LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
