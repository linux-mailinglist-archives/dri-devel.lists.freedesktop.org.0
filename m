Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDB85AB9E
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jun 2019 15:55:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF3D86E9A2;
	Sat, 29 Jun 2019 13:55:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E9F96E9A2;
 Sat, 29 Jun 2019 13:55:37 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <colin.king@canonical.com>)
 id 1hhDpG-0006Uw-Gt; Sat, 29 Jun 2019 13:55:34 +0000
From: Colin King <colin.king@canonical.com>
To: Rex Zhu <rex.zhu@amd.com>, Evan Quan <evan.quan@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/amd/pp: fix a dereference of a pointer before it is null
 checked
Date: Sat, 29 Jun 2019 14:55:34 +0100
Message-Id: <20190629135534.15116-1-colin.king@canonical.com>
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

RnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KClRoZSBwb2lu
dGVyIGh3bWdyIGlzIGRlcmVmZXJlbmNlZCB3aGVuIGluaXRpYWxpemluZyBwb2ludGVyIGFkZXYg
aG93ZXZlcgppdCBpcyBhIGxpdHRsZSBsYXRlciBod21nciBpcyBudWxsIGNoZWNrZWQsIGltcGx5
aW5nIGl0IGNvdWxkIHBvdGVudGlhbGx5CmJlIG51bGwgaGVuY2UgdGhlIGFzc2lnbm1lbnQgb2Yg
YWRldiBtYXkgY2F1c2UgYSBudWxsIHBvaW50ZXIgZGVyZWZlcmVuY2UuCkZpeCB0aGlzIGJ5IG1v
dmluZyB0aGUgYXNzaWdubWVudCBhZnRlciB0aGUgbnVsbCBjaGVjay4gTm90ZSB0aGF0IEkgZGlk
CnRoaW5rIG9mIHJlbW92aW5nIGFkZXYgYXMgaXQgaXMgb25seSB1c2VkIG9uY2UsIGhvd2V2ZXIs
IGh3bWdyLT5hZGV2IGlzCmEgdm9pZCAqIHBvaW50ZXIsIHNvIHVzaW5nIGFkZXYgYXZvaWRzIHNv
bWUgdWdseSBjYXN0aW5nIHNvIGl0IG1ha2VzIHNlbnNlCnRvIHN0aWxsIHVzZSBpdC4KCkFkZHJl
c3Nlcy1Db3Zlcml0eTogKCJEZXJlZmVyZW5jZSBiZWZvcmUgbnVsbCBjaGVjayIpCkZpeGVzOiA1
OTE1NmZhZjgxMGUgKCJkcm0vYW1kL3BwOiBSZW1vdmUgdGhlIGNncyB3cmFwcGVyIGZvciBub3Rp
Znkgc211IHZlcnNpb24gb24gQVBVIikKU2lnbmVkLW9mZi1ieTogQ29saW4gSWFuIEtpbmcgPGNv
bGluLmtpbmdAY2Fub25pY2FsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxh
eS9zbXVtZ3Ivc211OF9zbXVtZ3IuYyB8IDUgKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wb3dlcnBsYXkvc211bWdyL3NtdThfc211bWdyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bv
d2VycGxheS9zbXVtZ3Ivc211OF9zbXVtZ3IuYwppbmRleCA4MTg5ZmU0MDJjNmQuLjEyODE1YjM4
MzBlNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211bWdyL3Nt
dThfc211bWdyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211bWdyL3Nt
dThfc211bWdyLmMKQEAgLTcyMiwxMyArNzIyLDExIEBAIHN0YXRpYyBpbnQgc211OF9yZXF1ZXN0
X3NtdV9sb2FkX2Z3KHN0cnVjdCBwcF9od21nciAqaHdtZ3IpCiAKIHN0YXRpYyBpbnQgc211OF9z
dGFydF9zbXUoc3RydWN0IHBwX2h3bWdyICpod21ncikKIHsKLQlzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldiA9IGh3bWdyLT5hZGV2OwotCisJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXY7CiAJ
dWludDMyX3QgaW5kZXggPSBTTU5fTVAxX1NSQU1fU1RBUlRfQUREUiArCiAJCQkgU01VOF9GSVJN
V0FSRV9IRUFERVJfTE9DQVRJT04gKwogCQkJIG9mZnNldG9mKHN0cnVjdCBTTVU4X0Zpcm13YXJl
X0hlYWRlciwgVmVyc2lvbik7CiAKLQogCWlmIChod21nciA9PSBOVUxMIHx8IGh3bWdyLT5kZXZp
Y2UgPT0gTlVMTCkKIAkJcmV0dXJuIC1FSU5WQUw7CiAKQEAgLTczOCw2ICs3MzYsNyBAQCBzdGF0
aWMgaW50IHNtdThfc3RhcnRfc211KHN0cnVjdCBwcF9od21nciAqaHdtZ3IpCiAJCSgoaHdtZ3It
PnNtdV92ZXJzaW9uID4+IDE2KSAmIDB4RkYpLAogCQkoKGh3bWdyLT5zbXVfdmVyc2lvbiA+PiA4
KSAmIDB4RkYpLAogCQkoaHdtZ3ItPnNtdV92ZXJzaW9uICYgMHhGRikpOworCWFkZXYgPSBod21n
ci0+YWRldjsKIAlhZGV2LT5wbS5md192ZXJzaW9uID0gaHdtZ3ItPnNtdV92ZXJzaW9uID4+IDg7
CiAKIAlyZXR1cm4gc211OF9yZXF1ZXN0X3NtdV9sb2FkX2Z3KGh3bWdyKTsKLS0gCjIuMjAuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
