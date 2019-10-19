Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F8BDDBA5
	for <lists+dri-devel@lfdr.de>; Sun, 20 Oct 2019 02:07:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75DF189CDF;
	Sun, 20 Oct 2019 00:07:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3015D89E19
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Oct 2019 08:36:11 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id n14so8534844wrw.9
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Oct 2019 01:36:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VXhFfTxJpOWfUV4uLITTpdbpqdC1NQz6QjTrt5AanH0=;
 b=JKs8ZPwRAbcbNUrukF4tSYjFD0CLxch+WnC4wx8ilW8N1QT6hqyhLOwUcmATcVYunw
 SPzau+E4EwY2AGmwNml917C9PB5o6psPYmmoHGOXZeOeJ2umYV6L4V9sluIMTxFtcQm+
 0j7W1pSc0dV/SabKcs/cT+15rTBoV+zir5Z+T3KYENibB5YMMM2T94cJRqpCojFkz3Y8
 HRWuV8PVvHMUnNi6IgRK3MlqnT5QT+u1/byt/PTeqsY32Kh15kO4g5+AAZielfvVZY6r
 XUwE66LsYzv6WV6AUN9qVs7/gSfBKnW+yQ15INjenxnRHec64f9CJgHPUoGFB3tTr2L6
 0HAg==
X-Gm-Message-State: APjAAAUYP+wnO7AxDsLx/JEJwMs7Mqj4AhNall5TBekflIwASV/3s/Be
 OiyvTba98zJl3GO/w2RyDNPbfg==
X-Google-Smtp-Source: APXvYqzpywR6S9c9y4631jsXMMJsyUrRt6pwryDVgj7Rqg+mTZW63A7CSWbAN0HUSeu0YfSw4B8Tvw==
X-Received: by 2002:adf:fe10:: with SMTP id n16mr11814058wrr.288.1571474169355; 
 Sat, 19 Oct 2019 01:36:09 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
 by smtp.gmail.com with ESMTPSA id u1sm7242627wmc.38.2019.10.19.01.36.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Oct 2019 01:36:08 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH v6 0/9] backlight: gpio: simplify the driver
Date: Sat, 19 Oct 2019 10:35:47 +0200
Message-Id: <20191019083556.19466-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 20 Oct 2019 00:06:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VXhFfTxJpOWfUV4uLITTpdbpqdC1NQz6QjTrt5AanH0=;
 b=AwGvW2qFwU4dQKW8lBPQ/vuxPkKv6boigxQ3TYodi8j7gdB94KMaRLHPKL/IYI6uJn
 1CIGOUN2ylCd2HpuFctEyL1DoxZhu3AfASOYrSkE252SsLRUzo5SywovV49r4yzVsfv6
 wqie+c7o139H5AKbInTkZ5dkRKmIJgNyF/ncbYxtrgkOuZb6cF/QiU6PbJjX+8PC4zQv
 gDqZ2Y2/aPGyq+sozGWoiqv+Xz4IUl67k4X0ixv2UiLNr14fSDGgwHxkSeSqZ2NzKyev
 /xJ9gxfoKX37xAdjGyo8ZogoPKFiRhyEPwZNLhzDv/5Yq2ZZ7+wwqHKQ0bpv6fRCpgP5
 6iew==
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
ZGVkIGEgcGF0Y2ggcmVtb3ZpbmcgYSByZWR1bmRhbnQgbmV3bGluZQoKQmFydG9zeiBHb2xhc3pl
d3NraSAoOSk6CiAgYmFja2xpZ2h0OiBncGlvOiByZW1vdmUgdW5uZWVkZWQgaW5jbHVkZQogIGJh
Y2tsaWdodDogZ3BpbzogcmVtb3ZlIHN0cmF5IG5ld2xpbmUKICBiYWNrbGlnaHQ6IGdwaW86IGV4
cGxpY2l0bHkgc2V0IHRoZSBkaXJlY3Rpb24gb2YgdGhlIEdQSU8KICBzaDogZWNvdmVjMjQ6IGFk
ZCBhZGRpdGlvbmFsIHByb3BlcnRpZXMgdG8gdGhlIGJhY2tsaWdodCBkZXZpY2UKICBiYWNrbGln
aHQ6IGdwaW86IHNpbXBsaWZ5IHRoZSBwbGF0Zm9ybSBkYXRhIGhhbmRsaW5nCiAgc2g6IGVjb3Zl
YzI0OiBkb24ndCBzZXQgdW51c2VkIGZpZWxkcyBpbiBwbGF0Zm9ybSBkYXRhCiAgYmFja2xpZ2h0
OiBncGlvOiByZW1vdmUgdW51c2VkIGZpZWxkcyBmcm9tIHBsYXRmb3JtIGRhdGEKICBiYWNrbGln
aHQ6IGdwaW86IHVzZSBhIGhlbHBlciB2YXJpYWJsZSBmb3IgJnBkZXYtPmRldgogIGJhY2tsaWdo
dDogZ3BpbzogcHVsbCBncGlvX2JhY2tsaWdodF9pbml0aWFsX3Bvd2VyX3N0YXRlKCkgaW50byBw
cm9iZQoKIGFyY2gvc2gvYm9hcmRzL21hY2gtZWNvdmVjMjQvc2V0dXAuYyAgICAgICAgIHwgIDMz
ICsrKy0tCiBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9ncGlvX2JhY2tsaWdodC5jICAgICB8IDEy
OCArKysrKysrLS0tLS0tLS0tLS0tCiBpbmNsdWRlL2xpbnV4L3BsYXRmb3JtX2RhdGEvZ3Bpb19i
YWNrbGlnaHQuaCB8ICAgMyAtCiAzIGZpbGVzIGNoYW5nZWQsIDY5IGluc2VydGlvbnMoKyksIDk1
IGRlbGV0aW9ucygtKQoKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
