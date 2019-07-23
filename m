Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2EDA71A2C
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 16:23:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D9A56E2D0;
	Tue, 23 Jul 2019 14:23:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46D646E2D0;
 Tue, 23 Jul 2019 14:23:15 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <colin.king@canonical.com>)
 id 1hpvhA-0003lP-IT; Tue, 23 Jul 2019 14:23:12 +0000
From: Colin King <colin.king@canonical.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH][next] drm/amd/display: fix a missing null check on a failed
 kzalloc
Date: Tue, 23 Jul 2019 15:23:12 +0100
Message-Id: <20190723142312.4013-1-colin.king@canonical.com>
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

RnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KCkN1cnJlbnRs
eSB0aGUgYWxsb2NhdGlvbiBvZiBjb25maWcgbWF5IGZhaWwgYW5kIGEgbnVsbCBwb2ludGVyCmRl
cmVmZXJlbmNlIG9uIGNvbmZpZyBjYW4gb2NjdXIuICBGaXggdGhpcyBieSBhZGRlZCBhIG51bGwK
Y2hlY2sgb24gYSBmYWlsZWQgYWxsb2NhdGlvbiBvZiBjb25maWcuCgpBZGRyZXNzZXMtQ292ZXJp
dHk6ICgiRGVyZWZlcmVuY2UgbnVsbCByZXR1cm4iKQpGaXhlczogYzJjZDlkMDRlY2YwICgiZHJt
L2FtZC9kaXNwbGF5OiBIb29rIHVwIGNhbGxzIHRvIGRvIHN0ZXJlbyBtdXggYW5kIGRpZyBwcm9n
cmFtbWluZyB0byBzdGVyZW8gY29udHJvbCBpbnRlcmZhY2UiKQpTaWduZWQtb2ZmLWJ5OiBDb2xp
biBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjLmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Nv
cmUvZGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjLmMKaW5kZXgg
MTY4ZjRhN2RmZmRmLi43Y2NlMmJhZWMyYWYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9jb3JlL2RjLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2NvcmUvZGMuYwpAQCAtMTI1OSw2ICsxMjU5LDggQEAgYm9vbCBkY19zZXRfZ2VuZXJpY19n
cGlvX2Zvcl9zdGVyZW8oYm9vbCBlbmFibGUsCiAJc3RydWN0IGdwaW9fZ2VuZXJpY19tdXhfY29u
ZmlnICpjb25maWcgPSBremFsbG9jKHNpemVvZihzdHJ1Y3QgZ3Bpb19nZW5lcmljX211eF9jb25m
aWcpLAogCQkJICAgR0ZQX0tFUk5FTCk7CiAKKwlpZiAoIWNvbmZpZykKKwkJcmV0dXJuIGZhbHNl
OwogCXBpbl9pbmZvID0gZGFsX2dwaW9fZ2V0X2dlbmVyaWNfcGluX2luZm8oZ3Bpb19zZXJ2aWNl
LCBHUElPX0lEX0dFTkVSSUMsIDApOwogCiAJaWYgKHBpbl9pbmZvLm1hc2sgPT0gMHhGRkZGRkZG
RiB8fCBwaW5faW5mby5vZmZzZXQgPT0gMHhGRkZGRkZGRikgewotLSAKMi4yMC4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
