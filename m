Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDB115906
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 07:33:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D67689CAC;
	Tue,  7 May 2019 05:33:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35E5689CAC
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2019 05:33:14 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 360D520B7C;
 Tue,  7 May 2019 05:33:13 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.0 22/99] drm/ttm: fix dma_fence refcount imbalance
 on error path
Date: Tue,  7 May 2019 01:31:16 -0400
Message-Id: <20190507053235.29900-22-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190507053235.29900-1-sashal@kernel.org>
References: <20190507053235.29900-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1557207194;
 bh=R0PO4GjbaXvyyFAmNd0CfrHD0e3Tw5YcMEH89b+Fats=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ofVyZOL904Rst0gUKmeMmk7vOkJm/3k4UNHxK9SLYRfh+y44u1TfwAMTeb05+X8Vz
 wCaXTzqPGqSmSG8AlUevJyhzvIxJYW4cs96axg2C3zihIGNVRtrEI5T3ktIg1Xd/nQ
 NaPghriRacFLGOG9F4pjm339l+3zyfHSD7wZpMbU=
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
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, Lin Yi <teroincn@163.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTGluIFlpIDx0ZXJvaW5jbkAxNjMuY29tPgoKWyBVcHN0cmVhbSBjb21taXQgNTQzYzM2
NGQ4ZWVlYjQyYzBlZGZhYWM5NzY0ZjRlOWYzZDc3N2VjMSBdCgp0aGUgdHRtX2JvX2FkZF9tb3Zl
X2ZlbmNlIHRha2VzIGEgcmVmZXJlbmNlIHRvIHRoZSBzdHJ1Y3QgZG1hX2ZlbmNlLCBidXQKZmFp
bGVkIHRvIHJlbGVhc2UgaXQgb24gdGhlIGVycm9yIHBhdGgsIGxlYWRpbmcgdG8gYSBtZW1vcnkg
bGVhay4KYWRkIGRtYV9mZW5jZV9wdXQgYmVmb3JlIHJldHVybiB3aGVuIGVycm9yIG9jY3VyLgoK
U2lnbmVkLW9mZi1ieTogTGluIFlpIDx0ZXJvaW5jbkAxNjMuY29tPgpSZXZpZXdlZC1ieTogQ2hy
aXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBB
bGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IFNh
c2hhIExldmluIDxzYXNoYWxAa2VybmVsLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0
bV9iby5jIHwgNCArKystCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyBiL2RyaXZl
cnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKaW5kZXggOTk2Y2FkZDgzZjI0Li5kOGUxYjNmMTI5MDQg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL3R0bS90dG1fYm8uYwpAQCAtODgxLDggKzg4MSwxMCBAQCBzdGF0aWMgaW50IHR0bV9i
b19hZGRfbW92ZV9mZW5jZShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAogCQlyZXNlcnZh
dGlvbl9vYmplY3RfYWRkX3NoYXJlZF9mZW5jZShiby0+cmVzdiwgZmVuY2UpOwogCiAJCXJldCA9
IHJlc2VydmF0aW9uX29iamVjdF9yZXNlcnZlX3NoYXJlZChiby0+cmVzdiwgMSk7Ci0JCWlmICh1
bmxpa2VseShyZXQpKQorCQlpZiAodW5saWtlbHkocmV0KSkgeworCQkJZG1hX2ZlbmNlX3B1dChm
ZW5jZSk7CiAJCQlyZXR1cm4gcmV0OworCQl9CiAKIAkJZG1hX2ZlbmNlX3B1dChiby0+bW92aW5n
KTsKIAkJYm8tPm1vdmluZyA9IGZlbmNlOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
