Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6653A648DE
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2019 17:02:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B7446E0E9;
	Wed, 10 Jul 2019 15:02:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 199CA6E0E9
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 15:02:47 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 039F42064B;
 Wed, 10 Jul 2019 15:02:45 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.1 03/11] drm/virtio: move
 drm_connector_update_edid_property() call
Date: Wed, 10 Jul 2019 11:02:30 -0400
Message-Id: <20190710150240.6984-3-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190710150240.6984-1-sashal@kernel.org>
References: <20190710150240.6984-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1562770966;
 bh=iDWaGuCyFWXcNVHxVD68Z0CNqAgj+ipuFl5jzHmj4kA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ry5jxnTIsLHN8kFUiyUPGvn8wgjYz4kNq7bT2vJRzmzCiK2OFkeI0K/AjwYhujbGu
 pjl6z+HpwjjSZN+V9BONgpuiUyWoNrb7Jicd5EhYIf/8Xy9CsKrWF87Wp7qUyixY15
 D9b2Q6KRH5JPdt9aY/t1XSLhkQRBS9Up+PwCHA1E=
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
Cc: Sasha Levin <sashal@kernel.org>, Cornelia Huck <cohuck@redhat.com>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Max Filippov <jcmvbkbc@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+CgpbIFVwc3RyZWFtIGNvbW1p
dCA0MWRlNGJlNmY2ZWZhNDEzMmIyOWFmNTExNThjZDY3MmQ5M2YyNTQzIF0KCmRybV9jb25uZWN0
b3JfdXBkYXRlX2VkaWRfcHJvcGVydHkgY2FuIHNsZWVwLCB3ZSBtdXN0IG5vdApjYWxsIGl0IHdo
aWxlIGhvbGRpbmcgYSBzcGlubG9jay4gIE1vdmUgdGhlIGNhbGxzaXRlLgoKRml4ZXM6IGI0YjAx
YjQ5OTVmYiAoImRybS92aXJ0aW86IGFkZCBlZGlkIHN1cHBvcnQiKQpSZXBvcnRlZC1ieTogTWF4
IEZpbGlwcG92IDxqY212YmtiY0BnbWFpbC5jb20+ClNpZ25lZC1vZmYtYnk6IEdlcmQgSG9mZm1h
bm4gPGtyYXhlbEByZWRoYXQuY29tPgpUZXN0ZWQtYnk6IE1heCBGaWxpcHBvdiA8amNtdmJrYmNA
Z21haWwuY29tPgpUZXN0ZWQtYnk6IENvcm5lbGlhIEh1Y2sgPGNvaHVja0ByZWRoYXQuY29tPgpB
Y2tlZC1ieTogQ29ybmVsaWEgSHVjayA8Y29odWNrQHJlZGhhdC5jb20+Ckxpbms6IGh0dHA6Ly9w
YXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoL21zZ2lkLzIwMTkwNDA1MDQ0NjAyLjIzMzQt
MS1rcmF4ZWxAcmVkaGF0LmNvbQpTaWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtl
cm5lbC5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X3ZxLmMgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfdnEuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS92aXJ0aW8vdmlydGdwdV92cS5jCmluZGV4IDZiYzIwMDhiMGQwZC4uM2VmMjRmODllZjkzIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfdnEuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfdnEuYwpAQCAtNjIwLDExICs2MjAsMTEgQEAgc3Rh
dGljIHZvaWQgdmlydGlvX2dwdV9jbWRfZ2V0X2VkaWRfY2Ioc3RydWN0IHZpcnRpb19ncHVfZGV2
aWNlICp2Z2RldiwKIAlvdXRwdXQgPSB2Z2Rldi0+b3V0cHV0cyArIHNjYW5vdXQ7CiAKIAluZXdf
ZWRpZCA9IGRybV9kb19nZXRfZWRpZCgmb3V0cHV0LT5jb25uLCB2aXJ0aW9fZ2V0X2VkaWRfYmxv
Y2ssIHJlc3ApOworCWRybV9jb25uZWN0b3JfdXBkYXRlX2VkaWRfcHJvcGVydHkoJm91dHB1dC0+
Y29ubiwgbmV3X2VkaWQpOwogCiAJc3Bpbl9sb2NrKCZ2Z2Rldi0+ZGlzcGxheV9pbmZvX2xvY2sp
OwogCW9sZF9lZGlkID0gb3V0cHV0LT5lZGlkOwogCW91dHB1dC0+ZWRpZCA9IG5ld19lZGlkOwot
CWRybV9jb25uZWN0b3JfdXBkYXRlX2VkaWRfcHJvcGVydHkoJm91dHB1dC0+Y29ubiwgb3V0cHV0
LT5lZGlkKTsKIAlzcGluX3VubG9jaygmdmdkZXYtPmRpc3BsYXlfaW5mb19sb2NrKTsKIAogCWtm
cmVlKG9sZF9lZGlkKTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
