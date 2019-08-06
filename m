Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF39083BAD
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 23:37:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C99976E579;
	Tue,  6 Aug 2019 21:37:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ECE66E577;
 Tue,  6 Aug 2019 21:37:09 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 17ED1217F5;
 Tue,  6 Aug 2019 21:37:08 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 22/25] drm: msm: Fix add_gpu_components
Date: Tue,  6 Aug 2019 17:36:19 -0400
Message-Id: <20190806213624.20194-22-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190806213624.20194-1-sashal@kernel.org>
References: <20190806213624.20194-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1565127429;
 bh=ioeiOBeJWkKHkbgEEoKfZMOyEj0+R5WHsDnYwqLm8aQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Fn8S7sgupFnXIq+8xexL76JwOxrKXo3rqo9BQQHjU6VSkkW26Pj4WgyMMr0sUgP9J
 kmF0isouzy+WuOxiB4bAK9RCkbjzbFaPYmyCWTsLLvOAfwA/SVCrBrwEmki5JllEtB
 eBgNCUAIUu3BqDYhy2FcDauO/HEQpAgbVTRpWiao=
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
di5jCmluZGV4IGI5NzA0MjdlNTNhN2EuLjc3YzQ1YTJlYmQ4MzMgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9tc20vbXNtX2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2Ry
di5jCkBAIC0xMDYwLDcgKzEwNjAsOCBAQCBzdGF0aWMgaW50IGFkZF9ncHVfY29tcG9uZW50cyhz
dHJ1Y3QgZGV2aWNlICpkZXYsCiAJaWYgKCFucCkKIAkJcmV0dXJuIDA7CiAKLQlkcm1fb2ZfY29t
cG9uZW50X21hdGNoX2FkZChkZXYsIG1hdGNocHRyLCBjb21wYXJlX29mLCBucCk7CisJaWYgKG9m
X2RldmljZV9pc19hdmFpbGFibGUobnApKQorCQlkcm1fb2ZfY29tcG9uZW50X21hdGNoX2FkZChk
ZXYsIG1hdGNocHRyLCBjb21wYXJlX29mLCBucCk7CiAKIAlvZl9ub2RlX3B1dChucCk7CiAKLS0g
CjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
