Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28006FB1DF
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 14:56:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6C7C6ED1B;
	Wed, 13 Nov 2019 13:56:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC0646ED1B
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 13:56:44 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-lsStrGfrPwSwIV-pQUc2SQ-1; Wed, 13 Nov 2019 08:56:40 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 61B5710953CE;
 Wed, 13 Nov 2019 13:56:38 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-69.ams2.redhat.com
 [10.36.116.69])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A8F1990A8;
 Wed, 13 Nov 2019 13:56:31 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7DDA811AAA; Wed, 13 Nov 2019 14:56:30 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: drm@redhat.com
Subject: [PATCH] drm/ttm: fix mmap refcounting
Date: Wed, 13 Nov 2019 14:56:12 +0100
Message-Id: <20191113135612.19679-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: lsStrGfrPwSwIV-pQUc2SQ-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1573653403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=DahN3FKCGNPvbmWogZVF9bc0DBD4WYj2MI4we4l1rhA=;
 b=E8a6+ynu2mhH7qeWyr8Pp0DpJunsj2kTKsZJcA5sEjuadlk4vzS3KIIK/REGpF659zjXNh
 26rihOTuRGbY4Y+DxnjO+Md4+V3H9tdiG42qRj69zmx4tDKxyTSH+T3Bxcks3kpsCeQjxT
 6dJOpk3Jg2FxWfFZgJPfXN7iNsjKkSk=
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
Cc: David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Sean Paul <sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hlbiBtYXBwaW5nIHR0bSBvYmplY3RzIHZpYSBkcm1fZ2VtX3R0bV9tbWFwKCkgaGVscGVyCmRy
bV9nZW1fbW1hcF9vYmooKSB3aWxsIHRha2UgYW4gb2JqZWN0IHJlZmVyZW5jZS4gIFRoYXQgZ2V0
cwpuZXZlciByZWxlYXNlZCBkdWUgdG8gdHRtIGhhdmluZyBpdHMgb3duIHJlZmVyZW5jZSBjb3Vu
dGluZy4KCkZpeCB0aGF0IGJ5IGRyb3BwaW5nIHRoZSBnZW0gb2JqZWN0IHJlZmVyZW5jZSBvbmNl
IHRoZSB0dG0gbW1hcApjb21wbGV0ZWQgKGFuZCB0dG0gcmVmY291bnQgZ290IGJ1bXBlZCkuCgpG
b3IgdGhhdCB0byB3b3JrIHByb3Blcmx5IHRoZSBkcm1fZ2VtX29iamVjdF9nZXQoKSBjYWxsIGlu
CmRybV9nZW1fdHRtX21tYXAoKSBtdXN0IGJlIG1vdmVkIHNvIGl0IGhhcHBlbnMgYmVmb3JlIGNh
bGxpbmcKb2JqLT5mdW5jcy0+bW1hcCgpLCBvdGhlcndpc2UgdGhlIGdlbSByZWZjb3VudCB3b3Vs
ZCBnbyBkb3duCnRvIHplcm8uCgpGaXhlczogMjMxOTI3ZDkzOWYwICgiZHJtL3R0bTogYWRkIGRy
bV9nZW1fdHRtX21tYXAoKSIpClNpZ25lZC1vZmYtYnk6IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEBy
ZWRoYXQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtLmMgICAgICAgICAgICB8IDI0
ICsrKysrKysrKysrKysrLS0tLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fdHRtX2hl
bHBlci5jIHwgMTMgKysrKysrKysrKysrLQogMiBmaWxlcyBjaGFuZ2VkLCAyNiBpbnNlcnRpb25z
KCspLCAxMSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2dl
bS5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9nZW0uYwppbmRleCAyZjJiODg5MDk2YjAuLjAwMGZh
NGExODk5ZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW0uYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vZHJtX2dlbS5jCkBAIC0xMTA1LDIxICsxMTA1LDMzIEBAIGludCBkcm1fZ2Vt
X21tYXBfb2JqKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqLCB1bnNpZ25lZCBsb25nIG9ial9z
aXplLAogCWlmIChvYmpfc2l6ZSA8IHZtYS0+dm1fZW5kIC0gdm1hLT52bV9zdGFydCkKIAkJcmV0
dXJuIC1FSU5WQUw7CiAKKwkvKiBUYWtlIGEgcmVmIGZvciB0aGlzIG1hcHBpbmcgb2YgdGhlIG9i
amVjdCwgc28gdGhhdCB0aGUgZmF1bHQKKwkgKiBoYW5kbGVyIGNhbiBkZXJlZmVyZW5jZSB0aGUg
bW1hcCBvZmZzZXQncyBwb2ludGVyIHRvIHRoZSBvYmplY3QuCisJICogVGhpcyByZWZlcmVuY2Ug
aXMgY2xlYW5lZCB1cCBieSB0aGUgY29ycmVzcG9uZGluZyB2bV9jbG9zZQorCSAqICh3aGljaCBz
aG91bGQgaGFwcGVuIHdoZXRoZXIgdGhlIHZtYSB3YXMgY3JlYXRlZCBieSB0aGlzIGNhbGwsIG9y
CisJICogYnkgYSB2bV9vcGVuIGR1ZSB0byBtcmVtYXAgb3IgcGFydGlhbCB1bm1hcCBvciB3aGF0
ZXZlcikuCisJICovCisJZHJtX2dlbV9vYmplY3RfZ2V0KG9iaik7CisKIAlpZiAob2JqLT5mdW5j
cyAmJiBvYmotPmZ1bmNzLT5tbWFwKSB7CiAJCS8qIFJlbW92ZSB0aGUgZmFrZSBvZmZzZXQgKi8K
IAkJdm1hLT52bV9wZ29mZiAtPSBkcm1fdm1hX25vZGVfc3RhcnQoJm9iai0+dm1hX25vZGUpOwog
CiAJCXJldCA9IG9iai0+ZnVuY3MtPm1tYXAob2JqLCB2bWEpOwotCQlpZiAocmV0KQorCQlpZiAo
cmV0KSB7CisJCQlkcm1fZ2VtX29iamVjdF9wdXRfdW5sb2NrZWQob2JqKTsKIAkJCXJldHVybiBy
ZXQ7CisJCX0KIAkJV0FSTl9PTighKHZtYS0+dm1fZmxhZ3MgJiBWTV9ET05URVhQQU5EKSk7CiAJ
fSBlbHNlIHsKIAkJaWYgKG9iai0+ZnVuY3MgJiYgb2JqLT5mdW5jcy0+dm1fb3BzKQogCQkJdm1h
LT52bV9vcHMgPSBvYmotPmZ1bmNzLT52bV9vcHM7CiAJCWVsc2UgaWYgKGRldi0+ZHJpdmVyLT5n
ZW1fdm1fb3BzKQogCQkJdm1hLT52bV9vcHMgPSBkZXYtPmRyaXZlci0+Z2VtX3ZtX29wczsKLQkJ
ZWxzZQorCQllbHNlIHsKKwkJCWRybV9nZW1fb2JqZWN0X3B1dF91bmxvY2tlZChvYmopOwogCQkJ
cmV0dXJuIC1FSU5WQUw7CisJCX0KIAogCQl2bWEtPnZtX2ZsYWdzIHw9IFZNX0lPIHwgVk1fUEZO
TUFQIHwgVk1fRE9OVEVYUEFORCB8IFZNX0RPTlREVU1QOwogCQl2bWEtPnZtX3BhZ2VfcHJvdCA9
IHBncHJvdF93cml0ZWNvbWJpbmUodm1fZ2V0X3BhZ2VfcHJvdCh2bWEtPnZtX2ZsYWdzKSk7CkBA
IC0xMTI4LDE0ICsxMTQwLDYgQEAgaW50IGRybV9nZW1fbW1hcF9vYmooc3RydWN0IGRybV9nZW1f
b2JqZWN0ICpvYmosIHVuc2lnbmVkIGxvbmcgb2JqX3NpemUsCiAKIAl2bWEtPnZtX3ByaXZhdGVf
ZGF0YSA9IG9iajsKIAotCS8qIFRha2UgYSByZWYgZm9yIHRoaXMgbWFwcGluZyBvZiB0aGUgb2Jq
ZWN0LCBzbyB0aGF0IHRoZSBmYXVsdAotCSAqIGhhbmRsZXIgY2FuIGRlcmVmZXJlbmNlIHRoZSBt
bWFwIG9mZnNldCdzIHBvaW50ZXIgdG8gdGhlIG9iamVjdC4KLQkgKiBUaGlzIHJlZmVyZW5jZSBp
cyBjbGVhbmVkIHVwIGJ5IHRoZSBjb3JyZXNwb25kaW5nIHZtX2Nsb3NlCi0JICogKHdoaWNoIHNo
b3VsZCBoYXBwZW4gd2hldGhlciB0aGUgdm1hIHdhcyBjcmVhdGVkIGJ5IHRoaXMgY2FsbCwgb3IK
LQkgKiBieSBhIHZtX29wZW4gZHVlIHRvIG1yZW1hcCBvciBwYXJ0aWFsIHVubWFwIG9yIHdoYXRl
dmVyKS4KLQkgKi8KLQlkcm1fZ2VtX29iamVjdF9nZXQob2JqKTsKLQogCXJldHVybiAwOwogfQog
RVhQT1JUX1NZTUJPTChkcm1fZ2VtX21tYXBfb2JqKTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9kcm1fZ2VtX3R0bV9oZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3R0bV9o
ZWxwZXIuYwppbmRleCA3NDEyYmZjNWMwNWEuLjYwNWE4YTNkYTdmOSAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2RybV9nZW1fdHRtX2hlbHBlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9k
cm1fZ2VtX3R0bV9oZWxwZXIuYwpAQCAtNjQsOCArNjQsMTkgQEAgaW50IGRybV9nZW1fdHRtX21t
YXAoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpnZW0sCiAJCSAgICAgc3RydWN0IHZtX2FyZWFfc3Ry
dWN0ICp2bWEpCiB7CiAJc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibyA9IGRybV9nZW1fdHRt
X29mX2dlbShnZW0pOworCWludCByZXQ7CiAKLQlyZXR1cm4gdHRtX2JvX21tYXBfb2JqKHZtYSwg
Ym8pOworCXJldCA9IHR0bV9ib19tbWFwX29iaih2bWEsIGJvKTsKKwlpZiAocmV0IDwgMCkKKwkJ
cmV0dXJuIHJldDsKKworCS8qCisJICogdHRtIGhhcyBpdHMgb3duIG9iamVjdCByZWZjb3VudGlu
Zywgc28gZHJvcCBnZW0gcmVmZXJlbmNlCisJICogdG8gYXZvaWQgZG91YmxlIGFjY291bnRpbmcg
Y291bnRpbmcuCisJICovCisJZHJtX2dlbV9vYmplY3RfcHV0X3VubG9ja2VkKGdlbSk7CisKKwly
ZXR1cm4gMDsKIH0KIEVYUE9SVF9TWU1CT0woZHJtX2dlbV90dG1fbW1hcCk7CiAKLS0gCjIuMTgu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
