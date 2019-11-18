Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CC3100618
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2019 14:04:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 683636E513;
	Mon, 18 Nov 2019 13:04:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p00-ob.smtp.rzone.de (mo6-p00-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5300::4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E6866E516
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 13:04:19 +0000 (UTC)
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXQr4OGUPX+1JjWArIj7M="
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
 by smtp.strato.de (RZmta 44.29.0 DYNA|AUTH)
 with ESMTPSA id e07688vAID4Eedk
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Mon, 18 Nov 2019 14:04:14 +0100 (CET)
From: Stephan Gerhold <stephan@gerhold.net>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] drm/mcde: dsi: Fix invalid pointer dereference if panel
 cannot be found
Date: Mon, 18 Nov 2019 14:02:52 +0100
Message-Id: <20191118130252.170324-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1574082257; 
 s=strato-dkim-0002; d=gerhold.net;
 h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=ukcHuF3D4wPigrPHkkFZTsmWR0K50dSJVxn/jbjgb0w=;
 b=S+4cw20dsAqUzJpHF9vE7qmlaYq0Q1/7u5TlJtxiZkBn2Bg0tbAYd4Vl8J4dUyofh7
 TQAuArEUHox1Y9u24YPd9shZpWngqjd9RXpzDgoTTghsV4rvbwvD8RGqdd8LYLOWy+cZ
 5OKNu5O74blqoK5j65AoO7c0LJz68PqLilDklfEC9X58crk5yDoCG6RB2idwzrYy3tKc
 ABRUChR6lAWUvhbKv5o574il6M8j+4yRdqBcEI27qcYuveUinTlTW2V6djjyLAXyfaH2
 QQlfyeMDCa/H5knlPlQUvbge+1DnkmMozKO+Nej/oUT1jhKm31KGgySDTEqO9VXThMc8
 NE0A==
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
Cc: David Airlie <airlied@linux.ie>, Stephan Gerhold <stephan@gerhold.net>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlICJwYW5lbCIgcG9pbnRlciBpcyBub3QgcmVzZXQgdG8gTlVMTCBpZiBvZl9kcm1fZmluZF9w
YW5lbCgpCnJldHVybnMgYW4gZXJyb3IuIFRoZXJlZm9yZSB3ZSBsYXRlciBhc3N1bWUgdGhhdCBh
IHBhbmVsIHdhcyBmb3VuZCwKYW5kIHRyeSB0byBkZXJlZmVyZW5jZSB0aGUgZXJyb3IgcG9pbnRl
ciwgcmVzdWx0aW5nIGluOgoKICAgIG1jZGUtZHNpIGEwMzUxMDAwLmRzaTogZmFpbGVkIHRvIGZp
bmQgcGFuZWwgdHJ5IGJyaWRnZSAoNDI5NDk2Njc3OSkKICAgIFVuYWJsZSB0byBoYW5kbGUga2Vy
bmVsIHBhZ2luZyByZXF1ZXN0IGF0IHZpcnR1YWwgYWRkcmVzcyBmZmZmZmUwMwogICAgUEMgaXMg
YXQgZHJtX3BhbmVsX2JyaWRnZV9hZGQucGFydC4wKzB4MTAvMHg1YwogICAgTFIgaXMgYXQgbWNk
ZV9kc2lfYmluZCsweDEyMC8weDQ2NAogICAgLi4uCgpSZXNldCAicGFuZWwiIHRvIE5VTEwgdG8g
YXZvaWQgdGhpcyBwcm9ibGVtLgpBbHNvIGNoYW5nZSB0aGUgZm9ybWF0IHN0cmluZyBvZiB0aGUg
ZXJyb3IgdG8gJWxkIHRvIHByaW50CnRoZSBuZWdhdGl2ZSBlcnJvcnMgY29ycmVjdGx5LiBUaGUg
Y3Jhc2ggYWJvdmUgdGhlbiBiZWNvbWVzOgoKICAgIG1jZGUtZHNpIGEwMzUxMDAwLmRzaTogZmFp
bGVkIHRvIGZpbmQgcGFuZWwgdHJ5IGJyaWRnZSAoLTUxNykKICAgIG1jZGUtZHNpIGEwMzUxMDAw
LmRzaTogbm8gcGFuZWwgb3IgYnJpZGdlCiAgICAuLi4KCkZpeGVzOiA1ZmM1MzdiZmQwMDAgKCJk
cm0vbWNkZTogQWRkIG5ldyBkcml2ZXIgZm9yIFNULUVyaWNzc29uIE1DREUiKQpTaWduZWQtb2Zm
LWJ5OiBTdGVwaGFuIEdlcmhvbGQgPHN0ZXBoYW5AZ2VyaG9sZC5uZXQ+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL21jZGUvbWNkZV9kc2kuYyB8IDYgKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9t
Y2RlL21jZGVfZHNpLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWNkZS9tY2RlX2RzaS5jCmluZGV4IDAz
ODk2YTFmMzM5YS4uZWIzYTg1NWFlZjlhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWNk
ZS9tY2RlX2RzaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tY2RlL21jZGVfZHNpLmMKQEAgLTky
NCwxMSArOTI0LDEzIEBAIHN0YXRpYyBpbnQgbWNkZV9kc2lfYmluZChzdHJ1Y3QgZGV2aWNlICpk
ZXYsIHN0cnVjdCBkZXZpY2UgKm1hc3RlciwKIAlmb3JfZWFjaF9hdmFpbGFibGVfY2hpbGRfb2Zf
bm9kZShkZXYtPm9mX25vZGUsIGNoaWxkKSB7CiAJCXBhbmVsID0gb2ZfZHJtX2ZpbmRfcGFuZWwo
Y2hpbGQpOwogCQlpZiAoSVNfRVJSKHBhbmVsKSkgewotCQkJZGV2X2VycihkZXYsICJmYWlsZWQg
dG8gZmluZCBwYW5lbCB0cnkgYnJpZGdlICglbHUpXG4iLAorCQkJZGV2X2VycihkZXYsICJmYWls
ZWQgdG8gZmluZCBwYW5lbCB0cnkgYnJpZGdlICglbGQpXG4iLAogCQkJCVBUUl9FUlIocGFuZWwp
KTsKKwkJCXBhbmVsID0gTlVMTDsKKwogCQkJYnJpZGdlID0gb2ZfZHJtX2ZpbmRfYnJpZGdlKGNo
aWxkKTsKIAkJCWlmIChJU19FUlIoYnJpZGdlKSkgewotCQkJCWRldl9lcnIoZGV2LCAiZmFpbGVk
IHRvIGZpbmQgYnJpZGdlICglbHUpXG4iLAorCQkJCWRldl9lcnIoZGV2LCAiZmFpbGVkIHRvIGZp
bmQgYnJpZGdlICglbGQpXG4iLAogCQkJCQlQVFJfRVJSKGJyaWRnZSkpOwogCQkJCXJldHVybiBQ
VFJfRVJSKGJyaWRnZSk7CiAJCQl9Ci0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
