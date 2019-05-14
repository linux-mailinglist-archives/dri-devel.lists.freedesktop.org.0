Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7AA1C8BA
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2019 14:31:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE92A892E7;
	Tue, 14 May 2019 12:31:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4134D892DE;
 Tue, 14 May 2019 12:31:33 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id h11so2595688wmb.5;
 Tue, 14 May 2019 05:31:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Jax3QxH+T6ehnU173TlYvvZDmZDjXPZ+6UmbLIJaZWo=;
 b=j3CWIHsjkJuL5RoIR42RgMSEPVu+2TfIynP0vcL5q0wZaIxza6LsEEfJTFi5c+x4vo
 DB4wxk+OKwDI9e2gkRhEqIyBcY4F/patzb9nzKZD/uAr7TLG9ch2xGFczqqxYTUsCNZG
 ykOPk1i/Ak8FP8G9NSIddeqoQ6iEzK5TNWUP8RHoo7rbpZc2AK6HyjxHj1pmNA0/rEv3
 i+EJAwrL9v5hjUdKaTQhrAK78hnj1GEVIrcRDUBFPgpxk7QMCV7hqDeMjQTFJd0HkdI1
 jiDTVjbWtxEHIVdTYXqDx2iU7Nq5Kun1rH9FPEQlYdf72lCvWo7FIXoGe4/J+ul5W9fy
 O0CA==
X-Gm-Message-State: APjAAAWkca1E7ONfI/+yXWCyj6QQoll60Nu+qYvMLIx+XcvqjgmX7vYd
 pWbtX64DvRn+GwEEShpU6htUpQ87
X-Google-Smtp-Source: APXvYqyXXG8uVpeiW7JGwQ2mBz3pgh07oVN+gvgSXEHQiBaVHQmktT/GIm3Axw0QgrUBd5ayVVpTfQ==
X-Received: by 2002:a7b:ce83:: with SMTP id q3mr18377522wmj.32.1557837092060; 
 Tue, 14 May 2019 05:31:32 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:7d94:f6f9:368b:5a3b])
 by smtp.gmail.com with ESMTPSA id n4sm6128704wmb.22.2019.05.14.05.31.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 14 May 2019 05:31:31 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: Marek.Olsak@amd.com, David1.Zhou@amd.com, Prike.Liang@amd.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: [PATCH 03/11] drm/ttm: remove the backing store if no placement is
 given
Date: Tue, 14 May 2019 14:31:19 +0200
Message-Id: <20190514123127.1650-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190514123127.1650-1-christian.koenig@amd.com>
References: <20190514123127.1650-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Jax3QxH+T6ehnU173TlYvvZDmZDjXPZ+6UmbLIJaZWo=;
 b=OtCe2K2pgklHzYTBqtSgqw9aRt8cBK7tbhTAOYArIeTdRDAY9n1TWtJnNRHkPI/owv
 C9XTtEjxwGUjtOD2/E65CJa3qb3TknR3ndYP8/c0PvFAVjvIO4uXs4oGjnONPY+VNCvF
 clpHlChCcQw6lwhH3cRb3980r2k3cv2+khfkPDGX/+IzvhEegjj2vX0hr2xjS/4HHdRO
 ZtDUJE+fFLrAVjUgqrHATPg69AYc9fB3ZpAmKNct88VJ6AGsHCKSqgfjF0sqReaJvL5G
 yKqWdpYeKF6aLhMvnqgtXVffMCFnaSlt+rWiPj3zyS6JFfQMSuwEDRr3eS0gO7QiR4C0
 MPYA==
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
cy9ncHUvZHJtL3R0bS90dG1fYm8uYwppbmRleCBlNjM0ZDNhMzY5MjMuLjZlOWZmOTRhMDg1ZCAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vdHRtL3R0bV9iby5jCkBAIC0xMjM3LDYgKzEyMzcsMTggQEAgaW50IHR0bV9ib192YWxp
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
