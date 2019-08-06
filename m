Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C697183B64
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 23:35:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FC2D6E56D;
	Tue,  6 Aug 2019 21:34:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0810F6E56A;
 Tue,  6 Aug 2019 21:34:58 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 05E9C2089E;
 Tue,  6 Aug 2019 21:34:56 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 49/59] drm: msm: Fix add_gpu_components
Date: Tue,  6 Aug 2019 17:33:09 -0400
Message-Id: <20190806213319.19203-49-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190806213319.19203-1-sashal@kernel.org>
References: <20190806213319.19203-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1565127297;
 bh=NK3Gu0440IlcmUfslpeJUoyzrVonh+nts5KJQ4s0wiY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=xaesQYG/jCLbLYe8a4Sqc30N8fyxOlnqSHb3EM699B+4gB3E1KgTPdeGY04n5lS75
 AVXu5FbqCTYj3E6fKHEBfhL/ZTfwfgSzhUwiwar+d2S9dzQIw+mmBSCrwIO0GzT2rz
 SAeMEoIxd2NWHhK9+RTIirXyrjFqRqiYgyVUrzhg=
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
Cc: Sasha Levin <sashal@kernel.org>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sean Paul <seanpaul@chromium.org>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSmVmZnJleSBIdWdvIDxqZWZmcmV5LmwuaHVnb0BnbWFpbC5jb20+CgpbIFVwc3RyZWFt
IGNvbW1pdCA5Y2E3YWQ2Yzc3MDZlZGVhZTMzMWMxNjMyZDBjNjM4OTc0MThlYmFkIF0KCmFkZF9n
cHVfY29tcG9uZW50cygpIGFkZHMgZm91bmQgR1BVIG5vZGVzIGZyb20gdGhlIERUIHRvIHRoZSBt
YXRjaCBsaXN0LApyZWdhcmRsZXNzIG9mIHRoZSBzdGF0dXMgb2YgdGhlIG5vZGVzLiAgVGhpcyBp
cyBhIHByb2JsZW0sIGJlY2F1c2UgaWYgdGhlCm5vZGVzIGFyZSBkaXNhYmxlZCwgdGhleSBzaG91
bGQgbm90IGJlIG9uIHRoZSBtYXRjaCBsaXN0IGJlY2F1c2UgdGhleSB3aWxsCm5vdCBiZSBtYXRj
aGVkLiAgVGhpcyBwcmV2ZW50cyBkaXNwbGF5IGZyb20gaW5pdGluZyBpZiBhIEdQVSBub2RlIGlz
CmRlZmluZWQsIGJ1dCBpdCdzIHN0YXR1cyBpcyBkaXNhYmxlZC4KCkZpeCB0aGlzIGJ5IGNoZWNr
aW5nIHRoZSBub2RlJ3Mgc3RhdHVzIGJlZm9yZSBhZGRpbmcgaXQgdG8gdGhlIG1hdGNoIGxpc3Qu
CgpGaXhlczogZGMzZWEyNjViODU2IChkcm0vbXNtOiBEcm9wIHRoZSBncHUgYmluZGluZykKUmV2
aWV3ZWQtYnk6IFJvYiBDbGFyayA8cm9iZGNsYXJrQGdtYWlsLmNvbT4KU2lnbmVkLW9mZi1ieTog
SmVmZnJleSBIdWdvIDxqZWZmcmV5LmwuaHVnb0BnbWFpbC5jb20+ClNpZ25lZC1vZmYtYnk6IFNl
YW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgpMaW5rOiBodHRwczovL3BhdGNod29yay5m
cmVlZGVza3RvcC5vcmcvcGF0Y2gvbXNnaWQvMjAxOTA2MjYxODAwMTUuNDUyNDItMS1qZWZmcmV5
LmwuaHVnb0BnbWFpbC5jb20KU2lnbmVkLW9mZi1ieTogU2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJu
ZWwub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2Rydi5jIHwgMyArKy0KIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vbXNtL21zbV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2Ry
di5jCmluZGV4IDRhMGZlOGEyNWFkNzcuLmE1NmVlZjNjZmVlNzggMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9tc20vbXNtX2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2Ry
di5jCkBAIC0xMjY3LDcgKzEyNjcsOCBAQCBzdGF0aWMgaW50IGFkZF9ncHVfY29tcG9uZW50cyhz
dHJ1Y3QgZGV2aWNlICpkZXYsCiAJaWYgKCFucCkKIAkJcmV0dXJuIDA7CiAKLQlkcm1fb2ZfY29t
cG9uZW50X21hdGNoX2FkZChkZXYsIG1hdGNocHRyLCBjb21wYXJlX29mLCBucCk7CisJaWYgKG9m
X2RldmljZV9pc19hdmFpbGFibGUobnApKQorCQlkcm1fb2ZfY29tcG9uZW50X21hdGNoX2FkZChk
ZXYsIG1hdGNocHRyLCBjb21wYXJlX29mLCBucCk7CiAKIAlvZl9ub2RlX3B1dChucCk7CiAKLS0g
CjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
