Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDCB815EE8
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 10:13:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 438CC89F03;
	Tue,  7 May 2019 08:13:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C12989F07
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2019 08:13:43 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id p21so19185248wmc.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2019 01:13:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZsgPG7bOHi+ZU8UR4bm1s7tE2+P5qIRqiiMLQC0MyfE=;
 b=ixjMIZVxBr1o6VQvPeLg8dHk0OYluEIRcJVQRm2y756jyOJTXG1vFv9yYlglfGGy2W
 CBI/iTq87b5KucFuatpO+w6LoeLkJewiysswWT72Lyw6PlxV+nS7V6KAWPevMjb/U2MR
 V7YKviEudVjMbS5fbGjS1EVYC/d5GDcFx+v5w3GHl+mgA3eR1eZgXGV90bkEXhVy33sj
 HgX0EZ5NOt9sAJVY0aJAHOPfEEGYF7O5Z2jDr9lJIINqSD+pxfx6eaH2+65eGK559BzN
 uG6f1GKPy70BNuqQdUhUZm4QhQWmqwjDB24JJvY9iQj9SpL+7boy6DrR7VRA0Pho5Jvc
 FG2w==
X-Gm-Message-State: APjAAAWCw8UirzgRsztIC/9KpCpwFGvZgzBTLcv/xXE7cZ/HCxPncpv/
 tCBiA6fbW3AYPwMxKx7yvnx85du9
X-Google-Smtp-Source: APXvYqxAfvoX38VI8FseZ692vUVP8BvCio1+0EOJIZxEE/sPMTe8NfHU+3FpsVl5ODEupR2VGIWvjg==
X-Received: by 2002:a1c:be15:: with SMTP id o21mr6655491wmf.62.1557216822116; 
 Tue, 07 May 2019 01:13:42 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:c572:e952:8ef0:ace])
 by smtp.gmail.com with ESMTPSA id 67sm13588683wmz.41.2019.05.07.01.13.41
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 07 May 2019 01:13:41 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/9] drm/ttm: remove the backing store if no placement is given
Date: Tue,  7 May 2019 10:13:33 +0200
Message-Id: <20190507081338.2571-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190507081338.2571-1-christian.koenig@amd.com>
References: <20190507081338.2571-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ZsgPG7bOHi+ZU8UR4bm1s7tE2+P5qIRqiiMLQC0MyfE=;
 b=ZG0I+0gT/zbR9N/dXkmhoKdzrUMAxEkB+Ow/hV/qIRAO1iiafWYCsk4ntjbv0rRqEc
 1q3X/NlWUEEnLyMWjdCUk8vTj2JaRm+2aknZLzhu/qlaZhAs957ACws8pHtKR2cFAi55
 obL314swiHMo8U/fdTg/I3uXaBOuierEuCyIZM7nEKUzGTyZ36QcEmUZ6vwvq1sPve2b
 Ytj9l5D9NzDm91lfrB2mRlR2AJlhCEMuZfENU7O8py+XAnWXBxJQaF9ajzMIOr7pXOVH
 egcWo4rmp5VHk5PwGEmdlBE39J5ej6wUWCSzIbAkjuxg6EVk/11J2ZL9RPU/CttWZRoy
 gSXg==
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
cy9ncHUvZHJtL3R0bS90dG1fYm8uYwppbmRleCAyODQ1ZmNlYjJmYmQuLjg1MDJiM2VkMmQ4OCAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vdHRtL3R0bV9iby5jCkBAIC0xMTYwLDYgKzExNjAsMTggQEAgaW50IHR0bV9ib192YWxp
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
