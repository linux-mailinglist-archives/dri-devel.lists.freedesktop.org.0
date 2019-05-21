Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BEA24ED0
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2019 14:17:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0221089394;
	Tue, 21 May 2019 12:17:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EDEF89369;
 Tue, 21 May 2019 12:17:33 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 May 2019 05:17:33 -0700
X-ExtLoop1: 1
Received: from helsinki.fi.intel.com ([10.237.66.174])
 by fmsmga006.fm.intel.com with ESMTP; 21 May 2019 05:17:30 -0700
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v9 4/6] drm/i915/dp: Add a support of YCBCR 4:2:0 to DP MSA
Date: Tue, 21 May 2019 15:17:19 +0300
Message-Id: <20190521121721.32010-5-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190521121721.32010-1-gwan-gyeong.mun@intel.com>
References: <20190521121721.32010-1-gwan-gyeong.mun@intel.com>
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
Cc: dri-devel@lists.freedesktop.org, laurent.pinchart@ideasonboard.com
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
QmxvY2sgY29tbWVudCBzdHlsZSBmaXguCgp2NjoKICBGaXggYW4gd3Jvbmcgc2V0dGluZyBvZiBN
U0EgTUlTQzEgZmllbGRzIGZvciBQaXhlbCBFbmNvZGluZy9Db2xvcmltZXRyeQogIEZvcm1hdCBp
bmRpY2F0aW9uLiBBcyBwZXIgRFAgMS40YSBzcGVjIFRhYmxlIDItOTYgW01TQSBNSVNDMSBhbmQg
TUlTQzAKICBGaWVsZHMgZm9yIFBpeGVsIEVuY29kaW5nL0NvbG9yaW1ldHJ5IEZvcm1hdCBJbmRp
Y2F0aW9uXQogIFdoZW4gTUlTQzEsIGJpdCA2LCBpcyBTZXQgdG8gMSwgYSBTb3VyY2UgZGV2aWNl
IHVzZXMgYSBWU0MgU0RQIHRvCiAgaW5kaWNhdGUgdGhlIFBpeGVsIEVuY29kaW5nL0NvbG9yaW1l
dHJ5IEZvcm1hdC4gT24gdGhlIHdyb25nIHZlcnNpb24KICBpdCBzZXQgYSBiaXQgNSBvZiBNSVND
MSwgbm93IGl0IHNldCBhIGJpdCA2IG9mIE1JU0MxLgoKU2lnbmVkLW9mZi1ieTogR3dhbi1neWVv
bmcgTXVuIDxnd2FuLWd5ZW9uZy5tdW5AaW50ZWwuY29tPgpSZXZpZXdlZC1ieTogTWFhcnRlbiBM
YW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vaTkxNS9pOTE1X3JlZy5oICB8IDEgKwogZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50
ZWxfZGRpLmMgfCA4ICsrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfcmVnLmggYi9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9pOTE1X3JlZy5oCmluZGV4IGU5N2M0N2ZjYTY0NS4uMmFkOThlNjIwMzRmIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3JlZy5oCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2k5MTVfcmVnLmgKQEAgLTk1MjQsNiArOTUyNCw3IEBAIGVudW0gc2tsX3Bv
d2VyX2dhdGUgewogI2RlZmluZSAgVFJBTlNfTVNBXzEyX0JQQwkJKDMgPDwgNSkKICNkZWZpbmUg
IFRSQU5TX01TQV8xNl9CUEMJCSg0IDw8IDUpCiAjZGVmaW5lICBUUkFOU19NU0FfQ0VBX1JBTkdF
CQkoMSA8PCAzKQorI2RlZmluZSAgVFJBTlNfTVNBX1VTRV9WU0NfU0RQCQkoMSA8PCAxNCkKIAog
LyogTENQTEwgQ29udHJvbCAqLwogI2RlZmluZSBMQ1BMTF9DVEwJCQlfTU1JTygweDEzMDA0MCkK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX2RkaS5jIGIvZHJpdmVycy9n
cHUvZHJtL2k5MTUvaW50ZWxfZGRpLmMKaW5kZXggYjI5ZTYxYjc0OTYxLi4zZjI0N2YwOTFkNGMg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX2RkaS5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2ludGVsX2RkaS5jCkBAIC0xNzE3LDYgKzE3MTcsMTQgQEAgdm9pZCBp
bnRlbF9kZGlfc2V0X3BpcGVfc2V0dGluZ3MoY29uc3Qgc3RydWN0IGludGVsX2NydGNfc3RhdGUg
KmNydGNfc3RhdGUpCiAJICovCiAJaWYgKGNydGNfc3RhdGUtPm91dHB1dF9mb3JtYXQgPT0gSU5U
RUxfT1VUUFVUX0ZPUk1BVF9ZQ0JDUjQ0NCkKIAkJdGVtcCB8PSBUUkFOU19NU0FfU0FNUExJTkdf
NDQ0IHwgVFJBTlNfTVNBX0NMUlNQX1lDQkNSOworCS8qCisJICogQXMgcGVyIERQIDEuNGEgc3Bl
YyBzZWN0aW9uIDIuMi40LjMgW01TQSBGaWVsZCBmb3IgSW5kaWNhdGlvbgorCSAqIG9mIENvbG9y
IEVuY29kaW5nIEZvcm1hdCBhbmQgQ29udGVudCBDb2xvciBHYW11dF0gd2hpbGUgc2VuZGluZwor
CSAqIFlDQkNSIDQyMCBzaWduYWxzIHdlIHNob3VsZCBwcm9ncmFtIE1TQSBNSVNDMSBmaWVsZHMg
d2hpY2gKKwkgKiBpbmRpY2F0ZSBWU0MgU0RQIGZvciB0aGUgUGl4ZWwgRW5jb2RpbmcvQ29sb3Jp
bWV0cnkgRm9ybWF0LgorCSAqLworCWlmIChjcnRjX3N0YXRlLT5vdXRwdXRfZm9ybWF0ID09IElO
VEVMX09VVFBVVF9GT1JNQVRfWUNCQ1I0MjApCisJCXRlbXAgfD0gVFJBTlNfTVNBX1VTRV9WU0Nf
U0RQOwogCUk5MTVfV1JJVEUoVFJBTlNfTVNBX01JU0MoY3B1X3RyYW5zY29kZXIpLCB0ZW1wKTsK
IH0KIAotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
