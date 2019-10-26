Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1136EE5ACA
	for <lists+dri-devel@lfdr.de>; Sat, 26 Oct 2019 15:18:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 648286EC25;
	Sat, 26 Oct 2019 13:17:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F2166EC2B
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Oct 2019 13:17:53 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7494D21655;
 Sat, 26 Oct 2019 13:17:52 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.3 62/99] drm/ttm: fix handling in
 ttm_bo_add_mem_to_lru
Date: Sat, 26 Oct 2019 09:15:23 -0400
Message-Id: <20191026131600.2507-62-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191026131600.2507-1-sashal@kernel.org>
References: <20191026131600.2507-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1572095873;
 bh=gE4ymf6zHwL6N+dtVJnaBxxAtY4WkI95AJrq2UqkCYc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=A3XSJwgOR5cZAujC/UTQZrGO0X0ucRYvozAecZYQhbLfkdm0MiFBzhvD1gq+zsKYr
 cLWt/8dY53j8GVJrgZuWaZVrmF8N61Wg4EfmZPUYiRk+JhlOb5pudX15lMkkTxsNxL
 V1yDtDYWNMCBMGa8UEz7tj0KAzKwwP4xDd1Ikh3M=
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
Cc: Sasha Levin <sashal@kernel.org>, Kevin Wang <kevin1.wang@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgoKWyBVcHN0
cmVhbSBjb21taXQgN2ZiYzg5OWRkZWFhOWFhZWYwYmE2NDY1MjkwODkxNDk1NzJjODRlZSBdCgpX
ZSBzaG91bGQgbm90IGFkZCB0aGUgQk8gdG8gdGhlIHN3YXAgTFJVIHdoZW4gdGhlIG5ldyBtZW0g
aXMgZml4ZWQgYW5kCnRoZSBUVE0gb2JqZWN0IGFib3V0IHRvIGJlIGRlc3Ryb3llZC4KClNpZ25l
ZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KUmV2
aWV3ZWQtYnk6IEtldmluIFdhbmcgPGtldmluMS53YW5nQGFtZC5jb20+Ckxpbms6IGh0dHBzOi8v
cGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC8zMzUyNDYvClNpZ25lZC1vZmYtYnk6IFNh
c2hhIExldmluIDxzYXNoYWxAa2VybmVsLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0
bV9iby5jIHwgNSArKystLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jIGIvZHJp
dmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwppbmRleCBjMmRmNzM1YThmODJjLi41ZDJhZTY5ZThi
ZWNjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKQEAgLTE4NCw4ICsxODQsOSBAQCBzdGF0aWMgdm9pZCB0
dG1fYm9fYWRkX21lbV90b19scnUoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywKIAlsaXN0
X2FkZF90YWlsKCZiby0+bHJ1LCAmbWFuLT5scnVbYm8tPnByaW9yaXR5XSk7CiAJa3JlZl9nZXQo
JmJvLT5saXN0X2tyZWYpOwogCi0JaWYgKGJvLT50dG0gJiYgIShiby0+dHRtLT5wYWdlX2ZsYWdz
ICYKLQkJCSAoVFRNX1BBR0VfRkxBR19TRyB8IFRUTV9QQUdFX0ZMQUdfU1dBUFBFRCkpKSB7CisJ
aWYgKCEobWFuLT5mbGFncyAmIFRUTV9NRU1UWVBFX0ZMQUdfRklYRUQpICYmIGJvLT50dG0gJiYK
KwkgICAgIShiby0+dHRtLT5wYWdlX2ZsYWdzICYgKFRUTV9QQUdFX0ZMQUdfU0cgfAorCQkJCSAg
ICAgVFRNX1BBR0VfRkxBR19TV0FQUEVEKSkpIHsKIAkJbGlzdF9hZGRfdGFpbCgmYm8tPnN3YXAs
ICZiZGV2LT5nbG9iLT5zd2FwX2xydVtiby0+cHJpb3JpdHldKTsKIAkJa3JlZl9nZXQoJmJvLT5s
aXN0X2tyZWYpOwogCX0KLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
