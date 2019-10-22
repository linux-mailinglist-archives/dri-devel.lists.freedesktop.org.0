Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC7DE13A3
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 10:09:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E2136E98B;
	Wed, 23 Oct 2019 08:09:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E8B76E457
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 08:36:39 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id c22so6159112wmd.1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 01:36:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lPnRL6NpoSqZohNp9zgeBMxysYnhgrlrtuMJ1IcmiO4=;
 b=SQoxiI56uGiuE+pY5wZNiwKSK3nxjb7paigKiCqVNX+i5EDp3e0aHYTkKQwfgRri7Q
 cHhDAa2aFAG18AFbgNT8i2o/QboE8/+EZ+imy0uhsKlW+U/1Kx1MItrlQ0kNIGo4g8Kv
 CKsGx6pB/3xAP7Xffs0NpzzzEwHgh8nu+Bda2VmRzm6qaMniK96nfN6Ok2xNwaKSK5Z6
 mUzfILPKouL9Aw9EXIRUJNKJIkFQn8W92RoIGDTMhvtJBqGjxFF5zMolAdHm69NvuVR7
 9JBscjQXt5C8nkO3PGx81OQ3YT/FdEqkCwJlBrIoW5GM+MBj8bZcQhO/6KHhROIJO4j3
 bUUw==
X-Gm-Message-State: APjAAAXD7zJfUjRUuQrB8IHTWvNrtBXYdmIsvdbfiGdaTXw676wsLYmS
 JOFKBntOBxFJcvOWnE886LoTlA==
X-Google-Smtp-Source: APXvYqwin7FI5BQUaoLOJ1m7zw/wr3yxBZOmxIPUtoJU2kMR7WARJaTrWbmN83nJqNw4l2Y2RU1QXA==
X-Received: by 2002:a1c:2cc4:: with SMTP id s187mr1901269wms.166.1571733396580; 
 Tue, 22 Oct 2019 01:36:36 -0700 (PDT)
Received: from localhost.localdomain
 (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
 by smtp.gmail.com with ESMTPSA id g17sm17115253wrq.58.2019.10.22.01.36.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2019 01:36:36 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH v7 0/9] backlight: gpio: simplify the driver
