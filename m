Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03DFC9A550
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 04:12:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 098186EBA7;
	Fri, 23 Aug 2019 02:12:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D17306EBA5
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 02:12:29 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id f17so7407113otq.4
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 19:12:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1n4qe+AkzzJcIOZArT5eHMvskMvaiSyGwRJQ9TgkdLc=;
 b=lP1DFb8+WWIRd+rbFO6Z/X+Gu+2iDhNZBP7KhZOppZrGJuUWPD3d36dVr+xmR5bcWU
 scHPakxeRzIA/0FU/MqWdqVtYNdXBjf3NZ3s38DFXBFYGZX9oZm8wnnMKdyOBUuqbkHz
 tIo19FcP3xlqp/S6Wh9r2NpICoKrGbHoi2cSqRkpJWUfbz7maHEb1tDirxN+VSdGrRlj
 QFrwN2vbMFWW7+Pp8vSYA7U8HESuOayK+be5IFExImbAhLcaFcWrxiKlKgqsMAyb86RB
 ucb3UtHXlP40cWayqbhzvV/Z0PcszLoXaRd7NeSw7nbGpCqA1UzdvUVPL3l0ZTj6Jmjq
 NbTQ==
X-Gm-Message-State: APjAAAVma44JFRaeS4t7DdtjapikwWmhkXvBnGI3y4RUSUPzGqQ9hjXK
 Ah48F2LYyIayVinzmwJsaDK/1Is=
X-Google-Smtp-Source: APXvYqzAJjpJeh1FRJ0GwChhbAoTBuGB5Kq+gWIX3cgSafUjG5jTUWhYKcDecCu5oeVbpsNlnH6cKw==
X-Received: by 2002:a9d:77c4:: with SMTP id w4mr2319524otl.40.1566526348479;
 Thu, 22 Aug 2019 19:12:28 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id c1sm457747oic.31.2019.08.22.19.12.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2019 19:12:28 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 8/8] drm/panfrost: Remove unnecessary flushing from
 tlb_inv_context
Date: Thu, 22 Aug 2019 21:12:16 -0500
Message-Id: <20190823021216.5862-9-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190823021216.5862-1-robh@kernel.org>
References: <20190823021216.5862-1-robh@kernel.org>
MIME-Version: 1.0
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>, Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dGxiX2ludl9jb250ZXh0KCkgaG9vayBpcyBvbmx5IGNhbGxlZCB3aGVuIGZyZWVpbmcgdGhlIHBh
Z2UgdGFibGVzLiBUaGVyZSdzCm5vIHBvaW50IGluIGZsdXNoaW5nIG9ubHkgdG8gZnJlZSB0aGUg
cGFnZSB0YWJsZXMgaW1tZWRpYXRlbHkgZm9sbG93aW5nLgpUaGVyZSBpcyBhbHNvIGEgcHJvYmxl
bSB0aGF0IHdlIGNvdWxkIGJlIGFjY2Vzc2luZyB0aGUgaC93IHdoZW4gc3VzcGVuZGVkLgoKQ2M6
IFRvbWV1IFZpem9zbyA8dG9tZXUudml6b3NvQGNvbGxhYm9yYS5jb20+CkNjOiBTdGV2ZW4gUHJp
Y2UgPHN0ZXZlbi5wcmljZUBhcm0uY29tPgpDYzogQWx5c3NhIFJvc2VuendlaWcgPGFseXNzYS5y
b3Nlbnp3ZWlnQGNvbGxhYm9yYS5jb20+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXgu
aWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+ClNpZ25lZC1vZmYtYnk6IFJv
YiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Ci0tLQp2MjogbmV3IHBhdGNoCgogZHJpdmVycy9n
cHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X21tdS5jIHwgNiArLS0tLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfbW11LmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3Qv
cGFuZnJvc3RfbW11LmMKaW5kZXggY2NmNjcxYTljM2ZiLi45Zjg1Mjc1YTg5NmMgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9tbXUuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfbW11LmMKQEAgLTMyOCwxMSArMzI4LDcgQEAgdm9p
ZCBwYW5mcm9zdF9tbXVfdW5tYXAoc3RydWN0IHBhbmZyb3N0X2dlbV9vYmplY3QgKmJvKQogfQog
CiBzdGF0aWMgdm9pZCBtbXVfdGxiX2ludl9jb250ZXh0X3MxKHZvaWQgKmNvb2tpZSkKLXsKLQlz
dHJ1Y3QgcGFuZnJvc3RfZmlsZV9wcml2ICpwcml2ID0gY29va2llOwotCi0JbW11X2h3X2RvX29w
ZXJhdGlvbihwcml2LT5wZmRldiwgJnByaXYtPm1tdSwgMCwgfjBVTCwgQVNfQ09NTUFORF9GTFVT
SF9NRU0pOwotfQore30KIAogc3RhdGljIHZvaWQgbW11X3RsYl9pbnZfcmFuZ2Vfbm9zeW5jKHVu
c2lnbmVkIGxvbmcgaW92YSwgc2l6ZV90IHNpemUsCiAJCQkJICAgICBzaXplX3QgZ3JhbnVsZSwg
Ym9vbCBsZWFmLCB2b2lkICpjb29raWUpCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
