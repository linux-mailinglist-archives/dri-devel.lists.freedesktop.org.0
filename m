Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0F2BCCBA
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 18:42:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A0EA6EA5B;
	Tue, 24 Sep 2019 16:42:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF2A26EA5B
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2019 16:42:33 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1C00621A4C;
 Tue, 24 Sep 2019 16:42:33 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.3 16/87] drm/bridge: sii902x: fix missing reference
 to mclk clock
Date: Tue, 24 Sep 2019 12:40:32 -0400
Message-Id: <20190924164144.25591-16-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190924164144.25591-1-sashal@kernel.org>
References: <20190924164144.25591-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1569343353;
 bh=TcQJWdjIDXDwAH8RWD2Ob2jmrYxZ0FEDUkeX5eqwNmI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pR1jm0eE1lGb78KPToUeU5jJALvhv/HxRGMf9sS5Mq1q4HF2+UqvgKmD8KcEJASHR
 iX8RHAgVlv/mOSbnSMiaXv556SffGTytTkd44urUaIwBOtPe+GwXlXwQYxVKx4cn8W
 F30ikVSziWafwAHzYQ6zbrUHuIzm7sEoBiCXzl0g=
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
 Olivier Moysan <olivier.moysan@st.com>, Jyri Sarha <jsarha@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogT2xpdmllciBNb3lzYW4gPG9saXZpZXIubW95c2FuQHN0LmNvbT4KClsgVXBzdHJlYW0g
Y29tbWl0IDM2NWQyOGM5MmY4Y2QzZDM4NjBmOGRkMDU3YThjMTM2ZTI0YjM2OTggXQoKQWRkIGRl
dm1fY2xrX2dldCBjYWxsIHRvIHJldHJpZXZlIHJlZmVyZW5jZSB0byBtYXN0ZXIgY2xvY2suCgpG
aXhlczogZmY1NzgxNjM0YzQxICgiZHJtL2JyaWRnZTogc2lpOTAyeDogSW1wbGVtZW50IEhETUkg
YXVkaW8gc3VwcG9ydCIpCgpTaWduZWQtb2ZmLWJ5OiBPbGl2aWVyIE1veXNhbiA8b2xpdmllci5t
b3lzYW5Ac3QuY29tPgpSZXZpZXdlZC1ieTogSnlyaSBTYXJoYSA8anNhcmhhQHRpLmNvbT4KQWNr
ZWQtYnk6IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5jb20KU2lnbmVkLW9mZi1ieTog
QmVuamFtaW4gR2FpZ25hcmQgPGJlbmphbWluLmdhaWduYXJkQGxpbmFyby5vcmc+Ckxpbms6IGh0
dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC9tc2dpZC8xNTYzODExNTYwLTI5
NTg5LTItZ2l0LXNlbmQtZW1haWwtb2xpdmllci5tb3lzYW5Ac3QuY29tClNpZ25lZC1vZmYtYnk6
IFNhc2hhIExldmluIDxzYXNoYWxAa2VybmVsLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL3NpaTkwMnguYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zaWk5MDJ4LmMgYi9kcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL3NpaTkwMnguYwppbmRleCBkZDdhYTQ2NmIyODA1Li4zNmFjYzI1NmU2N2UzIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3NpaTkwMnguYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL3NpaTkwMnguYwpAQCAtNzUwLDYgKzc1MCw3IEBAIHN0YXRpYyBpbnQg
c2lpOTAyeF9hdWRpb19jb2RlY19pbml0KHN0cnVjdCBzaWk5MDJ4ICpzaWk5MDJ4LAogCQlzaWk5
MDJ4LT5hdWRpby5pMnNfZmlmb19zZXF1ZW5jZVtpXSB8PSBhdWRpb19maWZvX2lkW2ldIHwKIAkJ
CWkyc19sYW5lX2lkW2xhbmVzW2ldXSB8CVNJSTkwMlhfVFBJX0kyU19GSUZPX0VOQUJMRTsKIAor
CXNpaTkwMngtPmF1ZGlvLm1jbGsgPSBkZXZtX2Nsa19nZXQoZGV2LCAibWNsayIpOwogCWlmIChJ
U19FUlIoc2lpOTAyeC0+YXVkaW8ubWNsaykpIHsKIAkJZGV2X2VycihkZXYsICIlczogTm8gY2xv
Y2sgKGF1ZGlvIG1jbGspIGZvdW5kOiAlbGRcbiIsCiAJCQlfX2Z1bmNfXywgUFRSX0VSUihzaWk5
MDJ4LT5hdWRpby5tY2xrKSk7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
