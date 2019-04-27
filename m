Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B112B24A
	for <lists+dri-devel@lfdr.de>; Sat, 27 Apr 2019 03:39:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ED838926B;
	Sat, 27 Apr 2019 01:39:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94FE389264;
 Sat, 27 Apr 2019 01:39:44 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A73EC20873;
 Sat, 27 Apr 2019 01:39:43 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.0 41/79] drm/amd/display: fix cursor black issue
Date: Fri, 26 Apr 2019 21:38:00 -0400
Message-Id: <20190427013838.6596-41-sashal@kernel.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190427013838.6596-1-sashal@kernel.org>
References: <20190427013838.6596-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1556329184;
 bh=whvNBmCkh1AiI3XA2AqIodVoRylYI+nMH65IWUwafBw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=W8WeO0v5x6RNWjiudrNy7tSeMxIg7i2IJl8rUf3qRyjl0zjUtaLhXpy8qFEuEBxXf
 Nr5HfQg5C5u0aWnHpkR/tyG1sNhP9w5yPtLFrkFnh4QPJJfTBSvDx5YInapaiQaM4C
 d3zU3WHSQhOHPREru2sCDkDk5/XAEPZwHCAkjGf4=
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 tiancyin <tianci.yin@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogdGlhbmN5aW4gPHRpYW5jaS55aW5AYW1kLmNvbT4KClsgVXBzdHJlYW0gY29tbWl0IGMx
Y2VmZTExNWQxY2RjNDYwMDE0NDgzMzE5ZDQ0MGIyZjBkMDdjNjggXQoKW1doeV0KdGhlIG1lbWJl
ciBzZHJfd2hpdGVfbGV2ZWwgb2Ygc3RydWN0IGRjX2N1cnNvcl9hdHRyaWJ1dGVzIHdhcyBub3QK
aW5pdGlhbGl6ZWQsIHRoZW4gdGhlIHJhbmRvbSB2YWx1ZSByZXN1bHQgdGhhdApkY24xMF9zZXRf
Y3Vyc29yX3Nkcl93aGl0ZV9sZXZlbCgpIHNldCBlcnJvciBod19zY2FsZSB2YWx1ZSAweDIwRDko
bm9ybWFsCnZhbHVlIGlzIDB4M2MwMCksIHRoaXMgY2F1c2UgdGhlIGJsYWNrIGN1cnNvciBpc3N1
ZS4KCltob3ddCmp1c3QgaW5pdGlsaXplIHRoZSBvYmogb2Ygc3RydWN0IGRjX2N1cnNvcl9hdHRy
aWJ1dGVzIHRvIHplcm8gdG8gYXZvaWQKdGhlIHJhbmRvbSB2YWx1ZS4KClJldmlld2VkLWJ5OiBO
aWNob2xhcyBLYXpsYXVza2FzIDxuaWNob2xhcy5rYXpsYXVza2FzQGFtZC5jb20+ClNpZ25lZC1v
ZmYtYnk6IFRpYW5jaSBZaW4gPHRpYW5jaS55aW5AYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxl
eCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBTYXNo
YSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9k
bS9hbWRncHVfZG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1k
Z3B1X2RtLmMKaW5kZXggODNjOGEwNDA3NTM3Li44NGVlNzc3ODY5NDQgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwpAQCAtNDQ1NSw2
ICs0NDU1LDcgQEAgc3RhdGljIHZvaWQgaGFuZGxlX2N1cnNvcl91cGRhdGUoc3RydWN0IGRybV9w
bGFuZSAqcGxhbmUsCiAJYW1kZ3B1X2NydGMtPmN1cnNvcl93aWR0aCA9IHBsYW5lLT5zdGF0ZS0+
Y3J0Y193OwogCWFtZGdwdV9jcnRjLT5jdXJzb3JfaGVpZ2h0ID0gcGxhbmUtPnN0YXRlLT5jcnRj
X2g7CiAKKwltZW1zZXQoJmF0dHJpYnV0ZXMsIDAsIHNpemVvZihhdHRyaWJ1dGVzKSk7CiAJYXR0
cmlidXRlcy5hZGRyZXNzLmhpZ2hfcGFydCA9IHVwcGVyXzMyX2JpdHMoYWRkcmVzcyk7CiAJYXR0
cmlidXRlcy5hZGRyZXNzLmxvd19wYXJ0ICA9IGxvd2VyXzMyX2JpdHMoYWRkcmVzcyk7CiAJYXR0
cmlidXRlcy53aWR0aCAgICAgICAgICAgICA9IHBsYW5lLT5zdGF0ZS0+Y3J0Y193OwotLSAKMi4x
OS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
