Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6CDC32AB9C
	for <lists+dri-devel@lfdr.de>; Tue,  2 Mar 2021 21:36:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C61486E0DB;
	Tue,  2 Mar 2021 20:36:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BA186E0DB;
 Tue,  2 Mar 2021 20:36:04 +0000 (UTC)
IronPort-SDR: x7CI8m4ORdQvAgxIHAfeKOnI2dLfCQZ991odgok5nXeVNtCUa+GxEDT63qVRh4zrBOubUUOkmv
 Dsyy+SFHfQKA==
X-IronPort-AV: E=McAfee;i="6000,8403,9911"; a="184552908"
X-IronPort-AV: E=Sophos;i="5.81,217,1610438400"; d="scan'208";a="184552908"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 12:36:03 -0800
IronPort-SDR: w3b/73jFmcKfo6uAtahE3o+EU5d0UFwRH0LdTze2HDTc37zb2zdvNDKWS/61DxAz6wmK+Jm0Ud
 PaDjw/JrUo1w==
X-IronPort-AV: E=Sophos;i="5.81,217,1610438400"; d="scan'208";a="506472434"
Received: from labuser-z97x-ud5h.jf.intel.com ([10.165.21.211])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 02 Mar 2021 12:36:03 -0800
From: Manasi Navare <manasi.d.navare@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/atomic: Add the crtc to affected crtc only if uapi.enable
 = true
Date: Tue,  2 Mar 2021 12:41:32 -0800
Message-Id: <20210302204132.12058-1-manasi.d.navare@intel.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
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
Cc: Daniel Stone <daniels@collabora.com>,
 Manasi Navare <manasi.d.navare@intel.com>,
 Pekka Paalanen <pekka.paalanen@collabora.co.uk>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gY2FzZSBvZiBhIG1vZGVzZXQgd2hlcmUgYSBtb2RlIGdldHMgc3BsaXQgYWNyb3NzIG11dGlw
bGUgQ1JUQ3MKaW4gdGhlIGRyaXZlciBzcGVjaWZpYyBpbXBsZW1lbnRhdGlvbiAoYmlnam9pbmVy
IGluIGk5MTUpIHdlIHdyb25nbHkgY291bnQKdGhlIGFmZmVjdGVkIENSVENzIGJhc2VkIG9uIHRo
ZSBkcm1fY3J0Y19tYXNrIGFuZCBpbmRpY2F0ZSB0aGUgc3RvbGVuIENSVEMgYXMKYW4gYWZmZWN0
ZWQgQ1JUQyBpbiBhdG9taWNfY2hlY2tfb25seSgpLgpUaGlzIHRyaWdnZXJzIGEgd2FybmluZyBz
aW5jZSBhZmZlY3RlZCBDUlRDcyBkb2VudCBtYXRjaCByZXF1ZXN0ZWQgQ1JUQy4KClRvIGZpeCB0
aGlzIGluIHN1Y2ggYmlnam9pbmVyIGNvbmZpZ3VyYXRpb25zLCB3ZSBzaG91bGQgb25seQppbmNy
ZW1lbnQgYWZmZWN0ZWQgY3J0Y3MgaWYgdGhhdCBDUlRDIGlzIGVuYWJsZWQgaW4gVUFQSSBub3QK
aWYgaXQgaXMganVzdCB1c2VkIGludGVybmFsbHkgaW4gdGhlIGRyaXZlciB0byBzcGxpdCB0aGUg
bW9kZS4KCkNjOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29t
PgpDYzogU2ltb24gU2VyIDxjb250YWN0QGVtZXJzaW9uLmZyPgpDYzogUGVra2EgUGFhbGFuZW4g
PHBla2thLnBhYWxhbmVuQGNvbGxhYm9yYS5jby51az4KQ2M6IERhbmllbCBTdG9uZSA8ZGFuaWVs
c0Bjb2xsYWJvcmEuY29tPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5j
b20+CkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnClNpZ25lZC1vZmYtYnk6IE1h
bmFzaSBOYXZhcmUgPG1hbmFzaS5kLm5hdmFyZUBpbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2RybV9hdG9taWMuYyB8IDYgKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fYXRv
bWljLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pYy5jCmluZGV4IDViNDU0N2UwZjc3NS4u
ZDdhY2Q2YmJkOTdlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pYy5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljLmMKQEAgLTEzNTgsOCArMTM1OCwxMCBAQCBp
bnQgZHJtX2F0b21pY19jaGVja19vbmx5KHN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpzdGF0ZSkK
IAkJfQogCX0KIAotCWZvcl9lYWNoX25ld19jcnRjX2luX3N0YXRlKHN0YXRlLCBjcnRjLCBuZXdf
Y3J0Y19zdGF0ZSwgaSkKLQkJYWZmZWN0ZWRfY3J0YyB8PSBkcm1fY3J0Y19tYXNrKGNydGMpOwor
CWZvcl9lYWNoX25ld19jcnRjX2luX3N0YXRlKHN0YXRlLCBjcnRjLCBuZXdfY3J0Y19zdGF0ZSwg
aSkgeworCQlpZiAobmV3X2NydGNfc3RhdGUtPmVuYWJsZSkKKwkJCWFmZmVjdGVkX2NydGMgfD0g
ZHJtX2NydGNfbWFzayhjcnRjKTsKKwl9CiAKIAkvKgogCSAqIEZvciBjb21taXRzIHRoYXQgYWxs
b3cgbW9kZXNldHMgZHJpdmVycyBjYW4gYWRkIG90aGVyIENSVENzIHRvIHRoZQotLSAKMi4xOS4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
