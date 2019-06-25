Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C11556A9
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 20:02:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 668F26E209;
	Tue, 25 Jun 2019 18:02:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 582F56E1BD
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 18:02:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: bbeckett) with ESMTPSA id CE79E28A3F3
From: Robert Beckett <bob.beckett@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 1/4] drm/vblank: warn on sending stale event
Date: Tue, 25 Jun 2019 18:59:12 +0100
Message-Id: <a21034afa30246f31daa16e74a0772377a4791ef.1561483965.git.bob.beckett@collabora.com>
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

V2FybiB3aGVuIGFib3V0IHRvIHNlbmQgc3RhbGUgdmJsYW5rIGluZm8gYW5kIGFkZCBhZHZpY2Ug
dG8KZG9jdW1lbnRhdGlvbiBvbiBob3cgdG8gYXZvaWQuCgpTaWduZWQtb2ZmLWJ5OiBSb2JlcnQg
QmVja2V0dCA8Ym9iLmJlY2tldHRAY29sbGFib3JhLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
ZHJtX3ZibGFuay5jIHwgMTcgKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxNyBp
bnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV92YmxhbmsuYyBi
L2RyaXZlcnMvZ3B1L2RybS9kcm1fdmJsYW5rLmMKaW5kZXggNjAzYWIxMDUxMjVkLi43ZGFiYjJi
ZGI3MzMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fdmJsYW5rLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2RybV92YmxhbmsuYwpAQCAtOTE4LDYgKzkxOCwxOSBAQCBFWFBPUlRfU1lN
Qk9MKGRybV9jcnRjX2FybV92YmxhbmtfZXZlbnQpOwogICoKICAqIFNlZSBkcm1fY3J0Y19hcm1f
dmJsYW5rX2V2ZW50KCkgZm9yIGEgaGVscGVyIHdoaWNoIGNhbiBiZSB1c2VkIGluIGNlcnRhaW4K
ICAqIHNpdHVhdGlvbiwgZXNwZWNpYWxseSB0byBzZW5kIG91dCBldmVudHMgZm9yIGF0b21pYyBj
b21taXQgb3BlcmF0aW9ucy4KKyAqCisgKiBDYXJlIHNob3VsZCBiZSB0YWtlbiB0byBhdm9pZCBz
dGFsZSB0aW1lc3RhbXBzLiBJZjoKKyAqICAgLSB5b3VyIGRyaXZlciBoYXMgdmJsYW5rIHN1cHBv
cnQgKGkuZS4gZGV2LT5udW1fY3J0Y3MgPiAwKQorICogICAtIHRoZSB2YmxhbmsgaXJxIGlzIG9m
ZiAoaS5lLiBubyBvbmUgY2FsbGVkIGRybV9jcnRjX3ZibGFua19nZXQpCisgKiAgIC0gZnJvbSB0
aGUgdmJsYW5rIGNvZGUncyBwb3YgdGhlIHBpcGUgaXMgc3RpbGwgcnVubmluZyAoaS5lLiBub3QK
KyAqICAgICBpbi1iZXR3ZWVuIGEgZHJtX2NydGNfdmJsYW5rX29mZigpL29uKCkgcGFpcikKKyAq
IElmIGFsbCBvZiB0aGVzZSBjb25kaXRpb25zIGhvbGQgdGhlbiBkcm1fY3J0Y19zZW5kX3ZibGFu
a19ldmVudCBpcworICogZ29pbmcgdG8gZ2l2ZSB5b3UgYSBnYXJiYWdlIHRpbWVzdGFtcCBhbmQg
YW5kIHNlcXVlbmNlIG51bWJlciAodGhlIGxhc3QKKyAqIHJlY29yZGVkIGJlZm9yZSB0aGUgaXJx
IHdhcyBkaXNhYmxlZCkuIElmIHlvdSBjYWxsIGRybV9jcnRjX3ZibGFua19nZXQvcHV0CisgKiBh
cm91bmQgaXQsIG9yIGFmdGVyIHZibGFua19vZmYsIHRoZW4gZWl0aGVyIG9mIHRob3NlIHdpbGwg
aGF2ZSByb2xsZWQgdGhpbmdzCisgKiBmb3J3YXJkIGZvciB5b3UuCisgKiBTbywgZHJpdmVycyBz
aG91bGQgY2FsbCBkcm1fY3J0Y192Ymxhbmtfb2ZmKCkgYmVmb3JlIHRoaXMgZnVuY3Rpb24gaW4g
dGhlaXIKKyAqIGNydGMgYXRvbWljX2Rpc2FibGUgaGFuZGxlcnMuCiAgKi8KIHZvaWQgZHJtX2Ny
dGNfc2VuZF92YmxhbmtfZXZlbnQoc3RydWN0IGRybV9jcnRjICpjcnRjLAogCQkJCXN0cnVjdCBk
cm1fcGVuZGluZ192YmxhbmtfZXZlbnQgKmUpCkBAIC05MjUsOCArOTM4LDEyIEBAIHZvaWQgZHJt
X2NydGNfc2VuZF92YmxhbmtfZXZlbnQoc3RydWN0IGRybV9jcnRjICpjcnRjLAogCXN0cnVjdCBk
cm1fZGV2aWNlICpkZXYgPSBjcnRjLT5kZXY7CiAJdTY0IHNlcTsKIAl1bnNpZ25lZCBpbnQgcGlw
ZSA9IGRybV9jcnRjX2luZGV4KGNydGMpOworCXN0cnVjdCBkcm1fdmJsYW5rX2NydGMgKnZibGFu
ayA9ICZkZXYtPnZibGFua1twaXBlXTsKIAlrdGltZV90IG5vdzsKIAorCVdBUk5fT05DRShkZXYt
Pm51bV9jcnRjcyA+IDAgJiYgIXZibGFuay0+ZW5hYmxlZCAmJiAhdmJsYW5rLT5pbm1vZGVzZXQs
CisJCSAgInNlbmRpbmcgc3RhbGUgdmJsYW5rIGluZm9cbiIpOworCiAJaWYgKGRldi0+bnVtX2Ny
dGNzID4gMCkgewogCQlzZXEgPSBkcm1fdmJsYW5rX2NvdW50X2FuZF90aW1lKGRldiwgcGlwZSwg
Jm5vdyk7CiAJfSBlbHNlIHsKLS0gCjIuMTguMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
