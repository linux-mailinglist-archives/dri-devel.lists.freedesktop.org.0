Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D36C22E83
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2019 10:23:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5878E892DC;
	Mon, 20 May 2019 08:22:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70822892C0
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 08:22:53 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id b8so22489733edm.11
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 01:22:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AZL7dK3QHcNbZLKWjImh8nse/rAEY9uop0vjWdMdQzA=;
 b=b1/KCBgbFcm67iszhBL6EAtT0nhAiLrjTDuWAA0Qzi9yhrw5cxs48t282ywGg3z2Vu
 N3XkLm/xQ768EQPBMi0M1bU92JxnbARkS0hn+Xi1etnnk6KoETU9yBYeRg4UzJoMVnjj
 OlTKIOBL++vLSupWzoTVrlRK1NgVsqRWBReB89uuiHNWGSROEYBcBRXjuGYgay6fq14z
 5jTC612rI1dnRd9LIboDw0gWgm6F3yyZw07Gk2GO20LYD85gzowgnRiXdi/u/Q6QGayY
 AOzTIVze1xKOlw6EFz0NTzSQCxwKDiz2wcJlNbrxT7oYaEntx2YVKNEnhVTc0MmBsXZe
 r4cQ==
X-Gm-Message-State: APjAAAVNAgiayLsd3QECuaps3n4OUqUxVXL0hzRE/f+ZPDJyw3edTwBG
 b/phU0et4coGJX/Nw9wNUtxtFCopqoQ=
X-Google-Smtp-Source: APXvYqxRm2Ckj9q3hFReAnFGuCBRLSDRkWc0S6Nan4YCQS01wu484++cIwoI5wP8Fcp4ASbyyRkA6A==
X-Received: by 2002:a50:87ab:: with SMTP id a40mr71795115eda.188.1558340571784; 
 Mon, 20 May 2019 01:22:51 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id t25sm3021263ejx.8.2019.05.20.01.22.50
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 May 2019 01:22:51 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 25/33] fbcon: directly call fbcon_fb_blanked
Date: Mon, 20 May 2019 10:22:08 +0200
Message-Id: <20190520082216.26273-26-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190520082216.26273-1-daniel.vetter@ffwll.ch>
References: <20190520082216.26273-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AZL7dK3QHcNbZLKWjImh8nse/rAEY9uop0vjWdMdQzA=;
 b=NoAk5YbfgOrrNimMCYl/NP8C5JEoJkCWTI2pjUKdZmoYP0rjrm+mnHejEkHJawdEKF
 nuRBvHhZQbrtrxfKuEnAoSyV2BjjA6n2qfhn5YAdpw9yDjZL4fk1ZOVkAQ1g+ho2bJYi
 QrGJ1Pxj4z1zxnXE8b2klkEFzo/InU0gaGEVc=
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
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
 Yisheng Xie <ysxie@foxmail.com>, Hans de Goede <hdegoede@redhat.com>,
 Mikulas Patocka <mpatocka@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2UgY2FudCByZW1vdmUgRkJfRVZFTlRfQkxBTksgYmVjYXVzZSB0aGF0J3Mgc3RpbGwgdXNlZCBi
