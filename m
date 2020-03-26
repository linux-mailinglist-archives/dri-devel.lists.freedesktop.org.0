Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A133194C41
	for <lists+dri-devel@lfdr.de>; Fri, 27 Mar 2020 00:24:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64F2F6E959;
	Thu, 26 Mar 2020 23:24:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B265D6E959
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Mar 2020 23:24:09 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BACE520714;
 Thu, 26 Mar 2020 23:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585265049;
 bh=JZKbPbuU2UHbrb6VuFFKYu3d0IBGpuh9U6WpdN5Q95o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iktXMYx29K1vJn5wFXvHF/OSu4Gepi8EpWoZap1K+jIOBVWJZq+QIHPTgGubsv32G
 egzBfH8muiHofYoWQC3omtr/NhYilRIOMyak+NwcF/fp0xKgTDeKH+ty/8wY0a7av+
 Cnl7OcIeiR6Vnjh/eDKo7AdsWY2lcBZcqkXfmogs=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.5 10/28] drm/bochs: downgrade pci_request_region
 failure from error to warning
Date: Thu, 26 Mar 2020 19:23:39 -0400
Message-Id: <20200326232357.7516-10-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200326232357.7516-1-sashal@kernel.org>
References: <20200326232357.7516-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>,
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, Gerd Hoffmann <kraxel@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+CgpbIFVwc3RyZWFtIGNvbW1p
dCA4YzM0Y2QxYTdmMDg5ZGMwMzkzMzI4OWM1ZDRhNGQxNDg5NTQ5ODI4IF0KClNodXRkb3duIG9m
IGZpcm13YXJlIGZyYW1lYnVmZmVyIGhhcyBhIGJ1bmNoIG9mIHByb2JsZW1zLiAgQmVjYXVzZQpv
ZiB0aGlzIHRoZSBmcmFtZWJ1ZmZlciByZWdpb24gbWlnaHQgc3RpbGwgYmUgcmVzZXJ2ZWQgZXZl
biBhZnRlcgpkcm1fZmJfaGVscGVyX3JlbW92ZV9jb25mbGljdGluZ19wY2lfZnJhbWVidWZmZXJz
KCkgcmV0dXJuZWQuCgpEb24ndCBjb25zaWRlciBwY2lfcmVxdWVzdF9yZWdpb24oKSBmYWlsdXJl
IGZvciB0aGUgZnJhbWVidWZmZXIKcmVnaW9uIGFzIGZhdGFsIGVycm9yIHRvIHdvcmthcm91bmQg
dGhpcyBpc3N1ZS4KClJlcG9ydGVkLWJ5OiBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kgPG1h
cm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+ClNpZ25lZC1vZmYtYnk6IEdlcmQgSG9mZm1h
bm4gPGtyYXhlbEByZWRoYXQuY29tPgpBY2tlZC1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJv
cmcub3JnPgpMaW5rOiBodHRwOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC9tc2dp
ZC8yMDIwMDMxMzA4NDE1Mi4yNzM0LTEta3JheGVsQHJlZGhhdC5jb20KU2lnbmVkLW9mZi1ieTog
U2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9ib2No
cy9ib2Noc19ody5jIHwgNiArKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JvY2hzL2JvY2hz
X2h3LmMgYi9kcml2ZXJzL2dwdS9kcm0vYm9jaHMvYm9jaHNfaHcuYwppbmRleCBlNTY3YmRmYTJh
YjhlLi5iYjEzOTE3ODRjYWYwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYm9jaHMvYm9j
aHNfaHcuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYm9jaHMvYm9jaHNfaHcuYwpAQCAtMTU2LDEw
ICsxNTYsOCBAQCBpbnQgYm9jaHNfaHdfaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQogCQlz
aXplID0gbWluKHNpemUsIG1lbSk7CiAJfQogCi0JaWYgKHBjaV9yZXF1ZXN0X3JlZ2lvbihwZGV2
LCAwLCAiYm9jaHMtZHJtIikgIT0gMCkgewotCQlEUk1fRVJST1IoIkNhbm5vdCByZXF1ZXN0IGZy
YW1lYnVmZmVyXG4iKTsKLQkJcmV0dXJuIC1FQlVTWTsKLQl9CisJaWYgKHBjaV9yZXF1ZXN0X3Jl
Z2lvbihwZGV2LCAwLCAiYm9jaHMtZHJtIikgIT0gMCkKKwkJRFJNX1dBUk4oIkNhbm5vdCByZXF1
ZXN0IGZyYW1lYnVmZmVyLCBib290IGZiIHN0aWxsIGFjdGl2ZT9cbiIpOwogCiAJYm9jaHMtPmZi
X21hcCA9IGlvcmVtYXAoYWRkciwgc2l6ZSk7CiAJaWYgKGJvY2hzLT5mYl9tYXAgPT0gTlVMTCkg
ewotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
