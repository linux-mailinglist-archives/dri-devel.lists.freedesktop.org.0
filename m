Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5904FEC84E
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 19:11:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EC5B6F84B;
	Fri,  1 Nov 2019 18:11:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED0146F84B
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2019 18:11:42 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id j30so3471188pgn.5
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Nov 2019 11:11:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=D6pp+waK1B6eoQZsfgu20T9S0S5gE50J59ZyY893XeU=;
 b=i/0fpdF1ACMb2c1ThnuK5jXH7eMfU3w5DEVN6y8xvbldvau3nsFofwMwCynr7dKCQL
 oOH6Cyz2oq79rG+4T9fjdtOgvgZO0k7q8CAeo4lPSXhPerpxgIkPYPCgglbbM75xMQLi
 SouOMFtchOoFTHOiGGjrFRPHFcR7EFz2qZ2tqCCqGW6ma9AVykAosfVKpaGRGV+ZAhBI
 wEQHHT4BgLPy8n8uJ3+TnXwye7ftPQuOS+jN1WIOCMcu6H3gI3ii7X7OU6R7rJ1gXNQL
 ZWP99Cfu2rtDl/Vq/xfolNwfDXSsXs+Xp0mroS4MP8bRaVj8Tu8lYR+XS/2aCEP4jAbY
 b5yA==
X-Gm-Message-State: APjAAAXMbCi8gJP9ZP0Z615jVD8P1C9ppYBos3FaMc6oLum9Nxi3x8A7
 TBkOkjhyxvlW8Zs2HUsmowLhulbIeRU=
X-Google-Smtp-Source: APXvYqyntvvTNEB7b5YRQX6acrnW6EDOe32CdQyaoFyh8/yeQSOf08HCyibGS7j+0s+Mu2D+PSSeIg==
X-Received: by 2002:a17:90a:8816:: with SMTP id
 s22mr12344442pjn.31.1572631902246; 
 Fri, 01 Nov 2019 11:11:42 -0700 (PDT)
Received: from localhost ([100.118.89.209])
 by smtp.gmail.com with ESMTPSA id h5sm11525487pjc.9.2019.11.01.11.11.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2019 11:11:41 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/atomic: clear new_state pointers at hw_done
