Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDB216501C
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 21:36:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4345A6ECB5;
	Wed, 19 Feb 2020 20:36:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1E8B6ECB3;
 Wed, 19 Feb 2020 20:36:26 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Feb 2020 12:36:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,461,1574150400"; d="scan'208";a="224621211"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga007.jf.intel.com with SMTP; 19 Feb 2020 12:36:23 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 19 Feb 2020 22:36:23 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 10/12] drm: Flatten drm_mode_vrefresh()
Date: Wed, 19 Feb 2020 22:35:42 +0200
Message-Id: <20200219203544.31013-11-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200219203544.31013-1-ville.syrjala@linux.intel.com>
References: <20200219203544.31013-1-ville.syrjala@linux.intel.com>
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClJl
bW92ZSB0aGUgcG9pbnRsZXNzIHdob2xlLWZ1bmN0aW9uIGluZGVudGF0aW9uLiBBbHNvIGRvbid0
Cm5lZWQgdG8gd29ycnkgYWJvdXQgbmVnYXRpdmUgdmFsdWVzIGFueW1vcmUgc2luY2Ugd2Ugc3dp
dGNoZWQKZXZlcnl0aGluZyB0byB1MTYuCgpTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6Qg
PHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1f
bW9kZXMuYyB8IDI2ICsrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwg
MTIgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2RybV9tb2Rlcy5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9tb2Rlcy5jCmluZGV4IGNj
OWZjNTJmOWY3Yy4uZDIwYTI3M2I0YjlhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJt
X21vZGVzLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9tb2Rlcy5jCkBAIC03NzMsMjQgKzc3
MywyMiBAQCBFWFBPUlRfU1lNQk9MKGRybV9tb2RlX2hzeW5jKTsKICAqLwogaW50IGRybV9tb2Rl
X3ZyZWZyZXNoKGNvbnN0IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICptb2RlKQogewotCWludCBy
ZWZyZXNoID0gMDsKKwl1bnNpZ25lZCBpbnQgbnVtLCBkZW47CiAKLQlpZiAobW9kZS0+aHRvdGFs
ID4gMCAmJiBtb2RlLT52dG90YWwgPiAwKSB7Ci0JCXVuc2lnbmVkIGludCBudW0sIGRlbjsKKwlp
ZiAobW9kZS0+aHRvdGFsID09IDAgfHwgbW9kZS0+dnRvdGFsID09IDApCisJCXJldHVybiAwOwog
Ci0JCW51bSA9IG1vZGUtPmNsb2NrICogMTAwMDsKLQkJZGVuID0gbW9kZS0+aHRvdGFsICogbW9k
ZS0+dnRvdGFsOworCW51bSA9IG1vZGUtPmNsb2NrICogMTAwMDsKKwlkZW4gPSBtb2RlLT5odG90
YWwgKiBtb2RlLT52dG90YWw7CiAKLQkJaWYgKG1vZGUtPmZsYWdzICYgRFJNX01PREVfRkxBR19J
TlRFUkxBQ0UpCi0JCQludW0gKj0gMjsKLQkJaWYgKG1vZGUtPmZsYWdzICYgRFJNX01PREVfRkxB
R19EQkxTQ0FOKQotCQkJZGVuICo9IDI7Ci0JCWlmIChtb2RlLT52c2NhbiA+IDEpCi0JCQlkZW4g
Kj0gbW9kZS0+dnNjYW47CisJaWYgKG1vZGUtPmZsYWdzICYgRFJNX01PREVfRkxBR19JTlRFUkxB
Q0UpCisJCW51bSAqPSAyOworCWlmIChtb2RlLT5mbGFncyAmIERSTV9NT0RFX0ZMQUdfREJMU0NB
TikKKwkJZGVuICo9IDI7CisJaWYgKG1vZGUtPnZzY2FuID4gMSkKKwkJZGVuICo9IG1vZGUtPnZz
Y2FuOwogCi0JCXJlZnJlc2ggPSBESVZfUk9VTkRfQ0xPU0VTVChudW0sIGRlbik7Ci0JfQotCXJl
dHVybiByZWZyZXNoOworCXJldHVybiBESVZfUk9VTkRfQ0xPU0VTVChudW0sIGRlbik7CiB9CiBF
WFBPUlRfU1lNQk9MKGRybV9tb2RlX3ZyZWZyZXNoKTsKIAotLSAKMi4yNC4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
