Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BFC710FFE2
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 15:15:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69F216E5F8;
	Tue,  3 Dec 2019 14:15:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68B706E5E8
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 14:15:29 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id AD9532905DE;
 Tue,  3 Dec 2019 14:15:27 +0000 (GMT)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 07/11] drm/bridge: Clarify the atomic enable/disable hooks
 semantics
Date: Tue,  3 Dec 2019 15:15:11 +0100
Message-Id: <20191203141515.3597631-8-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191203141515.3597631-1-boris.brezillon@collabora.com>
References: <20191203141515.3597631-1-boris.brezillon@collabora.com>
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

VGhlIFtwcmVfXWVuYWJsZS9bcG9zdF9dZGlzYWJsZSBob29rcyBhcmUgcGFzc2VkIHRoZSBvbGQg
YXRvbWljIHN0YXRlLgpVcGRhdGUgdGhlIGRvYyBhbmQgcmVuYW1lIHRoZSBhcmd1bWVudHMgdG8g
bWFrZSBpdCBjbGVhci4KClNpZ25lZC1vZmYtYnk6IEJvcmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJl
emlsbG9uQGNvbGxhYm9yYS5jb20+ClJldmlld2VkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVy
ZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+ClJldmlld2VkLWJ5OiBOZWlsIEFybXN0cm9u
ZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+Ci0tLQpDaGFuZ2VzIGluIHY0OgoqIERyb3AgdGhl
IGRvYyB1cGRhdGUgKExhdXJlbnQpCiogQWRkIFJicwoKQ2hhbmdlcyBpbiB2MzoKKiBOZXcgcGF0
Y2gKLS0tCiBpbmNsdWRlL2RybS9kcm1fYnJpZGdlLmggfCA4ICsrKystLS0tCiAxIGZpbGUgY2hh
bmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2luY2x1
ZGUvZHJtL2RybV9icmlkZ2UuaCBiL2luY2x1ZGUvZHJtL2RybV9icmlkZ2UuaAppbmRleCBiZmIw
Mzg1MTYzZjEuLmQ3ZDcxNDAyMzA1MCAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2JyaWRn
ZS5oCisrKyBiL2luY2x1ZGUvZHJtL2RybV9icmlkZ2UuaApAQCAtMjYzLDcgKzI2Myw3IEBAIHN0
cnVjdCBkcm1fYnJpZGdlX2Z1bmNzIHsKIAkgKiBUaGUgQGF0b21pY19wcmVfZW5hYmxlIGNhbGxi
YWNrIGlzIG9wdGlvbmFsLgogCSAqLwogCXZvaWQgKCphdG9taWNfcHJlX2VuYWJsZSkoc3RydWN0
IGRybV9icmlkZ2UgKmJyaWRnZSwKLQkJCQkgIHN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpzdGF0
ZSk7CisJCQkJICBzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSAqb2xkX3N0YXRlKTsKIAogCS8qKgog
CSAqIEBhdG9taWNfZW5hYmxlOgpAQCAtMjg4LDcgKzI4OCw3IEBAIHN0cnVjdCBkcm1fYnJpZGdl
X2Z1bmNzIHsKIAkgKiBUaGUgQGF0b21pY19lbmFibGUgY2FsbGJhY2sgaXMgb3B0aW9uYWwuCiAJ
ICovCiAJdm9pZCAoKmF0b21pY19lbmFibGUpKHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UsCi0J
CQkgICAgICBzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSAqc3RhdGUpOworCQkJICAgICAgc3RydWN0
IGRybV9hdG9taWNfc3RhdGUgKm9sZF9zdGF0ZSk7CiAJLyoqCiAJICogQGF0b21pY19kaXNhYmxl
OgogCSAqCkBAIC0zMTEsNyArMzExLDcgQEAgc3RydWN0IGRybV9icmlkZ2VfZnVuY3MgewogCSAq
IFRoZSBAYXRvbWljX2Rpc2FibGUgY2FsbGJhY2sgaXMgb3B0aW9uYWwuCiAJICovCiAJdm9pZCAo
KmF0b21pY19kaXNhYmxlKShzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlLAotCQkJICAgICAgIHN0
cnVjdCBkcm1fYXRvbWljX3N0YXRlICpzdGF0ZSk7CisJCQkgICAgICAgc3RydWN0IGRybV9hdG9t
aWNfc3RhdGUgKm9sZF9zdGF0ZSk7CiAKIAkvKioKIAkgKiBAYXRvbWljX3Bvc3RfZGlzYWJsZToK
QEAgLTMzNyw3ICszMzcsNyBAQCBzdHJ1Y3QgZHJtX2JyaWRnZV9mdW5jcyB7CiAJICogVGhlIEBh
dG9taWNfcG9zdF9kaXNhYmxlIGNhbGxiYWNrIGlzIG9wdGlvbmFsLgogCSAqLwogCXZvaWQgKCph
dG9taWNfcG9zdF9kaXNhYmxlKShzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlLAotCQkJCSAgICBz
dHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSAqc3RhdGUpOworCQkJCSAgICBzdHJ1Y3QgZHJtX2F0b21p
Y19zdGF0ZSAqb2xkX3N0YXRlKTsKIH07CiAKIC8qKgotLSAKMi4yMy4wCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
