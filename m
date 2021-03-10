Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F12334577
	for <lists+dri-devel@lfdr.de>; Wed, 10 Mar 2021 18:47:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 768536E22B;
	Wed, 10 Mar 2021 17:47:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F7346E22B;
 Wed, 10 Mar 2021 17:47:38 +0000 (UTC)
Date: Wed, 10 Mar 2021 18:47:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1615398456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XVqhHJOY6QvydCCuAwnoK5TKJA34dkf9/Q23ldIBRmI=;
 b=2A1aWkA8UguE1xJWz6OuffjBdFmn/kNQnGXP0O/Nzm5ztoOdGP44iit+jyO3HeZkgcs1gf
 P0Uj8dBSCtAYfw030gb3QircS2Ure8qfqeGEpTMWclVkLcx3am1neaweG3NqDQfsFCefyL
 d7iOqCbotOXKyU+xpCc4nqdp8fp7vL+x8mMyJjvf+bMLbTfX9Vmjn8rrbjeMoEjgIeepn+
 m4qMmnwqf0hKggSLUgKZMsD3o/8PEcTWqkIXhYm8MASLFAw207MFoldHC5IytuJrJOqfEb
 RvR7JsvGAPSou6/2jHwjuU6nsAQZnVGSSfF7MznHtfRb/zmPJM3LhPgQ151WfQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1615398456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XVqhHJOY6QvydCCuAwnoK5TKJA34dkf9/Q23ldIBRmI=;
 b=7aKrywXbag55QgruhWLE6M1mCs9eNiSgixWJbm2Fkr/fC25B6wx+4knwX74Y2/e4UpZmL6
 Hzma9CHfqI+SL0AA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [PATCH v2 0/3] drm/amdgpu: Remove in_interrupt() usage.
Message-ID: <20210310174734.hxzmmn5eo5bc5whb@linutronix.de>
References: <20210209124439.408140-1-bigeasy@linutronix.de>
 <41d0f7db-c2b4-f618-42a7-da9f7cdb76b4@amd.com>
 <20210209165312.bq2yn73fqidt7hgl@linutronix.de>
 <02371b80-667b-81a0-b8d7-7fd085442b1b@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <02371b80-667b-81a0-b8d7-7fd085442b1b@amd.com>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMS0wMi0wOSAxODo0Mzo1NCBbKzAxMDBdLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+
