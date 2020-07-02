Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC3E2117AC
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 03:23:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E067F6E50C;
	Thu,  2 Jul 2020 01:23:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8464C6E50C
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 01:23:03 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8AAAA20874;
 Thu,  2 Jul 2020 01:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593652982;
 bh=H6E1ErTHKdU8VDL/lt494z9m+g1stL2ziOwVXwpMVPw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RsBmcNxWvcFx8Qd0eTxU8HcHpfbmrYWP3whfaXxMqJJgJ/fIVfN4kC5Vr8OjHGNI7
 8v5eCp5xz1u9XkDTBf34C1IvnEhRySFyBksWYTJf9cLV1A6IK+qGgDjNdKARoB0bnx
 C6g3FlX7XZ9dxdLqx5fQ05/xOz5esjdVUEQCnXh8=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.7 06/53] drm/ttm: Fix dma_fence refcnt leak in
 ttm_bo_vm_fault_reserved
Date: Wed,  1 Jul 2020 21:21:15 -0400
Message-Id: <20200702012202.2700645-6-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200702012202.2700645-1-sashal@kernel.org>
References: <20200702012202.2700645-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Xin Tan <tanxin.ctf@gmail.com>,
 Xiyu Yang <xiyuyang19@fudan.edu.cn>, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogWGl5dSBZYW5nIDx4aXl1eWFuZzE5QGZ1ZGFuLmVkdS5jbj4KClsgVXBzdHJlYW0gY29t
bWl0IDM3Y2M0Yjk1ZDEzZjMxMWMwNGFhOGU5ZGFhY2NhMzkwNWFkNDVjYTcgXQoKdHRtX2JvX3Zt
X2ZhdWx0X3Jlc2VydmVkKCkgaW52b2tlcyBkbWFfZmVuY2VfZ2V0KCksIHdoaWNoIHJldHVybnMg
YQpyZWZlcmVuY2Ugb2YgdGhlIHNwZWNpZmllZCBkbWFfZmVuY2Ugb2JqZWN0IHRvICJtb3Zpbmci
IHdpdGggaW5jcmVhc2VkCnJlZmNudC4KCldoZW4gdHRtX2JvX3ZtX2ZhdWx0X3Jlc2VydmVkKCkg
cmV0dXJucywgbG9jYWwgdmFyaWFibGUgIm1vdmluZyIgYmVjb21lcwppbnZhbGlkLCBzbyB0aGUg
cmVmY291bnQgc2hvdWxkIGJlIGRlY3JlYXNlZCB0byBrZWVwIHJlZmNvdW50IGJhbGFuY2VkLgoK
VGhlIHJlZmVyZW5jZSBjb3VudGluZyBpc3N1ZSBoYXBwZW5zIGluIHNldmVyYWwgZXhjZXB0aW9u
IGhhbmRsaW5nIHBhdGhzCm9mIHR0bV9ib192bV9mYXVsdF9yZXNlcnZlZCgpLiBXaGVuIHRob3Nl
IGVycm9yIHNjZW5hcmlvcyBvY2N1ciBzdWNoIGFzCiJlcnIiIGVxdWFscyB0byAtRUJVU1ksIHRo
ZSBmdW5jdGlvbiBmb3JnZXRzIHRvIGRlY3JlYXNlIHRoZSByZWZjbnQKaW5jcmVhc2VkIGJ5IGRt
YV9mZW5jZV9nZXQoKSwgY2F1c2luZyBhIHJlZmNudCBsZWFrLgoKRml4IHRoaXMgaXNzdWUgYnkg
Y2FsbGluZyBkbWFfZmVuY2VfcHV0KCkgd2hlbiBub193YWl0X2dwdSBmbGFnIGlzCmVxdWFscyB0
byB0cnVlLgoKU2lnbmVkLW9mZi1ieTogWGl5dSBZYW5nIDx4aXl1eWFuZzE5QGZ1ZGFuLmVkdS5j
bj4KU2lnbmVkLW9mZi1ieTogWGluIFRhbiA8dGFueGluLmN0ZkBnbWFpbC5jb20+ClJldmlld2Vk
LWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Ckxpbms6IGh0
dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC8zNzAyMTkvClNpZ25lZC1vZmYt
Ynk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KU2lnbmVkLW9m
Zi1ieTogU2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS90dG0vdHRtX2JvX3ZtLmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdm0uYyBiL2RyaXZlcnMv
Z3B1L2RybS90dG0vdHRtX2JvX3ZtLmMKaW5kZXggMGFkMzBiMTEyOTgyMS4uNzIxMDBiODRjN2E5
MCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdm0uYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib192bS5jCkBAIC0zMDAsOCArMzAwLDEwIEBAIHZtX2ZhdWx0
X3QgdHRtX2JvX3ZtX2ZhdWx0X3Jlc2VydmVkKHN0cnVjdCB2bV9mYXVsdCAqdm1mLAogCQkJYnJl
YWs7CiAJCWNhc2UgLUVCVVNZOgogCQljYXNlIC1FUkVTVEFSVFNZUzoKKwkJCWRtYV9mZW5jZV9w
dXQobW92aW5nKTsKIAkJCXJldHVybiBWTV9GQVVMVF9OT1BBR0U7CiAJCWRlZmF1bHQ6CisJCQlk
bWFfZmVuY2VfcHV0KG1vdmluZyk7CiAJCQlyZXR1cm4gVk1fRkFVTFRfU0lHQlVTOwogCQl9CiAK
LS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
