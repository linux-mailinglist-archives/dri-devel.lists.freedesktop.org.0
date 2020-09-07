Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BAF2605F9
	for <lists+dri-devel@lfdr.de>; Mon,  7 Sep 2020 22:54:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9CD86E573;
	Mon,  7 Sep 2020 20:54:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B17296E573
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Sep 2020 20:54:04 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-_kmOwqMYNrCGC0PP8cNPWQ-1; Mon, 07 Sep 2020 16:47:04 -0400
X-MC-Unique: _kmOwqMYNrCGC0PP8cNPWQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 050F4801F98;
 Mon,  7 Sep 2020 20:47:03 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-45.bne.redhat.com
 [10.64.54.45])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A615B60BE2;
 Mon,  7 Sep 2020 20:47:01 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 07/13] drm/vmwgfx: move to driver binding functions
Date: Tue,  8 Sep 2020 06:46:24 +1000
Message-Id: <20200907204630.1406528-8-airlied@gmail.com>
In-Reply-To: <20200907204630.1406528-1-airlied@gmail.com>
References: <20200907204630.1406528-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=airlied@gmail.com
X-Mimecast-Spam-Score: 0.002
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

RnJvbTogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4KCkFja2VkLWJ5OiBDaHJpc3Rp
YW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IERhdmUg
QWlybGllIDxhaXJsaWVkQHJlZGhhdC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92
bXdnZnhfdHRtX2J1ZmZlci5jIHwgMTAgKysrLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5z
ZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
dm13Z2Z4L3Ztd2dmeF90dG1fYnVmZmVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dm
eF90dG1fYnVmZmVyLmMKaW5kZXggYTc2YTdmNTQyZGQ4Li42NzU3YmU5OGJlMTQgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X3R0bV9idWZmZXIuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF90dG1fYnVmZmVyLmMKQEAgLTY2OCwxMiArNjY4LDYg
QEAgc3RhdGljIHZvaWQgdm13X3R0bV91bnBvcHVsYXRlKHN0cnVjdCB0dG1fYm9fZGV2aWNlICpi
ZGV2LAogCQl0dG1fcG9vbF91bnBvcHVsYXRlKHR0bSk7CiB9CiAKLXN0YXRpYyBzdHJ1Y3QgdHRt
X2JhY2tlbmRfZnVuYyB2bXdfdHRtX2Z1bmMgPSB7Ci0JLmJpbmQgPSB2bXdfdHRtX2JpbmQsCi0J
LnVuYmluZCA9IHZtd190dG1fdW5iaW5kLAotCS5kZXN0cm95ID0gdm13X3R0bV9kZXN0cm95LAot
fTsKLQogc3RhdGljIHN0cnVjdCB0dG1fdHQgKnZtd190dG1fdHRfY3JlYXRlKHN0cnVjdCB0dG1f
YnVmZmVyX29iamVjdCAqYm8sCiAJCQkJCXVpbnQzMl90IHBhZ2VfZmxhZ3MpCiB7CkBAIC02ODQs
NyArNjc4LDYgQEAgc3RhdGljIHN0cnVjdCB0dG1fdHQgKnZtd190dG1fdHRfY3JlYXRlKHN0cnVj
dCB0dG1fYnVmZmVyX29iamVjdCAqYm8sCiAJaWYgKCF2bXdfYmUpCiAJCXJldHVybiBOVUxMOwog
Ci0Jdm13X2JlLT5kbWFfdHRtLnR0bS5mdW5jID0gJnZtd190dG1fZnVuYzsKIAl2bXdfYmUtPmRl
dl9wcml2ID0gY29udGFpbmVyX29mKGJvLT5iZGV2LCBzdHJ1Y3Qgdm13X3ByaXZhdGUsIGJkZXYp
OwogCXZtd19iZS0+bW9iID0gTlVMTDsKIApAQCAtNzcwLDYgKzc2Myw5IEBAIHN0cnVjdCB0dG1f
Ym9fZHJpdmVyIHZtd19ib19kcml2ZXIgPSB7CiAJLnR0bV90dF9jcmVhdGUgPSAmdm13X3R0bV90
dF9jcmVhdGUsCiAJLnR0bV90dF9wb3B1bGF0ZSA9ICZ2bXdfdHRtX3BvcHVsYXRlLAogCS50dG1f
dHRfdW5wb3B1bGF0ZSA9ICZ2bXdfdHRtX3VucG9wdWxhdGUsCisJLnR0bV90dF9iaW5kID0gJnZt
d190dG1fYmluZCwKKwkudHRtX3R0X3VuYmluZCA9ICZ2bXdfdHRtX3VuYmluZCwKKwkudHRtX3R0
X2Rlc3Ryb3kgPSAmdm13X3R0bV9kZXN0cm95LAogCS5ldmljdGlvbl92YWx1YWJsZSA9IHR0bV9i
b19ldmljdGlvbl92YWx1YWJsZSwKIAkuZXZpY3RfZmxhZ3MgPSB2bXdfZXZpY3RfZmxhZ3MsCiAJ
Lm1vdmUgPSBOVUxMLAotLSAKMi4yNy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
