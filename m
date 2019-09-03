Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E379A6EBB
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 18:28:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E42DD89864;
	Tue,  3 Sep 2019 16:28:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D451898A3;
 Tue,  3 Sep 2019 16:28:34 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8CF67215EA;
 Tue,  3 Sep 2019 16:28:33 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 116/167] drm/amdgpu: fix ring test failure issue
 during s3 in vce 3.0 (V2)
Date: Tue,  3 Sep 2019 12:24:28 -0400
Message-Id: <20190903162519.7136-116-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190903162519.7136-1-sashal@kernel.org>
References: <20190903162519.7136-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1567528114;
 bh=ACuq4WuBRpCSB7xWkWBjA44XlYiLFHErnApYBjTmmtE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ID2d7U4Y6rOhL0+LUOFqRSpqpqDr1lbGtgkM/FDga69pqsQkFJ9reWM3nuikfZqEi
 1lcdpqdyGyxPuko4TEmRNJCpPRoNKJZXtBHT1zNGQF0NmzGxUllTIA7A0agvBUF9//
 zCwDD4J8EEoBWos68yII1QNwIkC9W1f6/6+Aoy0g=
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
Cc: Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Louis Li <Ching-shih.Li@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTG91aXMgTGkgPENoaW5nLXNoaWguTGlAYW1kLmNvbT4KClsgVXBzdHJlYW0gY29tbWl0
IGNlMGUyMmY1ZDg4NmQxYjU2YzdhYjQzNDdjNDViOWFjNWZjYzA1OGQgXQoKW1doYXRdCnZjZSBy
aW5nIHRlc3QgZmFpbHMgY29uc2lzdGVudGx5IGR1cmluZyByZXN1bWUgaW4gczMgY3ljbGUsIGR1
ZSB0bwptaXNtYXRjaCByZWFkICYgd3JpdGUgcG9pbnRlcnMuCk9uIGRlYnVnL2FuYWx5c2lzIGl0
cyBmb3VuZCB0aGF0IHJwdHIgdG8gYmUgY29tcGFyZWQgaXMgbm90IGJlaW5nCmNvcnJlY3RseSB1
cGRhdGVkL3JlYWQsIHdoaWNoIGxlYWRzIHRvIHRoaXMgZmFpbHVyZS4KQmVsb3cgaXMgdGhlIGZh
aWx1cmUgc2lnbmF0dXJlOgoJW2RybTphbWRncHVfdmNlX3JpbmdfdGVzdF9yaW5nXSAqRVJST1Iq
IGFtZGdwdTogcmluZyAxMiB0ZXN0IGZhaWxlZAoJW2RybTphbWRncHVfZGV2aWNlX2lwX3Jlc3Vt
ZV9waGFzZTJdICpFUlJPUiogcmVzdW1lIG9mIElQIGJsb2NrIDx2Y2VfdjNfMD4gZmFpbGVkIC0x
MTAKCVtkcm06YW1kZ3B1X2RldmljZV9yZXN1bWVdICpFUlJPUiogYW1kZ3B1X2RldmljZV9pcF9y
ZXN1bWUgZmFpbGVkICgtMTEwKS4KCltIb3ddCmZldGNoIHJwdHIgYXBwcm9wcmlhdGVseSwgbWVh
bmluZyBtb3ZlIGl0cyByZWFkIGxvY2F0aW9uIGZ1cnRoZXIgZG93bgppbiB0aGUgY29kZSBmbG93
LgpXaXRoIHRoaXMgcGF0Y2ggYXBwbGllZCB0aGUgczMgZmFpbHVyZSBpcyBubyBtb3JlIHNlZW4g
Zm9yID41ayBzMyBjeWNsZXMsCndoaWNoIG90aGVyd2lzZSBpcyBwcmV0dHkgY29uc2lzdGVudC4K
ClYyOiByZW1vdmUgcmVkdW50YW50IGZldGNoIG9mIHJwdHIKClNpZ25lZC1vZmYtYnk6IExvdWlz
IExpIDxDaGluZy1zaGloLkxpQGFtZC5jb20+ClJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmln
IDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8
YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKU2ln
bmVkLW9mZi1ieTogU2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y2UuYyB8IDUgKysrKy0KIDEgZmlsZSBjaGFuZ2Vk
LCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfdmNlLmMKaW5kZXggNWYzZjU0MDczODE4Ny4uMTc4NjJiOWVjY2NkNyAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZjZS5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y2UuYwpAQCAtMTA3MCw3ICsxMDcwLDcgQEAg
dm9pZCBhbWRncHVfdmNlX3JpbmdfZW1pdF9mZW5jZShzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcs
IHU2NCBhZGRyLCB1NjQgc2VxLAogaW50IGFtZGdwdV92Y2VfcmluZ190ZXN0X3Jpbmcoc3RydWN0
IGFtZGdwdV9yaW5nICpyaW5nKQogewogCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gcmlu
Zy0+YWRldjsKLQl1aW50MzJfdCBycHRyID0gYW1kZ3B1X3JpbmdfZ2V0X3JwdHIocmluZyk7CisJ
dWludDMyX3QgcnB0cjsKIAl1bnNpZ25lZCBpOwogCWludCByLCB0aW1lb3V0ID0gYWRldi0+dXNl
Y190aW1lb3V0OwogCkBAIC0xMDg0LDYgKzEwODQsOSBAQCBpbnQgYW1kZ3B1X3ZjZV9yaW5nX3Rl
c3RfcmluZyhzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcpCiAJCQkgIHJpbmctPmlkeCwgcik7CiAJ
CXJldHVybiByOwogCX0KKworCXJwdHIgPSBhbWRncHVfcmluZ19nZXRfcnB0cihyaW5nKTsKKwog
CWFtZGdwdV9yaW5nX3dyaXRlKHJpbmcsIFZDRV9DTURfRU5EKTsKIAlhbWRncHVfcmluZ19jb21t
aXQocmluZyk7CiAKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
