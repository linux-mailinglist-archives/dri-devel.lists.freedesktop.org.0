Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34EA32040EE
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jun 2020 22:08:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24D3D6E8DF;
	Mon, 22 Jun 2020 20:08:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6A0D89CBE
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 20:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592856480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lSAb/eseSEs/+a9Bniw5lJiSCdPpLF6HO9i3q2ob+7o=;
 b=KcqbMirfO/qJdbhRjcxXbUWPXg87Z1rk/5QdqxI7997Pt7wRA40nyxX+FFBrxcVcV9mf1n
 1IysT3aCRGqdLidYDDnteMXzFzaZlWzxdl7qoPWjzPmIWs80IEydAcE2tC4X2zFS+Pryhc
 6M+dlDYYJQw9H9fZ+cCkEOZ1DZ1Qp6M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-n7C1-OBbOuaTO5iqvTMmYg-1; Mon, 22 Jun 2020 16:07:58 -0400
X-MC-Unique: n7C1-OBbOuaTO5iqvTMmYg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AED5A18A8221;
 Mon, 22 Jun 2020 20:07:56 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-117-166.rdu2.redhat.com
 [10.10.117.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 046A95C1BD;
 Mon, 22 Jun 2020 20:07:54 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Subject: [RFC v5 01/10] drm/vblank: Register drmm cleanup action once per
 drm_vblank_crtc
Date: Mon, 22 Jun 2020 16:07:21 -0400
Message-Id: <20200622200730.120716-2-lyude@redhat.com>
In-Reply-To: <20200622200730.120716-1-lyude@redhat.com>
References: <20200622200730.120716-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
VXNlIGRybW1fYWRkX2FjdGlvbl9vcl9yZXNldCgpIC0gRGFuaWVsIFZldHRlcgoKQ2M6IERhbmll
bCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3ly
amFsYUBsaW51eC5pbnRlbC5jb20+CkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
CkNjOiBub3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpTaWduZWQtb2ZmLWJ5OiBMeXVkZSBQ
YXVsIDxseXVkZUByZWRoYXQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fdmJsYW5rLmMg
fCAyMyArKysrKysrKysrLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlv
bnMoKyksIDEzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1f
dmJsYW5rLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3ZibGFuay5jCmluZGV4IDg1ZTVmMmRiMTYw
ODUuLmNlNWMxZTFkMjk5NjMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fdmJsYW5r
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV92YmxhbmsuYwpAQCAtNDkyLDE2ICs0OTIsMTIg
QEAgc3RhdGljIHZvaWQgdmJsYW5rX2Rpc2FibGVfZm4oc3RydWN0IHRpbWVyX2xpc3QgKnQpCiAK
IHN0YXRpYyB2b2lkIGRybV92YmxhbmtfaW5pdF9yZWxlYXNlKHN0cnVjdCBkcm1fZGV2aWNlICpk
ZXYsIHZvaWQgKnB0cikKIHsKLQl1bnNpZ25lZCBpbnQgcGlwZTsKLQotCWZvciAocGlwZSA9IDA7
IHBpcGUgPCBkZXYtPm51bV9jcnRjczsgcGlwZSsrKSB7Ci0JCXN0cnVjdCBkcm1fdmJsYW5rX2Ny
dGMgKnZibGFuayA9ICZkZXYtPnZibGFua1twaXBlXTsKKwlzdHJ1Y3QgZHJtX3ZibGFua19jcnRj
ICp2YmxhbmsgPSBwdHI7CiAKLQkJZHJtX1dBUk5fT04oZGV2LCBSRUFEX09OQ0UodmJsYW5rLT5l
bmFibGVkKSAmJgotCQkJICAgIGRybV9jb3JlX2NoZWNrX2ZlYXR1cmUoZGV2LCBEUklWRVJfTU9E
RVNFVCkpOworCWRybV9XQVJOX09OKGRldiwgUkVBRF9PTkNFKHZibGFuay0+ZW5hYmxlZCkgJiYK
KwkJICAgIGRybV9jb3JlX2NoZWNrX2ZlYXR1cmUoZGV2LCBEUklWRVJfTU9ERVNFVCkpOwogCi0J
CWRlbF90aW1lcl9zeW5jKCZ2YmxhbmstPmRpc2FibGVfdGltZXIpOwotCX0KKwlkZWxfdGltZXJf
c3luYygmdmJsYW5rLT5kaXNhYmxlX3RpbWVyKTsKIH0KIAogLyoqCkBAIC01MTEsNyArNTA3LDcg
QEAgc3RhdGljIHZvaWQgZHJtX3ZibGFua19pbml0X3JlbGVhc2Uoc3RydWN0IGRybV9kZXZpY2Ug
KmRldiwgdm9pZCAqcHRyKQogICoKICAqIFRoaXMgZnVuY3Rpb24gaW5pdGlhbGl6ZXMgdmJsYW5r
IHN1cHBvcnQgZm9yIEBudW1fY3J0Y3MgZGlzcGxheSBwaXBlbGluZXMuCiAgKiBDbGVhbnVwIGlz
IGhhbmRsZWQgYXV0b21hdGljYWxseSB0aHJvdWdoIGEgY2xlYW51cCBmdW5jdGlvbiBhZGRlZCB3
aXRoCi0gKiBkcm1tX2FkZF9hY3Rpb24oKS4KKyAqIGRybW1fYWRkX2FjdGlvbl9vcl9yZXNldCgp
LgogICoKICAqIFJldHVybnM6CiAgKiBaZXJvIG9uIHN1Y2Nlc3Mgb3IgYSBuZWdhdGl2ZSBlcnJv
ciBjb2RlIG9uIGZhaWx1cmUuCkBAIC01MzAsMTAgKzUyNiw2IEBAIGludCBkcm1fdmJsYW5rX2lu
aXQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdW5zaWduZWQgaW50IG51bV9jcnRjcykKIAogCWRl
di0+bnVtX2NydGNzID0gbnVtX2NydGNzOwogCi0JcmV0ID0gZHJtbV9hZGRfYWN0aW9uKGRldiwg
ZHJtX3ZibGFua19pbml0X3JlbGVhc2UsIE5VTEwpOwotCWlmIChyZXQpCi0JCXJldHVybiByZXQ7
Ci0KIAlmb3IgKGkgPSAwOyBpIDwgbnVtX2NydGNzOyBpKyspIHsKIAkJc3RydWN0IGRybV92Ymxh
bmtfY3J0YyAqdmJsYW5rID0gJmRldi0+dmJsYW5rW2ldOwogCkBAIC01NDIsNiArNTM0LDExIEBA
IGludCBkcm1fdmJsYW5rX2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdW5zaWduZWQgaW50
IG51bV9jcnRjcykKIAkJaW5pdF93YWl0cXVldWVfaGVhZCgmdmJsYW5rLT5xdWV1ZSk7CiAJCXRp
bWVyX3NldHVwKCZ2YmxhbmstPmRpc2FibGVfdGltZXIsIHZibGFua19kaXNhYmxlX2ZuLCAwKTsK
IAkJc2VxbG9ja19pbml0KCZ2YmxhbmstPnNlcWxvY2spOworCisJCXJldCA9IGRybW1fYWRkX2Fj
dGlvbl9vcl9yZXNldChkZXYsIGRybV92YmxhbmtfaW5pdF9yZWxlYXNlLAorCQkJCQkgICAgICAg
dmJsYW5rKTsKKwkJaWYgKHJldCkKKwkJCXJldHVybiByZXQ7CiAJfQogCiAJcmV0dXJuIDA7Ci0t
IAoyLjI2LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
