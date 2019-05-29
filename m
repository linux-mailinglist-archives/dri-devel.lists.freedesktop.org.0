Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8042DB97
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 13:20:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B33E6E2CD;
	Wed, 29 May 2019 11:20:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E1EF6E0E2
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 10:26:42 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id h2so1124258pgg.1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 03:26:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GljBVRDvAaH/DkyFnuPUvDqT8RdA5gdVzG7vblp3VSs=;
 b=C+lsMymkDFzo2Gz5UWgTfdQqMS+6J2zvkYQFitBaVWNw9z0PTmLUXIg3rJurwqo3Eb
 vZfcKemqm4BpfWDRayWDQV53damNyOtGWap+zWEDpOwPX63bOQxbXeWkPIP+yjiWAokN
 NxaCKTDQFZmEsiwVnrtf0GWp8q3Pgcj1n65fxaeG+N+uPRks9j5MYSGpTzBJU4U1meDx
 yERKkkCa0s0w+4RtL/sdFrh0u2Px4J7iPoZ9AJIju0WUva8PH4KHcUnauM8WnyvhLAn7
 vgRDNKS/Or011II0xCIy/7GlGMkOJ/QKnjUo11y42+Coydb44A5Gk8QxFI2fDegnd/R1
 mZjg==
X-Gm-Message-State: APjAAAUsmSZ52JNroffYoR0Yok3sHnYx2CQN05oONunDuhLzavK3wd9g
 hGDmkPEvUrDV7fu+yiHOuLWmeQ==
X-Google-Smtp-Source: APXvYqz6GR4WNNXNVVY8FlZIz1QqWpoMlEteFKEd2dOX/waMt4VxWQVOVp9NyvwarqjmG8cnhKaspw==
X-Received: by 2002:aa7:9aa5:: with SMTP id x5mr57398728pfi.135.1559125601694; 
 Wed, 29 May 2019 03:26:41 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:b852:bd51:9305:4261])
 by smtp.gmail.com with ESMTPSA id e12sm18992183pfl.122.2019.05.29.03.26.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 29 May 2019 03:26:41 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/4] drm: mediatek: fix unbind functions
Date: Wed, 29 May 2019 18:25:52 +0800
Message-Id: <20190529102555.251579-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190529102555.251579-1-hsinyi@chromium.org>
References: <20190529102555.251579-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 29 May 2019 11:20:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GljBVRDvAaH/DkyFnuPUvDqT8RdA5gdVzG7vblp3VSs=;
 b=mNMl2dhA55pEBfDmm0KYY9HDhLUN9zY4R63Yol5LQp+MwaFD7w2xzRvbqvz1bFmf+u
 DMMZb+kETeAeYx2gPM9SRZ7DPKmUaheDn/YR7VfsXKXG2lpbc40nBCMhX7A6Ohts1pn+
 kQiTIf76xeLlGk7d20NTCAZHzJA0ahlyXY/oc=
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ZGV0YXRjaCBwYW5lbCBpbiBtdGtfZHNpX2Rlc3Ryb3lfY29ubl9lbmMoKSwgc2luY2UgLmJpbmQg
d2lsbCB0cnkgdG8KYXR0YWNoIGl0IGFnYWluLgoKRml4ZXM6IDJlNTRjMTRlMzEwZiAoImRybS9t
ZWRpYXRlazogQWRkIERTSSBzdWIgZHJpdmVyIikKU2lnbmVkLW9mZi1ieTogSHNpbi1ZaSBXYW5n
IDxoc2lueWlAY2hyb21pdW0ub3JnPgotLS0KY2hhbmdlIGxvZyB2MS0+djI6CiogbWlwaV9kc2lf
aG9zdF91bnJlZ2lzdGVyKCkgc2hvdWxkIGJlIGZpeGVkIGluIGFub3RoZXIgcGF0Y2ggb24gdGhl
IGxpc3QuCi0tLQogZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYyB8IDIgKysKIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2RzaS5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2ku
YwppbmRleCBiMDBlYjJkMmUwODYuLjFhZTNiZTk5ZTBmZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kc2kuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2RzaS5jCkBAIC04NDQsNiArODQ0LDggQEAgc3RhdGljIHZvaWQgbXRrX2RzaV9kZXN0cm95
X2Nvbm5fZW5jKHN0cnVjdCBtdGtfZHNpICpkc2kpCiAJLyogU2tpcCBjb25uZWN0b3IgY2xlYW51
cCBpZiBjcmVhdGlvbiB3YXMgZGVsZWdhdGVkIHRvIHRoZSBicmlkZ2UgKi8KIAlpZiAoZHNpLT5j
b25uLmRldikKIAkJZHJtX2Nvbm5lY3Rvcl9jbGVhbnVwKCZkc2ktPmNvbm4pOworCWlmIChkc2kt
PnBhbmVsKQorCQlkcm1fcGFuZWxfZGV0YWNoKGRzaS0+cGFuZWwpOwogfQogCiBzdGF0aWMgdm9p
ZCBtdGtfZHNpX2RkcF9zdGFydChzdHJ1Y3QgbXRrX2RkcF9jb21wICpjb21wKQotLSAKMi4yMC4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
