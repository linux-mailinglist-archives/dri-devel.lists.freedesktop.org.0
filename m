Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D66CBD50D
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 00:43:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C89C46EB05;
	Tue, 24 Sep 2019 22:43:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 445286EB03;
 Tue, 24 Sep 2019 22:43:34 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Sep 2019 15:43:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,545,1559545200"; d="scan'208";a="218791929"
Received: from unknown (HELO chromeserver.iind.intel.com) ([10.223.246.82])
 by fmsmga002.fm.intel.com with ESMTP; 24 Sep 2019 15:43:30 -0700
From: srinivasan.s@intel.com
To: intel-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com,
 manasi.d.navare@intel.com, ville.syrjala@linux.intel.com,
 lakshminarayana.vudum@intel.com, dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/i915/dp: Fix DP MST error after unplugging TypeC cable
Date: Wed, 25 Sep 2019 04:07:58 +0530
Message-Id: <1569364678-144501-1-git-send-email-srinivasan.s@intel.com>
X-Mailer: git-send-email 2.7.4
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
Cc: Srinivasan S <srinivasan.s@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU3Jpbml2YXNhbiBTIDxzcmluaXZhc2FuLnNAaW50ZWwuY29tPgoKVGhpcyBwYXRjaCBh
dm9pZHMgRFAgTVNUIHBheWxvYWQgZXJyb3IgbWVzc2FnZSBpbiBkbWVzZywgYXMgaXQgaXMgdHJ5
aW5nCnRvIHVwZGF0ZSB0aGUgcGF5bG9hZCB0byB0aGUgZGlzY29ubmVjdGVkIERQIE1TVCBkZXZp
Y2UuIEFmdGVyIERQIE1TVApkZXZpY2UgaXMgZGlzY29ubmVjdGVkIHdlIHNob3VsZCBub3QgYmUg
dXBkYXRpbmcgdGhlIHBheWxvYWQgYW5kCmhlbmNlIHJlbW92ZSB0aGUgZXJyb3IuCgp2MjogUmVt
b3ZlZCB0aGUgY29ubmVjdG9yIHN0YXR1cyBjaGVjayBhbmQgY29udmVydGVkIGZyb20gZXJyb3Ig
dG8gZGVidWcuCgpCdWd6aWxsYTogaHR0cHM6Ly9idWdzLmZyZWVkZXNrdG9wLm9yZy9zaG93X2J1
Zy5jZ2k/aWQ9MTExNjMyClNpZ25lZC1vZmYtYnk6IFNyaW5pdmFzYW4gUyA8c3Jpbml2YXNhbi5z
QGludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwX21z
dC5jIHwgNyArLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDYgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9k
cF9tc3QuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHBfbXN0LmMKaW5k
ZXggNWIyMjc4ZmRmNjc1Li40OTdhNmFlMGQyYzAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHBfbXN0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9kcF9tc3QuYwpAQCAtMjE1LDEyICsyMTUsNyBAQCBzdGF0aWMgdm9pZCBp
bnRlbF9tc3RfZGlzYWJsZV9kcChzdHJ1Y3QgaW50ZWxfZW5jb2RlciAqZW5jb2RlciwKIAogCXJl
dCA9IGRybV9kcF91cGRhdGVfcGF5bG9hZF9wYXJ0MSgmaW50ZWxfZHAtPm1zdF9tZ3IpOwogCWlm
IChyZXQpIHsKLQkJaWYgKCFjb25uZWN0b3IgfHwKLQkJICAgIGNvbm5lY3Rvci0+YmFzZS5zdGF0
dXMgIT0gY29ubmVjdG9yX3N0YXR1c19jb25uZWN0ZWQpIHsKLQkJCURSTV9XQVJOKCJEUCBNU1Qg
ZGlzY29ubmVjdFxuIik7Ci0JCX0gZWxzZSB7Ci0JCQlEUk1fRVJST1IoImZhaWxlZCB0byB1cGRh
dGUgcGF5bG9hZCAlZFxuIiwgcmV0KTsKLQkJfQorCQlEUk1fREVCVUdfS01TKCJmYWlsZWQgdG8g
dXBkYXRlIHBheWxvYWQgJWRcbiIsIHJldCk7CiAJfQogCWlmIChvbGRfY3J0Y19zdGF0ZS0+aGFz
X2F1ZGlvKQogCQlpbnRlbF9hdWRpb19jb2RlY19kaXNhYmxlKGVuY29kZXIsCi0tIAoyLjcuNAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
