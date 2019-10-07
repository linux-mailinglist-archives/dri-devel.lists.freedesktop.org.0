Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CEBCED8B
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 22:33:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1A4289F6E;
	Mon,  7 Oct 2019 20:33:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C37B89F6E;
 Mon,  7 Oct 2019 20:33:28 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id q7so8876172pgi.12;
 Mon, 07 Oct 2019 13:33:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YIGB5rJKa3Nx+y5Yme8n/YvLb1Ib/S8pJqTx4xDiXH0=;
 b=ro0kTIySXuiSOJEOxCuJRpuD5VSzQhosWXCaP0vMrIuxJ69Zhe5IrJRz7UhSh+d1fD
 5U/OV/Ow9iQXtKZuIFb6a+LBiGShy/LwXyoNtwWoEmRQBFBO6qkSJsJOnNhRTy9InpTS
 aa+399x9Hzzw9ZPIofiyyFjBYJSb5N3aYOxv8oPIHZIWZKL2N9I/O0o/tem1Wj7am0/4
 eaMsFNpPNHo5SjBjIxaNtanMBMb5nGmmPuARmNNAc7V6FVsGg77URw1Jt6tWPoBdx+H8
 UHP8VV61ELVG5urbc5ahr5LAr3JL6rZaiov6qgqz+xfYC8VJtIGCRLfpnx4x5170UQNR
 Bn4w==
X-Gm-Message-State: APjAAAWgSEm5oQwHFEiQb66ii7E5TCNo4+HqdYq6J0Mo+q9jKyPTHfMq
 8kEY0Kl10EqMhk4JkwAOA4Fcq/yy
X-Google-Smtp-Source: APXvYqwavWe8oRsj1hCM4qAecyeDctcm+6+xa8gLklkRlAhhFJeuKwgfoVdYJtH1e+uIAY1L+UD0ZQ==
X-Received: by 2002:a65:4506:: with SMTP id n6mr32113258pgq.240.1570480407088; 
 Mon, 07 Oct 2019 13:33:27 -0700 (PDT)
Received: from localhost ([100.118.89.196])
 by smtp.gmail.com with ESMTPSA id c8sm16734359pfi.117.2019.10.07.13.33.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2019 13:33:26 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/msm: fix rd dumping for split-IB1
Date: Mon,  7 Oct 2019 13:31:07 -0700
Message-Id: <20191007203108.18667-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YIGB5rJKa3Nx+y5Yme8n/YvLb1Ib/S8pJqTx4xDiXH0=;
 b=LyU/jqzmdtoaohFHiEUWVKJU4XnVKA0WlP9CkJCjGUe0SV4/BIBd6pw8HXM8Pvd52O
 sH0slGqUYiWPO2+0ej9aBsJ7bnh6Kkoz4A1dZX2LpbyUF6i7m9zFdJZxCll6Bb92ONGX
 6iNbCXMJA3XM2jsBQ9rvunwFmrWAcxNuDdUtrPKEiDvyjGSa1Zt+zGoR185DFe68c1oM
 KlRLZWqU+lclAlAQR0uPCKsSq+AHb5kmSgeQjLur5WZZBS22/WrIkwSvZ2Rx/do5Y1c6
 mdNOsAiFcBzfoYx0NFPdGM5kcbSTc56hVnBEUPdO4Odli0WHT7gFXpvo6aUpSOVWLQmG
 QVZg==
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgoKV2hlbiBJQjEgaXMgc3Bs
aXQgaW50byBtdWx0aXBsZSBjbWQgYnVmZmVycywgd2UnZCBlbWl0IG11bHRpcGxlClJEX0NNRFNU
UkVBTV9BRERSIHBlciBzdWJtaXQuICBCdXQgYWZ0ZXIgdGhpcyBwYWNrZXQgaXMgaGFuZGxlZApi
eSB0aGUgY2ZmZHVtcCBwYXJzZXIsIGl0IHJlc2V0cyBpdCdzIGtub3duIGJ1ZmZlcnMgb24gdGhl
IG5leHQKR1BVQUREUiBwYWNrZXQsIHNvIHN1YnNlcXVlbnQgUkRfQ01EU1RSRUFNX0FERFIgcGFj
a2V0cyBmcm9tIHRoZQpzYW1lIHN1Ym1pdCB3b3VsZCBub3QgZmluZCB0aGVpciBidWZmZXJzLgoK
UmUtd29yayB0aGUgbG9vcCB0byBzbmFwc2hvdCBhbGwgYnVmZmVycyBiZWZvcmUgUkRfQ01EU1RS
RUFNX0FERFIKdG8gYXZvaWQgdGhpcyBwcm9ibGVtLgoKU2lnbmVkLW9mZi1ieTogUm9iIENsYXJr
IDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tc20vbXNtX3Jk
LmMgfCA2ICsrKysrLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vbXNtX3JkLmMgYi9kcml2ZXJz
L2dwdS9kcm0vbXNtL21zbV9yZC5jCmluZGV4IDc2ZDNmZGQxN2JmOC4uZjhmNjU0MzAxZGVmIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9yZC5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9tc20vbXNtX3JkLmMKQEAgLTM4Miw3ICszODIsNiBAQCB2b2lkIG1zbV9yZF9kdW1wX3N1
Ym1pdChzdHJ1Y3QgbXNtX3JkX3N0YXRlICpyZCwgc3RydWN0IG1zbV9nZW1fc3VibWl0ICpzdWJt
aXQsCiAJCQlzbmFwc2hvdF9idWYocmQsIHN1Ym1pdCwgaSwgMCwgMCk7CiAKIAlmb3IgKGkgPSAw
OyBpIDwgc3VibWl0LT5ucl9jbWRzOyBpKyspIHsKLQkJdWludDY0X3QgaW92YSA9IHN1Ym1pdC0+
Y21kW2ldLmlvdmE7CiAJCXVpbnQzMl90IHN6ZCAgPSBzdWJtaXQtPmNtZFtpXS5zaXplOyAvKiBp
biBkd29yZHMgKi8KIAogCQkvKiBzbmFwc2hvdCBjbWRzdHJlYW0gYm8ncyAoaWYgd2UgaGF2ZW4n
dCBhbHJlYWR5KTogKi8KQEAgLTM5MCw2ICszODksMTEgQEAgdm9pZCBtc21fcmRfZHVtcF9zdWJt
aXQoc3RydWN0IG1zbV9yZF9zdGF0ZSAqcmQsIHN0cnVjdCBtc21fZ2VtX3N1Ym1pdCAqc3VibWl0
LAogCQkJc25hcHNob3RfYnVmKHJkLCBzdWJtaXQsIHN1Ym1pdC0+Y21kW2ldLmlkeCwKIAkJCQkJ
c3VibWl0LT5jbWRbaV0uaW92YSwgc3pkICogNCk7CiAJCX0KKwl9CisKKwlmb3IgKGkgPSAwOyBp
IDwgc3VibWl0LT5ucl9jbWRzOyBpKyspIHsKKwkJdWludDY0X3QgaW92YSA9IHN1Ym1pdC0+Y21k
W2ldLmlvdmE7CisJCXVpbnQzMl90IHN6ZCAgPSBzdWJtaXQtPmNtZFtpXS5zaXplOyAvKiBpbiBk
d29yZHMgKi8KIAogCQlzd2l0Y2ggKHN1Ym1pdC0+Y21kW2ldLnR5cGUpIHsKIAkJY2FzZSBNU01f
U1VCTUlUX0NNRF9JQl9UQVJHRVRfQlVGOgotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
