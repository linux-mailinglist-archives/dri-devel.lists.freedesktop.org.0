Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB4336E8DC
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 12:35:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16E376EDF5;
	Thu, 29 Apr 2021 10:35:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D4FE6EDEF;
 Thu, 29 Apr 2021 10:35:00 +0000 (UTC)
IronPort-SDR: VEENMWKDXJWh+3p/2Adw4VTqMvQDnKDYFCXb5meCfxqtt8YS77Wi6NkHJj6d1fy06MTN5TFMpZ
 mWRqPblmgZqw==
X-IronPort-AV: E=McAfee;i="6200,9189,9968"; a="184449680"
X-IronPort-AV: E=Sophos;i="5.82,259,1613462400"; d="scan'208";a="184449680"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2021 03:34:59 -0700
IronPort-SDR: xb/bOqgdRxyaIK5eblofA4rNnZWMd99C0RGvZcQ4I+XrFaGvMxE86cGTMZql7z0WJo4QF3C526
 Qz5uJzVKrkzw==
X-IronPort-AV: E=Sophos;i="5.82,259,1613462400"; d="scan'208";a="458694106"
Received: from sbfennel-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.252.12.78])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2021 03:34:55 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 2/9] drm/i915: mark stolen as private
Date: Thu, 29 Apr 2021 11:30:49 +0100
Message-Id: <20210429103056.407067-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210429103056.407067-1-matthew.auld@intel.com>
References: <20210429103056.407067-1-matthew.auld@intel.com>
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
Cc: Lionel Landwerlin <lionel.g.landwerlin@linux.intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Jordan Justen <jordan.l.justen@intel.com>, dri-devel@lists.freedesktop.org,
 Kenneth Graunke <kenneth@whitecape.org>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Jon Bloomfield <jon.bloomfield@intel.com>,
 Jason Ekstrand <jason@jlekstrand.net>, mesa-dev@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gdGhlIG5leHQgcGF0Y2ggd2Ugd2FudCB0byBleHBvc2UgdGhlIHN1cHBvcnRlZCByZWdpb25z
IHRvIHVzZXJzcGFjZSwKd2hpY2ggY2FuIHRoZW4gYmUgZmVkIGludG8gdGhlIGdlbV9jcmVhdGVf
ZXh0IHBsYWNlbWVudCBleHRlbnNpb25zLiBGb3IKbm93IHRyZWF0IHN0b2xlbiBtZW1vcnkgYXMg
cHJpdmF0ZSBmcm9tIHVzZXJzcGFjZSBwb3YuCgpTaWduZWQtb2ZmLWJ5OiBNYXR0aGV3IEF1bGQg
PG1hdHRoZXcuYXVsZEBpbnRlbC5jb20+CkNjOiBKb29uYXMgTGFodGluZW4gPGpvb25hcy5sYWh0
aW5lbkBsaW51eC5pbnRlbC5jb20+CkNjOiBUaG9tYXMgSGVsbHN0csO2bSA8dGhvbWFzLmhlbGxz
dHJvbUBsaW51eC5pbnRlbC5jb20+CkNjOiBEYW5pZWxlIENlcmFvbG8gU3B1cmlvIDxkYW5pZWxl
LmNlcmFvbG9zcHVyaW9AaW50ZWwuY29tPgpDYzogTGlvbmVsIExhbmR3ZXJsaW4gPGxpb25lbC5n
LmxhbmR3ZXJsaW5AbGludXguaW50ZWwuY29tPgpDYzogSm9uIEJsb29tZmllbGQgPGpvbi5ibG9v
bWZpZWxkQGludGVsLmNvbT4KQ2M6IEpvcmRhbiBKdXN0ZW4gPGpvcmRhbi5sLmp1c3RlbkBpbnRl
bC5jb20+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KQ2M6IEtl
bm5ldGggR3JhdW5rZSA8a2VubmV0aEB3aGl0ZWNhcGUub3JnPgpDYzogSmFzb24gRWtzdHJhbmQg
PGphc29uQGpsZWtzdHJhbmQubmV0PgpDYzogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAZ21haWwuY29t
PgpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogbWVzYS1kZXZAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnClJldmlld2VkLWJ5OiBLZW5uZXRoIEdyYXVua2UgPGtlbm5ldGhAd2hp
dGVjYXBlLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fc3RvbGVu
LmMgfCA0ICsrKysKIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX21lbW9yeV9yZWdpb24uaCB8
IDEgKwogMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fc3RvbGVuLmMgYi9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9nZW0vaTkxNV9nZW1fc3RvbGVuLmMKaW5kZXggZTFhMzI2NzJiYmU4Li4yOTNmNjQwZmFh
MGEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9zdG9sZW4u
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fc3RvbGVuLmMKQEAgLTgw
Myw2ICs4MDMsOCBAQCBpOTE1X2dlbV9zdG9sZW5fbG1lbV9zZXR1cChzdHJ1Y3QgZHJtX2k5MTVf
cHJpdmF0ZSAqaTkxNSkKIAogCWludGVsX21lbW9yeV9yZWdpb25fc2V0X25hbWUobWVtLCAic3Rv
bGVuLWxvY2FsIik7CiAKKwltZW0tPnByaXZhdGUgPSB0cnVlOworCiAJcmV0dXJuIG1lbTsKIH0K
IApAQCAtODIxLDYgKzgyMyw4IEBAIGk5MTVfZ2VtX3N0b2xlbl9zbWVtX3NldHVwKHN0cnVjdCBk
cm1faTkxNV9wcml2YXRlICppOTE1KQogCiAJaW50ZWxfbWVtb3J5X3JlZ2lvbl9zZXRfbmFtZSht
ZW0sICJzdG9sZW4tc3lzdGVtIik7CiAKKwltZW0tPnByaXZhdGUgPSB0cnVlOworCiAJcmV0dXJu
IG1lbTsKIH0KIApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfbWVtb3J5
X3JlZ2lvbi5oIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfbWVtb3J5X3JlZ2lvbi5oCmlu
ZGV4IDRjOGVjMTVhZjU1Zi4uOTQyZmM0ZjY4NzY0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9pbnRlbF9tZW1vcnlfcmVnaW9uLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUv
aW50ZWxfbWVtb3J5X3JlZ2lvbi5oCkBAIC04Niw2ICs4Niw3IEBAIHN0cnVjdCBpbnRlbF9tZW1v
cnlfcmVnaW9uIHsKIAl1MTYgaW5zdGFuY2U7CiAJZW51bSBpbnRlbF9yZWdpb25faWQgaWQ7CiAJ
Y2hhciBuYW1lWzE2XTsKKwlib29sIHByaXZhdGU7IC8qIG5vdCBmb3IgdXNlcnNwYWNlICovCiAK
IAlzdHJ1Y3QgbGlzdF9oZWFkIHJlc2VydmVkOwogCi0tIAoyLjI2LjMKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
