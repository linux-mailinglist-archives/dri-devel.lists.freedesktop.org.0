Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DF11169FE
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 10:47:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DFAA6E369;
	Mon,  9 Dec 2019 09:47:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id 60EA86FA5A
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2019 16:33:15 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,285,1571670000"; d="scan'208";a="33693114"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie5.idc.renesas.com with ESMTP; 07 Dec 2019 01:33:14 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id 74A80400D4D7;
 Sat,  7 Dec 2019 01:33:09 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sean Paul <sean@poorly.run>,
 Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v4 2/7] drm: rcar-du: lvds: Improve identification of panels
Date: Fri,  6 Dec 2019 16:32:49 +0000
Message-Id: <1575649974-31472-3-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1575649974-31472-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1575649974-31472-1-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailman-Approved-At: Mon, 09 Dec 2019 09:46:36 +0000
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
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
 devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>,
 ebiharaml@si-linux.co.jp,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Biju Das <biju.das@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Simon Horman <horms@verge.net.au>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RHVhbC1MVkRTIHBhbmVscyBhcmUgbWlzdGFrZW5seSBpZGVudGlmaWVkIGFzIGJyaWRnZXMsIHRo
aXMKY29tbWl0IHJlcGxhY2VzIHRoZSBjdXJyZW50IGxvZ2ljIHdpdGggYSBjYWxsIHRvCmRybV9v
Zl9maW5kX3BhbmVsX29yX2JyaWRnZSB0byBzb3J0IHRoYXQgb3V0LgoKU2lnbmVkLW9mZi1ieTog
RmFicml6aW8gQ2FzdHJvIDxmYWJyaXppby5jYXN0cm9AYnAucmVuZXNhcy5jb20+CgotLS0KdjMt
PnY0OgoqIE5ldyBwYXRjaCBleHRyYWN0ZWQgZnJvbSBwYXRjaDoKICAiZHJtOiByY2FyLWR1OiBs
dmRzOiBBZGQgZHVhbC1MVkRTIHBhbmVscyBzdXBwb3J0IgotLS0KIGRyaXZlcnMvZ3B1L2RybS9y
Y2FyLWR1L3JjYXJfbHZkcy5jIHwgNDUgKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQogMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDM1IGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfbHZkcy5jIGIvZHJpdmVy
cy9ncHUvZHJtL3JjYXItZHUvcmNhcl9sdmRzLmMKaW5kZXggOGM2YzE3Mi4uM2NiMGE4MyAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9sdmRzLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3JjYXItZHUvcmNhcl9sdmRzLmMKQEAgLTIxLDYgKzIxLDcgQEAKICNpbmNsdWRl
IDxkcm0vZHJtX2F0b21pYy5oPgogI2luY2x1ZGUgPGRybS9kcm1fYXRvbWljX2hlbHBlci5oPgog
I2luY2x1ZGUgPGRybS9kcm1fYnJpZGdlLmg+CisjaW5jbHVkZSA8ZHJtL2RybV9vZi5oPgogI2lu
Y2x1ZGUgPGRybS9kcm1fcGFuZWwuaD4KICNpbmNsdWRlIDxkcm0vZHJtX3Byb2JlX2hlbHBlci5o
PgogCkBAIC03MDUsMTAgKzcwNiw3IEBAIHN0YXRpYyBpbnQgcmNhcl9sdmRzX3BhcnNlX2R0X2Nv
bXBhbmlvbihzdHJ1Y3QgcmNhcl9sdmRzICpsdmRzKQogc3RhdGljIGludCByY2FyX2x2ZHNfcGFy
c2VfZHQoc3RydWN0IHJjYXJfbHZkcyAqbHZkcykKIHsKIAlzdHJ1Y3QgZGV2aWNlX25vZGUgKmxv
Y2FsX291dHB1dCA9IE5VTEw7Ci0Jc3RydWN0IGRldmljZV9ub2RlICpyZW1vdGVfaW5wdXQgPSBO
VUxMOwogCXN0cnVjdCBkZXZpY2Vfbm9kZSAqcmVtb3RlID0gTlVMTDsKLQlzdHJ1Y3QgZGV2aWNl
X25vZGUgKm5vZGU7Ci0JYm9vbCBpc19icmlkZ2UgPSBmYWxzZTsKIAlpbnQgcmV0ID0gMDsKIAog
CWxvY2FsX291dHB1dCA9IG9mX2dyYXBoX2dldF9lbmRwb2ludF9ieV9yZWdzKGx2ZHMtPmRldi0+
b2Zfbm9kZSwgMSwgMCk7CkBAIC03MzYsNDUgKzczNCwyMiBAQCBzdGF0aWMgaW50IHJjYXJfbHZk
c19wYXJzZV9kdChzdHJ1Y3QgcmNhcl9sdmRzICpsdmRzKQogCQlnb3RvIGRvbmU7CiAJfQogCi0J
cmVtb3RlX2lucHV0ID0gb2ZfZ3JhcGhfZ2V0X3JlbW90ZV9lbmRwb2ludChsb2NhbF9vdXRwdXQp
OwotCi0JZm9yX2VhY2hfZW5kcG9pbnRfb2Zfbm9kZShyZW1vdGUsIG5vZGUpIHsKLQkJaWYgKG5v
ZGUgIT0gcmVtb3RlX2lucHV0KSB7Ci0JCQkvKgotCQkJICogV2UndmUgZm91bmQgb25lIGVuZHBv
aW50IG90aGVyIHRoYW4gdGhlIGlucHV0LCB0aGlzCi0JCQkgKiBtdXN0IGJlIGEgYnJpZGdlLgot
CQkJICovCi0JCQlpc19icmlkZ2UgPSB0cnVlOwotCQkJb2Zfbm9kZV9wdXQobm9kZSk7Ci0JCQli
cmVhazsKLQkJfQotCX0KLQotCWlmIChpc19icmlkZ2UpIHsKLQkJbHZkcy0+bmV4dF9icmlkZ2Ug
PSBvZl9kcm1fZmluZF9icmlkZ2UocmVtb3RlKTsKLQkJaWYgKCFsdmRzLT5uZXh0X2JyaWRnZSkg
ewotCQkJcmV0ID0gLUVQUk9CRV9ERUZFUjsKLQkJCWdvdG8gZG9uZTsKLQkJfQorCXJldCA9IGRy
bV9vZl9maW5kX3BhbmVsX29yX2JyaWRnZShsdmRzLT5kZXYtPm9mX25vZGUsIDEsIDAsCisJCQkJ
CSAgJmx2ZHMtPnBhbmVsLCAmbHZkcy0+bmV4dF9icmlkZ2UpOworCWlmIChyZXQpCisJCWdvdG8g
ZG9uZTsKIAotCQlpZiAobHZkcy0+aW5mby0+cXVpcmtzICYgUkNBUl9MVkRTX1FVSVJLX0RVQUxf
TElOSykKLQkJCWx2ZHMtPmR1YWxfbGluayA9IGx2ZHMtPm5leHRfYnJpZGdlLT50aW1pbmdzCi0J
CQkJCT8gbHZkcy0+bmV4dF9icmlkZ2UtPnRpbWluZ3MtPmR1YWxfbGluawotCQkJCQk6IGZhbHNl
OwotCX0gZWxzZSB7Ci0JCWx2ZHMtPnBhbmVsID0gb2ZfZHJtX2ZpbmRfcGFuZWwocmVtb3RlKTsK
LQkJaWYgKElTX0VSUihsdmRzLT5wYW5lbCkpIHsKLQkJCXJldCA9IFBUUl9FUlIobHZkcy0+cGFu
ZWwpOwotCQkJZ290byBkb25lOwotCQl9Ci0JfQorCWlmICgobHZkcy0+aW5mby0+cXVpcmtzICYg
UkNBUl9MVkRTX1FVSVJLX0RVQUxfTElOSykgJiYKKwkgICAgbHZkcy0+bmV4dF9icmlkZ2UpCisJ
CWx2ZHMtPmR1YWxfbGluayA9IGx2ZHMtPm5leHRfYnJpZGdlLT50aW1pbmdzCisJCQkJPyBsdmRz
LT5uZXh0X2JyaWRnZS0+dGltaW5ncy0+ZHVhbF9saW5rCisJCQkJOiBmYWxzZTsKIAogCWlmIChs
dmRzLT5kdWFsX2xpbmspCiAJCXJldCA9IHJjYXJfbHZkc19wYXJzZV9kdF9jb21wYW5pb24obHZk
cyk7CiAKIGRvbmU6CiAJb2Zfbm9kZV9wdXQobG9jYWxfb3V0cHV0KTsKLQlvZl9ub2RlX3B1dChy
ZW1vdGVfaW5wdXQpOwogCW9mX25vZGVfcHV0KHJlbW90ZSk7CiAKIAkvKgotLSAKMi43LjQKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
