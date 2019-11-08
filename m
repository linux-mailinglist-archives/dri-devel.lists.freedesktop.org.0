Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8049BF4ED5
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2019 16:00:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24DA06F9C1;
	Fri,  8 Nov 2019 15:00:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5D3D6F9C1;
 Fri,  8 Nov 2019 15:00:21 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1iT5kI-0000PH-5x; Fri, 08 Nov 2019 15:00:18 +0000
From: Colin King <colin.king@canonical.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Lyude Paul <lyude@redhat.com>, Mikita Lipski <mikita.lipski@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH][next] drm/amd/display: fix unsigned less than 0 comparison on
 error check
Date: Fri,  8 Nov 2019 15:00:17 +0000
Message-Id: <20191108150017.125859-1-colin.king@canonical.com>
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
eSB0aGUgZXJyb3IgY2hlY2sgb24gdGhlIGNhbGwgdG8gZHJtX2RwX2F0b21pY19maW5kX3ZjcGlf
c2xvdHMKaXMgYWx3YXlzIGZhbHNlIGJlY2F1c2UgYW4gdW5zaWduZWQgZG1fbmV3X2Nvbm5lY3Rv
cl9zdGF0ZS0+dmNwaV9zbG90cwppcyBiZWluZyBjaGVja2VkIGZvciBhIGxlc3MgdGhhbiB6ZXJv
LiBGaXggdGhpcyBieSBjYXN0aW5nIHRoaXMgdG8KYW4gaW50IG9uIHRoZSBjb21wYXJpc29uLgoK
QWRkcmVzc2VzLUNvdmVyaXR5OiAoIlVuc2lnbmVkIGNvbXBhcmVkIGFnYWluc3QgMCIpCkZpeGVz
OiA1MTMzYzYyNDFkOWMgKCJkcm0vYW1kL2Rpc3BsYXk6IEFkZCBNU1QgYXRvbWljIHJvdXRpbmVz
IikKU2lnbmVkLW9mZi1ieTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNv
bT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5j
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVf
ZG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMK
aW5kZXggMzdjNTYxNTZhMTE2Li4wMGU3MzBiOGQ5OGYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwpAQCAtNDg2Niw3ICs0ODY2LDcg
QEAgc3RhdGljIGludCBkbV9lbmNvZGVyX2hlbHBlcl9hdG9taWNfY2hlY2soc3RydWN0IGRybV9l
bmNvZGVyICplbmNvZGVyLAogCQkJCQkJCQkJICAgbXN0X21nciwKIAkJCQkJCQkJCSAgIG1zdF9w
b3J0LAogCQkJCQkJCQkJICAgZG1fbmV3X2Nvbm5lY3Rvcl9zdGF0ZS0+cGJuKTsKLQlpZiAoZG1f
bmV3X2Nvbm5lY3Rvcl9zdGF0ZS0+dmNwaV9zbG90cyA8IDApIHsKKwlpZiAoKGludClkbV9uZXdf
Y29ubmVjdG9yX3N0YXRlLT52Y3BpX3Nsb3RzIDwgMCkgewogCQlEUk1fREVCVUdfQVRPTUlDKCJm
YWlsZWQgZmluZGluZyB2Y3BpIHNsb3RzOiAlZFxuIiwgKGludClkbV9uZXdfY29ubmVjdG9yX3N0
YXRlLT52Y3BpX3Nsb3RzKTsKIAkJcmV0dXJuIGRtX25ld19jb25uZWN0b3Jfc3RhdGUtPnZjcGlf
c2xvdHM7CiAJfQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
