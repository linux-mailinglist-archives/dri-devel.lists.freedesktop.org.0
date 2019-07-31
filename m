Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AEEF7C3A5
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 15:34:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0286489A91;
	Wed, 31 Jul 2019 13:34:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB73F89A91
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 13:34:31 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id a15so60838971wmj.5
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 06:34:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=i4RNuLmH2IdqRoXZtbWJ/OiiSdgrVFINGLD7VLcf79I=;
 b=IR+26W3ez0hSvPAVlJHk3AZJ+S1HgY8L8URSzTxpMcjQj2IOkmxzm/fzxcXUQ+Wh+5
 US0YEfR9aaxCtKAyMsu04rEXfIkqd+dUHkztAHnKj4s4NRCKQ8MkZ0PtFKdFYFrhHHq6
 fxZtaURzs/Wv7bFAJunrhsdeI3za1OX23Fb4/F8+dgMZT+7VjQ5fnH7/3Cc3hFWblkbr
 A3qVVExfHF+VgDuqviiCOjg5/LRMSoMXPC1AnJ/WPePL0FRNbaz3Vw1dIcE6Vl31DKpl
 Qmu5iUJ00JVlfRW7VgZvi0zMbIikQieUk25YmbTvkejZaF+1gO+jMdooyOn5jGiO3Sf7
 Bwcw==
X-Gm-Message-State: APjAAAUK00AVDGetOIUn5u9NC9Ld+5pPl6LOg/Vi5e+p3e6SUabUEbQI
 iS0YFItoRwooIO0IBTdeEaM=
X-Google-Smtp-Source: APXvYqxGpdFwuhY+fdgM2CZcJCMfAQRfJPr9pIwRtQatt/DbHMUfVJuDjo/5V3oBC21OKIW2jAL+Qw==
X-Received: by 2002:a1c:a019:: with SMTP id j25mr111460938wme.95.1564580070080; 
 Wed, 31 Jul 2019 06:34:30 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id a81sm71625173wmh.3.2019.07.31.06.34.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 31 Jul 2019 06:34:29 -0700 (PDT)
Subject: Re: [PATCH] dma-buf: add more reservation object locking wrappers
To: Chris Wilson <chris@chris-wilson.co.uk>, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
 sumit.semwal@linaro.org
References: <20190731113853.51779-1-christian.koenig@amd.com>
 <156457641010.6373.7515721920178088211@skylake-alporthouse-com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <6421ea80-2bdd-7f63-1cba-9c57157f3946@gmail.com>
Date: Wed, 31 Jul 2019 15:34:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <156457641010.6373.7515721920178088211@skylake-alporthouse-com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=i4RNuLmH2IdqRoXZtbWJ/OiiSdgrVFINGLD7VLcf79I=;
 b=idSKC1LrcP6KSggywxxWZE2tldyk0Hu9EdVDizSFI9VGQltD1RKuXItmz6uOrlPyv/
 vg+GQ6GGaY/QBbDNe855roiLaDXVXixWUNXjglnNP0m6+NTNe5lEy2HsLM8bfwIWhZw4
 8t8bOC4SUzFMYc3stXhibDzv7038m3AY2y35q69hY5hWmbOjmX3E4lTiDqsCpluefPhQ
 qecU7CPjoG9pj7pxcsU51GcvuFYZ9/ECC+8Avp5nIJ8ttk0O9CNPPT7z0GW19Dd0zI+j
 wyTEg40CJq/FIXXT8HugVY6JvS2/l6cLbe8v2z+rdmhWId77w1ywzb+9NqKUPJN2llOH
 2D4A==
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
Reply-To: christian.koenig@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMzEuMDcuMTkgdW0gMTQ6MzMgc2NocmllYiBDaHJpcyBXaWxzb246Cj4gUXVvdGluZyBDaHJp
c3RpYW4gS8O2bmlnICgyMDE5LTA3LTMxIDEyOjM4OjUzKQo+PiBDb21wbGV0ZSB0aGUgYWJzdHJh
Y3Rpb24gb2YgdGhlIHd3X211dGV4IGluc2lkZSB0aGUgcmVzZXJ2YXRpb24gb2JqZWN0Lgo+Pgo+
PiBUaGlzIGFsbG93cyB1cyB0byBhZGQgbW9yZSBoYW5kbGluZyBhbmQgZGVidWdnaW5nIHRvIHRo
ZSByZXNlcnZhdGlvbgo+PiBvYmplY3QgaW4gdGhlIGZ1dHVyZS4KPj4KPj4gU2lnbmVkLW9mZi1i
eTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+IExvb2tzIGVu
dGlyZWx5IG1lY2hhbmljYWwsCj4gUmV2aWV3ZWQtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hy
aXMtd2lsc29uLmNvLnVrPgo+Cj4gUXVpZXRseSBvcGluZXMgZm9yIHMvcmVzZXJ2YXRpb25fb2Jq
ZWN0L2RtYV9yZXNlcnZhdGlvbi8KCkkgd2FzIHRoaW5raW5nIGFib3V0IHRoYXQgYXMgd2VsbCBi
ZWNhdXNlICJyZXNlcnZhdGlvbl9vYmplY3QiIGlzIGp1c3QgYSAKcmF0aGVyIGxvbmcgbmFtZSBh
bmQgbm90IHZlcnkgZGVzY3JpcHRpdmUuCgpCdXQgSSdtIG5vdCBzdXJlIGlmIGRtYV9yZXNlcnZh
dGlvbiBmaXRzIGVpdGhlci4gSG93IGFib3V0IHNvbWV0aGluZyAKbGlrZSBkbWFfY250cmw/CgpD
aHJpc3RpYW4uCgo+IC1DaHJpcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
