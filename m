Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E1AE1FC6
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 17:45:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDBCC89D84;
	Wed, 23 Oct 2019 15:45:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6030C88EE9
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 15:45:26 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 5F20428F924;
 Wed, 23 Oct 2019 16:45:24 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 08/21] drm/bridge: Add the drm_for_each_bridge_in_chain()
 helper
Date: Wed, 23 Oct 2019 17:44:59 +0200
Message-Id: <20191023154512.9762-9-boris.brezillon@collabora.com>
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
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, kernel@collabora.com,
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

VG8gaXRlcmF0ZSBvdmVyIGFsbCBicmlkZ2VzIGF0dGFjaGVkIHRvIGEgc3BlY2lmaWMgZW5jb2Rl
ci4KClN1Z2dlc3RlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVh
c29uYm9hcmQuY29tPgpTaWduZWQtb2ZmLWJ5OiBCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXpp
bGxvbkBjb2xsYWJvcmEuY29tPgotLS0KQ2hhbmdlcyBpbiB2MzoKKiBOb25lCgpDaGFuZ2VzIGlu
IHYyOgoqIE5ldyBwYXRjaAotLS0KIGluY2x1ZGUvZHJtL2RybV9icmlkZ2UuaCB8IDExICsrKysr
KysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2lu
Y2x1ZGUvZHJtL2RybV9icmlkZ2UuaCBiL2luY2x1ZGUvZHJtL2RybV9icmlkZ2UuaAppbmRleCAz
YWIxNmM5NWU1OWUuLjIzOGU4NGFiNjNhMyAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2Jy
aWRnZS5oCisrKyBiL2luY2x1ZGUvZHJtL2RybV9icmlkZ2UuaApAQCAtNDQxLDYgKzQ0MSwxNyBA
QCBkcm1fYnJpZGdlX2NoYWluX2dldF9maXJzdF9icmlkZ2Uoc3RydWN0IGRybV9lbmNvZGVyICpl
bmNvZGVyKQogCQkJCQlzdHJ1Y3QgZHJtX2JyaWRnZSwgY2hhaW5fbm9kZSk7CiB9CiAKKy8qKgor
ICogZm9yX2VhY2hfYnJpZGdlX2luX2NoYWluKCkgLSBJdGVyYXRlIG92ZXIgYWxsIGJyaWRnZXMg
cHJlc2VudCBpbiBhIGNoYWluCisgKiBAZW5jb2RlcjogdGhlIGVuY29kZXIgdG8gaXRlcmF0ZSBi
cmlkZ2VzIG9uCisgKiBAYnJpZGdlOiBhIGJyaWRnZSBwb2ludGVyIHVwZGF0ZWQgdG8gcG9pbnQg
dG8gdGhlIGN1cnJlbnQgYnJpZGdlIGF0IGVhY2gKKyAqCSAgICBpdGVyYXRpb24KKyAqCisgKiBJ
dGVyYXRlIG92ZXIgYWxsIGJyaWRnZXMgcHJlc2VudCBpbiB0aGUgYnJpZGdlIGNoYWluIGF0dGFj
aGVkIHRvIEBlbmNvZGVyLgorICovCisjZGVmaW5lIGRybV9mb3JfZWFjaF9icmlkZ2VfaW5fY2hh
aW4oZW5jb2RlciwgYnJpZGdlKQkJCVwKKwlsaXN0X2Zvcl9lYWNoX2VudHJ5KGJyaWRnZSwgJihl
bmNvZGVyKS0+YnJpZGdlX2NoYWluLCBjaGFpbl9ub2RlKQorCiBib29sIGRybV9icmlkZ2VfY2hh
aW5fbW9kZV9maXh1cChzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlLAogCQkJCSBjb25zdCBzdHJ1
Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZSwKIAkJCQkgc3RydWN0IGRybV9kaXNwbGF5X21vZGUg
KmFkanVzdGVkX21vZGUpOwotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
