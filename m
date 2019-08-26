Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA4A9D2B3
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 17:27:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 460416E243;
	Mon, 26 Aug 2019 15:27:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE1686E233
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 15:27:02 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 2743A28BCF6;
 Mon, 26 Aug 2019 16:27:01 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 11/21] drm/bridge: Add the drm_for_each_bridge_in_chain()
 helper
Date: Mon, 26 Aug 2019 17:26:39 +0200
Message-Id: <20190826152649.13820-12-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190826152649.13820-1-boris.brezillon@collabora.com>
References: <20190826152649.13820-1-boris.brezillon@collabora.com>
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
Cc: Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>, Chris Healy <Chris.Healy@zii.aero>,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VG8gaXRlcmF0ZSBvdmVyIGFsbCBicmlkZ2VzIGF0dGFjaGVkIHRvIGEgc3BlY2lmaWMgZW5jb2Rl
ci4KClN1Z2dlc3RlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVh
c29uYm9hcmQuY29tPgpTaWduZWQtb2ZmLWJ5OiBCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXpp
bGxvbkBjb2xsYWJvcmEuY29tPgotLS0KQ2hhbmdlcyBpbiB2MjoKKiBOZXcgcGF0Y2gKLS0tCiBp
bmNsdWRlL2RybS9kcm1fYnJpZGdlLmggfCAxMSArKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQs
IDExIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fYnJpZGdlLmgg
Yi9pbmNsdWRlL2RybS9kcm1fYnJpZGdlLmgKaW5kZXggOGFmOTJmMGE5NTQxLi5jZjA1YjMwZjI5
NjcgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL2RybV9icmlkZ2UuaAorKysgYi9pbmNsdWRlL2Ry
bS9kcm1fYnJpZGdlLmgKQEAgLTQwOSw2ICs0MDksMTcgQEAgc3RydWN0IGRybV9icmlkZ2UgKm9m
X2RybV9maW5kX2JyaWRnZShzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wKTsKIGludCBkcm1fYnJpZGdl
X2F0dGFjaChzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIsIHN0cnVjdCBkcm1fYnJpZGdlICpi
cmlkZ2UsCiAJCSAgICAgIHN0cnVjdCBkcm1fYnJpZGdlICpwcmV2aW91cyk7CiAKKy8qKgorICog
Zm9yX2VhY2hfYnJpZGdlX2luX2NoYWluKCkgLSBJdGVyYXRlIG92ZXIgYWxsIGJyaWRnZXMgcHJl
c2VudCBpbiBhIGNoYWluCisgKiBAZW5jb2RlcjogdGhlIGVuY29kZXIgdG8gaXRlcmF0ZSBicmlk
Z2VzIG9uCisgKiBAYnJpZGdlOiBhIGJyaWRnZSBwb2ludGVyIHVwZGF0ZWQgdG8gcG9pbnQgdG8g
dGhlIGN1cnJlbnQgYnJpZGdlIGF0IGVhY2gKKyAqCSAgICBpdGVyYXRpb24KKyAqCisgKiBJdGVy
YXRlIG92ZXIgYWxsIGJyaWRnZXMgcHJlc2VudCBpbiB0aGUgYnJpZGdlIGNoYWluIGF0dGFjaGVk
IHRvIEBlbmNvZGVyLgorICovCisjZGVmaW5lIGRybV9mb3JfZWFjaF9icmlkZ2VfaW5fY2hhaW4o
ZW5jb2RlciwgYnJpZGdlKQkJCVwKKwlsaXN0X2Zvcl9lYWNoX2VudHJ5KGJyaWRnZSwgJihlbmNv
ZGVyKS0+YnJpZGdlX2NoYWluLCBjaGFpbl9ub2RlKQorCiBzdHJ1Y3QgZHJtX2JyaWRnZSAqCiBk
cm1fYnJpZGdlX2NoYWluX2dldF9uZXh0X2JyaWRnZShzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdl
KTsKIGJvb2wgZHJtX2JyaWRnZV9jaGFpbl9tb2RlX2ZpeHVwKHN0cnVjdCBkcm1fYnJpZGdlICpi
cmlkZ2UsCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
