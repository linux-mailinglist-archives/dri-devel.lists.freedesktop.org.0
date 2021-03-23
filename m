Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E01346401
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 16:58:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3F4D6EC2D;
	Tue, 23 Mar 2021 15:58:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (mblankhorst.nl [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71D2A6EC16
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 15:57:44 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v9 06/70] drm/i915: Add gem object locking to madvise.
Date: Tue, 23 Mar 2021 16:49:55 +0100
Message-Id: <20210323155059.628690-7-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210323155059.628690-1-maarten.lankhorst@linux.intel.com>
References: <20210323155059.628690-1-maarten.lankhorst@linux.intel.com>
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RG9lc24ndCBuZWVkIHRoZSBmdWxsIHd3IGxvY2ssIG9ubHkgY2hlY2tpbmcgaWYgcGFnZXMgYXJl
IGJvdW5kLgoKU2lnbmVkLW9mZi1ieTogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hv
cnN0QGxpbnV4LmludGVsLmNvbT4KUmV2aWV3ZWQtYnk6IFRob21hcyBIZWxsc3Ryw7ZtIDx0aG9t
YXMuaGVsbHN0cm9tQGxpbnV4LmludGVsLmNvbT4gI2lyYwotLS0KIGRyaXZlcnMvZ3B1L2RybS9p
OTE1L2k5MTVfZ2VtLmMgfCA4ICsrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkx
NV9nZW0uYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZ2VtLmMKaW5kZXggODA5MTU0Njdl
MGQ4Li4yNTQ0NGQzNjBmN2YgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVf
Z2VtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9nZW0uYwpAQCAtOTU1LDEwICs5
NTUsMTQgQEAgaTkxNV9nZW1fbWFkdmlzZV9pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2
b2lkICpkYXRhLAogCWlmICghb2JqKQogCQlyZXR1cm4gLUVOT0VOVDsKIAotCWVyciA9IG11dGV4
X2xvY2tfaW50ZXJydXB0aWJsZSgmb2JqLT5tbS5sb2NrKTsKKwllcnIgPSBpOTE1X2dlbV9vYmpl
Y3RfbG9ja19pbnRlcnJ1cHRpYmxlKG9iaiwgTlVMTCk7CiAJaWYgKGVycikKIAkJZ290byBvdXQ7
CiAKKwllcnIgPSBtdXRleF9sb2NrX2ludGVycnVwdGlibGUoJm9iai0+bW0ubG9jayk7CisJaWYg
KGVycikKKwkJZ290byBvdXRfd3c7CisKIAlpZiAoaTkxNV9nZW1fb2JqZWN0X2hhc19wYWdlcyhv
YmopICYmCiAJICAgIGk5MTVfZ2VtX29iamVjdF9pc190aWxlZChvYmopICYmCiAJICAgIGk5MTUt
PnF1aXJrcyAmIFFVSVJLX1BJTl9TV0laWkxFRF9QQUdFUykgewpAQCAtMTAwMyw2ICsxMDA3LDgg
QEAgaTkxNV9nZW1fbWFkdmlzZV9pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpk
YXRhLAogCWFyZ3MtPnJldGFpbmVkID0gb2JqLT5tbS5tYWR2ICE9IF9fSTkxNV9NQURWX1BVUkdF
RDsKIAltdXRleF91bmxvY2soJm9iai0+bW0ubG9jayk7CiAKK291dF93dzoKKwlpOTE1X2dlbV9v
YmplY3RfdW5sb2NrKG9iaik7CiBvdXQ6CiAJaTkxNV9nZW1fb2JqZWN0X3B1dChvYmopOwogCXJl
dHVybiBlcnI7Ci0tIAoyLjMxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
