Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA7B2C1FF
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 11:03:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDBAF89D5C;
	Tue, 28 May 2019 09:03:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4264E89C13
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 09:03:13 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id p26so30641551edr.2
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 02:03:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lLUCrKXHKAt3A/bBQVqTCTeOCvNqnrpALUNOe9jfHr4=;
 b=ZQlkxJP9OR3lbotoXt0go+SoeIsRy/otcim7d7swqpaUXKPeh3rYKIcNIc369AqG9X
 TFpY1ezMJ8BeO5S2uKh9ZmXzTQcbyA4a5D9SQFB9Ub7dEjccKFjwOPUjKuOk6mJKjwqW
 ld6dkNfYYYwfbBKKnC759WIGbmOe/4w5BjsrJUoty/mJitn6JT6FgY7UDLuV38bHIT3M
 JvPHELIO6pi5Okwt6s/0Se0t0/mmEo1EegX90p2ocLzEXs5JfsHsc/kJ5/qONDgluI+D
 lPmn0xtFBdXlAzmVd1A/D7xtquN+3sfpZVOoRhu4eVvQqkaS6EjBUCVLYvbneEd9JIpk
 8HPw==
X-Gm-Message-State: APjAAAX5iKjmSZJ31cQQRDYhit/i6XogOuXyB0Qyzi72fvVhQmyXZj9Q
 PFvQ0XTdbDkkaMxS06bYNUU1QQ==
X-Google-Smtp-Source: APXvYqzLN70+l87QPlEz8uE9d+Hi4atwthd0XgMpMbEkaPaxgOCAKWKU1k0iYUwvw4YO9wheHnEZxg==
X-Received: by 2002:a50:b665:: with SMTP id
 c34mr127787580ede.148.1559034191897; 
 Tue, 28 May 2019 02:03:11 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id x49sm4072656edm.25.2019.05.28.02.03.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 May 2019 02:03:11 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH 01/33] dummycon: Sprinkle locking checks
Date: Tue, 28 May 2019 11:02:32 +0200
Message-Id: <20190528090304.9388-2-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190528090304.9388-1-daniel.vetter@ffwll.ch>
References: <20190528090304.9388-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lLUCrKXHKAt3A/bBQVqTCTeOCvNqnrpALUNOe9jfHr4=;
 b=bMQ2bjpJBQsrLyF5NtCNtdDCqdZu00kxLhGVHuMgu5Ecnfugp/vFvZTt9YPT8/0NBT
 jUEC2OIP1/tU6emJgemxpDua5SKNi51ovh5LtpPGk1dY31H2NH0+z5o2haeY9WRwVZEj
 Fd6Bp0VSshVT08iDz2tigAozeP4D6d32wcQR0=
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
Cc: Nicolas Pitre <nicolas.pitre@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Kees Cook <keescook@chromium.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 linux-fbdev@vger.kernel.org, DRI Development <dri-devel@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXMgcGFydCBvZiB0cnlpbmcgdG8gdW5kZXJzdGFuZCB0aGUgbG9ja2luZyAob3IgbGFjayB0aGVy
ZW9mKSBpbiB0aGUKZmJjb24vdnQvZmJkZXYgbWF6ZSwgYW5ub3RhdGUgZXZlcnl0aGluZy4KClNp
Z25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgpSZXZp
ZXdlZC1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpSZXZpZXdlZC1ieTogTWFh
cnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KQ2M6IEJh
cnRsb21pZWogWm9sbmllcmtpZXdpY3ogPGIuem9sbmllcmtpZUBzYW1zdW5nLmNvbT4KQ2M6IEhh
bnMgZGUgR29lZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5p
ZWwudmV0dGVyQGZmd2xsLmNoPgpDYzogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhm
b3VuZGF0aW9uLm9yZz4KQ2M6IEtlZXMgQ29vayA8a2Vlc2Nvb2tAY2hyb21pdW0ub3JnPgpDYzog
Tmljb2xhcyBQaXRyZSA8bmljb2xhcy5waXRyZUBsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvdmlk
ZW8vY29uc29sZS9kdW1teWNvbi5jIHwgNiArKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2NvbnNvbGUvZHVtbXljb24uYyBi
L2RyaXZlcnMvdmlkZW8vY29uc29sZS9kdW1teWNvbi5jCmluZGV4IGZmODg2ZTk5MTA0Yi4uMmEw
ZDBiZGE3ZmFhIDEwMDY0NAotLS0gYS9kcml2ZXJzL3ZpZGVvL2NvbnNvbGUvZHVtbXljb24uYwor
KysgYi9kcml2ZXJzL3ZpZGVvL2NvbnNvbGUvZHVtbXljb24uYwpAQCAtMzQsNiArMzQsOCBAQCBz
dGF0aWMgYm9vbCBkdW1teWNvbl9wdXRjX2NhbGxlZDsKIAogdm9pZCBkdW1teWNvbl9yZWdpc3Rl
cl9vdXRwdXRfbm90aWZpZXIoc3RydWN0IG5vdGlmaWVyX2Jsb2NrICpuYikKIHsKKwlXQVJOX0NP
TlNPTEVfVU5MT0NLRUQoKTsKKwogCXJhd19ub3RpZmllcl9jaGFpbl9yZWdpc3RlcigmZHVtbXlj
b25fb3V0cHV0X25oLCBuYik7CiAKIAlpZiAoZHVtbXljb25fcHV0Y19jYWxsZWQpCkBAIC00Miwx
MSArNDQsMTUgQEAgdm9pZCBkdW1teWNvbl9yZWdpc3Rlcl9vdXRwdXRfbm90aWZpZXIoc3RydWN0
IG5vdGlmaWVyX2Jsb2NrICpuYikKIAogdm9pZCBkdW1teWNvbl91bnJlZ2lzdGVyX291dHB1dF9u
b3RpZmllcihzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sgKm5iKQogeworCVdBUk5fQ09OU09MRV9VTkxP
Q0tFRCgpOworCiAJcmF3X25vdGlmaWVyX2NoYWluX3VucmVnaXN0ZXIoJmR1bW15Y29uX291dHB1
dF9uaCwgbmIpOwogfQogCiBzdGF0aWMgdm9pZCBkdW1teWNvbl9wdXRjKHN0cnVjdCB2Y19kYXRh
ICp2YywgaW50IGMsIGludCB5cG9zLCBpbnQgeHBvcykKIHsKKwlXQVJOX0NPTlNPTEVfVU5MT0NL
RUQoKTsKKwogCWR1bW15Y29uX3B1dGNfY2FsbGVkID0gdHJ1ZTsKIAlyYXdfbm90aWZpZXJfY2Fs
bF9jaGFpbigmZHVtbXljb25fb3V0cHV0X25oLCAwLCBOVUxMKTsKIH0KLS0gCjIuMjAuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
