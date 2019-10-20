Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69041DE001
	for <lists+dri-devel@lfdr.de>; Sun, 20 Oct 2019 20:21:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B520089A75;
	Sun, 20 Oct 2019 18:21:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7C8889A67
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Oct 2019 18:21:38 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-360-hcP5lqbfNemgu0Ft-01t3w-1; Sun, 20 Oct 2019 14:21:35 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 569491800D9B;
 Sun, 20 Oct 2019 18:21:34 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-116-98.ams2.redhat.com
 [10.36.116.98])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E3D6F60C18;
 Sun, 20 Oct 2019 18:21:32 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH] drm/i915: Try to re-use GOP / previous M-N-P settings for vlv
 DSI PLL
Date: Sun, 20 Oct 2019 20:21:32 +0200
Message-Id: <20191020182132.54945-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: hcP5lqbfNemgu0Ft-01t3w-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1571595697;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=qC4M6KrtTIVEF80h9m03lQjm8Dvnhw/KF4JbqOSt4VM=;
 b=hvqnW2PJuqc6bod7IDCpi+AAJWf1Vzjsv/DwHx2xJBVg8xQEQ2JeYG91EWQtH+1s/4dV+I
 IQE4lDv8OGk5LfRiAHnDcXoSqbr4gg5zRxArh1FUkZ4WSpGgSVsEi6FIl003vWVrIaEFPr
 p6YYF8imT8eFrFPSmhtZw55WmJHjXjg=
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
Cc: Hans de Goede <hdegoede@redhat.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RmFzdGJvb3QgaXMgbm90IHdvcmtpbmcgb24gYW4gQXN1cyBUMTAwSEEsIGl0IGdpdmVzIHRoZSBm
b2xsb3dpbmcKcmVsZXZhbnQgbWVzc2FnZXMgLyBlcnJvcnM6CgogZHNpIHBsbCBkaXYgMDAwMjAx
ZTYsIGN0cmwgODAwODAxMDAKIGZhc3RzZXQgbWlzbWF0Y2ggaW4gZHNpX3BsbC5jdHJsIChleHBl
Y3RlZCAweDgwMTAwMTAwLCBmb3VuZCAweDgwMDgwMTAwKQogZmFzdHNldCBtaXNtYXRjaCBpbiBk
c2lfcGxsLmRpdiAoZXhwZWN0ZWQgMHgwMDAyMDA4ZSwgZm91bmQgMHgwMDAyMDFlNikKClRoZSBw
cm9ibGVtIHNlZW1zIHRvIGJlIHRoYXQgdGhlIEdPUCBwaWNrcyA1IGZvciB0aGUgUCBkaXZpc29y
LCB3aGVyZSBhcwp3ZSBlbmQgdXAgcGlja2luZyA0LgoKVGhpcyBjb21taXQgZml4ZXMgdGhpcyBi
eSBmaXJzdCBjaGVja2luZyBvZiB0aGUgY3VycmVudGx5IGNvbmZpZ3VyZWQKRFNJIFBMTCBzZXR0
aW5ncyBtYXRjaCB0aGUgZGVzaXJlZCBwY2xrIGFuZCBpZiB0aGV5IGRvLCBzdGljayB3aXRoCnRo
ZSBjdXJyZW50bHkgY29uZmlndXJlZCBQTEwgc2V0dGluZ3MuCgpOb3RlIHRoYXQgdmx2X2RzaV9n
ZXRfcGNsaygpIHN0b3JlcyB0aGUgcmVhZCBjdHJsIGFuZCBkaXYgdmFsdWVzIGluc2lkZQpjb25m
aWctPmRzaV9wbGwsIHNvIHRoZXkgYXJlIHNldCB0byB0aGUgR09QIC8gcHJldmlvdXMgdmFsdWVz
IGFmdGVyCmNhbGxpbmcgaXQuCgpTaWduZWQtb2ZmLWJ5OiBIYW5zIGRlIEdvZWRlIDxoZGVnb2Vk
ZUByZWRoYXQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvdmx2X2RzaV9w
bGwuYyB8IDI2ICsrKysrKysrKysrKysrKy0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNl
cnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2Rpc3BsYXkvdmx2X2RzaV9wbGwuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkv
dmx2X2RzaV9wbGwuYwppbmRleCA5NWYzOWNkMGNlMDIuLjRhMDllZGVjZDU5NyAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS92bHZfZHNpX3BsbC5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvdmx2X2RzaV9wbGwuYwpAQCAtMTE5LDE1ICsxMTksMjUg
QEAgaW50IHZsdl9kc2lfcGxsX2NvbXB1dGUoc3RydWN0IGludGVsX2VuY29kZXIgKmVuY29kZXIs
CiAJc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmRldl9wcml2ID0gdG9faTkxNShlbmNvZGVyLT5i
YXNlLmRldik7CiAJc3RydWN0IGludGVsX2RzaSAqaW50ZWxfZHNpID0gZW5jX3RvX2ludGVsX2Rz
aSgmZW5jb2Rlci0+YmFzZSk7CiAJaW50IHJldDsKLQl1MzIgZHNpX2NsazsKLQotCWRzaV9jbGsg
PSBkc2lfY2xrX2Zyb21fcGNsayhpbnRlbF9kc2ktPnBjbGssIGludGVsX2RzaS0+cGl4ZWxfZm9y
bWF0LAotCQkJCSAgICBpbnRlbF9kc2ktPmxhbmVfY291bnQpOworCXUzMiBkc2lfY2xrLCBjdXJy
ZW50X3BjbGs7CiAKLQlyZXQgPSBkc2lfY2FsY19tbnAoZGV2X3ByaXYsIGNvbmZpZywgZHNpX2Ns
ayk7Ci0JaWYgKHJldCkgewotCQlEUk1fREVCVUdfS01TKCJkc2lfY2FsY19tbnAgZmFpbGVkXG4i
KTsKLQkJcmV0dXJuIHJldDsKKwkvKgorCSAqIEZvciBleGFjdCBtYXRjaGVzLCB0aGUgR09QIG1h
eSBwaWNrIGFub3RoZXIgc2V0IG9mIGRpdmlzb3JzCisJICogdGhlbiB3ZSBkbywgaWYgdGhlIEdP
UCBzZXR0aW5ncyBhcmUgYW4gZXhhY3QgbWF0Y2gga2VlcCB0aGVtLgorCSAqLworCWN1cnJlbnRf
cGNsayA9IHZsdl9kc2lfZ2V0X3BjbGsoZW5jb2RlciwgY29uZmlnKTsKKwlpZiAoY3VycmVudF9w
Y2xrID09IGludGVsX2RzaS0+cGNsaykgeworCQljb25maWctPmRzaV9wbGwuY3RybCAmPSBEU0lf
UExMX1AxX1BPU1RfRElWX01BU0s7CisJfSBlbHNlIHsKKwkJZHNpX2NsayA9IGRzaV9jbGtfZnJv
bV9wY2xrKGludGVsX2RzaS0+cGNsaywKKwkJCQkJICAgIGludGVsX2RzaS0+cGl4ZWxfZm9ybWF0
LAorCQkJCQkgICAgaW50ZWxfZHNpLT5sYW5lX2NvdW50KTsKKworCQlyZXQgPSBkc2lfY2FsY19t
bnAoZGV2X3ByaXYsIGNvbmZpZywgZHNpX2Nsayk7CisJCWlmIChyZXQpIHsKKwkJCURSTV9ERUJV
R19LTVMoImRzaV9jYWxjX21ucCBmYWlsZWRcbiIpOworCQkJcmV0dXJuIHJldDsKKwkJfQogCX0K
IAogCWlmIChpbnRlbF9kc2ktPnBvcnRzICYgKDEgPDwgUE9SVF9BKSkKLS0gCjIuMjMuMAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
