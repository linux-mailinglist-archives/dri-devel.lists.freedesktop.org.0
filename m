Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBC56DA10
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 05:59:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 832E16E4EA;
	Fri, 19 Jul 2019 03:59:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDA8F6E4EA;
 Fri, 19 Jul 2019 03:59:26 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E75A32189E;
 Fri, 19 Jul 2019 03:59:25 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 078/171] drm/msm: Depopulate platform on probe
 failure
Date: Thu, 18 Jul 2019 23:55:09 -0400
Message-Id: <20190719035643.14300-78-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190719035643.14300-1-sashal@kernel.org>
References: <20190719035643.14300-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1563508766;
 bh=IbPNnL48G2wmx8OJhUiOUoTLQOe/PDac/dWk7pRo+FQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=04CQa0NkZh2PLulb9hMPLXHISNfoR2wze1IMfhohf0swcMpW0A/8GCntHd9oCO1uo
 A4VHZDOKl142W/Z1T8clYKusXCfhRzTY1omdIv52fjJRw1Be9MS6GebNI9z59SsHIE
 6kCqdqzDliQC9ZYezsptTzYfXBqve2tGVUWMZm+I=
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
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sean Paul <seanpaul@chromium.org>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgpbIFVwc3RyZWFtIGNvbW1p
dCA0MzY4YTE1MzljNmI0MWFjM2NkZGMwNmY1YTUxMTc5NTI5OTg4MDRjIF0KCmFkZF9kaXNwbGF5
X2NvbXBvbmVudHMoKSBjYWxscyBvZl9wbGF0Zm9ybV9wb3B1bGF0ZSwgYW5kIHdlIGRlcG9wbHVh
dGUKb24gcGRldiByZW1vdmUsIGJ1dCBub3Qgd2hlbiBwcm9iZSBmYWlscy4gU28gaWYgd2UgZ2V0
IGEgcHJvYmUgZGVmZXJyYWwKaW4gb25lIG9mIHRoZSBjb21wb25lbnRzLCB3ZSB3b24ndCBkZXBv
cHVsYXRlIHRoZSBwbGF0Zm9ybS4gVGhpcyBjYXVzZXMKdGhlIGNvcmUgdG8ga2VlcCByZWZlcmVu
Y2VzIHRvIGRldmljZXMgd2hpY2ggc2hvdWxkIGJlIGRlc3Ryb3llZCwgd2hpY2gKY2F1c2VzIGlz
c3VlcyB3aGVuIHRob3NlIHNhbWUgZGV2aWNlcyB0cnkgdG8gcmUtaW5pdGlhbGl6ZSBvbiB0aGUg
bmV4dApwcm9iZSBhdHRlbXB0LgoKSSB0aGluayB0aGlzIGlzIHRoZSByZWFzb24gd2UgaGFkIGlz
c3VlcyB3aXRoIHRoZSBnbXUncyBkZXZpY2UtbWFuYWdlZApyZXNvdXJjZXMgb24gZGVmZXJyYWwg
KHdvcmtlZCBhcm91bmQgaW4gY29tbWl0IDk0ZTNhMTdmMzNhNSkuCgpSZXZpZXdlZC1ieTogUm9i
IENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgpTaWduZWQtb2ZmLWJ5OiBTZWFuIFBhdWwg
PHNlYW5wYXVsQGNocm9taXVtLm9yZz4KTGluazogaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0
b3Aub3JnL3BhdGNoL21zZ2lkLzIwMTkwNjE3MjAxMzAxLjEzMzI3NS0zLXNlYW5AcG9vcmx5LnJ1
bgpTaWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+Ci0tLQogZHJp
dmVycy9ncHUvZHJtL21zbS9tc21fZHJ2LmMgfCAxNCArKysrKysrKysrKy0tLQogMSBmaWxlIGNo
YW5nZWQsIDExIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL21zbS9tc21fZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9kcnYu
YwppbmRleCBmMzhkNzM2N2JkM2IuLjRhMGZlOGEyNWFkNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL21zbS9tc21fZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZHJ2LmMK
QEAgLTEzMDYsMTYgKzEzMDYsMjQgQEAgc3RhdGljIGludCBtc21fcGRldl9wcm9iZShzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCiAJcmV0ID0gYWRkX2dwdV9jb21wb25lbnRzKCZwZGV2
LT5kZXYsICZtYXRjaCk7CiAJaWYgKHJldCkKLQkJcmV0dXJuIHJldDsKKwkJZ290byBmYWlsOwog
CiAJLyogb24gYWxsIGRldmljZXMgdGhhdCBJIGFtIGF3YXJlIG9mLCBpb21tdSdzIHdoaWNoIGNh
biBtYXAKIAkgKiBhbnkgYWRkcmVzcyB0aGUgY3B1IGNhbiBzZWUgYXJlIHVzZWQ6CiAJICovCiAJ
cmV0ID0gZG1hX3NldF9tYXNrX2FuZF9jb2hlcmVudCgmcGRldi0+ZGV2LCB+MCk7CiAJaWYgKHJl
dCkKLQkJcmV0dXJuIHJldDsKKwkJZ290byBmYWlsOworCisJcmV0ID0gY29tcG9uZW50X21hc3Rl
cl9hZGRfd2l0aF9tYXRjaCgmcGRldi0+ZGV2LCAmbXNtX2RybV9vcHMsIG1hdGNoKTsKKwlpZiAo
cmV0KQorCQlnb3RvIGZhaWw7CiAKLQlyZXR1cm4gY29tcG9uZW50X21hc3Rlcl9hZGRfd2l0aF9t
YXRjaCgmcGRldi0+ZGV2LCAmbXNtX2RybV9vcHMsIG1hdGNoKTsKKwlyZXR1cm4gMDsKKworZmFp
bDoKKwlvZl9wbGF0Zm9ybV9kZXBvcHVsYXRlKCZwZGV2LT5kZXYpOworCXJldHVybiByZXQ7CiB9
CiAKIHN0YXRpYyBpbnQgbXNtX3BkZXZfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYpCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
