Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60AEB7086B
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 20:25:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D592F89DBD;
	Mon, 22 Jul 2019 18:25:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B78189DB8
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 18:25:08 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id g2so17781138pfq.0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 11:25:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6lPTFkPAyVmuitAa4mWi4F3NQrNbt8SbSytM3vpn0a4=;
 b=FSnDUaE1mj4kwpLd+5NdsKFEtlvxW04/3nt3A8bFlTaYbpNhJLbbakqrCHkUr4/DdW
 clnAF0ABzi9StbuxdDbGaZx14G9lwwGTRkpTOrZaVQC3P/9Y6FooOvHcW13kOrmYb/c3
 +Tztq/nd9WQrPz0ZmmXY8BFVxisht2HcFt1uRZ8cFuI+Sm1Isaw+3VB3UPT+Vb87hVg9
 y4TjzsU72kMVSvq3BQp+/Krw1HpAshxlpKL97QynYisg4QfYhN0+m+BeRruEa1FE6Fol
 I6EW674WO0aMIagPNEQc71ENq+4kh4HBR+hcjSi70DCMB0kAlIymex2lqktEwKPOWGAa
 fFvw==
X-Gm-Message-State: APjAAAVItDjP+G60adDle3LdF5DKciXBv7kCDPGHY3PqcNfhagT7M7DS
 bN1iq5ixbxYbSsLt3ufRAmBvSA==
X-Google-Smtp-Source: APXvYqwI+vy0ViASrIf3xCLwt0/dbuCnHEOUXK68q+q6D/Uk77Ehyv/s9HJa76vJ9R6YVsvovtfFjg==
X-Received: by 2002:a63:5a4b:: with SMTP id k11mr13577531pgm.143.1563819907864; 
 Mon, 22 Jul 2019 11:25:07 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id a3sm36117683pfl.145.2019.07.22.11.25.07
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 22 Jul 2019 11:25:07 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 4/4] video: amba-clcd: Spout an error if
 of_get_display_timing() gives an error
Date: Mon, 22 Jul 2019 11:24:39 -0700
Message-Id: <20190722182439.44844-5-dianders@chromium.org>
X-Mailer: git-send-email 2.22.0.657.g960e92d24f-goog
In-Reply-To: <20190722182439.44844-1-dianders@chromium.org>
References: <20190722182439.44844-1-dianders@chromium.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6lPTFkPAyVmuitAa4mWi4F3NQrNbt8SbSytM3vpn0a4=;
 b=HbRHDvfM0apfHIujyRj3077zDqjerxdCRfAZo6YgD6vz6Zsc15GjN+7nPgKerlEBLN
 4yAfZGf9Wq/qgGh8pvCNUq3+QtBcnC3ykrSvr7kATX6tqP81wL1yoSc8P/qF2fL4tWaR
 hi05VT7unfKPLXhDchw25LWu4Cufs7dF1a/eM=
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
Cc: linux-fbdev@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gdGhlIHBhdGNoICgidmlkZW86IG9mOiBkaXNwbGF5X3RpbWluZzogRG9uJ3QgeWVsbCBpZiBu
byB0aW1pbmcgbm9kZQppcyBwcmVzZW50Iikgd2UnbGwgc3RvcCBzcG91dGluZyBhbiBlcnJvciBk
aXJlY3RseSBpbgpvZl9nZXRfZGlzcGxheV90aW1pbmcoKSBpZiBubyBub2RlIGlzIHByZXNlbnQu
ICBQcmVzdW1hYmx5IGFtYmEtY2xjZApzaG91bGQgdGFrZSBjaGFyZ2Ugb2Ygc3BvdXRpbmcgaXRz
IG93biBlcnJvciBub3cuCgpOT1RFOiB3ZSdsbCBwcmludCB0d28gZXJyb3JzIGlmIHRoZSBub2Rl
IHdhcyBwcmVzZW50IGJ1dCB0aGVyZSB3ZXJlCnByb2JsZW1zIHBhcnNpbmcgdGhlIHRpbWluZyBu
b2RlIChvbmUgaW4gb2ZfcGFyc2VfZGlzcGxheV90aW1pbmcoKSBhbmQKdGhpcyBuZXcgb25lKS4g
IFNpbmNlIHRoaXMgaXMgYSBmYXRhbCBlcnJvciBmb3IgdGhlIGRyaXZlcidzIHByb2JlCihhbmQg
cHJlc3VtYWJseSBzb21lb25lIHdpbGwgYmUgZGVidWdnaW5nKSwgdGhpcyBzaG91bGQgYmUgT0su
CgpTaWduZWQtb2ZmLWJ5OiBEb3VnbGFzIEFuZGVyc29uIDxkaWFuZGVyc0BjaHJvbWl1bS5vcmc+
Ci0tLQoKIGRyaXZlcnMvdmlkZW8vZmJkZXYvYW1iYS1jbGNkLmMgfCA0ICsrKy0KIDEgZmlsZSBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL3ZpZGVvL2ZiZGV2L2FtYmEtY2xjZC5jIGIvZHJpdmVycy92aWRlby9mYmRldi9hbWJhLWNs
Y2QuYwppbmRleCA4OTMyNGU0MmEwMzMuLjdkZTQzYmU2ZWYyYyAxMDA2NDQKLS0tIGEvZHJpdmVy
cy92aWRlby9mYmRldi9hbWJhLWNsY2QuYworKysgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2FtYmEt
Y2xjZC5jCkBAIC01NjEsOCArNTYxLDEwIEBAIHN0YXRpYyBpbnQgY2xjZGZiX29mX2dldF9kcGlf
cGFuZWxfbW9kZShzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGUsCiAJc3RydWN0IHZpZGVvbW9kZSB2
aWRlbzsKIAogCWVyciA9IG9mX2dldF9kaXNwbGF5X3RpbWluZyhub2RlLCAicGFuZWwtdGltaW5n
IiwgJnRpbWluZyk7Ci0JaWYgKGVycikKKwlpZiAoZXJyKSB7CisJCXByX2VycigiJXBPRjogcHJv
YmxlbXMgcGFyc2luZyBwYW5lbC10aW1pbmcgKCVkKVxuIiwgbm9kZSwgZXJyKTsKIAkJcmV0dXJu
IGVycjsKKwl9CiAKIAl2aWRlb21vZGVfZnJvbV90aW1pbmcoJnRpbWluZywgJnZpZGVvKTsKIAot
LSAKMi4yMi4wLjY1Ny5nOTYwZTkyZDI0Zi1nb29nCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
