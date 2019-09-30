Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2ABC2987
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2019 00:28:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24E3E6E4F3;
	Mon, 30 Sep 2019 22:28:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1F9E6E4E8
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 22:28:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: ezequiel) with ESMTPSA id 96BCC28A81A
From: Ezequiel Garcia <ezequiel@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 5/5] RFC: drm/atomic-helper: Reapply color transformation
 after resume
Date: Mon, 30 Sep 2019 19:28:02 -0300
Message-Id: <20190930222802.32088-6-ezequiel@collabora.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190930222802.32088-1-ezequiel@collabora.com>
References: <20190930222802.32088-1-ezequiel@collabora.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Jacopo Mondi <jacopo@jmondi.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Douglas Anderson <dianders@chromium.org>,
 linux-rockchip@lists.infradead.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Sean Paul <seanpaul@chromium.org>, kernel@collabora.com,
 Ezequiel Garcia <ezequiel@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U29tZSBwbGF0Zm9ybXMgYXJlIG5vdCBhYmxlIHRvIG1haW50YWluIHRoZSBjb2xvciB0cmFuc2Zv
cm1hdGlvbgpzdGF0ZSBhZnRlciBhIHN5c3RlbSBzdXNwZW5kL3Jlc3VtZSBjeWNsZS4KClNldCB0
aGUgY29sb2dfbWdtdF9jaGFuZ2VkIGZsYWcgc28gdGhhdCBDTU0gb24gdGhlIENSVENzIGluCnRo
ZSBzdXNwZW5kIHN0YXRlIGFyZSByZWFwcGxpZWQgYWZ0ZXIgc3lzdGVtIHJlc3VtZS4KClNpZ25l
ZC1vZmYtYnk6IEV6ZXF1aWVsIEdhcmNpYSA8ZXplcXVpZWxAY29sbGFib3JhLmNvbT4KLS0tClRo
aXMgaXMgYW4gUkZDLCBhbmQgaXQncyBtb3N0bHkgYmFzZWQgb24gSmFjb3BvIE1vbmRpJ3Mgd29y
ayBodHRwczovL2xrbWwub3JnL2xrbWwvMjAxOS85LzYvNDk4LgoKQ2hhbmdlcyBmcm9tIHYyOgoq
IE5ldyBwYXRjaC4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY19oZWxwZXIuYyB8IDEy
ICsrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY19oZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fYXRvbWljX2hlbHBlci5jCmluZGV4IGU0MWRiMGYyMDJjYS4uNTE4NDg4MTI1NTc1IDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY19oZWxwZXIuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vZHJtX2F0b21pY19oZWxwZXIuYwpAQCAtMzIzNCw4ICszMjM0LDIwIEBAIGlu
dCBkcm1fYXRvbWljX2hlbHBlcl9yZXN1bWUoc3RydWN0IGRybV9kZXZpY2UgKmRldiwKIAkJCSAg
ICAgc3RydWN0IGRybV9hdG9taWNfc3RhdGUgKnN0YXRlKQogewogCXN0cnVjdCBkcm1fbW9kZXNl
dF9hY3F1aXJlX2N0eCBjdHg7CisJc3RydWN0IGRybV9jcnRjX3N0YXRlICpjcnRjX3N0YXRlOwor
CXN0cnVjdCBkcm1fY3J0YyAqY3J0YzsKKwl1bnNpZ25lZCBpbnQgaTsKIAlpbnQgZXJyOwogCisJ
Zm9yX2VhY2hfbmV3X2NydGNfaW5fc3RhdGUoc3RhdGUsIGNydGMsIGNydGNfc3RhdGUsIGkpIHsK
KwkJLyoKKwkJICogRm9yY2UgcmUtZW5hYmxlbWVudCBvZiBDTU0gYWZ0ZXIgc3lzdGVtIHJlc3Vt
ZSBpZiBhbnkKKwkJICogb2YgdGhlIERSTSBjb2xvciB0cmFuc2Zvcm1hdGlvbiBwcm9wZXJ0aWVz
IHdhcyBzZXQgaW4KKwkJICogdGhlIHN0YXRlIHNhdmVkIGF0IHN5c3RlbSBzdXNwZW5kIHRpbWUu
CisJCSAqLworCQlpZiAoY3J0Y19zdGF0ZS0+Z2FtbWFfbHV0KQorCQkJY3J0Y19zdGF0ZS0+Y29s
b3JfbWdtdF9jaGFuZ2VkID0gdHJ1ZTsKKwl9CiAJZHJtX21vZGVfY29uZmlnX3Jlc2V0KGRldik7
CiAKIAlEUk1fTU9ERVNFVF9MT0NLX0FMTF9CRUdJTihkZXYsIGN0eCwgMCwgZXJyKTsKLS0gCjIu
MjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
