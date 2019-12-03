Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C71A5110259
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 17:32:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CAB56E9EA;
	Tue,  3 Dec 2019 16:32:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E0E26E9EA
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 16:32:08 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id f129so4242314wmf.2
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2019 08:32:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9+5X8T1e9hRpXIXFZg1NPo8MjmX2IuYdom9kAI//J+o=;
 b=XbO2dLD9VibDLDez/yi49140rrnxsCAtgtEgpYUriHo0EyUtbOkL8N1Ou61IG7Jwf0
 XvGHSuCAs5AS71MGebzRh6Hb09FgKvLFCKgjwKSdu8nTWVVOeikQzoldrl6+OP+u9BfY
 vQxJwJpqx9qaDFNy76ReprRXIHb11nRDYSKwVV6iDp8B/TeRW6iQGK/VR09h3vktr/bm
 LOjABiKeFcpLkam+WFlhXDntDoRo15fBRKD1hqyy/Zc4t5KN2OpsCOwvj3zb9gUSSZRv
 Yn7he7mED7GnRlX/kFyjj2pBy86RpDegIEqxsaRFbTt/phc2Wo19964OMYFdU0tmbpW+
 VHZw==
X-Gm-Message-State: APjAAAUGr7g/otW2H4eny88cTXj7dXyhZVJFHO1lgY7pDhb7Q7Xppfh5
 IPzgLNxDilbuQCjqVwgBQY8=
X-Google-Smtp-Source: APXvYqzOOcKTaW7GhzPsuaxOQCcVpGuf35zh5toqs1OS7u7PG84TbcFn+UpOIoBmykGNDW6kwGp2zg==
X-Received: by 2002:a1c:3803:: with SMTP id f3mr29839022wma.134.1575390727042; 
 Tue, 03 Dec 2019 08:32:07 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
 by smtp.gmail.com with ESMTPSA id l17sm3559762wme.45.2019.12.03.08.32.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2019 08:32:06 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 2/3] drm/cma-helper: Use sgt_dma_contiguous() helper
Date: Tue,  3 Dec 2019 17:32:02 +0100
Message-Id: <20191203163203.1486837-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191203163203.1486837-1-thierry.reding@gmail.com>
References: <20191203163203.1486837-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9+5X8T1e9hRpXIXFZg1NPo8MjmX2IuYdom9kAI//J+o=;
 b=hNKazjUsDMTafj6NH2ZsTDB75Dvo/1uUIYIEBgWNqDG673w8LZtv9LEAwiZf03eBPA
 qwbZC0C3pYALrzSP4kWPEVaFwGyMSAFfg7QKaTgQkzMKMvMQvYnL3IYVBv5aO+uaTF8x
 eyE6UhCauBAn+dLdc6eIr5s2age6Y+Dy6o1ENABd2o7n6U49sYLINPWnlAMPkbHCRIVs
 p76/r9NIwJgsttgohB9COBN54M7wjPrIggT+0fJISLAiQ8IoEgT/Rpb62xz17kyr2YZ3
 ferp/EGxYz9yNnHybORwwWJkXNeNRXOd780s2HfJDGQdwSkexSg4lgg5uVDgI2IBUPrz
 ASfQ==
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCkZ1bmN0aW9uYWxpdHkg
dG8gY291bnQgdGhlIG51bWJlciBvZiBjb250aWd1b3VzIERNQSBjaHVua3MgaW4gYW4gU0cKdGFi
bGUgaGFzIGJlZW4gYWRkZWQgdG8gdGhlIHNjYXR0ZXJsaXN0IGxpYnJhcnkuIFVzZSB0aGlzIGZ1
bmN0aW9uYWxpdHkKdG8gcmVwbGFjZSBhbiBvcGVuLWNvZGVkIHZlcnNpb24gaW4gdGhlIEdFTS9D
TUEgaGVscGVycy4KClNpZ25lZC1vZmYtYnk6IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRp
YS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fY21hX2hlbHBlci5jIHwgMjIgKyst
LS0tLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMjAg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fY21hX2hl
bHBlci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fY21hX2hlbHBlci5jCmluZGV4IDEyZTk4
ZmIyODIyOS4uNWJiYWU5NjU0Y2M2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2dl
bV9jbWFfaGVscGVyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fY21hX2hlbHBlci5j
CkBAIC00NzEsMjYgKzQ3MSw4IEBAIGRybV9nZW1fY21hX3ByaW1lX2ltcG9ydF9zZ190YWJsZShz
dHJ1Y3QgZHJtX2RldmljZSAqZGV2LAogewogCXN0cnVjdCBkcm1fZ2VtX2NtYV9vYmplY3QgKmNt
YV9vYmo7CiAKLQlpZiAoc2d0LT5uZW50cyAhPSAxKSB7Ci0JCS8qIGNoZWNrIGlmIHRoZSBlbnRy
aWVzIGluIHRoZSBzZ190YWJsZSBhcmUgY29udGlndW91cyAqLwotCQlkbWFfYWRkcl90IG5leHRf
YWRkciA9IHNnX2RtYV9hZGRyZXNzKHNndC0+c2dsKTsKLQkJc3RydWN0IHNjYXR0ZXJsaXN0ICpz
OwotCQl1bnNpZ25lZCBpbnQgaTsKLQotCQlmb3JfZWFjaF9zZyhzZ3QtPnNnbCwgcywgc2d0LT5u
ZW50cywgaSkgewotCQkJLyoKLQkJCSAqIHNnX2RtYV9hZGRyZXNzKHMpIGlzIG9ubHkgdmFsaWQg
Zm9yIGVudHJpZXMKLQkJCSAqIHRoYXQgaGF2ZSBzZ19kbWFfbGVuKHMpICE9IDAKLQkJCSAqLwot
CQkJaWYgKCFzZ19kbWFfbGVuKHMpKQotCQkJCWNvbnRpbnVlOwotCi0JCQlpZiAoc2dfZG1hX2Fk
ZHJlc3MocykgIT0gbmV4dF9hZGRyKQotCQkJCXJldHVybiBFUlJfUFRSKC1FSU5WQUwpOwotCi0J
CQluZXh0X2FkZHIgPSBzZ19kbWFfYWRkcmVzcyhzKSArIHNnX2RtYV9sZW4ocyk7Ci0JCX0KLQl9
CisJaWYgKCFzZ3RfZG1hX2NvbnRpZ3VvdXMoc2d0KSkKKwkJcmV0dXJuIEVSUl9QVFIoLUVJTlZB
TCk7CiAKIAkvKiBDcmVhdGUgYSBDTUEgR0VNIGJ1ZmZlci4gKi8KIAljbWFfb2JqID0gX19kcm1f
Z2VtX2NtYV9jcmVhdGUoZGV2LCBhdHRhY2gtPmRtYWJ1Zi0+c2l6ZSk7Ci0tIAoyLjIzLjAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