eSB0aGUKYmFja2xpZ2h0IGFuZCBsY2QgY29kZSwgYnV0IHRoYXQncyBraW5kYSBmaW5lOiBObyBy
ZWN1cnNpb24gYmV0d2VlbgpmYmRldiBjb3JlIGNvZGUgYW5kIGZiY29uIGNvZGUgcG9zc2libGUg
Zm9yIHRoYXQgY2FzZS4KClNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0
ZXJAaW50ZWwuY29tPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4K
Q2M6IEJhcnRsb21pZWogWm9sbmllcmtpZXdpY3ogPGIuem9sbmllcmtpZUBzYW1zdW5nLmNvbT4K
Q2M6IEhhbnMgZGUgR29lZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+CkNjOiBZaXNoZW5nIFhpZSA8
eXN4aWVAZm94bWFpbC5jb20+CkNjOiAiTWljaGHFgiBNaXJvc8WCYXciIDxtaXJxLWxpbnV4QHJl
cmUucW1xbS5wbD4KQ2M6IFBldGVyIFJvc2luIDxwZWRhQGF4ZW50aWEuc2U+CkNjOiBNaWt1bGFz
IFBhdG9ja2EgPG1wYXRvY2thQHJlZGhhdC5jb20+Ci0tLQogZHJpdmVycy92aWRlby9mYmRldi9j
b3JlL2ZiY29uLmMgfCA1ICstLS0tCiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJtZW0uYyB8
IDEgKwogaW5jbHVkZS9saW51eC9mYmNvbi5oICAgICAgICAgICAgfCAyICsrCiAzIGZpbGVzIGNo
YW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJjb24uYyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9m
YmNvbi5jCmluZGV4IDE1NDkwNTZhODQ4ZS4uZjg1ZDc5NGEzYmVlIDEwMDY0NAotLS0gYS9kcml2
ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJjb24uYworKysgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2Nv
cmUvZmJjb24uYwpAQCAtMzIyNyw3ICszMjI3LDcgQEAgaW50IGZiY29uX2ZiX3JlZ2lzdGVyZWQo
c3RydWN0IGZiX2luZm8gKmluZm8pCiAJcmV0dXJuIHJldDsKIH0KIAotc3RhdGljIHZvaWQgZmJj
b25fZmJfYmxhbmtlZChzdHJ1Y3QgZmJfaW5mbyAqaW5mbywgaW50IGJsYW5rKQordm9pZCBmYmNv
bl9mYl9ibGFua2VkKHN0cnVjdCBmYl9pbmZvICppbmZvLCBpbnQgYmxhbmspCiB7CiAJc3RydWN0
IGZiY29uX29wcyAqb3BzID0gaW5mby0+ZmJjb25fcGFyOwogCXN0cnVjdCB2Y19kYXRhICp2YzsK
QEAgLTMzMzEsOSArMzMzMSw2IEBAIHN0YXRpYyBpbnQgZmJjb25fZXZlbnRfbm90aWZ5KHN0cnVj
dCBub3RpZmllcl9ibG9jayAqc2VsZiwKIAkJY29uMmZiID0gZXZlbnQtPmRhdGE7CiAJCWNvbjJm
Yi0+ZnJhbWVidWZmZXIgPSBjb24yZmJfbWFwW2NvbjJmYi0+Y29uc29sZSAtIDFdOwogCQlicmVh
azsKLQljYXNlIEZCX0VWRU5UX0JMQU5LOgotCQlmYmNvbl9mYl9ibGFua2VkKGluZm8sICooaW50
ICopZXZlbnQtPmRhdGEpOwotCQlicmVhazsKIAljYXNlIEZCX0VWRU5UX1JFTUFQX0FMTF9DT05T
T0xFOgogCQlpZHggPSBpbmZvLT5ub2RlOwogCQlmYmNvbl9yZW1hcF9hbGwoaWR4KTsKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYm1lbS5jIGIvZHJpdmVycy92aWRlby9m
YmRldi9jb3JlL2ZibWVtLmMKaW5kZXggZDQyOGQwOGMzNThhLi45OTMyMTMwYmY3MjggMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYm1lbS5jCisrKyBiL2RyaXZlcnMvdmlk
ZW8vZmJkZXYvY29yZS9mYm1lbS5jCkBAIC0xMDY4LDYgKzEwNjgsNyBAQCBmYl9ibGFuayhzdHJ1
Y3QgZmJfaW5mbyAqaW5mbywgaW50IGJsYW5rKQogCWV2ZW50LmRhdGEgPSAmYmxhbms7CiAKIAll
YXJseV9yZXQgPSBmYl9ub3RpZmllcl9jYWxsX2NoYWluKEZCX0VBUkxZX0VWRU5UX0JMQU5LLCAm
ZXZlbnQpOworCWZiY29uX2ZiX2JsYW5rZWQoaW5mbywgYmxhbmspOwogCiAJaWYgKGluZm8tPmZi
b3BzLT5mYl9ibGFuaykKICAJCXJldCA9IGluZm8tPmZib3BzLT5mYl9ibGFuayhibGFuaywgaW5m
byk7CmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2ZiY29uLmggYi9pbmNsdWRlL2xpbnV4L2Zi
Y29uLmgKaW5kZXggN2YwYTUzMGE5MTNjLi45MGUxOTZjODM1ZGQgMTAwNjQ0Ci0tLSBhL2luY2x1
ZGUvbGludXgvZmJjb24uaAorKysgYi9pbmNsdWRlL2xpbnV4L2ZiY29uLmgKQEAgLTE0LDYgKzE0
LDcgQEAgaW50IGZiY29uX21vZGVfZGVsZXRlZChzdHJ1Y3QgZmJfaW5mbyAqaW5mbywKIHZvaWQg
ZmJjb25fbmV3X21vZGVsaXN0KHN0cnVjdCBmYl9pbmZvICppbmZvKTsKIHZvaWQgZmJjb25fZ2V0
X3JlcXVpcmVtZW50KHN0cnVjdCBmYl9pbmZvICppbmZvLAogCQkJICAgc3RydWN0IGZiX2JsaXRf
Y2FwcyAqY2Fwcyk7Cit2b2lkIGZiY29uX2ZiX2JsYW5rZWQoc3RydWN0IGZiX2luZm8gKmluZm8s
IGludCBibGFuayk7CiAjZWxzZQogc3RhdGljIGlubGluZSB2b2lkIGZiX2NvbnNvbGVfaW5pdCh2
b2lkKSB7fQogc3RhdGljIGlubGluZSB2b2lkIGZiX2NvbnNvbGVfZXhpdCh2b2lkKSB7fQpAQCAt
MjcsNiArMjgsNyBAQCBpbnQgZmJjb25fbW9kZV9kZWxldGVkKHN0cnVjdCBmYl9pbmZvICppbmZv
LAogdm9pZCBmYmNvbl9uZXdfbW9kZWxpc3Qoc3RydWN0IGZiX2luZm8gKmluZm8pIHt9CiB2b2lk
IGZiY29uX2dldF9yZXF1aXJlbWVudChzdHJ1Y3QgZmJfaW5mbyAqaW5mbywKIAkJCSAgIHN0cnVj
dCBmYl9ibGl0X2NhcHMgKmNhcHMpIHt9Cit2b2lkIGZiY29uX2ZiX2JsYW5rZWQoc3RydWN0IGZi
X2luZm8gKmluZm8sIGludCBibGFuaykge30KICNlbmRpZgogCiAjZW5kaWYgLyogX0xJTlVYX0ZC
Q09OX0ggKi8KLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
