Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D46B1C9A
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2019 13:52:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CE5C6EF31;
	Fri, 13 Sep 2019 11:52:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F37B6EF2F;
 Fri, 13 Sep 2019 11:52:26 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Sep 2019 04:52:25 -0700
X-IronPort-AV: E=Sophos;i="5.64,489,1559545200"; d="scan'208";a="360739777"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Sep 2019 04:52:23 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/9] drm/i2c/sil164: use drm_debug_enabled() to check for
 debug categories
Date: Fri, 13 Sep 2019 14:51:41 +0300
Message-Id: <6dc67ea73a805f0eb718577b0b215663e252ad2b.1568375189.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1568375189.git.jani.nikula@intel.com>
References: <cover.1568375189.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWxsb3cgYmV0dGVyIGFic3RyYWN0aW9uIG9mIHRoZSBkcm1fZGVidWcgZ2xvYmFsIHZhcmlhYmxl
IGluIHRoZQpmdXR1cmUuIE5vIGZ1bmN0aW9uYWwgY2hhbmdlcy4KCkNjOiBGcmFuY2lzY28gSmVy
ZXogPGN1cnJvamVyZXpAcmlzZXVwLm5ldD4KU2lnbmVkLW9mZi1ieTogSmFuaSBOaWt1bGEgPGph
bmkubmlrdWxhQGludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTJjL3NpbDE2NF9kcnYu
YyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pMmMvc2lsMTY0X2Rydi5jIGIvZHJpdmVycy9n
cHUvZHJtL2kyYy9zaWwxNjRfZHJ2LmMKaW5kZXggOGJjZjBkMTk5MTQ1Li5hODM5Zjc4YTRjOGEg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pMmMvc2lsMTY0X2Rydi5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9pMmMvc2lsMTY0X2Rydi5jCkBAIC00NCw3ICs0NCw3IEBAIHN0cnVjdCBzaWwx
NjRfcHJpdiB7CiAJKChzdHJ1Y3Qgc2lsMTY0X3ByaXYgKil0b19lbmNvZGVyX3NsYXZlKHgpLT5z
bGF2ZV9wcml2KQogCiAjZGVmaW5lIHNpbDE2NF9kYmcoY2xpZW50LCBmb3JtYXQsIC4uLikgZG8g
ewkJCQlcCi0JCWlmIChkcm1fZGVidWcgJiBEUk1fVVRfS01TKQkJCQlcCisJCWlmIChkcm1fZGVi
dWdfZW5hYmxlZChEUk1fVVRfS01TKSkJCQlcCiAJCQlkZXZfcHJpbnRrKEtFUk5fREVCVUcsICZj
bGllbnQtPmRldiwJCVwKIAkJCQkgICAiJXM6ICIgZm9ybWF0LCBfX2Z1bmNfXywgIyMgX19WQV9B
UkdTX18pOyBcCiAJfSB3aGlsZSAoMCkKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
