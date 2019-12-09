Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED3811790A
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 23:07:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B70389F6E;
	Mon,  9 Dec 2019 22:07:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F05C789F6E
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 22:07:52 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id bd4so6364407plb.8
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Dec 2019 14:07:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=XV8tPDcRTX7RtlSDootkVo/0R7BkBqzFzuFusm8kdK8=;
 b=XZNnDH7Qf7NC8UQw2OGiIDQ8pnVQDO2k52udzw1C/IZCdIe1nHP4ehpRMRz4Ip7a1H
 BQrcDXwmdyKAFWkrRgOE4tNS6Hpb7it8LWRp7iRcFHedQCiJ42AJsn0JNluIhrskTJkU
 DCdR2/SpDdE071FVlxokwjceH7njJhGGPPJSTqX9VmS1i4BdmikPyhJF1Wf6KwKJKJAq
 J4pcvGvQtmMq2KWYfpEcAMHq5YDUxupRWtLLFVpmj/Y61aWetP1jmOIBeYUP1oWCYF9o
 fogpBCQP1cJ8T6Q8HqLrS+UMo816CSP4Q6KFzdNdLkxBc1mcE5CkAhmUY1pVxo7kyy9V
 89IQ==
X-Gm-Message-State: APjAAAUp3kGcfReL1mMYLayjNG15JPn2dGT9Su5m45+ZwyqSdZvHmcGm
 FLMPkXkTuXGO66J6/ycRb7mg6g==
X-Google-Smtp-Source: APXvYqzyU6Xr2TUx9phu+0FjC0f8dtT+zfBB23R48rlsA4j6FU2F18WTjQ2d+qhgny05GK+RGN86MQ==
X-Received: by 2002:a17:902:bcc8:: with SMTP id
 o8mr31506662pls.81.1575929272543; 
 Mon, 09 Dec 2019 14:07:52 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id a10sm456847pfc.35.2019.12.09.14.07.51
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 09 Dec 2019 14:07:51 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 8/9] drm/meson: hold 32 lines after vsync to give time
 for AFBC start
In-Reply-To: <20191021091509.3864-9-narmstrong@baylibre.com>
References: <20191021091509.3864-1-narmstrong@baylibre.com>
 <20191021091509.3864-9-narmstrong@baylibre.com>
Date: Mon, 09 Dec 2019 14:07:51 -0800
Message-ID: <7hmuc1rw3s.fsf@baylibre.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version;
 bh=XV8tPDcRTX7RtlSDootkVo/0R7BkBqzFzuFusm8kdK8=;
 b=mCUG2mkefXUTSWgvB3xbkzIgqLcBXpg6xtwMaVhJcJn3hsuIc/8+Aptv75kjetgmYE
 sPhCvJmw3tdGhyPHcHphJ7WIGYzMB7HQtXa14FTFA4law3xUy2s6fHqDuQmuTGwAQjd/
 kYqm38zCX6wKpg0cAqIfQ1xvtT2jv/81RdI13YWhFixxkX+4WhTKkItSY/POk1qgKoJD
 YvEaxEMQJjFi0RyiKcGb+g/CUDY5dDAqWOIHMUtZS2uOqtxnKt6XwNlPDgZ6URWC4oWA
 fl0cuWe+Tk9i7biEczXXxbcRdo3WxA+mYfuxj6CUInFjbgFrHPp44atsS1kh3GEmTK4l
 x+Cw==
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
Cc: linux-amlogic@lists.infradead.org, ayan.halder@arm.com,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPiB3cml0ZXM6Cgo+IFdoZW4g
dXNpbmcgYW4gQUZCQyBlbmNvZGVkIGZyYW1lLCB0aGUgQUZCQyBEZWNvZGVyIG11c3QgYmUgcmVz
ZXR0ZWQsCgptaW5vciBncmFtbWFyIG5pdDogcy9yZXNldHRlZC9yZXNldC8KCj4gY29uZmlndXJl
ZCBhbmQgZW5hYmxlZCBhdCBlYWNoIHZzeW5jIElSUS4KPgo+IFRvIGxlYXZlIHRpbWUgZm9yIHRo
YXQsIHVzZSB0aGUgbWF4aW11bSBsaW5lcyBob2xkIHRpbWUgdG8gZ2l2ZSB0aW1lCj4gZm9yIEFG
QkMgc2V0dXAgYW5kIGF2b2lkIHZpc3VhbCBnbGl0Y2hlcy4KPgo+IFNpZ25lZC1vZmYtYnk6IE5l
aWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT4KCm90aGVyd2lzZS4uLgoKUmV2
aWV3ZWQtYnk6IEtldmluIEhpbG1hbiA8a2hpbG1hbkBiYXlsaWJyZS5jb20+Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
