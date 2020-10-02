Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8658282313
	for <lists+dri-devel@lfdr.de>; Sat,  3 Oct 2020 11:24:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFCB26E342;
	Sat,  3 Oct 2020 09:23:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD60F6E9B1
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Oct 2020 18:06:05 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id g72so2341601qke.8
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Oct 2020 11:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=+LaXP0gz54Jegk2Sj4FZgrVo6ri43ZoIhALcEdceV7s=;
 b=J7kgY6cwrb58DOoexGugRCEp3mOA3N2SuE3K7Vkq5DNITA7cVKmdZqs7c/H8mPlIXn
 o8UTppelOaWj/A+mIwckLvjSUAU505SsEF3y1UzB63e8RdNoL/7u/+lTbA+W+QbJg49u
 gjsGdY/ede4W2O1vArxPiL2+QKZNSLtPznD4UnaDnr+9U1NqECZIyPugGKiO/byu4Wsr
 ZiE32MDkyDjSRgUA3y85ay+ogHthqSIXcOgCRKKR9TEo8YPT5+VwXEqNByR4xXZxn6eZ
 DL3Xo9PmsQDfglZGmXIoeYvA5RBCHAUhpl0ys8t6dV8rIql31yOwXhGQ93xvBlsHWoj8
 tkUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=+LaXP0gz54Jegk2Sj4FZgrVo6ri43ZoIhALcEdceV7s=;
 b=H14URRyxbRcjUd6gU9VD38COfgsybZxLgfi/ST1fSU0hKChzpHbCK07IQ2w2wCmR5d
 0+G1z7relE79m+ziHTRUGT9MemdUl1AEr0cFt59v/TWAxfbyC9tGwTYMX3xaAP1J2lWh
 s/cbIn33BfuzURi4Qki+0tF9A04s0AfST2AoDbdAOIL9RyoG4uzAA81C3LHDBO86KeuE
 yYDiuj0xZZ6MUVrBvjQX+BMhrUxVeMH7vzufNHCBp37/cepzfloIlJygFfFzmSgDoFj0
 PxgLJPTZ+dtyjtTWy9BqTmRgffyzF4YxvN5/0UuDG6m4CwqRh+Xy+hcxSSIzAjI8ifZp
 moMA==
X-Gm-Message-State: AOAM532GsN8Ew1ck66eIq000rDI92d6fB3Wd2xcRzKYBpscjqgqKIrQX
 JrzVVY1y69iCFQH/7q87S2QQUw==
X-Google-Smtp-Source: ABdhPJxx4jEaLX4t/GDgPp9QrFZRDhny976xDexrly3ltPkHkc73Gz3CvOBBFQXoSMUgBgbH3LKfmw==
X-Received: by 2002:ae9:f70d:: with SMTP id s13mr3396635qkg.215.1601661964700; 
 Fri, 02 Oct 2020 11:06:04 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id i62sm1604038qkf.36.2020.10.02.11.06.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2020 11:06:04 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kOPRT-006GH8-H7; Fri, 02 Oct 2020 15:06:03 -0300
Date: Fri, 2 Oct 2020 15:06:03 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 2/2] mm/frame-vec: use FOLL_LONGTERM
Message-ID: <20201002180603.GL9916@ziepe.ca>
References: <20201002175303.390363-1-daniel.vetter@ffwll.ch>
 <20201002175303.390363-2-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201002175303.390363-2-daniel.vetter@ffwll.ch>
X-Mailman-Approved-At: Sat, 03 Oct 2020 09:23:39 +0000
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
Cc: linux-samsung-soc@vger.kernel.org, Jan Kara <jack@suse.cz>,
 John Hubbard <jhubbard@nvidia.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, linux-mm@kvack.org,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgMDIsIDIwMjAgYXQgMDc6NTM6MDNQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBGb3IgJHJlYXNvbnMgSSd2ZSBzdHVtYmxlZCBvdmVyIHRoaXMgY29kZSBhbmQgSSdt
