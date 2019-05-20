Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2BF23852
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2019 15:38:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2771D8929D;
	Mon, 20 May 2019 13:38:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 898AE892A1
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 13:38:04 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id e15so14667733wrs.4
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 06:38:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8wgz8PuMWuN+4Z5p71iE5tvMWtrysycjZtvpJoHqTb8=;
 b=K9saVT6FB4brr/mg9fMMQAXpjup4LDa8701d9uiPDbq/8kin1s/9klahLaSbqcPqGg
 yFzxXsgaSfY7IiA3bKKcmEDF5+BJrGqcE6HoMfo2FrPdK+Q6Q0lf82x/oC+qjVbuZfej
 w8McytBIYXb/Pq0EYpYud8kPhRF/kJOEQvFEe67wqH7fCFxm9BtxVe25WPvTCCdq7+dN
 T2TQrLnr4SeMcnR5veZYZMas0wGZa4MeQvJgZuHt2eW2PSUnojrRjYalXt9EdxHp5tyx
 hdJxk/MENX3p7ERXVx9/PjgO0kC1oCoH1lwtQI98L/c3xvs3KQqAoi7fkON0WKwimWlh
 N3bQ==
X-Gm-Message-State: APjAAAVAT12UeKd8H/MSf7nVLTqiPdrvN/FivZq28Kp71Rlnb2qBM3Xf
 4gaW9OkVOzl3aJmydsWQVHjPLg==
X-Google-Smtp-Source: APXvYqwFVGiliaIe2yHIHUvGdrFvbFinbVKbndUVa7UC/xbova7lvQo1At2nx2PcoZC9tcvPyp3rjQ==
X-Received: by 2002:adf:fdc1:: with SMTP id i1mr18078192wrs.103.1558359481967; 
 Mon, 20 May 2019 06:38:01 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id t19sm12167059wmi.42.2019.05.20.06.38.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 20 May 2019 06:38:01 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com,
	Laurent.pinchart@ideasonboard.com
Subject: [PATCH 5/5] drm/meson: Output in YUV444 if sink supports it
Date: Mon, 20 May 2019 15:37:53 +0200
Message-Id: <20190520133753.23871-6-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190520133753.23871-1-narmstrong@baylibre.com>
References: <20190520133753.23871-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8wgz8PuMWuN+4Z5p71iE5tvMWtrysycjZtvpJoHqTb8=;
 b=MFzRgLfcO1fE8BtJGYgW7dy78r2oMlQTupaOww9NPc63xJJu1uJDO3pVnYO+xYi1fm
 IEktfJOgOtkUh7m4wKGu7QyFGM7h5ks522Wb8RsUs2ZP3ynI4Rlu2utFvcl6h28xhY88
 yE7PXh3P7VjWbRnm1Bg1d+Q7Bkry3ejtzGRmh2gqDX+JDqMKH1hBbaABemGHiM5f40wN
 Rs7yW57OsSCERyHB71BCV/zQNMfNpq+vxuLWLeVnh4bsTs3MpwyW19NDFaSpLgv+UBNT
 fjJmwwNh083bMesydSKFwRKq5XVXvEWdJLhfsHIAMMWAaxJ+sDEhYfbFpDrFTu3Q91qH
 L1eQ==
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
Cc: jernej.skrabec@siol.net, Neil Armstrong <narmstrong@baylibre.com>,
 maxime.ripard@bootlin.com, jonas@kwiboo.se, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, hverkuil@xs4all.nl,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2l0aCB0aGUgWVVWNDIwIGhhbmRsaW5nLCB3ZSBjYW4gZHluYW1pY2FsbHkgc2V0dXAgdGhlIEhE
