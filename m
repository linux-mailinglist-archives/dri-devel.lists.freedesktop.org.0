Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE4EE97D5
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2019 09:14:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03F456ECB1;
	Wed, 30 Oct 2019 08:14:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE2966E32E
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2019 13:25:39 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id w8so10748744lji.13
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2019 06:25:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AyfFRUgpmb5UhgMMjiLBLZD3oIeC+XtwnmlqyRHc/Y8=;
 b=ji1IQM978pn+wpmONxPf+jf7D/EqdkN4TQb9fPLeOzVmb6pjagHUH5xRDSmChmq/+r
 heBUcgbCit6i5ivhhvVukaWHvQoxM2rEMyIBuJbbu+xz1p5cezEFSi8JabHcnK1z1I/1
 /4iMFy3yDdXid5EFYHhbGhFOADg08QUdy65blT8Awna6sltaYJ261rk3A1nLmpswhAao
 hXCM+VkFRMfI6vtbu/GNVnL784u8Ze7fO5R1cxJGLNqAau2rqG2BxUkFZlqIkgQBW7Qm
 LwlZE9xA31FxLRWZpyjt3UMoNxvfkmUNjuwke4R/XJaS1wbB1RPkIckQeztCd5fiTc56
 xe2Q==
X-Gm-Message-State: APjAAAU9GfKXftMAeiOmAni/IhTjniCCyARKhcgcsmUH9TyVBBd4iMcW
 HyDFcGxrLccnSwKZbq6mkl4=
X-Google-Smtp-Source: APXvYqwpQGy2/Kr5nCilq6slM0IZVduc2g7YFgBUjtBEJSZb+IPOIdn2e1U2KwiDhwDFIY0LcHLyYQ==
X-Received: by 2002:a05:651c:10e:: with SMTP id
 a14mr2659527ljb.177.1572355538010; 
 Tue, 29 Oct 2019 06:25:38 -0700 (PDT)
Received: from [192.168.2.145] (94-29-10-250.dynamic.spd-mgts.ru.
 [94.29.10.250])
 by smtp.googlemail.com with ESMTPSA id v203sm8442282lfa.25.2019.10.29.06.25.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Oct 2019 06:25:37 -0700 (PDT)
Subject: Re: [PATCH v3] drm/tegra: Do not use ->load() and ->unload() callbacks
To: Thierry Reding <thierry.reding@gmail.com>
References: <20191028121610.3889207-1-thierry.reding@gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <28aaf3c5-2e23-c947-9dd9-31571b5d5f1b@gmail.com>
Date: Tue, 29 Oct 2019 16:25:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191028121610.3889207-1-thierry.reding@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 30 Oct 2019 08:14:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AyfFRUgpmb5UhgMMjiLBLZD3oIeC+XtwnmlqyRHc/Y8=;
 b=OgcQTSAcq4bN15zVhRZChpXBcD6wEgatgAcV99KqX5EDhZSiD/n0oLwnR1uXmsd4r6
 iQ85/aohIAluwG/AZg0SS6tO/TmTq6A8q2OaR2gh5zbPZMSUcDlxwwaaSt6fFKYJfQnV
 CBdE+ZGUgYayg3bdQSzP3qQf3VUfI0f1eRUc3TLRBFrqN7IDG1D6N+QoNKReY0bVXY1V
 IjpGgOHuufw8ZQ3NSBj1Z+1ilkfmdaQs+EpBOdKR30HIn+qd9IBS45WQEy5vp0bd+5Tx
 pKJw5UDRpSuYfaQmZE6gNSz9/Iw4pxDmGjYyBKRG3lOzqCJCqrgmtlTyfQOJqWRsrS+3
 famA==
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjguMTAuMjAxOSAxNToxNiwgVGhpZXJyeSBSZWRpbmcg0L/QuNGI0LXRgjoKPiBGcm9tOiBUaGll
cnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgo+IAo+IFRoZSAtPmxvYWQoKSBhbmQgLT51
bmxvYWQoKSBkcml2ZXJzIGFyZSBtaWRsYXllcnMgYW5kIHNob3VsZCBiZSBhdm9pZGVkCj4gaW4g
bW9kZXJuIGRyaXZlcnMuIEZpeCB0aGlzIGJ5IG1vdmluZyB0aGUgY29kZSBpbnRvIHRoZSBkcml2
ZXIgLT5wcm9iZSgpCj4gYW5kIC0+cmVtb3ZlKCkgaW1wbGVtZW50YXRpb25zLCByZXNwZWN0aXZl
bHkuCj4gCj4gdjI6IGtpY2sgb3V0IGNvbmZsaWN0aW5nIGZyYW1lYnVmZmVycyBiZWZvcmUgaW5p
dGlhbGl6aW5nIGZiZGV2Cj4gdjM6IHJlYmFzZSBvbnRvIGRybS90ZWdyYS9mb3ItbmV4dAo+IAo+
IFNpZ25lZC1vZmYtYnk6IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+Cj4gLS0t
Cj4gIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9kcm0uYyB8IDMyMSArKysrKysrKysrKysrKysrKy0t
LS0tLS0tLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDE1NCBpbnNlcnRpb25zKCspLCAx
NjcgZGVsZXRpb25zKC0pCgpIZWxsbyBUaGllcnJ5LAoKSSB0cmllZCBhIGJpdCBoYXJkZXIgYW5k
IG1hbmFnZWQgdG8gZ2V0IHNpbXBsZS1mcmFtZWJ1ZmZlciB3b3JraW5nLCB0aGUKYm9vdGxvYWRl
cidzIEZCIGhhbmRvdmVyIHdvcmtzIGZpbmUgZm9yIG1lIGJlZm9yZSBhbmQgYWZ0ZXIgdGhpcyBw
YXRjaC4KVGhhbmtzIQoKVGVzdGVkLWJ5OiBEbWl0cnkgT3NpcGVua28gPGRpZ2V0eEBnbWFpbC5j
b20+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
