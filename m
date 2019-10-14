Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A1BD5E9F
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2019 11:21:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 879196E1A5;
	Mon, 14 Oct 2019 09:21:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36F676E1A5
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 09:20:59 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id j8so2495243eds.1
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 02:20:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=cXLWelx1c959PYIdEEkJBzLAagmb1+o1jiOeE3S2Jmo=;
 b=RsOTSbQembFtgBMiZ8XenwuZWrPTJp7Dojv320YRYXkwvxfqViknItJL9P2+/Ani/x
 iS+IzGHhtVV00aMTcNkjo8Pw1qDeVw1Lsr5PzgBjY4O1xVIM/EPOGyugPOijCuoM7//6
 C/dZBT3pucstYEKWT5yvEorb/LZUfCIHgDiIs9Jl6bKs8fCmGb23u5DuXJe2/UPaCkII
 dXkmUG38LBCo8vjselupM6Sugt6Gk6no4tMTLgJDmCJrVxd+ooHOKLVQj89TfUeE/hk6
 awhd3L7WkybddT6huxK0ELLh4ycmOV4SLrOhJ4yKApMEfY4kQbLtZLMcXjeHvHr7B5MZ
 vsPg==
X-Gm-Message-State: APjAAAW5jKBg6rSm4nHK/Oqd9xzQbU/cNchKXELiofZYxJ6BY+kW2dHB
 CgNXjtyYqqc2x/usHYIeZJuPRw==
X-Google-Smtp-Source: APXvYqzee5P3rg6HkNKJq083ORWi71hjKU8UGred4yM1dC0aXUaTqD5GAOQVJDwL94rFb3UhmpeydA==
X-Received: by 2002:a17:906:7f04:: with SMTP id
 d4mr28150017ejr.178.1571044857729; 
 Mon, 14 Oct 2019 02:20:57 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id a50sm3033294eda.25.2019.10.14.02.20.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2019 02:20:57 -0700 (PDT)
Date: Mon, 14 Oct 2019 11:20:55 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Brian Starkey <Brian.Starkey@arm.com>
Subject: Re: [PATCH 4/7] drm/meson: plane: add support for AFBC mode for OSD1
 plane
Message-ID: <20191014092054.GK11828@phenom.ffwll.local>
References: <20191010092526.10419-1-narmstrong@baylibre.com>
 <20191010092526.10419-5-narmstrong@baylibre.com>
 <20191010132601.GA10110@arm.com>
 <44f1771f-d640-f23d-995f-7bfcadd213bc@baylibre.com>
 <20191011084108.i7lfh2d7asfmcdk4@DESKTOP-E1NTVVP.localdomain>
 <c9d4f840-a3da-0f40-3a1c-c4aa522daf0f@baylibre.com>
 <20191011105559.clttghy52wfdmb34@DESKTOP-E1NTVVP.localdomain>
 <CAKMK7uHEWQiXYE7RE7TffHEHMys=LTYcNeK+iAX3qiS-c2PNjQ@mail.gmail.com>
 <20191014091118.jfa7xxh2e7kxu4ff@DESKTOP-E1NTVVP.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191014091118.jfa7xxh2e7kxu4ff@DESKTOP-E1NTVVP.localdomain>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=cXLWelx1c959PYIdEEkJBzLAagmb1+o1jiOeE3S2Jmo=;
 b=JsLdeHhIRe3oHC8PeIpbEJtFRSvoNbsnMsSWepL1AiDINUbn1COGw64DIU9mmyXZoO
 NBrHPLeMDoqCMexMi5WjEQhZerI/sz80vChKHilzZKC3R59MCfjWLraYetWOmq8e0T4c
 p1naaUgCG6LsKYUH4gDnaJocNjtzg3Qpef/tY=
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
Cc: nd <nd@arm.com>, Neil Armstrong <narmstrong@baylibre.com>,
 "khilman@baylibre.com" <khilman@baylibre.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 Ayan Halder <Ayan.Halder@arm.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgMTQsIDIwMTkgYXQgMDk6MTE6MTdBTSArMDAwMCwgQnJpYW4gU3RhcmtleSB3
