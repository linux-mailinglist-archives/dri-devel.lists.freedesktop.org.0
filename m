Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4F0119D8B
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 23:39:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D94976E9CF;
	Tue, 10 Dec 2019 22:39:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB00A6E9CD;
 Tue, 10 Dec 2019 22:39:02 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Dec 2019 14:31:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,301,1571727600"; d="scan'208";a="238326505"
Received: from labuser-z97x-ud5h.jf.intel.com ([10.54.75.49])
 by fmsmga004.fm.intel.com with ESMTP; 10 Dec 2019 14:31:30 -0800
From: Manasi Navare <manasi.d.navare@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 5/5] drm/i915/dp: Disable Port sync mode correctly on teardown
Date: Tue, 10 Dec 2019 14:32:38 -0800
Message-Id: <20191210223238.12022-6-manasi.d.navare@intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20191210223238.12022-1-manasi.d.navare@intel.com>
References: <20191210223238.12022-1-manasi.d.navare@intel.com>
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
Cc: Manasi Navare <manasi.d.navare@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hpbGUgY2xlYXJpbmcgdGhlIFBvcnRzIHluYyBtb2RlIGVuYWJsZSBhbmQgbWFzdGVyIHNlbGVj
dCBiaXRzCndlIG5lZWQgdG8gbWFrZSBzdXJlIHRoYXQgd2UgcGVyZm9ybSBhIFJNVyBmb3IgZGlz
YWJsZSBlbHNlCml0IHNldHMgdGhlIG90aGVyIGJpdHMgY2FzdWluZyB1bndhbnRlZCBzaWRlZWZm
ZWN0cy4KCkJ1Z3ppbGxhOiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL2ludGVs
L2lzc3Vlcy81CkNjOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwu
Y29tPgpDYzogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVsLmNvbT4KRml4ZXM6IDUxNTI4
YWZlN2M1ZSAoImRybS9pOTE1L2Rpc3BsYXkvaWNsOiBEaXNhYmxlIHRyYW5zY29kZXIgcG9ydCBz
eW5jIGFzIHBhcnQgb2YgY3J0Y19kaXNhYmxlKCkgc2VxdWVuY2UiKQpTaWduZWQtb2ZmLWJ5OiBN
YW5hc2kgTmF2YXJlIDxtYW5hc2kuZC5uYXZhcmVAaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5jIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXkuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5jCmluZGV4IGMwYTJkYWIzZmU2Ny4uM2ZjY2RhMGYxZjM2
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXku
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXkuYwpAQCAt
NDU5OSw3ICs0NTk5LDggQEAgc3RhdGljIHZvaWQgaWNsX2Rpc2FibGVfdHJhbnNjb2Rlcl9wb3J0
X3N5bmMoY29uc3Qgc3RydWN0IGludGVsX2NydGNfc3RhdGUgKm9sZF8KIAkJICAgICAgdHJhbnNj
b2Rlcl9uYW1lKG9sZF9jcnRjX3N0YXRlLT5jcHVfdHJhbnNjb2RlcikpOwogCiAJcmVnID0gVFJB
TlNfRERJX0ZVTkNfQ1RMMihvbGRfY3J0Y19zdGF0ZS0+Y3B1X3RyYW5zY29kZXIpOwotCXRyYW5z
X2RkaV9mdW5jX2N0bDJfdmFsID0gfihQT1JUX1NZTkNfTU9ERV9FTkFCTEUgfAorCXRyYW5zX2Rk
aV9mdW5jX2N0bDJfdmFsID0gSTkxNV9SRUFEKHJlZyk7CisJdHJhbnNfZGRpX2Z1bmNfY3RsMl92
YWwgJj0gfihQT1JUX1NZTkNfTU9ERV9FTkFCTEUgfAogCQkJCSAgICBQT1JUX1NZTkNfTU9ERV9N
QVNURVJfU0VMRUNUX01BU0spOwogCUk5MTVfV1JJVEUocmVnLCB0cmFuc19kZGlfZnVuY19jdGwy
X3ZhbCk7CiB9Ci0tIAoyLjE5LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
