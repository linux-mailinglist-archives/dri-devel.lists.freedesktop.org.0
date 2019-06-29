Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB525AB8D
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jun 2019 15:31:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E3FC89D64;
	Sat, 29 Jun 2019 13:31:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15FC489D64;
 Sat, 29 Jun 2019 13:31:18 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <colin.king@canonical.com>)
 id 1hhDRi-0004Ds-LU; Sat, 29 Jun 2019 13:31:14 +0000
From: Colin King <colin.king@canonical.com>
To: Oded Gabbay <oded.gabbay@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdkfd: fix potential null pointer dereference on pointer
 peer_dev
Date: Sat, 29 Jun 2019 14:31:14 +0100
Message-Id: <20190629133114.14271-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KClRoZSBjYWxs
IHRvIGtmZF90b3BvbG9neV9kZXZpY2VfYnlfcHJveGltaXR5X2RvbWFpbiBjYW4gcmV0dXJuIGEg
TlVMTApwb2ludGVyIHNvIGFkZCBhIG51bGwgcG9pbnRlciBjaGVjayBvbiBwZWVyX2RldiB0byB0
aGUgZXhpc3RpbmcgbnVsbApwb2ludGVyIGNoZWNrIG9uIHBlZXJfZGV2LT5ncHUgdG8gYXZvaWQg
YW55IHBvdGVudGlhbCBudWxsIHBvaW50ZXIKZGVyZWZlcmVuY2VzLgoKQWRkcmVzc2VzLUNvdmVy
aXR5OiAoIkRlcmVmZXJlbmNlIG9uIG51bGwgcmV0dXJuIHZhbHVlIikKRml4ZXM6IGFlOWEyNWFl
YTdmMyAoImRybS9hbWRrZmQ6IEdlbmVyYXRlIHhHTUkgZGlyZWN0IGlvbGluayIpClNpZ25lZC1v
ZmYtYnk6IENvbGluIElhbiBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+Ci0tLQogZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2NyYXQuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1ka2ZkL2tmZF9jcmF0LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9r
ZmRfY3JhdC5jCmluZGV4IDRlM2ZjMjg0ZjZhYy4uY2I2YjQ2Y2ZhNmMyIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfY3JhdC5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1ka2ZkL2tmZF9jcmF0LmMKQEAgLTEyOTMsNyArMTI5Myw3IEBAIHN0YXRpYyBpbnQg
a2ZkX2NyZWF0ZV92Y3JhdF9pbWFnZV9ncHUodm9pZCAqcGNyYXRfaW1hZ2UsCiAJaWYgKGtkZXYt
PmhpdmVfaWQpIHsKIAkJZm9yIChuaWQgPSAwOyBuaWQgPCBwcm94aW1pdHlfZG9tYWluOyArK25p
ZCkgewogCQkJcGVlcl9kZXYgPSBrZmRfdG9wb2xvZ3lfZGV2aWNlX2J5X3Byb3hpbWl0eV9kb21h
aW4obmlkKTsKLQkJCWlmICghcGVlcl9kZXYtPmdwdSkKKwkJCWlmICghcGVlcl9kZXYgfHwgIXBl
ZXJfZGV2LT5ncHUpCiAJCQkJY29udGludWU7CiAJCQlpZiAocGVlcl9kZXYtPmdwdS0+aGl2ZV9p
ZCAhPSBrZGV2LT5oaXZlX2lkKQogCQkJCWNvbnRpbnVlOwotLSAKMi4yMC4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
