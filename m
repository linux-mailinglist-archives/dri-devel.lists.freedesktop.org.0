Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ACE94A53D
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 17:22:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 792E66E17E;
	Tue, 18 Jun 2019 15:22:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C49F36E182
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 15:22:19 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id e3so22237762edr.10
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 08:22:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=E/qk0N+cIbM6HKj1qhjne1NfpocVmMqaX5q+/tL+ueI=;
 b=fwu+pvxlDJb+5VdxokOQpCxLwBqzSWw8Ccbw9yZn6gka8ZsO2Tqpv+EKokZC7VUijM
 zpADvpM9jnhVBd+F5Or0XYxLbjyMd3+QPPbIgd/EkEScAataT2l6z8ffiBjkD3vbPPCU
 gog2H9kvC9qQZu6D1n+jIC6OuTOBd4guHr8Qnrvb1BaEkzaTBDrY7gnTPZZgU2Uod7HT
 7UYg/DwIL5itL9twQGKM4bbi/4NVnKDx5sNDSW5M9Zy4qZ2cYfSy/yAZXxFqHEbsV18O
 fZwyBLljGJSxB/cUQYVkUvg9yH94iO/olKB15lwoN8LENZ743xWLMk0gzPlmzGSukZj2
 WZ1g==
X-Gm-Message-State: APjAAAVaq6GhWbYjJyLM7SAQv0IRCM5FLW2z13lGLQZc2tL8CTuDX8Rw
 hwTO4LqGzKfvkxbRa19KTVYiVA==
X-Google-Smtp-Source: APXvYqwy35fNeHyWQSb1sdW5IH38w+mc35q9rAaNur5D3Zl1Sv5PQx84zYiDMSvgBUjPLKdZDrkeAA==
X-Received: by 2002:a50:8825:: with SMTP id b34mr48288557edb.22.1560871338412; 
 Tue, 18 Jun 2019 08:22:18 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id 9sm1439769ejg.49.2019.06.18.08.22.16
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 18 Jun 2019 08:22:17 -0700 (PDT)
Date: Tue, 18 Jun 2019 17:22:15 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jerome Glisse <jglisse@redhat.com>
Subject: Re: [PATCH 1/4] mm: Check if mmu notifier callbacks are allowed to
 fail
Message-ID: <20190618152215.GG12905@phenom.ffwll.local>
Mail-Followup-To: Jerome Glisse <jglisse@redhat.com>,
 Michal Hocko <mhocko@suse.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>, David Rientjes <rientjes@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
References: <20190520213945.17046-1-daniel.vetter@ffwll.ch>
 <20190521154411.GD3836@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190521154411.GD3836@redhat.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=E/qk0N+cIbM6HKj1qhjne1NfpocVmMqaX5q+/tL+ueI=;
 b=S0baOBWqecd8R9Fv9S0yBSLlPx0B4vYX0TvI7oaRAzSf4d2jvMU2DZNwb2RG3dYdoB
 4+rZlzI6OA2RQxSWsdDqUVmzxXcyYpc2/nLIKI8MXqYfLfBjl7BetsvlRKqBiD5NuAUg
 AXHEz2PEzrj8GeuDgxkf0L8t0EXnxlWwtpkRw=
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
Cc: Michal Hocko <mhocko@suse.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>, Paolo Bonzini <pbonzini@redhat.com>,
 David Rientjes <rientjes@google.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXkgMjEsIDIwMTkgYXQgMTE6NDQ6MTFBTSAtMDQwMCwgSmVyb21lIEdsaXNzZSB3
