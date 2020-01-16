Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB4C13E3FA
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2020 18:05:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 758146EE0B;
	Thu, 16 Jan 2020 17:05:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58B546EE0B
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2020 17:05:27 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 85F3D2087E;
 Thu, 16 Jan 2020 17:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579194327;
 bh=2rpy/MMMrn6+0nPuWAz83Vpo/mL3rkWiZmO0V/DJzLU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kG9O+YWIRmv+3gx+YVhUqsd/GVpBSZhg+RDoL1dglH9+OafK61gBiTaKM+lqHwQQA
 ROhzvS1/zRwDyCi+/Z5kTgD4V81qSJpw3twIqy915XGoYBUduJIvRvzHgIkZuJqLtT
 LPp79en7GBiU1ewtZYavS6to/ih6lcTVQPGhr73w=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 275/671] drm/fb-helper: generic: Call
 drm_client_add() after setup is done
Date: Thu, 16 Jan 2020 11:58:33 -0500
Message-Id: <20200116170509.12787-12-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116170509.12787-1-sashal@kernel.org>
References: <20200116170509.12787-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTm9yYWxmIFRyw7hubmVzIDxub3JhbGZAdHJvbm5lcy5vcmc+CgpbIFVwc3RyZWFtIGNv
bW1pdCA2ZTNmMTdlZTczZjdlM2MyZWYwZTJjOGZkODYyNGIyZWNlOGVmMmM5IF0KCkhvdHBsdWcg
Y2FuIGhhcHBlbiB3aGlsZSBkcm1fZmJkZXZfZ2VuZXJpY19zZXR1cCgpIGlzIHJ1bm5pbmcgc28g
bW92ZQpkcm1fY2xpZW50X2FkZCgpIGNhbGwgYWZ0ZXIgc2V0dXAgaXMgZG9uZSB0byBhdm9pZApk
cm1fZmJkZXZfY2xpZW50X2hvdHBsdWcoKSBydW5uaW5nIGluIHR3byB0aHJlYWRzIGF0IHRoZSBz
YW1lIHRpbWUuCgpGaXhlczogOTA2MGQ3ZjQ5Mzc2ICgiZHJtL2ZiLWhlbHBlcjogRmluaXNoIHRo
ZSBnZW5lcmljIGZiZGV2IGVtdWxhdGlvbiIpCkNjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnClJl
cG9ydGVkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgpTaWduZWQt
b2ZmLWJ5OiBOb3JhbGYgVHLDuG5uZXMgPG5vcmFsZkB0cm9ubmVzLm9yZz4KUmV2aWV3ZWQtYnk6
IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Ckxpbms6IGh0dHBzOi8vcGF0
Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC9tc2dpZC8yMDE5MDQwMTE0MTM1OC4yNTMwOS0x
LW5vcmFsZkB0cm9ubmVzLm9yZwpTaWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtl
cm5lbC5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYyB8IDQgKystLQog
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jIGIvZHJpdmVycy9ncHUvZHJtL2Ry
bV9mYl9oZWxwZXIuYwppbmRleCAxYzg3YWQ2NjY3ZTcuLmRhOWEzODFkNmI1NyAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2ZiX2hlbHBlci5jCkBAIC0zMjU3LDggKzMyNTcsNiBAQCBpbnQgZHJtX2ZiZGV2X2dlbmVy
aWNfc2V0dXAoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdW5zaWduZWQgaW50IHByZWZlcnJlZF9i
cHApCiAJCXJldHVybiByZXQ7CiAJfQogCi0JZHJtX2NsaWVudF9hZGQoJmZiX2hlbHBlci0+Y2xp
ZW50KTsKLQogCWlmICghcHJlZmVycmVkX2JwcCkKIAkJcHJlZmVycmVkX2JwcCA9IGRldi0+bW9k
ZV9jb25maWcucHJlZmVycmVkX2RlcHRoOwogCWlmICghcHJlZmVycmVkX2JwcCkKQEAgLTMyNjcs
NiArMzI2NSw4IEBAIGludCBkcm1fZmJkZXZfZ2VuZXJpY19zZXR1cChzdHJ1Y3QgZHJtX2Rldmlj
ZSAqZGV2LCB1bnNpZ25lZCBpbnQgcHJlZmVycmVkX2JwcCkKIAogCWRybV9mYmRldl9jbGllbnRf
aG90cGx1ZygmZmJfaGVscGVyLT5jbGllbnQpOwogCisJZHJtX2NsaWVudF9hZGQoJmZiX2hlbHBl
ci0+Y2xpZW50KTsKKwogCXJldHVybiAwOwogfQogRVhQT1JUX1NZTUJPTChkcm1fZmJkZXZfZ2Vu
ZXJpY19zZXR1cCk7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
