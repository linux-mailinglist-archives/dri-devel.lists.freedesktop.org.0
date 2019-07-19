Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A3B6DA96
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 06:03:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 750596E4F9;
	Fri, 19 Jul 2019 04:03:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 631B86E4F5;
 Fri, 19 Jul 2019 04:03:24 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5601D21882;
 Fri, 19 Jul 2019 04:03:23 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.1 015/141] drm/amdgpu: Reserve shared fence for
 eviction fence
Date: Fri, 19 Jul 2019 00:00:40 -0400
Message-Id: <20190719040246.15945-15-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190719040246.15945-1-sashal@kernel.org>
References: <20190719040246.15945-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1563509004;
 bh=KRO6ik8YCwyJSLKtk18n9C4vouT18tTYNZvnBVby8cI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=zW01BLgWru7UFvu02T5bMxlxkrif/1zx5SK5rXlS3ulKxBl+epTUGGedCU5o9PRZ5
 7146awWltHFsGTU60kjbq0hRGXUS4+uajV8yrtlsOKOi5NbcwkCbjSJHwYgNuchC2y
 q+fmn5sx6ZEJ6aRYenoqgs0rrwm+ePlH9Wle8yJ4=
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
 Harish Kasiviswanathan <Harish.Kasiviswanathan@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRmVsaXggS3VlaGxpbmcgPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+CgpbIFVwc3RyZWFt
IGNvbW1pdCBkZDY4NzIyYzQyN2Q1YjMzNDIwZGNlMGVkMGM0NGI0ODgxZTBhNDE2IF0KCk5lZWQg
dG8gcmVzZXJ2ZSBzcGFjZSBmb3IgdGhlIHNoYXJlZCBldmljdGlvbiBmZW5jZSB3aGVuIGluaXRp
YWxpemluZwphIEtGRCBWTS4KClNpZ25lZC1vZmYtYnk6IEZlbGl4IEt1ZWhsaW5nIDxGZWxpeC5L
dWVobGluZ0BhbWQuY29tPgpBY2tlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtv
ZW5pZ0BhbWQuY29tPgpSZXZpZXdlZC1ieTogSGFyaXNoIEthc2l2aXN3YW5hdGhhbiA8SGFyaXNo
Lkthc2l2aXN3YW5hdGhhbkBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFs
ZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IFNhc2hhIExldmluIDxzYXNo
YWxAa2VybmVsLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1k
a2ZkX2dwdXZtLmMgfCA0ICsrKysKIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZt
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMKaW5k
ZXggMTkyMWRlYzNkZjdhLi5jN2RlNjhjNDk1YjcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMKQEAgLTkwOSw2ICs5MDksOSBAQCBzdGF0
aWMgaW50IGluaXRfa2ZkX3ZtKHN0cnVjdCBhbWRncHVfdm0gKnZtLCB2b2lkICoqcHJvY2Vzc19p
bmZvLAogCWFtZGdwdV9ib19zeW5jX3dhaXQodm0tPnJvb3QuYmFzZS5ibywgQU1ER1BVX0ZFTkNF
X09XTkVSX0tGRCwgZmFsc2UpOwogCWlmIChyZXQpCiAJCWdvdG8gd2FpdF9wZF9mYWlsOworCXJl
dCA9IHJlc2VydmF0aW9uX29iamVjdF9yZXNlcnZlX3NoYXJlZCh2bS0+cm9vdC5iYXNlLmJvLT50
Ym8ucmVzdiwgMSk7CisJaWYgKHJldCkKKwkJZ290byByZXNlcnZlX3NoYXJlZF9mYWlsOwogCWFt
ZGdwdV9ib19mZW5jZSh2bS0+cm9vdC5iYXNlLmJvLAogCQkJJnZtLT5wcm9jZXNzX2luZm8tPmV2
aWN0aW9uX2ZlbmNlLT5iYXNlLCB0cnVlKTsKIAlhbWRncHVfYm9fdW5yZXNlcnZlKHZtLT5yb290
LmJhc2UuYm8pOwpAQCAtOTIyLDYgKzkyNSw3IEBAIHN0YXRpYyBpbnQgaW5pdF9rZmRfdm0oc3Ry
dWN0IGFtZGdwdV92bSAqdm0sIHZvaWQgKipwcm9jZXNzX2luZm8sCiAKIAlyZXR1cm4gMDsKIAor
cmVzZXJ2ZV9zaGFyZWRfZmFpbDoKIHdhaXRfcGRfZmFpbDoKIHZhbGlkYXRlX3BkX2ZhaWw6CiAJ
YW1kZ3B1X2JvX3VucmVzZXJ2ZSh2bS0+cm9vdC5iYXNlLmJvKTsKLS0gCjIuMjAuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
