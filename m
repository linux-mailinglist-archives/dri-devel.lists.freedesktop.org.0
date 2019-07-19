Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B80A96DB45
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 06:08:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A99846E544;
	Fri, 19 Jul 2019 04:08:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B48D26E542;
 Fri, 19 Jul 2019 04:08:28 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C1C6021872;
 Fri, 19 Jul 2019 04:08:27 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 026/101] drm/amd/display: Always allocate initial
 connector state state
Date: Fri, 19 Jul 2019 00:06:17 -0400
Message-Id: <20190719040732.17285-26-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190719040732.17285-1-sashal@kernel.org>
References: <20190719040732.17285-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1563509308;
 bh=DYiF5DgPJpZupVqJuk1jG1zwZm28TFhMhfDz8SNFOYU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AL/v9sg0vmmvQB5ByrqK3FiHDwbvqFpICTQWrFWdpi9PyjjNftDbZ3K87alJvkW/l
 3c0o0WeubH3YQ8lgNJpx2l/zoS2/yB6qqrQESmemKDD5XGaLb2hyazIAsRx85TBn7D
 MY4ynxwTvr1FuU7+TEE5NpW8EeGd5GmUqGMoBDWk=
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
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTmljaG9sYXMgS2F6bGF1c2thcyA8bmljaG9sYXMua2F6bGF1c2thc0BhbWQuY29tPgoK
WyBVcHN0cmVhbSBjb21taXQgZjA0YmVlMzRkNmUzNWRmMjZjYmIyZDY1ZTgwMWFkZmQwZDhmZTIw
ZCBdCgpbV2h5XQpVbmxpa2Ugb3VyIHJlZ3VsYXIgY29ubmVjdG9ycywgTVNUIGNvbm5lY3RvcnMg
ZG9uJ3Qgc3RhcnQgb2ZmIHdpdGgKYW4gaW5pdGlhbCBjb25uZWN0b3Igc3RhdGUuIFRoaXMgY2F1
c2VzIGEgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlIHRvCm9jY3VyIHdoZW4gYXR0YWNoaW5nIHRo
ZSBicGMgcHJvcGVydHkgc2luY2UgaXQgdHJpZXMgdG8gbW9kaWZ5IHRoZQpjb25uZWN0b3Igc3Rh
dGUuCgpXZSBuZWVkIGFuIGluaXRpYWwgY29ubmVjdG9yIHN0YXRlIG9uIHRoZSBjb25uZWN0b3Ig
dG8gYXZvaWQgdGhlIGNyYXNoLgoKW0hvd10KVXNlIG91ciByZXNldCBoZWxwZXIgdG8gYWxsb2Nh
dGUgYW4gaW5pdGlhbCBzdGF0ZSBhbmQgcmVzZXQgdGhlIHZhbHVlcwp0byB0aGVpciBkZWZhdWx0
cy4gV2Ugd2VyZSBhbHJlYWR5IGRvaW5nIHRoaXMgYmVmb3JlLCBqdXN0IG5vdCBmb3IKTVNUIGNv
bm5lY3RvcnMuCgpTaWduZWQtb2ZmLWJ5OiBOaWNob2xhcyBLYXpsYXVza2FzIDxuaWNob2xhcy5r
YXpsYXVza2FzQGFtZC5jb20+ClJldmlld2VkLWJ5OiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNv
bT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29t
PgpTaWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+Ci0tLQogZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyB8IDEwICsrKysr
KystLS0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVf
ZG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMK
aW5kZXggZGFjNzk3OGY1ZWUxLi4yMjFkZTI0MTUzNWEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwpAQCAtMzY0NCw2ICszNjQ0LDEz
IEBAIHZvaWQgYW1kZ3B1X2RtX2Nvbm5lY3Rvcl9pbml0X2hlbHBlcihzdHJ1Y3QgYW1kZ3B1X2Rp
c3BsYXlfbWFuYWdlciAqZG0sCiB7CiAJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSBkbS0+
ZGRldi0+ZGV2X3ByaXZhdGU7CiAKKwkvKgorCSAqIFNvbWUgb2YgdGhlIHByb3BlcnRpZXMgYmVs
b3cgcmVxdWlyZSBhY2Nlc3MgdG8gc3RhdGUsIGxpa2UgYnBjLgorCSAqIEFsbG9jYXRlIHNvbWUg
ZGVmYXVsdCBpbml0aWFsIGNvbm5lY3RvciBzdGF0ZSB3aXRoIG91ciByZXNldCBoZWxwZXIuCisJ
ICovCisJaWYgKGFjb25uZWN0b3ItPmJhc2UuZnVuY3MtPnJlc2V0KQorCQlhY29ubmVjdG9yLT5i
YXNlLmZ1bmNzLT5yZXNldCgmYWNvbm5lY3Rvci0+YmFzZSk7CisKIAlhY29ubmVjdG9yLT5jb25u
ZWN0b3JfaWQgPSBsaW5rX2luZGV4OwogCWFjb25uZWN0b3ItPmRjX2xpbmsgPSBsaW5rOwogCWFj
b25uZWN0b3ItPmJhc2UuaW50ZXJsYWNlX2FsbG93ZWQgPSBmYWxzZTsKQEAgLTM4MTEsOSArMzgx
OCw2IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2RtX2Nvbm5lY3Rvcl9pbml0KHN0cnVjdCBhbWRncHVf
ZGlzcGxheV9tYW5hZ2VyICpkbSwKIAkJCSZhY29ubmVjdG9yLT5iYXNlLAogCQkJJmFtZGdwdV9k
bV9jb25uZWN0b3JfaGVscGVyX2Z1bmNzKTsKIAotCWlmIChhY29ubmVjdG9yLT5iYXNlLmZ1bmNz
LT5yZXNldCkKLQkJYWNvbm5lY3Rvci0+YmFzZS5mdW5jcy0+cmVzZXQoJmFjb25uZWN0b3ItPmJh
c2UpOwotCiAJYW1kZ3B1X2RtX2Nvbm5lY3Rvcl9pbml0X2hlbHBlcigKIAkJZG0sCiAJCWFjb25u
ZWN0b3IsCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
