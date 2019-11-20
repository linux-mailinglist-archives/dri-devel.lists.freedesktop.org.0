Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08AE3104232
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 18:35:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4FCB6E9C0;
	Wed, 20 Nov 2019 17:35:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5D296E9C0
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 17:35:16 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1iXTsj-0006qN-T8; Wed, 20 Nov 2019 17:35:09 +0000
From: Colin King <colin.king@canonical.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org
Subject: [PATCH][next] drm/dp_mst: fix multiple frees of tx->bytes
Date: Wed, 20 Nov 2019 17:35:09 +0000
Message-Id: <20191120173509.347490-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.24.0
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
eSB0eC0+Ynl0ZXMgaXMgYmVpbmcgZnJlZWQgci0+bnVtX3RyYW5zYWN0aW9ucyBudW1iZXIgb2YK
dGltZXMgYmVjYXVzZSB0eCBpcyBub3QgYmVpbmcgc2V0IGNvcnJlY3RseS4gRml4IHRoaXMgYnkg
c2V0dGluZwp0eCB0byAmci0+dHJhbnNhY3Rpb25zW2ldIHNvIHRoYXQgdGhlIGNvcnJlY3Qgb2Jq
ZWN0cyBhcmUgYmVpbmcKZnJlZWQgb24gZWFjaCBsb29wIGl0ZXJhdGlvbi4KCkFkZHJlc3Nlcy1D
b3Zlcml0eTogKCJEb3VibGUgZnJlZSIpCkZpeGVzOiAyZjAxNWVjNmVhYjYgKCJkcm0vZHBfbXN0
OiBBZGQgc2lkZWJhbmQgZG93biByZXF1ZXN0IHRyYWNpbmcgKyBzZWxmdGVzdHMiKQpTaWduZWQt
b2ZmLWJ5OiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMgfCA0ICsrKy0KIDEgZmlsZSBjaGFu
Z2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9t
c3RfdG9wb2xvZ3kuYwppbmRleCBhZTU4MDlhMWYxOWEuLjI3NTRlN2UwNzVlNyAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCkBAIC01MTcsOCArNTE3LDEwIEBAIGRybV9kcF9k
ZWNvZGVfc2lkZWJhbmRfcmVxKGNvbnN0IHN0cnVjdCBkcm1fZHBfc2lkZWJhbmRfbXNnX3R4ICpy
YXcsCiAJCQl9CiAKIAkJCWlmIChmYWlsZWQpIHsKLQkJCQlmb3IgKGkgPSAwOyBpIDwgci0+bnVt
X3RyYW5zYWN0aW9uczsgaSsrKQorCQkJCWZvciAoaSA9IDA7IGkgPCByLT5udW1fdHJhbnNhY3Rp
b25zOyBpKyspIHsKKwkJCQkJdHggPSAmci0+dHJhbnNhY3Rpb25zW2ldOwogCQkJCQlrZnJlZSh0
eC0+Ynl0ZXMpOworCQkJCX0KIAkJCQlyZXR1cm4gLUVOT01FTTsKIAkJCX0KIAotLSAKMi4yNC4w
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
