Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2749D3A5BB
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jun 2019 14:55:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0560B8934F;
	Sun,  9 Jun 2019 12:54:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBD6388DD0
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 14:03:15 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id x47so2324181qtk.11
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jun 2019 07:03:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=P7GoCE6Vzl1X5NohwcLhAV/U9MsA/FhXn4++zB5+WQw=;
 b=AJe9NlCTMd72+n7608MjqHcs+c/VFToWP66TzRJVlS0venO3OKD/lJYqXK/asReHaN
 F128KufkWqtCGiWo6/2sLYVKZn02kjTcj3Bq7i3NZ0k7h9PXRDyBu3ODBnIC4zc5xK4k
 LHXnlamNG2kkRJNbALd8Wsa+jSLOFuADBUMaeHkRnCZr9v/Yw6N6qfsXwHcgpQV8fPSm
 F1SDm/+AtrVgnLcq8ZCfQm9oqQPC16173l/2ZpiC6OioYfVS0OMG3BU+vSrlnDdgJWW2
 1rhhwFGe8U58ILxKf+iHPkIMBDZF8fq9jt4y5Oim9M1AjHzFQcKmMOC53VsLjYzhlAM/
 0z3Q==
X-Gm-Message-State: APjAAAWe2sY1v79nKEqo3yB1V/2dsn6EeOGuJ2IsTUPzrXyfx+9BZ+59
 savnxtPvZGssaL7i9Rn/gRy2vg==
X-Google-Smtp-Source: APXvYqz2/915uO4AoJkylfCxPwtwvf01ilYy48xf4ydSxLalVse+hWheTEibI1VzArzBO6/jyTi2Rg==
X-Received: by 2002:ac8:7342:: with SMTP id q2mr5402914qtp.134.1559916195107; 
 Fri, 07 Jun 2019 07:03:15 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id d123sm1160617qkb.94.2019.06.07.07.03.13
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 07 Jun 2019 07:03:13 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hZFSb-0003fn-4v; Fri, 07 Jun 2019 11:03:13 -0300
Date: Fri, 7 Jun 2019 11:03:13 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v2 hmm 09/11] mm/hmm: Poison hmm_range during unregister
Message-ID: <20190607140313.GI14802@ziepe.ca>
References: <20190606184438.31646-1-jgg@ziepe.ca>
 <20190606184438.31646-10-jgg@ziepe.ca>
 <c00da0f2-b4b8-813b-0441-a50d4de9d8be@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c00da0f2-b4b8-813b-0441-a50d4de9d8be@nvidia.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Sun, 09 Jun 2019 12:54:16 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=P7GoCE6Vzl1X5NohwcLhAV/U9MsA/FhXn4++zB5+WQw=;
 b=HEjJDRLT1/QrA6H/XpWwtPycyetApCN4CInuydPmEmSGPRRJv+Cn/jI64AeZu0N/bC
 PXklr3+VSClv6Qje5a8q/NaHAeR2RO96W4pxfd9tEXkAS8YQuSd8rdwNTzvHpyEhvlzB
 R6bFoF/NlWFv03tX7XWcM8xVuEbzIMN2maEqxblaz42nopqucXcsniwmuN3bycCbynMh
 +mIYN90GQZsDgAFyAZaFZK4r64NsWLjFXc9zviD8/t0b3KHPgkMMdG5HQuqfhvA8fR/p
 GWBn+WTOku/tkXz7yhlu+QqUseN0G5TjKCGMeF2EOBa1naQKJUB7b4ZX8y76Hd3jGLEM
 PHaQ==
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
Cc: Andrea Arcangeli <aarcange@redhat.com>,
 Ralph Campbell <rcampbell@nvidia.com>, linux-rdma@vger.kernel.org,
 Felix.Kuehling@amd.com, dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Jerome Glisse <jglisse@redhat.com>, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMDYsIDIwMTkgYXQgMDg6Mzc6NDJQTSAtMDcwMCwgSm9obiBIdWJiYXJkIHdy
