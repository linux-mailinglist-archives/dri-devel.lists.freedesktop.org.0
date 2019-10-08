Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70914D07FD
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 09:13:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27F1D6E8F8;
	Wed,  9 Oct 2019 07:13:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC6166E10A
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 12:05:17 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id d17so11744884lfa.7
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Oct 2019 05:05:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yIqqIP3EIw1WUky7Dl5KboQRqFaypkEePxm8k0rEc9o=;
 b=VE/wkU6Cpa72eDSshvhGr5xza/neYSu2Y/1b6/8sBnPDxsNOpQcDm1r0EM4YCxdCJn
 Tm4l82bYs/OyOeFwXGdqDqYGQd0ZlzFsRJOE/rBC8R2SxRmLfLXaipIBFAwUvTwIlPSm
 io4s3gCp5rhppgtie9rs4r3weQYkWj+5qotKUQsPWraTT6QPQfuYUDuEvbZ3uLvGfxCo
 ja012V8UHCYztTahzDakXhEoxyMqc40Qz58QzsjqS3q17Nj7v5rSfh0iP6Zf0y14atEQ
 ZWUB2BN50aoND0+XNGikwaIHza3v/dZzJJolwQkz3bKHQrsOLBH9If4rZ1TI9CMa12kD
 t9Qw==
X-Gm-Message-State: APjAAAWt46nmBTWh9RWcLnziHbgLYWHrThbKjpSnrcRuJsOx/ov/G2SN
 0Yw9idgg20lHaZZxNrNkh0Ud+w==
X-Google-Smtp-Source: APXvYqykeLmJ/WUhlQxva8zZaqPikrZhQ2ld9WnisNftyHunM8rSa4gXa55Lqcwffs1sdJgebXd04g==
X-Received: by 2002:a19:ec16:: with SMTP id b22mr20438594lfa.189.1570536316077; 
 Tue, 08 Oct 2019 05:05:16 -0700 (PDT)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id z18sm3918033ljh.17.2019.10.08.05.05.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2019 05:05:15 -0700 (PDT)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-pwm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] backlight: pwm_bl: optimizations and small fix for
 cie1913
Date: Tue,  8 Oct 2019 14:03:23 +0200
Message-Id: <20191008120327.24208-1-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 09 Oct 2019 07:12:50 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yIqqIP3EIw1WUky7Dl5KboQRqFaypkEePxm8k0rEc9o=;
 b=AponybTxAeH4Qwys7uf32YeqpoJ78jgDddTlKOmqmCAlexPcNn8x24ajVQ+O7+xRkR
 RuBT096o6RaBaaTnFRhKPGbBnK69SeSdi0jX5VxETzV8yWF+FlbeSjLE8LtoSz+LXe/9
 1SJ01i6mDKGlRWpaglFSkyprM69Ur66rByxaU=
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
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlc2UgcGF0Y2hlcyBvcHRpbWl6ZSB0aGUgY2llMTkxMygpIGltcGxlbWVudGF0aW9uIGJ5IHVz
aW5nIGZld2VyIDY0CmJpdCBkaXZpc2lvbnMgYW5kIG11bHRpcGxpY2F0aW9ucy4gSXQgYWxzbyBj
b250YWlucyBhIG1pbm9yIGZpeCBmb3IKdGhlIGxpbmVhciBjb25zdGFudCB1c2VkLgoKdjI6Ci0g
RHJvcCBwYXRjaCA1LgotIEZpeCB0aGlua28gaW4gcGF0Y2ggNCwgb3RoZXJ3aXNlIG5vIGNvZGUg
Y2hhbmdlLgotIEJldHRlciBjaGFuZ2Vsb2cgaW4gcGF0Y2ggMy4KLSBBZGQgRGFuaWVsJ3MgUmV2
aWV3ZWQtQnkgdG8gdGhlIGZvdXIgcGF0Y2hlcy4KCkRhbmllbCwgSSB0b29rIHRoZSBsaWJlcnR5
IG9mIGFkZGluZyB5b3VyIFItQiB0byBwYXRjaCA0IGRlc3BpdGUKY2hhbmdpbmcgaXQgYSBsaXR0
bGUgdG8gZml4IGEgdGhpbmtvIC0gSSBzaG91bGQgYWRkIDE8PDMxIGFuZCBub3QKMTw8MTUuIFBs
ZWFzZSB0ZWxsIG1lIGlmIHRoYXQgd2FzIGluYXBwcm9wcmlhdGUuCgpSYXNtdXMgVmlsbGVtb2Vz
ICg0KToKICBiYWNrbGlnaHQ6IHB3bV9ibDogZml4IGNpZTE5MTMgY29tbWVudHMgYW5kIGNvbnN0
YW50CiAgYmFja2xpZ2h0OiBwd21fYmw6IGVsaW1pbmF0ZSBhIDY0LzMyIGRpdmlzaW9uCiAgYmFj
a2xpZ2h0OiBwd21fYmw6IGRyb3AgdXNlIG9mIGludF9wb3coKQogIGJhY2tsaWdodDogcHdtX2Js
OiBzd2l0Y2ggdG8gcG93ZXItb2YtMiBiYXNlIGZvciBmaXhlZC1wb2ludCBtYXRoCgogZHJpdmVy
cy92aWRlby9iYWNrbGlnaHQvcHdtX2JsLmMgfCAyOSArKysrKysrKysrKysrKysrKysrLS0tLS0t
LS0tLQogMSBmaWxlIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQoK
LS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
