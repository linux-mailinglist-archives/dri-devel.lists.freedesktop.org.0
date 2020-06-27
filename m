Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE91520C3C5
	for <lists+dri-devel@lfdr.de>; Sat, 27 Jun 2020 21:47:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B28846E191;
	Sat, 27 Jun 2020 19:47:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D1BF6E182
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jun 2020 19:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593287231;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9N8AvdQUToo9Y+kqrQFiK/32YGVd//Qp7NWj3JTO/hY=;
 b=b5X+GgBgbaofif0EQhJNvUXVomC3CwIGjX4U2vVlppIR2243pSHmdtWzBDEYuix+y5xXwG
 PiqstVrm8mRHvpJWLEQtYifWrkOYRApAoVnXDCTEYxbBOW/GVYictHVmr2E94tmI8RNHLt
 orl6kRAXc7hHNNqD/eiHZEcuzkRQjPc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-501-5vQLDUw2NbSai9s8Z6YxYQ-1; Sat, 27 Jun 2020 15:47:08 -0400
X-MC-Unique: 5vQLDUw2NbSai9s8Z6YxYQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 26307107ACCA;
 Sat, 27 Jun 2020 19:47:05 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-112-223.rdu2.redhat.com
 [10.10.112.223])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1A3D779309;
 Sat, 27 Jun 2020 19:47:03 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Subject: [RFC v8 1/9] drm/vblank: Register drmm cleanup action once per
 drm_vblank_crtc
