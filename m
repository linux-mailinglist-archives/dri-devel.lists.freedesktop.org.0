Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E78B2605E5
	for <lists+dri-devel@lfdr.de>; Mon,  7 Sep 2020 22:47:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF7CF6E546;
	Mon,  7 Sep 2020 20:47:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE4D66E4F8
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Sep 2020 20:46:59 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-209-aTG0Ed67PyCFBL1t6hb7-g-1; Mon, 07 Sep 2020 16:46:54 -0400
X-MC-Unique: aTG0Ed67PyCFBL1t6hb7-g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8784310051C4;
 Mon,  7 Sep 2020 20:46:53 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-45.bne.redhat.com
 [10.64.54.45])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7032B60BE2;
 Mon,  7 Sep 2020 20:46:50 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 03/13] drm/qxl: move bind/unbind/destroy to the driver
 function table.
Date: Tue,  8 Sep 2020 06:46:20 +1000
Message-Id: <20200907204630.1406528-4-airlied@gmail.com>
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
QWlybGllIDxhaXJsaWVkQHJlZGhhdC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxf
dHRtLmMgfCAxMCArKystLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA3
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX3R0bS5j
IGIvZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfdHRtLmMKaW5kZXggYzM1MzBjNmU0NmJkLi40OTcw
YzM0NTBlODggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX3R0bS5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX3R0bS5jCkBAIC0xMzQsMTIgKzEzNCw2IEBAIHN0YXRp
YyB2b2lkIHF4bF90dG1fYmFja2VuZF9kZXN0cm95KHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2
LAogCWtmcmVlKGd0dCk7CiB9CiAKLXN0YXRpYyBzdHJ1Y3QgdHRtX2JhY2tlbmRfZnVuYyBxeGxf
YmFja2VuZF9mdW5jID0gewotCS5iaW5kID0gJnF4bF90dG1fYmFja2VuZF9iaW5kLAotCS51bmJp
bmQgPSAmcXhsX3R0bV9iYWNrZW5kX3VuYmluZCwKLQkuZGVzdHJveSA9ICZxeGxfdHRtX2JhY2tl
bmRfZGVzdHJveSwKLX07Ci0KIHN0YXRpYyBzdHJ1Y3QgdHRtX3R0ICpxeGxfdHRtX3R0X2NyZWF0
ZShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAogCQkJCQl1aW50MzJfdCBwYWdlX2ZsYWdz
KQogewpAQCAtMTUwLDcgKzE0NCw2IEBAIHN0YXRpYyBzdHJ1Y3QgdHRtX3R0ICpxeGxfdHRtX3R0
X2NyZWF0ZShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAogCWd0dCA9IGt6YWxsb2Moc2l6
ZW9mKHN0cnVjdCBxeGxfdHRtX3R0KSwgR0ZQX0tFUk5FTCk7CiAJaWYgKGd0dCA9PSBOVUxMKQog
CQlyZXR1cm4gTlVMTDsKLQlndHQtPnR0bS5mdW5jID0gJnF4bF9iYWNrZW5kX2Z1bmM7CiAJZ3R0
LT5xZGV2ID0gcWRldjsKIAlpZiAodHRtX3R0X2luaXQoJmd0dC0+dHRtLCBibywgcGFnZV9mbGFn
cykpIHsKIAkJa2ZyZWUoZ3R0KTsKQEAgLTE5NSw2ICsxODgsOSBAQCBzdGF0aWMgdm9pZCBxeGxf
Ym9fbW92ZV9ub3RpZnkoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywKIAogc3RhdGljIHN0
cnVjdCB0dG1fYm9fZHJpdmVyIHF4bF9ib19kcml2ZXIgPSB7CiAJLnR0bV90dF9jcmVhdGUgPSAm
cXhsX3R0bV90dF9jcmVhdGUsCisJLnR0bV90dF9iaW5kID0gJnF4bF90dG1fYmFja2VuZF9iaW5k
LAorCS50dG1fdHRfZGVzdHJveSA9ICZxeGxfdHRtX2JhY2tlbmRfZGVzdHJveSwKKwkudHRtX3R0
X3VuYmluZCA9ICZxeGxfdHRtX2JhY2tlbmRfdW5iaW5kLAogCS5ldmljdGlvbl92YWx1YWJsZSA9
IHR0bV9ib19ldmljdGlvbl92YWx1YWJsZSwKIAkuZXZpY3RfZmxhZ3MgPSAmcXhsX2V2aWN0X2Zs
YWdzLAogCS5tb3ZlID0gJnF4bF9ib19tb3ZlLAotLSAKMi4yNy4wCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
