Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D6CA8643
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2019 17:59:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5C1D89C1C;
	Wed,  4 Sep 2019 15:58:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0D6189C1F;
 Wed,  4 Sep 2019 15:58:56 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B20D322CF7;
 Wed,  4 Sep 2019 15:58:55 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 50/94] drm/amdgpu: fix dma_fence_wait without
 reference
Date: Wed,  4 Sep 2019 11:56:55 -0400
Message-Id: <20190904155739.2816-50-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190904155739.2816-1-sashal@kernel.org>
References: <20190904155739.2816-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1567612736;
 bh=0dd297o4/giydwwbHGYujD6FY22aEiS50RVYkQurEz0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=h+EhOXYjAiUuTgvYtBcaGc3ta3aDHkuIgJWOpa9MAxpwnRRLMEfnilxSJyTxrwO+H
 na5hxpefIEglS8ZkcDQSvlEpOo/B+pHjqGMjjtnnlRmy+DIZNiBxEkjkcByQqBKEEb
 K8IR2CSi/OEvJiemN1Om2tUIJfst22PNwrvFtBWA=
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
Cc: Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgoKWyBVcHN0
cmVhbSBjb21taXQgNDIwNjhlMWVmOTYxYzcxOWY5NjdkYmJiNGRkY2IzOTRhMGJhNzkxNyBdCgpX
ZSBuZWVkIHRvIGdyYWIgYSByZWZlcmVuY2UgdG8gdGhlIGZlbmNlIHdlIHdhaXQgZm9yLgoKU2ln
bmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpS
ZXZpZXdlZC1ieTogQ2h1bm1pbmcgWmhvdSA8ZGF2aWQxLnpob3VAYW1kLmNvbT4KU2lnbmVkLW9m
Zi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpTaWduZWQtb2Zm
LWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2N0eC5jIHwgMjcgKysrKysrKysrKysrKystLS0tLS0tLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jdHguYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jdHguYwppbmRleCBhMjhhM2Q3MjJiYTI5Li42MjI5
OGFlNWM4MWMwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
Y3R4LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2N0eC5jCkBAIC01
MzUsMjEgKzUzNSwyNCBAQCBpbnQgYW1kZ3B1X2N0eF93YWl0X3ByZXZfZmVuY2Uoc3RydWN0IGFt
ZGdwdV9jdHggKmN0eCwKIAkJCSAgICAgICBzdHJ1Y3QgZHJtX3NjaGVkX2VudGl0eSAqZW50aXR5
KQogewogCXN0cnVjdCBhbWRncHVfY3R4X2VudGl0eSAqY2VudGl0eSA9IHRvX2FtZGdwdV9jdHhf
ZW50aXR5KGVudGl0eSk7Ci0JdW5zaWduZWQgaWR4ID0gY2VudGl0eS0+c2VxdWVuY2UgJiAoYW1k
Z3B1X3NjaGVkX2pvYnMgLSAxKTsKLQlzdHJ1Y3QgZG1hX2ZlbmNlICpvdGhlciA9IGNlbnRpdHkt
PmZlbmNlc1tpZHhdOworCXN0cnVjdCBkbWFfZmVuY2UgKm90aGVyOworCXVuc2lnbmVkIGlkeDsK
Kwlsb25nIHI7CiAKLQlpZiAob3RoZXIpIHsKLQkJc2lnbmVkIGxvbmcgcjsKLQkJciA9IGRtYV9m
ZW5jZV93YWl0KG90aGVyLCB0cnVlKTsKLQkJaWYgKHIgPCAwKSB7Ci0JCQlpZiAociAhPSAtRVJF
U1RBUlRTWVMpCi0JCQkJRFJNX0VSUk9SKCJFcnJvciAoJWxkKSB3YWl0aW5nIGZvciBmZW5jZSFc
biIsIHIpOworCXNwaW5fbG9jaygmY3R4LT5yaW5nX2xvY2spOworCWlkeCA9IGNlbnRpdHktPnNl
cXVlbmNlICYgKGFtZGdwdV9zY2hlZF9qb2JzIC0gMSk7CisJb3RoZXIgPSBkbWFfZmVuY2VfZ2V0
KGNlbnRpdHktPmZlbmNlc1tpZHhdKTsKKwlzcGluX3VubG9jaygmY3R4LT5yaW5nX2xvY2spOwog
Ci0JCQlyZXR1cm4gcjsKLQkJfQotCX0KKwlpZiAoIW90aGVyKQorCQlyZXR1cm4gMDsKIAotCXJl
dHVybiAwOworCXIgPSBkbWFfZmVuY2Vfd2FpdChvdGhlciwgdHJ1ZSk7CisJaWYgKHIgPCAwICYm
IHIgIT0gLUVSRVNUQVJUU1lTKQorCQlEUk1fRVJST1IoIkVycm9yICglbGQpIHdhaXRpbmcgZm9y
IGZlbmNlIVxuIiwgcik7CisKKwlkbWFfZmVuY2VfcHV0KG90aGVyKTsKKwlyZXR1cm4gcjsKIH0K
IAogdm9pZCBhbWRncHVfY3R4X21ncl9pbml0KHN0cnVjdCBhbWRncHVfY3R4X21nciAqbWdyKQot
LSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
