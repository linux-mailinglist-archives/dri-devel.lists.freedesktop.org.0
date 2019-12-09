Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B00B1178F5
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 23:03:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58DE46E558;
	Mon,  9 Dec 2019 22:03:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6553F6E558
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 22:03:44 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id z124so7775266pgb.13
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Dec 2019 14:03:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=Jnouk4yF+4hDvyyaPMkAqTb9fke0cQ8rrhVPAJu3okw=;
 b=YUkaYb46HsnSDkEWoxVDt7fd/Xf2eG3ib7JI9xS+456OUkXnbYVFvHLpMLwBhXnU9Q
 pj9UjgtVnvXyrBCBGKj7yBV+SuDrW9Q8luwoeA14eYE5SXJJzd4Eg8wpKpmiTErvwIyg
 eEykkJihLqJKU4e4NesbqULI55XfnmCNDibatAkSsbPLj2o7WZEsfIUgP+XvfNb2n7gm
 thDWPzwrCaCZ8eKr+CLB626Bq+sqRQkzC2S/OauNDr4IPItpNKXr85tI2q1pW/sWAKwy
 QHgY6tt2eKPc5E5fjtje3UivwXCbLBBI0veRG0aRqfZHqZlZKIZpU61vO045pYbAaH7a
 Tbdw==
X-Gm-Message-State: APjAAAVHeHyKZShNFdCQylFV/VnE3ooiDs2ElanZ8M8rYgs2nggj6L+t
 IasJLf4vnYrXp4mL6xETMp+nAQ==
X-Google-Smtp-Source: APXvYqznrAGHzf9g/H1sltB3YxQOArFm38FcptmNQg5nSRIf4XMlA5spk262ITNHuP3ffDzs8xx+Cg==
X-Received: by 2002:a05:6a00:9c:: with SMTP id
 c28mr29316712pfj.234.1575929023965; 
 Mon, 09 Dec 2019 14:03:43 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id l186sm515055pge.31.2019.12.09.14.03.42
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 09 Dec 2019 14:03:43 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 0/3] drm/meson: implement RDMA for AFBC reset on vsync
In-Reply-To: <20191017094826.21552-1-narmstrong@baylibre.com>
References: <20191017094826.21552-1-narmstrong@baylibre.com>
Date: Mon, 09 Dec 2019 14:03:42 -0800
Message-ID: <7hpngxrwap.fsf@baylibre.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version;
 bh=Jnouk4yF+4hDvyyaPMkAqTb9fke0cQ8rrhVPAJu3okw=;
 b=GlVceXA+0lC6uBPMxBHhwzUEVjOgob1HMGEBkW1gJjw56t4kv3Fz3LJxzxFL53GcCa
 RkzmEwY+SU/G2b9eFzkdrgUtuT0oRkyuL5EnRnLUHzFUZI4AOjvbksVw/I1Pt/FjaYS2
 cPKnQZIulCAptVGoqm9Z3HgFSjhhD27yJILu6vTvSmbbIhRSHYSBe1gndsaULX8hZwKq
 RFa5Woj3cwn0MuO8JLgTkhrZytANWsosQ++XHOHxG736rzlWuSuNqiTmfBgHw7quSFvV
 sYprUpf24U+qTnfQ4f8gk9QrSFt1K65H2Y8+t/qtIFSPVKHPaqy+r1Ju5gjfR5BqUQf/
 B1Mw==
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
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPiB3cml0ZXM6Cgo+IFRoZSBW
UFUgZW1iZWRzIGEgIlJlZ2lzdGVyIERNQSIgdGhhdCBjYW4gd3JpdGUgYSBzZXF1ZW5jZSBvZiBy
ZWdpc3RlcnMKPiBvbiB0aGUgVlBVIEFIQiBidXMsIGVpdGhlciBtYW51YWxseSBvciB0cmlnZ2Vy
ZWQgYnkgYW4gaW50ZXJuYWwgSVJRCj4gZXZlbnQgbGlrZSBWU1lOQyBvciBhIGxpbmUgaW5wdXQg
Y291bnRlci4KPgo+IFRoZSBpbml0aWFsIGltcGxlbWVudGF0aW9uIGhhbmRsZXMgYSBzaW5nbGUg
Y2hhbm5lbCAob3ZlciA4KSwgdHJpZ2dlcmVkCj4gYnkgdGhlIFZTWU5DIGlycSBhbmQgZG9lcyBu
b3QgaGFuZGxlIHRoZSBSRE1BIGlycS4KPgo+IFRoZSBSRE1BIHdpbGwgYmUgdXNlZnVsbCB0byBy
ZXNldCBhbmQgcHJvZ3JhbSB0aGUgQUZCQyBkZWNvZGVyIHVuaXQKPiBvbiBlYWNoIHZzeW5jIHdp
dGhvdXQgaW52b2x2aW5nIHRoZSBpbnRlcnJ1cHQgaGFuZGxlciB0aGF0IGNhbgo+IGJlIG1hc2tl
ZCBmb3IgYSBsb25nIHBlcmlvZCBvZiB0aW1lLCBwcm9kdWNpbmcgZGlzcGxheSBnbGl0Y2hlcy4K
Pgo+IEZvciB0aGlzIHdlIHVzZSB0aGUgbWVzb25fcmRtYV93cml0ZWxfc3luYygpIHdoaWNoIGFk
ZHMgdGhlIHJlZ2lzdGVyCj4gd3JpdGUgdHVwbGUgKFZQVSByZWdpc3RlciBvZmZzZXQgYW5kIHJl
Z2lzdGVyIHZhbHVlKSB0byB0aGUgUkRNQSBidWZmZXIKPiBhbmQgd3JpdGUgdGhlIHZhbHVlIHRv
IHRoZSBIVy4KPgo+IFdoZW4gZW5hYmxlZCwgdGhlIFJETUEgaXMgZW5hYmxlZCB0byByZXdyaXR0
ZSB0aGUgc2FtZSBzZXF1ZW5jZSBhdCB0aGUKPiBuZXh0IFZTWU5DIGV2ZW50LCB1bnRpbCBhIG5l
dyBidWZmZXIgaXMgY29tbWl0dGVkIHRvIHRoZSBPU0QgcGxhbmUuCj4KPiBUaGUgdGhlIEFtbG9n
aWMgRzEyQSBpcyBzd2l0Y2hlZCB0byBSRE1BLCB0aGUgQW1sb2dpYyBHWE0gRGVjb2Rlcgo+IGRv
ZXNuJ3QgbmVlZCBhIHJlc2V0L3JlcHJvZ3JhbSBhdCBlYWNoIHZzeW5jLgo+Cj4gQ2hhbmdlcyBz
aW5jZSB2MSBhdCBbMV06Cj4gLSBGaXhlZCBhIHJlZ3Jlc3Npb24gd2hlbiBBRkJDIHdhcyBub3Qg
dXNlZCwgYWRkaW5nIGEgcmVzZXQoKSBjYWxsIGZvciB0aGUgYWZiYyBtb2R1bGUKPiAtIEFkZGVk
IGEgZGVmaW5lIGZvciB0aGUgUkRNQSBkZXNjcmlwdG9yIHNpemUKPiAtIEZpeGVkIG92ZXJmbG93
IGRldGVjdGlvbgoKUmV2aWV3ZWQtYnk6IEtldmluIEhpbG1hbiA8a2hpbG1hbkBiYXlsaWJyZS5j
b20+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
