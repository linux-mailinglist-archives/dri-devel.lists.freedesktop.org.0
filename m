Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E3414685B
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2020 13:48:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16F606FC6D;
	Thu, 23 Jan 2020 12:48:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 069036FC6D;
 Thu, 23 Jan 2020 12:48:10 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Jan 2020 04:48:10 -0800
X-IronPort-AV: E=Sophos;i="5.70,353,1574150400"; d="scan'208";a="400327189"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Jan 2020 04:48:07 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 1/2] drm: add drm_core_check_all_features() to check for a
 mask of features
Date: Thu, 23 Jan 2020 14:48:00 +0200
Message-Id: <20200123124801.14958-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIG5ldyBkcm1fY29yZV9jaGVja19hbGxfZmVhdHVyZXMoKSBmdW5jdGlvbiB0byBjaGVjayBm
b3IgYSBtYXNrIG9mCmZlYXR1cmVzLiBBbGwgZmVhdHVyZXMgaW4gdGhlIG1hc2sgYXJlIHJlcXVp
cmVkLgoKUmVkZWZpbmUgZXhpc3RpbmcgZHJtX2NvcmVfY2hlY2tfZmVhdHVyZSgpIGluIHRlcm1z
IG9mIHRoaXMgZnVuY3Rpb24sCnVzaW5nIHRoZSBkcm1fZHJpdmVyX2ZlYXR1cmUgZW51bSBmb3Ig
dGhlIHBhcmFtZXRlci4KCnYzOgotIGFkZCBkcm1fY29yZV9jaGVja19hbGxfZmVhdHVyZXMoKSAo
VGhvbWFzKQoKdjI6Ci0gZml4IGtlcm5lbC1kb2MgKFZpbGxlKQotIGFkZCBhbiBleHRyYSB2YXJp
YWJsZSBmb3IgY2xhcml0eSAoVmlsbGUpCgpDYzogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJq
YWxhQGxpbnV4LmludGVsLmNvbT4KQ2M6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBz
dXNlLmRlPgpSZXZpZXdlZC1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2Uu
ZGU+ClNpZ25lZC1vZmYtYnk6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+Ci0t
LQogaW5jbHVkZS9kcm0vZHJtX2Rydi5oIHwgMjQgKysrKysrKysrKysrKysrKysrKysrKy0tCiAx
IGZpbGUgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9pbmNsdWRlL2RybS9kcm1fZHJ2LmggYi9pbmNsdWRlL2RybS9kcm1fZHJ2LmgKaW5kZXgg
Y2YxMzQ3MDgxMGE1Li4yM2I2MzY2OTFmYjQgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL2RybV9k
cnYuaAorKysgYi9pbmNsdWRlL2RybS9kcm1fZHJ2LmgKQEAgLTgyMyw2ICs4MjMsMjUgQEAgc3Rh
dGljIGlubGluZSBib29sIGRybV9kZXZfaXNfdW5wbHVnZ2VkKHN0cnVjdCBkcm1fZGV2aWNlICpk
ZXYpCiAJcmV0dXJuIHRydWU7CiB9CiAKKy8qKgorICogZHJtX2NvcmVfY2hlY2tfYWxsX2ZlYXR1
cmVzIC0gY2hlY2sgZHJpdmVyIGZlYXR1cmUgZmxhZ3MgbWFzaworICogQGRldjogRFJNIGRldmlj
ZSB0byBjaGVjaworICogQGZlYXR1cmVzOiBmZWF0dXJlIGZsYWcocykgbWFzaworICoKKyAqIFRo
aXMgY2hlY2tzIEBkZXYgZm9yIGRyaXZlciBmZWF0dXJlcywgc2VlICZkcm1fZHJpdmVyLmRyaXZl
cl9mZWF0dXJlcywKKyAqICZkcm1fZGV2aWNlLmRyaXZlcl9mZWF0dXJlcywgYW5kIHRoZSB2YXJp
b3VzICZlbnVtIGRybV9kcml2ZXJfZmVhdHVyZSBmbGFncy4KKyAqCisgKiBSZXR1cm5zIHRydWUg
aWYgYWxsIGZlYXR1cmVzIGluIHRoZSBAZmVhdHVyZXMgbWFzayBhcmUgc3VwcG9ydGVkLCBmYWxz
ZQorICogb3RoZXJ3aXNlLgorICovCitzdGF0aWMgaW5saW5lIGJvb2wgZHJtX2NvcmVfY2hlY2tf
YWxsX2ZlYXR1cmVzKGNvbnN0IHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCisJCQkJCSAgICAgICB1
MzIgZmVhdHVyZXMpCit7CisJdTMyIHN1cHBvcnRlZCA9IGRldi0+ZHJpdmVyLT5kcml2ZXJfZmVh
dHVyZXMgJiBkZXYtPmRyaXZlcl9mZWF0dXJlczsKKworCXJldHVybiBmZWF0dXJlcyAmJiAoc3Vw
cG9ydGVkICYgZmVhdHVyZXMpID09IGZlYXR1cmVzOworfQorCiAvKioKICAqIGRybV9jb3JlX2No
ZWNrX2ZlYXR1cmUgLSBjaGVjayBkcml2ZXIgZmVhdHVyZSBmbGFncwogICogQGRldjogRFJNIGRl
dmljZSB0byBjaGVjawpAQCAtODMzLDkgKzg1MiwxMCBAQCBzdGF0aWMgaW5saW5lIGJvb2wgZHJt
X2Rldl9pc191bnBsdWdnZWQoc3RydWN0IGRybV9kZXZpY2UgKmRldikKICAqCiAgKiBSZXR1cm5z
IHRydWUgaWYgdGhlIEBmZWF0dXJlIGlzIHN1cHBvcnRlZCwgZmFsc2Ugb3RoZXJ3aXNlLgogICov
Ci1zdGF0aWMgaW5saW5lIGJvb2wgZHJtX2NvcmVfY2hlY2tfZmVhdHVyZShjb25zdCBzdHJ1Y3Qg
ZHJtX2RldmljZSAqZGV2LCB1MzIgZmVhdHVyZSkKK3N0YXRpYyBpbmxpbmUgYm9vbCBkcm1fY29y
ZV9jaGVja19mZWF0dXJlKGNvbnN0IHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCisJCQkJCSAgZW51
bSBkcm1fZHJpdmVyX2ZlYXR1cmUgZmVhdHVyZSkKIHsKLQlyZXR1cm4gZGV2LT5kcml2ZXItPmRy
aXZlcl9mZWF0dXJlcyAmIGRldi0+ZHJpdmVyX2ZlYXR1cmVzICYgZmVhdHVyZTsKKwlyZXR1cm4g
ZHJtX2NvcmVfY2hlY2tfYWxsX2ZlYXR1cmVzKGRldiwgZmVhdHVyZSk7CiB9CiAKIC8qKgotLSAK
Mi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
