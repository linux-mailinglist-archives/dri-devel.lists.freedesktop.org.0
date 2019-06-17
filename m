Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5AFC4804F
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 13:14:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BF4789026;
	Mon, 17 Jun 2019 11:14:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2350589026
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 11:14:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6538181DF0;
 Mon, 17 Jun 2019 11:14:08 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-33.ams2.redhat.com
 [10.36.116.33])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 139E47D66B;
 Mon, 17 Jun 2019 11:14:07 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id F399716E19; Mon, 17 Jun 2019 13:14:06 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/4] drm/virtio: pass gem reservation object to ttm init
Date: Mon, 17 Jun 2019 13:14:03 +0200
Message-Id: <20190617111406.14765-2-kraxel@redhat.com>
In-Reply-To: <20190617111406.14765-1-kraxel@redhat.com>
References: <20190617111406.14765-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Mon, 17 Jun 2019 11:14:08 +0000 (UTC)
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

V2l0aCB0aGlzIGdlbSBhbmQgdHRtIHdpbGwgdXNlIHRoZSBzYW1lIHJlc2VydmF0aW9uIG9iamVj
dCwKc28gbWl4aW5nIGFuZCBtYXRjaGluZyB0dG0gLyBnZW0gcmVzZXJ2YXRpb24gaGVscGVycyBz
aG91bGQKd29yayBmaW5lLgoKU2lnbmVkLW9mZi1ieTogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJl
ZGhhdC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X29iamVjdC5jIHwg
MyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfb2JqZWN0LmMgYi9kcml2
ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfb2JqZWN0LmMKaW5kZXggYjJkYTMxMzEwZDI0Li4y
NDI3NjZkNjQ0YTcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9v
YmplY3QuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfb2JqZWN0LmMKQEAg
LTEzMiw3ICsxMzIsOCBAQCBpbnQgdmlydGlvX2dwdV9vYmplY3RfY3JlYXRlKHN0cnVjdCB2aXJ0
aW9fZ3B1X2RldmljZSAqdmdkZXYsCiAJdmlydGlvX2dwdV9pbml0X3R0bV9wbGFjZW1lbnQoYm8p
OwogCXJldCA9IHR0bV9ib19pbml0KCZ2Z2Rldi0+bW1hbi5iZGV2LCAmYm8tPnRibywgcGFyYW1z
LT5zaXplLAogCQkJICB0dG1fYm9fdHlwZV9kZXZpY2UsICZiby0+cGxhY2VtZW50LCAwLAotCQkJ
ICB0cnVlLCBhY2Nfc2l6ZSwgTlVMTCwgTlVMTCwKKwkJCSAgdHJ1ZSwgYWNjX3NpemUsIE5VTEws
CisJCQkgIGJvLT5nZW1fYmFzZS5yZXN2LAogCQkJICAmdmlydGlvX2dwdV90dG1fYm9fZGVzdHJv
eSk7CiAJLyogdHRtX2JvX2luaXQgZmFpbHVyZSB3aWxsIGNhbGwgdGhlIGRlc3Ryb3kgKi8KIAlp
ZiAocmV0ICE9IDApCi0tIAoyLjE4LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
