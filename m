Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0861CEFFC
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 11:00:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5716A6E8B3;
	Tue, 12 May 2020 09:00:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D70246E8AD
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 09:00:06 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id l17so793701wrr.4
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 02:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QpRcEBLBFti7+uwIPhFpaG5e28opFzcZsYVebGatC0I=;
 b=QOpkeUs0h0wN4sti4X0g6ThD3SrxXZsFWkczPFMfaK9K848FuZY/LBbwUozpO63nQf
 eTJs+eMU1PYoj07tdTFH4MaPU0yMQAi0jxHqRvYdOuXMTkIN/Mt01aR+HFippq1ZJM2r
 G6xGmiSojmbfOZiM1YCpKK0rOM2Epr1zxLZfQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QpRcEBLBFti7+uwIPhFpaG5e28opFzcZsYVebGatC0I=;
 b=BP+uL40Bj6wze+/IKWT0l8bgKa7oTIGLwStRgqhN5sxTkHAnIfAUadO69rbc3bWR8G
 tLAbFdqULJVN4D3elPKb3tuiKAFAW4BzyKmI8Tj0Ad4yfUwPGKYg1KTVxRUv3YIJLL6v
 k+x6oMUu/Wmfxek6f5k1M0wFfU9SmJsxMqCWwIfN2NWvmP7UeFh7wB1P/DCR6eXqYreK
 it2ZoI4dfAXs3zJw/JeiBL6w3rG9f2uTqQ+vLCl+LrB8AlCYJh1UK0RdEq6YxzW3WZ+m
 rysWh2Yu91E74qesFDkO7kxnw4jszzgpKY3sW7D6yc8dMNXSdDpeIkeSqB6grd5z6yPC
 63Ug==
X-Gm-Message-State: AGi0Puaf9RJVV+UhpJTUH4VpDzvR87JKEnkh7M00Hwj6dsGouq+48w80
 q2sixW+Ba6sqLoV0iltC3nM9MXwStjw=
X-Google-Smtp-Source: APiQypKd1E6Oeu9FhxQgfCRXfBgs5PqqzFNBcX4uC9QIYdSJsh2y79L6Is6aCs3MeuVyGs7xUaybiQ==
X-Received: by 2002:adf:8302:: with SMTP id 2mr24564990wrd.114.1589274005258; 
 Tue, 12 May 2020 02:00:05 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y10sm18845457wrd.95.2020.05.12.02.00.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 02:00:04 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [RFC 08/17] drm/scheduler: use dma-fence annotations in main thread
Date: Tue, 12 May 2020 10:59:35 +0200
Message-Id: <20200512085944.222637-9-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200512085944.222637-1-daniel.vetter@ffwll.ch>
References: <20200512085944.222637-1-daniel.vetter@ffwll.ch>
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
 intel-gfx@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
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
ZWR1bGVyL3NjaGVkX21haW4uYwppbmRleCAyZjMxOTEwMmFlOWYuLjA2YTczNmU1MDZhZCAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMKQEAgLTc2Myw5ICs3NjMsMTIgQEAg
c3RhdGljIGludCBkcm1fc2NoZWRfbWFpbih2b2lkICpwYXJhbSkKIAlzdHJ1Y3Qgc2NoZWRfcGFy
YW0gc3BhcmFtID0gey5zY2hlZF9wcmlvcml0eSA9IDF9OwogCXN0cnVjdCBkcm1fZ3B1X3NjaGVk
dWxlciAqc2NoZWQgPSAoc3RydWN0IGRybV9ncHVfc2NoZWR1bGVyICopcGFyYW07CiAJaW50IHI7
CisJYm9vbCBmZW5jZV9jb29raWU7CiAKIAlzY2hlZF9zZXRzY2hlZHVsZXIoY3VycmVudCwgU0NI
RURfRklGTywgJnNwYXJhbSk7CiAKKwlmZW5jZV9jb29raWUgPSBkbWFfZmVuY2VfYmVnaW5fc2ln
bmFsbGluZygpOworCiAJd2hpbGUgKCFrdGhyZWFkX3Nob3VsZF9zdG9wKCkpIHsKIAkJc3RydWN0
IGRybV9zY2hlZF9lbnRpdHkgKmVudGl0eSA9IE5VTEw7CiAJCXN0cnVjdCBkcm1fc2NoZWRfZmVu
Y2UgKnNfZmVuY2U7CkBAIC04MjMsNiArODI2LDkgQEAgc3RhdGljIGludCBkcm1fc2NoZWRfbWFp
bih2b2lkICpwYXJhbSkKIAogCQl3YWtlX3VwKCZzY2hlZC0+am9iX3NjaGVkdWxlZCk7CiAJfQor
CisJZG1hX2ZlbmNlX2VuZF9zaWduYWxsaW5nKGZlbmNlX2Nvb2tpZSk7CisKIAlyZXR1cm4gMDsK
IH0KIAotLSAKMi4yNi4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
