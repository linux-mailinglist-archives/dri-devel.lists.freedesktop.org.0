Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22920C3AE3
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2019 18:42:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AE396E85C;
	Tue,  1 Oct 2019 16:42:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A32E6E852;
 Tue,  1 Oct 2019 16:41:50 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3A502205C9;
 Tue,  1 Oct 2019 16:41:49 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 18/63] drm/amdgpu: Fix KFD-related kernel oops on
 Hawaii
Date: Tue,  1 Oct 2019 12:40:40 -0400
Message-Id: <20191001164125.15398-18-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191001164125.15398-1-sashal@kernel.org>
References: <20191001164125.15398-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1569948110;
 bh=l62JA0cwp5myrRm3ZVR1pkjHrtwy9H/0KLao1eRcjkw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=2WdY5b7ceQu2zXVhrOYEGRtcU2r0tHwkfQ1Gn39ZwzmiSxCgxAXrZBrtY+uDv8pJQ
 TcsIiPDU8SzQyyB3jRLp77MSRH9X6AcDaKYOO8QSl0PbsIJdtlJqrnNXDTKrIWiuGy
 CEgonstOSZFgxhj6hje/LSYcAMkL6fvB4tFkmaiQ=
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
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRmVsaXggS3VlaGxpbmcgPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+CgpbIFVwc3RyZWFt
IGNvbW1pdCBkY2FmYmQ1MGYyZTRkNWNjOTY0YWFlNDA5ZmI1NjkxYjc0M2ZiYTIzIF0KCkhhd2Fp
aSBuZWVkcyB0byBmbHVzaCBjYWNoZXMgZXhwbGljaXRseSwgc3VibWl0dGluZyBhbiBJQiBpbiBh
IHVzZXIKVk1JRCBmcm9tIGtlcm5lbCBtb2RlLiBUaGVyZSBpcyBubyBzX2ZlbmNlIGluIHRoaXMg
Y2FzZS4KCkZpeGVzOiBlYjM5NjFhNTc0MjQgKCJkcm0vYW1kZ3B1OiByZW1vdmUgZmVuY2UgY29u
dGV4dCBmcm9tIHRoZSBqb2IiKQpTaWduZWQtb2ZmLWJ5OiBGZWxpeCBLdWVobGluZyA8RmVsaXgu
S3VlaGxpbmdAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlh
bi5rb2VuaWdAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIu
ZGV1Y2hlckBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5l
bC5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2liLmMgfCAzICsr
LQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9pYi5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2liLmMKaW5kZXggZmUzOTNhNDZmODgxMS4uNWVlZDI0
MjNkYmI1ZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2li
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2liLmMKQEAgLTE0MSw3
ICsxNDEsOCBAQCBpbnQgYW1kZ3B1X2liX3NjaGVkdWxlKHN0cnVjdCBhbWRncHVfcmluZyAqcmlu
ZywgdW5zaWduZWQgbnVtX2licywKIAkvKiByaW5nIHRlc3RzIGRvbid0IHVzZSBhIGpvYiAqLwog
CWlmIChqb2IpIHsKIAkJdm0gPSBqb2ItPnZtOwotCQlmZW5jZV9jdHggPSBqb2ItPmJhc2Uuc19m
ZW5jZS0+c2NoZWR1bGVkLmNvbnRleHQ7CisJCWZlbmNlX2N0eCA9IGpvYi0+YmFzZS5zX2ZlbmNl
ID8KKwkJCWpvYi0+YmFzZS5zX2ZlbmNlLT5zY2hlZHVsZWQuY29udGV4dCA6IDA7CiAJfSBlbHNl
IHsKIAkJdm0gPSBOVUxMOwogCQlmZW5jZV9jdHggPSAwOwotLSAKMi4yMC4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