cm90ZToKPiBPbiBNb24sIE1heSAyMCwgMjAxOSBhdCAxMTozOTo0MlBNICswMjAwLCBEYW5pZWwg
VmV0dGVyIHdyb3RlOgo+ID4gSnVzdCBhIGJpdCBvZiBwYXJhbm9pYSwgc2luY2UgaWYgd2Ugc3Rh
cnQgcHVzaGluZyB0aGlzIGRlZXAgaW50bwo+ID4gY2FsbGNoYWlucyBpdCdzIGhhcmQgdG8gc3Bv
dCBhbGwgcGxhY2VzIHdoZXJlIGFuIG1tdSBub3RpZmllcgo+ID4gaW1wbGVtZW50YXRpb24gbWln
aHQgZmFpbCB3aGVuIGl0J3Mgbm90IGFsbG93ZWQgdG8uCj4gPiAKPiA+IEluc3BpcmVkIGJ5IHNv
bWUgY29uZnVzaW9uIHdlIGhhZCBkaXNjdXNzaW5nIGk5MTUgbW11IG5vdGlmaWVycyBhbmQKPiA+
IHdoZXRoZXIgd2UgY291bGQgdXNlIHRoZSBuZXdseS1pbnRyb2R1Y2VkIHJldHVybiB2YWx1ZSB0
byBoYW5kbGUgc29tZQo+ID4gY29ybmVyIGNhc2VzLiBVbnRpbCB3ZSByZWFsaXplZCB0aGF0IHRo
ZXNlIGFyZSBvbmx5IGZvciB3aGVuIGEgdGFzawo+ID4gaGFzIGJlZW4ga2lsbGVkIGJ5IHRoZSBv
b20gcmVhcGVyLgo+ID4gCj4gPiBBbiBhbHRlcm5hdGl2ZSBhcHByb2FjaCB3b3VsZCBiZSB0byBz
cGxpdCB0aGUgY2FsbGJhY2sgaW50byB0d28KPiA+IHZlcnNpb25zLCBvbmUgd2l0aCB0aGUgaW50
IHJldHVybiB2YWx1ZSwgYW5kIHRoZSBvdGhlciB3aXRoIHZvaWQKPiA+IHJldHVybiB2YWx1ZSBs
aWtlIGluIG9sZGVyIGtlcm5lbHMuIEJ1dCB0aGF0J3MgYSBsb3QgbW9yZSBjaHVybiBmb3IKPiA+
IGZhaXJseSBsaXR0bGUgZ2FpbiBJIHRoaW5rLgo+ID4gCj4gPiBTdW1tYXJ5IGZyb20gdGhlIG0t
bCBkaXNjdXNzaW9uIG9uIHdoeSB3ZSB3YW50IHNvbWV0aGluZyBhdCB3YXJuaW5nCj4gPiBsZXZl
bDogVGhpcyBhbGxvd3MgYXV0b21hdGVkIHRvb2xpbmcgaW4gQ0kgdG8gY2F0Y2ggYnVncyB3aXRo
b3V0Cj4gPiBodW1hbnMgaGF2aW5nIHRvIGxvb2sgYXQgZXZlcnl0aGluZy4gSWYgd2UganVzdCB1
cGdyYWRlIHRoZSBleGlzdGluZwo+ID4gcHJfaW5mbyB0byBhIHByX3dhcm4sIHRoZW4gd2UnbGwg
aGF2ZSBmYWxzZSBwb3NpdGl2ZXMuIEFuZCBhcy1pcywgbm8KPiA+IG9uZSB3aWxsIGV2ZXIgc3Bv
dCB0aGUgcHJvYmxlbSBzaW5jZSBpdCdzIGxvc3QgaW4gdGhlIG1hc3NpdmUgYW1vdW50cwo+ID4g
b2Ygb3ZlcmFsbCBkbWVzZyBub2lzZS4KPiA+IAo+ID4gdjI6IERyb3AgdGhlIGZ1bGwgV0FSTl9P
TiBiYWNrdHJhY2UgaW4gZmF2b3VyIG9mIGp1c3QgYSBwcl93YXJuIGZvcgo+ID4gdGhlIHByb2Js
ZW1hdGljIGNhc2UgKE1pY2hhbCBIb2NrbykuCj4gPiAKPiA+IHYzOiBSZWJhc2Ugb24gdG9wIG9m
IEdsaXNzZSdzIGFyZyByZXdvcmsuCj4gPiAKPiA+IHY0OiBNb3JlIHJlYmFzZSBvbiB0b3Agb2Yg
R2xpc3NlIHJld29ya2luZyBldmVyeXRoaW5nLgo+ID4gCj4gPiBDYzogQW5kcmV3IE1vcnRvbiA8
YWtwbUBsaW51eC1mb3VuZGF0aW9uLm9yZz4KPiA+IENjOiBNaWNoYWwgSG9ja28gPG1ob2Nrb0Bz
dXNlLmNvbT4KPiA+IENjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1k
LmNvbT4KPiA+IENjOiBEYXZpZCBSaWVudGplcyA8cmllbnRqZXNAZ29vZ2xlLmNvbT4KPiA+IENj
OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgo+ID4gQ2M6ICJKw6lyw7Rt
ZSBHbGlzc2UiIDxqZ2xpc3NlQHJlZGhhdC5jb20+Cj4gPiBDYzogbGludXgtbW1Aa3ZhY2sub3Jn
Cj4gPiBDYzogUGFvbG8gQm9uemluaSA8cGJvbnppbmlAcmVkaGF0LmNvbT4KPiA+IFJldmlld2Vk
LWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KPiAKPiBS
ZXZpZXdlZC1ieTogSsOpcsO0bWUgR2xpc3NlIDxqZ2xpc3NlQHJlZGhhdC5jb20+CgotbW0gZm9s
a3MsIGlzIHRoaXMgKGVudGlyZSBzZXJpZXMgb2YgNCBwYXRjaGVzKSBwbGFubmVkIHRvIGxhbmQg
aW4gdGhlIDUuMwptZXJnZSB3aW5kb3c/IE9yIGRvIHlvdSB3YW50IG1vcmUgcmV2aWV3cy90ZXN0
aW5nL3BvbGlzaD8KCkkgdGhpbmsgd2l0aCBhbGwgdGhlIGhtbSByZXdvcmsgZ29pbmcgb24sIGEg
Yml0IG1vcmUgdmFsaWRhdGlvbiBhbmQgY2hlY2tzCmluIHRoaXMgdHJpY2t5IGFyZWEgd291bGQg
aGVscC4KClRoYW5rcywgRGFuaWVsCgo+IAo+ID4gLS0tCj4gPiAgbW0vbW11X25vdGlmaWVyLmMg
fCAzICsrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPiA+IAo+ID4gZGlm
ZiAtLWdpdCBhL21tL21tdV9ub3RpZmllci5jIGIvbW0vbW11X25vdGlmaWVyLmMKPiA+IGluZGV4
IGVlMzYwNjgwNzdiNi4uYzA1ZTQwNmE3Y2Q3IDEwMDY0NAo+ID4gLS0tIGEvbW0vbW11X25vdGlm
aWVyLmMKPiA+ICsrKyBiL21tL21tdV9ub3RpZmllci5jCj4gPiBAQCAtMTgxLDYgKzE4MSw5IEBA
IGludCBfX21tdV9ub3RpZmllcl9pbnZhbGlkYXRlX3JhbmdlX3N0YXJ0KHN0cnVjdCBtbXVfbm90
aWZpZXJfcmFuZ2UgKnJhbmdlKQo+ID4gIAkJCQlwcl9pbmZvKCIlcFMgY2FsbGJhY2sgZmFpbGVk
IHdpdGggJWQgaW4gJXNibG9ja2FibGUgY29udGV4dC5cbiIsCj4gPiAgCQkJCQltbi0+b3BzLT5p
bnZhbGlkYXRlX3JhbmdlX3N0YXJ0LCBfcmV0LAo+ID4gIAkJCQkJIW1tdV9ub3RpZmllcl9yYW5n
ZV9ibG9ja2FibGUocmFuZ2UpID8gIm5vbi0iIDogIiIpOwo+ID4gKwkJCQlpZiAoIW1tdV9ub3Rp
Zmllcl9yYW5nZV9ibG9ja2FibGUocmFuZ2UpKQo+ID4gKwkJCQkJcHJfd2FybigiJXBTIGNhbGxi
YWNrIGZhaWx1cmUgbm90IGFsbG93ZWRcbiIsCj4gPiArCQkJCQkJbW4tPm9wcy0+aW52YWxpZGF0
ZV9yYW5nZV9zdGFydCk7Cj4gPiAgCQkJCXJldCA9IF9yZXQ7Cj4gPiAgCQkJfQo+ID4gIAkJfQo+
ID4gLS0gCj4gPiAyLjIwLjEKPiA+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIs
IEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
