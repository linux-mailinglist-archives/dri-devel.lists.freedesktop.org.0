Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 125138E6EF
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 10:38:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D83256E8F8;
	Thu, 15 Aug 2019 08:35:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81E0E6E871
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 23:22:40 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id g17so473008qkk.8
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 16:22:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=+oq/5hVDOEPmfOLGRxP/LWMzZW9hvok8H3hUDypMEVM=;
 b=KFiRGidyevmYamlx4zOi8Oo3QPvdERPibt9WkuNP+u3LR7785xlulu9M0p7vDEX8CD
 4bXeZWppJQB5gEiroj+4fv52gnhhqGhzJUHI0ASv3xX4htpOGVl1rQh0IlTIkJgl/sR5
 RMFitd8P1CKDSmJxWRlAQWqmhk7WytelAQHNModhmioi2JTustAz6MLevozVNbN37Gjq
 f28MDaTQS/RHLyb1gmBxDHJ+IURgzkoTbjSQ1qLkpEkFBbC4hfJVGoKJFO1Bp54SoCMv
 3GLLM9fhCQtdIuPHFAbXBFAre6vZ6L0mzJ3gJNboJVBZH2o2G95/Z6BYnF3GACVnabwD
 Qc/w==
X-Gm-Message-State: APjAAAWGtMcf6KwclQjouWqI6NS8UcNU0zbTYNAqb5FIvWdH4DsaQRwE
 guv3/t7Pg+KPIejNlX6n7RswdA==
X-Google-Smtp-Source: APXvYqwEds8jlvcwtlYKmEv2OldLu3N2F0isLZlZaympLBGufKl1MnMG6bankd4uSkDCSEjrCOszig==
X-Received: by 2002:a05:620a:15f4:: with SMTP id
 p20mr1484735qkm.303.1565824959470; 
 Wed, 14 Aug 2019 16:22:39 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id x5sm529189qtr.54.2019.08.14.16.22.39
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 14 Aug 2019 16:22:39 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hy2bG-00035M-Gd; Wed, 14 Aug 2019 20:22:38 -0300
Date: Wed, 14 Aug 2019 20:22:38 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 1/5] mm: Check if mmu notifier callbacks are allowed to
 fail
