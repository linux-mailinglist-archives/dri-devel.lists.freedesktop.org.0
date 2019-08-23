Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 663479AC17
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 11:55:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3838D6EC62;
	Fri, 23 Aug 2019 09:55:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E45D26EC5F
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 09:55:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7DCDF3064FCF;
 Fri, 23 Aug 2019 09:55:07 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-60.ams2.redhat.com
 [10.36.116.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4D7EC6092D;
 Fri, 23 Aug 2019 09:55:04 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 52D9231E80; Fri, 23 Aug 2019 11:55:03 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v8 02/18] drm/virtio: switch virtio_gpu_wait_ioctl() to gem
 helper.
Date: Fri, 23 Aug 2019 11:54:47 +0200
Message-Id: <20190823095503.2261-3-kraxel@redhat.com>
In-Reply-To: <20190823095503.2261-1-kraxel@redhat.com>
References: <20190823095503.2261-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Fri, 23 Aug 2019 09:55:07 +0000 (UTC)
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

VXNlIGRybV9nZW1fcmVzZXJ2YXRpb25fb2JqZWN0X3dhaXQoKSBpbiB2aXJ0aW9fZ3B1X3dhaXRf
aW9jdGwoKS4KVGhpcyBhbHNvIG1ha2VzIHRoZSBpb2N0bCBydW4gbG9ja2xlc3MuCgp2NTogaGFu
ZGxlIGxvb2t1cCBmYWlsdXJlLgp2MjogdXNlIHJlc2VydmF0aW9uX29iamVjdF90ZXN0X3NpZ25h
bGVkX3JjdSBmb3IgVklSVEdQVV9XQUlUX05PV0FJVC4KClNpZ25lZC1vZmYtYnk6IEdlcmQgSG9m
Zm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPgpSZXZpZXdlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFu
aWVsLnZldHRlckBmZndsbC5jaD4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVf
aW9jdGwuYyB8IDI1ICsrKysrKysrKysrLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAx
MSBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vdmlydGlvL3ZpcnRncHVfaW9jdGwuYyBiL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmly
dGdwdV9pb2N0bC5jCmluZGV4IDBhODhlZjExYjlkMy4uNzRiNmJhZDAxZDdmIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfaW9jdGwuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vdmlydGlvL3ZpcnRncHVfaW9jdGwuYwpAQCAtNDY2LDIzICs0NjYsMjAgQEAgc3RhdGlj
IGludCB2aXJ0aW9fZ3B1X3dhaXRfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAq
ZGF0YSwKIAkJCSAgICBzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGUpCiB7CiAJc3RydWN0IGRybV92aXJ0
Z3B1XzNkX3dhaXQgKmFyZ3MgPSBkYXRhOwotCXN0cnVjdCBkcm1fZ2VtX29iamVjdCAqZ29iaiA9
IE5VTEw7Ci0Jc3RydWN0IHZpcnRpb19ncHVfb2JqZWN0ICpxb2JqID0gTlVMTDsKKwlzdHJ1Y3Qg
ZHJtX2dlbV9vYmplY3QgKm9iajsKKwlsb25nIHRpbWVvdXQgPSAxNSAqIEhaOwogCWludCByZXQ7
Ci0JYm9vbCBub3dhaXQgPSBmYWxzZTsKIAotCWdvYmogPSBkcm1fZ2VtX29iamVjdF9sb29rdXAo
ZmlsZSwgYXJncy0+aGFuZGxlKTsKLQlpZiAoZ29iaiA9PSBOVUxMKQotCQlyZXR1cm4gLUVOT0VO
VDsKKwlpZiAoYXJncy0+ZmxhZ3MgJiBWSVJUR1BVX1dBSVRfTk9XQUlUKSB7CisJCW9iaiA9IGRy
bV9nZW1fb2JqZWN0X2xvb2t1cChmaWxlLCBhcmdzLT5oYW5kbGUpOworCQlpZiAob2JqID09IE5V
TEwpCisJCQlyZXR1cm4gLUVOT0VOVDsKKwkJcmV0ID0gZG1hX3Jlc3ZfdGVzdF9zaWduYWxlZF9y
Y3Uob2JqLT5yZXN2LCB0cnVlKTsKKwkJZHJtX2dlbV9vYmplY3RfcHV0X3VubG9ja2VkKG9iaik7
CisJCXJldHVybiByZXQgPyAwIDogLUVCVVNZOworCX0KIAotCXFvYmogPSBnZW1fdG9fdmlydGlv
X2dwdV9vYmooZ29iaik7Ci0KLQlpZiAoYXJncy0+ZmxhZ3MgJiBWSVJUR1BVX1dBSVRfTk9XQUlU
KQotCQlub3dhaXQgPSB0cnVlOwotCXJldCA9IHZpcnRpb19ncHVfb2JqZWN0X3dhaXQocW9iaiwg
bm93YWl0KTsKLQotCWRybV9nZW1fb2JqZWN0X3B1dF91bmxvY2tlZChnb2JqKTsKLQlyZXR1cm4g
cmV0OworCXJldHVybiBkcm1fZ2VtX2RtYV9yZXN2X3dhaXQoZmlsZSwgYXJncy0+aGFuZGxlLCB0
cnVlLCB0aW1lb3V0KTsKIH0KIAogc3RhdGljIGludCB2aXJ0aW9fZ3B1X2dldF9jYXBzX2lvY3Rs
KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCi0tIAoyLjE4LjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
