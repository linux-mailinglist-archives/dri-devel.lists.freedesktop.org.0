Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C80DCFE5DC
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2019 20:42:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70E336EA75;
	Fri, 15 Nov 2019 19:42:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 922796E7D3;
 Fri, 15 Nov 2019 19:42:26 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Nov 2019 11:42:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,309,1569308400"; d="scan'208";a="257849847"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by FMSMGA003.fm.intel.com with SMTP; 15 Nov 2019 11:42:24 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 15 Nov 2019 21:42:23 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 6/7] drm/atomic: Fix the early return in
 drm_atomic_set_mode_for_crtc()
Date: Fri, 15 Nov 2019 21:42:03 +0200
Message-Id: <20191115194204.22244-7-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191115194204.22244-1-ville.syrjala@linux.intel.com>
References: <20191115194204.22244-1-ville.syrjala@linux.intel.com>
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClRo
ZSBlYXJseSByZXR1cm4gaW4gZHJtX2F0b21pY19zZXRfbW9kZV9mb3JfY3J0YygpIGlzbid0IHF1
aXRlCnJpZ2h0LiBJdCB3b3VsZCBtaXN0YWtlbmx5IHJldHVybiBhbmQgZmFpbCB0byB1cGRhdGUK
Y3J0Y19zdGF0ZS0+ZW5hYmxlIGlmIHNvbWVvbmUgYWN0dWFsbHkgdHJpZWQgdG8gc2V0IGEgemVy
b2VkCm1vZGUgb24gYSBjdXJyZW50bHkgZGlzYWJsZWQgY3J0Yy4gVGhhdCBzaG91bGQgbmV2ZXIg
YWN0dWFsbHkKaGFwcGVuIGluIHJlc3BvbnNlIHRvIGFueSB1c2Vyc3BhY2UgcmVxdWVzdCBhcyB0
aGUgemVyb2VkIG1vZGUKd291bGQgZ2V0IHJlamVjdGVkIGVhcmxpZXIuIEhvd2V2ZXIgdGhlcmUg
aXMgc29tZSBjaGFuY2Ugb2YgdGhpcwpoYXBwZW5pbmcgaW50ZXJuYWxseSAoZWcuIGR1cmluZyBo
dyBzdGF0ZSByZWFkb3V0KSBzbyBpdCBzZWVtcwpiZXN0IHRvIG5vdCBsZXQgdGhlIHN0YXRlIGJl
Y29tZSB0b3RhbGx5IGluY29uc2lzdGVudC4KCkFkZGl0aW9uYWxseSB0aGUgZWFybHkgcmV0dXJu
IHdpbGwgbm90IGJlIHRha2VuIGlmIHdlJ3JlIHRyeWluZyB0bwpkaXNhYmxlIGFuIGFscmVhZHkg
ZGlzYWJsZWQgY3J0Yy4gV2hpbGUgdGhhdCBpcyBub3QgYWN0dWFsbHkKaGFybWZ1bCBpdCBpcyBp
bmNvbnNpc3RlbnQsIHNvIGxldCdzIGhhbmRsZSB0aGF0IGNhc2UgYXMgd2VsbC4KClRlc3RjYXNl
OiBpZ3Qva21zX3NlbGZ0ZXN0L2NoZWNrX2F0b21pY19zZXRfbW9kZV9mb3JfY3J0YwpUZXN0Y2Fz
ZTogaWd0L2ttc19zZWxmdGVzdC9jaGVja19hdG9taWNfc2V0X3plcm9lZF9tb2RlX2ZvcnRfY3J0
YwpSZXZpZXdlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpTaWduZWQtb2Zm
LWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljX3VhcGkuYyB8IDkgKysrKysrKy0tCiAxIGZpbGUg
Y2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljX3VhcGkuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fYXRv
bWljX3VhcGkuYwppbmRleCAwZDQ2NmQzYjA4MDkuLmEzYTZhODEzN2FmNCAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWNfdWFwaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9k
cm1fYXRvbWljX3VhcGkuYwpAQCAtNjgsOCArNjgsMTMgQEAgaW50IGRybV9hdG9taWNfc2V0X21v
ZGVfZm9yX2NydGMoc3RydWN0IGRybV9jcnRjX3N0YXRlICpzdGF0ZSwKIAlzdHJ1Y3QgZHJtX21v
ZGVfbW9kZWluZm8gdW1vZGU7CiAKIAkvKiBFYXJseSByZXR1cm4gZm9yIG5vIGNoYW5nZS4gKi8K
LQlpZiAobW9kZSAmJiBtZW1jbXAoJnN0YXRlLT5tb2RlLCBtb2RlLCBzaXplb2YoKm1vZGUpKSA9
PSAwKQotCQlyZXR1cm4gMDsKKwlpZiAoc3RhdGUtPmVuYWJsZSkgeworCQlpZiAobW9kZSAmJiBt
ZW1jbXAoJnN0YXRlLT5tb2RlLCBtb2RlLCBzaXplb2YoKm1vZGUpKSA9PSAwKQorCQkJcmV0dXJu
IDA7CisJfSBlbHNlIHsKKwkJaWYgKCFtb2RlKQorCQkJcmV0dXJuIDA7CisJfQogCiAJZHJtX3By
b3BlcnR5X2Jsb2JfcHV0KHN0YXRlLT5tb2RlX2Jsb2IpOwogCXN0YXRlLT5tb2RlX2Jsb2IgPSBO
VUxMOwotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
