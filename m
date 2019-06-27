Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C62D0576CF
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 02:43:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C5126E56B;
	Thu, 27 Jun 2019 00:43:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 401646E571
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 00:43:04 +0000 (UTC)
Received: from sasha-vm.mshome.net (unknown [107.242.116.147])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D4CA220659;
 Thu, 27 Jun 2019 00:35:00 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.1 85/95] drm: return -EFAULT if copy_to_user() fails
Date: Wed, 26 Jun 2019 20:30:10 -0400
Message-Id: <20190627003021.19867-85-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190627003021.19867-1-sashal@kernel.org>
References: <20190627003021.19867-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1561595702;
 bh=HTX+iaUqmpu0wkgXyKsyQ7lyDKy7F5AINh2wqJboBBM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=epI7QNAFPhDstxqu6100Qy7KXoC5o9WSoVsZz0KWxCptjrR1OhE3v0NXQztTyD3bv
 7to0h2mkblv9V5C6GhYC9fvAE0erQDalav+HjmCTsEnOm9784bwh/OWlzCDpsIQ144
 rL9r5Fa4UkTVrX5kqdXwk7fUruPJyPb6RZ1fW9qM=
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
Cc: Sasha Levin <sashal@kernel.org>, Sean Paul <seanpaul@chromium.org>,
 dri-devel@lists.freedesktop.org, Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBvcmFjbGUuY29tPgoKWyBVcHN0cmVh
bSBjb21taXQgNzRiNjdlZmE4ZDdiNGY5MDEzN2YwYWI5YTgwZGQzMTlkYTA1MDM1MCBdCgpUaGUg
Y29weV9mcm9tX3VzZXIoKSBmdW5jdGlvbiByZXR1cm5zIHRoZSBudW1iZXIgb2YgYnl0ZXMgcmVt
YWluaW5nCnRvIGJlIGNvcGllZCBidXQgd2Ugd2FudCB0byByZXR1cm4gYSBuZWdhdGl2ZSBlcnJv
ciBjb2RlLiAgT3RoZXJ3aXNlCnRoZSBjYWxsZXJzIHRyZWF0IGl0IGFzIGEgc3VjY2Vzc2Z1bCBj
b3B5LgoKU2lnbmVkLW9mZi1ieTogRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBvcmFjbGUu
Y29tPgpTaWduZWQtb2ZmLWJ5OiBTZWFuIFBhdWwgPHNlYW5wYXVsQGNocm9taXVtLm9yZz4KTGlu
azogaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoL21zZ2lkLzIwMTkwNjE4
MTMxODQzLkdBMjk0NjNAbXdhbmRhClNpZ25lZC1vZmYtYnk6IFNhc2hhIExldmluIDxzYXNoYWxA
a2VybmVsLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2J1ZnMuYyAgfCA1ICsrKystCiBk
cml2ZXJzL2dwdS9kcm0vZHJtX2lvYzMyLmMgfCA1ICsrKystCiAyIGZpbGVzIGNoYW5nZWQsIDgg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vZHJtX2J1ZnMuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fYnVmcy5jCmluZGV4IGU0MDdhZGIw
MzNlNy4uNGZiYzM0NDI1NTcwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2J1ZnMu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2J1ZnMuYwpAQCAtMTMzMiw3ICsxMzMyLDEwIEBA
IHN0YXRpYyBpbnQgY29weV9vbmVfYnVmKHZvaWQgKmRhdGEsIGludCBjb3VudCwgc3RydWN0IGRy
bV9idWZfZW50cnkgKmZyb20pCiAJCQkJIC5zaXplID0gZnJvbS0+YnVmX3NpemUsCiAJCQkJIC5s
b3dfbWFyayA9IGZyb20tPmxvd19tYXJrLAogCQkJCSAuaGlnaF9tYXJrID0gZnJvbS0+aGlnaF9t
YXJrfTsKLQlyZXR1cm4gY29weV90b191c2VyKHRvLCAmdiwgb2Zmc2V0b2Yoc3RydWN0IGRybV9i
dWZfZGVzYywgZmxhZ3MpKTsKKworCWlmIChjb3B5X3RvX3VzZXIodG8sICZ2LCBvZmZzZXRvZihz
dHJ1Y3QgZHJtX2J1Zl9kZXNjLCBmbGFncykpKQorCQlyZXR1cm4gLUVGQVVMVDsKKwlyZXR1cm4g
MDsKIH0KIAogaW50IGRybV9sZWdhY3lfaW5mb2J1ZnMoc3RydWN0IGRybV9kZXZpY2UgKmRldiwg
dm9pZCAqZGF0YSwKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1faW9jMzIuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9kcm1faW9jMzIuYwppbmRleCAwZTMwNDNlMDhjNjkuLmY4NjcyMjM4ZDQ0
NCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9pb2MzMi5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9kcm1faW9jMzIuYwpAQCAtMzcyLDcgKzM3MiwxMCBAQCBzdGF0aWMgaW50IGNvcHlf
b25lX2J1ZjMyKHZvaWQgKmRhdGEsIGludCBjb3VudCwgc3RydWN0IGRybV9idWZfZW50cnkgKmZy
b20pCiAJCQkgICAgICAuc2l6ZSA9IGZyb20tPmJ1Zl9zaXplLAogCQkJICAgICAgLmxvd19tYXJr
ID0gZnJvbS0+bG93X21hcmssCiAJCQkgICAgICAuaGlnaF9tYXJrID0gZnJvbS0+aGlnaF9tYXJr
fTsKLQlyZXR1cm4gY29weV90b191c2VyKHRvICsgY291bnQsICZ2LCBvZmZzZXRvZihkcm1fYnVm
X2Rlc2MzMl90LCBmbGFncykpOworCisJaWYgKGNvcHlfdG9fdXNlcih0byArIGNvdW50LCAmdiwg
b2Zmc2V0b2YoZHJtX2J1Zl9kZXNjMzJfdCwgZmxhZ3MpKSkKKwkJcmV0dXJuIC1FRkFVTFQ7CisJ
cmV0dXJuIDA7CiB9CiAKIHN0YXRpYyBpbnQgZHJtX2xlZ2FjeV9pbmZvYnVmczMyKHN0cnVjdCBk
cm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
