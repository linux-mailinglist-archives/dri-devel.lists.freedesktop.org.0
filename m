Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B314B34C
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 09:47:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DAB76E30E;
	Wed, 19 Jun 2019 07:47:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81BD96E30E
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 07:47:26 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id s49so25811048edb.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 00:47:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=qfaL/7P+TPX/aUm+SsSjmw00HhxnY8F8cAc+j91wODQ=;
 b=jAfADpPyUHeqZs/Pv1UqJM5Dch4QB5HY7itrMfsEmlhWB+2niaowh/gXEIiccuL3S6
 SolONqWcZL8LbrZqDmhf+qboo8RNNZ9nJeJZX0sTrgg6UZ/sQh52dL3AWDz+rUP9ShAp
 Ri2IOkNGAAsmvn9vApDu9eiOYjeQAkXEPMWz7kh5Ub/Sts3cLpLj8gC6AHbGM9fE5MHb
 nSR9EC+8HkdDoz9RjCC5P0Cwa+qvbm+zBf0UEEiijqmWvQix6wPLJLB1RxBTDv6Ypjz/
 5TCfJLlYx55JbLSphHdwcAfUVMopZKzrgKwVmttvsamlJJ3aINaK7/1zpfiMSIefkuyB
 qViQ==
X-Gm-Message-State: APjAAAVi2MQTYs5nwmEUj+P3u/JgP0ynovc9S/cyGn7GYosuLK7/hV1i
 12iIPi7xv1k8kiykjalSjfTWxyEKy+Q=
X-Google-Smtp-Source: APXvYqxDyMhD6IIrrfXVEXo1c7WULToPhqFud4DQkhM5gQG2wKjlX5Iold9A7243Eoq1WOXW4dKrvA==
X-Received: by 2002:aa7:ca49:: with SMTP id j9mr16893001edt.148.1560930445092; 
 Wed, 19 Jun 2019 00:47:25 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id a3sm5209129edr.48.2019.06.19.00.47.23
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 19 Jun 2019 00:47:24 -0700 (PDT)
Date: Wed, 19 Jun 2019 09:47:20 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Subject: Re: [PATCH 07/10] drm/vkms: Dont flush crc worker when we change crc
 status
Message-ID: <20190619074720.GI12905@phenom.ffwll.local>
References: <20190606222751.32567-1-daniel.vetter@ffwll.ch>
 <20190606222751.32567-8-daniel.vetter@ffwll.ch>
 <20190619021734.xhjn2ydx7y4tokgq@smtp.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190619021734.xhjn2ydx7y4tokgq@smtp.gmail.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=qfaL/7P+TPX/aUm+SsSjmw00HhxnY8F8cAc+j91wODQ=;
 b=F+aarXtgKREgHiFhldsQVaqXeUq0KINSbdbYHBBfBwiQNuV5K0qllO106CifGMC6fY
 03p7wfYzVrV3IMFSsuP1F14sjjqSDCCyXRRjthjLE7sWLrEKk3jjRf/ECcz4uhPI4G7r
 lVQ90f11BpNdcrF+ZkrSzaH2J3uoTu0BG97Sc=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMTgsIDIwMTkgYXQgMTE6MTc6MzRQTSAtMDMwMCwgUm9kcmlnbyBTaXF1ZWly
