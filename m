Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D22B3C69
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2019 16:19:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE37D6E992;
	Mon, 16 Sep 2019 14:19:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B8BF6E991;
 Mon, 16 Sep 2019 14:19:34 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id v17so10115104wml.4;
 Mon, 16 Sep 2019 07:19:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yL/L2z6Q2Ah2G9I8q0Jb6SPuK/tQzLALFip3snuuIEE=;
 b=Nk/ceFCIKpBou+l7y4WPEdGNhvXSBf15sZgpLqM+VEveJT9ez17EO8N6CfQKqK9bsV
 vX8k3SKdH11dOSo924sEvmzqskRBk/Nn6Y3wUXSPlsNQBK/IwZA6twyKd9MAzFRTHq0k
 A2PzJ5G7DEbiuxYyOVFKK6v+l6jVJhlTtDLy8ZzLBOtShcFKb836z1rLezQhxY6eBd5g
 DlNSdEQ73/xaxI7D7eef5L59RApsrgm9YiTeT5VSb6ESU8DxUvgL9cY+QVt1J+bWlH04
 a4rhUZASczpaz9d0BZR4sBrv4kyB3K+dhzlog9WY3I8YqA99qXecXoEUIg8zD2ZxqRW8
 1yNg==
X-Gm-Message-State: APjAAAVEMFNy1TYyVDJ2CElXGa48pPgQJLett/Riy0x78vnHQKnH/ZIz
 yyPIgeAhxlAkwXKggZ87KOJlsiba
X-Google-Smtp-Source: APXvYqzo2EmOCUIShBC0R1WXM7aGbv6nIj5/XWN1pVN3vGxNA19/9apDz9vt/jS7qHSIc0f7ckERqA==
X-Received: by 2002:a7b:c156:: with SMTP id z22mr3240640wmi.142.1568643572624; 
 Mon, 16 Sep 2019 07:19:32 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id x6sm18865922wmf.38.2019.09.16.07.19.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2019 07:19:31 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Ben Skeggs <bskeggs@redhat.com>
