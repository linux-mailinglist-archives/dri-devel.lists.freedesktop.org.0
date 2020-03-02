Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A67B617651E
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 21:36:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA2946E83B;
	Mon,  2 Mar 2020 20:36:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AFC46E83B
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 20:36:37 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Mar 2020 12:36:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,508,1574150400"; d="scan'208";a="258081572"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga002.jf.intel.com with SMTP; 02 Mar 2020 12:36:34 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 02 Mar 2020 22:36:33 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 30/33] drm/panel-simple: Fix dotclock for TPK U.S.A. LLC Fusion
Date: Mon,  2 Mar 2020 22:34:49 +0200
Message-Id: <20200302203452.17977-31-ville.syrjala@linux.intel.com>
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
Cc: Thierry Reding <treding@nvidia.com>,
 Bhuvanchandra DV <bhuvanchandra.dv@toradex.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClRo
ZSBjdXJyZW50bHkgbGlzdGVkIGRvdGNsb2NrIGRpc2FncmVlcyB3aXRoIHRoZSBjdXJyZW50bHkK
bGlzdGVkIHZyZWZyZXNoIHJhdGUuIENoYW5nZSB0aGUgZG90Y2xvY2sgdG8gbWF0Y2ggdGhlIHZy
ZWZyZXNoLgoKU29tZW9uZSB0ZWxsIG1lIHdoaWNoIChpZiBlaXRoZXIpIG9mIHRoZSBkb3RjbG9j
ayBvciB2cmVyZXNoIGlzCmNvcnJlY3Q/CgpDYzogQmh1dmFuY2hhbmRyYSBEViA8Ymh1dmFuY2hh
bmRyYS5kdkB0b3JhZGV4LmNvbT4KQ2M6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+CkNj
OiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgpTaWduZWQtb2ZmLWJ5OiBWaWxs
ZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9w
YW5lbC9wYW5lbC1zaW1wbGUuYyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUu
YwppbmRleCA0NmE4MmNhNWMyY2EuLjVjZTEzMjhmZDdkYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9w
YW5lbC1zaW1wbGUuYwpAQCAtMzMwOSw3ICszMzA5LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBw
YW5lbF9kZXNjIHRwa19mMDdhXzAxMDIgPSB7CiB9OwogCiBzdGF0aWMgY29uc3Qgc3RydWN0IGRy
bV9kaXNwbGF5X21vZGUgdHBrX2YxMGFfMDEwMl9tb2RlID0gewotCS5jbG9jayA9IDQ1MDAwLAor
CS5jbG9jayA9IDUwNDI3LAogCS5oZGlzcGxheSA9IDEwMjQsCiAJLmhzeW5jX3N0YXJ0ID0gMTAy
NCArIDE3NiwKIAkuaHN5bmNfZW5kID0gMTAyNCArIDE3NiArIDUsCi0tIAoyLjI0LjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
