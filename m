Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B6DCF75C
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 12:43:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F9F56E0F5;
	Tue,  8 Oct 2019 10:43:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B95F46E0F5
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 10:43:15 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id 3so2590153wmi.3
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Oct 2019 03:43:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=kNT0uravG5d+lNDf6zaLGqaWiN2XpE5JXyYmizVBilE=;
 b=IsusPJFvcHXUCN3ldbOjWIG4RZMK1jpcA3jwKaI2K22LmXa0Dju0V6ss5tDXQzrygC
 XFqSZ/jmZgbImDPLZ7gf/6ax7nSHgKtKnIVnvGnf7F7ItRYyOdJ4kEvxDppEFCk+EdbP
 xVlMegF5Me8ChN4S9ucU7eCzyguRg1qnvdhT9bhD5omVNZHqexuCO0brc1t7MeAStx6u
 5XQ1G0ZyxifXuOOlIjn9Fj9mVq+bX7j7VHjqwRh9Hha8V7S7xhGOq2Nvq+TWs7aDX7NT
 uDnJQ11/FbDNBrm/ZBFRzOc9GBPJwCA+ydI4XO0UrDBMSRDN/JLt9/gJPtWD4icso5T6
 I0Lg==
X-Gm-Message-State: APjAAAUNQiI70bhEpyUZH3vBKzb61JTnyhIDnb2iDY4pJbhIX8t4asSc
 9/CkAyFEOs4ppzyqjliJCxVaJQ==
X-Google-Smtp-Source: APXvYqwDdhuAhHaQJXOqUmc7Qcgp2Qnp21uhE7Cr0GMQdE2+Bt2iLHZCWbFgdquKZmjYilbrPc3XeA==
X-Received: by 2002:a7b:c7d4:: with SMTP id z20mr3278073wmk.145.1570531394197; 
 Tue, 08 Oct 2019 03:43:14 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id b62sm4548867wmc.13.2019.10.08.03.43.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2019 03:43:13 -0700 (PDT)
