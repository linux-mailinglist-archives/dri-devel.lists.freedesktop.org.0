Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 749F22ADCA5
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 18:11:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87EB389ACD;
	Tue, 10 Nov 2020 17:11:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCA8489ACD
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 17:11:20 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id t143so15132334oif.10
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 09:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2YE8PW00M4ejuCmZDFLMahPMB9ZYPthop7kZHPvYCYk=;
 b=KynJmFyV70lpzyel3LXs/lZqT13OnFOi3YKxyNe+BEP+qcktqHy2kozPecOILoO2YG
 Zc+TOep3mAyuVD6bI7MioLPi6lwyuZZJKW4j2jh0GN3JXPnTUcmqrP4PcQYpG60WRSoj
 rWMBfkW3fcB50syEgDtZJxCo8iD+xUPVrCxLU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2YE8PW00M4ejuCmZDFLMahPMB9ZYPthop7kZHPvYCYk=;
 b=AS2MF7rorvz6ilxFpAzlMGTHsbOQvG+L4v7D3pHsD2LGgv+9nLdBih6uP8fOdx9xdo
 N5j+Gv8SViL1VOA0tUoL1EUeE+HsicmRECCNE2d100eWBPhFU2L6XSIrj+RNYWB/ZWLX
 dBb/h+etZRfelXIrmZ6byQxJTsEiRcyEL+Wm/TZzojOd0bZhoXUjxRWdr6FxU6LySJuV
 DE3X/8YGsrpzcf4As9awio1+GYZwie14vn/0QOMXmFfX8QAJbAKjmk43HBjZxzVs7+jt
 CP6ZK0v/QgjZFmUvzeIOxk4dOY4qSFyM3nTgx07Vl+U5+lVh8q7XB1C2ZIasXs787Hsd
 SXBQ==
X-Gm-Message-State: AOAM530ZVf2yTXI/NvW9SyERqCq9rU3gBTYF+CBZDiFhadppyMjMgUw+
 zlu33LDn/QWmWE4ZvCwwGOvqUULiUPKNcZh4qRoONg==
X-Google-Smtp-Source: ABdhPJwWm3aSeVV4kUyEwJI1JkQKkKyEqXGRiIUR6IxB7JGE/2gd3QR0Zb43iJZu9c4YHMAMslRE9dHMLh6Pk/ur1Pg=
X-Received: by 2002:aca:4f14:: with SMTP id d20mr81548oib.14.1605028280098;
 Tue, 10 Nov 2020 09:11:20 -0800 (PST)
MIME-Version: 1.0
References: <20201109005432.861936-2-airlied@gmail.com>
 <9fdcf880-be1a-5803-3e54-14a9910a91b7@amd.com>
 <20201109151650.GE6112@intel.com>
 <bec6848c-3ad5-41ca-d424-669a6797b972@amd.com>
 <20201109161825.GG6112@intel.com>
 <dfd0e641-392b-cab2-05d1-ae466ae08ba8@amd.com>
 <20201109164301.GI6112@intel.com>
 <a0179f84-8890-e694-b94c-dbe93605ace5@amd.com>
 <20201109212731.GQ6112@intel.com>
 <CAPM=9tyHOoQwhpfAtjREK6mg6zbmNkBuPGYVUpuv8MpP9UDXgA@mail.gmail.com>
 <20201110154759.GR6112@intel.com>