IEhpIFNlYmFzdGlhbiwKSGkgQ2hyaXN0aWFuLAoKPiB0byBiZSBob25lc3QgSSdtIHRoaW5raW5n
IGFib3V0IHRoYXQgZm9yIHF1aXRlIHNvbWUgdGltZSBub3cgYW5kIEkgZG9uJ3QKPiB0aGluayB0
aGF0IHRoaXMgaXMgcG9zc2libGUgd2l0aG91dCBhIHNldmVyZSByZXdyaXRlIG9mIHRoZSBkcml2
ZXIuCj4gCj4gVGhlIHByb2JsZW0gaXMgc2ltcGx5IHRoYXQgd2UgaGF2ZSBhIGxvdCBvZiBmdW5j
dGlvbnMgd2hpY2ggZGVhbCB3aXRoCj4gaGFyZHdhcmUgaGFuZGxpbmcgaW5kZXBlbmRlbnQgb2Yg
dGhlIGNvbnRleHQuIEJ1dCBob3cgcmVnaXN0ZXJzIGFyZSBhY2Nlc3NlZAo+IG5lZWRzIHRvIGJl
IGRpZmZlcmVudCBkZXBlbmRpbmcgaWYgeW91ciBhcmUgaW4gdGhlIGludGVycnVwdCBoYW5kbGVy
IG9yIG5vdC4KPiAKPiBZb3Ugd291bGQgbmVlZCB0byBwdXNoIHRoZSBpbmZvcm1hdGlvbiBpZiB3
ZSBhcmUgY29taW5nIGluIGZyb20gdGhlCj4gaW50ZXJydXB0IGhhbmRsZXIgdGhyb3VnaCBhID4g
MTAgZnVuY3Rpb24gY2FsbHMuCj4gCj4gSSBkb24ndCB0aGluayB0aGF0IHRoaXMgaXMgZmVhc2li
bGUgbm9yIGdvb2QgZGVzaWduLgoKWWVhaCwgdGhhdCBpcyB3aGF0IEkgc2F3IGFuZCBkaWRuJ3Qg
ZXZlbiB0cnkuCgpUaGUgcG9zc2libGUgYmFja3RyYWNlIChhdCB0aGUgYm90dG9tIG9mIHRoaXMg
ZW1haWwpIGlzIHRoaXMgYSBjb3JyZWN0CmFzc3VtcHRpb24/CgpBbm90aGVyIHF1aWNrIHF1ZXN0
aW9uOiBZb3UgYWNrZWQgbXkgdGhyZWUtcGF0Y2ggc2VyaWVzLiBJIGRvbid0IHNlZSBpdAppbiB0
aGUgbmV4dCB0cmVlIGFzIG9mIHRvZGF5LiBJcyB0aGVyZSBhbnl0aGluZyBmb3IgbWUgdG8gZG8/
Cgo+IFJlZ2FyZHMsCj4gQ2hyaXN0aWFuLgo+IAo+IEFtIDA5LjAyLjIxIHVtIDE3OjUzIHNjaHJp
ZWIgU2ViYXN0aWFuIEFuZHJ6ZWogU2lld2lvcjoKPiA+IE9uIDIwMjEtMDItMDkgMTM6NTA6MzEg
WyswMTAwXSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPiA+ID4gUmV2aWV3ZWQtYnk6IENocmlz
dGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4gZm9yIHRoZSBzZXJpZXMuCj4g
PiBUaGFuayB5b3UuCj4gPiBBbnkgY2hhbmNlIHlvdSBjb3VsZCBnaXZlIG1lIGEgaGFuZCB3aXRo
IHRoZSByZW1haW5pbmcgdGhyZWUgdXNlcnMKPiA+IHdpdGhpbiB0aGUgYW1kZ3B1IGRyaXZlcj8g
SSBkb24ndCBrbm93IGlmIHRoZSBpbl9pbnRlcnJ1cHQoKSBjaGVjayBjYW4KPiA+IGJlIGxpbWl0
ZWQgdG8gY2VydGFpbiBjYWxsZXJzLgo+ID4gV2hhdCBJIG5vdGljZWQgd2hpbGUgdHJhY2luZyB2
NS4xMCBpcyB0aGlzOgo+ID4gCj4gPiB8ICAgICAgICAgICAgIFhvcmctMjI1NyAgICBbMDA3XSBk
Li4uIDU3MjYxLjYyMDA0MzogYW1kZ3B1X2RldmljZV93cmVnOiAweDY5OWYsIDB4MDAwMDFiY2Ys
IDB4MDAwMDAxMDAKPiA+IHwgID0+IHRyYWNlX2V2ZW50X3Jhd19ldmVudF9hbWRncHVfZGV2aWNl
X3dyZWcKPiA+IHwgID0+IGFtZGdwdV9kZXZpY2Vfd3JlZy5wYXJ0LjAKPiA+IHwgID0+IGRjZTEx
MF9hcm1fdmVydF9pbnRyCj4gPiB8ICA9PiBkY2UxMTBfdmJsYW5rX3NldAo+ID4gfCAgPT4gZG1f
ZW5hYmxlX3ZibGFuawo+ID4gfCAgPT4gZHJtX3ZibGFua19lbmFibGUKPiA+IHwgID0+IGRybV92
YmxhbmtfZ2V0Cj4gPiB8ICA9PiBkcm1fd2FpdF92YmxhbmtfaW9jdGwKPiA+IHwgID0+IGRybV9p
b2N0bF9rZXJuZWwKPiA+IHwgID0+IGRybV9pb2N0bAo+ID4gfCAgPT4gYW1kZ3B1X2RybV9pb2N0
bAo+ID4gfCAgPT4gX194NjRfc3lzX2lvY3RsCj4gPiB8ICA9PiBkb19zeXNjYWxsXzY0Cj4gPiB8
ICA9PiBlbnRyeV9TWVNDQUxMXzY0X2FmdGVyX2h3ZnJhbWUKPiA+IAo+ID4gSSB0aGluayB0aGF0
IGFtZGdwdV9kZXZpY2Vfd3JlZygpIC0+IGFtZGdwdV9raXFfd3JlZygpIGNvdWxkIGJlIGludm9r
ZWQuCj4gPiBJdCBkb2Vzbid0IGhlcmUgYmVjYXVzZSBhbWRncHVfc3Jpb3ZfcnVudGltZSgpIGlz
IGZhbHNlLgo+ID4gVGhlIHRyYWNlIHNheXMgYGQnIHdoaWNoIG1lYW5zIGludGVycnVwdHMgYXJl
IGRpc2FibGVkIGJ1dAo+ID4gaW5faW50ZXJydXB0KCkgd2lsbCByZXR1cm4gZmFsc2UgaW4gdGhp
cyBjYXNlIChubyBJUlEvc29mdGlycSkuCj4gPiAKPiA+IFNlYmFzdGlhbgoKU2ViYXN0aWFuCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
