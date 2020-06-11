Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9981F6595
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jun 2020 12:24:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C6146E8E9;
	Thu, 11 Jun 2020 10:24:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27C486E041
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 10:24:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: rcn)
 with ESMTPSA id 79FD32A4B73
From: =?UTF-8?q?Ricardo=20Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
To: Laurent.pinchart@ideasonboard.com
Subject: [PATCH v3 4/5] drm/bridge: tfp410: Fix setup and hold time calculation
Date: Thu, 11 Jun 2020 12:23:55 +0200
Message-Id: <20200611102356.31563-5-ricardo.canuelo@collabora.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200611102356.31563-1-ricardo.canuelo@collabora.com>
References: <20200611102356.31563-1-ricardo.canuelo@collabora.com>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, jason@lakedaemon.net, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org, tomi.valkeinen@ti.com,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBmaXhlcyBhIGJ1ZyBpbiB0aGUgY2FsY3VsYXRpb24gb2YgdGhlIHNldHVwIGFuZCBob2xk
IHRpbWVzIGJhc2VkIG9uCnRoZSBkZXNrZXcgY29uZmlndXJhdGlvbi4KClNpZ25lZC1vZmYtYnk6
IFJpY2FyZG8gQ2HDsXVlbG8gPHJpY2FyZG8uY2FudWVsb0Bjb2xsYWJvcmEuY29tPgpSZXZpZXdl
ZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktdGZwNDEwLmMgfCA0ICsrLS0KIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aS10ZnA0MTAuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlk
Z2UvdGktdGZwNDEwLmMKaW5kZXggZGZkZTgxMWYzNDExLi4yMWQ5OWI0ZWEwYzkgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktdGZwNDEwLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2JyaWRnZS90aS10ZnA0MTAuYwpAQCAtMjc4LDggKzI3OCw4IEBAIHN0YXRpYyBpbnQgdGZw
NDEwX3BhcnNlX3RpbWluZ3Moc3RydWN0IHRmcDQxMCAqZHZpLCBib29sIGkyYykKIAlpZiAoZGVz
a2V3ID4gNykKIAkJcmV0dXJuIC1FSU5WQUw7CiAKLQl0aW1pbmdzLT5zZXR1cF90aW1lX3BzID0g
bWluKDAsIDEyMDAgLSAzNTAgKiAoKHMzMilkZXNrZXcgLSA0KSk7Ci0JdGltaW5ncy0+aG9sZF90
aW1lX3BzID0gbWluKDAsIDEzMDAgKyAzNTAgKiAoKHMzMilkZXNrZXcgLSA0KSk7CisJdGltaW5n
cy0+c2V0dXBfdGltZV9wcyA9IDEyMDAgLSAzNTAgKiAoKHMzMilkZXNrZXcgLSA0KTsKKwl0aW1p
bmdzLT5ob2xkX3RpbWVfcHMgPSBtYXgoMCwgMTMwMCArIDM1MCAqICgoczMyKWRlc2tldyAtIDQp
KTsKIAogCXJldHVybiAwOwogfQotLSAKMi4xOC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
