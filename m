Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E55D080F
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 09:14:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 189AF6E916;
	Wed,  9 Oct 2019 07:13:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33F74899C7
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 12:05:26 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id u3so11708681lfl.10
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Oct 2019 05:05:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GHqEF0WPzWee4xQdmsltBE/DbSJ8wdizxOO3R+g9Qfw=;
 b=M2kCsbejWy+ZpdZF6sac9GQY8aX5MBFuBAzUT6hItC711D5jsxi/kKq7yctnVahejw
 aJPDKwHXVuL4Jg/PH+Xe7e0d27cG/y+VAFXA3QVkun/votTeFG2o8Z+Diu+yDHjQZFGq
 UjrbpzLmVWUDxVM1K3YSFS2V0yyDUZ2BPDIXNrpOkjk+wwwDKDtXPXVNhzHSPiE2Pzg0
 7dlg8vzw6xk+Tw7OGuJQa/1axzDajZuHE6ubTJPT1LYC45hQ5Xj+YSNloHTlXkfDWey6
 JRMsSK3Jb53gK3Fs3Jbtih8EM9rsBFhUu3qWRSSf9ddkbD75oItz6Pm19jllhmAItBYg
 DfQA==
X-Gm-Message-State: APjAAAUVZidNP+oqc0vAJFN+hRVNH0S8CwaRek0y4sLTqvhdD1lSW2Xd
 /GykVZMMK2+GDM4fjqaQ55JW5g==
X-Google-Smtp-Source: APXvYqxCIRhO8rpvb/4039KpvxZ2HkirRtcoXz27yozPDPIZ8udJLy4ukMGlXb9inSVE+1v8hleq+g==
X-Received: by 2002:a19:90:: with SMTP id 138mr19176383lfa.111.1570536324544; 
 Tue, 08 Oct 2019 05:05:24 -0700 (PDT)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id z18sm3918033ljh.17.2019.10.08.05.05.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2019 05:05:22 -0700 (PDT)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH v2 3/4] backlight: pwm_bl: drop use of int_pow()
Date: Tue,  8 Oct 2019 14:03:26 +0200
Message-Id: <20191008120327.24208-4-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191008120327.24208-1-linux@rasmusvillemoes.dk>
References: <20191008120327.24208-1-linux@rasmusvillemoes.dk>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 09 Oct 2019 07:12:51 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GHqEF0WPzWee4xQdmsltBE/DbSJ8wdizxOO3R+g9Qfw=;
 b=iHfqd7InHpWSp9HtncYc/nGuUN2SQLNPz6EP4Z7c0utpCDEfBTHo79qRfdGdqnHjDc
 mUERS8N/Ezm1xJivvlU2FPSjziBCWfbM0Mp19xZKJ+DciElb5UKCU0Vr/UJTOEN7Raiq
 9nMDdC6cEjkuK79xMF6I9qmtVilDUGJ2/wvCs=
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rm9yIGEgZml4ZWQgc21hbGwgZXhwb25lbnQgb2YgMywgaXQgaXMgbW9yZSBlZmZpY2llbnQgdG8g
c2ltcGx5IHVzZQp0d28gZXhwbGljaXQgbXVsdGlwbGljYXRpb25zIHJhdGhlciB0aGFuIGNhbGxp
bmcgdGhlIGludF9wb3coKSBsaWJyYXJ5CmZ1bmN0aW9uOiBBc2lkZSBmcm9tIHRoZSBmdW5jdGlv
biBjYWxsIG92ZXJoZWFkLCBpdHMgaW1wbGVtZW50YXRpb24KdXNpbmcgcmVwZWF0ZWQgc3F1YXJp
bmcgbWVhbnMgaXQgZW5kcyB1cCBkb2luZyBmb3VyIDY0eDY0Cm11bHRpcGxpY2F0aW9ucy4KClJl
dmlld2VkLWJ5OiBEYW5pZWwgVGhvbXBzb24gPGRhbmllbC50aG9tcHNvbkBsaW5hcm8ub3JnPgpT
aWduZWQtb2ZmLWJ5OiBSYXNtdXMgVmlsbGVtb2VzIDxsaW51eEByYXNtdXN2aWxsZW1vZXMuZGs+
Ci0tLQogZHJpdmVycy92aWRlby9iYWNrbGlnaHQvcHdtX2JsLmMgfCAzICsrLQogMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvdmlkZW8vYmFja2xpZ2h0L3B3bV9ibC5jIGIvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvcHdt
X2JsLmMKaW5kZXggNjcyYzVlN2NmY2QxLi4yNzNkM2ZiNjI4YTAgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvdmlkZW8vYmFja2xpZ2h0L3B3bV9ibC5jCisrKyBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0
L3B3bV9ibC5jCkBAIC0xNzksNyArMTc5LDggQEAgc3RhdGljIHU2NCBjaWUxOTMxKHVuc2lnbmVk
IGludCBsaWdodG5lc3MsIHVuc2lnbmVkIGludCBzY2FsZSkKIAlpZiAobGlnaHRuZXNzIDw9ICg4
ICogc2NhbGUpKSB7CiAJCXJldHZhbCA9IERJVl9ST1VORF9DTE9TRVNUKGxpZ2h0bmVzcyAqIDEw
LCA5MDMzKTsKIAl9IGVsc2UgewotCQlyZXR2YWwgPSBpbnRfcG93KChsaWdodG5lc3MgKyAoMTYg
KiBzY2FsZSkpIC8gMTE2LCAzKTsKKwkJcmV0dmFsID0gKGxpZ2h0bmVzcyArICgxNiAqIHNjYWxl
KSkgLyAxMTY7CisJCXJldHZhbCAqPSByZXR2YWwgKiByZXR2YWw7CiAJCXJldHZhbCA9IERJVl9S
T1VORF9DTE9TRVNUX1VMTChyZXR2YWwsIChzY2FsZSAqIHNjYWxlKSk7CiAJfQogCi0tIAoyLjIw
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
