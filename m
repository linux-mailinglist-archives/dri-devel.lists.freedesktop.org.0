Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E100FC86F
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 15:10:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF5B96E9DA;
	Thu, 14 Nov 2019 14:10:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DFD46E959
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2019 14:10:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5EEA6B17E;
 Thu, 14 Nov 2019 14:10:29 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, sean@poorly.run, daniel@ffwll.ch, kraxel@redhat.com,
 emil.velikov@collabora.com, sam@ravnborg.org, noralf@tronnes.org
Subject: [PATCH 2/5] drm/udl: Remove udl implementation of GEM's free_object()
Date: Thu, 14 Nov 2019 15:10:22 +0100
Message-Id: <20191114141025.32198-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191114141025.32198-1-tzimmermann@suse.de>
References: <20191114141025.32198-1-tzimmermann@suse.de>
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

VWRsJ3MgY3VzdG9tIGltcGxlbWVudGF0aW9uIGZvciBzdHJ1Y3QgZHJtX2dlbV9vYmplY3RfZnVu
Y3MuZnJlZV9vYmplY3QKdW5tYXBzIHBlcm1hLW1hcHBlZCBtZW1vcnkgYnVmZmVyIGJlZm9yZSBm
cmVlaW5nIHRoZSBidWZmZXIgb2JqZWN0LgoKQWZ0ZXIgc3dpdGNoaW5nIHRvIGdlbmVyaWMgZmJk
ZXYgZW11bGF0aW9uIGFuZCBmaXhpbmcgdGhlIGRhbWFnZQpoYW5kbGVyLCBubyBwZXJtYS1tYXBw
ZWQgYnVmZmVycyBoYXZlIHRvIGJlIHJlbGVhc2VkLiBTd2l0Y2ggdG8gU0hNRU0ncwppbXBsZW1l
bnRhdGlvbiBvZiBmcmVlX29iamVjdC4KClNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5u
IDx0emltbWVybWFubkBzdXNlLmRlPgotLS0KIGRyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX2dlbS5j
IHwgMTggKy0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDE3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX2dl
bS5jIGIvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfZ2VtLmMKaW5kZXggNmVhZGU2YjRiMGRjLi5i
NmUyNmY5OGFhMGEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX2dlbS5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX2dlbS5jCkBAIC0xNywyMiArMTcsNiBAQAogICog
R0VNIG9iamVjdCBmdW5jcwogICovCiAKLXN0YXRpYyB2b2lkIHVkbF9nZW1fb2JqZWN0X2ZyZWVf
b2JqZWN0KHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqKQotewotCXN0cnVjdCBkcm1fZ2VtX3No
bWVtX29iamVjdCAqc2htZW0gPSB0b19kcm1fZ2VtX3NobWVtX29iaihvYmopOwotCi0JLyogRmJk
ZXYgZW11bGF0aW9uIHZtYXBzIHRoZSBidWZmZXIuIFVubWFwIGl0IGhlcmUgZm9yIGNvbnNpc3Rl
bmN5Ci0JICogd2l0aCB0aGUgb3JpZ2luYWwgdWRsIEdFTSBjb2RlLgotCSAqCi0JICogVE9ETzog
U3dpdGNoIHRvIGdlbmVyaWMgZmJkZXYgZW11bGF0aW9uIGFuZCByZWxlYXNlIHRoZQotCSAqICAg
ICAgIEdFTSBvYmplY3Qgd2l0aCBkcm1fZ2VtX3NobWVtX2ZyZWVfb2JqZWN0KCkuCi0JICovCi0J
aWYgKHNobWVtLT52YWRkcikKLQkJZHJtX2dlbV9zaG1lbV92dW5tYXAob2JqLCBzaG1lbS0+dmFk
ZHIpOwotCi0JZHJtX2dlbV9zaG1lbV9mcmVlX29iamVjdChvYmopOwotfQotCiBzdGF0aWMgaW50
IHVkbF9nZW1fb2JqZWN0X21tYXAoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmosCiAJCQkgICAg
ICAgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpCiB7CkBAIC05MSw3ICs3NSw3IEBAIHN0YXRp
YyB2b2lkICp1ZGxfZ2VtX29iamVjdF92bWFwKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqKQog
fQogCiBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9nZW1fb2JqZWN0X2Z1bmNzIHVkbF9nZW1fb2Jq
ZWN0X2Z1bmNzID0gewotCS5mcmVlID0gdWRsX2dlbV9vYmplY3RfZnJlZV9vYmplY3QsCisJLmZy
ZWUgPSBkcm1fZ2VtX3NobWVtX2ZyZWVfb2JqZWN0LAogCS5wcmludF9pbmZvID0gZHJtX2dlbV9z
aG1lbV9wcmludF9pbmZvLAogCS5waW4gPSBkcm1fZ2VtX3NobWVtX3BpbiwKIAkudW5waW4gPSBk
cm1fZ2VtX3NobWVtX3VucGluLAotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
