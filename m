Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCD54E79E
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 13:58:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E673E6E8A4;
	Fri, 21 Jun 2019 11:58:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C83526E892;
 Fri, 21 Jun 2019 11:58:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5FF5AC01F278;
 Fri, 21 Jun 2019 11:58:03 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-212.ams2.redhat.com
 [10.36.116.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F2AC360A97;
 Fri, 21 Jun 2019 11:58:02 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2C2AE9D69; Fri, 21 Jun 2019 13:58:00 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 16/18] drm/qxl: switch driver from bo->resv to bo->base.resv
Date: Fri, 21 Jun 2019 13:57:53 +0200
Message-Id: <20190621115755.8481-17-kraxel@redhat.com>
In-Reply-To: <20190621115755.8481-1-kraxel@redhat.com>
References: <20190621115755.8481-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Fri, 21 Jun 2019 11:58:03 +0000 (UTC)
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
Cc: David Airlie <airlied@linux.ie>, ckoenig.leichtzumerken@gmail.com,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>, Gerd Hoffmann <kraxel@redhat.com>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU" <spice-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+Ci0tLQogZHJp
dmVycy9ncHUvZHJtL3F4bC9xeGxfZGVidWdmcy5jIHwgMiArLQogZHJpdmVycy9ncHUvZHJtL3F4
bC9xeGxfcmVsZWFzZS5jIHwgNiArKystLS0KIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25z
KCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhs
X2RlYnVnZnMuYyBiL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX2RlYnVnZnMuYwppbmRleCAwMTNi
OTM4OTg2YzcuLmYzMDQ2MDc4MmYwNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3F4bC9x
eGxfZGVidWdmcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX2RlYnVnZnMuYwpAQCAt
NjEsNyArNjEsNyBAQCBxeGxfZGVidWdmc19idWZmZXJzX2luZm8oc3RydWN0IHNlcV9maWxlICpt
LCB2b2lkICpkYXRhKQogCQlpbnQgcmVsOwogCiAJCXJjdV9yZWFkX2xvY2soKTsKLQkJZm9iaiA9
IHJjdV9kZXJlZmVyZW5jZShiby0+dGJvLnJlc3YtPmZlbmNlKTsKKwkJZm9iaiA9IHJjdV9kZXJl
ZmVyZW5jZShiby0+dGJvLmJhc2UucmVzdi0+ZmVuY2UpOwogCQlyZWwgPSBmb2JqID8gZm9iai0+
c2hhcmVkX2NvdW50IDogMDsKIAkJcmN1X3JlYWRfdW5sb2NrKCk7CiAKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9xeGwvcXhsX3JlbGVhc2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhs
X3JlbGVhc2UuYwppbmRleCAzMjEyNmU4ODM2YjMuLjFiN2JlODJjOGU2OCAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfcmVsZWFzZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9x
eGwvcXhsX3JlbGVhc2UuYwpAQCAtMjM0LDcgKzIzNCw3IEBAIHN0YXRpYyBpbnQgcXhsX3JlbGVh
c2VfdmFsaWRhdGVfYm8oc3RydWN0IHF4bF9ibyAqYm8pCiAJCQlyZXR1cm4gcmV0OwogCX0KIAot
CXJldCA9IHJlc2VydmF0aW9uX29iamVjdF9yZXNlcnZlX3NoYXJlZChiby0+dGJvLnJlc3YsIDEp
OworCXJldCA9IHJlc2VydmF0aW9uX29iamVjdF9yZXNlcnZlX3NoYXJlZChiby0+dGJvLmJhc2Uu
cmVzdiwgMSk7CiAJaWYgKHJldCkKIAkJcmV0dXJuIHJldDsKIApAQCAtNDU0LDkgKzQ1NCw5IEBA
IHZvaWQgcXhsX3JlbGVhc2VfZmVuY2VfYnVmZmVyX29iamVjdHMoc3RydWN0IHF4bF9yZWxlYXNl
ICpyZWxlYXNlKQogCWxpc3RfZm9yX2VhY2hfZW50cnkoZW50cnksICZyZWxlYXNlLT5ib3MsIGhl
YWQpIHsKIAkJYm8gPSBlbnRyeS0+Ym87CiAKLQkJcmVzZXJ2YXRpb25fb2JqZWN0X2FkZF9zaGFy
ZWRfZmVuY2UoYm8tPnJlc3YsICZyZWxlYXNlLT5iYXNlKTsKKwkJcmVzZXJ2YXRpb25fb2JqZWN0
X2FkZF9zaGFyZWRfZmVuY2UoYm8tPmJhc2UucmVzdiwgJnJlbGVhc2UtPmJhc2UpOwogCQl0dG1f
Ym9fYWRkX3RvX2xydShibyk7Ci0JCXJlc2VydmF0aW9uX29iamVjdF91bmxvY2soYm8tPnJlc3Yp
OworCQlyZXNlcnZhdGlvbl9vYmplY3RfdW5sb2NrKGJvLT5iYXNlLnJlc3YpOwogCX0KIAlzcGlu
X3VubG9jaygmZ2xvYi0+bHJ1X2xvY2spOwogCXd3X2FjcXVpcmVfZmluaSgmcmVsZWFzZS0+dGlj
a2V0KTsKLS0gCjIuMTguMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
