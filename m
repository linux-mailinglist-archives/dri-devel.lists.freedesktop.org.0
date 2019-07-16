Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B3C6B72F
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2019 09:08:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B98916E262;
	Wed, 17 Jul 2019 07:08:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37E1389DA8
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 14:02:04 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id s19so13806864lfb.9
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 07:02:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gjAomZEn9d4ngvQHHNNsnYK3PRO2HICWZX2h1mQmSBo=;
 b=Vi4yMrBIObgKQjEqtAmN8/cbbSDX/3AwHdRcLzyWskN//vY4rwProqCP70RvZow+H0
 hETgsUvQgKbdKlM9RasytuFW0aX79uSQyUZkNrsVFLLI3zu5Oqx7qK5zHYU7Ij3xEsR0
 egALGkZ07OBvmwmDIFiuny+0EpHj1rNwz/fm8sU7YeMt+MWgJcBkLgMt1RubnufJ4jsE
 FNXRiEXYydBr6iISMTII9YYDQ8gOVaAW32spGtlKDUDQro2qlyfil185FFhXkCBqbMfa
 9mJb8gaSvtYnw+xMci+jYeRv5HOUUwm+nrBsg7D79doCW8bV4zD20qIgyjrrDcDLLR81
 vfuA==
X-Gm-Message-State: APjAAAWjruYUQF43twb5ZuCy1Nh6hKY12+2hEUnGMAuqQzz5lUMTZlQF
 Me4AgkEGzWbiYjCa7VfNe5g=
X-Google-Smtp-Source: APXvYqz0Xi2nOjffBQJf9WV9lxsDud9i0qdM0Z5ptomkZhqGR/PaxKW9VEyX0ne4qcVHGShXyIzhyA==
X-Received: by 2002:a19:5d53:: with SMTP id p19mr12358331lfj.109.1563285722736; 
 Tue, 16 Jul 2019 07:02:02 -0700 (PDT)
Received: from [192.168.2.145] (ppp79-139-233-208.pppoe.spdop.ru.
 [79.139.233.208])
 by smtp.googlemail.com with ESMTPSA id 199sm3774430ljf.44.2019.07.16.07.02.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 16 Jul 2019 07:02:02 -0700 (PDT)
Subject: Re: [PATCH v1] drm/modes: Don't apply cmdline's rotation if it wasn't
 specified
To: Maxime Ripard <maxime.ripard@bootlin.com>
References: <20190711021313.29445-1-digetx@gmail.com>
 <20190712195429.dlz5ofwoafciedcq@flea>
 <11723cfd-12d2-5810-70df-0e053352d648@gmail.com>
 <20190716084225.6wf5lsdzukyb6cz5@flea>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <8e1bf9f3-d16e-537f-36f1-047d16faf5eb@gmail.com>
Date: Tue, 16 Jul 2019 17:02:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190716084225.6wf5lsdzukyb6cz5@flea>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 17 Jul 2019 07:08:01 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gjAomZEn9d4ngvQHHNNsnYK3PRO2HICWZX2h1mQmSBo=;
 b=QZlvU3qGt/oYhHq/Pi0rqOE/Mz2976fylNe9a8QfRughACHrjbVQWH6p4ZT/JgOCOw
 jAU0nRAE4PqUOxfhRSXw53b5i3lPq/ffqfzBIYbKBE2dRb2bH/4ND4h4TmSIeKerBbhk
 tqgF5vqLC81Ll0MnTDGU95Aow1RvTKWplOr4PcII+Vxv1LtEWVMHbP6wMu+5A2VQyMIw
 LxLF57oJ1nw3nKPnKPeSFIsvuLgEbnabnGdgmqa0Opo55G9qeg3OvXtfFlxTFEb6kOUa
 djGCQ3G1c/FE5362ZJ6OTT0sYnZA234H1uHlFndm/d3cJJfvSaZJjeqgglieteZTST1o
 4Afw==
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTYuMDcuMjAxOSAxMTo0MiwgTWF4aW1lIFJpcGFyZCDQv9C40YjQtdGCOgo+IE9uIFNhdCwgSnVs
IDEzLCAyMDE5IGF0IDA5OjU3OjMyUE0gKzAzMDAsIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPj4g
MTIuMDcuMjAxOSAyMjo1NCwgTWF4aW1lIFJpcGFyZCDQv9C40YjQtdGCOgo+Pj4gT24gVGh1LCBK
dWwgMTEsIDIwMTkgYXQgMDU6MTM6MTNBTSArMDMwMCwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+
Pj4+IFRoZSByb3RhdGlvbiBtb2RlIGZyb20gY21kbGluZSBzaG91bGRuJ3QgYmUgdGFrZW4gaW50
byBhY2NvdW50IGlmIGl0Cj4+Pj4gd2Fzbid0IHNwZWNpZmllZCBpbiB0aGUgY21kbGluZS4gVGhp
cyBmaXhlcyBpZ25vcmVkIGRlZmF1bHQgZGlzcGxheQo+Pj4+IG9yaWVudGF0aW9uIHdoZW4gZGlz
cGxheSBtb2RlIGlzIGdpdmVuIHVzaW5nIGNtZGxpbmUgd2l0aG91dCB0aGUKPj4+PiByb3RhdGlv
biBiZWluZyBzcGVjaWZpZWQuCj4+Pj4KPj4+PiBGaXhlczogMWJmNGUwOTIyN2MzICgiZHJtL21v
ZGVzOiBBbGxvdyB0byBzcGVjaWZ5IHJvdGF0aW9uIGFuZCByZWZsZWN0aW9uIG9uIHRoZSBjb21t
YW5kbGluZSIpCj4+Pj4gU2lnbmVkLW9mZi1ieTogRG1pdHJ5IE9zaXBlbmtvIDxkaWdldHhAZ21h
aWwuY29tPgo+Pj4KPj4+IEFja2VkLWJ5OiBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlwYXJkQGJv
b3RsaW4uY29tPgo+Pj4KPj4+IFRoYW5rcyEKPj4+IE1heGltZQo+Pgo+PiBUaGFuayB5b3UuIFBs
ZWFzZSBub3RlIHRoYXQgSSdtIG5vdCBhIERSTSBtYWludGFpbmVyLCBoZW5jZSBlaXRoZXIgeW91
Cj4+IHNob3VsZCBwaWNrIHVwIGFuZCBhcHBseSB0aGUgcGF0Y2ggYnkgeW91cnNlbGYgb3Igc29t
ZWJvZHkgZWxzZSB3aG8gaGFzCj4+IHRoZSBjb21taXQgcmlnaHRzIHdpbGwgaGF2ZSBkbyB0aGF0
LiBJIGd1ZXNzIFRoaWVycnkgY291bGQgYWxzbyBwaWNrIHVwCj4+IHRoZSBwYXRjaCBpbnRvIHRo
ZSBUZWdyYSdzIHRyZWUsIGJ1dCB0aGlzIHBhdGNoIGlzIG1vcmUgRFJNLWdlbmVyaWMuCj4gCj4g
UmlnaHQsIEkndmUgYXBwbGllZCBpdCBub3cKClRoYW5rIHlvdSB2ZXJ5IG11Y2ghCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
