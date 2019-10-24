Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B22E455B
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2019 10:12:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8B006E8FE;
	Fri, 25 Oct 2019 08:12:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E7AE89834
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 21:10:53 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id f5so202445ljg.8
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 14:10:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=16Ta175oqbnUMTD4O3/CWW9VGngBsZ+cneUn7RAxpRQ=;
 b=F5Lu6EnyCD410aLTEc+vF4ldSFUhN593BH91WCG0IB++ayE+0ETqzoe/A1Y37wx+7w
 OZMlkdQUbFkr3NYo4ur90RD9Aj1U24xz5EasItS6Wh2vYydjyd9RymyH10j9fwf8QNOl
 IVWa/Sn975zbXj4nFHp+jrd5+fbDD0ayQwUDy4bY1bV0qCQe6SXfpLFDC5MxK4kwNuB/
 +LhWw4g46jfuOptAk0s/tOjjl1pLyDOMFQXIvd4544wtZ4drqyyKNsYz07l+UO8muxze
 wfW8rKe7D4BCmtZiDIGjK8kcBZAzvV2Dbcsg3Lk+OqZC5ecSBJxmM5Wpnswy4c+S6N6L
 AzzQ==
X-Gm-Message-State: APjAAAUI9cClefq830gBFdrclOJJldEGYM/0dsnkzDbN2Qk185iQMbNZ
 jl4tucaYePLWyyd7A0BW1Vc=
X-Google-Smtp-Source: APXvYqwoatQlYxF+uFontTC3REB5T52VXPsFP21rjlbIkZ1UY8vmhkmDG3n0zjAIqRhNFZk4vpBNUQ==
X-Received: by 2002:a2e:2bc7:: with SMTP id r68mr4132733ljr.27.1571951451641; 
 Thu, 24 Oct 2019 14:10:51 -0700 (PDT)
Received: from [192.168.2.145] (94-29-10-250.dynamic.spd-mgts.ru.
 [94.29.10.250])
 by smtp.googlemail.com with ESMTPSA id g12sm1123334ljj.73.2019.10.24.14.10.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Oct 2019 14:10:50 -0700 (PDT)
Subject: Re: [PATCH v2] drm/tegra: Do not use ->load() and ->unload() callbacks
To: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Thierry Reding <thierry.reding@gmail.com>
References: <20191024173137.290420-1-thierry.reding@gmail.com>
 <20191024181539.GA31268@qmqm.qmqm.pl>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <553f12c4-b1f4-b48c-45e4-c4280936d1e4@gmail.com>
Date: Fri, 25 Oct 2019 00:10:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191024181539.GA31268@qmqm.qmqm.pl>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 25 Oct 2019 08:11:50 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=16Ta175oqbnUMTD4O3/CWW9VGngBsZ+cneUn7RAxpRQ=;
 b=SIrXt0kXvhlShAHoeckeqV0exC0jKVcan9jUbkvgxim87CjFer1UV0sYBKTag9rckf
 jnbnhLj+g8SzSzwU5ZWDV91cpSjH8ZNqcf0tlMJv7k5mhD3agINvrvW3SktOnBFa+aC8
 iTgAOmkNjsbtj+ptJ6e5oDYGxpSpkX4oE1IbjRQHbY0MDdcOkA+7dlKHfdzeCxHjp48K
 87KTCFoMox9a4yL+VyBON2x33CAWrRdMhURn9J8lj1Cl7BQbEGZ1praany4v0J2hVEe4
 NRzVQPwdcZT+RPHwr1hnBrNQAwCMkVryTMDBSXZu6kiqZXnOOwbHGqh9fJI0GSeUB6b8
 s2tw==
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjQuMTAuMjAxOSAyMToxNSwgTWljaGHFgiBNaXJvc8WCYXcg0L/QuNGI0LXRgjoKPiBPbiBUaHUs
IE9jdCAyNCwgMjAxOSBhdCAwNzozMTozN1BNICswMjAwLCBUaGllcnJ5IFJlZGluZyB3cm90ZToK
Pj4gRnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KPj4KPj4gVGhlIC0+
bG9hZCgpIGFuZCAtPnVubG9hZCgpIGRyaXZlcnMgYXJlIG1pZGxheWVycyBhbmQgc2hvdWxkIGJl
IGF2b2lkZWQKPj4gaW4gbW9kZXJuIGRyaXZlcnMuIEZpeCB0aGlzIGJ5IG1vdmluZyB0aGUgY29k
ZSBpbnRvIHRoZSBkcml2ZXIgLT5wcm9iZSgpCj4+IGFuZCAtPnJlbW92ZSgpIGltcGxlbWVudGF0
aW9ucywgcmVzcGVjdGl2ZWx5Lgo+Pgo+PiB2Mjoga2ljayBvdXQgY29uZmxpY3RpbmcgZnJhbWVi
dWZmZXJzIGJlZm9yZSBpbml0aWFsaXppbmcgZmJkZXYKPj4KPj4gU2lnbmVkLW9mZi1ieTogVGhp
ZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KPj4gLS0tCj4+IE1pY2hhxYIsIERtaXRy
eSwKPj4KPj4gZG8geW91IGd1eXMgaGF2ZSBhIHdheSBvZiB0ZXN0aW5nIHRoYXQgdGhlIHJlbW92
YWwgb2YgdGhlIGNvbmZsaWN0aW5nCj4+IGZyYW1lYnVmZmVyIGFjdHVhbGx5IHdvcmtzPwo+IFsu
Li5dCj4gCj4gSSBtaWdodCBiZSBhYmxlIHRvIGNoZWNrIGR1cmluZyB0aGUgd2Vla2VuZC4gSXMg
dGhpcyBwYXRjaCBhbG9uZSBlbm91Z2gKPiBmb3IgdjUuMz8KCkkgZG9uJ3QgdGhpbmsgaXQgd2ls
bCBhcHBseSBjbGVhbmx5IG9uIHRvcCBvZiA1LjMsIGJ1dCBzaG91bGQgd29yayB3aXRoCmxpbnV4
LW5leHQgb3IgYnkgY2hlcnJ5LXBpY2tpbmcgOWQ1YTU0OTg3MjY1LgoKUmVnYXJkaW5nIHRoZSB0
ZXN0aW5nLCBJIG5ldmVyIHVzZWQgc2ltcGxlLWZiIG9uIFRlZ3JhIGJlZm9yZSBhbmQgaXQncwpu
b3Qgd29ya2luZyBmb3IgbWUgbm93LiBIb3BlZnVsbHkgaXQgd2lsbCB3b3JrIGZvciB5b3UsIE1p
Y2hhxYIuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
