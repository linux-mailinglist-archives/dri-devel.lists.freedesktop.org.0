Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D18FD176506
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 21:35:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3B5F6E825;
	Mon,  2 Mar 2020 20:35:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E6FE6E825
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 20:35:22 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Mar 2020 12:35:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,508,1574150400"; d="scan'208";a="286733823"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by FMSMGA003.fm.intel.com with SMTP; 02 Mar 2020 12:35:19 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 02 Mar 2020 22:35:18 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 08/33] drm/panel-sony-acx424akp: Fix dotclocks
Date: Mon,  2 Mar 2020 22:34:27 +0200
Message-Id: <20200302203452.17977-9-ville.syrjala@linux.intel.com>
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
Cc: Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClRo
ZSBjdXJyZW50bHkgbGlzdGVkIGRvdGNsb2NrcyBkaXNhZ3JlZSB3aXRoIHRoZSBjdXJyZW50bHkK
bGlzdGVkIHZyZWZyZXNoIHJhdGVzLiBDaGFuZ2UgdGhlIGRvdGNsb2NrcyB0byBtYXRjaCB0aGUg
dnJlZnJlc2guCgpTb21lb25lIHRlbGwgbWUgd2hpY2ggKGlmIGVpdGhlcikgb2YgdGhlIGRvdGNs
b2NrIG9yIHZyZXJlc2ggaXMKY29ycmVjdD8KCkNjOiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxs
ZWlqQGxpbmFyby5vcmc+CkNjOiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+ClNpZ25l
ZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+
Ci0tLQogZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNvbnktYWN4NDI0YWtwLmMgfCA0ICsr
LS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNvbnktYWN4NDI0YWtwLmMgYi9k
cml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc29ueS1hY3g0MjRha3AuYwppbmRleCBkZTBhYmY3
NmFlNmYuLmM5MWU1NWIyZDdhMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3Bh
bmVsLXNvbnktYWN4NDI0YWtwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNv
bnktYWN4NDI0YWtwLmMKQEAgLTQ4LDcgKzQ4LDcgQEAgc3RydWN0IGFjeDQyNGFrcCB7CiB9Owog
CiBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgc29ueV9hY3g0MjRha3Bfdmlk
X21vZGUgPSB7Ci0JLmNsb2NrID0gMzMwMDAwLAorCS5jbG9jayA9IDI3MjM0LAogCS5oZGlzcGxh
eSA9IDQ4MCwKIAkuaHN5bmNfc3RhcnQgPSA0ODAgKyAxNSwKIAkuaHN5bmNfZW5kID0gNDgwICsg
MTUgKyAwLApAQCAtNjgsNyArNjgsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5
X21vZGUgc29ueV9hY3g0MjRha3BfdmlkX21vZGUgPSB7CiAgKiBjb21tYW5kIG1vZGUgdXNpbmcg
dGhlIG1heGltdW0gSFMgZnJlcXVlbmN5LgogICovCiBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9k
aXNwbGF5X21vZGUgc29ueV9hY3g0MjRha3BfY21kX21vZGUgPSB7Ci0JLmNsb2NrID0gNDIwMTYw
LAorCS5jbG9jayA9IDM1NDc4LAogCS5oZGlzcGxheSA9IDQ4MCwKIAkuaHN5bmNfc3RhcnQgPSA0
ODAgKyAxNTQsCiAJLmhzeW5jX2VuZCA9IDQ4MCArIDE1NCArIDE2LAotLSAKMi4yNC4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