In-Reply-To: <20201110154759.GR6112@intel.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 10 Nov 2020 18:11:08 +0100
Message-ID: <CAKMK7uFXC3S3ZcciUr4Fo82_fTRAruo9OiNQEXxXBeiU4LTwjA@mail.gmail.com>
Subject: Re: [PATCH 1/4] drm/ttm: add multihop infrastrucutre (v2)
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMTAsIDIwMjAgYXQgNDo0OCBQTSBWaWxsZSBTeXJqw6Rsw6QKPHZpbGxlLnN5
cmphbGFAbGludXguaW50ZWwuY29tPiB3cm90ZToKPgo+IE9uIFR1ZSwgTm92IDEwLCAyMDIwIGF0
IDAzOjI0OjMyUE0gKzEwMDAsIERhdmUgQWlybGllIHdyb3RlOgo+ID4gT24gVHVlLCAxMCBOb3Yg
MjAyMCBhdCAwNzoyNywgVmlsbGUgU3lyasOkbMOkCj4gPiA8dmlsbGUuc3lyamFsYUBsaW51eC5p
bnRlbC5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiBPbiBNb24sIE5vdiAwOSwgMjAyMCBhdCAwOTo0
ODowNFBNICswMTAwLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+ID4gPiA+IEFtIDA5LjExLjIw
IHVtIDE3OjQzIHNjaHJpZWIgVmlsbGUgU3lyasOkbMOkOgo+ID4gPiA+ID4gT24gTW9uLCBOb3Yg
MDksIDIwMjAgYXQgMDU6MjA6MTdQTSArMDEwMCwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPiA+
ID4gPiA+PiBBbSAwOS4xMS4yMCB1bSAxNzoxOCBzY2hyaWViIFZpbGxlIFN5cmrDpGzDpDoKPiA+
ID4gPiA+Pj4gT24gTW9uLCBOb3YgMDksIDIwMjAgYXQgMDQ6NTc6MjlQTSArMDEwMCwgQ2hyaXN0
aWFuIEvDtm5pZyB3cm90ZToKPiA+ID4gPiA+Pj4+IEFtIDA5LjExLjIwIHVtIDE2OjE2IHNjaHJp
ZWIgVmlsbGUgU3lyasOkbMOkOgo+ID4gPiA+ID4+Pj4+IE9uIFdlZCwgTm92IDExLCAyMDIwIGF0
IDA2OjEzOjAyUE0gKzAxMDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4gPiA+ID4gPj4+Pj4+
IEFtIDA5LjExLjIwIHVtIDAxOjU0IHNjaHJpZWIgRGF2ZSBBaXJsaWU6Cj4gPiA+ID4gPj4+Pj4+
PiBAQCAtMTQzMiwxNSArMTQ3OSwxOCBAQCBpbnQgdHRtX2JvX3N3YXBvdXQoc3RydWN0IHR0bV9v
cGVyYXRpb25fY3R4ICpjdHgpCj4gPiA+ID4gPj4+Pj4+PiAgICAgICBpZiAoYm8tPm1lbS5tZW1f
dHlwZSAhPSBUVE1fUExfU1lTVEVNKSB7Cj4gPiA+ID4gPj4+Pj4+PiAgICAgICAgICAgICAgIHN0
cnVjdCB0dG1fb3BlcmF0aW9uX2N0eCBjdHggPSB7IGZhbHNlLCBmYWxzZSB9Owo+ID4gPiA+ID4+
Pj4+Pj4gICAgICAgICAgICAgICBzdHJ1Y3QgdHRtX3Jlc291cmNlIGV2aWN0X21lbTsKPiA+ID4g
PiA+Pj4+Pj4+ICsgICAgICAgICAgICAgc3RydWN0IHR0bV9wbGFjZSBob3AgPSB7fTsKPiA+ID4g
PiA+Pj4+Pj4gUGxlYXNlIGFsd2F5cyB1c2UgbWVtc2V0KCkgaWYgeW91IHdhbnQgdG8gemVybyBp
bml0aWFsaXplIHNvbWV0aGluZyBpbgo+ID4gPiA+ID4+Pj4+PiB0aGUga2VybmVsLCB3ZSBoYWQg
ZW5vdWdoIHRyb3VibGUgd2l0aCB0aGF0Lgo+ID4gPiA+ID4+Pj4+IFdoYXQgdHJvdWJsZSBpcyB0
aGF0PyBJJ3ZlIG5vdCBoZWFyZCBvZiBhbnl0aGluZywgYW5kIHdlIHVzZQo+ID4gPiA+ID4+Pj4+
ID17fSBxdWl0ZSBleHRlbnNpdmVseSBpbiBkcm0gbGFuZC4KPiA+ID4gPiA+Pj4+ID17fSBpbml0
aWFsaXplcyBvbmx5IG5hbWVkIGZpZWxkcywgbm90IHBhZGRpbmcuCj4gPiA+ID4gPj4+IEhhcyB0
aGF0IGFjdHVhbGx5IGhhcHBlbmVkPwo+ID4gPiA+ID4+IFlFUyEgTnVtZXJvdXMgdGltZXMhCj4g
PiA+ID4gPiBZb3Ugd291bGRuJ3QgaGFwcGVuIHRvIGhhdmUgbGlua3MvZXRjLiB0byB0aGUgZGlz
Y3Vzc2lvbj8KPiA+ID4gPiA+IEknZCBsaWtlIHRvIGNoZWNrIHRoZW0gb3V0Lgo+ID4gPiA+Cj4g
PiA+ID4gVWZmLCB0aGF0IHdhcyB5ZWFycyBhZ28uIEp1c3QgZ29vZ2xlIGZvciBzb21ldGhpbmcg
bGlrZSAibWVzYSBtZW1zZXQKPiA+ID4gPiBoYXNoIiwgdGhlcmUgd2FzIHJlY2VudGx5ICh+IHRo
ZSBsYXN0IHllYXIpIGFub3RoZXIgZGlzY3Vzc2lvbiBiZWNhdXNlCj4gPiA+ID4gc29tZWJvZHkg
cmFuIGludG8gZXhhY3RseSB0aGF0IHByb2JsZW0gb25jZSBtb3JlLgo+ID4gPgo+ID4gPiBGb3Vu
ZCB0aGlzOgo+ID4gPiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvbWVzYS9tZXNhLy0v
aXNzdWVzLzIwNzEKPiA+ID4gd2hpY2ggZG9lcyBzdXByaXNlIG1lIGEgYml0LiBUaG91Z2ggSSBz
dXNwZWN0ID17fSBtaWdodAo+ID4gPiBiZWhhdmUgZGlmZmVyZW50bHkgc2luY2UgdGhlIGNvbXBp
bGVyIG1pZ2h0IHRyZWF0IGl0Cj4gPiA+IG1vcmUgbGlrZSBhIG1lbXNldCgpLgo+ID4KPiA+IEl0
IGRvZXNuJ3QgdGhlcmUncyBhIGJpdCBvZiBpbmZvIG91dCB0aGVyZSBvbiB3aGF0IGhhcHBlbnMs
IGl0IHJlYWxseQo+ID4gb25seSBtYXR0ZXJzIGZvciBzdHJ1Y3RzIHdlIGFyZSBwYXNzaW5nIHRv
IHVzZXJzcGFjZSwgYnV0IGl0J3MKPiA+IHVubGlrZWx5IHRvIG1hdHRlciBoZXJlLAo+ID4gYnV0
IEkndmUgY2hhbmdlZCB0aGlzIHRvIG1lbXNldCBpbiBteSBsb2NhbCB0cmVlLCBiZWNhdXNlIHdo
eSBub3QuCj4KPiBTdHJ1Y3RzIHBhc3NlZCB0byB1c2Vyc3BhY2Ugc2hvdWxkIHJlYWxseSBoYXZl
IG5vIGltcGxpY2l0IHBhZGRpbmcuCj4gT25lIG9mIHRob3NlIGhvdyB0byBib3RjaCB5b3VyIGlv
Y3RsIHRoaW5ncy4uLgo+Cj4gVGhlIG1haW4gcHJvYmxlbXMgd2l0aCBtZW1zZXQoKSBhcmU6Cj4g
LSBpdCdzIHVnbHkKPiAtIHBlb3BsZSBvZnRlbiBnZXQgdGhlIHNpemVvZiB3cm9uZwo+Cj4gSSBn
dWVzcyB0aGUgbGF0dGVyIGNvdWxkIGJlIGFsbGV2aWF0ZWQgd2l0aCBhIGNwcCBtYWNybyB0aGF0
Cj4gZG9lcyB0aGUgc2l6ZW9mIGNvcnJlY3RseSBmb3IgeW91LgoKWWVhaCBpbW8gbm90IHVzaW5n
ID0ge30gYW5kIGluc3RlYWQgaW5zaXN0aW5nIG9uIG1lbXNldCBpcyByZWFsbHkgYmFkCncvYSBm
b3Igbm90IHBhZGRpbmcgeW91ciBhcGkgc3RydWN0cyBwcm9wZXJseS4gbWVtc2V0IGlzIG9ubHkg
b25lCnBsYWNlIHdoZXJlIHRoaXMgZ29lcyBob3JyaWJseSB3cm9uZy4KCkkgdGhpbmsgZm9yIHRo
ZSBnYWxsaXVtIHN0YXRlIHRyYWNrZXIgaGFzaW5nIGlzc3VlIG1lbXNldCBpcyBwcm9iYWJseQpv
ayBvdCB1c2UgZm9yIHRoZXNlIHNwZWNpZmljYWxseSwgd2l0aCBhIGJpZyBjb21tZW50IGV4cGxh
aW5pbmcgd2h5LgpBbmQgc29tZSBjb2RlIGFzc3VyYW5jZSB0aGF0IHRoZSBtZW1zZXQgaXMgdGhl
IHNhbWUgbGVuZ3RoIHlvdSdyZQpwYXNzaW5nIHRvIHRoZSBjcmMgZnVuY3Rpb24gYW5kIGFsbCB0
aGF0LiBCdXQgYW55d2hlcmUgd2VyZSBpdCdzIG1vcmUKKGxpa2UgYW55dGhpbmcgcmVsYXRlZCB0
byBhcGksIHdoaWNoIHRoZSBnYWxsaXVtIENTTyBoYXNoaW5nIGlzbnQpIHlvdQpyZWFsbHkgd2Fu
dCB0byBoYXZlIG5vIGltcGxpY2l0IGhvbGVzIGF0IGFsbC4KLURhbmllbAotLSAKRGFuaWVsIFZl
dHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3
bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
