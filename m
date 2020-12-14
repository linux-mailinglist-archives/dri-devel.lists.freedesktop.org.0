Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C2F2D9E17
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 18:49:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 546076E098;
	Mon, 14 Dec 2020 17:48:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BE1D6E092;
 Mon, 14 Dec 2020 17:48:57 +0000 (UTC)
IronPort-SDR: VwXBSR8fNTidE+GIndhFxOqSNWwSOUEm0ZKC6S8u2riLHmXghiQhJMG6iUaAJkIyuUxrMEHr/U
 eTTu3xfk7IRQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9834"; a="173977236"
X-IronPort-AV: E=Sophos;i="5.78,420,1599548400"; d="scan'208";a="173977236"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2020 09:48:56 -0800
IronPort-SDR: PwVfPCT1igT85493wpk3F3InW5vkugLJt0IPdDpfzy/cyPPJ+JMZRuntLh8fMwSkIu48gttyU1
 NZHnSD6fj2cA==
X-IronPort-AV: E=Sophos;i="5.78,420,1599548400"; d="scan'208";a="389088021"
Received: from mbenes1-mobl.amr.corp.intel.com (HELO josouza-mobl2.intel.com)
 ([10.254.42.53])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2020 09:48:55 -0800
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v6 1/5] drm: Add function to convert rect in 16.16 fixed
 format to regular format
Date: Mon, 14 Dec 2020 09:49:08 -0800
Message-Id: <20201214174912.174065-1-jose.souza@intel.com>
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
IGRvaW5nIHRoaXMKY29udmVyc2lvbi4KCkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCkNjOiBHd2FuLWd5ZW9uZyBNdW4gPGd3YW4tZ3llb25nLm11bkBpbnRlbC5jb20+ClNpZ25l
ZC1vZmYtYnk6IEpvc8OpIFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291emFAaW50ZWwuY29tPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fcmVjdC5jIHwgMTUgKysrKysrKysrKysrKysrCiBpbmNs
dWRlL2RybS9kcm1fcmVjdC5oICAgICB8ICAyICsrCiAyIGZpbGVzIGNoYW5nZWQsIDE3IGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3JlY3QuYyBiL2RyaXZl
cnMvZ3B1L2RybS9kcm1fcmVjdC5jCmluZGV4IDA0NjBlODc0ODk2ZS4uMjQzNDU3MDRiMzUzIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3JlY3QuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vZHJtX3JlY3QuYwpAQCAtMzczLDMgKzM3MywxOCBAQCB2b2lkIGRybV9yZWN0X3JvdGF0ZV9p
bnYoc3RydWN0IGRybV9yZWN0ICpyLAogCX0KIH0KIEVYUE9SVF9TWU1CT0woZHJtX3JlY3Rfcm90
YXRlX2ludik7CisKKy8qKgorICogZHJtX3JlY3RfY29udmVydF8xNl8xNl90b19yZWd1bGFyIC0g
Q29udmVydCBhIHJlY3QgaW4gMTYuMTYgZml4ZWQgcG9pbnQgZm9ybQorICogdG8gcmVndWxhciBm
b3JtLgorICogQGluOiByZWN0IGluIDE2LjE2IGZpeGVkIHBvaW50IGZvcm0KKyAqIEBvdXQ6IHJl
Y3QgdG8gYmUgc3RvcmVkIHRoZSBjb252ZXJ0ZWQgdmFsdWUKKyAqLwordm9pZCBkcm1fcmVjdF9j
b252ZXJ0XzE2XzE2X3RvX3JlZ3VsYXIoc3RydWN0IGRybV9yZWN0ICppbiwgc3RydWN0IGRybV9y
ZWN0ICpvdXQpCit7CisJb3V0LT54MSA9IGluLT54MSA+PiAxNjsKKwlvdXQtPnkxID0gaW4tPnkx
ID4+IDE2OworCW91dC0+eDIgPSBpbi0+eDIgPj4gMTY7CisJb3V0LT55MiA9IGluLT55MiA+PiAx
NjsKK30KK0VYUE9SVF9TWU1CT0woZHJtX3JlY3RfY29udmVydF8xNl8xNl90b19yZWd1bGFyKTsK
ZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9yZWN0LmggYi9pbmNsdWRlL2RybS9kcm1fcmVj
dC5oCmluZGV4IGU3ZjRkMjRjZGQwMC4uMmVmODE4MDQxNmNkIDEwMDY0NAotLS0gYS9pbmNsdWRl
L2RybS9kcm1fcmVjdC5oCisrKyBiL2luY2x1ZGUvZHJtL2RybV9yZWN0LmgKQEAgLTIyMyw1ICsy
MjMsNyBAQCB2b2lkIGRybV9yZWN0X3JvdGF0ZShzdHJ1Y3QgZHJtX3JlY3QgKnIsCiB2b2lkIGRy
bV9yZWN0X3JvdGF0ZV9pbnYoc3RydWN0IGRybV9yZWN0ICpyLAogCQkJIGludCB3aWR0aCwgaW50
IGhlaWdodCwKIAkJCSB1bnNpZ25lZCBpbnQgcm90YXRpb24pOwordm9pZCBkcm1fcmVjdF9jb252
ZXJ0XzE2XzE2X3RvX3JlZ3VsYXIoc3RydWN0IGRybV9yZWN0ICppbiwKKwkJCQkgICAgICAgc3Ry
dWN0IGRybV9yZWN0ICpvdXQpOwogCiAjZW5kaWYKLS0gCjIuMjkuMgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
