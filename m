Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D99637DA16
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2019 13:15:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8F576E4AE;
	Thu,  1 Aug 2019 11:15:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1D2E6E4AE;
 Thu,  1 Aug 2019 11:15:44 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <colin.king@canonical.com>)
 id 1ht93d-0007Ka-WF; Thu, 01 Aug 2019 11:15:42 +0000
From: Colin King <colin.king@canonical.com>
To: Kevin Wang <kevin1.wang@amd.com>, Rex Zhu <rex.zhu@amd.com>,
 Evan Quan <evan.quan@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH][drm-next] drm/amd/powerplay: fix off-by-one upper bounds
 limit checks
Date: Thu,  1 Aug 2019 12:15:41 +0100
Message-Id: <20190801111541.13627-1-colin.king@canonical.com>
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

RnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KClRoZXJlIGFy
ZSB0d28gb2NjdXJyYW5jZXMgb2Ygb2ZmLWJ5LW9uZSB1cHBlciBib3VuZCBjaGVja2luZyBvZiBp
bmRleGVzCmNhdXNpbmcgcG90ZW50aWFsIG91dC1vZi1ib3VuZHMgYXJyYXkgcmVhZHMuIEZpeCB0
aGVzZS4KCkFkZHJlc3Nlcy1Db3Zlcml0eTogKCJPdXQtb2YtYm91bmRzIHJlYWQiKQpGaXhlczog
Y2IzMzM2M2QwZTg1ICgiZHJtL2FtZC9wb3dlcnBsYXk6IGFkZCBzbXUgZmVhdHVyZSBuYW1lIHN1
cHBvcnQiKQpGaXhlczogNmIyOTQ3OTNlMzg0ICgiZHJtL2FtZC9wb3dlcnBsYXk6IGFkZCBzbXUg
bWVzc2FnZSBuYW1lIHN1cHBvcnQiKQpTaWduZWQtb2ZmLWJ5OiBDb2xpbiBJYW4gS2luZyA8Y29s
aW4ua2luZ0BjYW5vbmljYWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L2FtZGdwdV9zbXUuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxh
eS9hbWRncHVfc211LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211
LmMKaW5kZXggZDAyOWE5OWU2MDBlLi5iNjQxMTM3NDBlYjUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMKQEAgLTM4LDcgKzM4LDcgQEAgc3RhdGljIGNvbnN0
IGNoYXIqIF9fc211X21lc3NhZ2VfbmFtZXNbXSA9IHsKIAogY29uc3QgY2hhciAqc211X2dldF9t
ZXNzYWdlX25hbWUoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIGVudW0gc211X21lc3NhZ2VfdHlw
ZSB0eXBlKQogewotCWlmICh0eXBlIDwgMCB8fCB0eXBlID4gU01VX01TR19NQVhfQ09VTlQpCisJ
aWYgKHR5cGUgPCAwIHx8IHR5cGUgPj0gU01VX01TR19NQVhfQ09VTlQpCiAJCXJldHVybiAidW5r
bm93biBzbXUgbWVzc2FnZSI7CiAJcmV0dXJuIF9fc211X21lc3NhZ2VfbmFtZXNbdHlwZV07CiB9
CkBAIC01MSw3ICs1MSw3IEBAIHN0YXRpYyBjb25zdCBjaGFyKiBfX3NtdV9mZWF0dXJlX25hbWVz
W10gPSB7CiAKIGNvbnN0IGNoYXIgKnNtdV9nZXRfZmVhdHVyZV9uYW1lKHN0cnVjdCBzbXVfY29u
dGV4dCAqc211LCBlbnVtIHNtdV9mZWF0dXJlX21hc2sgZmVhdHVyZSkKIHsKLQlpZiAoZmVhdHVy
ZSA8IDAgfHwgZmVhdHVyZSA+IFNNVV9GRUFUVVJFX0NPVU5UKQorCWlmIChmZWF0dXJlIDwgMCB8
fCBmZWF0dXJlID49IFNNVV9GRUFUVVJFX0NPVU5UKQogCQlyZXR1cm4gInVua25vd24gc211IGZl
YXR1cmUiOwogCXJldHVybiBfX3NtdV9mZWF0dXJlX25hbWVzW2ZlYXR1cmVdOwogfQotLSAKMi4y
MC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
