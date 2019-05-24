Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4ACC29612
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2019 12:41:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B4BD89FE8;
	Fri, 24 May 2019 10:41:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C72789FE8
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 10:41:49 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id 33so1890181pgv.9
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 03:41:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y5swjDHGKG+ezs/+w53g29T0/qBVH9yKlg23nn55c5E=;
 b=VG4LRJWKnpPhJexXXBSpRkyBKAH5pPbynd2hKdeBR0LE7Nz3z7IgFnIugTYWP+ciX3
 jAU7vIRGhgz2JtVVTuKSTeSVYz/hWOPmEpWZUr40BwszKw0UEOEU4w/N/zwWHKI7nHle
 vvghfNN4+O+nYvpnokRIm0cXhyqAjNdfB6kGZZ1yHnAX6fbEnkaiWM4zBQaVvaSrBMmn
 kdOn0uM3sgw+6aRhu6A5TVS8d+7VfuWq14gtxebq8906KyZz2ubl8Y/RWzsFYL5MxMtT
 h7Y/THBEv0GArcMr/Bs9MfXtn36XY3yzoHTzB56GNphohy5+hXk+T0ap1nmDHCgJ606o
 KSKQ==
X-Gm-Message-State: APjAAAXwaNMX8xVE3tt35tzCQKzoOcwnMdOc2OYcawF6qAOMwnOUrUKL
 dVgZ+d8f+q6xlESf1AbkcMyT+Q==
X-Google-Smtp-Source: APXvYqyvPrCWj4wLzn1Yd+9CbYrQKIVeghMZMryVtTFYZMAHt18ZSgOULimYpUVkB3YXKeqkBNPeBw==
X-Received: by 2002:a63:9d8d:: with SMTP id
 i135mr104296236pgd.245.1558694509078; 
 Fri, 24 May 2019 03:41:49 -0700 (PDT)
Received: from localhost.localdomain ([183.82.227.60])
 by smtp.gmail.com with ESMTPSA id m72sm6550113pjb.7.2019.05.24.03.41.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 May 2019 03:41:48 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@bootlin.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v2 1/6] drm/sun4i: dsi: Use drm panel_or_bridge call
Date: Fri, 24 May 2019 16:11:10 +0530
Message-Id: <20190524104115.20161-2-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20190524104115.20161-1-jagan@amarulasolutions.com>
References: <20190524104115.20161-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y5swjDHGKG+ezs/+w53g29T0/qBVH9yKlg23nn55c5E=;
 b=U3C+2Pkv2aIG9zWer39/ZGLeS4wd7ty00L8nRwq2xSL9FzpzYmJ8/WtIyJFRadmuQc
 DTP0KxyKCLyYHEAPVI55+6VrkoniAOF48Vl9Wj50Veq/wZPJat9/g22LGvoecBk8SR7s
 r9+EN1shbjhX2kn0bCjSZ2tUp8JHkSf1kS7r8=
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 linux-sunxi@googlegroups.com, Jagan Teki <jagan@amarulasolutions.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmlnaHQgbm93IHRoZSBkcml2ZXIgaXMgZmluZGluZyB0aGUgcGFuZWwgdXNpbmcgb2ZfZHJtX2Zp
bmRfcGFuZWwsCnJlcGxhY2UgdGhlIHNhbWUgd2l0aCBkcm1fb2ZfZmluZF9wYW5lbF9vcl9icmlk
Z2Ugd2hpY2ggd291bGQgaGVscAp0byBmaW5kIHRoZSBwYW5lbCBvciBicmlkZ2Ugb24gdGhlIHNh
bWUgY2FsbCBpZiBicmlkZ2Ugc3VwcG9ydCBhZGRlZAppbiBmdXR1cmUuCgpBZGRlZCBOVUxMIGlu
IGJyaWRnZSBhcmd1bWVudCwgc2FtZSB3aWxsIHJlcGxhY2Ugd2l0aCBicmlkZ2UgcGFyYW1ldGVy
Cm9uY2UgYnJpZGdlIHN1cHBvcnRlZC4KCkNjOiBQYXVsIEtvY2lhbGtvd3NraSA8cGF1bC5rb2Np
YWxrb3dza2lAYm9vdGxpbi5jb20+ClNpZ25lZC1vZmYtYnk6IEphZ2FuIFRla2kgPGphZ2FuQGFt
YXJ1bGFzb2x1dGlvbnMuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW42aV9taXBp
X2RzaS5jIHwgOSArKysrKystLS0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDMg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjZpX21p
cGlfZHNpLmMgYi9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNmlfbWlwaV9kc2kuYwppbmRleCA2
NTc3MWU5YTM0M2EuLmFlMmZlMzFiMDViMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3N1
bjRpL3N1bjZpX21pcGlfZHNpLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjZpX21p
cGlfZHNpLmMKQEAgLTIxLDYgKzIxLDcgQEAKICNpbmNsdWRlIDxkcm0vZHJtUC5oPgogI2luY2x1
ZGUgPGRybS9kcm1fYXRvbWljX2hlbHBlci5oPgogI2luY2x1ZGUgPGRybS9kcm1fbWlwaV9kc2ku
aD4KKyNpbmNsdWRlIDxkcm0vZHJtX29mLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9wYW5lbC5oPgog
I2luY2x1ZGUgPGRybS9kcm1fcHJvYmVfaGVscGVyLmg+CiAKQEAgLTk2NCwxMSArOTY1LDEzIEBA
IHN0YXRpYyBpbnQgc3VuNmlfZHNpX2F0dGFjaChzdHJ1Y3QgbWlwaV9kc2lfaG9zdCAqaG9zdCwK
IAkJCSAgICBzdHJ1Y3QgbWlwaV9kc2lfZGV2aWNlICpkZXZpY2UpCiB7CiAJc3RydWN0IHN1bjZp
X2RzaSAqZHNpID0gaG9zdF90b19zdW42aV9kc2koaG9zdCk7CisJaW50IHJldDsKIAogCWRzaS0+
ZGV2aWNlID0gZGV2aWNlOwotCWRzaS0+cGFuZWwgPSBvZl9kcm1fZmluZF9wYW5lbChkZXZpY2Ut
PmRldi5vZl9ub2RlKTsKLQlpZiAoSVNfRVJSKGRzaS0+cGFuZWwpKQotCQlyZXR1cm4gUFRSX0VS
Uihkc2ktPnBhbmVsKTsKKwlyZXQgPSBkcm1fb2ZfZmluZF9wYW5lbF9vcl9icmlkZ2UoaG9zdC0+
ZGV2LT5vZl9ub2RlLCAwLCAwLAorCQkJCQkgICZkc2ktPnBhbmVsLCBOVUxMKTsKKwlpZiAocmV0
KQorCQlyZXR1cm4gcmV0OwogCiAJZGV2X2luZm8oaG9zdC0+ZGV2LCAiQXR0YWNoZWQgZGV2aWNl
ICVzXG4iLCBkZXZpY2UtPm5hbWUpOwogCi0tIAoyLjE4LjAuMzIxLmdmZmM2ZmEwZTMKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
