Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 287A111936E
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 22:11:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58FD66E946;
	Tue, 10 Dec 2019 21:11:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 219156E946
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 21:11:51 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2D486246AE;
 Tue, 10 Dec 2019 21:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576012311;
 bh=ATa9QuIVN2+F0fqsudF0PnVInf1lvpTGDJ9Gp+lnndc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jL72VLSvctj16S9fCbfy6xbG/r6Cs3mUNzgn7LcdAKMvLyuTUhBn23+2NSK4YEbmV
 zbCBubjQlQAW1H96i5YU90rM/mqx5EbhkSKrc+76KWoXjExQAdO4xOxO/b9wGhpbCQ
 zj3ZEm0KM81PnvnBTuSk2e+B1X6WbOVdwpfQWPFs=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 246/350] drm/amdgpu: Avoid accidental thread
 reactivation.
Date: Tue, 10 Dec 2019 16:05:51 -0500
Message-Id: <20191210210735.9077-207-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191210210735.9077-1-sashal@kernel.org>
References: <20191210210735.9077-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQW5kcmV5IEdyb2R6b3Zza3kgPGFuZHJleS5ncm9kem92c2t5QGFtZC5jb20+CgpbIFVw
c3RyZWFtIGNvbW1pdCBhMjhmZGEzMTJhOWZhYmRmMGU1ZjU2NTI0NDlkNjE5N2M5ZmIwYTkwIF0K
ClByb2JsZW06CkR1cmluZyBHUFUgcmVzZXQgd2UgY2FsbCB0aGUgR1BVIHNjaGVkdWxlciB0byBz
dXNwZW5kIGl0J3MKdGhyZWFkLCB0aG9zZSB0d28gZnVuY3Rpb25zIGluIGFtZGdwdSBhbHNvIHN1
c3BlbmQgYW5kIHJlc3VtZQp0aGUgc2NlZHVsZXIgZm9yIHRoZWlyIG5lZWRzIGJ1dCB0aGlzIGNh
biBjb2xsaWRlIHdpdGggR1BVCnJlc2V0IGluIHByb2dyZXNzIGFuZCBhY2NpZGVudGx5IHJlc3Rh
cnQgYSBzdXNwZW5kZWQgdGhyZWFkCmJlZm9yZSB0aW1lLgoKRml4OgpTZXJpYWxpemUgd2l0aCBH
UFUgcmVzZXQuCgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgR3JvZHpvdnNreSA8YW5kcmV5Lmdyb2R6
b3Zza3lAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5r
b2VuaWdAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1
Y2hlckBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5v
cmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RlYnVnZnMuYyB8IDEw
ICsrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RlYnVnZnMuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZWJ1Z2ZzLmMKaW5kZXggNTY1MmNjNzJlZDNhOS4u
ODE4NDJiYThjZDc1NyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2RlYnVnZnMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGVi
dWdmcy5jCkBAIC04NTksNiArODU5LDkgQEAgc3RhdGljIGludCBhbWRncHVfZGVidWdmc190ZXN0
X2liKHN0cnVjdCBzZXFfZmlsZSAqbSwgdm9pZCAqZGF0YSkKIAlzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldiA9IGRldi0+ZGV2X3ByaXZhdGU7CiAJaW50IHIgPSAwLCBpOwogCisJLyogQXZvaWQg
YWNjaWRlbnRseSB1bnBhcmtpbmcgdGhlIHNjaGVkIHRocmVhZCBkdXJpbmcgR1BVIHJlc2V0ICov
CisJbXV0ZXhfbG9jaygmYWRldi0+bG9ja19yZXNldCk7CisKIAkvKiBob2xkIG9uIHRoZSBzY2hl
ZHVsZXIgKi8KIAlmb3IgKGkgPSAwOyBpIDwgQU1ER1BVX01BWF9SSU5HUzsgaSsrKSB7CiAJCXN0
cnVjdCBhbWRncHVfcmluZyAqcmluZyA9IGFkZXYtPnJpbmdzW2ldOwpAQCAtODg0LDYgKzg4Nyw4
IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2RlYnVnZnNfdGVzdF9pYihzdHJ1Y3Qgc2VxX2ZpbGUgKm0s
IHZvaWQgKmRhdGEpCiAJCWt0aHJlYWRfdW5wYXJrKHJpbmctPnNjaGVkLnRocmVhZCk7CiAJfQog
CisJbXV0ZXhfdW5sb2NrKCZhZGV2LT5sb2NrX3Jlc2V0KTsKKwogCXJldHVybiAwOwogfQogCkBA
IC0xMDM2LDYgKzEwNDEsOSBAQCBzdGF0aWMgaW50IGFtZGdwdV9kZWJ1Z2ZzX2liX3ByZWVtcHQo
dm9pZCAqZGF0YSwgdTY0IHZhbCkKIAlpZiAoIWZlbmNlcykKIAkJcmV0dXJuIC1FTk9NRU07CiAK
KwkvKiBBdm9pZCBhY2NpZGVudGx5IHVucGFya2luZyB0aGUgc2NoZWQgdGhyZWFkIGR1cmluZyBH
UFUgcmVzZXQgKi8KKwltdXRleF9sb2NrKCZhZGV2LT5sb2NrX3Jlc2V0KTsKKwogCS8qIHN0b3Ag
dGhlIHNjaGVkdWxlciAqLwogCWt0aHJlYWRfcGFyayhyaW5nLT5zY2hlZC50aHJlYWQpOwogCkBA
IC0xMDc1LDYgKzEwODMsOCBAQCBzdGF0aWMgaW50IGFtZGdwdV9kZWJ1Z2ZzX2liX3ByZWVtcHQo
dm9pZCAqZGF0YSwgdTY0IHZhbCkKIAkvKiByZXN0YXJ0IHRoZSBzY2hlZHVsZXIgKi8KIAlrdGhy
ZWFkX3VucGFyayhyaW5nLT5zY2hlZC50aHJlYWQpOwogCisJbXV0ZXhfdW5sb2NrKCZhZGV2LT5s
b2NrX3Jlc2V0KTsKKwogCXR0bV9ib191bmxvY2tfZGVsYXllZF93b3JrcXVldWUoJmFkZXYtPm1t
YW4uYmRldiwgcmVzY2hlZCk7CiAKIAlpZiAoZmVuY2VzKQotLSAKMi4yMC4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
