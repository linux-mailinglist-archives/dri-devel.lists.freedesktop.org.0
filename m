Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB7C2937E
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2019 10:54:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2A486E037;
	Fri, 24 May 2019 08:54:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93CCB89F08
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 08:54:04 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id n17so13370853edb.0
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 01:54:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WjZOCAqCO3l6sOylMJV3BG1AKBRXEuG+IGCZcKuozWA=;
 b=NDwQwzvDueZASOSpZAgXN0Xl5B+0cO5jzVchKyyGfCW8Hdq9l2YxqmzCXBYnRPxzG2
 tOuL1a34NZ7fM9vPNVMc+Qq2M6Nh2oyftO4W2KQlkmhrod3gcG+Fi0g/ykxv/VEBU8ll
 kOAY868IrSKVOMDkd8BVR6mH2igMlz2fzydDbQcjSOiuoPvMQv9d7Oy0Z+rQ7T5YiwxV
 uSGjG7tJZRX0zafM4W4QmeFzXwPi8v0WR+8/CpGneLbRdWkvxLKFWFHqngpBdi7MbmFf
 /o37gRVFu97PMJILS5gml49bLzT1T+0H3Fo/5K4MxrYmmryz1B5ZEQ2CFjrwKBrb+5/f
 yfaQ==
X-Gm-Message-State: APjAAAW6iuyarGdUhn+dW0WW3C7r8SF4rb39MKNZ3XDbcsoMLjT+/OyO
 OCSapB87lq5V9DjNzdu0iWmVdg==
X-Google-Smtp-Source: APXvYqw90JW22kbymXTQpmSH2wtmpc3E7xGbmiBHk8MYvAt3SJf376+g2NAganFHL+j0ca7tqriJSQ==
X-Received: by 2002:a50:ba1d:: with SMTP id g29mr48994176edc.298.1558688043136; 
 Fri, 24 May 2019 01:54:03 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id 96sm567082edq.68.2019.05.24.01.54.02
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 May 2019 01:54:02 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH 02/33] fbdev: locking check for fb_set_suspend
Date: Fri, 24 May 2019 10:53:23 +0200
Message-Id: <20190524085354.27411-3-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190524085354.27411-1-daniel.vetter@ffwll.ch>
References: <20190524085354.27411-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WjZOCAqCO3l6sOylMJV3BG1AKBRXEuG+IGCZcKuozWA=;
 b=Ed3N0BtCGy2KrRjxgTqaTL3MHlzGpZBsTTx8FSTmwmpH0uBFHwRKyPhA/jP7Z9Ep6q
 TJd+LpH/8IMbH3/A57PWAxKw+6Umw2mgAPzSRXA6eUbOaKXykY0YzLmiHUBDoaeL0zqT
 4b3/gaoPpvVyAEmwrbiirj1Bobt5V1KRsZlgI=
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
Cc: Kees Cook <keescook@chromium.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Manfred Schlaegl <manfred.schlaegl@ginzinger.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
 Hans de Goede <hdegoede@redhat.com>, Mikulas Patocka <mpatocka@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SnVzdCBkcml2ZS1ieSwgbm90aGluZyBzeXN0ZW1hdGljIHlldC4KClNpZ25lZC1vZmYtYnk6IERh
bmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgpDYzogQmFydGxvbWllaiBab2xu
aWVya2lld2ljeiA8Yi56b2xuaWVya2llQHNhbXN1bmcuY29tPgpDYzogRGFuaWVsIFZldHRlciA8
ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KQ2M6ICJNaWNoYcWCIE1pcm9zxYJhdyIgPG1pcnEtbGlu
dXhAcmVyZS5xbXFtLnBsPgpDYzogUGV0ZXIgUm9zaW4gPHBlZGFAYXhlbnRpYS5zZT4KQ2M6IEhh
bnMgZGUgR29lZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+CkNjOiBUaG9tYXMgWmltbWVybWFubiA8
dHppbW1lcm1hbm5Ac3VzZS5kZT4KQ2M6IE1hbmZyZWQgU2NobGFlZ2wgPG1hbmZyZWQuc2NobGFl
Z2xAZ2luemluZ2VyLmNvbT4KQ2M6IE1pa3VsYXMgUGF0b2NrYSA8bXBhdG9ja2FAcmVkaGF0LmNv
bT4KQ2M6IEtlZXMgQ29vayA8a2Vlc2Nvb2tAY2hyb21pdW0ub3JnPgotLS0KIGRyaXZlcnMvdmlk
ZW8vZmJkZXYvY29yZS9mYm1lbS5jIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYm1lbS5jIGIvZHJp
dmVycy92aWRlby9mYmRldi9jb3JlL2ZibWVtLmMKaW5kZXggZDE5NDljOTJiZTk4Li44YmE2NzRm
ZmIzYzkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYm1lbS5jCisrKyBi
L2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYm1lbS5jCkBAIC0xOTg1LDYgKzE5ODUsOCBAQCB2
b2lkIGZiX3NldF9zdXNwZW5kKHN0cnVjdCBmYl9pbmZvICppbmZvLCBpbnQgc3RhdGUpCiB7CiAJ
c3RydWN0IGZiX2V2ZW50IGV2ZW50OwogCisJV0FSTl9DT05TT0xFX1VOTE9DS0VEKCk7CisKIAll
dmVudC5pbmZvID0gaW5mbzsKIAlpZiAoc3RhdGUpIHsKIAkJZmJfbm90aWZpZXJfY2FsbF9jaGFp
bihGQl9FVkVOVF9TVVNQRU5ELCAmZXZlbnQpOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
