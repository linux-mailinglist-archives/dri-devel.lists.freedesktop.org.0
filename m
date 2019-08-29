Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FFAA2364
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2019 20:15:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21C3A6E133;
	Thu, 29 Aug 2019 18:15:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0802F6E0E0;
 Thu, 29 Aug 2019 18:15:30 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 09DAC23403;
 Thu, 29 Aug 2019 18:15:28 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 65/76] drm/amdgpu: prevent memory leaks in
 AMDGPU_CS ioctl
Date: Thu, 29 Aug 2019 14:13:00 -0400
Message-Id: <20190829181311.7562-65-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190829181311.7562-1-sashal@kernel.org>
References: <20190829181311.7562-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1567102529;
 bh=daF/PX4Ijm80cFU8SbPUPm1tciP79fQ1UuLIBgd+6cQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ekIR7PTNPIiLkcRN2lZpzqWOCTeHU+qlFkpxr2MdvtnRkJ6pn+/Nv/GQec1BcJWip
 7yz0/Nn48qGiWXJxEscfPPH2sFkaJqQhSsXZHjNvL6i6qB1490zz0jq/mwEFD37Pgc
 bJvC2HxvjJ3ARCH+/5yVhP9j76q5GRqLU9Z6YU+o=
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
Cc: Sasha Levin <sashal@kernel.org>,
 =?UTF-8?q?Nicolai=20H=C3=A4hnle?= <nicolai.haehnle@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTmljb2xhaSBIw6RobmxlIDxuaWNvbGFpLmhhZWhubGVAYW1kLmNvbT4KClsgVXBzdHJl
YW0gY29tbWl0IDFhNzAxZWE5MjQ4MTViMDUxODczM2FhOGQ1ZDA1YzFmNmZhODcwNjIgXQoKRXJy
b3Igb3V0IGlmIHRoZSBBTURHUFVfQ1MgaW9jdGwgaXMgY2FsbGVkIHdpdGggbXVsdGlwbGUgU1lO
Q09CSl9PVVQgYW5kL29yClRJTUVMSU5FX1NJR05BTCBjaHVua3MsIHNpbmNlIG90aGVyd2lzZSB0
aGUgbGFzdCBjaHVuayB3aW5zIHdoaWxlIHRoZQphbGxvY2F0ZWQgYXJyYXkgYXMgd2VsbCBhcyB0
aGUgcmVmZXJlbmNlIGNvdW50cyBvZiBzeW5jIG9iamVjdHMgYXJlIGxlYWtlZC4KClNpZ25lZC1v
ZmYtYnk6IE5pY29sYWkgSMOkaG5sZSA8bmljb2xhaS5oYWVobmxlQGFtZC5jb20+ClJldmlld2Vk
LWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+ClNpZ25lZC1v
ZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KU2lnbmVkLW9m
Zi1ieTogU2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9jcy5jIHwgOSArKysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA3
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2NzLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfY3MuYwppbmRleCBmZTAyODU2MWRjMGU2Li5iYzQwZDZlYWJjZTdkIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3MuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3MuYwpAQCAtMTE5Miw2ICsxMTkyLDkgQEAgc3RhdGlj
IGludCBhbWRncHVfY3NfcHJvY2Vzc19zeW5jb2JqX291dF9kZXAoc3RydWN0IGFtZGdwdV9jc19w
YXJzZXIgKnAsCiAJbnVtX2RlcHMgPSBjaHVuay0+bGVuZ3RoX2R3ICogNCAvCiAJCXNpemVvZihz
dHJ1Y3QgZHJtX2FtZGdwdV9jc19jaHVua19zZW0pOwogCisJaWYgKHAtPnBvc3RfZGVwcykKKwkJ
cmV0dXJuIC1FSU5WQUw7CisKIAlwLT5wb3N0X2RlcHMgPSBrbWFsbG9jX2FycmF5KG51bV9kZXBz
LCBzaXplb2YoKnAtPnBvc3RfZGVwcyksCiAJCQkJICAgICBHRlBfS0VSTkVMKTsKIAlwLT5udW1f
cG9zdF9kZXBzID0gMDsKQEAgLTEyMTUsOCArMTIxOCw3IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2Nz
X3Byb2Nlc3Nfc3luY29ial9vdXRfZGVwKHN0cnVjdCBhbWRncHVfY3NfcGFyc2VyICpwLAogCiAK
IHN0YXRpYyBpbnQgYW1kZ3B1X2NzX3Byb2Nlc3Nfc3luY29ial90aW1lbGluZV9vdXRfZGVwKHN0
cnVjdCBhbWRncHVfY3NfcGFyc2VyICpwLAotCQkJCQkJICAgICAgc3RydWN0IGFtZGdwdV9jc19j
aHVuawotCQkJCQkJICAgICAgKmNodW5rKQorCQkJCQkJICAgICAgc3RydWN0IGFtZGdwdV9jc19j
aHVuayAqY2h1bmspCiB7CiAJc3RydWN0IGRybV9hbWRncHVfY3NfY2h1bmtfc3luY29iaiAqc3lu
Y29ial9kZXBzOwogCXVuc2lnbmVkIG51bV9kZXBzOwpAQCAtMTIyNiw2ICsxMjI4LDkgQEAgc3Rh
dGljIGludCBhbWRncHVfY3NfcHJvY2Vzc19zeW5jb2JqX3RpbWVsaW5lX291dF9kZXAoc3RydWN0
IGFtZGdwdV9jc19wYXJzZXIgKnAKIAludW1fZGVwcyA9IGNodW5rLT5sZW5ndGhfZHcgKiA0IC8K
IAkJc2l6ZW9mKHN0cnVjdCBkcm1fYW1kZ3B1X2NzX2NodW5rX3N5bmNvYmopOwogCisJaWYgKHAt
PnBvc3RfZGVwcykKKwkJcmV0dXJuIC1FSU5WQUw7CisKIAlwLT5wb3N0X2RlcHMgPSBrbWFsbG9j
X2FycmF5KG51bV9kZXBzLCBzaXplb2YoKnAtPnBvc3RfZGVwcyksCiAJCQkJICAgICBHRlBfS0VS
TkVMKTsKIAlwLT5udW1fcG9zdF9kZXBzID0gMDsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
