Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 409782DC5AC
	for <lists+dri-devel@lfdr.de>; Wed, 16 Dec 2020 18:48:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFD3C8999C;
	Wed, 16 Dec 2020 17:48:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A39AC899A5;
 Wed, 16 Dec 2020 17:48:42 +0000 (UTC)
IronPort-SDR: C6Rfv+nf+mPzK8T8HK5u9qfR7TiMjcNIj0zT0L8hyrrFMeE7GoIplSmGDSxj10Z4Ngs++iM9pP
 oTc8Gmal3ulQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9837"; a="162156861"
X-IronPort-AV: E=Sophos;i="5.78,424,1599548400"; d="scan'208";a="162156861"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2020 09:48:41 -0800
IronPort-SDR: hg0GJDdautp7JN/gJ7dWnSVqnoEQa0Qtl+e8Rlri80w+pIE8KANnmwVreWdqhItGzHI/dcSQvv
 4YuZJ/lx1IlA==
X-IronPort-AV: E=Sophos;i="5.78,424,1599548400"; d="scan'208";a="488613657"
Received: from mhlabrec-mobl1.amr.corp.intel.com (HELO
 josouza-mobl2.intel.com) ([10.255.69.154])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2020 09:48:39 -0800
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v7 1/5] drm: Add function to convert rect in 16.16 fixed
 format to regular format
Date: Wed, 16 Dec 2020 09:48:56 -0800
Message-Id: <20201216174900.185178-1-jose.souza@intel.com>
X-Mailer: git-send-email 2.29.2
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
Cc: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 dri-devel@lists.freedesktop.org, Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TXVjaCBtb3JlIGNsZWFyIHRvIHJlYWQgb25lIGZ1bmN0aW9uIGNhbGwgdGhhbiBmb3VyIGxpbmVz
IGRvaW5nIHRoaXMKY29udmVyc2lvbi4KCnY3OgotIGZ1bmN0aW9uIHJlbmFtZWQKLSBjYWxjdWxh
dGluZyB3aWR0aCBhbmQgaGVpZ2h0IGJlZm9yZSB0cnVuY2F0ZQotIGlubGluZWQKCkNjOiBWaWxs
ZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgpDYzogZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogR3dhbi1neWVvbmcgTXVuIDxnd2FuLWd5ZW9uZy5t
dW5AaW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIDxqb3Nl
LnNvdXphQGludGVsLmNvbT4KLS0tCiBpbmNsdWRlL2RybS9kcm1fcmVjdC5oIHwgMTMgKysrKysr
KysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9p
bmNsdWRlL2RybS9kcm1fcmVjdC5oIGIvaW5jbHVkZS9kcm0vZHJtX3JlY3QuaAppbmRleCBlN2Y0
ZDI0Y2RkMDAuLjdlYjg0YWY0YTgxOCAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vZHJtX3JlY3Qu
aAorKysgYi9pbmNsdWRlL2RybS9kcm1fcmVjdC5oCkBAIC0yMDYsNiArMjA2LDE5IEBAIHN0YXRp
YyBpbmxpbmUgYm9vbCBkcm1fcmVjdF9lcXVhbHMoY29uc3Qgc3RydWN0IGRybV9yZWN0ICpyMSwK
IAkJcjEtPnkxID09IHIyLT55MSAmJiByMS0+eTIgPT0gcjItPnkyOwogfQogCisvKioKKyAqIGRy
bV9yZWN0X2ZwX3RvX2ludCAtIENvbnZlcnQgYSByZWN0IGluIDE2LjE2IGZpeGVkIHBvaW50IGZv
cm0gdG8gaW50IGZvcm0uCisgKiBAZGVzdGluYXRpb246IHJlY3QgdG8gYmUgc3RvcmVkIHRoZSBj
b252ZXJ0ZWQgdmFsdWUKKyAqIEBzb3VyY2U6IHJlY3QgaW4gMTYuMTYgZml4ZWQgcG9pbnQgZm9y
bQorICovCitzdGF0aWMgaW5saW5lIHZvaWQgZHJtX3JlY3RfZnBfdG9faW50KHN0cnVjdCBkcm1f
cmVjdCAqZGVzdGluYXRpb24sCisJCQkJICAgICAgY29uc3Qgc3RydWN0IGRybV9yZWN0ICpzb3Vy
Y2UpCit7CisJZHJtX3JlY3RfaW5pdChkZXN0aW5hdGlvbiwgc291cmNlLT54MSA+PiAxNiwgc291
cmNlLT55MSA+PiAxNiwKKwkJICAgICAgZHJtX3JlY3Rfd2lkdGgoc291cmNlKSA+PiAxNiwKKwkJ
ICAgICAgZHJtX3JlY3RfaGVpZ2h0KHNvdXJjZSkgPj4gMTYpOworfQorCiBib29sIGRybV9yZWN0
X2ludGVyc2VjdChzdHJ1Y3QgZHJtX3JlY3QgKnIsIGNvbnN0IHN0cnVjdCBkcm1fcmVjdCAqY2xp
cCk7CiBib29sIGRybV9yZWN0X2NsaXBfc2NhbGVkKHN0cnVjdCBkcm1fcmVjdCAqc3JjLCBzdHJ1
Y3QgZHJtX3JlY3QgKmRzdCwKIAkJCSAgY29uc3Qgc3RydWN0IGRybV9yZWN0ICpjbGlwKTsKLS0g
CjIuMjkuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
