Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED305B191
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2019 22:37:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 014FC89DEC;
	Sun, 30 Jun 2019 20:37:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE0CF89DBC;
 Sun, 30 Jun 2019 20:37:00 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id p15so12533986qtl.3;
 Sun, 30 Jun 2019 13:37:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8APoQ9tZU7X1UIGwGdNOM/HXlIAPWX8EBWLqslvtxlM=;
 b=BrIFbVcH/1+HpK3UnkspERKSqLX4mDTRanNYQmQ2mHXkljR1TeD4bf8NXli8Z+HdzD
 m6GXCqNvw0hFhwr+YBL/Vg7cHyd8CR6pctbLG4TbwfdEOYb8fkJiA6Dxt/zmQDVPusuF
 iszXFdGhtoiRDWlY5Fd+qSZ0kA5jFaAvZpB+NHbcxrzE+2nAO28ybesRs5dSiVnLIYPh
 sv7s850pWkmjysWoZBgbN6lRr9HLxplmk/ksD5Z7gcz0nmEqXkJsCUfQ4+y6ChiVX0LW
 YmXkNK009ekIM2iodAw024TGNZc6y1v4qp9ApLC10l2TdqcC1dwEzi38QnAMwEXObQNl
 q4bQ==
X-Gm-Message-State: APjAAAUvpgmCmyAwCnfykoGbQZEX33cYGQG1pMtk/vDT4bhkGmyzInmF
 dWdSzsGdDfm7thq0dS2TiLUhTk3jg6NLrQ==
X-Google-Smtp-Source: APXvYqwxwquSsHnIcky5zw5j12bwbckaOicNC38h2rTq/yBmIuBNSXDXUcizer8wonP7Iwt/XdyKaQ==
X-Received: by 2002:ac8:25b1:: with SMTP id e46mr17548583qte.36.1561927019833; 
 Sun, 30 Jun 2019 13:36:59 -0700 (PDT)
Received: from localhost ([2601:184:4780:7861:5010:5849:d76d:b714])
 by smtp.gmail.com with ESMTPSA id u71sm4204966qka.21.2019.06.30.13.36.59
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 30 Jun 2019 13:36:59 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 4/4] drm/bridge: ti-sn65dsi86: use helper to lookup panel-id
Date: Sun, 30 Jun 2019 13:36:08 -0700
Message-Id: <20190630203614.5290-5-robdclark@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190630203614.5290-1-robdclark@gmail.com>
References: <20190630203614.5290-1-robdclark@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8APoQ9tZU7X1UIGwGdNOM/HXlIAPWX8EBWLqslvtxlM=;
 b=d3z4n1Elaz6sMd0HfkAc3L/Jg3jRjJ3q5MVg9+j6BpET2WfEXXMsF8q8eZOGVEz4Cv
 xhQ8lgdI0SF9RuqqESt3FMcumyI8AcOVyCTG7OVXeZYfqvRoyeiaj5bIzxw6tuH+030F
 jQqUdDEaeAZi6g8sHMxNKT+F4dx840TIZMBcDr+ui4iCrOvc1Nlz2H8Z7yUEeO8psXp5
 u5wfiZ30TZvqzkqko8jUpIaK8cgrgdx+SlycR2b+td26EN8mY/ZT+vACywSbRSH+27ZU
 9bSdtPa+JtZc8nXkJWmSBZX3XCqMcJ1QXeRIV4KZtmE1WduVtA1ph1QFllGNx9yTBQmy
 5RKg==
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
Cc: Rob Clark <robdclark@chromium.org>, aarch64-laptops@lists.linaro.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgoKVXNlIHRoZSBkcm1fb2Zf
ZmluZF9wYW5lbF9pZCgpIGhlbHBlciB0byBkZWNpZGUgd2hpY2ggZW5kcG9pbnQgdG8gdXNlCndo
ZW4gbG9va2luZyB1cCBwYW5lbC4gIFRoaXMgd2F5IHdlIGNhbiBzdXBwb3J0IGRldmljZXMgdGhh
dCBoYXZlCm11bHRpcGxlIHBvc3NpYmxlIHBhbmVscywgc3VjaCBhcyB0aGUgYWFyY2g2NCBsYXB0
b3BzLgoKU2lnbmVkLW9mZi1ieTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktc242NWRzaTg2LmMgfCA1ICsrKy0tCiAxIGZp
bGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktc242NWRzaTg2LmMgYi9kcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL3RpLXNuNjVkc2k4Ni5jCmluZGV4IDI3MTlkOWMwODY0Yi4uNTZjNjZhNDNmMWE2IDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXNuNjVkc2k4Ni5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktc242NWRzaTg2LmMKQEAgLTc5MCw3ICs3OTAsNyBAQCBz
dGF0aWMgaW50IHRpX3NuX2JyaWRnZV9wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50LAog
CQkJICAgICAgY29uc3Qgc3RydWN0IGkyY19kZXZpY2VfaWQgKmlkKQogewogCXN0cnVjdCB0aV9z
bl9icmlkZ2UgKnBkYXRhOwotCWludCByZXQ7CisJaW50IHJldCwgcGFuZWxfaWQ7CiAKIAlpZiAo
IWkyY19jaGVja19mdW5jdGlvbmFsaXR5KGNsaWVudC0+YWRhcHRlciwgSTJDX0ZVTkNfSTJDKSkg
ewogCQlEUk1fRVJST1IoImRldmljZSBkb2Vzbid0IHN1cHBvcnQgSTJDXG4iKTsKQEAgLTgxMSw3
ICs4MTEsOCBAQCBzdGF0aWMgaW50IHRpX3NuX2JyaWRnZV9wcm9iZShzdHJ1Y3QgaTJjX2NsaWVu
dCAqY2xpZW50LAogCiAJcGRhdGEtPmRldiA9ICZjbGllbnQtPmRldjsKIAotCXJldCA9IGRybV9v
Zl9maW5kX3BhbmVsX29yX2JyaWRnZShwZGF0YS0+ZGV2LT5vZl9ub2RlLCAxLCAwLAorCXBhbmVs
X2lkID0gZHJtX29mX2ZpbmRfcGFuZWxfaWQoKTsKKwlyZXQgPSBkcm1fb2ZfZmluZF9wYW5lbF9v
cl9icmlkZ2UocGRhdGEtPmRldi0+b2Zfbm9kZSwgMSwgcGFuZWxfaWQsCiAJCQkJCSAgJnBkYXRh
LT5wYW5lbCwgTlVMTCk7CiAJaWYgKHJldCkgewogCQlEUk1fRVJST1IoImNvdWxkIG5vdCBmaW5k
IGFueSBwYW5lbCBub2RlXG4iKTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
