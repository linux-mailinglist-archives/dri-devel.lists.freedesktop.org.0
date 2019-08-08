Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 495DB86557
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 17:12:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DBA56E874;
	Thu,  8 Aug 2019 15:12:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E71666E865
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 15:12:08 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id F0A5628CAB8;
 Thu,  8 Aug 2019 16:12:06 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH RFC 13/19] drm/bridge: Add the
 drm_bridge_chain_get_prev_bridge() helper
Date: Thu,  8 Aug 2019 17:11:44 +0200
Message-Id: <20190808151150.16336-14-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190808151150.16336-1-boris.brezillon@collabora.com>
References: <20190808151150.16336-1-boris.brezillon@collabora.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
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
cmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJlemlsbG9uQGNvbGxhYm9yYS5jb20+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL2RybV9icmlkZ2UuYyB8IDE5ICsrKysrKysrKysrKysrKysrKysKIGluY2x1ZGUv
ZHJtL2RybV9icmlkZ2UuaCAgICAgfCAgMiArKwogMiBmaWxlcyBjaGFuZ2VkLCAyMSBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9icmlkZ2UuYyBiL2RyaXZl
cnMvZ3B1L2RybS9kcm1fYnJpZGdlLmMKaW5kZXggZGNhZDY2MWRhYTc0Li45ZWZiMjcwODdlNzAg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fYnJpZGdlLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2RybV9icmlkZ2UuYwpAQCAtMjcxLDYgKzI3MSwyNSBAQCBkcm1fYnJpZGdlX2NoYWlu
X2dldF9uZXh0X2JyaWRnZShzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlKQogfQogRVhQT1JUX1NZ
TUJPTChkcm1fYnJpZGdlX2NoYWluX2dldF9uZXh0X2JyaWRnZSk7CiAKKy8qKgorICogZHJtX2Jy
aWRnZV9jaGFpbl9nZXRfcHJldl9icmlkZ2UoKSAtIEdldCB0aGUgcHJldmlvdXMgYnJpZGdlIGlu
IHRoZSBjaGFpbgorICogQGJyaWRnZTogYnJpZGdlIG9iamVjdAorICoKKyAqIFJFVFVSTlM6Cisg
KiB0aGUgcHJldmlvdXMgYnJpZGdlIGluIHRoZSBjaGFpbiwgb3IgTlVMTCBpZiB0aGVyZSdzIEBi
cmlkZ2UgaXMgdGhlCisgKiBsYXN0LgorICovCitzdHJ1Y3QgZHJtX2JyaWRnZSAqCitkcm1fYnJp
ZGdlX2NoYWluX2dldF9wcmV2X2JyaWRnZShzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlKQorewor
CWlmICghYnJpZGdlIHx8ICFicmlkZ2UtPmVuY29kZXIgfHwKKwkgICAgbGlzdF9pc19maXJzdCgm
YnJpZGdlLT5lbmNvZGVyLT5icmlkZ2VfY2hhaW4sICZicmlkZ2UtPmNoYWluX25vZGUpKQorICAg
ICAgICAgICAgICAgIHJldHVybiBOVUxMOworCisJcmV0dXJuIGxpc3RfcHJldl9lbnRyeShicmlk
Z2UsIGNoYWluX25vZGUpOworfQorRVhQT1JUX1NZTUJPTChkcm1fYnJpZGdlX2NoYWluX2dldF9w
cmV2X2JyaWRnZSk7CisKIC8qKgogICogRE9DOiBicmlkZ2UgY2FsbGJhY2tzCiAgKgpkaWZmIC0t
Z2l0IGEvaW5jbHVkZS9kcm0vZHJtX2JyaWRnZS5oIGIvaW5jbHVkZS9kcm0vZHJtX2JyaWRnZS5o
CmluZGV4IDVkOGZlMzcwOWJkZS4uMmY2OWFkYjdiMGYzIDEwMDY0NAotLS0gYS9pbmNsdWRlL2Ry
bS9kcm1fYnJpZGdlLmgKKysrIGIvaW5jbHVkZS9kcm0vZHJtX2JyaWRnZS5oCkBAIC00ODUsNiAr
NDg1LDggQEAgc3RydWN0IGRybV9icmlkZ2UgKgogZHJtX2JyaWRnZV9jaGFpbl9nZXRfbGFzdF9i
cmlkZ2Uoc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyKTsKIHN0cnVjdCBkcm1fYnJpZGdlICoK
IGRybV9icmlkZ2VfY2hhaW5fZ2V0X25leHRfYnJpZGdlKHN0cnVjdCBkcm1fYnJpZGdlICpicmlk
Z2UpOworc3RydWN0IGRybV9icmlkZ2UgKgorZHJtX2JyaWRnZV9jaGFpbl9nZXRfcHJldl9icmlk
Z2Uoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSk7CiBib29sIGRybV9icmlkZ2VfY2hhaW5fbW9k
ZV9maXh1cChzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIsCiAJCQkJIGNvbnN0IHN0cnVjdCBk
cm1fZGlzcGxheV9tb2RlICptb2RlLAogCQkJCSBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqYWRq
dXN0ZWRfbW9kZSk7Ci0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
