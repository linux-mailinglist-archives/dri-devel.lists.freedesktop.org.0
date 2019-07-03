Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCAC5D179
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2019 16:19:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4230789FAC;
	Tue,  2 Jul 2019 14:19:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75BBE89FA9
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2019 14:19:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B4E2530832D8;
 Tue,  2 Jul 2019 14:19:17 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-96.ams2.redhat.com
 [10.36.116.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3C79B196E5;
 Tue,  2 Jul 2019 14:19:13 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6D68E9D00; Tue,  2 Jul 2019 16:19:06 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 18/18] drm/virtio: add fence sanity check
Date: Tue,  2 Jul 2019 16:19:03 +0200
Message-Id: <20190702141903.1131-19-kraxel@redhat.com>
In-Reply-To: <20190702141903.1131-1-kraxel@redhat.com>
References: <20190702141903.1131-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Tue, 02 Jul 2019 14:19:25 +0000 (UTC)
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

TWFrZSBzdXJlIHdlIGRvbid0IGxlYWsgaGFsZi1pbml0aWFsaXplZCBmZW5jZXMgb3V0c2lkZSB0
aGUgZHJpdmVyLgoKU2lnbmVkLW9mZi1ieTogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5j
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2ZlbmNlLmMgfCA0ICsrKysK
IDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vdmlydGlvL3ZpcnRncHVfZmVuY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmly
dGdwdV9mZW5jZS5jCmluZGV4IDcwZDZjNDMyOTc3OC4uOTgzNThmZjk5OTZjIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfZmVuY2UuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vdmlydGlvL3ZpcnRncHVfZmVuY2UuYwpAQCAtNDEsNiArNDEsMTAgQEAgYm9vbCB2aXJ0
aW9fZmVuY2Vfc2lnbmFsZWQoc3RydWN0IGRtYV9mZW5jZSAqZikKIHsKIAlzdHJ1Y3QgdmlydGlv
X2dwdV9mZW5jZSAqZmVuY2UgPSB0b192aXJ0aW9fZmVuY2UoZik7CiAKKwlpZiAoV0FSTl9PTl9P
TkNFKGZlbmNlLT5mLnNlcW5vID09IDApKQorCQkvKiBsZWFrZWQgZmVuY2Ugb3V0c2lkZSBkcml2
ZXIgYmVmb3JlIGNvbXBsZXRpbmcKKwkJICogaW5pdGlhbGl6YXRpb24gd2l0aCB2aXJ0aW9fZ3B1
X2ZlbmNlX2VtaXQgKi8KKwkJcmV0dXJuIGZhbHNlOwogCWlmIChhdG9taWM2NF9yZWFkKCZmZW5j
ZS0+ZHJ2LT5sYXN0X3NlcSkgPj0gZmVuY2UtPmYuc2Vxbm8pCiAJCXJldHVybiB0cnVlOwogCXJl
dHVybiBmYWxzZTsKLS0gCjIuMTguMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
