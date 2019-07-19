Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD02C6DA85
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 06:03:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82BF86E4F0;
	Fri, 19 Jul 2019 04:03:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06BB16E4F0
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2019 04:03:00 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2E71021873;
 Fri, 19 Jul 2019 04:02:59 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.1 007/141] drm/bochs: Fix connector leak during
 driver unload
Date: Fri, 19 Jul 2019 00:00:32 -0400
Message-Id: <20190719040246.15945-7-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190719040246.15945-1-sashal@kernel.org>
References: <20190719040246.15945-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1563508979;
 bh=Ieid9JHW9cHMr72tyAO8o2PtFtDA8gd5V7g1Ll5dUiA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=s5bh6m6QcjrG5vQWsN4S8rVrnF6Ec1on8w5uBKEP6KyCSn6i0ePNhVsCBNTaBFk05
 TxxkXvdEtoP0OiaM5k2C3YJpdTKBaZY2w1eoYDTBrJIySVx7ttWArbRMe/3/YpcUkF
 tARG5e898EUGyQagetpbbBIEeCXb3bO9eP6vGQeA=
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
Cc: Sam Bobroff <sbobroff@linux.ibm.com>, Sasha Levin <sashal@kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2FtIEJvYnJvZmYgPHNib2Jyb2ZmQGxpbnV4LmlibS5jb20+CgpbIFVwc3RyZWFtIGNv
bW1pdCAzYzZiODYyNWRkZTgyNjAwZmQwM2FkMWZjYmEyMjNmMTMwM2VlNTM1IF0KCldoZW4gdW5s
b2FkaW5nIHRoZSBib2Nocy1kcm0gZHJpdmVyLCBhIHdhcm5pbmcgbWVzc2FnZSBpcyBwcmludGVk
IGJ5CmRybV9tb2RlX2NvbmZpZ19jbGVhbnVwKCkgYmVjYXVzZSBhIHJlZmVyZW5jZSBpcyBzdGls
bCBoZWxkIHRvIG9uZSBvZgp0aGUgZHJtX2Nvbm5lY3RvciBzdHJ1Y3RzLgoKQ29ycmVjdCB0aGlz
IGJ5IGNhbGxpbmcgZHJtX2F0b21pY19oZWxwZXJfc2h1dGRvd24oKSBpbgpib2Noc19wY2lfcmVt
b3ZlKCkuCgpGaXhlczogNjU3OWMzOTU5NGFlICgiZHJtL2JvY2hzOiBhdG9taWM6IHN3aXRjaCBw
bGFuZXMgdG8gYXRvbWljLCB3aXJlIHVwIGhlbHBlcnMuIikKU2lnbmVkLW9mZi1ieTogU2FtIEJv
YnJvZmYgPHNib2Jyb2ZmQGxpbnV4LmlibS5jb20+Ckxpbms6IGh0dHA6Ly9wYXRjaHdvcmsuZnJl
ZWRlc2t0b3Aub3JnL3BhdGNoL21zZ2lkLzkzYjM2M2FkNjJmNDkzOGQ5ZGRmM2UwNWIyYTYxZTNm
NjZiMmRjZDMuMTU1ODQxNjQ3My5naXQuc2JvYnJvZmZAbGludXguaWJtLmNvbQpTaWduZWQtb2Zm
LWJ5OiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KU2lnbmVkLW9mZi1ieTogU2Fz
aGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9ib2Nocy9i
b2Noc19kcnYuYyB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYm9jaHMvYm9jaHNfZHJ2LmMgYi9kcml2ZXJzL2dwdS9k
cm0vYm9jaHMvYm9jaHNfZHJ2LmMKaW5kZXggNmI2ZTAzNzI1OGMzLi43MDMxZjAxNjg3OTUgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ib2Nocy9ib2Noc19kcnYuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vYm9jaHMvYm9jaHNfZHJ2LmMKQEAgLTEwLDYgKzEwLDcgQEAKICNpbmNsdWRlIDxs
aW51eC9zbGFiLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9mYl9oZWxwZXIuaD4KICNpbmNsdWRlIDxk
cm0vZHJtX3Byb2JlX2hlbHBlci5oPgorI2luY2x1ZGUgPGRybS9kcm1fYXRvbWljX2hlbHBlci5o
PgogCiAjaW5jbHVkZSAiYm9jaHMuaCIKIApAQCAtMTc0LDYgKzE3NSw3IEBAIHN0YXRpYyB2b2lk
IGJvY2hzX3BjaV9yZW1vdmUoc3RydWN0IHBjaV9kZXYgKnBkZXYpCiB7CiAJc3RydWN0IGRybV9k
ZXZpY2UgKmRldiA9IHBjaV9nZXRfZHJ2ZGF0YShwZGV2KTsKIAorCWRybV9hdG9taWNfaGVscGVy
X3NodXRkb3duKGRldik7CiAJZHJtX2Rldl91bnJlZ2lzdGVyKGRldik7CiAJYm9jaHNfdW5sb2Fk
KGRldik7CiAJZHJtX2Rldl9wdXQoZGV2KTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
