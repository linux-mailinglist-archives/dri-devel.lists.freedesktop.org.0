Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2082F95337
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 03:18:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28DAC6E588;
	Tue, 20 Aug 2019 01:18:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 049AB6E504
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 01:17:45 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 90EEEB83;
 Tue, 20 Aug 2019 03:17:40 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 13/50] drm/bridge: panel: Implement bridge connector
 operations
Date: Tue, 20 Aug 2019 04:16:44 +0300
Message-Id: <20190820011721.30136-14-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190820011721.30136-1-laurent.pinchart@ideasonboard.com>
References: <20190820011721.30136-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1566263861;
 bh=VMP2jEkOkMHifcAl25Ak8CCeOn7WuLioVawJs+uQqWI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=inTjo2cUhrhOg82LSAuG5JSxtBS109bUNNEVVxtwXYkHM1uAUUNYWsBCsNT5tRDHb
 XQz24JnD7ZLh2/QrMxBaP5F1VnzyNl9rs+8P8ZzgbCT7yqR+WggZtZevL8F6x2VFjy
 ZHCrnbm8aUFTpCKhbvjjUSY3/Os1CezCbKwet5WA=
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

SW1wbGVtZW50IHRoZSBuZXdseSBhZGRlZCBicmlkZ2UgY29ubmVjdG9yIG9wZXJhdGlvbnMsIGFs
bG93aW5nIHRoZQp1c2FnZSBvZiBkcm1fYnJpZGdlX3BhbmVsIHdpdGggZHJtX2JyaWRnZV9jb25u
ZWN0b3IuCgpTaWduZWQtb2ZmLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0
QGlkZWFzb25ib2FyZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9wYW5lbC5jIHwg
MTggKysrKysrKysrKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvcGFuZWwu
YyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvcGFuZWwuYwppbmRleCBmNWI4ZTU1MzAxYWMuLjFj
N2Y1YjY0OGYwNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9wYW5lbC5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvcGFuZWwuYwpAQCAtNjAsNyArNjAsNyBAQCBzdGF0
aWMgaW50IHBhbmVsX2JyaWRnZV9hdHRhY2goc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSwKIAlp
bnQgcmV0OwogCiAJaWYgKGZsYWdzICYgRFJNX0JSSURHRV9BVFRBQ0hfTk9fQ09OTkVDVE9SKQot
CQlyZXR1cm4gLUVJTlZBTDsKKwkJcmV0dXJuIDA7CiAKIAlpZiAoIWJyaWRnZS0+ZW5jb2Rlcikg
ewogCQlEUk1fRVJST1IoIk1pc3NpbmcgZW5jb2RlclxuIik7CkBAIC0xMjMsNiArMTIzLDE4IEBA
IHN0YXRpYyB2b2lkIHBhbmVsX2JyaWRnZV9wb3N0X2Rpc2FibGUoc3RydWN0IGRybV9icmlkZ2Ug
KmJyaWRnZSkKIAlkcm1fcGFuZWxfdW5wcmVwYXJlKHBhbmVsX2JyaWRnZS0+cGFuZWwpOwogfQog
CitzdGF0aWMgaW50IHBhbmVsX2JyaWRnZV9nZXRfbW9kZXMoc3RydWN0IGRybV9icmlkZ2UgKmJy
aWRnZSwKKwkJCQkgIHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpCit7CisJc3RydWN0
IHBhbmVsX2JyaWRnZSAqcGFuZWxfYnJpZGdlID0gZHJtX2JyaWRnZV90b19wYW5lbF9icmlkZ2Uo
YnJpZGdlKTsKKworCS8qCisJICogRklYTUU6IGRybV9wYW5lbF9nZXRfbW9kZXMoKSBzaG91bGQg
dGFrZSB0aGUgY29ubmVjdG9yIGFzIGFuCisJICogYXJndW1lbnQuCisJICovCisJcmV0dXJuIGRy
bV9wYW5lbF9nZXRfbW9kZXMocGFuZWxfYnJpZGdlLT5wYW5lbCk7Cit9CisKIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgZHJtX2JyaWRnZV9mdW5jcyBwYW5lbF9icmlkZ2VfYnJpZGdlX2Z1bmNzID0gewog
CS5hdHRhY2ggPSBwYW5lbF9icmlkZ2VfYXR0YWNoLAogCS5kZXRhY2ggPSBwYW5lbF9icmlkZ2Vf
ZGV0YWNoLApAQCAtMTMwLDYgKzE0Miw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2JyaWRn
ZV9mdW5jcyBwYW5lbF9icmlkZ2VfYnJpZGdlX2Z1bmNzID0gewogCS5lbmFibGUgPSBwYW5lbF9i
cmlkZ2VfZW5hYmxlLAogCS5kaXNhYmxlID0gcGFuZWxfYnJpZGdlX2Rpc2FibGUsCiAJLnBvc3Rf
ZGlzYWJsZSA9IHBhbmVsX2JyaWRnZV9wb3N0X2Rpc2FibGUsCisJLmdldF9tb2RlcyA9IHBhbmVs
X2JyaWRnZV9nZXRfbW9kZXMsCiB9OwogCiAvKioKQEAgLTE3NSw2ICsxODgsOSBAQCBzdHJ1Y3Qg
ZHJtX2JyaWRnZSAqZHJtX3BhbmVsX2JyaWRnZV9hZGQoc3RydWN0IGRybV9wYW5lbCAqcGFuZWws
CiAjaWZkZWYgQ09ORklHX09GCiAJcGFuZWxfYnJpZGdlLT5icmlkZ2Uub2Zfbm9kZSA9IHBhbmVs
LT5kZXYtPm9mX25vZGU7CiAjZW5kaWYKKwlwYW5lbF9icmlkZ2UtPmJyaWRnZS5vcHMgPSBEUk1f
QlJJREdFX09QX01PREVTOworCS8qIEZJWE1FOiBUaGUgcGFuZWwgc2hvdWxkIHJlcG9ydCBpdHMg
dHlwZS4gKi8KKwlwYW5lbF9icmlkZ2UtPmJyaWRnZS50eXBlID0gRFJNX01PREVfQ09OTkVDVE9S
X0RQSTsKIAogCWRybV9icmlkZ2VfYWRkKCZwYW5lbF9icmlkZ2UtPmJyaWRnZSk7CiAKLS0gClJl
Z2FyZHMsCgpMYXVyZW50IFBpbmNoYXJ0CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
