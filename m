Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BC834839C
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 22:27:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F0BA6EA91;
	Wed, 24 Mar 2021 21:27:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC74F6EA91
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 21:27:44 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id j3so60229edp.11
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 14:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qg+uRN1UVz59bXG8ixTxLJaA4rnDyKRg9P1HWdnjvz8=;
 b=imlEBMenzGIyx7jNh1TSp0GkwYJn3xsLEdndnorUwCqqRGh1tYECPHFLjjETSoZyuv
 s96amsaGRhRnwtS2FAyBn0CCiLkOmGJPHTqkW2S1/MhhXfVUa1m4oWnzdtypFMBSnVx9
 DAVVDh7KdgasdUXwd6zMs+zngrQXyGJaVsvi4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qg+uRN1UVz59bXG8ixTxLJaA4rnDyKRg9P1HWdnjvz8=;
 b=aKs7lTi3A4sW3Neo2dozOsxWWXPW/9pdufs/jOuw0XhN+08n/FJ00g67FORcU6SpxC
 6FZ6dRqO8uWogCxpD/UFtAJxYA9kpKBh6R/GBJmVIbuo0T5ru6OUoGK6ZfzMWlwdHZa3
 tjWJilBcbKDX88G6ijAQ5TcZVFXzQuMhfoPqno8A68eHL8p61nzW4/jF3mzfbnshWdKm
 5XUOYNoEc9uyu8ccIIPXnKa9p0k/0JM/DZceNRQxCmNuaBQjEGfJrW/60um1oZrjxg6S
 e2z5UoR1f1BpKe7/hz0lmjVSIirkTqwAY6xLd3xhorWwIMp6DXn6ZIfjlUX3HVQvm9m8
 i/fQ==
X-Gm-Message-State: AOAM530bYOvGDdypJq20c5keCVs4QPAKwawbMlCSc9agEhgs1mj9swFY
 IGrSwtbcTAG1rI3OcAOO8ExJZg==
X-Google-Smtp-Source: ABdhPJydurQNiOX5WZNDFwgpZCNlbC9JenKEOl9tX6thmCOoc/W3yRk0Ks8Wt8bVZZKA03IvAA+Aag==
X-Received: by 2002:a05:6402:51cd:: with SMTP id
 r13mr5693993edd.116.1616621263348; 
 Wed, 24 Mar 2021 14:27:43 -0700 (PDT)
Received: from [192.168.1.149] ([80.208.71.248])
 by smtp.gmail.com with ESMTPSA id s20sm1717716edu.93.2021.03.24.14.27.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Mar 2021 14:27:42 -0700 (PDT)
Subject: Re: [RFC patch] vsprintf: Allow %pe to print non PTR_ERR %pe uses as
 decimal
To: Joe Perches <joe@perches.com>, Arnd Bergmann <arnd@kernel.org>,
 Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20210324121832.3714570-1-arnd@kernel.org>
 <e1310273dcc577f3a772380ada7b6cc1906d680b.camel@perches.com>
 <CAK8P3a0JyoAtTYTi+M_mJ3_KtUJ6NeJB=FNWhzezqcXMac++mQ@mail.gmail.com>
 <810d36184b9fa2880d3ba7738a8f182e27f5107b.camel@perches.com>
 <3252fd83141aa9e0e6001acee1dd98e87c676b9a.camel@perches.com>
 <9feab1e8-4dee-6b79-03f7-7b9f0cb24f6e@rasmusvillemoes.dk>
 <d184069de43135a9c9e5f031447faf98ab3f437d.camel@perches.com>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <3d66137e-7842-2764-456f-7cc9e54a6d2e@rasmusvillemoes.dk>
Date: Wed, 24 Mar 2021 22:27:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <d184069de43135a9c9e5f031447faf98ab3f437d.camel@perches.com>
Content-Language: en-US
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: David Airlie <airlied@linux.ie>, Sascha Hauer <s.hauer@pengutronix.de>,
 Marco Felsch <m.felsch@pengutronix.de>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Liu Ying <victor.liu@nxp.com>, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjQvMDMvMjAyMSAyMC4yNCwgSm9lIFBlcmNoZXMgd3JvdGU6Cj4gT24gV2VkLCAyMDIxLTAz
