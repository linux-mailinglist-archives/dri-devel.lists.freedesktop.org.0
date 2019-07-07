Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D94E615D6
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jul 2019 20:21:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7642689AB3;
	Sun,  7 Jul 2019 18:21:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDFCD89AB3
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Jul 2019 18:21:36 +0000 (UTC)
Received: from pendragon.nordic-sky.finnair.com (unknown [38.98.37.142])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 17BDAAF9;
 Sun,  7 Jul 2019 20:21:17 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 06/60] drm/bridge: simple-bridge: Add support for enable GPIO
Date: Sun,  7 Jul 2019 21:18:43 +0300
Message-Id: <20190707181937.6250-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190707181937.6250-1-laurent.pinchart@ideasonboard.com>
References: <20190707180852.5512-1-laurent.pinchart@ideasonboard.com>
 <20190707181937.6250-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1562523695;
 bh=qRxa0qr/vRR3Cgug67qAdC9iuZx3hTLE3/I8yNAxCWc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eZ7ieqJrsO/WpqkNBywaC3v5EGmtp/n4YhhV+l7qz+63Cn+sygSNUqe0QJkckCTgn
 F8kPiSTcQ1+iUfvoxqA8/M5/P4fyIxBFUDPFv51jsOR/mQkEHfXqjoedV0B+30Lhp8
 0gGWVNpAkIkvtVl5at8FkS5jUCuUqYZGD75mIeQ0=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SWYgYW4gZW5hYmxlIEdQSU8gaXMgZGVjbGFyZWQgaW4gdGhlIGZpcm13YXJlLCBhc3NlcnQgaXQg
