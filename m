Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10218BCCF7
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 18:44:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2075E6EA6A;
	Tue, 24 Sep 2019 16:44:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C1966EA64;
 Tue, 24 Sep 2019 16:44:12 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2857320872;
 Tue, 24 Sep 2019 16:44:11 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.3 53/87] drm/amdgpu/sdma5: fix number of sdma5 trap
 irq types for navi1x
Date: Tue, 24 Sep 2019 12:41:09 -0400
Message-Id: <20190924164144.25591-53-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190924164144.25591-1-sashal@kernel.org>
References: <20190924164144.25591-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1569343451;
 bh=c7zXr1QtC0TThWpH9wNCX5riuVJELFhrzHMZGgtypPA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QCtP2ZkeJkep2VHzmlKV+RjZJFyOmIWHFS2tQZ6x8w/XmdbxUaFsKOackClOP95P9
 7tsycYBEuzoLZ5wKTs5fD0t0ltIsrbbz6LAoLHGszKcigj5pa3LDIRxSxutmCNtx2w
 dZTwRAR7ff2hk6CRtdOpK/TpcAcgzpnL6/23jVl4=
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
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Xiaojie Yuan <xiaojie.yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KClsgVXBzdHJlYW0gY29t
bWl0IDllNDg0OTUwMTczNDJjNWQ0NDViMjVlZWRkODZkNmZkODg0YTY0OTYgXQoKdjI6IHNldCBu
dW1fdHlwZXMgYmFzZWQgb24gbnVtX2luc3RhbmNlcwoKbmF2aTF4IGhhcyAyIHNkbWEgZW5naW5l
cyBidXQgY29tbWl0CiJlN2I1OGQwM2I2NzggZHJtL2FtZGdwdTogcmVvcmdhbml6ZSBzZG1hIHY0
IGNvZGUgdG8gc3VwcG9ydCBtb3JlIGluc3RhbmNlcyIKY2hhbmdlcyB0aGUgbWF4IG51bWJlciBv
ZiBzZG1hIGlycSB0eXBlcyAoQU1ER1BVX1NETUFfSVJRX0xBU1QpIGZyb20gMiB0byA4CndoaWNo
IGNhdXNlcyBhbWRncHVfaXJxX2dwdV9yZXNldF9yZXN1bWVfaGVscGVyKCkgdG8gcmVjb3ZlciBp
cnEgb2Ygc2RtYQplbmdpbmVzIHdpdGggZm9sbG93aW5nIGxvZ2ljOgoKKGVuYWJsZSBpcnEgZm9y
IHNkbWEwKSAqIDEgdGltZQooZW5hYmxlIGlycSBmb3Igc2RtYTEpICogMSB0aW1lCihkaXNhYmxl
IGlycSBmb3Igc2RtYTEpICogNiB0aW1lcwoKYXMgYSByZXN1bHQsIGFmdGVyIGdwdSByZXNldCwg
aW50ZXJydXB0IGZvciBzZG1hMSBpcyBsb3N0LgoKU2lnbmVkLW9mZi1ieTogWGlhb2ppZSBZdWFu
IDx4aWFvamllLnl1YW5AYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFu
ZGVyLmRldWNoZXJAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5k
ZXIuZGV1Y2hlckBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtl
cm5lbC5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NV8wLmMgfCAz
ICsrLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjVfMC5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NV8wLmMKaW5kZXggMzc0N2MzZjFmMGNjOC4uMTVj
MzcxZmFjNDY5ZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92
NV8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NV8wLmMKQEAgLTE1
ODMsNyArMTU4Myw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYW1kZ3B1X2lycV9zcmNfZnVuY3Mg
c2RtYV92NV8wX2lsbGVnYWxfaW5zdF9pcnFfZnVuY3MgPSB7CiAKIHN0YXRpYyB2b2lkIHNkbWFf
djVfMF9zZXRfaXJxX2Z1bmNzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogewotCWFkZXYt
PnNkbWEudHJhcF9pcnEubnVtX3R5cGVzID0gQU1ER1BVX1NETUFfSVJRX0xBU1Q7CisJYWRldi0+
c2RtYS50cmFwX2lycS5udW1fdHlwZXMgPSBBTURHUFVfU0RNQV9JUlFfSU5TVEFOQ0UwICsKKwkJ
CQkJYWRldi0+c2RtYS5udW1faW5zdGFuY2VzOwogCWFkZXYtPnNkbWEudHJhcF9pcnEuZnVuY3Mg
PSAmc2RtYV92NV8wX3RyYXBfaXJxX2Z1bmNzOwogCWFkZXYtPnNkbWEuaWxsZWdhbF9pbnN0X2ly
cS5mdW5jcyA9ICZzZG1hX3Y1XzBfaWxsZWdhbF9pbnN0X2lycV9mdW5jczsKIH0KLS0gCjIuMjAu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
