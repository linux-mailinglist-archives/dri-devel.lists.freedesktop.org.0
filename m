Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B586E2BD6
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 10:14:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 811A76E175;
	Thu, 24 Oct 2019 08:14:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C8506E179
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 08:14:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B1C03B5F7;
 Thu, 24 Oct 2019 08:14:21 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kraxel@redhat.com, airlied@linux.ie, daniel@ffwll.ch,
 z.liuxinliang@hisilicon.com, zourongrong@gmail.com,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
 hdegoede@redhat.com, sam@ravnborg.org
Subject: [PATCH v2 2/4] drm/bochs: Replace prepare_fb()/cleanup_fb() with GEM
 VRAM helpers
Date: Thu, 24 Oct 2019 10:14:02 +0200
Message-Id: <20191024081404.6978-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191024081404.6978-1-tzimmermann@suse.de>
References: <20191024081404.6978-1-tzimmermann@suse.de>
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

R0VNIFZSQU0gcHJvdmlkZXMgYW4gaW1wbGVtZW50YXRpb24gZm9yIHByZXBhcmVfZmIoKSBhbmQg
Y2xlYW51cF9mYigpCm9mIHN0cnVjdCBkcm1fc2ltcGxlX2Rpc3BsYXlfcGlwZV9mdW5jcy4gU3dp
dGNoIG92ZXIgYm9jaHMuCgp2MjoKCSogdXNlIGhlbHBlcnMgZm9yIHN0cnVjdCBkcm1fc2ltcGxl
X2Rpc3BsYXlfcGlwZV9mdW5jcwoKU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6
aW1tZXJtYW5uQHN1c2UuZGU+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2JvY2hzL2JvY2hzX2ttcy5j
IHwgMjYgKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDI0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9i
b2Nocy9ib2Noc19rbXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9ib2Nocy9ib2Noc19rbXMuYwppbmRl
eCAwMmE5YzFlZDE2NWIuLjNmMDAwNmMyNDcwZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2JvY2hzL2JvY2hzX2ttcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9ib2Nocy9ib2Noc19rbXMu
YwpAQCAtNjksMzMgKzY5LDExIEBAIHN0YXRpYyB2b2lkIGJvY2hzX3BpcGVfdXBkYXRlKHN0cnVj
dCBkcm1fc2ltcGxlX2Rpc3BsYXlfcGlwZSAqcGlwZSwKIAl9CiB9CiAKLXN0YXRpYyBpbnQgYm9j
aHNfcGlwZV9wcmVwYXJlX2ZiKHN0cnVjdCBkcm1fc2ltcGxlX2Rpc3BsYXlfcGlwZSAqcGlwZSwK
LQkJCQkgc3RydWN0IGRybV9wbGFuZV9zdGF0ZSAqbmV3X3N0YXRlKQotewotCXN0cnVjdCBkcm1f
Z2VtX3ZyYW1fb2JqZWN0ICpnYm87Ci0KLQlpZiAoIW5ld19zdGF0ZS0+ZmIpCi0JCXJldHVybiAw
OwotCWdibyA9IGRybV9nZW1fdnJhbV9vZl9nZW0obmV3X3N0YXRlLT5mYi0+b2JqWzBdKTsKLQly
ZXR1cm4gZHJtX2dlbV92cmFtX3BpbihnYm8sIERSTV9HRU1fVlJBTV9QTF9GTEFHX1ZSQU0pOwot
fQotCi1zdGF0aWMgdm9pZCBib2Noc19waXBlX2NsZWFudXBfZmIoc3RydWN0IGRybV9zaW1wbGVf
ZGlzcGxheV9waXBlICpwaXBlLAotCQkJCSAgc3RydWN0IGRybV9wbGFuZV9zdGF0ZSAqb2xkX3N0
YXRlKQotewotCXN0cnVjdCBkcm1fZ2VtX3ZyYW1fb2JqZWN0ICpnYm87Ci0KLQlpZiAoIW9sZF9z
dGF0ZS0+ZmIpCi0JCXJldHVybjsKLQlnYm8gPSBkcm1fZ2VtX3ZyYW1fb2ZfZ2VtKG9sZF9zdGF0
ZS0+ZmItPm9ialswXSk7Ci0JZHJtX2dlbV92cmFtX3VucGluKGdibyk7Ci19Ci0KIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgZHJtX3NpbXBsZV9kaXNwbGF5X3BpcGVfZnVuY3MgYm9jaHNfcGlwZV9mdW5j
cyA9IHsKIAkuZW5hYmxlCSAgICA9IGJvY2hzX3BpcGVfZW5hYmxlLAogCS51cGRhdGUJICAgID0g
Ym9jaHNfcGlwZV91cGRhdGUsCi0JLnByZXBhcmVfZmIgPSBib2Noc19waXBlX3ByZXBhcmVfZmIs
Ci0JLmNsZWFudXBfZmIgPSBib2Noc19waXBlX2NsZWFudXBfZmIsCisJLnByZXBhcmVfZmIgPSBk
cm1fZ2VtX3ZyYW1fc2ltcGxlX2Rpc3BsYXlfcGlwZV9wcmVwYXJlX2ZiLAorCS5jbGVhbnVwX2Zi
ID0gZHJtX2dlbV92cmFtX3NpbXBsZV9kaXNwbGF5X3BpcGVfY2xlYW51cF9mYiwKIH07CiAKIHN0
YXRpYyBpbnQgYm9jaHNfY29ubmVjdG9yX2dldF9tb2RlcyhzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAq
Y29ubmVjdG9yKQotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
