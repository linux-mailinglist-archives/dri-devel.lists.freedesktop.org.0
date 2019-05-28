Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0672A2C273
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 11:05:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6CCA6E1B6;
	Tue, 28 May 2019 09:04:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEA2C6E1D7
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 09:04:01 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id g13so838474edu.5
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 02:04:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HU1EQ+v38P9QJolnmXZTrOO2rSD6T7u0Lqw2ZLkiLWs=;
 b=OrNZPsMrMQZPnMZld7otqWpz8CZ2C21wJuDSwrclcjVfdZvUtqJ3BUzru+L3Q7pFA2
 Hql7ac8whTC4df6AELqB9QvYYynSvLlG2tFtojOUyh/X0BxRUq6Y2ukBPqh9C0eJ0/Xb
 LPJ8w/o0lIHWVk4sn9fr/7aL3ecorh/1Ru8vJsLR0fgIFKVQtXz8lUq2uSlcdHsBqaCH
 GPmp2id5pUaazcCCtToLp50AMjNn2qBVZvX0NRRIA46zvL0YPGtW1sJHtGHEqg3k2yKe
 9UOPFrhf+rRkodtSBDNupeLDPoKhpEIoskG2WohLZ8beWb/ddHQjbAHQIo/bwUp8wE7O
 yr4g==
X-Gm-Message-State: APjAAAVPjciZnGmwZvOyyy7h2uxCwX8xYBOQLvtCyopbl4bjqZHtSQIX
 Enc7gyA1p/r9pK1Lb+eLq54uCg==
X-Google-Smtp-Source: APXvYqz9RdhfaDx2JF7fgePZMlTSmHplGB4DlBCTqMFDkYawJ7AszXHKVriOXKY3FK7S7TQRU+5DbA==
X-Received: by 2002:a50:b3a6:: with SMTP id
 s35mr129117953edd.220.1559034238538; 
 Tue, 28 May 2019 02:03:58 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id x49sm4072656edm.25.2019.05.28.02.03.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 May 2019 02:03:57 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH 33/33] backlight: simplify lcd notifier
Date: Tue, 28 May 2019 11:03:04 +0200
Message-Id: <20190528090304.9388-34-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190528090304.9388-1-daniel.vetter@ffwll.ch>
References: <20190528090304.9388-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HU1EQ+v38P9QJolnmXZTrOO2rSD6T7u0Lqw2ZLkiLWs=;
 b=I/7AsYIlcIbykNwShZDT9vqdf0W2l+mAfbQvvY1pNwfgs1W0LbkA4t+YgIW85/3uHO
 bTSykFOJBi17eYvOrMy8aAuO/GbqB2OLqAj4V9SBcfmO69y+tfbM0o7u5JDDHKRZ4I+y
 c4JkYTOM0jo97idl5z+S/KV2EusVrq92+9MXo=
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 linux-fbdev@vger.kernel.org, DRI Development <dri-devel@lists.freedesktop.org>,
 Jingoo Han <jingoohan1@gmail.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Lee Jones <lee.jones@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2l0aCBhbGwgdGhlIHdvcmsgSSd2ZSBkb25lIG9uIHJlcGxhY2luZyBmYiBub3RpZmllciBjYWxs
cyB3aXRoIGRpcmVjdApjYWxscyBpbnRvIGZiY29uIHRoZSBiYWNrbGlnaHQvbGNkIG5vdGlmaWVy
IGlzIHRoZSBvbmx5IHVzZXIgbGVmdC4KCkl0IHdpbGwgb25seSByZWNlaXZlIGV2ZW50cyBub3cg
dGhhdCBpdCBjYXJlcyBhYm91dCwgaGVuY2Ugd2UgY2FuCnJlbW92ZSB0aGlzIGNoZWNrLgoKU2ln
bmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+ClJldmll
d2VkLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+ClJldmlld2VkLWJ5OiBNYWFy
dGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgpDYzogTGVl
IEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KQ2M6IERhbmllbCBUaG9tcHNvbiA8ZGFuaWVs
LnRob21wc29uQGxpbmFyby5vcmc+CkNjOiBKaW5nb28gSGFuIDxqaW5nb29oYW4xQGdtYWlsLmNv
bT4KLS0tCiBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9sY2QuYyB8IDExIC0tLS0tLS0tLS0tCiAx
IGZpbGUgY2hhbmdlZCwgMTEgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRl
by9iYWNrbGlnaHQvbGNkLmMgYi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9sY2QuYwppbmRleCBl
Y2RkYTA2OTg5ZDAuLmQ2YjY1M2FhNGVlOSAxMDA2NDQKLS0tIGEvZHJpdmVycy92aWRlby9iYWNr
bGlnaHQvbGNkLmMKKysrIGIvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvbGNkLmMKQEAgLTMwLDE3
ICszMCw2IEBAIHN0YXRpYyBpbnQgZmJfbm90aWZpZXJfY2FsbGJhY2soc3RydWN0IG5vdGlmaWVy
X2Jsb2NrICpzZWxmLAogCXN0cnVjdCBsY2RfZGV2aWNlICpsZDsKIAlzdHJ1Y3QgZmJfZXZlbnQg
KmV2ZGF0YSA9IGRhdGE7CiAKLQkvKiBJZiB3ZSBhcmVuJ3QgaW50ZXJlc3RlZCBpbiB0aGlzIGV2
ZW50LCBza2lwIGl0IGltbWVkaWF0ZWx5IC4uLiAqLwotCXN3aXRjaCAoZXZlbnQpIHsKLQljYXNl
IEZCX0VWRU5UX0JMQU5LOgotCWNhc2UgRkJfRVZFTlRfTU9ERV9DSEFOR0U6Ci0JY2FzZSBGQl9F
QVJMWV9FVkVOVF9CTEFOSzoKLQljYXNlIEZCX1JfRUFSTFlfRVZFTlRfQkxBTks6Ci0JCWJyZWFr
OwotCWRlZmF1bHQ6Ci0JCXJldHVybiAwOwotCX0KLQogCWxkID0gY29udGFpbmVyX29mKHNlbGYs
IHN0cnVjdCBsY2RfZGV2aWNlLCBmYl9ub3RpZik7CiAJaWYgKCFsZC0+b3BzKQogCQlyZXR1cm4g
MDsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
