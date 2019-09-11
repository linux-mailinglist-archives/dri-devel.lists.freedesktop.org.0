Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3846AAFB22
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2019 13:09:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1435B6EA8B;
	Wed, 11 Sep 2019 11:09:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C4086E239
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2019 11:09:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9A068ADDA;
 Wed, 11 Sep 2019 11:09:19 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, kraxel@redhat.com, airlied@linux.ie, corbet@lwn.net,
 z.liuxinliang@hisilicon.com, zourongrong@gmail.com,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
 hdegoede@redhat.com, sam@ravnborg.org, yc_chen@aspeedtech.com
Subject: [PATCH v2 4/4] drm/vram: Unconditonally set BO call-back functions
Date: Wed, 11 Sep 2019 13:09:10 +0200
Message-Id: <20190911110910.30698-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190911110910.30698-1-tzimmermann@suse.de>
References: <20190911110910.30698-1-tzimmermann@suse.de>
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
Cc: virtualization@lists.linux-foundation.org,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHN0YXRlbWVudCdzIGNvbmRpdGlvbiBpcyBhbHdheXMgdHJ1ZS4KClNpZ25lZC1vZmYtYnk6
IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgpBY2tlZC1ieTogR2VyZCBI
b2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9nZW1f
dnJhbV9oZWxwZXIuYyB8IDMgKy0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fdnJhbV9o
ZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmMKaW5kZXggMWEw
NWUyYTk3YjkzLi5hYjlmODUyM2Q4ODcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1f
Z2VtX3ZyYW1faGVscGVyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fdnJhbV9oZWxw
ZXIuYwpAQCAtOTMsOCArOTMsNyBAQCBzdGF0aWMgaW50IGRybV9nZW1fdnJhbV9pbml0KHN0cnVj
dCBkcm1fZGV2aWNlICpkZXYsCiAJaW50IHJldDsKIAlzaXplX3QgYWNjX3NpemU7CiAKLQlpZiAo
IWdiby0+Ym8uYmFzZS5mdW5jcykKLQkJZ2JvLT5iby5iYXNlLmZ1bmNzID0gJmRybV9nZW1fdnJh
bV9vYmplY3RfZnVuY3M7CisJZ2JvLT5iby5iYXNlLmZ1bmNzID0gJmRybV9nZW1fdnJhbV9vYmpl
Y3RfZnVuY3M7CiAKIAlyZXQgPSBkcm1fZ2VtX29iamVjdF9pbml0KGRldiwgJmdiby0+Ym8uYmFz
ZSwgc2l6ZSk7CiAJaWYgKHJldCkKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
