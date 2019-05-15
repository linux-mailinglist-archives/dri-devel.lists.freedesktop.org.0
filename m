Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2593A1F6A6
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2019 16:38:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBCD3892AA;
	Wed, 15 May 2019 14:38:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B7BA892AA
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2019 14:38:35 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id c5so2942023wrs.11
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2019 07:38:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZsgPG7bOHi+ZU8UR4bm1s7tE2+P5qIRqiiMLQC0MyfE=;
 b=SwOIBhoavVjF3WZ2j6RrnMHbeboDeMhh/cw5aFhgA0ITUBfU1eBKeYQ5KaFZXtaYje
 2IFemhf+C1SAsrqOCv3928XRd66VCzlxw92yO71itwtvT+SlDbLxnLpUVKbdnUpn5fpy
 IFee/S59PaFCjhssMCO0wNmctvkVv1sW9F7yJsYxxkk9WKRd6L3Kttcm55hIbMAuymsA
 b7MJhWiJsmMd2MCLR0UHVyg7mtHW/u+6UwWjgCLtigO766+u4sNQ7n8pNsxz8v+A4NHi
 gFST0LD5eJw7qryv3jKWPCanE9YiTR7GagYl7ag5rkuBGFcqnXXLyG57eJ61dBqGY4g6
 t7KA==
X-Gm-Message-State: APjAAAXdDyMEA/7S0z7Whkr2ouDWIQuGZJegD99Cq0g/S8Rs9YIAKXHf
 OtbNZKCQxcasjwSx6uVKKY0iFxGF
X-Google-Smtp-Source: APXvYqxD8/So9Q0A74QZeOMQn//Wym6FZK5KagbzbflC3yBKdTNn+Rs62bluvT63J63EJtAvCLgP3Q==
X-Received: by 2002:adf:9794:: with SMTP id s20mr13745953wrb.104.1557931114383; 
 Wed, 15 May 2019 07:38:34 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:fd02:5db:d141:8a62])
 by smtp.gmail.com with ESMTPSA id w7sm2606895wmm.16.2019.05.15.07.38.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 15 May 2019 07:38:33 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/6] drm/ttm: remove the backing store if no placement is given
Date: Wed, 15 May 2019 16:38:27 +0200
Message-Id: <20190515143831.1639-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190515143831.1639-1-christian.koenig@amd.com>
References: <20190515143831.1639-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ZsgPG7bOHi+ZU8UR4bm1s7tE2+P5qIRqiiMLQC0MyfE=;
 b=RRK2RmdVkNaOUBA8FpxQXYOYFtkblN+oev/MK1Ot7wsCnJjrfCiIj/cZdRuvQUVOtn
 L+DBJurDwPwSvl8ajISidgEmTDdvU3W4kC8QsbqFiOmU+463hCDqlo0FtDrUKc+p/wNU
 X/3gBYyM+On3cN53hGjPRUNXGan47zDohnYWQL/Fvpcx5SU1GoZGgVbofEse6+FARmCJ
 0CbGlOMh/uDCSxzOvpld2HiARkOytZXYXNtfYqGmrjlGeVm1ZgtYUvrYIpuY4txuOF2a
 I/ZSKVtShyFmZ06L5btr+tnLun8P2iNB8wDohVsXkKsXIrjsm2UwcnKa9JyMJF/Ip02F
 4lLw==
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
