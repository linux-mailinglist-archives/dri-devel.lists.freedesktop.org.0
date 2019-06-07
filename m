Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A133F38AAC
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 14:50:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95EFB89D52;
	Fri,  7 Jun 2019 12:50:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26F7889CD5;
 Fri,  7 Jun 2019 12:50:43 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id z23so1804421wma.4;
 Fri, 07 Jun 2019 05:50:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2IpMzv21zi/i5aOswxazxdECS2gQzcyfmft+Y6vYyCk=;
 b=EQ7yCPhseFFtnKl7TQLta/RCrRbUcr05Dz0MU/kySoDA91i+ZLj1sAk9ku5OPnaBym
 SVaLlYCLaIc6riaWsEd+dyLVx3/HOrzNFkB7Is/eRp4dSvw+R8VJCv44nGY1MVIi5nZ+
 EGNMQj3aTic6S06caeq7xN0PCYTLLZWY8gA/8JZCQbbC9BfvYg8ZnpK17hCfZcHVGYXz
 20mxtM3sUJgO2R+acqZDdv7cSKU9c1fbHdesekE1rz2jtqZTyQQdMhjtj/YI6iImtJOP
 sz3hBaXDyTwhlFxxzJgFccdtfu82t+Mr6jFn08YWyLU0uYgUtalfVwf7yxZ0cRx7Nk38
 cOBg==
X-Gm-Message-State: APjAAAXPtSs3OLdjZgM0i3L05/C9Xt7VXx7kNqIFspFXmFxXxb+n5tw+
 ZrYgZ20l2AU8omOsev6c/luzbbum
X-Google-Smtp-Source: APXvYqwIQUNt2CoqghJaQe5aB9Vddu5qXyq1/yzRUX/BI4SDj8/cY5xTUsFi+76aVIYEwn9x4Pnc1A==
X-Received: by 2002:a1c:f713:: with SMTP id v19mr3535086wmh.159.1559911841713; 
 Fri, 07 Jun 2019 05:50:41 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:c5a0:21d3:d7e7:98b7])
 by smtp.gmail.com with ESMTPSA id 32sm3923249wra.35.2019.06.07.05.50.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 07 Jun 2019 05:50:41 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel.vetter@ffwll.ch
Subject: [PATCH 2/6] drm/ttm: remove the backing store if no placement is given
Date: Fri,  7 Jun 2019 14:50:35 +0200
Message-Id: <20190607125039.2240-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190607125039.2240-1-christian.koenig@amd.com>
References: <20190607125039.2240-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=2IpMzv21zi/i5aOswxazxdECS2gQzcyfmft+Y6vYyCk=;
 b=WiOcX6U1bq8OY92YXylACYLenOGY80ymm/FLwguyTnw5EdIjY0HWGHCoe03mAvIoI3
 5E/iwy2rD+MBt/T7N1QSAzzn3uoQFp2C6Zml2LYB44hVNHZWpKL7X8L4e7alORSo4+PY
 y+yL8vjGYQ3y4ykHK9szpjS5r999oJWqBF/gETpL1bQfa9MFDiF7FQuSa/QpgedrkHWH
 mFyHKMpqtobN02Pdj7f4kU7UWmDNC1tG3F9Sx9/M1+U/vfNO6lulpy4A2LGkn813/7N7
 UIbnVOgEhvOWudAnbGzo73aweJwcnhvzEExDGCZQV8+FOn0LuhlT2r77FER0S4irasA3
 OxaA==
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
