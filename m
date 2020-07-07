Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E26217901
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jul 2020 22:14:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15B7A894C5;
	Tue,  7 Jul 2020 20:13:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CE8B6E7D9
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jul 2020 20:13:03 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id z13so46596595wrw.5
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jul 2020 13:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WFOW4gT++YmCnjEMBR7D68rnZUAaxpD2kN9hzahCniw=;
 b=NjaGAbSC6ieCw+o13JLknjpy1WVp7+Fj2e9N0C2b6OCOtbyYMDjN0SFZbLHfb+xfUZ
 ojz1MHnaHqXj3KkbChlVYuP3Ya4lN7G+SHI5sOuLTS6lleUGlrq+uhR3KmuQGNpyuPWO
 zST7Qbzq97VIRBvuRY3fbcNcRnbFTDngLqmoo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WFOW4gT++YmCnjEMBR7D68rnZUAaxpD2kN9hzahCniw=;
 b=RZcdNXvLvOCsFvOFz97DGNhmnZzZmDYR1p2d+0jS7CgEh51OlLHDdz0te1Un8sfrba
 8+/wsb6I+AgfC8K+bNl0JzpRf7TquNt3dW+Ddn0lnzQsJWVO2DjlsaJwqPIUbMVnEZrE
 H2vozmTEwR4s1ANwjLu+4pKK8adijgNgblY7Dqe0scN+LqsEPo+oASaS0D9c5jh7BJFV
 TCb0oVzS880mVbys+rjXGrtzfxaT2+b4qQm5P2DyoHIZEsrK79KcUHEMptpfzX5CVFJ6
 Lutpfgqc+3kR3vlrfpLM5iOIpTZ62mZKGc8M/ECE/sr04zgzCJ97n5+6IQVUg3X0gxJ/
 q43Q==
X-Gm-Message-State: AOAM530bS6c3LPRpnO/WSShlyMkPNMl1on8273d5R20r0PzNh005kGxQ
 Eso1It3PHSaTqgonk09MHETqpvA4y7I=
X-Google-Smtp-Source: ABdhPJxz2+QUQcXCyxki0D2e+ndxvRp+10YXL0LWJsIgkTzFIG0bV94n9tB2byQ48J/mXJg0xj2TXw==
X-Received: by 2002:a5d:4f8b:: with SMTP id d11mr30381378wru.147.1594152781551; 
 Tue, 07 Jul 2020 13:13:01 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q7sm2515262wra.56.2020.07.07.13.13.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 13:13:00 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 17/25] drm/scheduler: use dma-fence annotations in main thread
Date: Tue,  7 Jul 2020 22:12:21 +0200
Message-Id: <20200707201229.472834-18-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200707201229.472834-1-daniel.vetter@ffwll.ch>
References: <20200707201229.472834-1-daniel.vetter@ffwll.ch>
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
Cc: linux-rdma@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 amd-gfx@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 linaro-mm-sig@lists.linaro.org, Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SWYgdGhlIHNjaGVkdWxlciBydCB0aHJlYWQgZ2V0cyBzdHVjayBvbiBhIG11dGV4IHRoYXQgd2Un
cmUgaG9sZGluZwp3aGlsZSB3YWl0aW5nIGZvciBncHUgd29ya2xvYWRzIHRvIGNvbXBsZXRlLCB3
ZSBoYXZlIGEgcHJvYmxlbS4KCkFkZCBkbWEtZmVuY2UgYW5ub3RhdGlvbnMgc28gdGhhdCBsb2Nr
ZGVwIGNhbiBjaGVjayB0aGlzIGZvciB1cy4KCkkndmUgdHJpZWQgdG8gcXVpdGUgY2FyZWZ1bGx5
IHJldmlldyB0aGlzLCBhbmQgSSB0aGluayBpdCdzIGF0IHRoZQpyaWdodCBzcG90LiBCdXQgb2J2
aW9zbHkgbm8gZXhwZXJ0IG9uIGRybSBzY2hlZHVsZXIuCgpDYzogbGludXgtbWVkaWFAdmdlci5r
ZXJuZWwub3JnCkNjOiBsaW5hcm8tbW0tc2lnQGxpc3RzLmxpbmFyby5vcmcKQ2M6IGxpbnV4LXJk
bWFAdmdlci5rZXJuZWwub3JnCkNjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzog
aW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogQ2hyaXMgV2lsc29uIDxjaHJpc0Bj
aHJpcy13aWxzb24uY28udWs+CkNjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9y
c3RAbGludXguaW50ZWwuY29tPgpDYzogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5p
Z0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGlu
dGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYyB8IDYg
KysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMgYi9kcml2ZXJzL2dwdS9kcm0vc2No
ZWR1bGVyL3NjaGVkX21haW4uYwppbmRleCBkNmVhYTIzYWQ3NDYuLjUyZjFhYjRiYzkyMiAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMKQEAgLTc2NSw5ICs3NjUsMTIgQEAg
c3RhdGljIGludCBkcm1fc2NoZWRfbWFpbih2b2lkICpwYXJhbSkKIAlzdHJ1Y3Qgc2NoZWRfcGFy
YW0gc3BhcmFtID0gey5zY2hlZF9wcmlvcml0eSA9IDF9OwogCXN0cnVjdCBkcm1fZ3B1X3NjaGVk
dWxlciAqc2NoZWQgPSAoc3RydWN0IGRybV9ncHVfc2NoZWR1bGVyICopcGFyYW07CiAJaW50IHI7
CisJYm9vbCBmZW5jZV9jb29raWU7CiAKIAlzY2hlZF9zZXRzY2hlZHVsZXIoY3VycmVudCwgU0NI
RURfRklGTywgJnNwYXJhbSk7CiAKKwlmZW5jZV9jb29raWUgPSBkbWFfZmVuY2VfYmVnaW5fc2ln
bmFsbGluZygpOworCiAJd2hpbGUgKCFrdGhyZWFkX3Nob3VsZF9zdG9wKCkpIHsKIAkJc3RydWN0
IGRybV9zY2hlZF9lbnRpdHkgKmVudGl0eSA9IE5VTEw7CiAJCXN0cnVjdCBkcm1fc2NoZWRfZmVu
Y2UgKnNfZmVuY2U7CkBAIC04MjUsNiArODI4LDkgQEAgc3RhdGljIGludCBkcm1fc2NoZWRfbWFp
bih2b2lkICpwYXJhbSkKIAogCQl3YWtlX3VwKCZzY2hlZC0+am9iX3NjaGVkdWxlZCk7CiAJfQor
CisJZG1hX2ZlbmNlX2VuZF9zaWduYWxsaW5nKGZlbmNlX2Nvb2tpZSk7CisKIAlyZXR1cm4gMDsK
IH0KIAotLSAKMi4yNy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
