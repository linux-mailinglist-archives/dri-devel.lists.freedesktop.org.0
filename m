Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 686BF30F544
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 15:44:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D82F6EDAA;
	Thu,  4 Feb 2021 14:44:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C367E6ED9E;
 Thu,  4 Feb 2021 14:44:09 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id p20so5708049ejb.6;
 Thu, 04 Feb 2021 06:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sI5Xx9sXdttCuc/NSm6XPnvA3BNtGEy54J3cHUYWLxE=;
 b=LqDXQpeDstopI+6O+01N5VP4J2hchdz0CTdyaj8ja7p6uconM9ldvYoqna3VGN4leh
 z2lQcEvBKu9TJdzprgafIt0uBZL2Y2uHFauiv2WDpNKIkRjC/AKrXitXHQ+/0PhU/0EI
 t4I5cfUm7NnRmgQfPpHBfBwkhvQ9gv2vfcs5QOFzz30SedigxT8S1wQau+2eOyhRKvCX
 W16kWARntVxgrywxE/wmucw/qe7OQ63X2ZdJHElRV3nI7jFy+t1l/gDMzt2rvpvKUzbh
 Q2EbYJk2HnSV7WFxYwFZPsGuxwAvif3UwmtGC3h7q/dLcIL0hhNxP7mLxRC/JO6C7T61
 XKIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sI5Xx9sXdttCuc/NSm6XPnvA3BNtGEy54J3cHUYWLxE=;
 b=XGmXHFWkskfs020DNS/jobA4etuZV23tCwjtnmbvEvk9xNnEQE5o3AF+cVzwsq51z8
 2pe3Goq/RpkSBYjkBnuiJ5mPl5nUUtQG058hlKjHYnp0iriHXMbAkul6jYzGt/iVqVNu
 4FEe6FR1mTqANZwTW24b/TjcwjioCSC05A1R+X7hdIcw0U0sEQvp7Bl+ZT2DOzh2cOMI
 L8ult1T9xQZHirTtQjAQII36SdHKHnjrVtrKBErLXcxqtHSrb5tgp9A6GSvit78i8Zdh
 bW6AZDBJPTV6SFPCAnWZYcUQypqgvQVdp9Z59DIjLb+PIee8VWLS50p5GFw0b29vriV1
 uc/w==
X-Gm-Message-State: AOAM530GMd7mSQ0nvGFF1cGVkN+r5tKhPxjKpG3TvD8obnAMAC0crYgt
 Wz/2seZnf+CDA1DM/rT59gh56sD9fj8=
X-Google-Smtp-Source: ABdhPJyh8GSS3PCmqTaCuTFGdk5wpebbHhuEYBfUumutZoisCfDEtFxEVJGi42C28eXFI372hcjI9A==
X-Received: by 2002:a17:906:7687:: with SMTP id
 o7mr8242251ejm.209.1612449848490; 
 Thu, 04 Feb 2021 06:44:08 -0800 (PST)
Received: from abel.fritz.box ([2a02:908:1252:fb60:db9a:1ee8:e47:9603])
 by smtp.gmail.com with ESMTPSA id g14sm2613610edm.31.2021.02.04.06.44.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 06:44:08 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/amdgpu: share scheduler score on VCN3 instances