Date: Sat, 27 Jun 2020 15:46:49 -0400
Message-Id: <20200627194657.156514-2-lyude@redhat.com>
In-Reply-To: <20200627194657.156514-1-lyude@redhat.com>
References: <20200627194657.156514-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2luY2Ugd2UnbGwgYmUgYWxsb2NhdGluZyByZXNvdXJjZXMgZm9yIGt0aHJlYWRfY3JlYXRlX3dv
cmtlcigpIGluIHRoZQpuZXh0IGNvbW1pdCAod2hpY2ggY291bGQgZmFpbCBhbmQgcmVxdWlyZSB1
cyB0byBjbGVhbiB1cCB0aGUgbWVzcyksCmxldCdzIHNpbXBsaWZ5IHRoZSBjbGVhbnVwIHByb2Nl
c3MgYSBiaXQgYnkgcmVnaXN0ZXJpbmcgYQpkcm1fdmJsYW5rX2luaXRfcmVsZWFzZSgpIGFjdGlv
biBmb3IgZWFjaCBkcm1fdmJsYW5rX2NydGMgc28gdGhleSdyZQpzdGlsbCBjbGVhbmVkIHVwIGlm
IHdlIGZhaWwgdG8gaW5pdGlhbGl6ZSBvbmUgb2YgdGhlbS4KCkNoYW5nZXMgc2luY2UgdjM6Ciog
VXNlIGRybW1fYWRkX2FjdGlvbl9vcl9yZXNldCgpIC0gRGFuaWVsIFZldHRlcgoKQ2M6IFZpbGxl
IFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+CkNjOiBkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBub3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpS
ZXZpZXdlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpTaWduZWQtb2ZmLWJ5
OiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1f
dmJsYW5rLmMgfCAyMyArKysrKysrKysrLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEw
IGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9kcm1fdmJsYW5rLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3ZibGFuay5jCmluZGV4IDg1
ZTVmMmRiMTYwODUuLmNlNWMxZTFkMjk5NjMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9k
cm1fdmJsYW5rLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV92YmxhbmsuYwpAQCAtNDkyLDE2
ICs0OTIsMTIgQEAgc3RhdGljIHZvaWQgdmJsYW5rX2Rpc2FibGVfZm4oc3RydWN0IHRpbWVyX2xp
c3QgKnQpCiAKIHN0YXRpYyB2b2lkIGRybV92YmxhbmtfaW5pdF9yZWxlYXNlKHN0cnVjdCBkcm1f
ZGV2aWNlICpkZXYsIHZvaWQgKnB0cikKIHsKLQl1bnNpZ25lZCBpbnQgcGlwZTsKLQotCWZvciAo
cGlwZSA9IDA7IHBpcGUgPCBkZXYtPm51bV9jcnRjczsgcGlwZSsrKSB7Ci0JCXN0cnVjdCBkcm1f
dmJsYW5rX2NydGMgKnZibGFuayA9ICZkZXYtPnZibGFua1twaXBlXTsKKwlzdHJ1Y3QgZHJtX3Zi
bGFua19jcnRjICp2YmxhbmsgPSBwdHI7CiAKLQkJZHJtX1dBUk5fT04oZGV2LCBSRUFEX09OQ0Uo
dmJsYW5rLT5lbmFibGVkKSAmJgotCQkJICAgIGRybV9jb3JlX2NoZWNrX2ZlYXR1cmUoZGV2LCBE
UklWRVJfTU9ERVNFVCkpOworCWRybV9XQVJOX09OKGRldiwgUkVBRF9PTkNFKHZibGFuay0+ZW5h
YmxlZCkgJiYKKwkJICAgIGRybV9jb3JlX2NoZWNrX2ZlYXR1cmUoZGV2LCBEUklWRVJfTU9ERVNF
VCkpOwogCi0JCWRlbF90aW1lcl9zeW5jKCZ2YmxhbmstPmRpc2FibGVfdGltZXIpOwotCX0KKwlk
ZWxfdGltZXJfc3luYygmdmJsYW5rLT5kaXNhYmxlX3RpbWVyKTsKIH0KIAogLyoqCkBAIC01MTEs
NyArNTA3LDcgQEAgc3RhdGljIHZvaWQgZHJtX3ZibGFua19pbml0X3JlbGVhc2Uoc3RydWN0IGRy
bV9kZXZpY2UgKmRldiwgdm9pZCAqcHRyKQogICoKICAqIFRoaXMgZnVuY3Rpb24gaW5pdGlhbGl6
ZXMgdmJsYW5rIHN1cHBvcnQgZm9yIEBudW1fY3J0Y3MgZGlzcGxheSBwaXBlbGluZXMuCiAgKiBD
bGVhbnVwIGlzIGhhbmRsZWQgYXV0b21hdGljYWxseSB0aHJvdWdoIGEgY2xlYW51cCBmdW5jdGlv
biBhZGRlZCB3aXRoCi0gKiBkcm1tX2FkZF9hY3Rpb24oKS4KKyAqIGRybW1fYWRkX2FjdGlvbl9v
cl9yZXNldCgpLgogICoKICAqIFJldHVybnM6CiAgKiBaZXJvIG9uIHN1Y2Nlc3Mgb3IgYSBuZWdh
dGl2ZSBlcnJvciBjb2RlIG9uIGZhaWx1cmUuCkBAIC01MzAsMTAgKzUyNiw2IEBAIGludCBkcm1f
dmJsYW5rX2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdW5zaWduZWQgaW50IG51bV9jcnRj
cykKIAogCWRldi0+bnVtX2NydGNzID0gbnVtX2NydGNzOwogCi0JcmV0ID0gZHJtbV9hZGRfYWN0
aW9uKGRldiwgZHJtX3ZibGFua19pbml0X3JlbGVhc2UsIE5VTEwpOwotCWlmIChyZXQpCi0JCXJl
dHVybiByZXQ7Ci0KIAlmb3IgKGkgPSAwOyBpIDwgbnVtX2NydGNzOyBpKyspIHsKIAkJc3RydWN0
IGRybV92YmxhbmtfY3J0YyAqdmJsYW5rID0gJmRldi0+dmJsYW5rW2ldOwogCkBAIC01NDIsNiAr
NTM0LDExIEBAIGludCBkcm1fdmJsYW5rX2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdW5z
aWduZWQgaW50IG51bV9jcnRjcykKIAkJaW5pdF93YWl0cXVldWVfaGVhZCgmdmJsYW5rLT5xdWV1
ZSk7CiAJCXRpbWVyX3NldHVwKCZ2YmxhbmstPmRpc2FibGVfdGltZXIsIHZibGFua19kaXNhYmxl
X2ZuLCAwKTsKIAkJc2VxbG9ja19pbml0KCZ2YmxhbmstPnNlcWxvY2spOworCisJCXJldCA9IGRy
bW1fYWRkX2FjdGlvbl9vcl9yZXNldChkZXYsIGRybV92YmxhbmtfaW5pdF9yZWxlYXNlLAorCQkJ
CQkgICAgICAgdmJsYW5rKTsKKwkJaWYgKHJldCkKKwkJCXJldHVybiByZXQ7CiAJfQogCiAJcmV0
dXJuIDA7Ci0tIAoyLjI2LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
