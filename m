Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C79BCCC7
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 18:43:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 695306EA53;
	Tue, 24 Sep 2019 16:42:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3997C6EA67;
 Tue, 24 Sep 2019 16:42:46 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5824F21D6C;
 Tue, 24 Sep 2019 16:42:45 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.3 21/87] drm/radeon: Fix EEH during kexec
Date: Tue, 24 Sep 2019 12:40:37 -0400
Message-Id: <20190924164144.25591-21-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190924164144.25591-1-sashal@kernel.org>
References: <20190924164144.25591-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1569343366;
 bh=HeXcDpJFh4udfglMoJEg+VigYcrTnVmTUQWzyvKp72A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Sd7ygvgt3WUK97wY+7+0Sc3p1QquuHYOcJHDenm73gVJS2dMt1qaby8D8+W2cElHv
 8gJOcfTXsjVQex49tYHiC10Hp0OilkSBU0dpCK+yFiq7OoftKuUJ27NuQBKv/CFeHY
 H2LJBNa6cbTyE/3tjsqRRUGSCRXs4Xuy4HBFTEmQ=
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 dri-devel@lists.freedesktop.org, KyleMahlkuch <kmahlkuc@linux.vnet.ibm.com>,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogS3lsZU1haGxrdWNoIDxrbWFobGt1Y0BsaW51eC52bmV0LmlibS5jb20+CgpbIFVwc3Ry
ZWFtIGNvbW1pdCA2ZjdmZTlhOTNlNmMwOWJmOTg4YzUwNTk0MDNmNWY4OGUxN2UyMWU2IF0KCkR1
cmluZyBrZXhlYyBzb21lIGFkYXB0ZXJzIGhpdCBhbiBFRUggc2luY2UgdGhleSBhcmUgbm90IHBy
b3Blcmx5CnNodXQgZG93biBpbiB0aGUgcmFkZW9uX3BjaV9zaHV0ZG93bigpIGZ1bmN0aW9uLiBB
ZGRpbmcKcmFkZW9uX3N1c3BlbmRfa21zKCkgZml4ZXMgdGhpcyBpc3N1ZS4KClNpZ25lZC1vZmYt
Ynk6IEt5bGVNYWhsa3VjaCA8a21haGxrdWNAbGludXgudm5ldC5pYm0uY29tPgpTaWduZWQtb2Zm
LWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+ClNpZ25lZC1vZmYt
Ynk6IFNhc2hhIExldmluIDxzYXNoYWxAa2VybmVsLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
cmFkZW9uL3JhZGVvbl9kcnYuYyB8IDggKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kcnYu
YyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Rydi5jCmluZGV4IGE2Y2JlMTFmNzlj
NjEuLjE1ZDdiZWJlMTcyOTQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFk
ZW9uX2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Rydi5jCkBAIC0z
NDksMTEgKzM0OSwxOSBAQCByYWRlb25fcGNpX3JlbW92ZShzdHJ1Y3QgcGNpX2RldiAqcGRldikK
IHN0YXRpYyB2b2lkCiByYWRlb25fcGNpX3NodXRkb3duKHN0cnVjdCBwY2lfZGV2ICpwZGV2KQog
eworCXN0cnVjdCBkcm1fZGV2aWNlICpkZGV2ID0gcGNpX2dldF9kcnZkYXRhKHBkZXYpOworCiAJ
LyogaWYgd2UgYXJlIHJ1bm5pbmcgaW4gYSBWTSwgbWFrZSBzdXJlIHRoZSBkZXZpY2UKIAkgKiB0
b3JuIGRvd24gcHJvcGVybHkgb24gcmVib290L3NodXRkb3duCiAJICovCiAJaWYgKHJhZGVvbl9k
ZXZpY2VfaXNfdmlydHVhbCgpKQogCQlyYWRlb25fcGNpX3JlbW92ZShwZGV2KTsKKworCS8qIFNv
bWUgYWRhcHRlcnMgbmVlZCB0byBiZSBzdXNwZW5kZWQgYmVmb3JlIGEKKwkqIHNodXRkb3duIG9j
Y3VycyBpbiBvcmRlciB0byBwcmV2ZW50IGFuIGVycm9yCisJKiBkdXJpbmcga2V4ZWMuCisJKi8K
KwlyYWRlb25fc3VzcGVuZF9rbXMoZGRldiwgdHJ1ZSwgdHJ1ZSwgZmFsc2UpOwogfQogCiBzdGF0
aWMgaW50IHJhZGVvbl9wbW9wc19zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikKLS0gCjIuMjAu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
