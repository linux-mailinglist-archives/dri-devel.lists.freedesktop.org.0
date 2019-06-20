Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A6E4D05A
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2019 16:27:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA8D66E5BA;
	Thu, 20 Jun 2019 14:27:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90D6C6E5BA;
 Thu, 20 Jun 2019 14:27:00 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Jun 2019 07:26:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,397,1557212400"; d="scan'208";a="160685788"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga008.fm.intel.com with SMTP; 20 Jun 2019 07:26:53 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 20 Jun 2019 17:26:52 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/5] drm/i915: Do not override mode's aspect ratio with the
 prop value NONE
Date: Thu, 20 Jun 2019 17:26:38 +0300
Message-Id: <20190620142639.17518-5-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190620142639.17518-1-ville.syrjala@linux.intel.com>
References: <20190620142639.17518-1-ville.syrjala@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkhE
TUlfUElDVFVSRV9BU1BFQ1RfTk9ORSBtZWFucyAiQXV0b21hdGljIiBzbyB3aGVuIHRoZSB1c2Vy
IGhhcyB0aGF0CnNlbGVjdGVkIHdlIHNob3VsZCBrZWVwIHdoYXRldmVyIGFzcGVjdCByYXRpbyB0
aGUgbW9kZSBhbHJlYWR5IGhhcy4KCkFsc28gbm8gcG9pbnQgaW4gY2hlY2tpbmcgZm9yIGNvbm5l
Y3Rvci0+aXNfaGRtaSBpbiB0aGUgU0RWTyBjb2RlCnNpbmNlIHdlIG9ubHkgYXR0YWNoIHRoZSBw
cm9wZXJ0eSB0byBIRE1JIGNvbm5lY3RvcnMuCgpDYzogSWxpYSBNaXJraW4gPGltaXJraW5AYWx1
bS5taXQuZWR1PgpTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFA
bGludXguaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
aGRtaS5jIHwgNSArKystLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9zZHZv
LmMgfCA2ICsrKy0tLQogMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDUgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9o
ZG1pLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2hkbWkuYwppbmRleCAw
ZWJlYzY5YmJiZmMuLjZhNDY1MGI0NGFjNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9oZG1pLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxh
eS9pbnRlbF9oZG1pLmMKQEAgLTIzOTQsOCArMjM5NCw5IEBAIGludCBpbnRlbF9oZG1pX2NvbXB1
dGVfY29uZmlnKHN0cnVjdCBpbnRlbF9lbmNvZGVyICplbmNvZGVyLAogCQlyZXR1cm4gLUVJTlZB
TDsKIAl9CiAKLQkvKiBTZXQgdXNlciBzZWxlY3RlZCBQQVIgdG8gaW5jb21pbmcgbW9kZSdzIG1l
bWJlciAqLwotCWFkanVzdGVkX21vZGUtPnBpY3R1cmVfYXNwZWN0X3JhdGlvID0gY29ubl9zdGF0
ZS0+cGljdHVyZV9hc3BlY3RfcmF0aW87CisJaWYgKGNvbm5fc3RhdGUtPnBpY3R1cmVfYXNwZWN0
X3JhdGlvKQorCQlhZGp1c3RlZF9tb2RlLT5waWN0dXJlX2FzcGVjdF9yYXRpbyA9CisJCQljb25u
X3N0YXRlLT5waWN0dXJlX2FzcGVjdF9yYXRpbzsKIAogCXBpcGVfY29uZmlnLT5sYW5lX2NvdW50
ID0gNDsKIApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9z
ZHZvLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Nkdm8uYwppbmRleCBj
ZWRhMDNlNWEzZDQuLjVjYjYxOTYxMzE1NyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9zZHZvLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxh
eS9pbnRlbF9zZHZvLmMKQEAgLTEzMjEsOSArMTMyMSw5IEBAIHN0YXRpYyBpbnQgaW50ZWxfc2R2
b19jb21wdXRlX2NvbmZpZyhzdHJ1Y3QgaW50ZWxfZW5jb2RlciAqZW5jb2RlciwKIAlpZiAoSVNf
VFYoaW50ZWxfc2R2b19jb25uZWN0b3IpKQogCQlpOXh4X2FkanVzdF9zZHZvX3R2X2Nsb2NrKHBp
cGVfY29uZmlnKTsKIAotCS8qIFNldCB1c2VyIHNlbGVjdGVkIFBBUiB0byBpbmNvbWluZyBtb2Rl
J3MgbWVtYmVyICovCi0JaWYgKGludGVsX3Nkdm9fY29ubmVjdG9yLT5pc19oZG1pKQotCQlhZGp1
c3RlZF9tb2RlLT5waWN0dXJlX2FzcGVjdF9yYXRpbyA9IGNvbm5fc3RhdGUtPnBpY3R1cmVfYXNw
ZWN0X3JhdGlvOworCWlmIChjb25uX3N0YXRlLT5waWN0dXJlX2FzcGVjdF9yYXRpbykKKwkJYWRq
dXN0ZWRfbW9kZS0+cGljdHVyZV9hc3BlY3RfcmF0aW8gPQorCQkJY29ubl9zdGF0ZS0+cGljdHVy
ZV9hc3BlY3RfcmF0aW87CiAKIAlpZiAoIWludGVsX3Nkdm9fY29tcHV0ZV9hdmlfaW5mb2ZyYW1l
KGludGVsX3Nkdm8sCiAJCQkJCSAgICAgIHBpcGVfY29uZmlnLCBjb25uX3N0YXRlKSkgewotLSAK
Mi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
