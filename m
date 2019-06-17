Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A218E4860D
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 16:52:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8072489301;
	Mon, 17 Jun 2019 14:52:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DACA089301
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 14:52:10 +0000 (UTC)
X-Originating-IP: 90.88.23.150
Received: from localhost (aaubervilliers-681-1-81-150.w90-88.abo.wanadoo.fr
 [90.88.23.150]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id B574040022;
 Mon, 17 Jun 2019 14:52:07 +0000 (UTC)
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sean Paul <seanpaul@chromium.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v5 03/12] drm/client: Restrict the rotation check to the
 rotation itself
Date: Mon, 17 Jun 2019 16:51:30 +0200
Message-Id: <cf4de0cdef20aac6c654b7b73c2ab3e317c46803.1560783090.git-series.maxime.ripard@bootlin.com>
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

VGhlIGRybV9jbGllbnRfcm90YXRpb24gaGFzIGEgY2hlY2sgb24gdGhlIHJvdGF0aW9uIHZhbHVl
LCBidXQgdGhlCnJlZmxlY3Rpb25zIGFyZSBhbHNvIHN0b3JlZCBpbiB0aGUgc2FtZSB2YXJpYWJs
ZSwgYW5kIHRoZSBjaGVjayBkb2Vzbid0CnRha2UgdGhpcyBpbnRvIGFjY291bnQuCgpUaGVyZWZv
cmUsIGV2ZW4gdGhvdWdoIHdlIG1pZ2h0IGhhdmUgYSB2YWxpZCByb3RhdGlvbiwgaWYgd2UncmUg
YWxzbyB1c2luZwphIHJlZmxlY3Rpb24gcGFyYW1ldGVyLCB0aGUgdGVzdCB3aWxsIGZhaWwgZm9y
IG5vIHBhcnRpY3VsYXIgcmVhc29uLgoKUmV2aWV3ZWQtYnk6IE5vcmFsZiBUcsO4bm5lcyA8bm9y
YWxmQHRyb25uZXMub3JnPgpTaWduZWQtb2ZmLWJ5OiBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlw
YXJkQGJvb3RsaW4uY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fY2xpZW50X21vZGVzZXQu
YyB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9jbGllbnRfbW9kZXNldC5jIGIvZHJp
dmVycy9ncHUvZHJtL2RybV9jbGllbnRfbW9kZXNldC5jCmluZGV4IDgyNjRjM2E3MzJiMC4uYjRl
NWZiMGExN2NmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2NsaWVudF9tb2Rlc2V0
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9jbGllbnRfbW9kZXNldC5jCkBAIC04NDUsNyAr
ODQ1LDggQEAgYm9vbCBkcm1fY2xpZW50X3BhbmVsX3JvdGF0aW9uKHN0cnVjdCBkcm1fbW9kZV9z
ZXQgKm1vZGVzZXQsIHVuc2lnbmVkIGludCAqcm90YXQKIAkgKiBkZXBlbmRpbmcgb24gdGhlIGhh
cmR3YXJlIHRoaXMgbWF5IHJlcXVpcmUgdGhlIGZyYW1lYnVmZmVyCiAJICogdG8gYmUgaW4gYSBz
cGVjaWZpYyB0aWxpbmcgZm9ybWF0LgogCSAqLwotCWlmICgqcm90YXRpb24gIT0gRFJNX01PREVf
Uk9UQVRFXzE4MCB8fCAhcGxhbmUtPnJvdGF0aW9uX3Byb3BlcnR5KQorCWlmICgoKnJvdGF0aW9u
ICYgRFJNX01PREVfUk9UQVRFX01BU0spICE9IERSTV9NT0RFX1JPVEFURV8xODAgfHwKKwkgICAg
IXBsYW5lLT5yb3RhdGlvbl9wcm9wZXJ0eSkKIAkJcmV0dXJuIGZhbHNlOwogCiAJZm9yIChpID0g
MDsgaSA8IHBsYW5lLT5yb3RhdGlvbl9wcm9wZXJ0eS0+bnVtX3ZhbHVlczsgaSsrKQotLSAKZ2l0
LXNlcmllcyAwLjkuMQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
