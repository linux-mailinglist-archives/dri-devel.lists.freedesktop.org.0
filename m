Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E8E176500
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 21:35:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AA4C6E821;
	Mon,  2 Mar 2020 20:35:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A999C6E821
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 20:35:09 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Mar 2020 12:35:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,508,1574150400"; d="scan'208";a="273879602"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga002.fm.intel.com with SMTP; 02 Mar 2020 12:35:06 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 02 Mar 2020 22:35:05 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 04/33] drm/panel-ilitek-ili9322: Fix dotclocks
Date: Mon,  2 Mar 2020 22:34:23 +0200
Message-Id: <20200302203452.17977-5-ville.syrjala@linux.intel.com>
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
ZSBjdXJyZW50bHkgbGlzdGVkIGRvdGNsb2NrcyBkaXNhZ3JlZSB3aXRoIHRoZSBjdXJyZW50bHkK
bGlzdGVkIHZyZWZyZXNoIHJhdGVzLiBDaGFuZ2UgdGhlIGRvdGNsb2NrcyB0byBtYXRjaCB0aGUg
dnJlZnJlc2guCgpTb21lb25lIHRlbGwgbWUgd2hpY2ggKGlmIGVpdGhlcikgb2YgdGhlIGRvdGNs
b2NrIG9yIHZyZXJlc2ggaXMKY29ycmVjdD8KCkNjOiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxs
ZWlqQGxpbmFyby5vcmc+CkNjOiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgpT
aWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1pbGl0ZWstaWxpOTMyMi5jIHwg
MTQgKysrKysrKy0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDcgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLWlsaXRl
ay1pbGk5MzIyLmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtaWxpdGVrLWlsaTkzMjIu
YwppbmRleCBmMzk0ZDUzYTdkYTQuLjVlMDZlNzNjMjUxNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3BhbmVsL3BhbmVsLWlsaXRlay1pbGk5MzIyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L3BhbmVsL3BhbmVsLWlsaXRlay1pbGk5MzIyLmMKQEAgLTU0MCw3ICs1NDAsNyBAQCBzdGF0aWMg
aW50IGlsaTkzMjJfZW5hYmxlKHN0cnVjdCBkcm1fcGFuZWwgKnBhbmVsKQogCiAvKiBTZXJpYWwg
UkdCIG1vZGVzICovCiBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgc3JnYl8z
MjB4MjQwX21vZGUgPSB7Ci0JLmNsb2NrID0gMjQ1MzUwMCwKKwkuY2xvY2sgPSAxNDQ3OCwKIAku
aGRpc3BsYXkgPSAzMjAsCiAJLmhzeW5jX3N0YXJ0ID0gMzIwICsgMzU5LAogCS5oc3luY19lbmQg
PSAzMjAgKyAzNTkgKyAxLApAQCAtNTU0LDcgKzU1NCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
ZHJtX2Rpc3BsYXlfbW9kZSBzcmdiXzMyMHgyNDBfbW9kZSA9IHsKIH07CiAKIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSBzcmdiXzM2MHgyNDBfbW9kZSA9IHsKLQkuY2xvY2sg
PSAyNzAwMDAwLAorCS5jbG9jayA9IDEwMDE0LAogCS5oZGlzcGxheSA9IDM2MCwKIAkuaHN5bmNf
c3RhcnQgPSAzNjAgKyAzNSwKIAkuaHN5bmNfZW5kID0gMzYwICsgMzUgKyAxLApAQCAtNTY5LDcg
KzU2OSw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSBzcmdiXzM2MHgy
NDBfbW9kZSA9IHsKIAogLyogVGhpcyBpcyB0aGUgb25seSBtb2RlIGxpc3RlZCBmb3IgcGFyYWxs
ZWwgUkdCIGluIHRoZSBkYXRhc2hlZXQgKi8KIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3Bs
YXlfbW9kZSBwcmdiXzMyMHgyNDBfbW9kZSA9IHsKLQkuY2xvY2sgPSA2NDAwMDAwLAorCS5jbG9j
ayA9IDY0MjksCiAJLmhkaXNwbGF5ID0gMzIwLAogCS5oc3luY19zdGFydCA9IDMyMCArIDM4LAog
CS5oc3luY19lbmQgPSAzMjAgKyAzOCArIDEsCkBAIC01ODQsNyArNTg0LDcgQEAgc3RhdGljIGNv
bnN0IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlIHByZ2JfMzIweDI0MF9tb2RlID0gewogCiAvKiBZ
VVYgbW9kZXMgKi8KIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSB5dXZfNjQw
eDMyMF9tb2RlID0gewotCS5jbG9jayA9IDI0NTQwMDAsCisJLmNsb2NrID0gMTg5NTQsCiAJLmhk
aXNwbGF5ID0gNjQwLAogCS5oc3luY19zdGFydCA9IDY0MCArIDI1MiwKIAkuaHN5bmNfZW5kID0g
NjQwICsgMjUyICsgMSwKQEAgLTU5OCw3ICs1OTgsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRy
bV9kaXNwbGF5X21vZGUgeXV2XzY0MHgzMjBfbW9kZSA9IHsKIH07CiAKIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSB5dXZfNzIweDM2MF9tb2RlID0gewotCS5jbG9jayA9IDI3
MDAwMDAsCisJLmNsb2NrID0gMjI5MTEsCiAJLmhkaXNwbGF5ID0gNzIwLAogCS5oc3luY19zdGFy
dCA9IDcyMCArIDI1MiwKIAkuaHN5bmNfZW5kID0gNzIwICsgMjUyICsgMSwKQEAgLTYxMyw3ICs2
MTMsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgeXV2XzcyMHgzNjBf
bW9kZSA9IHsKIAogLyogQlQuNjU2IFZHQSBtb2RlLCA2NDB4NDgwICovCiBzdGF0aWMgY29uc3Qg
c3RydWN0IGRybV9kaXNwbGF5X21vZGUgaXR1X3JfYnRfNjU2XzY0MF9tb2RlID0gewotCS5jbG9j
ayA9IDI0NTQwMDAsCisJLmNsb2NrID0gMjc0ODAsCiAJLmhkaXNwbGF5ID0gNjQwLAogCS5oc3lu
Y19zdGFydCA9IDY0MCArIDMsCiAJLmhzeW5jX2VuZCA9IDY0MCArIDMgKyAxLApAQCAtNjI4LDcg
KzYyOCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSBpdHVfcl9idF82
NTZfNjQwX21vZGUgPSB7CiAKIC8qIEJULjY1NiBEMSBtb2RlIDcyMHg0ODAgKi8KIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSBpdHVfcl9idF82NTZfNzIwX21vZGUgPSB7Ci0J
LmNsb2NrID0gMjcwMDAwMCwKKwkuY2xvY2sgPSAyOTg4MCwKIAkuaGRpc3BsYXkgPSA3MjAsCiAJ
LmhzeW5jX3N0YXJ0ID0gNzIwICsgMywKIAkuaHN5bmNfZW5kID0gNzIwICsgMyArIDEsCi0tIAoy
LjI0LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