Date: Fri,  1 Nov 2019 11:07:13 -0700
Message-Id: <20191101180713.5470-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191101180713.5470-1-robdclark@gmail.com>
References: <20191101180713.5470-1-robdclark@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D6pp+waK1B6eoQZsfgu20T9S0S5gE50J59ZyY893XeU=;
 b=ctnx2Mq7v0ZwoxZpgw8YqdbWutmx0MLZKmxmioikkvICWrTw1w/6AKRvR8X0KBJo1Q
 H0q5nPYMGRreXVKlEPeoh4VtEN1K97KsqpD13ts5v4lWQFJg4H2P5+JzG7oAlzLrVo1p
 oI5Os+HHsLwy+OUClFC8ZVGFwLA6KHN6/4DoMryIAOT7NsStmpHqwZFUtokc9oZL/kT+
 cGvXVaiQTIs40ctu7V2vStfRIJlOGEpU2g9cmAKmuhy+UxHp9xJWz1vqEaJ+QNmFvjN+
 y8MDer/CsYviNag0SnshQ6oPqAx3IpnuaI3HL54iKUW3BxQAZRGqCosbW1KAi6YtEudk
 jw3Q==
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <seanpaul@chromium.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgoKVGhlIG5ldyBzdGF0ZSBz
aG91bGQgbm90IGJlIGFjY2Vzc2VkIGFmdGVyIHRoaXMgcG9pbnQuICBDbGVhciB0aGUKcG9pbnRl
cnMgdG8gbWFrZSB0aGF0IGV4cGxpY2l0LgoKVGhpcyBtYWtlcyB0aGUgZXJyb3IgY29ycmVjdGVk
IGluIHRoZSBwcmV2aW91cyBwYXRjaCBtb3JlIG9idmlvdXMuCgpTaWduZWQtb2ZmLWJ5OiBSb2Ig
Q2xhcmsgPHJvYmRjbGFya0BjaHJvbWl1bS5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9h
dG9taWNfaGVscGVyLmMgfCAyOSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxl
IGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2F0b21pY19oZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljX2hlbHBlci5j
CmluZGV4IDczMmJkMGNlOTI0MS4uMTc2ODMxZGY4MTYzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vZHJtX2F0b21pY19oZWxwZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21p
Y19oZWxwZXIuYwpAQCAtMjIzNCwxMyArMjIzNCw0MiBAQCBFWFBPUlRfU1lNQk9MKGRybV9hdG9t
aWNfaGVscGVyX2Zha2VfdmJsYW5rKTsKICAqLwogdm9pZCBkcm1fYXRvbWljX2hlbHBlcl9jb21t
aXRfaHdfZG9uZShzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSAqb2xkX3N0YXRlKQogeworCXN0cnVj
dCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3I7CisJc3RydWN0IGRybV9jb25uZWN0b3Jfc3RhdGUg
Km9sZF9jb25uX3N0YXRlLCAqbmV3X2Nvbm5fc3RhdGU7CiAJc3RydWN0IGRybV9jcnRjICpjcnRj
OwogCXN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAqb2xkX2NydGNfc3RhdGUsICpuZXdfY3J0Y19zdGF0
ZTsKKwlzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZTsKKwlzdHJ1Y3QgZHJtX3BsYW5lX3N0YXRlICpv
bGRfcGxhbmVfc3RhdGUsICpuZXdfcGxhbmVfc3RhdGU7CiAJc3RydWN0IGRybV9jcnRjX2NvbW1p
dCAqY29tbWl0OworCXN0cnVjdCBkcm1fcHJpdmF0ZV9vYmogKm9iajsKKwlzdHJ1Y3QgZHJtX3By
aXZhdGVfc3RhdGUgKm9sZF9vYmpfc3RhdGUsICpuZXdfb2JqX3N0YXRlOwogCWludCBpOwogCisJ
LyoKKwkgKiBBZnRlciB0aGlzIHBvaW50LCBkcml2ZXJzIHNob3VsZCBub3QgYWNjZXNzIHRoZSBw
ZXJtYW5lbnQgbW9kZXNldAorCSAqIHN0YXRlLCBzbyB3ZSBhbHNvIGNsZWFyIHRoZSBuZXdfc3Rh
dGUgcG9pbnRlcnMgdG8gbWFrZSB0aGlzCisJICogcmVzdHJpY3Rpb24gZXhwbGljaXQuCisJICoK
KwkgKiBGb3IgdGhlIENSVEMgc3RhdGUsIHdlIGRvIHRoaXMgaW4gdGhlIHNhbWUgbG9vcCB3aGVy
ZSB3ZSBzaWduYWwKKwkgKiBod19kb25lLCBzaW5jZSB3ZSBzdGlsbCBuZWVkIHRvIG5ld19jcnRj
X3N0YXRlIHRvIGZpc2ggb3V0IHRoZQorCSAqIGNvbW1pdC4KKwkgKi8KKworCWZvcl9lYWNoX29s
ZG5ld19jb25uZWN0b3JfaW5fc3RhdGUob2xkX3N0YXRlLCBjb25uZWN0b3IsIG9sZF9jb25uX3N0
YXRlLCBuZXdfY29ubl9zdGF0ZSwgaSkgeworCQlvbGRfc3RhdGUtPmNvbm5lY3RvcnNbaV0ubmV3
X3N0YXRlID0gTlVMTDsKKwl9CisKKwlmb3JfZWFjaF9vbGRuZXdfcGxhbmVfaW5fc3RhdGUob2xk
X3N0YXRlLCBwbGFuZSwgb2xkX3BsYW5lX3N0YXRlLCBuZXdfcGxhbmVfc3RhdGUsIGkpIHsKKwkJ
b2xkX3N0YXRlLT5wbGFuZXNbaV0ubmV3X3N0YXRlID0gTlVMTDsKKwl9CisKKwlmb3JfZWFjaF9v
bGRuZXdfcHJpdmF0ZV9vYmpfaW5fc3RhdGUob2xkX3N0YXRlLCBvYmosIG9sZF9vYmpfc3RhdGUs
IG5ld19vYmpfc3RhdGUsIGkpIHsKKwkJb2xkX3N0YXRlLT5wcml2YXRlX29ianNbaV0ubmV3X3N0
YXRlID0gTlVMTDsKKwl9CisKIAlmb3JfZWFjaF9vbGRuZXdfY3J0Y19pbl9zdGF0ZShvbGRfc3Rh
dGUsIGNydGMsIG9sZF9jcnRjX3N0YXRlLCBuZXdfY3J0Y19zdGF0ZSwgaSkgewogCQlvbGRfc3Rh
dGUtPmNydGNzW2ldLm5ld19zZWxmX3JlZnJlc2hfYWN0aXZlID0gbmV3X2NydGNfc3RhdGUtPnNl
bGZfcmVmcmVzaF9hY3RpdmU7CisJCW9sZF9zdGF0ZS0+Y3J0Y3NbaV0ubmV3X3N0YXRlID0gTlVM
TDsKIAogCQljb21taXQgPSBuZXdfY3J0Y19zdGF0ZS0+Y29tbWl0OwogCQlpZiAoIWNvbW1pdCkK
LS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
