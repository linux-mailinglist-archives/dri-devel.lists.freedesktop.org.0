Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6B18E6DC
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 10:37:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 457366E937;
	Thu, 15 Aug 2019 08:35:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A9956E879
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 00:10:01 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id x4so656106qts.5
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 17:10:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=SjWxEd5trWQnubGgd93z8JQghkn2ieuomaNUqpFunr8=;
 b=OmaQIqIvUxMWtdLogbBdSSJBZugVZuA+9BkluLT+a+BDw/KryPXyCUW1vePYe+aGFv
 ZYhbr9ffvesl9Bkr3V/MUfw4Xg+/gWgk0jxG7EEfiUxq5Q2yqxMn5D7fQl+oMj6Jm4Ia
 j7DLxqHcvNf+m4DnX1g42DvDbtAaoyaIxYob33I7peQlnjgiEuA76+Ezf2gW1cYe5fxe
 ZHV2TTD+rkGeqCBZ2ObOkSZqYOXnEdesFt4ZrtkD/AtQbhZfY164BhQ2+cfz2SkQ4L/H
 +qB6maXzyY+5LHGue32kUyeWwarFTE9q3gKfYkB+Qg7/vjZtqZ3vOcsg73iSaEM7ul7M
 n/Gg==
X-Gm-Message-State: APjAAAVCKHT4dneZXrKevxhclh6TVMbt1U2L6uMGTD8Jn5tJ+DVkAZQj
 l9Y3FlEDdyhnT2DJFMtlFd5Uug==
X-Google-Smtp-Source: APXvYqwC0rxcQM957klycTBJaDgJCD9Gy1ym2szZ/ytVdS5cdCa5lGsUTdGHMpvakUUVdZWkhvfAPQ==
X-Received: by 2002:a0c:fa89:: with SMTP id o9mr1559689qvn.165.1565827800115; 
 Wed, 14 Aug 2019 17:10:00 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id n21sm762512qtc.70.2019.08.14.17.09.59
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 14 Aug 2019 17:09:59 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hy3L5-0003Ys-7h; Wed, 14 Aug 2019 21:09:59 -0300
Date: Wed, 14 Aug 2019 21:09:59 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 4/5] mm, notifier: Add a lockdep map for
 invalidate_range_start
