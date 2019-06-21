Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F084ED0F
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 18:21:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA38F6E8F5;
	Fri, 21 Jun 2019 16:21:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3109E6E8F5;
 Fri, 21 Jun 2019 16:21:33 +0000 (UTC)
Received: from localhost.localdomain (unknown [194.230.155.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8272921537;
 Fri, 21 Jun 2019 16:21:31 +0000 (UTC)
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Qiang Yu <yuq825@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 lima@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] drm/lima: Reduce number of PTR_ERR() calls
Date: Fri, 21 Jun 2019 18:21:16 +0200
Message-Id: <20190621162117.22533-3-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190621162117.22533-1-krzk@kernel.org>
References: <20190621162117.22533-1-krzk@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1561134093;
 bh=pCt3wsZcryFCye2Z01SjWL3uA/rMoy9d+YZMP7FdH/8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AG3vTmqUB07tvd9tDJps6NreYgpS4FmRwd5ZVKS6Ck0hLbr7zv6VZewpafvivoOPp
 LDU3tmkha4JItwU5YPkm1OzYuyDWbpWu0FOsnZxHY2ZXNxDVHTkoIEETm8KW/xhDqx
 ddQhqPZkFjS7okW+cNBkLirj+I8z8JtiTMNfgGI0=
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
Cc: Krzysztof Kozlowski <krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U3RvcmUgdGhlIFBUUl9FUlIoKSByZXN1bHQgaW4gbG9jYWwgdmFyaWFibGUgaW4gY2xvY2sgaW5p
dCBlcnJvciBwYXRoLgpUaGlzIG1ha2VzIHRoZSBjb2RlIGNvbnNpc3RlbnQgd2l0aCBzaW1pbGFy
IHNlY3Rpb24gaW4gcmVndWxhdG9yIGluaXQKY29kZS4KClNpZ25lZC1vZmYtYnk6IEtyenlzenRv
ZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4KCi0tLQoKQ2hhbmdlcyBzaW5jZSB2MToKMS4g
TmV3IHBhdGNoCi0tLQogZHJpdmVycy9ncHUvZHJtL2xpbWEvbGltYV9kZXZpY2UuYyB8IDEwICsr
KysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2xpbWEvbGltYV9kZXZpY2UuYyBiL2RyaXZl
cnMvZ3B1L2RybS9saW1hL2xpbWFfZGV2aWNlLmMKaW5kZXggYmIyZWFhNGYzNzBlLi45YTZjZDg3
OWJjYjEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9saW1hL2xpbWFfZGV2aWNlLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2xpbWEvbGltYV9kZXZpY2UuYwpAQCAtODMsMTQgKzgzLDE2IEBA
IHN0YXRpYyBpbnQgbGltYV9jbGtfaW5pdChzdHJ1Y3QgbGltYV9kZXZpY2UgKmRldikKIAogCWRl
di0+Y2xrX2J1cyA9IGRldm1fY2xrX2dldChkZXYtPmRldiwgImJ1cyIpOwogCWlmIChJU19FUlIo
ZGV2LT5jbGtfYnVzKSkgewotCQlkZXZfZXJyKGRldi0+ZGV2LCAiZ2V0IGJ1cyBjbGsgZmFpbGVk
ICVsZFxuIiwgUFRSX0VSUihkZXYtPmNsa19idXMpKTsKLQkJcmV0dXJuIFBUUl9FUlIoZGV2LT5j
bGtfYnVzKTsKKwkJZXJyID0gUFRSX0VSUihkZXYtPmNsa19idXMpOworCQlkZXZfZXJyKGRldi0+
ZGV2LCAiZ2V0IGJ1cyBjbGsgZmFpbGVkICVkXG4iLCBlcnIpOworCQlyZXR1cm4gZXJyOwogCX0K
IAogCWRldi0+Y2xrX2dwdSA9IGRldm1fY2xrX2dldChkZXYtPmRldiwgImNvcmUiKTsKIAlpZiAo
SVNfRVJSKGRldi0+Y2xrX2dwdSkpIHsKLQkJZGV2X2VycihkZXYtPmRldiwgImdldCBjb3JlIGNs
ayBmYWlsZWQgJWxkXG4iLCBQVFJfRVJSKGRldi0+Y2xrX2dwdSkpOwotCQlyZXR1cm4gUFRSX0VS
UihkZXYtPmNsa19ncHUpOworCQllcnIgPSBQVFJfRVJSKGRldi0+Y2xrX2dwdSk7CisJCWRldl9l
cnIoZGV2LT5kZXYsICJnZXQgY29yZSBjbGsgZmFpbGVkICVkXG4iLCBlcnIpOworCQlyZXR1cm4g
ZXJyOwogCX0KIAogCWVyciA9IGNsa19wcmVwYXJlX2VuYWJsZShkZXYtPmNsa19idXMpOwotLSAK
Mi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
