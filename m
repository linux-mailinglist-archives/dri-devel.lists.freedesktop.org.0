Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6ECA6E87
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 18:28:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4333189852;
	Tue,  3 Sep 2019 16:27:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CFA489852;
 Tue,  3 Sep 2019 16:27:55 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3807E215EA;
 Tue,  3 Sep 2019 16:27:54 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 088/167] drm/i915: Sanity check mmap length
 against object size
Date: Tue,  3 Sep 2019 12:24:00 -0400
Message-Id: <20190903162519.7136-88-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190903162519.7136-1-sashal@kernel.org>
References: <20190903162519.7136-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1567528075;
 bh=f21eev754077QISDuWAvVBzwWnDaFeAJ0E93al3vANs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=zojX9ZH0xnYZ5SDBNLLQzHJNR2IsYgaEEQkKgrKXQvZsmyeXbArkcbmkJPBoEu43e
 dNL3fNnKOj64ooBJjp9WrbwUaLlQ3yUJMsWzwZtJbfzTN5v1yY7tgOK3KpU+wB1PyH
 XJfI85WlRWRV6Ou9Js2vBs2XSAd4MpWrbsDgfUU8=
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
Cc: Sasha Levin <sashal@kernel.org>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 intel-gfx@lists.freedesktop.org,
 Antonio Argenziano <antonio.argenziano@intel.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+CgpbIFVwc3RyZWFt
IGNvbW1pdCAwMDBjNGY5MGUzZjAxOTRlZWYyMThmZjJjNmE4ZmQ4Y2ExZGU0MzEzIF0KCldlIGFz
c3VtZWQgdGhhdCB2bV9tbWFwKCkgd291bGQgcmVqZWN0IGFuIGF0dGVtcHQgdG8gbW1hcCBwYXN0
IHRoZSBlbmQgb2YKdGhlIGZpbHAgKG91ciBvYmplY3QpLCBidXQgd2Ugd2VyZSB3cm9uZy4KCkFw
cGxpY2F0aW9ucyB0aGF0IHRyaWVkIHRvIHVzZSB0aGUgbW1hcCBiZXlvbmQgdGhlIGVuZCBvZiB0
aGUgb2JqZWN0CndvdWxkIGJlIGdyZWV0ZWQgYnkgYSBTSUdCVVMuIEFmdGVyIHRoaXMgcGF0Y2gs
IHRob3NlIGFwcGxpY2F0aW9ucyB3aWxsCmJlIHRvbGQgYWJvdXQgdGhlIGVycm9yIG9uIGNyZWF0
aW5nIHRoZSBtbWFwLCByYXRoZXIgdGhhbiBhdCBhIHJhbmRvbQptb21lbnQgb24gbGF0ZXIgYWNj
ZXNzLgoKUmVwb3J0ZWQtYnk6IEFudG9uaW8gQXJnZW56aWFubyA8YW50b25pby5hcmdlbnppYW5v
QGludGVsLmNvbT4KVGVzdGNhc2U6IGlndC9nZW1fbW1hcC9iYWQtc2l6ZQpTaWduZWQtb2ZmLWJ5
OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KQ2M6IEFudG9uaW8gQXJn
ZW56aWFubyA8YW50b25pby5hcmdlbnppYW5vQGludGVsLmNvbT4KQ2M6IEpvb25hcyBMYWh0aW5l
biA8am9vbmFzLmxhaHRpbmVuQGxpbnV4LmludGVsLmNvbT4KQ2M6IFR2cnRrbyBVcnN1bGluIDx0
dnJ0a28udXJzdWxpbkBpbnRlbC5jb20+CkNjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnClJldmll
d2VkLWJ5OiBUdnJ0a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgpSZXZpZXdl
ZC1ieTogSm9vbmFzIExhaHRpbmVuIDxqb29uYXMubGFodGluZW5AbGludXguaW50ZWwuY29tPgpM
aW5rOiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvbXNnaWQvMjAxOTAz
MTQwNzU4MjkuMTY4MzgtMS1jaHJpc0BjaHJpcy13aWxzb24uY28udWsKKGNoZXJyeSBwaWNrZWQg
ZnJvbSBjb21taXQgNzk0YTExY2I2NzIwMWFkMWJiNjFhZjUxMGJiODQ2MDI4MGZlYjNmMykKU2ln
bmVkLW9mZi1ieTogUm9kcmlnbyBWaXZpIDxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPgpTaWduZWQt
b2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2k5MTUvaTkxNV9nZW0uYyB8IDE1ICsrKysrKysrKy0tLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDkgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9pOTE1X2dlbS5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9nZW0uYwpp
bmRleCA5NjM0ZDNhZGI4ZDAxLi45MzcyODc3MTAwNDIwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9pOTE1X2dlbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZ2Vt
LmMKQEAgLTE4NzQsOCArMTg3NCwxMyBAQCBpOTE1X2dlbV9tbWFwX2lvY3RsKHN0cnVjdCBkcm1f
ZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsCiAJICogcGFnZXMgZnJvbS4KIAkgKi8KIAlpZiAoIW9i
ai0+YmFzZS5maWxwKSB7Ci0JCWk5MTVfZ2VtX29iamVjdF9wdXQob2JqKTsKLQkJcmV0dXJuIC1F
TlhJTzsKKwkJYWRkciA9IC1FTlhJTzsKKwkJZ290byBlcnI7CisJfQorCisJaWYgKHJhbmdlX292
ZXJmbG93cyhhcmdzLT5vZmZzZXQsIGFyZ3MtPnNpemUsICh1NjQpb2JqLT5iYXNlLnNpemUpKSB7
CisJCWFkZHIgPSAtRUlOVkFMOworCQlnb3RvIGVycjsKIAl9CiAKIAlhZGRyID0gdm1fbW1hcChv
YmotPmJhc2UuZmlscCwgMCwgYXJncy0+c2l6ZSwKQEAgLTE4ODksOCArMTg5NCw4IEBAIGk5MTVf
Z2VtX21tYXBfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwKIAkJc3Ry
dWN0IHZtX2FyZWFfc3RydWN0ICp2bWE7CiAKIAkJaWYgKGRvd25fd3JpdGVfa2lsbGFibGUoJm1t
LT5tbWFwX3NlbSkpIHsKLQkJCWk5MTVfZ2VtX29iamVjdF9wdXQob2JqKTsKLQkJCXJldHVybiAt
RUlOVFI7CisJCQlhZGRyID0gLUVJTlRSOworCQkJZ290byBlcnI7CiAJCX0KIAkJdm1hID0gZmlu
ZF92bWEobW0sIGFkZHIpOwogCQlpZiAodm1hICYmIF9fdm1hX21hdGNoZXModm1hLCBvYmotPmJh
c2UuZmlscCwgYWRkciwgYXJncy0+c2l6ZSkpCkBAIC0xOTA4LDEyICsxOTEzLDEwIEBAIGk5MTVf
Z2VtX21tYXBfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwKIAlpOTE1
X2dlbV9vYmplY3RfcHV0KG9iaik7CiAKIAlhcmdzLT5hZGRyX3B0ciA9ICh1aW50NjRfdCkgYWRk
cjsKLQogCXJldHVybiAwOwogCiBlcnI6CiAJaTkxNV9nZW1fb2JqZWN0X3B1dChvYmopOwotCiAJ
cmV0dXJuIGFkZHI7CiB9CiAKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
