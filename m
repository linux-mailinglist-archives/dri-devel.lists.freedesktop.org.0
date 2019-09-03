Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1FF8A6E84
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 18:27:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6942089826;
	Tue,  3 Sep 2019 16:27:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E769F89826;
 Tue,  3 Sep 2019 16:27:53 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CA5812343A;
 Tue,  3 Sep 2019 16:27:52 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 087/167] drm/i915: Handle vm_mmap error during
 I915_GEM_MMAP ioctl with WC set
Date: Tue,  3 Sep 2019 12:23:59 -0400
Message-Id: <20190903162519.7136-87-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190903162519.7136-1-sashal@kernel.org>
References: <20190903162519.7136-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1567528073;
 bh=zhVFKvgOVO0h6u6YsHm1erT5jr7By0XHYjeYvoOXFSE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PNHSb3NzwJeamYcfHj4IP9o14jvGmweINJmk5Nh4Uv13qCZox1BVC005DO9Q84Ehp
 qumff+XuQL2ytG1bn60/x7rmHCVVHeAnk69DH5WH2S6toVqEacwE7i4lckMyeD9nvk
 EOSBoGsSkDjnWaiTNCZJ62jF3Hn4PBxyqjNF9jfg=
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
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Adam Zabrocki <adamza@microsoft.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSm9vbmFzIExhaHRpbmVuIDxqb29uYXMubGFodGluZW5AbGludXguaW50ZWwuY29tPgoK
WyBVcHN0cmVhbSBjb21taXQgZWJmYjY5Nzc4MDFkYTUyMWQ4ZDVkNzUyZDM3M2ExODdlMmEyYjli
MyBdCgpBZGQgZXJyIGdvdG8gbGFiZWwgYW5kIHVzZSBpdCB3aGVuIFZNQSBjYW4ndCBiZSBlc3Rh
Ymxpc2hlZCBvciBjaGFuZ2VzCnVuZGVybmVhdGguCgp2MjoKLSBEcm9wcGluZyBGaXhlczogYXMg
aXQncyBpbmRlZWQgaW1wb3NzaWJsZSB0byByYWNlIGFuIG9iamVjdCB0byB0aGUKICBlcnJvciBh
ZGRyZXNzLiAoQ2hyaXMpCnYzOgotIFVzZSBJU19FUlJfVkFMVUUgKENocmlzKQoKUmVwb3J0ZWQt
Ynk6IEFkYW0gWmFicm9ja2kgPGFkYW16YUBtaWNyb3NvZnQuY29tPgpTaWduZWQtb2ZmLWJ5OiBK
b29uYXMgTGFodGluZW4gPGpvb25hcy5sYWh0aW5lbkBsaW51eC5pbnRlbC5jb20+CkNjOiBDaHJp
cyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KQ2M6IFR2cnRrbyBVcnN1bGluIDx0
dnJ0a28udXJzdWxpbkBsaW51eC5pbnRlbC5jb20+CkNjOiBBZGFtIFphYnJvY2tpIDxhZGFtemFA
bWljcm9zb2Z0LmNvbT4KUmV2aWV3ZWQtYnk6IFR2cnRrbyBVcnN1bGluIDx0dnJ0a28udXJzdWxp
bkBpbnRlbC5jb20+ICN2MgpSZXZpZXdlZC1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13
aWxzb24uY28udWs+Ckxpbms6IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRj
aC9tc2dpZC8yMDE5MDIwNzA4NTQ1NC4xMDU5OC0yLWpvb25hcy5sYWh0aW5lbkBsaW51eC5pbnRl
bC5jb20KU2lnbmVkLW9mZi1ieTogU2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwub3JnPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZ2VtLmMgfCAxMiArKysrKysrKysrLS0KIDEgZmls
ZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZ2VtLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9p
OTE1X2dlbS5jCmluZGV4IGU4MWFiZDQ2OGExNWQuLjk2MzRkM2FkYjhkMDEgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZ2VtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5
MTUvaTkxNV9nZW0uYwpAQCAtMTg4MSw2ICsxODgxLDkgQEAgaTkxNV9nZW1fbW1hcF9pb2N0bChz
dHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRhLAogCWFkZHIgPSB2bV9tbWFwKG9iai0+
YmFzZS5maWxwLCAwLCBhcmdzLT5zaXplLAogCQkgICAgICAgUFJPVF9SRUFEIHwgUFJPVF9XUklU
RSwgTUFQX1NIQVJFRCwKIAkJICAgICAgIGFyZ3MtPm9mZnNldCk7CisJaWYgKElTX0VSUl9WQUxV
RShhZGRyKSkKKwkJZ290byBlcnI7CisKIAlpZiAoYXJncy0+ZmxhZ3MgJiBJOTE1X01NQVBfV0Mp
IHsKIAkJc3RydWN0IG1tX3N0cnVjdCAqbW0gPSBjdXJyZW50LT5tbTsKIAkJc3RydWN0IHZtX2Fy
ZWFfc3RydWN0ICp2bWE7CkBAIC0xODk2LDE3ICsxODk5LDIyIEBAIGk5MTVfZ2VtX21tYXBfaW9j
dGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwKIAkJZWxzZQogCQkJYWRkciA9
IC1FTk9NRU07CiAJCXVwX3dyaXRlKCZtbS0+bW1hcF9zZW0pOworCQlpZiAoSVNfRVJSX1ZBTFVF
KGFkZHIpKQorCQkJZ290byBlcnI7CiAKIAkJLyogVGhpcyBtYXkgcmFjZSwgYnV0IHRoYXQncyBv
aywgaXQgb25seSBnZXRzIHNldCAqLwogCQlXUklURV9PTkNFKG9iai0+ZnJvbnRidWZmZXJfZ2d0
dF9vcmlnaW4sIE9SSUdJTl9DUFUpOwogCX0KIAlpOTE1X2dlbV9vYmplY3RfcHV0KG9iaik7Ci0J
aWYgKElTX0VSUigodm9pZCAqKWFkZHIpKQotCQlyZXR1cm4gYWRkcjsKIAogCWFyZ3MtPmFkZHJf
cHRyID0gKHVpbnQ2NF90KSBhZGRyOwogCiAJcmV0dXJuIDA7CisKK2VycjoKKwlpOTE1X2dlbV9v
YmplY3RfcHV0KG9iaik7CisKKwlyZXR1cm4gYWRkcjsKIH0KIAogc3RhdGljIHVuc2lnbmVkIGlu
dCB0aWxlX3Jvd19wYWdlcyhzdHJ1Y3QgZHJtX2k5MTVfZ2VtX29iamVjdCAqb2JqKQotLSAKMi4y
MC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