cm90ZToKPiBPbiBGcmksIE9jdCAxMSwgMjAxOSBhdCAwNzoyNTowMlBNICswMjAwLCBEYW5pZWwg
VmV0dGVyIHdyb3RlOgo+ID4gT24gRnJpLCBPY3QgMTEsIDIwMTkgYXQgMTI6NTYgUE0gQnJpYW4g
U3RhcmtleSA8QnJpYW4uU3RhcmtleUBhcm0uY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gSGksCj4g
PiA+Cj4gPiA+IE9uIEZyaSwgT2N0IDExLCAyMDE5IGF0IDExOjE0OjQzQU0gKzAyMDAsIE5laWwg
QXJtc3Ryb25nIHdyb3RlOgo+ID4gPiA+IEhpIEJyaWFuLAo+ID4gPiA+Cj4gPiA+ID4gT24gMTEv
MTAvMjAxOSAxMDo0MSwgQnJpYW4gU3RhcmtleSB3cm90ZToKPiA+IAo+ID4gPiA+ID4gQXJlIHlv
dSBzdXJlIHRoZSBHUFUgc3VwcG9ydHMgb3RoZXIgb3JkZXJzPyBJIHRoaW5rIGFueSBBcm0gZHJp
dmVyCj4gPiA+ID4gPiB3aWxsIG9ubHkgYmUgcHJvZHVjaW5nIERSTV9GT1JNQVRzIHdpdGggIkJH
UiIgb3JkZXIgZS5nLiBBQkdSODg4Pgo+ID4gPiA+ID4gSSdtIG5vdCBjb252aW5jZWQgdGhlIEdQ
VSBIVyBhY3R1YWxseSBzdXBwb3J0cyBhbnkgb3RoZXIgb3JkZXIsIGJ1dAo+ID4gPiA+ID4gaXQn
cyBhbGwgcmF0aGVyIGNvbmZ1c2luZyB3aXRoIHRleHR1cmUgc3dpenpsaW5nLiBXaGF0IEkgY2Fu
IHRlbGwgeW91Cj4gPiA+ID4gPiBmb3Igc3VyZSBpcyB0aGF0IGl0IF9kb2VzXyBzdXBwb3J0IEJH
UiBvcmRlciAoaW4gRFJNIG5hbWluZwo+ID4gPiA+ID4gY29udmVudGlvbikuCj4gPiA+ID4KPiA+
ID4gPiBXZWxsLCBzaW5jZSB0aGUgQmlmcm9zdCBNYWxpIGJsb2JzIGFyZSBjbG9zZWQtc291cmNl
IGFuZCBkZWxpdmVyZWQKPiA+ID4gPiBieSBsaWNlbnNlZXMsIGl0J3MgaGFyZCB0byBkZWZpbmUg
d2hhdCBpcyBzdXBwb3J0ZWQgZnJvbSBhIGNsb3NlZAo+ID4gPiA+IEdQVSBIVywgY2xvc2VkIFNX
IGltcGxlbWVudGF0aW9uIHRvIGEgY2xvc2VkIHBpeGVsIGZvcm1hdCBpbXBsZW1lbnRhdGlvbi4K
PiA+ID4gPgo+ID4gPgo+ID4gPiBJIGhlYXIgeW91LiBJTU8gdGhlIG9ubHkgd2F5IHRvIG1ha2Ug
YW55IG9mIHRoaXMgY2xlYXIgaXMgdG8gcHVibGlzaAo+ID4gPiByZWZlcmVuY2UgZGF0YSBhbmQg
dGVzdHMgd2hpY2ggbWFrZSBzdXJlIGltcGxlbWVudGF0aW9ucyBtYXRjaCBlYWNoCj4gPiA+IG90
aGVyLiBJdCdzIHNvbWV0aGluZyBJJ20gdHJ5aW5nIHRvIG1ha2UgaGFwcGVuLgo+ID4gCj4gPiAq
Y291Z2gqIGlndCB0ZXN0IHdpdGggY3JjL3dyaXRlYmFjayB2YWxpZGF0aW9uICpjb3VnaCoKPiA+
IAo+ID4gQW5kIHlvdSBkb24ndCBldmVuIG5lZWQgYW55dGhpbmcgdGhhdCBhY3R1YWxseSBjb21w
cmVzc2VzLiBBbGwgeW91Cj4gPiBuZWVkIGlzIHRoZSBtaW5pbWFsIGVub3VnaCBBRkJDIGtub3ds
ZWRnZSB0byBzZXQgdXAgdGhlIG1ldGFkYXRhIHRoYXQKPiA+IGV2ZXJ5dGhpbmcgaXMgdW5jb21w
cmVzc2VkLiBXZSdyZSBkb2luZyB0aGF0IGZvciBvdXIgaW50ZWwgY29tcHJlc3Npb24KPiA+IGZv
cm1hdHMgYWxyZWFkeSwgYW5kIGl0IHdvcmtzIGdyZWF0IGluIG1ha2luZyBzdXJlIHRoYXQgd2Ug
aGF2ZQo+ID4gZW5kLXRvLWVuZCBhZ3JlZW1lbnQgb24gYWxsIHRoZSBiaXRzIGFuZCBvcmRlcmlu
ZyBhbmQgZXZlcnl0aGluZy4KPiAKPiBZZWFoIHRoaXMgd2FzIG15IG9yaWdpbmFsIHRoaW5raW5n
IHRvby4gU2FkbHksIGEgZGVjZW50IG51bWJlciBvZiB0aGUKPiBBRkJDIHBhcmFtZXRlcnMgY2Fu
J3QgYmUgdGVzdGVkIHdpdGggdW5jb21wcmVzc2VkIGRhdGEsIGFzIHRoZSBjb2RlYwo+IGtpY2tz
IGludG8gYSBkaWZmZXJlbnQgbW9kZSB0aGVyZS4KCkhtIHJpZ2h0IEkgZ3Vlc3Mgc29tZSBvZiB0
aGUgZmxhZ3MvcGFyYW1ldGVycyBvbmx5IG1hdHRlciBpZiB5b3UgZGVhbCB3aXRoCmFjdHVhbCBj
b21wcmVzc2VkIGRhdGEuIFN0aWxsLCBiZXR0ZXIgdGhhbiBub3RoaW5nIEkgZ3Vlc3MgLSB0aGlz
IHNob3VsZAphdCBsZWFzdCBjYXRjaCBzdHVmZiBsaWtlIGNvbG9yIGNoYW5uZWxzIHdpcmVkIHVw
IHRoZSB3cm9uZyB3YXkgY29tcGFyZWQKdG8gbGluZWFyLCBhbmQgZnVuIHN0dWZmIGxpa2UgdGhh
dC4KCj4gPiBPZmMKPiA+IGl0IGRvZXNuJ3QgdmFsaWRhdGUgdGhlIGRlY29kZXIsIGJ1dCB0aGF0
J3Mgbm90IHJlYWxseSBpZ3RzIGpvYi4KPiA+IFNob3VsZCBiZSBwb3NzaWJsZSB0byBjb252aW5j
ZSBBUk0gdG8gcmVsZWFzZSB0aGF0IChhcyBvcGVuIHNvdXJjZSwgaW4KPiA+IGlndCksIHNpbmNl
IGl0IHdvdWxkIGJlIGZhaXJseSB2YWx1YWJsZSBmb3IgdGhlIGVudGlyZSBlY29zeXN0ZW0gaGVy
ZQo+ID4gLi4uCj4gCj4gSSBmdWxseSBhZ3JlZSBhYm91dCB0aGUgdmFsdWUgcHJvcG9zaXRpb24u
CgpJJ2xsIGJlIHdhaXRpbmcgZm9yIHBhdGNoIGZyb20gYXJtIHRoZW4gOi0pCgpDaGVlcnMsIERh
bmllbAotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRp
b24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