LTI0IGF0IDE4OjMzICswMTAwLCBSYXNtdXMgVmlsbGVtb2VzIHdyb3RlOgo+PiBPbiAyNC8wMy8y
MDIxIDE4LjIwLCBKb2UgUGVyY2hlcyB3cm90ZToKPj4KPj4+Cj4+PiBNYXliZSBpdCdzIGJldHRl
ciB0byBvdXRwdXQgbm9uIFBUUl9FUlIgJXBlIHVzZXMgYXMgZGVjaW1hbCBzbyB0aGlzCj4+PiBz
b3J0IG9mIGNvZGUgd291bGQgd29yay4KPj4KPj4gTm8sIGJlY2F1c2UgdGhhdCB3b3VsZCBsZWFr
IHRoZSBwb2ludGVyIHZhbHVlIHdoZW4gc29tZWJvZHkgaGFzCj4+IGFjY2lkZW50YWxseSBwYXNz
ZWQgYSByZWFsIGtlcm5lbCBwb2ludGVyIHRvICVwZS4KPiAKPiBJIHRoaW5rIGl0J3Mgbm90IHJl
YWxseSBhbiBpc3N1ZS4KPiAKPiBfQWxsXyBjb2RlIHRoYXQgdXNlcyAlcDxmb28+IGV4dGVuc2lv
bnMgbmVlZCBpbnNwZWN0aW9uIGFueXdheS4KClRoZXJlIGFyZSBub3cgYSBidW5jaCBvZiBzYW5p
dHkgY2hlY2tzIGluIHBsYWNlIHRoYXQgY2F0Y2ggZS5nLiBhbgpFUlJfUFRSIHBhc3NlZCB0byBh
biBleHRlbnNpb24gdGhhdCB3b3VsZCBkZXJlZmVuY2UgdGhlIHBvaW50ZXI7CmVuZm9yY2luZyB0
aGF0IG9ubHkgRVJSX1BUUnMgYXJlIHBhc3NlZCB0byAlcGUgKG9yIGZhbGxpbmcgYmFjayB0byAl
cCkKaXMgYW5vdGhlciBvZiB0aG9zZSBzYWZlZ3VhcmRzLgoKPiBJdCdzIGFscmVhZHkgcG9zc2li
bGUgdG8gaW50ZW50aW9uYWxseSAnbGVhaycgdGhlIHB0ciB2YWx1ZQo+IGJ5IHVzaW5nICVwZSwg
LXB0ciBzbyBJIHRoaW5rIHRoYXQncyBub3QgcmVhbGx5IGFuIGlzc3VlLgo+IAoKSHVoLCB3aGF0
PyBJIGFzc3VtZSAtcHRyIGlzIHNob3J0aGFuZCBmb3IgKHZvaWQqKS0odW5zaWduZWQgbG9uZylw
dHIuCkhvdyB3b3VsZCB0aGF0IGxlYWsgdGhlIHZhbHVlIGlmIHB0ciBpcyBhbiBvcmRpbmFyeSBr
ZXJuZWwgcG9pbnRlcj8KVGhhdCdzIG5vdCBhbiBFUlJfUFRSIHVubGVzcyAodW5zaWduZWQgbG9u
ZylwdHIgaXMgPCA0MDk1IG9yIHNvLgoKSWYgeW91IHdhbnQgdG8gcHJpbnQgdGhlIHBvaW50ZXIg
dmFsdWUganVzdCBkbyAlcHguIE5vIG5lZWQgZm9yIHNpbGx5CmdhbWVzLiBXaGF0IEknbSB0YWxr
aW5nIGFib3V0IGlzIHByZXZlbnRpbmcgX3VuX2ludGVudGlvbmFsbHkgbGVha2luZyBhCnZhbGlk
IGtlcm5lbCBwb2ludGVyIHZhbHVlLiBTbyBubywgYSBub24tRVJSX1BUUiBwYXNzZWQgdG8gJXBl
IGlzIG5vdApnb2luZyB0byBiZSBwcmludGVkIGFzLWlzLCBub3QgaW4gZGVjaW1hbCBvciBoZXhh
ZGVjaW1hbCBvciByb21hbiBudW1lcmFscy4KCj4+IElmIHRoZSBjb2RlIHdhbnRzIGEgY3V0ZSAt
RUZPTyBzdHJpbmcgZXhwbGFpbmluZyB3aGF0J3Mgd3JvbmcsIHdoYXQKPj4gYWJvdXQgIiVwZSIs
IEVSUl9QVFIobXV4IDwgMCA6IG11eCA6IC1FUkFOR0UpPyBPciB0d28gc2VwYXJhdGUgZXJyb3IK
Pj4gbWVzc2FnZXMKPj4KPj4gaWYgKG11eCA8IDApCj4+IMKgwqAuLi4KPj4gZWxzZSBpZiAobXV4
ID49IEFSUkFZX1NJWkUoKSkKPj4gwqDCoC4uLgo+IAo+IE11bHRpcGxlIHRlc3RzLCBtb3JlIHVu
bmVjZXNzYXJ5IGNvZGUsIG11bHRpcGxlIGZvcm1hdCBzdHJpbmdzLCBldGMuLi4KCkFncmVlZCwg
SSdtIG5vdCByZWFsbHkgYWR2b2NhdGluZyBmb3IgdGhlIGxhdHRlcjsgdGhlIGZvcm1lciBzdWdn
ZXN0aW9uCmlzIElNTyBhIHByZXR0eSBjb25jaXNlIHdheSBvZiBwcm92aWRpbmcgdXNlZnVsIGlu
Zm9ybWF0aW9uIGluIGRtZXNnLgoKUmFzbXVzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
