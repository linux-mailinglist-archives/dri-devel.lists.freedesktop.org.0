Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 259192DF519
	for <lists+dri-devel@lfdr.de>; Sun, 20 Dec 2020 12:10:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77F776E13C;
	Sun, 20 Dec 2020 11:10:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAF4A89789
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Dec 2020 17:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1608399993;
 bh=qSwtXCVRwWZNBlI00yBuYouvdhL88ki0NEEUrGgltaw=;
 h=X-UI-Sender-Class:Subject:From:To:Cc:References:Date:In-Reply-To;
 b=ZZY6iyLZUBg6jTItPz1LhQFemNb/M/36jUxaVxE9rB2M1gHrZTrcAAp9UFaD590nB
 1oGT75P9Ln9XviRjfmeE33QYHFc88cXFJyNum7HDQc0+nWUU1IZkiD0ZL1iveFB4A+
 UQsjGx4Ay6nqLZRmsJF9YLVv3vhJ3RGhbOJFUs1A=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([78.49.88.127]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MVrbz-1kh5VV3QP7-00RqpZ; Sat, 19
 Dec 2020 18:46:32 +0100
Subject: [PATCH 1/2] drm/amd/display: Return directly after a failed kzalloc()
 in dc_create()
From: Markus Elfring <Markus.Elfring@web.de>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Alvin Lee <alvin.lee2@amd.com>,
 Anthony Koo <Anthony.Koo@amd.com>, Aric Cyr <aric.cyr@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Chiawen Huang <chiawen.huang@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Yongqiang Sun <yongqiang.sun@amd.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>
References: <98e71ee7-1eb9-ada8-a438-703be03e96d1@web.de>
Message-ID: <7a9d62c6-b3f5-d185-3436-2cbc08ff1253@web.de>
Date: Sat, 19 Dec 2020 18:46:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <98e71ee7-1eb9-ada8-a438-703be03e96d1@web.de>
Content-Language: en-GB
X-Provags-ID: V03:K1:4yZu6FSOWkLJv/B/Ig5QqaREmU0Ue8I+cQk8prFvLKR/zMsx8F8
 TyQKoIjRZoZov+T9U4aKT/tGUZppL1z6pHq9RsXU85cCrCBZLvhYBZX+ldrgauB8/jbQZ1G
 F51IbBz2KBsiWWJqXOWHAtQH5zty+w94/lMltDtVXG8SokX5wQ/bHDplvLDrsZo9STqFIy6
 wxDjZTjeuiTXuch3sXpnw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:DI3E8gH0gZU=:wzc38ckn+Rhkz/gqJXLKaO
 XneTggCnHoH+xsOYLjZGjPRJNGjQ/bBciDC+0ze6HCSqLc2YPD7ZTx57Uv10mu2fBdRsFG1M3
 j3+klz3O2+0STVCUPs0EgozA9T6+xwIYz6bWupWnbRpX7+RS40Li/rYJ59DUmz5RJUSQyTz0b
 PNCehbqxV9OcYIDsedknFLtvfezGDwPRDbi3fc98zBWPcU0wCW4qHVkHQZtcJzciY2r3bJfcH
 YTK1WlgH5pl7PsKrUSlnY5xxMVKDLIWMffLypQLIrE2yMaAM78mD3g4uHHguVe6HN5OVDlkkH
 rnWOftbVdjfgLw/NXwLMNHBLA3N0D/vYwxbqgeunw+utmjBCro8iWiQV5vcZ3w1qXS0bF2b2K
 jBHnuscgwBbm5K1wXqKahu+3xdH91fyj60wuYFhq7aXTli1AYL8HgHH5Q6ORgTEHPpalpcAov
 xn/cq55QDA51JoF5oplQwOOYODlzXZKhafI52uBonhhUYuFQM9JMzh06VS9W4bVxJyPAb7QgB
 WxIdAhrWxovGhBQFN56X6SzxFSoxbtkB04o9zdAwL3uHPJmLpRjPvW2raaZYEwRkbzfY9P7bQ
 K2Tf3E2sEcMoFOkrNoec0KD9h1xwIq9eb9nu0StyxE0nSMYB6/q3L82ZrKj+7bdcZZWTHRMjP
 Pp/X6ajG9hJFsx6VrQAYKBz29JHHeCwYYIPdi+7EWpexxNa/3waO5IgGsYG+IdZOROIXRDxoh
 LfrfzULqMdtN22ZGu3wBeYLdpM7yybbyxFDIHigEUJHx4oVQJqi9/s2ZTIvYFITk9dPGZhQsb
 44S5YYDIaaWl4wuZ/nhA8HlqoxmuvRMV8f6ac50PnvCZbf7DN6cvtAhyPPB+wEiYIR3IKk0tB
 Y3pNkMh8Fa1XNibiB4Qg==
X-Mailman-Approved-At: Sun, 20 Dec 2020 11:10:15 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTWFya3VzIEVsZnJpbmcgPGVsZnJpbmdAdXNlcnMuc291cmNlZm9yZ2UubmV0PgpEYXRl
OiBTYXQsIDE5IERlYyAyMDIwIDE4OjA0OjMzICswMTAwCgoqIFJldHVybiBkaXJlY3RseSBhZnRl
ciBhIGNhbGwgb2YgdGhlIGZ1bmN0aW9uIOKAnGt6YWxsb2PigJ0gZmFpbGVkCiAgYXQgdGhlIGJl
Z2lubmluZy4KCiogRGVsZXRlIGEgbGFiZWwgd2hpY2ggYmVjYW1lIHVubmVjZXNzYXJ5IHdpdGgg
dGhpcyByZWZhY3RvcmluZy4KClNpZ25lZC1vZmYtYnk6IE1hcmt1cyBFbGZyaW5nIDxlbGZyaW5n
QHVzZXJzLnNvdXJjZWZvcmdlLm5ldD4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvY29yZS9kYy5jIHwgNiArKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2NvcmUvZGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjLmMK
aW5kZXggNzMzOWQ5ODU1ZWM4Li5lMzVmYmZjYjRkMGUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2NvcmUvZGMuYwpAQCAtOTY0LDggKzk2NCw4IEBAIHN0cnVjdCBkYyAqZGNfY3Jl
YXRlKGNvbnN0IHN0cnVjdCBkY19pbml0X2RhdGEgKmluaXRfcGFyYW1zKQogCXN0cnVjdCBkYyAq
ZGMgPSBremFsbG9jKHNpemVvZigqZGMpLCBHRlBfS0VSTkVMKTsKIAl1bnNpZ25lZCBpbnQgZnVs
bF9waXBlX2NvdW50OwoKLQlpZiAoTlVMTCA9PSBkYykKLQkJZ290byBhbGxvY19mYWlsOworCWlm
ICghZGMpCisJCXJldHVybiBOVUxMOwoKIAlpZiAoaW5pdF9wYXJhbXMtPmRjZV9lbnZpcm9ubWVu
dCA9PSBEQ0VfRU5WX1ZJUlRVQUxfSFcpIHsKIAkJaWYgKGZhbHNlID09IGRjX2NvbnN0cnVjdF9j
dHgoZGMsIGluaXRfcGFyYW1zKSkgewpAQCAtMTAwOSw4ICsxMDA5LDYgQEAgc3RydWN0IGRjICpk
Y19jcmVhdGUoY29uc3Qgc3RydWN0IGRjX2luaXRfZGF0YSAqaW5pdF9wYXJhbXMpCgogY29uc3Ry
dWN0X2ZhaWw6CiAJa2ZyZWUoZGMpOwotCi1hbGxvY19mYWlsOgogCXJldHVybiBOVUxMOwogfQoK
LS0KMi4yOS4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
