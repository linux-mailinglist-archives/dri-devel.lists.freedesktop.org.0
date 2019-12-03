Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9C610FFDD
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 15:15:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A5866E5F2;
	Tue,  3 Dec 2019 14:15:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B69696E5E7
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 14:15:28 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 0840B290595;
 Tue,  3 Dec 2019 14:15:27 +0000 (GMT)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 06/11] drm/bridge: Add the drm_bridge_get_prev_bridge()
 helper
Date: Tue,  3 Dec 2019 15:15:10 +0100
Message-Id: <20191203141515.3597631-7-boris.brezillon@collabora.com>
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

VGhlIGRybV9icmlkZ2VfZ2V0X3ByZXZfYnJpZGdlKCkgaGVscGVyIHdpbGwgYmUgdXNlZnVsIGZv
ciBicmlkZ2UKZHJpdmVycyB0aGF0IHdhbnQgdG8gZG8gYnVzIGZvcm1hdCBuZWdvdGlhdGlvbiB3
aXRoIHRoZWlyIG5laWdoYm91cnMuCgpTaWduZWQtb2ZmLWJ5OiBCb3JpcyBCcmV6aWxsb24gPGJv
cmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPgpSZXZpZXdlZC1ieTogTGF1cmVudCBQaW5jaGFy
dCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgpSZXZpZXdlZC1ieTogTmVpbCBB
cm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPgotLS0KQ2hhbmdlcyBpbiB2NDoKKiBD
aGFuZ2UgdGhlIGhlbHBlciBuYW1lIHRvIGJlIGNvbnNpc3RlbnQgd2l0aCB0aGUgX25leHRfYnJp
ZGdlKCkgaGVscGVyCiogVXBkYXRlIHRoZSBjb21taXQgbWVzc2FnZQoqIEFkZCBSYnMKCkNoYW5n
ZXMgaW4gdjM6CiogSW5saW5lIGRybV9icmlkZ2VfY2hhaW5fZ2V0X3ByZXZfYnJpZGdlKCkKKiBG
aXggdGhlIGRvYwoKQ2hhbmdlcyBpbiB2MjoKKiBGaXggdGhlIGtlcm5lbGRvYwoqIERyb3AgdGhl
ICFicmlkZ2UgfHwgIWJyaWRnZS0+ZW5jb2RlciBjaGVjawotLS0KIGluY2x1ZGUvZHJtL2RybV9i
cmlkZ2UuaCB8IDE2ICsrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2JyaWRnZS5oIGIvaW5jbHVkZS9k
cm0vZHJtX2JyaWRnZS5oCmluZGV4IDFlYjg1NDAyNWEyMC4uYmZiMDM4NTE2M2YxIDEwMDY0NAot
LS0gYS9pbmNsdWRlL2RybS9kcm1fYnJpZGdlLmgKKysrIGIvaW5jbHVkZS9kcm0vZHJtX2JyaWRn
ZS5oCkBAIC00MjYsNiArNDI2LDIyIEBAIGRybV9icmlkZ2VfZ2V0X25leHRfYnJpZGdlKHN0cnVj
dCBkcm1fYnJpZGdlICpicmlkZ2UpCiAJcmV0dXJuIGxpc3RfbmV4dF9lbnRyeShicmlkZ2UsIGNo
YWluX25vZGUpOwogfQogCisvKioKKyAqIGRybV9icmlkZ2VfZ2V0X3ByZXZfYnJpZGdlKCkgLSBH
ZXQgdGhlIHByZXZpb3VzIGJyaWRnZSBpbiB0aGUgY2hhaW4KKyAqIEBicmlkZ2U6IGJyaWRnZSBv
YmplY3QKKyAqCisgKiBSRVRVUk5TOgorICogdGhlIHByZXZpb3VzIGJyaWRnZSBpbiB0aGUgY2hh
aW4sIG9yIE5VTEwgaWYgQGJyaWRnZSBpcyB0aGUgZmlyc3QuCisgKi8KK3N0YXRpYyBpbmxpbmUg
c3RydWN0IGRybV9icmlkZ2UgKgorZHJtX2JyaWRnZV9nZXRfcHJldl9icmlkZ2Uoc3RydWN0IGRy
bV9icmlkZ2UgKmJyaWRnZSkKK3sKKwlpZiAobGlzdF9pc19maXJzdCgmYnJpZGdlLT5jaGFpbl9u
b2RlLCAmYnJpZGdlLT5lbmNvZGVyLT5icmlkZ2VfY2hhaW4pKQorCQlyZXR1cm4gTlVMTDsKKwor
CXJldHVybiBsaXN0X3ByZXZfZW50cnkoYnJpZGdlLCBjaGFpbl9ub2RlKTsKK30KKwogLyoqCiAg
KiBkcm1fYnJpZGdlX2NoYWluX2dldF9maXJzdF9icmlkZ2UoKSAtIEdldCB0aGUgZmlyc3QgYnJp
ZGdlIGluIHRoZSBjaGFpbgogICogQGVuY29kZXI6IGVuY29kZXIgb2JqZWN0Ci0tIAoyLjIzLjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
