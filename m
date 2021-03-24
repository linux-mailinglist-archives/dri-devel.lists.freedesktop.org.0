Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BBF347F62
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 18:33:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEE606EA43;
	Wed, 24 Mar 2021 17:33:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F9226EA43
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 17:33:25 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id k10so34266505ejg.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 10:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0ia9XkGHN8cpyt/SNHTlV6h0g+8s/qDF70Hmi8JWq3o=;
 b=SvtBKLat/CRx0Qu+JD4uXYjs0QfiZh3LK3TOczSV2qLDQGzU3O8i/2910n1VgWqb16
 X4H57OUsl/jV3qzjYvAtlJELU6cNl2LCjyaMrxMt0cyBpC1UYQXxcRnQe2hk68AsQJmN
 J0dX9sbv9I45DKriCBZBlC7i6LpnFC/htiw74=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0ia9XkGHN8cpyt/SNHTlV6h0g+8s/qDF70Hmi8JWq3o=;
 b=njGYhCGd/3yv0cU0Z1C2ImtguyXmIbYurmWF4EMaC9Qd78YRN7S/VVQvBnNSpVclBo
 iucKzm3Iuu3kS8hLrTtD213SGF7P4MnD7p7Y2H2QY2FlPbbWYsi+43GYuuvs0ezRlaB7
 FFgQd0f3DePfv1aqQtuDdgY/Tz1s2Hx91MAjeEzOtXZ+/E1XPZ3PbD2//tmq0ZHo5YEg
 i6KRQPhhOXyNohugZNRdWY5gdz1epsoamNS4eX00mRUoDbnPaULw6sqrCn9062+BC0t9
 jJH2gJwvgUcRLv7QWrFGFvKWdaqhfppQXDaD570g1rw5kgjcJ46np5/s603uSXhlv7nV
 iDNg==
X-Gm-Message-State: AOAM532It2ZdhcZiCyYPmRD/wmo1JhAtllU62Z0mIGERK6FIKzoKJmi3
 DY9u6/YtobJCT4hanNIuwuG23g==
X-Google-Smtp-Source: ABdhPJzAvd1bvs+j7PzqB5nRnbeU7vt6/iMe8D4YVkWYBJ1ZPi+NFvO248ZS8JBhmHEYCGVPOPt52w==
X-Received: by 2002:a17:906:39cf:: with SMTP id
 i15mr4954508eje.534.1616607203805; 
 Wed, 24 Mar 2021 10:33:23 -0700 (PDT)
Received: from [192.168.1.149] ([80.208.71.248])
 by smtp.gmail.com with ESMTPSA id hd8sm1212155ejc.92.2021.03.24.10.33.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Mar 2021 10:33:23 -0700 (PDT)
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
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <9feab1e8-4dee-6b79-03f7-7b9f0cb24f6e@rasmusvillemoes.dk>
Date: Wed, 24 Mar 2021 18:33:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <3252fd83141aa9e0e6001acee1dd98e87c676b9a.camel@perches.com>
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

