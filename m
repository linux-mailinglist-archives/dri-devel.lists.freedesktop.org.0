Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2E06DA90
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 06:03:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D13A46E4F3;
	Fri, 19 Jul 2019 04:03:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 402B66E4F1;
 Fri, 19 Jul 2019 04:03:19 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4E71120659;
 Fri, 19 Jul 2019 04:03:18 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.1 013/141] drm/msm/a6xx: Check for ERR or NULL
 before iounmap
Date: Fri, 19 Jul 2019 00:00:38 -0400
Message-Id: <20190719040246.15945-13-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190719040246.15945-1-sashal@kernel.org>
References: <20190719040246.15945-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1563508999;
 bh=wYjIoONvDqvGBPSJ5Z87PQFWs5eBM5YoYB676WUvxL4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Wb4Mn2nhpygdqgprBFn7+9u04q10xfGg78yezHbiaLTEYP9FXB+sZsPSXACD7CCO2
 Er7XDTTLDOz0qyF0OdtJPZLipSVhTum5gw4b0PsObQG5d0f4vMB3T5tMVmUeRHZyKF
 6ndR3jKObr3Gp4tCjg5mjyND0a4yAM/WQAHXOHQQ=
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
Cc: Sasha Levin <sashal@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgpbIFVwc3RyZWFtIGNvbW1p
dCA1Y2E0YTA5NGJhN2UxMzY5MzYzZGNiY2JkZThiYWYwNmRkY2RjMmQxIF0KCnBkY3B0ciBhbmQg
c2VxcHRyIGFyZW4ndCBuZWNlc3NhcmlseSB2YWxpZCwgY2hlY2sgdGhlbSBiZWZvcmUgdHJ5aW5n
IHRvCnVubWFwIHRoZW0uCgpDaGFuZ2VzIGluIHYyOgotIE5vbmUKCkNjOiBKb3JkYW4gQ3JvdXNl
IDxqY3JvdXNlQGNvZGVhdXJvcmEub3JnPgpSZXZpZXdlZC1ieTogSm9yZGFuIENyb3VzZSA8amNy
b3VzZUBjb2RlYXVyb3JhLm9yZz4KU2lnbmVkLW9mZi1ieTogU2VhbiBQYXVsIDxzZWFucGF1bEBj
aHJvbWl1bS5vcmc+Ckxpbms6IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRj
aC9tc2dpZC8yMDE5MDUyMzE3MTY1My4xMzg2NzgtMy1zZWFuQHBvb3JseS5ydW4KU2lnbmVkLW9m
Zi1ieTogU2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9tc20vYWRyZW5vL2E2eHhfZ211LmMgfCA2ICsrKystLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
bXNtL2FkcmVuby9hNnh4X2dtdS5jIGIvZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9n
bXUuYwppbmRleCBkMTY2MmE3NWM3ZWMuLjllNDYyOWMyZTA5NCAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9nbXUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNt
L2FkcmVuby9hNnh4X2dtdS5jCkBAIC00ODksOCArNDg5LDEwIEBAIHN0YXRpYyB2b2lkIGE2eHhf
Z211X3JwbWhfaW5pdChzdHJ1Y3QgYTZ4eF9nbXUgKmdtdSkKIAl3bWIoKTsKIAogZXJyOgotCWRl
dm1faW91bm1hcChnbXUtPmRldiwgcGRjcHRyKTsKLQlkZXZtX2lvdW5tYXAoZ211LT5kZXYsIHNl
cXB0cik7CisJaWYgKCFJU19FUlJfT1JfTlVMTChwZGNwdHIpKQorCQlkZXZtX2lvdW5tYXAoZ211
LT5kZXYsIHBkY3B0cik7CisJaWYgKCFJU19FUlJfT1JfTlVMTChzZXFwdHIpKQorCQlkZXZtX2lv
dW5tYXAoZ211LT5kZXYsIHNlcXB0cik7CiB9CiAKIC8qCi0tIAoyLjIwLjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
