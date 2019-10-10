Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9104D2636
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 11:25:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A7966EAD4;
	Thu, 10 Oct 2019 09:25:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9E486EAD3
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 09:25:35 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id i16so6115172wmd.3
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 02:25:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f3ctIUvz8ki//w5Qhjxnv27+ll8g0IP9/N04IDuTOJg=;
 b=c9cbZrSaQCGTNI0C6ofPQKAvFD14Xly4Mczri3NP0pEk7UNOariFYYH5+ooHI4qfwz
 tqs+fFke1w+ZBZB5LxLEPXdRul3B7kekhyhjVnyX5Evt8rfi5Xr8JMtekZ2FKwDYJY5U
 cqdjMB/Lnlhz+CGpRbKEURSnXIJIUp1tXSS4H8IW78gOzcKZelC7/1H2Vb25r0g/W5lL
 rhKPAjp1zVEcQxAgAJKqftK8AkpvKXgCsHARQ6FUqiMFILWgf9NE5qd0vWmeFsXJjNDB
 xp+R5DWB1uNTVq+Q0bkp1pLwkoJWee77629LqVRj84LXu8VMlbukacA88DI8OoPmF3vv
 iOdg==
X-Gm-Message-State: APjAAAVR1kFHrYxoVq1ZZ4mv1teJQCO2TX9/rXWElKrL7rnhgubWrG/z
 ljOmbByTqCiqvGW3MXoMhL5pgWOBQGYIQw==
X-Google-Smtp-Source: APXvYqzCX+uR6yyZpq/jmdYp7epbZRPT1skB478yR2lPA9B3rxQLF815d5TEzrTMYDsCwtjdf0jD4Q==
X-Received: by 2002:a7b:c7d4:: with SMTP id z20mr6595993wmk.135.1570699533878; 
 Thu, 10 Oct 2019 02:25:33 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id s10sm8373770wmf.48.2019.10.10.02.25.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2019 02:25:33 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 6/7] drm/meson: hold 32 lines after vsync to give time for
 AFBC start
Date: Thu, 10 Oct 2019 11:25:25 +0200
Message-Id: <20191010092526.10419-7-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191010092526.10419-1-narmstrong@baylibre.com>
References: <20191010092526.10419-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f3ctIUvz8ki//w5Qhjxnv27+ll8g0IP9/N04IDuTOJg=;
 b=HRdZC/s9ma3pxudoYLPvW0srlLgWrP2X+EsMV9H/qDvISXSM2jtJofXSsaHooSMI5A
 BfJHSMAWgBzVicA25C+sSGTb37kLqxiO2lYczi0iecPFplu6o/F8LOLKosRKSEBPiJbL
 HgcIO0pa8Vli/y+bAkSF6+y1tnvoBpUqbX/2jrMkHp1uhbHCnAAEtLF25aTEAjVDm9PT
 gIuR8ENwEXeOT8nLOX7VVyyidjQAZYAWK9akKfhyUGb6+garI4gesqRwdKGxD4FgmL/c
 xfqEtTfPZQ5Um018FjnoDnGkUjUinBe5RH1FoFB7a08vZPOKBe1nrxN7h5RS2+u9QWQ2
 hrBQ==
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
Cc: khilman@baylibre.com, linux-amlogic@lists.infradead.org,
 ayan.halder@arm.com, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hlbiB1c2luZyBhbiBBRkJDIGVuY29kZWQgZnJhbWUsIHRoZSBBRkJDIERlY29kZXIgbXVzdCBi
ZSByZXNldHRlZCwKY29uZmlndXJlZCBhbmQgZW5hYmxlZCBhdCBlYWNoIHZzeW5jIElSUS4KClRv
IGxlYXZlIHRpbWUgZm9yIHRoYXQsIHVzZSB0aGUgbWF4aW11bSBsaW5lcyBob2xkIHRpbWUgdG8g
Z2l2ZSB0aW1lCmZvciBBRkJDIHNldHVwIGFuZCBhdm9pZCB2aXN1YWwgZ2xpdGNoZXMuCgpTaWdu
ZWQtb2ZmLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX3ZpdS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL21lc29uL21lc29uX3ZpdS5jIGIvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX3ZpdS5j
CmluZGV4IGNkZDQ5NjI0ODRkYi4uYmU1MzVlMjNmYzk5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vbWVzb24vbWVzb25fdml1LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29u
X3ZpdS5jCkBAIC00MTQsNyArNDE0LDcgQEAgdm9pZCBtZXNvbl92aXVfaW5pdChzdHJ1Y3QgbWVz
b25fZHJtICpwcml2KQogCiAJLyogSW5pdGlhbGl6ZSBPU0QxIGZpZm8gY29udHJvbCByZWdpc3Rl
ciAqLwogCXJlZyA9IFZJVV9PU0RfRERSX1BSSU9SSVRZX1VSR0VOVCB8Ci0JCVZJVV9PU0RfSE9M
RF9GSUZPX0xJTkVTKDQpIHwKKwkJVklVX09TRF9IT0xEX0ZJRk9fTElORVMoMzEpIHwKIAkJVklV
X09TRF9GSUZPX0RFUFRIX1ZBTCgzMikgfCAvKiBmaWZvX2RlcHRoX3ZhbDogMzIqOD0yNTYgKi8K
IAkJVklVX09TRF9XT1JEU19QRVJfQlVSU1QoNCkgfCAvKiA0IHdvcmRzIGluIDEgYnVyc3QgKi8K
IAkJVklVX09TRF9GSUZPX0xJTUlUUygyKTsgICAgICAvKiBmaWZvX2xpbTogMioxNj0zMiAqLwot
LSAKMi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