T24gMjQvMDMvMjAyMSAxOC4yMCwgSm9lIFBlcmNoZXMgd3JvdGU6Cj4gT24gV2VkLCAyMDIxLTAz
LTI0IGF0IDA5OjUyIC0wNzAwLCBKb2UgUGVyY2hlcyB3cm90ZToKPj4gT24gV2VkLCAyMDIxLTAz
LTI0IGF0IDE3OjQyICswMTAwLCBBcm5kIEJlcmdtYW5uIHdyb3RlOgo+Pj4gT24gV2VkLCBNYXIg
MjQsIDIwMjEgYXQgMzoyMCBQTSBKb2UgUGVyY2hlcyA8am9lQHBlcmNoZXMuY29tPiB3cm90ZToK
Pj4gW10KPj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pbXgvaW14LWxkYi5jIGIv
ZHJpdmVycy9ncHUvZHJtL2lteC9pbXgtbGRiLmMKPj4+PiBbXQo+Pj4+PiBAQCAtMTk3LDYgKzE5
NywxMiBAQCBzdGF0aWMgdm9pZCBpbXhfbGRiX2VuY29kZXJfZW5hYmxlKHN0cnVjdCBkcm1fZW5j
b2RlciAqZW5jb2RlcikKPj4+Pj4gwqDCoMKgwqDCoMKgaW50IGR1YWwgPSBsZGItPmxkYl9jdHJs
ICYgTERCX1NQTElUX01PREVfRU47Cj4+Pj4+IMKgwqDCoMKgwqDCoGludCBtdXggPSBkcm1fb2Zf
ZW5jb2Rlcl9hY3RpdmVfcG9ydF9pZChpbXhfbGRiX2NoLT5jaGlsZCwgZW5jb2Rlcik7Cj4+Pj4+
Cj4+Pj4+ICsgICAgIGlmIChtdXggPCAwIHx8IG11eCA+PSBBUlJBWV9TSVpFKGxkYi0+Y2xrX3Nl
bCkpIHsKPj4+Pj4gKyAgICAgICAgICAgICBkZXZfd2FybihsZGItPmRldiwgIiVzOiBpbnZhbGlk
IG11eCAlZFxuIiwKPj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICBfX2Z1bmNfXywgRVJSX1BU
UihtdXgpKTsKPj4+Pgo+Pj4+IFRoaXMgZG9lcyBub3QgY29tcGlsZSB3aXRob3V0IHdhcm5pbmdz
Lgo+Pj4+Cj4+Pj4gZHJpdmVycy9ncHUvZHJtL2lteC9pbXgtbGRiLmM6IEluIGZ1bmN0aW9uIOKA
mGlteF9sZGJfZW5jb2Rlcl9lbmFibGXigJk6Cj4+Pj4gZHJpdmVycy9ncHUvZHJtL2lteC9pbXgt
bGRiLmM6MjAxOjIyOiB3YXJuaW5nOiBmb3JtYXQg4oCYJWTigJkgZXhwZWN0cyBhcmd1bWVudCBv
ZiB0eXBlIOKAmGludOKAmSwgYnV0IGFyZ3VtZW50IDQgaGFzIHR5cGUg4oCYdm9pZCAq4oCZIFst
V2Zvcm1hdD1dCj4+Pj4gwqDCoDIwMSB8ICAgZGV2X3dhcm4obGRiLT5kZXYsICIlczogaW52YWxp
ZCBtdXggJWRcbiIsCj4+Pj4gwqDCoMKgwqDCoMKgfCAgICAgICAgICAgICAgICAgICAgICBefn5+
fn5+fn5+fn5+fn5+fn5+fn5+Cj4+Pj4KPj4+PiBJZiB5b3Ugd2FudCB0byB1c2UgRVJSX1BUUiwg
dGhlICVkIHNob3VsZCBiZSAlcGUgYXMgRVJSX1BUUgo+Pj4+IGlzIGNvbnZlcnRpbmcgYW4gaW50
IGEgdm9pZCAqIHRvIGRlY29kZSB0aGUgZXJyb3IgdHlwZSBhbmQKPj4+PiBlbWl0IGl0IGFzIGEg
c3RyaW5nLgo+Pj4KPj4+IFNvcnJ5IGFib3V0IHRoYXQuCj4+Pgo+Pj4gSSBkZWNpZGVkIGFnYWlu
c3QgdXNpbmcgRVJSX1BUUigpIGluIG9yZGVyIHRvIGFsc28gY2hlY2sgZm9yCj4+PiBwb3NpdGl2
ZSBhcnJheSBvdmVyZmxvdywgYnV0IHRoZSB2ZXJzaW9uIEkgdGVzdGVkIHdhcyBkaWZmZXJlbnQg
ZnJvbQo+Pj4gdGhlIHZlcnNpb24gSSBzZW50Lgo+Pj4KPj4+IHYzIGNvbWluZy4KPj4KPj4gVGhh
bmtzLiAgTm8gd29ycmllcy4KPj4KPj4gVXAgdG8geW91LCB2c3ByaW50ZiB3b3VsZCBlbWl0IHRo
ZSBwb3NpdGl2ZSBtdXggYXMgYSBmdW5reSBoYXNoZWQKPj4gaGV4IHZhbHVlIGJ5IGRlZmF1bHQg
aWYgeW91IHVzZSBFUlJfUFRSIHdpdGggbXV4ID4gQVJSQVlfU0laRSBzbwo+PiBwZXJoYXBzICVk
IHdpdGhvdXQgdGhlIEVSUl9QVFIgdXNlIG1ha2VzIHRoZSBtb3N0IHNlbnNlLgo+PgoKPiAKPiBN
YXliZSBpdCdzIGJldHRlciB0byBvdXRwdXQgbm9uIFBUUl9FUlIgJXBlIHVzZXMgYXMgZGVjaW1h
bCBzbyB0aGlzCj4gc29ydCBvZiBjb2RlIHdvdWxkIHdvcmsuCgpObywgYmVjYXVzZSB0aGF0IHdv
dWxkIGxlYWsgdGhlIHBvaW50ZXIgdmFsdWUgd2hlbiBzb21lYm9keSBoYXMKYWNjaWRlbnRhbGx5
IHBhc3NlZCBhIHJlYWwga2VybmVsIHBvaW50ZXIgdG8gJXBlLgoKSWYgdGhlIGNvZGUgd2FudHMg
YSBjdXRlIC1FRk9PIHN0cmluZyBleHBsYWluaW5nIHdoYXQncyB3cm9uZywgd2hhdAphYm91dCAi
JXBlIiwgRVJSX1BUUihtdXggPCAwIDogbXV4IDogLUVSQU5HRSk/IE9yIHR3byBzZXBhcmF0ZSBl
cnJvcgptZXNzYWdlcwoKaWYgKG11eCA8IDApCiAgLi4uCmVsc2UgaWYgKG11eCA+PSBBUlJBWV9T
SVpFKCkpCiAgLi4uCgpSYXNtdXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
