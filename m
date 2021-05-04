Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE0B372AFE
	for <lists+dri-devel@lfdr.de>; Tue,  4 May 2021 15:27:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C4FE6EAE3;
	Tue,  4 May 2021 13:27:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEA1A6EADC
 for <dri-devel@lists.freedesktop.org>; Tue,  4 May 2021 13:27:37 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id u13so7738738edd.3
 for <dri-devel@lists.freedesktop.org>; Tue, 04 May 2021 06:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KziUO7xFHMqb6An6S1yCcJCDvQDbab0CIxBs0fWRw00=;
 b=antOEAlu6J0ZO5NhRr4DLN08cmH5S4Ci6kqTlGBDY/oj5IqVzzdgQ9X5KTZiMiOuZ/
 2ZBO6zTOLNpHAvH7Lz4if703qqaGoHJdA9jZpFhDHhm9GtKBMdIDx6D9CkfZZKjebRw4
 W03mLszdIFLbUdUcwkWx/0talYYlPDtda/pdjBxkLCtoaifbW3RU1Zvk534utLs/qLqm
 x6dlmR7UY3NYCpCpyPS4/wcOZgLn3ChBFZSYDKyfifXxSAYM9mMBq6KBMWTtrRSPuljV
 SpiyG+BCGLZlNJRWZCvIhxcB/hzzZB9i2m9XdqRD8Vb6NAfEy1VilQL6ETk6TAUPYnbW
 R4WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KziUO7xFHMqb6An6S1yCcJCDvQDbab0CIxBs0fWRw00=;
 b=ZGxy7q7shxLCW4tsSLLeXEZzs3cO+Ce7FeG5d/q0xM5JspKbuHUPDBAgzLWybyp0FE
 +nDt5U5aph4tx72AAc8SmF5zkaoRtmQPqif7WJetkf68Yt8OZyceYjFumztbf9RUFn5K
 T4rLwEO8miujtUAXEg/DB/rdxXKB1srVJE8IrScmosY7Yfw57p2ZtQVHW1dinjV/cvPN
 i2wRKiEA/FTk9HLPuGWTn8Px6x/BPnTdJq3pwh8Y5dUUHvbSt44oB5yrMg20mL1WqPNs
 6U48Q9T7zSCP/QK0EN3qkAijACg5ysn171Ths+BqS7xRylq0dsWDkWA49XefS4lAWxlk
 KSVg==
X-Gm-Message-State: AOAM532AHYtWfonkdA8/UegToHeVA9Dphxy/KGBQewKniJbH05063Y7M
 LnAeyCTuIQCbO1kRI8c/MMmwpqZzEBs=
X-Google-Smtp-Source: ABdhPJx8CRjxDp99+jQFo00i53PeoE7FQ7juU5IlN4wf2hytRvDAvEqGb5yKvC8GYGg2UJhdwh+RFw==
X-Received: by 2002:aa7:d915:: with SMTP id a21mr26817540edr.357.1620134856504; 
 Tue, 04 May 2021 06:27:36 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:4a5c:1943:c73d:c4c9])
 by smtp.gmail.com with ESMTPSA id q18sm3114036edd.3.2021.05.04.06.27.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 06:27:36 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 07/12] drm/lima: add DMA-buf user fence support
Date: Tue,  4 May 2021 15:27:24 +0200
Message-Id: <20210504132729.2046-8-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210504132729.2046-1-christian.koenig@amd.com>
References: <20210504132729.2046-1-christian.koenig@amd.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SnVzdCBhZGQgdGhlIGNhbGwgYmVmb3JlIHRha2luZyBsb2Nrcy4KClNpZ25lZC1vZmYtYnk6IENo
cmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vbGltYS9saW1hX2dlbS5jIHwgNiArKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbGltYS9saW1hX2dlbS5jIGIv
ZHJpdmVycy9ncHUvZHJtL2xpbWEvbGltYV9nZW0uYwppbmRleCBkZTYyOTY2MjQzY2QuLmQzZDY4
MjE4NTY4ZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2xpbWEvbGltYV9nZW0uYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vbGltYS9saW1hX2dlbS5jCkBAIC0zMjEsNiArMzIxLDEyIEBAIGlu
dCBsaW1hX2dlbV9zdWJtaXQoc3RydWN0IGRybV9maWxlICpmaWxlLCBzdHJ1Y3QgbGltYV9zdWJt
aXQgKnN1Ym1pdCkKIAkJCWdvdG8gZXJyX291dDA7CiAJCX0KIAorCQllcnIgPSBkbWFfcmVzdl9z
eW5jX3VzZXJfZmVuY2Uob2JqLT5yZXN2KTsKKwkJaWYgKGVycikgeworCQkJZHJtX2dlbV9vYmpl
Y3RfcHV0KG9iaik7CisJCQlnb3RvIGVycl9vdXQwOworCQl9CisKIAkJYm8gPSB0b19saW1hX2Jv
KG9iaik7CiAKIAkJLyogaW5jcmVhc2UgcmVmY250IG9mIGdwdSB2YSBtYXAgdG8gcHJldmVudCB1
bm1hcHBlZCB3aGVuIGV4ZWN1dGluZywKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
