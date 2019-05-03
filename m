Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A687127F6
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 08:48:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 206FB89565;
	Fri,  3 May 2019 06:48:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0D3C89565
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 06:48:42 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id b1so4418077otp.5
 for <dri-devel@lists.freedesktop.org>; Thu, 02 May 2019 23:48:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B/vgrL6mFJjbubEtdk9xy4dCVOTfDfNigFjtHMJz6Hg=;
 b=eTI5ompclD7JuhLPkxKYr9+n/71oNagBtsPCR2pV2EaE4m7jVS3C9aNgoyRH/B44oE
 LIUscSXaJdim0s1kA/+xOp6JIhDqy6AAwf9JWzLPpDB3obekOWsW9S1Uys1wn9wZbbmr
 il4aCeG8fZRGs1+5UFiDWsD5OREtdO10zTMiuKNesOtCelz7tgO0xMM7p52zoa+WfqTv
 vJ4SNjlxGAZwjlrsmPpV6C5YpxhcqYgQgRjzd276KFrzAPnD3fcN57SWxxaZT92YOQc+
 mZRrP9/rfn3W3JoIg0WMud5Z9yh4V88wi/KBgtjC7SyxAnGTXXARxzLSE/VHJH8u4l+G
 0ArQ==
X-Gm-Message-State: APjAAAVWovwBKjCTLLIWHbg8ZKrtBOp/ZwKsTgXC9cEAfBpqYSHpdO5p
 i9guQxByX92JXFvoHNvbn2rJ3yn0bfWeAc80oyWLYw==
X-Google-Smtp-Source: APXvYqyPne+GcGg5xCp23Lwb83V334Sd3k9K4ces08vt/qj/xTxzgyMfUgwlwCqUT5AUGkcD/SfnjL8zKAwKDrfcpHY=
X-Received: by 2002:a9d:5cc3:: with SMTP id r3mr5382470oti.338.1556866121691; 
 Thu, 02 May 2019 23:48:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190501230126.229218-1-brendanhiggins@google.com>
 <20190501230126.229218-9-brendanhiggins@google.com>
 <0a605543-477a-1854-eb35-6e586606889b@deltatee.com>
In-Reply-To: <0a605543-477a-1854-eb35-6e586606889b@deltatee.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Thu, 2 May 2019 23:48:30 -0700
Message-ID: <CAFd5g47hxAd=+72xbPJbWPdZCXRXmtLpsGhUh=zc7MSwfcaGJQ@mail.gmail.com>
Subject: Re: [PATCH v2 08/17] kunit: test: add support for test abort
To: Logan Gunthorpe <logang@deltatee.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=B/vgrL6mFJjbubEtdk9xy4dCVOTfDfNigFjtHMJz6Hg=;
 b=BWFlXcxdKPCg7HeydPM9nymqdJaKu5v0FhgYXNSsx2wC9FgZ6BWl9owIL4tp34RHzV
 0O2CI2x3Gf2dd6TLPVl+UCJIuR6ugbJgNiJ5ahKuIYIQ+IA6TXvM7s76WSfiT5u9UOjU
 BAmfjJWmXXmLvLfanifCHtnmcT9eQgxYIv2/nMEQ/h+Jh7SQ4Wq8KAXXS2vmQSRvUjv3
 lY5jQIBJ2XBRYHgExTQbP6djFMEjOYOf+5XNpdQj+/aplIkBZPZ/tX1ygb8a9ZyYzeEG
 YiV5A2XgkK4p5mdxg0WTkGqiAuXfNRl77gHQcoJRclt/bqm0TtNUGFDJL3udF8SKeGs/
 dUEg==
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
Cc: Petr Mladek <pmladek@suse.com>, linux-doc@vger.kernel.org,
 Amir Goldstein <amir73il@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Sasha Levin <Alexander.Levin@microsoft.com>,
 Michael Ellerman <mpe@ellerman.id.au>, linux-kselftest@vger.kernel.org,
 shuah@kernel.org, linux-nvdimm <linux-nvdimm@lists.01.org>,
 Frank Rowand <frowand.list@gmail.com>, Knut Omang <knut.omang@oracle.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>, wfg@linux.intel.com,
 Joel Stanley <joel@jms.id.au>, David Rientjes <rientjes@google.com>,
 Jeff Dike <jdike@addtoit.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 devicetree <devicetree@vger.kernel.org>, linux-kbuild@vger.kernel.org, "Bird,
 Timothy" <Tim.Bird@sony.com>, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, Julia Lawall <julia.lawall@lip6.fr>,
 Dan Williams <dan.j.williams@intel.com>, kunit-dev@googlegroups.com,
 Richard Weinberger <richard@nod.at>, Stephen Boyd <sboyd@kernel.org>,
 Greg KH <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <keescook@google.com>,
 linux-fsdevel@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXkgMiwgMjAxOSBhdCA4OjE1IFBNIExvZ2FuIEd1bnRob3JwZSA8bG9nYW5nQGRl
