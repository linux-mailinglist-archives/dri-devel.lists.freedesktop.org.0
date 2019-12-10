Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F301195EF
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 22:25:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67F7E6E966;
	Tue, 10 Dec 2019 21:25:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 498396E962
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 21:25:16 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 84AEA207FF;
 Tue, 10 Dec 2019 21:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576013116;
 bh=1TL1cfOTkjPwCJCaGLP0Z6byKDzAchxlwBZbQAlNnoA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DnAmdD6Ky6wIj0bBYUt1xR52X27tDj+oJ70oQ7VZ/Inmot+/D9WhkJRROu03d+zNr
 S1qWS+dcxVN1uzRSAEFg6gKd6CPgZbBKyVh90rUKN2/87JJyzmtkRi6l9ze9R7aqmE
 0PBID3oUrkBAWcQ9ztg0hMfAr81fAn6fKkqedswQ=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.3 003/292] drm/mipi-dbi: fix a loop in debugfs code
Date: Tue, 10 Dec 2019 16:20:22 -0500
Message-Id: <20191210212511.11392-3-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191210212511.11392-1-sashal@kernel.org>
References: <20191210212511.11392-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org,
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBvcmFjbGUuY29tPgoKWyBVcHN0cmVh
bSBjb21taXQgZDcyY2YwMWY0MTBhYTA5ODY4ZDk4YjY3MmYzZjkyMzI4Yzk2YjMyZCBdCgpUaGlz
IGNvZGUgd2lsbCBsaWtlbHkgY3Jhc2ggaWYgd2UgdHJ5IHRvIGRvIGEgemVybyBieXRlIHdyaXRl
LiAgVGhlIGNvZGUKbG9va3MgbGlrZSB0aGlzOgoKICAgICAgICAvKiBzdHJpcCB0cmFpbGluZyB3
aGl0ZXNwYWNlICovCiAgICAgICAgZm9yIChpID0gY291bnQgLSAxOyBpID4gMDsgaS0tKQogICAg
ICAgICAgICAgICAgaWYgKGlzc3BhY2UoYnVmW2ldKSkKCQkJLi4uCgpXZSdyZSB3cml0aW5nIHpl
cm8gYnl0ZXMgc28gY291bnQgPSAwLiAgWW91IHdvdWxkIHRoaW5rIHRoYXQgImNvdW50IC0gMSIK
d291bGQgYmUgbmVnYXRpdmUgb25lLCBidXQgYmVjYXVzZSAiaSIgaXMgdW5zaWduZWQgaXQgaXMg
YSBsYXJnZQpwb3NpdGl2ZSBudW1lciBpbnN0ZWFkLiAgVGhlICJpID4gMCIgY29uZGl0aW9uIGlz
IHRydWUgYW5kIHRoZSAiYnVmW2ldIgphY2Nlc3Mgd2lsbCBiZSBvdXQgb2YgYm91bmRzLgoKVGhl
IGZpeCBpcyB0byBtYWtlICJpIiBzaWduZWQgYW5kIG5vdyBldmVyeXRoaW5nIHdvcmtzIGFzIGV4
cGVjdGVkLiAgVGhlCnVwcGVyIGJvdW5kIG9mICJjb3VudCIgaXMgY2FwcGVkIGluIF9fa2VybmVs
X3dyaXRlKCkgYXQgTUFYX1JXX0NPVU5UIHNvCndlIGRvbid0IGhhdmUgdG8gd29ycnkgYWJvdXQg
aXQgYmVpbmcgaGlnaGVyIHRoYW4gSU5UX01BWC4KCkZpeGVzOiAwMmRkOTVmZTMxNjkgKCJkcm0v
dGlueWRybTogQWRkIE1JUEkgREJJIHN1cHBvcnQiKQpTaWduZWQtb2ZmLWJ5OiBEYW4gQ2FycGVu
dGVyIDxkYW4uY2FycGVudGVyQG9yYWNsZS5jb20+Cltub3JhbGY6IEFkanVzdCB0aXRsZV0KU2ln
bmVkLW9mZi1ieTogTm9yYWxmIFRyw7hubmVzIDxub3JhbGZAdHJvbm5lcy5vcmc+Ckxpbms6IGh0
dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC9tc2dpZC8yMDE5MDgyMTA3MjQ1
Ni5HSjI2OTU3QG13YW5kYQpTaWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5l
bC5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3Rpbnlkcm0vbWlwaS1kYmkuYyB8IDMgKy0tCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3Rpbnlkcm0vbWlwaS1kYmkuYyBiL2RyaXZlcnMvZ3B1L2RybS90
aW55ZHJtL21pcGktZGJpLmMKaW5kZXggY2E5ZGE2NTRmYzZmNC4uZDZiN2M3MDZjNjc0YiAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Rpbnlkcm0vbWlwaS1kYmkuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vdGlueWRybS9taXBpLWRiaS5jCkBAIC0xMDMzLDggKzEwMzMsNyBAQCBzdGF0aWMg
c3NpemVfdCBtaXBpX2RiaV9kZWJ1Z2ZzX2NvbW1hbmRfd3JpdGUoc3RydWN0IGZpbGUgKmZpbGUs
CiAJc3RydWN0IG1pcGlfZGJpICptaXBpID0gbS0+cHJpdmF0ZTsKIAl1OCB2YWwsIGNtZCA9IDAs
IHBhcmFtZXRlcnNbNjRdOwogCWNoYXIgKmJ1ZiwgKnBvcywgKnRva2VuOwotCXVuc2lnbmVkIGlu
dCBpOwotCWludCByZXQsIGlkeDsKKwlpbnQgaSwgcmV0LCBpZHg7CiAKIAlpZiAoIWRybV9kZXZf
ZW50ZXIoJm1pcGktPmRybSwgJmlkeCkpCiAJCXJldHVybiAtRU5PREVWOwotLSAKMi4yMC4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
