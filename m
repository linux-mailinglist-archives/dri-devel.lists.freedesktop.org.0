Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5865B556A3
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 20:02:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C4EE6E1C4;
	Tue, 25 Jun 2019 18:02:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 032676E1BD
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 18:02:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: bbeckett) with ESMTPSA id 776DF2606DF
From: Robert Beckett <bob.beckett@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 0/4] handle vblank when disabling ctc with interrupt
 disabled (was [PATCH v2] drm/imx: correct order of crtc disable)
Date: Tue, 25 Jun 2019 18:59:11 +0100
Message-Id: <cover.1561483965.git.bob.beckett@collabora.com>
X-Mailer: git-send-email 2.18.0
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

SGFuZGxlIHZibGFuayBldmVudCBzZW50IHRvIHNpZ25hbCBjcnRjIGRpc2FibGUgd2hpbGUgdGhl
IGJhY2tlbmQgdmJsYW5rCmludGVycnVwdCBoYXMgYWxyZWFkeSBiZWVuIGRpc2FibGVkIGJ5IHZi
bGFua19kaXNhYmxlX2ZuLgoKRml4ZXM6IGE0NzQ0Nzg2NDJkNSAoImRybS9pbXg6IGZpeCBjcnRj
IHZibGFuayBzdGF0ZSByZWdyZXNzaW9uIikKRml4ZXM6IDY4MDM2YjA4YjkxYmMgKCJkcm0vdmJs
YW5rOiBEbyBub3QgdXBkYXRlIHZibGFuayBjb3VudCBpZiBpbnRlcnJ1cHRzIGFyZSBhbHJlYWR5
IGRpc2FibGVkLiIpCkZpeGVzOiA1ZjJmOTExNTc4ZmIgKCJkcm0vaW14OiBhdG9taWMgcGhhc2Ug
MyBzdGVwIDE6IFVzZSBhdG9taWMgY29uZmlndXJhdGlvbiIpCgoKQ2hhbmdlcyBzaW5jZSB2MjoK
U3BsaXQgdXAgdGhlIHBhdGNoIGluIHRvIHNtYWxsZXIgcGllY2VzLgpBZGQgd2FybmluZyB3aGVu
IGFib3V0IHRvIHNlbmQgYm9ndXMgdmJsYW5rIGV2ZW50LgpVcGRhdGUgdmJsYW5rIHRvIGJlc3Qg
Z3Vlc3MgaW5mbyBkdXJpbmcgZHJtX3ZibGFua19kaXNhYmxlX2FuZF9zYXZlLgoKUm9iZXJ0IEJl
Y2tldHQgKDQpOgogIGRybS92Ymxhbms6IHdhcm4gb24gc2VuZGluZyBzdGFsZSBldmVudAogIGRy
bS9pbXg6IG5vdGlmeSBkcm0gY29yZSBiZWZvcmUgc2VuZGluZyBldmVudCBkdXJpbmcgY3J0YyBk
aXNhYmxlCiAgZHJtL3ZibGFuazogZXN0aW1hdGUgdmJsYW5rIHdoaWxlIGRpc2FibGluZyB2Ymxh
bmsgaWYgaW50ZXJydXB0CiAgICBkaXNhYmxlZAogIGRybS9pbXg6IG9ubHkgc2VuZCBldmVudCBv
biBjcnRjIGRpc2FibGUgaWYga2VwdCBkaXNhYmxlZAoKIGRyaXZlcnMvZ3B1L2RybS9kcm1fdmJs
YW5rLmMgICAgIHwgMzMgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0KIGRyaXZlcnMv
Z3B1L2RybS9pbXgvaXB1djMtY3J0Yy5jIHwgIDYgKysrLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDM1
IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgotLSAKMi4xOC4wCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
