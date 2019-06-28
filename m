Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BAB59DAA
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 16:24:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC16A6E930;
	Fri, 28 Jun 2019 14:24:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77A356E930;
 Fri, 28 Jun 2019 14:24:05 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <colin.king@canonical.com>)
 id 1hgrnG-0006x6-VL; Fri, 28 Jun 2019 14:24:03 +0000
From: Colin King <colin.king@canonical.com>
To: Rex Zhu <rex.zhu@amd.com>, Evan Quan <evan.quan@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/amd/powerplay: fix off-by-one array bounds check
Date: Fri, 28 Jun 2019 15:24:02 +0100
Message-Id: <20190628142402.2771-1-colin.king@canonical.com>
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

RnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KClRoZSBhcnJh
eSBib3VuZHMgY2hlY2sgZm9yIGluZGV4IGlzIGN1cnJlbnRseSBvZmYtYnktb25lIGFuZCBzaG91
bGQKYmUgdXNpbmcgPj0gcmF0aGVyIHRoYW4gPiBvbiB0aGUgdXBwZXIgYm91bmQuIEZpeCB0aGlz
LgoKQWRkcmVzc2VzLUNvdmVyaXR5OiAoIk91dC1vZi1ib3VuZHMgcmVhZCIpCkZpeGVzOiBiMzQ5
MDY3M2Y5MDUgKCJkcm0vYW1kL3Bvd2VycGxheTogaW50cm9kdWNlIHRoZSBuYXZpMTAgcHB0YWJs
ZSBpbXBsZW1lbnRhdGlvbiIpClNpZ25lZC1vZmYtYnk6IENvbGluIElhbiBLaW5nIDxjb2xpbi5r
aW5nQGNhbm9uaWNhbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2
aTEwX3BwdC5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEw
X3BwdC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jCmluZGV4
IDI3ZTVjODAuLmY2Nzg3MDAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJw
bGF5L25hdmkxMF9wcHQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZp
MTBfcHB0LmMKQEAgLTIxMCw3ICsyMTAsNyBAQCBzdGF0aWMgaW50IG5hdmkxMF93b3JrbG9hZF9t
YXBbXSA9IHsKIHN0YXRpYyBpbnQgbmF2aTEwX2dldF9zbXVfbXNnX2luZGV4KHN0cnVjdCBzbXVf
Y29udGV4dCAqc21jLCB1aW50MzJfdCBpbmRleCkKIHsKIAlpbnQgdmFsOwotCWlmIChpbmRleCA+
IFNNVV9NU0dfTUFYX0NPVU5UKQorCWlmIChpbmRleCA+PSBTTVVfTVNHX01BWF9DT1VOVCkKIAkJ
cmV0dXJuIC1FSU5WQUw7CiAKIAl2YWwgPSBuYXZpMTBfbWVzc2FnZV9tYXBbaW5kZXhdOwotLSAK
Mi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
