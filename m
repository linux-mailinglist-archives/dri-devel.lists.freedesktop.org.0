Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D9D214F1
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2019 09:55:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F199898B6;
	Fri, 17 May 2019 07:54:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A406A89395;
 Thu, 16 May 2019 11:31:32 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id j24so2803299ljg.1;
 Thu, 16 May 2019 04:31:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=xTGu8/QnGnkoFIb7hwv0wxLad+G3voch6WCwgvivs0w=;
 b=Ih7RazcOX6O0HZQPkXquYujvzjlWaMzCC0c47605p6n4Apg4NljwZA++gpfzgUsNHc
 tiwDx6peByReUQ6Y6G6xu46FwI/bNhisBBJooDwAq2poHFwp7F8x/dWvDA+CHd6nbJJk
 QjNTY8LoXpBvJnkPNsas0FDY1lpprwzVf8jg+Oe8K8u6Si40oegd4Efr6UbBX7rAFHkv
 kHtenavx90VgzMaTR/2E97p98JJ2y4fXqtIYirucWzzrpdRyPDjAQYk04FOCP6gSeED1
 2WQduwXvEIFYPmqUUNcuIulCUMkZf5QeDeObwrHPOkWNcXPeiR5xBW0A3PxnZle/zEFi
 7p8Q==
X-Gm-Message-State: APjAAAUmnGLZgIt7OFw2nWlc+kufQACDLryTbwpdeKxbNC2Nn61RkQvr
 gtWOw98ZpqtsW8iMe5OTzys=
X-Google-Smtp-Source: APXvYqzLh9PAvKAc4eQmlrzg3RDQk99auNZpmgnTy8R6LBIV0A1xcSIy+nLTkDF26CIsG00CGAeNww==
X-Received: by 2002:a2e:4555:: with SMTP id s82mr23862563lja.15.1558006290992; 
 Thu, 16 May 2019 04:31:30 -0700 (PDT)
Received: from y40-linux (c-e295e355.03-206-616c6b1.bbcust.telenor.se.
 [85.227.149.226])
 by smtp.gmail.com with ESMTPSA id x6sm902358lfn.74.2019.05.16.04.31.30
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 16 May 2019 04:31:30 -0700 (PDT)
Date: Thu, 16 May 2019 13:31:24 +0200
From: Peteris Rudzusiks <peteris.rudzusiks@gmail.com>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: Re: [Nouveau] [PATCH] drm/nouveau: fix duplication of nv50_head_atom
 struct
