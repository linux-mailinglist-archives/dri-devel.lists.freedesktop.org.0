Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D7295328
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 03:18:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5142E6E591;
	Tue, 20 Aug 2019 01:18:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 510126E4DD
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 01:17:41 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 11A96510;
 Tue, 20 Aug 2019 03:17:38 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 09/50] drm/bridge: simple-bridge: Add support for enable
 GPIO
Date: Tue, 20 Aug 2019 04:16:40 +0300
Message-Id: <20190820011721.30136-10-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190820011721.30136-1-laurent.pinchart@ideasonboard.com>
References: <20190820011721.30136-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1566263858;
 bh=oJvd8dmz5I30VaYXa/CSqC8WEM4z1yFAnzrog1sbmlU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OuODnAhb/xzyG3O+3FLUzg0e8O1v63GEfK07HOo8kYiS11MP8YP0OE8soraZnLqHy
 wYmumFiermeIokGetM9d7d93/+ZO3Wb623mVlkKWEFVu2NDEpUEzu+DYfXT2hFwR15
 wsIDcms5punF2PUgxMgfep3dgrQhNO6ab+VomMO4=
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
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Sean Paul <sean@poorly.run>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SWYgYW4gZW5hYmxlIEdQSU8gaXMgZGVjbGFyZWQgaW4gdGhlIGZpcm13YXJlLCBhc3NlcnQgaXQg
d2hlbiBlbmFibGluZwp0aGUgYnJpZGdlIGFuZCBkZWFzc2VydCBpdCB3aGVuIGRpc2FibGluZyBp
dC4KClNpZ25lZC1vZmYtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRl
YXNvbmJvYXJkLmNvbT4KUmV2aWV3ZWQtYnk6IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3Vu
Zy5jb20+ClJldmlld2VkLWJ5OiBTdGVmYW4gQWduZXIgPHN0ZWZhbkBhZ25lci5jaD4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL3NpbXBsZS1icmlkZ2UuYyB8IDIyICsrKysrKysrKysrKysr
KysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2ltcGxlLWJyaWRnZS5jIGIv
ZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zaW1wbGUtYnJpZGdlLmMKaW5kZXggODVhYTg1MmVhZmI0
Li4zZTUwMzE4MzMzNjggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2ltcGxl
LWJyaWRnZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2ltcGxlLWJyaWRnZS5jCkBA
IC02LDYgKzYsNyBAQAogICogTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBmcmVlLWVsZWN0
cm9ucy5jb20+CiAgKi8KIAorI2luY2x1ZGUgPGxpbnV4L2dwaW8vY29uc3VtZXIuaD4KICNpbmNs
dWRlIDxsaW51eC9tb2R1bGUuaD4KICNpbmNsdWRlIDxsaW51eC9vZl9kZXZpY2UuaD4KICNpbmNs
dWRlIDxsaW51eC9vZl9ncmFwaC5oPgpAQCAtMjksNiArMzAsNyBAQCBzdHJ1Y3Qgc2ltcGxlX2Jy
aWRnZSB7CiAKIAlzdHJ1Y3QgaTJjX2FkYXB0ZXIJKmRkYzsKIAlzdHJ1Y3QgcmVndWxhdG9yCSp2
ZGQ7CisJc3RydWN0IGdwaW9fZGVzYwkqZW5hYmxlOwogfTsKIAogc3RhdGljIGlubGluZSBzdHJ1
Y3Qgc2ltcGxlX2JyaWRnZSAqCkBAIC0xNDAsMTkgKzE0MiwyMyBAQCBzdGF0aWMgaW50IHNpbXBs
ZV9icmlkZ2VfYXR0YWNoKHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UsCiBzdGF0aWMgdm9pZCBz
aW1wbGVfYnJpZGdlX2VuYWJsZShzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlKQogewogCXN0cnVj
dCBzaW1wbGVfYnJpZGdlICpzYnJpZGdlID0gZHJtX2JyaWRnZV90b19zaW1wbGVfYnJpZGdlKGJy
aWRnZSk7Ci0JaW50IHJldCA9IDA7CisJaW50IHJldDsKIAotCWlmIChzYnJpZGdlLT52ZGQpCisJ
aWYgKHNicmlkZ2UtPnZkZCkgewogCQlyZXQgPSByZWd1bGF0b3JfZW5hYmxlKHNicmlkZ2UtPnZk
ZCk7CisJCWlmIChyZXQpCisJCQlEUk1fRVJST1IoIkZhaWxlZCB0byBlbmFibGUgdmRkIHJlZ3Vs
YXRvcjogJWRcbiIsIHJldCk7CisJfQogCi0JaWYgKHJldCkKLQkJRFJNX0VSUk9SKCJGYWlsZWQg
dG8gZW5hYmxlIHZkZCByZWd1bGF0b3I6ICVkXG4iLCByZXQpOworCWdwaW9kX3NldF92YWx1ZV9j
YW5zbGVlcChzYnJpZGdlLT5lbmFibGUsIDEpOwogfQogCiBzdGF0aWMgdm9pZCBzaW1wbGVfYnJp
ZGdlX2Rpc2FibGUoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSkKIHsKIAlzdHJ1Y3Qgc2ltcGxl
X2JyaWRnZSAqc2JyaWRnZSA9IGRybV9icmlkZ2VfdG9fc2ltcGxlX2JyaWRnZShicmlkZ2UpOwog
CisJZ3Bpb2Rfc2V0X3ZhbHVlX2NhbnNsZWVwKHNicmlkZ2UtPmVuYWJsZSwgMCk7CisKIAlpZiAo
c2JyaWRnZS0+dmRkKQogCQlyZWd1bGF0b3JfZGlzYWJsZShzYnJpZGdlLT52ZGQpOwogfQpAQCAt
MjA1LDYgKzIxMSwxNCBAQCBzdGF0aWMgaW50IHNpbXBsZV9icmlkZ2VfcHJvYmUoc3RydWN0IHBs
YXRmb3JtX2RldmljZSAqcGRldikKIAkJZGV2X2RiZygmcGRldi0+ZGV2LCAiTm8gdmRkIHJlZ3Vs
YXRvciBmb3VuZDogJWRcbiIsIHJldCk7CiAJfQogCisJc2JyaWRnZS0+ZW5hYmxlID0gZGV2bV9n
cGlvZF9nZXRfb3B0aW9uYWwoJnBkZXYtPmRldiwgImVuYWJsZSIsCisJCQkJCQkgIEdQSU9EX09V
VF9MT1cpOworCWlmIChJU19FUlIoc2JyaWRnZS0+ZW5hYmxlKSkgeworCQlpZiAoUFRSX0VSUihz
YnJpZGdlLT5lbmFibGUpICE9IC1FUFJPQkVfREVGRVIpCisJCQlkZXZfZXJyKCZwZGV2LT5kZXYs
ICJVbmFibGUgdG8gcmV0cmlldmUgZW5hYmxlIEdQSU9cbiIpOworCQlyZXR1cm4gUFRSX0VSUihz
YnJpZGdlLT5lbmFibGUpOworCX0KKwogCXNicmlkZ2UtPmRkYyA9IHNpbXBsZV9icmlkZ2VfcmV0
cmlldmVfZGRjKCZwZGV2LT5kZXYpOwogCWlmIChJU19FUlIoc2JyaWRnZS0+ZGRjKSkgewogCQlp
ZiAoUFRSX0VSUihzYnJpZGdlLT5kZGMpID09IC1FTk9ERVYpIHsKLS0gClJlZ2FyZHMsCgpMYXVy
ZW50IFBpbmNoYXJ0CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