YSB3cm90ZToKPiBPbiAwNi8wNywgRGFuaWVsIFZldHRlciB3cm90ZToKPiA+IFRoZSBjcmMgY29y
ZSBjb2RlIGNhbiBjb3BlIHdpdGggc29tZSBsYXRlIGNyYywgdGhlIHJhY2UgaXMga2luZGEKPiA+
IHVuYXZvaWRhYmxlLiBTbyBubyBuZWVkIHRvIGZsdXNoIHBlbmRpbmcgd29ya2VycywgdGhleSds
bCBjb21wbGV0ZSBpbgo+ID4gdGltZS4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZl
dHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+Cj4gPiBDYzogUm9kcmlnbyBTaXF1ZWlyYSA8
cm9kcmlnb3NpcXVlaXJhbWVsb0BnbWFpbC5jb20+Cj4gPiBDYzogSGFuZWVuIE1vaGFtbWVkIDxo
YW1vaGFtbWVkLnNhQGdtYWlsLmNvbT4KPiA+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3
bGwuY2g+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vdmttcy92a21zX2NyYy5jIHwgMyAt
LS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMyBkZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS92a21zL3ZrbXNfY3JjLmMgYi9kcml2ZXJzL2dwdS9kcm0vdmtt
cy92a21zX2NyYy5jCj4gPiBpbmRleCA5NjgwNmNkMzVhZDQuLjlkMTVlNWU4NTgzMCAxMDA2NDQK
PiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS92a21zL3ZrbXNfY3JjLmMKPiA+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS92a21zL3ZrbXNfY3JjLmMKPiA+IEBAIC0yNDksOSArMjQ5LDYgQEAgaW50IHZr
bXNfc2V0X2NyY19zb3VyY2Uoc3RydWN0IGRybV9jcnRjICpjcnRjLCBjb25zdCBjaGFyICpzcmNf
bmFtZSkKPiA+ICAKPiA+ICAJcmV0ID0gdmttc19jcmNfcGFyc2Vfc291cmNlKHNyY19uYW1lLCAm
ZW5hYmxlZCk7Cj4gPiAgCj4gPiAtCS8qIG1ha2Ugc3VyZSBub3RoaW5nIGlzIHNjaGVkdWxlZCBv
biBjcnRjIHdvcmtxICovCj4gPiAtCWZsdXNoX3dvcmtxdWV1ZShvdXQtPmNyY193b3JrcSk7Cj4g
PiAtCj4gPiAgCXNwaW5fbG9ja19pcnEoJm91dC0+bG9jayk7Cj4gPiAgCW91dC0+Y3JjX2VuYWJs
ZWQgPSBlbmFibGVkOwo+ID4gIAlzcGluX3VubG9ja19pcnEoJm91dC0+bG9jayk7Cj4gPiAtLSAK
PiA+IDIuMjAuMQo+ID4gCj4gSGksCj4gCj4gSSB0cmllZCB0byBhcHBseSB0aGlzIHBhdGNoLCBi
dXQgZ2l0IGNvbXBsYWluZWQgYWJvdXQgaXQuIEkgZml4ZWQgdGhlCj4gcHJvYmxlbSBtYW51YWxs
eSAoaXQgd2FzIHZlcnkgc2ltcGxlKSwgYnV0IEkgbm90aWNlZCB0aGF0IGRpbSBkaWQgbm90Cj4g
YWRkIHRoZSB0YWcgIkxpbmsiLiBCZWNhdXNlIG9mIHRoaXMsIEkgZGVjaWRlZCB0byBjaGVjayB3
aXRoIHlvdSBiZWZvcmUKPiBJIGFwcGx5IHRoaXMgcGF0Y2guIElzIGl0IG9rIHRvIGZpeCBjb25m
bGljdCB3aXRob3V0IGRpbT8gSXMgaXQgb2sgYXBwbHkKPiBhIHBhdGNoIHdpdGhvdXQgdGhlIHRh
ZyBMaW5rPwoKSWYgeW91J3ZlIG1hbnVhbGx5IHJlc29sdmVkIGEgY29uZmxpY3QsIHVzZSBkaW0g
YXBwbHktbGluayB0byBqdXN0IGV4dHJhY3QKdGhlIExpbms6IHRhZyBmcm9tIHRoZSBzYW1lIHBh
dGNoIGZpbGUsIGFuZCBhcHBseSBpdCB0byB0aGUgdG9wbW9zdApjb21taXQuIElmIHlvdSBkb24n
dCBoYXZlIGEgTGluazogdGFnIHRoZW4gZGltIHB1c2ggd2lsbCByZWZ1c2UgdG8gd29yay4KCklu
IGdlbmVyYWwgcmVzb2x2aW5nIGNvbmZsaWN0cyBpcyBvaywgYnV0IGFnYWluIGV4Y2VwdCBmb3Ig
ZXh0cmVtZWx5CnRyaXZpYWwgdGhpbmdzIEkgcHJlZmVyIG5vdCB0by4gRm9yIHRoaXMgSSdkIGp1
c3Qgd2FpdCB1bnRpbCB5b3UncmUgcmVhZHkKdG8gcHVsbCBpbiB0aGUgZW50aXJlIHNlcmllcyBp
biBzZXF1ZW5jZS4gT3RoZXJ3aXNlIHlvdSdsbCBuZWVkIHRvIHJlc29sdmUKZXZlbiBtb3JlIGNv
bmZsaWN0cyBzaW5jZSB0aGUgb3RoZXIgcGF0Y2hlcyBhbHNvIHdvbnQgYXBwbHkgY2xlYW5seQph
bnltb3JlLgotRGFuaWVsCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRl
bCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