Date: Thu,  4 Feb 2021 15:44:05 +0100
Message-Id: <20210204144405.2737-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204144405.2737-1-christian.koenig@amd.com>
References: <20210204144405.2737-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Leo.Liu@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIFZDTjMgaW5zdGFuY2VzIGNhbiBkbyBib3RoIGRlY29kZSBhcyB3ZWxsIGFzIGVuY29kZS4K
ClNoYXJlIHRoZSBzY2hlZHVsZXIgbG9hZCBiYWxhbmNpbmcgc2NvcmUgYW5kIHJlbW92ZSBmaXhp
bmcgZW5jb2RlIHRvCm9ubHkgdGhlIHNlY29uZCBpbnN0YW5jZS4KClNpZ25lZC1vZmYtYnk6IENo
cmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmNuLmggfCAgMSArCiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS92Y25fdjNfMC5jICAgfCAxMSArKysrKysrLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCA4
IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Zjbi5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3Zjbi5oCmluZGV4IDEzYWE0MTdmNmJlNy4uZDEwYmM0ZjBhMDVmIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmNuLmgKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Zjbi5oCkBAIC0yMTEsNiArMjExLDcgQEAgc3RydWN0
IGFtZGdwdV92Y25faW5zdCB7CiAJdm9pZAkJCSpzYXZlZF9ibzsKIAlzdHJ1Y3QgYW1kZ3B1X3Jp
bmcJcmluZ19kZWM7CiAJc3RydWN0IGFtZGdwdV9yaW5nCXJpbmdfZW5jW0FNREdQVV9WQ05fTUFY
X0VOQ19SSU5HU107CisJYXRvbWljX3QJCXNjaGVkX3Njb3JlOwogCXN0cnVjdCBhbWRncHVfaXJx
X3NyYwlpcnE7CiAJc3RydWN0IGFtZGdwdV92Y25fcmVnCWV4dGVybmFsOwogCXN0cnVjdCBhbWRn
cHVfYm8JKmRwZ19zcmFtX2JvOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvdmNuX3YzXzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92M18wLmMKaW5k
ZXggMjM5YTRlYjUyYzYxLi5iMzNmNTEzZmQyYWMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L3Zjbl92M18wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
dmNuX3YzXzAuYwpAQCAtMTcxLDYgKzE3MSw3IEBAIHN0YXRpYyBpbnQgdmNuX3YzXzBfc3dfaW5p
dCh2b2lkICpoYW5kbGUpCiAKIAlmb3IgKGkgPSAwOyBpIDwgYWRldi0+dmNuLm51bV92Y25faW5z
dDsgaSsrKSB7CiAJCXZvbGF0aWxlIHN0cnVjdCBhbWRncHVfZndfc2hhcmVkICpmd19zaGFyZWQ7
CisKIAkJaWYgKGFkZXYtPnZjbi5oYXJ2ZXN0X2NvbmZpZyAmICgxIDw8IGkpKQogCQkJY29udGlu
dWU7CiAKQEAgLTE5OCw2ICsxOTksOCBAQCBzdGF0aWMgaW50IHZjbl92M18wX3N3X2luaXQodm9p
ZCAqaGFuZGxlKQogCQlpZiAocikKIAkJCXJldHVybiByOwogCisJCWF0b21pY19zZXQoJmFkZXYt
PnZjbi5pbnN0W2ldLnNjaGVkX3Njb3JlLCAwKTsKKwogCQlyaW5nID0gJmFkZXYtPnZjbi5pbnN0
W2ldLnJpbmdfZGVjOwogCQlyaW5nLT51c2VfZG9vcmJlbGwgPSB0cnVlOwogCQlpZiAoYW1kZ3B1
X3NyaW92X3ZmKGFkZXYpKSB7CkBAIC0yMDksNyArMjEyLDggQEAgc3RhdGljIGludCB2Y25fdjNf
MF9zd19pbml0KHZvaWQgKmhhbmRsZSkKIAkJCXJpbmctPm5vX3NjaGVkdWxlciA9IHRydWU7CiAJ
CXNwcmludGYocmluZy0+bmFtZSwgInZjbl9kZWNfJWQiLCBpKTsKIAkJciA9IGFtZGdwdV9yaW5n
X2luaXQoYWRldiwgcmluZywgNTEyLCAmYWRldi0+dmNuLmluc3RbaV0uaXJxLCAwLAotCQkJCSAg
ICAgQU1ER1BVX1JJTkdfUFJJT19ERUZBVUxULCBOVUxMKTsKKwkJCQkgICAgIEFNREdQVV9SSU5H
X1BSSU9fREVGQVVMVCwKKwkJCQkgICAgICZhZGV2LT52Y24uaW5zdFtpXS5zY2hlZF9zY29yZSk7
CiAJCWlmIChyKQogCQkJcmV0dXJuIHI7CiAKQEAgLTIyNywxMSArMjMxLDEwIEBAIHN0YXRpYyBp
bnQgdmNuX3YzXzBfc3dfaW5pdCh2b2lkICpoYW5kbGUpCiAJCQl9IGVsc2UgewogCQkJCXJpbmct
PmRvb3JiZWxsX2luZGV4ID0gKGFkZXYtPmRvb3JiZWxsX2luZGV4LnZjbi52Y25fcmluZzBfMSA8
PCAxKSArIDIgKyBqICsgOCAqIGk7CiAJCQl9Ci0JCQlpZiAoYWRldi0+YXNpY190eXBlID09IENI
SVBfU0lFTk5BX0NJQ0hMSUQgJiYgaSAhPSAxKQotCQkJCXJpbmctPm5vX3NjaGVkdWxlciA9IHRy
dWU7CiAJCQlzcHJpbnRmKHJpbmctPm5hbWUsICJ2Y25fZW5jXyVkLiVkIiwgaSwgaik7CiAJCQly
ID0gYW1kZ3B1X3JpbmdfaW5pdChhZGV2LCByaW5nLCA1MTIsICZhZGV2LT52Y24uaW5zdFtpXS5p
cnEsIDAsCi0JCQkJCSAgICAgQU1ER1BVX1JJTkdfUFJJT19ERUZBVUxULCBOVUxMKTsKKwkJCQkJ
ICAgICBBTURHUFVfUklOR19QUklPX0RFRkFVTFQsCisJCQkJCSAgICAgJmFkZXYtPnZjbi5pbnN0
W2ldLnNjaGVkX3Njb3JlKTsKIAkJCWlmIChyKQogCQkJCXJldHVybiByOwogCQl9Ci0tIAoyLjI1
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
