Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE687EF00
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 10:21:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 565706ED3F;
	Fri,  2 Aug 2019 08:19:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 64FB26ECDE
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 07:40:05 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,337,1559487600"; d="scan'208";a="22931978"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie6.idc.renesas.com with ESMTP; 02 Aug 2019 16:35:03 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id 308E94007528;
 Fri,  2 Aug 2019 16:34:59 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH/RFC 06/12] drm: rcar-du: lvds: Do not look at ports for
 identifying bridges
Date: Fri,  2 Aug 2019 08:34:03 +0100
Message-Id: <1564731249-22671-7-git-send-email-fabrizio.castro@bp.renesas.com>
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

V2UgbWF5IGJlIGNvbm5lY3RlZCB0byBhIGR1YWwgTFZEUyBkaXNwbGF5LCB0aGVyZWZvcmUgY2hl
Y2tpbmcKaWYgbm9kZSAhPSByZW1vdGVfaW5wdXQgZm9yIGlkZW50aWZ5aW5nIGJyaWRnZXMgaXMg
bm90IGdvaW5nIHRvCndvcmsgYW55bW9yZS4KV2UgY291bGQgdHJ5IHRvIG1hdGNoIHRoZSBwb3J0
cyBvbiB0aGUgcmVtb3RlIGVuZCB0byB0aGUgTFZEUwplbmNvZGVycywgaG93ZXZlciB0aGUgY29t
cGFuaW9uIExWRFMgZW5jb2RlciBpbnN0YW5jZSBkb2Vzbid0CmhvbGQgYSByZWZlcmVuY2UgdG8g
dGhlIHByaW1hcnkgTFZEUyBlbmNvZGVyIGluc3RhbmNlLgpXZSBrbm93IHdlIGNvdWxkIGJlIGNv
bm5lY3RlZCB0byBlaXRoZXIgYSBicmlkZ2UsIG9yIGEgcGFuZWwsCnRoZXJlZm9yZSBsb29rIHRo
cm91Z2ggdGhlIHJlZ2lzdGVyZWQgYnJpZGdlcyBhbmQgcGFuZWxzLCB1bnRpbAp3ZSBoYXZlIGEg
bWF0Y2guCgpTaWduZWQtb2ZmLWJ5OiBGYWJyaXppbyBDYXN0cm8gPGZhYnJpemlvLmNhc3Ryb0Bi
cC5yZW5lc2FzLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2x2ZHMuYyB8
IDI5ICsrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNl
cnRpb25zKCspLCAyNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
cmNhci1kdS9yY2FyX2x2ZHMuYyBiL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfbHZkcy5j
CmluZGV4IGMzMDZmYWIuLjJkNTRhZTUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yY2Fy
LWR1L3JjYXJfbHZkcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfbHZkcy5j
CkBAIC03MTEsMTAgKzcxMSw3IEBAIHN0YXRpYyBpbnQgcmNhcl9sdmRzX3BhcnNlX2R0X2NvbXBh
bmlvbihzdHJ1Y3QgcmNhcl9sdmRzICpsdmRzKQogc3RhdGljIGludCByY2FyX2x2ZHNfcGFyc2Vf
ZHQoc3RydWN0IHJjYXJfbHZkcyAqbHZkcykKIHsKIAlzdHJ1Y3QgZGV2aWNlX25vZGUgKmxvY2Fs
X291dHB1dCA9IE5VTEw7Ci0Jc3RydWN0IGRldmljZV9ub2RlICpyZW1vdGVfaW5wdXQgPSBOVUxM
OwogCXN0cnVjdCBkZXZpY2Vfbm9kZSAqcmVtb3RlID0gTlVMTDsKLQlzdHJ1Y3QgZGV2aWNlX25v
ZGUgKm5vZGU7Ci0JYm9vbCBpc19icmlkZ2UgPSBmYWxzZTsKIAlpbnQgcmV0ID0gMDsKIAogCWxv
Y2FsX291dHB1dCA9IG9mX2dyYXBoX2dldF9lbmRwb2ludF9ieV9yZWdzKGx2ZHMtPmRldi0+b2Zf
bm9kZSwgMSwgMCk7CkBAIC03NDIsMjcgKzczOSw4IEBAIHN0YXRpYyBpbnQgcmNhcl9sdmRzX3Bh
cnNlX2R0KHN0cnVjdCByY2FyX2x2ZHMgKmx2ZHMpCiAJCWdvdG8gZG9uZTsKIAl9CiAKLQlyZW1v
dGVfaW5wdXQgPSBvZl9ncmFwaF9nZXRfcmVtb3RlX2VuZHBvaW50KGxvY2FsX291dHB1dCk7Ci0K
LQlmb3JfZWFjaF9lbmRwb2ludF9vZl9ub2RlKHJlbW90ZSwgbm9kZSkgewotCQlpZiAobm9kZSAh
PSByZW1vdGVfaW5wdXQpIHsKLQkJCS8qCi0JCQkgKiBXZSd2ZSBmb3VuZCBvbmUgZW5kcG9pbnQg
b3RoZXIgdGhhbiB0aGUgaW5wdXQsIHRoaXMKLQkJCSAqIG11c3QgYmUgYSBicmlkZ2UuCi0JCQkg
Ki8KLQkJCWlzX2JyaWRnZSA9IHRydWU7Ci0JCQlvZl9ub2RlX3B1dChub2RlKTsKLQkJCWJyZWFr
OwotCQl9Ci0JfQotCi0JaWYgKGlzX2JyaWRnZSkgewotCQlsdmRzLT5uZXh0X2JyaWRnZSA9IG9m
X2RybV9maW5kX2JyaWRnZShyZW1vdGUpOwotCQlpZiAoIWx2ZHMtPm5leHRfYnJpZGdlKSB7Ci0J
CQlyZXQgPSAtRVBST0JFX0RFRkVSOwotCQkJZ290byBkb25lOwotCQl9Ci0KKwlsdmRzLT5uZXh0
X2JyaWRnZSA9IG9mX2RybV9maW5kX2JyaWRnZShyZW1vdGUpOworCWlmIChsdmRzLT5uZXh0X2Jy
aWRnZSkgewogCQlpZiAobHZkcy0+aW5mby0+cXVpcmtzICYgUkNBUl9MVkRTX1FVSVJLX0RVQUxf
TElOSykKIAkJCWx2ZHMtPmR1YWxfbGluayA9IGx2ZHMtPm5leHRfYnJpZGdlLT50aW1pbmdzCiAJ
CQkJCT8gbHZkcy0+bmV4dF9icmlkZ2UtPnRpbWluZ3MtPmR1YWxfbGluawpAQCAtNzcwLDcgKzc0
OCw3IEBAIHN0YXRpYyBpbnQgcmNhcl9sdmRzX3BhcnNlX2R0KHN0cnVjdCByY2FyX2x2ZHMgKmx2
ZHMpCiAJfSBlbHNlIHsKIAkJbHZkcy0+cGFuZWwgPSBvZl9kcm1fZmluZF9wYW5lbChyZW1vdGUp
OwogCQlpZiAoSVNfRVJSKGx2ZHMtPnBhbmVsKSkgewotCQkJcmV0ID0gUFRSX0VSUihsdmRzLT5w
YW5lbCk7CisJCQlyZXQgPSAtRVBST0JFX0RFRkVSOwogCQkJZ290byBkb25lOwogCQl9CiAJfQpA
QCAtNzg0LDcgKzc2Miw2IEBAIHN0YXRpYyBpbnQgcmNhcl9sdmRzX3BhcnNlX2R0KHN0cnVjdCBy
Y2FyX2x2ZHMgKmx2ZHMpCiAKIGRvbmU6CiAJb2Zfbm9kZV9wdXQobG9jYWxfb3V0cHV0KTsKLQlv
Zl9ub2RlX3B1dChyZW1vdGVfaW5wdXQpOwogCW9mX25vZGVfcHV0KHJlbW90ZSk7CiAKIAlzd2l0
Y2ggKHJldCkgewotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
