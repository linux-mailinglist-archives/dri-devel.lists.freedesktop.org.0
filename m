Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6D622E57
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2019 10:22:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B97A89256;
	Mon, 20 May 2019 08:22:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2E1689258
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 08:22:26 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id w11so22519436edl.5
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 01:22:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G+7lASPDHVp4K6Shi6AhuJ3vCu7cy9RDPQGFtgAVXYo=;
 b=P6zl4UUy46nmmva/2nVqatP9C2Tw3Z+Fs0Mj0IakaPt3xpF9issCxO9GfxuYE6kfpW
 BNyMPmNvhLK0n2x1H5QtAuK+RRwCLKvO4fjGWlU1nKeBGb2vxpxxQFGrnJf8T7r27HlS
 RSnNFjVWfQYBgC25APyNWbHpdozEFDo6i/jceFYFeBHfjltdMYGszrFQ0WWTIIVaD5lu
 jWuSKZAVwqSLIDWoXmjr54El0Il3Q0o7+rRAvKw7dKzE7ba1PTqUs1PjSEIfUvJQDt8J
 wpcfZe+HkvK+ELsxFJVeadw4XQnDXimQW1Azqq9sRsx/1uKvZ/j9mGCEEH3JcXSCK46I
 VWfA==
X-Gm-Message-State: APjAAAV6cpH5Djw1ScUBlbrCQ/yh9rnIlsfLqI6eSrymXLrUbm8GLl7+
 B11191gKdfXbpKDOg1ZBsaBLEiYhzqU=
X-Google-Smtp-Source: APXvYqzH5cPNdv7MYAD+y/4MNq7TDcKB1eyAl64aeRO4GzFk1JnGrIJO/wyx6J/F/ggn0Pw2mY0qXA==
X-Received: by 2002:a17:906:6603:: with SMTP id
 b3mr57042868ejp.128.1558340545071; 
 Mon, 20 May 2019 01:22:25 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id t25sm3021263ejx.8.2019.05.20.01.22.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 May 2019 01:22:24 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 02/33] fbdev: locking check for fb_set_suspend
Date: Mon, 20 May 2019 10:21:45 +0200
Message-Id: <20190520082216.26273-3-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190520082216.26273-1-daniel.vetter@ffwll.ch>
References: <20190520082216.26273-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=G+7lASPDHVp4K6Shi6AhuJ3vCu7cy9RDPQGFtgAVXYo=;
 b=fdxIA47EdjdY0cAD59y+tCVIUFAcmt0tExaffadsAFlVmlZ8JqvFsP8koUpxE9wSpH
 k+EmmKz6vl+ykzYBeKPaQCP9IAnfqdF7RppIkaJCFu/UcmKLRSVP7teK6x0UwcvAxlkF
 FQf4alrfYArjUBDWAskQ29Ppbr4fa71rZV97s=
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
 LKML <linux-kernel@vger.kernel.org>,
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
dmVycy92aWRlby9mYmRldi9jb3JlL2ZibWVtLmMKaW5kZXggNDcyMTQ5MWU2YzhjLi5mYzNkMzRh
OGVhNWIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYm1lbS5jCisrKyBi
L2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYm1lbS5jCkBAIC0xOTY0LDYgKzE5NjQsOCBAQCB2
b2lkIGZiX3NldF9zdXNwZW5kKHN0cnVjdCBmYl9pbmZvICppbmZvLCBpbnQgc3RhdGUpCiB7CiAJ
c3RydWN0IGZiX2V2ZW50IGV2ZW50OwogCisJV0FSTl9DT05TT0xFX1VOTE9DS0VEKCk7CisKIAll
dmVudC5pbmZvID0gaW5mbzsKIAlpZiAoc3RhdGUpIHsKIAkJZmJfbm90aWZpZXJfY2FsbF9jaGFp
bihGQl9FVkVOVF9TVVNQRU5ELCAmZXZlbnQpOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
