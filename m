Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17EA3E2F59
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 12:48:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 644C56E22C;
	Thu, 24 Oct 2019 10:48:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D859E6E22C
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 10:48:06 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1iNaew-0008Dr-2f; Thu, 24 Oct 2019 10:48:02 +0000
From: Colin King <colin.king@canonical.com>
To: Eric Anholt <eric@anholt.net>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Navid Emamdoost <navid.emamdoost@gmail.com>,
 Iago Toral Quiroga <itoral@igalia.com>, dri-devel@lists.freedesktop.org
Subject: [PATCH][next] drm/v3d: fix double free of bin
Date: Thu, 24 Oct 2019 11:48:01 +0100
Message-Id: <20191024104801.3122-1-colin.king@canonical.com>
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

RnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KClR3byBkaWZm
ZXJlbnQgZml4ZXMgaGF2ZSBhZGRyZXNzZWQgdGhlIHNhbWUgbWVtb3J5IGxlYWsgb2YgYmluIGFu
ZAp0aGlzIG5vdyBjYXVzZXMgYSBkb3VibGUgZnJlZSBvZiBiaW4uICBXaGlsZSB0aGUgaW5kaXZp
ZHVhbCBtZW1vcnkKbGVhayBmaXhlcyBhcmUgZmluZSwgYm90aCBmaXhlcyB0b2dldGhlciBhcmUg
cHJvYmxlbWF0aWMuCgpBZGRyZXNzZXMtQ292ZXJpdHk6ICgiRG91YmxlIGZyZWUiKQpGaXhlczog
MjljZDEzY2ZkNzYyICgiZHJtL3YzZDogRml4IG1lbW9yeSBsZWFrIGluIHYzZF9zdWJtaXRfY2xf
aW9jdGwiKQpGaXhlczogMGQzNTJhM2E4YTFmICgiIHJtL3YzZDogZG9uJ3QgbGVhayBiaW4gam9i
IGlmIHYzZF9qb2JfaW5pdCBmYWlscy4iKQpTaWduZWQtb2ZmLWJ5OiBDb2xpbiBJYW4gS2luZyA8
Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS92M2QvdjNkX2dl
bS5jIHwgMSAtCiAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS92M2QvdjNkX2dlbS5jIGIvZHJpdmVycy9ncHUvZHJtL3YzZC92M2RfZ2Vt
LmMKaW5kZXggNTQ5ZGRlODM0MDhiLi4zNzUxNWU0N2I0N2UgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS92M2QvdjNkX2dlbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS92M2QvdjNkX2dlbS5j
CkBAIC01NjgsNyArNTY4LDYgQEAgdjNkX3N1Ym1pdF9jbF9pb2N0bChzdHJ1Y3QgZHJtX2Rldmlj
ZSAqZGV2LCB2b2lkICpkYXRhLAogCQlyZXQgPSB2M2Rfam9iX2luaXQodjNkLCBmaWxlX3ByaXYs
ICZiaW4tPmJhc2UsCiAJCQkJICAgdjNkX2pvYl9mcmVlLCBhcmdzLT5pbl9zeW5jX2JjbCk7CiAJ
CWlmIChyZXQpIHsKLQkJCWtmcmVlKGJpbik7CiAJCQl2M2Rfam9iX3B1dCgmcmVuZGVyLT5iYXNl
KTsKIAkJCWtmcmVlKGJpbik7CiAJCQlyZXR1cm4gcmV0OwotLSAKMi4yMC4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
