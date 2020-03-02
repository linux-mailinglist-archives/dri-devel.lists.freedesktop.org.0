Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D5C176504
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 21:35:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23AC66E823;
	Mon,  2 Mar 2020 20:35:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFF756E823
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 20:35:15 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Mar 2020 12:35:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,508,1574150400"; d="scan'208";a="228598477"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga007.jf.intel.com with SMTP; 02 Mar 2020 12:35:13 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 02 Mar 2020 22:35:12 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 06/33] drm/panel-lg-lg4573: Fix dotclock
Date: Mon,  2 Mar 2020 22:34:25 +0200
Message-Id: <20200302203452.17977-7-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200302203452.17977-1-ville.syrjala@linux.intel.com>
References: <20200302203452.17977-1-ville.syrjala@linux.intel.com>
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
Cc: Thierry Reding <treding@nvidia.com>, Heiko Schocher <hs@denx.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClRo
ZSBjdXJyZW50bHkgbGlzdGVkIGRvdGNsb2NrIGRpc2FncmVlcyB3aXRoIHRoZSBjdXJyZW50bHkK
bGlzdGVkIHZyZWZyZXNoIHJhdGUuIENoYW5nZSB0aGUgZG90Y2xvY2sgdG8gbWF0Y2ggdGhlIHZy
ZWZyZXNoLgoKU29tZW9uZSB0ZWxsIG1lIHdoaWNoIChpZiBlaXRoZXIpIG9mIHRoZSBkb3RjbG9j
ayBvciB2cmVyZXNoIGlzCmNvcnJlY3Q/CgpDYzogSGVpa28gU2Nob2NoZXIgPGhzQGRlbnguZGU+
CkNjOiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgpTaWduZWQtb2ZmLWJ5OiBW
aWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1sZy1sZzQ1NzMuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9wYW5lbC9wYW5lbC1sZy1sZzQ1NzMuYyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5l
bC1sZy1sZzQ1NzMuYwppbmRleCBiMjYyYjUzZGJkODUuLjU5MDdmMjUwMzc1NSAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLWxnLWxnNDU3My5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9wYW5lbC9wYW5lbC1sZy1sZzQ1NzMuYwpAQCAtMTk3LDcgKzE5Nyw3IEBAIHN0YXRp
YyBpbnQgbGc0NTczX2VuYWJsZShzdHJ1Y3QgZHJtX3BhbmVsICpwYW5lbCkKIH0KIAogc3RhdGlj
IGNvbnN0IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlIGRlZmF1bHRfbW9kZSA9IHsKLQkuY2xvY2sg
PSAyNzAwMCwKKwkuY2xvY2sgPSAyODM0MSwKIAkuaGRpc3BsYXkgPSA0ODAsCiAJLmhzeW5jX3N0
YXJ0ID0gNDgwICsgMTAsCiAJLmhzeW5jX2VuZCA9IDQ4MCArIDEwICsgNTksCi0tIAoyLjI0LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
