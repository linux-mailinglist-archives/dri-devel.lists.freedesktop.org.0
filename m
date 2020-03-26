Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F121D194C84
	for <lists+dri-devel@lfdr.de>; Fri, 27 Mar 2020 00:25:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F9EA6E970;
	Thu, 26 Mar 2020 23:25:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A7246E970
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Mar 2020 23:25:29 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6918B208FE;
 Thu, 26 Mar 2020 23:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585265129;
 bh=TOlzQZqFBlXXk6vVW3nEQ7OnPHurudRh2uEU+6f1lvY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nzk2F0tgiDlQXRErxVBhCx7AaLVyRWAdpTl4npySNx/qY6KHyV4jXbKXSt0KywMgV
 SHT+lu2IEhtTRbyNQRGAFR8gP3s23j91mvsCcbeGaSb8caF1BgKpdPJxyJ6m0+BAKx
 51lLYjaEHp/SQ19ufeabMtBt6a1ah4f+hXUWl3cs=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 2/7] drm/bochs: downgrade pci_request_region
 failure from error to warning
Date: Thu, 26 Mar 2020 19:25:21 -0400
Message-Id: <20200326232526.8349-2-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200326232526.8349-1-sashal@kernel.org>
References: <20200326232526.8349-1-sashal@kernel.org>
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
X2h3LmMgYi9kcml2ZXJzL2dwdS9kcm0vYm9jaHMvYm9jaHNfaHcuYwppbmRleCBhMzliMDM0M2Mx
OTdkLi40MDFjMjE4NTY3YWY5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYm9jaHMvYm9j
aHNfaHcuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYm9jaHMvYm9jaHNfaHcuYwpAQCAtOTcsMTAg
Kzk3LDggQEAgaW50IGJvY2hzX2h3X2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdWludDMy
X3QgZmxhZ3MpCiAJCXNpemUgPSBtaW4oc2l6ZSwgbWVtKTsKIAl9CiAKLQlpZiAocGNpX3JlcXVl
c3RfcmVnaW9uKHBkZXYsIDAsICJib2Nocy1kcm0iKSAhPSAwKSB7Ci0JCURSTV9FUlJPUigiQ2Fu
bm90IHJlcXVlc3QgZnJhbWVidWZmZXJcbiIpOwotCQlyZXR1cm4gLUVCVVNZOwotCX0KKwlpZiAo
cGNpX3JlcXVlc3RfcmVnaW9uKHBkZXYsIDAsICJib2Nocy1kcm0iKSAhPSAwKQorCQlEUk1fV0FS
TigiQ2Fubm90IHJlcXVlc3QgZnJhbWVidWZmZXIsIGJvb3QgZmIgc3RpbGwgYWN0aXZlP1xuIik7
CiAKIAlib2Nocy0+ZmJfbWFwID0gaW9yZW1hcChhZGRyLCBzaXplKTsKIAlpZiAoYm9jaHMtPmZi
X21hcCA9PSBOVUxMKSB7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
