Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 811D5145762
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 15:03:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5B7C6F52D;
	Wed, 22 Jan 2020 14:03:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77C7D6F52C;
 Wed, 22 Jan 2020 14:03:07 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Jan 2020 06:03:07 -0800
X-IronPort-AV: E=Sophos;i="5.70,350,1574150400"; d="scan'208";a="220321176"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Jan 2020 06:03:04 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/2] drm: support feature masks in drm_core_check_feature()
Date: Wed, 22 Jan 2020 16:02:58 +0200
Message-Id: <20200122140259.12086-1-jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWxsb3cgYSBtYXNrIG9mIGZlYXR1cmVzIHRvIGJlIHBhc3NlZCB0byBkcm1fY29yZV9jaGVja19m
ZWF0dXJlKCkuIEFsbApmZWF0dXJlcyBpbiB0aGUgbWFzayBhcmUgcmVxdWlyZWQuCgp2MjoKLSBm
aXgga2VybmVsLWRvYyAoVmlsbGUpCi0gYWRkIGFuIGV4dHJhIHZhcmlhYmxlIGZvciBjbGFyaXR5
IChWaWxsZSkKClJldmlld2VkLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGlu
dXguaW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAaW50
ZWwuY29tPgotLS0KIGluY2x1ZGUvZHJtL2RybV9kcnYuaCB8IDEyICsrKysrKysrLS0tLQogMSBm
aWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9pbmNsdWRlL2RybS9kcm1fZHJ2LmggYi9pbmNsdWRlL2RybS9kcm1fZHJ2LmgKaW5kZXggY2Yx
MzQ3MDgxMGE1Li5mMThlMTlmM2YyZDAgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL2RybV9kcnYu
aAorKysgYi9pbmNsdWRlL2RybS9kcm1fZHJ2LmgKQEAgLTgyNiwxNiArODI2LDIwIEBAIHN0YXRp
YyBpbmxpbmUgYm9vbCBkcm1fZGV2X2lzX3VucGx1Z2dlZChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2
KQogLyoqCiAgKiBkcm1fY29yZV9jaGVja19mZWF0dXJlIC0gY2hlY2sgZHJpdmVyIGZlYXR1cmUg
ZmxhZ3MKICAqIEBkZXY6IERSTSBkZXZpY2UgdG8gY2hlY2sKLSAqIEBmZWF0dXJlOiBmZWF0dXJl
IGZsYWcKKyAqIEBmZWF0dXJlczogZmVhdHVyZSBmbGFnKHMpCiAgKgogICogVGhpcyBjaGVja3Mg
QGRldiBmb3IgZHJpdmVyIGZlYXR1cmVzLCBzZWUgJmRybV9kcml2ZXIuZHJpdmVyX2ZlYXR1cmVz
LAogICogJmRybV9kZXZpY2UuZHJpdmVyX2ZlYXR1cmVzLCBhbmQgdGhlIHZhcmlvdXMgJmVudW0g
ZHJtX2RyaXZlcl9mZWF0dXJlIGZsYWdzLgogICoKLSAqIFJldHVybnMgdHJ1ZSBpZiB0aGUgQGZl
YXR1cmUgaXMgc3VwcG9ydGVkLCBmYWxzZSBvdGhlcndpc2UuCisgKiBSZXR1cm5zIHRydWUgaWYg
YWxsIGZlYXR1cmVzIGluIHRoZSBAZmVhdHVyZXMgbWFzayBhcmUgc3VwcG9ydGVkLCBmYWxzZQor
ICogb3RoZXJ3aXNlLgogICovCi1zdGF0aWMgaW5saW5lIGJvb2wgZHJtX2NvcmVfY2hlY2tfZmVh
dHVyZShjb25zdCBzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB1MzIgZmVhdHVyZSkKK3N0YXRpYyBp
bmxpbmUgYm9vbCBkcm1fY29yZV9jaGVja19mZWF0dXJlKGNvbnN0IHN0cnVjdCBkcm1fZGV2aWNl
ICpkZXYsCisJCQkJCSAgdTMyIGZlYXR1cmVzKQogewotCXJldHVybiBkZXYtPmRyaXZlci0+ZHJp
dmVyX2ZlYXR1cmVzICYgZGV2LT5kcml2ZXJfZmVhdHVyZXMgJiBmZWF0dXJlOworCXUzMiBzdXBw
b3J0ZWQgPSBkZXYtPmRyaXZlci0+ZHJpdmVyX2ZlYXR1cmVzICYgZGV2LT5kcml2ZXJfZmVhdHVy
ZXM7CisKKwlyZXR1cm4gZmVhdHVyZXMgJiYgKHN1cHBvcnRlZCAmIGZlYXR1cmVzKSA9PSBmZWF0
dXJlczsKIH0KIAogLyoqCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
