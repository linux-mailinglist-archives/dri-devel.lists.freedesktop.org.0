Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5288B6DA0E
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 05:59:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C4E26E4E6;
	Fri, 19 Jul 2019 03:59:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C2556E4CE;
 Fri, 19 Jul 2019 03:59:23 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2212F2189E;
 Fri, 19 Jul 2019 03:59:22 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 076/171] drm/msm/adreno: Ensure that the zap
 shader region is big enough
Date: Thu, 18 Jul 2019 23:55:07 -0400
Message-Id: <20190719035643.14300-76-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190719035643.14300-1-sashal@kernel.org>
References: <20190719035643.14300-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1563508763;
 bh=dhxt8vrEK/YOQ/s69fnoSZf6HqR0cV3OukQKYT12Uq0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YeS6kzXV6Qw09mpw5SCui6FwlyXHpBna91RX0X7aI1mk+PzIDH2W4IoF4pRKkpKu6
 WmPdWZ9D82UuRxE7ah/RSYGiJAFB+ZpxLfCtuivYWp/w4LqeXhl8/g1qLQgOddF+4N
 UOOxinn+JomDKXSwvgNbhn90HzxwmS6FDaOVfVVo=
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
Cc: Rob Clark <robdclark@chromium.org>, Sasha Levin <sashal@kernel.org>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSm9yZGFuIENyb3VzZSA8amNyb3VzZUBjb2RlYXVyb3JhLm9yZz4KClsgVXBzdHJlYW0g
Y29tbWl0IDY2NzJlMTFjYWQ2NjJjZTY2MzFlMDRjMzhmOTJhMTQwYTk5YzA0MmMgXQoKQmVmb3Jl
IGxvYWRpbmcgdGhlIHphcCBzaGFkZXIgd2Ugc2hvdWxkIGVuc3VyZSB0aGF0IHRoZSByZXNlcnZl
ZCBtZW1vcnkKcmVnaW9uIGlzIGJpZyBlbm91Z2ggdG8gaG9sZCB0aGUgbG9hZGVkIGZpbGUuCgpT
aWduZWQtb2ZmLWJ5OiBKb3JkYW4gQ3JvdXNlIDxqY3JvdXNlQGNvZGVhdXJvcmEub3JnPgpSZXZp
ZXdlZC1ieTogQmpvcm4gQW5kZXJzc29uIDxiam9ybi5hbmRlcnNzb25AbGluYXJvLm9yZz4KUmV2
aWV3ZWQtYnk6IEplZmZyZXkgSHVnbyA8amVmZnJleS5sLmh1Z29AZ21haWwuY29tPgpTaWduZWQt
b2ZmLWJ5OiBSb2IgQ2xhcmsgPHJvYmRjbGFya0BjaHJvbWl1bS5vcmc+ClNpZ25lZC1vZmYtYnk6
IFNhc2hhIExldmluIDxzYXNoYWxAa2VybmVsLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbXNt
L2FkcmVuby9hZHJlbm9fZ3B1LmMgfCA4ICsrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21z
bS9hZHJlbm8vYWRyZW5vX2dwdS5jIGIvZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYWRyZW5v
X2dwdS5jCmluZGV4IGE5YzBhYzkzN2IwMC4uOWFjYmJjMGYzMjMyIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hZHJlbm9fZ3B1LmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L21zbS9hZHJlbm8vYWRyZW5vX2dwdS5jCkBAIC01Niw3ICs1Niw2IEBAIHN0YXRpYyBpbnQgemFw
X3NoYWRlcl9sb2FkX21kdChzdHJ1Y3QgbXNtX2dwdSAqZ3B1LCBjb25zdCBjaGFyICpmd25hbWUs
CiAJCXJldHVybiByZXQ7CiAKIAltZW1fcGh5cyA9IHIuc3RhcnQ7Ci0JbWVtX3NpemUgPSByZXNv
dXJjZV9zaXplKCZyKTsKIAogCS8qIFJlcXVlc3QgdGhlIE1EVCBmaWxlIGZvciB0aGUgZmlybXdh
cmUgKi8KIAlmdyA9IGFkcmVub19yZXF1ZXN0X2Z3KHRvX2FkcmVub19ncHUoZ3B1KSwgZnduYW1l
KTsKQEAgLTcyLDYgKzcxLDEzIEBAIHN0YXRpYyBpbnQgemFwX3NoYWRlcl9sb2FkX21kdChzdHJ1
Y3QgbXNtX2dwdSAqZ3B1LCBjb25zdCBjaGFyICpmd25hbWUsCiAJCWdvdG8gb3V0OwogCX0KIAor
CWlmIChtZW1fc2l6ZSA+IHJlc291cmNlX3NpemUoJnIpKSB7CisJCURSTV9ERVZfRVJST1IoZGV2
LAorCQkJIm1lbW9yeSByZWdpb24gaXMgdG9vIHNtYWxsIHRvIGxvYWQgdGhlIE1EVFxuIik7CisJ
CXJldCA9IC1FMkJJRzsKKwkJZ290byBvdXQ7CisJfQorCiAJLyogQWxsb2NhdGUgbWVtb3J5IGZv
ciB0aGUgZmlybXdhcmUgaW1hZ2UgKi8KIAltZW1fcmVnaW9uID0gbWVtcmVtYXAobWVtX3BoeXMs
IG1lbV9zaXplLCAgTUVNUkVNQVBfV0MpOwogCWlmICghbWVtX3JlZ2lvbikgewotLSAKMi4yMC4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
