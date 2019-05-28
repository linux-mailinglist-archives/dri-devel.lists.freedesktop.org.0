Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D308E2C206
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 11:03:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A9E889DA3;
	Tue, 28 May 2019 09:03:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C221D89D64
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 09:03:14 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id g13so835276edu.5
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 02:03:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zV1k/wyKbSK4unVk9Zsa3jP6q9n4lvzRcxAhP6ZZB9c=;
 b=VIshAQOt0G0/huk+MnI41ZEIFQF+misgREvN3KaS9Nsa2Kb0XWiU5Hh2zrV2JE4qKI
 dCXPnM8DjrVKmKaBB3j07Vz2MpZKEU3DlYrzDFm2F6kpZAzOXlq4U8oHtDfdOWwakAii
 Ko6jEz4GIPmg9opl0HqR8Ev+n2uWueuckR4WJuFxol+NAsh+wKzxP3enQrMm5bVlcJVd
 MiQJHYtCY+YrAYZCnl/XvCDHpcP+W+tDpEHLXu5x6T+3u993sd9BVDQRrBgrT8Jzmijq
 18gwod5b3M5XQjvU50mIqO27NWT3rGgTpDkmDbdyRKPPfGry82SVaz1RfdFdDvtPiquk
 vw0A==
X-Gm-Message-State: APjAAAXVN/c9lHp/F7VjRLpU2R/bdrvd7iJDxtcmJOIMeSxW7HhyHYGq
 Vwcx2Nz/8ptKAD8+YplKjLY+Mw==
X-Google-Smtp-Source: APXvYqzAGcPvnepTOvwWRDQxzLcJ/M058MuV1V355eV9v96p3PIpDSwE+P8RHoMQgcX7eCRUeENRAg==
X-Received: by 2002:a50:8a46:: with SMTP id
 i64mr126930218edi.177.1559034193385; 
 Tue, 28 May 2019 02:03:13 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id x49sm4072656edm.25.2019.05.28.02.03.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 May 2019 02:03:12 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH 02/33] fbdev: locking check for fb_set_suspend
Date: Tue, 28 May 2019 11:02:33 +0200
Message-Id: <20190528090304.9388-3-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190528090304.9388-1-daniel.vetter@ffwll.ch>
References: <20190528090304.9388-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zV1k/wyKbSK4unVk9Zsa3jP6q9n4lvzRcxAhP6ZZB9c=;
 b=Jr4diFnn4D12FEqGpJQ+RuXfm8du2nWF1rRHD4W7cIEGcbaXABy4y7PYtm1RWYCGsM
 4VUgAtZNFYUQNW5orIhfjotHfmaMRBcdXOU7lv9qvqyzRqJa5qThyVjqHAx5MH9qVK6q
 lTOmQV05XsP0H1DMu730MHM4S7AOOkuX/FVNA=
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
 Kees Cook <keescook@chromium.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Manfred Schlaegl <manfred.schlaegl@ginzinger.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 linux-fbdev@vger.kernel.org, DRI Development <dri-devel@lists.freedesktop.org>,
 =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
 Hans de Goede <hdegoede@redhat.com>, Mikulas Patocka <mpatocka@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SnVzdCBkcml2ZS1ieSwgbm90aGluZyBzeXN0ZW1hdGljIHlldC4KClNpZ25lZC1vZmYtYnk6IERh
bmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgpSZXZpZXdlZC1ieTogU2FtIFJh
dm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpSZXZpZXdlZC1ieTogTWFhcnRlbiBMYW5raG9yc3Qg
PG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KQ2M6IEJhcnRsb21pZWogWm9sbmll
cmtpZXdpY3ogPGIuem9sbmllcmtpZUBzYW1zdW5nLmNvbT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRh
bmllbC52ZXR0ZXJAZmZ3bGwuY2g+CkNjOiAiTWljaGHFgiBNaXJvc8WCYXciIDxtaXJxLWxpbnV4
QHJlcmUucW1xbS5wbD4KQ2M6IFBldGVyIFJvc2luIDxwZWRhQGF4ZW50aWEuc2U+CkNjOiBIYW5z
IGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQuY29tPgpDYzogVGhvbWFzIFppbW1lcm1hbm4gPHR6
aW1tZXJtYW5uQHN1c2UuZGU+CkNjOiBNYW5mcmVkIFNjaGxhZWdsIDxtYW5mcmVkLnNjaGxhZWds
QGdpbnppbmdlci5jb20+CkNjOiBNaWt1bGFzIFBhdG9ja2EgPG1wYXRvY2thQHJlZGhhdC5jb20+
CkNjOiBLZWVzIENvb2sgPGtlZXNjb29rQGNocm9taXVtLm9yZz4KLS0tCiBkcml2ZXJzL3ZpZGVv
L2ZiZGV2L2NvcmUvZmJtZW0uYyB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJtZW0uYyBiL2RyaXZl
cnMvdmlkZW8vZmJkZXYvY29yZS9mYm1lbS5jCmluZGV4IGQxOTQ5YzkyYmU5OC4uOGJhNjc0ZmZi
M2M5IDEwMDY0NAotLS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJtZW0uYworKysgYi9k
cml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJtZW0uYwpAQCAtMTk4NSw2ICsxOTg1LDggQEAgdm9p
ZCBmYl9zZXRfc3VzcGVuZChzdHJ1Y3QgZmJfaW5mbyAqaW5mbywgaW50IHN0YXRlKQogewogCXN0
cnVjdCBmYl9ldmVudCBldmVudDsKIAorCVdBUk5fQ09OU09MRV9VTkxPQ0tFRCgpOworCiAJZXZl
bnQuaW5mbyA9IGluZm87CiAJaWYgKHN0YXRlKSB7CiAJCWZiX25vdGlmaWVyX2NhbGxfY2hhaW4o
RkJfRVZFTlRfU1VTUEVORCwgJmV2ZW50KTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
