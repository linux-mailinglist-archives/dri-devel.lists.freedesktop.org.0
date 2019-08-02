Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4297EF0E
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 10:21:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EEE46ED4B;
	Fri,  2 Aug 2019 08:20:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5C5AC6ECDF
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 07:40:14 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,337,1559487600"; d="scan'208";a="22931998"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie6.idc.renesas.com with ESMTP; 02 Aug 2019 16:35:12 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id 58AB740078B4;
 Fri,  2 Aug 2019 16:35:09 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH/RFC 08/12] drm: rcar-du: lvds: Fix bridge_to_rcar_lvds
Date: Fri,  2 Aug 2019 08:34:05 +0100
Message-Id: <1564731249-22671-9-git-send-email-fabrizio.castro@bp.renesas.com>
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

VXNpbmcgbmFtZSAiYnJpZGdlIiBmb3IgbWFjcm8gYnJpZGdlX3RvX3JjYXJfbHZkcyBhcmd1bWVu
dCBkb2Vzbid0Cndvcmsgd2hlbiB0aGUgcG9pbnRlciBuYW1lIHVzZWQgYnkgdGhlIGNhbGxlciBp
cyBub3QgImJyaWRnZSIuClJlbmFtZSB0aGUgYXJndW1lbnQgdG8gImJyaWRnZV9wdHIiIHRvIGFs
bG93IGZvciBhbnkgcG9pbnRlcgpuYW1lLgoKRml4ZXM6IGM2YTI3ZmE0MWZhYiAoImRybTogcmNh
ci1kdTogQ29udmVydCBMVkRTIGVuY29kZXIgY29kZSB0byBicmlkZ2UgZHJpdmVyIikKU2lnbmVk
LW9mZi1ieTogRmFicml6aW8gQ2FzdHJvIDxmYWJyaXppby5jYXN0cm9AYnAucmVuZXNhcy5jb20+
Ci0tLQogZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9sdmRzLmMgfCA0ICsrLS0KIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9sdmRzLmMgYi9kcml2ZXJzL2dwdS9kcm0vcmNh
ci1kdS9yY2FyX2x2ZHMuYwppbmRleCA5N2M1MWMyLi5lZGQ2M2Y1IDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2x2ZHMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcmNh
ci1kdS9yY2FyX2x2ZHMuYwpAQCAtNzIsOCArNzIsOCBAQCBzdHJ1Y3QgcmNhcl9sdmRzIHsKIAli
b29sIHN0cmlwZV9zd2FwX2RhdGE7CiB9OwogCi0jZGVmaW5lIGJyaWRnZV90b19yY2FyX2x2ZHMo
YnJpZGdlKSBcCi0JY29udGFpbmVyX29mKGJyaWRnZSwgc3RydWN0IHJjYXJfbHZkcywgYnJpZGdl
KQorI2RlZmluZSBicmlkZ2VfdG9fcmNhcl9sdmRzKGJyaWRnZV9wdHIpIFwKKwljb250YWluZXJf
b2YoYnJpZGdlX3B0ciwgc3RydWN0IHJjYXJfbHZkcywgYnJpZGdlKQogCiAjZGVmaW5lIGNvbm5l
Y3Rvcl90b19yY2FyX2x2ZHMoY29ubmVjdG9yKSBcCiAJY29udGFpbmVyX29mKGNvbm5lY3Rvciwg
c3RydWN0IHJjYXJfbHZkcywgY29ubmVjdG9yKQotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
