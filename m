Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 171AE17382
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2019 10:18:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAC9D896FA;
	Wed,  8 May 2019 08:18:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BAC1896F7;
 Wed,  8 May 2019 08:18:07 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 May 2019 01:18:07 -0700
X-ExtLoop1: 1
Received: from helsinki.fi.intel.com ([10.237.66.174])
 by fmsmga001.fm.intel.com with ESMTP; 08 May 2019 01:18:05 -0700
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v6 4/6] drm/i915/dp: Add a support of YCBCR 4:2:0 to DP MSA
Date: Wed,  8 May 2019 11:17:55 +0300
Message-Id: <20190508081757.28042-5-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190508081757.28042-1-gwan-gyeong.mun@intel.com>
References: <20190508081757.28042-1-gwan-gyeong.mun@intel.com>
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

V2hlbiBZQ0JDUiA0OjI6MCBvdXRwdXRzIGlzIHVzZWQgZm9yIERQLCB3ZSBzaG91bGQgcHJvZ3Jh
bSBZQ0JDUiA0OjI6MCB0bwpNU0EgYW5kIFZTQyBTRFAuCgpBcyBwZXIgRFAgMS40YSBzcGVjIHNl
Y3Rpb24gMi4yLjQuMyBbTVNBIEZpZWxkIGZvciBJbmRpY2F0aW9uIG9mIENvbG9yCkVuY29kaW5n
IEZvcm1hdCBhbmQgQ29udGVudCBDb2xvciBHYW11dF0gd2hpbGUgc2VuZGluZyBZQ0JDUiA0MjAg
c2lnbmFscwp3ZSBzaG91bGQgcHJvZ3JhbSBNU0EgTUlTQzEgZmllbGRzIHdoaWNoIGluZGljYXRl
IFZTQyBTRFAgZm9yIHRoZSBQaXhlbApFbmNvZGluZy9Db2xvcmltZXRyeSBGb3JtYXQuCgp2Mjog
QmxvY2sgY29tbWVudCBzdHlsZSBmaXguCnY2OgogIEZpeCBhbiB3cm9uZyBzZXR0aW5nIG9mIE1T
QSBNSVNDMSBmaWVsZHMgZm9yIFBpeGVsIEVuY29kaW5nL0NvbG9yaW1ldHJ5CiAgRm9ybWF0IGlu
ZGljYXRpb24uIEFzIHBlciBEUCAxLjRhIHNwZWMgVGFibGUgMi05NiBbTVNBIE1JU0MxIGFuZCBN
SVNDMAogIEZpZWxkcyBmb3IgUGl4ZWwgRW5jb2RpbmcvQ29sb3JpbWV0cnkgRm9ybWF0IEluZGlj
YXRpb25dCiAgV2hlbiBNSVNDMSwgYml0IDYsIGlzIFNldCB0byAxLCBhIFNvdXJjZSBkZXZpY2Ug
dXNlcyBhIFZTQyBTRFAgdG8KICBpbmRpY2F0ZSB0aGUgUGl4ZWwgRW5jb2RpbmcvQ29sb3JpbWV0
cnkgRm9ybWF0LiBPbiB0aGUgd3JvbmcgdmVyc2lvbgogIGl0IHNldCBhIGJpdCA1IG9mIE1JU0Mx
LCBub3cgaXQgc2V0IGEgYml0IDYgb2YgTUlTQzEuCgpTaWduZWQtb2ZmLWJ5OiBHd2FuLWd5ZW9u
ZyBNdW4gPGd3YW4tZ3llb25nLm11bkBpbnRlbC5jb20+ClJldmlld2VkLWJ5OiBNYWFydGVuIExh
bmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9pOTE1L2k5MTVfcmVnLmggIHwgMSArCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRl
bF9kZGkuYyB8IDggKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9yZWcuaCBiL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2k5MTVfcmVnLmgKaW5kZXggZTk3YzQ3ZmNhNjQ1Li4yYWQ5OGU2MjAzNGYgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfcmVnLmgKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2k5MTUvaTkxNV9yZWcuaApAQCAtOTUyNCw2ICs5NTI0LDcgQEAgZW51bSBza2xfcG93
ZXJfZ2F0ZSB7CiAjZGVmaW5lICBUUkFOU19NU0FfMTJfQlBDCQkoMyA8PCA1KQogI2RlZmluZSAg
VFJBTlNfTVNBXzE2X0JQQwkJKDQgPDwgNSkKICNkZWZpbmUgIFRSQU5TX01TQV9DRUFfUkFOR0UJ
CSgxIDw8IDMpCisjZGVmaW5lICBUUkFOU19NU0FfVVNFX1ZTQ19TRFAJCSgxIDw8IDE0KQogCiAv
KiBMQ1BMTCBDb250cm9sICovCiAjZGVmaW5lIExDUExMX0NUTAkJCV9NTUlPKDB4MTMwMDQwKQpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfZGRpLmMgYi9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9pbnRlbF9kZGkuYwppbmRleCAyZjE2ODhlYTVhMmMuLjQ0NDFjNWJhNzFmYiAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfZGRpLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvaW50ZWxfZGRpLmMKQEAgLTE3MTcsNiArMTcxNywxNCBAQCB2b2lkIGlu
dGVsX2RkaV9zZXRfcGlwZV9zZXR0aW5ncyhjb25zdCBzdHJ1Y3QgaW50ZWxfY3J0Y19zdGF0ZSAq
Y3J0Y19zdGF0ZSkKIAkgKi8KIAlpZiAoY3J0Y19zdGF0ZS0+b3V0cHV0X2Zvcm1hdCA9PSBJTlRF
TF9PVVRQVVRfRk9STUFUX1lDQkNSNDQ0KQogCQl0ZW1wIHw9IFRSQU5TX01TQV9TQU1QTElOR180
NDQgfCBUUkFOU19NU0FfQ0xSU1BfWUNCQ1I7CisJLyoKKwkgKiBBcyBwZXIgRFAgMS40YSBzcGVj
IHNlY3Rpb24gMi4yLjQuMyBbTVNBIEZpZWxkIGZvciBJbmRpY2F0aW9uCisJICogb2YgQ29sb3Ig
RW5jb2RpbmcgRm9ybWF0IGFuZCBDb250ZW50IENvbG9yIEdhbXV0XSB3aGlsZSBzZW5kaW5nCisJ
ICogWUNCQ1IgNDIwIHNpZ25hbHMgd2Ugc2hvdWxkIHByb2dyYW0gTVNBIE1JU0MxIGZpZWxkcyB3
aGljaAorCSAqIGluZGljYXRlIFZTQyBTRFAgZm9yIHRoZSBQaXhlbCBFbmNvZGluZy9Db2xvcmlt
ZXRyeSBGb3JtYXQuCisJICovCisJaWYgKGNydGNfc3RhdGUtPm91dHB1dF9mb3JtYXQgPT0gSU5U
RUxfT1VUUFVUX0ZPUk1BVF9ZQ0JDUjQyMCkKKwkJdGVtcCB8PSBUUkFOU19NU0FfVVNFX1ZTQ19T
RFA7CiAJSTkxNV9XUklURShUUkFOU19NU0FfTUlTQyhjcHVfdHJhbnNjb2RlciksIHRlbXApOwog
fQogCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
