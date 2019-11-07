Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A53F32B6
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 16:17:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 178036F6E1;
	Thu,  7 Nov 2019 15:17:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E52646F6E1;
 Thu,  7 Nov 2019 15:17:45 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Nov 2019 07:17:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,278,1569308400"; d="scan'208";a="286017618"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga001.jf.intel.com with SMTP; 07 Nov 2019 07:17:42 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 07 Nov 2019 17:17:41 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 04/12] drm/i915: Add i9xx_lut_8()
Date: Thu,  7 Nov 2019 17:17:17 +0200
Message-Id: <20191107151725.10507-5-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191107151725.10507-1-ville.syrjala@linux.intel.com>
References: <20191107151725.10507-1-ville.syrjala@linux.intel.com>
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
Cc: Swati Sharma <swati2.sharma@intel.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCldl
IGhhdmUgYSBuaWNlIGxpdHRsZSBoZWxwZXIgdG8gY29tcHV0ZSBhIHNpbmdsZSBMVVQgZW50cnkK
Zm9yIGV2ZXJ5dGhpbmcgZXhjZXB0IHRoZSA4YnBjIGxlZ2FjeSBnYW1tYSBtb2RlLiBMZXQncwpj
b21wbGV0ZSB0aGUgc2V0LgoKU2lnbmVkLW9mZi1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5z
eXJqYWxhQGxpbnV4LmludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5
L2ludGVsX2NvbG9yLmMgfCAxMiArKysrKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2Vy
dGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9jb2xvci5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF9jb2xvci5jCmluZGV4IGYyMDgwOWQ5MWY4NS4uNTQ0M2I4ZWMwYTRjIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2NvbG9yLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9jb2xvci5jCkBAIC0zNjcsNiArMzY3LDEzIEBA
IHN0YXRpYyB2b2lkIGNodl9sb2FkX2NnbV9jc2Moc3RydWN0IGludGVsX2NydGMgKmNydGMsCiAJ
STkxNV9XUklURShDR01fUElQRV9DU0NfQ09FRkY4KHBpcGUpLCBjb2VmZnNbOF0pOwogfQogCitz
dGF0aWMgdTMyIGk5eHhfbHV0XzgoY29uc3Qgc3RydWN0IGRybV9jb2xvcl9sdXQgKmNvbG9yKQor
eworCXJldHVybiBkcm1fY29sb3JfbHV0X2V4dHJhY3QoY29sb3ItPnJlZCwgOCkgPDwgMTYgfAor
CQlkcm1fY29sb3JfbHV0X2V4dHJhY3QoY29sb3ItPmdyZWVuLCA4KSA8PCA4IHwKKwkJZHJtX2Nv
bG9yX2x1dF9leHRyYWN0KGNvbG9yLT5ibHVlLCA4KTsKK30KKwogLyogaTk2NSsgIjEwLjYiIGJp
dCBpbnRlcnBvbGF0ZWQgZm9ybWF0ICJldmVuIERXIiAobG93IDggYml0cykgKi8KIHN0YXRpYyB1
MzIgaTk2NV9sdXRfMTBwNl9sZHcoY29uc3Qgc3RydWN0IGRybV9jb2xvcl9sdXQgKmNvbG9yKQog
ewpAQCAtNDEwLDEwICs0MTcsNyBAQCBzdGF0aWMgdm9pZCBpOXh4X2xvYWRfbHV0c19pbnRlcm5h
bChjb25zdCBzdHJ1Y3QgaW50ZWxfY3J0Y19zdGF0ZSAqY3J0Y19zdGF0ZSwKIAkJY29uc3Qgc3Ry
dWN0IGRybV9jb2xvcl9sdXQgKmx1dCA9IGJsb2ItPmRhdGE7CiAKIAkJZm9yIChpID0gMDsgaSA8
IDI1NjsgaSsrKSB7Ci0JCQl1MzIgd29yZCA9Ci0JCQkJKGRybV9jb2xvcl9sdXRfZXh0cmFjdChs
dXRbaV0ucmVkLCA4KSA8PCAxNikgfAotCQkJCShkcm1fY29sb3JfbHV0X2V4dHJhY3QobHV0W2ld
LmdyZWVuLCA4KSA8PCA4KSB8Ci0JCQkJZHJtX2NvbG9yX2x1dF9leHRyYWN0KGx1dFtpXS5ibHVl
LCA4KTsKKwkJCXUzMiB3b3JkID0gaTl4eF9sdXRfOCgmbHV0W2ldKTsKIAogCQkJaWYgKEhBU19H
TUNIKGRldl9wcml2KSkKIAkJCQlJOTE1X1dSSVRFKFBBTEVUVEUocGlwZSwgaSksIHdvcmQpOwot
LSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
