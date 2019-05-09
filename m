Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9237219056
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2019 20:44:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9491A89EB4;
	Thu,  9 May 2019 18:44:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89A1089EB4
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2019 18:44:07 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DD1D02182B;
 Thu,  9 May 2019 18:44:06 +0000 (UTC)
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 4.9 14/28] drm/mediatek: fix possible object reference leak
Date: Thu,  9 May 2019 20:42:06 +0200
Message-Id: <20190509181253.142746342@linuxfoundation.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190509181247.647767531@linuxfoundation.org>
References: <20190509181247.647767531@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1557427447;
 bh=IMwpLaU7gYGHD0ENoQFEavG1anlK5ZDetiYNVj2a3Ig=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gsWjKSuhGv7ZLhEyKWShBdIyEUN5EmdWrL80+E59B9lD3GxmYTTedLy2P1cjOM95X
 UXBqmzXbcmlr0BSw15MGnIobmcOFrKVTzeGGaZxYfasbouxlnTEfE7dJ22d/MS2MAa
 BR6tT5N/0pC1V0JDBlzQMMnR1J4Ue8IS1XN3L728=
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
Cc: Sasha Levin <sashal@kernel.org>, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Wen Yang <wen.yang99@zte.com.cn>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

WyBVcHN0cmVhbSBjb21taXQgMmFlMmMzMzE2ZmI3N2RjZjY0Mjc1ZDAxMTU5NmI2MDEwNGM0NTQy
NiBdCgpUaGUgY2FsbCB0byBvZl9wYXJzZV9waGFuZGxlIHJldHVybnMgYSBub2RlIHBvaW50ZXIg
d2l0aCByZWZjb3VudAppbmNyZW1lbnRlZCB0aHVzIGl0IG11c3QgYmUgZXhwbGljaXRseSBkZWNy
ZW1lbnRlZCBhZnRlciB0aGUgbGFzdAp1c2FnZS4KCkRldGVjdGVkIGJ5IGNvY2NpbmVsbGUgd2l0
aCB0aGUgZm9sbG93aW5nIHdhcm5pbmdzOgpkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hk
bWkuYzoxNTIxOjItODogRVJST1I6IG1pc3Npbmcgb2Zfbm9kZV9wdXQ7IGFjcXVpcmVkIGEgbm9k
ZSBwb2ludGVyIHdpdGggcmVmY291bnQgaW5jcmVtZW50ZWQgb24gbGluZSAxNTA5LCBidXQgd2l0
aG91dCBhIGNvcnJlc3BvbmRpbmcgb2JqZWN0IHJlbGVhc2Ugd2l0aGluIHRoaXMgZnVuY3Rpb24u
CmRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jOjE1MjQ6MS03OiBFUlJPUjogbWlz
c2luZyBvZl9ub2RlX3B1dDsgYWNxdWlyZWQgYSBub2RlIHBvaW50ZXIgd2l0aCByZWZjb3VudCBp
bmNyZW1lbnRlZCBvbiBsaW5lIDE1MDksIGJ1dCB3aXRob3V0IGEgY29ycmVzcG9uZGluZyBvYmpl
Y3QgcmVsZWFzZSB3aXRoaW4gdGhpcyBmdW5jdGlvbi4KClNpZ25lZC1vZmYtYnk6IFdlbiBZYW5n
IDx3ZW4ueWFuZzk5QHp0ZS5jb20uY24+CkNjOiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPgpD
YzogUGhpbGlwcCBaYWJlbCA8cC56YWJlbEBwZW5ndXRyb25peC5kZT4KQ2M6IERhdmlkIEFpcmxp
ZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4K
Q2M6IE1hdHRoaWFzIEJydWdnZXIgPG1hdHRoaWFzLmJnZ0BnbWFpbC5jb20+CkNjOiBkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJh
ZGVhZC5vcmcKQ2M6IGxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKQ2M6IGxpbnV4
LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcKU2lnbmVkLW9mZi1ieTogQ0sgSHUgPGNrLmh1QG1lZGlh
dGVrLmNvbT4KU2lnbmVkLW9mZi1ieTogU2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwub3JnPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jIHwgMSArCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2hkbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jCmluZGV4
IDIwMGY3NWUxZDYxOTguLmU3YTY2NTFjZWVhYjEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfaGRtaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
aGRtaS5jCkBAIC0xNTI4LDYgKzE1MjgsNyBAQCBzdGF0aWMgaW50IG10a19oZG1pX2R0X3BhcnNl
X3BkYXRhKHN0cnVjdCBtdGtfaGRtaSAqaGRtaSwKIAlvZl9ub2RlX3B1dChyZW1vdGUpOwogCiAJ
aGRtaS0+ZGRjX2FkcHQgPSBvZl9maW5kX2kyY19hZGFwdGVyX2J5X25vZGUoaTJjX25wKTsKKwlv
Zl9ub2RlX3B1dChpMmNfbnApOwogCWlmICghaGRtaS0+ZGRjX2FkcHQpIHsKIAkJZGV2X2Vycihk
ZXYsICJGYWlsZWQgdG8gZ2V0IGRkYyBpMmMgYWRhcHRlciBieSBub2RlXG4iKTsKIAkJcmV0dXJu
IC1FSU5WQUw7Ci0tIAoyLjIwLjEKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
