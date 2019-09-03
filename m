Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3C5A6E5E
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 18:26:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B577989801;
	Tue,  3 Sep 2019 16:26:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 188D1894DC;
 Tue,  3 Sep 2019 16:26:19 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3B02C238CE;
 Tue,  3 Sep 2019 16:26:18 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 034/167] drm/i915: Cleanup gt powerstate from gem
Date: Tue,  3 Sep 2019 12:23:06 -0400
Message-Id: <20190903162519.7136-34-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190903162519.7136-1-sashal@kernel.org>
References: <20190903162519.7136-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1567527979;
 bh=eK+L9MGfvPLzftIEDXerbgiNvYTvBEHJUW/ZcohqNQI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=0aYXvjI637FZDGFn+OUoO1heyMML8XpiH82IRX6SFiWP2VExCSySFfJLNwlAU3x9M
 9DqHBhSR0Evu5NeljLb+eX2QH5nrY/HvEUch3CkUMQ6PxipQI4Wolx7tVXdPvCVztS
 7/DtvTmi6ivZMFj+fLVukkJUpeSBJu8dR+Wr+H5w=
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
Cc: Sasha Levin <sashal@kernel.org>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+CgpbIFVwc3RyZWFt
IGNvbW1pdCAzMGI3MTA4NDBlNGI5Yzk2OTlkM2Q0YjMzZmIxOWFkODg4MGQ0NjE0IF0KClNpbmNl
IHRoZSBndCBwb3dlcnN0YXRlIGlzIGFsbG9jYXRlZCBieSBpOTE1X2dlbV9pbml0LCBjbGVhbiBp
dCBmcm9tCmk5MTVfZ2VtX2ZpbmkgZm9yIHN5bW1ldHJ5IGFuZCB0byBjb3JyZWN0IHRoZSBpbWJh
bGFuY2Ugb24gZXJyb3IuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlz
LXdpbHNvbi5jby51az4KUmV2aWV3ZWQtYnk6IE1pa2EgS3VvcHBhbGEgPG1pa2Eua3VvcHBhbGFA
bGludXguaW50ZWwuY29tPgpMaW5rOiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcv
cGF0Y2gvbXNnaWQvMjAxODA4MTIyMjM2NDIuMjQ4NjUtMS1jaHJpc0BjaHJpcy13aWxzb24uY28u
dWsKU2lnbmVkLW9mZi1ieTogU2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwub3JnPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZ2VtLmMgICAgICB8IDMgKysrCiBkcml2ZXJzL2dwdS9k
cm0vaTkxNS9pbnRlbF9kaXNwbGF5LmMgfCA0IC0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNl
cnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2k5MTVfZ2VtLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2dlbS5jCmluZGV4IDUw
MTlkZmQ4YmNmMTYuLmU4MWFiZDQ2OGExNWQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2k5MTVfZ2VtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9nZW0uYwpAQCAt
NTYyNCw2ICs1NjI0LDcgQEAgaW50IGk5MTVfZ2VtX2luaXQoc3RydWN0IGRybV9pOTE1X3ByaXZh
dGUgKmRldl9wcml2KQogdm9pZCBpOTE1X2dlbV9maW5pKHN0cnVjdCBkcm1faTkxNV9wcml2YXRl
ICpkZXZfcHJpdikKIHsKIAlpOTE1X2dlbV9zdXNwZW5kX2xhdGUoZGV2X3ByaXYpOworCWludGVs
X2Rpc2FibGVfZ3RfcG93ZXJzYXZlKGRldl9wcml2KTsKIAogCS8qIEZsdXNoIGFueSBvdXRzdGFu
ZGluZyB1bnBpbl93b3JrLiAqLwogCWk5MTVfZ2VtX2RyYWluX3dvcmtxdWV1ZShkZXZfcHJpdik7
CkBAIC01NjM1LDYgKzU2MzYsOCBAQCB2b2lkIGk5MTVfZ2VtX2Zpbmkoc3RydWN0IGRybV9pOTE1
X3ByaXZhdGUgKmRldl9wcml2KQogCWk5MTVfZ2VtX2NvbnRleHRzX2ZpbmkoZGV2X3ByaXYpOwog
CW11dGV4X3VubG9jaygmZGV2X3ByaXYtPmRybS5zdHJ1Y3RfbXV0ZXgpOwogCisJaW50ZWxfY2xl
YW51cF9ndF9wb3dlcnNhdmUoZGV2X3ByaXYpOworCiAJaW50ZWxfdWNfZmluaV9taXNjKGRldl9w
cml2KTsKIAlpOTE1X2dlbV9jbGVhbnVwX3VzZXJwdHIoZGV2X3ByaXYpOwogCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9kaXNwbGF5LmMgYi9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9pbnRlbF9kaXNwbGF5LmMKaW5kZXggMjYyMmRmYzdkMmQ5YS4uNjkwMmZkMmRhMTljYSAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfZGlzcGxheS5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX2Rpc3BsYXkuYwpAQCAtMTU5NzIsOCArMTU5NzIsNiBA
QCB2b2lkIGludGVsX21vZGVzZXRfY2xlYW51cChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQogCWZs
dXNoX3dvcmsoJmRldl9wcml2LT5hdG9taWNfaGVscGVyLmZyZWVfd29yayk7CiAJV0FSTl9PTigh
bGxpc3RfZW1wdHkoJmRldl9wcml2LT5hdG9taWNfaGVscGVyLmZyZWVfbGlzdCkpOwogCi0JaW50
ZWxfZGlzYWJsZV9ndF9wb3dlcnNhdmUoZGV2X3ByaXYpOwotCiAJLyoKIAkgKiBJbnRlcnJ1cHRz
IGFuZCBwb2xsaW5nIGFzIHRoZSBmaXJzdCB0aGluZyB0byBhdm9pZCBjcmVhdGluZyBoYXZvYy4K
IAkgKiBUb28gbXVjaCBzdHVmZiBoZXJlICh0dXJuaW5nIG9mIGNvbm5lY3RvcnMsIC4uLikgd291
bGQKQEAgLTE2MDAxLDggKzE1OTk5LDYgQEAgdm9pZCBpbnRlbF9tb2Rlc2V0X2NsZWFudXAoc3Ry
dWN0IGRybV9kZXZpY2UgKmRldikKIAogCWludGVsX2NsZWFudXBfb3ZlcmxheShkZXZfcHJpdik7
CiAKLQlpbnRlbF9jbGVhbnVwX2d0X3Bvd2Vyc2F2ZShkZXZfcHJpdik7Ci0KIAlpbnRlbF90ZWFy
ZG93bl9nbWJ1cyhkZXZfcHJpdik7CiAKIAlkZXN0cm95X3dvcmtxdWV1ZShkZXZfcHJpdi0+bW9k
ZXNldF93cSk7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
