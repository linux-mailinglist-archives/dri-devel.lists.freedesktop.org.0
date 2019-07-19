Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F346D98A
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 05:57:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 012716E49B;
	Fri, 19 Jul 2019 03:57:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A64F6E49B
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2019 03:57:06 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2CA1221850;
 Fri, 19 Jul 2019 03:57:05 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 009/171] drm/bochs: Fix connector leak during
 driver unload
Date: Thu, 18 Jul 2019 23:54:00 -0400
Message-Id: <20190719035643.14300-9-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190719035643.14300-1-sashal@kernel.org>
References: <20190719035643.14300-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1563508625;
 bh=NOChr+M9WOR9orhCSmC3TRPJClfJwif6AL58ptimSVU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YkTqd2ElFuWeLqHW6VEveWs20pnTPxsyuYcyktLIF0EmLLb9EghRc6c0vRN+pgwcH
 XgEG2EjWDIpQsIBmUkeEIHnlaraYpOI/+lhxioazyYlpFwrbDl7aCqeCVOZRDIQFDA
 UBZ3tcohv7VraN3xfAosx20DA+V7R3gdGMZNXJCA=
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
cm0vYm9jaHMvYm9jaHNfZHJ2LmMKaW5kZXggYjg2Y2M3MDUxMzhjLi5kOGI5NDU1OTZiMDkgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ib2Nocy9ib2Noc19kcnYuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vYm9jaHMvYm9jaHNfZHJ2LmMKQEAgLTcsNiArNyw3IEBACiAjaW5jbHVkZSA8bGlu
dXgvc2xhYi5oPgogI2luY2x1ZGUgPGRybS9kcm1fZmJfaGVscGVyLmg+CiAjaW5jbHVkZSA8ZHJt
L2RybV9wcm9iZV9oZWxwZXIuaD4KKyNpbmNsdWRlIDxkcm0vZHJtX2F0b21pY19oZWxwZXIuaD4K
IAogI2luY2x1ZGUgImJvY2hzLmgiCiAKQEAgLTE3MSw2ICsxNzIsNyBAQCBzdGF0aWMgdm9pZCBi
b2Noc19wY2lfcmVtb3ZlKHN0cnVjdCBwY2lfZGV2ICpwZGV2KQogewogCXN0cnVjdCBkcm1fZGV2
aWNlICpkZXYgPSBwY2lfZ2V0X2RydmRhdGEocGRldik7CiAKKwlkcm1fYXRvbWljX2hlbHBlcl9z
aHV0ZG93bihkZXYpOwogCWRybV9kZXZfdW5yZWdpc3RlcihkZXYpOwogCWJvY2hzX3VubG9hZChk
ZXYpOwogCWRybV9kZXZfcHV0KGRldik7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
