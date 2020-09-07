Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E58A12605F7
	for <lists+dri-devel@lfdr.de>; Mon,  7 Sep 2020 22:53:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B2456E4FB;
	Mon,  7 Sep 2020 20:53:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 268AA6E4FB
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Sep 2020 20:53:17 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-210-gHCNxzFdMYWXiLpj82G1Og-1; Mon, 07 Sep 2020 16:47:05 -0400
X-MC-Unique: gHCNxzFdMYWXiLpj82G1Og-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE7DD1DDEF;
 Mon,  7 Sep 2020 20:47:04 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-45.bne.redhat.com
 [10.64.54.45])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5CD6460BE2;
 Mon,  7 Sep 2020 20:47:03 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 08/13] drm/amdgpu/ttm: move to driver backend binding funcs
Date: Tue,  8 Sep 2020 06:46:25 +1000
Message-Id: <20200907204630.1406528-9-airlied@gmail.com>
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

RnJvbTogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4KClJldmlld2VkLWJ5OiBDaHJp
c3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IERh
dmUgQWlybGllIDxhaXJsaWVkQHJlZGhhdC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3R0bS5jIHwgMTAgKysrLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5z
ZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfdHRtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfdHRtLmMKaW5kZXggOTU5MjUwNTU2M2JmLi5mMDdlNzEyMWJjYzUgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMKQEAgLTEyNTUsMTIgKzEyNTUsNiBAQCBzdGF0aWMg
dm9pZCBhbWRncHVfdHRtX2JhY2tlbmRfZGVzdHJveShzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRl
diwKIAlrZnJlZShndHQpOwogfQogCi1zdGF0aWMgc3RydWN0IHR0bV9iYWNrZW5kX2Z1bmMgYW1k
Z3B1X2JhY2tlbmRfZnVuYyA9IHsKLQkuYmluZCA9ICZhbWRncHVfdHRtX2JhY2tlbmRfYmluZCwK
LQkudW5iaW5kID0gJmFtZGdwdV90dG1fYmFja2VuZF91bmJpbmQsCi0JLmRlc3Ryb3kgPSAmYW1k
Z3B1X3R0bV9iYWNrZW5kX2Rlc3Ryb3ksCi19OwotCiAvKioKICAqIGFtZGdwdV90dG1fdHRfY3Jl
YXRlIC0gQ3JlYXRlIGEgdHRtX3R0IG9iamVjdCBmb3IgYSBnaXZlbiBCTwogICoKQEAgLTEyNzcs
NyArMTI3MSw2IEBAIHN0YXRpYyBzdHJ1Y3QgdHRtX3R0ICphbWRncHVfdHRtX3R0X2NyZWF0ZShz
dHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAogCWlmIChndHQgPT0gTlVMTCkgewogCQlyZXR1
cm4gTlVMTDsKIAl9Ci0JZ3R0LT50dG0udHRtLmZ1bmMgPSAmYW1kZ3B1X2JhY2tlbmRfZnVuYzsK
IAlndHQtPmdvYmogPSAmYm8tPmJhc2U7CiAKIAkvKiBhbGxvY2F0ZSBzcGFjZSBmb3IgdGhlIHVu
aW5pdGlhbGl6ZWQgcGFnZSBlbnRyaWVzICovCkBAIC0xNjc5LDYgKzE2NzIsOSBAQCBzdGF0aWMg
c3RydWN0IHR0bV9ib19kcml2ZXIgYW1kZ3B1X2JvX2RyaXZlciA9IHsKIAkudHRtX3R0X2NyZWF0
ZSA9ICZhbWRncHVfdHRtX3R0X2NyZWF0ZSwKIAkudHRtX3R0X3BvcHVsYXRlID0gJmFtZGdwdV90
dG1fdHRfcG9wdWxhdGUsCiAJLnR0bV90dF91bnBvcHVsYXRlID0gJmFtZGdwdV90dG1fdHRfdW5w
b3B1bGF0ZSwKKwkudHRtX3R0X2JpbmQgPSAmYW1kZ3B1X3R0bV9iYWNrZW5kX2JpbmQsCisJLnR0
bV90dF91bmJpbmQgPSAmYW1kZ3B1X3R0bV9iYWNrZW5kX3VuYmluZCwKKwkudHRtX3R0X2Rlc3Ry
b3kgPSAmYW1kZ3B1X3R0bV9iYWNrZW5kX2Rlc3Ryb3ksCiAJLmV2aWN0aW9uX3ZhbHVhYmxlID0g
YW1kZ3B1X3R0bV9ib19ldmljdGlvbl92YWx1YWJsZSwKIAkuZXZpY3RfZmxhZ3MgPSAmYW1kZ3B1
X2V2aWN0X2ZsYWdzLAogCS5tb3ZlID0gJmFtZGdwdV9ib19tb3ZlLAotLSAKMi4yNy4wCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
