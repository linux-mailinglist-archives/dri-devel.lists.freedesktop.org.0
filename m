Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 244196D05B
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2019 16:51:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BB1A6E3E9;
	Thu, 18 Jul 2019 14:51:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69DEB6E3EB;
 Thu, 18 Jul 2019 14:51:02 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Jul 2019 07:51:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,278,1559545200"; d="scan'208";a="187802137"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga001.fm.intel.com with SMTP; 18 Jul 2019 07:50:59 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 18 Jul 2019 17:50:59 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 02/12] drm/i915: Fix HSW+ DP MSA YCbCr colorspace indication
Date: Thu, 18 Jul 2019 17:50:43 +0300
Message-Id: <20190718145053.25808-3-ville.syrjala@linux.intel.com>
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkxv
b2tzIGxpa2Ugd2UncmUgY3VycmVudGx5IHNldHRpbmcgdGhlIE1TQSB0byB4dllDQyBCVC43MDkg
aW5zdGVhZApvZiB0aGUgWUNiQ3IgQlQuNjAxIGNsYWltZWQgYnkgdGhlIGNvbW1lbnQuIEJ1dCBl
dmVuIHRoYXQgY29tbWVudAppcyB3cm9uZyBzaW5jZSB3ZSBjb25maWd1cmUgdGhlIENTQyBtYXRy
aXggdG8gQlQuNzA5LgoKTGV0J3MgcmVtb3ZlIHRoZSBib2d1cyBzdGF0ZW1lbnQgZnJvbSB0aGUg
Y29tbWVudCBhbmQgZml4IHRoZQpNU0EgdG8gaW5kaWNhdGUgWUNiQ3IgQlQuNzA5IHNvIHRoYXQg
aXQgbWF0Y2hlcyB0aGUgYWN0dWFsCnBpeGVsIGRhdGEgd2UncmUgdHJhbnNtaXR0aW5nLgoKU2ln
bmVkLW9mZi1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNv
bT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RkaS5jIHwgNiArKysr
LS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfcmVnLmggICAgICAgICAgfCAzICsrLQogMiBm
aWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kZGkuYyBiL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGRpLmMKaW5kZXggMThiYzBmMjY5MGM5Li4xNTdjNTg1
MWE2ODggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGRp
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kZGkuYwpAQCAtMTcz
MCwxMCArMTczMCwxMiBAQCB2b2lkIGludGVsX2RkaV9zZXRfcGlwZV9zZXR0aW5ncyhjb25zdCBz
dHJ1Y3QgaW50ZWxfY3J0Y19zdGF0ZSAqY3J0Y19zdGF0ZSkKIAkvKgogCSAqIEFzIHBlciBEUCAx
LjIgc3BlYyBzZWN0aW9uIDIuMy40LjMgd2hpbGUgc2VuZGluZwogCSAqIFlDQkNSIDQ0NCBzaWdu
YWxzIHdlIHNob3VsZCBwcm9ncmFtIE1TQSBNSVNDMS8wIGZpZWxkcyB3aXRoCi0JICogY29sb3Jz
cGFjZSBpbmZvcm1hdGlvbi4gVGhlIG91dHB1dCBjb2xvcnNwYWNlIGVuY29kaW5nIGlzIEJUNjAx
LgorCSAqIGNvbG9yc3BhY2UgaW5mb3JtYXRpb24uCiAJICovCiAJaWYgKGNydGNfc3RhdGUtPm91
dHB1dF9mb3JtYXQgPT0gSU5URUxfT1VUUFVUX0ZPUk1BVF9ZQ0JDUjQ0NCkKLQkJdGVtcCB8PSBU
UkFOU19NU0FfU0FNUExJTkdfNDQ0IHwgVFJBTlNfTVNBX0NMUlNQX1lDQkNSOworCQl0ZW1wIHw9
IFRSQU5TX01TQV9TQU1QTElOR180NDQgfCBUUkFOU19NU0FfQ0xSU1BfWUNCQ1IgfAorCQkJVFJB
TlNfTVNBX1lDQkNSX0JUNzA5OworCiAJLyoKIAkgKiBBcyBwZXIgRFAgMS40YSBzcGVjIHNlY3Rp
b24gMi4yLjQuMyBbTVNBIEZpZWxkIGZvciBJbmRpY2F0aW9uCiAJICogb2YgQ29sb3IgRW5jb2Rp
bmcgRm9ybWF0IGFuZCBDb250ZW50IENvbG9yIEdhbXV0XSB3aGlsZSBzZW5kaW5nCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3JlZy5oIGIvZHJpdmVycy9ncHUvZHJtL2k5
MTUvaTkxNV9yZWcuaAppbmRleCBmZGQ5YmMwMWU2OTQuLjM1MTMzYjJlZjZjOSAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9yZWcuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9pOTE1X3JlZy5oCkBAIC05NjA1LDcgKzk2MDUsOCBAQCBlbnVtIHNrbF9wb3dlcl9nYXRl
IHsKIAogI2RlZmluZSAgVFJBTlNfTVNBX1NZTkNfQ0xLCQkoMSA8PCAwKQogI2RlZmluZSAgVFJB
TlNfTVNBX1NBTVBMSU5HXzQ0NAkJKDIgPDwgMSkKLSNkZWZpbmUgIFRSQU5TX01TQV9DTFJTUF9Z
Q0JDUgkJKDIgPDwgMykKKyNkZWZpbmUgIFRSQU5TX01TQV9DTFJTUF9ZQ0JDUgkJKDEgPDwgMykK
KyNkZWZpbmUgIFRSQU5TX01TQV9ZQ0JDUl9CVDcwOQkJKDEgPDwgNCkKICNkZWZpbmUgIFRSQU5T
X01TQV82X0JQQwkJKDAgPDwgNSkKICNkZWZpbmUgIFRSQU5TX01TQV84X0JQQwkJKDEgPDwgNSkK
ICNkZWZpbmUgIFRSQU5TX01TQV8xMF9CUEMJCSgyIDw8IDUpCi0tIAoyLjIxLjAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