Message-ID: <20190815000959.GD11200@ziepe.ca>
References: <20190814202027.18735-1-daniel.vetter@ffwll.ch>
 <20190814202027.18735-5-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190814202027.18735-5-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Thu, 15 Aug 2019 08:34:58 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=SjWxEd5trWQnubGgd93z8JQghkn2ieuomaNUqpFunr8=;
 b=XsReatupBTmqJdBQODBjcynGCD+EFRZj1C84UwqKxIHDJry1koHSXZhFLNthqLNrdI
 sJvO2xr4Yf8efKKyOEPzz7lmm+x5GdcACC+54eKm4Ge4AB3iU9YvjJ+GUY28eyC1XgX1
 yHn7fdbhBHZEjgohLQ+eJwsIhykXJmXNP4Ad2fzIbW68tY8NtCAmf+n/uw1CrUSltNtz
 Di2z0LFvJ3NxwlbScerLC+k3cfD1cixFWpONt/9P09Wv9Gezy+22yPiI3marKmyMBzcg
 UiogqqKUE89OdisyiimkZeCXTgAaWaEz0svYJBDgWT9nFweVWM05nK9xTUKar+rpAnbC
 nO+Q==
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
Cc: Michal Hocko <mhocko@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, linux-mm@kvack.org,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Mike Rapoport <rppt@linux.vnet.ibm.com>, David Rientjes <rientjes@google.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMTQsIDIwMTkgYXQgMTA6MjA6MjZQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBUaGlzIGlzIGEgc2ltaWxhciBpZGVhIHRvIHRoZSBmc19yZWNsYWltIGZha2UgbG9j
a2RlcCBsb2NrLiBJdCdzCj4gZmFpcmx5IGVhc3kgdG8gcHJvdm9rZSBhIHNwZWNpZmljIG5vdGlm
aWVyIHRvIGJlIHJ1biBvbiBhIHNwZWNpZmljCj4gcmFuZ2U6IEp1c3QgcHJlcCBpdCwgYW5kIHRo
ZW4gbXVubWFwKCkgaXQuCj4gCj4gQSBiaXQgaGFyZGVyLCBidXQgc3RpbGwgZG9hYmxlLCBpcyB0
byBwcm92b2tlIHRoZSBtbXUgbm90aWZpZXJzIGZvcgo+IGFsbCB0aGUgdmFyaW91cyBjYWxsY2hh
aW5zIHRoYXQgbWlnaHQgbGVhZCB0byB0aGVtLiBCdXQgYm90aCBhdCB0aGUKPiBzYW1lIHRpbWUg
aXMgcmVhbGx5IGhhcmQgdG8gcmVsaWFibGUgaGl0LCBlc3BlY2lhbGx5IHdoZW4geW91IHdhbnQg
dG8KPiBleGVyY2lzZSBwYXRocyBsaWtlIGRpcmVjdCByZWNsYWltIG9yIGNvbXBhY3Rpb24sIHdo
ZXJlIGl0J3Mgbm90Cj4gZWFzeSB0byBjb250cm9sIHdoYXQgZXhhY3RseSB3aWxsIGJlIHVubWFw
cGVkLgo+IAo+IEJ5IGludHJvZHVjaW5nIGEgbG9ja2RlcCBtYXAgdG8gdGllIHRoZW0gYWxsIHRv
Z2V0aGVyIHdlIGFsbG93IGxvY2tkZXAKPiB0byBzZWUgYSBsb3QgbW9yZSBkZXBlbmRlbmNpZXMs
IHdpdGhvdXQgaGF2aW5nIHRvIGFjdHVhbGx5IGhpdCB0aGVtCj4gaW4gYSBzaW5nbGUgY2hhbGxj
aGFpbiB3aGlsZSB0ZXN0aW5nLgo+IAo+IEFzaWRlOiBTaW5jZSBJIHR5cGVkIHRoaXMgdG8gdGVz
dCBpOTE1IG1tdSBub3RpZmllcnMgSSd2ZSBvbmx5IHJvbGxlZAo+IHRoaXMgb3V0IGZvciB0aGUg
aW52YWxpYXRlX3JhbmdlX3N0YXJ0IGNhbGxiYWNrLiBJZiB0aGVyZSdzCj4gaW50ZXJlc3QsIHdl
IHNob3VsZCBwcm9iYWJseSByb2xsIHRoaXMgb3V0IHRvIGFsbCBvZiB0aGVtLiBCdXQgbXkKPiB1
bmRlc3RhbmRpbmcgb2YgY29yZSBtbSBpcyBzZXJpb3VzbHkgbGFja2luZywgYW5kIEknbSBub3Qg
Y2xlYXIgb24KPiB3aGV0aGVyIHdlIG5lZWQgYSBsb2NrZGVwIG1hcCBmb3IgZWFjaCBjYWxsYmFj
aywgb3Igd2hldGhlciBzb21lIGNhbgo+IGJlIHNoYXJlZC4KCkkgd2FzIHRoaW5raW5nIGFib3V0
IGRvaW5nIHNvbWV0aGluZyBsaWtlIHRoaXMuLgoKSU1ITyBvbmx5IHJhbmdlX2VuZCBuZWVkcyBh
bm5vdGF0aW9uLCB0aGUgb3RoZXIgb3BzIGFyZSBlaXRoZXIgYWxyZWFkeQpub24tc2xlZXBpbmcg
b3Igb25seSB1c2VkIGJ5IEtWTS4KCkJUVywgSSBoYXZlIGZvdW5kIGl0IHN0cmFuZ2UgdGhhdCBp
OTE1IG9ubHkgdXNlcwppbnZhbGlkYXRlX3JhbmdlX3N0YXJ0LiBOb3QgcmVhbGx5IHN1cmUgaG93
IGl0IGlzIGFibGUgdG8gZG8KdGhhdC4gV291bGQgbG92ZSB0byBrbm93IHRoZSBhbnN3ZXIgOikK
Cj4gUmV2aWV3ZWQtYnk6IErDqXLDtG1lIEdsaXNzZSA8amdsaXNzZUByZWRoYXQuY29tPgo+IFNp
Z25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgo+ICBp
bmNsdWRlL2xpbnV4L21tdV9ub3RpZmllci5oIHwgNiArKysrKysKPiAgbW0vbW11X25vdGlmaWVy
LmMgICAgICAgICAgICB8IDcgKysrKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlv
bnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9tbXVfbm90aWZpZXIuaCBiL2lu
Y2x1ZGUvbGludXgvbW11X25vdGlmaWVyLmgKPiBpbmRleCBiNmMwMDRiZDlmNmEuLjlkZDM4YzMy
ZmM1MyAxMDA2NDQKPiArKysgYi9pbmNsdWRlL2xpbnV4L21tdV9ub3RpZmllci5oCj4gQEAgLTQy
LDYgKzQyLDEwIEBAIGVudW0gbW11X25vdGlmaWVyX2V2ZW50IHsKPiAgCj4gICNpZmRlZiBDT05G
SUdfTU1VX05PVElGSUVSCj4gIAo+ICsjaWZkZWYgQ09ORklHX0xPQ0tERVAKPiArZXh0ZXJuIHN0
cnVjdCBsb2NrZGVwX21hcCBfX21tdV9ub3RpZmllcl9pbnZhbGlkYXRlX3JhbmdlX3N0YXJ0X21h
cDsKPiArI2VuZGlmCgpJIHdvbmRlciB3aGF0IHRoZSB0cmFkZSBvZmYgaXMgaGF2aW5nIGEgZ2xv
YmFsIG1hcCB2cyBhIG1hcCBpbiBlYWNoCm1tdV9ub3RpZmllcl9tbSA/Cgo+ICAvKgo+ICAgKiBU
aGUgbW11IG5vdGlmaWVyX21tIHN0cnVjdHVyZSBpcyBhbGxvY2F0ZWQgYW5kIGluc3RhbGxlZCBp
bgo+ICAgKiBtbS0+bW11X25vdGlmaWVyX21tIGluc2lkZSB0aGUgbW1fdGFrZV9hbGxfbG9ja3Mo
KSBwcm90ZWN0ZWQKPiBAQCAtMzEwLDEwICszMTQsMTIgQEAgc3RhdGljIGlubGluZSB2b2lkIG1t
dV9ub3RpZmllcl9jaGFuZ2VfcHRlKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLAo+ICBzdGF0aWMgaW5s
aW5lIHZvaWQKPiAgbW11X25vdGlmaWVyX2ludmFsaWRhdGVfcmFuZ2Vfc3RhcnQoc3RydWN0IG1t
dV9ub3RpZmllcl9yYW5nZSAqcmFuZ2UpCj4gIHsKPiArCWxvY2tfbWFwX2FjcXVpcmUoJl9fbW11
X25vdGlmaWVyX2ludmFsaWRhdGVfcmFuZ2Vfc3RhcnRfbWFwKTsKPiAgCWlmIChtbV9oYXNfbm90
aWZpZXJzKHJhbmdlLT5tbSkpIHsKPiAgCQlyYW5nZS0+ZmxhZ3MgfD0gTU1VX05PVElGSUVSX1JB
TkdFX0JMT0NLQUJMRTsKPiAgCQlfX21tdV9ub3RpZmllcl9pbnZhbGlkYXRlX3JhbmdlX3N0YXJ0
KHJhbmdlKTsKPiAgCX0KPiArCWxvY2tfbWFwX3JlbGVhc2UoJl9fbW11X25vdGlmaWVyX2ludmFs
aWRhdGVfcmFuZ2Vfc3RhcnRfbWFwKTsKPiAgfQoKQWxzbyByYW5nZV9lbmQgc2hvdWxkIGhhdmUg
dGhpcyB0b28gLSBpdCBoYXMgYWxsIHRoZSBzYW1lCmNvbnN0cmFpbnRzLiBJIHRoaW5rIGl0IGNh
biBzaGFyZSB0aGUgbWFwLiBTbyAncmFuZ2Vfc3RhcnRfbWFwJyBpcwpwcm9iYWJseSBub3QgdGhl
IHJpZ2h0IG5hbWUuCgpJdCBtYXkgYWxzbyBtYWtlIHNvbWUgc2Vuc2UgdG8gZG8gYSBkdW1teSBh
Y3F1aXJlL3JlbGVhc2UgdW5kZXIgdGhlCm1tX3Rha2VfYWxsX2xvY2tzKCkgdG8gZm9yY2libHkg
aW5jcmVhc2UgbWFwIGNvdmVyYWdlIGFuZCByZWR1Y2UgdGhlCnNjZW5hcmlvIGNvbXBsZXhpdHkg
cmVxdWlyZWQgdG8gaGl0IGJ1Z3MuCgpBbmQgaWYgd2UgZG8gZGVjaWRlIG9uIHRoZSByZWNsYWlt
IHRoaW5nIGluIG15IG90aGVyIGVtYWlsIHRoZW4gdGhlCnJlY2xhaW0gZGVwZW5kZW5jeSBjYW4g
YmUgcmVsaWFibHkgaW5qZWN0ZWQgYnkgZG9pbmc6CgogZnNfcmVjbGFpbV9hY3F1aXJlKCk7CiBs
b2NrX21hcF9hY3F1aXJlKCZfX21tdV9ub3RpZmllcl9pbnZhbGlkYXRlX3JhbmdlX3N0YXJ0X21h
cCk7CiBsb2NrX21hcF9yZWxlYXNlKCZfX21tdV9ub3RpZmllcl9pbnZhbGlkYXRlX3JhbmdlX3N0
YXJ0X21hcCk7CiBmc19yZWNsYWltX3JlbGVhc2UoKTsKCklmIEkgdW5kZXJzdGFuZCBsb2NrZGVw
IHByb3Blcmx5Li4KCkphc29uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
