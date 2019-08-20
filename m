Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF2695341
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 03:19:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 263286E4F3;
	Tue, 20 Aug 2019 01:19:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80F5D6E581
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 01:18:15 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3D9D6AF9;
 Tue, 20 Aug 2019 03:18:07 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 49/50] drm/omap: dss: Inline the omapdss_display_get()
 function
Date: Tue, 20 Aug 2019 04:17:20 +0300
Message-Id: <20190820011721.30136-50-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190820011721.30136-1-laurent.pinchart@ideasonboard.com>
References: <20190820011721.30136-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1566263887;
 bh=4HQYdVjMFjt8WVyD6ATu2is4XmBopKtfXdbN4n/mhvQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SUz+Z1CzHiqBEPg7B+h3xYIwsZqdQdJMfg9R82iquQqQz01u3uijH69ZEVu4KWnMi
 pgyJEtLPz8bAkKKgZytjmUjGMouQqeJV5pFMI1xhpA1miqCYeK5qXuOt4l4SoXtj02
 SUMs86erKyZJRKxD8QVbMcUZ/RwN5bllxE47ZwVw=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Sean Paul <sean@poorly.run>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW5saW5lIHRoZSBvbWFwZHNzX2Rpc3BsYXlfZ2V0KCkgaW4gaXRzIG9ubHkgY2FsbGVyIHRvIHNp
bXBsaWZ5IHRoZQpjb2RlLgoKU2lnbmVkLW9mZi1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVu
dC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9vbWFwZHJt
L2Rzcy9kaXNwbGF5LmMgfCA5IC0tLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNz
L29tYXBkc3MuaCB8IDEgLQogZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9kcnYuYyAgICB8
IDcgKysrKy0tLQogMyBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9kaXNwbGF5LmMg
Yi9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3MvZGlzcGxheS5jCmluZGV4IDhhM2Y2MWY1ODI1
Zi4uM2I4MjE1OGIxYmZkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3Mv
ZGlzcGxheS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9kaXNwbGF5LmMKQEAg
LTQwLDE1ICs0MCw2IEBAIHZvaWQgb21hcGRzc19kaXNwbGF5X2luaXQoc3RydWN0IG9tYXBfZHNz
X2RldmljZSAqZHNzZGV2KQogfQogRVhQT1JUX1NZTUJPTF9HUEwob21hcGRzc19kaXNwbGF5X2lu
aXQpOwogCi1zdHJ1Y3Qgb21hcF9kc3NfZGV2aWNlICpvbWFwZHNzX2Rpc3BsYXlfZ2V0KHN0cnVj
dCBvbWFwX2Rzc19kZXZpY2UgKm91dHB1dCkKLXsKLQl3aGlsZSAob3V0cHV0LT5uZXh0KQotCQlv
dXRwdXQgPSBvdXRwdXQtPm5leHQ7Ci0KLQlyZXR1cm4gb21hcGRzc19kZXZpY2VfZ2V0KG91dHB1
dCk7Ci19Ci1FWFBPUlRfU1lNQk9MX0dQTChvbWFwZHNzX2Rpc3BsYXlfZ2V0KTsKLQogaW50IG9t
YXBkc3NfZGlzcGxheV9nZXRfbW9kZXMoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvciwK
IAkJCSAgICAgIGNvbnN0IHN0cnVjdCB2aWRlb21vZGUgKnZtKQogewpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL29tYXBkc3MuaCBiL2RyaXZlcnMvZ3B1L2RybS9vbWFw
ZHJtL2Rzcy9vbWFwZHNzLmgKaW5kZXggZTc0MThhNzRmNzIyLi5hOGQ5ZmM3MTU1MTUgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9vbWFwZHNzLmgKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL29tYXBkcm0vZHNzL29tYXBkc3MuaApAQCAtNDMyLDcgKzQzMiw2IEBAIHN0YXRp
YyBpbmxpbmUgYm9vbCBvbWFwZHNzX2lzX2luaXRpYWxpemVkKHZvaWQpCiB9CiAKIHZvaWQgb21h
cGRzc19kaXNwbGF5X2luaXQoc3RydWN0IG9tYXBfZHNzX2RldmljZSAqZHNzZGV2KTsKLXN0cnVj
dCBvbWFwX2Rzc19kZXZpY2UgKm9tYXBkc3NfZGlzcGxheV9nZXQoc3RydWN0IG9tYXBfZHNzX2Rl
dmljZSAqb3V0cHV0KTsKIGludCBvbWFwZHNzX2Rpc3BsYXlfZ2V0X21vZGVzKHN0cnVjdCBkcm1f
Y29ubmVjdG9yICpjb25uZWN0b3IsCiAJCQkgICAgICBjb25zdCBzdHJ1Y3QgdmlkZW9tb2RlICp2
bSk7CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfZHJ2LmMgYi9k
cml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2Rydi5jCmluZGV4IGY0YTc1NzJlNDczNy4uZmY4
MmZhZjU5NGEzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2Rydi5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfZHJ2LmMKQEAgLTIwNiwxMSArMjA2
LDEyIEBAIHN0YXRpYyBpbnQgb21hcF9kaXNwbGF5X2lkKHN0cnVjdCBvbWFwX2Rzc19kZXZpY2Ug
Km91dHB1dCkKIAlzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGUgPSBOVUxMOwogCiAJaWYgKG91dHB1
dC0+bmV4dCkgewotCQlzdHJ1Y3Qgb21hcF9kc3NfZGV2aWNlICpkaXNwbGF5OworCQlzdHJ1Y3Qg
b21hcF9kc3NfZGV2aWNlICpkaXNwbGF5ID0gb3V0cHV0OworCisJCXdoaWxlIChkaXNwbGF5LT5u
ZXh0KQorCQkJZGlzcGxheSA9IGRpc3BsYXktPm5leHQ7CiAKLQkJZGlzcGxheSA9IG9tYXBkc3Nf
ZGlzcGxheV9nZXQob3V0cHV0KTsKIAkJbm9kZSA9IGRpc3BsYXktPmRldi0+b2Zfbm9kZTsKLQkJ
b21hcGRzc19kZXZpY2VfcHV0KGRpc3BsYXkpOwogCX0gZWxzZSBpZiAob3V0cHV0LT5icmlkZ2Up
IHsKIAkJc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSA9IG91dHB1dC0+YnJpZGdlOwogCi0tIApS
ZWdhcmRzLAoKTGF1cmVudCBQaW5jaGFydAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