TUkgb3V0cHV0CnBpeGVsIGZvcm1hdCBkZXBlbmRpbmcgb24gdGhlIG1vZGUgYW5kIGNvbm5lY3Rv
ciBpbmZvLgpTbyBub3csIHdlIGNhbiBvdXRwdXQgaW4gWVVWNDQ0LCB3aGljaCBpcyB0aGUgbmF0
aXZlIHZpZGVvIHBpcGVsaW5lCmZvcm1hdCwgZGlyZWN0bHkgdG8gdGhlIEhETUkgU2luayBpZiBp
dCdzIHN1cHBvcnRlZCB3aXRob3V0Cm5lY2Vzc2FyaWx5IGludm9sdmluZyB0aGUgSERNSSBDb250
cm9sbGVyIENTQy4KClNpZ25lZC1vZmYtYnk6IE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJh
eWxpYnJlLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZHdfaGRtaS5jIHwg
MTMgKysrKysrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZHdfaGRt
aS5jIGIvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX2R3X2hkbWkuYwppbmRleCA1ZDY3ZTJi
ZWJhNTguLjhiZjlkYjdmMzlhNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lc29uL21l
c29uX2R3X2hkbWkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZHdfaGRtaS5j
CkBAIC03MjMsMTIgKzcyMywyMyBAQCBzdGF0aWMgaW50IG1lc29uX3ZlbmNfaGRtaV9lbmNvZGVy
X2F0b21pY19jaGVjayhzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIsCiAJc3RydWN0IGRybV9k
aXNwbGF5X21vZGUgKm1vZGUgPSAmY3J0Y19zdGF0ZS0+bW9kZTsKIAlib29sIGlzX2hkbWkyX3Np
bmsgPQogCQljb25uX3N0YXRlLT5jb25uZWN0b3ItPmRpc3BsYXlfaW5mby5oZG1pLnNjZGMuc3Vw
cG9ydGVkOworCWJvb2wgc3BlY2lmeV9vdXRfZm9ybWF0ID0gZmFsc2U7CisJdTMyIG91dF9mb3Jt
YXQ7CiAKIAlpZiAoZHJtX21vZGVfaXNfNDIwX29ubHkoaW5mbywgbW9kZSkgfHwKIAkgICAgKCFp
c19oZG1pMl9zaW5rICYmIGRybV9tb2RlX2lzXzQyMF9hbHNvKGluZm8sIG1vZGUpKSkKIAkJZHdf
aGRtaS0+aW5wdXRfYnVzX2Zvcm1hdCA9IE1FRElBX0JVU19GTVRfVVlZVllZOF8wXzVYMjQ7Ci0J
ZWxzZQorCWVsc2UgewogCQlkd19oZG1pLT5pbnB1dF9idXNfZm9ybWF0ID0gTUVESUFfQlVTX0ZN
VF9ZVVY4XzFYMjQ7CisJCWlmIChpbmZvLT5jb2xvcl9mb3JtYXRzICYgRFJNX0NPTE9SX0ZPUk1B
VF9ZQ1JDQjQ0NCkgeworCQkJb3V0X2Zvcm1hdCA9IE1FRElBX0JVU19GTVRfWVVWOF8xWDI0Owor
CQkJc3BlY2lmeV9vdXRfZm9ybWF0ID0gdHJ1ZTsKKwkJfQorCX0KKworCS8qIFNldCBhIGNvbm5l
Y3RvciBidXMgZm9ybWF0IGlmIHJlcXVpcmVkICovCisJZHJtX2Rpc3BsYXlfaW5mb19zZXRfYnVz
X2Zvcm1hdHMoaW5mbywgJm91dF9mb3JtYXQsCisJCQkJCSAoc3BlY2lmeV9vdXRfZm9ybWF0ID8g
MSA6IDApKTsKIAogCS8qIFNwZWNpZnkgdGhlIGVuY29kZXIgb3V0cHV0IGZvcm1hdCB0byB0aGUg
YnJpZGdlICovCiAJaWYgKCFkcm1fYnJpZGdlX2Zvcm1hdF9zZXQoZW5jb2Rlci0+YnJpZGdlLAot
LSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
