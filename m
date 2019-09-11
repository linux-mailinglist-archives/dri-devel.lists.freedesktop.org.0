Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D2FB092F
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 09:08:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22B846EB9D;
	Thu, 12 Sep 2019 07:07:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF51D6EA49
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2019 07:52:27 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id y22so13173605pfr.3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2019 00:52:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=65psbidcDO0CPIrkMyNPrHv3R58h3YXHwN4mI+2C5o4=;
 b=iaIP9Nzvl9jzaki2XFmTL1nHkwL6DdwdwKyWy8KWivODDtJRI4sxgeXzsrZ+PeC5C4
 LWfH306YDgucfQJdjR77eT37WOr2wthSCXRdSj2QM2AKyBe48HgQfc8yDuylCXpGdTls
 TGGvGFwfYTYqaCUXbvIwpufMzDgHlwf7sAb9kG1GAbBujLnZ7SPDAb1EvBqUDgvCfn8x
 W1dZ2jgGV8qPeMV3ytDLtehNzz3A9n9qfbZ+GdCa6Jb9sji1BrkOF1daVqJeWNoGlq1s
 5N1UH7SJuma0ZvavZWONARR8+OqccRrgd2piOXPJltINQcwHw6w/YWezqN8W9exvePqa
 +D4g==
X-Gm-Message-State: APjAAAVkDkzeWEWk4KMY40SUKTFgfjJE6qn8+a6AGPWHS5wedW6Mre2K
 YHTIvQ2f1BgIowqf6jD+oN8=
X-Google-Smtp-Source: APXvYqyLxG3qHNsE28JgaCm3PaY2gBvHPOH0XnvA43dLZtsleF60v1vMfX/a4i4rKt34mlqcl18JPA==
X-Received: by 2002:a17:90a:e292:: with SMTP id
 d18mr4093999pjz.100.1568188347317; 
 Wed, 11 Sep 2019 00:52:27 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com
 ([2620:15c:202:201:3adc:b08c:7acc:b325])
 by smtp.gmail.com with ESMTPSA id u2sm8582445pgp.66.2019.09.11.00.52.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2019 00:52:26 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 06/11] drm/bridge: ti-tfp410: switch to using
 fwnode_gpiod_get_index()
Date: Wed, 11 Sep 2019 00:52:10 -0700
Message-Id: <20190911075215.78047-7-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.23.0.162.g0b9fbb3734-goog
In-Reply-To: <20190911075215.78047-1-dmitry.torokhov@gmail.com>
References: <20190911075215.78047-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 12 Sep 2019 07:07:54 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=65psbidcDO0CPIrkMyNPrHv3R58h3YXHwN4mI+2C5o4=;
 b=gousrssIPukQ29gCfHUWB/JlJvT3ZfwR9DvQ+acLhprClxxW12JQp3XblRh6dVkEr0
 d58eh5oTTF+bUcW2Fx9nPHXzWqSRH635X7LUNLYNMDLTFzZ/bCjEfkEM8ASgoTpTE/2Q
 Og+5qu6BYYKO0xkt6i2GC5s2av5Qooqs1L0eknjN8Wi8c5wHlVhH0opG5JtlkJOiyBHt
 3UgSXiRWNHIucg97NiaXHUqBP/ZppS0x5ob6XlwBcV1tvepryyMDFz6s4rgsYqbztH0D
 zdF67XMzIXLpIoabDv/RII70hePB8qrJy3GHoxaGwz8r1sDBZSRslKBpAtxlbFFaesdU
 CUnQ==
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-gpio@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW5zdGVhZCBvZiBmd25vZGVfZ2V0X25hbWVkX2dwaW9kKCkgdGhhdCBJIHBsYW4gdG8gaGlkZSBh
d2F5LCBsZXQncyB1c2UKdGhlIG5ldyBmd25vZGVfZ3Bpb2RfZ2V0X2luZGV4KCkgdGhhdCBtaW1p
Y3MgZ3Bpb2RfZ2V0X2luZGV4KCksIGJpdAp3b3JrcyB3aXRoIGFyYml0cmFyeSBmaXJtd2FyZSBu
b2RlLgoKU2lnbmVkLW9mZi1ieTogRG1pdHJ5IFRvcm9raG92IDxkbWl0cnkudG9yb2tob3ZAZ21h
aWwuY29tPgotLS0KCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXRmcDQxMC5jIHwgNCArKy0t
CiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktdGZwNDEwLmMgYi9kcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL3RpLXRmcDQxMC5jCmluZGV4IDYxY2MyMzU0ZWYxYi4uZDljOWM5ZWJhZDJiIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXRmcDQxMC5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9icmlkZ2UvdGktdGZwNDEwLmMKQEAgLTI4NCw4ICsyODQsOCBAQCBzdGF0aWMg
aW50IHRmcDQxMF9nZXRfY29ubmVjdG9yX3Byb3BlcnRpZXMoc3RydWN0IHRmcDQxMCAqZHZpKQog
CWVsc2UKIAkJZHZpLT5jb25uZWN0b3JfdHlwZSA9IERSTV9NT0RFX0NPTk5FQ1RPUl9EVklEOwog
Ci0JZHZpLT5ocGQgPSBmd25vZGVfZ2V0X25hbWVkX2dwaW9kKCZjb25uZWN0b3Jfbm9kZS0+Zndu
b2RlLAotCQkJCQkiaHBkLWdwaW9zIiwgMCwgR1BJT0RfSU4sICJocGQiKTsKKwlkdmktPmhwZCA9
IGZ3bm9kZV9ncGlvZF9nZXRfaW5kZXgoJmNvbm5lY3Rvcl9ub2RlLT5md25vZGUsCisJCQkJCSAg
ImhwZCIsIDAsIEdQSU9EX0lOLCAiaHBkIik7CiAJaWYgKElTX0VSUihkdmktPmhwZCkpIHsKIAkJ
cmV0ID0gUFRSX0VSUihkdmktPmhwZCk7CiAJCWR2aS0+aHBkID0gTlVMTDsKLS0gCjIuMjMuMC4x
NjIuZzBiOWZiYjM3MzQtZ29vZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
