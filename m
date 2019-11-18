Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADBB100297
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2019 11:36:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D79C66E3E1;
	Mon, 18 Nov 2019 10:36:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6BB76E07B
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 10:35:54 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id b11so16778781wmb.5
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 02:35:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WOwJZP0J7iDFrucO385G7SzgcBLPJoOGi9VDEvyVQfk=;
 b=I8FSL2MVlBpv7mqCCA5iSQPIF+Oq+8JA4e4mTJf3vj+h2kzO5h8324a9v1hor+/SuH
 cnTg91jiFrCGN+gs4/t57PeoCMPCZHHPXiRrmklMgJ4+B3e+7jyL/jxivk3fqKBhn5Gi
 IOV+IGeGA90iYCwX7jxZqrR+F0V5p+q956WeoYK1Cwk5JJFMqFHjHzJycbTUlK9kzbJp
 ueKFibSFa9JBDMcn0GV9lhAw8nvWUQBQFiii4Pfft1lQv4XqKjYfBri+tIshr7A8ueo5
 rUzeuordhLYT0t2qlQH7UvMlYHjKj4pdG+h9YQcmk1leYNU9hAJX9cScvj/avyqkUXFp
 Pobw==
X-Gm-Message-State: APjAAAUwBNXaEK2vuZOduZGb297UXsBX0N/8Od9rHAEDvKA0KIDqNWdw
 JvRKwn84auhkcME1lnky0ywxX4Tdz1k=
X-Google-Smtp-Source: APXvYqyv++eTh4dfRe6HPZGN9Rfh3IWSCLv9l/B563p4a/JGelFE1fu2E2/VaqryK02I8smzGjsNXg==
X-Received: by 2002:a1c:1fca:: with SMTP id
 f193mr26445746wmf.173.1574073353073; 
 Mon, 18 Nov 2019 02:35:53 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id j2sm22749200wrt.61.2019.11.18.02.35.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 02:35:52 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 08/15] drm/tegra: Remove dma_buf->k(un)map
Date: Mon, 18 Nov 2019 11:35:29 +0100
Message-Id: <20191118103536.17675-9-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191118103536.17675-1-daniel.vetter@ffwll.ch>
References: <20191118103536.17675-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WOwJZP0J7iDFrucO385G7SzgcBLPJoOGi9VDEvyVQfk=;
 b=liBzcF0q0R7pU1njSk5pcTNLImCXtbYEylrqni9HUYs9TtIojj7P4J1HU/XVNGZg9x
 j22qg32BjvSkZyKX9+vta5Kg0slb3+0yLSF/KCogPIQanRkFVTULjk1mbmloGzfeBCFb
 VwaOGEsVwJQVkXWz774gqhuoIxeyasmJ0BbY0=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm8gaW4tdHJlZSB1c2VycyBsZWZ0LgoKU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFu
aWVsLnZldHRlckBpbnRlbC5jb20+CkNjOiBUaGllcnJ5IFJlZGluZyA8dGhpZXJyeS5yZWRpbmdA
Z21haWwuY29tPgpDYzogSm9uYXRoYW4gSHVudGVyIDxqb25hdGhhbmhAbnZpZGlhLmNvbT4KQ2M6
IGxpbnV4LXRlZ3JhQHZnZXIua2VybmVsLm9yZwotLS0KIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9n
ZW0uYyB8IDEyIC0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEyIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9nZW0uYyBiL2RyaXZlcnMvZ3B1L2Ry
bS90ZWdyYS9nZW0uYwppbmRleCA2NjJjYjdjODdlZjUuLjg0YmIyOTA3MDUzNiAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2dlbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdy
YS9nZW0uYwpAQCAtNTg1LDE2ICs1ODUsNiBAQCBzdGF0aWMgaW50IHRlZ3JhX2dlbV9wcmltZV9l
bmRfY3B1X2FjY2VzcyhzdHJ1Y3QgZG1hX2J1ZiAqYnVmLAogCXJldHVybiAwOwogfQogCi1zdGF0
aWMgdm9pZCAqdGVncmFfZ2VtX3ByaW1lX2ttYXAoc3RydWN0IGRtYV9idWYgKmJ1ZiwgdW5zaWdu
ZWQgbG9uZyBwYWdlKQotewotCXJldHVybiBOVUxMOwotfQotCi1zdGF0aWMgdm9pZCB0ZWdyYV9n
ZW1fcHJpbWVfa3VubWFwKHN0cnVjdCBkbWFfYnVmICpidWYsIHVuc2lnbmVkIGxvbmcgcGFnZSwK
LQkJCQkgICB2b2lkICphZGRyKQotewotfQotCiBzdGF0aWMgaW50IHRlZ3JhX2dlbV9wcmltZV9t
bWFwKHN0cnVjdCBkbWFfYnVmICpidWYsIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKQogewog
CXN0cnVjdCBkcm1fZ2VtX29iamVjdCAqZ2VtID0gYnVmLT5wcml2OwpAQCAtNjI1LDggKzYxNSw2
IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZG1hX2J1Zl9vcHMgdGVncmFfZ2VtX3ByaW1lX2RtYWJ1
Zl9vcHMgPSB7CiAJLnJlbGVhc2UgPSB0ZWdyYV9nZW1fcHJpbWVfcmVsZWFzZSwKIAkuYmVnaW5f
Y3B1X2FjY2VzcyA9IHRlZ3JhX2dlbV9wcmltZV9iZWdpbl9jcHVfYWNjZXNzLAogCS5lbmRfY3B1
X2FjY2VzcyA9IHRlZ3JhX2dlbV9wcmltZV9lbmRfY3B1X2FjY2VzcywKLQkubWFwID0gdGVncmFf
Z2VtX3ByaW1lX2ttYXAsCi0JLnVubWFwID0gdGVncmFfZ2VtX3ByaW1lX2t1bm1hcCwKIAkubW1h
cCA9IHRlZ3JhX2dlbV9wcmltZV9tbWFwLAogCS52bWFwID0gdGVncmFfZ2VtX3ByaW1lX3ZtYXAs
CiAJLnZ1bm1hcCA9IHRlZ3JhX2dlbV9wcmltZV92dW5tYXAsCi0tIAoyLjI0LjAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
