Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDF390AC0
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 00:10:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48C7B6E3C1;
	Fri, 16 Aug 2019 22:10:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 332406E3C1;
 Fri, 16 Aug 2019 22:10:14 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <colin.king@canonical.com>)
 id 1hykQF-0001vO-C2; Fri, 16 Aug 2019 22:10:11 +0000
From: Colin King <colin.king@canonical.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH][drm-next] drm/amd/display: fix a potential null pointer
 dereference
Date: Fri, 16 Aug 2019 23:10:11 +0100
Message-Id: <20190816221011.10750-1-colin.king@canonical.com>
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
eSB0aGUgcG9pbnRlciBpbml0X2RhdGEgaXMgZGVyZWZlcmVuY2VkIG9uIHRoZSBhc3NpZ25tZW50
Cm9mIGZ3X2luZm8gYmVmb3JlIGluaXRfZGF0YSBpcyBzYW5pdHkgY2hlY2tlZCB0byBzZWUgaWYg
aXQgaXMgbnVsbC4KRml4IHRlIHBvdGVudGlhbCBudWxsIHBvaW50ZXIgZGVyZWZlcmVuY2Ugb24g
aW5pdF9kYXRhIGJ5IG9ubHkKcGVyZm9ybWluZyBkZXJlZmVyZW5jZSBhZnRlciBpdCBpcyBudWxs
IGNoZWNrZWQuCgpBZGRyZXNzZXMtQ292ZXJpdHk6ICgiRGVyZWZlcmVuY2UgYmVmb3JlIG51bGwg
Y2hlY2siKQpGaXhlczogOWFkYzgwNTBiZjNjICgiZHJtL2FtZC9kaXNwbGF5OiBtYWtlIGZpcm13
YXJlIGluZm8gb25seSBsb2FkIG9uY2UgZHVyaW5nIGRjX2Jpb3MgY3JlYXRlIikKU2lnbmVkLW9m
Zi1ieTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9jbG9ja19zb3VyY2UuYyB8IDMgKyst
CiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfY2xvY2tfc291cmNl
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9jbG9ja19zb3VyY2Uu
YwppbmRleCBiZWU4MWJmMjg4YmUuLjkyNjk1NGM4MDRhNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfY2xvY2tfc291cmNlLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfY2xvY2tfc291cmNlLmMKQEAgLTEyMzUs
NyArMTIzNSw3IEBAIHN0YXRpYyBib29sIGNhbGNfcGxsX21heF92Y29fY29uc3RydWN0KAogCQkJ
c3RydWN0IGNhbGNfcGxsX2Nsb2NrX3NvdXJjZV9pbml0X2RhdGEgKmluaXRfZGF0YSkKIHsKIAl1
aW50MzJfdCBpOwotCXN0cnVjdCBkY19maXJtd2FyZV9pbmZvICpmd19pbmZvID0gJmluaXRfZGF0
YS0+YnAtPmZ3X2luZm87CisJc3RydWN0IGRjX2Zpcm13YXJlX2luZm8gKmZ3X2luZm87CiAJaWYg
KGNhbGNfcGxsX2NzID09IE5VTEwgfHwKIAkJCWluaXRfZGF0YSA9PSBOVUxMIHx8CiAJCQlpbml0
X2RhdGEtPmJwID09IE5VTEwpCkBAIC0xMjQ0LDYgKzEyNDQsNyBAQCBzdGF0aWMgYm9vbCBjYWxj
X3BsbF9tYXhfdmNvX2NvbnN0cnVjdCgKIAlpZiAoaW5pdF9kYXRhLT5icC0+ZndfaW5mb192YWxp
ZCkKIAkJcmV0dXJuIGZhbHNlOwogCisJZndfaW5mbyA9ICZpbml0X2RhdGEtPmJwLT5md19pbmZv
OwogCWNhbGNfcGxsX2NzLT5jdHggPSBpbml0X2RhdGEtPmN0eDsKIAljYWxjX3BsbF9jcy0+cmVm
X2ZyZXFfa2h6ID0gZndfaW5mby0+cGxsX2luZm8uY3J5c3RhbF9mcmVxdWVuY3k7CiAJY2FsY19w
bGxfY3MtPm1pbl92Y29fa2h6ID0KLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
