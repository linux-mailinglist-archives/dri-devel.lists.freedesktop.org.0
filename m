Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EBB93356A
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2019 18:56:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BA45892A1;
	Mon,  3 Jun 2019 16:56:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36AE489024;
 Mon,  3 Jun 2019 16:56:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: koike) with ESMTPSA id 82DD527FDB2
From: Helen Koike <helen.koike@collabora.com>
To: dri-devel@lists.freedesktop.org,
	nicholas.kazlauskas@amd.com
Subject: [PATCH v4 0/5] drm: Fix fb changes for async updates
Date: Mon,  3 Jun 2019 13:56:05 -0300
Message-Id: <20190603165610.24614-1-helen.koike@collabora.com>
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
Cc: Sean Paul <seanpaul@google.com>, David Airlie <airlied@linux.ie>,
 daniel.vetter@ffwll.ch, linux-kernel@vger.kernel.org,
 Mamta Shukla <mamtashukla555@gmail.com>, kernel@collabora.com,
 Anthony Koo <Anthony.Koo@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 David Francis <David.Francis@amd.com>, amd-gfx@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, Leo Li <sunpeng.li@amd.com>,
 linux-arm-msm@vger.kernel.org, Helen Koike <helen.koike@collabora.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org,
 =?UTF-8?q?St=C3=A9phane=20Marchesin?= <marcheu@google.com>,
 Tomasz Figa <tfiga@chromium.org>, boris.brezillon@collabora.com,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8sCgpJJ20gcmUtc2VuZGluZyB0aGlzIHNlcmllcyB3aXRoIHRoZSBhY2tlZCBieSBpbiB0
aGUgbXNtIHBhdGNoIGFuZAp1cGRhdGluZyB0aGUgZG9jcyBpbiB0aGUgbGFzdCBwYXRjaCwgdGhl
IHJlc3QgaXMgdGhlIHNhbWUuCgp2MyBsaW5rOiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3Jn
L3Byb2plY3QvZHJpLWRldmVsL2xpc3QvP3Nlcmllcz05MTM1MwoKVGhhbmtzIQpIZWxlbgoKQ2hh
bmdlcyBpbiB2NDoKLSBhZGQgYWNrZWQgYnkgdGFnCi0gdXBkYXRlIGRvY3MgaW4gYXRvbWljX2Fz
eW5jX3VwZGF0ZSBjYWxsYmFjawoKQ2hhbmdlcyBpbiB2MzoKLSB1c2Ugc3dhcCgpIHRvIHN3YXAg
b2xkIGFuZCBuZXcgZnJhbWVidWZmZXJzIGluIGFzeW5jX3VwZGF0ZQotIGdldCB0aGUgcmVmZXJl
bmNlIHRvIG9sZF9mYiBhbmQgc2V0IHRoZSB3b3JrZXIgYWZ0ZXIgdm9wX3BsYW5lX2F0b21pY191
cGRhdGUoKQotIGFkZCBhIEZJWE1FIHRhZyBmb3Igd2hlbiB3ZSBoYXZlIG11bHRpcGxlIGZicyB0
byBiZSByZWxlYXNlZCB3aGVuCnZibGFuayBoYXBwZW5zLgotIHVwZGF0ZSBjb21taXQgbWVzc2Fn
ZQotIEFkZCBSZXZpZXdlZC1ieSB0YWdzCi0gQWRkIFRPRE8gaW4gZHJtX2F0b21pY19oZWxwZXJf
YXN5bmNfY29tbWl0KCkKCkNoYW5nZXMgaW4gdjI6Ci0gYWRkZWQgcmV2aWV3ZWQtYnkgdGFnCi0g
dXBkYXRlIENDIHN0YWJsZSBhbmQgRml4ZXMgdGFnCi0gQWRkZWQgcmV2aWV3ZWQtYnkgdGFnCi0g
dXBkYXRlZCBDQyBzdGFibGUgYW5kIEZpeGVzIHRhZwotIENoYW5nZSB0aGUgb3JkZXIgb2YgdGhl
IHBhdGNoIGluIHRoZSBzZXJpZXMsIGFkZCB0aGlzIGFzIHRoZSBsYXN0IG9uZS4KLSBBZGQgZG9j
dW1lbnRhdGlvbgotIHMvYmFsbGFuY2VkL2JhbGFuY2VkCgpIZWxlbiBLb2lrZSAoNSk6CiAgZHJt
L3JvY2tjaGlwOiBmaXggZmIgcmVmZXJlbmNlcyBpbiBhc3luYyB1cGRhdGUKICBkcm0vYW1kOiBm
aXggZmIgcmVmZXJlbmNlcyBpbiBhc3luYyB1cGRhdGUKICBkcm0vbXNtOiBmaXggZmIgcmVmZXJl
bmNlcyBpbiBhc3luYyB1cGRhdGUKICBkcm0vdmM0OiBmaXggZmIgcmVmZXJlbmNlcyBpbiBhc3lu
YyB1cGRhdGUKICBkcm06IGRvbid0IGJsb2NrIGZiIGNoYW5nZXMgZm9yIGFzeW5jIHBsYW5lIHVw
ZGF0ZXMKCiAuLi4vZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgfCAg
MyArLQogZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWNfaGVscGVyLmMgICAgICAgICAgIHwgMjIg
KysrKy0tLS0KIGRyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9tZHA1L21kcDVfcGxhbmUuYyAgICB8
ICA0ICsrCiBkcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcC5jICAgfCA1
MSArKysrKysrKysrLS0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9wbGFuZS5jICAg
ICAgICAgICAgICAgfCAgMiArLQogaW5jbHVkZS9kcm0vZHJtX21vZGVzZXRfaGVscGVyX3Z0YWJs
ZXMuaCAgICAgIHwgIDggKysrCiA2IGZpbGVzIGNoYW5nZWQsIDUyIGluc2VydGlvbnMoKyksIDM4
IGRlbGV0aW9ucygtKQoKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
