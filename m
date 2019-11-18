Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6852C10029C
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2019 11:36:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C27B86E384;
	Mon, 18 Nov 2019 10:36:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 211CF6E30E
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 10:36:02 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id b18so17353112wrj.8
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 02:36:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6Ra81SF/gAF1NOlsK25mQDZVt7/1R+jY1Ddov0yZk/I=;
 b=VeWgfbJh3R8kJ0fimhwU/rIprnK/ZEz5/dQNy/mkkuEocEBHh6dxHgHsYgQudiMGLa
 NXF8sYoR5Yiwk9c+0ZMYcYaE8W0l92HVaWnoL+LkoBFJVkG7L6IuHGgt+bo7Rt/VBHex
 oaG1XxfWobCHcMGr0YuCPVSaWOLpIq+9GjZHsyFgTryRQ3hxmfasV2YcbU1E8Vh4KtJd
 4vmUudZAUmdMoJbeoT224agY+te4nkJmqpDfpsPZ6ia/ouvxNZaNCxYJPlz8qa5N4FgU
 bc9H2xF+KMzc0KzSGd75ZRjE0Xt2BoxPVqeC7/M/dYk1H6BIJ9t4CKbGzdqyxJa+2jCi
 sbuQ==
X-Gm-Message-State: APjAAAWT0VzZrFmQKC9T07/HpM5V5r2ufsPmvZzLO+SVnkaLsWsaPmL1
 y8wyEnjg44i/e8/MNQeGJnEtHaF6Vh0=
X-Google-Smtp-Source: APXvYqw29riHGoWMhCfeUGpT8JpzsyL2a/U5QhM8PPUltRaVH+y5YSQ78vFp9V+DsJILGfZcCnEWvA==
X-Received: by 2002:a5d:484f:: with SMTP id n15mr11213479wrs.112.1574073360548; 
 Mon, 18 Nov 2019 02:36:00 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id j2sm22749200wrt.61.2019.11.18.02.35.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 02:36:00 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 15/15] dma-buf: Remove kernel map/unmap hooks
Date: Mon, 18 Nov 2019 11:35:36 +0100
Message-Id: <20191118103536.17675-16-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191118103536.17675-1-daniel.vetter@ffwll.ch>
References: <20191118103536.17675-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6Ra81SF/gAF1NOlsK25mQDZVt7/1R+jY1Ddov0yZk/I=;
 b=jUmU2Pm/rpn34cHxfy/mRTbtXOvG/rx3QBiW/JW6ZrTKA7eyHzhVLN00yIxfjH6RaD
 Jk1Q0TAoW9w0rHaaoGdl2yKZ5lVsS3c2zqF51xDaOKYnlr6y5NEd0jhTP1FYkSRmZnH2
 oLIgt8fS3WN4DKSKvUp8t8vFTe8Q0zNBNct7s=
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
 linaro-mm-sig@lists.linaro.org, Daniel Vetter <daniel.vetter@intel.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWxsIGltcGxlbWVudGF0aW9ucyBhcmUgZ29uZSBub3cuCgpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwg
VmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KQ2M6IFN1bWl0IFNlbXdhbCA8c3VtaXQu
c2Vtd2FsQGxpbmFyby5vcmc+CkNjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGxp
bmFyby1tbS1zaWdAbGlzdHMubGluYXJvLm9yZwotLS0KIGluY2x1ZGUvbGludXgvZG1hLWJ1Zi5o
IHwgMjUgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDI1IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvZG1hLWJ1Zi5oIGIvaW5jbHVkZS9s
aW51eC9kbWEtYnVmLmgKaW5kZXggN2ZlYjljMzgwNWFlLi5hYmY1NDU5YTViOWQgMTAwNjQ0Ci0t
LSBhL2luY2x1ZGUvbGludXgvZG1hLWJ1Zi5oCisrKyBiL2luY2x1ZGUvbGludXgvZG1hLWJ1Zi5o
CkBAIC0yNDksMzEgKzI0OSw2IEBAIHN0cnVjdCBkbWFfYnVmX29wcyB7CiAJICovCiAJaW50ICgq
bW1hcCkoc3RydWN0IGRtYV9idWYgKiwgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpOwogCi0J
LyoqCi0JICogQG1hcDoKLQkgKgotCSAqIE1hcHMgYSBwYWdlIGZyb20gdGhlIGJ1ZmZlciBpbnRv
IGtlcm5lbCBhZGRyZXNzIHNwYWNlLiBUaGUgcGFnZSBpcwotCSAqIHNwZWNpZmllZCBieSBvZmZz
ZXQgaW50byB0aGUgYnVmZmVyIGluIFBBR0VfU0laRSB1bml0cy4KLQkgKgotCSAqIFRoaXMgY2Fs
bGJhY2sgaXMgb3B0aW9uYWwuCi0JICoKLQkgKiBSZXR1cm5zOgotCSAqCi0JICogVmlydHVhbCBh
ZGRyZXNzIHBvaW50ZXIgd2hlcmUgcmVxdWVzdGVkIHBhZ2UgY2FuIGJlIGFjY2Vzc2VkLiBOVUxM
Ci0JICogb24gZXJyb3Igb3Igd2hlbiB0aGlzIGZ1bmN0aW9uIGlzIHVuaW1wbGVtZW50ZWQgYnkg
dGhlIGV4cG9ydGVyLgotCSAqLwotCXZvaWQgKigqbWFwKShzdHJ1Y3QgZG1hX2J1ZiAqLCB1bnNp
Z25lZCBsb25nKTsKLQotCS8qKgotCSAqIEB1bm1hcDoKLQkgKgotCSAqIFVubWFwcyBhIHBhZ2Ug
ZnJvbSB0aGUgYnVmZmVyLiBQYWdlIG9mZnNldCBhbmQgYWRkcmVzcyBwb2ludGVyIHNob3VsZAot
CSAqIGJlIHRoZSBzYW1lIGFzIHRoZSBvbmUgcGFzc2VkIHRvIGFuZCByZXR1cm5lZCBieSBtYXRj
aGluZyBjYWxsIHRvIG1hcC4KLQkgKgotCSAqIFRoaXMgY2FsbGJhY2sgaXMgb3B0aW9uYWwuCi0J
ICovCi0Jdm9pZCAoKnVubWFwKShzdHJ1Y3QgZG1hX2J1ZiAqLCB1bnNpZ25lZCBsb25nLCB2b2lk
ICopOwotCiAJdm9pZCAqKCp2bWFwKShzdHJ1Y3QgZG1hX2J1ZiAqKTsKIAl2b2lkICgqdnVubWFw
KShzdHJ1Y3QgZG1hX2J1ZiAqLCB2b2lkICp2YWRkcik7CiB9OwotLSAKMi4yNC4wCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
