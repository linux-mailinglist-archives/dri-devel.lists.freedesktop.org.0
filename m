Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B992D7A1D
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 16:59:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65F6B6E423;
	Fri, 11 Dec 2020 15:58:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 622096E42C
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 15:58:53 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id y17so9510914wrr.10
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 07:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eI9svEscFFEDHjZ/6rb7PQ6fCEwvLqPuRGZ41CR0IOE=;
 b=Ul4NgJKZ+VuEJ9Ke4828Uu1XNWega/19OpNJ46AF4xjJu73b0OspZ1/CGB+nNarjj+
 Fwg3F/1wwm77oFGYETrnmGi4o+RcS07Kil3LNJKXFtMLqiD+n7wvHC3A5qSoWeyADFKu
 c4ES6nJPLpl8XYU+Rtr27hX3fLhwVaY3YJgs4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eI9svEscFFEDHjZ/6rb7PQ6fCEwvLqPuRGZ41CR0IOE=;
 b=CG7D+QZ4SUrTdZQiFXIjo9A/bovqxM7fP1X1TZlui3tnDecUcwLeBvWUfSn+hMbMbV
 hd6oVJOPRgfp8/1x54bMXdApxA+j1qgsXowDpBIYm68cU1ha+TdlRKNIubMdaJyvuN4s
 N5YzJ49tx3dzGdT5ggR8E4ZhVPgVsR+dDrZP5sSSrBbZXo2s1ei1HV1qlOZO/CPnfjyk
 II2DdKCiqYVsLkLFbBUEVJEQAJCWAvHA1MPcH8XxQnJh9GHWm8AeRFGGoNRdkKGak6Rl
 LEoni1aQ+m0XXgwAlhox790K9D6LfeYCxhdnOR2Z1TCFPhLtuwrYsIz88WB9fq+lvCL7
 YM/Q==
X-Gm-Message-State: AOAM530aNvCFZZF2v+MwrF/iXvT/zDXytlWiCv+fnxdEW0Ct0sLH6hqQ
 1OJ8MNbWrrgpkT5WsCOMbun67xPDvxgbig==
X-Google-Smtp-Source: ABdhPJyFxZCqemzt/g6P2XoqMBFJ21XrRke48okT8FQRyUvc+wuGP5q3+cNwooS9ousLaFZvzrTnDw==
X-Received: by 2002:a5d:4a10:: with SMTP id m16mr14958011wrq.18.1607702331851; 
 Fri, 11 Dec 2020 07:58:51 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z21sm14828241wmk.20.2020.12.11.07.58.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Dec 2020 07:58:51 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 3/4] dma-buf: begin/end_cpu might lock the dma_resv lock
Date: Fri, 11 Dec 2020 16:58:42 +0100
Message-Id: <20201211155843.3348718-3-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201211155843.3348718-1-daniel.vetter@ffwll.ch>
References: <20201211155843.3348718-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 linaro-mm-sig@lists.linaro.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXQgbGVhc3QgYW1kZ3B1IGFuZCBpOTE1IGRvLCBzbyBsZXRzIGp1c3QgZG9jdW1lbnQgdGhpcyBh
cyB0aGUgcnVsZS4KClNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJA
aW50ZWwuY29tPgpDYzogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+CkNj
OiBTdW1pdCBTZW13YWwgPHN1bWl0LnNlbXdhbEBsaW5hcm8ub3JnPgpDYzogIkNocmlzdGlhbiBL
w7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkNjOiBsaW51eC1tZWRpYUB2Z2VyLmtl
cm5lbC5vcmcKQ2M6IGxpbmFyby1tbS1zaWdAbGlzdHMubGluYXJvLm9yZwotLS0KIGRyaXZlcnMv
ZG1hLWJ1Zi9kbWEtYnVmLmMgfCA0ICsrKysKIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2RtYS1idWYvZG1hLWJ1Zi5jIGIvZHJpdmVycy9kbWEt
YnVmL2RtYS1idWYuYwppbmRleCBlMWZhNmM2ZjAyYzQuLjAwZDVhZmU5MDRjYyAxMDA2NDQKLS0t
IGEvZHJpdmVycy9kbWEtYnVmL2RtYS1idWYuYworKysgYi9kcml2ZXJzL2RtYS1idWYvZG1hLWJ1
Zi5jCkBAIC0xMTE4LDYgKzExMTgsOCBAQCBpbnQgZG1hX2J1Zl9iZWdpbl9jcHVfYWNjZXNzKHN0
cnVjdCBkbWFfYnVmICpkbWFidWYsCiAJaWYgKFdBUk5fT04oIWRtYWJ1ZikpCiAJCXJldHVybiAt
RUlOVkFMOwogCisJbWlnaHRfbG9jaygmZG1hX2J1Zi0+cmVzdi5sb2NrKTsKKwogCWlmIChkbWFi
dWYtPm9wcy0+YmVnaW5fY3B1X2FjY2VzcykKIAkJcmV0ID0gZG1hYnVmLT5vcHMtPmJlZ2luX2Nw
dV9hY2Nlc3MoZG1hYnVmLCBkaXJlY3Rpb24pOwogCkBAIC0xMTUxLDYgKzExNTMsOCBAQCBpbnQg
ZG1hX2J1Zl9lbmRfY3B1X2FjY2VzcyhzdHJ1Y3QgZG1hX2J1ZiAqZG1hYnVmLAogCiAJV0FSTl9P
TighZG1hYnVmKTsKIAorCW1pZ2h0X2xvY2soJmRtYV9idWYtPnJlc3YubG9jayk7CisKIAlpZiAo
ZG1hYnVmLT5vcHMtPmVuZF9jcHVfYWNjZXNzKQogCQlyZXQgPSBkbWFidWYtPm9wcy0+ZW5kX2Nw
dV9hY2Nlc3MoZG1hYnVmLCBkaXJlY3Rpb24pOwogCi0tIAoyLjI5LjIKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
