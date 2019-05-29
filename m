Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F55C2DFBA
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 16:29:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12DD26E332;
	Wed, 29 May 2019 14:29:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6829B6E331;
 Wed, 29 May 2019 14:29:33 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <colin.king@canonical.com>)
 id 1hVza3-0000sX-ED; Wed, 29 May 2019 14:29:27 +0000
From: Colin King <colin.king@canonical.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH][next] drm/i915: fix uninitialized variable 'mask'
Date: Wed, 29 May 2019 15:29:27 +0100
Message-Id: <20190529142927.16699-1-colin.king@canonical.com>
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
eSBtYXNrIGlzIG5vdCBpbml0aWFsaXplZCBhbmQgc28gZGF0YSBpcyBiZWluZyBiaXQtd2lzZSBv
cidkIGludG8KYSBnYXJiYWdlIHZhbHVlLiBGaXggdGhpcyBieSBpbmludGlhbGl6aW5nIG1hc2sg
dG8gemVyby4KCkFkZHJlc3Nlcy1Db3Zlcml0eTogKCJVbmluaXRpYWxpemVkIHNjYWxhciB2YXJp
YWJsZSIpCkZpeGVzOiAxYWMxNTllMjNjMmMgKCJkcm0vaTkxNTogRXhwYW5kIHN1YnNsaWNlIG1h
c2siKQpTaWduZWQtb2ZmLWJ5OiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX3NzZXUuYyB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX3NzZXUuYyBiL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2d0L2ludGVsX3NzZXUuYwppbmRleCA3NjNiODExZjJjOWQuLjVhODk2NzJkOThhMiAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfc3NldS5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX3NzZXUuYwpAQCAtNDEsNyArNDEsNyBAQCB2b2lkIGlu
dGVsX3NzZXVfY29weV9zdWJzbGljZXMoY29uc3Qgc3RydWN0IHNzZXVfZGV2X2luZm8gKnNzZXUs
IGludCBzbGljZSwKIHUzMiBpbnRlbF9zc2V1X2dldF9zdWJzbGljZXMoY29uc3Qgc3RydWN0IHNz
ZXVfZGV2X2luZm8gKnNzZXUsIHU4IHNsaWNlKQogewogCWludCBpLCBvZmZzZXQgPSBzbGljZSAq
IHNzZXUtPnNzX3N0cmlkZTsKLQl1MzIgbWFzazsKKwl1MzIgbWFzayA9IDA7CiAKIAlHRU1fQlVH
X09OKHNsaWNlID49IHNzZXUtPm1heF9zbGljZXMpOwogCi0tIAoyLjIwLjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