b3RlOgo+IE9uIDYvNi8xOSAxMTo0NCBBTSwgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+ID4gRnJv
bTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgo+ID4gCj4gPiBUcnlpbmcgdG8g
bWlzdXNlIGEgcmFuZ2Ugb3V0c2lkZSBpdHMgbGlmZXRpbWUgaXMgYSBrZXJuZWwgYnVnLiBVc2Ug
V0FSTl9PTgo+ID4gYW5kIHBvaXNvbiBieXRlcyB0byBkZXRlY3QgdGhpcyBjb25kaXRpb24uCj4g
PiAKPiA+IFNpZ25lZC1vZmYtYnk6IEphc29uIEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4K
PiA+IFJldmlld2VkLWJ5OiBKw6lyw7RtZSBHbGlzc2UgPGpnbGlzc2VAcmVkaGF0LmNvbT4KPiA+
IHYyCj4gPiAtIEtlZXAgcmFuZ2Ugc3RhcnQvZW5kIHZhbGlkIGFmdGVyIHVucmVnaXN0cmF0aW9u
IChKZXJvbWUpCj4gPiAgbW0vaG1tLmMgfCA3ICsrKysrLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwg
NSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvbW0v
aG1tLmMgYi9tbS9obW0uYwo+ID4gaW5kZXggNjgwMmRlNzA4MGQxNzIuLmMyZmVjYjNlY2IxMWUx
IDEwMDY0NAo+ID4gKysrIGIvbW0vaG1tLmMKPiA+IEBAIC05MzcsNyArOTM3LDcgQEAgdm9pZCBo
bW1fcmFuZ2VfdW5yZWdpc3RlcihzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSkKPiA+ICAJc3RydWN0
IGhtbSAqaG1tID0gcmFuZ2UtPmhtbTsKPiA+ICAKPiA+ICAJLyogU2FuaXR5IGNoZWNrIHRoaXMg
cmVhbGx5IHNob3VsZCBub3QgaGFwcGVuLiAqLwo+IAo+IFRoYXQgY29tbWVudCBjYW4gYWxzbyBi
ZSBkZWxldGVkLCBhcyBpdCBoYXMgdGhlIHNhbWUgbWVhbmluZyBhcwo+IHRoZSBXQVJOX09OKCkg
dGhhdCB5b3UganVzdCBhZGRlZC4KPiAKPiA+IC0JaWYgKGhtbSA9PSBOVUxMIHx8IHJhbmdlLT5l
bmQgPD0gcmFuZ2UtPnN0YXJ0KQo+ID4gKwlpZiAoV0FSTl9PTihyYW5nZS0+ZW5kIDw9IHJhbmdl
LT5zdGFydCkpCj4gPiAgCQlyZXR1cm47Cj4gPiAgCj4gPiAgCW11dGV4X2xvY2soJmhtbS0+bG9j
ayk7Cj4gPiBAQCAtOTQ4LDcgKzk0OCwxMCBAQCB2b2lkIGhtbV9yYW5nZV91bnJlZ2lzdGVyKHN0
cnVjdCBobW1fcmFuZ2UgKnJhbmdlKQo+ID4gIAlyYW5nZS0+dmFsaWQgPSBmYWxzZTsKPiA+ICAJ
bW1wdXQoaG1tLT5tbSk7Cj4gPiAgCWhtbV9wdXQoaG1tKTsKPiA+IC0JcmFuZ2UtPmhtbSA9IE5V
TEw7Cj4gPiArCj4gPiArCS8qIFRoZSByYW5nZSBpcyBub3cgaW52YWxpZCwgbGVhdmUgaXQgcG9p
c29uZWQuICovCj4gCj4gVG8gYmUgcHJlY2lzZSwgd2UgYXJlIHBvaXNvbmluZyB0aGUgcmFuZ2Un
cyBiYWNrIHBvaW50ZXIgdG8gaXQncwo+IG93bmluZyBobW0gaW5zdGFuY2UuICBNYXliZSB0aGlz
IGlzIGNsZWFyZXI6Cj4gCj4gCS8qCj4gCSAqIFRoZSByYW5nZSBpcyBub3cgaW52YWxpZCwgc28g
cG9pc29uIGl0J3MgaG1tIHBvaW50ZXIuIAo+IAkgKiBMZWF2ZSBvdGhlciByYW5nZS0+IGZpZWxk
cyBpbiBwbGFjZSwgZm9yIHRoZSBjYWxsZXIncyB1c2UuCj4gCSAqLwo+IAo+IC4uLm9yIHNvbWV0
aGluZyBsaWtlIHRoYXQ/Cj4gCj4gPiArCXJhbmdlLT52YWxpZCA9IGZhbHNlOwo+ID4gKwltZW1z
ZXQoJnJhbmdlLT5obW0sIFBPSVNPTl9JTlVTRSwgc2l6ZW9mKHJhbmdlLT5obW0pKTsKPiA+ICB9
Cj4gPiAgRVhQT1JUX1NZTUJPTChobW1fcmFuZ2VfdW5yZWdpc3Rlcik7Cj4gPiAgCj4gPiAKPiAK
PiBUaGUgYWJvdmUgYXJlIHZlcnkgbWlub3IgZG9jdW1lbnRhdGlvbiBwb2ludHMsIHNvOgo+IAo+
ICAgICBSZXZpZXdlZC1ieTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKZG9u
ZSB0aGFua3MKCkphc29uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