Subject: [PATCH 2/4] drm/nouveau: prime: Extend DMA reservation object lock
Date: Mon, 16 Sep 2019 16:19:24 +0200
Message-Id: <20190916141926.8594-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190916141926.8594-1-thierry.reding@gmail.com>
References: <20190916141926.8594-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yL/L2z6Q2Ah2G9I8q0Jb6SPuK/tQzLALFip3snuuIEE=;
 b=Ag73JeGw26DnoPxtGcJSmpLT6Bc2PbDsjURgeBcfO2GEfq962stba2/XEWq09pOVL9
 ofaJRIwS2WpNIFhUE+Csqa5UCZGekBjUwnTH4ZMGca8plegYr2FabKlFHKvZe4CGfyYH
 GVPeofT2CA1dljnH/3YkV9uuU2AOBPeWE+UGaRcbfptSRHLRoTwvYIBv3Nksxb0T96Op
 i78zcVl8KgO7cVxNLcKpLU0InM2cgr9NSM8QKdOWXRNvwp30OrYs+Aqh1zNvZnvIOXC4
 Fb4XhivmIJXmCEcr52DKwxYeH34TJKMhRh7EDs0WchPBGwbwkBLKaEK1FS+6cGS0zcG9
 nybQ==
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KClByaW9yIHRvIGNvbW1p
dCAwMTljYmQ0YTRmZWIgKCJkcm0vbm91dmVhdTogSW5pdGlhbGl6ZSBHRU0gb2JqZWN0IGJlZm9y
ZQpUVE0gb2JqZWN0IiksIHRoZSByZXNlcnZhdGlvbiBvYmplY3Qgd2FzIGxvY2tlZCBhY3Jvc3Mg
YWxsIG9mIHRoZSBidWZmZXIKb2JqZWN0IGNyZWF0aW9uLgoKQWZ0ZXIgc3BsaXR0aW5nIG5vdXZl
YXVfYm9fbmV3KCkgaW50byBzZXBhcmF0ZSBub3V2ZWF1X2JvX2FsbG9jKCkgYW5kCm5vdXZlYXVf
Ym9faW5pdCgpIGZ1bmN0aW9ucywgdGhlIHJlc2VydmF0aW9uIG9iamVjdCBpcyBwYXNzZWQgdG8g
dGhlCmxhdHRlciwgc28gdGhlIGxvY2sgbmVlZHMgdG8gYmUgaGVsZCBhY3Jvc3MgdGhhdCBmdW5j
dGlvbiBhcyB3ZWxsLgoKRml4ZXM6IDAxOWNiZDRhNGZlYiAoImRybS9ub3V2ZWF1OiBJbml0aWFs
aXplIEdFTSBvYmplY3QgYmVmb3JlIFRUTSBvYmplY3QiKQpTaWduZWQtb2ZmLWJ5OiBUaGllcnJ5
IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1
L25vdXZlYXVfcHJpbWUuYyB8IDIwICsrKysrKysrKysrKysrLS0tLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgMTQgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3ByaW1lLmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVh
dS9ub3V2ZWF1X3ByaW1lLmMKaW5kZXggNjU2YzMzNGVlN2Q5Li5iYWU2YTNlY2NlZTAgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfcHJpbWUuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3ByaW1lLmMKQEAgLTYwLDYgKzYwLDcgQEAgc3Ry
dWN0IGRybV9nZW1fb2JqZWN0ICpub3V2ZWF1X2dlbV9wcmltZV9pbXBvcnRfc2dfdGFibGUoc3Ry
dWN0IGRybV9kZXZpY2UgKmRldiwKIAkJCQkJCQkgc3RydWN0IHNnX3RhYmxlICpzZykKIHsKIAlz
dHJ1Y3Qgbm91dmVhdV9kcm0gKmRybSA9IG5vdXZlYXVfZHJtKGRldik7CisJc3RydWN0IGRybV9n
ZW1fb2JqZWN0ICpvYmo7CiAJc3RydWN0IG5vdXZlYXVfYm8gKm52Ym87CiAJc3RydWN0IGRtYV9y
ZXN2ICpyb2JqID0gYXR0YWNoLT5kbWFidWYtPnJlc3Y7CiAJdTY0IHNpemUgPSBhdHRhY2gtPmRt
YWJ1Zi0+c2l6ZTsKQEAgLTcxLDkgKzcyLDEwIEBAIHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqbm91
dmVhdV9nZW1fcHJpbWVfaW1wb3J0X3NnX3RhYmxlKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCiAK
IAlkbWFfcmVzdl9sb2NrKHJvYmosIE5VTEwpOwogCW52Ym8gPSBub3V2ZWF1X2JvX2FsbG9jKCZk
cm0tPmNsaWVudCwgJnNpemUsICZhbGlnbiwgZmxhZ3MsIDAsIDApOwotCWRtYV9yZXN2X3VubG9j
ayhyb2JqKTsKLQlpZiAoSVNfRVJSKG52Ym8pKQotCQlyZXR1cm4gRVJSX0NBU1QobnZibyk7CisJ
aWYgKElTX0VSUihudmJvKSkgeworCQlvYmogPSBFUlJfQ0FTVChudmJvKTsKKwkJZ290byB1bmxv
Y2s7CisJfQogCiAJbnZiby0+dmFsaWRfZG9tYWlucyA9IE5PVVZFQVVfR0VNX0RPTUFJTl9HQVJU
OwogCkBAIC04MiwxNiArODQsMjIgQEAgc3RydWN0IGRybV9nZW1fb2JqZWN0ICpub3V2ZWF1X2dl
bV9wcmltZV9pbXBvcnRfc2dfdGFibGUoc3RydWN0IGRybV9kZXZpY2UgKmRldiwKIAlyZXQgPSBk
cm1fZ2VtX29iamVjdF9pbml0KGRldiwgJm52Ym8tPmJvLmJhc2UsIHNpemUpOwogCWlmIChyZXQp
IHsKIAkJbm91dmVhdV9ib19yZWYoTlVMTCwgJm52Ym8pOwotCQlyZXR1cm4gRVJSX1BUUigtRU5P
TUVNKTsKKwkJb2JqID0gRVJSX1BUUigtRU5PTUVNKTsKKwkJZ290byB1bmxvY2s7CiAJfQogCiAJ
cmV0ID0gbm91dmVhdV9ib19pbml0KG52Ym8sIHNpemUsIGFsaWduLCBmbGFncywgc2csIHJvYmop
OwogCWlmIChyZXQpIHsKIAkJbm91dmVhdV9ib19yZWYoTlVMTCwgJm52Ym8pOwotCQlyZXR1cm4g
RVJSX1BUUihyZXQpOworCQlvYmogPSBFUlJfUFRSKHJldCk7CisJCWdvdG8gdW5sb2NrOwogCX0K
IAotCXJldHVybiAmbnZiby0+Ym8uYmFzZTsKKwlvYmogPSAmbnZiby0+Ym8uYmFzZTsKKwordW5s
b2NrOgorCWRtYV9yZXN2X3VubG9jayhyb2JqKTsKKwlyZXR1cm4gb2JqOwogfQogCiBpbnQgbm91
dmVhdV9nZW1fcHJpbWVfcGluKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqKQotLSAKMi4yMy4w
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
