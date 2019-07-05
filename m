Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 002EA61B1D
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 09:13:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10BA889BFF;
	Mon,  8 Jul 2019 07:12:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 793EC6E2E1
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2019 16:54:52 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id d17so10356500qtj.8
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jul 2019 09:54:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gVPnDnYZIHg//fCau2o8X4/K+TkzQ4pu97pN0qPOjGg=;
 b=jPEoEK7Mi6zkO8mBSuqfj8QLISI39bC5YX+n1ZN/+CDQBIGttXR7gjKKut8gFBGtj1
 KWMYs6EZ/fb8+KEKb3IKA8oxXuFUjA0oBEdDWmP/m3WJ7o1D89Ibm2R4lnuj3Igel0Hh
 dwY6PTUVrbU4W4l04UGvltreAYjEzaqgX3xDT74GzIhclmJNbODSAtxBlw8lC2oc8wl7
 6CksA5OzN/yu+Vg0qZIxvt+zx686NlONRUY4oQPCTPajNQBcSAz4tPcIc840DyWZAiKe
 POIYjodsh534NTk3+KoB558PCjV0BMBkiCty7JJ0yCxPYyzascda9z/eqcPBWFNa3PMk
 xCxg==
X-Gm-Message-State: APjAAAXulereHYJHW/pNp2xp6BK5NFQdZHZ9CXZEZ3ddja/B/fFJpUAP
 HhXoWOnK4kiAa/V/n28qSk8=
X-Google-Smtp-Source: APXvYqyL6Xp5wtUUYgejlpY+FF1T5AudwMjEl5B2aZN7563Grs7uqoz24OrXOya0O3591bdnHreMrw==
X-Received: by 2002:ac8:1a8d:: with SMTP id x13mr3595792qtj.114.1562345691667; 
 Fri, 05 Jul 2019 09:54:51 -0700 (PDT)
Received: from [192.168.2.145] (ppp79-139-233-208.pppoe.spdop.ru.
 [79.139.233.208])
 by smtp.googlemail.com with ESMTPSA id r14sm4233105qke.47.2019.07.05.09.54.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 05 Jul 2019 09:54:50 -0700 (PDT)
Subject: Re: [PATCH v5 05/12] drm/modes: Rewrite the command line parser
To: Maxime Ripard <maxime.ripard@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sean Paul <seanpaul@chromium.org>, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>
References: <cover.5190d070d1439d762d7ab273f4ae2573087fee20.1560783090.git-series.maxime.ripard@bootlin.com>
 <e32cd4009153b184103554009135c7bf7c9975d7.1560783090.git-series.maxime.ripard@bootlin.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <e1fcea71-b551-274e-4ea0-178bb0d5f71c@gmail.com>
Date: Fri, 5 Jul 2019 19:54:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <e32cd4009153b184103554009135c7bf7c9975d7.1560783090.git-series.maxime.ripard@bootlin.com>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 08 Jul 2019 07:11:53 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gVPnDnYZIHg//fCau2o8X4/K+TkzQ4pu97pN0qPOjGg=;
 b=HY56gVx7oYeo0j0mareMfs9VBJfGLP1hIK9Q60/d1GdKv4q9A1GXOvqhWDPtHVO/W2
 /RrvX+8ogGJW2cVFPm+P/kHWgENedo6lC9zreAKSr8Ebj5Okw/toxcTlYybpCAVpVggY
 Ip9S74TJKgeTQg3t3NZ6aivdmCoYpD9pf+nRdt/9ymUwMsyvPkLWNCT3j6pbiKJiCiRE
 rxBc2kr/h+OimDF6NV6XMm70Ssvt0Mc2OZGHNFKyI2VkfLy2uHq6aftTSrPpJdRHEkKV
 G/RvfewoG1Xa501uHcagNIYd6AoVUykWpLjzNiWnNYgG9vbEJet3gRUTqjXKCVTLPDyP
 qxOw==
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
Cc: eben@raspberrypi.org, dri-devel@lists.freedesktop.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTcuMDYuMjAxOSAxNzo1MSwgTWF4aW1lIFJpcGFyZCDQv9C40YjQtdGCOgo+IEZyb206IE1heGlt
ZSBSaXBhcmQgPG1heGltZS5yaXBhcmRAZnJlZS1lbGVjdHJvbnMuY29tPgo+IAo+IFJld3JpdGUg
dGhlIGNvbW1hbmQgbGluZSBwYXJzZXIgaW4gb3JkZXIgdG8gZ2V0IGF3YXkgZnJvbSB0aGUgc3Rh
dGUgbWFjaGluZQo+IHBhcnNpbmcgdGhlIHZpZGVvIG1vZGUgbGluZXMuCj4gCj4gSG9wZWZ1bGx5
LCB0aGlzIHdpbGwgYWxsb3cgdG8gZXh0ZW5kIGl0IG1vcmUgZWFzaWx5IHRvIHN1cHBvcnQgbmFt
ZWQgbW9kZXMKPiBhbmQgLyBvciBwcm9wZXJ0aWVzIHNldCBkaXJlY3RseSBvbiB0aGUgY29tbWFu
ZCBsaW5lLgo+IAo+IFJldmlld2VkLWJ5OiBOb3JhbGYgVHLDuG5uZXMgPG5vcmFsZkB0cm9ubmVz
Lm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlwYXJkQGZyZWUt
ZWxlY3Ryb25zLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9tb2Rlcy5jIHwgMzI1
ICsrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQs
IDIxMCBpbnNlcnRpb25zKCspLCAxMTUgZGVsZXRpb25zKC0pCgpIZWxsbywKCkkgaGF2ZSBhIFRl
Z3JhIGRldmljZSB0aGF0IHVzZXMgYSBzdG9jayBhbmRyb2lkIGJvb3Rsb2FkZXIgd2hpY2ggcGFz
c2VzICJ2aWRlbz10ZWdyYWZiIiBpbgp0aGUga2VybmVscyBjbWRsaW5lLiBUaGF0IHdhc24ndCBh
IHByb2JsZW0gYmVmb3JlIHRoaXMgcGF0Y2gsIGJ1dCBub3cgVGVncmEgRFJNIGRyaXZlcgpmYWls
cyB0byBwcm9iZSBiZWNhdXNlIHRoZSBtb2RlIGlzIDB4MDowIGFuZCBoZW5jZSBmcmFtZWJ1ZmZl
ciBhbGxvY2F0aW9uIGZhaWxzLiBJcyBpdCBhCmxlZ2l0IHJlZ3Jlc3Npb24gdGhhdCBzaG91bGQg
YmUgZml4ZWQgaW4gdXBzdHJlYW0/Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