bHRhdGVlLmNvbT4gd3JvdGU6Cj4KPgo+Cj4gT24gMjAxOS0wNS0wMSA1OjAxIHAubS4sIEJyZW5k
YW4gSGlnZ2lucyB3cm90ZToKPiA+ICsvKgo+ID4gKyAqIHN0cnVjdCBrdW5pdF90cnlfY2F0Y2gg
LSBwcm92aWRlcyBhIGdlbmVyaWMgd2F5IHRvIHJ1biBjb2RlIHdoaWNoIG1pZ2h0IGZhaWwuCj4g
PiArICogQGNvbnRleHQ6IHVzZWQgdG8gcGFzcyB1c2VyIGRhdGEgdG8gdGhlIHRyeSBhbmQgY2F0
Y2ggZnVuY3Rpb25zLgo+ID4gKyAqCj4gPiArICoga3VuaXRfdHJ5X2NhdGNoIHByb3ZpZGVzIGEg
Z2VuZXJpYywgYXJjaGl0ZWN0dXJlIGluZGVwZW5kZW50IHdheSB0byBleGVjdXRlCj4gPiArICog
YW4gYXJiaXRyYXJ5IGZ1bmN0aW9uIG9mIHR5cGUga3VuaXRfdHJ5X2NhdGNoX2Z1bmNfdCB3aGlj
aCBtYXkgYmFpbCBvdXQgYnkKPiA+ICsgKiBjYWxsaW5nIGt1bml0X3RyeV9jYXRjaF90aHJvdygp
LiBJZiBrdW5pdF90cnlfY2F0Y2hfdGhyb3coKSBpcyBjYWxsZWQsIEB0cnkKPiA+ICsgKiBpcyBz
dG9wcGVkIGF0IHRoZSBzaXRlIG9mIGludm9jYXRpb24gYW5kIEBjYXRjaCBpcyBjYXRjaCBpcyBj
YWxsZWQuCj4KPiBJIGZvdW5kIHNvbWUgb2YgdGhlIEMrKyBjb21wYXJpc29ucyBpbiB0aGlzIHNl
cmllcyBhIGJpdCBkaXN0YXN0ZWZ1bCBidXQKPiB3YXNuJ3QgZ29pbmcgdG8gc2F5IGFueXRoaW5n
IHVudGlsIEkgc2F3IHRoZSB0cnkgY2F0Y2guLi4uIEJ1dCBsb29raW5nCj4gaW50byB0aGUgaW1w
bGVtZW50YXRpb24gaXQncyBqdXN0IGEgdGhyZWFkIHRoYXQgY2FuIGV4aXQgZWFybHkgd2hpY2gK
PiBzZWVtcyBmaW5lIHRvIG1lLiBKdXN0IGEgcG9vciBjaG9pY2Ugb2YgbmFtZSBJIGd1ZXNzLi4u
CgpHdWlsdHkgYXMgY2hhcmdlZCAoSSBoYXZlIGEgbG9uZyBoaXN0b3J5IHdpdGggQysrLCBzb3Jy
eSkuIFdvdWxkIHlvdQpwcmVmZXIgSSBjaGFuZ2VkIHRoZSBuYW1lPyBJIGp1c3QgZmlndXJlZCB0
aGF0IHRyeS1jYXRjaCBpcyBhIGNvbW1vbmx5CnVuZGVyc3Rvb2QgcGF0dGVybiB0aGF0IGRlc2Ny
aWJlcyBleGFjdGx5IHdoYXQgSSBhbSBkb2luZy4KCj4KPiBbc25pcF0KPgo+ID4gK3N0YXRpYyB2
b2lkIF9fbm9yZXR1cm4ga3VuaXRfYWJvcnQoc3RydWN0IGt1bml0ICp0ZXN0KQo+ID4gK3sKPiA+
ICsgICAgIGt1bml0X3NldF9kZWF0aF90ZXN0KHRlc3QsIHRydWUpOwo+ID4gKwo+ID4gKyAgICAg
a3VuaXRfdHJ5X2NhdGNoX3Rocm93KCZ0ZXN0LT50cnlfY2F0Y2gpOwo+ID4gKwo+ID4gKyAgICAg
LyoKPiA+ICsgICAgICAqIFRocm93IGNvdWxkIG5vdCBhYm9ydCBmcm9tIHRlc3QuCj4gPiArICAg
ICAgKgo+ID4gKyAgICAgICogWFhYOiB3ZSBzaG91bGQgbmV2ZXIgcmVhY2ggdGhpcyBsaW5lISBB
cyBrdW5pdF90cnlfY2F0Y2hfdGhyb3cgaXMKPiA+ICsgICAgICAqIG1hcmtlZCBfX25vcmV0dXJu
Lgo+ID4gKyAgICAgICovCj4gPiArICAgICBXQVJOX09OQ0UodHJ1ZSwgIlRocm93IGNvdWxkIG5v
dCBhYm9ydCBmcm9tIHRlc3QhXG4iKTsKPiA+ICt9Cj4gPiArCj4gPiAgaW50IGt1bml0X2luaXRf
dGVzdChzdHJ1Y3Qga3VuaXQgKnRlc3QsIGNvbnN0IGNoYXIgKm5hbWUpCj4gPiAgewo+ID4gICAg
ICAgc3Bpbl9sb2NrX2luaXQoJnRlc3QtPmxvY2spOwo+ID4gQEAgLTc3LDYgKzEwMyw3IEBAIGlu
dCBrdW5pdF9pbml0X3Rlc3Qoc3RydWN0IGt1bml0ICp0ZXN0LCBjb25zdCBjaGFyICpuYW1lKQo+
ID4gICAgICAgdGVzdC0+bmFtZSA9IG5hbWU7Cj4gPiAgICAgICB0ZXN0LT52cHJpbnRrID0ga3Vu
aXRfdnByaW50azsKPiA+ICAgICAgIHRlc3QtPmZhaWwgPSBrdW5pdF9mYWlsOwo+ID4gKyAgICAg
dGVzdC0+YWJvcnQgPSBrdW5pdF9hYm9ydDsKPgo+IFRoZXJlIGFyZSBhIG51bWJlciBvZiB0aGVz
ZSBmdW5jdGlvbiBwb2ludGVycyB3aGljaCBzZWVtIHRvIGJlIHBvaW50bGVzcwo+IHRvIG1lIGFz
IHlvdSBvbmx5IGV2ZXIgc2V0IHRoZW0gdG8gb25lIGZ1bmN0aW9uLiBKdXN0IGNhbGwgdGhlIGZ1
bmN0aW9uCj4gZGlyZWN0bHkuIEFzIGl0IGlzLCBpdCBpcyBhbiB1bm5lY2Vzc2FyeSBpbmRpcmVj
dGlvbiBmb3Igc29tZW9uZSByZWFkaW5nCj4gdGhlIGNvZGUuIElmIGFuZCB3aGVuIHlvdSBoYXZl
IG11bHRpcGxlIGltcGxlbWVudGF0aW9ucyBvZiB0aGUgZnVuY3Rpb24KPiB0aGVuIGFkZCB0aGUg
cG9pbnRlci4gRG9uJ3QgYXNzdW1lIHlvdSdyZSBnb2luZyB0byBuZWVkIGl0IGxhdGVyIG9uIGFu
ZAo+IGFkZCBhbGwgdGhpcyBtYWludGVuYW5jZSBidXJkZW4gaWYgeW91IG5ldmVyIHVzZSBpdC4u
CgpBaCwgeWVzLCBGcmFuayAoYW5kIHByb2JhYmx5IG90aGVycykgcHJldmlvdXNseSBhc2tlZCBt
ZSB0byByZW1vdmUKdW5uZWNlc3NhcnkgbWV0aG9kIHBvaW50ZXJzOyBJIHJlbW92ZWQgYWxsIHRo
ZSB0b3RhbGx5IHVudXNlZCBvbmVzLiBBcwpmb3IgdGhlc2UsIEkgZG9uJ3QgdXNlIHRoZW0gaW4g
dGhpcyBwYXRjaHNldCwgYnV0IEkgdXNlIHRoZW0gaW4gbXkKcGF0Y2hzZXRzIHRoYXQgd2lsbCBm
b2xsb3cgdXAgdGhpcyBvbmUuIFRoZXNlIGluIHBhcnRpY3VsYXIgYXJlCnByZXNlbnQgc28gdGhh
dCB0aGV5IGNhbiBiZSBtb2NrZWQgb3V0IGZvciB0ZXN0aW5nLgoKPgo+IFtzbmlwXQo+Cj4gPiAr
dm9pZCBrdW5pdF9nZW5lcmljX3RyeV9jYXRjaF9pbml0KHN0cnVjdCBrdW5pdF90cnlfY2F0Y2gg
KnRyeV9jYXRjaCkKPiA+ICt7Cj4gPiArICAgICB0cnlfY2F0Y2gtPnJ1biA9IGt1bml0X2dlbmVy
aWNfcnVuX3RyeV9jYXRjaDsKPiA+ICsgICAgIHRyeV9jYXRjaC0+dGhyb3cgPSBrdW5pdF9nZW5l
cmljX3Rocm93Owo+ID4gK30KPgo+IFNhbWUgaGVyZS4gVGhlcmUncyBvbmx5IG9uZSBpbXBsZW1l
bnRhdGlvbiBvZiB0cnlfY2F0Y2ggYW5kIEkgY2FuJ3QKPiByZWFsbHkgc2VlIGFueSBzZW5zaWJs
ZSBqdXN0aWZpY2F0aW9uIGZvciBhbm90aGVyIGltcGxlbWVudGF0aW9uLiBFdmVuCj4gaWYgdGhl
cmUgaXMsIGFkZCB0aGUgaW5kaXJlY3Rpb24gd2hlbiB0aGUgc2Vjb25kIGltcGxlbWVudGF0aW9u
IGlzCj4gYWRkZWQuIFRoaXMgaXNuJ3QgQysrIGFuZCB3ZSBkb24ndCBuZWVkIHRvIG1ha2UgZXZl
cnl0aGluZyBhICJtZXRob2QiLgoKVGhlc2UgbWV0aG9kcyBhcmUgZm9yIGEgVU1MIHNwZWNpZmlj
IGltcGxlbWVudGF0aW9uIGluIGEgZm9sbG93IHVwCnBhdGNoc2V0LCB3aGljaCBpcyBuZWVkZWQg
Zm9yIHNvbWUgZmVhdHVyZXMgbGlrZSBjcmFzaCByZWNvdmVyeSwgZGVhdGgKdGVzdHMsIGFuZCBy
ZW1vdmVzIGRlcGVuZGVuY2Ugb24ga3RocmVhZHMuCgpJIGtub3cgdGhpcyBwcm9iYWJseSBzb3Vu
ZHMgbGlrZSBwcmVtYXR1cmUgY29tcGxleGl0eS4gQXJndWFibHkgaXQgaXMKaW4gaGluZHNpZ2h0
LCBidXQgSSB3cm90ZSB0aG9zZSBmZWF0dXJlcyBiZWZvcmUgSSBwdWxsZWQgb3V0IHRoZXNlCmlu
dGVyZmFjZXMgKHRoZXkgd2VyZSBhY3R1YWxseSBib3RoIG9yaWdpbmFsbHkgaW4gdGhpcyBwYXRj
aHNldCwgYnV0IEkKZHJvcHBlZCB0aGVtIHRvIG1ha2UgdGhpcyBwYXRjaHNldCBlYXNpZXIgdG8g
cmV2aWV3KS4gSSBjYW4gcmVtb3ZlCnRoZXNlIG1ldGhvZHMgYW5kIGFkZCB0aGVtIGJhY2sgaW4g
d2hlbiBJIGFjdHVhbGx5IHVzZSB0aGVtIGluIHRoZQpmb2xsb3cgdXAgcGF0Y2hzZXRzIGlmIHlv
dSBwcmVmZXIuCgpUaGFua3MhCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
