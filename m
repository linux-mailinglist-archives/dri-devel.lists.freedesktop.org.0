Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FD1115E8E
	for <lists+dri-devel@lfdr.de>; Sat,  7 Dec 2019 21:36:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D5B96E233;
	Sat,  7 Dec 2019 20:36:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE3846E233
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Dec 2019 20:36:14 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id o9so4144647plk.6
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Dec 2019 12:36:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kPGabNCq4wvn/E6P0guB04MXnY7RQzJiTE6DO4F+/5c=;
 b=Ql2HEHYvRzBnGOsRmVS8OT9ZHZTg3K+2LrWZE75MnZfPLMFMxosrrtenpKQw2OZWRZ
 I8wTOA5phM7ZINmB7QMr5G4OIRSC/eHQu9zgaosoDjVcf35tN4Fj0fGKfAQiFFK7Nivu
 2Fv2BnaMeU9N0Aybsmr0X+I0rVPRfzGUpZhZNwmbJ3XkHy02U/dKaqy0ogTSUJPeJx+n
 A+HVPY1qhTTaJe7UJ1lPkYzhf/gOMhPNyxdQC8ffm1eXMfwNNY435tIAxIjUokNdKHjw
 gbh8ZgdLddXs4v11Y8RslY2ZR01YF1naf6aDhzQe7wfv9ajIoSBLezm3MUzOrCbKEI6p
 UuTQ==
X-Gm-Message-State: APjAAAU/L5PKtRP0WgEjyC80cXoJjVi4mEu2kDAq13g0SwReuhzY3iAq
 K9mtwmtGwEIJ3QYfyX6i1v0smSs4
X-Google-Smtp-Source: APXvYqzDfayEIq2IU2ZF76xRpq1YVP/uNxKHNPyI6TREpRcqY3KTtpmPIdU+GsItMQeh+jnuG7UijA==
X-Received: by 2002:a17:90b:3cc:: with SMTP id
 go12mr23177882pjb.89.1575750974098; 
 Sat, 07 Dec 2019 12:36:14 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 133sm20887100pfy.14.2019.12.07.12.36.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Dec 2019 12:36:13 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 aarch64-laptops@lists.linaro.org
Subject: [PATCH 2/4] drm/of: add support to find any enabled endpoint
Date: Sat,  7 Dec 2019 12:35:51 -0800
Message-Id: <20191207203553.286017-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191207203553.286017-1-robdclark@gmail.com>
References: <20191207203553.286017-1-robdclark@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kPGabNCq4wvn/E6P0guB04MXnY7RQzJiTE6DO4F+/5c=;
 b=fejbPTGExleKnqhKzbTJe2QRYYJ83L/AsFX3Orxh9feE9NIPyYEMNxKFqkGDyMQ6rF
 FQyuovSyMWmvs5v8uI/3n6B8gT2FfXog5EEwnuGRcXfFF3VgFC/y3+TJGx6OliZQNop7
 7RAXHmpNEiHg/m+Ma7H5ShJYS5Ylv/fe1oP6AgocW9BFyh3cMzHolHB7tJw9wAIaKUQ6
 noB5rFM8gDPsi9qrnkgW9kWd/+5WjBumhgyIVxw5HqzWHuvW5wvWnnIvZWM5TX+RId5m
 Kc2kn5vZLQW5z9rpfRdzfle2qQaUw9U/KQ8ORcog3GiP0gd3937HnI0FgaXikkWiBjGW
 PxqA==
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
Cc: Rob Clark <robdclark@chromium.org>, Jeffrey Hugo <jhugo@codeaurora.org>,
 open list <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>, David Airlie <airlied@linux.ie>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgoKVG8gaGFuZGxlIHRoZSBj
