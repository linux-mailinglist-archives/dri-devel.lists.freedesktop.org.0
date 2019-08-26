Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A73809D2B9
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 17:27:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E6EB6E24E;
	Mon, 26 Aug 2019 15:27:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBF286E229
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 15:27:05 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 1C34E28BD1B;
 Mon, 26 Aug 2019 16:27:04 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 15/21] drm/bridge: Add the
 drm_bridge_chain_get_prev_bridge() helper
Date: Mon, 26 Aug 2019 17:26:43 +0200
Message-Id: <20190826152649.13820-16-boris.brezillon@collabora.com>
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
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
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

V2lsbCBiZSB1c2VmdWwgZm9yIGJyaWRnZSBkcml2ZXJzIHRoYXQgd2FudCB0byBkbyBidXMgZm9y
bWF0Cm5lZ290aWF0aW9uIHdpdGggdGhlaXIgbmVpZ2hib3Vycy4KClNpZ25lZC1vZmYtYnk6IEJv
cmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJlemlsbG9uQGNvbGxhYm9yYS5jb20+Ci0tLQpDaGFuZ2Vz
IGluIHYyOgoqIEZpeCB0aGUga2VybmVsZG9jCiogRHJvcCB0aGUgIWJyaWRnZSB8fCAhYnJpZGdl
LT5lbmNvZGVyIGNoZWNrCi0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9icmlkZ2UuYyB8IDE3ICsr
KysrKysrKysrKysrKysrCiBpbmNsdWRlL2RybS9kcm1fYnJpZGdlLmggICAgIHwgIDIgKysKIDIg
ZmlsZXMgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9kcm1fYnJpZGdlLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2JyaWRnZS5jCmluZGV4IDdm
N2UwZWE1YjA2Yy4uOWM3NGIyODVkYTlkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJt
X2JyaWRnZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fYnJpZGdlLmMKQEAgLTIzOCw2ICsy
MzgsMjMgQEAgZHJtX2JyaWRnZV9jaGFpbl9nZXRfbmV4dF9icmlkZ2Uoc3RydWN0IGRybV9icmlk
Z2UgKmJyaWRnZSkKIH0KIEVYUE9SVF9TWU1CT0woZHJtX2JyaWRnZV9jaGFpbl9nZXRfbmV4dF9i
cmlkZ2UpOwogCisvKioKKyAqIGRybV9icmlkZ2VfY2hhaW5fZ2V0X3ByZXZfYnJpZGdlKCkgLSBH
ZXQgdGhlIHByZXZpb3VzIGJyaWRnZSBpbiB0aGUgY2hhaW4KKyAqIEBicmlkZ2U6IGJyaWRnZSBv
YmplY3QKKyAqCisgKiBSRVRVUk5TOgorICogdGhlIHByZXZpb3VzIGJyaWRnZSBpbiB0aGUgY2hh
aW4sIG9yIE5VTEwgaWYgQGJyaWRnZSBpcyB0aGUgbGFzdC4KKyAqLworc3RydWN0IGRybV9icmlk
Z2UgKgorZHJtX2JyaWRnZV9jaGFpbl9nZXRfcHJldl9icmlkZ2Uoc3RydWN0IGRybV9icmlkZ2Ug
KmJyaWRnZSkKK3sKKwlpZiAobGlzdF9pc19maXJzdCgmYnJpZGdlLT5jaGFpbl9ub2RlLCAmYnJp
ZGdlLT5lbmNvZGVyLT5icmlkZ2VfY2hhaW4pKQorCQlyZXR1cm4gTlVMTDsKKworCXJldHVybiBs
aXN0X3ByZXZfZW50cnkoYnJpZGdlLCBjaGFpbl9ub2RlKTsKK30KK0VYUE9SVF9TWU1CT0woZHJt
X2JyaWRnZV9jaGFpbl9nZXRfcHJldl9icmlkZ2UpOworCiAvKioKICAqIERPQzogYnJpZGdlIGNh
bGxiYWNrcwogICoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9icmlkZ2UuaCBiL2luY2x1
ZGUvZHJtL2RybV9icmlkZ2UuaAppbmRleCA3ZmRjZTZkYzVmMjYuLjk1ZGM1OGMzYTRlOCAxMDA2
NDQKLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2JyaWRnZS5oCisrKyBiL2luY2x1ZGUvZHJtL2RybV9i
cmlkZ2UuaApAQCAtNTIxLDYgKzUyMSw4IEBAIGludCBkcm1fYnJpZGdlX2F0dGFjaChzdHJ1Y3Qg
ZHJtX2VuY29kZXIgKmVuY29kZXIsIHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UsCiAKIHN0cnVj
dCBkcm1fYnJpZGdlICoKIGRybV9icmlkZ2VfY2hhaW5fZ2V0X25leHRfYnJpZGdlKHN0cnVjdCBk
cm1fYnJpZGdlICpicmlkZ2UpOworc3RydWN0IGRybV9icmlkZ2UgKgorZHJtX2JyaWRnZV9jaGFp
bl9nZXRfcHJldl9icmlkZ2Uoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSk7CiBib29sIGRybV9i
cmlkZ2VfY2hhaW5fbW9kZV9maXh1cChzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlLAogCQkJCSBj
b25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZSwKIAkJCQkgc3RydWN0IGRybV9kaXNw
bGF5X21vZGUgKmFkanVzdGVkX21vZGUpOwotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
