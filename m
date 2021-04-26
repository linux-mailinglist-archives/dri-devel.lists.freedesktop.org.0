Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C64B536B0D4
	for <lists+dri-devel@lfdr.de>; Mon, 26 Apr 2021 11:43:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76FF76E183;
	Mon, 26 Apr 2021 09:42:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D2A589DA6;
 Mon, 26 Apr 2021 09:42:53 +0000 (UTC)
IronPort-SDR: Nr4yPZZQEB7YvuNs9qrGSLs4mmK/DFYzYq6amT7POBxvQpLC+EFrBtbwVAoJtb9EfxQ2RimG1a
 tXmxJ+k90WPg==
X-IronPort-AV: E=McAfee;i="6200,9189,9965"; a="195861016"
X-IronPort-AV: E=Sophos;i="5.82,252,1613462400"; d="scan'208";a="195861016"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2021 02:42:53 -0700
IronPort-SDR: GgTVFLJeCyMyZpryNeE7gC+27myf9wAhQZ/uXD6TnMwMr1ubDJRZrPV17AS37dZnJy6YSPV7x6
 fjngxw+vnhUw==
X-IronPort-AV: E=Sophos;i="5.82,252,1613462400"; d="scan'208";a="429334097"
Received: from rgunnin1-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.252.12.201])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2021 02:42:50 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/9] drm/i915: mark stolen as private
Date: Mon, 26 Apr 2021 10:38:54 +0100
Message-Id: <20210426093901.28937-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210426093901.28937-1-matthew.auld@intel.com>
References: <20210426093901.28937-1-matthew.auld@intel.com>
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
ZnJlZWRlc2t0b3Aub3JnCi0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX3N0
b2xlbi5jIHwgNCArKysrCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9tZW1vcnlfcmVnaW9u
LmggfCAxICsKIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX3N0b2xlbi5jIGIvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX3N0b2xlbi5jCmluZGV4IGM1YjY0YjI0MDBlOC4uM2JjYmIx
NDY1MTFhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fc3Rv
bGVuLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX3N0b2xlbi5jCkBA
IC04MDMsNiArODAzLDggQEAgaTkxNV9nZW1fc3RvbGVuX2xtZW1fc2V0dXAoc3RydWN0IGRybV9p
OTE1X3ByaXZhdGUgKmk5MTUpCiAKIAlpbnRlbF9tZW1vcnlfcmVnaW9uX3NldF9uYW1lKG1lbSwg
InN0b2xlbi1sb2NhbCIpOwogCisJbWVtLT5wcml2YXRlID0gdHJ1ZTsKKwogCXJldHVybiBtZW07
CiB9CiAKQEAgLTgyMSw2ICs4MjMsOCBAQCBpOTE1X2dlbV9zdG9sZW5fc21lbV9zZXR1cChzdHJ1
Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqaTkxNSkKIAogCWludGVsX21lbW9yeV9yZWdpb25fc2V0X25h
bWUobWVtLCAic3RvbGVuLXN5c3RlbSIpOwogCisJbWVtLT5wcml2YXRlID0gdHJ1ZTsKKwogCXJl
dHVybiBtZW07CiB9CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX21l
bW9yeV9yZWdpb24uaCBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX21lbW9yeV9yZWdpb24u
aAppbmRleCA0YzhlYzE1YWY1NWYuLjk0MmZjNGY2ODc2NCAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2k5MTUvaW50ZWxfbWVtb3J5X3JlZ2lvbi5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2ludGVsX21lbW9yeV9yZWdpb24uaApAQCAtODYsNiArODYsNyBAQCBzdHJ1Y3QgaW50ZWxf
bWVtb3J5X3JlZ2lvbiB7CiAJdTE2IGluc3RhbmNlOwogCWVudW0gaW50ZWxfcmVnaW9uX2lkIGlk
OwogCWNoYXIgbmFtZVsxNl07CisJYm9vbCBwcml2YXRlOyAvKiBub3QgZm9yIHVzZXJzcGFjZSAq
LwogCiAJc3RydWN0IGxpc3RfaGVhZCByZXNlcnZlZDsKIAotLSAKMi4yNi4zCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
