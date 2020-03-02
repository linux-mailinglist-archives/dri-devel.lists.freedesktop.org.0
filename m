Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD08217650B
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 21:35:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0493A6E829;
	Mon,  2 Mar 2020 20:35:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68E256E829
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 20:35:36 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Mar 2020 12:35:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,508,1574150400"; d="scan'208";a="319195978"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga001.jf.intel.com with SMTP; 02 Mar 2020 12:35:33 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 02 Mar 2020 22:35:32 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 12/33] drm/panel-simple: Fix dotclock for CDTech S070WV95-CT16
Date: Mon,  2 Mar 2020 22:34:31 +0200
Message-Id: <20200302203452.17977-13-ville.syrjala@linux.intel.com>
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
 Giulio Benetti <giulio.benetti@micronovasrl.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClRo
ZSBjdXJyZW50bHkgbGlzdGVkIGRvdGNsb2NrIGRpc2FncmVlcyB3aXRoIHRoZSBjdXJyZW50bHkK
bGlzdGVkIHZyZWZyZXNoIHJhdGUuIENoYW5nZSB0aGUgZG90Y2xvY2sgdG8gbWF0Y2ggdGhlIHZy
ZWZyZXNoLgoKU29tZW9uZSB0ZWxsIG1lIHdoaWNoIChpZiBlaXRoZXIpIG9mIHRoZSBkb3RjbG9j
ayBvciB2cmVyZXNoIGlzCmNvcnJlY3Q/CgpDYzogR2l1bGlvIEJlbmV0dGkgPGdpdWxpby5iZW5l
dHRpQG1pY3Jvbm92YXNybC5jb20+CkNjOiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEu
Y29tPgpTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXgu
aW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUuYyB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUuYyBiL2RyaXZlcnMvZ3B1
L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUuYwppbmRleCBkMjk4MDQ4NWQwYzUuLjliMTlmZmIyMzc1
NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUuYwpAQCAtMTE2MSw3ICsxMTYxLDcg
QEAgc3RhdGljIGNvbnN0IHN0cnVjdCBwYW5lbF9kZXNjIGNkdGVjaF9zMDQzd3EyNmhfY3Q3ID0g
ewogfTsKIAogc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlIGNkdGVjaF9zMDcw
d3Y5NV9jdDE2X21vZGUgPSB7Ci0JLmNsb2NrID0gMzUwMDAsCisJLmNsb2NrID0gMjkyMzIsCiAJ
LmhkaXNwbGF5ID0gODAwLAogCS5oc3luY19zdGFydCA9IDgwMCArIDQwLAogCS5oc3luY19lbmQg
PSA4MDAgKyA0MCArIDQwLAotLSAKMi4yNC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