d2hlbiBlbmFibGluZwp0aGUgYnJpZGdlIGFuZCBkZWFzc2VydCBpdCB3aGVuIGRpc2FibGluZyBp
dC4KClNpZ25lZC1vZmYtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRl
YXNvbmJvYXJkLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3NpbXBsZS1icmlkZ2Uu
YyB8IDIyICsrKysrKysrKysrKysrKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRp
b25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlk
Z2Uvc2ltcGxlLWJyaWRnZS5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zaW1wbGUtYnJpZGdl
LmMKaW5kZXggYmZmMjQwY2YyODNkLi5hN2VkZjNjMzk2MjcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9icmlkZ2Uvc2ltcGxlLWJyaWRnZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlk
Z2Uvc2ltcGxlLWJyaWRnZS5jCkBAIC02LDYgKzYsNyBAQAogICogTWF4aW1lIFJpcGFyZCA8bWF4
aW1lLnJpcGFyZEBmcmVlLWVsZWN0cm9ucy5jb20+CiAgKi8KIAorI2luY2x1ZGUgPGxpbnV4L2dw
aW8vY29uc3VtZXIuaD4KICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KICNpbmNsdWRlIDxsaW51
eC9vZl9kZXZpY2UuaD4KICNpbmNsdWRlIDxsaW51eC9vZl9ncmFwaC5oPgpAQCAtMjksNiArMzAs
NyBAQCBzdHJ1Y3Qgc2ltcGxlX2JyaWRnZSB7CiAKIAlzdHJ1Y3QgaTJjX2FkYXB0ZXIJKmRkYzsK
IAlzdHJ1Y3QgcmVndWxhdG9yCSp2ZGQ7CisJc3RydWN0IGdwaW9fZGVzYwkqZW5hYmxlOwogfTsK
IAogc3RhdGljIGlubGluZSBzdHJ1Y3Qgc2ltcGxlX2JyaWRnZSAqCkBAIC0xMzUsMTkgKzEzNywy
MyBAQCBzdGF0aWMgaW50IHNpbXBsZV9icmlkZ2VfYXR0YWNoKHN0cnVjdCBkcm1fYnJpZGdlICpi
cmlkZ2UpCiBzdGF0aWMgdm9pZCBzaW1wbGVfYnJpZGdlX2VuYWJsZShzdHJ1Y3QgZHJtX2JyaWRn
ZSAqYnJpZGdlKQogewogCXN0cnVjdCBzaW1wbGVfYnJpZGdlICpzYnJpZGdlID0gZHJtX2JyaWRn
ZV90b19zaW1wbGVfYnJpZGdlKGJyaWRnZSk7Ci0JaW50IHJldCA9IDA7CisJaW50IHJldDsKIAot
CWlmIChzYnJpZGdlLT52ZGQpCisJaWYgKHNicmlkZ2UtPnZkZCkgewogCQlyZXQgPSByZWd1bGF0
b3JfZW5hYmxlKHNicmlkZ2UtPnZkZCk7CisJCWlmIChyZXQpCisJCQlEUk1fRVJST1IoIkZhaWxl
ZCB0byBlbmFibGUgdmRkIHJlZ3VsYXRvcjogJWRcbiIsIHJldCk7CisJfQogCi0JaWYgKHJldCkK
LQkJRFJNX0VSUk9SKCJGYWlsZWQgdG8gZW5hYmxlIHZkZCByZWd1bGF0b3I6ICVkXG4iLCByZXQp
OworCWdwaW9kX3NldF92YWx1ZV9jYW5zbGVlcChzYnJpZGdlLT5lbmFibGUsIDEpOwogfQogCiBz
dGF0aWMgdm9pZCBzaW1wbGVfYnJpZGdlX2Rpc2FibGUoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRn
ZSkKIHsKIAlzdHJ1Y3Qgc2ltcGxlX2JyaWRnZSAqc2JyaWRnZSA9IGRybV9icmlkZ2VfdG9fc2lt
cGxlX2JyaWRnZShicmlkZ2UpOwogCisJZ3Bpb2Rfc2V0X3ZhbHVlX2NhbnNsZWVwKHNicmlkZ2Ut
PmVuYWJsZSwgMCk7CisKIAlpZiAoc2JyaWRnZS0+dmRkKQogCQlyZWd1bGF0b3JfZGlzYWJsZShz
YnJpZGdlLT52ZGQpOwogfQpAQCAtMjAwLDYgKzIwNiwxNCBAQCBzdGF0aWMgaW50IHNpbXBsZV9i
cmlkZ2VfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAkJZGV2X2RiZygmcGRl
di0+ZGV2LCAiTm8gdmRkIHJlZ3VsYXRvciBmb3VuZDogJWRcbiIsIHJldCk7CiAJfQogCisJc2Jy
aWRnZS0+ZW5hYmxlID0gZGV2bV9ncGlvZF9nZXRfb3B0aW9uYWwoJnBkZXYtPmRldiwgImVuYWJs
ZSIsCisJCQkJCQkgIEdQSU9EX09VVF9MT1cpOworCWlmIChJU19FUlIoc2JyaWRnZS0+ZW5hYmxl
KSkgeworCQlpZiAoUFRSX0VSUihzYnJpZGdlLT5lbmFibGUpICE9IC1FUFJPQkVfREVGRVIpCisJ
CQlkZXZfZXJyKCZwZGV2LT5kZXYsICJVbmFibGUgdG8gcmV0cmlldmUgZW5hYmxlIEdQSU9cbiIp
OworCQlyZXR1cm4gUFRSX0VSUihzYnJpZGdlLT5lbmFibGUpOworCX0KKwogCXNicmlkZ2UtPmRk
YyA9IHNpbXBsZV9icmlkZ2VfcmV0cmlldmVfZGRjKCZwZGV2LT5kZXYpOwogCWlmIChJU19FUlIo
c2JyaWRnZS0+ZGRjKSkgewogCQlpZiAoUFRSX0VSUihzYnJpZGdlLT5kZGMpID09IC1FTk9ERVYp
IHsKLS0gClJlZ2FyZHMsCgpMYXVyZW50IFBpbmNoYXJ0CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
