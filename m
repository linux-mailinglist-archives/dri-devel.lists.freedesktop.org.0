Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D24A537B10
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 19:30:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBCA6892C2;
	Thu,  6 Jun 2019 17:30:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1ABD892C2
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 17:30:13 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id v9so1718918pgr.13
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jun 2019 10:30:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=Er5DZ+jmgl4pACBM9mSuCYlxA1ZXYVy+Ri46ksNsKNU=;
 b=lY75YBa90Bwwkc2vojBE0rAAWHVG1m83suWqbrRoZOFu32Zi9haYHawSsVp0hJz0kv
 0Zm5xUJCVy253NL4oVYVzK/BS7hhWJUiK98K7IGk9bZdaqLUpq7XDnV2S74/RTzpZMT/
 RQN/+0e2hDeDMkleKRl8Zf5Dn6I7a908jpb5El9I9AlXvWMLM+FYVKhoYYoJ64Ot5Y7E
 /Nw40FeRnP5I46YKkvuqDG7hPFMvH6MaFltvRq2LJkx/pOXdvT9cNslQjNopq1p9yPaH
 7ggDJJ4vvwLUmRDGQKCPuwE9dVaDks/K8hY51QnHxrurEPPRRNR0zgQEB9u0lwh0FvQ+
 ljew==
X-Gm-Message-State: APjAAAUf4zfMw75IemQEY/Vwt/65P9OZE9sdEUp5yYGMEyiRt00o0pJ0
 2o1ThxziUMdGI+glbgN/IRZHyDq+K0Q=
X-Google-Smtp-Source: APXvYqxcHDkEaPOHT2K2CyUbipGrVEDze7r7eLCeuaNBURmbKlAo/gGUVa+qM337klyNBaUWwbt8aQ==
X-Received: by 2002:a17:90a:6505:: with SMTP id i5mr924412pjj.13.1559842213424; 
 Thu, 06 Jun 2019 10:30:13 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.googlemail.com with ESMTPSA id o70sm2769938pfo.33.2019.06.06.10.30.12
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 06 Jun 2019 10:30:12 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/2] drm/meson: fix G12A primary plane disabling
In-Reply-To: <20190605141253.24165-3-narmstrong@baylibre.com>
References: <20190605141253.24165-1-narmstrong@baylibre.com>
 <20190605141253.24165-3-narmstrong@baylibre.com>
Date: Thu, 06 Jun 2019 10:30:11 -0700
Message-ID: <7h1s06ei58.fsf@baylibre.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version;
 bh=Er5DZ+jmgl4pACBM9mSuCYlxA1ZXYVy+Ri46ksNsKNU=;
 b=wm/5HuCV6OCqFPMj5n7IL5mdjhSWRNBQjjf7DDWELSUHyHSEkxAJJUzCUh5K1Q/PrT
 1rU9XPLawCPwYK34YEcRmd16u3HynW0SaTlCWw1xW/8f0xJXLaJFv5Amj8aU+x3jBRGZ
 OirbFJ6smfoYmqM4vpdeGuUA2Diiozc28Ql/BUymxNlyCnF3U3NuNesy19sKjTxlBCZ9
 xYkQgCVNc212j+aq83vwctLQsFzBYDYeCb21vGVD1yCTxbTMQZP9cLHvVL8JSwKlQeP+
 HhhL48FMk2LjvcQQ5bdf6g41dqIbXtWQEnc9Q7xerefNu0gaXl87goSWT899hImcaaCN
 b4UQ==
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

TmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPiB3cml0ZXM6Cgo+IFRoZSBH
MTJBIFByaW1hcnkgcGxhbmUgd2FzIGRpc2FibGVkIGJ5IHdyaXRpbmcgaW4gdGhlIE9TRDEgY29u
ZmlndXJhdGlvbgo+IHJlZ2lzdGVycywgYnV0IHRoaXMgY2F1c2VkIHRoZSBwbGFuZSBibGVuZGVy
IHRvIHN0YWxsIGluc3RlYWQgb2YgY29udGludWluZwo+IGJsZW5kZWQgb25seSB0aGUgb3Zlcmxh
eSBwbGFuZS4KCmdyYW1tYXIgbml0OiAiLi4uaW5zdGVhZCBvZiBjb250aW51aW5nIHRvIGJsZW5k
IG9ubHkgdGhlIG92ZXJsYXkgcGxhbmUuIgoKPiBGaXggdGhpcyBieSBkaXNhYmxpbmcgdGhlIE9T
RDEgcGxhbmUgaW4gdGhlIGJsZW5kZXIgcmVnaXN0ZXJzLCBhbmQgYWxzbwo+IGVuYWJsaW5nIGl0
IGJhY2sgdXNpbmcgdGhlIHNhbWUgcmVnaXN0ZXIuCj4KPiBGaXhlczogNDkwZjUwYzEwOWQxICgi
ZHJtL21lc29uOiBBZGQgRzEyQSBzdXBwb3J0IGZvciBPU0QxIFBsYW5lIikKPiBTaWduZWQtb2Zm
LWJ5OiBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+CgpSZXZpZXdlZC1i
eTogS2V2aW4gSGlsbWFuIDxraGlsbWFuQGJheWxpYnJlLmNvbT4KCkFzIG5vdGVkIGVsc2V3aGVy
ZSwgdGhpcyBkcml2ZXIgaXMgYWxzbyBmdWxsIG9mIG1hZ2ljIGNvbnN0YW50cyB1c2VkIGluCnJl
Z2lzdGVyIHdyaXRlcyB3aGljaCBtYWtlcyByZXZpZXdpbmcgdGhpcyBraW5kIG9mIGNoYW5nZSBm
b3IKY29ycmVjdG5lc3MgdGhhdCBtdWNoIG1vcmUgZGlmZmljdWx0LCBidXQgc2luY2UgdGhhdCdz
IGFscmVhZHkgYmVlbgpwb2ludGVkIG91dCBlbHNld2hlcmUsIGFuZCBpdCdzIGFscmVhZHkgb24g
eW91ciBUT0RPIGxpc3QsIGl0IHNob3VsZCBub3QKYmxvY2sgdGhpcyBpbXBvcnRhbnQgZml4LgoK
S2V2aW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
