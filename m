Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C968231D19
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jun 2019 15:27:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDE1089BA3;
	Sat,  1 Jun 2019 13:27:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 249F789B62
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jun 2019 13:27:14 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0DDCE273AD;
 Sat,  1 Jun 2019 13:27:12 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.4 43/56] video: hgafb: fix potential NULL pointer
 dereference
Date: Sat,  1 Jun 2019 09:25:47 -0400
Message-Id: <20190601132600.27427-43-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190601132600.27427-1-sashal@kernel.org>
References: <20190601132600.27427-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1559395634;
 bh=z+2iD4+/Ewj+1snXK5rNtGsBfX7fC0rrDwMCwJjU3FU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UlaKj1WiOSn1nUj5rEsoHtO0XRClOPdDkDZgzqO2EuoWxmP4FQ8hSfN2ApJ+13bDQ
 zwXW8mqfrRaBVCyl6aha4mg2lJB+POiPZ8+AiSU+NDhuTwE5BXzVZ9ERvWgkoIQaOb
 yrVTgcA1qk5lOJ557o568K2kOwJiAJpgbFJBA2fY=
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
Cc: Sasha Levin <sashal@kernel.org>, linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Kangjie Lu <kjlu@umn.edu>, dri-devel@lists.freedesktop.org,
 Ferenc Bakonyi <fero@drama.obuda.kando.hu>, Aditya Pakki <pakki001@umn.edu>,
 linux-nvidia@lists.surfsouth.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogS2FuZ2ppZSBMdSA8a2psdUB1bW4uZWR1PgoKWyBVcHN0cmVhbSBjb21taXQgZWM3ZjZh
YWQ1N2FkMjllNGU2NmNjMmUxOGUxZTE1OTlkZGIwMjU0MiBdCgpXaGVuIGlvcmVtYXAgZmFpbHMs
IGhnYV92cmFtIHNob3VsZCBub3QgYmUgZGVyZWZlcmVuY2VkLiBUaGUgZml4CmNoZWNrIHRoZSBm
YWlsdXJlIHRvIGF2b2lkIE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZS4KClNpZ25lZC1vZmYtYnk6
IEthbmdqaWUgTHUgPGtqbHVAdW1uLmVkdT4KQ2M6IEFkaXR5YSBQYWtraSA8cGFra2kwMDFAdW1u
LmVkdT4KQ2M6IEZlcmVuYyBCYWtvbnlpIDxmZXJvQGRyYW1hLm9idWRhLmthbmRvLmh1PgpbYi56
b2xuaWVya2llOiBtaW5vciBwYXRjaCBzdW1tYXJ5IGZpeHVwXQpTaWduZWQtb2ZmLWJ5OiBCYXJ0
bG9taWVqIFpvbG5pZXJraWV3aWN6IDxiLnpvbG5pZXJraWVAc2Ftc3VuZy5jb20+ClNpZ25lZC1v
ZmYtYnk6IFNhc2hhIExldmluIDxzYXNoYWxAa2VybmVsLm9yZz4KLS0tCiBkcml2ZXJzL3ZpZGVv
L2ZiZGV2L2hnYWZiLmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9oZ2FmYi5jIGIvZHJpdmVycy92aWRlby9m
YmRldi9oZ2FmYi5jCmluZGV4IDE1ZDNjY2ZmMjk2NTQuLjRhMzk3YzdjMWI1NjAgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvaGdhZmIuYworKysgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2
L2hnYWZiLmMKQEAgLTI4NSw2ICsyODUsOCBAQCBzdGF0aWMgaW50IGhnYV9jYXJkX2RldGVjdCh2
b2lkKQogCWhnYV92cmFtX2xlbiAgPSAweDA4MDAwOwogCiAJaGdhX3ZyYW0gPSBpb3JlbWFwKDB4
YjAwMDAsIGhnYV92cmFtX2xlbik7CisJaWYgKCFoZ2FfdnJhbSkKKwkJZ290byBlcnJvcjsKIAog
CWlmIChyZXF1ZXN0X3JlZ2lvbigweDNiMCwgMTIsICJoZ2FmYiIpKQogCQlyZWxlYXNlX2lvX3Bv
cnRzID0gMTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
