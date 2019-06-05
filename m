Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1244835D3E
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 14:53:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EF0689944;
	Wed,  5 Jun 2019 12:53:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BD3789944
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 12:53:24 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id s3so2152501wms.2
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jun 2019 05:53:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uycimCcEQzjnF8sAY15CB1rjUO658nghgDAo0Xg98gY=;
 b=JKBfeUnIDE8NBgtUYQ+7I18QuMbnU3MfALSDjyW6jcTmIP3M7ya12p+RxfVr3uSSrv
 afZKmCHG64f4uAwp9kRFIZrNtsN4BMU5emzlb89IgFubQhKTjv3jc4jqJcK06Al4bb4w
 foyZBFn8L/gBr9OXIbUH53kTgAeYQjgYAwZxqOFaPfO+2PnXfJNUhnGG316jWf+DXwVA
 lw2eJF+0pEFskrb4Tvw5F4nuI+p0BwlFcG8Fx6gWGrLLmQkmRKuRLBf0Z0IHJopKmhzW
 p2vjdmebwPmBykNIhbxJrhPEcwM/L1P6+YP0Kc6IfswoDIuJ048n49p9JV5GUs/oLsbd
 QCDw==
X-Gm-Message-State: APjAAAVcKcdcmS0WH2j71ymmlJ60EAyaYlu8e/ef2tES1k1w3GEltHuk
 MWt3r3vylxCrhEf3b5GivF+FUh9jJFx4mQ==
X-Google-Smtp-Source: APXvYqyFNJn7u0rlc7fuBS/JBHoswH/Cksr0I7UUMNH8dOfpQeeAAj7ioSr6w1ClZki3MK5UMpczUg==
X-Received: by 2002:a1c:7f93:: with SMTP id
 a141mr12477467wmd.131.1559739202495; 
 Wed, 05 Jun 2019 05:53:22 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id y133sm20899720wmg.5.2019.06.05.05.53.21
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 05 Jun 2019 05:53:21 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/meson: fix G12A HDMI PLL settings for 4K60 1000/1001
 variations
Date: Wed,  5 Jun 2019 14:53:20 +0200
Message-Id: <20190605125320.8708-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uycimCcEQzjnF8sAY15CB1rjUO658nghgDAo0Xg98gY=;
 b=SFA9jBNJIJjn/VRmKcxWKSqZlCzG68DwU1APLNgz/VGf54XhH+wBfVmPfIf0S9G78i
 B83QHCtcDhiKC3BC/qlukVnIfhbtivcNHDGthGl2vtQyePaPo/cpWuF6v2NMyzf12abb
 YxiD0aZzeGxoJxmQALzwEgncPRo/6fQCFcLfOQiR0EpFhS7oCP3JZzP5B/OeyAGX0E42
 CRsfyWi8aGOtUWN8J73M790NZ//umWtXEvn+qpC6beRqeQJUePP3JRwTEy0Bmeg+X/yZ
 y6W86bz1rzSAuLj1PM9rlsKgyPNaF5nKaYqAgWGwmse4N7A/DMfDQWuwtgokhCattDhE
 N6gw==
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIEFtbG9naWMgRzEyQSBIRE1JIFBMTCBuZWVkcyBzb21lIHNwZWNpZmljIHNldHRpbmdzIHRv
IGxvY2sgd2l0aApkaWZmZXJlbnQgZnJhY3Rpb25hbCB2YWx1ZXMgZm9yIHRoZSA1LDRHSHogbW9k
ZS4KCkhhbmRsZSB0aGUgMTAwMC8xMDAxIHZhcmlhdGlvbiBmcmFjdGlvbmFsIGNhc2UgaGVyZSB0
byBhdm9pZCBoYXZpbmcKdGhlIFBMTCBpbiBhbiBub24gbG9ja2FibGUgc3RhdGUuCgpGaXhlczog
MjAyYjk4MDhmOGVkICgiZHJtL21lc29uOiBBZGQgRzEyQSBWaWRlbyBDbG9jayBzZXR1cCIpClNp
Z25lZC1vZmYtYnk6IE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fdmNsay5jIHwgMTMgKysrKysrKysrKystLQog
MSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX3ZjbGsuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9tZXNvbi9tZXNvbl92Y2xrLmMKaW5kZXggNDQyNTBlZmY4YTNmLi44M2ZjMmZjODIwMDEgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl92Y2xrLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL21lc29uL21lc29uX3ZjbGsuYwpAQCAtNTUzLDggKzU1MywxNyBAQCB2b2lkIG1l
c29uX2hkbWlfcGxsX3NldF9wYXJhbXMoc3RydWN0IG1lc29uX2RybSAqcHJpdiwgdW5zaWduZWQg
aW50IG0sCiAKIAkJLyogRzEyQSBIRE1JIFBMTCBOZWVkcyBzcGVjaWZpYyBwYXJhbWV0ZXJzIGZv
ciA1LjRHSHogKi8KIAkJaWYgKG0gPj0gMHhmNykgewotCQkJcmVnbWFwX3dyaXRlKHByaXYtPmho
aSwgSEhJX0hETUlfUExMX0NOVEw0LCAweGVhNjhkYzAwKTsKLQkJCXJlZ21hcF93cml0ZShwcml2
LT5oaGksIEhISV9IRE1JX1BMTF9DTlRMNSwgMHg2NTc3MTI5MCk7CisJCQlpZiAoZnJhYyA8IDB4
MTAwMDApIHsKKwkJCQlyZWdtYXBfd3JpdGUocHJpdi0+aGhpLCBISElfSERNSV9QTExfQ05UTDQs
CisJCQkJCQkJMHg2YTY4NWMwMCk7CisJCQkJcmVnbWFwX3dyaXRlKHByaXYtPmhoaSwgSEhJX0hE
TUlfUExMX0NOVEw1LAorCQkJCQkJCTB4MTE1NTEyOTMpOworCQkJfSBlbHNlIHsKKwkJCQlyZWdt
YXBfd3JpdGUocHJpdi0+aGhpLCBISElfSERNSV9QTExfQ05UTDQsCisJCQkJCQkJMHhlYTY4ZGMw
MCk7CisJCQkJcmVnbWFwX3dyaXRlKHByaXYtPmhoaSwgSEhJX0hETUlfUExMX0NOVEw1LAorCQkJ
CQkJCTB4NjU3NzEyOTApOworCQkJfQogCQkJcmVnbWFwX3dyaXRlKHByaXYtPmhoaSwgSEhJX0hE
TUlfUExMX0NOVEw2LCAweDM5MjcyMDAwKTsKIAkJCXJlZ21hcF93cml0ZShwcml2LT5oaGksIEhI
SV9IRE1JX1BMTF9DTlRMNywgMHg1NTU0MDAwMCk7CiAJCX0gZWxzZSB7Ci0tIAoyLjIxLjAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
