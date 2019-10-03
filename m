Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5303DCB185
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2019 23:52:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 355236EA81;
	Thu,  3 Oct 2019 21:52:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B70546EA81;
 Thu,  3 Oct 2019 21:52:29 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1iG91P-0000qg-D8; Thu, 03 Oct 2019 21:52:27 +0000
From: Colin King <colin.king@canonical.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH][next] drm/amdgpu: fix uninitialized variable
 pasid_mapping_needed
Date: Thu,  3 Oct 2019 22:52:27 +0100
Message-Id: <20191003215227.23540-1-colin.king@canonical.com>
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

RnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KClRoZSBib29s
ZWFuIHZhcmlhYmxlIHBhc2lkX21hcHBpbmdfbmVlZGVkIGlzIG5vdCBpbml0aWFsaXplZCBhbmQK
dGhlcmUgYXJlIGNvZGUgcGF0aHMgdGhhdCBkbyBub3QgYXNzaWduIGl0IGFueSB2YWx1ZSBiZWZv
cmUgaXQgaXMKaXMgcmVhZCBsYXRlci4gIEZpeCB0aGlzIGJ5IGluaXRpYWxpemluZyBwYXNpZF9t
YXBwaW5nX25lZWRlZCB0bwpmYWxzZS4KCkFkZHJlc3Nlcy1Db3Zlcml0eTogKCJVbmluaXRpYWxp
emVkIHNjYWxhciB2YXJpYWJsZSIpCkZpeGVzOiA2ODE3YmYyODNiMmIgKCJkcm0vYW1kZ3B1OiBn
cmFiIHRoZSBpZCBtZ3IgbG9jayB3aGlsZSBhY2Nlc3NpbmcgcGFzc2lkX21hcHBpbmciKQpTaWdu
ZWQtb2ZmLWJ5OiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jIHwgMiArLQogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfdm0uYwppbmRleCBhMmM3OTdlMzRhMjkuLmJlMTBlNGI5YTk0ZCAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMKQEAgLTEwNTUsNyArMTA1NSw3IEBAIGlu
dCBhbWRncHVfdm1fZmx1c2goc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nLCBzdHJ1Y3QgYW1kZ3B1
X2pvYiAqam9iLAogCQlpZC0+b2Ffc2l6ZSAhPSBqb2ItPm9hX3NpemUpOwogCWJvb2wgdm1fZmx1
c2hfbmVlZGVkID0gam9iLT52bV9uZWVkc19mbHVzaDsKIAlzdHJ1Y3QgZG1hX2ZlbmNlICpmZW5j
ZSA9IE5VTEw7Ci0JYm9vbCBwYXNpZF9tYXBwaW5nX25lZWRlZDsKKwlib29sIHBhc2lkX21hcHBp
bmdfbmVlZGVkID0gZmFsc2U7CiAJdW5zaWduZWQgcGF0Y2hfb2Zmc2V0ID0gMDsKIAlpbnQgcjsK
IAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
