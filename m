Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25850A6E82
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 18:27:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3A4F8984F;
	Tue,  3 Sep 2019 16:27:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7650189780;
 Tue,  3 Sep 2019 16:27:28 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 920FB23878;
 Tue,  3 Sep 2019 16:27:27 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 070/167] drm/nouveau: Don't WARN_ON VCPI
 allocation failures
Date: Tue,  3 Sep 2019 12:23:42 -0400
Message-Id: <20190903162519.7136-70-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190903162519.7136-1-sashal@kernel.org>
References: <20190903162519.7136-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1567528048;
 bh=HhjMPDYWRfDZBm9ZYOsXvGnHX2QeGL7rJQdeG914/1Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UEPGl3zVYHlg0Lp7IqIfM/3pHGmWwoGB2qAicL8fNttm0BVEmnYVihsmww+k+OsKf
 f7rt21rER34hnnhwvdQKW4Z0wGr0y4eINtFX9/GW5iLp04dVuYr4Gpg+HBEH6L7h5H
 nBMKbwcrn8nQW6H7PFl6bZUKMQFw40yk1xVUj1fc=
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
Cc: Sasha Levin <sashal@kernel.org>, nouveau@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KClsgVXBzdHJlYW0gY29tbWl0IGI1
MTNhMThjZjFkNzA1YmQwNGVmZDkxYzQxN2U3OWU0OTM4YmUwOTMgXQoKVGhpcyBpcyBtdWNoIGxv
dWRlciB0aGVuIHdlIHdhbnQuIFZDUEkgYWxsb2NhdGlvbiBmYWlsdXJlcyBhcmUgcXVpdGUKbm9y
bWFsLCBzaW5jZSB0aGV5IHdpbGwgaGFwcGVuIGlmIGFueSBwYXJ0IG9mIHRoZSBtb2Rlc2V0dGlu
ZyBwcm9jZXNzIGlzCmludGVycnVwdGVkIGJ5IHJlbW92aW5nIHRoZSBEUCBNU1QgdG9wb2xvZ3kg
aW4gcXVlc3Rpb24uIFNvIGp1c3QgcHJpbnQgYQpkZWJ1Z2dpbmcgbWVzc2FnZSBvbiBWQ1BJIGZh
aWx1cmVzIGluc3RlYWQuCgpTaWduZWQtb2ZmLWJ5OiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQu
Y29tPgpGaXhlczogZjQ3OWMwYmE0YTE3ICgiZHJtL25vdXZlYXUva21zL252NTA6IGluaXRpYWwg
c3VwcG9ydCBmb3IgRFAgMS4yIG11bHRpLXN0cmVhbSIpCkNjOiBCZW4gU2tlZ2dzIDxic2tlZ2dz
QHJlZGhhdC5jb20+CkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBub3V2
ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogPHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+ICMg
djQuMTArClNpZ25lZC1vZmYtYnk6IEJlbiBTa2VnZ3MgPGJza2VnZ3NAcmVkaGF0LmNvbT4KU2ln
bmVkLW9mZi1ieTogU2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYyB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlz
cG52NTAvZGlzcC5jCmluZGV4IGY4ODlkNDFhMjgxZmEuLjVlMDFiZmI2OWQ3YTMgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9kaXNwLmMKQEAgLTc1OSw3ICs3NTksOCBAQCBudjUw
X21zdG9fZW5hYmxlKHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlcikKIAogCXNsb3RzID0gZHJt
X2RwX2ZpbmRfdmNwaV9zbG90cygmbXN0bS0+bWdyLCBtc3RjLT5wYm4pOwogCXIgPSBkcm1fZHBf
bXN0X2FsbG9jYXRlX3ZjcGkoJm1zdG0tPm1nciwgbXN0Yy0+cG9ydCwgbXN0Yy0+cGJuLCBzbG90
cyk7Ci0JV0FSTl9PTighcik7CisJaWYgKCFyKQorCQlEUk1fREVCVUdfS01TKCJGYWlsZWQgdG8g
YWxsb2NhdGUgVkNQSVxuIik7CiAKIAlpZiAoIW1zdG0tPmxpbmtzKyspCiAJCW52NTBfb3V0cF9h
Y3F1aXJlKG1zdG0tPm91dHApOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
