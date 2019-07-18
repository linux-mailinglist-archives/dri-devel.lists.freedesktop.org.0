Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 429586D067
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2019 16:51:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 198836E400;
	Thu, 18 Jul 2019 14:51:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 107AB6E400;
 Thu, 18 Jul 2019 14:51:19 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Jul 2019 07:51:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,278,1559545200"; d="scan'208";a="195635510"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga002.fm.intel.com with SMTP; 18 Jul 2019 07:51:16 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 18 Jul 2019 17:51:15 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 07/12] drm/i915: Don't look at unrelated PIPECONF bits for
 interlaced readout
Date: Thu, 18 Jul 2019 17:50:48 +0300
Message-Id: <20190718145053.25808-8-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190718145053.25808-1-ville.syrjala@linux.intel.com>
References: <20190718145053.25808-1-ville.syrjala@linux.intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClNp
bmNlIEhTVyB0aGUgUElQRUNPTkYgcHJvZ3Jlc3NpdmUgdnMuIGludGVybGFjZWQgc2VsZWN0aW9u
IGlzIGRvbmUKd2l0aCBqdXN0IHR3byBiaXRzIGluc3RlYWQgb2YgdGhlIGVhcmxpZXIgdGhyZWUu
IExldCdzIG5vdCBsb29rIGF0IHRoZQpleHRyYSBiaXQgb24gSFNXKy4gQWxzbyBnZW4yIGRvZXNu
J3Qgc3VwcG9ydCBpbnRlcmxhY2VkIGRpc3BsYXlzIGF0IGFsbC4KClRoaXMgaXMgYWN0dWFsbHkg
ZmluZSBhcyBpcyBjdXJyZW50bHkgYmVjYXVzZSB0aGUgZXh0cmEgYml0IGlzIG1ieiAoYXMKYXJl
IGFsbCB0aHJlZSBiaXRzIG9uIGdlbjIpLiBCdXQganVzdCB0byBhdm9pZCBtaXNoYXBzIGluIHRo
ZSBmdXR1cmUKaWYgdGhlIGJpdHMgZ2V0IHJldXNlZCBsZXQncyBvbmx5IGxvb2sgYXQgd2hhdCdz
IHByb3Blcmx5IGRlZmluZWQuCgpTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxl
LnN5cmphbGFAbGludXguaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3Bs
YXkvaW50ZWxfZGlzcGxheS5jIHwgMTcgKysrKysrKysrKysrKysrKy0KIDEgZmlsZSBjaGFuZ2Vk
LCAxNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5LmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9kaXNwbGF5L2ludGVsX2Rpc3BsYXkuYwppbmRleCBlMjViODJkMDdkNGYuLmZmZGMzNTBkYzI0
YSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5LmMKQEAg
LTgxODksNiArODE4OSwyMSBAQCBzdGF0aWMgdm9pZCBpbnRlbF9zZXRfcGlwZV9zcmNfc2l6ZShj
b25zdCBzdHJ1Y3QgaW50ZWxfY3J0Y19zdGF0ZSAqY3J0Y19zdGF0ZSkKIAkJICAgKGNydGNfc3Rh
dGUtPnBpcGVfc3JjX2ggLSAxKSk7CiB9CiAKK3N0YXRpYyBib29sIGludGVsX3BpcGVfaXNfaW50
ZXJsYWNlZChzdHJ1Y3QgaW50ZWxfY3J0Y19zdGF0ZSAqY3J0Y19zdGF0ZSkKK3sKKwlzdHJ1Y3Qg
ZHJtX2k5MTVfcHJpdmF0ZSAqZGV2X3ByaXYgPSB0b19pOTE1KGNydGNfc3RhdGUtPmJhc2UuY3J0
Yy0+ZGV2KTsKKwllbnVtIHRyYW5zY29kZXIgY3B1X3RyYW5zY29kZXIgPSBjcnRjX3N0YXRlLT5j
cHVfdHJhbnNjb2RlcjsKKworCWlmIChJU19HRU4oZGV2X3ByaXYsIDIpKQorCQlyZXR1cm4gZmFs
c2U7CisKKwlpZiAoSU5URUxfR0VOKGRldl9wcml2KSA+PSA5IHx8CisJICAgIElTX0JST0FEV0VM
TChkZXZfcHJpdikgfHwgSVNfSEFTV0VMTChkZXZfcHJpdikpCisJCXJldHVybiBJOTE1X1JFQUQo
UElQRUNPTkYoY3B1X3RyYW5zY29kZXIpKSAmIFBJUEVDT05GX0lOVEVSTEFDRV9NQVNLX0hTVzsK
KwllbHNlCisJCXJldHVybiBJOTE1X1JFQUQoUElQRUNPTkYoY3B1X3RyYW5zY29kZXIpKSAmIFBJ
UEVDT05GX0lOVEVSTEFDRV9NQVNLOworfQorCiBzdGF0aWMgdm9pZCBpbnRlbF9nZXRfcGlwZV90
aW1pbmdzKHN0cnVjdCBpbnRlbF9jcnRjICpjcnRjLAogCQkJCSAgIHN0cnVjdCBpbnRlbF9jcnRj
X3N0YXRlICpwaXBlX2NvbmZpZykKIHsKQEAgLTgyMjcsNyArODI0Miw3IEBAIHN0YXRpYyB2b2lk
IGludGVsX2dldF9waXBlX3RpbWluZ3Moc3RydWN0IGludGVsX2NydGMgKmNydGMsCiAJcGlwZV9j
b25maWctPmJhc2UuYWRqdXN0ZWRfbW9kZS5jcnRjX3ZzeW5jX3N0YXJ0ID0gKHRtcCAmIDB4ZmZm
ZikgKyAxOwogCXBpcGVfY29uZmlnLT5iYXNlLmFkanVzdGVkX21vZGUuY3J0Y192c3luY19lbmQg
PSAoKHRtcCA+PiAxNikgJiAweGZmZmYpICsgMTsKIAotCWlmIChJOTE1X1JFQUQoUElQRUNPTkYo
Y3B1X3RyYW5zY29kZXIpKSAmIFBJUEVDT05GX0lOVEVSTEFDRV9NQVNLKSB7CisJaWYgKGludGVs
X3BpcGVfaXNfaW50ZXJsYWNlZChwaXBlX2NvbmZpZykpIHsKIAkJcGlwZV9jb25maWctPmJhc2Uu
YWRqdXN0ZWRfbW9kZS5mbGFncyB8PSBEUk1fTU9ERV9GTEFHX0lOVEVSTEFDRTsKIAkJcGlwZV9j
b25maWctPmJhc2UuYWRqdXN0ZWRfbW9kZS5jcnRjX3Z0b3RhbCArPSAxOwogCQlwaXBlX2NvbmZp
Zy0+YmFzZS5hZGp1c3RlZF9tb2RlLmNydGNfdmJsYW5rX2VuZCArPSAxOwotLSAKMi4yMS4wCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
