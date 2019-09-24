Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D96DBCD06
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 18:44:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ACDF89E2A;
	Tue, 24 Sep 2019 16:44:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E1DB89E2A;
 Tue, 24 Sep 2019 16:44:45 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 21DD821783;
 Tue, 24 Sep 2019 16:44:44 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.3 65/87] drm/amdgpu/si: fix ASIC tests
Date: Tue, 24 Sep 2019 12:41:21 -0400
Message-Id: <20190924164144.25591-65-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190924164144.25591-1-sashal@kernel.org>
References: <20190924164144.25591-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1569343485;
 bh=n4EK9lFlhG+7vx2FsuKOoovwxv61xtY/g7zcyr254u0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=P99RJLA7s4vN848YhkadZaZS/c19xKH9mf4MoPS3H4ze4TCMc+Co/JthdHn1WeyF2
 PCn9wFRU62DWYUHE5NM69sPlqHbsm9LQUsmStOhXhcWawD5URkYwprxvWbXKodeORI
 YaZw8yv9FmGhN2/B+GYzg8Ge8wEfEZeJ7bvVEPJA=
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
Cc: Sasha Levin <sashal@kernel.org>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Ken Wang <Qingqing.Wang@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Jean Delvare <jdelvare@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSmVhbiBEZWx2YXJlIDxqZGVsdmFyZUBzdXNlLmRlPgoKWyBVcHN0cmVhbSBjb21taXQg
NzdlZmU0OGE3Mjk1ODg1MjdhZmI0ZDU4MTFiOWUwYWNiMjlmNWU1MSBdCgpDb21wYXJpbmcgYWRl
di0+ZmFtaWx5IHdpdGggQ0hJUCBjb25zdGFudHMgaXMgbm90IGNvcnJlY3QuCmFkZXYtPmZhbWls
eSBjYW4gb25seSBiZSBjb21wYXJlZCB3aXRoIEFNREdQVV9GQU1JTFkgY29uc3RhbnRzIGFuZAph
ZGV2LT5hc2ljX3R5cGUgaXMgdGhlIHN0cnVjdCBtZW1iZXIgdG8gY29tcGFyZSB3aXRoIENISVAg
Y29uc3RhbnRzLgpUaGV5IGFyZSBzZXBhcmF0ZSBpZGVudGlmaWNhdGlvbiBzcGFjZXMuCgpTaWdu
ZWQtb2ZmLWJ5OiBKZWFuIERlbHZhcmUgPGpkZWx2YXJlQHN1c2UuZGU+CkZpeGVzOiA2MmEzNzU1
MzQxNGEgKCJkcm0vYW1kZ3B1OiBhZGQgc2kgaW1wbGVtZW50YXRpb24gdjEwIikKQ2M6IEtlbiBX
YW5nIDxRaW5ncWluZy5XYW5nQGFtZC5jb20+CkNjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5k
ZXVjaGVyQGFtZC5jb20+CkNjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdA
YW1kLmNvbT4KQ2M6ICJEYXZpZCAoQ2h1bk1pbmcpIFpob3UiIDxEYXZpZDEuWmhvdUBhbWQuY29t
PgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+
ClNpZ25lZC1vZmYtYnk6IFNhc2hhIExldmluIDxzYXNoYWxAa2VybmVsLm9yZz4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zaS5jIHwgNiArKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAz
IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvc2kuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NpLmMKaW5k
ZXggNGQ3NDQ1M2YzY2ZiZC4uNjAyMzk3MDE2YjY0MSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvc2kuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zaS5j
CkBAIC0xODgxLDcgKzE4ODEsNyBAQCBzdGF0aWMgdm9pZCBzaV9wcm9ncmFtX2FzcG0oc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJCQlpZiAob3JpZyAhPSBkYXRhKQogCQkJCXNpX3BpZl9w
aHkxX3dyZWcoYWRldixQQjFfUElGX1BXUkRPV05fMSwgZGF0YSk7CiAKLQkJCWlmICgoYWRldi0+
ZmFtaWx5ICE9IENISVBfT0xBTkQpICYmIChhZGV2LT5mYW1pbHkgIT0gQ0hJUF9IQUlOQU4pKSB7
CisJCQlpZiAoKGFkZXYtPmFzaWNfdHlwZSAhPSBDSElQX09MQU5EKSAmJiAoYWRldi0+YXNpY190
eXBlICE9IENISVBfSEFJTkFOKSkgewogCQkJCW9yaWcgPSBkYXRhID0gc2lfcGlmX3BoeTBfcnJl
ZyhhZGV2LFBCMF9QSUZfUFdSRE9XTl8wKTsKIAkJCQlkYXRhICY9IH5QTExfUkFNUF9VUF9USU1F
XzBfTUFTSzsKIAkJCQlpZiAob3JpZyAhPSBkYXRhKQpAQCAtMTkzMCwxNCArMTkzMCwxNCBAQCBz
dGF0aWMgdm9pZCBzaV9wcm9ncmFtX2FzcG0oc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAK
IAkJCW9yaWcgPSBkYXRhID0gc2lfcGlmX3BoeTBfcnJlZyhhZGV2LFBCMF9QSUZfQ05UTCk7CiAJ
CQlkYXRhICY9IH5MUzJfRVhJVF9USU1FX01BU0s7Ci0JCQlpZiAoKGFkZXYtPmZhbWlseSA9PSBD
SElQX09MQU5EKSB8fCAoYWRldi0+ZmFtaWx5ID09IENISVBfSEFJTkFOKSkKKwkJCWlmICgoYWRl
di0+YXNpY190eXBlID09IENISVBfT0xBTkQpIHx8IChhZGV2LT5hc2ljX3R5cGUgPT0gQ0hJUF9I
QUlOQU4pKQogCQkJCWRhdGEgfD0gTFMyX0VYSVRfVElNRSg1KTsKIAkJCWlmIChvcmlnICE9IGRh
dGEpCiAJCQkJc2lfcGlmX3BoeTBfd3JlZyhhZGV2LFBCMF9QSUZfQ05UTCwgZGF0YSk7CiAKIAkJ
CW9yaWcgPSBkYXRhID0gc2lfcGlmX3BoeTFfcnJlZyhhZGV2LFBCMV9QSUZfQ05UTCk7CiAJCQlk
YXRhICY9IH5MUzJfRVhJVF9USU1FX01BU0s7Ci0JCQlpZiAoKGFkZXYtPmZhbWlseSA9PSBDSElQ
X09MQU5EKSB8fCAoYWRldi0+ZmFtaWx5ID09IENISVBfSEFJTkFOKSkKKwkJCWlmICgoYWRldi0+
YXNpY190eXBlID09IENISVBfT0xBTkQpIHx8IChhZGV2LT5hc2ljX3R5cGUgPT0gQ0hJUF9IQUlO
QU4pKQogCQkJCWRhdGEgfD0gTFMyX0VYSVRfVElNRSg1KTsKIAkJCWlmIChvcmlnICE9IGRhdGEp
CiAJCQkJc2lfcGlmX3BoeTFfd3JlZyhhZGV2LFBCMV9QSUZfQ05UTCwgZGF0YSk7Ci0tIAoyLjIw
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
