Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 264D983B45
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 23:34:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 856D76E55F;
	Tue,  6 Aug 2019 21:34:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BCB66E55E;
 Tue,  6 Aug 2019 21:34:15 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B1693216F4;
 Tue,  6 Aug 2019 21:34:14 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 29/59] drm/amdkfd: Fix byte align on VegaM
Date: Tue,  6 Aug 2019 17:32:49 -0400
Message-Id: <20190806213319.19203-29-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190806213319.19203-1-sashal@kernel.org>
References: <20190806213319.19203-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1565127255;
 bh=gK56fSYyRsg25NtN0vMOBKtrbqwKisNofmHMCKKZoVg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SI55ORxq7BAI2m1E0CxdQhDfnXfuSCb6uaW6K20z+/pwHx8jxHoA9FqaHO5XQTtj/
 id9C8LDNqRD2dGW2zotDZr1zmpmVIwiwlYVh5EyfiHUl+xUyqKG1oDyeFfNF/iS0Jz
 mH2yUkP5Y2vTGSxryfxk7f8XHsAwY7W02c8J0HkU=
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
 amd-gfx@lists.freedesktop.org, Kent Russell <kent.russell@amd.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogS2VudCBSdXNzZWxsIDxrZW50LnJ1c3NlbGxAYW1kLmNvbT4KClsgVXBzdHJlYW0gY29t
bWl0IGQ2NTg0ODY1N2MzZGE1YzBkNGI2ODVmODIzZDAyMzBmMTUxYWIzNGUgXQoKVGhpcyB3YXMg
bWlzc2VkIGR1cmluZyB0aGUgYWRkaXRpb24gb2YgVmVnYU0gc3VwcG9ydAoKUmV2aWV3ZWQtYnk6
IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTog
S2VudCBSdXNzZWxsIDxrZW50LnJ1c3NlbGxAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBE
ZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBTYXNoYSBM
ZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2FtZGtmZF9ncHV2bS5jIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfYW1ka2ZkX2dwdXZtLmMKaW5kZXggNGIxOTJlMGNlOTJmNC4uZWQ3OTc3ZDBkZDAxOCAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2
bS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0u
YwpAQCAtMTE0OCw3ICsxMTQ4LDggQEAgaW50IGFtZGdwdV9hbWRrZmRfZ3B1dm1fYWxsb2NfbWVt
b3J5X29mX2dwdSgKIAkJCWFkZXYtPmFzaWNfdHlwZSAhPSBDSElQX0ZJSkkgJiYKIAkJCWFkZXYt
PmFzaWNfdHlwZSAhPSBDSElQX1BPTEFSSVMxMCAmJgogCQkJYWRldi0+YXNpY190eXBlICE9IENI
SVBfUE9MQVJJUzExICYmCi0JCQlhZGV2LT5hc2ljX3R5cGUgIT0gQ0hJUF9QT0xBUklTMTIpID8K
KwkJCWFkZXYtPmFzaWNfdHlwZSAhPSBDSElQX1BPTEFSSVMxMiAmJgorCQkJYWRldi0+YXNpY190
eXBlICE9IENISVBfVkVHQU0pID8KIAkJCVZJX0JPX1NJWkVfQUxJR04gOiAxOwogCiAJbWFwcGlu
Z19mbGFncyA9IEFNREdQVV9WTV9QQUdFX1JFQURBQkxFOwotLSAKMi4yMC4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
