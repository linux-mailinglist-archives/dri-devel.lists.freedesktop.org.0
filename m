Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC1F366F3D
	for <lists+dri-devel@lfdr.de>; Wed, 21 Apr 2021 17:34:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48D8989E43;
	Wed, 21 Apr 2021 15:34:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26E9289E43;
 Wed, 21 Apr 2021 15:34:09 +0000 (UTC)
IronPort-SDR: pa8WWPokzFlEvrUZVGP/dkOLDmgYD5XYdNZ4Bz5wl1n3RA4PidfoPlhobeV/35yNRGu+ZrFAMQ
 FQr4445+0DsQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9961"; a="193596957"
X-IronPort-AV: E=Sophos;i="5.82,240,1613462400"; d="scan'208";a="193596957"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2021 08:34:08 -0700
IronPort-SDR: pj12Ap58fv9meikbqUmVwvNvHwDVAEKoH3phfx0IC35Ngh0bxiKsKODYMNIaBc50pQ4DnHcS00
 OQ7msB/NgrAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,240,1613462400"; d="scan'208";a="421025341"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga008.fm.intel.com with SMTP; 21 Apr 2021 08:34:05 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 21 Apr 2021 18:34:04 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/4] drm/i915: Avoid div-by-zero on gen2
Date: Wed, 21 Apr 2021 18:33:58 +0300
Message-Id: <20210421153401.13847-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210421153401.13847-1-ville.syrjala@linux.intel.com>
References: <20210421153401.13847-1-ville.syrjala@linux.intel.com>
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
Cc: stable@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkdl
bjIgdGlsZXMgYXJlIDJLaUIgaW4gc2l6ZSBzbyBpOTE1X2dlbV9vYmplY3RfZ2V0X3RpbGVfcm93
X3NpemUoKQpjYW4gaW4gZmFjdCByZXR1cm4gPDRLaUIsIHdoaWNoIGxlYWRzIHRvIGRpdi1ieS16
ZXJvIGhlcmUuCkF2b2lkIHRoYXQuCgpOb3Qgc3VyZSBpOTE1X2dlbV9vYmplY3RfZ2V0X3RpbGVf
cm93X3NpemUoKSBpcyBlbnRpcmVseQpzYW5lIGFueXdheSBzaW5jZSBpdCBkb2Vzbid0IGFjY291
bnQgZm9yIHRoZSBkaWZmZXJlbnQgdGlsZQpsYXlvdXRzIG9uIGk4eHgvaTkxNS4uLgoKSSdtIG5v
dCBhYmxlIHRvIGhpdCB0aGlzIGJlZm9yZSBjb21taXQgNjg0Njg5NWZkZTA1ICgiZHJtL2k5MTU6
ClJlcGxhY2UgUElOX05PTkZBVUxUIHdpdGggY2FsbHMgdG8gUElOX05PRVZJQ1QiKSBhbmQgaXQg
bG9va3MKbGlrZSBJIGFsc28gbmVlZCB0byBydW4gcmVjZW50IHZlcnNpb24gb2YgTWVzYS4gV2l0
aCB0aG9zZSBpbgpwbGFjZSB4b25vdGljIHRyaXBzIG9uIHRoaXMgcXVpdGUgZWFzaWx5IG9uIG15
IDg1eC4KCkNjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnClJldmlld2VkLWJ5OiBDaHJpcyBXaWxz
b24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KU2lnbmVkLW9mZi1ieTogVmlsbGUgU3lyasOk
bMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
aTkxNS9nZW0vaTkxNV9nZW1fbW1hbi5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUv
Z2VtL2k5MTVfZ2VtX21tYW4uYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9t
bWFuLmMKaW5kZXggMjU2MWEyZjFlNTRmLi44NTk4YTFjNzhhNGMgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9tbWFuLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZ2VtL2k5MTVfZ2VtX21tYW4uYwpAQCAtMTg5LDcgKzE4OSw3IEBAIGNvbXB1dGVfcGFy
dGlhbF92aWV3KGNvbnN0IHN0cnVjdCBkcm1faTkxNV9nZW1fb2JqZWN0ICpvYmosCiAJc3RydWN0
IGk5MTVfZ2d0dF92aWV3IHZpZXc7CiAKIAlpZiAoaTkxNV9nZW1fb2JqZWN0X2lzX3RpbGVkKG9i
aikpCi0JCWNodW5rID0gcm91bmR1cChjaHVuaywgdGlsZV9yb3dfcGFnZXMob2JqKSk7CisJCWNo
dW5rID0gcm91bmR1cChjaHVuaywgdGlsZV9yb3dfcGFnZXMob2JqKSA/OiAxKTsKIAogCXZpZXcu
dHlwZSA9IEk5MTVfR0dUVF9WSUVXX1BBUlRJQUw7CiAJdmlldy5wYXJ0aWFsLm9mZnNldCA9IHJv
dW5kZG93bihwYWdlX29mZnNldCwgY2h1bmspOwotLSAKMi4yNi4zCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
