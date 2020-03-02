Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D025A176512
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 21:35:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B7F5899DB;
	Mon,  2 Mar 2020 20:35:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD3C96E831
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 20:35:55 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Mar 2020 12:35:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,508,1574150400"; d="scan'208";a="286733964"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by FMSMGA003.fm.intel.com with SMTP; 02 Mar 2020 12:35:53 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 02 Mar 2020 22:35:52 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 18/33] drm/panel-simple: Fix dotclock for Giantplus
 GPG482739QS5
Date: Mon,  2 Mar 2020 22:34:37 +0200
Message-Id: <20200302203452.17977-19-ville.syrjala@linux.intel.com>
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
Cc: Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClRo
ZSBjdXJyZW50bHkgbGlzdGVkIGRvdGNsb2NrIGRpc2FncmVlcyB3aXRoIHRoZSBjdXJyZW50bHkK
bGlzdGVkIHZyZWZyZXNoIHJhdGUuIENoYW5nZSB0aGUgZG90Y2xvY2sgdG8gbWF0Y2ggdGhlIHZy
ZWZyZXNoLgoKU29tZW9uZSB0ZWxsIG1lIHdoaWNoIChpZiBlaXRoZXIpIG9mIHRoZSBkb3RjbG9j
ayBvciB2cmVyZXNoIGlzCmNvcnJlY3Q/CgpDYzogUGhpbGlwcCBaYWJlbCA8cGhpbGlwcC56YWJl
bEBnbWFpbC5jb20+CkNjOiBMdWNhcyBTdGFjaCA8bC5zdGFjaEBwZW5ndXRyb25peC5kZT4KQ2M6
IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+ClNpZ25lZC1vZmYtYnk6IFZpbGxl
IFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Bh
bmVsL3BhbmVsLXNpbXBsZS5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5j
CmluZGV4IGJhY2NmNDA3MjIyYy4uM2U5OGRiZmMzMWM0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3Bh
bmVsLXNpbXBsZS5jCkBAIC0xNTg4LDcgKzE1ODgsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHBh
bmVsX2Rlc2MgZnJpZW5kbHlhcm1faGQ3MDJlID0gewogfTsKIAogc3RhdGljIGNvbnN0IHN0cnVj
dCBkcm1fZGlzcGxheV9tb2RlIGdpYW50cGx1c19ncGc0ODI3MzlxczVfbW9kZSA9IHsKLQkuY2xv
Y2sgPSA5MDAwLAorCS5jbG9jayA9IDkxMjEsCiAJLmhkaXNwbGF5ID0gNDgwLAogCS5oc3luY19z
dGFydCA9IDQ4MCArIDUsCiAJLmhzeW5jX2VuZCA9IDQ4MCArIDUgKyAxLAotLSAKMi4yNC4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
