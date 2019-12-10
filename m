Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFA411936A
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 22:11:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F22E96E945;
	Tue, 10 Dec 2019 21:11:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C2156E945
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 21:11:33 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7B9EE246BD;
 Tue, 10 Dec 2019 21:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576012293;
 bh=H2GK/DUBBLyJIEm10deHjwmLeqHR0r/dzL9Ms9oZTUY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=0+/S+LbxZQNZt2eET1sT+IPf2mjqt3OtruNrK/yaZhnO5q4sctBRDUwYGGJBKJ8BP
 /76+LI1TFbP5+yuOGyUYzBP4XaMAxt+z+MZwSFBt46EJIjxzJMpJmugfO7C12/ZvBQ
 Co1LOEP3u18AFo/cP6pSyRqtzgf8cMm3dX7bpnMA=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 232/350] drm/amdgpu: fix potential double drop
 fence reference
Date: Tue, 10 Dec 2019 16:05:37 -0500
Message-Id: <20191210210735.9077-193-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191210210735.9077-1-sashal@kernel.org>
References: <20191210210735.9077-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Pan Bian <bianpan2016@163.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUGFuIEJpYW4gPGJpYW5wYW4yMDE2QDE2My5jb20+CgpbIFVwc3RyZWFtIGNvbW1pdCA5
NDZhYjhkYjY5NTM1MzVhM2E4OGM5NTdkYjgzMjhiZWFjZGZlZDlkIF0KClRoZSBvYmplY3QgZmVu
Y2UgaXMgbm90IHNldCB0byBOVUxMIGFmdGVyIGl0cyByZWZlcmVuY2UgaXMgZHJvcHBlZC4gQXMg
YQpyZXN1bHQsIGl0cyByZWZlcmVuY2UgbWF5IGJlIGRyb3BwZWQgYWdhaW4gaWYgZXJyb3Igb2Nj
dXJzIGFmdGVyIHRoYXQsCndoaWNoIG1heSBsZWFkIHRvIGEgdXNlIGFmdGVyIGZyZWUgYnVnLiBU
byBhdm9pZCB0aGUgaXNzdWUsIGZlbmNlIGlzCmV4cGxpY2l0bHkgc2V0IHRvIE5VTEwgYWZ0ZXIg
ZHJvcHBpbmcgaXRzIHJlZmVyZW5jZS4KCkFja2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJp
c3RpYW4ua29lbmlnQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IFBhbiBCaWFuIDxiaWFucGFuMjAx
NkAxNjMuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVy
QGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IFNhc2hhIExldmluIDxzYXNoYWxAa2VybmVsLm9yZz4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdGVzdC5jIHwgMiArKwogMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV90ZXN0LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfdGVzdC5jCmluZGV4IGI2NmQyOWQ1ZmZhMmMuLmIxNTgyMzBhZjhkYjcgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90ZXN0LmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Rlc3QuYwpAQCAtMTM4LDYgKzEzOCw3IEBAIHN0
YXRpYyB2b2lkIGFtZGdwdV9kb190ZXN0X21vdmVzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2
KQogCQl9CiAKIAkJZG1hX2ZlbmNlX3B1dChmZW5jZSk7CisJCWZlbmNlID0gTlVMTDsKIAogCQly
ID0gYW1kZ3B1X2JvX2ttYXAodnJhbV9vYmosICZ2cmFtX21hcCk7CiAJCWlmIChyKSB7CkBAIC0x
ODMsNiArMTg0LDcgQEAgc3RhdGljIHZvaWQgYW1kZ3B1X2RvX3Rlc3RfbW92ZXMoc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYpCiAJCX0KIAogCQlkbWFfZmVuY2VfcHV0KGZlbmNlKTsKKwkJZmVu
Y2UgPSBOVUxMOwogCiAJCXIgPSBhbWRncHVfYm9fa21hcChndHRfb2JqW2ldLCAmZ3R0X21hcCk7
CiAJCWlmIChyKSB7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
