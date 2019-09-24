Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D64BCBCD10
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 18:46:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06EA56EA7D;
	Tue, 24 Sep 2019 16:46:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F06946EA7D
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2019 16:45:57 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1855121841;
 Tue, 24 Sep 2019 16:45:57 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 04/70] drm/kms: Catch mode_object lifetime errors
Date: Tue, 24 Sep 2019 12:44:43 -0400
Message-Id: <20190924164549.27058-4-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190924164549.27058-1-sashal@kernel.org>
References: <20190924164549.27058-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1569343557;
 bh=uD15yigGFhyGR5IIx6WLQqFgjgO0kS+RM+hAcqBqlwU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=wJbygNum0wrODAPypaMOm93yVbJUT0BF1C0DRaoUDPe3zDYMHNUfIDJerhVDhZZZ0
 yn1osRBMGUNlUeFzmVosHHnhLjG1KcPk3uqLvi1/PQnqhnBw+L8V8SqzHtuBSvVPGt
 2yhUdxA6FaVM2ypFDxS+52nOrWScEbSVs+0pp55Q=
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
Cc: Sasha Levin <sashal@kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KClsgVXBzdHJlYW0g
Y29tbWl0IDRmNTM2OGI1NTQxYTkwMmY2NTk2NTU4YjA1ZjVjMjFhOTc3MGRkMzIgXQoKT25seSBk
eW5hbWljIG1vZGUgb2JqZWN0cywgaS5lLiB0aG9zZSB3aGljaCBhcmUgcmVmY291bnRlZCBhbmQg
aGF2ZSBhIGZyZWUKY2FsbGJhY2ssIGNhbiBiZSBhZGRlZCB3aGlsZSB0aGUgb3ZlcmFsbCBkcm1f
ZGV2aWNlIGlzIHZpc2libGUgdG8KdXNlcnNwYWNlLiBBbGwgb3RoZXJzIG11c3QgYmUgYWRkZWQg
YmVmb3JlIGRybV9kZXZfcmVnaXN0ZXIgYW5kCnJlbW92ZWQgYWZ0ZXIgZHJtX2Rldl91bnJlZ2lz
dGVyLgoKU21hbGwgaXNzdWUgYXJvdW5kIGRyaXZlcnMgc3RpbGwgdXNpbmcgdGhlIGxvYWQvdW5s
b2FkIGNhbGxiYWNrcywgd2UKbmVlZCB0byBtYWtlIHN1cmUgd2Ugc2V0IGRldi0+cmVnaXN0ZXJl
ZCBzbyB0aGF0IGxvYWQvdW5sb2FkIGNvZGUgaW4KdGhlc2UgY2FsbGJhY2tzIGRvZXNuJ3QgdHJp
Z2dlciBmYWxzZSB3YXJuaW5ncy4gT25seSBhIHNtYWxsCmFkanVzdGVtZW50IGluIGRybV9kZXZf
cmVnaXN0ZXIgd2FzIG5lZWRlZC4KCk1vdGl2YXRlZCBieSBzb21lIGlyYyBkaXNjdXNzaW9ucyBh
Ym91dCBvYmplY3QgaWRzIG9mIGR5bmFtaWMgb2JqZWN0cwpsaWtlIGJsb2JzIGJlY29tZSBpbnZh
bGlkLCBhbmQgbWUgZ29pbmcgb24gYSBiaXQgYW4gYXVkaXQgc3ByZWUuCgpSZXZpZXdlZC1ieTog
U2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+ClNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIg
PGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgpMaW5rOiBodHRwczovL3BhdGNod29yay5mcmVlZGVz
a3RvcC5vcmcvcGF0Y2gvbXNnaWQvMjAxOTA2MTQwNjE3MjMuMTE3My0xLWRhbmllbC52ZXR0ZXJA
ZmZ3bGwuY2gKU2lnbmVkLW9mZi1ieTogU2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwub3JnPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHJ2LmMgICAgICAgICB8IDQgKystLQogZHJpdmVycy9n
cHUvZHJtL2RybV9tb2RlX29iamVjdC5jIHwgNCArKysrCiAyIGZpbGVzIGNoYW5nZWQsIDYgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcnYuYwppbmRleCA4NjI2MjE0OTRhOTNl
Li42YTY1MWJmNTQwYjNiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2Rydi5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHJ2LmMKQEAgLTk4NywxNCArOTg3LDE0IEBAIGludCBk
cm1fZGV2X3JlZ2lzdGVyKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHVuc2lnbmVkIGxvbmcgZmxh
Z3MpCiAJaWYgKHJldCkKIAkJZ290byBlcnJfbWlub3JzOwogCi0JZGV2LT5yZWdpc3RlcmVkID0g
dHJ1ZTsKLQogCWlmIChkZXYtPmRyaXZlci0+bG9hZCkgewogCQlyZXQgPSBkZXYtPmRyaXZlci0+
bG9hZChkZXYsIGZsYWdzKTsKIAkJaWYgKHJldCkKIAkJCWdvdG8gZXJyX21pbm9yczsKIAl9CiAK
KwlkZXYtPnJlZ2lzdGVyZWQgPSB0cnVlOworCiAJaWYgKGRybV9jb3JlX2NoZWNrX2ZlYXR1cmUo
ZGV2LCBEUklWRVJfTU9ERVNFVCkpCiAJCWRybV9tb2Rlc2V0X3JlZ2lzdGVyX2FsbChkZXYpOwog
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVfb2JqZWN0LmMgYi9kcml2ZXJz
L2dwdS9kcm0vZHJtX21vZGVfb2JqZWN0LmMKaW5kZXggZjMyNTA3ZTY1Yjc5NC4uN2YyOTFmODgx
NTZmYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9tb2RlX29iamVjdC5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9kcm1fbW9kZV9vYmplY3QuYwpAQCAtMzcsNiArMzcsOCBAQCBpbnQg
X19kcm1fbW9kZV9vYmplY3RfYWRkKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHN0cnVjdCBkcm1f
bW9kZV9vYmplY3QgKm9iaiwKIHsKIAlpbnQgcmV0OwogCisJV0FSTl9PTihkZXYtPnJlZ2lzdGVy
ZWQgJiYgIW9ial9mcmVlX2NiKTsKKwogCW11dGV4X2xvY2soJmRldi0+bW9kZV9jb25maWcuaWRy
X211dGV4KTsKIAlyZXQgPSBpZHJfYWxsb2MoJmRldi0+bW9kZV9jb25maWcub2JqZWN0X2lkciwg
cmVnaXN0ZXJfb2JqID8gb2JqIDogTlVMTCwKIAkJCTEsIDAsIEdGUF9LRVJORUwpOwpAQCAtOTcs
NiArOTksOCBAQCB2b2lkIGRybV9tb2RlX29iamVjdF9yZWdpc3RlcihzdHJ1Y3QgZHJtX2Rldmlj
ZSAqZGV2LAogdm9pZCBkcm1fbW9kZV9vYmplY3RfdW5yZWdpc3RlcihzdHJ1Y3QgZHJtX2Rldmlj
ZSAqZGV2LAogCQkJCXN0cnVjdCBkcm1fbW9kZV9vYmplY3QgKm9iamVjdCkKIHsKKwlXQVJOX09O
KGRldi0+cmVnaXN0ZXJlZCAmJiAhb2JqZWN0LT5mcmVlX2NiKTsKKwogCW11dGV4X2xvY2soJmRl
di0+bW9kZV9jb25maWcuaWRyX211dGV4KTsKIAlpZiAob2JqZWN0LT5pZCkgewogCQlpZHJfcmVt
b3ZlKCZkZXYtPm1vZGVfY29uZmlnLm9iamVjdF9pZHIsIG9iamVjdC0+aWQpOwotLSAKMi4yMC4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
