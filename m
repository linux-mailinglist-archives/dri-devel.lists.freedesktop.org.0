Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C812E9F12
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 21:56:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66BB46E049;
	Mon,  4 Jan 2021 20:56:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59EEA6E049;
 Mon,  4 Jan 2021 20:56:11 +0000 (UTC)
IronPort-SDR: TnRSwma0Yk0mkcOcnKxYrfk8l+PoaxmvopwgKGWpCtpSnEk09rlRSxoi+EwbFIvz4LkvrE/a4C
 ZdEPe6Goxwow==
X-IronPort-AV: E=McAfee;i="6000,8403,9854"; a="177161461"
X-IronPort-AV: E=Sophos;i="5.78,474,1599548400"; d="scan'208";a="177161461"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2021 12:56:10 -0800
IronPort-SDR: 9rmja38grprULCg0FmskcIKeGRq/x9NOLIUU4tw7/oK9emRDluY9PAMJfEZb3oPNGa5toNY9dq
 69cGDTvEiI5A==
X-IronPort-AV: E=Sophos;i="5.78,474,1599548400"; d="scan'208";a="421501146"
Received: from yche108-mobl.amr.corp.intel.com (HELO josouza-mobl2.intel.com)
 ([10.251.138.25])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2021 12:56:07 -0800
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH CI 1/4] drm: Add function to convert rect in 16.16 fixed
 format to regular format
Date: Mon,  4 Jan 2021 12:56:51 -0800
Message-Id: <20210104205654.238928-1-jose.souza@intel.com>
X-Mailer: git-send-email 2.30.0
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
dGluZyB3aWR0aCBhbmQgaGVpZ2h0IGJlZm9yZSB0cnVuY2F0ZQotIGlubGluZWQKCnYxMDoKLSBy
ZW5hbWVkIHBhcmFtZXRlcnMgZnJvbSBzb3VyY2UgYW5kIGRlc3RpbmF0aW9uIHRvIHNyYyBhbmQg
ZHN0CnRvIG1hdGNoIHNpc3RlciBmdW5jdGlvbnMKCkNjOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxl
LnN5cmphbGFAbGludXguaW50ZWwuY29tPgpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpDYzogR3dhbi1neWVvbmcgTXVuIDxnd2FuLWd5ZW9uZy5tdW5AaW50ZWwuY29tPgpSZXZp
ZXdlZC1ieTogR3dhbi1neWVvbmcgTXVuIDxnd2FuLWd5ZW9uZy5tdW5AaW50ZWwuY29tPgpTaWdu
ZWQtb2ZmLWJ5OiBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXphQGludGVsLmNvbT4K
LS0tCiBpbmNsdWRlL2RybS9kcm1fcmVjdC5oIHwgMTMgKysrKysrKysrKysrKwogMSBmaWxlIGNo
YW5nZWQsIDEzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fcmVj
dC5oIGIvaW5jbHVkZS9kcm0vZHJtX3JlY3QuaAppbmRleCBlN2Y0ZDI0Y2RkMDAuLjM5ZjJkZWVl
NzA5YyAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vZHJtX3JlY3QuaAorKysgYi9pbmNsdWRlL2Ry
bS9kcm1fcmVjdC5oCkBAIC0yMDYsNiArMjA2LDE5IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBkcm1f
cmVjdF9lcXVhbHMoY29uc3Qgc3RydWN0IGRybV9yZWN0ICpyMSwKIAkJcjEtPnkxID09IHIyLT55
MSAmJiByMS0+eTIgPT0gcjItPnkyOwogfQogCisvKioKKyAqIGRybV9yZWN0X2ZwX3RvX2ludCAt
IENvbnZlcnQgYSByZWN0IGluIDE2LjE2IGZpeGVkIHBvaW50IGZvcm0gdG8gaW50IGZvcm0uCisg
KiBAZHN0OiByZWN0IHRvIGJlIHN0b3JlZCB0aGUgY29udmVydGVkIHZhbHVlCisgKiBAc3JjOiBy
ZWN0IGluIDE2LjE2IGZpeGVkIHBvaW50IGZvcm0KKyAqLworc3RhdGljIGlubGluZSB2b2lkIGRy
bV9yZWN0X2ZwX3RvX2ludChzdHJ1Y3QgZHJtX3JlY3QgKmRzdCwKKwkJCQkgICAgICBjb25zdCBz
dHJ1Y3QgZHJtX3JlY3QgKnNyYykKK3sKKwlkcm1fcmVjdF9pbml0KGRzdCwgc3JjLT54MSA+PiAx
Niwgc3JjLT55MSA+PiAxNiwKKwkJICAgICAgZHJtX3JlY3Rfd2lkdGgoc3JjKSA+PiAxNiwKKwkJ
ICAgICAgZHJtX3JlY3RfaGVpZ2h0KHNyYykgPj4gMTYpOworfQorCiBib29sIGRybV9yZWN0X2lu
dGVyc2VjdChzdHJ1Y3QgZHJtX3JlY3QgKnIsIGNvbnN0IHN0cnVjdCBkcm1fcmVjdCAqY2xpcCk7
CiBib29sIGRybV9yZWN0X2NsaXBfc2NhbGVkKHN0cnVjdCBkcm1fcmVjdCAqc3JjLCBzdHJ1Y3Qg
ZHJtX3JlY3QgKmRzdCwKIAkJCSAgY29uc3Qgc3RydWN0IGRybV9yZWN0ICpjbGlwKTsKLS0gCjIu
MzAuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
