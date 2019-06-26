Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0871055FAE
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 05:41:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDCB96E261;
	Wed, 26 Jun 2019 03:41:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71E796E261
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 03:41:54 +0000 (UTC)
Received: from sasha-vm.mshome.net (mobile-107-77-172-74.mobile.att.net
 [107.77.172.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C2204216F4;
 Wed, 26 Jun 2019 03:41:52 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.1 15/51] drm/mediatek: fix unbind functions
Date: Tue, 25 Jun 2019 23:40:31 -0400
Message-Id: <20190626034117.23247-15-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190626034117.23247-1-sashal@kernel.org>
References: <20190626034117.23247-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1561520514;
 bh=sNCNajBnIICgdxOIF1Sqb95OcKzLhp3mLHklpLODoFs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=veTNGYHPRGns0PGa7d7v9CAxAHlqpestkIAdaDZynNDo06K+AXRdRvExL1giGi4AX
 90bxd8XOMK3rD5Q/N/UR8GV7K8YJdFajWgMGDYSnLN48qEQNFBzqaMhaYn77tN9sjd
 l+goSg2wqikPZdEWPl5OuuVuGFaFwyRPtO+njVwY=
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
 Hsin-Yi Wang <hsinyi@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSHNpbi1ZaSBXYW5nIDxoc2lueWlAY2hyb21pdW0ub3JnPgoKWyBVcHN0cmVhbSBjb21t
aXQgOGZkN2EzN2IxOTFmOTM3MzdmNjI4MGE5YjVkZTY1Zjk4YWNjMTJjOSBdCgpkZXRhdGNoIHBh
bmVsIGluIG10a19kc2lfZGVzdHJveV9jb25uX2VuYygpLCBzaW5jZSAuYmluZCB3aWxsIHRyeSB0
bwphdHRhY2ggaXQgYWdhaW4uCgpGaXhlczogMmU1NGMxNGUzMTBmICgiZHJtL21lZGlhdGVrOiBB
ZGQgRFNJIHN1YiBkcml2ZXIiKQpTaWduZWQtb2ZmLWJ5OiBIc2luLVlpIFdhbmcgPGhzaW55aUBj
aHJvbWl1bS5vcmc+ClNpZ25lZC1vZmYtYnk6IENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+ClNp
Z25lZC1vZmYtYnk6IFNhc2hhIExldmluIDxzYXNoYWxAa2VybmVsLm9yZz4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNp
LmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jCmluZGV4IGIwMGViMmQyZTA4
Ni4uMWFlM2JlOTllMGZmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RzaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMKQEAgLTg0NCw2
ICs4NDQsOCBAQCBzdGF0aWMgdm9pZCBtdGtfZHNpX2Rlc3Ryb3lfY29ubl9lbmMoc3RydWN0IG10
a19kc2kgKmRzaSkKIAkvKiBTa2lwIGNvbm5lY3RvciBjbGVhbnVwIGlmIGNyZWF0aW9uIHdhcyBk
ZWxlZ2F0ZWQgdG8gdGhlIGJyaWRnZSAqLwogCWlmIChkc2ktPmNvbm4uZGV2KQogCQlkcm1fY29u
bmVjdG9yX2NsZWFudXAoJmRzaS0+Y29ubik7CisJaWYgKGRzaS0+cGFuZWwpCisJCWRybV9wYW5l
bF9kZXRhY2goZHNpLT5wYW5lbCk7CiB9CiAKIHN0YXRpYyB2b2lkIG10a19kc2lfZGRwX3N0YXJ0
KHN0cnVjdCBtdGtfZGRwX2NvbXAgKmNvbXApCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
