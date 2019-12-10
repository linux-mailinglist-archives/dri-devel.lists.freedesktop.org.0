Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0140F1197AE
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 22:34:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0040E6E99E;
	Tue, 10 Dec 2019 21:34:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6D3E6E99C;
 Tue, 10 Dec 2019 21:34:46 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D8B91207FF;
 Tue, 10 Dec 2019 21:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576013686;
 bh=b/KjiDjETamHW9Y/8FNozm/dGxjife84uORnLJ/QAO0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=u405EaP1BZTq8noYYF8BaS8zTwV42211rlTiRHlfmyEt2mUf8xd4eWv+y+w/Cf3hd
 CRDqY441KJpIMNd4WLzpBIwtmBliv61QDz9a0V1OxFS7eEm6IVhr6jQKGUCWtyQAl8
 mH9zNFSRfZs0xfcS8KGdVC/C6Q9yPMIzVMhoVc1c=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 119/177] drm/amdgpu: fix potential double drop
 fence reference
Date: Tue, 10 Dec 2019 16:31:23 -0500
Message-Id: <20191210213221.11921-119-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191210213221.11921-1-sashal@kernel.org>
References: <20191210213221.11921-1-sashal@kernel.org>
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
bWRncHVfdGVzdC5jCmluZGV4IDg5MDRlNjJkY2E3YWUuLjQxZDMxNDJlZjNjZjAgMTAwNjQ0Ci0t
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
