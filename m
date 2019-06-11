Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 785B23C086
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 02:29:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A150B89155;
	Tue, 11 Jun 2019 00:29:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 686A089150
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 00:23:11 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id 19so5402052pfa.4
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2019 17:23:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M8dK47yPhynvSehskkuhR0uoKpp2uUP0x/D6+OPbrUg=;
 b=IxPVu67wB0QKsZY2wShiJDTl/mNUs10Jk4IUfR5X0Z8Ghe4PPD5yVxUfrFvUcBJLs1
 kss08jQXOIc0Hs/6HqLNVlrNNrn+1A8ah9r5VxBPnA/g4ezgLCb5lM4aesc78e+cyCnF
 FRgqNczLXUJKpxhk9IYan08b8cg/DBgCpN4/rI2385o8H2tZlbCyqiYZnJEg45FlsIGr
 kVF5kDQNYni8osCb65bwKyXk1qzbNFwBfZ6gFUGqCMOb29P69RahjEbBuhZyfQPOsnRK
 7Cex0xXJP+UKVrA8AcHs4fr/9NmliEa+n+WAE45eGdcTsh+WbrQtOZ14ngT1D3z2E3oa
 v9mA==
X-Gm-Message-State: APjAAAWcF2hRHJaDlowg1n/ca/ZDxeftZtz8fpQG8SHFyBQx1eqdVrNe
 Bom5U1LicCqNtQ9cVOu0vz9yLQ==
X-Google-Smtp-Source: APXvYqxgskg5maq+JeiMbuvV7nLdRyi6nn4eQ55SV9Rs1d3bhqZcPjSw0Twk7BzvTbHKQzN5RyBSvg==
X-Received: by 2002:a63:8249:: with SMTP id w70mr15859377pgd.33.1560212590903; 
 Mon, 10 Jun 2019 17:23:10 -0700 (PDT)
Received: from exogeni.mtv.corp.google.com
 ([2620:15c:202:1:5be8:f2a6:fd7b:7459])
 by smtp.gmail.com with ESMTPSA id t4sm540317pjq.19.2019.06.10.17.23.09
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 10 Jun 2019 17:23:10 -0700 (PDT)
From: Derek Basehore <dbasehore@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] drm/mtk: add panel orientation property
Date: Mon, 10 Jun 2019 17:22:56 -0700
Message-Id: <20190611002256.186969-6-dbasehore@chromium.org>
X-Mailer: git-send-email 2.22.0.rc2.383.gf4fbbf30c2-goog
In-Reply-To: <20190611002256.186969-1-dbasehore@chromium.org>
References: <20190611002256.186969-1-dbasehore@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 11 Jun 2019 00:29:12 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M8dK47yPhynvSehskkuhR0uoKpp2uUP0x/D6+OPbrUg=;
 b=f8RsE3S/kfdDH6v5icBqkYxG44gp7sMpthCwyaqeVVv/htgQ5HpcDI6Wv0iU/zWNcb
 oatVGJ4axZtIjvktwE9gYtDNHp4sChejjwJoasvq2NwX71M8H6s0JQby/OGPhBngYau6
 PLZre9cxMKoOn5+neuim6KE3BHgm+44DhuGtg=
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
Cc: Derek Basehore <dbasehore@chromium.org>, maxime.ripard@bootlin.com,
 sam@ravnborg.org, intel-gfx@lists.freedesktop.org, airlied@linux.ie,
 thierry.reding@gmail.com, matthias.bgg@gmail.com,
 dri-devel@lists.freedesktop.org, rodrigo.vivi@intel.com,
 linux-mediatek@lists.infradead.org, sean@poorly.run,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBpbml0cyB0aGUgcGFuZWwgb3JpZW50YXRpb24gcHJvcGVydHkgZm9yIHRoZSBtZWRpYXRl
ayBkc2kgZHJpdmVyCmlmIHRoZSBwYW5lbCBvcmllbnRhdGlvbiAoY29ubmVjdG9yLmRpc3BsYXlf
aW5mby5wYW5lbF9vcmllbnRhdGlvbikgaXMKbm90IERSTV9NT0RFX1BBTkVMX09SSUVOVEFUSU9O
X1VOS05PV04uCgpTaWduZWQtb2ZmLWJ5OiBEZXJlayBCYXNlaG9yZSA8ZGJhc2Vob3JlQGNocm9t
aXVtLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jIHwgOCArKysr
KysrKwogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2RzaS5jCmluZGV4IDRhMGI5MTUwYTdiYi4uMDhmZmRjNzUyNmRkIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZHNpLmMKQEAgLTc4MiwxMCArNzgyLDE4IEBAIHN0YXRpYyBpbnQgbXRrX2Rz
aV9jcmVhdGVfY29ubmVjdG9yKHN0cnVjdCBkcm1fZGV2aWNlICpkcm0sIHN0cnVjdCBtdGtfZHNp
ICpkc2kpCiAJCQlEUk1fRVJST1IoIkZhaWxlZCB0byBhdHRhY2ggcGFuZWwgdG8gZHJtXG4iKTsK
IAkJCWdvdG8gZXJyX2Nvbm5lY3Rvcl9jbGVhbnVwOwogCQl9CisKKwkJcmV0ID0gZHJtX2Nvbm5l
Y3Rvcl9pbml0X3BhbmVsX29yaWVudGF0aW9uX3Byb3BlcnR5KCZkc2ktPmNvbm4pOworCQlpZiAo
cmV0KSB7CisJCQlEUk1fRVJST1IoIkZhaWxlZCB0byBpbml0IHBhbmVsIG9yaWVudGF0aW9uXG4i
KTsKKwkJCWdvdG8gZXJyX3BhbmVsX2RldGFjaDsKKwkJfQogCX0KIAogCXJldHVybiAwOwogCitl
cnJfcGFuZWxfZGV0YWNoOgorCWRybV9wYW5lbF9kZXRhY2goZHNpLT5wYW5lbCk7CiBlcnJfY29u
bmVjdG9yX2NsZWFudXA6CiAJZHJtX2Nvbm5lY3Rvcl9jbGVhbnVwKCZkc2ktPmNvbm4pOwogCXJl
dHVybiByZXQ7Ci0tIAoyLjIyLjAucmMyLjM4My5nZjRmYmJmMzBjMi1nb29nCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
