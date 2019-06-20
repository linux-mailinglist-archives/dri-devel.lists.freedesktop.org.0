Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 768C44C71B
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2019 08:07:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E76826E4BA;
	Thu, 20 Jun 2019 06:07:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A7716E4BA
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2019 06:07:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 328B4307D910;
 Thu, 20 Jun 2019 06:07:32 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-212.ams2.redhat.com
 [10.36.116.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9839C5C21E;
 Thu, 20 Jun 2019 06:07:27 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5DA7917510; Thu, 20 Jun 2019 08:07:26 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 02/12] drm/virtio: switch virtio_gpu_wait_ioctl() to gem
 helper.
Date: Thu, 20 Jun 2019 08:07:16 +0200
Message-Id: <20190620060726.926-3-kraxel@redhat.com>
In-Reply-To: <20190620060726.926-1-kraxel@redhat.com>
References: <20190620060726.926-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Thu, 20 Jun 2019 06:07:33 +0000 (UTC)
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

VXNlIGRybV9nZW1fcmVzZXJ2YXRpb25fb2JqZWN0X3dhaXQoKSBpbiB2aXJ0aW9fZ3B1X3dhaXRf
aW9jdGwoKS4KVGhpcyBhbHNvIG1ha2VzIHRoZSBpb2N0bCBydW4gbG9ja2xlc3MuCgp2MjogdXNl
IHJlc2VydmF0aW9uX29iamVjdF90ZXN0X3NpZ25hbGVkX3JjdSBmb3IgVklSVEdQVV9XQUlUX05P
V0FJVC4KClNpZ25lZC1vZmYtYnk6IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPgpS
ZXZpZXdlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfaW9jdGwuYyB8IDI0ICsrKysrKysrKystLS0t
LS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9pb2N0bC5j
IGIvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2lvY3RsLmMKaW5kZXggYWM2MGJlOWI1
YzE5Li4zMTNjNzcwZWEyYzUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmly
dGdwdV9pb2N0bC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9pb2N0bC5j
CkBAIC00NjQsMjMgKzQ2NCwxOSBAQCBzdGF0aWMgaW50IHZpcnRpb19ncHVfd2FpdF9pb2N0bChz
dHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRhLAogCQkJICAgIHN0cnVjdCBkcm1fZmls
ZSAqZmlsZSkKIHsKIAlzdHJ1Y3QgZHJtX3ZpcnRncHVfM2Rfd2FpdCAqYXJncyA9IGRhdGE7Ci0J
c3RydWN0IGRybV9nZW1fb2JqZWN0ICpnb2JqID0gTlVMTDsKLQlzdHJ1Y3QgdmlydGlvX2dwdV9v
YmplY3QgKnFvYmogPSBOVUxMOworCXN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqOworCWxvbmcg
dGltZW91dCA9IDE1ICogSFo7CiAJaW50IHJldDsKLQlib29sIG5vd2FpdCA9IGZhbHNlOwogCi0J
Z29iaiA9IGRybV9nZW1fb2JqZWN0X2xvb2t1cChmaWxlLCBhcmdzLT5oYW5kbGUpOwotCWlmIChn
b2JqID09IE5VTEwpCi0JCXJldHVybiAtRU5PRU5UOworCWlmIChhcmdzLT5mbGFncyAmIFZJUlRH
UFVfV0FJVF9OT1dBSVQpIHsKKwkJb2JqID0gZHJtX2dlbV9vYmplY3RfbG9va3VwKGZpbGUsIGFy
Z3MtPmhhbmRsZSk7CisJCXJldCA9IHJlc2VydmF0aW9uX29iamVjdF90ZXN0X3NpZ25hbGVkX3Jj
dShvYmotPnJlc3YsIHRydWUpOworCQlkcm1fZ2VtX29iamVjdF9wdXRfdW5sb2NrZWQob2JqKTsK
KwkJcmV0dXJuIHJldCA/IDAgOiAtRUJVU1k7CisJfQogCi0JcW9iaiA9IGdlbV90b192aXJ0aW9f
Z3B1X29iaihnb2JqKTsKLQotCWlmIChhcmdzLT5mbGFncyAmIFZJUlRHUFVfV0FJVF9OT1dBSVQp
Ci0JCW5vd2FpdCA9IHRydWU7Ci0JcmV0ID0gdmlydGlvX2dwdV9vYmplY3Rfd2FpdChxb2JqLCBu
b3dhaXQpOwotCi0JZHJtX2dlbV9vYmplY3RfcHV0X3VubG9ja2VkKGdvYmopOwotCXJldHVybiBy
ZXQ7CisJcmV0dXJuIGRybV9nZW1fcmVzZXJ2YXRpb25fb2JqZWN0X3dhaXQoZmlsZSwgYXJncy0+
aGFuZGxlLAorCQkJCQkgICAgICAgdHJ1ZSwgdGltZW91dCk7CiB9CiAKIHN0YXRpYyBpbnQgdmly
dGlvX2dwdV9nZXRfY2Fwc19pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAotLSAKMi4xOC4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
