Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37AE3BCCB1
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 18:42:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE5116EA5E;
	Tue, 24 Sep 2019 16:42:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB7426EA55;
 Tue, 24 Sep 2019 16:42:11 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A6EF220872;
 Tue, 24 Sep 2019 16:42:10 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.3 09/87] drm/amd/display: Power-gate all DSCs at
 driver init time
Date: Tue, 24 Sep 2019 12:40:25 -0400
Message-Id: <20190924164144.25591-9-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190924164144.25591-1-sashal@kernel.org>
References: <20190924164144.25591-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1569343331;
 bh=p/LTZv2Rg4AcXfx4nYRbWpJmu7o4xkjBC4qUBZfeDW8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RZk1iqXagr46juZzlk1YrEUJDtmf7fCI5MSeBLzWj4UiF/pNT2wY2ExSE08wr0/dg
 RR2a6jFxbQmoRip+PodmcB3pIu7lx6AoY8q0yG+DpjGoOD6Ya1nw18cMB9gpiQnuPm
 3gzlMU10bzOgyXoS5V7SRb3z3KWjB/js80euZ6xw=
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
Cc: Sasha Levin <sashal@kernel.org>, Leo Li <sunpeng.li@amd.com>,
 amd-gfx@lists.freedesktop.org, Nikola Cornij <nikola.cornij@amd.com>,
 Nevenko Stupar <Nevenko.Stupar@amd.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTmlrb2xhIENvcm5paiA8bmlrb2xhLmNvcm5pakBhbWQuY29tPgoKWyBVcHN0cmVhbSBj
b21taXQgNzVjMzUwMDAyMzVmMzY2MmYyODEwZTlhNTliMGM4ZWVkMDQ1NDMyZSBdCgpbd2h5XQpE
U0Mgc2hvdWxkIGJlIHBvd2VyZWQtb24gb25seSBvbiBhcy1uZWVkZWQgYmFzaXMsIGkuZS4gaWYg
dGhlIG1vZGUKcmVxdWlyZXMgaXQKCltob3ddCkxvb3Agb3ZlciBhbGwgdGhlIERTQ3MgYXQgZHJp
dmVyIGluaXQgdGltZSBhbmQgcG93ZXItZ2F0ZSBlYWNoCgpTaWduZWQtb2ZmLWJ5OiBOaWtvbGEg
Q29ybmlqIDxuaWtvbGEuY29ybmlqQGFtZC5jb20+ClJldmlld2VkLWJ5OiBOZXZlbmtvIFN0dXBh
ciA8TmV2ZW5rby5TdHVwYXJAYW1kLmNvbT4KQWNrZWQtYnk6IExlbyBMaSA8c3VucGVuZy5saUBh
bWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFt
ZC5jb20+ClNpZ25lZC1vZmYtYnk6IFNhc2hhIExldmluIDxzYXNoYWxAa2VybmVsLm9yZz4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfaHdzZXEuYyB8IDQg
KysrKwogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9od3NlcS5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h3c2VxLmMKaW5kZXggZDgxMGM4OTQw
MTI5Yi4uMjYyN2UwYTk4YTk2YSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2RjbjIwL2RjbjIwX2h3c2VxLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2RjbjIwL2RjbjIwX2h3c2VxLmMKQEAgLTU4NSw2ICs1ODUsMTAgQEAgc3RhdGljIHZv
aWQgZGNuMjBfaW5pdF9odyhzdHJ1Y3QgZGMgKmRjKQogCQl9CiAJfQogCisJLyogUG93ZXIgZ2F0
ZSBEU0NzICovCisJZm9yIChpID0gMDsgaSA8IHJlc19wb29sLT5yZXNfY2FwLT5udW1fZHNjOyBp
KyspCisJCWRjbjIwX2RzY19wZ19jb250cm9sKGh3cywgcmVzX3Bvb2wtPmRzY3NbaV0tPmluc3Qs
IGZhbHNlKTsKKwogCS8qIEJsYW5rIHBpeGVsIGRhdGEgd2l0aCBPUFAgRFBHICovCiAJZm9yIChp
ID0gMDsgaSA8IGRjLT5yZXNfcG9vbC0+dGltaW5nX2dlbmVyYXRvcl9jb3VudDsgaSsrKSB7CiAJ
CXN0cnVjdCB0aW1pbmdfZ2VuZXJhdG9yICp0ZyA9IGRjLT5yZXNfcG9vbC0+dGltaW5nX2dlbmVy
YXRvcnNbaV07Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