Date: Tue, 22 Oct 2019 10:36:21 +0200
Message-Id: <20191022083630.28175-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 23 Oct 2019 08:09:38 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lPnRL6NpoSqZohNp9zgeBMxysYnhgrlrtuMJ1IcmiO4=;
 b=OVaxqkiV3r66rCJJ/etx7RcDaFZpH+qujz5COsDg5e2kyosZzs1ammXKSMfEvWjVqo
 5LUTARizfYH78ZKf1AjSkhJ0vaerruSVrLdmnWd1/zJHjTY+TRrXeiUYXKp+Mh0NSrpJ
 ieQMAoZO59R40dcP9klGlFS/jeZ5AHtdTzMf7i1wsVdXIYsmQEad9sLN2lqxuSfVkAHT
 jtFE85+X8jX1kAEtQ7n4IB0VXYKse0OXHrwGcPpbLaoY7Ofm1rbcAqCXB0uErCYA/D0a
 HZJjTK9CEXfvyAbhVNTtWRYxSdiyGshcerExV5YXr8ylFkySuMNC1oQV/N5DrJWJZmHD
 ycUA==
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
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sh@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQmFydG9zeiBHb2xhc3pld3NraSA8YmdvbGFzemV3c2tpQGJheWxpYnJlLmNvbT4KCldo
aWxlIHdvcmtpbmcgb24gbXkgb3RoZXIgc2VyaWVzIHJlbGF0ZWQgdG8gZ3Bpby1iYWNrbGlnaHRb
MV0gSSBub3RpY2VkCnRoYXQgd2UgY291bGQgc2ltcGxpZnkgdGhlIGRyaXZlciBpZiB3ZSBtYWRl
IHRoZSBvbmx5IHVzZXIgb2YgcGxhdGZvcm0KZGF0YSB1c2UgR1BJTyBsb29rdXBzIGFuZCBkZXZp
Y2UgcHJvcGVydGllcy4gVGhpcyBzZXJpZXMgdHJpZXMgdG8gZG8KdGhhdC4KCkZpcnN0IHR3byBw
YXRjaGVzIGNvbnRhaW4gbWlub3IgZml4ZXMuIFRoaXJkIHBhdGNoIG1ha2VzIHRoZSBkcml2ZXIK
ZXhwbGljaXRseSBkcml2ZSB0aGUgR1BJTyBsaW5lLiBGb3VydGggcGF0Y2ggYWRkcyBhbGwgbmVj
ZXNzYXJ5IGRhdGEKc3RydWN0dXJlcyB0byBlY292ZWMyNC4gUGF0Y2ggNS85IHVuaWZpZXMgbXVj
aCBvZiB0aGUgY29kZSBmb3IgYm90aApwZGF0YSBhbmQgbm9uLXBkYXRhIGNhc2VzLiBQYXRjaGVz
IDYtNy85IHJlbW92ZSB1bnVzZWQgcGxhdGZvcm0gZGF0YQpmaWVsZHMuIExhc3QgdHdvIHBhdGNo
ZXMgY29udGFpbiBhZGRpdGlvbmFsIGltcHJvdmVtZW50cyBmb3IgdGhlIEdQSU8KYmFja2xpZ2h0
IGRyaXZlciB3aGlsZSB3ZSdyZSBhbHJlYWR5IG1vZGlmeWluZyBpdC4KCkkgZG9uJ3QgaGF2ZSBh
Y2Nlc3MgdG8gdGhpcyBIVyBidXQgaG9wZWZ1bGx5IHRoaXMgd29ya3MuIE9ubHkgY29tcGlsZQp0
ZXN0ZWQuCgpbMV0gaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMTkvNi8yNS85MDAKCnYxIC0+IHYy
OgotIHJlYmFzZWQgb24gdG9wIG9mIHY1LjMtcmMxIGFuZCBhZGp1c3RlZCB0byB0aGUgcmVjZW50
IGNoYW5nZXMgZnJvbSBBbmR5Ci0gYWRkZWQgYWRkaXRpb25hbCB0d28gcGF0Y2hlcyB3aXRoIG1p
bm9yIGltcHJvdmVtZW50cwoKdjIgLT4gdjM6Ci0gaW4gcGF0Y2ggNy83OiB1c2VkIGluaXRpYWxp
emVycyB0byBzZXQgdmFsdWVzIGZvciBwZGF0YSBhbmQgZGV2IGxvY2FsIHZhcnMKCnYzIC0+IHY0
OgotIHJlYmFzZWQgb24gdG9wIG9mIHY1LjQtcmMxCi0gcmVtb3ZlZCBjaGFuZ2VzIHRoYXQgYXJl
IG5vIGxvbmdlciByZWxldmFudCBhZnRlciBjb21taXQgZWM2NjViNzU2ZTZmCiAgKCJiYWNrbGln
aHQ6IGdwaW8tYmFja2xpZ2h0OiBDb3JyZWN0IGluaXRpYWwgcG93ZXIgc3RhdGUgaGFuZGxpbmci
KQotIGFkZGVkIHBhdGNoIDcvNwoKdjQgLT4gdjU6Ci0gaW4gcGF0Y2ggNy83OiBhZGRlZCBhIGNv
bW1lbnQgcmVwbGFjaW5nIHRoZSBuYW1lIG9mIHRoZSBmdW5jdGlvbiBiZWluZwogIHB1bGxlZCBp
bnRvIHByb2JlKCkKCnY1IC0+IHY2OgotIGFkZGVkIGEgcGF0Y2ggbWFraW5nIHRoZSBkcml2ZXIg
ZXhwbGljaXRseSBzZXQgdGhlIGRpcmVjdGlvbiBvZiB0aGUgR1BJTwogIHRvIG91dHB1dAotIGFk
ZGVkIGEgcGF0Y2ggcmVtb3ZpbmcgYSByZWR1bmRhbnQgbmV3bGluZQoKdjYgLT4gdjc6Ci0gcmVu
YW1lZCB0aGUgZnVuY3Rpb24gY2FsY3VsYXRpbmcgdGhlIG5ldyBHUElPIHZhbHVlIGZvciBzdGF0
dXMgdXBkYXRlCi0gY29sbGVjdGVkIG1vcmUgdGFncwoKQmFydG9zeiBHb2xhc3pld3NraSAoOSk6
CiAgYmFja2xpZ2h0OiBncGlvOiByZW1vdmUgdW5uZWVkZWQgaW5jbHVkZQogIGJhY2tsaWdodDog
Z3BpbzogcmVtb3ZlIHN0cmF5IG5ld2xpbmUKICBiYWNrbGlnaHQ6IGdwaW86IGV4cGxpY2l0bHkg
c2V0IHRoZSBkaXJlY3Rpb24gb2YgdGhlIEdQSU8KICBzaDogZWNvdmVjMjQ6IGFkZCBhZGRpdGlv
bmFsIHByb3BlcnRpZXMgdG8gdGhlIGJhY2tsaWdodCBkZXZpY2UKICBiYWNrbGlnaHQ6IGdwaW86
IHNpbXBsaWZ5IHRoZSBwbGF0Zm9ybSBkYXRhIGhhbmRsaW5nCiAgc2g6IGVjb3ZlYzI0OiBkb24n
dCBzZXQgdW51c2VkIGZpZWxkcyBpbiBwbGF0Zm9ybSBkYXRhCiAgYmFja2xpZ2h0OiBncGlvOiBy
ZW1vdmUgdW51c2VkIGZpZWxkcyBmcm9tIHBsYXRmb3JtIGRhdGEKICBiYWNrbGlnaHQ6IGdwaW86
IHVzZSBhIGhlbHBlciB2YXJpYWJsZSBmb3IgJnBkZXYtPmRldgogIGJhY2tsaWdodDogZ3Bpbzog
cHVsbCBncGlvX2JhY2tsaWdodF9pbml0aWFsX3Bvd2VyX3N0YXRlKCkgaW50byBwcm9iZQoKIGFy
Y2gvc2gvYm9hcmRzL21hY2gtZWNvdmVjMjQvc2V0dXAuYyAgICAgICAgIHwgIDMzICsrKy0tCiBk
cml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9ncGlvX2JhY2tsaWdodC5jICAgICB8IDEyOCArKysrKysr
LS0tLS0tLS0tLS0tCiBpbmNsdWRlL2xpbnV4L3BsYXRmb3JtX2RhdGEvZ3Bpb19iYWNrbGlnaHQu
aCB8ICAgMyAtCiAzIGZpbGVzIGNoYW5nZWQsIDY5IGluc2VydGlvbnMoKyksIDk1IGRlbGV0aW9u
cygtKQoKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
