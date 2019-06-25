Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF5554F34
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 14:47:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C5D46E0F9;
	Tue, 25 Jun 2019 12:47:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B16866E0F0;
 Tue, 25 Jun 2019 12:46:59 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id x4so17713468wrt.6;
 Tue, 25 Jun 2019 05:46:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2IpMzv21zi/i5aOswxazxdECS2gQzcyfmft+Y6vYyCk=;
 b=PTEH18HqwxCVOJPNekwwrEjiIWFSot8RH14HI90iXdY3ljETDPLJG5kZ+lEvtVl/KQ
 RpwJhZjw5zx5stHW3u+lJxMrnFnkO/0V6wZyOAdUfo31MnouZ50DaHnTX1sNLtxtY4nd
 nuRxnXLPPpR7k25r9vS38c3EzILtwLgGELTpPq2b2TejI7T4hrwO4LpNq6LlzI6GehjM
 mvJcWJmlidhuKQXPQPRf3GAXEjG+/c3Tzt7dlhAYLjAal0b6djfdOQ1VXldF/d1LVdYO
 o8ubGnHom+5qdt+5hkq3wO9YJTBmuIB0w9WoRarZHrZ2HcS2oYMUQ9VOo/lFfQO914yE
 5ekA==
X-Gm-Message-State: APjAAAUdHt9zw9/Ou+zZpCgLccCi8vukjFY6Uig9H3HhAX+txHcpwTmA
 cMmWhwOIJwzVgm3J7XSSnfWheBy4
X-Google-Smtp-Source: APXvYqzZ9YlpwUUa67DDqcBWbmGHDy1z2G1uCxN/B9ttno3WG9uVuSL+GdCdR7B9XBmeH+pPQQE5wg==
X-Received: by 2002:adf:f181:: with SMTP id h1mr19997033wro.18.1561466818347; 
 Tue, 25 Jun 2019 05:46:58 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:2df2:5da:22f9:1506])
 by smtp.gmail.com with ESMTPSA id y184sm2334231wmg.14.2019.06.25.05.46.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 25 Jun 2019 05:46:57 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/6] drm/ttm: remove the backing store if no placement is given
Date: Tue, 25 Jun 2019 14:46:50 +0200
Message-Id: <20190625124654.122364-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190625124654.122364-1-christian.koenig@amd.com>
References: <20190625124654.122364-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=2IpMzv21zi/i5aOswxazxdECS2gQzcyfmft+Y6vYyCk=;
 b=mrqytE7e+Ggr/WCczdHIaGcH67Ti/wYOYYIaOshTCZxtM5ZZGbqbPEXOIQdPUGkcr9
 Hc8JDWsKhkOpH0E4bsEH0yiIgtGWNAr2dhha2YyZsAQQ0C2ApBEdQ4//kehYLMhUGp9H
 xUAE1TCuK6v9EHf/b4Lw/L/LB2ws76J6KHPNIkf5YeGnGpC4Gqme/7Qfnq6TzgBYW46N
 Ap3DZJ+HvNon7i/u1vagMhsSNISvYRj+x2US7SKWpDEqvhYuMTHDYkA92MPHjAyZ+Ylo
 k+JtRHYTWkthPGxN1yQfY608kJQYPHw/HYaHKbChsix04iZSaAqms9f7XM6bxZTqVFhm
 5dEA==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UGlwZWxpbmUgcmVtb3ZhbCBvZiB0aGUgQk9zIGJhY2tpbmcgc3RvcmUgd2hlbiBubyBwbGFjZW1l
bnQgaXMgZ2l2ZW4KZHVyaW5nIHZhbGlkYXRpb24uCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4g
S8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3R0
bS90dG1fYm8uYyB8IDEyICsrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jIGIvZHJpdmVy
cy9ncHUvZHJtL3R0bS90dG1fYm8uYwppbmRleCBjN2RlNjY3ZDQ4MmEuLjY4MmExYTAzNWIzNSAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vdHRtL3R0bV9iby5jCkBAIC0xMjQwLDYgKzEyNDAsMTggQEAgaW50IHR0bV9ib192YWxp
ZGF0ZShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAogCXVpbnQzMl90IG5ld19mbGFnczsK
IAogCXJlc2VydmF0aW9uX29iamVjdF9hc3NlcnRfaGVsZChiby0+cmVzdik7CisKKwkvKgorCSAq
IFJlbW92ZSB0aGUgYmFja2luZyBzdG9yZSBpZiBubyBwbGFjZW1lbnQgaXMgZ2l2ZW4uCisJICov
CisJaWYgKCFwbGFjZW1lbnQtPm51bV9wbGFjZW1lbnQgJiYgIXBsYWNlbWVudC0+bnVtX2J1c3lf
cGxhY2VtZW50KSB7CisJCXJldCA9IHR0bV9ib19waXBlbGluZV9ndXR0aW5nKGJvKTsKKwkJaWYg
KHJldCkKKwkJCXJldHVybiByZXQ7CisKKwkJcmV0dXJuIHR0bV90dF9jcmVhdGUoYm8sIGZhbHNl
KTsKKwl9CisKIAkvKgogCSAqIENoZWNrIHdoZXRoZXIgd2UgbmVlZCB0byBtb3ZlIGJ1ZmZlci4K
IAkgKi8KLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
