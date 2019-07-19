Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F16AE6DBFC
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 06:13:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 442786E55A;
	Fri, 19 Jul 2019 04:13:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C3196E55A
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2019 04:13:06 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5DC4F21850;
 Fri, 19 Jul 2019 04:13:05 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 01/45] drm/panel: simple: Fix
 panel_simple_dsi_probe
Date: Fri, 19 Jul 2019 00:12:20 -0400
Message-Id: <20190719041304.18849-1-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1563509586;
 bh=G66xy09mZodkdS9l/UgxrGZcUVk1+9P+0GLt95wlr2I=;
 h=From:To:Cc:Subject:Date:From;
 b=JWc4rEkQ2slZdI+sDxB2UGSxz7xHyq4/qCKgjAp0eAMULgcz+egid2cT8FZ5ouT8j
 2rv1uEqF0694eiy9RYQeercae8eVr0de0W0JVGWAS2I3xiyq2bxh1PabhO5f8HC5MF
 YtolhENrUZ+Or1M6ckJVxQJ4Ue5nNOm+Zs08XoAw=
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
Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>, Sasha Levin <sashal@kernel.org>,
 Thierry Reding <treding@nvidia.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUGV0ZXIgVWpmYWx1c2kgPHBldGVyLnVqZmFsdXNpQHRpLmNvbT4KClsgVXBzdHJlYW0g
Y29tbWl0IDdhZDlkYjY2ZmFmYjBmMGFkNTNmZDJhNjYyMTcxMDVkYTVkZGVmZmUgXQoKSW4gY2Fz
ZSBtaXBpX2RzaV9hdHRhY2goKSBmYWlscyByZW1vdmUgdGhlIHJlZ2lzdGVyZWQgcGFuZWwgdG8g
YXZvaWQgYWRkZWQKcGFuZWwgd2l0aG91dCBjb3JyZXNwb25kaW5nIGRldmljZS4KClNpZ25lZC1v
ZmYtYnk6IFBldGVyIFVqZmFsdXNpIDxwZXRlci51amZhbHVzaUB0aS5jb20+ClNpZ25lZC1vZmYt
Ynk6IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+Ckxpbms6IGh0dHBzOi8vcGF0
Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC9tc2dpZC8yMDE5MDIyNjA4MTE1My4zMTMzNC0x
LXBldGVyLnVqZmFsdXNpQHRpLmNvbQpTaWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFs
QGtlcm5lbC5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jIHwg
OSArKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMgYi9k
cml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMKaW5kZXggNWIyYTlmOTdmZjA0Li42
OGEyYjI1ZGViNTAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaW1w
bGUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMKQEAgLTE5NDQs
NyArMTk0NCwxNCBAQCBzdGF0aWMgaW50IHBhbmVsX3NpbXBsZV9kc2lfcHJvYmUoc3RydWN0IG1p
cGlfZHNpX2RldmljZSAqZHNpKQogCWRzaS0+Zm9ybWF0ID0gZGVzYy0+Zm9ybWF0OwogCWRzaS0+
bGFuZXMgPSBkZXNjLT5sYW5lczsKIAotCXJldHVybiBtaXBpX2RzaV9hdHRhY2goZHNpKTsKKwll
cnIgPSBtaXBpX2RzaV9hdHRhY2goZHNpKTsKKwlpZiAoZXJyKSB7CisJCXN0cnVjdCBwYW5lbF9z
aW1wbGUgKnBhbmVsID0gZGV2X2dldF9kcnZkYXRhKCZkc2ktPmRldik7CisKKwkJZHJtX3BhbmVs
X3JlbW92ZSgmcGFuZWwtPmJhc2UpOworCX0KKworCXJldHVybiBlcnI7CiB9CiAKIHN0YXRpYyBp
bnQgcGFuZWxfc2ltcGxlX2RzaV9yZW1vdmUoc3RydWN0IG1pcGlfZHNpX2RldmljZSAqZHNpKQot
LSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
