Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4F71F22CD
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jun 2020 01:11:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEA876E0BE;
	Mon,  8 Jun 2020 23:11:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00AC06E0A0;
 Mon,  8 Jun 2020 23:11:01 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E42EF2100A;
 Mon,  8 Jun 2020 23:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591657861;
 bh=FSSEj0I+Qs96LnMPO/9ObpRwOVHhKyOHosCzGUsdNQk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nY3tjfeOqLqgfHbWwjoH5T27o3y8gH28q9tJMm/TN+uLkzmsmETD7q9GbZGbt3Fzk
 x6UXe4Of/sKdjqdk6XzkpyLFiBUxWY38cM+xhfdeKmOGyi2QZWaQ+AdNoehyxmQ59V
 ZXutCAWtYP3Li6wveroouNtF2jTLn7h+SzEQ7WoM=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.7 224/274] drm/amdgpu: Sync with VM root BO when
 switching VM to CPU update mode
Date: Mon,  8 Jun 2020 19:05:17 -0400
Message-Id: <20200608230607.3361041-224-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200608230607.3361041-1-sashal@kernel.org>
References: <20200608230607.3361041-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Jay Cornwall <Jay.Cornwall@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRmVsaXggS3VlaGxpbmcgPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+CgpbIFVwc3RyZWFt
IGNvbW1pdCA5MGNhNzhkZWIwMDRhYmU3NWI1MDI0OTY4YTE5OWFjYjk2YmI3MGY5IF0KClRoaXMg
Zml4ZXMgYW4gaW50ZXJtaXR0ZW50IGJ1ZyB3aGVyZSBhIHJvb3QgUEQgY2xlYXIgb3BlcmF0aW9u
IHN0aWxsIGluCnByb2dyZXNzIGNvdWxkIG92ZXJ3cml0ZSBhIFBERSB1cGRhdGUgZG9uZSBieSB0
aGUgQ1BVLCByZXN1bHRpbmcgaW4gYQpWTSBmYXVsdC4KCkZpeGVzOiAxMDhiNGQ5MjhjMDMgKCJk
cm0vYW1kL2FtZGdwdTogVXBkYXRlIFZNIGZ1bmN0aW9uIHBvaW50ZXIiKQpSZXBvcnRlZC1ieTog
SmF5IENvcm53YWxsIDxKYXkuQ29ybndhbGxAYW1kLmNvbT4KVGVzdGVkLWJ5OiBKYXkgQ29ybndh
bGwgPEpheS5Db3Jud2FsbEBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBGZWxpeCBLdWVobGluZyA8
RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNo
cmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4
YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFs
QGtlcm5lbC5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMg
fCAxMSArKysrKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
dm0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jCmluZGV4IDZkOTI1
MmEyNzkxNi4uMDYyNDIwOTY5NzNjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfdm0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
dm0uYwpAQCAtMjk5NiwxMCArMjk5NiwxNyBAQCBpbnQgYW1kZ3B1X3ZtX21ha2VfY29tcHV0ZShz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgc3RydWN0IGFtZGdwdV92bSAqdm0sCiAJCSAgICFh
bWRncHVfZ21jX3ZyYW1fZnVsbF92aXNpYmxlKCZhZGV2LT5nbWMpKSwKIAkJICAiQ1BVIHVwZGF0
ZSBvZiBWTSByZWNvbW1lbmRlZCBvbmx5IGZvciBsYXJnZSBCQVIgc3lzdGVtXG4iKTsKIAotCWlm
ICh2bS0+dXNlX2NwdV9mb3JfdXBkYXRlKQorCWlmICh2bS0+dXNlX2NwdV9mb3JfdXBkYXRlKSB7
CisJCS8qIFN5bmMgd2l0aCBsYXN0IFNETUEgdXBkYXRlL2NsZWFyIGJlZm9yZSBzd2l0Y2hpbmcg
dG8gQ1BVICovCisJCXIgPSBhbWRncHVfYm9fc3luY193YWl0KHZtLT5yb290LmJhc2UuYm8sCisJ
CQkJCUFNREdQVV9GRU5DRV9PV05FUl9VTkRFRklORUQsIHRydWUpOworCQlpZiAocikKKwkJCWdv
dG8gZnJlZV9pZHI7CisKIAkJdm0tPnVwZGF0ZV9mdW5jcyA9ICZhbWRncHVfdm1fY3B1X2Z1bmNz
OwotCWVsc2UKKwl9IGVsc2UgewogCQl2bS0+dXBkYXRlX2Z1bmNzID0gJmFtZGdwdV92bV9zZG1h
X2Z1bmNzOworCX0KIAlkbWFfZmVuY2VfcHV0KHZtLT5sYXN0X3VwZGF0ZSk7CiAJdm0tPmxhc3Rf
dXBkYXRlID0gTlVMTDsKIAl2bS0+aXNfY29tcHV0ZV9jb250ZXh0ID0gdHJ1ZTsKLS0gCjIuMjUu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