Message-ID: <20190516113123.GA14864@y40-linux>
References: <20190511170831.25645-1-peteris.rudzusiks@gmail.com>
 <CACAvsv5Ux7Av45JGQ7Rqe+ZX2zWcbbBNqc+kCZgLT-uGkQAegw@mail.gmail.com>
 <20190514195736.GB5179@y40-linux>
 <CAKb7Uvhhre6-k_GJUmLW59z4XEjg5eX6EQiHN5aGts_gcC3+2w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKb7Uvhhre6-k_GJUmLW59z4XEjg5eX6EQiHN5aGts_gcC3+2w@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Fri, 17 May 2019 07:54:52 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=xTGu8/QnGnkoFIb7hwv0wxLad+G3voch6WCwgvivs0w=;
 b=omN7zl/kILcDkw/IoGhFCr8u/YDTDeVSkXQC7GMDwcQbxHw4AdfZGXXaRsDfR83+2E
 H3YrU3QrySKE/S2HQY0GQIDabvxp/zaP6ZeDoLeKyDoV9P5yPGMxvewT+ohPyd3R7J63
 5jOt5kI6YUHIHduDCGdCr9Kd19rMs8Zmb84mJnUUbcKLCdJ8pVCQIt1eo1MLDTi5UFZH
 mWe5i3EAU9RqzbR6f8jB9LOoWx/kcQLLNIDP5wP/T5RGZVjgAMYlTGjkl6zKV3+zFYH+
 4zcrL1PI54Ss/+GOzEI8cHpLihm9+D8D4n+r8onHtkZTv67ofnUz1Z3cfHscliYh5mmg
 a0ew==
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
Cc: nouveau <nouveau@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXkgMTUsIDIwMTkgYXQgMTE6Mjk6NDBQTSAtMDQwMCwgSWxpYSBNaXJraW4gd3Jv
dGU6Cj4gT24gVHVlLCBNYXkgMTQsIDIwMTkgYXQgMzo1NyBQTSBQZXRlcmlzIFJ1ZHp1c2lrcwo+
IDxwZXRlcmlzLnJ1ZHp1c2lrc0BnbWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIFR1ZSwgTWF5
IDE0LCAyMDE5IGF0IDA0OjU1OjA1UE0gKzEwMDAsIEJlbiBTa2VnZ3Mgd3JvdGU6Cj4gPiA+IE9u
IFN1biwgMTIgTWF5IDIwMTkgYXQgMDQ6MjMsIFBldGVyaXMgUnVkenVzaWtzCj4gPiA+IDxwZXRl
cmlzLnJ1ZHp1c2lrc0BnbWFpbC5jb20+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4gbnY1MF9oZWFk
X2F0b21pY19kdXBsaWNhdGVfc3RhdGUoKSBtYWtlcyBhIGNvcHkgb2YgbnY1MF9oZWFkX2F0b20K
PiA+ID4gPiBzdHJ1Y3QuIFRoaXMgcGF0Y2ggYWRkcyBjb3B5aW5nIG9mIHN0cnVjdCBtZW1iZXIg
bmFtZWQgIm9yIiwgd2hpY2gKPiA+ID4gPiBwcmV2aW91c2x5IHdhcyBsZWZ0IHVuaW5pdGlhbGl6
ZWQgaW4gdGhlIGR1cGxpY2F0ZWQgc3RydWN0dXJlLgo+ID4gPiA+Cj4gPiA+ID4gRHVlIHRvIHRo
aXMgYnVnLCBpbmNvcnJlY3QgbmhzeW5jIGFuZCBudnN5bmMgdmFsdWVzIHdlcmUgc29tZXRpbWVz
IHVzZWQuCj4gPiA+ID4gSW4gbXkgcGFydGljdWxhciBjYXNlLCB0aGF0IGxlYWQgdG8gYSBtaXNt
YXRjaCBiZXR3ZWVuIHRoZSBvdXRwdXQKPiA+ID4gPiByZXNvbHV0aW9uIG9mIHRoZSBncmFwaGlj
cyBkZXZpY2UgKEdlRm9yY2UgR1QgNjMwIE9FTSkgYW5kIHRoZSByZXBvcnRlZAo+ID4gPiA+IGlu
cHV0IHNpZ25hbCByZXNvbHV0aW9uIG9uIHRoZSBkaXNwbGF5LiB4cmFuZHIgcmVwb3J0ZWQgMTY4
MHgxMDUwLCBidXQKPiA+ID4gPiB0aGUgZGlzcGxheSByZXBvcnRlZCAxMjgweDEwMjQuIEFzIGEg
cmVzdWx0IG9mIHRoaXMgbWlzbWF0Y2gsIHRoZSBvdXRwdXQKPiA+ID4gPiBvbiB0aGUgZGlzcGxh
eSBsb29rZWQgbGlrZSBpdCB3YXMgY3JvcHBlZCAob25seSBwYXJ0IG9mIHRoZSBvdXRwdXQgd2Fz
Cj4gPiA+ID4gYWN0dWFsbHkgdmlzaWJsZSBvbiB0aGUgZGlzcGxheSkuCj4gPiA+ID4KPiA+ID4g
PiBnaXQgYmlzZWN0IHBvaW50ZWQgdG8gY29tbWl0IDJjYTdmYjVjMWNjNiAoImRybS9ub3V2ZWF1
L2ttcy9udjUwOiBoYW5kbGUKPiA+ID4gPiBTZXRDb250cm9sT3V0cHV0UmVzb3VyY2UgZnJvbSBo
ZWFkIiksIHdoaWNoIGFkZGVkIHRoZSBtZW1iZXIgIm9yIiB0bwo+ID4gPiA+IG52NTBfaGVhZF9h
dG9tIHN0cnVjdHVyZSwgYnV0IGZvcmdvdCB0byBjb3B5IGl0IGluCj4gPiA+ID4gbnY1MF9oZWFk
X2F0b21pY19kdXBsaWNhdGVfc3RhdGUoKS4KPiA+ID4gPgo+ID4gPiA+IEZpeGVzOiAyY2E3ZmI1
YzFjYzYgKCJkcm0vbm91dmVhdS9rbXMvbnY1MDogaGFuZGxlIFNldENvbnRyb2xPdXRwdXRSZXNv
dXJjZSBmcm9tIGhlYWQiKQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFBldGVyaXMgUnVkenVzaWtz
IDxwZXRlcmlzLnJ1ZHp1c2lrc0BnbWFpbC5jb20+Cj4gPiA+IE9vcHMsIG5pY2UgY2F0Y2guICBU
aGFuayB5b3UgZm9yIHRoaXMsIEkndmUgbWVyZ2VkIGl0IGluIG15IHRyZWUgYW5kCj4gPiA+IHdp
bGwgZ2V0IGl0IHVwc3RyZWFtIEFTQVAuCj4gPiA+Cj4gPiA+IFRoYW5rcywKPiA+ID4gQmVuLgo+
ID4gPgo+ID4gSGkgQmVuLAo+ID4KPiA+IFRoYW5rIHlvdSBmb3IgdGFraW5nIHRoZSB0aW1lIHRv
IHJldmlldyBhbmQgbWVyZ2UgdGhpcyBwYXRjaC4KPiA+Cj4gPiBJJ20gbmV3IHRvIHRoZSBMaW51
eCBrZXJuZWwgZGV2ZWxvcG1lbnQgcHJvY2Vzcywgc28gSSBhbSBub3Qgc3VyZSB3aGF0Cj4gPiBo
YXBwZW5zIG5leHQuIERvZXMgaW5jbHVzaW9uIGluIHlvdXIgdHJlZSBpbXBseSB0aGF0IHRoaXMg
Zml4IHdpbGwgZW5kCj4gPiB1cCBpbiBzb21lIChtb3N0IGxpa2VseSAtIG5leHQpIG1haW5saW5l
IGtlcm5lbD8gV2lsbCBpdCBhbHNvIGJlCj4gPiBiYWNrcG9ydGVkIHRvIDQuMTkgTFRTIGJyYW5j
aD8KPiA+Cj4gPiBUaGlzIGJ1ZyBhZmZlY3RzIGFsbCBrZXJuZWwgdmVyc2lvbnMgc3RhcnRpbmcg
ZnJvbSB2NC4xOC4gUHJvYmFibHkgbm90Cj4gPiB0aGF0IG1hbnkgc3lzdGVtcyB0aG91Z2guCj4g
Cj4gQmVuIHN1Ym1pdHMgYSBwdWxsIHJlcXVlc3QgdG8gRGF2ZSBBaXJsaWUgKGRybSBtYWludGFp
bmVyKSwgYW5kIERhdmUKPiBzdWJtaXRzIG9uZSB0byBMaW51cyBmb3IgaW5jbHVzaW9uIGluIHRo
ZSAib2ZmaWNpYWwiIHVwc3RyZWFtCj4gcmVwb3NpdG9yeS4gRGF2ZSBqdXN0IHNlbnQgYSBwdWxs
IHJlcXVlc3QgdG8gTGludXMsIHdobyB1c3VhbGx5IHBpY2tzCj4gdGhlc2UgdXAgd2l0aGluIGEg
ZmV3IGRheXMgKGV4Y2VwdGlvbnMgYXBwbHkpLgo+IAo+IE9uY2UgaW4gdGhlIG1haW5saW5lIHRy
ZWUsIHRoZSAiRml4ZXMiIHRhZyBpcyBsaWtlbHkgdG8gY2F1c2UgaXQgdG8KPiBnZXQgcGlja2Vk
IHVwIGZvciBzdGFibGUuIFlvdSBjYW4gYWxzbyBub21pbmF0ZSBpdCBmb3Igc3RhYmxlIGtlcm5l
bAo+IGJyYW5jaCBpbmNsdXNpb24gZXhwbGljaXRseSAodGhlcmUgYXJlIGluc3RydWN0aW9ucyBz
b21ld2hlcmUsIGJ1dAo+IGJhc2ljYWxseSB5b3Ugc2VuZCBhbiBlbWFpbCB0byBzb21lIGxpc3Qg
c2F5aW5nICJwbGVhc2UgaW5jbHVkZSBjb21taXQKPiBBQkMgaW4ga2VybmVscyBYWVoiKS4KPiAK
PiBXaGF0IFVidW50dSBzaGlwcyBpcywgdWx0aW1hdGVseSwgdXAgdG8gVWJ1bnR1LiBUaGV5IHdp
bGwsIGhvd2V2ZXIsCj4gZnJlcXVlbnRseSBmb2xsb3cgdGhlIHN0YWJsZSBrZXJuZWwgYnJhbmNo
ZXMsIGFuZCBsaXN0ZW4gdG8gdGhlIGxpc3QKPiBhYm92ZSBhcyB3ZWxsLgo+IAo+IEhvcGUgdGhp
cyBoZWxwcywKPiAKPiAgIC1pbGlhCgpUaGFua3MgZm9yIGV4cGxhaW5nIHRoaXMuIEknbGwgd2Fp
dCBhbmQgc2VlIGlmIHRoaXMgcGF0Y2ggZ2V0cyBpbmNsdWRlZAppbiBzdGFibGUgcmVsZWFzZXMg
d2l0aG91dCBleHBsaWNpdGx5IGFza2luZyBmb3IgaXQuCgpSZWdhcmRzLApQZXRlcmlzCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
