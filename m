Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 409885DFD4
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2019 10:33:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD57E6E0FA;
	Wed,  3 Jul 2019 08:33:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D3D76E0B8
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2019 08:33:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A4E60AF47;
 Wed,  3 Jul 2019 08:33:09 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, kraxel@redhat.com,
 maarten.lankhorst@linux.intel.com, maxime.ripard@bootlin.com,
 sean@poorly.run, noralf@tronnes.org, sam@ravnborg.org,
 yc_chen@aspeedtech.com
Subject: [PATCH 4/5] drm/bochs: Use shadow buffer for bochs framebuffer console
Date: Wed,  3 Jul 2019 10:33:01 +0200
Message-Id: <20190703083302.2609-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190703083302.2609-1-tzimmermann@suse.de>
References: <20190703083302.2609-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGJvY2hzIGRyaXZlciAoYW5kIHZpcnR1YWwgaGFyZHdhcmUpIHJlcXVpcmVzIGJ1ZmZlciBv
YmplY3RzIHRvCnJlc2lkZSBpbiB2aWRlbyByYW0gdG8gZGlzcGxheSB0aGVtIHRvIHRoZSBzY3Jl
ZW4uIFNvIGl0IGNhbiBub3QKZGlzcGxheSB0aGUgZnJhbWVidWZmZXIgY29uc29sZSBiZWNhdXNl
IHRoZSByZXNwZWN0aXZlIGJ1ZmZlciBvYmplY3QKaXMgcGVybWFuZW50bHkgcGlubmVkIGluIHN5
c3RlbSBtZW1vcnkuCgpVc2luZyBhIHNoYWRvdyBidWZmZXIgZm9yIHRoZSBjb25zb2xlIHNvbHZl
cyB0aGlzIHByb2JsZW0uIFRoZSBjb25zb2xlCmVtdWxhdGlvbiB3aWxsIHBpbiB0aGUgYnVmZmVy
IG9iamVjdCBvbmx5IGR1cmluZyB1cGRhdGVzIGZyb20gdGhlIHNoYWRvdwpidWZmZXIuIE90aGVy
d2lzZSwgdGhlIGJvY2hzIGRyaXZlciBjYW4gZnJlZWx5IHJlbG9jYXRlZCB0aGUgYnVmZmVyCmJl
dHdlZW4gc3lzdGVtIG1lbW9yeSBhbmQgdmlkZW8gcmFtLgoKU2lnbmVkLW9mZi1ieTogVGhvbWFz
IFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2Jv
Y2hzL2JvY2hzX2ttcy5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JvY2hzL2JvY2hzX2tt
cy5jIGIvZHJpdmVycy9ncHUvZHJtL2JvY2hzL2JvY2hzX2ttcy5jCmluZGV4IGJjMTlkYmQ1MzFl
Zi4uNDdmYWI0ODUyNDgzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYm9jaHMvYm9jaHNf
a21zLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2JvY2hzL2JvY2hzX2ttcy5jCkBAIC0xNzIsNyAr
MTcyLDcgQEAgYm9jaHNfZ2VtX2ZiX2NyZWF0ZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCBzdHJ1
Y3QgZHJtX2ZpbGUgKmZpbGUsCiAJICAgIG1vZGVfY21kLT5waXhlbF9mb3JtYXQgIT0gRFJNX0ZP
Uk1BVF9CR1JYODg4OCkKIAkJcmV0dXJuIEVSUl9QVFIoLUVJTlZBTCk7CiAKLQlyZXR1cm4gZHJt
X2dlbV9mYl9jcmVhdGUoZGV2LCBmaWxlLCBtb2RlX2NtZCk7CisJcmV0dXJuIGRybV9nZW1fZmJf
Y3JlYXRlX3dpdGhfZGlydHkoZGV2LCBmaWxlLCBtb2RlX2NtZCk7CiB9CiAKIGNvbnN0IHN0cnVj
dCBkcm1fbW9kZV9jb25maWdfZnVuY3MgYm9jaHNfbW9kZV9mdW5jcyA9IHsKLS0gCjIuMjEuMAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
