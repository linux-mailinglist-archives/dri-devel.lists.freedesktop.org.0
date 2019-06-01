Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 560F831C4B
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jun 2019 15:21:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2838689A9B;
	Sat,  1 Jun 2019 13:21:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3185D89A91
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jun 2019 13:20:59 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 08100272E0;
 Sat,  1 Jun 2019 13:20:57 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.0 030/173] drm/bridge: adv7511: Fix low refresh rate
 selection
Date: Sat,  1 Jun 2019 09:17:02 -0400
Message-Id: <20190601131934.25053-30-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190601131934.25053-1-sashal@kernel.org>
References: <20190601131934.25053-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1559395258;
 bh=Zym5nfYQabsOu0HM7LG3ClqZmIZ9QL9KNpVc6EOKBj8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Bj8JrB2oOjiV8mpfH7t0mdE3UHt+YWcvuIdpWWNkLhk2+wmkOVpzNiRWVRwdujlKQ
 CSCngoOpVfCFTesYbtFT+7yCLe45QEW3DT5OIEa2MBvf5h/ehOlfiyZS4/uPHGVWvt
 7ENWcwC5xRSopqH2rYaHg6UOycD6aY6gK5KeBGSo=
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
cHUvZHJtL2JyaWRnZS9hZHY3NTExL2Fkdjc1MTFfZHJ2LmMKaW5kZXggODVjMmQ0MDdhNTJlMS4u
ZTdkZGQzZTNkYjkyMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3NTEx
L2Fkdjc1MTFfZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3NTExL2Fkdjc1
MTFfZHJ2LmMKQEAgLTc0NywxMSArNzQ3LDExIEBAIHN0YXRpYyB2b2lkIGFkdjc1MTFfbW9kZV9z
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
