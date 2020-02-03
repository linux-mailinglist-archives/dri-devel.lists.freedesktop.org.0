Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66587150960
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2020 16:14:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16E2B6EC32;
	Mon,  3 Feb 2020 15:14:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 528F26EC31;
 Mon,  3 Feb 2020 15:14:15 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Feb 2020 07:13:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,398,1574150400"; d="scan'208";a="225194214"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga008.fm.intel.com with SMTP; 03 Feb 2020 07:13:56 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 03 Feb 2020 17:13:56 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 04/26] drm/i915: Add glk to intel_detect_preproduction_hw()
Date: Mon,  3 Feb 2020 17:13:21 +0200
Message-Id: <20200203151343.14378-5-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200203151343.14378-1-ville.syrjala@linux.intel.com>
References: <20200203151343.14378-1-ville.syrjala@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkRl
dGVjdCBHTEsgcHJlLXByb2R1Y3Rpb24gc3RlcHBpbmdzLiBOb3QgMTAwJSBvZiBBMiBiZWluZyBw
cmUtcHJvZApzaW5jZSB0aGUgc3BlYyBpcyBhIGJpdCBvZiBhIG1lc3MgYnV0IGZlZWxzIG1vcmUg
b3IgbGVzcyBjb3JyZWN0LgoKU3VnZ2VzdGVkLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlz
LXdpbHNvbi5jby51az4KQWNrZWQtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29u
LmNvLnVrPgpTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGlu
dXguaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZHJ2LmMgfCAxICsK
IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZHJ2LmggfCAyICsrCiAyIGZpbGVzIGNoYW5nZWQs
IDMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVf
ZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2Rydi5jCmluZGV4IDQ2NjFjNWYxZjI5
Ny4uNzNkMjU5ZDk5NTU0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2Ry
di5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZHJ2LmMKQEAgLTQzOCw2ICs0Mzgs
NyBAQCBzdGF0aWMgdm9pZCBpbnRlbF9kZXRlY3RfcHJlcHJvZHVjdGlvbl9odyhzdHJ1Y3QgZHJt
X2k5MTVfcHJpdmF0ZSAqZGV2X3ByaXYpCiAJcHJlIHw9IElTX1NLTF9SRVZJRChkZXZfcHJpdiwg
MCwgU0tMX1JFVklEX0YwKTsKIAlwcmUgfD0gSVNfQlhUX1JFVklEKGRldl9wcml2LCAwLCBCWFRf
UkVWSURfQl9MQVNUKTsKIAlwcmUgfD0gSVNfS0JMX1JFVklEKGRldl9wcml2LCAwLCBLQkxfUkVW
SURfQTApOworCXByZSB8PSBJU19HTEtfUkVWSUQoZGV2X3ByaXYsIDAsIEdMS19SRVZJRF9BMik7
CiAKIAlpZiAocHJlKSB7CiAJCURSTV9FUlJPUigiVGhpcyBpcyBhIHByZS1wcm9kdWN0aW9uIHN0
ZXBwaW5nLiAiCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2Rydi5oIGIv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9kcnYuaAppbmRleCBhNzFmZjIzM2NjNTUuLjlkZjkw
MGY5MzA3ZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9kcnYuaAorKysg
Yi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2Rydi5oCkBAIC0xNTYyLDYgKzE1NjIsOCBAQCBJ
U19TVUJQTEFURk9STShjb25zdCBzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqaTkxNSwKIAogI2Rl
ZmluZSBHTEtfUkVWSURfQTAJCTB4MAogI2RlZmluZSBHTEtfUkVWSURfQTEJCTB4MQorI2RlZmlu
ZSBHTEtfUkVWSURfQTIJCTB4MgorI2RlZmluZSBHTEtfUkVWSURfQjAJCTB4MwogCiAjZGVmaW5l
IElTX0dMS19SRVZJRChkZXZfcHJpdiwgc2luY2UsIHVudGlsKSBcCiAJKElTX0dFTUlOSUxBS0Uo
ZGV2X3ByaXYpICYmIElTX1JFVklEKGRldl9wcml2LCBzaW5jZSwgdW50aWwpKQotLSAKMi4yNC4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
