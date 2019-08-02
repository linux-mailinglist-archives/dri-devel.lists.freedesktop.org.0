Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 336897EEF2
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 10:21:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19BED6ED2D;
	Fri,  2 Aug 2019 08:19:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id AB86A6ECDC
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 07:40:10 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,337,1559487600"; d="scan'208";a="23151184"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie5.idc.renesas.com with ESMTP; 02 Aug 2019 16:35:07 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id F3F184007528;
 Fri,  2 Aug 2019 16:35:04 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH/RFC 07/12] drm: rcar-du: lvds: Add support for dual link panels
Date: Fri,  2 Aug 2019 08:34:04 +0100
Message-Id: <1564731249-22671-8-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564731249-22671-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1564731249-22671-1-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailman-Approved-At: Fri, 02 Aug 2019 08:19:03 +0000
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
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Biju Das <biju.das@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Simon Horman <horms@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SWYgdGhlIGRpc3BsYXkgY29tZXMgd2l0aCB0d28gcG9ydHMsIGFzc3VtZSBpdCBzdXBwb3J0cyBk
dWFsCmxpbmsuCgpTaWduZWQtb2ZmLWJ5OiBGYWJyaXppbyBDYXN0cm8gPGZhYnJpemlvLmNhc3Ry
b0BicC5yZW5lc2FzLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2x2ZHMu
YyB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9sdmRzLmMgYi9kcml2ZXJzL2dwdS9kcm0vcmNh
ci1kdS9yY2FyX2x2ZHMuYwppbmRleCAyZDU0YWU1Li45N2M1MWMyIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2x2ZHMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcmNh
ci1kdS9yY2FyX2x2ZHMuYwpAQCAtNzUxLDYgKzc1MSw5IEBAIHN0YXRpYyBpbnQgcmNhcl9sdmRz
X3BhcnNlX2R0KHN0cnVjdCByY2FyX2x2ZHMgKmx2ZHMpCiAJCQlyZXQgPSAtRVBST0JFX0RFRkVS
OwogCQkJZ290byBkb25lOwogCQl9CisJCWlmIChsdmRzLT5pbmZvLT5xdWlya3MgJiBSQ0FSX0xW
RFNfUVVJUktfRFVBTF9MSU5LKQorCQkJbHZkcy0+ZHVhbF9saW5rID0gb2ZfZ3JhcGhfZ2V0X2Vu
ZHBvaW50X2NvdW50KHJlbW90ZSkKKwkJCQkJPT0gMjsKIAl9CiAKIAlpZiAobHZkcy0+ZHVhbF9s
aW5rKSB7Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
