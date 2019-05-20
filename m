Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCB722FBE
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2019 11:07:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CC9E89312;
	Mon, 20 May 2019 09:07:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CB9A89310
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 09:07:50 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id v80so6909569pfa.3
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 02:07:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l8/eiiMRzRHMeJJfg+NtIFfqaA+aEUt7A5oo1QrAYME=;
 b=SmqVv4ArDakxT/Ykb+lqR7tr88M2OvlCr6BMV4dA6bx4lddd4ik1A+V7OF1NdgFan/
 untl3mXmpJ5vnbfrW5W5FRjYTislEQEQokxGo7JJa8KmQXS7yuGoY+idj50LaUe9C7Mc
 DpvJKqgQDpY3ufxUKDPf/FAC8QLGtOPFXh08V/HeuDr++O/zIUExoLK7wa2iU7OZLeop
 jPspdWUng2wS6YIQKlbkX2HEgwP7SH9vwF1DZ76IRygfTs+n/wQJpwt4qskr2BCG1ChB
 rZTcOLvXbPFkF1Bz4u/Vb+2isKxG1bEhIfjWz0197jG27cXbozcgs700LSC/XCke6xWD
 wvrA==
X-Gm-Message-State: APjAAAX4JtNumBiDBGj+Lu97gjapv57sq9vqYVYEm9WtzADCi0DcqjA9
 NBLvTLbbHHcVnY2Sp/LMM6ay3w==
X-Google-Smtp-Source: APXvYqwLHvSwqQ0wDLSPdTFaZir99tjNhatCm3penvvdzh6SsenDaTxMVKo4xU4l8s1GExXu5p1q5Q==
X-Received: by 2002:a62:51c2:: with SMTP id f185mr18546991pfb.16.1558343269570; 
 Mon, 20 May 2019 02:07:49 -0700 (PDT)
Received: from localhost.localdomain ([183.82.227.193])
 by smtp.gmail.com with ESMTPSA id d15sm51671614pfm.186.2019.05.20.02.07.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 May 2019 02:07:49 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v10 07/11] drm/sun4i: dsi: Get tcon0_div at runtime
Date: Mon, 20 May 2019 14:33:14 +0530
Message-Id: <20190520090318.27570-8-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20190520090318.27570-1-jagan@amarulasolutions.com>
References: <20190520090318.27570-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l8/eiiMRzRHMeJJfg+NtIFfqaA+aEUt7A5oo1QrAYME=;
 b=izXs0xnF9WrDgcEPHUWlWp9gc4k0omlI5ON8oHnDXGfiCLU6GPTMi1TD53H72OhRJ9
 07OMMo1ZEK+83bw3/ptHwy7G9/QEAx4InSSgtV6dQkAuKRvQpPcDFEGDovibhbsGZ46q
 q87tXjbcR5kzwiL8RKIASnKXgb7PvMxBB0tQA=
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
Cc: bshah@mykolab.com, powerpan@qq.com, Vasily Khoruzhick <anarsoul@gmail.com>,
 linux-sunxi@googlegroups.com, Jagan Teki <jagan@amarulasolutions.com>,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dGNvbjAgZGl2aWRlciBpcyB1c2VkIHdoaWxlIGNvbXB1dGluZyBkcnEgZWRnZTAgZm9yIGJ1cnN0
