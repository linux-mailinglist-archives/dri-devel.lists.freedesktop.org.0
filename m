Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DCB3E1FD7
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 17:46:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6E246EB29;
	Wed, 23 Oct 2019 15:46:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76F558959D
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 15:45:30 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id B6D2328F962;
 Wed, 23 Oct 2019 16:45:28 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 13/21] drm/bridge: Add the
 drm_bridge_chain_get_prev_bridge() helper
Date: Wed, 23 Oct 2019 17:45:04 +0200
Message-Id: <20191023154512.9762-14-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191023154512.9762-1-boris.brezillon@collabora.com>
References: <20191023154512.9762-1-boris.brezillon@collabora.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>,
 Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Chris Healy <cphealy@gmail.com>,
 devicetree@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 Rob Herring <robh+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2lsbCBiZSB1c2VmdWwgZm9yIGJyaWRnZSBkcml2ZXJzIHRoYXQgd2FudCB0byBkbyBidXMgZm9y
bWF0Cm5lZ290aWF0aW9uIHdpdGggdGhlaXIgbmVpZ2hib3Vycy4KClNpZ25lZC1vZmYtYnk6IEJv
cmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJlemlsbG9uQGNvbGxhYm9yYS5jb20+Ci0tLQpDaGFuZ2Vz
IGluIHYzOgoqIElubGluZSBkcm1fYnJpZGdlX2NoYWluX2dldF9wcmV2X2JyaWRnZSgpCiogRml4
IHRoZSBkb2MKCkNoYW5nZXMgaW4gdjI6CiogRml4IHRoZSBrZXJuZWxkb2MKKiBEcm9wIHRoZSAh
YnJpZGdlIHx8ICFicmlkZ2UtPmVuY29kZXIgY2hlY2sKLS0tCiBpbmNsdWRlL2RybS9kcm1fYnJp
ZGdlLmggfCAxNiArKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9u
cygrKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9icmlkZ2UuaCBiL2luY2x1ZGUvZHJt
L2RybV9icmlkZ2UuaAppbmRleCAyYmViMWVmOWE3MzMuLjNmYjUxODQ5NDY0MCAxMDA2NDQKLS0t
IGEvaW5jbHVkZS9kcm0vZHJtX2JyaWRnZS5oCisrKyBiL2luY2x1ZGUvZHJtL2RybV9icmlkZ2Uu
aApAQCAtNTI2LDYgKzUyNiwyMiBAQCBkcm1fYnJpZGdlX2NoYWluX2dldF9uZXh0X2JyaWRnZShz
dHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlKQogCXJldHVybiBsaXN0X25leHRfZW50cnkoYnJpZGdl
LCBjaGFpbl9ub2RlKTsKIH0KIAorLyoqCisgKiBkcm1fYnJpZGdlX2NoYWluX2dldF9wcmV2X2Jy
aWRnZSgpIC0gR2V0IHRoZSBwcmV2aW91cyBicmlkZ2UgaW4gdGhlIGNoYWluCisgKiBAYnJpZGdl
OiBicmlkZ2Ugb2JqZWN0CisgKgorICogUkVUVVJOUzoKKyAqIHRoZSBwcmV2aW91cyBicmlkZ2Ug
aW4gdGhlIGNoYWluLCBvciBOVUxMIGlmIEBicmlkZ2UgaXMgdGhlIGZpcnN0LgorICovCitzdGF0
aWMgaW5saW5lIHN0cnVjdCBkcm1fYnJpZGdlICoKK2RybV9icmlkZ2VfY2hhaW5fZ2V0X3ByZXZf
YnJpZGdlKHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UpCit7CisJaWYgKGxpc3RfaXNfZmlyc3Qo
JmJyaWRnZS0+Y2hhaW5fbm9kZSwgJmJyaWRnZS0+ZW5jb2Rlci0+YnJpZGdlX2NoYWluKSkKKwkJ
cmV0dXJuIE5VTEw7CisKKwlyZXR1cm4gbGlzdF9wcmV2X2VudHJ5KGJyaWRnZSwgY2hhaW5fbm9k
ZSk7Cit9CisKIC8qKgogICogZHJtX2JyaWRnZV9jaGFpbl9nZXRfZmlyc3RfYnJpZGdlKCkgLSBH
ZXQgdGhlIGZpcnN0IGJyaWRnZSBpbiB0aGUgY2hhaW4KICAqIEBlbmNvZGVyOiBlbmNvZGVyIG9i
amVjdAotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
