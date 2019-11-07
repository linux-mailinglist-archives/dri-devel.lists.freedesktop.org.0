Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D921F32C5
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 16:18:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F26B6F6F0;
	Thu,  7 Nov 2019 15:18:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55F706F706;
 Thu,  7 Nov 2019 15:18:12 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Nov 2019 07:18:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,278,1569308400"; d="scan'208";a="213039790"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga001.fm.intel.com with SMTP; 07 Nov 2019 07:18:09 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 07 Nov 2019 17:18:08 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 11/12] drm/i915: Fix readout of PIPEGCMAX
Date: Thu,  7 Nov 2019 17:17:24 +0200
Message-Id: <20191107151725.10507-12-ville.syrjala@linux.intel.com>
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClBJ
UEVHQ01BWCBpcyBhIDExLjYgKG9yIDEuMTYgaWYgeW91IHdpbGwpIHZhbHVlLiBJZS4gaXQgY2Fu
CnJlcHJlc2VudCBhIHZhbHVlIG9mIDEuMCB3aGVuIHRoZSBtYXhpbXVtIHdlIGNhbiBzdG9yZSBp
biB0aGUKc29mdHdhcmUgTFVUIGlzIDAuZmZmZi4gQ2xhbXAgdGhlIHZhbHVlIHNvIHRoYXQgaXQg
Z2V0cwpzYXR1cmF0ZWQgdG8gdGhlIG1heCB0aGUgdWFwaSBzdXBwb3J0cy4KClNpZ25lZC1vZmYt
Ynk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9jb2xvci5jIHwgMyArKy0KIGRyaXZl
cnMvZ3B1L2RybS9pOTE1L2k5MTVfcmVnLmggICAgICAgICAgICB8IDEgLQogMiBmaWxlcyBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9jb2xvci5jIGIvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9jb2xvci5jCmluZGV4IDRiMmJkNWFjMGU4ZC4uM2ZkNTE3ZmExZGU1
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2NvbG9yLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9jb2xvci5jCkBAIC00MjIs
NyArNDIyLDggQEAgc3RhdGljIHZvaWQgaTk2NV9sdXRfMTBwNl9wYWNrKHN0cnVjdCBkcm1fY29s
b3JfbHV0ICplbnRyeSwgdTMyIGxkdywgdTMyIHVkdykKIAogc3RhdGljIHUxNiBpOTY1X2x1dF8x
MXA2X21heF9wYWNrKHUzMiB2YWwpCiB7Ci0JcmV0dXJuIFJFR19GSUVMRF9HRVQoUElQRUdDTUFY
X1JHQl9NQVNLLCB2YWwpOworCS8qIFBJUEVHQ01BWCBpcyAxMS42LCBjbGFtcCB0byAxMC42ICov
CisJcmV0dXJuIGNsYW1wX3ZhbCh2YWwsIDAsIDB4ZmZmZik7CiB9CiAKIHN0YXRpYyB1MzIgaWxr
X2x1dF8xMChjb25zdCBzdHJ1Y3QgZHJtX2NvbG9yX2x1dCAqY29sb3IpCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3JlZy5oIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkx
NV9yZWcuaAppbmRleCBhNjA3ZWE1MjA4MjkuLjRhODAyMWEzM2I2NCAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2k5MTUvaTkxNV9yZWcuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9p
OTE1X3JlZy5oCkBAIC01ODcxLDcgKzU4NzEsNiBAQCBlbnVtIHsKIAogI2RlZmluZSAgX1BJUEVB
R0NNQVggICAgICAgICAgIDB4NzAwMTAKICNkZWZpbmUgIF9QSVBFQkdDTUFYICAgICAgICAgICAw
eDcxMDEwCi0jZGVmaW5lIFBJUEVHQ01BWF9SR0JfTUFTSyAgICAgUkVHX0dFTk1BU0soMTUsIDAp
CiAjZGVmaW5lIFBJUEVHQ01BWChwaXBlLCBpKSAgICAgX01NSU9fUElQRTIocGlwZSwgX1BJUEVB
R0NNQVggKyAoaSkgKiA0KQogCiAjZGVmaW5lIF9QSVBFX01JU0NfQQkJCTB4NzAwMzAKLS0gCjIu
MjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
