Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CC417E159
	for <lists+dri-devel@lfdr.de>; Mon,  9 Mar 2020 14:38:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E50D897F3;
	Mon,  9 Mar 2020 13:38:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBFBE897F3
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2020 13:38:24 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Mar 2020 06:38:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,533,1574150400"; d="scan'208";a="235598241"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga008.fm.intel.com with SMTP; 09 Mar 2020 06:38:09 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 09 Mar 2020 15:38:09 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 04/33] drm/panel-ilitek-ili9322: Fix dotclocks
Date: Mon,  9 Mar 2020 15:38:09 +0200
Message-Id: <20200309133809.32585-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200302203452.17977-5-ville.syrjala@linux.intel.com>
References: <20200302203452.17977-5-ville.syrjala@linux.intel.com>
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
ZSBsaXN0ZWQgZG90Y2xvY2tzIGFyZSB0d28gb3JkZXJzIG9mIG1hbmduaXR1ZGUgb3V0LgpGaXgg
dGhlbS4KCnYyOiBKdXN0IGRpdmlkZSBldmVyeXRoaW5nIGJ5IDEwMCAoTGludXMpCgpDYzogTGlu
dXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgpDYzogVGhpZXJyeSBSZWRpbmcg
PHRyZWRpbmdAbnZpZGlhLmNvbT4KU2lnbmVkLW9mZi1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxs
ZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFu
ZWwtaWxpdGVrLWlsaTkzMjIuYyB8IDE0ICsrKysrKystLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwg
NyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9wYW5lbC9wYW5lbC1pbGl0ZWstaWxpOTMyMi5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVs
L3BhbmVsLWlsaXRlay1pbGk5MzIyLmMKaW5kZXggZjM5NGQ1M2E3ZGE0Li4wOTkzNTUyMGU2MDYg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1pbGl0ZWstaWxpOTMyMi5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1pbGl0ZWstaWxpOTMyMi5jCkBAIC01
NDAsNyArNTQwLDcgQEAgc3RhdGljIGludCBpbGk5MzIyX2VuYWJsZShzdHJ1Y3QgZHJtX3BhbmVs
ICpwYW5lbCkKIAogLyogU2VyaWFsIFJHQiBtb2RlcyAqLwogc3RhdGljIGNvbnN0IHN0cnVjdCBk
cm1fZGlzcGxheV9tb2RlIHNyZ2JfMzIweDI0MF9tb2RlID0gewotCS5jbG9jayA9IDI0NTM1MDAs
CisJLmNsb2NrID0gMjQ1MzUsCiAJLmhkaXNwbGF5ID0gMzIwLAogCS5oc3luY19zdGFydCA9IDMy
MCArIDM1OSwKIAkuaHN5bmNfZW5kID0gMzIwICsgMzU5ICsgMSwKQEAgLTU1NCw3ICs1NTQsNyBA
QCBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgc3JnYl8zMjB4MjQwX21vZGUg
PSB7CiB9OwogCiBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgc3JnYl8zNjB4
MjQwX21vZGUgPSB7Ci0JLmNsb2NrID0gMjcwMDAwMCwKKwkuY2xvY2sgPSAyNzAwMCwKIAkuaGRp
c3BsYXkgPSAzNjAsCiAJLmhzeW5jX3N0YXJ0ID0gMzYwICsgMzUsCiAJLmhzeW5jX2VuZCA9IDM2
MCArIDM1ICsgMSwKQEAgLTU2OSw3ICs1NjksNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9k
aXNwbGF5X21vZGUgc3JnYl8zNjB4MjQwX21vZGUgPSB7CiAKIC8qIFRoaXMgaXMgdGhlIG9ubHkg
bW9kZSBsaXN0ZWQgZm9yIHBhcmFsbGVsIFJHQiBpbiB0aGUgZGF0YXNoZWV0ICovCiBzdGF0aWMg
Y29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgcHJnYl8zMjB4MjQwX21vZGUgPSB7Ci0JLmNs
b2NrID0gNjQwMDAwMCwKKwkuY2xvY2sgPSA2NDAwMCwKIAkuaGRpc3BsYXkgPSAzMjAsCiAJLmhz
eW5jX3N0YXJ0ID0gMzIwICsgMzgsCiAJLmhzeW5jX2VuZCA9IDMyMCArIDM4ICsgMSwKQEAgLTU4
NCw3ICs1ODQsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgcHJnYl8z
MjB4MjQwX21vZGUgPSB7CiAKIC8qIFlVViBtb2RlcyAqLwogc3RhdGljIGNvbnN0IHN0cnVjdCBk
cm1fZGlzcGxheV9tb2RlIHl1dl82NDB4MzIwX21vZGUgPSB7Ci0JLmNsb2NrID0gMjQ1NDAwMCwK
KwkuY2xvY2sgPSAyNDU0MCwKIAkuaGRpc3BsYXkgPSA2NDAsCiAJLmhzeW5jX3N0YXJ0ID0gNjQw
ICsgMjUyLAogCS5oc3luY19lbmQgPSA2NDAgKyAyNTIgKyAxLApAQCAtNTk4LDcgKzU5OCw3IEBA
IHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSB5dXZfNjQweDMyMF9tb2RlID0g
ewogfTsKIAogc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlIHl1dl83MjB4MzYw
X21vZGUgPSB7Ci0JLmNsb2NrID0gMjcwMDAwMCwKKwkuY2xvY2sgPSAyNzAwMCwKIAkuaGRpc3Bs
YXkgPSA3MjAsCiAJLmhzeW5jX3N0YXJ0ID0gNzIwICsgMjUyLAogCS5oc3luY19lbmQgPSA3MjAg
KyAyNTIgKyAxLApAQCAtNjEzLDcgKzYxMyw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Rp
c3BsYXlfbW9kZSB5dXZfNzIweDM2MF9tb2RlID0gewogCiAvKiBCVC42NTYgVkdBIG1vZGUsIDY0
MHg0ODAgKi8KIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSBpdHVfcl9idF82
NTZfNjQwX21vZGUgPSB7Ci0JLmNsb2NrID0gMjQ1NDAwMCwKKwkuY2xvY2sgPSAyNDU0MCwKIAku
aGRpc3BsYXkgPSA2NDAsCiAJLmhzeW5jX3N0YXJ0ID0gNjQwICsgMywKIAkuaHN5bmNfZW5kID0g
NjQwICsgMyArIDEsCkBAIC02MjgsNyArNjI4LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1f
ZGlzcGxheV9tb2RlIGl0dV9yX2J0XzY1Nl82NDBfbW9kZSA9IHsKIAogLyogQlQuNjU2IEQxIG1v
ZGUgNzIweDQ4MCAqLwogc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlIGl0dV9y
X2J0XzY1Nl83MjBfbW9kZSA9IHsKLQkuY2xvY2sgPSAyNzAwMDAwLAorCS5jbG9jayA9IDI3MDAw
LAogCS5oZGlzcGxheSA9IDcyMCwKIAkuaHN5bmNfc3RhcnQgPSA3MjAgKyAzLAogCS5oc3luY19l
bmQgPSA3MjAgKyAzICsgMSwKLS0gCjIuMjQuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
