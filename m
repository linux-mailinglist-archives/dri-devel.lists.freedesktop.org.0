Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 047EF48617
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 16:52:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6E0E8931F;
	Mon, 17 Jun 2019 14:52:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC6CC8931F
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 14:52:25 +0000 (UTC)
Received: from localhost (aaubervilliers-681-1-81-150.w90-88.abo.wanadoo.fr
 [90.88.23.150]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id A7983200012;
 Mon, 17 Jun 2019 14:52:22 +0000 (UTC)
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sean Paul <seanpaul@chromium.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v5 08/12] drm/connector: Introduce a TV margins structure
Date: Mon, 17 Jun 2019 16:51:35 +0200
Message-Id: <38b773b03f15ec7a135cdf8f7db669e5ada20cf2.1560783090.git-series.maxime.ripard@bootlin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.5190d070d1439d762d7ab273f4ae2573087fee20.1560783090.git-series.maxime.ripard@bootlin.com>
References: <cover.5190d070d1439d762d7ab273f4ae2573087fee20.1560783090.git-series.maxime.ripard@bootlin.com>
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
Cc: eben@raspberrypi.org, dri-devel@lists.freedesktop.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIFRWIG1hcmdpbnMgaGFzIGJlZW4gZGVmaW5lZCBhcyBhIHN0cnVjdHVyZSBpbnNpZGUgdGhl
CmRybV9jb25uZWN0b3Jfc3RhdGUgc3RydWN0dXJlIHNvIGZhci4gSG93ZXZlciwgd2Ugd2lsbCBu
ZWVkIGl0IGluIG90aGVyCnN0cnVjdHVyZXMgYXMgd2VsbCwgc28gbGV0J3MgbW92ZSB0aGF0IHN0
cnVjdHVyZSBkZWZpbml0aW9uIHNvIHRoYXQgaXQgY2FuCmJlIHJldXNlZC4KClJldmlld2VkLWJ5
OiBOb3JhbGYgVHLDuG5uZXMgPG5vcmFsZkB0cm9ubmVzLm9yZz4KU2lnbmVkLW9mZi1ieTogTWF4
aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBib290bGluLmNvbT4KLS0tCiBpbmNsdWRlL2RybS9k
cm1fY29ubmVjdG9yLmggfCA0MSArKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDMwIGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9jb25uZWN0b3IuaCBiL2luY2x1ZGUvZHJtL2RybV9j
b25uZWN0b3IuaAppbmRleCA4ZWViZTA0MzJjNzMuLmIyMmUzMTUwZTMzZCAxMDA2NDQKLS0tIGEv
aW5jbHVkZS9kcm0vZHJtX2Nvbm5lY3Rvci5oCisrKyBiL2luY2x1ZGUvZHJtL2RybV9jb25uZWN0
b3IuaApAQCAtNDY0LDEzICs0NjQsMzcgQEAgaW50IGRybV9kaXNwbGF5X2luZm9fc2V0X2J1c19m
b3JtYXRzKHN0cnVjdCBkcm1fZGlzcGxheV9pbmZvICppbmZvLAogCQkJCSAgICAgdW5zaWduZWQg
aW50IG51bV9mb3JtYXRzKTsKIAogLyoqCisgKiBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl90dl9tYXJn
aW5zIC0gVFYgY29ubmVjdG9yIHJlbGF0ZWQgbWFyZ2lucworICoKKyAqIERlc2NyaWJlcyB0aGUg
bWFyZ2lucyBpbiBwaXhlbHMgdG8gcHV0IGFyb3VuZCB0aGUgaW1hZ2Ugb24gVFYKKyAqIGNvbm5l
Y3RvcnMgdG8gZGVhbCB3aXRoIG92ZXJzY2FuLgorICovCitzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl90
dl9tYXJnaW5zIHsKKwkvKioKKwkgKiBAYm90dG9tOiBCb3R0b20gbWFyZ2luIGluIHBpeGVscy4K
KwkgKi8KKwl1bnNpZ25lZCBpbnQgYm90dG9tOworCisJLyoqCisJICogQGxlZnQ6IExlZnQgbWFy
Z2luIGluIHBpeGVscy4KKwkgKi8KKwl1bnNpZ25lZCBpbnQgbGVmdDsKKworCS8qKgorCSAqIEBy
aWdodDogUmlnaHQgbWFyZ2luIGluIHBpeGVscy4KKwkgKi8KKwl1bnNpZ25lZCBpbnQgcmlnaHQ7
CisKKwkvKioKKwkgKiBAdG9wOiBUb3AgbWFyZ2luIGluIHBpeGVscy4KKwkgKi8KKwl1bnNpZ25l
ZCBpbnQgdG9wOworfTsKKworLyoqCiAgKiBzdHJ1Y3QgZHJtX3R2X2Nvbm5lY3Rvcl9zdGF0ZSAt
IFRWIGNvbm5lY3RvciByZWxhdGVkIHN0YXRlcwogICogQHN1YmNvbm5lY3Rvcjogc2VsZWN0ZWQg
c3ViY29ubmVjdG9yCi0gKiBAbWFyZ2luczogbWFyZ2lucyAoYWxsIG1hcmdpbnMgYXJlIGV4cHJl
c3NlZCBpbiBwaXhlbHMpCi0gKiBAbWFyZ2lucy5sZWZ0OiBsZWZ0IG1hcmdpbgotICogQG1hcmdp
bnMucmlnaHQ6IHJpZ2h0IG1hcmdpbgotICogQG1hcmdpbnMudG9wOiB0b3AgbWFyZ2luCi0gKiBA
bWFyZ2lucy5ib3R0b206IGJvdHRvbSBtYXJnaW4KKyAqIEBtYXJnaW5zOiBUViBtYXJnaW5zCiAg
KiBAbW9kZTogVFYgbW9kZQogICogQGJyaWdodG5lc3M6IGJyaWdodG5lc3MgaW4gcGVyY2VudAog
ICogQGNvbnRyYXN0OiBjb250cmFzdCBpbiBwZXJjZW50CkBAIC00ODEsMTIgKzUwNSw3IEBAIGlu
dCBkcm1fZGlzcGxheV9pbmZvX3NldF9idXNfZm9ybWF0cyhzdHJ1Y3QgZHJtX2Rpc3BsYXlfaW5m
byAqaW5mbywKICAqLwogc3RydWN0IGRybV90dl9jb25uZWN0b3Jfc3RhdGUgewogCWVudW0gZHJt
X21vZGVfc3ViY29ubmVjdG9yIHN1YmNvbm5lY3RvcjsKLQlzdHJ1Y3QgewotCQl1bnNpZ25lZCBp
bnQgbGVmdDsKLQkJdW5zaWduZWQgaW50IHJpZ2h0OwotCQl1bnNpZ25lZCBpbnQgdG9wOwotCQl1
bnNpZ25lZCBpbnQgYm90dG9tOwotCX0gbWFyZ2luczsKKwlzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl90
dl9tYXJnaW5zIG1hcmdpbnM7CiAJdW5zaWduZWQgaW50IG1vZGU7CiAJdW5zaWduZWQgaW50IGJy
aWdodG5lc3M7CiAJdW5zaWduZWQgaW50IGNvbnRyYXN0OwotLSAKZ2l0LXNlcmllcyAwLjkuMQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
