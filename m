Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E7362609
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 18:21:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A222989FCC;
	Mon,  8 Jul 2019 16:21:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 801BC89FCA;
 Mon,  8 Jul 2019 16:21:10 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Jul 2019 09:21:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,466,1557212400"; d="scan'208";a="170326719"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga006.jf.intel.com with SMTP; 08 Jul 2019 09:21:05 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 08 Jul 2019 19:21:04 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 04/14] drm/sti: Try to fix up the tvout possible clones
Date: Mon,  8 Jul 2019 19:20:38 +0300
Message-Id: <20190708162048.4286-5-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190708162048.4286-1-ville.syrjala@linux.intel.com>
References: <20190708162048.4286-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Vincent Abriou <vincent.abriou@st.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClRo
ZSBjdXJyZW50IHBvc3NpYmxlX2Nsb25lcyBzZXR1cCBkb2Vzbid0IGxvb2sgc2Vuc2libGUuIEkn
bSBhc3N1bWluZwp0aGUgMCBhbmQgMSBhcmUgc3VwcG9zZWQgdG8gcmVmZXIgdG8gdGhlIGluZGV4
ZXMgb2YgdGhlIGhkbWkgYW5kIGhkYQplbmNvZGVycz8gU28gaXQga2luZGEgbG9va3MgbGlrZSB3
ZSB3YW50IGhkYStoZG1pIGNsb25pbmcsIGJ1dCB0aGVuCmR2byBhbHNvIGNsYWltcyB0byBiZSBj
bG9uZWFibGUgd2l0aCBoZG1pLCBidXQgaGRtaSB3b24ndCByZWNpcHJpY2F0ZS4KCkJlbmphbWlu
IHRlbGxzIG1lIGFsbCBlbmNvZGVycyBzaG91bGQgYmUgY2xvbmVhYmxlIHdpdGggZWFjaCBvdGhl
ciwKc28gbGV0J3MgZml4IHVwIHRoZSBtYXNrcyB0byBpbmRpY2F0ZSB0aGF0LgoKQ2M6IEJlbmph
bWluIEdhaWduYXJkIDxiZW5qYW1pbi5nYWlnbmFyZEBsaW5hcm8ub3JnPgpDYzogVmluY2VudCBB
YnJpb3UgPHZpbmNlbnQuYWJyaW91QHN0LmNvbT4KQWNrZWQtYnk6IEJlbmphbWluIEdhaWduYXJk
IDxiZW5qYW1pbi5nYWlnbmFyZEBsaW5hcm8ub3JnPgpTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJq
w6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9zdGkvc3RpX3R2b3V0LmMgfCAxMCArKysrKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNl
cnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9z
dGkvc3RpX3R2b3V0LmMgYi9kcml2ZXJzL2dwdS9kcm0vc3RpL3N0aV90dm91dC5jCmluZGV4IDQy
ZjRjMjY0YTc4My4uYWJhNzljMTcyNTEyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vc3Rp
L3N0aV90dm91dC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9zdGkvc3RpX3R2b3V0LmMKQEAgLTY3
Miw3ICs2NzIsNiBAQCBzdGlfdHZvdXRfY3JlYXRlX2R2b19lbmNvZGVyKHN0cnVjdCBkcm1fZGV2
aWNlICpkZXYsCiAJZHJtX2VuY29kZXIgPSAmZW5jb2Rlci0+ZW5jb2RlcjsKIAogCWRybV9lbmNv
ZGVyLT5wb3NzaWJsZV9jcnRjcyA9IEVOQ09ERVJfQ1JUQ19NQVNLOwotCWRybV9lbmNvZGVyLT5w
b3NzaWJsZV9jbG9uZXMgPSAxIDw8IDA7CiAKIAlkcm1fZW5jb2Rlcl9pbml0KGRldiwgZHJtX2Vu
Y29kZXIsCiAJCQkgJnN0aV90dm91dF9lbmNvZGVyX2Z1bmNzLCBEUk1fTU9ERV9FTkNPREVSX0xW
RFMsCkBAIC03MjUsNyArNzI0LDYgQEAgc3RhdGljIHN0cnVjdCBkcm1fZW5jb2RlciAqc3RpX3R2
b3V0X2NyZWF0ZV9oZGFfZW5jb2RlcihzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAogCWRybV9lbmNv
ZGVyID0gJmVuY29kZXItPmVuY29kZXI7CiAKIAlkcm1fZW5jb2Rlci0+cG9zc2libGVfY3J0Y3Mg
PSBFTkNPREVSX0NSVENfTUFTSzsKLQlkcm1fZW5jb2Rlci0+cG9zc2libGVfY2xvbmVzID0gMSA8
PCAwOwogCiAJZHJtX2VuY29kZXJfaW5pdChkZXYsIGRybV9lbmNvZGVyLAogCQkJJnN0aV90dm91
dF9lbmNvZGVyX2Z1bmNzLCBEUk1fTU9ERV9FTkNPREVSX0RBQywgTlVMTCk7CkBAIC03NzQsNyAr
NzcyLDYgQEAgc3RhdGljIHN0cnVjdCBkcm1fZW5jb2RlciAqc3RpX3R2b3V0X2NyZWF0ZV9oZG1p
X2VuY29kZXIoc3RydWN0IGRybV9kZXZpY2UgKmRldiwKIAlkcm1fZW5jb2RlciA9ICZlbmNvZGVy
LT5lbmNvZGVyOwogCiAJZHJtX2VuY29kZXItPnBvc3NpYmxlX2NydGNzID0gRU5DT0RFUl9DUlRD
X01BU0s7Ci0JZHJtX2VuY29kZXItPnBvc3NpYmxlX2Nsb25lcyA9IDEgPDwgMTsKIAogCWRybV9l
bmNvZGVyX2luaXQoZGV2LCBkcm1fZW5jb2RlciwKIAkJCSZzdGlfdHZvdXRfZW5jb2Rlcl9mdW5j
cywgRFJNX01PREVfRU5DT0RFUl9UTURTLCBOVUxMKTsKQEAgLTc5MCw2ICs3ODcsMTMgQEAgc3Rh
dGljIHZvaWQgc3RpX3R2b3V0X2NyZWF0ZV9lbmNvZGVycyhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2
LAogCXR2b3V0LT5oZG1pID0gc3RpX3R2b3V0X2NyZWF0ZV9oZG1pX2VuY29kZXIoZGV2LCB0dm91
dCk7CiAJdHZvdXQtPmhkYSA9IHN0aV90dm91dF9jcmVhdGVfaGRhX2VuY29kZXIoZGV2LCB0dm91
dCk7CiAJdHZvdXQtPmR2byA9IHN0aV90dm91dF9jcmVhdGVfZHZvX2VuY29kZXIoZGV2LCB0dm91
dCk7CisKKwl0dm91dC0+aGRtaS0+cG9zc2libGVfY2xvbmVzID0gZHJtX2VuY29kZXJfbWFzayh0
dm91dC0+aGRtaSkgfAorCQlkcm1fZW5jb2Rlcl9tYXNrKHR2b3V0LT5oZGEpIHwgZHJtX2VuY29k
ZXJfbWFzayh0dm91dC0+ZHZvKTsKKwl0dm91dC0+aGRhLT5wb3NzaWJsZV9jbG9uZXMgPSBkcm1f
ZW5jb2Rlcl9tYXNrKHR2b3V0LT5oZG1pKSB8CisJCWRybV9lbmNvZGVyX21hc2sodHZvdXQtPmhk
YSkgfCBkcm1fZW5jb2Rlcl9tYXNrKHR2b3V0LT5kdm8pOworCXR2b3V0LT5kdm8tPnBvc3NpYmxl
X2Nsb25lcyA9IGRybV9lbmNvZGVyX21hc2sodHZvdXQtPmhkbWkpIHwKKwkJZHJtX2VuY29kZXJf
bWFzayh0dm91dC0+aGRhKSB8IGRybV9lbmNvZGVyX21hc2sodHZvdXQtPmR2byk7CiB9CiAKIHN0
YXRpYyB2b2lkIHN0aV90dm91dF9kZXN0cm95X2VuY29kZXJzKHN0cnVjdCBzdGlfdHZvdXQgKnR2
b3V0KQotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
