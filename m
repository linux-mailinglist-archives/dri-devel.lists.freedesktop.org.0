Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C2031CDC
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jun 2019 15:26:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82C2B895E1;
	Sat,  1 Jun 2019 13:26:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A53B8895E1
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jun 2019 13:26:25 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BFAAE273B8;
 Sat,  1 Jun 2019 13:26:24 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.4 11/56] drm/bridge: adv7511: Fix low refresh rate
 selection
Date: Sat,  1 Jun 2019 09:25:15 -0400
Message-Id: <20190601132600.27427-11-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190601132600.27427-1-sashal@kernel.org>
References: <20190601132600.27427-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1559395585;
 bh=+xczNjbzexM5uQCXq7isyKQZuVsG1rm2P3V7I6eJ/To=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MHQfq2A5IgcGYv+WT6BBoVkzDkOxNYQcRT1cBjvDcgrB5UjS9Zvffgn0jYilRRgcS
 h+GTOkpYUJutVYYkJO/MCMwZtEBki9MzDXGrfeqJWSCX/SyLhdk0Oj1DtEkL+SRlVn
 B2bMlFywiSjdtolvbnZM63MON+5U6wTMZwxVaLTM=
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
ZXJzL2dwdS9kcm0vaTJjL2Fkdjc1MTEuYyB8IDYgKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9pMmMvYWR2NzUxMS5jIGIvZHJpdmVycy9ncHUvZHJtL2kyYy9hZHY3NTExLmMKaW5kZXggYzdj
MjQzZTliODA4My4uNDMwMGUyN2VkMTEzZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2ky
Yy9hZHY3NTExLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2kyYy9hZHY3NTExLmMKQEAgLTc4MSwx
MSArNzgxLDExIEBAIHN0YXRpYyB2b2lkIGFkdjc1MTFfZW5jb2Rlcl9tb2RlX3NldChzdHJ1Y3Qg
ZHJtX2VuY29kZXIgKmVuY29kZXIsCiAJCQl2c3luY19wb2xhcml0eSA9IDE7CiAJfQogCi0JaWYg
KG1vZGUtPnZyZWZyZXNoIDw9IDI0MDAwKQorCWlmIChkcm1fbW9kZV92cmVmcmVzaChtb2RlKSA8
PSAyNCkKIAkJbG93X3JlZnJlc2hfcmF0ZSA9IEFEVjc1MTFfTE9XX1JFRlJFU0hfUkFURV8yNEha
OwotCWVsc2UgaWYgKG1vZGUtPnZyZWZyZXNoIDw9IDI1MDAwKQorCWVsc2UgaWYgKGRybV9tb2Rl
X3ZyZWZyZXNoKG1vZGUpIDw9IDI1KQogCQlsb3dfcmVmcmVzaF9yYXRlID0gQURWNzUxMV9MT1df
UkVGUkVTSF9SQVRFXzI1SFo7Ci0JZWxzZSBpZiAobW9kZS0+dnJlZnJlc2ggPD0gMzAwMDApCisJ
ZWxzZSBpZiAoZHJtX21vZGVfdnJlZnJlc2gobW9kZSkgPD0gMzApCiAJCWxvd19yZWZyZXNoX3Jh
dGUgPSBBRFY3NTExX0xPV19SRUZSRVNIX1JBVEVfMzBIWjsKIAllbHNlCiAJCWxvd19yZWZyZXNo
X3JhdGUgPSBBRFY3NTExX0xPV19SRUZSRVNIX1JBVEVfTk9ORTsKLS0gCjIuMjAuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
