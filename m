Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA0AACA66
	for <lists+dri-devel@lfdr.de>; Sun,  8 Sep 2019 04:48:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ED2289C94;
	Sun,  8 Sep 2019 02:48:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 087C889C93;
 Sun,  8 Sep 2019 02:48:14 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id q21so6951002pfn.11;
 Sat, 07 Sep 2019 19:48:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PophNlEimsQW360UTE3HQyearMFRv+hM8VNUZL4CMeI=;
 b=ATq4MzjmjD/bG+JwKraxocED6xCMDqybHw5KfQH7a/Yb8xDfJzJYMDFKrpZ/Pipspx
 eEgEkKQatWxDoobXuQJ0+H3QxplMFA8ZgBzxJU79wDwK8rusBUDGAbOtyqLh/lRrDW0Q
 aWxWEUYs1b8BuaDqgf9j6a7o+OGJy2cYyjAik845uWlVdj54bdVDyoCUkF/OTa241q4J
 KysSw4y/Ghm9IdF3ael7SRgzTLKmfAADAtzOZ8IqpQpu5LAH+r4fHWb8yFHrRJTkKwFJ
 Czz3G2+mDV62T8nfp+OJJhx08gZtiGaE/aAX/LWfNglb8zwusGjlJa2k7U+IKFuqJdA3
 VXwg==
X-Gm-Message-State: APjAAAVE44bN8ObnYK49iI9PTnQfhP8wWPpaLVz9xWBLDqA3DDtlcwqM
 A5xsQ8W0WenqLO88o2p/KYw=
X-Google-Smtp-Source: APXvYqwpjlSpKsw3qJDP3BhodT3Sfm86dXKHhTTDo6E1SqPbcCYLOndwf34ATa8oKEZuP0In7Ihi6g==
X-Received: by 2002:a63:2a87:: with SMTP id
 q129mr15507096pgq.101.1567910893480; 
 Sat, 07 Sep 2019 19:48:13 -0700 (PDT)
Received: from anarsoul-thinkpad.lan (216-71-213-236.dyn.novuscom.net.
 [216.71.213.236])
 by smtp.gmail.com with ESMTPSA id u9sm10193930pjb.4.2019.09.07.19.48.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Sep 2019 19:48:13 -0700 (PDT)
From: Vasily Khoruzhick <anarsoul@gmail.com>
To: Qiang Yu <yuq825@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 lima@lists.freedesktop.org
Subject: [PATCH] drm/lima: fix lima_gem_wait() return value
Date: Sat,  7 Sep 2019 19:48:00 -0700
Message-Id: <20190908024800.23229-1-anarsoul@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PophNlEimsQW360UTE3HQyearMFRv+hM8VNUZL4CMeI=;
 b=ZThJ03WFI8SPKxX6XqzhzHk60Cs0xzV68F3dRgBtre5sIeoFQNjo1b83wI4DqPX85V
 AMTRguTZwHUCxw/czq6CmQKaoF2lTXMEkOGIWfCgaIVwGoRfZLQIqJTeotRAslB7yHDw
 Qj8QsO2o6iWEbddFYukiai9xvaZBy0JLPYG8hQgzRBTKqfowfQxw8EiXDF+aFTOaeuvo
 TfZR9OHPZ6Le4UfK8NDuex+qxNVwajDFkmyfChdvOnPipi3NFohEIeBM/3iknRPF8GKc
 /Iy/abiy4b86t4DpdgLT6HFidS71gCdkwwsGUUjhqRKcIF/bGNXLFGdYkV2Y3HVeQlq1
 SCrg==
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
Cc: Vasily Khoruzhick <anarsoul@gmail.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ZHJtX2dlbV9yZXNlcnZhdGlvbl9vYmplY3Rfd2FpdCgpIHJldHVybnMgMCBpZiBpdCBzdWNjZWVk
cyBhbmQgLUVUSU1FCmlmIGl0IHRpbWVvdXRzLCBidXQgbGltYSBkcml2ZXIgYXNzdW1lZCB0aGF0
IDAgaXMgZXJyb3IuCgpDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwpTaWduZWQtb2ZmLWJ5OiBW
YXNpbHkgS2hvcnV6aGljayA8YW5hcnNvdWxAZ21haWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9saW1hL2xpbWFfZ2VtLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbGltYS9saW1hX2dl
bS5jIGIvZHJpdmVycy9ncHUvZHJtL2xpbWEvbGltYV9nZW0uYwppbmRleCA0NzdjMGY3NjY2NjMu
LmI2MDlkYzAzMGQ2YyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2xpbWEvbGltYV9nZW0u
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vbGltYS9saW1hX2dlbS5jCkBAIC0zNDIsNyArMzQyLDcg
QEAgaW50IGxpbWFfZ2VtX3dhaXQoc3RydWN0IGRybV9maWxlICpmaWxlLCB1MzIgaGFuZGxlLCB1
MzIgb3AsIHM2NCB0aW1lb3V0X25zKQogCXRpbWVvdXQgPSBkcm1fdGltZW91dF9hYnNfdG9famlm
Zmllcyh0aW1lb3V0X25zKTsKIAogCXJldCA9IGRybV9nZW1fcmVzZXJ2YXRpb25fb2JqZWN0X3dh
aXQoZmlsZSwgaGFuZGxlLCB3cml0ZSwgdGltZW91dCk7Ci0JaWYgKHJldCA9PSAwKQorCWlmIChy
ZXQgPT0gLUVUSU1FKQogCQlyZXQgPSB0aW1lb3V0ID8gLUVUSU1FRE9VVCA6IC1FQlVTWTsKIAog
CXJldHVybiByZXQ7Ci0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
