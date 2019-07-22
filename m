Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 506B870867
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 20:25:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41B0B89DB7;
	Mon, 22 Jul 2019 18:25:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05B1989DB7
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 18:25:07 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id c73so17763960pfb.13
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 11:25:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=phxXam+NzCk41fkXQIfIPhu7NO3JuGp0Zqj7GYLvO5g=;
 b=BY5aZMhWvd0A2i09yU6reFrqQZ3WtSbpOgrD0tElqILmz8dN2aMwWJn1qmDubD/LiI
 hjW/N18PXpuIDO1wCErx1j3R1Dsu1UMejgZvKWHPwYbULe/Y/shf39bV7bedpkjLAbav
 T1BsusfNQ1lpfwD7NS76Xt/AcjCDQmzvxaa11AeugF8lnYp2QRBXHwp82DoXDU2iDFBJ
 qbartUAlMpt2Ukkp4MGzulN+TpCvxBwg/kPEM9jIgHQgjrGzSHI5XgrsnolHPwrEEHdT
 2OlewWBrFVa06K3RFp5209m/KqIy+K1NVoHVRHa4rpZZV2M7Q4zJf5fppF534ffPN4ES
 tg6A==
X-Gm-Message-State: APjAAAUieXcg79kkXY91d40fx17UjabhztOZkegc5+FC+ahmEu2Q0CSf
 vaMUuoyftDTetW+GQ8C5Wy1n3w==
X-Google-Smtp-Source: APXvYqxIok6j9SpyTOOUPPOSMw74gGma9eXYYBqZ20kYDDJq6S+wqATyE6oe5vdgxNJaBlFiNXuY1g==
X-Received: by 2002:a62:1883:: with SMTP id 125mr1535738pfy.178.1563819905974; 
 Mon, 22 Jul 2019 11:25:05 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id a3sm36117683pfl.145.2019.07.22.11.25.04
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 22 Jul 2019 11:25:05 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 2/4] video: of: display_timing: Don't yell if no timing node
 is present
Date: Mon, 22 Jul 2019 11:24:37 -0700
Message-Id: <20190722182439.44844-3-dianders@chromium.org>
X-Mailer: git-send-email 2.22.0.657.g960e92d24f-goog
In-Reply-To: <20190722182439.44844-1-dianders@chromium.org>
References: <20190722182439.44844-1-dianders@chromium.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=phxXam+NzCk41fkXQIfIPhu7NO3JuGp0Zqj7GYLvO5g=;
 b=VORIvKvZyl9su9iT0PV3CqryHSefcsep6woCoAACriNyyj1wpAq19jNBW1BYF5IpQo
 US79nuEXwDfYRquImLevsgou9blTecCzbQdIRW8MvRGuCKdw8QN2iYCtNEWGFwhJ26xY
 CNEJ+PxvFxXS8ph5Wzk31pOD2MWnCapWoZQok=
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

VGhlcmUgbWF5IGJlIGNhc2VzIChsaWtlIGluIHBhbmVsLXNpbXBsZS5jKSB3aGVyZSB3ZSBoYXZl
IGEgc2FuZQpmYWxsYmFjayBpZiBubyB0aW1pbmdzIGFyZSBzcGVjaWZpZWQgaW4gdGhlIGRldmlj
ZSB0cmVlLiAgTGV0J3MgZ2V0CnJpZCBvZiB0aGUgdW5jb25kaXRpb25hbCBwcl9lcnIoKS4gIFdl
IGNhbiBhZGQgZXJyb3IgbWVzc2FnZXMgaW4KaW5kaXZpZHVhbCBkcml2ZXJzIGlmIGl0IG1ha2Vz
IHNlbnNlLgoKTk9URTogd2UnbGwgc3RpbGwgcHJpbnQgZXJyb3JzIGlmIHRoZSBub2RlIGlzIHBy
ZXNlbnQgYnV0IHRoZXJlIGFyZQpwcm9ibGVtcyBwYXJzaW5nIHRoZSB0aW1pbmdzLgoKRml4ZXM6
IGI4YTI5NDhmYTJiMyAoImRybS9wYW5lbDogc2ltcGxlOiBBZGQgYWJpbGl0eSB0byBvdmVycmlk
ZSB0eXBpY2FsIHRpbWluZyIpClJlcG9ydGVkLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9y
Zy5vcmc+ClNpZ25lZC1vZmYtYnk6IERvdWdsYXMgQW5kZXJzb24gPGRpYW5kZXJzQGNocm9taXVt
Lm9yZz4KLS0tCgogZHJpdmVycy92aWRlby9vZl9kaXNwbGF5X3RpbWluZy5jIHwgNCArLS0tCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy92aWRlby9vZl9kaXNwbGF5X3RpbWluZy5jIGIvZHJpdmVycy92aWRlby9vZl9k
aXNwbGF5X3RpbWluZy5jCmluZGV4IDVlZWRhZTA3OTlmMC4uYWJjOWFkYTc5OGVlIDEwMDY0NAot
LS0gYS9kcml2ZXJzL3ZpZGVvL29mX2Rpc3BsYXlfdGltaW5nLmMKKysrIGIvZHJpdmVycy92aWRl
by9vZl9kaXNwbGF5X3RpbWluZy5jCkBAIC0xMjUsMTAgKzEyNSw4IEBAIGludCBvZl9nZXRfZGlz
cGxheV90aW1pbmcoY29uc3Qgc3RydWN0IGRldmljZV9ub2RlICpucCwgY29uc3QgY2hhciAqbmFt
ZSwKIAkJcmV0dXJuIC1FSU5WQUw7CiAKIAl0aW1pbmdfbnAgPSBvZl9nZXRfY2hpbGRfYnlfbmFt
ZShucCwgbmFtZSk7Ci0JaWYgKCF0aW1pbmdfbnApIHsKLQkJcHJfZXJyKCIlcE9GOiBjb3VsZCBu
b3QgZmluZCBub2RlICclcydcbiIsIG5wLCBuYW1lKTsKKwlpZiAoIXRpbWluZ19ucCkKIAkJcmV0
dXJuIC1FTk9FTlQ7Ci0JfQogCiAJcmV0ID0gb2ZfcGFyc2VfZGlzcGxheV90aW1pbmcodGltaW5n
X25wLCBkdCk7CiAKLS0gCjIuMjIuMC42NTcuZzk2MGU5MmQyNGYtZ29vZwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
