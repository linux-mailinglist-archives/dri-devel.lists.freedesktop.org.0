Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EFE876CCE
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 17:28:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40F066EDA6;
	Fri, 26 Jul 2019 15:28:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B6AC6EDA6
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 15:28:46 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9C62C205F4;
 Fri, 26 Jul 2019 15:28:45 +0000 (UTC)
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 5.2 47/66] dma-buf: balance refcount inbalance
Date: Fri, 26 Jul 2019 17:24:46 +0200
Message-Id: <20190726152307.050532782@linuxfoundation.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190726152301.936055394@linuxfoundation.org>
References: <20190726152301.936055394@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1564154926;
 bh=qj3Yu+ZsCVSVuHnZvv8QkWNU/+idoulJXQQsqaUdSyU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fujRO6o1yVjJHVaUOx/S9SfwBBXrFenr+C5NRgFsEXtte9dmy0MaFdN5ZGbhjOego
 MuwII7NkAsFaVJS8xX7iMrp3TyT0MH49FqrICBr7laaTF1HOUvfWt2iHpxv6lNQLxd
 VBktOMM+P107/HNmW+W07X8iWmOW/kG6e3nKVz+8=
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?q?St=C3=A9phane=20Marchesin?= <marcheu@chromium.org>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSsOpcsO0bWUgR2xpc3NlIDxqZ2xpc3NlQHJlZGhhdC5jb20+Cgpjb21taXQgNWUzODNh
OTc5ODk5MGM2OWZjNzU5YTQ5MzBkZTIyNGJiNDk3ZTYyYyB1cHN0cmVhbS4KClRoZSBkZWJ1Z2Zz
IHRha2UgcmVmZXJlbmNlIG9uIGZlbmNlIHdpdGhvdXQgZHJvcHBpbmcgdGhlbS4KClNpZ25lZC1v
ZmYtYnk6IErDqXLDtG1lIEdsaXNzZSA8amdsaXNzZUByZWRoYXQuY29tPgpDYzogQ2hyaXN0aWFu
IEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogRGFuaWVsIFZldHRlciA8ZGFu
aWVsLnZldHRlckBmZndsbC5jaD4KQ2M6IFN1bWl0IFNlbXdhbCA8c3VtaXQuc2Vtd2FsQGxpbmFy
by5vcmc+CkNjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGxpbmFyby1tbS1zaWdAbGlzdHMubGluYXJvLm9yZwpDYzog
U3TDqXBoYW5lIE1hcmNoZXNpbiA8bWFyY2hldUBjaHJvbWl1bS5vcmc+CkNjOiBzdGFibGVAdmdl
ci5rZXJuZWwub3JnClJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29l
bmlnQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IFN1bWl0IFNlbXdhbCA8c3VtaXQuc2Vtd2FsQGxp
bmFyby5vcmc+Ckxpbms6IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC9t
c2dpZC8yMDE4MTIwNjE2MTg0MC42NTc4LTEtamdsaXNzZUByZWRoYXQuY29tClNpZ25lZC1vZmYt
Ynk6IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+CgotLS0K
IGRyaXZlcnMvZG1hLWJ1Zi9kbWEtYnVmLmMgfCAgICAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKQoKLS0tIGEvZHJpdmVycy9kbWEtYnVmL2RtYS1idWYuYworKysgYi9kcml2ZXJz
L2RtYS1idWYvZG1hLWJ1Zi5jCkBAIC0xMDU3LDYgKzEwNTcsNyBAQCBzdGF0aWMgaW50IGRtYV9i
dWZfZGVidWdfc2hvdyhzdHJ1Y3Qgc2VxCiAJCQkJICAgZmVuY2UtPm9wcy0+Z2V0X2RyaXZlcl9u
YW1lKGZlbmNlKSwKIAkJCQkgICBmZW5jZS0+b3BzLT5nZXRfdGltZWxpbmVfbmFtZShmZW5jZSks
CiAJCQkJICAgZG1hX2ZlbmNlX2lzX3NpZ25hbGVkKGZlbmNlKSA/ICIiIDogInVuIik7CisJCQlk
bWFfZmVuY2VfcHV0KGZlbmNlKTsKIAkJfQogCQlyY3VfcmVhZF91bmxvY2soKTsKIAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