Message-ID: <20190814232238.GA11200@ziepe.ca>
References: <20190814202027.18735-1-daniel.vetter@ffwll.ch>
 <20190814202027.18735-2-daniel.vetter@ffwll.ch>
 <20190814151447.e9ab74f4c7ed4297e39321d1@linux-foundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190814151447.e9ab74f4c7ed4297e39321d1@linux-foundation.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Thu, 15 Aug 2019 08:34:58 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=+oq/5hVDOEPmfOLGRxP/LWMzZW9hvok8H3hUDypMEVM=;
 b=CeW4A6s9kz9AiVYMqcDI06mk+8c43yhH15wi/FMEFEpQYj8SoEDj5igZ++T61nyJEF
 J7bz0bCMDreJWQK3+sSkHZZElkuyAADVchuhvjtrodJFxPZC3y/SlYmVyZDBspE6JQMx
 QBl4yI3FTbCPsBXJIEej0rRovg1r1eAJISK6dGTgM2wlBFQ9LmobWpzLw4t831OfYRb3
 /nDARP5ragOjl1a4cBnMFDGnjBCOaSWZPg4MgvhREoOAQZk/AElEi+uxFPxrJ0nhHZo2
 mDgtCgwDUIpQdxdHxzFJsk3H7GsWbWO3a1pFsGNrwr6UFL1DCAwb0wYESMq+D/n6TN/i
 qPKw==
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
Cc: Michal Hocko <mhocko@suse.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, linux-mm@kvack.org,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 David Rientjes <rientjes@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMTQsIDIwMTkgYXQgMDM6MTQ6NDdQTSAtMDcwMCwgQW5kcmV3IE1vcnRvbiB3
cm90ZToKPiBPbiBXZWQsIDE0IEF1ZyAyMDE5IDIyOjIwOjIzICswMjAwIERhbmllbCBWZXR0ZXIg
PGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+IHdyb3RlOgo+IAo+ID4gSnVzdCBhIGJpdCBvZiBwYXJh
bm9pYSwgc2luY2UgaWYgd2Ugc3RhcnQgcHVzaGluZyB0aGlzIGRlZXAgaW50bwo+ID4gY2FsbGNo
YWlucyBpdCdzIGhhcmQgdG8gc3BvdCBhbGwgcGxhY2VzIHdoZXJlIGFuIG1tdSBub3RpZmllcgo+
ID4gaW1wbGVtZW50YXRpb24gbWlnaHQgZmFpbCB3aGVuIGl0J3Mgbm90IGFsbG93ZWQgdG8uCj4g
PiAKPiA+IEluc3BpcmVkIGJ5IHNvbWUgY29uZnVzaW9uIHdlIGhhZCBkaXNjdXNzaW5nIGk5MTUg
bW11IG5vdGlmaWVycyBhbmQKPiA+IHdoZXRoZXIgd2UgY291bGQgdXNlIHRoZSBuZXdseS1pbnRy
b2R1Y2VkIHJldHVybiB2YWx1ZSB0byBoYW5kbGUgc29tZQo+ID4gY29ybmVyIGNhc2VzLiBVbnRp
bCB3ZSByZWFsaXplZCB0aGF0IHRoZXNlIGFyZSBvbmx5IGZvciB3aGVuIGEgdGFzawo+ID4gaGFz
IGJlZW4ga2lsbGVkIGJ5IHRoZSBvb20gcmVhcGVyLgo+ID4gCj4gPiBBbiBhbHRlcm5hdGl2ZSBh
cHByb2FjaCB3b3VsZCBiZSB0byBzcGxpdCB0aGUgY2FsbGJhY2sgaW50byB0d28KPiA+IHZlcnNp
b25zLCBvbmUgd2l0aCB0aGUgaW50IHJldHVybiB2YWx1ZSwgYW5kIHRoZSBvdGhlciB3aXRoIHZv
aWQKPiA+IHJldHVybiB2YWx1ZSBsaWtlIGluIG9sZGVyIGtlcm5lbHMuIEJ1dCB0aGF0J3MgYSBs
b3QgbW9yZSBjaHVybiBmb3IKPiA+IGZhaXJseSBsaXR0bGUgZ2FpbiBJIHRoaW5rLgo+ID4gCj4g
PiBTdW1tYXJ5IGZyb20gdGhlIG0tbCBkaXNjdXNzaW9uIG9uIHdoeSB3ZSB3YW50IHNvbWV0aGlu
ZyBhdCB3YXJuaW5nCj4gPiBsZXZlbDogVGhpcyBhbGxvd3MgYXV0b21hdGVkIHRvb2xpbmcgaW4g
Q0kgdG8gY2F0Y2ggYnVncyB3aXRob3V0Cj4gPiBodW1hbnMgaGF2aW5nIHRvIGxvb2sgYXQgZXZl
cnl0aGluZy4gSWYgd2UganVzdCB1cGdyYWRlIHRoZSBleGlzdGluZwo+ID4gcHJfaW5mbyB0byBh
IHByX3dhcm4sIHRoZW4gd2UnbGwgaGF2ZSBmYWxzZSBwb3NpdGl2ZXMuIEFuZCBhcy1pcywgbm8K
PiA+IG9uZSB3aWxsIGV2ZXIgc3BvdCB0aGUgcHJvYmxlbSBzaW5jZSBpdCdzIGxvc3QgaW4gdGhl
IG1hc3NpdmUgYW1vdW50cwo+ID4gb2Ygb3ZlcmFsbCBkbWVzZyBub2lzZS4KPiA+IAo+ID4gLi4u
Cj4gPgo+ID4gKysrIGIvbW0vbW11X25vdGlmaWVyLmMKPiA+IEBAIC0xNzksNiArMTc5LDggQEAg
aW50IF9fbW11X25vdGlmaWVyX2ludmFsaWRhdGVfcmFuZ2Vfc3RhcnQoc3RydWN0IG1tdV9ub3Rp
Zmllcl9yYW5nZSAqcmFuZ2UpCj4gPiAgCQkJCXByX2luZm8oIiVwUyBjYWxsYmFjayBmYWlsZWQg
d2l0aCAlZCBpbiAlc2Jsb2NrYWJsZSBjb250ZXh0LlxuIiwKPiA+ICAJCQkJCW1uLT5vcHMtPmlu
dmFsaWRhdGVfcmFuZ2Vfc3RhcnQsIF9yZXQsCj4gPiAgCQkJCQkhbW11X25vdGlmaWVyX3Jhbmdl
X2Jsb2NrYWJsZShyYW5nZSkgPyAibm9uLSIgOiAiIik7Cj4gPiArCQkJCVdBUk5fT04obW11X25v
dGlmaWVyX3JhbmdlX2Jsb2NrYWJsZShyYW5nZSkgfHwKPiA+ICsJCQkJCXJldCAhPSAtRUFHQUlO
KTsKPiA+ICAJCQkJcmV0ID0gX3JldDsKPiA+ICAJCQl9Cj4gPiAgCQl9Cj4gCj4gQSBwcm9ibGVt
IHdpdGggV0FSTl9PTihhIHx8IGIpIGlzIHRoYXQgaWYgaXQgdHJpZ2dlcnMsIHdlIGRvbid0IGtu
b3cKPiB3aGV0aGVyIGl0IHdhcyBiZWNhdXNlIG9mIGEgb3IgYmVjYXVzZSBvZiBiLiAgT3IgYm90
aC4gIFNvIEknZCBzdWdnZXN0Cj4gCj4gCVdBUk5fT04oYSk7Cj4gCVdBUk5fT04oYik7Cj4gCgpX
ZWxsLCB3ZSBkaWQganVzdCBtYWtlIGEgcHJfaW5mbyByaWdodCBhYm92ZSB3aXRoIHRoZSB2YWx1
ZSBvZgpibG9ja2FibGUsIHRoYXQgc2VlbXMgZW5vdWdoIHRvIHRlbGwgdGhlIGNhc2VzIGFwYXJ0
PwoKQnV0IHlvdSBhcmUgZ2VuZXJhbGx5IHJpZ2h0LCB0aGUgZnVsbCBsb2dpYzoKCiAgICBpZiAo
X3JldCkgewogICAgICBpZiAoV0FSTl9PTihtbXVfbm90aWZpZXJfcmFuZ2VfYmxvY2thYmxlKHJh
bmdlKSkpCiAgICAgICAgICAgIGNvbnRpbnVlOwogICAgICBXQVJOX09OKF9yZXQgIT0gLUVBR0FJ
Tik7CiAgICAgIHJldCA9IC1FQUdBSU47CiAgICAgIGJyZWFrOwogICAgfQoKd291bGQgZm9yY2Ug
Y29ycmVjdCBBUEkgY29udHJhY3QgdXAgdGhlIGNhbGwgY2hhaW4gb25jZSB3ZSBkZXRlY3QgYQpi
cm9rZW4gZHJpdmVyLi4KCkJ1dCBhdCBzb21lIHBvaW50IGl0IGRvZXMgZmVlbCBsaWtlIGEgYml0
IG11Y2ggZGVidWdnaW5nIGxvZ2ljIHRvIGhhdmUKaW4gYSBwcm9kdWN0aW9uIGNvZGUgcGF0aCwg
YXMgdGhpcyBzaG91bGQgbmV2ZXIgaGFwcGVuIGFuZCBpcyBqdXN0IHRvCmRpc2NvdXJhZ2Ugd3Jv
bmcgZHJpdmVyIGJlaGF2aW9ycyBkdXJpbmcgZHJpdmVyIGRldmVsb3BtZW50LgoKSWYgd2UgbGlr
ZSB0aGlzIHZlcnNpb24gdGhlbjoKClJldmlld2VkLWJ5OiBKYXNvbiBHdW50aG9ycGUgPGpnZ0Bt
ZWxsYW5veC5jb20+CgpBbHNvIC0gSSBoYXZlIGEgYnVuY2ggb2Ygb3RoZXIgcGF0Y2hlcyB0byBt
bXUgbm90aWZpZXJzIGZvciBobW0uZ2l0LApzbyB3aGVuIGV2ZXJ5b25lIGFncmVlcyBJIGNhbiBn
cmFiIHRoaXMgdG8gYXZvaWQgY29uZmxpY3RzLgoKVGhhbmtzLApKYXNvbgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
