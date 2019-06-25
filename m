Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36790556A5
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 20:02:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD5BF6E1D7;
	Tue, 25 Jun 2019 18:02:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4915A6E1BD
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 18:02:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: bbeckett) with ESMTPSA id DE8FC28627D
From: Robert Beckett <bob.beckett@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 4/4] drm/imx: only send event on crtc disable if kept
 disabled
Date: Tue, 25 Jun 2019 18:59:15 +0100
Message-Id: <6599f538740632c5524bab86514b8ba026798537.1561483965.git.bob.beckett@collabora.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1561483965.git.bob.beckett@collabora.com>
References: <cover.1561483965.git.bob.beckett@collabora.com>
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
Cc: Robert Beckett <bob.beckett@collabora.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 NXP Linux Team <linux-imx@nxp.com>, Sean Paul <sean@poorly.run>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGV2ZW50IHdpbGwgYmUgc2VudCBhcyBwYXJ0IG9mIHRoZSB2YmxhbmsgZW5hYmxlIGR1cmlu
ZyB0aGUgbW9kZXNldAppZiB0aGUgY3J0YyBpcyBub3QgYmVpbmcga2VwdCBkaXNhYmxlZC4KCkZp
eGVzOiA1ZjJmOTExNTc4ZmIgKCJkcm0vaW14OiBhdG9taWMgcGhhc2UgMyBzdGVwIDE6IFVzZSBh
dG9taWMgY29uZmlndXJhdGlvbiIpCgpTaWduZWQtb2ZmLWJ5OiBSb2JlcnQgQmVja2V0dCA8Ym9i
LmJlY2tldHRAY29sbGFib3JhLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaW14L2lwdXYzLWNy
dGMuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pbXgvaXB1djMtY3J0Yy5jIGIvZHJpdmVy
cy9ncHUvZHJtL2lteC9pcHV2My1jcnRjLmMKaW5kZXggZTA0ZDZlZmZmMWI1Li5jNDM2YTI4ZDUw
ZTQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pbXgvaXB1djMtY3J0Yy5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9pbXgvaXB1djMtY3J0Yy5jCkBAIC05NCw3ICs5NCw3IEBAIHN0YXRpYyB2
b2lkIGlwdV9jcnRjX2F0b21pY19kaXNhYmxlKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKIAlkcm1f
Y3J0Y192Ymxhbmtfb2ZmKGNydGMpOwogCiAJc3Bpbl9sb2NrX2lycSgmY3J0Yy0+ZGV2LT5ldmVu
dF9sb2NrKTsKLQlpZiAoY3J0Yy0+c3RhdGUtPmV2ZW50KSB7CisJaWYgKGNydGMtPnN0YXRlLT5l
dmVudCAmJiAhY3J0Yy0+c3RhdGUtPmFjdGl2ZSkgewogCQlkcm1fY3J0Y19zZW5kX3ZibGFua19l
dmVudChjcnRjLCBjcnRjLT5zdGF0ZS0+ZXZlbnQpOwogCQljcnRjLT5zdGF0ZS0+ZXZlbnQgPSBO
VUxMOwogCX0KLS0gCjIuMTguMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
