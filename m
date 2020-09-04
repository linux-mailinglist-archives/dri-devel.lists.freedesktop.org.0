Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 450DA25D7F6
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 13:54:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC96F6EB57;
	Fri,  4 Sep 2020 11:54:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7672F6EB54;
 Fri,  4 Sep 2020 11:54:14 +0000 (UTC)
IronPort-SDR: oYcNuo0nFUBLff80IzXb4iELLJmMwnFXcZcNnXKhUCdtrqYPRAEKz/7tyzzft0B0zS0/oOXc6x
 GJGdEgqoOwKQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9733"; a="175782016"
X-IronPort-AV: E=Sophos;i="5.76,389,1592895600"; d="scan'208";a="175782016"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2020 04:54:14 -0700
IronPort-SDR: vEf+bE7ox3fVdLqOP8PWyQcwDF3NupjujhO8hQGE8LvyJ/aibPyBhd5s7NSdVgBYYw68qCQc6s
 Bl77cGhI9WFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,389,1592895600"; d="scan'208";a="376223889"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga001.jf.intel.com with SMTP; 04 Sep 2020 04:54:11 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 04 Sep 2020 14:54:10 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 05/18] drm/i915: Reworkd DFP max bpc handling
Date: Fri,  4 Sep 2020 14:53:41 +0300
Message-Id: <20200904115354.25336-6-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200904115354.25336-1-ville.syrjala@linux.intel.com>
References: <20200904115354.25336-1-ville.syrjala@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClN0
YXNoIHRoZSBkb3duc3RyZWFtIGZhY2luZyBwb3J0IG1heCBicGMgYXdheSBkdXJpbmcKaW50ZWxf
ZHBfc2V0X2VkaWQoKS4gV2UnbGwgc29vbiBuZWVkIHRoZSBFRElEIGluIHRoZXJlIHNvCndlIGNh
bid0IGZpZ3VyZSB0aGlzIG91dCBzbyBlYXNpbHkgZHVyaW5nIC5jb21wdXRlX2NvbmZpZygpIGFu
eW1vcmUuCgpTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGlu
dXguaW50ZWwuY29tPgotLS0KIC4uLi9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfdHlw
ZXMuaCAgICB8ICA1ICsrKysrCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rw
LmMgICAgICAgfCAyMiArKysrKysrKysrKysrKy0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDIxIGlu
c2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X3R5cGVzLmggYi9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfdHlwZXMuaAppbmRleCA2ZjNhM2RkZTk5YzguLjg2OTlj
MDAxOTY5ZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9k
aXNwbGF5X3R5cGVzLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9k
aXNwbGF5X3R5cGVzLmgKQEAgLTEzNzksNiArMTM3OSwxMSBAQCBzdHJ1Y3QgaW50ZWxfZHAgewog
CS8qIERpc3BsYXlwb3J0IGNvbXBsaWFuY2UgdGVzdGluZyAqLwogCXN0cnVjdCBpbnRlbF9kcF9j
b21wbGlhbmNlIGNvbXBsaWFuY2U7CiAKKwkvKiBEb3duc3RyZWFtIGZhY2luZyBwb3J0IGNhcHMg
Ki8KKwlzdHJ1Y3QgeworCQl1OCBtYXhfYnBjOworCX0gZGZwOworCiAJLyogRGlzcGxheSBzdHJl
YW0gY29tcHJlc3Npb24gdGVzdGluZyAqLwogCWJvb2wgZm9yY2VfZHNjX2VuOwogCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMgYi9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMKaW5kZXggNjBiZjAxYThiNGFkLi4yYzhlODJk
OTdhMzQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMKQEAgLTE5NzMs
MTMgKzE5NzMsMTIgQEAgc3RhdGljIGludCBpbnRlbF9kcF9jb21wdXRlX2JwcChzdHJ1Y3QgaW50
ZWxfZHAgKmludGVsX2RwLAogewogCXN0cnVjdCBkcm1faTkxNV9wcml2YXRlICpkZXZfcHJpdiA9
IGRwX3RvX2k5MTUoaW50ZWxfZHApOwogCXN0cnVjdCBpbnRlbF9jb25uZWN0b3IgKmludGVsX2Nv
bm5lY3RvciA9IGludGVsX2RwLT5hdHRhY2hlZF9jb25uZWN0b3I7Ci0JaW50IGJwcCwgYnBjOwor
CWludCBicHA7CiAKIAlicHAgPSBwaXBlX2NvbmZpZy0+cGlwZV9icHA7Ci0JYnBjID0gZHJtX2Rw
X2Rvd25zdHJlYW1fbWF4X2JwYyhpbnRlbF9kcC0+ZHBjZCwgaW50ZWxfZHAtPmRvd25zdHJlYW1f
cG9ydHMpOwogCi0JaWYgKGJwYyA+IDApCi0JCWJwcCA9IG1pbihicHAsIDMqYnBjKTsKKwlpZiAo
aW50ZWxfZHAtPmRmcC5tYXhfYnBjKQorCQlicHAgPSBtaW4oYnBwLCAzICogaW50ZWxfZHAtPmRm
cC5tYXhfYnBjKTsKIAogCWlmIChpbnRlbF9kcF9pc19lZHAoaW50ZWxfZHApKSB7CiAJCS8qIEdl
dCBicHAgZnJvbSB2YnQgb25seSBmb3IgcGFuZWxzIHRoYXQgZG9udCBoYXZlIGJwcCBpbiBlZGlk
ICovCkBAIC02MDYyLDEyICs2MDYxLDIxIEBAIGludGVsX2RwX2dldF9lZGlkKHN0cnVjdCBpbnRl
bF9kcCAqaW50ZWxfZHApCiBzdGF0aWMgdm9pZAogaW50ZWxfZHBfc2V0X2VkaWQoc3RydWN0IGlu
dGVsX2RwICppbnRlbF9kcCkKIHsKLQlzdHJ1Y3QgaW50ZWxfY29ubmVjdG9yICppbnRlbF9jb25u
ZWN0b3IgPSBpbnRlbF9kcC0+YXR0YWNoZWRfY29ubmVjdG9yOworCXN0cnVjdCBkcm1faTkxNV9w
cml2YXRlICppOTE1ID0gZHBfdG9faTkxNShpbnRlbF9kcCk7CisJc3RydWN0IGludGVsX2Nvbm5l
Y3RvciAqY29ubmVjdG9yID0gaW50ZWxfZHAtPmF0dGFjaGVkX2Nvbm5lY3RvcjsKIAlzdHJ1Y3Qg
ZWRpZCAqZWRpZDsKIAogCWludGVsX2RwX3Vuc2V0X2VkaWQoaW50ZWxfZHApOwogCWVkaWQgPSBp
bnRlbF9kcF9nZXRfZWRpZChpbnRlbF9kcCk7Ci0JaW50ZWxfY29ubmVjdG9yLT5kZXRlY3RfZWRp
ZCA9IGVkaWQ7CisJY29ubmVjdG9yLT5kZXRlY3RfZWRpZCA9IGVkaWQ7CisKKwlpbnRlbF9kcC0+
ZGZwLm1heF9icGMgPQorCQlkcm1fZHBfZG93bnN0cmVhbV9tYXhfYnBjKGludGVsX2RwLT5kcGNk
LAorCQkJCQkgIGludGVsX2RwLT5kb3duc3RyZWFtX3BvcnRzKTsKKworCWRybV9kYmdfa21zKCZp
OTE1LT5kcm0sICJbQ09OTkVDVE9SOiVkOiVzXSBERlAgbWF4IGJwYyAlZFxuIiwKKwkJICAgIGNv
bm5lY3Rvci0+YmFzZS5iYXNlLmlkLCBjb25uZWN0b3ItPmJhc2UubmFtZSwKKwkJICAgIGludGVs
X2RwLT5kZnAubWF4X2JwYyk7CiAKIAlpZiAoZWRpZCAmJiBlZGlkLT5pbnB1dCAmIERSTV9FRElE
X0lOUFVUX0RJR0lUQUwpIHsKIAkJaW50ZWxfZHAtPmhhc19oZG1pX3NpbmsgPSBkcm1fZGV0ZWN0
X2hkbWlfbW9uaXRvcihlZGlkKTsKQEAgLTYwOTAsNiArNjA5OCw4IEBAIGludGVsX2RwX3Vuc2V0
X2VkaWQoc3RydWN0IGludGVsX2RwICppbnRlbF9kcCkKIAlpbnRlbF9kcC0+aGFzX2hkbWlfc2lu
ayA9IGZhbHNlOwogCWludGVsX2RwLT5oYXNfYXVkaW8gPSBmYWxzZTsKIAlpbnRlbF9kcC0+ZWRp
ZF9xdWlya3MgPSAwOworCisJaW50ZWxfZHAtPmRmcC5tYXhfYnBjID0gMDsKIH0KIAogc3RhdGlj
IGludAotLSAKMi4yNi4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
