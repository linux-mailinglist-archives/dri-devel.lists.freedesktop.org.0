Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BEF615DE
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jul 2019 20:23:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3629389ADC;
	Sun,  7 Jul 2019 18:23:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D35D989ADC
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Jul 2019 18:23:47 +0000 (UTC)
Received: from pendragon.nordic-sky.finnair.com (unknown [38.98.37.142])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 85FBBCC;
 Sun,  7 Jul 2019 20:23:28 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 12/60] drm/bridge: panel: Implement bridge connector operations
Date: Sun,  7 Jul 2019 21:18:49 +0300
Message-Id: <20190707181937.6250-9-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190707181937.6250-1-laurent.pinchart@ideasonboard.com>
References: <20190707180852.5512-1-laurent.pinchart@ideasonboard.com>
 <20190707181937.6250-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1562523826;
 bh=z0FECLFA556G2sI4FsYerdaryP8HfbaVntC3JOjAi+0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=f0DD12rV5Q5rHhSePUSmIYI1kZTwDBZw2sAWcdQQhh57rXvvYLWl7Rv9DvLqySgvR
 MXq7YBtB/zBZ3jKpPMltCfe9ACMwf5pLXEP4lo+MAKD+LhBrK8ZqetTlsJ04rm9czd
 rCHUSevXpITxEZTtRVkhPgtFvNZfYUn9r3a+FuQQ=
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

SW1wbGVtZW50IHRoZSBuZXdseSBhZGRlZCBicmlkZ2UgY29ubmVjdG9yIG9wZXJhdGlvbnMsIGFs
bG93aW5nIHRoZQp1c2FnZSBvZiBkcm1fYnJpZGdlX3BhbmVsIHdpdGggZHJtX2JyaWRnZV9jb25u
ZWN0b3IuCgpTaWduZWQtb2ZmLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0
QGlkZWFzb25ib2FyZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9wYW5lbC5jIHwg
MTggKysrKysrKysrKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvcGFuZWwu
YyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvcGFuZWwuYwppbmRleCA5OGFkNGFiZjI0MDkuLjYy
OGUzN2JhYmIwOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9wYW5lbC5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvcGFuZWwuYwpAQCAtNTksNyArNTksNyBAQCBzdGF0
aWMgaW50IHBhbmVsX2JyaWRnZV9hdHRhY2goc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSwgYm9v
bCBjcmVhdGVfY29ubmVjdG9yKQogCWludCByZXQ7CiAKIAlpZiAoIWNyZWF0ZV9jb25uZWN0b3Ip
Ci0JCXJldHVybiAtRUlOVkFMOworCQlyZXR1cm4gMDsKIAogCWlmICghYnJpZGdlLT5lbmNvZGVy
KSB7CiAJCURSTV9FUlJPUigiTWlzc2luZyBlbmNvZGVyXG4iKTsKQEAgLTEyMiw2ICsxMjIsMTgg
QEAgc3RhdGljIHZvaWQgcGFuZWxfYnJpZGdlX3Bvc3RfZGlzYWJsZShzdHJ1Y3QgZHJtX2JyaWRn
ZSAqYnJpZGdlKQogCWRybV9wYW5lbF91bnByZXBhcmUocGFuZWxfYnJpZGdlLT5wYW5lbCk7CiB9
CiAKK3N0YXRpYyBpbnQgcGFuZWxfYnJpZGdlX2dldF9tb2RlcyhzdHJ1Y3QgZHJtX2JyaWRnZSAq
YnJpZGdlLAorCQkJCSAgc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikKK3sKKwlzdHJ1
Y3QgcGFuZWxfYnJpZGdlICpwYW5lbF9icmlkZ2UgPSBkcm1fYnJpZGdlX3RvX3BhbmVsX2JyaWRn
ZShicmlkZ2UpOworCisJLyoKKwkgKiBGSVhNRTogZHJtX3BhbmVsX2dldF9tb2RlcygpIHNob3Vs
ZCB0YWtlIHRoZSBjb25uZWN0b3IgYXMgYW4KKwkgKiBhcmd1bWVudC4KKwkgKi8KKwlyZXR1cm4g
ZHJtX3BhbmVsX2dldF9tb2RlcyhwYW5lbF9icmlkZ2UtPnBhbmVsKTsKK30KKwogc3RhdGljIGNv
bnN0IHN0cnVjdCBkcm1fYnJpZGdlX2Z1bmNzIHBhbmVsX2JyaWRnZV9icmlkZ2VfZnVuY3MgPSB7
CiAJLmF0dGFjaCA9IHBhbmVsX2JyaWRnZV9hdHRhY2gsCiAJLmRldGFjaCA9IHBhbmVsX2JyaWRn
ZV9kZXRhY2gsCkBAIC0xMjksNiArMTQxLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fYnJp
ZGdlX2Z1bmNzIHBhbmVsX2JyaWRnZV9icmlkZ2VfZnVuY3MgPSB7CiAJLmVuYWJsZSA9IHBhbmVs
X2JyaWRnZV9lbmFibGUsCiAJLmRpc2FibGUgPSBwYW5lbF9icmlkZ2VfZGlzYWJsZSwKIAkucG9z
dF9kaXNhYmxlID0gcGFuZWxfYnJpZGdlX3Bvc3RfZGlzYWJsZSwKKwkuZ2V0X21vZGVzID0gcGFu
ZWxfYnJpZGdlX2dldF9tb2RlcywKIH07CiAKIC8qKgpAQCAtMTc0LDYgKzE4Nyw5IEBAIHN0cnVj
dCBkcm1fYnJpZGdlICpkcm1fcGFuZWxfYnJpZGdlX2FkZChzdHJ1Y3QgZHJtX3BhbmVsICpwYW5l
bCwKICNpZmRlZiBDT05GSUdfT0YKIAlwYW5lbF9icmlkZ2UtPmJyaWRnZS5vZl9ub2RlID0gcGFu
ZWwtPmRldi0+b2Zfbm9kZTsKICNlbmRpZgorCXBhbmVsX2JyaWRnZS0+YnJpZGdlLm9wcyA9IERS
TV9CUklER0VfT1BfTU9ERVM7CisJLyogRklYTUU6IFRoZSBwYW5lbCBzaG91bGQgcmVwb3J0IGl0
cyB0eXBlLiAqLworCXBhbmVsX2JyaWRnZS0+YnJpZGdlLnR5cGUgPSBEUk1fTU9ERV9DT05ORUNU
T1JfRFBJOwogCiAJZHJtX2JyaWRnZV9hZGQoJnBhbmVsX2JyaWRnZS0+YnJpZGdlKTsKIAotLSAK
UmVnYXJkcywKCkxhdXJlbnQgUGluY2hhcnQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
