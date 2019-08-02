Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD287F864
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 15:20:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 857CD6EE28;
	Fri,  2 Aug 2019 13:20:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7676A6EE28;
 Fri,  2 Aug 2019 13:20:14 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 68BE821849;
 Fri,  2 Aug 2019 13:20:13 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 18/76] drm/amd/display: Wait for backlight
 programming completion in set backlight level
Date: Fri,  2 Aug 2019 09:18:52 -0400
Message-Id: <20190802131951.11600-18-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190802131951.11600-1-sashal@kernel.org>
References: <20190802131951.11600-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1564752014;
 bh=MyptE6f8k+92LRAEm6ghXCPrsdPU0qjbt9hN9P9BSic=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Zk2qVf0Y8IHNjJh3bXA9+FLNCZ0dvxweamFczIF0OQZK5J2ywrS2cOKdsgH5JmUyn
 X2LTowJ+iCGmstPN8uUhPd8TFr6ExitEkgbKHBXPq4DpHtrBw5d2ia/JZrowmKaAQj
 7Es1Vs+U3ENH+heuzkby/0uYlICrXKWOn7EEigSo=
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
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Anthony Koo <Anthony.Koo@amd.com>,
 SivapiriyanKumarasamy <sivapiriyan.kumarasamy@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2l2YXBpcml5YW5LdW1hcmFzYW15IDxzaXZhcGlyaXlhbi5rdW1hcmFzYW15QGFtZC5j
b20+CgpbIFVwc3RyZWFtIGNvbW1pdCBjNzk5MGRhZWJlNzFkMTFhOWUzNjBiNWMzYjBlY2QxODQ2
YTNhNGJiIF0KCltXSFldCkN1cnJlbnRseSB3ZSBkb24ndCB3YWl0IGZvciBibGFja2xpZ2h0IHBy
b2dyYW1taW5nIGNvbXBsZXRpb24gaW4gRE1DVQp3aGVuIHNldHRpbmcgYmFja2xpZ2h0IGxldmVs
LiBTb21lIHNlcXVlbmNlcyBzdWNoIGFzIFBTUiBzdGF0aWMgc2NyZWVuCmV2ZW50IHRyaWdnZXIg
cmVwcm9ncmFtbWluZyByZXF1aXJlcyBpdCB0byBiZSBjb21wbGV0ZS4KCltIb3ddCkFkZCBnZW5l
cmljIHdhaXQgZm9yIGRtY3UgY29tbWFuZCBjb21wbGV0aW9uIGluIHNldCBiYWNrbGlnaHQgbGV2
ZWwuCgpTaWduZWQtb2ZmLWJ5OiBTaXZhcGlyaXlhbkt1bWFyYXNhbXkgPHNpdmFwaXJpeWFuLmt1
bWFyYXNhbXlAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEFudGhvbnkgS29vIDxBbnRob255Lktvb0Bh
bWQuY29tPgpBY2tlZC1ieTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+ClNpZ25lZC1vZmYt
Ynk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KU2lnbmVkLW9mZi1i
eTogU2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9kY2UvZGNlX2FibS5jIHwgNCArKysrCiAxIGZpbGUgY2hhbmdlZCwgNCBp
bnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2RjZS9kY2VfYWJtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9h
Ym0uYwppbmRleCAyOTU5YzNjOTM5MGI5Li5kYTMwYWUwNGU4MmJiIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9hYm0uYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9hYm0uYwpAQCAtMjM0LDYgKzIzNCwxMCBAQCBz
dGF0aWMgdm9pZCBkbWN1X3NldF9iYWNrbGlnaHRfbGV2ZWwoCiAJczIgfD0gKGJhY2tsaWdodF84
X2JpdCA8PCBBVE9NX1MyX0NVUlJFTlRfQkxfTEVWRUxfU0hJRlQpOwogCiAJUkVHX1dSSVRFKEJJ
T1NfU0NSQVRDSF8yLCBzMik7CisKKwkvKiB3YWl0RE1DVVJlYWR5Rm9yQ21kICovCisJUkVHX1dB
SVQoTUFTVEVSX0NPTU1fQ05UTF9SRUcsIE1BU1RFUl9DT01NX0lOVEVSUlVQVCwKKwkJCTAsIDEs
IDgwMDAwKTsKIH0KIAogc3RhdGljIHZvaWQgZGNlX2FibV9pbml0KHN0cnVjdCBhYm0gKmFibSkK
LS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
