Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3F831CBB
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jun 2019 15:24:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 465FD89C59;
	Sat,  1 Jun 2019 13:24:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7266389C52
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jun 2019 13:24:35 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 95595264C3;
 Sat,  1 Jun 2019 13:24:34 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 21/99] drm/bridge: adv7511: Fix low refresh rate
 selection
Date: Sat,  1 Jun 2019 09:22:28 -0400
Message-Id: <20190601132346.26558-21-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190601132346.26558-1-sashal@kernel.org>
References: <20190601132346.26558-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1559395475;
 bh=L1l+bDPGzWMLLpyThuWyfRXFsi+ClQ8hhC2jhdWIYaA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HOnd+csCf6mTbj9HWWvyP57y2OK+4wc8Kvqg2o6ucf2M48svkkQv560s+i63YxbRf
 S/XMKeIyQnnPR//pVSTEClFomr+P1z3BLrl4vv+N8cHmb1lGVCvhjS5g+7LCS08ime
 KN2OquNYm4s021bfEhtN9J4lPFgSNaOyD7xyBX7w=
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
Cc: Sasha Levin <sashal@kernel.org>, Sean Paul <seanpaul@chromium.org>,
 Matt Redfearn <matt.redfearn@thinci.com>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTWF0dCBSZWRmZWFybiA8bWF0dC5yZWRmZWFybkB0aGluY2kuY29tPgoKWyBVcHN0cmVh
bSBjb21taXQgNjc3OTNiZDNiMzk0OGRjOGM4Mzg0YjY0MzBlMDM2YTMwYTBlY2I0MyBdCgpUaGUg
ZHJpdmVyIGN1cnJlbnRseSBzZXRzIHJlZ2lzdGVyIDB4ZmIgKExvdyBSZWZyZXNoIFJhdGUpIGJh
c2VkIG9uIHRoZQp2YWx1ZSBvZiBtb2RlLT52cmVmcmVzaC4gRmlyc3RseSwgdGhpcyBmaWVsZCBp
cyBzcGVjaWZpZWQgdG8gYmUgaW4gSHosCmJ1dCB0aGUgbWFnaWMgbnVtYmVycyB1c2VkIGJ5IHRo
ZSBjb2RlIGFyZSBIeiAqIDEwMDAuIFRoaXMgZXNzZW50aWFsbHkKbGVhZHMgdG8gdGhlIGxvdyBy
ZWZyZXNoIHJhdGUgYWx3YXlzIGJlaW5nIHNldCB0byAweDAxLCBzaW5jZSB0aGUKdnJlZnJlc2gg
dmFsdWUgd2lsbCBhbHdheXMgYmUgbGVzcyB0aGFuIDI0MDAwLiBGaXggdGhlIG1hZ2ljIG51bWJl
cnMgdG8KYmUgaW4gSHouClNlY29uZGx5LCBhY2NvcmRpbmcgdG8gdGhlIGNvbW1lbnQgaW4gZHJt
X21vZGVzLmgsIHRoZSBmaWVsZCBpcyBub3QKc3VwcG9zZWQgdG8gYmUgdXNlZCBpbiBhIGZ1bmN0
aW9uYWwgd2F5IGFueXdheS4gSW5zdGVhZCwgdXNlIHRoZSBoZWxwZXIKZnVuY3Rpb24gZHJtX21v
ZGVfdnJlZnJlc2goKS4KCkZpeGVzOiA5YzhhZjg4MmJmMTIgKCJkcm06IEFkZCBhZHY3NTExIGVu
Y29kZXIgZHJpdmVyIikKUmV2aWV3ZWQtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGlu
Y2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KU2lnbmVkLW9mZi1ieTogTWF0dCBSZWRmZWFybiA8bWF0
dC5yZWRmZWFybkB0aGluY2kuY29tPgpTaWduZWQtb2ZmLWJ5OiBTZWFuIFBhdWwgPHNlYW5wYXVs
QGNocm9taXVtLm9yZz4KTGluazogaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Bh
dGNoL21zZ2lkLzIwMTkwNDI0MTMyMjEwLjI2MzM4LTEtbWF0dC5yZWRmZWFybkB0aGluY2kuY29t
ClNpZ25lZC1vZmYtYnk6IFNhc2hhIExldmluIDxzYXNoYWxAa2VybmVsLm9yZz4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vYnJpZGdlL2Fkdjc1MTEvYWR2NzUxMV9kcnYuYyB8IDYgKysrLS0tCiAxIGZp
bGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYWR2NzUxMS9hZHY3NTExX2Rydi5jIGIvZHJpdmVycy9n
cHUvZHJtL2JyaWRnZS9hZHY3NTExL2Fkdjc1MTFfZHJ2LmMKaW5kZXggZjUwOTE4Mjc2MjhhYi4u
M2M5NGQ4Mzg4NjNlNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3NTEx
L2Fkdjc1MTFfZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3NTExL2Fkdjc1
MTFfZHJ2LmMKQEAgLTczNSwxMSArNzM1LDExIEBAIHN0YXRpYyB2b2lkIGFkdjc1MTFfbW9kZV9z
ZXQoc3RydWN0IGFkdjc1MTEgKmFkdjc1MTEsCiAJCQl2c3luY19wb2xhcml0eSA9IDE7CiAJfQog
Ci0JaWYgKG1vZGUtPnZyZWZyZXNoIDw9IDI0MDAwKQorCWlmIChkcm1fbW9kZV92cmVmcmVzaCht
b2RlKSA8PSAyNCkKIAkJbG93X3JlZnJlc2hfcmF0ZSA9IEFEVjc1MTFfTE9XX1JFRlJFU0hfUkFU
RV8yNEhaOwotCWVsc2UgaWYgKG1vZGUtPnZyZWZyZXNoIDw9IDI1MDAwKQorCWVsc2UgaWYgKGRy
bV9tb2RlX3ZyZWZyZXNoKG1vZGUpIDw9IDI1KQogCQlsb3dfcmVmcmVzaF9yYXRlID0gQURWNzUx
MV9MT1dfUkVGUkVTSF9SQVRFXzI1SFo7Ci0JZWxzZSBpZiAobW9kZS0+dnJlZnJlc2ggPD0gMzAw
MDApCisJZWxzZSBpZiAoZHJtX21vZGVfdnJlZnJlc2gobW9kZSkgPD0gMzApCiAJCWxvd19yZWZy
ZXNoX3JhdGUgPSBBRFY3NTExX0xPV19SRUZSRVNIX1JBVEVfMzBIWjsKIAllbHNlCiAJCWxvd19y
ZWZyZXNoX3JhdGUgPSBBRFY3NTExX0xPV19SRUZSRVNIX1JBVEVfTk9ORTsKLS0gCjIuMjAuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
