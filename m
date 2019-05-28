Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1EDC2C26E
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 11:04:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 442CC6E0CD;
	Tue, 28 May 2019 09:04:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A072A89FEC
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 09:03:57 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id w37so30611366edw.4
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 02:03:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KOGyYDuulYoZlGMMrGlYnho9Xow/hNHN2r6g5KqqxbA=;
 b=RqQkZJ75Te20AO2zZg611SVm7p8QgGB07fWWykgyGMOah7Co9NYqOq7EqGk62wR/Ei
 oQm43ZJwC7NJA38dQefhedKpZqUeWppqnFK4477KwzcCgMOiNLo0mRILnNJp3nCJLn9h
 vbrJG10DaVh2KGQOXgqC70znSzKyQIxkcfb9M5g2xJOPcyQl1FkWEi2XFCFh1+pqaTlH
 d8UmGG+FJEwFHnh2pMGMQrFnp5TEswsTqpR27iWUHFHFApkwZ5frOGd3OCqfUdync3mw
 NhBpYh5kFxabakco3w3o9fnS3SHQzM1Xqds7deQp0od1omOTThSxV2XWasTCvFaHI7s+
 ZCZQ==
X-Gm-Message-State: APjAAAVAt7cuNouGmWOa1q7TNE35do4dV8J+6WUNfRpd2/xb8g7kXlpF
 GXmhIvkNv87TIJO2LknXwB+wuQ==
X-Google-Smtp-Source: APXvYqyUrqB+xoH0ka3duTbZa5FPC3QZa0uDwLH0U5RXdNxaQd1JKD8pOMMaPMJ2kKeKORQcacvUQg==
X-Received: by 2002:a50:e048:: with SMTP id g8mr128055262edl.26.1559034236177; 
 Tue, 28 May 2019 02:03:56 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id x49sm4072656edm.25.2019.05.28.02.03.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 May 2019 02:03:55 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH 31/33] fbcon: Document what I learned about fbcon locking
Date: Tue, 28 May 2019 11:03:02 +0200
Message-Id: <20190528090304.9388-32-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190528090304.9388-1-daniel.vetter@ffwll.ch>
References: <20190528090304.9388-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KOGyYDuulYoZlGMMrGlYnho9Xow/hNHN2r6g5KqqxbA=;
 b=LmD9YyG7s+OqvV8GaC+iTvVDRdtjPeq/zghiL4J+/ZI7u5Eg21vxnuzwTFovpBti8O
 3LjHgkfSbO5QNC3qJK3ek9epxYfj2V3oUkdq1yYwA2dDDqa0UrVbBDP43PYt6yNfhlLc
 AWLn+vFL5yhJ8lJhJdU43jJDDzQDEKyiJifa4=
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
 Yisheng Xie <ysxie@foxmail.com>, Hans de Goede <hdegoede@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SXQncyBub3QgcHJldHR5LgoKU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZl
dHRlckBpbnRlbC5jb20+ClJldmlld2VkLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5v
cmc+ClJldmlld2VkLWJ5OiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGlu
dXguaW50ZWwuY29tPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4K
Q2M6IEJhcnRsb21pZWogWm9sbmllcmtpZXdpY3ogPGIuem9sbmllcmtpZUBzYW1zdW5nLmNvbT4K
Q2M6IEhhbnMgZGUgR29lZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+CkNjOiBZaXNoZW5nIFhpZSA8
eXN4aWVAZm94bWFpbC5jb20+Ci0tLQogZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZiY29uLmMg
fCAxOSArKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYmNvbi5jIGIvZHJpdmVy
cy92aWRlby9mYmRldi9jb3JlL2ZiY29uLmMKaW5kZXggZmJkMjhhZWZmMzA3Li5kNmJhMzYxMGVl
ODMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYmNvbi5jCisrKyBiL2Ry
aXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYmNvbi5jCkBAIC04OCw2ICs4OCwyNSBAQAogIyAgZGVm
aW5lIERQUklOVEsoZm10LCBhcmdzLi4uKQogI2VuZGlmCiAKKy8qCisgKiBGSVhNRTogTG9ja2lu
ZworICoKKyAqIC0gZmJjb24gc3RhdGUgaXRzZWxmIGlzIHByb3RlY3RlZCBieSB0aGUgY29uc29s
ZV9sb2NrLCBhbmQgdGhlIGNvZGUgZG9lcyBhCisgKiAgIHByZXR0eSBnb29kIGpvYiBhdCBtYWtp
bmcgc3VyZSB0aGF0IGxvY2sgaXMgaGVsZCBldmVyeXdoZXJlIGl0J3MgbmVlZGVkLgorICoKKyAq
IC0gYWNjZXNzIHRvIHRoZSByZWdpc3RlcmVkX2ZiIGFycmF5IGlzIGVudGlyZWx5IHVucHJvdGVj
dGVkLiBUaGlzIHNob3VsZCB1c2UKKyAqICAgcHJvcGVyIG9iamVjdCBsaWZldGltZSBoYW5kbGlu
ZywgaS5lLiBnZXQvcHV0X2ZiX2luZm8uIFRoaXMgYWxzbyBtZWFucworICogICBzd2l0Y2hpbmcg
ZnJvbSBpbmRpY2VzIHRvIHByb3BlciBwb2ludGVycyBmb3IgZmJfaW5mbyBldmVyeXdoZXJlLgor
ICoKKyAqIC0gZmJjb24gZG9lc24ndCBib3RoZXIgd2l0aCBmYl9sb2NrL3VubG9jayBhdCBhbGwu
IFRoaXMgaXMgYnVnZ3ksIHNpbmNlIGl0CisgKiAgIG1lYW5zIGNvbmN1cnJlbnQgYWNjZXNzIHRv
IHRoZSBzYW1lIGZiZGV2IGZyb20gYm90aCBmYmNvbiBhbmQgdXNlcnNwYWNlCisgKiAgIHdpbGwg
YmxvdyB1cC4gVG8gZml4IHRoaXMgYWxsIGZiY29uIGNhbGxzIGZyb20gZmJtZW0uYyBuZWVkIHRv
IGJlIG1vdmVkIG91dAorICogICBvZiBmYl9sb2NrL3VubG9jayBwcm90ZWN0ZWQgc2VjdGlvbnMs
IHNpbmNlIG90aGVyd2lzZSB3ZSdsbCByZWN1cnNlIGFuZAorICogICBkZWFkbG9jayBldmVudHVh
bGx5LiBBc2lkZTogRHVlIHRvIHRoZXNlIGRlYWRsb2NrIGlzc3VlcyB0aGUgZmJkZXYgY29kZSBp
bgorICogICBmYm1lbS5jIGNhbm5vdCB1c2UgbG9ja2luZyBhc3NlcnRzLCBhbmQgdGhlcmUncyBs
b3RzIG9mIGNhbGxlcnMgd2hpY2ggZ2V0CisgKiAgIHRoZSBydWxlcyB3cm9uZywgZS5nLiBmYnN5
c2ZzLmMgZW50aXJlbHkgbWlzc2VkIGZiX2xvY2svdW5sb2NrIGNhbGxzIHRvby4KKyAqLworCiBl
bnVtIHsKIAlGQkNPTl9MT0dPX0NBTlNIT1cJPSAtMSwJLyogdGhlIGxvZ28gY2FuIGJlIHNob3du
ICovCiAJRkJDT05fTE9HT19EUkFXCQk9IC0yLAkvKiBkcmF3IHRoZSBsb2dvIHRvIGEgY29uc29s
ZSAqLwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
