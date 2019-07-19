Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3FA6D9BA
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 05:58:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4B986E4AE;
	Fri, 19 Jul 2019 03:57:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6E226E4AF;
 Fri, 19 Jul 2019 03:57:55 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B2FD92184E;
 Fri, 19 Jul 2019 03:57:54 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 027/171] drm/amdkfd: Fix a potential memory leak
Date: Thu, 18 Jul 2019 23:54:18 -0400
Message-Id: <20190719035643.14300-27-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190719035643.14300-1-sashal@kernel.org>
References: <20190719035643.14300-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1563508675;
 bh=teggvQp7PWhRrkJMsK/tso+6YAghi15Fw5s2In74K+w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=N9COdVf0Hd9WaT0PYoM7xHc2/B4FxwrPC6Rwp19SwdXktEmWe5CDE+Ibgvmf+zUmk
 rK6Cu4b1V+gX7D+rYNU3GOvF+nmBtc10C5ervaXOVRdk/o9U2yMOu1lw0OjNoGBAmv
 ZfGYNLAj99xH+Iz3IFK9GAkC0cVvBWGPezYekdFY=
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
Cc: Sasha Levin <sashal@kernel.org>, Felix Kuehling <Felix.Kuehling@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Oak Zeng <ozeng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogT2FrIFplbmcgPG96ZW5nQGFtZC5jb20+CgpbIFVwc3RyZWFtIGNvbW1pdCBlNzMzOTBk
MTgxMTAzYTE5ZTExMTFlYzJmMjU1NTlhMDU3MGU5ZmUwIF0KCkZyZWUgbXFkX21lbV9vYmogaXQg
R1RUIGJ1ZmZlciBhbGxvY2F0aW9uIGZvciBNUUQrY29udHJvbCBzdGFjayBmYWlscy4KClNpZ25l
ZC1vZmYtYnk6IE9hayBaZW5nIDxvemVuZ0BhbWQuY29tPgpSZXZpZXdlZC1ieTogRmVsaXggS3Vl
aGxpbmcgPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEZlbGl4IEt1ZWhs
aW5nIDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIg
PGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IFNhc2hhIExldmluIDxz
YXNoYWxAa2VybmVsLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfbXFk
X21hbmFnZXJfdjkuYyB8IDUgKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9r
ZmRfbXFkX21hbmFnZXJfdjkuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9tcWRf
bWFuYWdlcl92OS5jCmluZGV4IDlkYmJhNjA5NDUwZS4uOGZlNzRiODIxYjMyIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfbXFkX21hbmFnZXJfdjkuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfbXFkX21hbmFnZXJfdjkuYwpAQCAtNzYsNiAr
NzYsNyBAQCBzdGF0aWMgaW50IGluaXRfbXFkKHN0cnVjdCBtcWRfbWFuYWdlciAqbW0sIHZvaWQg
KiptcWQsCiAJc3RydWN0IHY5X21xZCAqbTsKIAlzdHJ1Y3Qga2ZkX2RldiAqa2ZkID0gbW0tPmRl
djsKIAorCSptcWRfbWVtX29iaiA9IE5VTEw7CiAJLyogRnJvbSBWOSwgIGZvciBDV1NSLCB0aGUg
Y29udHJvbCBzdGFjayBpcyBsb2NhdGVkIG9uIHRoZSBuZXh0IHBhZ2UKIAkgKiBib3VuZGFyeSBh
ZnRlciB0aGUgbXFkLCB3ZSB3aWxsIHVzZSB0aGUgZ3R0IGFsbG9jYXRpb24gZnVuY3Rpb24KIAkg
KiBpbnN0ZWFkIG9mIHN1Yi1hbGxvY2F0aW9uIGZ1bmN0aW9uLgpAQCAtOTMsOCArOTQsMTAgQEAg
c3RhdGljIGludCBpbml0X21xZChzdHJ1Y3QgbXFkX21hbmFnZXIgKm1tLCB2b2lkICoqbXFkLAog
CX0gZWxzZQogCQlyZXR2YWwgPSBrZmRfZ3R0X3NhX2FsbG9jYXRlKG1tLT5kZXYsIHNpemVvZihz
dHJ1Y3QgdjlfbXFkKSwKIAkJCQltcWRfbWVtX29iaik7Ci0JaWYgKHJldHZhbCAhPSAwKQorCWlm
IChyZXR2YWwpIHsKKwkJa2ZyZWUoKm1xZF9tZW1fb2JqKTsKIAkJcmV0dXJuIC1FTk9NRU07CisJ
fQogCiAJbSA9IChzdHJ1Y3QgdjlfbXFkICopICgqbXFkX21lbV9vYmopLT5jcHVfcHRyOwogCWFk
ZHIgPSAoKm1xZF9tZW1fb2JqKS0+Z3B1X2FkZHI7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
