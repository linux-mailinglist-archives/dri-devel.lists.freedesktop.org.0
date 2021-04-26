Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9177336B0E1
	for <lists+dri-devel@lfdr.de>; Mon, 26 Apr 2021 11:43:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AF1E6E7E2;
	Mon, 26 Apr 2021 09:43:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C00BA6E7EF;
 Mon, 26 Apr 2021 09:43:12 +0000 (UTC)
IronPort-SDR: kmWmIq9Z1oWMU3dWCQxP6ivL7GP4ZyEzaqXq/7wT2upe8HHhW+fPwFWpCy1MKtF3gFLQDYxHG8
 TD6v+qzczKyA==
X-IronPort-AV: E=McAfee;i="6200,9189,9965"; a="195861043"
X-IronPort-AV: E=Sophos;i="5.82,252,1613462400"; d="scan'208";a="195861043"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2021 02:43:12 -0700
IronPort-SDR: 5YQCL78997qxJ2lW+hlwxJet4uJIPTVCZqvqQgsbEAR9jI78fcRbJqouGlL9zJxkfoPU/nuEeZ
 0sBW5GyidsmQ==
X-IronPort-AV: E=Sophos;i="5.82,252,1613462400"; d="scan'208";a="429334194"
Received: from rgunnin1-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.252.12.201])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2021 02:43:09 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 8/9] drm/i915/gem: clear userspace buffers for LMEM
Date: Mon, 26 Apr 2021 10:39:00 +0100
Message-Id: <20210426093901.28937-8-matthew.auld@intel.com>
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

QWxsIHVzZXJzcGFjZSBvYmplY3RzIG11c3QgYmUgY2xlYXJlZCB3aGVuIGFsbG9jYXRpbmcgdGhl
IGJhY2tpbmcgc3RvcmUsCmJlZm9yZSB0aGV5IGFyZSBwb3RlbnRpYWxseSB2aXNpYmxlIHRvIHVz
ZXJzcGFjZS4gIEZvciBub3cgdXNlIHNpbXBsZQpDUFUgYmFzZWQgY2xlYXJpbmcgdG8gZG8gdGhp
cyBmb3IgZGV2aWNlIGxvY2FsLW1lbW9yeSBvYmplY3RzLCBub3RlIHRoYXQKaW4gdGhlIG5lYXIg
ZnV0dXJlIHRoaXMgd2lsbCBpbnN0ZWFkIHVzZSB0aGUgYmxpdHRlciBlbmdpbmUuCgpTaWduZWQt
b2ZmLWJ5OiBNYXR0aGV3IEF1bGQgPG1hdHRoZXcuYXVsZEBpbnRlbC5jb20+CkNjOiBKb29uYXMg
TGFodGluZW4gPGpvb25hcy5sYWh0aW5lbkBsaW51eC5pbnRlbC5jb20+CkNjOiBUaG9tYXMgSGVs
bHN0csO2bSA8dGhvbWFzLmhlbGxzdHJvbUBsaW51eC5pbnRlbC5jb20+CkNjOiBEYW5pZWxlIENl
cmFvbG8gU3B1cmlvIDxkYW5pZWxlLmNlcmFvbG9zcHVyaW9AaW50ZWwuY29tPgpDYzogTGlvbmVs
IExhbmR3ZXJsaW4gPGxpb25lbC5nLmxhbmR3ZXJsaW5AbGludXguaW50ZWwuY29tPgpDYzogSm9u
IEJsb29tZmllbGQgPGpvbi5ibG9vbWZpZWxkQGludGVsLmNvbT4KQ2M6IEpvcmRhbiBKdXN0ZW4g
PGpvcmRhbi5sLmp1c3RlbkBpbnRlbC5jb20+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0
dGVyQGludGVsLmNvbT4KQ2M6IEtlbm5ldGggR3JhdW5rZSA8a2VubmV0aEB3aGl0ZWNhcGUub3Jn
PgpDYzogSmFzb24gRWtzdHJhbmQgPGphc29uQGpsZWtzdHJhbmQubmV0PgpDYzogRGF2ZSBBaXJs
aWUgPGFpcmxpZWRAZ21haWwuY29tPgpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpDYzogbWVzYS1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCi0tLQogZHJpdmVycy9ncHUvZHJt
L2k5MTUvZ2VtL2k5MTVfZ2VtX2NyZWF0ZS5jIHwgMTIgKysrKysrKysrKystCiAxIGZpbGUgY2hh
bmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9jcmVhdGUuYyBiL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2dlbS9pOTE1X2dlbV9jcmVhdGUuYwppbmRleCA4OTVmMTY2NmE4ZDMuLjMzOGYzODgzZTIz
OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX2NyZWF0ZS5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9jcmVhdGUuYwpAQCAtNjcs
NiArNjcsNyBAQCBzdGF0aWMgaW50CiBpOTE1X2dlbV9zZXR1cChzdHJ1Y3QgZHJtX2k5MTVfZ2Vt
X29iamVjdCAqb2JqLCB1NjQgc2l6ZSkKIHsKIAlzdHJ1Y3QgaW50ZWxfbWVtb3J5X3JlZ2lvbiAq
bXIgPSBvYmotPm1tLnBsYWNlbWVudHNbMF07CisJdW5zaWduZWQgaW50IGZsYWdzOwogCWludCBy
ZXQ7CiAKIAlzaXplID0gcm91bmRfdXAoc2l6ZSwgb2JqZWN0X21heF9wYWdlX3NpemUob2JqKSk7
CkBAIC03OSw3ICs4MCwxNiBAQCBpOTE1X2dlbV9zZXR1cChzdHJ1Y3QgZHJtX2k5MTVfZ2VtX29i
amVjdCAqb2JqLCB1NjQgc2l6ZSkKIAlpZiAoaTkxNV9nZW1fb2JqZWN0X3NpemVfMmJpZyhzaXpl
KSkKIAkJcmV0dXJuIC1FMkJJRzsKIAotCXJldCA9IG1yLT5vcHMtPmluaXRfb2JqZWN0KG1yLCBv
YmosIHNpemUsIDApOworCS8qCisJICogRm9yIG5vdyByZXNvcnQgdG8gQ1BVIGJhc2VkIGNsZWFy
aW5nIGZvciBkZXZpY2UgbG9jYWwtbWVtb3J5LCBpbiB0aGUKKwkgKiBuZWFyIGZ1dHVyZSB0aGlz
IHdpbGwgdXNlIHRoZSBibGl0dGVyIGVuZ2luZSBmb3IgYWNjZWxlcmF0ZWQsIEdQVQorCSAqIGJh
c2VkIGNsZWFyaW5nLgorCSAqLworCWZsYWdzID0gMDsKKwlpZiAobXItPnR5cGUgPT0gSU5URUxf
TUVNT1JZX0xPQ0FMKQorCQlmbGFncyA9IEk5MTVfQk9fQUxMT0NfQ1BVX0NMRUFSOworCisJcmV0
ID0gbXItPm9wcy0+aW5pdF9vYmplY3QobXIsIG9iaiwgc2l6ZSwgZmxhZ3MpOwogCWlmIChyZXQp
CiAJCXJldHVybiByZXQ7CiAKLS0gCjIuMjYuMwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
