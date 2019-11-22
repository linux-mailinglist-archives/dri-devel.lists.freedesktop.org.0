Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 697FA10668A
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2019 07:38:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9EEA6E1F2;
	Fri, 22 Nov 2019 06:38:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6136A6E1F2
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2019 06:37:59 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-128-YVlJdhMFMU2QLu8_ieEFqQ-1; Fri, 22 Nov 2019 01:37:56 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 89F2E100551C;
 Fri, 22 Nov 2019 06:37:54 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-67.ams2.redhat.com
 [10.36.116.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 05EDB6E70E;
 Fri, 22 Nov 2019 06:37:50 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0AA0217536; Fri, 22 Nov 2019 07:37:50 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/2] drm: call drm_gem_object_funcs.mmap with fake offset
Date: Fri, 22 Nov 2019 07:37:48 +0100
Message-Id: <20191122063749.27113-2-kraxel@redhat.com>
In-Reply-To: <20191122063749.27113-1-kraxel@redhat.com>
References: <20191122063749.27113-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: YVlJdhMFMU2QLu8_ieEFqQ-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1574404678;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aGdiHJQ3wd2tnmCCk4UsV27B6S6gW6jgkzpLlT5/3dc=;
 b=QegoQdVO1qd0360wQXLJqQhfY4xom5i7dv9jxyZOCTKZj0JarRwJMzowMnbmS6fYZpovmg
 41VPtzYCSujunN0v6Tt5iDJGkPv8t7yQhvhfuvuCGXP7jUHwepEnxb+X1zU7cnw6xjHSYb
 T8uNrA50Wvj+U8gdBu9tB4KsEMKhs2c=
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 Huang Rui <ray.huang@amd.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Christian Koenig <christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGZha2Ugb2Zmc2V0IGlzIGdvaW5nIHRvIHN0YXksIHNvIGNoYW5nZSB0aGUgY2FsbGluZyBj
b252ZW50aW9uIGZvcgpkcm1fZ2VtX29iamVjdF9mdW5jcy5tbWFwIHRvIGluY2x1ZGUgdGhlIGZh
a2Ugb2Zmc2V0LiAgVXBkYXRlIGFsbCB1c2VycwphY2NvcmRpbmdseS4KCk5vdGUgdGhhdCB0aGlz
IHJldmVydHMgODNiOGE2ZjI0MmVhICgiZHJtL2dlbTogRml4IG1tYXAgZmFrZSBvZmZzZXQKaGFu
ZGxpbmcgZm9yIGRybV9nZW1fb2JqZWN0X2Z1bmNzLm1tYXAiKSBhbmQgb24gdG9wIHRoZW4gYWRk
cyB0aGUgZmFrZQpvZmZzZXQgdG8gIGRybV9nZW1fcHJpbWVfbW1hcCB0byBtYWtlIHN1cmUgYWxs
IHBhdGhzIGxlYWRpbmcgdG8Kb2JqLT5mdW5jcy0+bW1hcCBhcmUgY29uc2lzdGVudC4KCkZpeGVz
OiA4M2I4YTZmMjQyZWEgKCJkcm0vZ2VtOiBGaXggbW1hcCBmYWtlIG9mZnNldCBoYW5kbGluZyBm
b3IgZHJtX2dlbV9vYmplY3RfZnVuY3MubW1hcCIpCkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwu
dmV0dGVyQGZmd2xsLmNoPgpDYzogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KU2lnbmVk
LW9mZi1ieTogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+ClJldmlld2VkLWJ5OiBE
YW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgotLS0KIGluY2x1ZGUvZHJtL2Ry
bV9nZW0uaCAgICAgICAgICAgICAgICAgIHwgNCArLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2dl
bS5jICAgICAgICAgICAgICB8IDMgLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9zaG1lbV9o
ZWxwZXIuYyB8IDMgKysrCiBkcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW1lLmMgICAgICAgICAgICB8
IDMgKysrCiBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib192bS5jICAgICAgICB8IDcgLS0tLS0t
LQogNSBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9nZW0uaCBiL2luY2x1ZGUvZHJtL2RybV9nZW0uaApp
bmRleCA5N2E0ODE2NTY0MmMuLjBiMzc1MDY5Y2Q0OCAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0v
ZHJtX2dlbS5oCisrKyBiL2luY2x1ZGUvZHJtL2RybV9nZW0uaApAQCAtMTU5LDkgKzE1OSw3IEBA
IHN0cnVjdCBkcm1fZ2VtX29iamVjdF9mdW5jcyB7CiAJICoKIAkgKiBUaGUgY2FsbGJhY2sgaXMg
dXNlZCBieSBieSBib3RoIGRybV9nZW1fbW1hcF9vYmooKSBhbmQKIAkgKiBkcm1fZ2VtX3ByaW1l
X21tYXAoKS4gIFdoZW4gQG1tYXAgaXMgcHJlc2VudCBAdm1fb3BzIGlzIG5vdAotCSAqIHVzZWQs
IHRoZSBAbW1hcCBjYWxsYmFjayBtdXN0IHNldCB2bWEtPnZtX29wcyBpbnN0ZWFkLiBUaGUgQG1t
YXAKLQkgKiBjYWxsYmFjayBpcyBhbHdheXMgY2FsbGVkIHdpdGggYSAwIG9mZnNldC4gVGhlIGNh
bGxlciB3aWxsIHJlbW92ZQotCSAqIHRoZSBmYWtlIG9mZnNldCBhcyBuZWNlc3NhcnkuCisJICog
dXNlZCwgdGhlIEBtbWFwIGNhbGxiYWNrIG11c3Qgc2V0IHZtYS0+dm1fb3BzIGluc3RlYWQuCiAJ
ICovCiAJaW50ICgqbW1hcCkoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmosIHN0cnVjdCB2bV9h
cmVhX3N0cnVjdCAqdm1hKTsKIApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW0u
YyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtLmMKaW5kZXggMmYyYjg4OTA5NmIwLi41NmY0MmUw
ZjI1ODQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2RybV9nZW0uYwpAQCAtMTEwNiw5ICsxMTA2LDYgQEAgaW50IGRybV9nZW1fbW1h
cF9vYmooc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmosIHVuc2lnbmVkIGxvbmcgb2JqX3NpemUs
CiAJCXJldHVybiAtRUlOVkFMOwogCiAJaWYgKG9iai0+ZnVuY3MgJiYgb2JqLT5mdW5jcy0+bW1h
cCkgewotCQkvKiBSZW1vdmUgdGhlIGZha2Ugb2Zmc2V0ICovCi0JCXZtYS0+dm1fcGdvZmYgLT0g
ZHJtX3ZtYV9ub2RlX3N0YXJ0KCZvYmotPnZtYV9ub2RlKTsKLQogCQlyZXQgPSBvYmotPmZ1bmNz
LT5tbWFwKG9iaiwgdm1hKTsKIAkJaWYgKHJldCkKIAkJCXJldHVybiByZXQ7CmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9zaG1lbV9oZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fZ2VtX3NobWVtX2hlbHBlci5jCmluZGV4IDA4MTBkM2VmNjk2MS4uYTQyMWEyZWVkNDhh
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9zaG1lbV9oZWxwZXIuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9zaG1lbV9oZWxwZXIuYwpAQCAtNTI4LDYgKzUyOCw5
IEBAIGludCBkcm1fZ2VtX3NobWVtX21tYXAoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmosIHN0
cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKQogCXN0cnVjdCBkcm1fZ2VtX3NobWVtX29iamVjdCAq
c2htZW07CiAJaW50IHJldDsKIAorCS8qIFJlbW92ZSB0aGUgZmFrZSBvZmZzZXQgKi8KKwl2bWEt
PnZtX3Bnb2ZmIC09IGRybV92bWFfbm9kZV9zdGFydCgmb2JqLT52bWFfbm9kZSk7CisKIAlzaG1l
bSA9IHRvX2RybV9nZW1fc2htZW1fb2JqKG9iaik7CiAKIAlyZXQgPSBkcm1fZ2VtX3NobWVtX2dl
dF9wYWdlcyhzaG1lbSk7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW1lLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW1lLmMKaW5kZXggMDgxNDIxMWIwZjNmLi5hOTYzM2Jk
MjQxYmIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbWUuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vZHJtX3ByaW1lLmMKQEAgLTcxNCw2ICs3MTQsOSBAQCBpbnQgZHJtX2dlbV9w
cmltZV9tbWFwKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1
Y3QgKnZtYSkKIAlpbnQgcmV0OwogCiAJaWYgKG9iai0+ZnVuY3MgJiYgb2JqLT5mdW5jcy0+bW1h
cCkgeworCQkvKiBBZGQgdGhlIGZha2Ugb2Zmc2V0ICovCisJCXZtYS0+dm1fcGdvZmYgKz0gZHJt
X3ZtYV9ub2RlX3N0YXJ0KCZvYmotPnZtYV9ub2RlKTsKKwogCQlyZXQgPSBvYmotPmZ1bmNzLT5t
bWFwKG9iaiwgdm1hKTsKIAkJaWYgKHJldCkKIAkJCXJldHVybiByZXQ7CmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib192bS5jIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1f
Ym9fdm0uYwppbmRleCBlNjQ5NWNhMjYzMGIuLjNlOGMzZGU5MWFlNCAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdm0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0
bV9ib192bS5jCkBAIC01MTQsMTMgKzUxNCw2IEBAIEVYUE9SVF9TWU1CT0wodHRtX2JvX21tYXAp
OwogaW50IHR0bV9ib19tbWFwX29iaihzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwgc3RydWN0
IHR0bV9idWZmZXJfb2JqZWN0ICpibykKIHsKIAl0dG1fYm9fZ2V0KGJvKTsKLQotCS8qCi0JICog
RklYTUU6ICZkcm1fZ2VtX29iamVjdF9mdW5jcy5tbWFwIGlzIGNhbGxlZCB3aXRoIHRoZSBmYWtl
IG9mZnNldAotCSAqIHJlbW92ZWQuIEFkZCBpdCBiYWNrIGhlcmUgdW50aWwgdGhlIHJlc3Qgb2Yg
VFRNIHdvcmtzIHdpdGhvdXQgaXQuCi0JICovCi0Jdm1hLT52bV9wZ29mZiArPSBkcm1fdm1hX25v
ZGVfc3RhcnQoJmJvLT5iYXNlLnZtYV9ub2RlKTsKLQogCXR0bV9ib19tbWFwX3ZtYV9zZXR1cChi
bywgdm1hKTsKIAlyZXR1cm4gMDsKIH0KLS0gCjIuMTguMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