IG5vdCBzdXJlIHRoZSBjaGFuZ2UKPiB0byB0aGUgbmV3IGd1cCBmdW5jdGlvbnMgaW4gNTVhNjUw
YzM1ZmVhICgibW0vZ3VwOiBmcmFtZV92ZWN0b3I6Cj4gY29udmVydCBnZXRfdXNlcl9wYWdlcygp
IC0tPiBwaW5fdXNlcl9wYWdlcygpIikgd2FzIGVudGlyZWx5IGNvcnJlY3QuCj4gCj4gVGhpcyBo
ZXJlIGlzIHVzZWQgZm9yIGxvbmcgdGVybSBidWZmZXJzIChub3QganVzdCBxdWljayBJL08pIGxp
a2UKPiBSRE1BLCBhbmQgSm9obiBub3RlcyB0aGlzIGluIGhpcyBwYXRjaC4gQnV0IEkgdGhvdWdo
dCB0aGUgcnVsZSBmb3IKPiB0aGVzZSBpcyB0aGF0IHRoZXkgbmVlZCB0byBhZGQgRk9MTF9MT05H
VEVSTSwgd2hpY2ggSm9obidzIHBhdGNoCj4gZGlkbid0IGRvLgo+IAo+IFRoZXJlIGlzIGFscmVh
ZHkgYSBkYXggc3BlY2lmaWMgY2hlY2sgKGFkZGVkIGluIGI3ZjA1NTRhNTZmMiAoIm1tOgo+IGZh
aWwgZ2V0X3ZhZGRyX2ZyYW1lcygpIGZvciBmaWxlc3lzdGVtLWRheCBtYXBwaW5ncyIpKSwgc28g
dGhpcyBzZWVtcwo+IGxpa2UgdGhlIHBydWRlbnQgdGhpbmcgdG8gZG8uCj4gCj4gU2lnbmVkLW9m
Zi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+Cj4gQ2M6IEFuZHJl
dyBNb3J0b24gPGFrcG1AbGludXgtZm91bmRhdGlvbi5vcmc+Cj4gQ2M6IEpvaG4gSHViYmFyZCA8
amh1YmJhcmRAbnZpZGlhLmNvbT4KPiBDYzogSsOpcsO0bWUgR2xpc3NlIDxqZ2xpc3NlQHJlZGhh
dC5jb20+Cj4gQ2M6IEphbiBLYXJhIDxqYWNrQHN1c2UuY3o+Cj4gQ2M6IERhbiBXaWxsaWFtcyA8
ZGFuLmoud2lsbGlhbXNAaW50ZWwuY29tPgo+IENjOiBsaW51eC1tbUBrdmFjay5vcmcKPiBDYzog
bGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCj4gQ2M6IGxpbnV4LXNhbXN1bmct
c29jQHZnZXIua2VybmVsLm9yZwo+IENjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcKPiBI
aSBhbGwsCj4gCj4gSSBzdHVtYmxlZCBvdmVyIHRoaXMgYW5kIGZpZ3VyZWQgdHlwaW5nIHRoaXMg
cGF0Y2ggY2FuJ3QgaHVydC4gUmVhbGx5Cj4ganVzdCB0byBtYXliZSBsZWFybiBhIGZldyB0aGlu
Z3MgYWJvdXQgaG93IGd1cC9wdXAgaXMgc3VwcG9zZWQgdG8gYmUKPiB1c2VkICh3ZSBoYXZlIGEg
Yml0IG9mIHRoYXQgaW4gZHJpdmVycy9ncHUpLCB0aGlzIGhlcmUgaXNuJ3QgcmVhbGx5Cj4gcmFs
YXRlZCB0byBhbnl0aGluZyBJJ20gZG9pbmcuCgpGT0xMX0ZPUkNFIGlzIGEgcHJldHR5IGJpZyBj
bHVlIGl0IHNob3VsZCBiZSBGT0xMX0xPTkdURVJNLCBJTUhPCgo+IEknbSBhbHNvIHdvbmRlcmlu
ZyB3aGV0aGVyIHRoZSBleHBsaWNpdCBkYXggY2hlY2sgc2hvdWxkIGJlIHJlbW92ZWQsCj4gc2lu
Y2UgRk9MTF9MT05HVEVSTSBzaG91bGQgdGFrZSBjYXJlIG9mIHRoYXQgYWxyZWFkeS4KClllcCEg
Q29uZmlybXMgdGhlIGFib3ZlIQoKVGhpcyBnZXRfdmFkZHJfZnJhbWVzKCkgdGhpbmcgbG9va3Mg
aW1wb3NzaWJsZSB0byB1c2UgcHJvcGVybHkuIEhvdyBvbgplYXJ0aCBkb2VzIGEgZHJpdmVyIGd1
YXJlbnRlZQoKICJJZiBAc3RhcnQgYmVsb25ncyB0byBWTV9JTyB8IFZNX1BGTk1BUCB2bWEsIHdl
IGRvbid0IHRvdWNoIHBhZ2UKIHN0cnVjdHVyZXMgYW5kIHRoZSBjYWxsZXIgbXVzdCBtYWtlIHN1
cmUgcGZucyBhcmVuJ3QgcmV1c2VkIGZvcgogYW55dGhpbmcgZWxzZSB3aGlsZSBoZSBpcyB1c2lu
ZyB0aGVtLiIKClRoZSBvbmx5IHBvc3NpYmxlIHdheSB0byBkbyB0aGF0IGlzIGlmIHRoZSBkcml2
ZXIgcmVzdHJpY3RzIHRoZSBWTUFzCnRvIG9uZXMgaXQgb3ducyBhbmQgaW50ZXJhY3RzIHdpdGgg
dGhlIHZtX3ByaXZhdGUgZGF0YSB0byByZWZjb3VudApzb21ldGhpbmcuCgpTaW5jZSBldmVyeSBk
cml2ZXIgZG9lcyB0aGlzIHdyb25nIGFueXRoaW5nIHRoYXQgdXNlcyB0aGlzIGlzIGNyZWF0aW5n
CnRlcnJpZnlpbmcgc2VjdXJpdHkgaXNzdWVzLgoKSU1ITyB0aGlzIHdob2xlIEFQSSBzaG91bGQg
YmUgZGVsZXRlZCA6KAoKSmFzb24KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
