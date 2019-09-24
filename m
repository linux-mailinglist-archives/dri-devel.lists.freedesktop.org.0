Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B9EBCD28
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 18:46:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B99E6EA88;
	Tue, 24 Sep 2019 16:46:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E4A06EA88
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2019 16:46:13 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5366F21841;
 Tue, 24 Sep 2019 16:46:12 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 11/70] drm/panel: check failure cases in the probe
 func
Date: Tue, 24 Sep 2019 12:44:50 -0400
Message-Id: <20190924164549.27058-11-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190924164549.27058-1-sashal@kernel.org>
References: <20190924164549.27058-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1569343573;
 bh=qqZxm8KNU3bkkqJKEYWUqs8sTqIDkTaNn9u3huRE85Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bUsQk9/UfwheQ33KEy2tM3Vbh0YYoVHvndjrxdWjQP4q66Edowx9zKqgk9WZyu3t7
 8phfaoR4mUrGDUG+zCFxFC5MdTWBtmgdsi37RYqCkZBgt1WY3jXHAghUhCux9G/Jf5
 x6VJRc+bkBbut8kGg/Gz7pxY6tBZPLHpkbncORG8=
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
Cc: Sasha Levin <sashal@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org, Navid Emamdoost <navid.emamdoost@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTmF2aWQgRW1hbWRvb3N0IDxuYXZpZC5lbWFtZG9vc3RAZ21haWwuY29tPgoKWyBVcHN0
cmVhbSBjb21taXQgYWZkNmQ0ZjVhNTJjMTZlMTQ4MzMyOGFjMDc0YWJiMWNkZTkyYzI5ZiBdCgpU
aGUgZm9sbG93aW5nIGZ1bmN0aW9uIGNhbGxzIG1heSBmYWlsIGFuZCByZXR1cm4gTlVMTCwgc28g
dGhlIG51bGwgY2hlY2sKaXMgYWRkZWQuCm9mX2dyYXBoX2dldF9uZXh0X2VuZHBvaW50Cm9mX2dy
YXBoX2dldF9yZW1vdGVfcG9ydF9wYXJlbnQKb2ZfZ3JhcGhfZ2V0X3JlbW90ZV9wb3J0CgpVcGRh
dGU6IFRoYW5rcyB0byBTYW0gUmF2bmJvcmcsIGZvciBzdWdnZXNzaW9uIG9uIHRoZSB1c2Ugb2Yg
Z290byB0byBhdm9pZApsZWFraW5nIGVuZHBvaW50LgoKU2lnbmVkLW9mZi1ieTogTmF2aWQgRW1h
bWRvb3N0IDxuYXZpZC5lbWFtZG9vc3RAZ21haWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBTYW0gUmF2
bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Ckxpbms6IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNr
dG9wLm9yZy9wYXRjaC9tc2dpZC8yMDE5MDcyNDE5NTUzNC45MzAzLTEtbmF2aWQuZW1hbWRvb3N0
QGdtYWlsLmNvbQpTaWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+
Ci0tLQogLi4uL2dwdS9kcm0vcGFuZWwvcGFuZWwtcmFzcGJlcnJ5cGktdG91Y2hzY3JlZW4uYyAg
IHwgMTMgKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtcmFzcGJlcnJ5cGktdG91Y2hz
Y3JlZW4uYyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1yYXNwYmVycnlwaS10b3VjaHNj
cmVlbi5jCmluZGV4IDJjOWM5NzIyNzM0ZjUuLjlhMmNiOGFlYWIzYTQgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1yYXNwYmVycnlwaS10b3VjaHNjcmVlbi5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1yYXNwYmVycnlwaS10b3VjaHNjcmVlbi5jCkBA
IC00MDAsNyArNDAwLDEzIEBAIHN0YXRpYyBpbnQgcnBpX3RvdWNoc2NyZWVuX3Byb2JlKHN0cnVj
dCBpMmNfY2xpZW50ICppMmMsCiAKIAkvKiBMb29rIHVwIHRoZSBEU0kgaG9zdC4gIEl0IG5lZWRz
IHRvIHByb2JlIGJlZm9yZSB3ZSBkby4gKi8KIAllbmRwb2ludCA9IG9mX2dyYXBoX2dldF9uZXh0
X2VuZHBvaW50KGRldi0+b2Zfbm9kZSwgTlVMTCk7CisJaWYgKCFlbmRwb2ludCkKKwkJcmV0dXJu
IC1FTk9ERVY7CisKIAlkc2lfaG9zdF9ub2RlID0gb2ZfZ3JhcGhfZ2V0X3JlbW90ZV9wb3J0X3Bh
cmVudChlbmRwb2ludCk7CisJaWYgKCFkc2lfaG9zdF9ub2RlKQorCQlnb3RvIGVycm9yOworCiAJ
aG9zdCA9IG9mX2ZpbmRfbWlwaV9kc2lfaG9zdF9ieV9ub2RlKGRzaV9ob3N0X25vZGUpOwogCW9m
X25vZGVfcHV0KGRzaV9ob3N0X25vZGUpOwogCWlmICghaG9zdCkgewpAQCAtNDA5LDYgKzQxNSw5
IEBAIHN0YXRpYyBpbnQgcnBpX3RvdWNoc2NyZWVuX3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICpp
MmMsCiAJfQogCiAJaW5mby5ub2RlID0gb2ZfZ3JhcGhfZ2V0X3JlbW90ZV9wb3J0KGVuZHBvaW50
KTsKKwlpZiAoIWluZm8ubm9kZSkKKwkJZ290byBlcnJvcjsKKwogCW9mX25vZGVfcHV0KGVuZHBv
aW50KTsKIAogCXRzLT5kc2kgPSBtaXBpX2RzaV9kZXZpY2VfcmVnaXN0ZXJfZnVsbChob3N0LCAm
aW5mbyk7CkBAIC00MjksNiArNDM4LDEwIEBAIHN0YXRpYyBpbnQgcnBpX3RvdWNoc2NyZWVuX3By
b2JlKHN0cnVjdCBpMmNfY2xpZW50ICppMmMsCiAJCXJldHVybiByZXQ7CiAKIAlyZXR1cm4gMDsK
KworZXJyb3I6CisJb2Zfbm9kZV9wdXQoZW5kcG9pbnQpOworCXJldHVybiAtRU5PREVWOwogfQog
CiBzdGF0aWMgaW50IHJwaV90b3VjaHNjcmVlbl9yZW1vdmUoc3RydWN0IGkyY19jbGllbnQgKmky
YykKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
