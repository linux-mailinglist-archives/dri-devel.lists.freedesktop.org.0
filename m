Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 651D4A6E43
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 18:26:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E08F897DC;
	Tue,  3 Sep 2019 16:26:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C4C789780;
 Tue,  3 Sep 2019 16:25:59 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0D79723711;
 Tue,  3 Sep 2019 16:25:57 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 022/167] powerplay: Respect units on max dcfclk
 watermark
Date: Tue,  3 Sep 2019 12:22:54 -0400
Message-Id: <20190903162519.7136-22-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190903162519.7136-1-sashal@kernel.org>
References: <20190903162519.7136-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1567527958;
 bh=HlB0kFLFJRGc5nkzsNDy3iGdtD6dK1xJYjtH+voD000=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=npMS1YpbXaEj9TVharNKA4Q+6JltSwqq7jBZoQSrYfBjLVW6XYCtW0Yg5MeXa0F8g
 PR2YQlI0OQZP98nFYnqVS6+lLp4hmInNQH1wf2cH9Y/GkeYcqmY2LB2DxanQLNtPWx
 93Mb2LaDxtL7E1/haaYkc6tBXOmCZMyh1EGbyWoQ=
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
Cc: Sasha Levin <sashal@kernel.org>, David Francis <David.Francis@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRGF2aWQgRnJhbmNpcyA8RGF2aWQuRnJhbmNpc0BhbWQuY29tPgoKWyBVcHN0cmVhbSBj
b21taXQgZjE5MTQxNWIyNGEzYWQzZmEyMjA4OGFmN2NkN2ZjMzI4YTJmNDY5ZiBdCgpJbiBhIHJl
ZmFjdG9yLCB0aGUgd2F0ZXJtYXJrIGNsb2NrIGlucHV0cyB0bwpwb3dlcnBsYXkgZnJvbSBEQyB3
ZXJlIGNoYW5nZWQgZnJvbSB1bml0cyBvZiAxMGtIeiB0bwprSHogY2xvY2tzLgoKT25lIGRpdmlz
aW9uIGJ5IDEwMCB3YXMgbm90IGNvbnZlcnRlZCBpbnRvIGEgZGl2aXNpb24KYnkgMTAwMC4KClNp
Z25lZC1vZmYtYnk6IERhdmlkIEZyYW5jaXMgPERhdmlkLkZyYW5jaXNAYW1kLmNvbT4KUmV2aWV3
ZWQtYnk6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPgpTaWduZWQtb2Zm
LWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+ClNpZ25lZC1vZmYt
Ynk6IFNhc2hhIExldmluIDxzYXNoYWxAa2VybmVsLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
YW1kL3Bvd2VycGxheS9od21nci9zbXVfaGVscGVyLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL3Bvd2VycGxheS9od21nci9zbXVfaGVscGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L3Bvd2VycGxheS9od21nci9zbXVfaGVscGVyLmMKaW5kZXggMmFhYjFiNDc1OTQ1OS4uYTMyMWM0
NjViN2RjZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3Iv
c211X2hlbHBlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3Nt
dV9oZWxwZXIuYwpAQCAtNjc0LDcgKzY3NCw3IEBAIGludCBzbXVfc2V0X3dhdGVybWFya3NfZm9y
X2Nsb2Nrc19yYW5nZXModm9pZCAqd3RfdGFibGUsCiAJCXRhYmxlLT5XYXRlcm1hcmtSb3dbMV1b
aV0uTWF4Q2xvY2sgPQogCQkJY3B1X3RvX2xlMTYoKHVpbnQxNl90KQogCQkJKHdtX3dpdGhfY2xv
Y2tfcmFuZ2VzLT53bV9kbWlmX2Nsb2Nrc19yYW5nZXNbaV0ud21fbWF4X2RjZmNsa19jbGtfaW5f
a2h6KSAvCi0JCQkxMDApOworCQkJMTAwMCk7CiAJCXRhYmxlLT5XYXRlcm1hcmtSb3dbMV1baV0u
TWluVWNsayA9CiAJCQljcHVfdG9fbGUxNigodWludDE2X3QpCiAJCQkod21fd2l0aF9jbG9ja19y
YW5nZXMtPndtX2RtaWZfY2xvY2tzX3Jhbmdlc1tpXS53bV9taW5fbWVtX2Nsa19pbl9raHopIC8K
LS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
