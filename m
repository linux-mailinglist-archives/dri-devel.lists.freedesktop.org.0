Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC910184C53
	for <lists+dri-devel@lfdr.de>; Fri, 13 Mar 2020 17:21:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AE186EC1B;
	Fri, 13 Mar 2020 16:21:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 580C86EC1A;
 Fri, 13 Mar 2020 16:21:24 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Mar 2020 09:21:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,549,1574150400"; d="scan'208";a="235368189"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga007.fm.intel.com with SMTP; 13 Mar 2020 09:21:22 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 13 Mar 2020 18:21:21 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 8/9] drm/edid: Clarify validate_displayid()
Date: Fri, 13 Mar 2020 18:20:53 +0200
Message-Id: <20200313162054.16009-9-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200313162054.16009-1-ville.syrjala@linux.intel.com>
References: <20200313162054.16009-1-ville.syrjala@linux.intel.com>
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClRo
cm93IG91dCB0aGUgbWFnaWMgJzUnIGZyb20gdmFsaWRhdGVfZGlzcGxheWlkKCkgYW5kIHJlcGxh
Y2Ugd2l0aAp0aGUgYWN0dWFsIHRoaW5nIHdlIG1lYW4gc2l6ZW9mKGhlYWRlcikrY2hlY2tzdW0u
IEFsc28gcmV3cml0ZSB0aGUKY2hlY2tzdW0gbG9vcCB0byBiZSBsZXNzIGhhcmQgdG8gcGFyc2Ug
Zm9yIG1lcmUgbW9ydGFscy4KClNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUu
c3lyamFsYUBsaW51eC5pbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMg
fCAxMyArKysrKysrKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA1IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jIGIvZHJp
dmVycy9ncHUvZHJtL2RybV9lZGlkLmMKaW5kZXggZjFiYTA2Mzk2YzBhLi4xODUwMjdmNzUxZjYg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9kcm1fZWRpZC5jCkBAIC01MDk4LDcgKzUwOTgsNyBAQCB1MzIgZHJtX2FkZF9kaXNwbGF5
X2luZm8oc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvciwgY29uc3Qgc3RydWN0IGVkaWQg
KmVkaQogCiBzdGF0aWMgaW50IHZhbGlkYXRlX2Rpc3BsYXlpZCh1OCAqZGlzcGxheWlkLCBpbnQg
bGVuZ3RoLCBpbnQgaWR4KQogewotCWludCBpOworCWludCBpLCBkaXNwaWRfbGVuZ3RoOwogCXU4
IGNzdW0gPSAwOwogCXN0cnVjdCBkaXNwbGF5aWRfaGRyICpiYXNlOwogCkBAIC01MTA3LDE1ICs1
MTA3LDE4IEBAIHN0YXRpYyBpbnQgdmFsaWRhdGVfZGlzcGxheWlkKHU4ICpkaXNwbGF5aWQsIGlu
dCBsZW5ndGgsIGludCBpZHgpCiAJRFJNX0RFQlVHX0tNUygiYmFzZSByZXZpc2lvbiAweCV4LCBs
ZW5ndGggJWQsICVkICVkXG4iLAogCQkgICAgICBiYXNlLT5yZXYsIGJhc2UtPmJ5dGVzLCBiYXNl
LT5wcm9kX2lkLCBiYXNlLT5leHRfY291bnQpOwogCi0JaWYgKGJhc2UtPmJ5dGVzICsgNSA+IGxl
bmd0aCAtIGlkeCkKKwkvKiArMSBmb3IgRGlzcElEIGNoZWNrc3VtICovCisJZGlzcGlkX2xlbmd0
aCA9IHNpemVvZigqYmFzZSkgKyBiYXNlLT5ieXRlcyArIDE7CisJaWYgKGRpc3BpZF9sZW5ndGgg
PiBsZW5ndGggLSBpZHgpCiAJCXJldHVybiAtRUlOVkFMOwotCWZvciAoaSA9IGlkeDsgaSA8PSBi
YXNlLT5ieXRlcyArIDU7IGkrKykgewotCQljc3VtICs9IGRpc3BsYXlpZFtpXTsKLQl9CisKKwlm
b3IgKGkgPSAwOyBpIDwgZGlzcGlkX2xlbmd0aDsgaSsrKQorCQljc3VtICs9IGRpc3BsYXlpZFtp
ZHggKyBpXTsKIAlpZiAoY3N1bSkgewogCQlEUk1fTk9URSgiRGlzcGxheUlEIGNoZWNrc3VtIGlu
dmFsaWQsIHJlbWFpbmRlciBpcyAlZFxuIiwgY3N1bSk7CiAJCXJldHVybiAtRUlOVkFMOwogCX0K
KwogCXJldHVybiAwOwogfQogCi0tIAoyLjI0LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
