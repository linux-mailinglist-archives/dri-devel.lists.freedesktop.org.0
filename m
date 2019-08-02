Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 706087F80F
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 15:12:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 707E56EE18;
	Fri,  2 Aug 2019 13:12:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A19A6EE0C
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 13:12:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 001223090FC8;
 Fri,  2 Aug 2019 13:12:31 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-81.ams2.redhat.com
 [10.36.116.81])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B0F7D5D704;
 Fri,  2 Aug 2019 13:12:31 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 995619D21; Fri,  2 Aug 2019 15:12:28 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v7 17/18] drm/virtio: drop virtio_gpu_object_{reserve,
 unreserve}
Date: Fri,  2 Aug 2019 15:12:24 +0200
Message-Id: <20190802131225.17760-18-kraxel@redhat.com>
In-Reply-To: <20190802131225.17760-1-kraxel@redhat.com>
References: <20190802131225.17760-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Fri, 02 Aug 2019 13:12:32 +0000 (UTC)
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
 Gerd Hoffmann <kraxel@redhat.com>, gurchetansingh@chromium.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm8gdXNlcnMgbGVmdC4KClNpZ25lZC1vZmYtYnk6IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRo
YXQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9kcnYuaCB8IDIxIC0t
LS0tLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIxIGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9kcnYuaCBiL2RyaXZlcnMv
Z3B1L2RybS92aXJ0aW8vdmlydGdwdV9kcnYuaAppbmRleCA1OWY3MWRjOTQwMTcuLmZiMzU4MzFl
ZDM1MSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2Rydi5oCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9kcnYuaApAQCAtMzY4LDI3ICszNjgs
NiBAQCBzdGF0aWMgaW5saW5lIHU2NCB2aXJ0aW9fZ3B1X29iamVjdF9tbWFwX29mZnNldChzdHJ1
Y3QgdmlydGlvX2dwdV9vYmplY3QgKmJvKQogCXJldHVybiBkcm1fdm1hX25vZGVfb2Zmc2V0X2Fk
ZHIoJmJvLT5iYXNlLmJhc2Uudm1hX25vZGUpOwogfQogCi1zdGF0aWMgaW5saW5lIGludCB2aXJ0
aW9fZ3B1X29iamVjdF9yZXNlcnZlKHN0cnVjdCB2aXJ0aW9fZ3B1X29iamVjdCAqYm8pCi17Ci0J
aW50IHI7Ci0KLQlyID0gcmVzZXJ2YXRpb25fb2JqZWN0X2xvY2tfaW50ZXJydXB0aWJsZShiby0+
YmFzZS5iYXNlLnJlc3YsIE5VTEwpOwotCWlmICh1bmxpa2VseShyICE9IDApKSB7Ci0JCWlmIChy
ICE9IC1FSU5UUikgewotCQkJc3RydWN0IHZpcnRpb19ncHVfZGV2aWNlICpxZGV2ID0KLQkJCQli
by0+YmFzZS5iYXNlLmRldi0+ZGV2X3ByaXZhdGU7Ci0JCQlkZXZfZXJyKHFkZXYtPmRldiwgIiVw
IHJlc2VydmUgZmFpbGVkXG4iLCBibyk7Ci0JCX0KLQkJcmV0dXJuIHI7Ci0JfQotCXJldHVybiAw
OwotfQotCi1zdGF0aWMgaW5saW5lIHZvaWQgdmlydGlvX2dwdV9vYmplY3RfdW5yZXNlcnZlKHN0
cnVjdCB2aXJ0aW9fZ3B1X29iamVjdCAqYm8pCi17Ci0JcmVzZXJ2YXRpb25fb2JqZWN0X3VubG9j
ayhiby0+YmFzZS5iYXNlLnJlc3YpOwotfQotCiAvKiB2aXJnbCBkZWJ1ZnMgKi8KIGludCB2aXJ0
aW9fZ3B1X2RlYnVnZnNfaW5pdChzdHJ1Y3QgZHJtX21pbm9yICptaW5vcik7CiAKLS0gCjIuMTgu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
