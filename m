Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1005EF2DD9
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 13:01:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF8DD6F661;
	Thu,  7 Nov 2019 12:01:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE2BD6E42E;
 Thu,  7 Nov 2019 12:01:22 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id 8so2134838wmo.0;
 Thu, 07 Nov 2019 04:01:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q4+EM/ycBjNflTXzOlRODNdWrCrYYuuRdS5U+MduEW4=;
 b=XFdzy6VWpeEGMCh9qLfr2RpVE8YZQnPcb3pGvNtnXjCc4QsKj93nXhVuFVCXqEAng2
 B/tFDZgXzPFuh43TLSLk+2aK3EujhtsvWjFK39Ve+OgRCKGpXCrEmDBSAq1Yle26IV1l
 0H5RWSuPC55monk589a8orr1ytIxKvOKBBYDpGvPVnL7uvhOEjKExRdfqXwgzAmW/IIE
 niBhA1bbYMY3PDx4u8B+IqSwvgddVMax/Fma1gGAt8MZsi6+eUwOUJWMFbmPm1jYeTcJ
 npGXxa5VkqoOcPZ/8XROFgAMq0+XljObchW70MIwg9jJW7jRUNeDQAfCCh2q4dFPRvBk
 m/eQ==
X-Gm-Message-State: APjAAAXqmj/u/aYt7luAGaA/pkGOMjNH6kJk8OyUwr0gwxqkLXgySRr6
 k5AabgvVPetUL1bZo1/6zqalB0RQ
X-Google-Smtp-Source: APXvYqwwINkA4+zPTno42CTCbHu1w6kFi1txd+6xF/vCCLZqLm3yrbuB2Pe1pGtwiOaIgIsPbahGWg==
X-Received: by 2002:a1c:6683:: with SMTP id a125mr2341740wmc.74.1573128081282; 
 Thu, 07 Nov 2019 04:01:21 -0800 (PST)
Received: from laptop.fritz.box ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id x6sm60116wrw.34.2019.11.07.04.01.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Nov 2019 04:01:20 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drm/radeon: finally fix the racy VMA setup
Date: Thu,  7 Nov 2019 13:01:18 +0100
Message-Id: <20191107120118.2825-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191107120118.2825-1-christian.koenig@amd.com>
References: <20191107120118.2825-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=q4+EM/ycBjNflTXzOlRODNdWrCrYYuuRdS5U+MduEW4=;
 b=oM0jKr49VmU5DSgLM15UONRuMFJR+chFrebFyin5IfI9R82WL6OILs8YXDjX2uDV+Z
 vIOSsmXEj27gcYJGObKduAO5//roW2Q995f8Zua4MddFtu9aeELUhuiLtFE2upnfxG8X
 p7MnKAcJlF/ZFJ1ocE1baFqL8Pkp/Jr1GeC/lABnFTkUJ9wSMw+mDxEcGjwNOftlixgU
 DHIoY0WLejBnHfsZvz7w4OpzhZPN+fKGzljU2JZ4WkBuMeQLMZwHEOnjBD1GyBy6kn7p
 wCe02/rf6QNkxkoZ4i5dcKVQIT8434SpBqxamCfon+gnT/kDCeoBp+8rQxnk8tFK8bQ2
 v/YA==
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

RnJvbTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2tvZW5pZy5sZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+
CgpGaW5hbGx5IGNsZWFuIHVwIHRoZSBWTUEgc2V0dXAgZm9yIHJhZGVvbiBub3cgdGhhdCBUVE0g
ZXhwb3J0cyB0aGUKbmVjZXNzYXJ5IGZ1bmN0aW9ucy4KCk5vIGZ1bmN0aW9uYWwgY2hhbmdlLCBi
dXQgb25seSBjb21waWxlIHRlc3RlZC4KClNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcg
PGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEh1YW5nIFJ1aSA8cmF5Lmh1
YW5nQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdHRtLmMgfCAy
OSArKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE0IGluc2Vy
dGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9y
YWRlb24vcmFkZW9uX3R0bS5jIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdHRtLmMK
aW5kZXggMDk4YmM5ZjQwYjk4Li45MTk5M2EyMzNjYjAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9yYWRlb24vcmFkZW9uX3R0bS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFk
ZW9uX3R0bS5jCkBAIC04ODEsOSArODgxLDYgQEAgdm9pZCByYWRlb25fdHRtX3NldF9hY3RpdmVf
dnJhbV9zaXplKHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2LCB1NjQgc2l6ZSkKIAltYW4tPnNp
emUgPSBzaXplID4+IFBBR0VfU0hJRlQ7CiB9CiAKLXN0YXRpYyBzdHJ1Y3Qgdm1fb3BlcmF0aW9u
c19zdHJ1Y3QgcmFkZW9uX3R0bV92bV9vcHM7Ci1zdGF0aWMgY29uc3Qgc3RydWN0IHZtX29wZXJh
dGlvbnNfc3RydWN0ICp0dG1fdm1fb3BzID0gTlVMTDsKLQogc3RhdGljIHZtX2ZhdWx0X3QgcmFk
ZW9uX3R0bV9mYXVsdChzdHJ1Y3Qgdm1fZmF1bHQgKnZtZikKIHsKIAlzdHJ1Y3QgdHRtX2J1ZmZl
cl9vYmplY3QgKmJvOwpAQCAtODkxLDM0ICs4ODgsMzYgQEAgc3RhdGljIHZtX2ZhdWx0X3QgcmFk
ZW9uX3R0bV9mYXVsdChzdHJ1Y3Qgdm1fZmF1bHQgKnZtZikKIAl2bV9mYXVsdF90IHJldDsKIAog
CWJvID0gKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqKXZtZi0+dm1hLT52bV9wcml2YXRlX2Rh
dGE7Ci0JaWYgKGJvID09IE5VTEwpIHsKKwlpZiAoYm8gPT0gTlVMTCkKIAkJcmV0dXJuIFZNX0ZB
VUxUX05PUEFHRTsKLQl9CisKIAlyZGV2ID0gcmFkZW9uX2dldF9yZGV2KGJvLT5iZGV2KTsKIAlk
b3duX3JlYWQoJnJkZXYtPnBtLm1jbGtfbG9jayk7Ci0JcmV0ID0gdHRtX3ZtX29wcy0+ZmF1bHQo
dm1mKTsKKwlyZXQgPSB0dG1fYm9fdm1fZmF1bHQodm1mKTsKIAl1cF9yZWFkKCZyZGV2LT5wbS5t
Y2xrX2xvY2spOwogCXJldHVybiByZXQ7CiB9CiAKK3N0YXRpYyBzdHJ1Y3Qgdm1fb3BlcmF0aW9u
c19zdHJ1Y3QgcmFkZW9uX3R0bV92bV9vcHMgPSB7CisJLmZhdWx0ID0gcmFkZW9uX3R0bV9mYXVs
dCwKKwkub3BlbiA9IHR0bV9ib192bV9vcGVuLAorCS5jbG9zZSA9IHR0bV9ib192bV9jbG9zZSwK
KwkuYWNjZXNzID0gdHRtX2JvX3ZtX2FjY2VzcworfTsKKwogaW50IHJhZGVvbl9tbWFwKHN0cnVj
dCBmaWxlICpmaWxwLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSkKIHsKIAlpbnQgcjsKIAlz
dHJ1Y3QgZHJtX2ZpbGUgKmZpbGVfcHJpdiA9IGZpbHAtPnByaXZhdGVfZGF0YTsKIAlzdHJ1Y3Qg
cmFkZW9uX2RldmljZSAqcmRldiA9IGZpbGVfcHJpdi0+bWlub3ItPmRldi0+ZGV2X3ByaXZhdGU7
CiAKLQlpZiAocmRldiA9PSBOVUxMKSB7CisJaWYgKHJkZXYgPT0gTlVMTCkKIAkJcmV0dXJuIC1F
SU5WQUw7Ci0JfQorCiAJciA9IHR0bV9ib19tbWFwKGZpbHAsIHZtYSwgJnJkZXYtPm1tYW4uYmRl
dik7Ci0JaWYgKHVubGlrZWx5KHIgIT0gMCkpIHsKKwlpZiAodW5saWtlbHkociAhPSAwKSkKIAkJ
cmV0dXJuIHI7Ci0JfQotCWlmICh1bmxpa2VseSh0dG1fdm1fb3BzID09IE5VTEwpKSB7Ci0JCXR0
bV92bV9vcHMgPSB2bWEtPnZtX29wczsKLQkJcmFkZW9uX3R0bV92bV9vcHMgPSAqdHRtX3ZtX29w
czsKLQkJcmFkZW9uX3R0bV92bV9vcHMuZmF1bHQgPSAmcmFkZW9uX3R0bV9mYXVsdDsKLQl9CisK
IAl2bWEtPnZtX29wcyA9ICZyYWRlb25fdHRtX3ZtX29wczsKIAlyZXR1cm4gMDsKIH0KLS0gCjIu
MjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