IG1vZGUKZGV2aWNlcywgY3VycmVudGx5IGRyaXZlciBpcyB1c2luZyBkZWZhdWx0IG1hY3JvIHZh
bHVlIDQgdmlhClNVTjZJX0RTSV9UQ09OX0RJVi4KClVuZm9ydHVuYXRlbHkgbm90IGFsbCB0aGUg
cGFuZWwgZGV2aWNlcyBhcmUgd29ya2luZyB3aXRoIHRoaXMKZGVmYXVsdCBkaXZpZGVyIHZhbHVl
IDQsIHNvIHRvIG1ha2UgZnV0dXJlIGNoYW5nZXMgb24gdGhpcyBkaXZpZGVyCnZhbHVlIGdldCB0
aGUgZGl2aWRlciBmcm9tIHRjb24gZG90IGNsb2NrIGF0IHJ1bnRpbWUgaW5zdGVhZCBvZgpzdGF0
aWMgbWFjcm8gdmFsdWUuCgpUZXN0ZWQtYnk6IE1lcmxpam4gV2FqZXIgPG1lcmxpam5Ad2l6enVw
Lm9yZz4KU2lnbmVkLW9mZi1ieTogSmFnYW4gVGVraSA8amFnYW5AYW1hcnVsYXNvbHV0aW9ucy5j
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjZpX21pcGlfZHNpLmMgfCA4ICsrKysr
KystCiBkcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNmlfbWlwaV9kc2kuaCB8IDIgLS0KIDIgZmls
ZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW42aV9taXBpX2RzaS5jIGIvZHJpdmVycy9ncHUvZHJt
L3N1bjRpL3N1bjZpX21pcGlfZHNpLmMKaW5kZXggMWY5ZWQyNjQyYTQ3Li41NTg0ZTljMmY4YmQg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW42aV9taXBpX2RzaS5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW42aV9taXBpX2RzaS5jCkBAIC0zOTYsOSArMzk2LDE1
IEBAIHN0YXRpYyB1MTYgc3VuNmlfZHNpX2dldF9kcnFfZWRnZTAoc3RydWN0IHN1bjZpX2RzaSAq
ZHNpLAogCQkJCSAgIHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICptb2RlLAogCQkJCSAgIHUxNiBs
aW5lX251bSwgdTE2IGVkZ2UxKQogeworCXN0cnVjdCBzdW40aV90Y29uICp0Y29uID0gZHNpLT50
Y29uOworCXVuc2lnbmVkIGxvbmcgZGNsa19yYXRlLCBkY2xrX3BhcmVudF9yYXRlLCB0Y29uMF9k
aXY7CiAJdTE2IGVkZ2UwID0gZWRnZTE7CiAKLQllZGdlMCArPSAobW9kZS0+aGRpc3BsYXkgKyA0
MCkgKiBTVU42SV9EU0lfVENPTl9ESVYgLyA4OworCWRjbGtfcmF0ZSA9IGNsa19nZXRfcmF0ZSh0
Y29uLT5kY2xrKTsKKwlkY2xrX3BhcmVudF9yYXRlID0gY2xrX2dldF9yYXRlKGNsa19nZXRfcGFy
ZW50KHRjb24tPmRjbGspKTsKKwl0Y29uMF9kaXYgPSBkY2xrX3BhcmVudF9yYXRlIC8gZGNsa19y
YXRlOworCisJZWRnZTAgKz0gKG1vZGUtPmhkaXNwbGF5ICsgNDApICogdGNvbjBfZGl2IC8gODsK
IAogCWlmIChlZGdlMCA+IGxpbmVfbnVtKQogCQlyZXR1cm4gZWRnZTAgLSBsaW5lX251bTsKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW42aV9taXBpX2RzaS5oIGIvZHJpdmVy
cy9ncHUvZHJtL3N1bjRpL3N1bjZpX21pcGlfZHNpLmgKaW5kZXggZjI4MjZlM2VhMTY1Li4xNTY1
MjM4NTlkODIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW42aV9taXBpX2Rz
aS5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW42aV9taXBpX2RzaS5oCkBAIC0xMyw4
ICsxMyw2IEBACiAjaW5jbHVkZSA8ZHJtL2RybV9lbmNvZGVyLmg+CiAjaW5jbHVkZSA8ZHJtL2Ry
bV9taXBpX2RzaS5oPgogCi0jZGVmaW5lIFNVTjZJX0RTSV9UQ09OX0RJVgk0Ci0KIHN0cnVjdCBz
dW42aV9kc2kgewogCXN0cnVjdCBkcm1fY29ubmVjdG9yCWNvbm5lY3RvcjsKIAlzdHJ1Y3QgZHJt
X2VuY29kZXIJZW5jb2RlcjsKLS0gCjIuMTguMC4zMjEuZ2ZmYzZmYTBlMwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
