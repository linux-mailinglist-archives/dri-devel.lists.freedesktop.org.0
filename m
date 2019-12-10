Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B6211937B
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 22:12:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0B486E94D;
	Tue, 10 Dec 2019 21:12:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 406506E954
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 21:12:23 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E76E9206EC;
 Tue, 10 Dec 2019 21:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576011848;
 bh=VQ5a4xBBMy6ZGg8kyYiUVjmv92AEpnGHsls0CSS71jk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PtY7XvbT+Cw7dIpZUlRVZpWvMDkqEytfH7oXA/gP8Y+ZORMowdMDUCxFjbcadBjiE
 V1+2BvlED74IvHGoormdAz6tev4aEhfLdzAVhP0mmHR16m6ICra/7yJgFihEodKH71
 6FSDppgGE22+4jj0AKbav1TBfwcJyv4qnHuo4g4A=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 004/350] drm/mipi-dbi: fix a loop in debugfs code
Date: Tue, 10 Dec 2019 15:58:16 -0500
Message-Id: <20191210210402.8367-4-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191210210402.8367-1-sashal@kernel.org>
References: <20191210210402.8367-1-sashal@kernel.org>
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
bC5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9taXBpX2RiaS5jIHwgMyArLS0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vZHJtX21pcGlfZGJpLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX21pcGlf
ZGJpLmMKaW5kZXggMTk2MWY3MTNhYWFiNC4uYzRlZTI3MDlhNmYzMiAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2RybV9taXBpX2RiaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fbWlw
aV9kYmkuYwpAQCAtMTE4Nyw4ICsxMTg3LDcgQEAgc3RhdGljIHNzaXplX3QgbWlwaV9kYmlfZGVi
dWdmc19jb21tYW5kX3dyaXRlKHN0cnVjdCBmaWxlICpmaWxlLAogCXN0cnVjdCBtaXBpX2RiaV9k
ZXYgKmRiaWRldiA9IG0tPnByaXZhdGU7CiAJdTggdmFsLCBjbWQgPSAwLCBwYXJhbWV0ZXJzWzY0
XTsKIAljaGFyICpidWYsICpwb3MsICp0b2tlbjsKLQl1bnNpZ25lZCBpbnQgaTsKLQlpbnQgcmV0
LCBpZHg7CisJaW50IGksIHJldCwgaWR4OwogCiAJaWYgKCFkcm1fZGV2X2VudGVyKCZkYmlkZXYt
PmRybSwgJmlkeCkpCiAJCXJldHVybiAtRU5PREVWOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