Date: Tue, 8 Oct 2019 11:43:11 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [PATCH 3/5] backlight: pwm_bl: drop use of int_pow()
Message-ID: <20191008104311.s4k5syr7gd7tb55w@holly.lan>
References: <20190919140620.32407-1-linux@rasmusvillemoes.dk>
 <20190919140620.32407-3-linux@rasmusvillemoes.dk>
 <20191007152800.3nhbf7h7knumriz4@holly.lan>
 <5f19e307-29c4-f077-568d-b2bd6ae74608@rasmusvillemoes.dk>
 <20191008093145.kgx6ytkbycmmkist@holly.lan>
 <9bf6baf9-46be-771c-7e26-527b117c998a@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9bf6baf9-46be-771c-7e26-527b117c998a@rasmusvillemoes.dk>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=kNT0uravG5d+lNDf6zaLGqaWiN2XpE5JXyYmizVBilE=;
 b=K9H4eDofUQAKZFM6o8SaI1fDGTLc4h7zvLiQ1+kb/3hl9KTydNTP7sOmaT6ZOvOy+h
 qCDq8mzBa37VmuqcmWj5VvjaBvps+QwcM68guyWqS7cr9uaOY134H4lb7mkzoSRr4Buc
 MoeRrevZYD2M/FEAhj2Pmft/ekWeOstHP3Qd7drNLISZ3UzzZWZWJrRbTlsAaqGTlbMn
 zlC88mSLkqFcvForhTUElc0Tk8aobntBt2kXJ7UPWhnu9ZKaS1Q5JYKqELXmOkI4xbf4
 4yCCbqemhFWRxC1rFNomOZHXO8jgNt7JK20q4ZEL/O60BOBasjqAhiJtzqMKkGJNHJHP
 hZBg==
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMDgsIDIwMTkgYXQgMTI6MDI6MDdQTSArMDIwMCwgUmFzbXVzIFZpbGxlbW9l
cyB3cm90ZToKPiBPbiAwOC8xMC8yMDE5IDExLjMxLCBEYW5pZWwgVGhvbXBzb24gd3JvdGU6Cj4g
PiBPbiBNb24sIE9jdCAwNywgMjAxOSBhdCAwODo0MzozMVBNICswMjAwLCBSYXNtdXMgVmlsbGVt
b2VzIHdyb3RlOgo+ID4+IE9uIDA3LzEwLzIwMTkgMTcuMjgsIERhbmllbCBUaG9tcHNvbiB3cm90
ZToKPiA+Pj4gT24gVGh1LCBTZXAgMTksIDIwMTkgYXQgMDQ6MDY6MThQTSArMDIwMCwgUmFzbXVz
IFZpbGxlbW9lcyB3cm90ZToKPiA+Pj4KPiA+Pj4gSXQgZmVlbHMgbGlrZSB0aGVyZSBpcyBzb21l
IHJhdGlvbmFsZSBtaXNzaW5nIGluIHRoZSBkZXNjcmlwdGlvbiBoZXJlLgo+ID4+Pgo+ID4+Cj4g
Pj4gQXBhcnQgZnJvbSB0aGUgZnVuY3Rpb24gY2FsbCBvdmVyaGVhZCAoYW5kIHJlc3VsdGluZyBy
ZWdpc3RlciBwcmVzc3VyZQo+ID4+IGV0Yy4pLCB1c2luZyBpbnRfcG93IGlzIGxlc3MgZWZmaWNp
ZW50IChmb3IgYW4gZXhwb25lbnQgb2YgMywgaXQgZW5kcyB1cAo+ID4+IGRvaW5nIGZvdXIgNjR4
NjQgbXVsdGlwbGljYXRpb25zIGluc3RlYWQgb2YganVzdCB0d28pLiBCdXQgZmVlbCBmcmVlIHRv
Cj4gPj4gZHJvcCBpdCwgSSdtIG5vdCBnb2luZyB0byBwdXJzdWUgaXQgZnVydGhlciAtIGl0IGp1
c3Qgc2VlbWVkIGxpa2UgYQo+ID4+IHNlbnNpYmxlIHRoaW5nIHRvIGRvIHdoaWxlIEkgd2FzIG9w
dGltaXppbmcgdGhlIGNvZGUgYW55d2F5Lgo+ID4+Cj4gPj4gW0F0IHRoZSB0aW1lIEkgd3JvdGUg
dGhlIHBhdGNoLCB0aGlzIHdhcyBhbHNvIHRoZSBvbmx5IHVzZXIgb2YgaW50X3Bvdwo+ID4+IGlu
IHRoZSB0cmVlLCBzbyBpdCBhbHNvIGFsbG93ZWQgcmVtb3ZpbmcgaW50X3BvdyBhbHRvZ2V0aGVy
Ll0KPiA+IAo+ID4gVG8gYmUgaG9uZXN0IHRoZSBjaGFuZ2UgaXMgZmluZSBidXQgdGhlIHBhdGNo
IGRlc2NyaXB0aW9uIGRvZXNuJ3QgbWFrZQo+ID4gc2Vuc2UgaWYgdGhlIG9ubHkgY3VycmVudCBw
dXJwb3NlIG9mIHRoZSBwYXRjaCBpcyBhcyBhIG9wdGltaXphdGlvbi4KPiAKPiBBZ3JlZWQuIERv
IHlvdSB3YW50IG1lIHRvIHJlc2VuZCB0aGUgc2VyaWVzIHdpdGggcGF0Y2ggMyB1cGRhdGVkIHRv
IHJlYWQKPiAKPiAiRm9yIGEgZml4ZWQgc21hbGwgZXhwb25lbnQgb2YgMywgaXQgaXMgbW9yZSBl
ZmZpY2llbnQgdG8gc2ltcGx5IHVzZSB0d28KPiBleHBsaWNpdCBtdWx0aXBsaWNhdGlvbnMgcmF0
aGVyIHRoYW4gY2FsbGluZyB0aGUgaW50X3BvdygpIGxpYnJhcnkKPiBmdW5jdGlvbjogQXNpZGUg
ZnJvbSB0aGUgZnVuY3Rpb24gY2FsbCBvdmVyaGVhZCwgaXRzIGltcGxlbWVudGF0aW9uCj4gdXNp
bmcgcmVwZWF0ZWQgc3F1YXJpbmcgbWVhbnMgaXQgZW5kcyB1cCBkb2luZyBmb3VyIDY0eDY0IG11
bHRpcGxpY2F0aW9ucy4iCj4gCj4gKGFuZCBvYnZpb3VzbHkgcGF0Y2ggNSBkcm9wcGVkKT8KClll
cywgcGxlYXNlLgoKV2hlbiB5b3UgcmVzZW5kIHlvdSBjYW4gYWRkIG15IFItQjogdG8gYWxsIHBh
dGNoZXM6CgpSZXZpZXdlZC1ieTogRGFuaWVsIFRob21wc29uIDxkYW5pZWwudGhvbXBzb25AbGlu
YXJvLm9yZz4KCgpEYW5pZWwuCgoKUFMgRG9uJ3QgbWluZCBlaXRoZXIgd2F5IGJ1dCBJIHdvbmRl
cmVkIHRoZSBmb2xsb3dpbmcgaXMgY2xlYXJlciB0aGFuCiAgIHRoZSBzbGlnaHRseSBmdW5reSBt
dWx0aXBseS1hbmQtYXNzaWduIGV4cHJlc3Npb24gKHdoaWNoIGlzbid0IHdyb25nCiAgIGJ1dCBp
c24ndCB2ZXJ5IGNvbW1vbiBlaXRoZXIgc28gbXkgYnJhaW4gd29uJ3Qgc3BlZWQgcmVhZCBpdCk6
CgoJCXJldHZhbCA9IERJVl9ST1VORF9DTE9TRVNUX1VMTChyZXR2YWwgKiByZXR2YWwgKiByZXR2
YWwsCgkJIAkJCSAgICAgICBzY2FsZSAqIHNjYWxlKTsKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