YXNlIHdoZXJlIHRoZXJlIGFyZSBtdWx0aXBsZSBwYW5lbCBlbmRwb2ludHMsIG9ubHkgb25lIG9m
CndoaWNoIGlzIGVuYWJsZWQvaW5zdGFsbGVkLCBhZGQgc3VwcG9ydCBmb3IgYSB3aWxkY2FyZCBl
bmRwb2ludCB2YWx1ZSB0bwpyZXF1ZXN0IGZpbmRpbmcgd2hpY2hldmVyIGVuZHBvaW50IGlzIGVu
YWJsZWQuCgpTaWduZWQtb2ZmLWJ5OiBSb2IgQ2xhcmsgPHJvYmRjbGFya0BjaHJvbWl1bS5vcmc+
Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9vZi5jIHwgNDEgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDQwIGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX29mLmMgYi9kcml2
ZXJzL2dwdS9kcm0vZHJtX29mLmMKaW5kZXggMGNhNTg4MDNiYTQ2Li4yYmFmNDRlNDAxYjggMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fb2YuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
ZHJtX29mLmMKQEAgLTIxOSwxMSArMjE5LDQ0IEBAIGludCBkcm1fb2ZfZW5jb2Rlcl9hY3RpdmVf
ZW5kcG9pbnQoc3RydWN0IGRldmljZV9ub2RlICpub2RlLAogfQogRVhQT1JUX1NZTUJPTF9HUEwo
ZHJtX29mX2VuY29kZXJfYWN0aXZlX2VuZHBvaW50KTsKIAorc3RhdGljIGludCBmaW5kX2VuYWJs
ZWRfZW5kcG9pbnQoY29uc3Qgc3RydWN0IGRldmljZV9ub2RlICpub2RlLCB1MzIgcG9ydCkKK3sK
KwlzdHJ1Y3QgZGV2aWNlX25vZGUgKmVuZHBvaW50X25vZGUsICpyZW1vdGU7CisJdTMyIGVuZHBv
aW50ID0gMDsKKworCWZvciAoZW5kcG9pbnQgPSAwOyA7IGVuZHBvaW50KyspIHsKKwkJZW5kcG9p
bnRfbm9kZSA9IG9mX2dyYXBoX2dldF9lbmRwb2ludF9ieV9yZWdzKG5vZGUsIHBvcnQsIGVuZHBv
aW50KTsKKwkJaWYgKCFlbmRwb2ludF9ub2RlKSB7CisJCQlwcl9kZWJ1ZygiTm8gbW9yZSBlbmRw
b2ludHMhXG4iKTsKKwkJCXJldHVybiAtRU5PREVWOworCQl9CisKKwkJcmVtb3RlID0gb2ZfZ3Jh
cGhfZ2V0X3JlbW90ZV9wb3J0X3BhcmVudChlbmRwb2ludF9ub2RlKTsKKwkJb2Zfbm9kZV9wdXQo
ZW5kcG9pbnRfbm9kZSk7CisJCWlmICghcmVtb3RlKSB7CisJCQlwcl9kZWJ1Zygibm8gdmFsaWQg
cmVtb3RlIG5vZGVcbiIpOworCQkJY29udGludWU7CisJCX0KKworCQlpZiAoIW9mX2RldmljZV9p
c19hdmFpbGFibGUocmVtb3RlKSkgeworCQkJcHJfZGVidWcoIm5vdCBhdmFpbGFibGUgZm9yIHJl
bW90ZSBub2RlXG4iKTsKKwkJCW9mX25vZGVfcHV0KHJlbW90ZSk7CisJCQljb250aW51ZTsKKwkJ
fQorCisJCXByX2RlYnVnKCJmb3VuZCBlbmFibGVkIGVuZHBvaW50ICVkIGZvciAlc1xuIiwgZW5k
cG9pbnQsIHJlbW90ZS0+bmFtZSk7CisJCW9mX25vZGVfcHV0KHJlbW90ZSk7CisJCXJldHVybiBl
bmRwb2ludDsKKwl9CisKKwlyZXR1cm4gLUVOT0RFVjsKK30KKwogLyoqCiAgKiBkcm1fb2ZfZmlu
ZF9wYW5lbF9vcl9icmlkZ2UgLSByZXR1cm4gY29ubmVjdGVkIHBhbmVsIG9yIGJyaWRnZSBkZXZp
Y2UKICAqIEBucDogZGV2aWNlIHRyZWUgbm9kZSBjb250YWluaW5nIGVuY29kZXIgb3V0cHV0IHBv
cnRzCiAgKiBAcG9ydDogcG9ydCBpbiB0aGUgZGV2aWNlIHRyZWUgbm9kZQotICogQGVuZHBvaW50
OiBlbmRwb2ludCBpbiB0aGUgZGV2aWNlIHRyZWUgbm9kZQorICogQGVuZHBvaW50OiBlbmRwb2lu
dCBpbiB0aGUgZGV2aWNlIHRyZWUgbm9kZSwgb3IgLTEgdG8gZmluZCBhbiBlbmFibGVkIGVuZHBv
aW50CiAgKiBAcGFuZWw6IHBvaW50ZXIgdG8gaG9sZCByZXR1cm5lZCBkcm1fcGFuZWwKICAqIEBi
cmlkZ2U6IHBvaW50ZXIgdG8gaG9sZCByZXR1cm5lZCBkcm1fYnJpZGdlCiAgKgpAQCAtMjQ2LDYg
KzI3OSwxMiBAQCBpbnQgZHJtX29mX2ZpbmRfcGFuZWxfb3JfYnJpZGdlKGNvbnN0IHN0cnVjdCBk
ZXZpY2Vfbm9kZSAqbnAsCiAJaWYgKHBhbmVsKQogCQkqcGFuZWwgPSBOVUxMOwogCisJaWYgKGVu
ZHBvaW50ID09IC0xKSB7CisJCWVuZHBvaW50ID0gZmluZF9lbmFibGVkX2VuZHBvaW50KG5wLCBw
b3J0KTsKKwkJaWYgKGVuZHBvaW50IDwgMCkKKwkJCXJldHVybiBlbmRwb2ludDsKKwl9CisKIAly
ZW1vdGUgPSBvZl9ncmFwaF9nZXRfcmVtb3RlX25vZGUobnAsIHBvcnQsIGVuZHBvaW50KTsKIAlp
ZiAoIXJlbW90ZSkKIAkJcmV0dXJuIC1FTk9ERVY7Ci0tIAoyLjIzLjAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
