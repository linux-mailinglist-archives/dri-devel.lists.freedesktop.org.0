Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C4AF1648
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 13:47:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF5756E1F2;
	Wed,  6 Nov 2019 12:47:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04F9E6E1F2
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 12:47:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 86FE7B35B;
 Wed,  6 Nov 2019 12:47:30 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch,
	noralf@tronnes.org
Subject: [PATCH v2 1/2] drm/todo: Convert drivers to generic fbdev emulation
Date: Wed,  6 Nov 2019 13:47:26 +0100
Message-Id: <20191106124727.11641-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191106124727.11641-1-tzimmermann@suse.de>
References: <20191106124727.11641-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyByZXBsYWNlcyB0aGUgb3JpZ2luYWwgVE9ETyBpdGVtIGZvciBkcm1fZmJfaGVscGVyX2Zi
ZGV2X3NldHVwKCkKYW5kIF90ZWFyZG93bigpLCB3aGljaCBhcmUgZGVwcmVjYXRlZC4KCnYyOgoJ
KiByZW1vdmUgZHJpdmVyLXNwZWNpZmljIGNvbW1lbnRzCgkqIGxpc3Qgc29tZSBiYXNpYyByZXF1
aXJlbWVudHMKCSoga2VlcCBhIFRPRE8gaXRlbSBvbiBkcm1fZmJfaGVscGVyX2luaXQoKQoKU2ln
bmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+Ci0tLQog
RG9jdW1lbnRhdGlvbi9ncHUvdG9kby5yc3QgfCAyMyArKysrKysrLS0tLS0tLS0tLS0tLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMTYgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvRG9jdW1lbnRhdGlvbi9ncHUvdG9kby5yc3QgYi9Eb2N1bWVudGF0aW9uL2dwdS90b2Rv
LnJzdAppbmRleCBiM2MwZDUxN2RiOTMuLjNlYzUwOTM4MWZjNSAxMDA2NDQKLS0tIGEvRG9jdW1l
bnRhdGlvbi9ncHUvdG9kby5yc3QKKysrIGIvRG9jdW1lbnRhdGlvbi9ncHUvdG9kby5yc3QKQEAg
LTE3MSwyMSArMTcxLDEyIEBAIENvbnRhY3Q6IE1haW50YWluZXIgb2YgdGhlIGRyaXZlciB5b3Ug
cGxhbiB0byBjb252ZXJ0CiAKIExldmVsOiBJbnRlcm1lZGlhdGUKIAotQ29udmVydCBkcml2ZXJz
IHRvIHVzZSBkcm1fZmJfaGVscGVyX2ZiZGV2X3NldHVwL3RlYXJkb3duKCkKLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCitDb252ZXJ0
IGRyaXZlcnMgdG8gdXNlIGRybV9mYmRldl9nZW5lcmljX3NldHVwKCkKKy0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogCi1Nb3N0IGRyaXZlcnMgY2FuIHVz
ZSBkcm1fZmJfaGVscGVyX2ZiZGV2X3NldHVwKCkgZXhjZXB0IG1heWJlOgotCi0tIGFtZGdwdSB3
aGljaCBoYXMgc3BlY2lhbCBsb2dpYyB0byBkZWNpZGUgd2hldGhlciB0byBjYWxsCi0gIGRybV9o
ZWxwZXJfZGlzYWJsZV91bnVzZWRfZnVuY3Rpb25zKCkKLQotLSBhcm1hZGEgd2hpY2ggaXNuJ3Qg
YXRvbWljIGFuZCBkb2Vzbid0IGNhbGwKLSAgZHJtX2hlbHBlcl9kaXNhYmxlX3VudXNlZF9mdW5j
dGlvbnMoKQotCi0tIGk5MTUgd2hpY2ggY2FsbHMgZHJtX2ZiX2hlbHBlcl9pbml0aWFsX2NvbmZp
ZygpIGluIGEgd29ya2VyCi0KLURyaXZlcnMgdGhhdCB1c2UgZHJtX2ZyYW1lYnVmZmVyX3JlbW92
ZSgpIHRvIGNsZWFuIHVwIHRoZSBmYmRldiBmcmFtZWJ1ZmZlciBjYW4KLXByb2JhYmx5IHVzZSBk
cm1fZmJfaGVscGVyX2ZiZGV2X3RlYXJkb3duKCkuCitNb3N0IGRyaXZlcnMgY2FuIHVzZSBkcm1f
ZmJkZXZfZ2VuZXJpY19zZXR1cCgpLiBEcml2ZXIgaGF2ZSB0byBpbXBsZW1lbnQKK2F0b21pYyBt
b2Rlc2V0dGluZyBhbmQgR0VNIHZtYXAgc3VwcG9ydC4gQ3VycmVudCBnZW5lcmljIGZiZGV2IGVt
dWxhdGlvbgorZXhwZWN0cyB0aGUgZnJhbWVidWZmZXIgaW4gc3lzdGVtIG1lbW9yeSAob3Igc3lz
dGVtLWxpa2UgbWVtb3J5KS4KIAogQ29udGFjdDogTWFpbnRhaW5lciBvZiB0aGUgZHJpdmVyIHlv
dSBwbGFuIHRvIGNvbnZlcnQKIApAQCAtMzI4LDggKzMxOSw4IEBAIGRybV9mYl9oZWxwZXIgdGFz
a3MKICAgdGhlc2UgaWd0IHRlc3RzIG5lZWQgdG8gYmUgZml4ZWQ6IGttc19mYmNvbl9mYnRAcHNy
IGFuZAogICBrbXNfZmJjb25fZmJ0QHBzci1zdXNwZW5kLgogCi0tIFRoZSBtYXggY29ubmVjdG9y
IGFyZ3VtZW50IGZvciBkcm1fZmJfaGVscGVyX2luaXQoKSBhbmQKLSAgZHJtX2ZiX2hlbHBlcl9m
YmRldl9zZXR1cCgpIGlzbid0IHVzZWQgYW55bW9yZSBhbmQgY2FuIGJlIHJlbW92ZWQuCistIFRo
ZSBtYXggY29ubmVjdG9yIGFyZ3VtZW50IGZvciBkcm1fZmJfaGVscGVyX2luaXQoKSBpc24ndCB1
c2VkIGFueW1vcmUgYW5kCisgIGNhbiBiZSByZW1vdmVkLgogCiAtIFRoZSBoZWxwZXIgZG9lc24n
dCBrZWVwIGFuIGFycmF5IG9mIGNvbm5lY3RvcnMgYW55bW9yZSBzbyB0aGVzZSBjYW4gYmUKICAg
cmVtb3ZlZDogZHJtX2ZiX2hlbHBlcl9zaW5nbGVfYWRkX2FsbF9jb25uZWN0b3JzKCksCi0tIAoy
LjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
