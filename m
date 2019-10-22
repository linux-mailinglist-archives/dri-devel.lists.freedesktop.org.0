Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46EA0DFEFF
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 10:06:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 077D46E439;
	Tue, 22 Oct 2019 08:06:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FB006E432
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 08:05:56 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-78-quF3-_HKNCqdkw3peQ_QqA-1; Tue, 22 Oct 2019 04:05:51 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2D687800D56;
 Tue, 22 Oct 2019 08:05:50 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-43.ams2.redhat.com
 [10.36.116.43])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 711B65C22C;
 Tue, 22 Oct 2019 08:05:47 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id BFBCF9D76; Tue, 22 Oct 2019 10:05:46 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/5] drm/virtio: fix byteorder handling in
 virtio_gpu_cmd_transfer_{from, to}_host_3d functions
Date: Tue, 22 Oct 2019 10:05:44 +0200
Message-Id: <20191022080546.19769-4-kraxel@redhat.com>
In-Reply-To: <20191022080546.19769-1-kraxel@redhat.com>
References: <20191022080546.19769-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: quF3-_HKNCqdkw3peQ_QqA-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1571731554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GtZmqzFgxn1pwN65/xIkar281NrAbaBtoHehY0Fvb0U=;
 b=MPjpBRL9wGyDWQl+ejjQRXt0MRy4V0g7pJP1DyR1MNaTus7lYdXR+W0FV2jaNymjqppBZR
 EReESO5JVyx/ISonpwJ3uBjXNeqb0gXaO2KS4tuiZxiN2j2Hp+xFBMUDqkU7gRuPM3LX4t
 3Lq7ycdibw+NjQ+j+4EAHHZkZbTrqOA=
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

QmUgY29uc2lzdGVudCB3aXRoIHRoZSByZXN0IG9mIHRoZSBjb2RlIGJhc2UuCk5vIGZ1bmN0aW9u
YWwgY2hhbmdlLgoKSW4gdGhlb3J5IHRoaXMgY2hhbmdlIGlzIGluY29tcGF0aWJsZSBvbiBiaWdl
bmRpYW4gbWFjaGluZXMsCmJ1dCBpbiBwcmFjdGljZSAzZCBhY2NlbGVyYXRpb24gaXMgc3VwcG9y
dGVkIG9ubHkgb24gbGl0dGxlCmVuZGlhbiBtYWNoaW5lcywgc28gdGhlIGFmZmVjdGVkIGNvZGUg
cGF0aHMgbmV2ZXIgcnVuIG9uCmJpZ2VuZGlhbiBtYWNoaW5lcy4KClNpZ25lZC1vZmYtYnk6IEdl
cmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS92aXJ0
aW8vdmlydGdwdV92cS5jIHwgMTQgKysrKysrKysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMiBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS92aXJ0aW8vdmlydGdwdV92cS5jIGIvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X3Zx
LmMKaW5kZXggNzRhZDNiYzNlYmU4Li4wYmY2MDkxNGVjZTIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS92aXJ0aW8vdmlydGdwdV92cS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8v
dmlydGdwdV92cS5jCkBAIC05ODcsNyArOTg3LDEyIEBAIHZvaWQgdmlydGlvX2dwdV9jbWRfdHJh
bnNmZXJfdG9faG9zdF8zZChzdHJ1Y3QgdmlydGlvX2dwdV9kZXZpY2UgKnZnZGV2LAogCWNtZF9w
LT5oZHIudHlwZSA9IGNwdV90b19sZTMyKFZJUlRJT19HUFVfQ01EX1RSQU5TRkVSX1RPX0hPU1Rf
M0QpOwogCWNtZF9wLT5oZHIuY3R4X2lkID0gY3B1X3RvX2xlMzIoY3R4X2lkKTsKIAljbWRfcC0+
cmVzb3VyY2VfaWQgPSBjcHVfdG9fbGUzMihiby0+aHdfcmVzX2hhbmRsZSk7Ci0JY21kX3AtPmJv
eCA9ICpib3g7CisJY21kX3AtPmJveC54ID0gY3B1X3RvX2xlMzIoYm94LT54KTsKKwljbWRfcC0+
Ym94LnkgPSBjcHVfdG9fbGUzMihib3gtPnkpOworCWNtZF9wLT5ib3gueiA9IGNwdV90b19sZTMy
KGJveC0+eik7CisJY21kX3AtPmJveC53ID0gY3B1X3RvX2xlMzIoYm94LT53KTsKKwljbWRfcC0+
Ym94LmggPSBjcHVfdG9fbGUzMihib3gtPmgpOworCWNtZF9wLT5ib3guZCA9IGNwdV90b19sZTMy
KGJveC0+ZCk7CiAJY21kX3AtPm9mZnNldCA9IGNwdV90b19sZTY0KG9mZnNldCk7CiAJY21kX3At
PmxldmVsID0gY3B1X3RvX2xlMzIobGV2ZWwpOwogCkBAIC0xMDEzLDcgKzEwMTgsMTIgQEAgdm9p
ZCB2aXJ0aW9fZ3B1X2NtZF90cmFuc2Zlcl9mcm9tX2hvc3RfM2Qoc3RydWN0IHZpcnRpb19ncHVf
ZGV2aWNlICp2Z2RldiwKIAljbWRfcC0+aGRyLnR5cGUgPSBjcHVfdG9fbGUzMihWSVJUSU9fR1BV
X0NNRF9UUkFOU0ZFUl9GUk9NX0hPU1RfM0QpOwogCWNtZF9wLT5oZHIuY3R4X2lkID0gY3B1X3Rv
X2xlMzIoY3R4X2lkKTsKIAljbWRfcC0+cmVzb3VyY2VfaWQgPSBjcHVfdG9fbGUzMihiby0+aHdf
cmVzX2hhbmRsZSk7Ci0JY21kX3AtPmJveCA9ICpib3g7CisJY21kX3AtPmJveC54ID0gY3B1X3Rv
X2xlMzIoYm94LT54KTsKKwljbWRfcC0+Ym94LnkgPSBjcHVfdG9fbGUzMihib3gtPnkpOworCWNt
ZF9wLT5ib3gueiA9IGNwdV90b19sZTMyKGJveC0+eik7CisJY21kX3AtPmJveC53ID0gY3B1X3Rv
X2xlMzIoYm94LT53KTsKKwljbWRfcC0+Ym94LmggPSBjcHVfdG9fbGUzMihib3gtPmgpOworCWNt
ZF9wLT5ib3guZCA9IGNwdV90b19sZTMyKGJveC0+ZCk7CiAJY21kX3AtPm9mZnNldCA9IGNwdV90
b19sZTY0KG9mZnNldCk7CiAJY21kX3AtPmxldmVsID0gY3B1X3RvX2xlMzIobGV2ZWwpOwogCi0t
IAoyLjE4LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
